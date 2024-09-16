; 		distanceAfter=player1\position\x-player2\position\x
; 		If distanceAfter<0
; 			distanceAfter-1
; 		EndIf
; 		If distanceAfter>=distanceBefore
; 			If distanceAfter>=(DesktopWidth(0)/2)
; 				player1\position\x+(distanceAfter-distanceBefore)*negative
; 			EndIf
; 		EndIf
; 		If player1\id=*leftPlayer\id
; 			If player1\position\x<screenLeft
; 				If screenRight-screenFocus<screenLineSpan
; 					;player1\position\x=player2\position\x+screenLineSpan-#HITBOX_SIZE
; 					screenLeft=player1\position\x
; 					;screenFocus=screenLeft
; 				Else
; 					player1\position\x=screenleft
; 				EndIf
; 			Else
; 				If screenRight-screenLeft<screenLineSpan
; 					;player1\position\x=player2\position\x+screenLineSpan-#HITBOX_SIZE
; 					screenLeft=player1\position\x
; 					;screenFocus=screenLeft
; 				EndIf	
; 			EndIf
; 		Else
; 			If player1\position\x+#HITBOX_SIZE>screenRight
; 				If screenLeft-screenRight<screenLineSpan
; 					screenRight=player1\position\x+#HITBOX_SIZE
; 					screenFocus=screenRight-screenLineSpan
; 				Else
; 					player1\position\x=screenRight-#HITBOX_SIZE
; 				EndIf
; 			EndIf
; 		EndIf
; 		If player2\id=*leftPlayer\id
; 			If player2\position\x<screenLeft
; 				If screenRight-screenFocus<screenLineSpan
; 					;player1\position\x=player2\position\x+screenLineSpan-#HITBOX_SIZE
; 					screenLeft=player2\position\x
; 					screenFocus=screenLeft
; 				Else
; 					player2\position\x=screenleft
; 				EndIf
; 			EndIf
; 		Else
; 			If player2\position\x+#HITBOX_SIZE>screenRight
; 				If screenLeft-screenRight<screenLineSpan
; 					screenRight=player2\position\x+#HITBOX_SIZE
; 					screenFocus=screenRight-screenLineSpan
; 				Else
; 					player2\position\x=screenRight-#HITBOX_SIZE
; 				EndIf
; 			EndIf
; 		EndIf
Procedure.i playerSetAnimIfNot(*p.player,*a.animation,*other.animation=0)
	If *other=0
		If *p\currentAnimation\id<>*a\id
			CopyStructure(*a,*p\currentAnimation,animation)
			animationInit(*p\currentAnimation)
			*p\frameIndicator=0
			ProcedureReturn 1
		EndIf
	Else
		If *p\currentAnimation\id<>*a\id
			CopyStructure(*other,*p\currentAnimation,animation)
			animationInit(*p\currentAnimation)
			*p\frameIndicator=0
			ProcedureReturn 1
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure player_refreshLife(*p.player)
	If *p\life>*p\maxLife
		If *p\regenTick>(200-*p\class\stat\endurence*20)
			*p\regenTick=0
			*p\life+1
		EndIf
		*p\regenTick+1
	EndIf
EndProcedure

Procedure.i player_refreshBorder(*p.player)
	*nextAnimation.animation=#Null
	If *p\direction
		If *p\position\x<(-#HITBOX_BACKSHIFT_X)
			*p\position\x=-#HITBOX_BACKSHIFT_X
			If *p\currentAnimation\id=*p\class\back
				*nextAnimation=*p\class\idle
			EndIf
		Else
			If *p\position\x>terrainWidth-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)
				*p\position\x=terrainWidth-(#HITBOX_BACKSHIFT_X+#HITBOX_SIZE)
				If *p\currentAnimation\id=*p\class\front
					*nextAnimation=*p\class\idle
				EndIf
			EndIf
		EndIf
	Else
		If *p\position\x<-#HITBOX_SHIFT_X
			*p\position\x=-#HITBOX_SHIFT_X
		Else
			If *p\position\x>terrainWidth-(#HITBOX_SHIFT_X+#HITBOX_SIZE)
				*p\position\x=terrainWidth-(#HITBOX_SHIFT_X+#HITBOX_SIZE)
			EndIf
		EndIf
	EndIf
	ProcedureReturn *nextAnimation
EndProcedure

Procedure.i player_isGrounded(*p.player)
	If *p\position\y<=DesktopHeight(0)-#GROUND_LEVEL
		ProcedureReturn 1
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure player_checkJump(*p.player)
	If Not *p\attacking
		If *p\pushed\jump
			If Not *p\controlState\jump And *p\landed
				If player_isGrounded(*p)
					set(*p\deltaMovement,*p\deltaMovement\x,-(40+*p\class\stat\speed*2))
					set(*p\position,*p\position\x,*p\position\y+1) ; so it's not longer grounded
					*p\gravity=1
					*p\controlState\jump=1
					*p\landed=0
				EndIf
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure player_stickToGround(*p.player)
	If player_isGrounded(*p)
		*p\position\y=DesktopHeight(0)-#GROUND_LEVEL
		*p\controlState\jump=0
		*p\gravity=0
		*p\deltaMovement\y=0
		*p\landed=1
	Else
		*p\landed=0
		*p\control\attack=0
	EndIf
EndProcedure

Procedure player_currentAnimationHaveMovement(*p.player)
	ProcedureReturn ~locationIsNull(*p\currentAnimation\frames()\movement)
EndProcedure

Procedure player_applyGravity(*p.player)
	If *p\controlState\jump
		player_stickToGround(*p)
	EndIf
	If Not *p\controlState\jump
		If player_currentAnimationHaveMovement(*p)
			*p\deltaMovement\y=0
 			*p\gravity=0
		EndIf
	EndIf
	If *p\gravity
		w.f=*p\class\stat\weight
		set(*p\deltaMovement,*p\deltaMovement\x,(*p\deltaMovement\y+2)+w/2)
	EndIf
EndProcedure

Procedure.i player_checkMovement(*p.player)
	Protected *newMovementAnimation.animation=#Null
	If *p\pushed\left
		*p\controlState\keep=1
		If *p\controlState\pushed=0
			*p\controlState\pushed=1
			If *p\direction
				If *p\currentAnimation\id<>*p\class\back\id
					*newMovementAnimation=*p\class\back
					*p\frameIndicator=0
				EndIf
			Else
				If *p\currentAnimation\id<>*p\class\front\id
					*newMovementAnimation=*p\class\front
					*p\frameIndicator=0
				EndIf
			EndIf
		EndIf
		locationAdd(*p\deltaMovement,-(10+*p\class\stat\speed*3-max(*p\class\stat\weight-*p\class\stat\strength)))
	EndIf
	If *p\pushed\right
		*p\controlState\keep=1
		If *p\controlState\pushed=0
			*p\controlState\pushed=1
			If *p\direction
				If *p\currentAnimation\id<>*p\class\front\id
					*newMovementAnimation=*p\class\front
					init=1
					*p\frameIndicator=0
				EndIf
			Else
				*newMovementAnimation=*p\class\back
			EndIf
		EndIf
		locationAdd(*p\deltaMovement,10+*p\class\stat\speed*3-max(*p\class\stat\weight-*p\class\stat\strength))
	EndIf
	If *p\pushed\right And *p\pushed\left
		If Not *p\currentAnimation\id=*p\class\idle\id
			*newMovementAnimation=*p\class\idle
			*p\frameIndicator=0
		EndIf
	EndIf
	ProcedureReturn *newMovementAnimation
EndProcedure

Procedure player_nextFrame(*p.player)
	*p\frameIndicator+1
	If *p\frameIndicator>*p\currentAnimation\frames()\length
		*p\frameIndicator=0
		If ListIndex(*p\currentAnimation\frames())>=ListSize(*p\currentAnimation\frames())-1 Or ListIndex(*p\currentAnimation\frames())=-1
			; the animation ended
			ProcedureReturn 1
		EndIf
		; the animation continues
		NextElement(*p\currentAnimation\frames())
		ProcedureReturn 2
	EndIf
	; no frame change
	ProcedureReturn 0
EndProcedure

Procedure.i player_checkAttack(*p.player)
	If *p\attacking
		ProcedureReturn #Null
	EndIf
	
	If *p\control\attack
		Protected *newAttackAnimation.animation
		resetCombo(*p)
		*p\comboCount=1
		*newAttackAnimation=*p\class\neutral
		*p\combo(0)=*p\direction
		Protected init=0
		If *p\direction
			If pushToAnimationCopy(*p,*p\pushed\right,*p\class\nSide,3,*newAttackAnimation) Or pushToAnimationCopy(*p,*p\pushed\left,*p\class\nBack,7,*newAttackAnimation)
				ProcedureReturn *newAttackAnimation
			EndIf
		Else
			If pushToAnimationCopy(*p,*p\pushed\right,*p\class\nBack,6,*newAttackAnimation) Or pushToAnimationCopy(*p,*p\pushed\left,*p\class\nSide,2,*newAttackAnimation)
				ProcedureReturn *newAttackAnimation
			EndIf
		EndIf
		If pushToAnimationCopy(*p,*p\pushed\up,*p\class\nUp,4+*p\direction,*newAttackAnimation) Or pushToAnimationCopy(*p,*p\pushed\down,*p\class\nDown,8+*p\direction,*newAttackAnimation)
			ProcedureReturn *newAttackAnimation
		EndIf
		*p\frameIndicator=0
		ClearList(*p\hit())
		ProcedureReturn *newAttackAnimation
	EndIf	
	ProcedureReturn #Null
EndProcedure

Procedure player_applyMovement(*p.player)
	;----- stabilize delta
	set(*p\deltaMovement,*p\deltaMovement\x*0.5,*p\deltaMovement\y)
	;----- refresh position based on delta
	locationAdd(*p\position,*p\deltaMovement\x+*p\deltaAttack\x,*p\deltaMovement\y+*p\deltaAttack\y)
	; stick player to ground
	player_stickToGround(*p)
EndProcedure

Procedure refreshPlayer_NEW(*p.player, terrainWidth.i=4000)
	;--- life regen check
	If *p\life<=0
		ProcedureReturn
		; no need to continue if the player is dead or not in game
	EndIf
	
	Protected frameWillChange=0
	*p\frameIndicator-1
	If *p\frameIndicator<0
		frameWillChange=1
	EndIf
	player_refreshLife(*p)
	
	;--- recovery
	If *p\recovery>0
		; when in recovery the player can't change his move or attack or jump
		player_applyGravity(*p)
		player_applyMovement(*p.player)
		*p\recovery-1
		ProcedureReturn
	EndIf
	
	;--- movement
	; he can jump if not in recovery
	player_checkJump(*p.player)
	player_applyGravity(*p)
	
	Protected nextAnimation.animation
	;;;;;;;;;;;;;;;;;;
	Protected movementAnimation.animation
	animationCopy(@movementAnimation,player_checkMovement(*p))
	If movementAnimation<>#Null
		; the called movement is not null
		nextAnimation=movementAnimation
	EndIf
	;;;;;;;;;;;;;;;;;;
	Protected borderAnimation.animation
	animationCopy(@borderAnimation.animation,player_refreshBorder(*p))
	If borderAnimation<>#Null
		; if the player is indeed in a border, give the proprer direction
		nextAnimation=borderAnimation
	EndIf
	;;;;;;;;;;;;;;;;;;
	
	If Not player_isGrounded(*p)
		; a player in air can't attack
		player_applyMovement(*p.player)
		ProcedureReturn
	EndIf
	If *p\pushed\attack
		*p\control\attack=1
	EndIf
	Protected framestatus=player_nextFrame(*p)
	If framestatus=0
		
	EndIf
	; if the attack needs to be changed
	Protected attackAnimation.animation
	animationCopy(@attackAnimation,player_checkAttack(*p))
	If attackAnimation<>#Null
		; if the attack is still the same or not attacking
		nextAnimation=attackAnimation
		*p\attacking=1
	EndIf
	;apply movements
	player_applyMovement(*p.player)
EndProcedure

;-----------------------------------------------------------
	afftext("Red  movement/attack/heavy : arrows/P/O",0,20)
	afftext("Blue movement/attack/heavy : YGHJ/[Q or A]/W",0,40)
	afftext("Restart : R",0,60)
	afftext("Enable/disable Debug : D",0,80)
	afftext("Enable/disable Music : M or coma",0,100)
	afftext("Enable/disable Blue AI : B",0,120)
	afftext("Enable/disable Red AI : E",0,140)
	afftext("Quit : Escape",0,160)
	afftext("Basic combo     : Side - Side - Side",0,180)
	afftext("Defensive combo : neutral - neutral - neutral - neutral",0,200)
	afftext("Heavy combo     : Heavy - neutral - Up",0,220)
	
	; Procedure decodeAllShift(*a.animation, *item.rawdataArray)
; 	FirstElement(*a\frames())
; 	i=0
; 	MessageRequester("test","before")
; 	decodeShift(*a\frames(),*item\rd(i))
; 	MessageRequester("test","after "+ListSize(*a\frames()))
; 	While NextElement(*a\frames())
; 		i+1
; 		MessageRequester("test","loop "+i)
; 		decodeShift(*a\frames(),*item\rd(i))
; 		MessageRequester("test","loop after "+i)
; 	Wend
; 	FirstElement(*a\frames())
; EndProcedure
	
	
; Procedure soloVersusBot(*game.game=0,delta.d=1,previousDelta.d=1)
;{
; 	If Not *game
; 		*game=*mainGame
; 	EndIf
; 	; the game is supposed to have a group with the player
; 	; and an other with of one or more ennemies
; 	; The two groups are ennemies
; 	clearScreenGray()
; 	;---actions player
; 	refreshPlayer(*player1,*mainGame\terrain,delta,previousDelta)
; 	;---actions bots
; 	FirstElement(*game\allGroups())
; 	NextElement(*game\allGroups()) ; <--- ennemies group
; 	If isPlayerAlive(*player1)
; 		ForEach *game\allGroups()\players()
; 			*tmpPlayer.player=*game\allGroups()\players()
; 			If isPlayerAlive(*game\allGroups()\players())
; 				cleanPlayerKey(*tmpPlayer)
; 				If *tmpPlayer\bot=0
; 					*tmpPlayer\bot=createAI(*tmpPlayer)
; 				EndIf
; 				AI_decision(*tmpPlayer\bot,*player1)
; 			EndIf
; 		Next
; 	EndIf
; 	;---attack !
; 	If isPlayerAlive(*player1)
; 		groupFacePlayer(*game\allGroups(),*player1)
; 	EndIf
; 	dead=0
; 	checkScreenFocus(*player1,groupGetClosestPlayer(*player1,*game\allGroups()))
; 	;---display
; 	backgroundRefresh(*game\terrain,screenFocus,screenSizeX)
; 	backgroundDisplay(*game\terrain,screenFocus,screenSizeX,screenSizeY)
; 	set(*player1\screenPosition,*player1\position\x-screenFocus,*player1\position\y)
; 	If isPlayerAlive(*player1)
; 		
; 	Else
; 		dead=1
; 	EndIf
; 	set(*player2\screenPosition,*player2\position\x-screenFocus,*player2\position\y)
; 	If groupIsAlive(*game\allGroups())
; 		
; 	Else
; 		dead=2
; 	EndIf
; 	If *player1\attacking
; 		displayPlayer(*player2)
; 		displayPlayer(*player1)
; 	Else
; 		displayPlayer(*player1)
; 		displayPlayer(*player2)
; 	EndIf
; 	If *player1\displayDebug>0
; 		displayPlayerDebug(*player1)
; 	EndIf
; 	If *player2\displayDebug>0
; 		displayPlayerDebug(*player2)
; 	EndIf
; 	If isPlayerAlive(*player1)
; 		displayPlayerCombo(*player1)
; 	EndIf
; 	If isPlayerAlive(*player2)
; 		displayPlayerCombo(*player2)
; 	EndIf
; 	If isPlayerAlive(*player1) And isPlayerAlive(*player2)
; 		playerAttack(*player1,*player2)
; 		playerAttack(*player2,*player1)
; 	EndIf
; 	If debugEnabled>0
; 		difference=*rightPlayer\position\x-*leftPlayer\position\x
; 		leftX=*leftPlayer\position\x
; 		rightX=*rightPlayer\position\x
; 		afftext("difference : "+difference,400,400)
; 		afftext("leftX : "+leftX,400,420)
; 		afftext("RightX: "+rightX,400,440)
; 		afftext("Focus: "+screenFocus,400,480)
; 		DisplaySprite(debugMiniGround,400-#HITBOX_BACKSHIFT_X/10,500)
; 		DisplaySprite(debugMinileft,400+(screenFocus-#HITBOX_BACKSHIFT_X)/10,500)
; 		DisplaySprite(debugMiniright,400+(screenFocus+screenLineSpan-#HITBOX_SHIFT_X)/10,500)
; 		DisplaySprite(debugPlayer,400+*player1\position\x/10,500)
; 		DisplaySprite(debugPlayer,400+*player2\position\x/10,500)
; 	EndIf
; 	DisplayTransparentSprite(instructionBackground,0,0,128)
; 	afftext("Hand2Hand project "+#H2H_VERSION,0,0)
; 	;----- commands
; 	If isPlayerAlive(*player1)
; 		If KeyboardReleased(#PB_Key_R)
; 			resetGame()
; 		EndIf
; 	EndIf
; 	If debugEnabled<>0
; 		If KeyboardReleased(#PB_Key_D)
; 			*player1\displayDebug=*player1\displayDebug*-1
; 			ForEach *game\allGroups()\players()
; 				*game\allGroups()\players()\displayDebug=*game\allGroups()\players()\displayDebug*-1
; 			Next
; 			debugEnabled*-1
; 		EndIf
; 		If KeyboardReleased(#PB_Key_F)
; 			If showFPS
; 				showFPS=0
; 			Else
; 				showFPS=1
; 			EndIf
; 		EndIf
; 	EndIf
; 	If KeyboardPushed(#PB_Key_F4) And KeyboardPushed(#PB_Key_LeftAlt)
; 		End
; 	EndIf
; 	If  buffedFrames=#H2H_FRAME_BUFFER_ON Or buffedFrames=#H2H_FRAME_BUFFER_ON_PLUS_HALF
; 		purgeFrameBuffer()
; 	EndIf
; 	ProcedureReturn dead
; EndProcedure
;}
; Procedure soloVersusManyTODO(*game.game=0)
;{
; 	If Not *game
; 		*game=*mainGame
; 	EndIf
; 	clearScreenGray()
; 	at1=0
; 	;---actions player 1
; 	If isPlayerAlive(*player1)
; 		If *player1\pushed\attack
; 			at1=1
; 		EndIf
; 		If *player1\isAI And *bot1\mode<>#H2H_AI_MODE_DISABLED
; 			cleanPlayerKey(*player1)
; 			If *bot1=0
; 				*bot1=createAI(*player1)
; 			EndIf
; 			AI_decision(*bot1,*player2)
; 		EndIf
; 	EndIf
; 	refreshPlayer(*player1,*game\terrain)
; 	;---actions player 2
; 	If isPlayerAlive(*player2)
; 		If *player2\isAI And *bot2\mode<>#H2H_AI_MODE_DISABLED
; 			cleanPlayerKey(*player2)
; 			If *bot2=0
; 				*bot2=createAI(*player2)
; 			EndIf
; 			AI_decision(*bot2,*player1)
; 		EndIf
; 	EndIf
; 	refreshPlayer(*player2,*game\terrain)
; 	If isPlayerAlive(*player1) And isPlayerAlive(*player2)
; 		checkPlayerFacing()
; 	EndIf
; 	dead=0
; 	checkScreenFocus()
; 	;---display
; 	backgroundRefresh(*game\terrain,screenFocus,screenSizeX)
; 	backgroundDisplay(*game\terrain,screenFocus,screenSizeX,screenSizeY)
; 	set(*player1\screenPosition,*player1\position\x-screenFocus,*player1\position\y)
; 	If isPlayerAlive(*player1)
; 		
; 	Else
; 		dead=1
; 	EndIf
; 	set(*player2\screenPosition,*player2\position\x-screenFocus,*player2\position\y)
; 	If isPlayerAlive(*player2)
; 		
; 	Else
; 		dead=2
; 	EndIf
; 	If *player1\attacking And Not *player2\attacking
; 		displayPlayer(*player2)
; 		displayPlayer(*player1)
; 	Else
; 		displayPlayer(*player1)
; 		displayPlayer(*player2)
; 	EndIf
; 	If *player1\displayDebug>0
; 		displayPlayerDebug(*player1)
; 	EndIf
; 	If *player2\displayDebug>0
; 		displayPlayerDebug(*player2)
; 	EndIf
; 	If isPlayerAlive(*player1)
; 		displayPlayerCombo(*player1)
; 	EndIf
; 	If isPlayerAlive(*player2)
; 		displayPlayerCombo(*player2)
; 	EndIf
; 	If isPlayerAlive(*player1) And isPlayerAlive(*player2)
; 		playerAttack(*player1,*player2)
; 		playerAttack(*player2,*player1)
; 	EndIf
; 	If debugEnabled>0
; 		difference=*rightPlayer\position\x-*leftPlayer\position\x
; 		leftX=*leftPlayer\position\x
; 		rightX=*rightPlayer\position\x
; 		afftext("difference : "+difference,400,400)
; 		afftext("leftX : "+leftX,400,420)
; 		afftext("RightX: "+rightX,400,440)
; 		afftext("Focus: "+screenFocus,400,480)
; 		DisplaySprite(debugMiniGround,400-#HITBOX_BACKSHIFT_X/10,500)
; 		DisplaySprite(debugMinileft,400+(screenFocus-#HITBOX_BACKSHIFT_X)/10,500)
; 		DisplaySprite(debugMiniright,400+(screenFocus+screenLineSpan-#HITBOX_SHIFT_X)/10,500)
; 		DisplaySprite(debugPlayer,400+*player1\position\x/10,500)
; 		DisplaySprite(debugPlayer,400+*player2\position\x/10,500)
; 		If at1
; 			Afftext("attack",600,600)
; 		EndIf
; 	EndIf
; 	DisplayTransparentSprite(instructionBackground,0,0,128)
; 	afftext("Hand2Hand project "+#H2H_VERSION,0,0)
; 	;----- commands
; 	If isPlayerAlive(*player1) And isPlayerAlive(*player2)
; 		If KeyboardReleased(#PB_Key_R)
; 			resetGame()
; 		EndIf
; 		If KeyboardReleased(#PB_Key_V)
; 			If *bot1\mode=#H2H_AI_MODE_DISABLED
; 				enableAI(*bot1)
; 			Else
; 				disableAI(*bot1)
; 			EndIf
; 		EndIf
; 		If KeyboardReleased(#PB_Key_B)
; 			If *bot2\mode=#H2H_AI_MODE_DISABLED
; 				enableAI(*bot2)
; 			Else
; 				disableAI(*bot2)
; 			EndIf
; 		EndIf
; 	EndIf
; 	If debugEnabled<>0
; 		If(KeyboardReleased(#PB_Key_D))
; 			*player1\displayDebug=*player1\displayDebug*-1
; 			*player2\displayDebug=*player2\displayDebug*-1
; 			debugEnabled*-1
; 		EndIf
; 	EndIf
; 	If KeyboardReleased(#PB_Key_0)
; 		definedFPS+5
; 	EndIf
; 	If(KeyboardReleased(#PB_Key_1))
; 		definedFPS-5
; 		If definedFPS<5
; 			definedFPS=5
; 		EndIf
; 	EndIf
; 	If KeyboardPushed(#PB_Key_F4) And KeyboardPushed(#PB_Key_LeftAlt)
; 		End
; 	EndIf
; 	If  buffedFrames=#H2H_FRAME_BUFFER_ON Or buffedFrames=#H2H_FRAME_BUFFER_ON_PLUS_HALF
; 		purgeFrameBuffer()
; 	EndIf
; 	ProcedureReturn dead
; EndProcedure
;}

Procedure checkLoop(inBattle=#False)
; 	If GetActiveWindow()<>-1
; 		ExamineKeyboard()
; 	EndIf
; 	CompilerIf #H2H_MOUSE_ENABLED
; 		ExamineMouse()
; 	CompilerEndIf
; 	If Not gamePaused
; 	  checkPlayerKey(*player1,inBattle)
; 	  checkPlayerKey(*player2,inBattle)
; 	  checkFacing(*player1,*player2)
; 	Else
; 		If *player1\joystickId<>-1
; 			ExamineJoystick(*player1\joystickId)
; 		EndIf
; 		If *player2\joystickId<>-1
; 			ExamineJoystick(*player2\joystickId)
; 		EndIf
; 	EndIf
EndProcedure
; KeyboardMode(#PB_Keyboard_International)

; Procedure gameloop(*what.game=0,gameType.i=#H2H_GAME_1V1)
; 
; 	dead=mainLoop(*what,deltaGlobal,deltaGlobal)
; 	
;   	ProcedureReturn dead
; EndProcedure

Procedure endGame(deadplayer.i=0,*what.game=0, gameType.i=#H2H_GAME_1V1,*b.background=0)
	If Not *what
		*what=*mainGame
	EndIf
	If Not *b
		*b=*mainGame\terrain
	EndIf
	If musicLevel>0
		If IsSound(*b\music)
			StopSound(*b\music)
			FreeSound(*b\music)
		EndIf
		If IsSound(#H2H_MUSIC_STARTUP)
			StopSound(#H2H_MUSIC_STARTUP)
			FreeSound(#H2H_MUSIC_STARTUP)
		EndIf
	EndIf
	winner=1
	If deadplayer=1 XOr deadplayer=2
		If deadplayer=1
			winner=2
		EndIf
		If musicLevel
			If deadplayer=1
				If gameType=#H2H_GAME_1VBOT; Or *player2\isAI>0
					LoadSound(#H2H_MUSIC_DEFEAT,#H2H_MUSIC_DEFEAT_PATH)
					PlaySound(#H2H_MUSIC_DEFEAT,0,musicLevel)
				Else
					LoadSound(#H2H_MUSIC_VICTORY,#H2H_MUSIC_VICTORY_PATH)
					PlaySound(#H2H_MUSIC_VICTORY,0,musicLevel)
				EndIf
			Else
				LoadSound(#H2H_MUSIC_VICTORY,#H2H_MUSIC_VICTORY_PATH)
				PlaySound(#H2H_MUSIC_VICTORY,0,musicLevel)
			EndIf
		EndIf
		If deadplayer>0
			time.d=0
 			delta.d=currentMillisecond/defaultMillisecond
 			previousDelta.d=delta
			exit=0
			Repeat
				stamp.d=ElapsedMillisecondsPrecise()
				checkLoop()
				y=0
				If gameType=#H2H_GAME_1V1
; 					mainLoop(0,delta,previousDelta)
					If winner=1
						y=AfftextColor("Winner is player "+winner+" !",100,200,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
					Else
						y=AfftextColor("Winner is player "+winner+" !",100,300,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
					EndIf
				EndIf
 				If gameType=#H2H_GAME_1VBOT
; 					mainLoop(0,delta,previousDelta)
					; soloVersusBot(*what1,delta,previousDelta)
					If winner=1
						y=AfftextColor("You win !!!",100,300,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
					Else
						y=AfftextColor("You lose...",100,300,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
					EndIf
 				EndIf
 				If winner=1
 					AfftextColor("Back to the main menu in "+Str(max(5-(time/1000)))+" seconds",100,y,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
 				Else
 					AfftextColor("Back to the main menu in "+Str(max(5-(time/1000)))+" seconds",100,y,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
 				EndIf
 				CompilerIf #H2H_WINDOWED
 					Repeat
						Event = WindowEvent()
						Select Event 
							Case #PB_Event_Gadget
								If EventGadget() = 0
									End
								EndIf
							Case #PB_Event_CloseWindow
								End 
						EndSelect
					Until Not Event
				CompilerEndIf
				If blackScreenEnabled
					blackScreenDisplay()
				EndIf
			  	If KeyboardPushed(#PB_Key_LeftShift) And KeyboardReleased(#PB_Key_F)
			  		screenShot()
			  	EndIf
			  	If KeyboardPushed(#PB_Key_LeftAlt) And KeyboardReleased(#PB_Key_F4)
			  		End
			  	EndIf
				FlipBuffers()
				previousDelta=delta
				frameLoadLoop()
				delta=deltaSet(stamp)
				If *player1\tmpHitMode<0 And *player2\tmpHitMode<0
					time+(ElapsedMillisecondsPrecise()-stamp)
					If time>5000
						If Not blackScreenEnabled
							blackScreenStart()
						EndIf
					EndIf
				EndIf
				If blackScreenLoop(delta)=1
					exit=1
				EndIf
			Until exit=1
		EndIf
	EndIf
	If musicLevel>0
		If IsSound(#H2H_MUSIC_DEFEAT)
			StopSound(#H2H_MUSIC_DEFEAT)
			FreeSound(#H2H_MUSIC_DEFEAT)
		EndIf
		If IsSound(#H2H_MUSIC_VICTORY)
			StopSound(#H2H_MUSIC_VICTORY)
			FreeSound(#H2H_MUSIC_VICTORY)
		EndIf
		LoadSound(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
		PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop,musicLevel)
	EndIf
	blackScreenStart(#True)
	If *what
		gameUnload(*what)
	Else
		classUnload(*player1\class,#True)
		classUnload(*player2\class,#True)
		clearPlayerFrames(*player1)
		clearPlayerFrames(*player2)
	EndIf
	gadgetDestroyAll()
	damageGadgetDestroyAll()
	CompilerIf #H2H_DEBUG=1
		destroyDebugSprites()
	CompilerEndIf
	backgroundDestroy(*b)
	screenFocus=0
	screenFocusHeight=0
; 	controlClear(*menuControl)
EndProcedure
Declare launchCommandThread()


Procedure selectMenu(x.i=0,y.i=0)
	Protected selectedMenu=0
	Protected previousMenu=0
	Protected returnTo=-1
	Protected playerSelection=-1
	Protected specificMode=-1
	If keyboardType=#PB_Keyboard_International
		KeyboardMode(#PB_Keyboard_International)
	Else
		KeyboardMode(#PB_Keyboard_Qwerty)
	EndIf
	While #True
		If returnTo<>-1
			selectedMenu=returnTo
			returnTo=-1
		Else
			If specificMode<>-1
				selectedMenu=specificMode
				specificMode=-1
			Else
				selectedMenu=menuLoop(x,y,previousMenu)
			EndIf
		EndIf
		previousMenu=selectedMenu
		Select selectedMenu
		Case 6
			End
		Case 0 ;{
			selection:
; 			playerSelection=classGalleryLoop(#H2H_CLASS_GALLERY_MODE_VERSUS)
			specificMode=-1
			If playerSelection<>-999
				specificMode=0
				*mainGame=gameCreate1v1(*mainGame,*desktop,#False)
				If *bot1
					disableAI(*bot1)
				EndIf
				If *bot2
					disableAI(*bot2)
				EndIf
				playerPrepare(*player1,*player2,playerSelection)
				backgroundLoad(*allBackground(0))
				selectedterrain=terrainSelection(x,y)
				If selectedterrain=-2
; 					returnTo=0
					Goto selection
				EndIf
				If selectedterrain=-1
					selectedterrain=Random(ArraySize(*allBackground()))
				EndIf
				*mainGame\terrain=*allBackground(selectedterrain)
				startGame(*mainGame\terrain)
			EndIf ;}
		Case 1
			*mainGame=gameCreate1v1(*mainGame,*desktop,#True)
; 			playerSelection=classGalleryLoop(#H2H_CLASS_GALLERY_MODE_SELECTION)
			Debug "selected player "+playerSelection
			If playerSelection=-999
				specificMode=-1
				Continue
			EndIf
			specificMode=1
			Debug "selection is "+playerSelection
			randomStance=#False
			playerPrepare(*player1,*player2,playerSelection)
			difficulty:
			botDifficulty=difficultyMenu(#H2H_SCREEN_BORDER_THICKNESS*2,#H2H_SCREEN_BORDER_THICKNESS*2)
			If botDifficulty<=-1 Or botDifficulty>=#H2H_AI_LEVEL_HARD
				returnTo=1
				Continue
			EndIf
			botDifficulty+1
			If Not *bot1
				returnTo=1
				*bot1=createAI(*player1)
			EndIf
			disableAI(*bot1)
			If Not *bot2
				*bot2=createAI(*player2)
			EndIf
			*bot2\difficulty=botDifficulty
			enableAI(*bot2)
			backgroundLoad(*allBackground(0))
			selectedterrain=terrainSelection(x,y)
			If selectedterrain=-2
				Goto difficulty
			EndIf
			If selectedterrain=-1
				selectedterrain=Random(ArraySize(*allBackground()))
			EndIf
			*mainGame\terrain=*allBackground(selectedterrain)
			startGame(*mainGame\terrain)
		Case 2
; 			classGalleryLoop(#H2H_CLASS_GALLERY_MODE_PREVIEW)
		Case 3
			selectOption(x,y)
		Case 4
			tutorialMenu(x,y)
		Case 5
			creditMenu(x,y)
	EndSelect
	Wend
EndProcedure


;{
; Procedure classSelectionSolo(*gadget.animationGadget=0,*gadget2.animationGadget=0,delta.d=1,reinit.i=#False)
; 	Static currentSelection=0
; 	Static pressNext=0
; 	Static pressPrevious=0
; 	Static pressUp=0
; 	Static pressDown=0
; 	Static pressAccept=0
; 	Static pressReturn=0
; 	Static pressCancel=0
; 	Static playerSelection=0
; 	Static stanceSelection=0
; 	Static playerClassSelection=0
; 	Static playerStanceSelection=0
; 	Static botClassSelection=0
; 	Static botStanceSelection=0
; 	Static reset=#False
; 	Static selectIA=#False
; 	Static selected=#False
; 	Static startI=0
; 	If reinit And reset
; 		Debug "reinit"
; 		reset=#False
; 		selectIA=#False
; 		selected=#False
; 		currentSelection=0
; 		stanceSelection=0
; 		playerSelection=0
; 		previousSelection=0
; 		previousStance=0
; 		startI=0
; 		*gadget\display=#False
; 		*gadget2\display=#False
; 	EndIf
; 	shineLoop(delta)
; 	previousSelection=currentSelection
; 	previousStance=stanceSelection
; 	If *player1\pushed\right=1 Or *menuControl\right=1
; 	  pressNext+1
; 	Else
; 	  pressNext=0
; 	EndIf
; 	If *player1\pushed\left=1 Or *menuControl\left=1
; 		pressPrevious+1
; 	Else
; 	  pressPrevious=0
; 	EndIf
; 	If *player1\pushed\up=1 Or *menuControl\up=1
; 	  pressUp+1
; 	Else
; 	  pressUp=0
; 	EndIf
; 	If *player1\pushed\down=1 Or *menuControl\down=1
; 		pressDown+1
; 	Else
; 		pressDown=0
; 	EndIf
; 	If *player1\pushed\attack=1 Or *menuControl\attack=1
; 	  pressAccept+1
; 	Else
; 		pressAccept=0
; 	EndIf
; 	If *player1\pushed\special=1 Or *menuControl\special=1
; 	  pressReturn+1
; 	Else
; 	  pressReturn=0
; 	EndIf
; 	If *player1\pushed\heavy=1 Or *menuControl\heavy=1
; 	  pressCancel+1
; 	Else
; 	  pressCancel=0
; 	EndIf
; 	If Not selected
; 		;{
; 		If pressNext=1
; 			currentSelection+1
; 			If currentSelection>ArraySize(*availableClasses())
; 				currentSelection=0
; 			EndIf
; 			If distanceInList(startI,currentSelection)>=#H2H_CLASS_GALLERY_GRID_SIZE_X/100
; 				startI+1
; 				If startI>ArraySize(*availableClasses())
; 					startI=0
; 				EndIf
; 			EndIf
; 			stanceSelection=0
; 		EndIf
; 		If pressPrevious=1
; 			currentSelection-1
; 			If currentSelection<0
; 				currentSelection=ArraySize(*availableClasses())
; 				If startI=0
; 					startI=ArraySize(*availableClasses())
; 				EndIf
; 			EndIf
; 			If startI>currentSelection And distanceInList(startI,currentSelection)>#H2H_CLASS_GALLERY_GRID_SIZE_X/100-1
; 				startI-1
; 				If startI<0
; 					startI=ArraySize(*availableClasses())
; 				EndIf
; 			EndIf
; 			stanceSelection=0
; 		EndIf
; 		If pressUp=1
; 			stanceSelection-1
; 		EndIf
; 		If pressDown=1
; 			stanceSelection+1
; 		EndIf
; 		If pressNext=1 Or pressPrevious=1
; 			If selectIA
; 				botClassSelection=finalSelection
; 			Else
; 				playerClassSelection=finalSelection
; 			EndIf
; 		EndIf
; 		If pressUp=1 Or pressDown=1
; 			If selectIA
; 				botStanceSelection=stanceSelection
; 			Else
; 				playerStanceSelection=stanceSelection
; 			EndIf
; 		EndIf
; 		;}
; 	EndIf
; 	If currentSelection>ArraySize(*availableClasses())
; 		currentSelection=0
; 	EndIf
; 	If currentSelection<0
; 		currentSelection=ArraySize(*availableClasses())
; 	EndIf
; 	If stanceSelection<-2
; 		stanceSelection=-2
; 	EndIf
; 	finalSelection=*availableClasses(currentSelection)
; 	If finalSelection>=0
; 		If stanceSelection> ArraySize(*allClasses(finalSelection)\allStances())
; 			stanceSelection=ArraySize(*allClasses(finalSelection)\allStances())
; 		EndIf
; 	Else
; 		stanceSelection=0
; 	EndIf
; ; 	If selected
; ; 		playerClassSelection=finalSelection
; ; 		playerStanceSelection=stanceSelection
; ; 	Else
; ; 		botClassSelection=finalSelection
; ; 		botStanceSelection=stanceSelection
; ; 	EndIf
; 	If previousSelection<>currentSelection Or stanceSelection<>previousStance
; 		psound(#H2H_SOUND_ID_MENUCLIC)
; 		If previousSelection<>currentSelection
; 			If currentSelection>=0
; 				If finalSelection>=0
; 					classLoadIconCroped(*allClasses(finalSelection))
; 				EndIf
; 			EndIf
; 			If selectIA
; 				gadgetReset(*gadget2)
; 			Else
; 				gadgetReset(*gadget)
; 			EndIf
; 		EndIf
; 	EndIf
; 	If selectIA
; 		If selected
; 			AfftextColor("Bring in on !",75,125,RGB(255,0,0),128,1.5)
; 		Else
; 			AfftextColor("Pick your opponent",75,125,RGB(0,0,255),128,1.5)
; 		EndIf
; 	Else
; 		AfftextColor("Pick your class",75,125,RGB(255,128,0),128,1.5)
; 	EndIf
; 	If finalSelection>=0
; 		AfftextColor(*allClasses(finalSelection)\name,100,60,0,128,2)
; 		If stanceSelection>=0
; 			Afftext(*allClasses(finalSelection)\allStances(stanceSelection)\name,100,100)
; 			*player1\usesAlternate=#False
; 			*player2\usesAlternate=#False
; 			If selectIA
; 				*player2\class=*allClasses(finalSelection)
; 				*player2\currentStance=*allClasses(finalSelection)\allStances(stanceSelection)
; 				If playerClassSelection>=0 And playerStanceSelection>=0 And botClassSelection>=0 And botStanceSelection>=0
; 					playerPrepareColor(*player1,*player2)
; 				EndIf
; 				*gadget\color=playerGetColor(*player1)
; 				*gadget\colorIntensity=playerGetColorIntensity(*player1)
; 				*gadget2\color=playerGetColor(*player2)
; 				*gadget2\colorIntensity=playerGetColorIntensity(*player2)
; 			Else
; 				*player1\class=*allClasses(finalSelection)
; 				*player1\currentStance=*allClasses(finalSelection)\allStances(stanceSelection)
; 				*gadget\color=playerGetColor(*player1)
; 				*gadget\colorIntensity=playerGetColorIntensity(*player1)
; 			EndIf
; 		Else
; 			If stanceSelection=-1
; 				AfftextColor("Random",100,100,#H2H_STANCE_COLOR_BLACK)
; 			EndIf
; 			If stanceSelection=-2
; 				AfftextColor("Mirror",100,100,#H2H_STANCE_COLOR_BLACK)
; 			EndIf
; 		EndIf
; 		If playerStanceSelection=-1
; 			*gadget\color=RGB(1,1,1)
; 			*gadget\colorIntensity=254
; 		EndIf
; 		If playerStanceSelection=-2
; 			*gadget\color=RGB(255,255,255)
; 			*gadget\colorIntensity=254
; 		EndIf
; 		If botStanceSelection=-1
; 			*gadget2\color=RGB(1,1,1)
; 			*gadget2\colorIntensity=254
; 		EndIf
; 		If botStanceSelection=-2
; 			*gadget2\color=RGB(255,255,255)
; 			*gadget2\colorIntensity=254
; 		EndIf
; 		refreshAllGadget(delta)
; 		If screenSizeX>=1200
; 			If *gadget And *gadget\what And *gadget\display
; 				displayFrameShadow(*gadget\what\frames(*gadget\index),*gadget\where\x,*gadget\where\y,0,#False,*gadget\color,*gadget\colorIntensity)
; 			EndIf
; 			If *gadget2 And *gadget2\what And *gadget2\display
; 				displayFrameShadow(*gadget2\what\frames(*gadget2\index),*gadget2\where\x,*gadget2\where\y,1,#False,*gadget2\color,*gadget2\colorIntensity)
; 			EndIf
; 			displayAllGadget(#H2H_GADGET_LAYER_BACK)
; 		EndIf
; 		If stanceSelection>=0
; 			If selectIA
; 				classDisplaySelection(*allClasses(finalSelection),stanceSelection,75,200,*gadget2)
; 			Else
; 				classDisplaySelection(*allClasses(finalSelection),stanceSelection,75,200,*gadget)
; 			EndIf
; 		Else
; 			If selectIA
; 				classDisplaySelection(*allClasses(finalSelection),0,75,200,*gadget2)
; 			Else
; 				classDisplaySelection(*allClasses(finalSelection),0,75,200,*gadget)
; 			EndIf
; 		EndIf
; 		If screenSizeX>=1200
; 			displayAllGadget(#H2H_GADGET_LAYER_FRONT)
; 		Else
; 			If selectIA
; 				classLoadIcon(*allClasses(finalSelection))
; 				classDisplayIcon(*allClasses(finalSelection),75,150,*gadget2\color,*gadget2\opacity,#True)
; 				
; 				classLoadIcon(*allClasses(playerSelection))
; 				classDisplayIcon(*allClasses(playerSelection),screenSizeX-600,150,*gadget\color,*gadget\opacity)
; 			Else
; 				classLoadIcon(*allClasses(finalSelection))
; 				classDisplayIcon(*allClasses(finalSelection),screenSizeX-600,150,*gadget\color,*gadget\opacity)
; 			EndIf
; 		EndIf
; 		
; 		If screenSizeX>=1200
; 			If selectIA And Mod(playerSelection,100)<98 And *gadget\what And *gadget\display
; 				displayFrameShadow(*gadget\what\frames(*gadget\index),*gadget\where\x,*gadget\where\y,0,#False,*gadget\color,*gadget\colorIntensity)
; 			EndIf
; 		EndIf
; 	Else
; 		refreshAllGadget(delta)
; 		If screenSizeX>=1200
; 			displayAllGadget(#H2H_GADGET_LAYER_BACK)
; 		EndIf
; 		If finalSelection=-1
; 			AfftextColor("Random",100,80,#H2H_STANCE_COLOR_BLACK,128,2)
; 			If selectIA
; 				*gadget2\display=0
; 			Else
; 				*gadget\display=0
; 			EndIf
; 		EndIf
; 		If finalSelection=-2
; 			AfftextColor("Mirror",100,80,#H2H_STANCE_COLOR_BLACK,128,2)
; 			If selectIA
; 				*gadget2\display=0
; 			Else
; 				*gadget\display=0
; 			EndIf
; 		EndIf
; 	EndIf
; 	If screenSizeX>=1200
; 		displayAllGadget(#H2H_GADGET_LAYER_FRONT)
; 	EndIf
; 	If screenSizeY>800
; 		classLineDisplay(finalSelection,100,700,#True,#True,startI)
; 	EndIf
; 
; 	CompilerIf #H2H_MOUSE_ENABLED
; 		cursorDisplay()
; 	CompilerEndIf
; 	result=-999
; 	If pressReturn=1; And blackScreenVelocity<=0
; 		; back to player selection
; ; 		Debug "back to player"
; 		psound(#H2H_SOUND_ID_MENUCANCEL)
; 		selectIA=#False
; 		selected=#False
; 		*gadget2\display=#False
; 		*gadget\opacity=64
; 		finalSelection=playerClassSelection
; 		stanceSelection=playerStanceSelection
; 		blackScreenStart()
; 	EndIf
; 	If pressCancel=1 And selectIA
; 		selectIA=#False
; 		selected=#False
; 		*gadget2\display=#False
; 		*gadget\opacity=64
; 		*menuControl\heavy+2
; 		finalSelection=playerClassSelection;Mod(playerSelection,100)
; 		If finalSelection=98
; 			finalSelection=-2
; 		EndIf
; 		If finalSelection=99
; 			finalSelection=-1
; 		EndIf
; ; 		Debug "back to "+finalSelection
; 	EndIf
; 	If Not selected And pressAccept=1
; 		If Not selectIA
; 			*gadget\opacity=255
; 			selectIA=#True
; 			psound(#H2H_SOUND_ID_MENUACCEPT)
; 			If finalSelection=-1
; 				finalSelection=99
; 			EndIf
; 			If finalSelection=-2
; 				finalSelection=98
; 			EndIf
; 			If stanceSelection=-1
; 				stanceSelection=99
; 			EndIf
; 			If stanceSelection=-2
; 				stanceSelection=98
; 			EndIf
; 			playerSelection=finalSelection+stanceSelection*100
; 			If currentSelection=98
; 				currentSelection=-2
; 			EndIf
; 	  		If currentSelection=99
; 	  			currentSelection=-1
; 	  		EndIf
; 			stanceSelection=0
; 		Else
; 			*gadget2\opacity=255
; 			If finalSelection=-1
; 				finalSelection=99
; 			EndIf
; 			If finalSelection=-2
; 				finalSelection=98
; 			EndIf
; 			If stanceSelection=-1
; 				stanceSelection=99
; 			EndIf
; 			If stanceSelection=-2
; 				stanceSelection=98
; 			EndIf
; 			selected=#True
; 			reset=#True
; 			ProcedureReturn playerSelection+(finalSelection+stanceSelection*100)*10000
; 		EndIf
; 	EndIf
; 	ProcedureReturn result ; not picked
; EndProcedure
;}

;{
; 
; Procedure classGalleryLoop(mode.i=#H2H_CLASS_GALLERY_MODE_PREVIEW)
; 	index=0
; 	exit=0
; 	statInit()
; 	gadgetDestroyAll()
; 	*classIdle.animationGadget=gadgetCreate(0,0,locationCreate(screenSizeX-1000,-150),9999,1,1)
; 	*classIdle\freed=#True
; 	If screenSizeX<=1500
; 		*classIdle\where\x=0
; 	EndIf
; 	*classIdle\display=Bool(screenSizeX>1200)
; 	
; 	*classIdle2.animationGadget=gadgetCreate(0,0,locationCreate(50,-150),9999,1,1)
; 	*classIdle2\freed=#True
; 	If screenSizeX<=1500
; 		*classIdle2\where\x=0
; 	EndIf
; 	*classIdle2\fliped=1
; 	Select mode
; 		Case #H2H_CLASS_GALLERY_MODE_PREVIEW
; 			*classIdle2\display=0
; 			set(*classIdle\where,50,-150)
; 			*classIdle\opacity=255
; 			*classIdle2\opacity=255
; 		Case #H2H_CLASS_GALLERY_MODE_SELECTION
; ; 			set(*classIdle\where,50,-150)
; 			set(*classIdle\where,screenSizeX-1000,-150)
; 			*classIdle\opacity=64
; 			*classIdle2\display=0
; 			*classIdle2\opacity=64
; 		Case #H2H_CLASS_GALLERY_MODE_VERSUS
; 			*classIdle2\display=Bool(screenSizeX>1200)
; 			set(*classIdle\where,screenSizeX-1000,-150)
; 			*classIdle\opacity=64
; 			*classIdle2\opacity=64
; 	EndSelect
; 	iterations=0
; 	delta.d=defaultDelta
; 	result=-999
; 	validated=0
; 	Static stack.d=0
; 	Repeat
; 		stamp.d=ElapsedMillisecondsPrecise()
; 		clearScreenGray()
; 		If blackScreenVelocity<=0 And GetActiveWindow()<>-1
; 		  ExamineKeyboard()
; 		  checkMenuKey()
; 		  checkPlayerKey(*player1)
; 		EndIf
; 		shineLoop(delta)
; 		Select mode
; 			Case #H2H_CLASS_GALLERY_MODE_PREVIEW
; 				classGallery(*classIdle,delta)
; 			Case #H2H_CLASS_GALLERY_MODE_SELECTION
; 				If blackScreenEnabled
; ; 					classSelectionSolo(*classIdle,*classIdle2,delta,Bool(blackScreenVelocity<0))
; 				Else
; ; 					result=classSelectionSolo(*classIdle,*classIdle2,delta,True)
; 				EndIf
; 				If Not blackScreenEnabled And Not validated
; 					If result<>-999
; 						validated=1
; 						psound(#H2H_SOUND_ID_MENUACCEPT)
; 						blackScreenStart()
; 					EndIf
; 				EndIf
; 			Case #H2H_CLASS_GALLERY_MODE_VERSUS
; 				If blackScreenEnabled
; 					classSelectionVersus(*classIdle,*classIdle2,delta)
; 				Else
; 					result=classSelectionVersus(*classIdle,*classIdle2,delta)
; 				EndIf
; 				If Not blackScreenEnabled And Not validated
; 					If result<>-999
; 						validated=1
; 						psound(#H2H_SOUND_ID_MENUACCEPT)
; 						blackScreenStart()
; 					EndIf
; 				EndIf
; 		EndSelect
; 		CompilerIf #H2H_WINDOWED
; 			Repeat
; 			Event = WindowEvent()
; 			Select Event
; 				Case #PB_Event_Gadget
; 					If EventGadget() = 0
; 						End
; 					EndIf
; 				Case #PB_Event_CloseWindow
; 					End 
; 			EndSelect
; 			Until Not Event
; 		CompilerEndIf
; 		If blackScreenEnabled
; 			blackScreenDisplay()
; 		EndIf
; 		FlipBuffers()
; 	  	If KeyboardPushed(#PB_Key_LeftShift) And KeyboardReleased(#PB_Key_F)
; 	  		screenShot()
; 	  	EndIf
; 		If Not validated
; 			If *player1\pushed\special=1 Or *player1\pushed\exit=1 Or *menuControl\special=1
; 				psound(#H2H_SOUND_ID_MENUCANCEL)
; 				blackScreenStart()
; 				validated=1
; 				*menuControl\special=2
; 				*player1\pushed\exit=2
; 				Debug "EXIT 3"
; 			EndIf
; 		EndIf
; 		If blackScreenLoop(delta)=1 And validated
; 			statFree()
; 			*classIdle\enabled=0
; 			classFreeIconAll()
; 			validated=0
; 			exit=1
; 		Else
; 		  delta=deltaSet(stamp)
; 		EndIf
; 		stack+delta
; ; 		refreshPlayerKey(*player1,stack)
; ; 		refreshPlayerKey(*player2,stack)
; 		If stack>=1
; 		  stack-Int(stack)
; 		EndIf
; 	Until exit=1
; 	*menuControl\special=2
; 	*player1\pushed\exit=2
; 	*classIdle\enabled=0
; 	*classIdle2\enabled=0
; 	*player1\pushed\accept=2
; 	gadgetDestroyAll()
; 	ProcedureReturn result
; EndProcedure

;}


	previousStamp.d=currentMillisecond
	delta.d=currentMillisecond/defaultMillisecond
	previousDelta.d=delta

	Protected zoom.d=20
	Protected transparency.d=255
	Protected previousCounter=2
	Protected pressedPause=0
	While time<3000
		stamp.d=ElapsedMillisecondsPrecise()
		clearScreenGray()
		screenShakeLoop()
		refreshPlayer(*player1,*b,delta,previousDelta)
		refreshPlayer(*player2,*b,delta,previousDelta)
		checkScreenFocus()
		backgroundRefresh(*b,screenFocus,screenSizeX)
		backgroundDisplay(*b,screenFocus,screenSizeX,screenSizeY)
		set(*player1\screenPosition,*player1\position\x-screenFocus,*player1\position\y)
		set(*player2\screenPosition,*player2\position\x-screenFocus,*player2\position\y)
		displayPlayerShadow(*player1)
		displayPlayerShadow(*player2)
		refreshAllGadget(delta)
		displayAllGadget(#H2H_GADGET_LAYER_BACK)
		displayPlayer(*player1)
		displayPlayer(*player2)
		displayAllGadget(#H2H_GADGET_LAYER_FRONT)
		hpBarDisplay(*player2\hpb,delta)
		hpBarDisplay(*player1\hpb,delta)
		If GetActiveWindow()<>-1
			ExamineKeyboard()
			checkMenuKey()
		EndIf
		If *player2\isAI
			AfftextColor("You are here",*player1\screenPosition\x+400,*player1\screenPosition\y+300,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
		Else
			AfftextColor("Player 1",*player1\screenPosition\x+400,*player1\screenPosition\y+300,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
			AfftextColor("Player 2",*player2\screenPosition\x+400,*player2\screenPosition\y+300,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
		EndIf
		i.i=2-Int(time/1000)
		If i<0
			i=0
		EndIf
		If Not gamePaused
			If i<>previousCounter
				zoom=20
				transparency=255
				previousCounter=i
			Else
				If zoom>1
					zoom*0.9
					transparency*0.9
				Else
					zoom*0.999
					transparency*0.999
				EndIf
			EndIf
		EndIf
		counterDisplay(i,(screenSizeX-#H2H_COMBO_DISPLAY_BIG_DISTANCE)/2,300,255-transparency,zoom)
		CompilerIf #H2H_WINDOWED
			Repeat
				Event = WindowEvent()
				Select Event
					Case #PB_Event_Gadget
						If EventGadget() = 0
							End
						EndIf
						
					Case #PB_Event_CloseWindow
						End 
				EndSelect
			Until Not Event
		CompilerEndIf
		If blackScreenEnabled
			blackScreenDisplay()
		EndIf
		If blackScreenLoop(delta)
			blackScreenEnabled=0
		EndIf
		If *menuControl\special
			pressedPause+1
			If pressedPause=1
				If gamePaused
					unpauseGame()
					If IsSound(*b\introMusic)
						ResumeSound(*b\introMusic)
					EndIf
				Else
					pauseGame()
					If IsSound(*b\introMusic)
						PauseSound(*b\introMusic)
					EndIf
				EndIf
			EndIf
		Else
			pressedPause=0
		EndIf
	  	If KeyboardPushed(#PB_Key_LeftShift) And KeyboardReleased(#PB_Key_F)
	  		screenShot()
	  	EndIf
	  	If KeyboardPushed(#PB_Key_LeftAlt) And KeyboardReleased(#PB_Key_F4)
	  		End
	  	EndIf
		If gamePaused
			displayPause(*player1)
			If *menuControl\special=1
				unpauseGame()
				screenFocus=0
				screenFocusHeight=0
				If Not IsSound(#H2H_MUSIC_MENU)
					LoadSound(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
				EndIf
				PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop,musicLevel)
				ProcedureReturn
			EndIf
		EndIf
		FlipBuffers()
		frameLoadLoop(1)
		previousDelta=delta
		If gamePaused
			delta=0
		Else
			delta=deltaSet(stamp)
			time+(ElapsedMillisecondsPrecise()-stamp)
		EndIf
	Wend
	
	If musicLevel>0
		If IsSound(*b\music)
			PlaySound(*b\music,#PB_Sound_Loop,musicLevel)
		EndIf
	EndIf
; 	gameloop(0,*mainGame\type)
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1540
; FirstLine = 1490
; Folding = -----
; EnableXP