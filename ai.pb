;--- bot struct
;-- AI constants
#H2H_AI_DECISION_RANDOM=30

Enumeration 0
	#H2H_AI_MODE_DISABLED
	#H2H_AI_MODE_IDLE
	#H2H_AI_MODE_OFFENSE
	#H2H_AI_MODE_DODGE
	#H2H_AI_MODE_PARRY
EndEnumeration

#H2H_AI_HEAVY_CHANCE=3
#H2H_AI_DEFENSE_THRESHOLD=125
#H2H_AI_NUP_HEIGHT_THRESHOLD=200

Structure bot
	*who.player
	sub.f
	attackBuffer.d ; 
	mode.i
	*attackTarget.animation ; if it is the same as the current animation, switch to next step !
	;comboNervousness.i
	nervousness.d ; when an attack check fails, add delta ; else put it to 0
	difficulty.i
	parrying.d
EndStructure

Procedure.i AICreate(*fromWho.player, newDifficulty.i=#H2H_AI_LEVEL_MEDIUM)
	*newBot.bot=AllocateStructure(bot)
	*newBot\sub=0
	ClearStructure(*newBot,bot)
	*newbot\who=*fromWho
	*newBot\difficulty=newDifficulty
	*fromWho\isAI=newDifficulty
	;*fromWho\maxLife=#H2H_PLAYER_HP_BASE+getLife(*fromWho)*10
	playerResetLife(*fromWho)
	ProcedureReturn *newBot
EndProcedure

Macro AIRandomize(ai)
	playerSetClassRandom(ai\who)
EndMacro

Macro AIDestroy(what)
	what\who\isAI=0:FreeStructure(what)
EndMacro

Procedure AIEnable(*what.bot)
	*what\mode=#H2H_AI_MODE_IDLE
	*what\who\isAI=*what\difficulty
	playerResetLife(*what\who)
	playerClearKey(*what\who)
EndProcedure

Procedure AIDisable(*what.bot)
	*what\mode=#H2H_AI_MODE_DISABLED
	*what\who\isAI=0
	playerResetLife(*what\who)
	playerClearKey(*what\who)
EndProcedure

Macro AISetDifficulty(what,newDifficulty)
	what\difficulty=newDifficulty:what\who\isAI=newDifficulty
EndMacro

Procedure AISelectRandomCombo(*ai.bot)
	*previous.animation=*ai\attackTarget
; 	Debug "selecting random combo from "+*ai\who\currentAnimation\name
	*ai\attackTarget=animationSelectRandomCombo(*ai\who\currentAnimation)
	If *previous=*ai\attackTarget
		*ai\attackTarget=0
  		Debug "stayed the same"
	EndIf
EndProcedure

Procedure.i AIinflateRange(*ai.bot,range.i)
	If Not *ai
		ProcedureReturn 0
	EndIf
; 	r.d=range*(1.0+(playerGetReach(*ai\who)-2)/10.0)
	r.d=range*(1.0+(playerGetReach(*ai\who)-2)*0.1)
	ProcedureReturn Int(r)
; 	ProcedureReturn range*100/(100-((playerGetReach(*ai\who)-2)*10))
EndProcedure

Macro AITargetIsUp(ai,target)
	Bool(target\position\y<(ai\who\position\y-#H2H_AI_NUP_HEIGHT_THRESHOLD))
EndMacro

Macro AITargetIsClose(ai,target)
	Bool(playerDistance(ai\who,target)<AIInflateRange(ai,#H2H_AI_DEFENSE_THRESHOLD))
EndMacro

Declare AIRandomAttack(*ai.bot,*target.player)

Procedure AISelectAttackRandom(*ai.bot)
	If Not *ai\attackTarget
		*ai\attackTarget=classSelectRandomAttack(*ai\who\class)
	Else
		*ai\attackTarget=animationSelectRandomCombo(*ai\attackTarget)
	EndIf
EndProcedure

Procedure AISelectAttack(*ai.bot,attackType.i)
	*p.player=*ai\who
	If *p\currentAnimation\animationType=#H2H_ANIMATIONTYPE_IDLE Or (*p\class\animations[*p\currentAnimation\animationType] And *p\currentAnimation\animationType=*p\class\animations[*p\currentAnimation\animationType]\animationType And Not animationIsAttack(*p\currentAnimation))
		*ai\attackTarget=classGetSomething(*p\class,attackType)
		CompilerIf #H2H_MODE=#H2H_MODE_SAVE
		If *ai\attackTarget
			Debug "selected base "+*ai\attackTarget\name
		Else
			Debug "not selected !"
		EndIf
		CompilerEndIf
	Else
		*ai\attackTarget=*p\currentAnimation\animations[attackType-#H2H_ANIMATIONTYPE_NEUTRAL]
		CompilerIf #H2H_MODE=#H2H_MODE_SAVE
		If *ai\attackTarget
			Debug "selected next "+*ai\attackTarget\name
		Else
			Debug "not selected !"
		EndIf
		CompilerEndIf
	EndIf
EndProcedure

Procedure AISelectCombo(*ai.bot,*target.player)
	; 	Debug "selecting combo from "+*ia\who\currentAnimation\name
; 	If Not *ai\attackTarget Or *ai\attackTarget=*ai\who\currentAnimation
		*who.player=*ai\who
		*previous.animation=*ai\attackTarget
; 		*ai\attackTarget=0
		If AITargetIsUp(*ai,*target)
	 		Debug "target is up"
			If animationGetUp(*who\currentAnimation)
				AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NUP)
			Else
				If animationGetSide(*who\currentAnimation) And Random(1)
					AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NSIDE)
				EndIf
			EndIf
		Else
	 		Debug "target is at level"
			If AITargetIsClose(*ai,*target)
	 			Debug "target is close"
				If animationGetBack(*who\currentAnimation)
					AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NBACK)
				Else
					If animationGetDown(*who\currentAnimation) And Random(1)
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NDOWN)
					Else
						If animationGetNeutral(*who\currentAnimation) And Random(1)
							AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NEUTRAL)
	 					Else
							Debug "found nothing eheh"
						EndIf
					EndIf
				EndIf
	 		Else
	 			Debug "target is good"
			EndIf
		EndIf
		If Not *ai\attackTarget Or *previous=*ai\attackTarget
	 		Debug "no combo found"
			AISelectRandomCombo(*ai)
		EndIf
; 	Else
; 		Debug "already picked !====="
; 	EndIf
EndProcedure

Procedure AIAttackOrder(*ai.bot)
	If *ai\attackTarget
		*c.control=*ai\who\pushed
		playerClearKey(*ai\who)
		Select *ai\attackTarget\animationType
			Case #H2H_ANIMATIONTYPE_NEUTRAL
				controlGet(*c,#H2H_CONTROL_NEUTRAL)=1
			Case #H2H_ANIMATIONTYPE_NSIDE
				controlGet(*c,#H2H_CONTROL_ATTACK_SIDE)=1
			Case #H2H_ANIMATIONTYPE_NBACK
				controlGet(*c,#H2H_CONTROL_ATTACK_BACK)=1
			Case #H2H_ANIMATIONTYPE_NUP
				controlGet(*c,#H2H_CONTROL_ATTACK_UP)=1
			Case #H2H_ANIMATIONTYPE_NDOWN
				controlGet(*c,#H2H_CONTROL_ATTACK_DOWN)=1
			Case #H2H_ANIMATIONTYPE_HEAVY
				controlGet(*c,#H2H_CONTROL_HEAVY)=1
		EndSelect
	EndIf
EndProcedure

Macro AIReachedTarget(ai)
	Bool(ai\attackTarget And animationEquals(ai\who\currentAnimation,ai\attackTarget))
EndMacro

Macro AICanReach(ai)
; 	For i=0 To 5
; 		If animationEquals(*ai\who\currentAnimation\animations[i],*ai\attackTarget)
; 			ProcedureReturn 1
; 		EndIf
; 	Next
	Bool(animationEquals(ai\who\currentAnimation,ai\attackTarget) Or animationEquals(animationGetNeutral(ai\who\currentAnimation),ai\attackTarget) Or animationEquals(animationGetSide(ai\who\currentAnimation),ai\attackTarget) Or animationEquals(animationGetBack(ai\who\currentAnimation),ai\attackTarget) Or animationEquals(animationGetUp(ai\who\currentAnimation),ai\attackTarget) Or animationEquals(animationGetDown(ai\who\currentAnimation),ai\attackTarget) Or animationEquals(animationGetHeavy(ai\who\currentAnimation),ai\attackTarget))
EndMacro

Procedure AIComboFollow(*ai.bot,*target.player)
; 	*previous.animation=*ai\attackTarget
	If *ai\difficulty=#H2H_AI_LEVEL_MEDIUM And Random(1)
		AISelectRandomCombo(*ai)
	EndIf
	If *ai\difficulty>=#H2H_AI_LEVEL_HARD
		AISelectCombo(*ai,*target)
	EndIf
EndProcedure

Procedure AIRandomAttack(*ai.bot,*target.player)
	If Not *ai Or Not *target
		Debug "no ai or no target"
		ProcedureReturn
	EndIf
	If *ai\mode<>#H2H_AI_MODE_OFFENSE
		Debug "not offense"
		ProcedureReturn
	EndIf
	*who.player=*ai\who
	If Not *who\attacking
		*ai\attackTarget=0
	EndIf
; 	If *ai\attackTarget And Not AICanReach(*ai)
; 		Debug "can't reach"
; 		*ai\attackTarget=0
; 	EndIf
	If Not *ai\attackTarget
		r=#H2H_AI_DECISION_RANDOM-*ai\nervousness
		If r<0
			r=0
		EndIf
		If Not r Or Random(r)/*ai\difficulty=0
			*ai\nervousness=0
			If *ai\difficulty>=#H2H_AI_LEVEL_HARD
				If isPlayerAnimationType(*target,#H2H_ANIMATIONTYPE_IDLE) Or *target\parry>0
					If Not Random(#H2H_AI_HEAVY_CHANCE)
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_HEAVY)
; 						Debug "hard selected heavy"
					EndIf
				EndIf
			EndIf
			If *ai\difficulty>=#H2H_AI_LEVEL_MEDIUM
				; if the foe is higher, will spam up attack
				If AITargetIsUp(*ai,*target)
					AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NUP)
; 					Debug "medium selected air"
				EndIf
				; here the players is around the same ground level
				; if the foe is too close, will spam down and back
				If Abs(*target\position\x-*who\position\x)<AIInflateRange(*ai,#H2H_AI_DEFENSE_THRESHOLD)
					r=Random(4)
					If r<=1
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NDOWN)
; 						Debug "medium selected down"
					ElseIf r<=3
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NBACK)
						; 						Debug "medium selected back"
					Else
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_HEAVY)
					EndIf
				Else
					r=Random(4)
					If r<=1
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NEUTRAL)
					ElseIf r<=3
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NSIDE)
					Else
						AISelectAttack(*ai,#H2H_ANIMATIONTYPE_HEAVY)
					EndIf
				EndIf
			EndIf
			; Else, will spam a random attack
			If Not *ai\attackTarget
				*a.animation=playerSelectRandomAttack(*ai\who)
				If *a
					AISelectAttack(*ai,*a\animationType)
				EndIf
			EndIf
		Else
			; Check failed, stays idle
			*ai\attackTarget=0
			*ai\nervousness+deltaGlobal/2
; 			Debug *ia\who\name+" "+*ia\nervousness
		EndIf
	Else
		If AIReachedTarget(*ai)
 			Debug "reached "+*ai\attackTarget\name
			AIComboFollow(*ai,*target)
			If *ai\attackTarget
				Debug "changed to "+*ai\attackTarget\name
			Else
				Debug "reinit"
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AIMove(*ai.bot,x.i)
	*who.player=*ai\who
	If *who\recovery
		ProcedureReturn
	EndIf
	controlGet(*who\pushed,#H2H_CONTROL_RIGHT)=Bool(*who\position\x<x)
	controlGet(*who\pushed,#H2H_CONTROL_LEFT)=Bool(*who\position\x>x)
	If Abs(*who\position\x-x)<AIInflateRange(*ai,100)
		controlGet(*who\pushed,#H2H_CONTROL_RIGHT)=0
		controlGet(*who\pushed,#H2H_CONTROL_LEFT)=0
	EndIf
EndProcedure

; Procedure AI_movePrecise(*ai.bot,x.i)
; 	*who.player=*ai\who
; 	If *who\recovery
; 		ProcedureReturn
; 	EndIf
; 	If *who\position\x<x
; 		*who\pushed\right=1
; 	Else
; 		*who\pushed\right=0
; 	EndIf
; 	If *who\position\x>x
; 		*who\pushed\left=1
; 	Else
; 		*who\pushed\left=0
; 	EndIf
; 	If Abs(*who\position\x-x)<5
; 		*who\pushed\right=0
; 		*who\pushed\left=0
; 		*who\isAI=-1
; 	EndIf
; EndProcedure

Procedure AIPickStun(*ai.bot)
	If *ai\who\attacking
		ProcedureReturn animationPickStun(*ai\who\currentAnimation)
	Else
		Protected Dim *picked.animation(0)
		Protected *c.class=*ai\who\class
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

Procedure AIPickMovement(*ai.bot,*target.player,away.i)
	Protected distance=200 ; TODO const
	Protected *picked.animation=#Null
	If away
		distance=-distance
	EndIf
	For i=0 To 5 ; 6 types of attacks
		If *ai\who\direction
			away=Bool(Not away)
			distance=-distance
		EndIf
		Protected *a.animation=*ai\who\class\animations[i]
		If *a
			Protected range=animationRange(*a)
			If away
				If range<distance
					distance=range
					*picked=*a
				EndIf
			Else
				If range>distance
					distance=range
					*picked=*a
				EndIf
			EndIf
		EndIf
	Next
	ProcedureReturn *picked
EndProcedure

; Smarter decisions
Procedure AIDecisionHard(*ai.bot,*target.player)
	If *target\attacking
		If *target\attacking And *ai\mode<>#H2H_AI_MODE_PARRY And *ai\who\guard>PLAYER_GUARD_BASE/2 And *target\currentAnimation\animationType<>#H2H_ANIMATIONTYPE_HEAVY And Not animationStun(*target\currentAnimation) And *ai\parrying<=0 And Not Random(2)
			*ai\parrying=20
			Debug "parrying"
		Else
			If Not *ai\attackTarget
				; punish an attacking player
				Protected *p.animation=animationPickStun(*ai\who\currentAnimation)
				If *p
		; 			Debug "IA punishes with stun"
					AISelectAttack(*ai,*p\animationType)
				Else
					; flee an attack
					If playerGetAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
						*a.animation=AIPickMovement(*ai,*target,#True)
						If *a
		; 					Debug "IA flies away"
							AISelectAttack(*ai,*a\animationType)
						Else
							; evade
		; 					If getSpeed(*ia\who)>2 And getStrength(*ia\who)-GetWeight(*ia\who)>1
		; 						Debug "IA evades"
								controlClear(*ai\who\pushed,#False,0)
								*ai\attackTarget=0
								controlGet(*ai\who\pushed,#H2H_CONTROL_DODGE)=1
		; 					Else
								; do nothing ?
		; 					EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		; TODO ranged attack
	EndIf
EndProcedure


#H2H_AI_BORDER_THRESHOLD=100
Procedure.i AIIsCloseToBorder(*ai.bot,*target.player,gameBorderLeft.i=0,gameBorderRight.i=2000)
	If *ai\who\direction<>*target\direction
		If *ai\who\lockedDirection
			If *ai\who\position\x<-#HITBOX_BACKSHIFT_X+gameBorderLeft+#H2H_AI_BORDER_THRESHOLD
				ProcedureReturn 1
			Else
				If *ai\who\position\x>gameBorderRight-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)-#H2H_AI_BORDER_THRESHOLD
					ProcedureReturn 2
				EndIf
			EndIf
		Else
			If *ai\who\position\x<-#HITBOX_SHIFT_X+gameBorderLeft+#H2H_AI_BORDER_THRESHOLD
				ProcedureReturn 1
			Else
				If *ai\who\position\x>gameBorderRight-(#HITBOX_SHIFT_X+#HITBOX_SIZE)-#H2H_AI_BORDER_THRESHOLD
					ProcedureReturn 2
				EndIf
			EndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure AIDecisionChopstick(*ai.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; anti down spam
	If animationEquals(*ai\attackTarget,playerGetDown(*ai\who)) And Not (*target\position\y<groundLevel-400 Or *target\deltaMovement\y<-30)
		Debug "chopstick stop down"
		*ai\attackTarget=0
	EndIf
	; down attack dodge trick
	If *target\attacking
		If *target\currentAnimation\animationType<>#H2H_ANIMATIONTYPE_NUP Or *target\position\y<groundLevel-400 Or *target\deltaMovement\y<-30
			If Not Random(3) And Not *ai\attackTarget
				Debug "Chopstick ndown"
				AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NDOWN)
			EndIf
		EndIf
	EndIf
	If Not *ai\attackTarget And playerGetAnimationType(*target)<>#H2H_ANIMATIONTYPE_NEUTRAL And playerDistance(*ai\who,*target)<100
		; neutral barrage
		; not effective against gluestick heavy attacks
		If Not (*target\class=*allClasses(4) And playerGetAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY)
			If Random(2)
				Debug "Chopstick neutral"
				AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NEUTRAL)
			EndIf
		EndIf
	EndIf
	If Not *ai\attackTarget And	playerGetAnimationType(*target)<>#H2H_ANIMATIONTYPE_NBACK And playerDistance(*ai\who,*target)<200 And *target\position\y>=groundLevel-50 And *target\deltaMovement\y>=0
		If (*ai\who\direction And *ai\who\position\x>gameBorderLeft+200) Or (Not *ai\who\direction And *ai\who\position\x<gameBorderRight-200)
			; back flee
			If Random(1)
; 			If *ai\who\currentAnimation\animationType=#H2H_ANIMATIONTYPE_NBACK And Random(1)
				Debug "Chopstick back"
				AISelectAttack(*ai,#H2H_ANIMATIONTYPE_NBACK)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AIDecisionBallpen(*ai.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	If Not animationEquals(*ai\attackTarget,*ai\who\currentAnimation) And Not Random(5)
		If AITargetIsClose(*ai,*target)
			If Random(1)
				If animationGetBack(*ai\who\currentAnimation)
					*ai\attackTarget=animationGetBack(*ai\who\currentAnimation)
				Else
					If animationGetDown(*ai\who\currentAnimation)
						*ai\attackTarget=animationGetDown(*ai\who\currentAnimation)
					EndIf
				EndIf
			Else
				If animationGetDown(*ai\who\currentAnimation)
					*ai\attackTarget=animationGetDown(*ai\who\currentAnimation)
				Else
					If animationGetBack(*ai\who\currentAnimation)
						*ai\attackTarget=animationGetBack(*ai\who\currentAnimation)
					EndIf
				EndIf
			EndIf
		Else
			If Random(2)
				If animationGetSide(*ai\who\currentAnimation)
					*ai\attackTarget=animationGetSide(*ai\who\currentAnimation)
				Else
					*ai\attackTarget=animationGetNeutral(*ai\who\currentAnimation)
				EndIf
			Else
				If animationGetNeutral(*ai\who\currentAnimation)
					*ai\attackTarget=animationGetNeutral(*ai\who\currentAnimation)
				Else
					*ai\attackTarget=animationGetSide(*ai\who\currentAnimation)
				EndIf
			EndIf
		EndIf
	EndIf
	If Not *ai\attackTarget
		If *ai\who\currentStance=*ai\who\class\allStances(1)
;  			Debug "blue"
			If AITargetIsClose(*ai,*target) And Random(1) And playerGetAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
				; the blue will dodge
; 				Debug "dodge"
				If *target\lockedDirection
					If *ai\who\position\x>gameBorderLeft+400
						AIMove(*ai,*target\position\x-400)
					Else ; jumps over it
						AIMove(*ai,*target\position\x+400)
						controlGet(*ai\who\pushed,#H2H_CONTROL_JUMP)=1
					EndIf
				Else
					If *ai\who\position\x<gameBorderRight-400
						AIMove(*ai,*target\position\x+400)
					Else ; jumps over it
						AIMove(*ai,*target\position\x-400)
						controlGet(*ai\who\pushed,#H2H_CONTROL_JUMP)=1
					EndIf
				EndIf
			EndIf
		EndIf
		If *ai\who\currentStance=*ai\who\class\allStances(3)
			If Not AITargetIsClose(*ai,*target) And Random(1) And playerGetAnimationType(*target)=#H2H_ANIMATIONTYPE_HEAVY
				; the red will punish a heavy attack with a heavy attack
				AISelectAttack(*ai,#H2H_ANIMATIONTYPE_HEAVY)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure AIDecisionUnarmed(*ai.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	If Random(10)
		Select *ai\attackTarget
			Case #Null
				If playerGetWeight(*target)>2
					Debug "COUP DE BOULE !"
					chance=10
					If playerDistance(*ai\who,*target)<400
						chance=8
					EndIf
					If playerDistance(*ai\who,*target)<300
						chance=6
					EndIf
					If playerDistance(*ai\who,*target)<200
						chance=4
					EndIf
					If playerDistance(*ai\who,*target)<100
						chance=2
					EndIf
					If *target\position\y<groundLevel-200
						chance*2
					EndIf
					If playerGetWeight(*target)>=4
						chance/2
					EndIf
					If Random(chance)=chance
						*ai\attackTarget=playerGetBack(*ai\who)
					EndIf
				EndIf
			Case playerGetBack(*ai\who)
				Debug "COUP DE BOULE CLUTCH"
				If *ai\who\direction
					If AIIsCloseToBorder(*ai,*target,gameBorderLeft,gameBorderRight)
						*ai\attackTarget=animationGetDown(*ai\who\currentAnimation)
					Else
						*ai\attackTarget=animationGetSide(*ai\who\currentAnimation)
					EndIf
				Else
					If AIIsCloseToBorder(*ai,*target,gameBorderLeft,gameBorderRight)
						*ai\attackTarget=animationGetSide(*ai\who\currentAnimation)
					Else
						*ai\attackTarget=animationGetBack(*ai\who\currentAnimation)
					EndIf
				EndIf
		EndSelect
	EndIf
EndProcedure

Procedure AIDecisionGluestick(*ai.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; nothing special
	; TODO
EndProcedure

Procedure AIDecisionHexKey(*ai.bot,*target.player,gameBorderLeft.i,gameBorderRight.i)
	; attack air if really up there
	If animationEquals(*ai\attackTarget,playerGetUp(*ai\who))
		If (AITargetIsUp(*ai,*target) Or *ai\who\deltaMovement\y<0)
			*ai\attackTarget=0
		EndIf
	EndIf
EndProcedure

Procedure AIDecision(*ai.bot,*target.player,delta.d=1,gameBorderLeft.i=0,gameBorderRight.i=2000)
	If Not *ai Or gamePaused
		Debug "no AI or paused"
		ProcedureReturn
	EndIf
	If Not *target Or *target\life<=0
		*ai\mode=#H2H_AI_MODE_DISABLED
	EndIf
	If *ai\mode=#H2H_AI_MODE_DISABLED
		Debug "disabled"
		ProcedureReturn
	EndIf
	If *ai\mode=#H2H_AI_MODE_IDLE
		*ai\mode=#H2H_AI_MODE_OFFENSE
	EndIf
	If *ai\parrying>0
		*ai\mode=#H2H_AI_MODE_PARRY
		*ai\parrying-delta
; 		Debug "parry decay "+*ai\parrying
		If *ai\parrying<=0
			*ai\parrying=0
			*ai\mode=#H2H_AI_MODE_IDLE
; 			Debug "parry stop "+*ai\parrying
		EndIf
	EndIf
	*who.player=*ai\who
	Select *ai\mode
		Case #H2H_AI_MODE_OFFENSE
			If Not isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_SPAWN)
				breakRange=0
				If *ai\attackTarget
					; if the ennemy is really too far, will break attack
					; So combos aren't quite broken
					breakRange=200
				EndIf
				Protected distance=playerDistance(*who,*target)
				If distance<AIInflateRange(*ai,300+breakRange)
					continueTheAttack.i=#True
					; If AI_isCloseToBorder(*ia,*target,gameBorderLeft,gameBorderRight)
					; 	Debug "close to border"
					; EndIf
					If distance<AIInflateRange(*ai,100) And Not *ai\attackTarget And Not AIIsCloseToBorder(*ai,*target,gameBorderLeft,gameBorderRight)
						If playerGetReach(*who)>1
							If *who\direction
								AIMove(*ai,*target\position\x-AIInflateRange(*ai,200+breakRange))
							Else
								AIMove(*ai,*target\position\x+AIInflateRange(*ai,200+breakRange))
							EndIf
							continueTheAttack=#False
						EndIf
					EndIf
					If continueTheAttack
						*ai\attackBuffer+delta
						If ListSize(*who\hit())
							*ai\attackBuffer+delta*2
						EndIf
						If *ai\attackBuffer>1
							AIRandomAttack(*ai,*target)
							If *ai\difficulty>=#H2H_AI_LEVEL_HARD
								If Not *ai\attackTarget And Not Random(1)
									AIDecisionHard(*ai,*target)
									Select *ai\who\class
										Case *allClasses(0)
											AIDecisionChopstick(*ai,*target,gameBorderLeft,gameBorderRight)
										Case *allClasses(1)
											AIDecisionUnarmed(*ai,*target,gameBorderLeft,gameBorderRight)
										Case *allClasses(2)
											AIDecisionBallpen(*ai,*target,gameBorderLeft,gameBorderRight)
										Case *allClasses(4)
											AIDecisionGluestick(*ai,*target,gameBorderLeft,gameBorderRight)
										Case *allClasses(12)
											AIDecisionHexKey(*ai,*target,gameBorderLeft,gameBorderRight)
									EndSelect
								EndIf
							EndIf
							*ai\attackBuffer-1
						EndIf
						AIAttackOrder(*ai)
					EndIf
				Else
					; if the ennemy is too far, will break attack
					AIMove(*ai,*target\position\x)
					*ai\attackTarget=0
					If *ai\difficulty>=#H2H_AI_LEVEL_HARD
						*ai\attackBuffer+delta*2
					EndIf
				EndIf
				If *ai\attackTarget And animationIsAttack(*ai\who\currentAnimation) And Not AICanReach(*ai)
; 					Debug "cannot reach ! "+Str(Bool(AICanReach(*ai)))
; 					Debug "Expected "+*ai\attackTarget\name+" "+*ai\attackTarget\id
; 					Debug "Current "+*ai\who\currentAnimation\name
; 					Debug "Is attack "+Str(animationIsAttack(*ai\who\currentAnimation))
; 					
; 					For i=0 To 5
; 						If Not animationEquals(*ai\who\currentAnimation\animations[i],*ai\attackTarget)
; 							If *ai\who\currentAnimation\animations[i]
; 								Debug *ai\who\currentAnimation\animations[i]\name+" "+Str(*ai\who\currentAnimation\animations[i])
; 							Else
; 								Debug Str(i)+" empty"
; 							EndIf
; 						Else
; 							Debug "Found ! "+*ai\who\currentAnimation\animations[i]\name+" "+Str(*ai\who\currentAnimation\animations[i])
; 						EndIf
; 					Next
					*ai\attackTarget=0
				EndIf
			EndIf
		Case #H2H_AI_MODE_PARRY
			controlClear(*ai\who\pushed,#False,0)
			controlGet(*ai\who\pushed,#H2H_CONTROL_PARRY)=1
	EndSelect
EndProcedure

Macro playerIsBot(who)
	Bool(who\isAI)
EndMacro
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 641
; FirstLine = 253
; Folding = -fzjg-
; EnableXP
; DPIAware
; CPU = 4