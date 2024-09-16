;--- bot struct
Enumeration 0
	#H2H_ATTACK_TYPE_NOTHING
	#H2H_ATTACK_TYPE_NEUTRAL
	#H2H_ATTACK_TYPE_SIDE
	#H2H_ATTACK_TYPE_BACK
	#H2H_ATTACK_TYPE_UP
	#H2H_ATTACK_TYPE_DOWN
	#H2H_ATTACK_TYPE_HEAVY
EndEnumeration
;-- AI constants
#H2H_AI_DECISION_RANDOM=30

#H2H_AI_MODE_DISABLED=0
#H2H_AI_MODE_IDLE=1
#H2H_AI_MODE_OFFENSE=2
#H2H_AI_MODE_DODGE=3

#H2H_AI_HEAVY_CHANCE=3
#H2H_AI_DEFENSE_THRESHOLD=125
#H2H_AI_NUP_HEIGHT_THRESHOLD=200

Structure bot
	*who.player
	sub.f
	attackBuffer.d
	mode.i
	;0 nothing
	;1 neutral
	;2 side
	;3 back
	;4 up
	;5 down
	;6 heavy
	*attackTarget.animation ; if it is the same as the current animation, switch to next step !
	comboNervousness.i
	difficulty.i
EndStructure

Procedure.i createAI(*fromWho.player, newDifficulty.i=#H2H_AI_LEVEL_MEDIUM)
	*newBot.bot=AllocateStructure(bot)
	*newBot\sub=0
	ClearStructure(*newBot,bot)
	*newbot\who=*fromWho
	*newBot\difficulty=newDifficulty
	*fromWho\isAI=newDifficulty
	;*fromWho\maxLife=#H2H_PLAYER_HP_BASE+getLife(*fromWho)*10
	resetLife(*fromWho)
	ProcedureReturn *newBot
EndProcedure

Procedure AIrandomize(*ai.bot)
	playerSetClassRandom(*ai\who)
EndProcedure

Procedure destroyAI(*what.bot)
	*what\who\isAI=0
	FreeStructure(*what)
EndProcedure

Procedure enableAI(*what.bot)
	*what\mode=#H2H_AI_MODE_IDLE
	*what\who\isAI=*what\difficulty
	resetLife(*what\who)
EndProcedure

Procedure disableAI(*what.bot)
	*what\mode=#H2H_AI_MODE_DISABLED
	*what\who\isAI=0
	resetLife(*what\who)
EndProcedure

Procedure setAIDifficulty(*what.bot,newDifficulty.i)
	*what\difficulty=newDifficulty
	*what\who\isAI=newDifficulty
EndProcedure

Procedure animationToAttack(*a.animation)
	If Not *a
		ProcedureReturn 0
	EndIf
	Select *a\animationType
		Case #H2H_ANIMATIONTYPE_NEUTRAL
			ProcedureReturn #H2H_ATTACK_TYPE_NEUTRAL
		Case #H2H_ANIMATIONTYPE_NSIDE
			ProcedureReturn #H2H_ATTACK_TYPE_SIDE
		Case #H2H_ANIMATIONTYPE_NBACK
			ProcedureReturn #H2H_ATTACK_TYPE_BACK
		Case #H2H_ANIMATIONTYPE_NUP
			ProcedureReturn #H2H_ATTACK_TYPE_UP
		Case #H2H_ANIMATIONTYPE_NDOWN
			ProcedureReturn #H2H_ATTACK_TYPE_DOWN
		Case #H2H_ANIMATIONTYPE_HEAVY
			ProcedureReturn #H2H_ATTACK_TYPE_HEAVY
	EndSelect
	ProcedureReturn #H2H_ATTACK_TYPE_NEUTRAL
EndProcedure

Procedure AISelectRandomCombo(*ia.bot)
	*previous.animation=*ia\attackTarget
	Debug "selecting random combo from "+*ia\who\currentAnimation\name
	*ia\attackTarget=animationSelectRandomCombo(*ia\who\currentAnimation)
	If *previous=*ia\attackTarget
		*ia\attackTarget=0
 		Debug "stayed the same"
	EndIf
EndProcedure

Procedure.i AI_inflateRange(*ia.bot,range.i)
	If Not *ia
		ProcedureReturn 0
	EndIf
	r.d=range*(1.0+(getReach(*ia\who)-2)/10)
	ProcedureReturn Int(r)
	ProcedureReturn range*100/(100-((getReach(*ia\who)-2)*10))
EndProcedure

Procedure AI_targetIsUp(*ia.bot,*target.player)
	ProcedureReturn Bool(*target\position\y<(*ia\who\position\y-#H2H_AI_NUP_HEIGHT_THRESHOLD))
EndProcedure

Procedure AI_targetIsClose(*ia.bot,*target.player)
	ProcedureReturn Bool(playerDistance(*ia\who,*target)<AI_inflateRange(*ia,#H2H_AI_DEFENSE_THRESHOLD))
EndProcedure
Declare AI_randomAttack(*ia.bot,*target.player)

Procedure attackToAnimation(*a.animation,attackType.i)
	If attackType=0 Or Not *a
		Debug "null attack type..."
		ProcedureReturn 0
	EndIf
	ProcedureReturn *a\animations[attackType-1]
EndProcedure

Procedure AISelectAttackRandom(*ia.bot)
	If Not *ia\attackTarget
		*ia\attackTarget=classSelectRandomAttack(*ia\who\class)
	Else
		*ia\attackTarget=animationSelectRandomCombo(*ia\attackTarget)
	EndIf
	If *ia\attackTarget
		Debug "selected "+*ia\attackTarget\name
	Else
		Debug "not found selected"
	EndIf
EndProcedure

Procedure AISelectAttack(*ia.bot,attackType.i)
	If attackType=0
		*ia\attackTarget=0
	EndIf
	If Not *ia\attackTarget
		*ia\attackTarget=*ia\who\class\animations[attackType+2]
	Else
		*ia\attackTarget=*ia\attackTarget\animations[attackType-1]
	EndIf
	If *ia\attackTarget
		Debug "selected "+*ia\attackTarget\name
	Else
		Debug "not found selected"
	EndIf
EndProcedure

Procedure AISelectCombo(*ia.bot,*target.player)
	Debug "selecting combo from "+*ia\who\currentAnimation\name
	*who.player=*ia\who
	*previous.animation=*ia\attackTarget
	If AI_targetIsUp(*ia,*target)
		Debug "target is up"
		If animationHas(*who\currentAnimation,#H2H_ANIMATIONTYPE_NUP)
			AISelectAttack(*ia,#H2H_ATTACK_TYPE_UP)
		Else
			If animationHas(*who\currentAnimation,#H2H_ANIMATIONTYPE_NSIDE) And Random(1)
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_SIDE)
			EndIf
		EndIf
	Else
		Debug "target is at level"
		If AI_targetIsClose(*ia,*target)
			Debug "target is close"
			If animationHas(*who\currentAnimation,#H2H_ANIMATIONTYPE_NBACK)
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_BACK)
			Else
				If animationHas(*who\currentAnimation,#H2H_ANIMATIONTYPE_NDOWN) And Random(1)
					AISelectAttack(*ia,#H2H_ATTACK_TYPE_SIDE)
				Else
					If animationHas(*who\currentAnimation,#H2H_ANIMATIONTYPE_NEUTRAL) And Random(1)
						AISelectAttack(*ia,#H2H_ATTACK_TYPE_NEUTRAL)
					Else
						Debug "found nothing eheh"
					EndIf
				EndIf
			EndIf
		Else
			Debug "target is good"
		EndIf
	EndIf
	If *ia\attackTarget=0 Or *previous=*ia\attackTarget
		Debug "no combo found"
		AISelectRandomCombo(*ia)
	EndIf
EndProcedure

Procedure AI_attackOrder(*ia.bot)
	*c.control=*ia\who\pushed
	If *ia\attackTarget
		controlClear(*ia\who\pushed)
		Select animationToAttack(*ia\attackTarget)
			Case #H2H_ATTACK_TYPE_NEUTRAL
				*c\neutral=1
			Case #H2H_ATTACK_TYPE_SIDE
				*c\attackSide=1
			Case #H2H_ATTACK_TYPE_BACK
				*c\attackBack=1
			Case #H2H_ATTACK_TYPE_UP
				*c\attackUp=1
			Case #H2H_ATTACK_TYPE_DOWN
				*c\attackUp=1
			Case #H2H_ATTACK_TYPE_HEAVY
				*c\heavy=1
		EndSelect
	EndIf
EndProcedure

Procedure AIReachedTarget(*ia.bot)
	ProcedureReturn Bool(*ia\attackTarget And animationEquals(*ia\who\currentAnimation,*ia\attackTarget))
EndProcedure

Procedure AICanReach(*ia.bot)
	For i=0 To 5
		If animationEquals(*ia\who\currentAnimation\animations[i],*ia\attackTarget)
			ProcedureReturn 1
		EndIf
	Next
	ProcedureReturn animationEquals(*ia\who\currentAnimation,*ia\attackTarget)
EndProcedure

Procedure AI_comboFollow(*ia.bot,*target.player)
	*previous.animation=*ia\attackTarget
	If *ia\difficulty=#H2H_AI_LEVEL_MEDIUM And Random(1)
		AISelectRandomCombo(*ia)
	EndIf
	If *ia\difficulty=#H2H_AI_LEVEL_HARD
		AISelectCombo(*ia,*target)
	EndIf
EndProcedure

Procedure AI_randomAttack(*ia.bot,*target.player)
	If Not *ia Or Not *target
		ProcedureReturn
	EndIf
	If *ia\mode<>#H2H_AI_MODE_OFFENSE
		ProcedureReturn
	EndIf
	*who.player=*ia\who
	If Not *who\attacking
		*ia\attackTarget=0
	EndIf
	If *ia\attackTarget And Not AICanReach(*ia)
		*ia\attackTarget=0
	EndIf
	If Not *ia\attackTarget
		If Random(#H2H_AI_DECISION_RANDOM)/*ia\difficulty=0
			If *ia\difficulty=#H2H_AI_LEVEL_HARD
				If isPlayerAnimationType(*target,#H2H_ANIMATIONTYPE_IDLE)
					If Not Random(#H2H_AI_HEAVY_CHANCE)
						AISelectAttack(*ia,#H2H_ATTACK_TYPE_HEAVY)
						Debug "hard selected heavy"
					EndIf
				EndIf
			EndIf
			If *ia\difficulty>=#H2H_AI_LEVEL_MEDIUM
				; if the foe is higher, will spam up attack
				If AI_targetIsUp(*ia,*target)
					AISelectAttack(*ia,#H2H_ATTACK_TYPE_UP)
					Debug "medium selected air"
				EndIf
				; here the players is around the same ground level
				; if the foe is too close, will spam down and back
				If Abs(*target\position\x-*who\position\x)<AI_inflateRange(*ia,#H2H_AI_DEFENSE_THRESHOLD)
					If Random(1)
						AISelectAttack(*ia,#H2H_ATTACK_TYPE_DOWN)
						Debug "medium selected down"
					Else
						AISelectAttack(*ia,#H2H_ATTACK_TYPE_BACK)
						Debug "medium selected back"
					EndIf
				EndIf
			EndIf
			; Else, will spam a random attack
			If Not *ia\attackTarget
				*a.animation=playerSelectRandomAttack(*ia\who)
				If *a
					AISelectAttack(*ia,animationToAttack(*a))
				EndIf
			EndIf
		Else
			; Check failed, stays idle
			*ia\attackTarget=0
		EndIf
	Else
		If AIReachedTarget(*ia)
			Debug "reached "+*ia\attackTarget\name
			AI_comboFollow(*ia,*target)
			If *ia\attackTarget
				Debug "changed to "+*ia\attackTarget\name
			Else
				Debug "reinit"
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AI_move(*ia.bot,x.i)
	*who.player=*ia\who
	If *who\recovery
		ProcedureReturn
	EndIf
	If *who\position\x<x
		*who\pushed\right=1
	Else
		*who\pushed\right=0
	EndIf
	If *who\position\x>x
		*who\pushed\left=1
	Else
		*who\pushed\left=0
	EndIf
	If Abs(*who\position\x-x)<AI_inflateRange(*ia,100)
		*who\pushed\right=0
		*who\pushed\left=0
	EndIf
EndProcedure

Procedure AI_movePrecise(*ia.bot,x.i)
	*who.player=*ia\who
	If *who\recovery
		ProcedureReturn
	EndIf
	If *who\position\x<x
		*who\pushed\right=1
	Else
		*who\pushed\right=0
	EndIf
	If *who\position\x>x
		*who\pushed\left=1
	Else
		*who\pushed\left=0
	EndIf
	If Abs(*who\position\x-x)<5
		*who\pushed\right=0
		*who\pushed\left=0
		*who\isAI=-1
	EndIf
EndProcedure

Procedure AI_pickStun(*ia.bot)
	If *ia\who\attacking
		ProcedureReturn animationPickStun(*ia\who\currentAnimation)
	Else
		Protected Dim *picked.animation(0)
		Protected *c.class=*ia\who\class
		For i=0 To 5 ; 6 types of attacks
			If animationStun(*c\animations[i])
				If Not *picked(0)
					*picked(0)=*c\animations[i]
				Else
					ReDim *picked(ArraySize(*picked())+1)
					*picked(ArraySize(*picked()))=*c\animations[i]
				EndIf
			EndIf
		Next
		*p.animation=*picked(Random(ArraySize(*picked())))
		FreeArray(*picked())
		ProcedureReturn *p
	EndIf
EndProcedure

Procedure AI_pickMovement(*ia.bot,*target.player,away.i)
	Protected distance=200 ; TODO const
	Protected *picked.animation=0
	If away
		distance=-distance
	EndIf
	For i=0 To 5 ; 6 types of attacks
		If *ia\who\direction
			away=Bool(Not away)
			distance=-distance
		EndIf
		Protected range=animationRange(*ia\who\class\animations[i])
		If away
			If range<distance
				distance=range
				*picked=*ia\who\class\animations[i]
			EndIf
		Else
			If range>distance
				distance=range
				*picked=*ia\who\class\animations[i]
			EndIf
		EndIf
	Next
	ProcedureReturn *picked
EndProcedure

; Smarter decisions
Procedure AI_decisionHard(*ia.bot,*target.player)
	If *target\attacking And Not *ia\attackTarget
		; punish an attacking player
		Protected *p.animation=animationPickStun(*ia\who\currentAnimation)
		If *p
			Debug "IA punishes with stun"
			AISelectAttack(*ia,animationToAttack(*p))
		Else
			; flee an attack
			If getPlayerAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
				*a.animation=AI_pickMovement(*ia,*target,away)
				If *a
					Debug "IA flies away"
					AISelectAttack(*ia,animationToAttack(*a))
				Else
					; jump if agile enough
					If getSpeed(*ia\who)>2 And getStrength(*ia\who)-GetWeight(*ia\who)>1
						Debug "IA jumps"
						*ia\attackTarget=0
						*ia\who\pushed\jump=1
					Else
						; do nothing ?
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		; TODO ranged attack
	EndIf
EndProcedure

Procedure AI_decisionChopstick(*ia.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; anti down spam
	If animationEquals(*ia\attackTarget,playerGetDown(*ia\who))
		Debug "chopstick stop down"
		*ia\attackTarget=0
	EndIf
	; down attack dodge trick
	If *target\attacking
		If *target\currentAnimation\animationType<>#H2H_ANIMATIONTYPE_NUP
			If Not Random(3) And Not *ia\attackTarget
				Debug "Chopstick ndown"
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_DOWN)
			EndIf
		EndIf
	EndIf
	If Not *ia\attackTarget And getPlayerAnimationType(*target)<>#H2H_ANIMATIONTYPE_NEUTRAL And playerDistance(*ia\who,*target)<100
		; neutral barrage
		; not effective against gluestick heavy attacks
		If Not (*target\class=*allClasses(4) And getPlayerAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY)
			If Random(2)
				Debug "Chopstick neutral"
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_NEUTRAL)
			EndIf
		EndIf
	EndIf
	If Not *ia\attackTarget And	getPlayerAnimationType(*target)<>#H2H_ANIMATIONTYPE_NBACK And playerDistance(*ia\who,*target)<200
		If (*ia\who\direction And *ia\who\position\x>gameBorderLeft+200) Or (Not *ia\who\direction And *ia\who\position\x<gameBorderRight-200)
			; back flee
			If animationHas(*ia\who\currentAnimation,#H2H_ATTACK_TYPE_BACK) And Random(1)
				Debug "Chopstick back"
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_BACK)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AI_decisionBallpen(*ia.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	If Not animationEquals(*ia\attackTarget,*ia\who\currentAnimation) And Not Random(5)
		If AI_targetIsClose(*ia,*target)
			If Random(1)
				If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NBACK)
					*ia\attackTarget=animationGetBack(*ia\who\currentAnimation)
				Else
					If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NDOWN)
						*ia\attackTarget=animationGetDown(*ia\who\currentAnimation)
					EndIf
				EndIf
			Else
				If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NDOWN)
					*ia\attackTarget=animationGetDown(*ia\who\currentAnimation)
				Else
					If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NBACK)
						*ia\attackTarget=animationGetBack(*ia\who\currentAnimation)
					EndIf
				EndIf
			EndIf
		Else
			If Random(2)
				If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NSIDE)
					*ia\attackTarget=animationGetSide(*ia\who\currentAnimation)
				Else
					*ia\attackTarget=animationGetNeutral(*ia\who\currentAnimation)
				EndIf
			Else
				If animationHas(*ia\who\currentAnimation,#H2H_ANIMATIONTYPE_NEUTRAL)
					*ia\attackTarget=animationGetNeutral(*ia\who\currentAnimation)
				Else
					*ia\attackTarget=animationGetSide(*ia\who\currentAnimation)
				EndIf
			EndIf
		EndIf
	EndIf
	If Not *ia\attackTarget
		If *ia\who\currentStance=*ia\who\class\allStances(1)
			Debug "blue"
			If AI_targetIsClose(*ia,*target) And Random(1) And getPlayerAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
				; the blue will dodge
				If *target\lockedDirection
					If *ia\who\position\x>gameBorderLeft+400
						AI_move(*ia,*target\position\x-400)
					Else ; jumps over it
						AI_move(*ia,*target\position\x+400)
						*ia\who\pushed\jump=1
					EndIf
				Else
					If *ia\who\position\x<gameBorderRight-400
						AI_move(*ia,*target\position\x+400)
					Else ; jumps over it
						AI_move(*ia,*target\position\x-400)
						*ia\who\pushed\jump=1
					EndIf
				EndIf
			EndIf
		EndIf
		If *ia\who\currentStance=*ia\who\class\allStances(2)
			If Not AI_targetIsClose(*ia,*target) And Random(1) And getPlayerAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
			; the red will punish a heavy attack with a heavy attack
				AISelectAttack(*ia,#H2H_ATTACK_TYPE_HEAVY)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AI_decisionUnarmed(*ia.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; nothing special
EndProcedure

Procedure AI_decisionGluestick(*ia.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; nothing special
EndProcedure

#H2H_AI_BORDER_THRESHOLD=100
Procedure.i AI_isCloseToBorder(*ia.bot,*target.player,gameBorderLeft.i=0,gameBorderRight.i=2000)
	If *ia\who\direction<>*target\direction
		If *ia\who\lockedDirection
			If *ia\who\position\x<-#HITBOX_BACKSHIFT_X+gameBorderLeft+#H2H_AI_BORDER_THRESHOLD
				ProcedureReturn 1
			Else
				If *ia\who\position\x>gameBorderRight-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)-#H2H_AI_BORDER_THRESHOLD
					ProcedureReturn 2
				EndIf
			EndIf
		Else
			If *ia\who\position\x<-#HITBOX_SHIFT_X+gameBorderLeft+#H2H_AI_BORDER_THRESHOLD
				ProcedureReturn 1
			Else
				If *ia\who\position\x>gameBorderRight-(#HITBOX_SHIFT_X+#HITBOX_SIZE)-#H2H_AI_BORDER_THRESHOLD
					ProcedureReturn 2
				EndIf
			EndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure AI_decision(*ia.bot, *target.player,delta.d=1,gameBorderLeft.i=0,gameBorderRight.i=2000)
	If Not *ia Or gamePaused
		ProcedureReturn
	EndIf
	If Not *target Or *target\life<=0
		*ia\mode=#H2H_AI_MODE_DISABLED
	EndIf
	If *ia\mode=#H2H_AI_MODE_DISABLED
		ProcedureReturn
	EndIf
	If *ia\mode=#H2H_AI_MODE_IDLE
		*ia\mode=#H2H_AI_MODE_OFFENSE
	EndIf
	*who.player=*ia\who
	If *ia\mode=#H2H_AI_MODE_OFFENSE
		If Not isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_SPAWN)
			breakRange=0
			If *ia\attackTarget
				; if the ennemy is really too far, will break attack
				; So combos aren't quite broken
  				breakRange=200
			EndIf
			Protected distance=playerDistance(*who,*target)
			If distance<AI_inflateRange(*ia,300+breakRange)
				continueTheAttack.i=#True
				If AI_isCloseToBorder(*ia,*target,gameBorderLeft,gameBorderRight)
					Debug "close to border"
				EndIf
				If distance<AI_inflateRange(*ia,100) And Not *ia\attackTarget And Not AI_isCloseToBorder(*ia,*target,gameBorderLeft,gameBorderRight)
					If getReach(*who)>1
						If *who\direction
							AI_move(*ia,*target\position\x-AI_inflateRange(*ia,200+breakRange))
						Else
							AI_move(*ia,*target\position\x+AI_inflateRange(*ia,200+breakRange))
						EndIf
						continueTheAttack=#False
					EndIf
				EndIf
				If continueTheAttack
					*ia\attackBuffer+delta
					If ListSize(*who\hit())
						*ia\attackBuffer+delta*2
					EndIf
					If *ia\attackBuffer>1
						AI_randomAttack(*ia,*target)
						If *ia\difficulty=#H2H_AI_LEVEL_HARD
							If Not Random(10)
								AI_decisionHard(*ia,*target)
								Select *ia\who\class
									Case *allClasses(0)
										AI_decisionChopstick(*ia,*target,gameBorderLeft,gameBorderRight)
									Case *allClasses(1)
										AI_decisionUnarmed(*ia,*target,gameBorderLeft,gameBorderRight)
									Case *allClasses(2)
										AI_decisionBallpen(*ia,*target,gameBorderLeft,gameBorderRight)
									Case *allClasses(4)
										AI_decisionGluestick(*ia,*target,gameBorderLeft,gameBorderRight)
								EndSelect
							EndIf
						EndIf
						*ia\attackBuffer-1
					EndIf
					AI_attackOrder(*ia)
				EndIf
			Else
				; if the ennemy is too far, will break attack
				AI_move(*ia,*target\position\x)
				If *ia\attackTarget
				EndIf
				*ia\attackTarget=0
				If *ia\difficulty=#H2H_AI_LEVEL_HARD
					*ia\attackBuffer+delta*2
				EndIf
			EndIf
		EndIf
	EndIf
EndProcedure

Macro isBot(who)
	(who\isAI)
EndMacro
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 234
; FirstLine = 199
; Folding = ---z--
; EnableXP
; DPIAware