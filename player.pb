; #HITBOX_SHIFT_X=450
; #HITBOX_SHIFT_Y=425
; #HITBOX_SIZE=200
; #HITBOX_BACKSHIFT_X=1000-#HITBOX_SHIFT_X-#HITBOX_SIZE
; #HITBOX_BACKSHIFT_Y=#HITBOX_SHIFT_Y
#GROUND_LEVEL=1200-#HITBOX_SHIFT_Y

#H2H_PLAYER_HP_BASE=200
Global PLAYER_HP_BASE=#H2H_PLAYER_HP_BASE
#H2H_PLAYER_HP_BONUS=15
Global PLAYER_HP_BONUS=#H2H_PLAYER_HP_BONUS

#H2H_PLAYER_STUN_MAX=10
Global PLAYER_STUN_MAX=#H2H_PLAYER_STUN_MAX

#H2H_PLAYER_DODGE_BASE=50
Global PLAYER_DODGE_BASE=#H2H_PLAYER_DODGE_BASE
#H2H_PLAYER_DODGE_MARGIN=10
Global PLAYER_DODGE_MARGIN=#H2H_PLAYER_DODGE_MARGIN

#H2H_PLAYER_GUARD_BASE=10.0
Global PLAYER_GUARD_BASE=#H2H_PLAYER_GUARD_BASE
#H2H_PLAYER_GUARD_PER_WEIGHT=5.0
Global PLAYER_GUARD_PER_WEIGHT=#H2H_PLAYER_GUARD_PER_WEIGHT
#H2H_PLAYER_GUARD_PER_SECOND=#H2H_PLAYER_GUARD_BASE
Global PLAYER_GUARD_PER_SECOND=#H2H_PLAYER_GUARD_PER_SECOND
#H2H_PLAYER_GUARD_PER_SECOND_PER_ENDURANCE=2.5
Global PLAYER_GUARD_PER_SECOND_PER_ENDURANCE=#H2H_PLAYER_GUARD_PER_SECOND_PER_ENDURANCE

#H2H_PLAYER_REGEN_THRESHOLD=#H2H_PLAYER_HP_BASE
Global PLAYER_REGEN_THRESHOLD=#H2H_PLAYER_REGEN_THRESHOLD
#H2H_PLAYER_REGEN_TOTAL_BASE=20
Global PLAYER_REGEN_TOTAL_BASE=#H2H_PLAYER_REGEN_TOTAL_BASE
#H2H_PLAYER_REGEN_TOTAL_INCREMENT=10
Global PLAYER_REGEN_TOTAL_INCREMENT=#H2H_PLAYER_REGEN_TOTAL_INCREMENT

#H2H_PLAYER_REGEN_TICK_BASE=200
Global PLAYER_REGEN_TICK_BASE=#H2H_PLAYER_REGEN_TICK_BASE
#H2H_PLAYER_REGEN_TICK_DECREMENT=20
Global PLAYER_REGEN_TICK_DECREMENT=#H2H_PLAYER_REGEN_TICK_DECREMENT

#H2H_AI_CHEAT_BONUS=1
Global AI_CHEAT_BONUS=1

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure.i JSONPlayerExport(*parent=0)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONInteger(*parent,"PLAYER_HP_BASE",PLAYER_HP_BASE)
	addJSONInteger(*parent,"PLAYER_HP_BONUS",PLAYER_HP_BONUS)
	
	addJSONInteger(*parent,"PLAYER_STUN_MAX",PLAYER_STUN_MAX)

	addJSONInteger(*parent,"PLAYER_DODGE_BASE",PLAYER_DODGE_BASE)
	addJSONInteger(*parent,"PLAYER_DODGE_MARGIN",PLAYER_DODGE_MARGIN)
	
	addJSONFloat(*parent,"PLAYER_GUARD_BASE",PLAYER_GUARD_BASE)
	addJSONFloat(*parent,"PLAYER_GUARD_PER_WEIGHT",PLAYER_GUARD_PER_WEIGHT)
	addJSONFloat(*parent,"PLAYER_GUARD_PER_SECOND",PLAYER_GUARD_PER_SECOND)
	addJSONFloat(*parent,"PLAYER_GUARD_PER_SECOND_PER_ENDURANCE",PLAYER_GUARD_PER_SECOND_PER_ENDURANCE)

	addJSONInteger(*parent,"PLAYER_REGEN_THRESHOLD",PLAYER_REGEN_THRESHOLD)
	addJSONInteger(*parent,"PLAYER_REGEN_TOTAL_BASE",PLAYER_REGEN_TOTAL_BASE)
	addJSONInteger(*parent,"PLAYER_REGEN_TOTAL_INCREMENT",PLAYER_REGEN_TOTAL_INCREMENT)

	addJSONInteger(*parent,"PLAYER_REGEN_TICK_BASE",PLAYER_REGEN_TICK_BASE)
	addJSONInteger(*parent,"PLAYER_REGEN_TICK_DECREMENT",PLAYER_REGEN_TICK_DECREMENT)
	
	addJSONInteger(*parent,"AI_CHEAT_BONUS",AI_CHEAT_BONUS)

	ProcedureReturn *parent
EndProcedure
CompilerEndIf

CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure JSONPlayerImport(*parent)
	If *parent
		Debug "parent"
		If GetJSONMember(*parent,"PLAYER_HP_BASE")
			PLAYER_HP_BASE=loadJSONInteger(*parent,"PLAYER_HP_BASE")
			If PLAYER_HP_BASE<1
				PLAYER_HP_BASE=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_HP_BONUS")
			PLAYER_HP_BONUS=loadJSONInteger(*parent,"PLAYER_HP_BONUS")
			If PLAYER_HP_BONUS<0
				PLAYER_HP_BONUS=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_STUN_MAX")
			PLAYER_STUN_MAX=loadJSONInteger(*parent,"PLAYER_STUN_MAX")
			If PLAYER_STUN_MAX<1
				PLAYER_STUN_MAX=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_DODGE_BASE")
			PLAYER_DODGE_BASE=loadJSONInteger(*parent,"PLAYER_DODGE_BASE")
			If PLAYER_DODGE_BASE<1
				PLAYER_DODGE_BASE=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_DODGE_MARGIN")
			PLAYER_DODGE_MARGIN=loadJSONInteger(*parent,"PLAYER_DODGE_MARGIN")
			If PLAYER_DODGE_MARGIN<1
				PLAYER_DODGE_MARGIN=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_GUARD_BASE")
			PLAYER_GUARD_BASE=LoadJSONFloat(*parent,"PLAYER_GUARD_BASE")
			If PLAYER_GUARD_BASE<1
				PLAYER_GUARD_BASE=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_GUARD_PER_WEIGHT")
			PLAYER_GUARD_PER_WEIGHT=LoadJSONFloat(*parent,"PLAYER_GUARD_PER_WEIGHT")
			If PLAYER_GUARD_PER_WEIGHT<0
				PLAYER_GUARD_PER_WEIGHT=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_GUARD_PER_SECOND")
			PLAYER_GUARD_PER_SECOND=LoadJSONFloat(*parent,"PLAYER_GUARD_PER_SECOND")
			If PLAYER_GUARD_PER_SECOND<1
				PLAYER_GUARD_PER_SECOND=1
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_GUARD_PER_SECOND_PER_ENDURANCE")
			PLAYER_GUARD_PER_SECOND_PER_ENDURANCE=LoadJSONFloat(*parent,"PLAYER_GUARD_PER_SECOND_PER_ENDURANCE")
			If PLAYER_GUARD_PER_SECOND_PER_ENDURANCE<0
				PLAYER_GUARD_PER_SECOND_PER_ENDURANCE=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_REGEN_THRESHOLD")
			PLAYER_REGEN_THRESHOLD=loadJSONInteger(*parent,"PLAYER_REGEN_THRESHOLD")
			If PLAYER_REGEN_THRESHOLD<0
				PLAYER_REGEN_THRESHOLD=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_REGEN_TOTAL_BASE")
			PLAYER_REGEN_TOTAL_BASE=loadJSONInteger(*parent,"PLAYER_REGEN_TOTAL_BASE")
			If PLAYER_REGEN_TOTAL_BASE<0
				PLAYER_REGEN_TOTAL_BASE=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_REGEN_TOTAL_INCREMENT")
			PLAYER_REGEN_TOTAL_INCREMENT=loadJSONInteger(*parent,"PLAYER_REGEN_TOTAL_INCREMENT")
			If PLAYER_REGEN_TOTAL_INCREMENT<0
				PLAYER_REGEN_TOTAL_INCREMENT=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_REGEN_TICK_BASE")
			PLAYER_REGEN_TICK_BASE=loadJSONInteger(*parent,"PLAYER_REGEN_TICK_BASE")
			If PLAYER_REGEN_TICK_BASE<0
				PLAYER_REGEN_TICK_BASE=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"PLAYER_REGEN_TICK_DECREMENT")
			PLAYER_REGEN_TICK_DECREMENT=loadJSONInteger(*parent,"PLAYER_REGEN_TICK_DECREMENT")
			If PLAYER_REGEN_TICK_DECREMENT<0
				PLAYER_REGEN_TICK_DECREMENT=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"AI_CHEAT_BONUS")
			AI_CHEAT_BONUS=loadJSONInteger(*parent,"AI_CHEAT_BONUS")
			If AI_CHEAT_BONUS<0
				AI_CHEAT_BONUS=0
			EndIf
		EndIf
	EndIf
EndProcedure
CompilerEndIf

#H2H_AIR_RESISTANCE_ENABLE=#False
CompilerIf #H2H_AIR_RESISTANCE_ENABLE
#H2H_AIR_RESISTANCE_PERCENT=5 ; percent of excess speed which will be deduced at each frame
#H2H_AIR_RESISTANCE_CAP=35	  ; cap after the air resistance kicks in, stabilizing the data to it
CompilerEndIf
#H2H_PLAYER_HIT_SHAKE_AMPLITUDE=6
;--- swishes & land wind
Global Dim *landLightFront.animation(0)
Global Dim *landLightBack.animation(0)
Global Dim *landHeavyFront.animation(0)
Global Dim *landHeavyBack.animation(0)

Enumeration 0
	#H2H_PLAYER_COLOR_MODE_ADAPTATIVE	; Player 2 get alternate if the color is too close to Player 1, by default
	#H2H_PLAYER_COLOR_MODE_ALTERNATIVE	; Player 2 get alternate if its stance has a color
	#H2H_PLAYER_COLOR_MODE_BASIC		; Player 1 always has orange and Player 2 blue
	#H2H_PLAYER_COLOR_MODE_CONTRAST     ; Player 1 is black and player 2 has low color intensity
EndEnumeration
#H2H_PLAYER_COLOR_MODE_DEFAULT=#H2H_PLAYER_COLOR_MODE_ADAPTATIVE

Global playerColorMode=#H2H_PLAYER_COLOR_MODE_DEFAULT

Procedure resetGroundLevel()
	groundLevel=screenSizeY-720
EndProcedure
resetGroundLevel()

; for each player
Structure HUD
	pendingDamage.d ; increased by damage, decreased by time
	*shift.location	; for trembling everywhere
	*who.player
EndStructure

;--- player struct
Structure player
	id.i
	name.s
	*currentAnimation.animation
	*currentFrame.frame
	sub.f ; for delta time
	frameIndicator.i ; which frame step it is in the current animation
	recovery.d		 ; for when an attacks ends
	
	position.location ; position of the player in the terrain
	;previousPosition.location ; for physics
	deltaMovement.location ; movement set at 0
	deltaAttack.location   ; forced movement through own attacks
	deltaPush.location
	screenPosition.location ; position of the player in the screen
	
	life.i
	maxLife.i
	
	guard.d		; regen increased by endurance
	maxGuard.d	; increased by weight
	guardFreeze.d ; delay when hit before guard regen resume
	
	hitbox.i ; index of the hitbox sprite
	attacking.b ; boolean if is attacking
	color.i		; RGB
	alternateColor.i ; RGB
	*keyboardControl.control
	*joystickControl.control
	jumpWithUp.i
	*pushed.control ; 1= pushed, refreshed each loop, used for joystick only since 0.1.1
	controlEnabled.b
 	*controlState.controlState
	*class.class
	classStanceId.i
	*currentStance.stance
	usesAlternate.i ; true if !=0
	direction.i ;0=facing left, 1=facing right
	lockedDirection.i ; same as direction, but indicates which direction the animation is facing
	displayDebug.i ; if >0 display debug data
	List hit.i()   ; filled with hit players, cleared when finished an attack
	haveHitSomeone.i ; if >0 he it someone before, reset at each animation start
	combo.b[#H2H_COMBO_MAX]
	comboShake.d[#H2H_COMBO_MAX]
	comboSize.d[#H2H_COMBO_MAX]
	comboHit.d[#H2H_COMBO_MAX]
	comboFlash.d[#H2H_COMBO_MAX]
	comboSuccess.d[#H2H_COMBO_MAX]
	comboDirection.d[#H2H_COMBO_MAX]
	comboCount.b
	tmpString.s ; dedicated storage value
; 	*hpb.hpBar	; hit point bar
	*hud.HUD
	
	regenTick.d ; for Endurence
	regenTotal.i ; reset at round start
	gravity.i
	landed.b
	blocked.i
	caught.b ; if true cannot move, attack or get affected by gravity
	
	dodge.d ; when >0, will dodge for this amount of frames
	jumpReload.d ; when <0 the player can dodge
	
	blockAmount.i ; remaining amount of block, if >0 can block TODO
	
	isAI.i ; also indicates the level
	*bot.ai
	feedback.i
	hitMode.i 	; indicates if the player is currently flinched. -1 is none, and >-1 indicates which hit icon is currently used
	tmpHitMode.i; indicates a hit when a frame delay occurs
	hasMoved.b	; tweak for fixing double frame movement
	spawnedWind.b ; so no spawning two times the wind at the same frame
	spawnedProjectile.b ; same principle
	
	joystickId.i ; if -1 then there's no joystick controling this player
	; index : #H2H_JOYSTICK_BUTTON
	; value : #H2H_ACTION
 	Array joystickMap.b(#H2H_ACTION_EXIT)
EndStructure

Structure damageData
	*origin.player
	*target.player
	damage.i
	stun.i
	*movedBy.location
	*movedTo.location
	*inertia.location ; for movementD
EndStructure

Declare playerStun(*p.player,stun.i)

Global NewList *allDamageData.damageData()

Procedure.i damageDataAdd(*fromWho.player,*toWho.player,newDamage.i,newStun.i=0,*willBeMovedBy.location=#Null,*kanseiDorifuto.location=#Null,*willBeMovedTo.location=#Null)
	*d.damageData=AllocateStructure(damageData)
	*d\origin=*fromWho
	*d\target=*toWho
	*d\damage=newDamage
	*d\stun=newStun
	*d\movedBy=*willBeMovedBy
	*d\movedTo=*willBeMovedTo
	*d\inertia=*kanseiDorifuto
	
	AddElement(*allDamageData())
	*allDamageData()=*d
	
	ProcedureReturn *d
EndProcedure
Declare playerGuardDamage(*p.player,damage.d)

Procedure playerApplyDamage(*d.damageData)
	*p.player=*d\target
	If *d\damage>0
		*p\life-*d\damage
	EndIf
	*p\feedback+*d\damage*2+2
	If *d\damage>0
		*p\hud\pendingDamage+*d\damage
		overboard=*d\damage
		If *p\guard>0
			overboard-*p\guard
			playerGuardDamage(*p,*d\damage)
		EndIf
		If overboard>0
			; Added stun cannot make the target having more recovery than 25
			overboard/2
			stun=*d\stun
			*d\stun+min(overboard,5)
			If *d\stun+*p\recovery>PLAYER_STUN_MAX
				*d\stun=max(stun,PLAYER_STUN_MAX-*p\recovery)
			EndIf
		EndIf
	EndIf
	If *d\stun>0
		playerStun(*p,*d\stun)
		playerGuardDamage(*p,*d\stun)
	EndIf
	If *d\movedBy
		x=*d\movedBy\x
		y=*d\movedBy\y
		locationAdd(*p\deltaMovement,-x,-y)
		If (x>0 And *p\deltaMovement\x<0) Or (x<0 And *p\deltaMovement\x>0)
			*p\deltaMovement\x=0
		EndIf
		If (y>0 And *p\deltaMovement\y<0) Or (y<0 And *p\deltaMovement\y>0)
			*p\deltaMovement\y=0
		EndIf
		locationAdd(*p\position,x,y)
	EndIf
	If *d\inertia
		locationAddLoc(*p\deltaPush,*d\inertia)
	EndIf
	If *d\movedTo
		set(*p\position,*d\movedTo)
		set(*p\deltaMovement)
		set(*p\deltaPush)
		set(*p\deltaAttack)
	EndIf
EndProcedure

Procedure applyDamageAll()
	ForEach *allDamageData()
		playerApplyDamage(*allDamageData())
		If *allDamageData()\movedBy
			locationDestroy(*allDamageData()\movedBy)
		EndIf
		If *allDamageData()\movedTo
			locationDestroy(*allDamageData()\movedTo)
		EndIf
		If *allDamageData()\inertia
			locationDestroy(*allDamageData()\inertia)
		EndIf
		FreeStructure(*allDamageData())
		DeleteElement(*allDamageData())
	Next
EndProcedure

IncludeFile "group.pb"
Procedure playerFacePoint(*p.player,*where.location)
	If Not *p Or Not *where
		ProcedureReturn
	EndIf
	; center the player
	If *p\position\x+500>*where\x
		*p\direction=0
	EndIf
	If *p\position\x+500<*where\x
		*p\direction=1
	EndIf
EndProcedure

Procedure playerFacePlayer(*p1.player,*p2.player)
	If Not *p1 Or Not *p2
		ProcedureReturn
	EndIf
	If *p1\position\x>*p2\position\x
		*p1\direction=0
	EndIf
	If *p1\position\x<*p2\position\x
		*p1\direction=1
	EndIf
EndProcedure

Macro playerShakeGround(player)
	screenShakeAdd(0,GetWeight(player)*2+10)
EndMacro

Macro playerGetIdle(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_IDLE)
EndMacro
Macro playerGetMoveFront(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_MOVE_FRONT)
EndMacro
Macro playerGetMoveBack(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_MOVE_BACK)
EndMacro
Macro playerGetNeutral(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_NEUTRAL)
EndMacro
Macro playerGetSide(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_SIDE)
EndMacro
Macro playerGetUp(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_UP)
EndMacro
Macro playerGetBack(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_BACK)
EndMacro
Macro playerGetDown(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_DOWN)
EndMacro
Macro playerGetHeavy(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_HEAVY)
EndMacro
Macro playerGetDeath(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_DEATH)
EndMacro
Macro playerGetSpawn(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_SPAWN)
EndMacro
Macro playerGetJump(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_JUMP)
EndMacro
Macro playerGetLand(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_LAND)
EndMacro
Macro playerGetHit(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_HIT)
EndMacro
Macro playerGetDodge(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_DODGE)
EndMacro
Macro playerGetParry(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_PARRY)
EndMacro
Macro playerGetSelection(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_SELECTION)
EndMacro
Macro playerGetSelected(p)
	classGetSomething(p\class,#H2H_CLASS_ANIMATION_SELECTED)
EndMacro

Procedure HUDRefresh(*hud.HUD,delta.d=1)
	If *hud\who\feedback
		max=(Abs(*hud\who\feedback)*screenSizeX)/1920
		If Not *hud\shift
			*hud\shift=locationCreate(Random(max*2)-max,Random(max*2)-max)
		Else
			set(*hud\shift,Random(max*2)-max,Random(max*2)-max)
		EndIf
	Else
		If *hud\shift
			locationDestroy(*hud\shift)
		EndIf
		*hud\pendingDamage=lerp(*hud\pendingDamage,0,delta/10.0)
	EndIf
EndProcedure

Declare playerDisplayClassIconCrop(*p.player,x.i,y.i,mirror.i=0,color.i=0,intensity.i=128)
Procedure.i playerGetColor(*p.player)
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_BASIC
		ProcedureReturn *p\color
	EndIf
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_CONTRAST
		ProcedureReturn #H2H_STANCE_COLOR_BLACK			
	EndIf
	If *p\currentStance\specialcolor
		If *p\usesAlternate
			ProcedureReturn *p\currentStance\alternatecolor
		Else
			ProcedureReturn *p\currentStance\specialcolor
		EndIf
	EndIf
	If *p\usesAlternate
		ProcedureReturn *p\alternateColor
	EndIf
	ProcedureReturn *p\color
EndProcedure
Procedure.i playerGetColorIntensity(*p.player)
	t=*p\currentStance\specialTransparency
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_BASIC
		ProcedureReturn 128
	EndIf
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_CONTRAST
		If *p\id
			ProcedureReturn 32
		Else
			ProcedureReturn 192
		EndIf
	EndIf
	If *p\usesAlternate
		t=*p\currentStance\alternateTransparency
	EndIf
	If t=0
		t=128
	EndIf
	ProcedureReturn t
EndProcedure
;{
; #H2H_PLAYER_HP_BAR_DISPLAY=#True
; Procedure hpBarDisplay(*hpb.hpBar,delta.d=1)
; 	Static cucube=0
; 	CompilerIf Not #H2H_PLAYER_HP_BAR_DISPLAY
; 		ProcedureReturn
; 	CompilerEndIf
; 	color=playerGetColor(*hpb\who)
; 	intensity=playerGetColorIntensity(*hpb\who)
; 	i=intensity-*hpb\redInertia
; 	If Not isPlayerAlive(*hpb\who)
; 		color=RGB(Red(color)/4,Green(color)/4,Blue(color)/4)
; 		i=(255+i)/2
; 	EndIf
; 	If i<0
; 		i=0
; 	EndIf
; 	ZoomSprite(classIconBack,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
; 	If *hpb\hitShift And Not gamePaused
; 		*hpb\redInertia=min(((*hpb\redInertia+5)*3)/2,192)
; 		;--- mask
; 		shifter=-50
; 		If *hpb\isMirrored
; 			shifter=-10
; 			DisplaySprite(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_WHITEMASK_X+*hpb\hitShift\x,*hpb\position\y+#H2H_HUD_WHITEMASK_Y+*hpb\hitShift\y)
; 		Else
; 			DisplaySprite(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_SIZE_X-#H2H_HUD_WHITEMASK_SIZE_X-#H2H_HUD_WHITEMASK_X+*hpb\hitShift\x,*hpb\position\y+#H2H_HUD_WHITEMASK_Y+*hpb\hitShift\y)
; 		EndIf
; 		barX=*hpb\position\x+*hpb\barShift\x+*hpb\greenBarX+*hpb\hitShift\x+shifter
; 		barY=*hpb\position\y+*hpb\barShift\y+*hpb\hitShift\y+40
; 		;--- small
; 		If *hpb\yellowBarX<>*hpb\greenBarX
; 			DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+*hpb\hitShift\x+shifter,barY)
; 			If playerGetColor(*hpb\who)=#Yellow
; 				DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+*hpb\hitShift\x+shifter,barY,128,#Orange)
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+*hpb\hitShift\x+shifter,barY,128,#Yellow)
; 			EndIf
; 		EndIf
; 		DisplaySpriteOptional(*hpb\greenBarId,barX,barY)
; 		If *hpb\who\life<=#H2H_PLAYER_HP_BASE
; 			If color=#Green
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,i,*hpb\who\color)
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,i,#Green)
; 			EndIf
; 			If *hpb\redInertia
; 				DisplayTransparentSprite(*hpb\greenBarId,barX,barY,*hpb\redInertia,#Red)
; 			EndIf
; 		Else
; 			If color=#Green
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,128,colorLerp(*hpb\who\color,RGB(0,0,0)))
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,128,RGB(0,64,0))
; 			EndIf
; 		EndIf
; 		barX=(barX-*hpb\greenBarX)+*hpb\bigGreenBarX
; 		barY-40
; 		;--- big
; 		If *hpb\who\life>#H2H_PLAYER_HP_BASE Or *hpb\bigYellowBarX<>*hpb\bigGreenBarX
; 			If *hpb\bigYellowBarX<>*hpb\bigGreenBarX
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+*hpb\hitShift\x+shifter,barY)
; 			If color=#Yellow
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+*hpb\hitShift\x+shifter,barY,128,#Orange)
; 			Else
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+*hpb\hitShift\x+shifter,barY,128,#Yellow)
; 			EndIf
; 			EndIf
; 			If *hpb\who\life>#H2H_PLAYER_HP_BASE
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY)
; 				If color=#Green
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY,*hpb\who\color)
; 				Else
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY,i,#Green)
; 				EndIf
; 				If *hpb\redInertia
; 					DisplayTransparentSprite(*hpb\bigGreenBarId,barX,barY,*hpb\redInertia,#Red)
; 				EndIf
; 			EndIf
; 		EndIf
; 		
; 		;--- class icon
; 		shifter=60
; 		If Not *hpb\isMirrored
; 			shifter=510
; 		EndIf
; 		max=Abs(*hpb\who\feedback)
; 		playerDisplayClassIconCrop(*hpb\who,*hpb\position\x+*hpb\hitShift\x+shifter+(Random(max*2)-max)/2,*hpb\position\y+*hpb\hitShift\y-85+(Random(max*2)-max)/2,*hpb\isMirrored)
; 		
; 		;--- HUD
; 		shifter=-10
; 		If *hpb\isMirrored
; 			shifter=10
; 		EndIf
; 		DisplayTransparentSprite(barID+#H2H_HUD_SPRITE+*hpb\isMirrored,*hpb\position\x+shifter+*hpb\hitShift\x,*hpb\position\y+*hpb\hitShift\y-150)
; 		If isTooWhite(color,128)
; 			DisplayTransparentSprite(barID+#H2H_HUD_SPRITE+*hpb\isMirrored,*hpb\position\x+shifter+*hpb\hitShift\x,*hpb\position\y+*hpb\hitShift\y-150,*hpb\redInertia/2,#Red)
; 		EndIf
; 	Else
; 		*hpb\redInertia=max(*hpb\redInertia*Pow(0.5,delta))
; 		;--- mask
; 		shifter=-50
; 		If *hpb\isMirrored
; 			shifter=-10
; 			DisplaySprite			(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_WHITEMASK_X,*hpb\position\y+#H2H_HUD_WHITEMASK_Y)
; 			DisplayTransparentSprite(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_WHITEMASK_X,*hpb\position\y+#H2H_HUD_WHITEMASK_Y,i,color)
; 		Else
; 			DisplaySprite			(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_SIZE_X-#H2H_HUD_WHITEMASK_SIZE_X-#H2H_HUD_WHITEMASK_X,*hpb\position\y+#H2H_HUD_WHITEMASK_Y)
; 			DisplayTransparentSprite(barID+#H2H_HUD_WHITEMASK,*hpb\position\x+#H2H_HUD_SIZE_X-#H2H_HUD_WHITEMASK_SIZE_X-#H2H_HUD_WHITEMASK_X,*hpb\position\y+#H2H_HUD_WHITEMASK_Y,i,color)
; 		EndIf
; 		barX=*hpb\position\x+*hpb\barShift\x+*hpb\greenBarX+shifter
; 		barY=*hpb\position\y+*hpb\barShift\y+40
; 		;--- small
; 		If *hpb\yellowBarX<>*hpb\greenBarX
; 			DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+shifter,barY)
; 			If color=#Yellow
; 				DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+shifter,barY,128,#Orange)
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\yellowBarX+shifter,barY,128,#Yellow)
; 			EndIf
; 		EndIf
; 		DisplaySpriteOptional(*hpb\greenBarId,barX,barY)
; 		If *hpb\who\life<=#H2H_PLAYER_HP_BASE
; 			If color=#Green
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,i,*hpb\who\color)
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,i,#Green)
; 			EndIf
; 			If *hpb\redInertia
; 				DisplayTransparentSprite(*hpb\greenBarId,barX,barY,*hpb\redInertia,#Red)
; 			EndIf
; 		Else
; 			If color=#Green
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,intensity,colorLerp(*hpb\who\color,0))
; 			Else
; 				DisplaySpriteOptional(*hpb\greenBarId,barX,barY,128,RGB(0,64,0))
; 			EndIf
; 		EndIf
; 		barX=(barX-*hpb\greenBarX)+*hpb\bigGreenBarX
; 		barY-40
; 		;--- big
; 		If *hpb\who\life>#H2H_PLAYER_HP_BASE Or *hpb\bigYellowBarX<>*hpb\bigGreenBarX
; 			If *hpb\bigYellowBarX<>*hpb\bigGreenBarX
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+shifter,barY)
; 				If color=#Yellow
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+shifter,barY,128,#Orange)
; 				Else
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,*hpb\position\x+*hpb\barShift\x+*hpb\bigYellowBarX+shifter,barY,128,#Yellow)
; 				EndIf
; 			EndIf
; 			If *hpb\who\life>#H2H_PLAYER_HP_BASE
; 				DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY)
; 				If color=#Green
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY,i,*hpb\who\color)
; 				Else
; 					DisplaySpriteOptional(*hpb\bigGreenBarId,barX,barY,i,#Green)
; 				EndIf
; 				If *hpb\redInertia
; 					DisplayTransparentSprite(*hpb\bigGreenBarId,barX,barY,*hpb\redInertia,#Red)
; 				EndIf
; 			EndIf
; 		EndIf
; 		
; 		;--- class icon
; 		shifter=60
; 		If Not *hpb\isMirrored
; 			shifter=510
; 		EndIf
; 		playerDisplayClassIconCrop(*hpb\who,*hpb\position\x+shifter,*hpb\position\y-85,*hpb\isMirrored,color,i)
; 		;--- HUD
; 		shifter=-10
; 		If *hpb\isMirrored
; 			shifter=10
; 		EndIf
; 		DisplayTransparentSprite(barID+#H2H_HUD_SPRITE+*hpb\isMirrored,*hpb\position\x+shifter,*hpb\position\y-150)
; 		DisplayTransparentSprite(barID+#H2H_HUD_SPRITE+*hpb\isMirrored,*hpb\position\x+shifter,*hpb\position\y-150,i,color)
; 	EndIf
; 	
; 	;--- guard
; 	c.i=RGB(128,64,0)
; 	x=0
; 	y=0
; 	If Not gamePaused And *hpb\hitShift
; 		c.i=#Red
; 		x=*hpb\hitShift\x
; 		y=*hpb\hitShift\y
; 	EndIf
; 	If *hpb\who\guard>=*hpb\who\maxGuard
; 		c=#Orange
; 	EndIf
; 	
; 	#H2H_PLAYER_GUARD_BOX_SIZE=32.0
; 	#H2H_PLAYER_GUARD_BOX_FACTOR=32.0/5.0 ; guard to bar length
; 	#H2H_PLAYER_GUARD_BOX_SPACE=8.0
; 	If *hpb\who\guard>0
; 		If cucube=0
; 			cucube=spriteIndexAdd()
; 			Debug "created cucube "+cucube+" "+#H2H_PLAYER_GUARD_BOX_SIZE
; 			CreateSprite(cucube,#H2H_PLAYER_GUARD_BOX_SIZE,#H2H_PLAYER_GUARD_BOX_SIZE)
; 			StartDrawing(SpriteOutput(cucube))
; 			Box(0,0,#H2H_PLAYER_GUARD_BOX_SIZE,#H2H_PLAYER_GUARD_BOX_SIZE,#White)
; 			StopDrawing()
; 		EndIf
; 		length.f=*hpb\who\guard*#H2H_PLAYER_GUARD_BOX_FACTOR
; 		nbChunk=Int(length/#H2H_PLAYER_GUARD_BOX_SIZE)
; 		left.f=length-nbChunk*#H2H_PLAYER_GUARD_BOX_SIZE
; 		k=0
;  		ClipSprite(cucube,#PB_Default,#PB_Default,#PB_Default,#PB_Default)
; 		For i=1 To nbChunk
; 			If *hpb\isMirrored
; 				DisplayTransparentSprite(cucube,*hpb\position\x+260+x+k,*hpb\position\y+40,255,c)
; 			Else
; 				DisplayTransparentSprite(cucube,*hpb\position\x-260-k+SpriteWidth(barID+#H2H_HUD_SPRITE)+x-#H2H_PLAYER_GUARD_BOX_SIZE,*hpb\position\y+40+y,255,c)
; 			EndIf
; 			k+#H2H_PLAYER_GUARD_BOX_SIZE+#H2H_PLAYER_GUARD_BOX_SPACE
; 		Next
; 		ClipSprite(cucube,#PB_Default,#PB_Default,left,#PB_Default)
; 		If *hpb\isMirrored
; 			DisplayTransparentSprite(cucube,*hpb\position\x+260+x+k,*hpb\position\y+40,255,c)
; 		Else
; 			DisplayTransparentSprite(cucube,*hpb\position\x-260-k+SpriteWidth(barID+#H2H_HUD_SPRITE)+x-left,*hpb\position\y+40+y,255,c)
; 		EndIf
; 		If *hpb\isMirrored
; 			AfftextColor("guard",*hpb\position\x+260+x,*hpb\position\y+40+y,#Orange)
; 		Else
; 			AfftextColor("guard",*hpb\position\x-AfftextGetLength("guard")-260+SpriteWidth(barID+#H2H_HUD_SPRITE)+x,*hpb\position\y+40+y,#Orange)
; 		EndIf
; 	Else
; 		If *hpb\isMirrored
; 			AfftextColor("guard",*hpb\position\x+260+x,*hpb\position\y+40+y,#Gray)
; 		Else
; 			AfftextColor("guard",*hpb\position\x-AfftextGetLength("guard")-260+SpriteWidth(barID+#H2H_HUD_SPRITE)+x,*hpb\position\y+40+y,#Gray)
; 		EndIf
; 	EndIf
; EndProcedure
; 
; Procedure initHpBar(*p.player)
; 	If Not *p
; 		ProcedureReturn
; 	EndIf
; 	If Not *p\hpb
; 		ProcedureReturn
; 	EndIf
; 	*p\hpb\redInertia=0
; 	If *p\hpb\hitShift
; 		locationDestroy(*p\hpb\hitShift)
; 	EndIf
; 	If *p\hpb\isMirrored
; 		*p\hpb\greenBarX=min(*p\life*400/#H2H_PLAYER_HP_BASE,400)
; 		*p\hpb\bigGreenBarX=max((*p\life-#H2H_PLAYER_HP_BASE)*400/#H2H_PLAYER_HP_BASE)
; 	Else
; 		*p\hpb\greenBarX=400-min(*p\life*400/#H2H_PLAYER_HP_BASE,400)
; 		*p\hpb\bigGreenBarX=400-max((*p\life-#H2H_PLAYER_HP_BASE)*400/#H2H_PLAYER_HP_BASE)
; 	EndIf
; 	*p\hpb\yellowBarX=*p\hpb\greenBarX
; 	*p\hpb\bigYellowBarX=*p\hpb\bigGreenBarX
; EndProcedure
;}
Global filler=spriteIndexAdd() ; the bent rectangle to make the bars
Procedure initFiller()
	If Not IsSprite(filler)
		CreateSprite(filler,128,128,#PB_Sprite_AlphaBlending)
		StartDrawing(SpriteOutput(filler))
		DrawingMode(#PB_2DDrawing_AllChannels)
		Box(0,0,1,1,#White)
		StopDrawing()
		TransparentSpriteColor(filler,RGB(1,0,0)) ; won't be able to be colored else. Why ? Because feur
	EndIf
EndProcedure

Enumeration
	#H2H_UI_BAR_TYPE_HP
	#H2H_UI_BAR_TYPE_GUARD
	#H2H_UI_BAR_TYPE_STAMINA
EndEnumeration

; Procedure UIFillerDisplaty(x.i,y.i,width.i,height.i,size.i,c.i,flipped.i=#False
; 	ZoomSprite(filler,128,128)
; 	TransformSprite(filler,0,0,128,0,128,128,0,128)
; 	s.d=(nbChunk-1)*size*widthScale*scale
; 	ZoomSprite(filler,width,height)
; 	TransformSprite(filler,	-size,0,
; 			                width-size,0,
; 			                width,height,
; 			                0,height)
; 	DisplayTransparentSprite(filler,x+size*scale*widthScale+nbChunk*size*(1.0-widthScale)*scale,y+size*scale*0.125,255,fillColor)
; EndProcedure

#H2H_AI_LEVEL_EASY=1
#H2H_AI_LEVEL_MEDIUM=2
#H2H_AI_LEVEL_HARD=3
Macro getStrength(p)
	(p\class\stat\strength+p\class\allStances(p\classStanceId)\modificator\strength+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getAgility(p)
	(p\class\stat\agility+p\class\allStances(p\classStanceId)\modificator\agility+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getSpeed(p)
	(p\class\stat\speed+p\class\allStances(p\classStanceId)\modificator\speed+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro GetWeight(p)
	(p\class\stat\weight+p\class\allStances(p\classStanceId)\modificator\weight+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getStamina(p)
	(p\class\stat\endurence+p\class\allStances(p\classStanceId)\modificator\endurence+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getLife(p)
	((p\class\stat\life+p\class\allStances(p\classStanceId)\modificator\life+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS))
EndMacro
Macro getCut(p)
	(p\class\stat\cut+p\class\allStances(p\classStanceId)\modificator\cut+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getPierce(p)
	(p\class\stat\pierce+p\class\allStances(p\classStanceId)\modificator\pierce+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getBlunt(p)
	(p\class\stat\blunt+p\class\allStances(p\classStanceId)\modificator\blunt+Bool(p\isAI=#H2H_AI_LEVEL_HARD)*AI_CHEAT_BONUS)
EndMacro
Macro getReach(p)
	(p\class\stat\reach)
EndMacro

;----- guard
Procedure playerGuardRegen(*p.player,delta.d=1)
	overboard.d=1
	If *p\guardFreeze>0
		*p\guardFreeze-delta
		If *p\guardFreeze<0
			overboard+*p\guardFreeze
			*p\guardFreeze=0
		EndIf
	EndIf
	If *p\guardFreeze<=0
		*p\guard+((PLAYER_GUARD_PER_SECOND+PLAYER_GUARD_PER_SECOND_PER_ENDURANCE*getStamina(*p))/#H2H_FRAMEPERSECOND)*delta*overboard
		If *p\guard>*p\maxGuard
			*p\guard=*p\maxGuard
		EndIf
	EndIf
EndProcedure

Procedure playerGuardSet(*p.player)
	*p\maxGuard=PLAYER_GUARD_BASE+PLAYER_GUARD_PER_WEIGHT*getWeight(*p)
	*p\guard=*p\maxGuard
	*p\guardFreeze=0
EndProcedure

; returns true if just broken
Procedure.i playerGuardDamage(*p.player,damage.d)
	If damage<=0
		ProcedureReturn #False
	EndIf
	Protected broken.i=Bool(*p\guard>0)
	*p\guard-damage
	If *p\guard<-PLAYER_GUARD_BASE
		*p\guard=-PLAYER_GUARD_BASE
	EndIf
	If *p\guard<=0
		ProcedureReturn broken
	Else
		*p\guardFreeze=PLAYER_GUARD_BASE
	EndIf
	ProcedureReturn #False
EndProcedure

;------ UI
Procedure UIBarDisplay(type.i,x.i,y.i,value.d,max.d,baseColor.i,baseColorIntensity.i,fillColor.i,flipped.i=#False,justFill.i=#False,opacity.i=255,pendingDamage.d=0)
	Protected starter.i
	Protected middle.i
	Protected ender.i
	Protected size.i
	Protected middleScale.d
	Protected widthScale.d
	Protected nbChunk.i
	Select type
		Case #H2H_UI_BAR_TYPE_HP
			scale.d=1
			nbChunk=10
			If screenSizeX<1300
				;scale=0.5
				nbChunk=5
			EndIf
			If max<1
				max=1
			EndIf
			nbMiddle.i=nbChunk-2
			chunkScale.d=1.0/nbChunk
			starter=#H2H_ICON_BAR_START
			middle=#H2H_ICON_BAR_MIDDLE
			ender=#H2H_ICON_BAR_END
; 			fillStarter=#H2H_ICON_FILL_START
; 			fillEnder=#H2H_ICON_FILL_END
			widthScale=value/PLAYER_HP_BASE
; 			If widthScale>1
; 				widthScale+0.18*scale
; 			EndIf
; 			widthScale=min(#H2H_PLAYER_HP_BASE,value)/#H2H_PLAYER_HP_BASE
; 			middleScale.d=widthScale
; 			If middleScale>1-chunkScale
; 				middleScale=1-chunkScale
; 			EndIf
; 			middleScale-chunkScale
			size=64
		Case #H2H_UI_BAR_TYPE_GUARD
			scale.d=0.5
			If PLAYER_GUARD_PER_WEIGHT>0
				nbChunk=2+(max-PLAYER_GUARD_BASE)/PLAYER_GUARD_PER_WEIGHT
			Else
				nbChunk=2+(max-PLAYER_GUARD_BASE)/#H2H_PLAYER_GUARD_PER_WEIGHT
			EndIf
			If screenSizeX<1300
				scale=0.375
			EndIf
			If max<1
				max=1
			EndIf
			nbMiddle.i=nbChunk-1
			chunkScale.d=1.0/nbChunk
			starter=#H2H_ICON_BAR_START
			middle=#H2H_ICON_GUARD_MIDDLE
			ender=#H2H_ICON_BAR_END
			widthScale=value/max
			If widthScale<0
				widthScale=0
			EndIf
			size=64
		Case #H2H_UI_BAR_TYPE_STAMINA
			scale.d=0.125
 			nbChunk=max/2
			If screenSizeX<1300
				nbChunk/2
			EndIf
			nbMiddle.i=nbChunk-1
			chunkScale.d=1.0/nbChunk
			starter=#H2H_ICON_BAR_START
			middle=#H2H_ICON_BAR_MIDDLE
			ender=#H2H_ICON_BAR_END
			widthScale=value/max
			If widthScale<0
				widthScale=0
			EndIf
			size=64
	EndSelect
				
; 	selection=UISelect(fillStarter)
	If flipped
		If widthScale>0
			SpriteQuality(#PB_Sprite_NoFiltering)
			ZoomSprite(filler,128,128)
			TransformSprite(filler,0,0,128,0,128,128,0,128)
			s.d=0
			If type=#H2H_UI_BAR_TYPE_GUARD Or type=#H2H_UI_BAR_TYPE_STAMINA
				s=nbChunk*size*widthScale*scale
			EndIf
			If type=#H2H_UI_BAR_TYPE_HP
				s=(nbChunk-1)*size*widthScale*scale
			EndIf
			ZoomSprite(filler,s,size*scale*0.66)
			TransformSprite(filler,	size*scale,0,
					                s+size*scale,0,
					                s,size*scale*0.66,
					                0,size*scale*0.66)
			DisplayTransparentSprite(filler,x,y+size*scale*0.17,opacity,fillColor)
		EndIf
		If Not justFill
			If type=#H2H_UI_BAR_TYPE_GUARD Or type=#H2H_UI_BAR_TYPE_STAMINA
				UIDisplay(ender,x+size*nbChunk*scale,y,baseColor,baseColorIntensity,opacity,#True,scale)
			EndIf
			If type=#H2H_UI_BAR_TYPE_HP
				UIDisplay(ender,x+size*(nbChunk-1)*scale,y,baseColor,baseColorIntensity,opacity,#True,scale)
			EndIf
			dX.d=x
			For i=1 To nbMiddle
				dX+size*scale
				UIDisplay(middle,dX,y,baseColor,baseColorIntensity,opacity,#True,scale)
			Next
	; 		If type=#H2H_UI_BAR_TYPE_GUARD
	; 			x+size*scale
	; 		EndIf
			UIDisplay(starter,x,y,baseColor,baseColorIntensity,opacity,#True,scale)
			If type=#H2H_UI_BAR_TYPE_HP
	; 			UIDisplay(#H2H_ICON_BAR_CLIP,dX+size*scale*0.95,y,baseColor,baseColorIntensity,255,#True,scale)
	; 			UIDisplay(#H2H_ICON_BAR_HAT,dX+size*scale*1.25,y,baseColor,baseColorIntensity,255,#True,scale)
				overboard.d=pendingDamage+value-PLAYER_HP_BASE
				If overboard<=0
					pendingDamage=0
					overboard=0
				Else
					If pendingDamage<0
						pendingDamage=0
						overboard=0
					EndIf
				EndIf
				hatX=0
				If widthScale>1
					hatX=dX+size*scale*0.55+(pendingDamage/max+widthScale-1)*size*scale*(nbChunk-1)
				Else
					hatX=dX+size*scale*0.55+(overboard/max)*size*scale*(nbChunk-1)
				EndIf
				UIDisplay(#H2H_ICON_BAR_HAT,hatX,y,baseColor,baseColorIntensity,opacity,#True,scale)
			EndIf
		EndIf
	Else	
		
		; old
		;{
; 		If widthScale<chunkScale
; 			ClipSprite(iconAtlas,Mod(selection,1000),selection/1000,size*widthScale*nbChunk,size)
; 			ZoomSprite(iconAtlas,SpriteWidth(iconAtlas)*scale,size*scale)
; 			DisplayTransparentSprite(iconAtlas,x+size*(nbChunk-1)*scale+size*scale-SpriteWidth(iconAtlas),y,255,fillColor)
; 		Else
; 			ZoomSprite(iconAtlas,SpriteWidth(iconAtlas)*scale,size*scale)
; 			DisplayTransparentSprite(iconAtlas,x+size*(nbChunk-1)*scale,y,255,fillColor)
; 		EndIf
; 		
; 		
; 		If middleScale>0
; 			SpriteQuality(#PB_Sprite_NoFiltering)
; 			afftext(StrD(nbMiddle*size*middleScale*scale),x+200,y+200)
; 			ZoomSprite(filler,nbChunk*size*middleScale*scale,size*scale)
; 			DisplayTransparentSprite(filler,x+(nbChunk-1)*size*scale-SpriteWidth(filler),y,255,fillColor)
; 		EndIf
; 		selection=UISelect(fillEnder)
; 		lostScale.d=1-widthScale
; 		If lostScale<chunkScale
; 			ClipSprite(iconAtlas,Mod(selection,1000)+size*lostScale*nbChunk,selection/1000,size-size*lostScale*nbChunk,size)
; 			ZoomSprite(iconAtlas,SpriteWidth(iconAtlas)*scale,size*scale)
; 			DisplayTransparentSprite(iconAtlas,x+size*lostScale*nbChunk*scale,y,255,fillColor)
; 		EndIf
		;}
		; new
		x-size*nbChunk*scale
		If widthScale>0
			SpriteQuality(#PB_Sprite_NoFiltering)
			ZoomSprite(filler,128,128)
			TransformSprite(filler,0,0,128,0,128,128,0,128)
			s.d=0
			If type=#H2H_UI_BAR_TYPE_GUARD Or type=#H2H_UI_BAR_TYPE_STAMINA
				s=nbChunk*size*widthScale*scale
			EndIf
			If type=#H2H_UI_BAR_TYPE_HP
				s=(nbChunk-1)*size*widthScale*scale
			EndIf
			ZoomSprite(filler,s,size*scale*0.66)
			TransformSprite(filler,	-size*scale,0,
					                s-size*scale,0,
					                s,size*scale*0.66,
					                0,size*scale*0.66)
			If type=#H2H_UI_BAR_TYPE_GUARD Or type=#H2H_UI_BAR_TYPE_STAMINA
				DisplayTransparentSprite(filler,x+size*scale*widthScale+(nbChunk+1)*size*(1.0-widthScale)*scale,y+size*scale*0.17+1,opacity,fillColor)
			EndIf
			If type=#H2H_UI_BAR_TYPE_HP
				DisplayTransparentSprite(filler,x+size*scale*widthScale+nbChunk*size*(1.0-widthScale)*scale,y+size*scale*0.17+1,opacity,fillColor)
			EndIf
		EndIf
		If Not justFill
			If type=#H2H_UI_BAR_TYPE_HP
				UIDisplay(starter,x+size*(nbChunk-1)*scale,y,baseColor,baseColorIntensity,opacity,#False,scale)
			EndIf
			If type=#H2H_UI_BAR_TYPE_GUARD Or type=#H2H_UI_BAR_TYPE_STAMINA
				UIDisplay(starter,x+size*nbChunk*scale,y,baseColor,baseColorIntensity,opacity,#False,scale)
			EndIf
			dX.d=x
			For i=1 To nbMiddle
				dX+size*scale
				UIDisplay(middle,dX,y,baseColor,baseColorIntensity,opacity,#False,scale)
			Next
			UIDisplay(ender,x,y,baseColor,baseColorIntensity,opacity,#False,scale)
			If type=#H2H_UI_BAR_TYPE_HP
				; old
	; 			UIDisplay(#H2H_ICON_BAR_CLIP,x-size*scale*0.95,y,baseColor,baseColorIntensity,255,#False,scale)
	; 			If widthScale>1
	; 				UIDisplay(#H2H_ICON_BAR_HAT,x-size*scale*0.55-(widthScale-1)*size*scale*(nbChunk-1),y,baseColor,baseColorIntensity,255,#False,scale)
	; 			Else
	; 				UIDisplay(#H2H_ICON_BAR_HAT,x-size*scale*1.25,y,baseColor,baseColorIntensity,255,#False,scale)
	; 			EndIf
				; new
				overboard.d=pendingDamage+value-PLAYER_HP_BASE
				If overboard<=0
					pendingDamage=0
					overboard=0
				Else
					If pendingDamage<0
						pendingDamage=0
						overboard=0
					EndIf
				EndIf
				If widthScale>1
					UIDisplay(#H2H_ICON_BAR_HAT,x-size*scale*0.55-(pendingDamage/max+widthScale-1)*size*scale*(nbChunk-1),y,baseColor,baseColorIntensity,opacity,#False,scale)
				Else
					UIDisplay(#H2H_ICON_BAR_HAT,x-size*scale*0.55-(overboard/max)*size*scale*(nbChunk-1),y,baseColor,baseColorIntensity,opacity,#False,scale)
				EndIf
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure.i playerGetRegenMax(*p.player)
	ProcedureReturn PLAYER_REGEN_TOTAL_BASE+PLAYER_REGEN_TOTAL_INCREMENT*getStamina(*p)
EndProcedure
Macro ColorLerpEx(c1,c2,f)
	RGB(Red(c2)*f+Red(c1)*(1-f),Green(c2)*f+Green(c1)*(1-f),Blue(c2)*f+Blue(c1)*(1-f))
EndMacro
Procedure playerHUDDisplay(*p.player,flipped.i=#False)
	g=max(*p\guard,0)
	y=0
	If *p\hud\shift
		x=*p\hud\shift\x
		y+*p\hud\shift\y
		px=(Random(Abs(x)*2)-Abs(x))/2
		py=(Random(Abs(y)*2)-Abs(y))/2
	EndIf
	y+16
	If screenSizeX>1300
		y+32
	EndIf
	If screenSizeX>=1920
		y+32
	EndIf
	gX=0
	gY=y+64+6
	If screenSizeX<1300
		If flipped
			gX-72*0.375
		EndIf
	Else
		If flipped
			gX-72*0.5
		EndIf
	EndIf
	c.i=playerGetColor(*p)
	i.i=playerGetColorIntensity(*p)
	If Not isPlayerAlive(*p)
		c=colorLerp(c,#Black)
		i=(i+255)/2
	Else
		If *p\feedback>0
			l.d=1.0-1.0/*p\feedback
			If c=#H2H_STANCE_COLOR_LIGHTRED Or c=#H2H_STANCE_COLOR_RED
				c=ColorLerpEx(c,#White,l)
			Else
				c=ColorLerpEx(c,#Red,l)
			EndIf
		EndIf
	EndIf
	orangeBarColor=#Orange
	If *p\feedback>0
		If c=#H2H_STANCE_COLOR_LIGHTRED Or c=#H2H_STANCE_COLOR_RED
			orangeBarColor=RGB(255,127+min(128,*p\feedback**p\feedback**p\feedback),127+min(128,*p\feedback**p\feedback**p\feedback))
		Else
			orangeBarColor=RGB(255,max(0,128-*p\feedback**p\feedback**p\feedback),0)
		EndIf
	EndIf
	rm=playerGetRegenMax(*p)
	
	classLoadIcon(*p\class)
	If *p\class\iconSprite And IsSprite(*p\class\iconSprite)
		If screenSizeX<1300
			ZoomSprite(*p\class\iconSprite,350,350)
			If flipped
				px-125
			Else
				px+125
			EndIf
			py-125
		Else
			ZoomSprite(*p\class\iconSprite,500,500)
			If flipped
				px-175
			Else
				px+175
			EndIf
			py-175
		EndIf
		spriteFlip(*p\class\iconSprite,0)
		spriteFlip(*p\class\iconSprite,flipped)
	EndIf

	If flipped
		If *p\class\iconSprite And IsSprite(*p\class\iconSprite)
			DisplayTransparentSprite(*p\class\iconSprite,px,py)
			DisplayTransparentSprite(*p\class\iconSprite,px,py,i,c)
		EndIf
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+128,y,PLAYER_HP_BASE,PLAYER_HP_BASE,c,i,c,flipped,#True,128)
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+128,y,*p\life+*p\hud\pendingDamage,*p\maxLife,c,i,#Yellow,flipped,#True)
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+128,y,*p\life,*p\maxLife,c,i,orangeBarColor,flipped,#False,255,*p\hud\pendingDamage)
		UIBarDisplay(#H2H_UI_BAR_TYPE_GUARD,gX+x+128-12,gY-4,g,*p\maxGuard,c,i,#Orange,flipped)
		If *p\regenTotal>=playerGetRegenMax(*p)
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+128-12,gY-10,rm,rm,0,0,#Black,flipped,#True,128)
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+128-12,gY-10,rm-*p\regenTotal,rm,colorLerp(c,#Black),(i+255)/2,#Orange,flipped)
		Else
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+128-12,gY-10,rm-*p\regenTotal,rm,c,i,#Orange,flipped)
		EndIf
		If isPlayerAlive(*p)
			AfftextColor(*p\class\name+" - ",x+128+64,y-16,c,i/2,1)
			AfftextColor(*p\currentStance\name,x+128+64+AfftextGetLength(*p\class\name+" - "),y-16,c,i,1)
		Else
			AfftextColor(*p\class\name+" - "+*p\currentStance\name,x+128+64,y-16,c,i,1)
		EndIf
	Else
		If *p\class\iconSprite And IsSprite(*p\class\iconSprite)
			DisplayTransparentSprite(*p\class\iconSprite,px+screenSizeX-SpriteWidth(*p\class\iconSprite),py)
			DisplayTransparentSprite(*p\class\iconSprite,px+screenSizeX-SpriteWidth(*p\class\iconSprite),py,i,c)
		EndIf
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+screenSizeX-128,y,PLAYER_HP_BASE,PLAYER_HP_BASE,c,i,c,#False,#True,128)
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+screenSizeX-128,y,*p\life+*p\hud\pendingDamage,*p\maxLife,c,i,#Yellow,#False,#True)
		UIBarDisplay(#H2H_UI_BAR_TYPE_HP,x+screenSizeX-128,y,*p\life,*p\maxLife,c,i,orangeBarColor,#False,#False,255,*p\hud\pendingDamage)
		UIBarDisplay(#H2H_UI_BAR_TYPE_GUARD,gX+x+screenSizeX-128+20,gY-4,g,*p\maxGuard,c,i,#Orange)
		If *p\regenTotal>=playerGetRegenMax(*p)
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+screenSizeX-128+8,gY-10,rm,rm,0,0,#Black,#False,#True,128)
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+screenSizeX-128+8,gY-10,rm-*p\regenTotal,rm,colorLerp(c,#Black),(i+255)/2,#Orange)
		Else
			UIBarDisplay(#H2H_UI_BAR_TYPE_STAMINA,x+screenSizeX-128+8,gY-10,rm-*p\regenTotal,rm,c,i,#Orange)
		EndIf
		If isPlayerAlive(*p)
			AfftextColor(" - "+*p\class\name,x+screenSizeX-128-20-AfftextGetLength(" - "+*p\class\name)-64,y-16,c,i/2,1)
			AfftextColor(*p\currentStance\name,x+screenSizeX-128-20-AfftextGetLength(*p\class\name+" - "+*p\currentStance\name)-64,y-16,c,i,1)
		Else
			AfftextColor(*p\currentStance\name+" - "+*p\class\name,x+screenSizeX-128-20-AfftextGetLength(*p\class\name+" - "+*p\currentStance\name)-64,y-16,c,i,1)
		EndIf
	EndIf
	If *p\class\iconSprite And IsSprite(*p\class\iconSprite)
		ZoomSprite(*p\class\iconSprite,#PB_Default,#PB_Default)
	EndIf
EndProcedure

; shadow sprite & hitboxSprite global moved before initBasicSprite()
Procedure createHitBoxSprite()
	If Not hitBoxSprite
		hitBoxSprite=spriteIndex
		spriteIndex=spriteIndex+1
	EndIf
	If Not IsSprite(hitBoxSprite)
			CreateSprite(hitBoxSprite,#HITBOX_SIZE,#HITBOX_SIZE,#PB_Sprite_PixelCollision)
		If StartDrawing(SpriteOutput(hitBoxSprite))=0
			End
		EndIf
		Circle(#HITBOX_SIZE/2,#HITBOX_SIZE/2,#HITBOX_SIZE/2,RGB(255,0,0))
		StopDrawing()
	EndIf
	ProcedureReturn hitBoxSprite
EndProcedure

Procedure createShadowSprite()
	If shadowSprite=0
		shadowSprite=spriteIndex
		spriteIndex+1
	EndIf
	If Not IsSprite(shadowSprite)
		CreateSprite(shadowSprite,#H2H_SHADOW_WIDTH,#H2H_SHADOW_HEIGHT)
		If StartDrawing(SpriteOutput(shadowSprite))=0
			End
		EndIf
		DrawingMode(#PB_2DDrawing_AllChannels)
		For i=2 To 10
			Ellipse(#H2H_SHADOW_WIDTH/2,#H2H_SHADOW_HEIGHT/2,#H2H_SHADOW_WIDTH/i,#H2H_SHADOW_HEIGHT/i,RGBA(21-i*2,21-i*2,21-i*2,128-i*10))
		Next
		StopDrawing()
	EndIf
	ProcedureReturn shadowSprite
EndProcedure

Declare playerSetClass(*p.player,*newClass.class,stanceId.i)
Procedure createPlayer(*p.player,name.s,color.i,*control.control,*newClass.class,mirror=0)
	Static idCount.i=0
	If Not *p
		*p=AllocateStructure(player)
	EndIf
	*p\id=idCount
	idCount=idCount+1
	*p\name=name
	*p\frameIndicator=0
	set(*p\position)
	set(*p\deltaMovement)
	set(*p\deltaAttack)
	; Hitbox creation
	*p\hitbox=createHitBoxSprite()
	createShadowSprite()
	*p\attacking=0
	*p\color=color
	*p\keyboardControl=*control
 	*p\pushed=controlcreate() ; still in use for joystick until future update
	*p\joystickControl=controlcreate()
	*p\controlState=controlStateCreate()
	*p\currentAnimation=AllocateStructure(animation)
	*p\direction=0
	*p\displayDebug=-1
	NewList *p\hit.i()
	*p\comboCount=0
	For i=0 To 4
		*p\comboSize[i]=1
	Next
; 	*p\hpb=hpBarCreate(0,*p,mirror)
; 	initHpBar(*p)
; 	*p\hpb\who=*p
	*p\hud=AllocateStructure(HUD)
	ClearStructure(*p\hud,HUD)
	*p\hud\who=*p
; 	hpBarFitToScreen(*p\hpb,mirror)
	gravity=0
	*p\isAI=0
	playerSetClass(*p,*newClass,0)
	*p\joystickId=-1
	*p\hitMode=-1
	*p\tmpHitMode=-1
	*p\controlEnabled=#True
	ReDim *p\joystickMap(32)
	ProcedureReturn *p
EndProcedure
Declare resetLife(*p.player)
Declare playerSetStance(*p.player,what.i=0)

Procedure playerSetClass(*p.player,*newClass.class,stanceId.i)
	If Not *p
		ProcedureReturn
	EndIf
	If Not *newClass
		ProcedureReturn
	EndIf
	If *p\class
		*p\class\playerCount-1
	EndIf
	If *p\class<>*newClass
		*p\class=*newClass
		*p\class\playerCount+1
		animationCopy(*p\currentAnimation,playerGetIdle(*p))
	EndIf
	playerSetStance(*p,stanceId)
	resetLife(*p)
	playerGuardSet(*p)
	*p\gravity=1
EndProcedure

Procedure movePlayer(*p.player,newX.f,newY.f)
	set(*p\position,newX,newY)
EndProcedure

Macro playerHasPressed(p,what)
	Bool(p\controlEnabled And (controlHasPressed(p\keyboardControl,what) Or p\pushed\what))
EndMacro
Macro playerHasJustPressed(p,what)
	Bool(p\controlEnabled And (controlJustPressed(p\keyboardControl,what) Or p\pushed\what=1))
EndMacro
Macro playerHasReleased(p,what)
	Bool(p\controlEnabled And (controlHasReleased(p\keyboardControl,what) Or p\pushed\what))
EndMacro

Procedure.i playerHasCommand(*p.player,command.i,justPressed.i=#False)
	If justPressed
		Select command
			Case #H2H_CONTROL_LEFT
				ProcedureReturn Bool(playerHasJustPressed(*p,left))
			Case #H2H_CONTROL_RIGHT
				ProcedureReturn Bool(playerHasJustPressed(*p,right))
			Case #H2H_CONTROL_UP
				ProcedureReturn Bool(playerHasJustPressed(*p,up))
			Case #H2H_CONTROL_DOWN
				ProcedureReturn Bool(playerHasJustPressed(*p,down))
			Case #H2H_CONTROL_ATTACK
				ProcedureReturn Bool(playerHasJustPressed(*p,attack))
			Case #H2H_CONTROL_HEAVY
				ProcedureReturn Bool(playerHasJustPressed(*p,heavy))
			Case #H2H_CONTROL_SPECIAL
				ProcedureReturn Bool(playerHasJustPressed(*p,special))
			Case #H2H_CONTROL_NEUTRAL
				ProcedureReturn Bool(playerHasJustPressed(*p,neutral) Or (playerHasJustPressed(*p,attack) And Not playerHasJustPressed(*p,left) And Not playerHasJustPressed(*p,right) And Not playerHasJustPressed(*p,up) And Not playerHasJustPressed(*p,down)))
			Case #H2H_CONTROL_ATTACK_SIDE
				ProcedureReturn Bool(playerHasJustPressed(*p,attackSide) Or (playerHasJustPressed(*p,attack) And ((Not *p\lockedDirection And playerHasJustPressed(*p,left)) Or (*p\lockedDirection And playerHasJustPressed(*p,right)))))
			Case #H2H_CONTROL_ATTACK_BACK
				ProcedureReturn Bool(playerHasJustPressed(*p,attackBack) Or (playerHasJustPressed(*p,attack) And ((*p\lockedDirection And playerHasJustPressed(*p,left)) Or (Not *p\lockedDirection And playerHasJustPressed(*p,right)))))
			Case #H2H_CONTROL_ATTACK_UP
				ProcedureReturn Bool(playerHasJustPressed(*p,attackUp) Or (playerHasJustPressed(*p,attack) And playerHasJustPressed(*p,up)))
			Case #H2H_CONTROL_ATTACK_DOWN
				ProcedureReturn Bool(playerHasJustPressed(*p,attackDown) Or (playerHasJustPressed(*p,attack) And playerHasJustPressed(*p,down)))
			Case #H2H_CONTROL_DODGE
				ProcedureReturn Bool(playerHasJustPressed(*p,special) And Not playerHasJustPressed(*p,left) And Not playerHasJustPressed(*p,right) And Not playerHasJustPressed(*p,up) And Not playerHasJustPressed(*p,down))
			Case #H2H_CONTROL_JUMP
				ProcedureReturn Bool(playerHasJustPressed(*p,jump) Or (playerHasJustPressed(*p,special) And playerHasJustPressed(*p,up)))
			Case #H2H_CONTROL_BLOCK
				ProcedureReturn Bool(playerHasJustPressed(*p,block) Or (playerHasJustPressed(*p,special) And playerHasJustPressed(*p,down))); And Not playerHasPressed(*p,left) And Not playerHasPressed(*p,right) And Not playerHasPressed(*p,up))
			Case #H2H_CONTROL_DASH_LEFT
				ProcedureReturn Bool(playerHasJustPressed(*p,dashLeft) Or (playerHasJustPressed(*p,special) And playerHasJustPressed(*p,left)))
			Case #H2H_CONTROL_DASH_RIGHT
				ProcedureReturn Bool(playerHasJustPressed(*p,dashRight) Or (playerHasJustPressed(*p,special) And playerHasJustPressed(*p,right)))
			Case #H2H_CONTROL_ACCEPT
				ProcedureReturn Bool(playerHasJustPressed(*p,accept))
			Case #H2H_CONTROL_CANCEL
				ProcedureReturn Bool(playerHasJustPressed(*p,cancel))
			Case #H2H_CONTROL_EXIT
				ProcedureReturn Bool(playerHasJustPressed(*p,exit))
		EndSelect
	Else
		Select command
			Case #H2H_CONTROL_LEFT
				ProcedureReturn Bool(playerHasPressed(*p,left))
			Case #H2H_CONTROL_RIGHT
				ProcedureReturn Bool(playerHasPressed(*p,right))
			Case #H2H_CONTROL_UP
				ProcedureReturn Bool(playerHasPressed(*p,up))
			Case #H2H_CONTROL_DOWN
				ProcedureReturn Bool(playerHasPressed(*p,down))
			Case #H2H_CONTROL_ATTACK
				ProcedureReturn Bool(playerHasPressed(*p,attack))
			Case #H2H_CONTROL_HEAVY
				ProcedureReturn Bool(playerHasPressed(*p,heavy))
			Case #H2H_CONTROL_SPECIAL
				ProcedureReturn Bool(playerHasPressed(*p,special))
			Case #H2H_CONTROL_NEUTRAL
				ProcedureReturn Bool(playerHasPressed(*p,neutral) Or (playerHasPressed(*p,attack) And Not playerHasPressed(*p,left) And Not playerHasPressed(*p,right) And Not playerHasPressed(*p,up) And Not playerHasPressed(*p,down)))
			Case #H2H_CONTROL_ATTACK_SIDE
				ProcedureReturn Bool(playerHasPressed(*p,attackSide) Or (playerHasPressed(*p,attack) And ((Not *p\lockedDirection And playerHasPressed(*p,left)) Or (*p\lockedDirection And playerHasPressed(*p,right)))))
			Case #H2H_CONTROL_ATTACK_BACK
				ProcedureReturn Bool(playerHasPressed(*p,attackBack) Or (playerHasPressed(*p,attack) And ((*p\lockedDirection And playerHasPressed(*p,left)) Or (Not *p\lockedDirection And playerHasPressed(*p,right)))))
			Case #H2H_CONTROL_ATTACK_UP
				ProcedureReturn Bool(playerHasPressed(*p,attackUp) Or (playerHasPressed(*p,attack) And playerHasPressed(*p,up)))
			Case #H2H_CONTROL_ATTACK_DOWN
				ProcedureReturn Bool(playerHasPressed(*p,attackDown) Or (playerHasPressed(*p,attack) And playerHasPressed(*p,down)))
			Case #H2H_CONTROL_DODGE
				ProcedureReturn Bool(playerHasPressed(*p,special) And Not playerHasPressed(*p,left) And Not playerHasPressed(*p,right) And Not playerHasPressed(*p,up) And Not playerHasPressed(*p,down))
			Case #H2H_CONTROL_JUMP
				ProcedureReturn Bool(playerHasPressed(*p,jump) Or (playerHasPressed(*p,special) And playerHasPressed(*p,up)))
			Case #H2H_CONTROL_BLOCK
				ProcedureReturn Bool(playerHasPressed(*p,block) Or (playerHasPressed(*p,special) And playerHasPressed(*p,down))); And Not playerHasPressed(*p,left) And Not playerHasPressed(*p,right) And Not playerHasPressed(*p,up))
			Case #H2H_CONTROL_DASH_LEFT
				ProcedureReturn Bool(playerHasPressed(*p,dashLeft) Or (playerHasPressed(*p,special) And playerHasPressed(*p,left)))
			Case #H2H_CONTROL_DASH_RIGHT
				ProcedureReturn Bool(playerHasPressed(*p,dashRight) Or (playerHasPressed(*p,special) And playerHasPressed(*p,right)))
			Case #H2H_CONTROL_ACCEPT
				ProcedureReturn Bool(playerHasPressed(*p,accept))
			Case #H2H_CONTROL_CANCEL
				ProcedureReturn Bool(playerHasPressed(*p,cancel))
			Case #H2H_CONTROL_EXIT
				ProcedureReturn Bool(playerHasPressed(*p,exit))
		EndSelect
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure checkPlayerKey(*p.player,inBattle=#False)
	If *p\joystickId=-1
		ProcedureReturn
	EndIf
	id=*p\joystickId	
	If ExamineJoystick(id)
		*c.control=*p\joystickControl
		;{
		j=Bool(JoystickButtonEx(id,*c\attack))
		*p\pushed\attack+j
		*p\pushed\attack*j
		j=Bool(JoystickAxisXEx(id,0)<-0.5)
		*p\pushed\left+j
		*p\pushed\left*j
		j=Bool(JoystickAxisXEx(id,0)>0.5)
		*p\pushed\right+j
		*p\pushed\right*j
		j=Bool(JoystickAxisYEx(id,0)<-0.5)
		*p\pushed\up+j
		*p\pushed\up*j
		j=Bool(JoystickAxisYEx(id,0)>0.5)
		*p\pushed\down+j
		*p\pushed\down*j
		j=JoystickButtonEx(id,*c\heavy)
		*p\pushed\heavy+j
		*p\pushed\heavy*j
		j=JoystickButtonEx(id,*c\special)
		*p\pushed\special+j
		*p\pushed\special*j
		If JoystickButtonEx(id,*c\neutral)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral+1
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\jump=0
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\neutral=0
		EndIf
		If JoystickButtonEx(id,*c\attackSide)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide+1
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\jump=0
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\attackSide=0
		EndIf
		If JoystickButtonEx(id,*c\attackBack)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack+1
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\jump=0
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\attackBack=0
		EndIf
		If JoystickButtonEx(id,*c\attackUp)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp+1
			*p\pushed\attackDown=0
			*p\pushed\jump=0
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\attackUp=0
		EndIf
		If JoystickButtonEx(id,*c\attackDown)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown+1
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\attackDown=0
		EndIf
		*p\pushed\jump=Bool(JoystickButtonEx(id,*c\jump) Or (*p\jumpWithUp And inBattle And *p\pushed\up=1) Or (Not *p\pushed\attack And Not *p\pushed\heavy And *p\pushed\special And *p\pushed\up And Not *p\pushed\right And Not *p\pushed\left And Not *p\pushed\down))
		If JoystickButtonEx(id,*c\block)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\block+1
			*p\pushed\dashLeft=0
			*p\pushed\dashRight=0
		Else
			*p\pushed\block=0
		EndIf
		If JoystickButtonEx(id,*c\dashLeft)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\block=0
			*p\pushed\dashLeft+1
			*p\pushed\dashRight=0
		Else
			*p\pushed\dashLeft=0
		EndIf
		If JoystickButtonEx(id,*c\dashRight)
			*p\pushed\attack=0
			*p\pushed\heavy=0
			*p\pushed\special=0
			*p\pushed\neutral=0
			*p\pushed\attackSide=0
			*p\pushed\attackBack=0
			*p\pushed\attackUp=0
			*p\pushed\attackDown=0
			*p\pushed\block=0
			*p\pushed\dashLeft=0
			*p\pushed\dashRight+1
		Else
			*p\pushed\dashRight=0
		EndIf
		If JoystickButtonEx(id,*c\accept)
			*p\pushed\accept+1
			*p\pushed\cancel=0
			*p\pushed\exit=0
		Else
			*p\pushed\accept=0
		EndIf
		If JoystickButtonEx(id,*c\cancel)
			*p\pushed\accept=0
			*p\pushed\cancel+1
			*p\pushed\exit=0
		Else
			*p\pushed\cancel=0
		EndIf
		If JoystickButtonEx(id,*c\exit)
			*p\pushed\accept=0
			*p\pushed\cancel=0
			*p\pushed\exit+1
		Else
			*p\pushed\exit=0
		EndIf
		;}
	EndIf
EndProcedure

Procedure.i getComboId(*p.player)
	Select *p\currentAnimation\animationType
		Case #H2H_ANIMATIONTYPE_NEUTRAL
			ProcedureReturn #H2H_COMBO_NEUTRAL
		Case #H2H_ANIMATIONTYPE_NSIDE
			ProcedureReturn #H2H_COMBO_NSIDE
		Case #H2H_ANIMATIONTYPE_NUP
			ProcedureReturn #H2H_COMBO_NUP
		Case #H2H_ANIMATIONTYPE_NBACK
			ProcedureReturn #H2H_COMBO_NBACK
		Case #H2H_ANIMATIONTYPE_NDOWN
			ProcedureReturn #H2H_COMBO_NDOWN
		Case #H2H_ANIMATIONTYPE_HEAVY
			ProcedureReturn #H2H_COMBO_HEAVY
	EndSelect
	Debug "unkown combo id !"
	ProcedureReturn 0
EndProcedure

Procedure cleanPlayerKey(*p.player)
	controlClear(*p\pushed)
	*p\controlState\jump=0
	*p\controlState\keep=0
	*p\controlState\pushed=0
EndProcedure

; Macro refreshPlayerKeySub(p,what,steps)
; 	p\pushed\what-steps
; 	If p\pushed\what<0
; 		p\pushed\what=0
; 	EndIf
; EndMacro
	
; Procedure refreshPlayerKey(*p.player,steps.i=1)
; 	refreshPlayerKeySub(*p,right,steps)
; 	refreshPlayerKeySub(*p,left,steps)
; 	refreshPlayerKeySub(*p,up,steps)
; 	refreshPlayerKeySub(*p,down,steps)
; 	refreshPlayerKeySub(*p,attack,steps)
; 	refreshPlayerKeySub(*p,heavy,steps)
; 	refreshPlayerKeySub(*p,special,steps)
; 	refreshPlayerKeySub(*p,neutral,steps)
; 	refreshPlayerKeySub(*p,attackSide,steps)
; 	refreshPlayerKeySub(*p,attackBack,steps)
; 	refreshPlayerKeySub(*p,attackUp,steps)
; 	refreshPlayerKeySub(*p,attackDown,steps)
; 	refreshPlayerKeySub(*p,jump,steps)
; 	refreshPlayerKeySub(*p,block,steps)
; 	refreshPlayerKeySub(*p,dashRight,steps)
; 	refreshPlayerKeySub(*p,dashLeft,steps)
; EndProcedure

Macro playerAnimationIndex(p)
	animationIndex(p\currentAnimation)
EndMacro

Macro playerCurrentFrame(p)
	p\currentFrame
EndMacro

Procedure playerApplyMovement(*p.player)
	If *p\currentFrame\movement
		If *p\lockedDirection
			locationAdd(*p\position,-*p\currentFrame\movement\x,*p\currentFrame\movement\y)
		Else
			locationAdd(*p\position,*p\currentFrame\movement\x, *p\currentFrame\movement\y)
		EndIf
		*p\hasMoved=1
	EndIf
EndProcedure

Declare playerResetAnimationTo(*who.player,*what.animation)

Procedure.f playerRecoveryCompute(*p.player)
	ProcedureReturn *p\currentAnimation\recovery/(1+getAgility(*p)/10.0)
EndProcedure

Procedure.i playerRecovery(*p.player)
	;	Protected rec=(*p\currentAnimation\recovery*10)/(10+getAgility(*p)*3) ; old formula
	Protected rec.f=playerRecoveryCompute(*p)
	If rec>0
		playerResetAnimationTo(*p,playerGetIdle(*p))
		*p\recovery+rec
	EndIf
	ProcedureReturn rec
EndProcedure

Procedure playerDisplayClassIconCrop(*p.player,x.i,y.i,mirror.i=0,color=0,intensity.i=128)
	If *p
		If *p\class
			classDisplayIconCroped(*p\class,x,y,mirror,color,intensity,255,RGB(32,32,32))
; 			If *p\hpb\redInertia>0
; 				If IsSprite(*p\class\iconCroped)
; 					DisplayTransparentSprite(*p\class\iconCroped,x,y,*p\hpb\redInertia/2,RGB(255,0,0))
; 				EndIf
; 			EndIf
		EndIf
	EndIf
EndProcedure

Procedure resetCombo(*p.player)
	For i=0 To #H2H_COMBO_MAX-1
		*p\comboHit[i]=0
	Next
	*p\comboCount=0
EndProcedure

Procedure resetLife(*p.player)
	*p\maxLife=PLAYER_HP_BASE+getLife(*p)*PLAYER_HP_BONUS
	*p\life=*p\maxLife
	*p\regenTotal=0
EndProcedure

Procedure resetPlayer(*p.player,x.i)
	If *p
		set(*p\position,x,#GROUND_LEVEL)
		set(*p\deltaAttack)
		set(*p\deltaMovement)
		set(*p\deltaPush)
		If Not *p\currentAnimation
			*p\currentAnimation=AllocateStructure(animation)
		EndIf
		playerResetAnimationTo(*p,playerGetSpawn(*p))
		resetLife(*p)
		*p\feedback=0
		classLoadIconCroped(*p\class)
		resetCombo(*p)
		cleanPlayerKey(*p)
		*p\gravity=1
		*p\attacking=0
		*p\controlState\jump=0
		*p\controlState\keep=0
		*p\controlState\pushed=0
	EndIf
EndProcedure

Macro getDodgeMin(p)
	(PLAYER_DODGE_MARGIN-getAgility(p))
EndMacro

Macro getDodgeMax(p)
	(PLAYER_DODGE_BASE-max(getDodgeMin(p),0))
EndMacro

Macro isDodgeActive(p)
	(p\dodge>getDodgeMin(p) And p\dodge<getDodgeMax(p))
EndMacro

Macro getDodgeReload(p)
	(PLAYER_DODGE_BASE-getAgility(p)*4)
EndMacro
	
#H2H_PLAYER_SPEED_RELOAD_BASE=15
Macro playerJumpReload(p)
	p\jumpReload=#H2H_PLAYER_SPEED_RELOAD_BASE-getspeed(p)-getAgility(p)+max(0,GetWeight(p)*2-getStrength(p))*4
EndMacro

Global *emptyAnimation.animation=animationCreate(0,0,0,0,"empty")

Procedure getPlayerAnimationType(*who.player)
	If *who And *who\currentAnimation
		ProcedureReturn *who\currentAnimation\animationType
	EndIf
	ProcedureReturn -1
EndProcedure

Macro isPlayerAnimationType(p,type)
	Bool(getPlayerAnimationType(p)=type)
EndMacro

Macro clearPlayerFrames(p)
	classClearFrames(p\class)
EndMacro

Declare playerStickToGround(*p.player,*b.background)
Procedure playerResetAnimationTo(*who.player,*what.animation)
	If *who
		If Not *what
			*what=playerGetIdle(*who)
		EndIf
		animationCopy(*who\currentAnimation,*what)
		animationInit(*who\currentAnimation)
		*who\currentFrame=*who\currentAnimation\frames(0)
		*who\spawnedWind=#False
		*who\spawnedProjectile=#False
		*who\frameIndicator=0
		*what\index=0
		*who\haveHitSomeone=0
		If isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_IDLE) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_JUMP) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_LAND) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_DEATH) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_SPAWN) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_BACK)
			*who\hasMoved=0
		EndIf
		
		If Not animationIsUngrounded(*who\currentAnimation)
			If *who\position\y>groundLevel And Not isPlayerAnimationType(*who,#H2H_ANIMATIONTYPE_JUMP)
				*who\position\y=groundLevel
			EndIf
		EndIf
		If *who\blocked<=0 And *who\currentFrame\movement
			playerApplyMovement(*who)
		EndIf
	EndIf
EndProcedure


; Stick the player against one of the terrain border if outside
; Returns 1 if collision with left border
; Returns 2 if collision with right border
Procedure.i playerBorderCheck(*p.player,*b.background)
	If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_SPAWN)
		If *p\lockedDirection
			If *p\position\x<-#HITBOX_BACKSHIFT_X+*b\leftLimit
				*p\position\x=-#HITBOX_BACKSHIFT_X+*b\leftLimit
				ProcedureReturn 1
			Else
				If *p\position\x>*b\rightLimit-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)
					*p\position\x=*b\rightLimit-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)
					ProcedureReturn 2
				EndIf
			EndIf
		Else
			If *p\position\x<-#HITBOX_SHIFT_X+*b\leftLimit
				*p\position\x=-#HITBOX_SHIFT_X+*b\leftLimit
				ProcedureReturn 1
			Else
				If *p\position\x>*b\rightLimit-(#HITBOX_SHIFT_X+#HITBOX_SIZE)
					*p\position\x=*b\rightLimit-(#HITBOX_SHIFT_X+#HITBOX_SIZE)
					ProcedureReturn 2
				EndIf
			EndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure playerGetPushPower(*pusher.player)
	Protected pusherForce=0
	; TODO detect landing animation
	If Not isPlayerAnimationType(*pusher,#H2H_ANIMATIONTYPE_BACK)
		pusherForce=getStrength(*pusher)
	EndIf
	
	; new
	If isPlayerAnimationType(*pusher,#H2H_ANIMATIONTYPE_FRONT)
		pusherForce*2
	EndIf
	If getStrength(*pusher)>GetWeight(*pusher)
		pusherForce+(getStrength(*pusher)-GetWeight(*pusher))
	EndIf
	ProcedureReturn pusherForce
EndProcedure

Procedure.f playerGetJumpPower(*p.player)
	Protected weight.f=(getStrength(*p)-GetWeight(*p))*3
	If weight>0
		weight=0
	EndIf
	weight=Abs(weight)
	power.f=-30+weight
	k.f=5
	speed=getSpeed(*p)-1
	For i=0 To speed
		power-k
		If power<-30
			k-0.75
			If k<1
				k=1
			EndIf
		EndIf
	Next
	ProcedureReturn power
EndProcedure

Procedure playerLandEffectSpawn(*p.player,white.i=#False)
	*g.animationgadget
	*g2.animationgadget
	If GetWeight(*p)>3
		*g=gadgetSpawnEffect(*landHeavyFront(Random(ArraySize(*landHeavyFront()))),*p\position,#H2H_GADGET_LAYER_FRONT,*p\lockedDirection)
		*g2=gadgetSpawnEffect(*landHeavyBack(Random(ArraySize(*landHeavyBack()))),*p\position,#H2H_GADGET_LAYER_BACK,*p\lockedDirection)
	Else
		*g=gadgetSpawnEffect(*landLightFront(Random(ArraySize(*landLightFront()))),*p\position,#H2H_GADGET_LAYER_FRONT,*p\lockedDirection)
		*g2=gadgetSpawnEffect(*landLightBack(Random(ArraySize(*landLightBack()))),*p\position,#H2H_GADGET_LAYER_BACK,*p\lockedDirection)
	EndIf
	*g\color=playerGetColor(*p)
	*g\colorIntensity=playerGetColorIntensity(*p)/1.5
	If Not white
		*g\colorIntensity/1.5
		;*g\color=colorLerp(*g\color,#White)
	EndIf
	*g2\color=*g\color
	*g2\colorIntensity=*g\colorIntensity
EndProcedure
Procedure playerLand(*p.player,*b.background)
	If Abs(*p\deltaMovement\y)<20
		playerResetAnimationTo(*p,playerGetIdle(*p))
	Else		
		playerJumpReload(*p)
		playerLandEffectSpawn(*p,*b\white)
		playerShakeGround(*p)
		If GetWeight(*p)>3
			psound(#H2H_SOUND_ID_HAND_LAND,*p\screenPosition\x+#HITBOX_SHIFT_X+#HITBOX_SIZE/2,40+GetWeight(*p)*10)
		Else
			psound(#H2H_SOUND_ID_HAND_FALL,*p\screenPosition\x+#HITBOX_SHIFT_X+#HITBOX_SIZE/2,70+GetWeight(*p)*10)
		EndIf
		If playerGetLand(*p)
			playerResetAnimationTo(*p,playerGetLand(*p))
		Else
			playerResetAnimationTo(*p,playerGetIdle(*p))
			Debug "No land animation !"
		EndIf
	EndIf
EndProcedure
Procedure playerGetHitBoxX(*p.player)
	If *p\lockedDirection
		ProcedureReturn *p\position\x+#HITBOX_BACKSHIFT_X
	EndIf
	ProcedureReturn *p\position\x+#HITBOX_SHIFT_X
EndProcedure

Macro playerGetHitBoxCenterX(p)
	(playerGetHitBoxX(p)+#HITBOX_SIZE/2)
EndMacro

Macro playerGetHitBoxY(p)
	(p\position\y+#HITBOX_SHIFT_Y)
EndMacro

Macro playerGetHitBoxCenterY(p)
	(playerGetHitBoxY(p)+#HITBOX_SIZE/2)
EndMacro

Procedure playerDistanceHitBox(*p1.player,*p2.player)	
	Static l1.location
	set(l1,playerGetHitBoxCenterX(*p1),playerGetHitBoxCenterY(*p1))
	Static l2.location
	set(l2,playerGetHitBoxCenterX(*p2),playerGetHitBoxCenterY(*p2))
	ProcedureReturn locationDistance(l1,l2)
EndProcedure

Procedure playerPush(*pusher.player,*pushed.player,*b.background,delta.f=1)
	If Not isPlayerAlive(*pusher) Or Not isPlayerAlive(*pushed) Or *pusher\attacking Or *pushed\attacking ;Or Not isPlayerAnimationType(*pusher,#H2H_ANIMATIONTYPE_FRONT)
		ProcedureReturn
	EndIf
	; TODO 2D push with angle
	;angle.f=locationAngle(*pusher\position,*pushed\position)
	If playerDistanceHitBox(*pusher,*pushed)<#HITBOX_SIZE
		pusherForce.f=playerGetPushPower(*pusher)-GetWeight(*pushed)
		pushedForce.f=playerGetPushPower(*pushed)-GetWeight(*pusher)
		powerDifference=pusherForce-pushedForce
; 		Debug "power difference "+pusherForce+" vs "+pushedForce+" :"+powerDifference
		If powerDifference<0
; 			Debug "swap"
			powerDifference=-powerDifference
			Swap pushedForce, pusherForce
			Swap *pusher, *pushed
		EndIf
		If pushedForce<0
			pusherForce-pushedForce
			pushedForce=0
		EndIf
; 		Debug "it is now "+pusherForce+" vs "+pushedForce
		factor.f=1
		If powerDifference=0
			factor=0.5
		Else
			factor=pusherForce/(pusherForce+pushedForce)
		EndIf
		dist.f=Abs(playerGetHitBoxCenterX(*pusher)-playerGetHitBoxCenterX(*pushed))-#HITBOX_SIZE
; 		Debug "das push, distance is now "+dist
		If dist<0
			dist=-dist
			If *pusher\position\x>*pushed\position\x
				; Pusher is left to pushed
				*pushed\position\x-dist*factor
				*pusher\position\x+dist*(1-factor)
			Else
				*pushed\position\x+dist*factor
				*pusher\position\x-dist*(1-factor)
			EndIf
		EndIf
		If playerBorderCheck(*pushed,*b)
			If *pusher\position\x>*pushed\position\x
				; Pusher is left to pushed
				*pusher\position\x=*pushed\position\x
				*pusher\position\x+playerDistanceHitBox(*pusher,*pushed)
			Else
				*pusher\position\x=*pushed\position\x
				*pusher\position\x-playerDistanceHitBox(*pusher,*pushed)
			EndIf
		EndIf
 	EndIf
 EndProcedure

#H2H_MOVEMENT_SPEED_BASE=15
#H2H_MOVEMENT_SPEED_MULTIPLICATOR=3
Procedure playerGetMovementSpeed(*p.player)
	ProcedureReturn #H2H_MOVEMENT_SPEED_BASE+getSpeed(*p)*#H2H_MOVEMENT_SPEED_MULTIPLICATOR-max(GetWeight(*p)-getStrength(*p))
EndProcedure


Macro playerCanDoNext(p)
	Bool(animationCanDoNext(p\currentAnimation,p\frameIndicator-1))
EndMacro

Procedure playerSpawnWind(*p.player,*b.background=0)
	If Not *p\spawnedWind
		If frameWindNeedCatch(*p\currentAnimation\frames(*p\currentAnimation\index))
			If *p\haveHitSomeone
				animationSpawnWind(*p\currentAnimation,*p\position,*p\lockedDirection,playerGetColor(*p),255,playerGetColorIntensity(*p),*b\white)
			EndIf
		Else
			animationSpawnWind(*p\currentAnimation,*p\position,*p\lockedDirection,playerGetColor(*p),255,playerGetColorIntensity(*p),*b\white)
			*p\spawnedWind=#True
		EndIf
	EndIf
EndProcedure

Declare damageGadgetCreate(*who.player,*whatRef.animation,*whatAnimation.animation,x.i,y.i,*b.background)

Procedure playerSpawnProjectile(*p.player,*b.background=0)
	If Not *p\spawnedProjectile
		If *p\currentAnimation\projectiles()
			For p=0 To ArraySize(*p\currentAnimation\projectiles(),2)
				damageGadgetCreate(*p,*p\currentAnimation,*p\currentAnimation\projectiles(*p\currentAnimation\index,p),*p\position\x,*p\position\y,*b)
			Next
		EndIf
		*p\spawnedProjectile=#True
	EndIf
EndProcedure

Macro playerSelectIdle(p)
	playerResetAnimationTo(p,classSelectIdle(p\class))
EndMacro

#H2H_PLAYER_CAN_MOVE_AT_CANDONEXT=#True
Procedure playerStickToGround(*p.player,*b.background)
	If *p\position\y>=groundLevel
		*p\controlState\jump=0
		*p\gravity=0
		*p\deltaPush\y=0
		If Not *p\attacking
			If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_SPAWN) And Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_DEATH)
				If *p\position\y>groundLevel Or Not *p\landed
; 					Debug "land 3"
; 					Debug *p\deltaMovement\y
; 					set(*p\deltaAttack)
					*p\deltaAttack\y=0
					playerLand(*p,*b)
				EndIf
			EndIf
		EndIf
		*p\deltaMovement\y=0
		*p\landed=1
		If *p\position\y>groundLevel
			*p\position\y=groundLevel
		EndIf
	Else
		*p\landed=0
	EndIf
EndProcedure
Procedure.i playerPlayFrameSound(*p.player)
	shiftX=#HITBOX_SHIFT_X+#HITBOX_SIZE/2
	If *p\direction
		shiftX=#HITBOX_BACKSHIFT_X+#HITBOX_SIZE/2
	EndIf
	framePlaySound(*p\currentFrame,*p\screenPosition\x+shiftX)
	ProcedureReturn *p\currentFrame\soundId
EndProcedure

Procedure refreshPlayer(*p.player,*b.background,delta.d=1,previousDelta.d=1)
; 	set(*p\previousPosition,*p\position\x,*p\position\y)
	; TEMPORARY MEASURE
	previousDelta=delta
	If *p\life<=0
		; dead
		If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_DEATH)
			If playerGetDeath(*p)
				playerResetAnimationTo(*p,playerGetDeath(*p))
				playerPlayFrameSound(*p)
			EndIf
		EndIf
		If *p\currentAnimation\index=ArraySize(*p\currentAnimation\frames())
			If *p\frameIndicator>=*p\currentFrame\length
				*p\frameIndicator=*p\currentFrame\length-1
			EndIf
		EndIf
	EndIf
	If Not *p\currentAnimation
		*p\attacking=0
		playerResetAnimationTo(*p,playerGetIdle(*p))
		Debug "current animation is null"
	EndIf
	*previousAnimation.animation=*p\currentAnimation
	*previousFrame.frame=*p\currentFrame
	Protected init=0
	If Not animationIsAttack(*p\currentAnimation)
		*p\attacking=0
	EndIf
	;----- natural life regen
	If *p\tmpHitMode<0
		If *p\life<*p\maxLife And *p\life>0 And *p\life<PLAYER_HP_BASE And *p\regenTotal<playerGetRegenMax(*p)
			If *p\class\stat\endurence<=10
				If *p\regenTick>(PLAYER_REGEN_TICK_BASE-*p\class\stat\endurence*PLAYER_REGEN_TICK_DECREMENT)
					*p\regenTick-Int(*p\regenTick)
					*p\life+1
					*p\regenTotal+1
				EndIf
				*p\regenTick+delta
			EndIf
		Else
			*p\regenTick=0
		EndIf
		;----- dodge reload
		If *p\dodge>0
			*p\dodge-delta
; 			If *p\dodge<25 And *p\dodge>getDodgeMin(*p) And Not *p\pushed\jump
; 				*p\dodge=getDodgeMin(*p) ; ???
; 			EndIf
			If *p\dodge<0
				*p\dodge=-getDodgeReload(*p)
			EndIf
		Else
			*p\dodge+delta
			If *p\dodge>0
				*p\dodge=0
			EndIf
		EndIf
		;----- jump reload
		If *p\jumpReload>0
			*p\jumpReload-delta
			If *p\jumpReload<0
				*p\jumpReload=0
			EndIf
		EndIf
	EndIf
	If isPlayerAlive(*p) And Not *p\caught And Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_SPAWN) And *p\recovery<=getAgility(*p) And *p\hitMode=-1
		;{
		;---- guard
		playerGuardRegen(*p,delta)
		If Not *p\attacking
		   ;----- dodge
			If Not *p\dodge And Not *p\controlState\jump And playerHasCommand(*p,#H2H_CONTROL_DODGE)
				*p\dodge=PLAYER_DODGE_BASE
			EndIf
			;----- combo start
			If Not *p\controlState\jump And *p\landed And *p\dodge<=0
				comboId=-1
				*tmpAnimation.animation=0
				If playerHasCommand(*p,#H2H_CONTROL_NEUTRAL)
					comboId=#H2H_COMBO_NEUTRAL
					*tmpAnimation=playerGetNeutral(*p)
				EndIf
				If playerHasCommand(*p,#H2H_CONTROL_ATTACK_SIDE)
					comboId=#H2H_COMBO_NSIDE
					*tmpAnimation=playerGetSide(*p)
				EndIf
				If playerHasCommand(*p,#H2H_CONTROL_ATTACK_BACK)
					comboId=#H2H_COMBO_NBACK
					*tmpAnimation=playerGetBack(*p)
				EndIf
				If playerHasCommand(*p,#H2H_CONTROL_ATTACK_UP)
					comboId=#H2H_COMBO_NUP
					*tmpAnimation=playerGetUp(*p)
				EndIf
				If playerHasCommand(*p,#H2H_CONTROL_ATTACK_DOWN)
					comboId=#H2H_COMBO_NDOWN
					*tmpAnimation=playerGetDown(*p)
				EndIf
				; normal attacks have priority over heavy
				; could be evolved in future dev
				If Not *tmpAnimation And playerHasCommand(*p,#H2H_CONTROL_HEAVY)
					comboId=#H2H_COMBO_HEAVY
					*tmpAnimation=playerGetHeavy(*p)
				EndIf
				If *tmpAnimation
					*p\recovery=0
					resetCombo(*p)
					*p\comboCount=1
					playerResetAnimationTo(*p,*tmpAnimation)
					playerPlayFrameSound(*p)
					;-- spawn wind
					playerSpawnWind(*p,*b)
					playerSpawnProjectile(*p,*b)
					mustSpawnStuff=#False
 					Debug "new start at "+*p\currentAnimation\name+" towards "+*p\lockedDirection
					*p\comboDirection[0]=*p\lockedDirection
					*p\combo[0]=comboId
					*p\comboSize[0]=1
					ClearList(*p\hit())
					*p\attacking=1
					init=1
				EndIf
			EndIf
		EndIf
		cdn=Bool(playerCanDoNext(*p) And ListSize(*p\hit()) And #H2H_PLAYER_CAN_MOVE_AT_CANDONEXT And *p\currentFrame\canMove And *p\currentFrame\canMove<=*p\frameIndicator)
		If (Not *p\attacking Or cdn) And Not (*p\pushed\attack Or *p\pushed\heavy Or *p\dodge>0)
			;-- move left
			;{
			If playerHasCommand(*p,#H2H_CONTROL_LEFT) And Not playerHasCommand(*p,#H2H_CONTROL_RIGHT) 
				*p\controlState\keep=1
				If *p\controlState\pushed=0
					*p\controlState\pushed=1
					If *p\lockedDirection
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
							If playerGetJump(*p)
								If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
									If playerGetLand(*p)
										If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
											playerResetAnimationTo(*p,playerGetMoveBack(*p))
											init=1
										EndIf
									Else
										playerResetAnimationTo(*p,playerGetMoveBack(*p))
										init=1
									EndIf
								EndIf
							Else
								playerResetAnimationTo(*p,playerGetMoveBack(*p))
								init=1
							EndIf
						EndIf
					Else
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT)
							If playerGetJump(*p)
								If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
									If playerGetLand(*p)
										If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
											playerResetAnimationTo(*p,playerGetMoveFront(*p))
											init=1
										EndIf
									Else
										playerResetAnimationTo(*p,playerGetMoveFront(*p))
										init=1
									EndIf
								EndIf
							Else
								playerResetAnimationTo(*p,playerGetMoveFront(*p))
								init=1
							EndIf
						EndIf
					EndIf
				EndIf
				locationAdd(*p\deltaMovement,-playerGetMovementSpeed(*p)*delta)
			EndIf
			;}
			;-- move right
			;{
			If playerHasCommand(*p,#H2H_CONTROL_RIGHT) And Not playerHasCommand(*p,#H2H_CONTROL_LEFT)
				*p\controlState\keep=1
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
					If *p\controlState\pushed=0
						*p\controlState\pushed=1
						If *p\lockedDirection
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT)
								If playerGetJump(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
										If playerGetLand(*p)
											If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
												playerResetAnimationTo(*p,playerGetMoveFront(*p))
												init=1
											EndIf
										Else
											playerResetAnimationTo(*p,playerGetMoveFront(*p))
											init=1
										EndIf
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveFront(*p))
									init=1
								EndIf
							EndIf
						Else
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
								If playerGetJump(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
										If playerGetLand(*p)
											If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
												playerResetAnimationTo(*p,playerGetMoveBack(*p))
												init=1
											EndIf
										Else
											playerResetAnimationTo(*p,playerGetMoveBack(*p))
											init=1
										EndIf
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveBack(*p))
									init=1
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
				locationAdd(*p\deltaMovement,playerGetMovementSpeed(*p)*delta)
			EndIf
			;}
			;-- move both direction
			;{
			If playerHasCommand(*p,#H2H_CONTROL_RIGHT) And playerHasCommand(*p,#H2H_CONTROL_LEFT) And cdn;Not playerCanDoNext(*p)
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
					If playerGetJump(*p)
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
							If playerGetLand(*p)
								If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
									playerResetAnimationTo(*p,playerGetIdle(*p))
									init=1
								EndIf
							Else
								playerResetAnimationTo(*p,playerGetIdle(*p))
								init=1
							EndIf
						EndIf
					Else
						playerResetAnimationTo(*p,playerGetIdle(*p))
						init=1
					EndIf
				EndIf
			EndIf
			;}
			;-- stop
			;{
			If Not *p\controlState\keep And Not *p\attacking And Not cdn
				*p\controlState\pushed=0
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
					If playerGetJump(*p)
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
							If playerGetLand(*p)
								If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
									playerResetAnimationTo(*p,playerGetIdle(*p))
									init=1
								EndIf
							Else
								playerResetAnimationTo(*p,playerGetIdle(*p))
								init=1
							EndIf
						EndIf
					Else
						playerResetAnimationTo(*p,playerGetIdle(*p))
						init=1
					EndIf
				EndIf
				set(*p\deltaMovement,0,*p\deltaMovement\y)
			EndIf
			;}
			;-- Jump animation shenaningans
			;{
			If *p\deltaMovement\x>0
				If *p\lockedDirection
					If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT)
						If playerGetJump(*p)
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
								If playerGetLand(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
										playerResetAnimationTo(*p,playerGetMoveFront(*p))
										init=1
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveFront(*p))
									init=1
								EndIf
							EndIf
						Else
							playerResetAnimationTo(*p,playerGetMoveFront(*p))
							init=1
						EndIf
					EndIf
				Else
					If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
						If playerGetJump(*p)
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
								If playerGetLand(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
										playerResetAnimationTo(*p,playerGetMoveBack(*p))
										init=1
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveBack(*p))
									init=1
								EndIf
							EndIf
						Else
							playerResetAnimationTo(*p,playerGetMoveBack(*p))
							init=1
						EndIf
					EndIf
				EndIf
			EndIf
			If *p\deltaMovement\x<0
				If *p\lockedDirection
					If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
						If playerGetJump(*p)
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
								If playerGetLand(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
										playerResetAnimationTo(*p,playerGetMoveBack(*p))
										init=1
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveBack(*p))
									init=1
								EndIf
							EndIf
						Else
							playerResetAnimationTo(*p,playerGetMoveBack(*p))
							init=1
						EndIf
					EndIf
				Else
					If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT)
						If playerGetJump(*p)
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
								If playerGetLand(*p)
									If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
										playerResetAnimationTo(*p,playerGetMoveFront(*p))
										init=1
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetMoveFront(*p))
									init=1
								EndIf
							EndIf
						Else
							playerResetAnimationTo(*p,playerGetMoveFront(*p))
							init=1
						EndIf
					EndIf
				EndIf
			EndIf
			If *p\deltaMovement\x=0 And Not cdn
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE) 
					If playerGetJump(*p)
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
							If playerGetLand(*p)
								If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
									playerResetAnimationTo(*p,playerGetIdle(*p))
									init=1
								EndIf
							Else
								playerResetAnimationTo(*p,playerGetIdle(*p))
								init=1
							EndIf
						EndIf
					Else
						playerResetAnimationTo(*p,playerGetIdle(*p))
						init=1
					EndIf
				EndIf
			EndIf
			;}
			If Not cdn And ListSize(*p\hit())>0
				Debug "clear 1"
				ClearList(*p\hit())
			EndIf
		EndIf
	;}
	EndIf
	;----- gravity And jump
	;{
	;-- jump detection
	If isPlayerAlive(*p) And playerHasCommand(*p,#H2H_CONTROL_JUMP) And *p\dodge<=0 And *p\recovery<=0 And *p\hitMode=-1 And Not *p\caught
		If Not *p\attacking Or cdn
			If Not *p\controlState\jump And *p\landed And *p\jumpReload=0
				If *p\position\y<=groundLevel
; 					Debug "Jump power "+Str(playerGetJumpPower(*p))
					set(*p\deltaMovement,*p\deltaMovement\x,playerGetJumpPower(*p)) ;---- jump formula
					*p\gravity=1
					*p\controlState\jump=1
					If playerGetJump(*p)
						playerResetAnimationTo(*p,playerGetJump(*p))
					EndIf
					If GetWeight(*p)>3
						psound(#H2H_SOUND_ID_HAND_JUMPHEAVY,*p\screenPosition\x+#HITBOX_SHIFT_X+#HITBOX_SIZE/2,40+GetWeight(*p)*10)
					Else
						psound(#H2H_SOUND_ID_HAND_JUMPLIGHT,*p\screenPosition\x+#HITBOX_SHIFT_X+#HITBOX_SIZE/2,70+GetWeight(*p)*10)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	
	;-- gravity and grounding
	If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_SPAWN)
; 		If isPlayerAlive(*p) And (*p\controlState\jump Or Not (*p\hasMoved Or *p\currentFrame\movement)) And  Not *p\caught
		If (*p\controlState\jump Or Not (*p\hasMoved Or *p\currentFrame\movement)) And  Not *p\caught
			If *p\position\y<=groundLevel
				If *p\position\y<>groundLevel
					If Not *p\controlState\jump
						*p\gravity=1
						*p\landed=0
					EndIf
				EndIf
			Else
				;grounded
				*p\controlState\jump=0
				*p\position\y=groundLevel
				*p\gravity=0
				*p\landed=1
				*p\deltaPush\y=0
; 				playerLand(*p)
				If Abs(*p\deltaMovement\y)<8
					If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
						playerResetAnimationTo(*p,playerGetIdle(*p))
;  						Debug "too low delta"
					EndIf
				Else
					playerJumpReload(*p)
					playerLandEffectSpawn(*p)
					playerShakeGround(*p)
					If Not *p\attacking
						If playerGetLand(*p)
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
								playerResetAnimationTo(*p,playerGetLand(*p))
							EndIf
						Else
							If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
								playerResetAnimationTo(*p,playerGetIdle(*p))
							EndIf
						EndIf
					EndIf
				EndIf
				*p\deltaMovement\y=0
			EndIf
		EndIf
	EndIf
	If *p\gravity And  Not *p\caught
		set(*p\deltaMovement,*p\deltaMovement\x,*p\deltaMovement\y+2*delta) ;--- gravity formula
		If *p\position\y>groundLevel
			*p\gravity=0
			*p\position\y=groundLevel
			*p\controlState\jump=0
			Debug "land 2"
			playerLand(*p,*b)
			*p\deltaMovement\y=0
			*p\landed=1
			*p\deltaPush\y=0
		Else
			*p\landed=0
			;-- jump animation while falling
			If playerGetJump(*p) And Not *p\attacking And *p\position\y<groundLevel And *p\hitMode=-1
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
					playerResetAnimationTo(*p,playerGetJump(*p))
				EndIf
				base=-playerGetJumpPower(*p)
				current=*p\deltaMovement\y
				max=ArraySize(playerGetJump(*p)\frames())
				If current>=base
					*p\currentFrame=*p\currentAnimation\frames(max)
					*p\currentAnimation\index=max
				Else
					i=(max+1)*((current+base))/(base*2)
					If i>max
						i=max
					EndIf
					If i>ArraySize(*p\currentAnimation\frames())
						i=ArraySize(*p\currentAnimation\frames())
					EndIf
					*p\currentFrame=*p\currentAnimation\frames(i)
					*p\currentAnimation\index=i
				EndIf
			EndIf
		EndIf
	EndIf
	;----- stabilize delta
	locationMult(*p\deltaMovement,Pow(0.5,previousDelta),1)
	; delta	result
	; 0.25	sqrt(0.5,4)
	; 0.5	sqrt(0.5)
	; 1		0.5
	; 2		0.25
	; 3		0.1666
	; 4		0.125
	If *p\hitMode>-1
		locationMult(*p\deltaPush,Pow(0.525,previousDelta),Pow(0.9,previousDelta))
	Else
		locationMult(*p\deltaPush,Pow(0.5,previousDelta),Pow(0.9,previousDelta))
	EndIf
	;----- air resistance
	CompilerIf #H2H_AIR_RESISTANCE_ENABLE
		excess.f=Abs(*p\deltaMovement\x)-#H2H_AIR_RESISTANCE_CAP
		If excess>0
			excess*#H2H_AIR_RESISTANCE_PERCENT/100
			*p\deltaMovement\x-(excess*Sign(*p\deltaMovement\x))*previousDelta
		EndIf
		
		excess.f=Abs(*p\deltaMovement\y)-#H2H_AIR_RESISTANCE_CAP
		If excess>0
			excess*#H2H_AIR_RESISTANCE_PERCENT/100
			*p\deltaMovement\y-(excess*Sign(*p\deltaMovement\y))*previousDelta
		EndIf
		
		excess.f=Abs(*p\deltaPush\x)-#H2H_AIR_RESISTANCE_CAP
		If excess>0
			excess*#H2H_AIR_RESISTANCE_PERCENT/100
			*p\deltaPush\x-(excess*Sign(*p\deltaPush\x))*previousDelta
		EndIf
		
		excess.f=Abs(*p\deltaPush\y)-#H2H_AIR_RESISTANCE_CAP
		If excess>0
			excess*#H2H_AIR_RESISTANCE_PERCENT/100
			*p\deltaPush\y-(excess*Sign(*p\deltaPush\y))*previousDelta
		EndIf
	CompilerEndIf
	
	;----- refresh position based on delta
; 	Debug *p\name+" Delta movement y "+*p\deltaMovement\y
	locationAdd(*p\position,*p\deltaMovement\x*delta,*p\deltaMovement\y*delta)
	locationAdd(*p\position,*p\deltaAttack\x*delta,*p\deltaAttack\y*delta)
	locationAdd(*p\position,*p\deltaPush\x*delta,*p\deltaPush\y*delta)
;- stick player to ground
	If Not *p\currentFrame\movement And Not *p\caught And Not *p\hasMoved
		playerStickToGround(*p,*b)
	EndIf
	*p\controlState\keep=0
	;}
	;----- border check
	playerBorderCheck(*p,*b)
	
	;----- increase the frame
	*p\sub+delta
	*p\recovery-delta
	If *p\recovery<0
		*p\recovery=0
	EndIf
	Protected difference.i=0
	;---- recovery animation end
	If *p\recovery>0 And *p\hitMode=-1
		If isPlayerAlive(*p) And Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
			If playerGetJump(*p)
				If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
					If playerGetLand(*p)
						If Not isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
							playerResetAnimationTo(*p,playerGetIdle(*p))
							init=1
						EndIf
					Else
						playerResetAnimationTo(*p,playerGetIdle(*p))
						init=1
					EndIf
				EndIf
			Else
				playerResetAnimationTo(*p,playerGetIdle(*p))
				init=1
			EndIf
		EndIf
	EndIf
	If ArraySize(*p\currentAnimation\frames())<>-1
		;{
		difference=Int(*p\sub)
		If difference
			*p\sub-difference
			If Not (isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_HIT) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP))
				*p\frameIndicator+difference
			EndIf
			;-- feedback
			*p\feedback-difference
			If *p\feedback<0
				*p\feedback=0
			EndIf
		EndIf
		If Not *p\currentAnimation
			*p\frameIndicator+420
		EndIf
		length=*p\currentFrame\length
		If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
			length*(#H2H_MOVEMENT_SPEED_BASE*2)
			length/(#H2H_MOVEMENT_SPEED_BASE+getSpeed(*p)*#H2H_MOVEMENT_SPEED_MULTIPLICATOR)
			length=max(length,1)
		EndIf
		Protected canDoNext=Bool(playerCanDoNext(*p) And *p\haveHitSomeone)
		While *p\frameIndicator>length Or canDoNext
			;{
			;-- change the frame
			wasHigher=Bool(*p\frameIndicator>length)
			mustSpawnStuff=#False
			If Not canDoNext
				*p\frameIndicator-length
				Protected animationEnd=0
				*p\currentAnimation\index+1
				; -- next animation index
				If animationIndex(*p\currentAnimation)<=ArraySize(*p\currentAnimation\frames())
					;- next frame here
					*p\currentFrame=*p\currentAnimation\frames(*p\currentAnimation\index)
					length=*p\currentFrame\length
					*p\spawnedWind=#False
					*p\spawnedProjectile=#False
					;-- increase the frame and check movement
					If *p\blocked<=0 And *p\currentFrame\movement
						playerApplyMovement(*p)
					EndIf
					;- spawn wind
					If *p\hitMode=-1 And *p\dodge<=0
						mustSpawnStuff=#True
					EndIf
				Else
					*p\currentAnimation\index=ArraySize(*p\currentAnimation\frames())
					If wasHigher
						animationEnd=1
					EndIf
				EndIf
			EndIf
			; next element
			;-- If there's no new replaced animation
			If Not init
				If *p\blocked>0
					*p\blocked-1
					If isPlayerAlive(*p) And *p\blocked<=0
; 						Debug "stoped 6"
						playerResetAnimationTo(*p,playerGetIdle(*p))
						*p\recovery+(10-getAgility(*p))
					EndIf
				Else
					If ArraySize(*p\currentAnimation\frames())<animationIndex(*p\currentAnimation)
						; Here the animation ends
						animationEnd=1
					EndIf
				EndIf
			EndIf
			If animationEnd Or canDoNext
				;-- animation end
				If playerGetSpawn(*p)
					If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_SPAWN)
						playerResetAnimationTo(*p,playerGetIdle(*p))
					EndIf
				EndIf
				If playerGetLand(*p)
					If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
						playerResetAnimationTo(*p,playerGetIdle(*p))
					EndIf
				EndIf
				If animationIsLooped(*p\currentAnimation)
					;-- restart
					If Not canDoNext Or animationEnd ;Not aEnd&2 Or aEnd&1
						*p\currentAnimation\index=*p\currentAnimation\loopStart ; by default 0
						*p\currentFrame=*p\currentAnimation\frames(*p\currentAnimation\index)
						;-- idle variants
						If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE)
							playerSelectIdle(*p)
						EndIf
					EndIf
				Else
					If isPlayerAlive(*p) And *p\recovery<=0 And *p\hitMode=-1 And  Not *p\caught
						;-- low recovery
						If *p\attacking
							; must be attacking
							If *p\haveHitSomeone
								;-- The previous attack hit someone
								Protected tmpRecovery=*p\currentAnimation\recovery
								*tmpAnimation.animation=0
								If playerHasCommand(*p,#H2H_CONTROL_NEUTRAL)
									*tmpAnimation=animationGetNeutral(*p\currentAnimation)
								EndIf
								If playerHasCommand(*p,#H2H_CONTROL_ATTACK_SIDE)
									*tmpAnimation=animationGetSide(*p\currentAnimation)
								EndIf
								If playerHasCommand(*p,#H2H_CONTROL_ATTACK_BACK)
									*tmpAnimation=animationGetBack(*p\currentAnimation)
								EndIf
								If playerHasCommand(*p,#H2H_CONTROL_ATTACK_UP)
									*tmpAnimation=animationGetUp(*p\currentAnimation)
								EndIf
								If playerHasCommand(*p,#H2H_CONTROL_ATTACK_DOWN)
									*tmpAnimation=animationGetDown(*p\currentAnimation)
								EndIf
								If playerHasCommand(*p,#H2H_CONTROL_HEAVY)
									*tmpAnimation=animationGetHeavy(*p\currentAnimation)
								EndIf
								If *tmpAnimation=0
									If canDoNext And Not animationEnd
										;-- the next combo is not valid
										canDoNext=0
									Else
										*p\haveHitSomeone=0
										resetCombo(*p)
										*p\combo[0]=getComboId(*p)
										*p\comboSize[0]=1
										*p\comboDirection[0]=*p\lockedDirection
										*p\comboCount=1
										If animationIsComboEnd(*p\currentAnimation)
											*p\recovery=0
										Else
											playerRecovery(*p)
											*p\recovery/2
										EndIf
										playerResetAnimationTo(*p,playerGetIdle(*p))
										*p\attacking=0
										*p\landed=0
									EndIf
								Else
									;-- combo is valid
									playerResetAnimationTo(*p,*tmpAnimation)
									playerPlayFrameSound(*p)
									ClearList(*p\hit())
									*p\haveHitSomeone=0
									*p\combo[*p\comboCount]=getComboId(*p)
									*p\comboDirection[*p\comboCount]=*p\lockedDirection
									*p\comboSize[*p\comboCount]=1
									*p\comboCount+1
										Debug "combo valid"
									*p\attacking=1
									canDoNext=0
								EndIf
								c=*p\color
								If *p\class\allStances(*p\classStanceId)\specialcolor
									If *p\usesAlternate
										c=*p\class\allStances(*p\classStanceId)\alternatecolor
									Else
										c=*p\class\allStances(*p\classStanceId)\specialcolor
									EndIf
								EndIf
								mustSpawnStuff=#False
								playerSpawnWind(*p,*b)
								playerSpawnProjectile(*p,*b)
							Else
								;-- this is a miss
								*p\hasMoved=0
								ClearList(*p\hit())
								*p\haveHitSomeone=0
								If Not canDoNext Or animationEnd ; can't do next or animation finished
									playerRecovery(*p)
									*p\landed=0
								Else
									canDoNext=0
								EndIf
							EndIf
						Else
							;-- Jump animation set
							If Not canDoNext Or animationEnd	
								If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP)
									If playerGetLand(*p)
										playerResetAnimationTo(*p,playerGetLand(*p))
									Else
										playerResetAnimationTo(*p,playerGetIdle(*p))
									EndIf
								Else
									playerResetAnimationTo(*p,playerGetIdle(*p))
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			Else
				;-- animation continues
				If isPlayerAlive(*p) And frameNeedCatch(*p\currentFrame)
					If Not *p\haveHitSomeone;ListSize(*p\hit())<=0
						;-- recovery because nothing hited
						If animationIsComboEnd(*previousAnimation)
							*p\recovery=0
						Else
							playerRecovery(*p)
						EndIf
						playerResetAnimationTo(*p,playerGetIdle(*p))
						Debug *p\name+" need catch"
						*p\comboCount=0
						*p\landed=0
						canDoNext=0
						ClearList(*p\hit())
					EndIf
				EndIf
				;-- play the current sound after we change
				; only if the next animation is correct
				If *p\blocked<=0
					; -- play sound
					playerPlayFrameSound(*p)
					;-- Frame shake
					If *p\currentFrame\shake
						Debug "shake"
						playerShakeGround(*p)
					EndIf
				EndIf
			EndIf
			;-- movement Delta need catch
			If *p\currentFrame\movementD
				catch=1
				If frameMovementDeltaNeedCatch(*p\currentFrame)
					If ListSize(*p\hit())>0
						catch=1
					Else
						catch=0
					EndIf
				EndIf
				If catch
					If *p\lockedDirection
						set(*p\deltaAttack,-*p\currentFrame\movementD\x,
						    				*p\currentFrame\movementD\y)
					Else
						set(*p\deltaAttack,*p\currentFrame\movementD\x,
						    			   *p\currentFrame\movementD\y)
					EndIf
				EndIf
			Else
				set(*p\deltaAttack)
			EndIf
			;-- damage cut
			If frameIsDamageCut(*p\currentFrame)
				Debug *p\name+" damage cut"
				ClearList(*p\hit())
			EndIf
			
; 			Debug *p\name+" after"
			If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK)
				length=*p\currentFrame\length
				length*(#H2H_MOVEMENT_SPEED_BASE*2)
				length/(#H2H_MOVEMENT_SPEED_BASE+getSpeed(*p)*#H2H_MOVEMENT_SPEED_MULTIPLICATOR)
				length=max(length,1)
			EndIf
		;}
			canDoNext=0
			If mustSpawnStuff
				playerSpawnWind(*p,*b)
				playerSpawnProjectile(*p,*b)
			EndIf
		Wend
		;}
	Else
		Debug "empty animation"
		*p\comboCount=0
		playerResetAnimationTo(*p,playerGetIdle(*p))
	EndIf

	If Not *p\currentAnimation
		Debug "empty animation 2"
		playerResetAnimationTo(*p,playerGetIdle(*p))
		*p\attacking=0
	EndIf
	;-- combo reset
	If Not *p\attacking
		If isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_IDLE) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_BACK) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_JUMP) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_DODGE) Or isPlayerAnimationType(*p,#H2H_ANIMATIONTYPE_LAND)
			*p\comboCount=0
		EndIf
	EndIf
	
	;--- HP bar data
; 	If *p\hpb\isMirrored
; 		*p\hpb\greenBarX=min(*p\life*400/#H2H_PLAYER_HP_BASE,400)
; 		*p\hpb\bigGreenBarX=max((*p\life-#H2H_PLAYER_HP_BASE)*400/#H2H_PLAYER_HP_BASE)
; 	Else
; 		*p\hpb\greenBarX=400-min(*p\life*400/#H2H_PLAYER_HP_BASE,400)
; 		*p\hpb\bigGreenBarX=400-max((*p\life-#H2H_PLAYER_HP_BASE)*400/#H2H_PLAYER_HP_BASE)
; 	EndIf
; 	hpBarRefresh(*p\hpb,delta)

	If *p\currentAnimation
		If Not *p\currentAnimation
			Debug "null animation !"
		EndIf
		If *p\currentAnimation\index<0
			*p\currentAnimation\index=0
			Debug "that bastard was negative"
		EndIf
		If *p\currentAnimation\index>ArraySize(*p\currentAnimation\frames())
			*p\currentAnimation\index=ArraySize(*p\currentAnimation\frames())
			Debug "woopsie we are too far"
		EndIf
		*p\currentFrame=*p\currentAnimation\frames(*p\currentAnimation\index)
	EndIf
	;--- player refresh key
; 	refreshPlayerKey(*p,difference)
EndProcedure

Macro playerControlPressed(p,what)
	controlPressed(p\pushed,what)
EndMacro

Global feedbackScreen=0
#H2H_SCREEN_FEEDBACK_MARGIN=100
Macro feedbackScreenDisplay(feedback)
	If feedback
		If feedbackScreen=0
			feedbackScreen=spriteIndex
			spriteIndex+1
		EndIf
		If Not IsSprite(feedbackScreen)
			CreateSprite(feedbackScreen,screenSizeX,screenSizeY,#PB_Sprite_AlphaBlending)
			StartDrawing(SpriteOutput(feedbackScreen))
			Box(0,0,screenSizeX,screenSizeY,RGB(255,0,0))
			DrawingMode(#PB_2DDrawing_AlphaChannel)
			For i=1 To #H2H_SCREEN_BORDER_THICKNESS-1
				Box(i*#H2H_SCREEN_BORDER_STEP*3,i*#H2H_SCREEN_BORDER_STEP*3,screenSizeX-i*#H2H_SCREEN_BORDER_STEP*6,screenSizeY-i*#H2H_SCREEN_BORDER_STEP*6,RGBA(0,0,0,255/i))
			Next
			StopDrawing()
			ZoomSprite(feedbackScreen,SpriteWidth(feedbackScreen)+#H2H_SCREEN_FEEDBACK_MARGIN,SpriteHeight(feedbackScreen)+#H2H_SCREEN_FEEDBACK_MARGIN)
		EndIf
		DisplayTransparentSprite(feedbackScreen,-#H2H_SCREEN_FEEDBACK_MARGIN/2+Random(screenShakeDistance)-screenShakeDistance,-#H2H_SCREEN_FEEDBACK_MARGIN/2+Random(screenShakeDistance)-screenShakeDistance,min(255,feedback))
	EndIf
EndMacro
Procedure.i playerGetDodgeFrame(*p.player)
	If playerGetDodge(*p)
		If *p\dodge<getDodgeMin(*p)
			ProcedureReturn playerGetDodge(*p)\frames(0)
		EndIf
		factor.d=(25-Abs(*p\dodge-25))/25.0
		Debug "dodge "+StrD(*p\dodge)
		Debug "factor "+StrD(factor)
		ProcedureReturn animationAt(playerGetDodge(*p),factor*animationLength(playerGetDodge(*p)))
	EndIf	
	If playerGetJump(*p)
		ProcedureReturn playerGetJump(*p)\frames(ArraySize(playerGetJump(*p)\frames()))
	EndIf
	ProcedureReturn playerGetIdle(*p)\frames(0)
EndProcedure
Procedure displayPlayerShadow(*p.player,shift.i=0)
	*currentFrame.frame=playerCurrentFrame(*p)
	If *p\hitMode>-1
		If *p\recovery>0
			*currentFrame=playerGetHit(*p)\frames(*p\hitMode)
		EndIf
	Else
		If deltaDelay>0
			If ListSize(*p\hit())=0
				If *p\tmpHitMode=-1
					*p\tmpHitMode=Random(ArraySize(playerGetHit(*p)\frames()))
				EndIf
				*currentFrame=playerGetHit(*p)\frames(*p\tmpHitMode)
			EndIf
		Else
			If *p\dodge>0
				*currentFrame=playerGetDodgeFrame(*p)
			EndIf
		EndIf
	EndIf
	If Not *currentFrame
		ProcedureReturn
	EndIf
; 	If *p\dodge>0
; 		displayFrameShadow(*currentFrame,*p\screenPosition\x,*p\screenPosition\y+100,*p\lockedDirection,#True,playerGetColor(*p),playerGetColorIntensity(*p))
; 	Else
		displayFrameShadow(*currentFrame,*p\screenPosition\x,*p\screenPosition\y,*p\lockedDirection,#True,playerGetColor(*p),playerGetColorIntensity(*p))
; 	EndIf
EndProcedure
Procedure displayPlayer(*p.player,shift.i=0,delta.d=1)
	If Not *p
		ProcedureReturn
	EndIf
	Protected feedbackColor=playerGetColor(*p)
	Protected colorIntensity=playerGetColorIntensity(*p)
	If playerColorMode<>#H2H_PLAYER_COLOR_MODE_BASIC And playerColorMode<>#H2H_PLAYER_COLOR_MODE_CONTRAST And *p\class\allStances(*p\classStanceId)\specialcolor
		If *p\usesAlternate
			feedbackColor=*p\class\allStances(*p\classStanceId)\alternatecolor
		Else
			feedbackColor=*p\class\allStances(*p\classStanceId)\specialcolor
		EndIf
	EndIf
	If *p\feedback
		m=Mod(*p\feedback,9)
		If m<3
			If Red(feedbackColor)+Green(feedbackColor)+Blue(feedbackColor)>128*3+64
				feedbackColor=RGB(64,64,64)
			Else
				feedbackColor=RGB(255,255,255)
			EndIf
		Else
			If m<6
				If feedbackColor=#H2H_STANCE_COLOR_RED
					feedbackColor=RGB(128,0,128)
				Else
					feedbackColor=RGB(255,96,96)
				EndIf
			Else
				If *p\recovery
					feedbackColor=RGB(12,12,12)
				EndIf
			EndIf
		EndIf
	Else
		If *p\recovery
			m=Mod(*p\recovery,12)
			c=*p\color
			If *p\usesAlternate And Not *p\currentStance\specialcolor
				c=*p\alternateColor
			EndIf
			If m<4
				feedbackColor=colorLerp(c,RGB(128,128,128))
			Else
				If m<8
					feedbackColor=RGB(128,128,128)
				Else
					feedbackColor=RGB(32,32,32)
				EndIf
			EndIf
		EndIf
	EndIf
	*currentFrame.frame=playerCurrentFrame(*p)
	If *p\hitMode>-1
		If *p\recovery>0
			If isPlayerAlive(*p)
				*currentFrame=playerGetHit(*p)\frames(*p\hitMode)
				frameLoad(*currentFrame)
			EndIf
		Else
			*p\hitMode=-1
		EndIf
	Else
		If deltaDelay>0
			If ListSize(*p\hit())=0
				If *p\tmpHitMode=-1
					*p\tmpHitMode=Random(ArraySize(playerGetHit(*p)\frames()))
				EndIf
				*currentFrame=playerGetHit(*p)\frames(*p\tmpHitMode)
				frameLoad(*currentFrame)
			Else
				*p\tmpHitMode=-1
			EndIf
		Else
			*p\tmpHitMode=-1
		EndIf
	EndIf
	If *p\dodge>0 
		*currentFrame=playerGetDodgeFrame(*p)
	EndIf
	If Not *currentFrame
		ProcedureReturn
	EndIf
	*currentFrame\bufferTimeout=((*currentFrame\bufferTimeout*21)/20)+(100/*currentFrame\length)
	If *currentFrame\bufferTimeout>2000
		*currentFrame\bufferTimeout=2000
	EndIf
	opacity=255
	If *currentFrame\movement
		opacity-Abs(*currentFrame\movement\x)
		opacity-Abs(*currentFrame\movement\y)
	EndIf
	If *currentFrame\movementD
		opacity-Abs(*currentFrame\movementD\x)*3
		opacity-Abs(*currentFrame\movementD\y)*3
	EndIf
	If opacity<192
		opacity=192
	EndIf
	Protected displayX.i
	Protected displayY.i=*p\screenPosition\y+*screenShake\y-screenFocusHeight
	If frameShiftYNegative(*currentFrame)
		displayY-*currentFrame\shift\y
	Else
		displayY+*currentFrame\shift\y
	EndIf
	Protected heightProportion.f=1000
	Protected heightFactor.f=1-(Abs(*p\position\y-groundLevel))/heightProportion
	If *currentFrame\shadowShift
		heightFactor+*currentFrame\shadowShift\y/heightProportion
	EndIf
	If heightFactor<0.1
		heightFactor=0.1
	EndIf
	If *p\lockedDirection
		If frameShiftXFlipNegative(*currentFrame)
			displayX=*p\screenPosition\x-*currentFrame\shift\x/1000+shift+*screenShake\x
		Else
			displayX=*p\screenPosition\x+*currentFrame\shift\x/1000+shift+*screenShake\x
		EndIf
	Else
		If frameShiftXNegative(*currentFrame)
			displayX=*p\screenPosition\x-Mod(*currentFrame\shift\x,1000)+shift+*screenShake\x
		Else
			displayX=*p\screenPosition\x+Mod(*currentFrame\shift\x,1000)+shift+*screenShake\x
		EndIf
	EndIf
	If *p\hitMode>=0 And Not *p\caught
		displayX+(Random(*p\recovery)-*p\recovery/2)
		displayY+(Random(*p\recovery)-*p\recovery/2)
	EndIf
	boost=max(224-opacity,0)*2
	feedbackColor=RGB(min(Red(feedbackColor)+boost,255),
	                  min(Green(feedbackColor)+boost,255),
	                  min(Blue(feedbackColor)+boost,255))
	If *p\dodge>0
		If isDodgeActive(*p)
			opacity/4
			opacity+Abs(*p\dodge-PLAYER_DODGE_BASE/2)*2
			If opacity<0
				opacity=0
			EndIf
			colorIntensity/2
		Else
			colorIntensity/2
		EndIf
	EndIf
	If *p\feedback Or *p\recovery
		frameDisplay(*currentFrame,displayX,displayY,opacity,feedbackColor,*p\lockedDirection)
	Else
		frameDisplay(*currentFrame,displayX,displayY,opacity,feedbackColor,*p\lockedDirection,colorIntensity)
	EndIf
EndProcedure
Macro playerHasActiveHurtBox(p)
	Bool(p\currentFrame\damageDuration=0 Or p\frameIndicator<p\currentFrame\damageDuration)
EndMacro
Procedure.i playerSelectRandomAttack(*p.player)
	Dim *attacks.animation(0)
	For i=3 To 8
		If *p\class\animations[i]
			If *attacks(ArraySize(*attacks()))
				ReDim *attacks(ArraySize(*attacks())+1)
			EndIf
			*attacks(ArraySize(*attacks()))=*p\class\animations[i]
		EndIf
	Next
	*a.animation=*attacks(Random(ArraySize(*attacks())))
	FreeArray(*attacks())
	ProcedureReturn *a
EndProcedure

Procedure displayPlayerDebug(*p.player,shift.i=0)
	*currentFrame.frame=playerCurrentFrame(*p)
	If Not *currentFrame
		ProcedureReturn
	EndIf
	CompilerIf #H2H_CONSOLE_ENABLED
		ConsoleError("Sprite number "+*currentFrame\id)
	CompilerEndIf
	
	Protected x.i=*p\screenPosition\x+#HITBOX_SHIFT_X
	If *p\lockedDirection
		x=*p\screenPosition\x+#HITBOX_BACKSHIFT_X
	EndIf
	Protected y.i=*p\screenPosition\y+#HITBOX_SHIFT_Y-screenFocusHeight
	
	Afftext("Frame "+*p\currentAnimation\id+"["+playerAnimationIndex(*p)+"]",x,y-34)
	Afftext("Delta y : "+*p\deltaMovement\y,x,*p\screenPosition\y+#HITBOX_SHIFT_Y-51)
	
	If *currentFrame\movement
		Afftext("Movement : "+*currentFrame\movement\x+"/"+*currentFrame\movement\y,x,y-68)
	EndIf
	Afftext("animation : "+*p\currentAnimation\name,x,y-102)
	Afftext("jumping : "+*p\controlState\jump,x,y-130)
	Afftext("gravity : "+*p\gravity,x,y-150)
	Afftext("push : "+*p\deltaPush\y,x,y-170)
	Afftext("movement : "+*p\deltaMovement\y,x,y-190)
	If animationIsAttack(*p\currentAnimation) And *currentFrame\hurtId And playerHasActiveHurtBox(*p) And *currentFrame\hurtShift
		If *p\lockedDirection
			DisplaySpriteOptional(*currentFrame\hurtFlip,*p\screenPosition\x+*currentFrame\hurtShift\x/1000,*p\screenPosition\y+*currentFrame\hurtShift\y-screenFocusHeight,128)
		Else
			DisplaySpriteOptional(*currentFrame\hurtId,*p\screenPosition\x+Mod(*currentFrame\hurtShift\x,1000),*p\screenPosition\y+*currentFrame\hurtShift\y-screenFocusHeight,128)
		EndIf
	EndIf
	; hitbox behind the sprite
	DisplaySpriteOptional(*p\hitbox,x,y,128)
	Afftext(Str(*p\screenPosition\y),*p\screenPosition\x,*p\screenPosition\y)
	Afftext(Str(*p\life)+"/"+Str(*p\maxLife),*p\screenPosition\x+#HITBOX_SHIFT_X+shift,y-17)
EndProcedure

Procedure.i processDamage(*attacker.player,*defender.player,*specificFrame.frame=#Null)
	If Not animationIsAttack(*attacker\currentAnimation)
		ProcedureReturn 0
	EndIf
	*currentFrame.frame=playerCurrentFrame(*attacker)
	If *specificFrame
		*currentFrame=*specificFrame
	EndIf
	If Not *currentFrame\damage
		ProcedureReturn 0
	EndIf
	
	Protected damage=*currentFrame\damage
	If Not frameIsPureProjectile(*currentFrame)
		Protected multiplier=0
		Select *currentFrame\damageType
			Case #H2H_DAMAGETYPE_BLUNT
				multiplier=getBlunt(*attacker)*2+getStrength(*attacker)*2+GetWeight(*attacker)
			Case #H2H_DAMAGETYPE_CUT
				multiplier=getCut(*attacker)*2+getSpeed(*attacker)*2+getStrength(*attacker)
			Case #H2H_DAMAGETYPE_PIERCE
				multiplier=getPierce(*attacker)*2+getAgility(*attacker)*2+getStrength(*attacker)
		EndSelect
		damage=(damage*(100+multiplier))/100
	EndIf
	If getStamina(*defender)
		damage=(damage*20)/(20+getStamina(*defender))
		If damage=0
			If Random(getStamina(*defender))=getStamina(*defender)
				damage=1
			EndIf
		EndIf
	EndIf
	ProcedureReturn damage
EndProcedure

#H2H_PLAYER_BLOCk_ENABLE=0

Procedure isPlayerTouchingPlayer(*p1.player,*p2.player,*specificFrame.frame=#Null,*where.location=#Null)
	Protected *currentFrame.frame=*p1\currentFrame
	If *specificFrame
		*currentFrame=*specificFrame
	EndIf
	If Not *currentFrame
		*p1\currentFrame=*p1\currentAnimation\frames(*p1\currentAnimation\index)
		*currentFrame=*p1\currentFrame
	EndIf
	Protected hurtSprite=*currentFrame\hurtId
; 	Debug "sprite "+hurtSprite
	If hurtSprite And IsSprite(hurtSprite) And Bool(*specificFrame)=Bool(*where)
; 		Debug "would touch ?"
		Protected hurtShiftX=Mod(*currentFrame\hurtShift\x,1000)
		Protected hurtShiftY=*currentFrame\hurtShift\y
		If *p1\lockedDirection
			hurtSprite=*currentFrame\hurtFlip
			hurtShiftX=*currentFrame\hurtShift\x/1000
		EndIf
		Protected shiftX=#HITBOX_SHIFT_X
		Protected shiftY=#HITBOX_SHIFT_Y
		If *p2\lockedDirection
			shiftX=#HITBOX_BACKSHIFT_X
			shiftY=#HITBOX_BACKSHIFT_Y
		EndIf
		If *where
			If SpritePixelCollision(hurtSprite,*where\x+hurtShiftX,*where\y+hurtShiftY,*p2\hitbox,*p2\position\x+shiftX,*p2\position\y+shiftY)
				ProcedureReturn 1
			EndIf
		Else
			If SpritePixelCollision(hurtSprite,*p1\position\x+hurtShiftX,*p1\position\y+hurtShiftY,*p2\hitbox,*p2\position\x+shiftX,*p2\position\y+shiftY)
				ProcedureReturn 1
			EndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Enumeration 0
	#H2H_PLAYER_MIRROR_ALL
	#H2H_PLAYER_MIRROR_DIFFERENT_STANCE
	#H2H_PLAYER_MIRROR_RANDOM_STANCE
EndEnumeration

Procedure playerMirror(*target.player,*model.player,mirrorMode.i=#H2H_PLAYER_MIRROR_ALL)
	playerSetClass(*target,*model\class,*model\classStanceId)
	If mirrorMode=#H2H_PLAYER_MIRROR_DIFFERENT_STANCE
		While *target\classStanceId=*model\classStanceId
			*target\classStanceId=Random(*target\class\allStances())
		Wend
	EndIf
	If mirrorMode=#H2H_PLAYER_MIRROR_RANDOM_STANCE
		*target\classStanceId=Random(ArraySize(*target\class\allStances()))
	EndIf
EndProcedure

Procedure playerSetStance(*p.player,what.i=0)
	If what<0
		what=Random(ArraySize(*p\class\allStances()),0)
	EndIf
	*p\classStanceId=what
	*p\currentStance=*p\class\allStances(*p\classStanceId)
EndProcedure

Procedure playerSetStanceRandom(*p.player,exclusiveStanceId=-42)
	If *p And *p\class
		size=ArraySize(*p\class\allStances())
		If size>0
			playerSetStance(*p,Random(size))
			While *p\classStanceId=exclusiveStanceId
				playerSetStance(*p,Random(size))
			Wend
			Debug "selected stance "+*p\classStanceId
		Else
			playerSetStance(*p)
		EndIf
	EndIf
EndProcedure

Procedure playerSetClassRandom(*p.player,*exclusive.player=#Null,exclusiveClass=#False,exclusiveStance=#False)
	playerSetClass(*p,*allClasses(getRandomClassID()),0)
	If *p\class\notSelectable
		playerSetClassRandom(*p,*exclusive,exclusiveClass,exclusiveStance)
	Else
		If *exclusive
			If exclusiveClass
				If *p\class=*exclusive\class
					playerSetClassRandom(*p,*exclusive,exclusiveClass,exclusiveStance)
				Else
					*p\classStanceId=getRandomStanceID(*p\class)
				EndIf
			Else
				; an exclusive class can never have a similar stance
				*p\classStanceId=getRandomStanceID(*p\class)
				If exclusiveStance And ArraySize(*p\class\allStances())>0
					If *p\class=*exclusive\class
						While *p\classStanceId=*exclusive\classStanceId
							*p\classStanceId=getRandomStanceID(*p\class)
						Wend
					EndIf
				EndIf
				playerSetStance(*p,*p\classStanceId)
			EndIf
		Else
			; null exlusive player, skip the checks
			playerSetStance(*p,getRandomStanceID(*p\class))
		EndIf
	EndIf
EndProcedure

#H2H_COMBO_DISPLAY_BIG_DISTANCE=188
#H2H_COMBO_DISPLAY_SMALL_DISTANCE=38

Procedure displayPlayerCombo(*p.player,delta.d=1)
	color=playergetcolor(*p);*p\color
	intensity=playerGetColorIntensity(*p)
	distance.i=#H2H_COMBO_DISPLAY_BIG_DISTANCE
	y=0
	If comboDisplayMode=#H2H_COMBO_DISPLAY_SMALL
		distance=#H2H_COMBO_DISPLAY_SMALL_DISTANCE
		y=100
	EndIf
	For i=0 To 4
		If *p\combo[i]
; 			Debug "alternative "+*p\usesAlternate
			opacity=128+128**p\comboHit[i]
			If i>=*p\comboCount
				opacity**p\comboSize[i]
			EndIf
			tmpIntensity=intensity
			If intensity<128
				tmpIntensity+*p\comboFlash[i]*128
			Else
				tmpIntensity-*p\comboFlash[i]*127
			EndIf
			comboDisplayX=(screenSizeX-distance*4)/2 + Random(*p\comboShake[i]*2)-*p\comboShake[i]
			displayComboSprite(*p\combo[i],
			                   comboDisplayX+i*distance+(1-*p\comboSize[i])*distance/2,
			                   y+ distance**p\id + 		(1-*p\comboSize[i])*distance/2 + Random(*p\comboShake[i]*2)-*p\comboShake[i],
			                   color,tmpIntensity,Bool(comboDisplayMode=#H2H_COMBO_DISPLAY_SMALL),
			                   *p\comboDirection[i],*p\comboSize[i],opacity)
			If *p\comboSuccess[i]>0
				comboDisplayX=(screenSizeX-distance*4)/2 + Random(*p\comboShake[i]*4)-*p\comboShake[i]*2
				displayComboSprite(*p\combo[i],
				               comboDisplayX+i*distance+(1-*p\comboSize[i]-*p\comboSuccess[i])*distance/2,
				               y+ distance**p\id + 		(1-*p\comboSize[i]-*p\comboSuccess[i])*distance/2 + Random(*p\comboShake[i]*4)-*p\comboShake[i]*2,
				               color,tmpIntensity,Bool(comboDisplayMode=#H2H_COMBO_DISPLAY_SMALL),
				               *p\comboDirection[i],*p\comboSize[i]+*p\comboSuccess[i],opacity*0.66)
			EndIf
		EndIf
	Next
	factor.d=Pow(0.9,delta)
	For i=0 To 4
		*p\comboShake[i]*factor
		*p\comboFlash[i]*factor
		If i<*p\comboCount
			*p\comboSize[i]=lerp(1,*p\comboSize[i],factor)
		Else
			*p\comboSize[i]=lerp(0,*p\comboSize[i],factor)
			*p\comboSize[i]=lerp(0,*p\comboSize[i],factor)
			If *p\comboSize[i]<0.1
				*p\comboSize[i]=0
				*p\combo[i]=0
			EndIf
		EndIf
		*p\comboSuccess[i]*factor
		If *p\comboSuccess[i]<0.1
			*p\comboSuccess[i]=0
		EndIf
	Next
EndProcedure
Procedure playerStun(*p.player,stun.i)
	If *p\recovery<=0
		*p\recovery=playerRecoveryCompute(*p)/2
	EndIf
	If *p\recovery<PLAYER_STUN_MAX
		*p\recovery=max(*p\recovery+stun,PLAYER_STUN_MAX)
	EndIf
	If *p\hitMode=-1 And playerGetHit(*p)
		If ArraySize(playerGetHit(*p)\frames())>-1
			playerResetAnimationTo(*p,playerGetIdle(*p))
			*p\hitMode=Random(ArraySize(playerGetHit(*p)\frames()))
			frameLoad(playerGetHit(*p)\frames(*p\hitMode))
		EndIf
	EndIf
EndProcedure

Procedure.i checkGrab(*p1.player,*p2.player)
	If frameIsCatch(*p1\currentFrame)
		If isPlayerTouchingPlayer(*p1,*p2)
			*p2\caught=1
			set(*p2\deltaAttack)
			set(*p2\deltaMovement)
			set(*p2\deltaPush)
		Else
			*p2\caught=0
		EndIf
	Else
		*p2\caught=0
	EndIf
EndProcedure

; Returns true if the attacker already hit the defender
; O(n)
Procedure.i hasHit(*attacker.player,*defender.player)
	ForEach *attacker\hit()
		If *attacker\hit()=*defender\id
			ProcedureReturn #True
		EndIf
	Next
	ProcedureReturn #False
EndProcedure

Procedure playerHitAdd(*attacker.player,*defender.player)
	AddElement(*attacker\hit())
	*attacker\hit()=*defender\id	
	*attacker\haveHitSomeone=1
EndProcedure

; check combo
Procedure playerHit(*attacker.player,*defender.player)
	playerHitAdd(*attacker,*defender)
	currentCombo=*attacker\comboCount-1
	If currentCombo<0
		currentCombo=0
	EndIf
	If currentCombo>=#H2H_COMBO_MAX
		currentCombo=#H2H_COMBO_MAX-1
	EndIf
	If Not *attacker\comboHit[currentCombo] ; TODO out of bound
		*attacker\comboHit[currentCombo]=1
		If comboDisplayMode<>#H2H_COMBO_DISPLAY_NONE
			*attacker\comboSize[currentCombo]=1
			*attacker\comboFlash[currentCombo]=1
			If animationIsComboEnd(*attacker\currentAnimation)
				*attacker\comboSuccess[currentCombo]=1
			EndIf
			freq.f=0.4+(currentCombo)*0.21
			volume.f=0.2+(currentCombo)*0.1
			shiftX=#HITBOX_SHIFT_X+#HITBOX_SIZE/2
			If *attacker\lockedDirection
				shiftX=#HITBOX_BACKSHIFT_X+#HITBOX_SIZE/2
			EndIf
			Debug "BONK"
			playPoolSound(*allSoundPool(#H2H_SOUND_COMBO_HIT),*attacker\screenPosition\x+shiftX,0,freq,volume)
		EndIf
	EndIf
EndProcedure

; checks if p1 hit p2 and adds to the p1 combo
Procedure.i checkHit(*p1.player,*p2.player)
	If Not (*p1 And *p2)
		ProcedureReturn 0
	EndIf
	If Not (*p1\life>0 And *p2\life>0)
		ProcedureReturn 0
	EndIf
	
	If *p1\blocked>0
		ProcedureReturn 0
	EndIf
	If isDodgeActive(*p1) Or isDodgeActive(*p2)
		ProcedureReturn 0
	EndIf
	
	If Not playerHasActiveHurtBox(*p1)
		ProcedureReturn 0
	EndIf
	Protected *currentFrame.frame=*p1\currentFrame
	Protected hurtSprite=*currentFrame\hurtId
	
	If hurtSprite And *currentFrame\hurtShift
		Protected hurtShiftX=Mod(*currentFrame\hurtShift\x,1000)
		Protected hurtShiftY=*currentFrame\hurtShift\y
		If *p1\lockedDirection
			hurtSprite=*currentFrame\hurtFlip
			hurtShiftX=*currentFrame\hurtShift\x/1000
		EndIf
		Protected shiftX=#HITBOX_SHIFT_X
		Protected shiftY=#HITBOX_SHIFT_Y
		If *p2\lockedDirection
			shiftX=#HITBOX_BACKSHIFT_X
			shiftY=#HITBOX_BACKSHIFT_Y
		EndIf
		CompilerIf #H2H_PLAYER_BLOCk_ENABLE
		If *p2\blocked<=0 And playerHasActiveHurtBox(*p2)
			*currentFrame2.frame=*p2\currentFrame
			Protected otherHurtSprite=*currentFrame2\hurtId
			If otherHurtSprite And *currentFrame2\hurtShift
				otherHurtShiftX=Mod(*currentFrame2\hurtShift\x,1000)
				otherHurtShiftY=*currentFrame2\hurtShift\y
				If *p2\lockedDirection
					otherHurtSprite=*currentFrame2\hurtFlip
					otherHurtShiftX=*currentFrame2\hurtShift\x/1000
				EndIf
				If IsSprite(hurtSprite) And IsSprite(otherHurtSprite) And SpritePixelCollision(hurtSprite,*p1\position\x+hurtShiftX,*p1\position\y+hurtShiftY,otherHurtSprite,*p2\position\x+otherHurtShiftX,*p2\position\y+otherHurtShiftY)
					; blocked !
					*p1\blocked=(processDamage(*p2,*p1)-processDamage(*p1,*p2))
					If *p1\blocked<0
						*p1\blocked=0
					EndIf
					*p2\blocked=(processDamage(*p1,*p2)-processDamage(*p2,*p1))
					If *p2\blocked<0
						*p2\blocked=0
					EndIf
				EndIf
			EndIf
		EndIf
		CompilerEndIf
		If *p1\blocked<=0
			If isPlayerTouchingPlayer(*p1,*p2)
				playerHit(*p1,*p2)
				ProcedureReturn 1
			EndIf
		Else
			Debug *p1\name+" blocked"
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.i checkAttackColision(*p1.player,*p2.player)
	If Not *p1 Or Not *p2
		ProcedureReturn 0
	EndIf
	If *p1\id=*p2\id
		ProcedureReturn 0
	EndIf
	If *p1\attacking
		If hasHit(*p1,*p2)
			ProcedureReturn 0
		EndIf
		If *p1\blocked=0
			If *p1\currentFrame And *p1\currentFrame\damage And (Not *p1\currentFrame\damageDuration Or *p1\frameIndicator<=*p1\currentFrame\damageDuration)
				ProcedureReturn checkHit(*p1,*p2)
			EndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure    

Procedure checkFacing(*p1.player,*p2.player)
	If *p1\position\x>*p2\position\x
		*p1\direction=0
		*p2\direction=1
	Else
		*p1\direction=1
		*p2\direction=0
	EndIf
	If Not *p1\currentAnimation Or isPlayerAnimationType(*p1,#H2H_ANIMATIONTYPE_IDLE) Or isPlayerAnimationType(*p1,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*p1,#H2H_ANIMATIONTYPE_BACK) Or isPlayerAnimationType(*p1,#H2H_ANIMATIONTYPE_LAND)
		If *p1\lockedDirection<>*p1\direction
		EndIf
		*p1\lockedDirection=*p1\direction
	EndIf
	If Not *p2\currentAnimation Or isPlayerAnimationType(*p2,#H2H_ANIMATIONTYPE_IDLE) Or isPlayerAnimationType(*p2,#H2H_ANIMATIONTYPE_FRONT) Or isPlayerAnimationType(*p2,#H2H_ANIMATIONTYPE_BACK) Or isPlayerAnimationType(*p2,#H2H_ANIMATIONTYPE_LAND)
		If *p2\lockedDirection<>*p2\direction
		EndIf
		*p2\lockedDirection=*p2\direction
	EndIf
EndProcedure

Macro getPlayerCurrentSoundMaterial(p)
	p\class\allStances(p\classStanceId)\materialClass(playerCurrentFrame(p)\damageSide)
EndMacro

Procedure playerHurtParticle(*attacker.player,*defender.player,damage.i,direction.i)
	Protected angle.f=locationAngle(*attacker\position,*defender\position)
	Protected particleLevel.f=damage*2
	particleLevel=Sqr(particleLevel)
	Protected x.f=#HITBOX_SIZE/2-32
	If *defender\direction
		x+*defender\position\x+#HITBOX_BACKSHIFT_X
	Else
		x+*defender\position\x+#HITBOX_SHIFT_X
	EndIf
	Protected y.f=*defender\position\y+#HITBOX_SHIFT_Y+#HITBOX_SIZE/2-64
	Protected size=ArraySize(*hitParticle\sprites())
	Protected start=particleLevel
	Protected dX.f=damage*Cos(angle)*2
	Protected dY.f=damage*Sin(angle)*2
	If *defender\direction
		dX*-1
	EndIf
	For i=0 To particleLevel*2
		particleAdd(*hitParticle,
		            x+Random(#HITBOX_SIZE/2)-#HITBOX_SIZE/4,
		            y+Random(#HITBOX_SIZE/2)-#HITBOX_SIZE/4,
		            dX*Random(110,90)/100.0,
		            dY*Random(110,90)/100.0,
		            particleLevel**hitParticle\lifeSpan,#H2H_PARTICLE_LAYER_BACK)
	Next
EndProcedure

; Shakes the combo indicators
; Spawns the player particles
; Plays the hit sound
Procedure playerHurt(*attacker.player,*defender.player,*f.frame,damage.i,hit.i,*hSM.hitsoundMaterial,delta.d)
	newHit=*attacker\haveHitSomeone
	*d.damageData=0
	If hit
		*d=damageDataAdd(*attacker,*defender,0)
		; get the center of the hitbox
		shiftX=#HITBOX_SHIFT_X+#HITBOX_SIZE/2
		If *defender\direction
			shiftX=#HITBOX_BACKSHIFT_X+#HITBOX_SIZE/2
		EndIf
		hitSoundMaterialPlay(*hSM,damage,*f\damageType,*defender\screenPosition\x+shiftX)
		*d\damage=damage
		playerHurtParticle(*attacker,*defender,damage,*attacker\direction)
		If *defender\life<=damage
			If *f\damageType=#H2H_DAMAGETYPE_BLUNT
				playPoolSound(*allSoundPool(#H2H_SOUND_ID_KILL_BLUNT),*defender\position\x)
			Else
				playPoolSound(*allSoundPool(#H2H_SOUND_ID_KILL_CUT),*defender\position\x)
			EndIf
			screenShakeAdd(50,50)
		EndIf
		screenShakeAdd(damage,damage)
		If Not newHit
			*attacker\comboShake[*attacker\comboCount-1]=20
		Else
			*attacker\comboShake[*attacker\comboCount-1]+4
		EndIf
		If Not newHit
			*attacker\comboSize[*attacker\comboCount-1]=1.5
		Else
			*attacker\comboSize[*attacker\comboCount-1]+0.1
		EndIf
		If *f\stunDuration
			; split because of CPU complexity
			stun=*f\stunDuration*(10+GetWeight(*attacker)+getStrength(*attacker))/(10+getStamina(*defender))
			*d\stun + stun
		EndIf
		Select attackDelayMode
			Case #H2H_DELTA_DELAY_MODE_FIX
				If damage>=#H2H_DELTA_DELAY_THRESHOLD
					deltaDelay+#H2H_DELTA_DELAY
				EndIf
				screenShakeAdd(damage*2,damage*2)
			Case #H2H_DELTA_DELAY_MODE_RELATIVE
				deltaDelay+damage*#H2H_DELTA_DELAY_FACTOR
				screenShakeAdd(damage*2,damage*2)
		EndSelect
		If *f\instantPush
			pushX.f=*f\instantPush\x*delta
			pushY.f=*f\instantPush\y*delta
			If *attacker\lockedDirection
				pushX*-1
			EndIf
			; increased by strength and weight
			pushX*((20+getStrength(*attacker))/20)
			pushY*((20+getStrength(*attacker))/20)
			; reduced by stamina and weight
			pushX*((20-GetWeight(*defender))/20)
			pushY*((20-GetWeight(*defender))/20)
			pushX*((20-getStamina(*defender))/20)
			pushY*((20-getStamina(*defender))/20)
			*d\movedBy=locationCreate(pushX,pushY)
		EndIf
	EndIf
	#H2H_FRAME_PUNCH_BALANCER=1
	If checkHit(*attacker,*defender)
		If Not *d
			*d=damageDataAdd(*attacker,*defender,-1)
		EndIf
		If *attacker\currentFrame\pushPowerD
			pushX.f=*attacker\currentFrame\pushPowerD\x*#H2H_FRAME_PUNCH_BALANCER*delta
			pushY.f=*attacker\currentFrame\pushPowerD\y*#H2H_FRAME_PUNCH_BALANCER*delta
			If *attacker\lockedDirection
				pushX*-1
			EndIf
			; increased by strength and weight
			pushX*((20+getStrength(*attacker))/20)
			pushY*((20+getStrength(*attacker))/20)
			; reduced by stamina and weight
			pushX*((20-GetWeight(*defender))/20)
			pushY*((20-GetWeight(*defender))/20)
			pushX*((20-getStamina(*defender))/20)
			pushY*((20-getStamina(*defender))/20)
			*d\inertia=locationCreate(pushX,pushY)
		EndIf
		If *f\pushPower
			x=*f\pushPower\x*delta
			If *attacker\lockedDirection
				x=-x
			EndIf
			y=*f\pushPower\y*delta
			If *d\movedBy
				locationAdd(*d\movedBy,x,y)
			Else
				*d\movedBy=locationCreate(x,y)
			EndIf
		EndIf
		If *attacker\currentFrame\moveTargetTo
			*d\movedTo=locationCreate(*attacker\position\x,*attacker\position\y)
			locationAddloc(*d\movedTo,*f\moveTargetTo)
		EndIf
		If frameMovementDeltaNeedCatch(*attacker\currentFrame) And ListSize(*attacker\hit())>0
			If *attacker\lockedDirection
				set(*attacker\deltaAttack,-*attacker\currentFrame\movementD\x,
				    				*attacker\currentFrame\movementD\y)
			Else
				set(*attacker\deltaAttack,*attacker\currentFrame\movementD\x,
				    			   *attacker\currentFrame\movementD\y)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure playerAttack(*attacker.player,*defender.player,delta.d=1)
	If Not *attacker Or Not *defender
		ProcedureReturn
	EndIf
	If *attacker=*defender
		ProcedureReturn
	EndIf
	playerHurt(*attacker,*defender,*attacker\currentAnimation\frames(*attacker\currentAnimation\index),processDamage(*attacker,*defender),checkAttackColision(*attacker,*defender),getPlayerCurrentSoundMaterial(*attacker),delta)
EndProcedure


Procedure.i joystickJSONExport(*p)
	*parent=CreateJSONObject()
	; TODO
; #H2H_CONTROLLER_BUTTON_BOTTOM=1				:#H2H_CONTROLLER_BUTTON_BOTTOM_NAME="bottom"
; #H2H_CONTROLLER_BUTTON_LEFT=2				:#H2H_CONTROLLER_BUTTON_LEFT_NAME="left"
; #H2H_CONTROLLER_BUTTON_RIGHT=3				:#H2H_CONTROLLER_BUTTON_RIGHT_NAME="right"
; #H2H_CONTROLLER_BUTTON_TOP=4				:#H2H_CONTROLLER_BUTTON_TOP_NAME="top"
; #H2H_CONTROLLER_L1=5						:#H2H_CONTROLLER_L1_NAME="L1"
; #H2H_CONTROLLER_L2=6						:#H2H_CONTROLLER_L2_NAME="L2"
; #H2H_CONTROLLER_R1=7						:#H2H_CONTROLLER_R1_NAME="R1"
; #H2H_CONTROLLER_R2=8						:#H2H_CONTROLLER_R2_NAME="R2"
; #H2H_CONTROLLER_START=9						:#H2H_CONTROLLER_START_NAME="start"
; #H2H_CONTROLLER_SELECT=10					:#H2H_CONTROLLER_SELECT_NAME="select"
; #H2H_CONTROLLER_JOYSTICK_PRESS_LEFT=11		:#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT_NAME="left joystick click"
; #H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT=12		:#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT_NAME="right joystick click"
EndProcedure

Procedure playerJoystickDisplay(*p.player,x.i,y.i,currentButton)
	joystickDisplay(*p\joystickId,x,y,currentButton,*p\joystickMap())
EndProcedure

Procedure playerRefreshJoystickMap(*p.player)
	For i=0 To ArraySize(*p\joystickMap())
		*p\joystickMap(i)=0
	Next
	If *p\joystickControl\attack
		*p\joystickMap(*p\joystickControl\attack)=#H2H_ACTION_ATTACK
	EndIf
	If *p\joystickControl\heavy
		*p\joystickMap(*p\joystickControl\heavy)=#H2H_ACTION_HEAVY
	EndIf
	If *p\joystickControl\special
		*p\joystickMap(*p\joystickControl\special)=#H2H_ACTION_SPECIAL
	EndIf
	If *p\joystickControl\neutral
		*p\joystickMap(*p\joystickControl\neutral)=#H2H_ACTION_ATTACK_NEUTRAL
	EndIf
	If *p\joystickControl\attackSide
		*p\joystickMap(*p\joystickControl\attackSide)=#H2H_ACTION_ATTACK_SIDE
	EndIf
	If *p\joystickControl\attackBack
		*p\joystickMap(*p\joystickControl\attackBack)=#H2H_ACTION_ATTACK_BACK
	EndIf
	If *p\joystickControl\attackUp
		*p\joystickMap(*p\joystickControl\attackUp)=#H2H_ACTION_ATTACK_UP
	EndIf
	If *p\joystickControl\attackDown
		*p\joystickMap(*p\joystickControl\attackDown)=#H2H_ACTION_ATTACK_DOWN
	EndIf
	If *p\joystickControl\jump
		*p\joystickMap(*p\joystickControl\jump)=#H2H_ACTION_JUMP
	EndIf
	If *p\joystickControl\block
		*p\joystickMap(*p\joystickControl\block)=#H2H_ACTION_BLOCK
	EndIf
	If *p\joystickControl\dashLeft
		*p\joystickMap(*p\joystickControl\dashLeft)=#H2H_ACTION_DASH_LEFT
	EndIf
	If *p\joystickControl\dashRight
		*p\joystickMap(*p\joystickControl\dashRight)=#H2H_ACTION_DASH_RIGHT
	EndIf
	If *p\joystickControl\accept
		*p\joystickMap(*p\joystickControl\accept)=#H2H_ACTION_ACCCEPT
	EndIf
	If *p\joystickControl\cancel
		*p\joystickMap(*p\joystickControl\cancel)=#H2H_ACTION_CANCEL
	EndIf
	If *p\joystickControl\exit
		*p\joystickMap(*p\joystickControl\exit)=#H2H_ACTION_EXIT
	EndIf
EndProcedure

Procedure playerJoystickSet(*p.player,whatButton.i,whatAction.i)
	Select whatAction
		Case #H2H_ACTION_ATTACK
			*p\joystickControl\attack=whatButton
		Case #H2H_ACTION_HEAVY
			*p\joystickControl\heavy=whatButton
		Case #H2H_ACTION_SPECIAL
			*p\joystickControl\special=whatButton
		Case #H2H_ACTION_ATTACK_NEUTRAL
			*p\joystickControl\neutral=whatButton
		Case #H2H_ACTION_ATTACK_SIDE
			*p\joystickControl\attackSide=whatButton
		Case #H2H_ACTION_ATTACK_BACK
			*p\joystickControl\attackBack=whatButton
		Case #H2H_ACTION_ATTACK_UP
			*p\joystickControl\attackUp=whatButton
		Case #H2H_ACTION_ATTACK_DOWN
			*p\joystickControl\attackDown=whatButton
		Case #H2H_ACTION_JUMP
			*p\joystickControl\jump=whatButton
		Case #H2H_ACTION_BLOCK
			*p\joystickControl\block=whatButton
		Case #H2H_ACTION_DASH_RIGHT
			*p\joystickControl\dashRight=whatButton
		Case #H2H_ACTION_DASH_LEFT
			*p\joystickControl\dashLeft=whatButton
		Case #H2H_ACTION_ACCCEPT
			*p\joystickControl\accept=whatButton
		Case #H2H_ACTION_CANCEL
			*p\joystickControl\cancel=whatButton
		Case #H2H_ACTION_EXIT
			*p\joystickControl\exit=whatButton
	EndSelect
 	playerRefreshJoystickMap(*p)
	*p\joystickMap(whatButton)=whatAction
EndProcedure

Procedure resetJoystickToDefault(*p.player)
	controlClear(*p\joystickControl)
	For i=0 To ArraySize(*p\joystickMap())
		*p\joystickMap(i)=0
	Next
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ATTACK,#H2H_ACTION_ATTACK)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_HEAVY,#H2H_ACTION_HEAVY)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_SPECIAL,#H2H_ACTION_SPECIAL)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_NEUTRAL,#H2H_ACTION_ATTACK_NEUTRAL)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ATTACK_SIDE,#H2H_ACTION_ATTACK_SIDE)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ATTACK_BACK,#H2H_ACTION_ATTACK_BACK)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ATTACK_UP,#H2H_ACTION_ATTACK_UP)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ATTACK_DOWN,#H2H_ACTION_ATTACK_DOWN)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_JUMP,#H2H_ACTION_JUMP)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_BLOCK,#H2H_ACTION_BLOCK)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_DASH_LEFT,#H2H_ACTION_DASH_LEFT)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_DASH_RIGHT,#H2H_ACTION_DASH_RIGHT)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_ACCEPT,#H2H_ACTION_ACCCEPT)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_CANCEL,#H2H_ACTION_CANCEL)
	playerJoystickSet(*p,#H2H_JOYSTICK_DEFAULT_EXIT,#H2H_ACTION_EXIT)
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1125
; FirstLine = 798
; Folding = -4BAA4--0+J--f---D7---4-9
; EnableXP
; CPU = 1