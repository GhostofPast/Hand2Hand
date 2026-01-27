; Notes in todo.pb
#H2H_VERSION="alpha 0.1.2"
#Orange=$0080FF
CompilerIf #PB_Compiler_Processor<>#PB_Processor_x86 And #PB_Compiler_Processor<>#PB_Processor_x64
	CompilerError "This game only works on x86 or x64 processors"
CompilerEndIf

#H2H_MODE_LOAD=0
#H2H_MODE_SAVE=1
;------ Mode
; #H2H_MODE=#H2H_MODE_LOAD
#H2H_MODE=#H2H_MODE_SAVE
#H2H_MOUSE_ENABLED=#False
#H2H_DIGESTION_ENABLE=#False
#H2H_CONTROL_UPGRADE=#True
;---- time
initTime.q=ElapsedMilliseconds()
; moved into timertest.pb

Macro fileExist(FileName)
	Bool(FileSize(FileName)>0)
EndMacro

;--- Macro
#H2H_DEBUG=0
Global debugEnabled=#H2H_DEBUG
Global debugOption=debugEnabled
Macro sensibleInit(what,whatstring):If Not what:MessageRequester("Hand2Hand error","Could not be able to init "+whatstring,#PB_MessageRequester_Ok):End:EndIf:EndMacro
Macro lerp(y0,y1,t)
	((y1-y0)*t+y0)
EndMacro

; mauvais pour le proq !
Procedure.i max(a.i,b.i=0)
	If a>b
		ProcedureReturn a
	EndIf
	ProcedureReturn b
EndProcedure

Procedure.d min(a.d,b.d=0)
	If a<b
		ProcedureReturn a
	EndIf
	ProcedureReturn b
EndProcedure

;-- combo icon
#H2H_COMBO_MAX=16
#H2H_COMBO_X_SHIFT=680
Enumeration 1
	#H2H_COMBO_DISPLAY_BIG
	#H2H_COMBO_DISPLAY_SMALL
	#H2H_COMBO_DISPLAY_NONE
EndEnumeration

#H2H_COMBO_DISPLAY_DEFAULT=#H2H_COMBO_DISPLAY_NONE

Global comboDisplayMode=#H2H_COMBO_DISPLAY_DEFAULT

;-- damage type
Enumeration 1
	#H2H_DAMAGETYPE_CUT
	#H2H_DAMAGETYPE_PIERCE
	#H2H_DAMAGETYPE_BLUNT
EndEnumeration
CompilerIf #H2H_MOUSE_ENABLED
	sensibleInit(InitMouse(),"mouse")
CompilerEndIf
;sensibleInit(InitKeyboard(),"Keyboard")
;sensibleInit(InitSound(),"sounds")
sensibleInit(InitSprite(),"sprites")
UsePNGImageDecoder()
;UseOGGSoundDecoder()
ExamineDesktops()
Global spriteIndex.i=1
;Global Dim isSpriteSwaped(0)
Global isSpriteSwapedMax.q=$400
Global *isSpriteSwaped=AllocateMemory(isSpriteSwapedMax>>3,#PB_Memory_NoClear)

Macro isSpriteSwaped(what)
	Bool(what<isSpriteSwapedMax And PeekB(*isSpriteSwaped+(what>>3))&(1<<(what&$7)))
EndMacro

Procedure setSpriteSwaped(what.i,value.i)
	If what>=isSpriteSwapedMax
		CompilerIf #PB_Compiler_Debugger
			Debug "Attempted to access sprite fliped state of "+what+", max is "+isSpriteSwapedMax
		CompilerEndIf
		ProcedureReturn
	EndIf
	previous.b=PeekB(*isSpriteSwaped+(what>>3))
	If value
		previous|(1<<(what&$7))
	Else
		previous&(~((1<<(what&$7))))
	EndIf
	PokeB(*isSpriteSwaped+((what>>3)),previous)
EndProcedure

Procedure spriteIndexAdd(add.i=1)
	spriteindex+add
	If spriteIndex>=isSpriteSwapedMax
		isSpriteSwapedMax<<1
		*isSpriteSwaped=ReAllocateMemory(*isSpriteSwaped,isSpriteSwapedMax>>3,#PB_Memory_NoClear)
	EndIf
	ProcedureReturn spriteIndex-add
EndProcedure

Global screenSizeX=DesktopWidth(0)
Global screenSizeY=DesktopHeight(0)
Global keyboardType=0

#H2H_CONSOLE_ENABLED=0

;--- Background screen
#H2H_SCREEN_BORDER_THICKNESS=20
#H2H_SCREEN_BORDER_STEP=8
#H2H_SCREEN_BORDER_TEMPER=0.3
Global backscreen=spriteIndexAdd()
Global selectedType=0
Global selectedTypeTmp=0
Procedure clearScreenGray()
	If Not IsSprite(backscreen)
		CreateSprite(backscreen,screenSizeX,screenSizeY)
; 		TransparentSpriteColor(backscreen,RGB(1,1,1))
		StartDrawing(SpriteOutput(backscreen))
		; gradiant from orange to gray
		red.d=255
		green.d=127
		blue.d=0
		i=0
		temper.d=#H2H_SCREEN_BORDER_TEMPER/((screenSizeX/DesktopWidth(0)+screenSizeY/DesktopHeight(0))/2)
; 		Debug "temper : "+temper
		While Round(red,#PB_Round_Nearest)<>32 Or Round(green,#PB_Round_Nearest)<>32 Or Round(blue,#PB_Round_Nearest)<>32
			Box(i*#H2H_SCREEN_BORDER_STEP,i*#H2H_SCREEN_BORDER_STEP,screenSizeX-i*#H2H_SCREEN_BORDER_STEP*2,screenSizeY-i*#H2H_SCREEN_BORDER_STEP*2,RGB(red,green,blue))
			red=lerp(red,32,temper)
			green=lerp(green,32,temper)
			blue=lerp(blue,32,temper)
			i+1
		Wend
		i=i+1
		Box(i*#H2H_SCREEN_BORDER_STEP,i*#H2H_SCREEN_BORDER_STEP,screenSizeX-i*#H2H_SCREEN_BORDER_STEP*2,screenSizeY-i*#H2H_SCREEN_BORDER_STEP*2,RGB(32,32,32))
		StopDrawing()
; 		SaveSprite(backscreen,"backscreen.png")
	EndIf
	DisplaySprite(backscreen,0,0)
EndProcedure

;--- delta delayer
Global deltaDelay.f=0
#H2H_DELTA_DELAY=10 ; how many frames it freezes when someone hit someone
#H2H_DELTA_DELAY_THRESHOLD=5 ; damage where it will trigger a delta delay
#H2H_DELTA_DELAY_FACTOR=0.5 ; how many frames it freezes when someone hit someone
Enumeration 1
	#H2H_DELTA_DELAY_MODE_OFF 		; none
	#H2H_DELTA_DELAY_MODE_FIX		; delayed by #H2H_DELTA_DELAY
	#H2H_DELTA_DELAY_MODE_RELATIVE	; delayed by damage*#H2H_DELTA_DELAY_FACTOR
EndEnumeration
#H2H_DELTA_DELAY_MODE=#H2H_DELTA_DELAY_MODE_RELATIVE
Global attackDelayMode=#H2H_DELTA_DELAY_MODE

;-- black screen
Global blackScreen=spriteIndexAdd()
Global blackScreenOpacity.d=0
#H2H_BLACK_SCREEN_VELOCITY_BASE=19.2;25.6;12.8
Global BLACK_SCREEN_VELOCITY_BASE=#H2H_BLACK_SCREEN_VELOCITY_BASE
Global blackScreenVelocity.d=0;#H2H_BLACK_SCREEN_VELOCITY_BASE
Global blackScreenEnabled=#False

Macro blackScreenControlBlock()
	Bool(blackScreenEnabled And blackScreenVelocity>0)
EndMacro

Procedure blackScreenDisplay()
	If Not IsSprite(blackScreen)
		CreateSprite(blackScreen,screenSizeX,screenSizeY,#PB_Sprite_AlphaBlending)
		TransparentSpriteColor(blackScreen,RGB(1,1,1))
	Else
		If SpriteWidth(blackScreen)<>screenSizeX Or SpriteHeight(blackScreen)<>screenSizeY
			FreeSprite(blackScreen)
			CreateSprite(blackScreen,screenSizeX,screenSizeY)
			TransparentSpriteColor(blackScreen,RGB(1,1,1))
		EndIf
	EndIf
	DisplayTransparentSprite(blackScreen,0,0,blackScreenOpacity)
EndProcedure

Procedure blackScreenLoop(delta.d=1)
	If blackScreenEnabled
		CompilerIf #H2H_MODE=#H2H_MODE_SAVE
			blackScreenOpacity+(blackScreenVelocity*delta)*4
		CompilerElse
			blackScreenOpacity+(blackScreenVelocity*delta)
		CompilerEndIf
		If blackScreenOpacity>255
			blackScreenOpacity=255
			blackScreenVelocity=-BLACK_SCREEN_VELOCITY_BASE
			ProcedureReturn 1
		EndIf
		If blackScreenOpacity<=0
			blackScreenOpacity=0
			blackScreenVelocity=0
			blackScreenEnabled=#False
			If IsSprite(blackScreen)
				FreeSprite(blackScreen)
			EndIf
			ProcedureReturn -1
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure blackScreenStart(fromBlack.i=#False)
; 	Debug "start"
	If fromBlack
		blackScreenOpacity=255
		blackScreenVelocity=-#H2H_BLACK_SCREEN_VELOCITY_BASE
	Else
		If blackScreenOpacity>192
			blackScreenOpacity=192
		Else
			If blackScreenOpacity>64
				blackScreenOpacity=64
			Else
				blackScreenOpacity=1 ; whyyyy
			EndIf
		EndIf
		blackScreenVelocity=#H2H_BLACK_SCREEN_VELOCITY_BASE
	EndIf
	blackScreenEnabled=#True
EndProcedure

;- game paused
Global gamePaused=#False 

;--- menu enum
Enumeration 0
	#H2H_MENU_MAIN
	#H2H_MENU_1V1
	#H2H_MENU_1VBOT
	#H2H_MENU_BATTLE
	#H2H_MENU_RESTART ; restarts a battle immediatly
	#H2H_MENU_TUTORIAL
	#H2H_MENU_SETTINGS
	#H2H_MENU_CONTROLS
	#H2H_MENU_JOYSTICK
	#H2H_MENU_TERRAIN
	#H2H_MENU_DIFFICULTY
	#H2H_MENU_GALLERY
	#H2H_MENU_CREDITS
	#H2H_MENU_DEMO ; restarts a demo battle
	#H2H_MENU_EXIT ; if current menu is this, exits the game !
EndEnumeration
Global Dim previousMenu.i(4)
Global currentMenuIndex.i=0
Global targetMenu.i=#H2H_MENU_MAIN

IncludeFile "location.pb"
;--- JSON

Global JSONindex=0
IncludeFile "json.pb"
IncludeFile "localizedString.pb"
Global Dim *screenType.locationI(9)

*screenType(0)=locationCreateI(1024, 768)
*screenType(1)=locationCreateI(1280, 720)
*screenType(2)=locationCreateI(1280, 768)
*screenType(3)=locationCreateI(1280, 800)
*screenType(4)=locationCreateI(1280, 960)
*screenType(5)=locationCreateI(1280,1024)
*screenType(6)=locationCreateI(1360, 768)
*screenType(7)=locationCreateI(1680,1050)
*screenType(8)=locationCreateI(1920,1080)
*screenType(9)=locationCreateI(1920,1200)
; 
; For i=0 To 9
; 	Debug toString(*screenType(i))
; Next
; End

;--- screen
Global nbScreen=ExamineDesktops()
If nbScreen=0
	MessageRequester("Hand2Hand error","Could not be able to find screen",#PB_MessageRequester_Ok)
	End
EndIf
Global gamescreen=0
Global windowSizeX=DesktopWidth(0)
Global windowSizeY=DesktopHeight(0)
Procedure detectWindowSize()
	For i=0 To ArraySize(*screenType())
		If windowSizeX<=*screenType(i)\x And windowSizeY<=*screenType(i)\y
			selectedType=i
			Break
		EndIf
	Next
	selectedTypeTmp=selectedType
	screenSizeX=*screenType(selectedType)\x
	screenSizeY=*screenType(selectedType)\y
EndProcedure
If screenSizeX<1500
	comboDisplayMode=#H2H_COMBO_DISPLAY_SMALL
EndIf

Enumeration
	#H2H_COMBO_NEUTRAL=1
	#H2H_COMBO_NSIDE
	#H2H_COMBO_NUP
	#H2H_COMBO_NBACK
	#H2H_COMBO_NDOWN
	#H2H_COMBO_HEAVY
EndEnumeration

Global iconAtlas=spriteIndexAdd()
;----- UI Atlas
;--- icon enum
Enumeration 0
	#H2H_ICON_STRENGTH
	#H2H_ICON_AGILITY
	#H2H_ICON_SPEED
	#H2H_ICON_WEIGHT
	#H2H_ICON_ENDURENCE
	#H2H_ICON_LIFE
	#H2H_ICON_CUT
	#H2H_ICON_PIERCE
	#H2H_ICON_BLUNT
	#H2H_ICON_REACH
	#H2H_ICON_DIFFICULTY
	#H2H_ICON_BAR_START
	#H2H_ICON_BAR_MIDDLE
	#H2H_ICON_BAR_END
; 	#H2H_ICON_BAR_CLIP
	#H2H_ICON_BAR_HAT
; 	#H2H_ICON_TRIGGER
; 	#H2H_ICON_FILL_START
; 	#H2H_ICON_FILL_END
	#H2H_ICON_GUARD_MIDDLE
; 	#H2H_ICON_STAMINA_START
; 	#H2H_ICON_STAMINA_MIDDLE
; 	#H2H_ICON_STAMINA_END
; 	#H2H_ICON_STAMINA_FILL_START
; 	#H2H_ICON_STAMINA_FILL_END
	#H2H_ICON_DOT
	#H2H_ICON_CRESCENT
	#H2H_ICON_NEUTRAL
	#H2H_ICON_UP
	#H2H_ICON_NUMBER_0
	#H2H_ICON_NUMBER_1
	#H2H_ICON_NUMBER_2
	#H2H_ICON_NUMBER_3
	#H2H_ICON_NUMBER_4
	#H2H_ICON_NUMBER_5
	#H2H_ICON_NUMBER_6
	#H2H_ICON_NUMBER_7
	#H2H_ICON_NUMBER_8
	#H2H_ICON_NUMBER_9
	#H2H_ICON_NUMBER_SEPARATOR
	#H2H_ICON_DISCORD
	#H2H_ICON_STEAM
	#H2H_ICON_ITCHIO
	#H2H_ICON_GAMEJOLT
; 	#H2H_ICON_SOON
EndEnumeration
Declare spriteFlip(what.i,mirrored.i=0,special.i=1)
; Prepare the atlat so select the sprite
; returns the coords of the element in YYYXXX format
Procedure.i UISelect(what.i)
 	RotateSprite(iconAtlas,0,#PB_Absolute)
	spriteFlip(iconAtlas,0)
	ZoomSprite(iconAtlas,#PB_Default,#PB_Default)
	ClipSprite(iconAtlas,#PB_Default,#PB_Default,#PB_Default,#PB_Default)
	If what>=#H2H_ICON_NUMBER_0 And what<#H2H_ICON_NUMBER_8
		ClipSprite(iconAtlas,(what-#H2H_ICON_NUMBER_0)*64,192,64,64)
		ProcedureReturn 64000+(what-#H2H_ICON_NUMBER_0)*64
	EndIf
	Select what
		Case #H2H_ICON_STRENGTH
			ClipSprite(iconAtlas,0,0,64,64)
			ProcedureReturn 0
		Case #H2H_ICON_AGILITY
			ClipSprite(iconAtlas,64,0,64,64)
			ProcedureReturn 64
		Case #H2H_ICON_SPEED
			ClipSprite(iconAtlas,128,0,64,64)
			ProcedureReturn 128
		Case #H2H_ICON_WEIGHT
			ClipSprite(iconAtlas,192,0,64,64)
			ProcedureReturn 192
		Case #H2H_ICON_ENDURENCE
			ClipSprite(iconAtlas,256,0,64,64)
			ProcedureReturn 256
		Case #H2H_ICON_LIFE
			ClipSprite(iconAtlas,320,0,64,64)
			ProcedureReturn 320
		Case #H2H_ICON_CUT
			ClipSprite(iconAtlas,384,0,64,64)
			ProcedureReturn 384
		Case #H2H_ICON_PIERCE
			ClipSprite(iconAtlas,448,0,64,64)
			ProcedureReturn 448
		Case #H2H_ICON_BLUNT
			ClipSprite(iconAtlas,0,64,64,64)
			ProcedureReturn 64000
		Case #H2H_ICON_REACH
			ClipSprite(iconAtlas,64,64,64,64)
			ProcedureReturn 64064
		Case #H2H_ICON_DIFFICULTY
			ClipSprite(iconAtlas,128,64,64,64)
			ProcedureReturn 64128
		Case #H2H_ICON_DOT
			ClipSprite(iconAtlas,192,64,64,64)
			ProcedureReturn 64192
		Case #H2H_ICON_CRESCENT
			ClipSprite(iconAtlas,256,64,64,64)
			ProcedureReturn 64256
		Case #H2H_ICON_BAR_START
			ClipSprite(iconAtlas,128,128,64,64)
			ProcedureReturn 128128
		Case #H2H_ICON_BAR_MIDDLE
			ClipSprite(iconAtlas,64,128,64,64)
			ProcedureReturn 12864
		Case #H2H_ICON_BAR_END
			ClipSprite(iconAtlas,0,128,64,64)
			ProcedureReturn 128000
; 		Case #H2H_ICON_FILL_START
; 			ClipSprite(iconAtlas,256,128,64,64)
; 			RotateSprite(iconAtlas,180,#PB_Absolute)
; 			ProcedureReturn 128256
; 		Case #H2H_ICON_FILL_END
; 			ClipSprite(iconAtlas,256,128,64,64)
; 			ProcedureReturn 128256
		Case #H2H_ICON_GUARD_MIDDLE
			ClipSprite(iconAtlas,192,128,64,64)
			ProcedureReturn 128192
; 		Case #H2H_ICON_BAR_CLIP
; 			ClipSprite(iconAtlas,128,192,128,64)
; 			ProcedureReturn 
		Case #H2H_ICON_BAR_HAT
			ClipSprite(iconAtlas,384,128,128,64)
			ProcedureReturn 128384
; 		Case #H2H_ICON_STAMINA_START
; 			ClipSprite(iconAtlas,320+32,64,32,32)
; 			ProcedureReturn 64352
; 		Case #H2H_ICON_STAMINA_MIDDLE
; 			ClipSprite(iconAtlas,320,64,32,32)
; 			ProcedureReturn 
; 		Case #H2H_ICON_STAMINA_END
; 			ClipSprite(iconAtlas,320,96,32,32)
; 			ProcedureReturn 96320
; 		Case #H2H_ICON_STAMINA_FILL_START
; 			ClipSprite(iconAtlas,320+32,96,32,32)
; 			ProcedureReturn 96352
; 		Case #H2H_ICON_STAMINA_FILL_END
; 			ClipSprite(iconAtlas,320+32,96,32,32)
; 			RotateSprite(iconAtlas,180,#PB_Absolute)
; 			ProcedureReturn 96352
; 		Case #H2H_ICON_TRIGGER
; 			ClipSprite(iconAtlas,384,64,32,32)
; 			ProcedureReturn 64320
		Case #H2H_ICON_UP
			ClipSprite(iconAtlas,320,64,64,64)
			ProcedureReturn 64320
		Case #H2H_ICON_NEUTRAL
			ClipSprite(iconAtlas,384,64,64,64)
			ProcedureReturn 64384
		Case #H2H_ICON_NUMBER_8
			ClipSprite(iconAtlas,256,128,64,64)
			ProcedureReturn 128256
		Case #H2H_ICON_NUMBER_9
			ClipSprite(iconAtlas,320,128,64,64)
			ProcedureReturn 128320
		Case #H2H_ICON_NUMBER_SEPARATOR
			ClipSprite(iconAtlas,448,64,64,64)
			ProcedureReturn 64448
		Case #H2H_ICON_DISCORD
			ClipSprite(iconAtlas,0,256,64,64)
			ProcedureReturn 256000
		Case #H2H_ICON_STEAM
			ClipSprite(iconAtlas,64,256,64,64)
			ProcedureReturn 256064
		Case #H2H_ICON_ITCHIO
			ClipSprite(iconAtlas,128,256,64,64)
			ProcedureReturn 256128
	EndSelect
	ProcedureReturn 0
EndProcedure

; Returns true if success
Procedure UIDisplay(what.i,x.i,y.i,c.i=-1,intensity.i=-1,opacity=255,fliped.i=#False,scale.d=1.0)
	If opacity<=0 Or scale<=0
		ProcedureReturn #False
	EndIf
	SpriteQuality(#PB_Sprite_BilinearFiltering)
	UISelect(what) ; Default zoom is already done there
	If scale>1.01 Or scale<0.99
		ZoomSprite(iconAtlas,SpriteWidth(iconAtlas)*scale,SpriteHeight(iconAtlas)*scale)
	EndIf
	spriteFlip(iconAtlas,fliped)
	DisplayTransparentSprite(iconAtlas,x,y,opacity)
	If c>=0
		If intensity<0
			intensity=128
		EndIf
		DisplayTransparentSprite(iconAtlas,x,y,(opacity*intensity)/255,c)
	EndIf
	; sprite can be manipulated after call anyway
	SpriteQuality(#PB_Sprite_NoFiltering)
	ProcedureReturn #True
EndProcedure
#H2H_CRESCENT_SPACE=44

Global comboIconNeutral=spriteIndexAdd()
Global comboIconUp=spriteIndexAdd();spriteIndex:spriteIndex+2 ; Because we need a flip for this one
Global comboIconHeavy=spriteIndexAdd()
;----- class icon background
Global classIconBack=spriteIndexAdd()
;----- counter
Global Dim counter(2)
; The counter 1 is the same as the mirrored combo icon nUp
counter(1)=spriteIndexAdd()
counter(2)=spriteIndexAdd()

; Global Dim isSpriteSwaped.i(0)
; Global Dim isSpriteZoomed.i(0)
; Declare spriteFlip(what.i,mirror.i=#False)

Procedure displayComboSprite(what.i,x.i,y.i,color.i=-1,intensity.i=128,small.i=#False,mirror.i=#False,size.d=1,opacity.i=255)
	s=0
	Select what
		Case #H2H_COMBO_NUP,#H2H_COMBO_NSIDE,#H2H_COMBO_NDOWN,#H2H_COMBO_NBACK
			If small
				s=iconAtlas
				UISelect(#H2H_ICON_UP)
			Else
				s=comboIconUp
			EndIf
		Case #H2H_COMBO_HEAVY
			If small
				UISelect(#H2H_ICON_STRENGTH)
				s=iconAtlas
			Else
				s=comboIconHeavy
			EndIf
		Case #H2H_COMBO_NEUTRAL
			If small
				UISelect(#H2H_ICON_NEUTRAL)
				s=iconAtlas
			Else
				s=comboIconNeutral
			EndIf
	EndSelect
	If s>0
		SpriteQuality(#PB_Sprite_BilinearFiltering)
		spriteFlip(s,0)
		ZoomSprite(s,#PB_Default,#PB_Default)
		If small
			size/2
		EndIf
		If size>1.01 Or size<0.99
			ZoomSprite(s,SpriteWidth(s)*size,SpriteHeight(s)*size)
		EndIf
		If what=#H2H_COMBO_HEAVY Or what=#H2H_COMBO_NEUTRAL
			spriteFlip(s,mirror)
		EndIf
		Select what
 			Case #H2H_COMBO_NUP
 				RotateSprite(s,0,#PB_Absolute)

			Case #H2H_COMBO_NBACK
 				RotateSprite(s,90+mirror*180,#PB_Absolute)
				
			Case #H2H_COMBO_NDOWN
 				RotateSprite(s,180,#PB_Absolute)
				
			Case #H2H_COMBO_NSIDE
 				RotateSprite(s,270-mirror*180,#PB_Absolute)
		EndSelect
		DisplayTransparentSprite(s,x,y,opacity)
		If color<>-1
			DisplayTransparentSprite(s,x,y,(intensity*opacity)/255,color)
		EndIf
		SpriteQuality(#PB_Sprite_NoFiltering)
	CompilerIf #PB_Compiler_Debugger
	Else
		Debug "Unkown combo !"
	CompilerEndIf
	EndIf
EndProcedure

Procedure counterDisplay(what.i,x.i,y.i,opacity.i=255,zoom.d=1)
	sprite=comboIconUp
	If what
		sprite=counter(what)
	Else
		RotateSprite(comboIconUp,0,#PB_Absolute)
		spriteFlip(comboIconUp)
	EndIf
	ZoomSprite(sprite,#PB_Default,#PB_Default)
	width=SpriteWidth(sprite)
	height=SpriteHeight(sprite)
	ZoomSprite(sprite,width*zoom,height*zoom)
; 	Debug "is sprite "+sprite+" "+IsSprite(sprite)
	DisplayTransparentSprite(sprite,x-width/2+(1-zoom)*width/2,y-height/2+(1-zoom)*height/2,opacity)
	ZoomSprite(sprite,#PB_Default,#PB_Default)
EndProcedure

;------ ground
Global groundSprite=spriteIndexAdd()

Declare loadBasicSprites()
; Must stay a procedure because of usage of globals
Global groundLevel
Macro resetGroundLevel()
	groundLevel=screenSizeY-720
EndMacro
#H2H_WINDOWED=1
#H2H_SCREEN_FULL_DEFAULT=1
Global fullscreen=#H2H_SCREEN_FULL_DEFAULT
Global fullscreenTmp=fullscreen

#HITBOX_SIZE=200
Global screenLineSpan=screenSizeX-#HITBOX_SIZE
Macro refreshScreenLifeSpan()
	screenLineSpan=screenSizeX-#HITBOX_SIZE
EndMacro

Procedure screenShot()
	Debug "screenshot"
	StartDrawing(WindowOutput(0))
	GrabDrawingImage(0,0,0,WindowWidth(0),WindowHeight(0))
	StopDrawing()	
	SetClipboardImage(0)
	FreeImage(0)
EndProcedure

Procedure changeScreen(x.i,y.i)
	Debug "change screen"
	screenSizeX=x
	screenSizeY=y
	If gamescreen
		CloseScreen()
	EndIf
	gamescreen=#True
; 		If fullscreen
; ; 			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_BorderLess)
; 			gamescreen=OpenWindow(0,0,0,x,y,"Hand2Hand project "+#H2H_VERSION)
; ; 			gamescreen=OpenWindow(0,0,0,windowSizeX,windowSizeY,"Hand2Hand project "+#H2H_VERSION,#PB_Window_BorderLess)
; ; 			gamescreen=OpenScreen(screenSizeX,screenSizeY,32,"Hand2Hand project "+#H2H_VERSION,#PB_Screen_NoSynchronization)
; 		Else
; ; 			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_SystemMenu|#PB_Window_ScreenCentered|#PB_Window_Maximize|#PB_Window_MinimizeGadget)
; 			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_SystemMenu|#PB_Window_ScreenCentered|#PB_Window_Maximize|#PB_Window_MinimizeGadget)
; 		EndIf
; 		If Not gamescreen
; 			MessageRequester("Hand2Hand error","Could not be able to create screen",#PB_MessageRequester_Error)
; 			End
; 		EndIf
; 		If fullscreen
	If Not OpenWindowedScreen(WindowID(0),0,0,x,y,#True,0,0,#PB_Screen_NoSynchronization)
		MessageRequester("Hand2Hand error","Could not be able to create windowed screen",#PB_MessageRequester_Error)
		End
	EndIf
; 		Else
; 			If Not OpenWindowedScreen(WindowID(0),0,0,x,y,#True,0,0,#PB_Screen_NoSynchronization)
; 				MessageRequester("Hand2Hand error","Could not be able to create windowed screen",#PB_MessageRequester_Error)
; 				End
; 			EndIf
; 		EndIf
	
	If fullscreen
		Debug "Full screen resize "+windowSizeX+" "+windowSizeY+" | "+screenSizeX+" "+screenSizeY
		ResizeWindow(0,-3,-24,windowSizeX,windowSizeY)
		WindowBounds(0,windowSizeX,windowSizeY,windowSizeX+100,windowSizeY+100)
	Else
		Debug "resize"
		ResizeWindow(0,(windowSizeX-screenSizeX)/2,(windowSizeY-screenSizeY)/2,screenSizeX,screenSizeY)
		WindowBounds(0,screenSizeX,screenSizeY,screenSizeX,screenSizeY)
	EndIf
	loadBasicSprites()
	resetGroundLevel()
	refreshScreenLifeSpan()
EndProcedure
Declare importOptions()
Global.q Dim fpsMode(10)
fpsMode(0)=30
fpsMode(1)=50
fpsMode(2)=60
fpsMode(3)=70
fpsMode(4)=80
fpsMode(5)=90
fpsMode(6)=100
fpsMode(7)=120
fpsMode(8)=144
fpsMode(9)=200
fpsMode(10)=240
IncludeFile "timertest.pb"
If importOptions()
	screenSizeX=*screenType(selectedType)\x
	screenSizeY=*screenType(selectedType)\y
	selectedTypeTmp=selectedType
Else
	detectWindowSize()
EndIf
OpenWindow(0,0,0,screenSizeX,screenSizeY,"Hand2Hand project "+#H2H_VERSION)
; Declare.q timer(i.q)
GLOBAL_SYSTEME_TIN=CreateThread(@timer(),10*1000*1000/fpsMode(currentFPSMode));166666)
changeScreen(screenSizeX,screenSizeY)

;--- screen focus
Global screenFocus=0
Global screenFocusHeight=0
Global screenFocusMiddle=0
#H2H_SCREEN_FOCUS_HEIGHT_THRESHOLD=0

; other sprites to init here
Global shadowSprite=0
Global hitBoxSprite=0


Global Dim crescentColor(10)
Macro middleColor(c1,c2)
	(RGB((Red(c1)+Red(c2))/2,(Green(c1)+Green(c2))/2,(Blue(c1)+Blue(c2))/2))
EndMacro

crescentColor(0)=#Blue
crescentColor(1)=middleColor(#Blue,#Green)
crescentColor(2)=#Green
crescentColor(3)=middleColor(#Green,#Yellow)
crescentColor(4)=#Yellow
crescentColor(5)=middleColor(#Yellow,#Orange)
crescentColor(6)=#Orange
crescentColor(7)=middleColor(#Orange,#Red)
crescentColor(8)=#Red
crescentColor(9)=RGB(255,0,128)
crescentColor(10)=RGB(255,0,255)

;--- text font
XIncludeFile "affText.pb"

;AfftextBorderCreate(2)
; initBigText()

#H2H_CLASS_ICON_SIZE=170
#H2H_CLASS_ICON_SIZE_MINI=100
Procedure classIconLoad()
	If Not IsSprite(classIconBack)
		CreateSprite(classIconBack,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
		StartDrawing(SpriteOutput(classIconBack))
		Box(0,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#White)
		StopDrawing()
	EndIf
EndProcedure

classIconLoad()

;--- Colors
Macro Color(r,g,b,a=128)
	r+(g<<8)+(b<<16)+(a<<24)
EndMacro
#H2H_STANCE_COLOR_PLASTIC=0;Color(192,128,160)
#H2H_STANCE_COLOR_WOOD=Color(84,35,13)
#H2H_STANCE_COLOR_DARKWOOD=Color(42,17,6)
#H2H_STANCE_COLOR_LIGHTWOOD=Color(168,140,26)
#H2H_STANCE_COLOR_METAL=Color(64,64,64)
#H2H_STANCE_COLOR_DARKMETAL=Color(32,32,32)
#H2H_STANCE_COLOR_LIGHTMETAL=Color(96,32,32)
#H2H_STANCE_COLOR_RED=Color(255,0,0)
#H2H_STANCE_COLOR_BLUE=Color(0,0,255)
#H2H_STANCE_COLOR_GREEN=Color(0,255,0)
#H2H_STANCE_COLOR_YELLOW=Color(255,255,0)
#H2H_STANCE_COLOR_BLACK=Color(1,1,1)
#H2H_STANCE_COLOR_GRAY=Color(128,128,128)
#H2H_STANCE_COLOR_WHITE=Color(192,192,192)
#H2H_STANCE_COLOR_ORANGE=Color(255,128,0)
#H2H_STANCE_COLOR_VERMILLON=Color(192,64,0)
#H2H_STANCE_COLOR_LIGHTGRAY=Color(160,160,160)
#H2H_STANCE_COLOR_LIGHTRED=Color(255,128,128)
#H2H_STANCE_COLOR_LIGHTGREEN=Color(128,255,128)
#H2H_STANCE_COLOR_LIGHTBLUE=Color(128,128,255)

Macro isTooWhite(c,threshold)
	Bool(Red(c)+Green(c)+Blue(c)>threshold*3)
EndMacro

Macro colorLerp(c1,c2)
	RGB((Red(c1)+Red(c2))/2,(Green(c1)+Green(c2))/2,(Blue(c1)+Blue(c2))/2)
EndMacro

;--- Rounds
Global currentRound.i=1
#H2H_ROUND_LENGTH=120 ; in seconds
#H2H_ROUND_LENGTH_MIN=30 ; in seconds
#H2H_ROUND_LENGTH_MAX=300 ; in seconds
#H2H_ROUND_LENGTH_STEP=30 ; in seconds
#H2H_ROUND_LENGTH_LOW=30 ; in seconds
#H2H_ROUND_MIN=1 ; number of rounds
#H2H_ROUND_BASE=3 ; number of rounds
#H2H_ROUND_MAX=7 ; number of rounds
Global maxRound.i=#H2H_ROUND_BASE

Global roundLength.i=#H2H_ROUND_LENGTH

;--- Demo
Global demoFight=#False ; when enabled, will loop random fights
Global demoFightTimer.d=0 ; in seconds
#H2H_FIGHT_DEMO_DELAY=120.0 ; in seconds
Global FIGHT_DEMO_DELAY.i=#H2H_FIGHT_DEMO_DELAY

;--- includes
; IncludeFile "timertest.pb" ; moved above change screen
IncludeFile "RotateImage.pb"
IncludeFile "soundpool.pb"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	IncludeFile "rawdata.pb"
CompilerEndIf
IncludeFile "frame.pb"
IncludeFile "animation.pb"
IncludeFile "control.pb" ; /!\ contains also controlstate
IncludeFile "joystick.pb"
IncludeFile "button.pb"
IncludeFile "class.pb"
IncludeFile "background.pb"
IncludeFile "particle.pb"
IncludeFile "player.pb"
IncludeFile "damageGadget.pb"
IncludeFile "ai.pb"
IncludeFile "game.pb"

CompilerIf #H2H_DIGESTION_ENABLE
IncludeFile "digestImage.pb"
CompilerEndIf
;--- support fonctions

;------ pause system
Procedure pauseGame()
	If Not gamePaused
		Debug "paused"
		gamePaused=#True
		musicLevel=musicLevel/2
		psound(#H2H_SOUND_ID_MENUCANCEL)
		musicLevelRefresh()
		If musicLevel>0
			If IsSound(*mainGame\terrain\introMusic) And SoundStatus(*mainGame\terrain\introMusic)=#PB_Sound_Playing
				PauseSound(*mainGame\terrain\introMusic)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure unpauseGame(silent=#False)
	If gamePaused
		Debug "unpaused"
		musicLevel=musicLevel*2
		musicLevelRefresh()
		gamePaused=#False
		If Not silent
			psound(#H2H_SOUND_ID_MENUACCEPT)
		EndIf
		If musicLevel>0
			If IsSound(*mainGame\terrain\introMusic) And SoundStatus(*mainGame\terrain\introMusic)=#PB_Sound_Paused
				ResumeSound(*mainGame\terrain\introMusic)
			EndIf
		EndIf
	EndIf
EndProcedure

#H2H_PAUSE_OPACITY_SPEED=20.0 ; per frame
#H2H_PAUSE_OPACITY_BASE=128
Global pauseOpacity.d=0

Procedure displayPause(*p.player=0,delta.d=1)
	If gamePaused
		pauseOpacity+#H2H_PAUSE_OPACITY_SPEED*delta
	Else
		pauseOpacity-#H2H_PAUSE_OPACITY_SPEED*delta
		If pauseOpacity<0
			pauseOpacity=0
		EndIf
	EndIf
	If pauseOpacity>0
		DisplayTransparentSprite(backscreen,0,0,pauseOpacity)
		If pauseOpacity>=#H2H_PAUSE_OPACITY_BASE
			pauseOpacity=#H2H_PAUSE_OPACITY_BASE
		EndIf
		AfftextColor(lsGet("PAUSE"),200,200,RGBA(255,0,0,pauseOpacity*2),pauseOpacity+64,1.5,*font32)
		If *p And *p\joystickId>-1; And *p\joystickControl\accept>-1 And *p\joystickControl\exit>-1
			AfftextColor(lsGet("PAUSE_RESUME_JOYSTICK",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_CANCEL)),controllerButtonName(controlGet(*p\joystickControl,#H2H_CONTROL_ACCEPT))),300,300,RGBA(255,255,255,pauseOpacity*2))
			AfftextColor(lsGet("PAUSE_QUIT_JOYSTICK",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_EXIT)),controllerButtonName(controlGet(*p\joystickControl,#H2H_CONTROL_EXIT))),400,400,RGBA(255,128,0,pauseOpacity*2))
		Else
			AfftextColor(lsGet("PAUSE_RESUME",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_CANCEL))),300,300,RGBA(255,255,255,pauseOpacity*2))
			AfftextColor(lsGet("PAUSE_QUIT",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_EXIT))),400,400,RGBA(255,128,0,pauseOpacity*2))
		EndIf
	EndIf
EndProcedure

;- Main
;--- Init
If Not gamescreen
	MessageRequester("Hand2Hand error","Could not be able to init screen",#PB_MessageRequester_Ok)
	End
EndIf

Macro assert(what)
	If Not (what):MessageRequester("failed","u noob"):End:EndIf
EndMacro
; assert(IsSprite(randomClassIcon))

Global Dim allMusic(#H2H_MUSIC_STARTUP03)
; Procedure refreshMusicLevel()
; 	For i=#H2H_MUSIC_MENU To #H2H_MUSIC_STARTUP03
; 		If IsSound(i)
; 			SoundVolume(i,musicLevel)
; 		EndIf
; 	Next
; EndProcedure

;- sounds
*emptySound.soundPool=poolCreate()
*emptySound\id=0
*emptySound\name$="empty"
soundIndex=6
;-- swiches
#H2H_BUFFERIZEDHITSOUND=1
CompilerIf #H2H_MODE=#H2H_MODE_SAVE

;-- wood hit
*wood_hitCut.hitSoundClass=hitSoundCreate()
*wood_hitPierce.hitSoundClass=hitSoundCreate()
*wood_hitBlunt.hitSoundClass=hitSoundCreate()

;-- metal hit
*metal_hitCut.hitSoundClass=hitSoundCreate()
*metal_hitPierce.hitSoundClass=hitSoundCreate()
*metal_hitBlunt.hitSoundClass=hitSoundCreate()

;-- plastic hit
*plastic_hitCut.hitSoundClass=hitSoundCreate()
*plastic_hitPierce.hitSoundClass=hitSoundCreate()
*plastic_hitBlunt.hitSoundClass=hitSoundCreate()

;-- other hit
*finger_hitBlunt.hitSoundClass=hitSoundCreate()

*gluestickHitBlunt.hitSoundClass=hitSoundCreate()
*crackHitBlunt.hitSoundClass=hitSoundCreate()
*bulletHit.hitSoundClass=hitSoundCreate()

hitSoundCreate(*wood_hitCut,*wood_hitCutBlocked,*wood_hitCutLight,*wood_hitCutMedium,*wood_hitCutHeavy)
hitSoundSet(*wood_hitCut)
*wood_hitPierceBlocked=*wood_hitBluntBlocked
hitSoundCreate(*wood_hitPierce,*wood_hitPierceBlocked,*wood_hitPierceLight,*wood_hitPierceMedium,*wood_hitPierceHeavy)
hitSoundSet(*wood_hitPierce)
hitSoundCreate(*wood_hitBlunt,*wood_hitBluntBlocked,*wood_hitBluntLight,*wood_hitBluntMedium,*wood_hitBluntHeavy)
hitSoundSet(*wood_hitBlunt)
*wood_hit.hitSoundMaterial=hitSoundMaterialCreate(0,*wood_hitCut,*wood_hitPierce,*wood_hitBlunt)

hitSoundCreate(*metal_hitCut,*metal_hitCutBlocked,*metal_hitCutLight,*metal_hitCutMedium,*metal_hitCutHeavy)
hitSoundSet(*metal_hitCut)
hitSoundCreate(*metal_hitPierce,*metal_hitPierceBlocked,*metal_hitPierceLight,*metal_hitPierceMedium,*metal_hitPierceHeavy)
hitSoundSet(*metal_hitPierce)
hitSoundCreate(*metal_hitBlunt,*metal_hitBluntBlocked,*metal_hitBluntLight,*metal_hitBluntMedium,*metal_hitBluntHeavy)
hitSoundSet(*metal_hitBlunt,3,8,15)

*metal_hit.hitSoundMaterial=hitSoundMaterialCreate(0,*metal_hitCut,*metal_hitPierce,*metal_hitBlunt)

*plastic_hitPierceHeavy=*wood_hitPierceHeavy 	; temporary
*plastic_hitCutBlocked=*wood_hitCutBlocked		; temporary
*plastic_hitCutHeavy=*wood_hitCutHeavy			; temporary
hitSoundCreate(*plastic_hitCut,*plastic_hitCutBlocked,*plastic_hitCutLight,*plastic_hitCutMedium,*plastic_hitCutHeavy)
hitSoundSet(*plastic_hitCut)
hitSoundCreate(*plastic_hitBlunt,*wood_hitBluntBlocked,*plastic_hitBluntLight,*plastic_hitBluntMedium,*plastic_hitBluntHeavy)
hitSoundSet(*plastic_hitBlunt)

hitSoundCreate(*plastic_hitPierce,*plastic_hitPierceBlocked,*plastic_hitPierceLight,*plastic_hitPierceMedium,*plastic_hitPierceHeavy)
hitSoundSet(*plastic_hitPierce,3,6,12)

*plastic_hit.hitSoundMaterial=hitSoundMaterialCreate(0,*plastic_hitCut,*plastic_hitPierce,*plastic_hitBlunt)
;-- finger
hitSoundCreate(*finger_hitBlunt,*finger_hitBluntBlocked,*finger_hitBluntLight,*finger_hitBluntMedium,*finger_hitBluntHeavy)
hitSoundSet(*finger_hitBlunt,2,7,15)
Global *finger_hit.hitSoundMaterial=hitSoundMaterialCreate(0,*finger_hitBlunt,*finger_hitBlunt,*finger_hitBlunt)

;-- gluestick
hitSoundCreate(*gluestickHitBlunt,*gluestickBluntBlock,*gluestickBluntLight,*gluestickBluntMedium,*gluestickBluntHeavy)
hitSoundSet(*gluestickHitBlunt,4,9,16)
*gluestick_hitS.hitSoundMaterial=hitSoundMaterialCreate(0,*gluestickHitBlunt,*gluestickHitBlunt,*gluestickHitBlunt)

;-- joint crack
hitSoundCreate(*crackHitBlunt,*allSoundPool(Str(#H2H_SOUND_ID_HAND_CREAK)),*allSoundPool(Str(#H2H_SOUND_ID_HAND_CREAK)),*allSoundPool(Str(#H2H_SOUND_ID_HAND_CREAK)),*allSoundPool(Str(#H2H_SOUND_ID_HAND_CREAK)))
hitSoundSet(*crackHitBlunt,4,9,16)
*crack_hitS.hitSoundMaterial=hitSoundMaterialCreate(0,*crackHitBlunt,*crackHitBlunt,*crackHitBlunt)

;-- bullet impact
hitSoundCreate(*bulletHit,*allSoundPool(Str(#H2H_SOUND_ID_BULLETLIGHT)),*allSoundPool(Str(#H2H_SOUND_ID_BULLETLIGHT)),*allSoundPool(Str(#H2H_SOUND_ID_BULLETMEDIUM)),*allSoundPool(Str(#H2H_SOUND_ID_METALPIERCEHEAVY)))
hitSoundSet(*bulletHit,3,5,7)
*bullet_hitS.hitSoundMaterial=hitSoundMaterialCreate(0,*bulletHit,*bulletHit,*bulletHit)
CompilerEndIf
;--- animations and sprites
CompilerIf #H2H_MOUSE_ENABLED
	MouseLocate(screenSizeX/2,screenSizeY/2)
CompilerEndIf
; this function will reload all the basic stuff when resizing a window

Macro animationArrayLoad(a)
	For i=0 To ArraySize(a())
		animationLoad(a(i))
	Next
EndMacro

Procedure swishesLoad()
	animationArrayLoad(*landLightFront)
	animationArrayLoad(*landLightBack)
	animationArrayLoad(*landHeavyFront)
	animationArrayLoad(*landHeavyBack)
EndProcedure

Global Dim *loadingAnimations.animation(0)

Procedure.i loadingAdd(path$)
	*loading.animation=animationCreate(0,1,0,0,"loading")
	Protected index.i=1
	While fileExist(path$+Str(index)+".png")
		animationAddFrame(*loading,frameCreate(0,4,path$+Str(index),0,0,0))
		index+1
	Wend
	Protected where=ArraySize(*loadingAnimations())
	If *loadingAnimations(where)
		where+1
		ReDim *loadingAnimations(where)
	EndIf
	*loadingAnimations(where)=*loading
	Debug "loaded "+path$
	ProcedureReturn *loading
EndProcedure

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure.i loadingAddAll()
	Protected index.i=1
	While fileExist("image/loading"+Str(index)+"_1.png")
		loadingAdd("image/loading"+Str(index)+"_")
		index+1
	Wend
	animationDecodeAllShift(*loadingAnimations(0),*loading1Raw)
	animationDecodeAllShift(*loadingAnimations(1),*loading2Raw)
	animationSetFrameLength(*loadingAnimations(1),0,8)
	animationSetFrameLength(*loadingAnimations(1),1,8)
	animationSetFrameLength(*loadingAnimations(1),2,12)
	animationSetFrameLength(*loadingAnimations(1),3,8)
	animationSetFrameLength(*loadingAnimations(1),4,8)
EndProcedure
 loadingAddAll()
CompilerEndIf

Macro loadingLoad()
	animationArrayLoad(*loadingAnimations)
EndMacro

Macro loadingPickRandom()
	*loadingAnimations(Random(ArraySize(*loadingAnimations())))
EndMacro

Global *loadingGadget.animationGadget=0

Procedure loadingSelect()
	If *loadingGadget
		*previous.animation=*loadingGadget\what
		While *previous=*loadingGadget\what
			*loadingGadget\what=loadingPickRandom()
		Wend
	EndIf
EndProcedure

Procedure loadingStop()
	If *loadingGadget
		*loadingGadget\display=0
		*loadingGadget\enabled=0
	EndIf
EndProcedure

Procedure loadingStart()
	screenFocus=0
	screenFocusHeight=0
	If Not *loadingGadget
		*loadingGadget=gadgetCreate(0,0,locationCreate(),99999,1,1)
	EndIf
	loadingSelect()
	*loadingGadget\display=1
	*loadingGadget\enabled=1
	*loadingGadget\indestructible=1
 	*loadingGadget\color=0
 	*loadingGadget\colorIntensity=0
	set(*loadingGadget\where,screenSizeX-300,screenSizeY-300)
	animationLoad(*loadingGadget\what)
	currentHint=Random(nbHint)
EndProcedure

Procedure loadingLoop(delta.d=1.0)
	gadgetRefresh(*loadingGadget,delta)
	gadgetDisplay(*loadingGadget)
EndProcedure

Macro animationArrayFree(a)
	For i=0 To ArraySize(a())
		animationUnload(a(i))
	Next
EndMacro

Macro swishesFree()
	animationArrayFree(*landLightFront)
	animationArrayFree(*landLightBack)
	animationArrayFree(*landHeavyFront)
	animationArrayFree(*landHeavyBack)
EndMacro

Declare loadComboSprites()
Procedure loadBasicSprites()
	If Not IsSprite(iconAtlas)
		LoadSprite(iconAtlas,"image/icons.png",#PB_Sprite_AlphaBlending)
	EndIf
	; cursor
	CompilerIf #H2H_MOUSE_ENABLED
		If Not IsSprite(iconAtlas)
			LoadSprite(cursorNormal,"image/cursor_normal.png")
			TransparentSpriteColor(cursorNormal,RGB(0,0,0))
		EndIf
		If Not IsSprite(iconAtlas)
			LoadSprite(cursorSelect,"image/cursor_select.png")
			TransparentSpriteColor(cursorSelect,RGB(0,0,0))
		EndIf
		If Not IsSprite(iconAtlas)
			LoadSprite(cursorClick,"image/cursor_click.png")
			TransparentSpriteColor(cursorClick,RGB(0,0,0))
		EndIf
	CompilerEndIf
	initAffText()
	
	statLoad()
	
	createShadowSprite()
	createHitBoxSprite()
	
	If Not IsSprite(counter(1))
		LoadSprite(counter(1),"image/counterTwo.png",#PB_Sprite_AlphaBlending)
	EndIf
	If Not IsSprite(counter(2))
		LoadSprite(counter(2),"image/counterThree.png",#PB_Sprite_AlphaBlending)
	EndIf
	classIconLoad()
	
	;ground
	If IsSprite(groundSprite)
		FreeSprite(groundSprite)
	EndIf
	If Not IsSprite(groundSprite)
		CreateSprite(groundSprite,screenSizeX,100)
		StartDrawing(SpriteOutput(groundSprite))
		Box(0,0,screenSizeX,100,RGB(128,0,0))
		StopDrawing()
	EndIf
	initParticles()
	loadComboSprites()
	swishesLoad()
	loadingLoad()
	initFiller()
EndProcedure

loadBasicSprites()
animationCreate(*emptyAnimation,1,0)

Dim *tmpArray.hitSoundMaterial(0) ; used to store the attack side of players.
;------ Class

;{
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure.i classGenerateAnimation(number.i,path$,baseLength.i,type.i,name$,looped.i,*raw.rawDataArray,recovery.i=0,damageType.i=0,damage.i=0,side.i=0)
; 		Debug "Generating "+path$
		*newAnimation.animation=animationCreate(0,looped,Bool(recovery Or damage Or damageType Or side),recovery,name$)
		*newAnimation\animationType=type
		For i=0 To number
			k=i+1
			animationAddFrame(*newAnimation,frameCreate(0,baseLength,path$+k,1,0,1,damage,0,damageType,side))
		Next
		;Debug "for path "+path$
		animationSetAttack(*newAnimation,damage|damageType|side|recovery)
		animationDecodeAllShift(*newAnimation,*raw)
		ProcedureReturn *newAnimation
	EndProcedure
	*landLightFront(0)=classGenerateAnimation(3,"image/land_light_front1_",3,#H2H_ANIMATIONTYPE_LAND,"light land front wind",0,*landLightFront1Raw)
	animationSetFrameFreeMovement(*landLightFront(0)\frames(0))
	animationSetFrameLength(*landLightFront(0),2,6)
	animationSetFrameLength(*landLightFront(0),3,9)
	*landLightBack(0)=classGenerateAnimation(3,"image/land_light_back1_",3,#H2H_ANIMATIONTYPE_LAND,"light land back wind",0,*landLightBack1Raw)
	animationSetFrameFreeMovement(*landLightBack(0)\frames(0))
	animationSetFrameLength(*landLightBack(0),2,6)
	animationSetFrameLength(*landLightBack(0),3,9)
	*landHeavyFront(0)=classGenerateAnimation(4,"image/land_heavy_front1_",3,#H2H_ANIMATIONTYPE_LAND,"heavy land front wind",0,*landHeavyFront1Raw)
	animationSetFrameFreeMovement(*landHeavyFront(0)\frames(0))
	animationSetFrameLength(*landHeavyFront(0),3,6)
	animationSetFrameLength(*landHeavyFront(0),4,9)
	*landHeavyBack(0)=classGenerateAnimation(3,"image/land_heavy_back1_",3,#H2H_ANIMATIONTYPE_LAND,"heavy land back wind",0,*landHeavyBack1Raw)
	animationSetFrameFreeMovement(*landHeavyBack(0)\frames(0))
	animationSetFrameLength(*landHeavyBack(0),2,6)
	animationSetFrameLength(*landHeavyBack(0),3,9)
CompilerEndIf
; H2H_STANCE_COLOR_WOOD=RGB(84,35,13)
; H2H_STANCE_COLOR_DARKWOOD=RGB(42,17,6)
; H2H_STANCE_COLOR_METAL=RGB(64,64,64)
; H2H_STANCE_COLOR_DARKMETAL=RGB(32,32,32)
; H2H_STANCE_COLOR_LIGHTMETAL=RGB(96,32,32)
; H2H_STANCE_COLOR_RED=RGB(255,0,0)
; H2H_STANCE_COLOR_BLUE=RGB(0,0,255)
; H2H_STANCE_COLOR_GREEN=RGB(0,255,0)
; H2H_STANCE_COLOR_YELLOW=RGB(255,255,0)
; H2H_STANCE_COLOR_BLACK=RGB(1,1,1)
; H2H_STANCE_COLOR_GRAY=RGB(128,128,128)
; H2H_STANCE_COLOR_WHITE=RGB(192,192,192)
; H2H_STANCE_COLOR_LIGHTGRAY=RGB(160,160,160)
; H2H_STANCE_COLOR_LIGHTRED=RGB(255,128,128)
; H2H_STANCE_COLOR_LIGHTGREEN=RGB(128,255,128)
; H2H_STANCE_COLOR_LIGHTBLUE=RGB(128,128,255)

#H2H_JSON_LOADING="loading"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
IncludeFile "chopstick.pb"
IncludeFile "unarmed.pb"
IncludeFile "ballpen.pb"
IncludeFile "fountainPen.pb"
IncludeFile "gluestick.pb"
IncludeFile "ruler.pb"
IncludeFile "stylus.pb"
IncludeFile "clutchPen.pb"
IncludeFile "fineFelt.pb"
IncludeFile "pencil.pb"
IncludeFile "eraserPen.pb"
IncludeFile "phoneCharger.pb"
IncludeFile "hexKeyInit.pb"
IncludeFile "fork.pb"
IncludeFile "spoon.pb"
IncludeFile "knife.pb"
IncludeFile "scissors.pb"
;IncludeFile "plainStylet.pb"

;}
Procedure classJSONExportAll(*parent=0)
	current=JSONindex
	If Not *parent
		*parent=CreateJSONArray(current)
		SetJSONArray(*parent)
	EndIf
	JSONindex+1
	For i=0 To ArraySize(*allClasses())
		If *allClasses(i)
			;Debug *allClasses(i)\name
			*c=AddJSONElement(*parent)
			SetJSONObject(*c)
			classJSONExport(*c,*allClasses(i))
		EndIf
	Next
	;SaveJSON(current,"test.txt",#PB_JSON_PrettyPrint)
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	
; Procedure classJSONImportSub(*cl.classLoader)
; 	*allClasses(*cl\index)=classJSONImport(GetJSONElement(*cl\parent,*cl\index))
; 	Debug "Imported class "+*allClasses(*cl\index)\name
; EndProcedure
; Procedure classJSONImportAll(*parent)
; 	size=JSONArraySize(*parent)
; 	Dim thread(size-1)
; 	Dim cl.classLoader(size-1)
; 	ReDim *allClasses(size-1)
; 	For c=0 To size-1
; 		cl(c)\parent=*parent
; 		cl(c)\index=c
; 		thread(c)=CreateThread(@classJSONImportSub(),@cl(c))
; 		Debug "Created thread "+c+" with "+thread(c)
; 	Next
; 	Delay(1000)
; 	For c=0 To size-1
; 		WaitThread(thread(c))
; 		Debug "thread "+c+" ended "+thread(c)
; 	Next
; 	End
; EndProcedure
Procedure classJSONImportAll(*parent)
	size=JSONArraySize(*parent)
	ReDim *allClasses(size-1)
	For c=0 To size-1
		*allClasses(c)=classJSONImport(GetJSONElement(*parent,c))
	Next
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	
Procedure JSONExportAnimationArray(*parent,Array *what.animation(1),name$)
  	*array=AddJSONMember(*parent,name$)
 	SetJSONArray(*array)

	For i=0 To ArraySize(*what())
		*e=AddJSONElement(*array)
		SetJSONObject(*e)
		animationJSONExport(*what(i),*e)
	Next
EndProcedure
	
Procedure JSONExportEffect(*parent,Array *what.animation(1),name$)
  	JSONExportAnimationArray(*parent,*what(),name$)
EndProcedure

Procedure JSONExportEffectAll(*parent)
	JSONExportEffect(*parent,*landLightFront(),"LandLightFront")
	JSONExportEffect(*parent,*landLightBack(),"LandLightBack")
	JSONExportEffect(*parent,*landHeavyFront(),"LandHeavyFront")
	JSONExportEffect(*parent,*landHeavyBack(),"LandHeavyBack")
EndProcedure


Procedure JSONExportLoadingAll(*parent)
  	JSONExportAnimationArray(*parent,*loadingAnimations(),#H2H_JSON_LOADING)
EndProcedure
CompilerEndIf

#H2H_JSON_CLASS="class"
#H2H_JSON_EFFECT="effect"
#H2H_JSON_SOUND="soundPool"
#H2H_JSON_SOUND_CLASS="soundClass"
#H2H_JSON_SOUND_MATERIAL="soundMaterial"
#H2H_JSON_PLAYER="player"
#H2H_JSON_BACKGROUND="background"
#H2H_JSON_UI_SOUND="UISound"
#H2H_JSON_UI_2D="UI2D"
#H2H_JSON_MUSIC="music"
#H2H_JSON_FONT="font"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure JSONExportAll(path$)
	current=JSONindex
	*parent=CreateJSONObject()
	
	*class=AddJSONMember(*parent,#H2H_JSON_CLASS)
	SetJSONArray(*class)
	classJSONExportAll(*class)
	
	*music=AddJSONMember(*parent,#H2H_JSON_MUSIC)
	SetJSONArray(*music)
	musicJSONExportAll(*music)
	
	*pool=AddJSONMember(*parent,#H2H_JSON_SOUND)
	SetJSONArray(*pool)
	poolJSONExportAll(*pool)
	
	*hitSound=AddJSONMember(*parent,#H2H_JSON_SOUND_CLASS)
	SetJSONArray(*hitSound)
	hitSoundJSONExportAll(*hitSound)
	
	*material=AddJSONMember(*parent,#H2H_JSON_SOUND_MATERIAL)
	SetJSONArray(*material)
	materialJSONExportAll(*material)
	
	*effect=addJSONObject(*parent,#H2H_JSON_EFFECT)
	JSONExportEffectAll(*effect)
	
	*loading=addJSONObject(*parent,#H2H_JSON_LOADING)
	JSONExportLoadingAll(*loading)
	
	*player=addJSONObject(*parent,#H2H_JSON_PLAYER)
	PlayerExportJSON(*player)
	
	addJSONDouble(*parent,#H2H_TIME_SCALE_KEY,TIME_SCALE)
	addJSONDouble(*parent,#H2H_TIME_SLOMO_KEY,TIME_SLOMO)
	addJSONDouble(*parent,"blackScreenVelocity",BLACK_SCREEN_VELOCITY_BASE)
	addJSONInteger(*parent,"fightDemoDelay",FIGHT_DEMO_DELAY)
	*memory=addJSONObject(*parent,#H2H_JSON_MEMORY_KEY)
	addJSONInteger(*memory,"location",DATA_LOCATION_BASE)
	addJSONInteger(*memory,"frame",DATA_FRAME_BASE)
	addJSONInteger(*memory,"animation",DATA_ANIMATION_BASE)
	addJSONInteger(*memory,"gadget",DATA_ANIMATION_GADGET_BASE)
	addJSONInteger(*memory,"damageGadget",DATA_DAMAGEGADGET_BASE)
	addJSONInteger(*memory,"statistic",DATA_STATISTIC_BASE)
	addJSONInteger(*memory,"stance",DATA_STANCE_BASE)
	addJSONInteger(*memory,"class",DATA_CLASS_BASE)
	addJSONInteger(*memory,"particle",DATA_PARTICLE_BASE)
	addJSONInteger(*memory,"damageData",DATA_DAMAGEDATA_BASE)
	addJSONInteger(*memory,"player",DATA_PLAYER_BASE)
	
	*language=languageExportAll(*parent)
	
	*backgrounds=AddJSONMember(*parent,#H2H_JSON_BACKGROUND)
	SetJSONArray(*backgrounds)
	backGroundExportJSONAll(*backgrounds)
	
	*UISound=addJSONObject(*parent,#H2H_JSON_UI_SOUND)
	addJSONInteger(*UISound,"SOUND_UI_MENU_CLICK",*soundUI(#H2H_SOUND_UI_MENU_CLICK)\id)
	addJSONInteger(*UISound,"SOUND_UI_MENU_ACCEPT",*soundUI(#H2H_SOUND_UI_MENU_ACCEPT)\id)
	addJSONInteger(*UISound,"SOUND_UI_MENU_CANCEL",*soundUI(#H2H_SOUND_UI_MENU_CANCEL)\id)
	addJSONInteger(*UISound,"SOUND_UI_MENU_CHANGE",*soundUI(#H2H_SOUND_UI_MENU_CHANGE)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_CUT",*soundUI(#H2H_SOUND_UI_BATTLE_KILL_CUT)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_PIERCE",*soundUI(#H2H_SOUND_UI_BATTLE_KILL_PIERCE)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_BLUNT",*soundUI(#H2H_SOUND_UI_BATTLE_KILL_BLUNT)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_COMBO",*soundUI(#H2H_SOUND_UI_BATTLE_COMBO)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_BLOCK",*soundUI(#H2H_SOUND_UI_BATTLE_BLOCK)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_JUMP_LIGHT",*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_LIGHT)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_JUMP_HEAVY",*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_HEAVY)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_LAND_LIGHT",*soundUI(#H2H_SOUND_UI_BATTLE_LAND_LIGHT)\id)
	addJSONInteger(*UISound,"SOUND_UI_BATTLE_LAND_HEAVY",*soundUI(#H2H_SOUND_UI_BATTLE_LAND_HEAVY)\id)
	addJSONInteger(*UISound,"SOUND_STEREO_DEFAULT_WIDTH",SOUND_STEREO_DEFAULT_WIDTH)
	addJSONInteger(*UISound,"SOUND_STEREO_SMALL_WIDTH",SOUND_STEREO_SMALL_WIDTH)
	addJSONInteger(*UISound,"SOUND_STEREO_NONE_WIDTH",SOUND_STEREO_NONE_WIDTH)
	addJSONInteger(*UISound,"SOUND_VARIATION_ITERATION",SOUND_VARIATION_ITERATION)
	addJSONInteger(*UISound,"SOUND_VARIATION_PERCENT",SOUND_VARIATION_PERCENT)
	
	*UI2D=addJSONObject(*parent,#H2H_JSON_UI_2D)
	addJSONInteger(*UI2D,"ICON_STRENGTH_COLOR",iconColor(#H2H_ICON_STRENGTH))
	addJSONInteger(*UI2D,"ICON_AGILITY_COLOR",iconColor(#H2H_ICON_AGILITY))
	addJSONInteger(*UI2D,"ICON_SPEED_COLOR",iconColor(#H2H_ICON_SPEED))
	addJSONInteger(*UI2D,"ICON_WEIGHT_COLOR",iconColor(#H2H_ICON_WEIGHT))
	addJSONInteger(*UI2D,"ICON_ENDURENCE_COLOR",iconColor(#H2H_ICON_ENDURENCE))
	addJSONInteger(*UI2D,"ICON_LIFE_COLOR",iconColor(#H2H_ICON_LIFE))
	addJSONInteger(*UI2D,"ICON_CUT_COLOR",iconColor(#H2H_ICON_CUT))
	addJSONInteger(*UI2D,"ICON_PIERCE_COLOR",iconColor(#H2H_ICON_PIERCE))
	addJSONInteger(*UI2D,"ICON_BLUNT_COLOR",iconColor(#H2H_ICON_BLUNT))
	addJSONInteger(*UI2D,"ICON_REACH_COLOR",iconColor(#H2H_ICON_REACH))
	addJSONInteger(*UI2D,"ICON_DIFFICULTY_COLOR",iconColor(#H2H_ICON_DIFFICULTY))
	
	*font=addJSONObject(*parent,#H2H_JSON_FONT)
	fontJSONExport(*font16,addJSONObject(*parent,"font16"))
	fontJSONExport(*font32,addJSONObject(*parent,"font32"))
	fontJSONExport(*font16Border,addJSONObject(*parent,"font16Border"))
	fontJSONExport(*font16BorderBig,addJSONObject(*parent,"font16BorderBig"))
	fontJSONExport(*font32Border,addJSONObject(*parent,"font32Border"))
	
	debugCommandJSONExportAll(*parent)

	SaveJSON(current,path$)
; 	SaveJSON(current,path$,#PB_JSON_PrettyPrint)
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure JSONImportAnimationArray(*parent,Array *what.animation(1),name$)
	*array=GetJSONMember(*parent,name$)
	If *array
		size=JSONArraySize(*array)
		Debug "size : "+size
		ReDim *what(size-1)
		For i=0 To size-1
			*e=GetJSONElement(*array,i)
			*a=animationJSONImport(*e,0)
			*what(i)=*a
; 			Debug "for "+i+" "+*what(i)
		Next
	Else
		Debug name$+" not found"
	EndIf
EndProcedure

Procedure JSONImportEffect(*parent,Array *what.animation(1),name$)
	JSONImportAnimationArray(*parent,*what(),name$)
EndProcedure

Procedure JSONImportEffectAll(*parent)
	JSONImportEffect(*parent,*landLightFront(),"LandLightFront")
	JSONImportEffect(*parent,*landLightBack(),"LandLightBack")
	JSONImportEffect(*parent,*landHeavyFront(),"LandHeavyFront")
	JSONImportEffect(*parent,*landHeavyBack(),"LandHeavyBack")
EndProcedure

Procedure JSONImportLoadingAll(*parent)
	JSONImportAnimationArray(*parent,*loadingAnimations(),#H2H_JSON_LOADING)
EndProcedure

Procedure JSONImportAll(path$)
	If LoadJSON(JSONindex,path$)
		*parent=JSONValue(JSONindex)
		poolJSONImportAll(GetJSONMember(*parent,#H2H_JSON_SOUND))
		musicJSONImportAll(GetJSONMember(*parent,#H2H_JSON_MUSIC))
		hitSoundJSONImportAll(GetJSONMember(*parent,#H2H_JSON_SOUND_CLASS))
		materialJSONImportAll(GetJSONMember(*parent,#H2H_JSON_SOUND_MATERIAL))
		classJSONImportAll(GetJSONMember(*parent,#H2H_JSON_CLASS))
		JSONImportEffectAll(GetJSONMember(*parent,#H2H_JSON_EFFECT))
		JSONImportLoadingAll(GetJSONMember(*parent,#H2H_JSON_LOADING))
		playerImportJSON(GetJSONMember(*parent,#H2H_JSON_PLAYER))
		backGroundImportJSONAll(GetJSONMember(*parent,#H2H_JSON_BACKGROUND))
		languageImportAll(*parent)
		debugCommandJSONImportAll(*parent)
		TIME_SCALE=loadJSONDouble(*parent,#H2H_TIME_SCALE_KEY)
		If TIME_SCALE=0
			TIME_SCALE=#H2H_TIME_SCALE
		EndIf
		If TIME_SCALE<0.1
			TIME_SCALE=0.1
		EndIf
		TIME_SLOMO=loadJSONDouble(*parent,#H2H_TIME_SLOMO_KEY)
		If TIME_SLOMO=0
			TIME_SLOMO=#H2H_TIME_SLOMO
		EndIf
		If TIME_SLOMO<0.1
			TIME_SLOMO=0.1
		EndIf
		BLACK_SCREEN_VELOCITY_BASE=loadJSONDouble(*parent,"blackScreenVelocity")
		If BLACK_SCREEN_VELOCITY_BASE=0
			BLACK_SCREEN_VELOCITY_BASE=#H2H_BLACK_SCREEN_VELOCITY_BASE
		EndIf
		If BLACK_SCREEN_VELOCITY_BASE>128
			TIME_SLOMO=128
		EndIf
		If BLACK_SCREEN_VELOCITY_BASE<1
			BLACK_SCREEN_VELOCITY_BASE=1
		EndIf
		FIGHT_DEMO_DELAY=loadJSONInteger(*parent,"fightDemoDelay")
		If FIGHT_DEMO_DELAY<6
			FIGHT_DEMO_DELAY=6
		EndIf
		
		*UISound=GetJSONMember(*parent,#H2H_JSON_UI_SOUND)
		*soundUI(#H2H_SOUND_UI_MENU_CLICK)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_MENU_CLICK")))
		*soundUI(#H2H_SOUND_UI_MENU_ACCEPT)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_MENU_ACCEPT")))
		*soundUI(#H2H_SOUND_UI_MENU_CANCEL)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_MENU_CANCEL")))
		*soundUI(#H2H_SOUND_UI_MENU_CHANGE)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_MENU_CHANGE")))
		*soundUI(#H2H_SOUND_UI_BATTLE_KILL_CUT)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_CUT")))
		*soundUI(#H2H_SOUND_UI_BATTLE_KILL_PIERCE)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_PIERCE")))
		*soundUI(#H2H_SOUND_UI_BATTLE_KILL_BLUNT)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_KILL_BLUNT")))
		*soundUI(#H2H_SOUND_UI_BATTLE_COMBO)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_COMBO")))
		*soundUI(#H2H_SOUND_UI_BATTLE_BLOCK)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_BLOCK")))
		*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_LIGHT)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_JUMP_LIGHT")))
		*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_HEAVY)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_JUMP_HEAVY")))
		*soundUI(#H2H_SOUND_UI_BATTLE_LAND_LIGHT)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_LAND_LIGHT")))
		*soundUI(#H2H_SOUND_UI_BATTLE_LAND_HEAVY)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_LAND_HEAVY")))
		*soundUI(#H2H_SOUND_UI_BATTLE_GUARD_BREAK)=*allSoundPool(Str(loadJSONInteger(*UISound,"SOUND_UI_BATTLE_GUARD_BREAK")))
		If GetJSONMember(*UISound,"SOUND_STEREO_DEFAULT_WIDTH")
			SOUND_STEREO_DEFAULT_WIDTH=loadJSONInteger(*UISound,"SOUND_STEREO_DEFAULT_WIDTH")
		Else
			SOUND_STEREO_DEFAULT_WIDTH=#H2H_SOUND_STEREO_DEFAULT_WIDTH
			If SOUND_STEREO_DEFAULT_WIDTH<0
				SOUND_STEREO_DEFAULT_WIDTH=0
			EndIf
			If SOUND_STEREO_DEFAULT_WIDTH>100
				SOUND_STEREO_DEFAULT_WIDTH=100
			EndIf
		EndIf
		If GetJSONMember(*UISound,"SOUND_STEREO_SMALL_WIDTH")
			SOUND_STEREO_SMALL_WIDTH=loadJSONInteger(*UISound,"SOUND_STEREO_SMALL_WIDTH")
		Else
			SOUND_STEREO_SMALL_WIDTH=#H2H_SOUND_STEREO_SMALL_WIDTH
			If SOUND_STEREO_SMALL_WIDTH<0
				SOUND_STEREO_SMALL_WIDTH=0
			EndIf
			If SOUND_STEREO_SMALL_WIDTH>100
				SOUND_STEREO_SMALL_WIDTH=100
			EndIf
		EndIf
		If GetJSONMember(*UISound,"SOUND_STEREO_NONE_WIDTH")
			SOUND_STEREO_NONE_WIDTH=loadJSONInteger(*UISound,"SOUND_STEREO_NONE_WIDTH")
		Else
			SOUND_STEREO_NONE_WIDTH=#H2H_SOUND_STEREO_NONE_WIDTH
			If SOUND_STEREO_NONE_WIDTH<0
				SOUND_STEREO_NONE_WIDTH=0
			EndIf
			If SOUND_STEREO_NONE_WIDTH>100
				SOUND_STEREO_NONE_WIDTH=100
			EndIf
		EndIf
		If GetJSONMember(*UISound,"SOUND_VARIATION_PERCENT")
			SOUND_VARIATION_PERCENT=loadJSONInteger(*UISound,"SOUND_VARIATION_PERCENT")
		Else
			SOUND_VARIATION_PERCENT=#H2H_SOUND_VARIATION_PERCENT
			If SOUND_VARIATION_PERCENT<0
				SOUND_VARIATION_PERCENT=0
			EndIf
		EndIf
		If GetJSONMember(*UISound,"SOUND_VARIATION_ITERATION")
			SOUND_VARIATION_ITERATION=loadJSONInteger(*UISound,"SOUND_VARIATION_ITERATION")
		Else
			SOUND_VARIATION_ITERATION=#H2H_SOUND_VARIATION_ITERATION
			If SOUND_VARIATION_ITERATION<1
				SOUND_VARIATION_ITERATION=1
			EndIf
		EndIf
		
		*UI2D=GetJSONMember(*parent,#H2H_JSON_UI_2D)
		iconColor(#H2H_ICON_STRENGTH)=loadJSONInteger(*UI2D,"ICON_STRENGTH_COLOR")
		iconColor(#H2H_ICON_AGILITY)=loadJSONInteger(*UI2D,"ICON_AGILITY_COLOR")
		iconColor(#H2H_ICON_SPEED)=loadJSONInteger(*UI2D,"ICON_SPEED_COLOR")
		iconColor(#H2H_ICON_WEIGHT)=loadJSONInteger(*UI2D,"ICON_WEIGHT_COLOR")
		iconColor(#H2H_ICON_ENDURENCE)=loadJSONInteger(*UI2D,"ICON_ENDURENCE_COLOR")
		iconColor(#H2H_ICON_LIFE)=loadJSONInteger(*UI2D,"ICON_LIFE_COLOR")
		iconColor(#H2H_ICON_CUT)=loadJSONInteger(*UI2D,"ICON_CUT_COLOR")
		iconColor(#H2H_ICON_PIERCE)=loadJSONInteger(*UI2D,"ICON_PIERCE_COLOR")
		iconColor(#H2H_ICON_BLUNT)=loadJSONInteger(*UI2D,"ICON_BLUNT_COLOR")
		iconColor(#H2H_ICON_REACH)=loadJSONInteger(*UI2D,"ICON_REACH_COLOR")
		iconColor(#H2H_ICON_DIFFICULTY)=loadJSONInteger(*UI2D,"ICON_DIFFICULTY_COLOR")
		
		*font=GetJSONMember(*parent,#H2H_JSON_FONT)
		*font16=fontJSONImport(GetJSONMember(*font,"font16"),*font16)
		*font32=fontJSONImport(GetJSONMember(*font,"font32"),*font32)
		*font16Border=fontJSONImport(GetJSONMember(*font,"font16Border"),*font16Border)
		*font16BorderBig=fontJSONImport(GetJSONMember(*font,"font16BorderBig"),*font16BorderBig)
		*font32Border=fontJSONImport(GetJSONMember(*font,"font32Border"),*font32Border)
		initAffText()
		FreeJSON(JSONindex)
	Else
		MessageRequester("Error","Failed to open the data.json file\n(do not move or delete it !)",#PB_MessageRequester_Error)
	EndIf
EndProcedure
CompilerEndIf
;--- import export
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	JSONExportAll("data.json")
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	JSONImportAll("data.json")
	Define *chopstick.class=*allClasses(0)
	Define *ballpen.class=*allClasses(1)
	Define *unarmed.class=*allClasses(2)
	Define *bigballpen.class=*allClasses(3)
	Define *gluestick.class=*allClasses(4)
	Define *ruler.class=*allClasses(5)
	Define *graphicpen.class=*allClasses(6)
	Define *criterium.class=*allClasses(7)
	Define *point88.class=*allClasses(8)
	Define *eraserpen.class=*allClasses(9)
	Define *charger.class=*allClasses(10)
	Define *hexKey.class=*allClasses(11)
	Define *fork.class=*allClasses(12)
	Define *spoon.class=*allClasses(13)
	Define *plainstylet.class=*allClasses(14)
CompilerEndIf
;------ Combo import
animationBranchAll()
; animationCloneBranchAll()

Procedure loadComboSprites()
	If Not IsSprite(comboIconNeutral)
		LoadSprite(comboIconNeutral		,"image/comboNeutral.png",#PB_Sprite_AlphaBlending)
		LoadSprite(comboIconUp		,"image/comboUp.png",#PB_Sprite_AlphaBlending)
		LoadSprite(comboIconHeavy		,"image/comboHeavy.png",#PB_Sprite_AlphaBlending)
	EndIf
EndProcedure
loadComboSprites()

;------ Player creation
; *player3ctrl.control=controlSet(0,#PB_Key_Up,#PB_Key_Down,#PB_Key_Right,#PB_Key_Left,#PB_Key_P,#PB_Key_O,#PB_Key_L)
; Global player3.player
; createPlayer(player3,"Player one",RGB(192,64,0),*player3ctrl,*chineseStaff)
; animationcopy(player3\currentAnimation,player3\class\idle)
; player3\direction=0
; set(player3\position,2000+screenSizeX/3-#HITBOX_SIZE-#HITBOX_SHIFT_X,screenSizeY-1200+#HITBOX_SHIFT_Y)

*player1ctrl.control=controlDefine(0,#H2H_CONTROL_DEFAULT_RIGHT_UP,#H2H_CONTROL_DEFAULT_RIGHT_DOWN,#H2H_CONTROL_DEFAULT_RIGHT_RIGHT,#H2H_CONTROL_DEFAULT_RIGHT_LEFT,#H2H_CONTROL_DEFAULT_RIGHT_NEUTRAL,#H2H_CONTROL_DEFAULT_RIGHT_HEAVY,#H2H_CONTROL_DEFAULT_RIGHT_SPECIAL)
Global *player1.player=playerCreate(0,"Player one",#H2H_STANCE_COLOR_VERMILLON,*player1ctrl,*chopstick)
*player1\alternateColor=#Yellow
; If InitJoystick()>0
; 	*player1\joystickId=0
; EndIf
*player1\joystickId=0
playerSetClass(*player1,*unarmed,0)
; Debug "player class "+*player1\class\name
playerResetAnimationTo(*player1,playerGetIdle(*player1))
Global *bot1.bot=AICreate(*player1)
*bot1\mode=#H2H_AI_MODE_DISABLED

*player2ctrl.control=controlDefine(0,#H2H_CONTROL_DEFAULT_LEFT_UP,#H2H_CONTROL_DEFAULT_LEFT_DOWN,#H2H_CONTROL_DEFAULT_LEFT_RIGHT,#H2H_CONTROL_DEFAULT_LEFT_LEFT,#H2H_CONTROL_DEFAULT_LEFT_NEUTRAL,#H2H_CONTROL_DEFAULT_LEFT_HEAVY,#H2H_CONTROL_DEFAULT_LEFT_SPECIAL)
Global *player2.player=playerCreate(0,"Player two",#H2H_STANCE_COLOR_LIGHTBLUE,*player2ctrl,*chopstick,1)
playerResetAnimationTo(*player2,playerGetIdle(*player2))
playerSetClass(*player2,*chopstick,0)
; If InitJoystick()>1
; 	*player2\joystickId=1
; EndIf
*player2\joystickId=1
*player2\alternateColor=#White
Global *bot2.bot=AICreate(*player2)
*bot2\mode=#H2H_AI_MODE_DISABLED

buildAvailableClassArrayId(#True)

Procedure gameCreate1v1(*game.game,*where.background,versusBot.i)
	If Not *game
		If versusBot
			*game=gameCreate(*game,"1vbot",*where,#H2H_GAME_1VBOT)
		Else
			*game=gameCreate(*game,"1v1",*where,#H2H_GAME_1V1)
		EndIf
		gameAddGroup(*game,0,"right")
		gameAddPlayer(*game,0,*player1)
		gameAddGroup(*game,0,"left")
		gameAddPlayer(*game,1,*player2)
		groupSetEnemy(gameGetGroup(*game,0),gameGetGroup(*game,1))
		groupSetEnemy(gameGetGroup(*game,1),gameGetGroup(*game,0))
		*g.group=gameGetGroup(*game,0)
	Else
		If versusBot
			*game\type=#H2H_GAME_1VBOT
		Else
			*game\type=#H2H_GAME_1V1
		EndIf
	EndIf
	ProcedureReturn *game
EndProcedure

Procedure gameCreate1vMany(*game.game,*where.background,number)
	*game=gameCreate1v1(*game,*where,1)
	SelectElement(*game\allGroups(),1)
	For i=2 To number
		;groupAddPlayer(*game\allGroups(),createPlayer(0,"Ennemy "+i,RGB(100,100,255),*player2ctrl,*plainstylet,1)
	Next
	ProcedureReturn *game
EndProcedure

;--- digesting
; compressClassAll()
; compressedFrameFuse()
; compressedFrameToJSONAll()
; atlasInit()
; For i=0 To ArraySize(*chineseStaff_Neutral\frames())
; 	framePuke(*chineseStaff_Neutral\frames(i),1)
; Next
;------ Other

Global *leftPlayer.player=*player1
Global *rightPlayer.player=*player2
Global debugLine=spriteIndexAdd()
Global debugMiniGround=spriteIndexAdd()
Global debugMinileft=spriteIndexAdd()
Global debugMiniright=spriteIndexAdd()
Global debugPlayer=spriteIndexAdd()
Procedure createDebugSprites(*what.background)
	If Not IsSprite(debugLine)
		CreateSprite(debugLine,2,6000/40)
		StartDrawing(SpriteOutput(debugLine))
		Box(0,0,2,*what\size/40,RGB(0,0,255))
		StopDrawing()
		
		CreateSprite(debugMiniGround,*what\size/10,5)
		StartDrawing(SpriteOutput(debugMiniGround))
		Box(0,0,*what\size/10,5,RGB(0,100,255))
		StopDrawing()
		
		CreateSprite(debugMinileft,10,10)
		StartDrawing(SpriteOutput(debugMinileft))
		Box(0,0,10,10,RGB(0,255,255))
		StopDrawing()
		
		CreateSprite(debugMiniright,10,10)
		StartDrawing(SpriteOutput(debugMiniright))
		Box(0,0,10,10,RGB(255,255,255))
		StopDrawing()
		
		CreateSprite(debugPlayer,10,10)
		StartDrawing(SpriteOutput(debugPlayer))
		Box(0,0,10,10,RGB(255,0,255))
		StopDrawing()
	EndIf
EndProcedure
Procedure destroyDebugSprites()
	If IsSprite(debugLine)
		FreeSprite(debugLine)
		FreeSprite(debugMiniGround)
		FreeSprite(debugMinileft)
		FreeSprite(debugMiniright)
		FreeSprite(debugPlayer)
	EndIf
EndProcedure
Global instructionBackground=spriteIndexAdd()
CreateSprite(instructionBackground,850,20)
StartDrawing(SpriteOutput(instructionBackground))
Box(0,0,675,20,RGB(1,0,0))
StopDrawing()
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	destroyAllRawData(*rdal)
CompilerEndIf

Global definedFPS=#H2H_FRAMEPERSECOND
Declare checkScreenFocus(*player1.player=0,*player2.player=0)
Declare endGame(deadplayer.i=0,*what.game=0, gameType.i=#H2H_GAME_1V1,*b.background=0)
Declare selectmenu(x.i=0,y.i=0)
Enumeration 1
	#H2H_CLASS_GALLERY_MODE_PREVIEW
	#H2H_CLASS_GALLERY_MODE_SELECTION
	#H2H_CLASS_GALLERY_MODE_VERSUS
EndEnumeration

Macro selectOption(x,y)
	selectedMenu=optionMenu(x,y)
EndMacro
Procedure screenFocusSet(*game.game=0)
	If Not *game
		*game=*mainGame
	EndIf
	screenFocus=(*game\terrain\size-screenSizeX)/2
	ProcedureReturn screenFocus
EndProcedure

Procedure checkPlayerFacing(*player1.player=0,*player2.player=0)
	If Not *player1
		*player1=*leftPlayer
		*player2=*rightPlayer
	EndIf
	If *leftPlayer\life>0 And *rightPlayer\life>0
		If *leftPlayer\position\x>*rightPlayer\position\x
			Swap *leftPlayer,*rightPlayer
		EndIf
	EndIf
EndProcedure

Procedure.s textPad(what.s,max.i=16,padding.s=" ")
	l=Len(what)
	If l>max
		ProcedureReturn what
	EndIf
	If padding=" "
		ProcedureReturn Space((max-l)/2)+what+Space((max-l+1)/2)
	EndIf
	For i=0 To (max-l)/2
		what=padding+what+padding
	Next
	If (max-l)&1
		what+padding
	EndIf
	ProcedureReturn what
EndProcedure

Procedure.i displayMenuButtonText(x.i,y.i,text$,index.i,current.i,wip.i=0,scale.f=1,max.i=16)
	If current=index
		If wip
			ProcedureReturn AffTextColor("-=["+text$+"]=- Soon...",x+*font16\charSizeX*3,y,#Blue,128,scale)
		EndIf
		min=(#H2H_TEXT_MENU_INTENSITY_MAX-(menuTextIntensity-#H2H_TEXT_MENU_INTENSITY_MIN))/8
		If min>0
			ProcedureReturn AffTextBorder("-=["+text$+"]=-",x+*font16\charSizeX*3,y,#Orange,menuTextIntensity,scale,RGBA(255,128,0,min),255,*font16,*font16BorderBig)
		EndIf
		ProcedureReturn AffTextColor("-=["+text$+"]=-",x+*font16\charSizeX*3,y,#Orange,menuTextIntensity,scale)
	EndIf
	If wip
		ProcedureReturn AfftextColor("   "+text$+"   ",x+*font16\charSizeX*3,y,#Blue,128,scale)
	EndIf
	ProcedureReturn AfftextColor("   "+text$+"   ",x+*font16\charSizeX*3,y,0,128,scale)
EndProcedure

Procedure checkScreenFocus(*player1.player=0,*player2.player=0)
	If Not *player1
		*player1=*leftPlayer
		*player2=*rightPlayer
	EndIf
	screenFocusMiddle=0
	If *leftPlayer\life>0
		If *leftPlayer\position\x+#HITBOX_BACKSHIFT_X<screenFocus ;left is too left
			If (*rightPlayer\position\x+#HITBOX_SHIFT_X)-(*leftPlayer\position\x+#HITBOX_BACKSHIFT_X)<screenLineSpan ;not completly too far
				screenFocus=*leftPlayer\position\x+#HITBOX_BACKSHIFT_X
			Else
				*leftPlayer\position\x=screenFocus-#HITBOX_BACKSHIFT_X
			EndIf
		EndIf
		If *leftPlayer\position\y<#H2H_SCREEN_FOCUS_HEIGHT_THRESHOLD And Not *leftPlayer\isAI
			screenFocusMiddle=*leftPlayer\position\y-#H2H_SCREEN_FOCUS_HEIGHT_THRESHOLD
		EndIf
	EndIf
	If *rightPlayer\life>0
		If *rightPlayer\position\x+#HITBOX_SHIFT_X>screenFocus+screenLineSpan ;right is too right
			If (*rightPlayer\position\x+#HITBOX_SHIFT_X)-(*leftPlayer\position\x+#HITBOX_BACKSHIFT_X)<screenLineSpan ;not completly too far
				screenFocus=*rightPlayer\position\x-screenLineSpan+#HITBOX_SHIFT_X
			Else
				*rightPlayer\position\x=screenFocus+screenLineSpan-#HITBOX_SHIFT_X
			EndIf
		EndIf
		If *rightPlayer\position\y<#H2H_SCREEN_FOCUS_HEIGHT_THRESHOLD And Not *rightPlayer\isAI
			k=*rightPlayer\position\y-#H2H_SCREEN_FOCUS_HEIGHT_THRESHOLD
			If k>screenFocusMiddle
				screenFocusMiddle=k
			EndIf
		Else
			screenFocusMiddle=0
		EndIf
	EndIf
	If screenFocus<0
		screenFocus=0
	EndIf
	If screenFocus+screenLineSpan+#HITBOX_SIZE>*mainGame\terrain\size
		screenFocus=*mainGame\terrain\size-screenLineSpan-#HITBOX_SIZE
	EndIf
	If screenFocusMiddle>0
		screenFocusMiddle=0
	EndIf
	screenFocusHeight=(screenFocusHeight+screenFocusMiddle)/2
	CompilerIf #H2H_SOUND_DYNAMIC_ENABLE
	dynamicSoundLoopAll(screenFocus,screenFocusHeight)
	CompilerEndIf
EndProcedure

Global Dim averageDelta.d(99)
For i=0 To 99
	averageDelta(i)=currentMillisecond/defaultMillisecond
Next
Global aD=0
Global currentFPS.d=globalFPS 
Global startTime.d=ElapsedMillisecondsPrecise()
;------ fight phase
Enumeration 1
	#H2H_FIGHT_PHASE_START
	#H2H_FIGHT_PHASE_BATTLE
	#H2H_FIGHT_PHASE_END
EndEnumeration
Global fightPhase=0
Global fightStamp.d=0 ; in milliseconds
Global totalTime.d=0  ; cumulated time starting at 0

Procedure resetGame(*game.game=0)
	If Not *game
		*game=*mainGame
	EndIf
	If player1OnTheLeft
		playerReset(*player2,*game\terrain\size/2+screenSizeX/3-#HITBOX_SIZE-#HITBOX_SHIFT_X)
		playerReset(*player1,*game\terrain\size/2-screenSizeX/3-#HITBOX_BACKSHIFT_X)
	Else
		playerReset(*player1,*game\terrain\size/2+screenSizeX/3-#HITBOX_SIZE-#HITBOX_SHIFT_X)
		playerReset(*player2,*game\terrain\size/2-screenSizeX/3-#HITBOX_BACKSHIFT_X)
	EndIf
	screenFocus=(*game\terrain\size-screenSizeX)/2
	screenFocusSet(*game)
	*player1\direction=player1OnTheLeft
	*player1\lockedDirection=player1OnTheLeft
	*player2\direction=Bool(Not player1OnTheLeft)
	*player2\lockedDirection=Bool(Not player1OnTheLeft)
	checkScreenFocus()
	checkPlayerFacing()
	gadgetDestroyAll()
	totalTime=0
EndProcedure

Procedure startGame(*b.background=0)
	If Not *b
		*b=*allBackground(0)
	EndIf
	
	*player1\controlEnabled=#False
	*player2\controlEnabled=#False
	resetGame()
	backgroundLoad(*b)

	CompilerIf #H2H_DEBUG=1
		createDebugSprites(*b)
	CompilerEndIf
	If Not demoFight And currentRound=1 And buffedFrames=#H2H_FRAME_BUFFER_OFF
		loadingStart()
		classLoad(*player2\class,#False,#False,#False,classLoad(*player1\class,#False,#False))
		loadingStop()
	Else
		classSetLoaded(*player1\class,1)
		classSetLoaded(*player2\class,1)
	EndIf
	If windEnabled
		classLoadWind(*player1\class)
		classLoadWind(*player2\class)
	EndIf
	*player1\direction=player1OnTheLeft
	*player1\lockedDirection=player1OnTheLeft
	*player2\direction=Bool(Not player1OnTheLeft)
	*player2\lockedDirection=Bool(Not player1OnTheLeft)
	playerResetLife(*player1)
	playerResetLife(*player2)
	*player1\recovery=0
	*player2\recovery=0
	playerGuardSet(*player1)
	playerGuardSet(*player2)
; 	Debug "spawn"
	Debug playerGetSpawn(*player1)
	Debug playerGetSpawn(*player2)
	If playerGetSpawn(*player1)
; 			Debug "spawn !"
		playerResetAnimationTo(*player1,playerGetSpawn(*player1))
		playerPlayFrameSound(*player1)
	Else
		playerResetAnimationTo(*player1,playerGetIdle(*player1))
	EndIf
	If playerGetSpawn(*player2)
		playerResetAnimationTo(*player2,playerGetSpawn(*player2))
		playerPlayFrameSound(*player2)
	Else
		playerResetAnimationTo(*player2,playerGetIdle(*player2))
	EndIf
	checkPlayerFacing()
	fightPhase=#H2H_FIGHT_PHASE_START
	
	screenFocusSet(*game)
	fightStamp=0
	totalTime=0
	
	set(*screenShake)
	ProcedureReturn
EndProcedure

CompilerIf #H2H_MOUSE_ENABLED
Global mouseTest=spriteIndexAdd()
CreateSprite(mouseTest,3,3,#PB_Sprite_PixelCollision)
StartDrawing(SpriteOutput(mouseTest))
DrawingMode(#PB_2DDrawing_AlphaBlend)
Box(0,0,3,3,#Red)
StopDrawing()
TransparentSpriteColor(mouseTest,#White)
CompilerEndIf

Procedure isColorClose(c1.i,c2.i)
	If c1 And c2 And (c1=c2 Or Abs(Red(c1)-Red(c2))+Abs(Green(c1)-Green(c2))+Abs(Blue(c1)-Blue(c2))<=64)
		ProcedureReturn #True
	EndIf
	If c1=#H2H_STANCE_COLOR_BLUE And c2=#H2H_STANCE_COLOR_LIGHTBLUE
		ProcedureReturn #True
	EndIf
	If c1=#H2H_STANCE_COLOR_VERMILLON And (c2=#H2H_STANCE_COLOR_ORANGE Or c2=#H2H_STANCE_COLOR_VERMILLON Or c2=#H2H_STANCE_COLOR_RED)
		ProcedureReturn #True
	EndIf
	If c1=#H2H_STANCE_COLOR_BLUE And c2=#H2H_STANCE_COLOR_LIGHTBLUE
		ProcedureReturn #True
	EndIf
	If c1=#H2H_STANCE_COLOR_VERMILLON And (c2=#H2H_STANCE_COLOR_ORANGE Or c2=#H2H_STANCE_COLOR_VERMILLON Or c2=#H2H_STANCE_COLOR_RED)
		ProcedureReturn #True
	EndIf
	If (c1=#H2H_STANCE_COLOR_GRAY Or c1=#H2H_STANCE_COLOR_METAL Or c1=#H2H_STANCE_COLOR_LIGHTGRAY Or c1=#H2H_STANCE_COLOR_LIGHTMETAL Or c1=#H2H_STANCE_COLOR_WHITE) And  (c2=#H2H_STANCE_COLOR_GRAY Or c2=#H2H_STANCE_COLOR_METAL Or c2=#H2H_STANCE_COLOR_LIGHTGRAY Or c2=#H2H_STANCE_COLOR_LIGHTMETAL Or c2=#H2H_STANCE_COLOR_WHITE)
		ProcedureReturn #True
	EndIf
	ProcedureReturn #False
EndProcedure

Procedure playerPrepareColor(*p1.player,*p2.player)
; 	If player1OnTheLeft
; 		Swap *p1, *p2
; 	EndIf
; 	Debug "prepare color"
	*p1\usesAlternate=#False
	*p2\usesAlternate=#False
	*p2\usesAlternate=Bool((*p2\currentStance\specialcolor<>0 And playerColorMode=#H2H_PLAYER_COLOR_MODE_ALTERNATIVE) Or (playerColorMode=#H2H_PLAYER_COLOR_MODE_ADAPTATIVE And isColorClose(playerGetColor(*p1),playerGetColor(*p2))))
EndProcedure

Procedure playerPrepare(*p1.player,*p2.player,playerSelection.i)
	p1=Mod(playerSelection,10000)
	p2=playerSelection/10000
	p1Class=Int(Mod(p1,100))
	p1Stance=p1/100
	p2Class=Int(Mod(p2,100))
	p2Stance=p2/100
	p1Random=Bool(p1Class=99)
	p2Random=Bool(p2Class=99)
	p1Mirror=Bool(p1Class=98)
	p2Mirror=Bool(p2Class=98)
	
	; Case 0 : both player picked mirror
	If p1Mirror And p2Mirror
		If Random(1) ; p1 stance priority
			playerSetClassRandom(*p1)
			Select p1Stance
				Case 0
					playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_ALL)
				Case 99
					playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
				Case 98
					playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
			EndSelect
		Else
			; p2 stance priority
			playerSetClassRandom(*p2)
			Select p2Stance
				Case 0
					playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_ALL)
				Case 99
					playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
				Case 98
					playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
			EndSelect
		EndIf
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf

	; Case 1 : player 1 and 2 have defined classes
	If Not p1Random And Not p2Random And Not p1Mirror And Not p2Mirror
		playerSetClass(*p1,*allClasses(p1Class),0)
		playerSetClass(*p2,*allClasses(p2Class),0)
		; Case 1 a : stance defined
		If p1Stance<98
			playerSetStance(*p1,p1Stance)
		EndIf
		If p2Stance<98
			playerSetStance(*p2,p2Stance)
		EndIf
		If p1Stance=99
			playerSetStanceRandom(*p1)
		EndIf
		If p2Stance=99
			playerSetStanceRandom(*p2)
		EndIf
		; Case 1 b : same class
		If p1Class=p2Class
			If p1Stance=98 And p2Stance=98
				; both mirror, so random the same
				playerSetStanceRandom(*p1)
				playerSetStance(*p2,*p1\classStanceId)
			Else
				If p1Stance=98
					playerSetStance(*p1,*p2\classStanceId)
				EndIf
				If p2Stance=98
					playerSetStance(*p2,*p1\classStanceId)
				EndIf
			EndIf
		Else
			; If class is different, mirror stance means random stance
			If p1Stance=98
				playerSetStanceRandom(*p1)
			EndIf
			If p2Stance=98
				playerSetStanceRandom(*p2)
			EndIf
		EndIf
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf
	
	; Case 2 : player 1 and 2 picked random
	If p1Random And p2Random
		playerSetClassRandom(*p1)
		playerSetClassRandom(*p2,*p1,Bool(p1Stance=0 Or p2Stance=0),Bool(p1Stance=99 Or p2Stance=99))
		;Case -2 Any
		;Case -1 Different stance
		;Case 0 Different class
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf
	
	; Case 3 : player 1 is normal and player 2 is mirror
	If Not p1Mirror And p2Mirror
; 		Debug "player 2 mirror"
		If p1Random
			playerSetClassRandom(*p1)
		Else
			If p1Stance<>98
				playerSetClass(*p1,*allClasses(p1Class),p1Stance)
			Else
				playerSetClass(*p1,*allClasses(p1Class),0)
			EndIf
		EndIf
		Select p2Stance
			Case 0
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_ALL)
			Case 99
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
			Case 98
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
		EndSelect
		; if the player 1 has taken the mirror stance
		If Not p1Random And p1Stance=98
			If p1Class=p2Class
				*p1\classStanceId=*p2\classStanceId
			Else
				playerSetStanceRandom(*p2)
			EndIf
		EndIf
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf

	; Case 4 : player 2 is normal and player 1 is mirror
	If Not p2Mirror And p1Mirror
; 		Debug "player 1 mirror"
		If p2Random
			playerSetClassRandom(*p2)
		Else
			If p2Stance<>98
				playerSetClass(*p2,*allClasses(p2Class),p2Stance)
			Else
				playerSetClass(*p2,*allClasses(p2Class),0)
			EndIf
		EndIf
		Select p1Stance
			Case 0
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_ALL)
			Case 99
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
			Case 98
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
		EndSelect
		; if the player 2 has taken the mirror stance
		If Not p2Random And p2Stance=98
			If p1Class=p2Class
				*p1\classStanceId=*p2\classStanceId
			Else
				playerSetStanceRandom(*p1)
			EndIf
		EndIf
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf
	
	; Case 5 : one player is random and the other not
	If p1Random XOr p2Random
		Debug "one is random"
		If p1Random
			playerSetClass(*p2,*allClasses(p2Class),0)
			If p2Stance=99
				playerSetStanceRandom(*p2)
			EndIf
			If p2Stance<98
				playerSetStance(*p2,p2Stance)
			EndIf
			playerSetClassRandom(*p1,*p2,Bool(p1Stance=0),Bool(p1Stance=99))
		Else
			playerSetClass(*p1,*allClasses(p1Class),0)
			If p1Stance=99
				playerSetStanceRandom(*p1)
			EndIf
			If p1Stance<98
				playerSetStance(*p1,p1Stance)
			EndIf
			playerSetClassRandom(*p2,*p1,Bool(p2Stance=0),Bool(p2Stance=99))
		EndIf
		If *p1\class=*p2\class
			If Not p1Random And p1Stance=98
				playerSetStance(*p1,*p2\classStanceId)
			EndIf
			If Not p2Random And p2Stance=98
				playerSetStance(*p2,*p1\classStanceId)
			EndIf
		EndIf
	EndIf
	playerPrepareColor(*p1,*p2)
EndProcedure

#H2H_TIMER_ENABLED=#True
#H2H_LOOP_DELTA=1
Global loopDeltaEnabled=#H2H_LOOP_DELTA

; returns true if finished and back to menu
Procedure fightLoop(*game.game)
	Static leftover.d=0
	Static zoom.d=20
	Static transparency=255
	Static i=2
	Static previousCounter=2
	Static endTime.d=0
	tmp=ElapsedMillisecondsPrecise()
	Protected finished=#False
	
	CompilerIf #H2H_MOUSE_ENABLED
		ExamineMouse()
	CompilerEndIf

	If Not gamePaused
		checkFacing(*player1,*player2)
	EndIf
	
	Static pressedPause=0
	If Not demoFight
		If gamePaused
			If menuCancel() Or menuAccept() Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
				unpauseGame()
			EndIf
		Else
			If menuCancel() Or playerHasCommand(*player1,#H2H_CONTROL_EXIT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True)
				pauseGame()
			EndIf
		EndIf
	EndIf
	
	;--- fight phase start
	If fightPhase=#H2H_FIGHT_PHASE_START
		If fightStamp=0
			If musicLevel>0 And Not demoFight
				musicStop()
				If *game\terrain\introMusic
					musicExPlay(*game\terrain\introMusic)
				EndIf
			EndIf
			fightStamp=ElapsedMillisecondsPrecise()
		EndIf
		If demoFight Or totalTime>=3000
			fightPhase=#H2H_FIGHT_PHASE_BATTLE
			totalTime=0
			endTime=0
			If musicLevel>0 And Not demoFight
				If *game\terrain\music
					musicExPlay(*game\terrain\music)
				EndIf
			EndIf
			*player1\controlEnabled=#True
			*player2\controlEnabled=#True
			If *player1\isAI
				*bot1\mode=#H2H_AI_MODE_IDLE
			EndIf
			If *player2\isAI
				*bot2\mode=#H2H_AI_MODE_IDLE
			EndIf
		Else
			; Because controllers still uses pushed variable until updated
			i.i=2-Int(totalTime/1000)
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
		EndIf
	EndIf
	
	at1=0
	
	delta.d=deltaGlobal
	If slomo
		delta*TIME_SLOMO
	EndIf
	If Not gamePaused
		screenShakeLoop(delta)
	Else
		delta=0
	EndIf
	
	remainder.d=delta/(deltaDelay+1)
	If Not gamePaused
		Repeat
			td.d=0.25
			If td>remainder
				td=remainder
			EndIf
			damageGadgetRefreshAll(td)
			;---actions player 1
			If isPlayerAlive(*player1)
				If *player1\isAI And *bot1\mode<>#H2H_AI_MODE_DISABLED
					playerClearKey(*player1)
					AIDecision(*bot1,*player2,td,*game\terrain\leftLimit,*game\terrain\rightLimit)
				EndIf
			EndIf
			playerRefresh(*player1,*game\terrain,td)
			;---actions player 2
			If isPlayerAlive(*player2)
				If *player2\isAI And *bot2\mode<>#H2H_AI_MODE_DISABLED
					playerClearKey(*player2)
					AIDecision(*bot2,*player1,td,*game\terrain\leftLimit,*game\terrain\rightLimit)
				EndIf
			EndIf
				playerRefresh(*player2,*game\terrain,td)
				playerPush(*player1,*player2,*game\terrain,td)
				playerCheckGrab(*player1,*player2)
				playerCheckGrab(*player2,*player1)
				If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
					playerAttack(*player1,*player2,td)
					playerAttack(*player2,*player1,td)
				EndIf
				If *player1\caught And *player2\caught
					*player1\caught=0
					*player2\caught=0
				EndIf
			ForEach *game\allGroups()
				damageGadgetApplyAllGroup(*game\allGroups(),td)
			Next
			remainder-0.25
		Until remainder<=0
	EndIf
	playerApplyDamageAll()
	If isPlayerAlive(*player1) And isPlayerAlive(*player2)
		checkPlayerFacing()
	EndIf
 	dead=0
	checkScreenFocus()
	;---display
	backgroundRefresh(*game\terrain,screenFocus,screenSizeX)
	backgroundDisplay(*game\terrain,screenFocus,screenSizeX,screenSizeY)
	set(*player1\screenPosition,*player1\position\x-screenFocus,*player1\position\y)
	If Not isPlayerAlive(*player1)
		dead|1
	EndIf
	set(*player2\screenPosition,*player2\position\x-screenFocus,*player2\position\y)
	If Not isPlayerAlive(*player2)
		dead|2
	EndIf
	
	If roundLength>0 And totalTime/1000>roundLength And Not demoFight
		If *player1\life<*player2\life
			dead|1
		EndIf
		If *player1\life>*player2\life
			dead|2
		EndIf
		fightPhase=#H2H_FIGHT_PHASE_END
	EndIf
	
	If dead>0 And endTime=0
		If Not (dead&1 And dead&2 And currentRound>=maxRound And *player1\victories<>maxRound/2 And *player2\victories<>maxRound/2)
			If dead&1
				*player2\victories+1
			EndIf
			If dead&2
				*player1\victories+1
			EndIf
		EndIf
		If Not isPlayerAlive(*player1) Or Not isPlayerAlive(*player2)
			deltaDelay+25
		EndIf
		If Not isPlayerAlive(*player1)
			*player1\feedback+25
		EndIf
		If Not isPlayerAlive(*player2)
			*player2\feedback+25
		EndIf
		endTime=totalTime
		fightPhase=#H2H_FIGHT_PHASE_END
		If musicLevel>0 And Not demoFight
			musicStop()
			If *game\type=#H2H_GAME_1VBOT
				If dead=1
					musicExPlay(*game\terrain\defeatMusic)
				Else
					musicExPlay(*game\terrain\victoryMusic)
				EndIf
			Else
				musicExPlay(*game\terrain\victoryMusic)
			EndIf
		EndIf
	EndIf
	
	refreshAllParticles(delta)
	playerDisplayShadow(*player1)
	playerDisplayShadow(*player2)
	displayAllParticles(#H2H_PARTICLE_LAYER_BACK)
	If deltaDelay<=0
		refreshAllGadget(delta)
	EndIf
	gadgetDisplayAll(#H2H_GADGET_LAYER_BACK)
	If *player1\attacking And Not *player2\attacking
		playerDisplay(*player2,0,delta)
		playerDisplay(*player1,0,delta)
	Else
		playerDisplay(*player1,0,delta)
		playerDisplay(*player2,0,delta)
	EndIf

	damageGadgetDisplayAll(Bool(debugOption And *player1\displayDebug>0))
	displayAllParticles(#H2H_PARTICLE_LAYER_FRONT)
	gadgetDisplayAll(#H2H_GADGET_LAYER_FRONT)
	HUDRefresh(*player1\hud,deltaGlobal)
	HUDRefresh(*player2\hud,deltaGlobal)
	If HUDEnabled
		playerHUDDisplay(*player1,player1OnTheLeft)
		playerHUDDisplay(*player2,Bool(Not player1OnTheLeft))
	EndIf
	If debugOption
		If *player1\displayDebug>0
			playerdDisplayDebug(*player1)
		EndIf
		If *player2\displayDebug>0
			playerdDisplayDebug(*player2)
		EndIf
	EndIf
	
	If comboDisplayMode<>#H2H_COMBO_DISPLAY_NONE And Not demoFight
		If isPlayerAlive(*player1)
			playerComboDisplay(*player1,deltaGlobal)
		EndIf
		If isPlayerAlive(*player2)
			playerComboDisplay(*player2,deltaGlobal)
		EndIf
	EndIf
; 	mX=WindowMouseX(0)
; 	mY=WindowMouseY(0)
; 	DisplaySprite(mouseTest,mx,my)
; 	If *player1\lockedDirection
; 		If SpritePixelCollision(mouseTest,mX,mY,*player1\hitbox,*player1\screenPosition\x+#HITBOX_BACKSHIFT_X,*player1\screenPosition\y+#HITBOX_BACKSHIFT_Y)
; 			afftext("connected to 1",600,600)
; 		EndIf
; 	Else
; 		If SpritePixelCollision(mouseTest,mX,mY,*player1\hitbox,*player1\screenPosition\x+#HITBOX_SHIFT_X,*player1\screenPosition\y+#HITBOX_SHIFT_Y)
; 			afftext("connected to 1",600,600)
; 		EndIf
; 	EndIf
	If debugOption
		If debugEnabled>0
			difference=*rightPlayer\position\x-*leftPlayer\position\x
			leftX=*leftPlayer\position\x
			rightX=*rightPlayer\position\x
			afftext("difference : "+difference,400,400)
			afftext("leftX : "+leftX,400,420)
			afftext("RightX: "+rightX,400,440)
			afftext("Focus: "+screenFocus,400,480)
			DisplaySprite(debugMiniGround,400-#HITBOX_BACKSHIFT_X/10,500)
			DisplaySprite(debugMinileft,400+(screenFocus-#HITBOX_BACKSHIFT_X)/10,500)
			DisplaySprite(debugMiniright,400+(screenFocus+screenLineSpan-#HITBOX_SHIFT_X)/10,500)
			DisplaySprite(debugPlayer,400+*player1\position\x/10,500)
			DisplaySprite(debugPlayer,400+*player2\position\x/10,500)
		EndIf
	EndIf
	
	If fightPhase=#H2H_FIGHT_PHASE_END
		If Not demoFight
			y=0
			s.s=""
			c=playerGetColor(*player1)
			textColor=c
			If Red(c)+Green(c)+Blue(c)<64
				textColor=RGB(Red(c)+192,Green(c)+192,Blue(c)+192)
			EndIf
			borderColor=colorLerp(c,#Black)
			borderColor=colorLerp(borderColor,#Black)
			borderColor=RGBA(Red(borderColor),Green(borderColor),Blue(borderColor),192)
			c2=playerGetColor(*player2)
			textColor2=c2
			If Red(c2)+Green(c2)+Blue(c2)<64
				textColor2=RGB(Red(c2)+192,Green(c2)+192,Blue(c2)+192)
			EndIf
			borderColor2=colorLerp(c2,#Black)
			borderColor2=colorLerp(borderColor2,#Black)
			borderColor2=RGBA(Red(borderColor2),Green(borderColor2),Blue(borderColor2),192)
			If *game\type=#H2H_GAME_1V1
				Select dead
					Case 2
						s=lsGet("WINNER",currentLanguage,*player1\name)
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,textColor,playerGetColorIntensity(*player1)/2,1,borderColor,255,*font32,*font32Border)
					Case 1
						s=lsGet("WINNER",currentLanguage,*player2\name)
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,textColor2,playerGetColorIntensity(*player2)/2,1,borderColor2,255,*font32,*font32Border)
					Case 3
						s=lsGet("TIE")
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,0,128,4,*font32,*font32Border)
				EndSelect
			EndIf
			If *game\type=#H2H_GAME_1VBOT
				Select dead
					Case 2
						s=lsGet("VICTORY")
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,textColor,playerGetColorIntensity(*player1)/2,1,borderColor,255,*font32,*font32Border)
					Case 1
						s=lsGet("DEFEAT")
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,textColor2,playerGetColorIntensity(*player2)/2,1,borderColor2,255,*font32,*font32Border)
					Case 3
						s=lsGet("TIE")
						y=AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,(screenSizeY-#CHAR_SIZE_Y*2)/2,0,128,2,#White,255,*font32,*font32Border)
				EndSelect
			EndIf
			If *player1\victories>=(maxRound+1)/2 Or *player2\victories>=(maxRound+1)/2 Or currentRound>=maxRound
				s=lsGet("BACK_TO_MENU_IN",currentLanguage,lsGet("SECONDS",currentLanguage,Str(max(5-((totalTime-endtime)/1000)))))
				Select dead
					Case 2
						AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*1.5)/2,y,textColor,playerGetColorIntensity(*player1),1.5,borderColor,255)
					Case 1
						AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*1.5)/2,y,textColor2,playerGetColorIntensity(*player2),1.5,borderColor2,255)
					Case 3
						AfftextBorder(s,(screenSizeX-AfftextGetLength(s)*2)/2,y,0,128,1.5,#White,255)
				EndSelect
			EndIf
		EndIf
		If demoFight
			If totalTime>=endTime+3000
				finished=#True
				;totalTime=endTime;+3000
			EndIf
		Else
			If totalTime>=endTime+5000
				finished=#True
				;totalTime=endTime;+5000
			EndIf
		EndIf
	EndIf
	;gameType=#H2H_GAME_1V1
	If *game\type=#H2H_GAME_1VBOT
		feedbackScreenDisplay(*player1\feedback*10)
	EndIf
	If showFPS And Not gamePaused
		average.d=0
		For j=0 To 99
			average+averageDelta(j)
		Next
		average/100.0
		If average>0
		  currentFPS=#H2H_FRAMEPERSECOND/average
		EndIf
		afftext(lsGet("FPS")+" : "+Str(currentFPS),0,240)
	EndIf
	zemax=(maxRound+1)/2-1
	roundX.d=32.0
	roundY.d=16
	timerScale.d=1
	roundCenterShift=144
	If screenSizeX<1300
		timerScale=0.5
		roundX=16
		roundY=64
		roundCenterShift=0
	EndIf
	CompilerIf #H2H_TIMER_ENABLED
		If Not demoFight And HUDEnabled
			Select fightPhase
				Case #H2H_FIGHT_PHASE_START
					displayTimer(roundLength,timerScale)
				Case #H2H_FIGHT_PHASE_END
					If roundLength>0
						displayTimer(roundLength-endTime/1000,timerScale)
					Else
						displayTimer(endTime/1000,timerScale)
					EndIf
				Default
					If roundLength>0
						If roundLength-totalTime/1000<#H2H_ROUND_LENGTH_LOW
							displayTimer(roundLength-totalTime/1000,timerScale,#Red)
						Else
							displayTimer(roundLength-totalTime/1000,timerScale)
						EndIf
					Else
						displayTimer(totalTime/1000,timerScale)
					EndIf
			EndSelect
		EndIf
	CompilerEndIf
	If demoFight
		Static toggle.d=0
		#H2H_FIGHT_DEMO_TOGGLE_SPEED=50
		toggle+deltaGlobal
		If toggle>=#H2H_FIGHT_DEMO_TOGGLE_SPEED
			toggle-2*#H2H_FIGHT_DEMO_TOGGLE_SPEED
		EndIf
		If toggle>0
			s.s=lsGet("DEMO_ANY_KEY")
			scale.d=4
			l.d=AfftextGetLength(s)*scale
			If l>screenSizeX
				scale*(screenSizeX/l)
				l=screenSizeX
			EndIf
			AffTextBorder(s,(screenSizeX-l)/2,(screenSizeY-#CHAR_SIZE_Y*scale)/2,#Orange,192,scale/2,#White,128,*font32,*font32Border)
		EndIf
	Else
		If HUDEnabled
			If player1OnTheLeft
				For j=0 To *player2\victories-1
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2+(zemax-j)*roundX+roundCenterShift,roundY,#Orange,192,255,#True,timerScale)
				Next
				For j=*player2\victories To zemax
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2+(zemax-j)*roundX+roundCenterShift,roundY,#Black,128,192,#True,timerScale)
				Next
				For j=0 To *player1\victories-1
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2-(zemax-j+2)*roundX-roundCenterShift,roundY,#Orange,192,255,#False,timerScale)
				Next
				For j=*player1\victories To zemax
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2-(zemax-j+2)*roundX-roundCenterShift,roundY,#Black,128,192,#False,timerScale)
				Next
				If fightPhase=#H2H_FIGHT_PHASE_START
					AfftextBorder("Round "+currentRound,(screenSizeX-AfftextGetLength("Round "+currentRound)*4)/2,(screenSizeY/2)+#CHAR_SIZE_Y*4,#White,128,2,#Orange,192,*font32,*font32Border)
					AfftextBorder(Str(*player1\victories)+"-"+*player2\victories,(screenSizeX-AfftextGetLength(Str(*player1\victories)+"-"+*player2\victories)*3)/2,(screenSizeY/2)+#CHAR_SIZE_Y*8,#White,192,1.5,#ORANGE,255,*font32,*font32Border)
					counterDisplay(i,screenSizeX/2,screenSizeY/2-100,255-transparency,zoom)
				EndIf
			Else
				For j=0 To *player1\victories-1
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2+(zemax-j)*roundX+roundCenterShift,roundY,#Orange,192,255,#True,timerScale)
				Next
				For j=*player1\victories To zemax
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2+(zemax-j)*roundX+roundCenterShift,roundY,#Black,128,192,#True,timerScale)
				Next
				For j=0 To *player2\victories-1
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2-(zemax-j+2)*roundX-roundCenterShift,roundY,#Orange,192,255,#False,timerScale)
				Next
				For j=*player2\victories To zemax
					UIDisplay(#H2H_ICON_CRESCENT,screenSizeX/2-(zemax-j+2)*roundX-roundCenterShift,roundY,#Black,128,192,#False,timerScale)
				Next
				If fightPhase=#H2H_FIGHT_PHASE_START
					AfftextBorder("Round "+currentRound,(screenSizeX-AfftextGetLength("Round "+currentRound)*4)/2,(screenSizeY/2)+#CHAR_SIZE_Y*4,#White,128,2,#Orange,192,*font32,*font32Border)
					AfftextBorder(Str(*player2\victories)+"-"+*player1\victories,(screenSizeX-AfftextGetLength(Str(*player2\victories)+"-"+*player1\victories)*3)/2,(screenSizeY/2)+#CHAR_SIZE_Y*8,#White,192,1.5,#ORANGE,255,*font32,*font32Border)
					counterDisplay(i,screenSizeX/2,screenSizeY/2-100,255-transparency,zoom)
				EndIf
			EndIf
		EndIf
		displayPause(*player1,deltaGlobal)
 	EndIf
	If *game\terrain\white
		AfftextColor("Hand2Hand project "+#H2H_VERSION,0,screenSizeY-#CHAR_SIZE_Y*2,#Orange)
	Else
		AfftextColor("Hand2Hand project "+#H2H_VERSION,0,screenSizeY-#CHAR_SIZE_Y*2)
	EndIf
	Static stamp=0
	If Not gamePaused And Not demoFight
;   		stamp=ElapsedMillisecondsPrecise()-stamp
  		If slomo
  			averageDelta(aD)=delta
;   			averageDelta(aD)=stamp/currentMillisecond
  		Else
  			averageDelta(aD)=deltaGlobal
;   			averageDelta(aD)=stamp/currentMillisecond;deltaGlobal
  		EndIf
;   		stamp=ElapsedMillisecondsPrecise()
  		aD+1
  		If aD>99
  			aD=0
  		EndIf
  	EndIf
	frameLoadLoop(1)
	
	If Not gamePaused And deltaDelay<=0
  		If slomo
  			totalTime+(ElapsedMillisecondsPrecise()-fightStamp)*TIME_SLOMO*TIME_SCALE
  		Else
  			totalTime+(ElapsedMillisecondsPrecise()-fightStamp)*TIME_SCALE
  		EndIf
  	EndIf
  	deltaDelay-delta
  	If deltaDelay<0
  		deltaDelay=0
  	EndIf
  	fightStamp=ElapsedMillisecondsPrecise()
	ProcedureReturn finished
EndProcedure

; 	AfftextColor(keyToString$(*player1\keyboardControl\special)+" or "+keyToString$(*menuControlKeys\special)+" to quit\Arrows to move\"+keyToString$(*player1\keyboardControl\attack)+" or "+keyToString$(*menuControlKeys\attack)+" to Select",x,y,#Gray,128,0.75)
Macro displayMenuInstruction(x,y)
	AfftextColor(lsGet("MENU_INSTRUCTIONS",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_SPECIAL)),keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_EXIT)),keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ATTACK)),keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_ACCEPT))),x,y,#Gray,128,0.75)
EndMacro

; returns the index of the pressed button from 0 to 6
; returns -1 if none is selected
Global Dim menuTextScale.d(6)
For i=0 To 6
	menuTextScale(i)=1.5
Next

;- confirm
Global confirming=#False
Global confirmWhat=#False
Global confirmWhatLock=#False
Global confirmIntensity.d=0
Global confirmDisplayed=#False
Procedure.i confirm()
	If confirmDisplayed
		ProcedureReturn #False
	EndIf
; 	Debug "confirmation pending"
	confirmDisplayed=#True
	If confirming
		confirmWhatLock=confirmWhat
		confirmIntensity+deltaGlobal*20 ; TODO constants
		If confirmIntensity>255
			confirmIntensity=255
		EndIf
	Else
		confirmIntensity-deltaGlobal*20 ; TODO constants
		If confirmIntensity<0
			confirmIntensity=0
		EndIf
	EndIf
	If confirmIntensity>0
		DisplayTransparentSprite(backscreen,0,0,confirmIntensity/2,#Black)
		If confirming
			If confirmWhat
				If playerHasCommand(*player1,#H2H_CONTROL_RIGHT) Or menuRight()
					confirmWhat=#False
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			Else
				If playerHasCommand(*player1,#H2H_CONTROL_LEFT) Or menuLeft()
					confirmWhat=#True
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			EndIf
		EndIf
		If confirmWhatLock
			AfftextColor(lsGet("NO"),screenSizeX/2+*font16\charSizeX,screenSizeY/2-#CHAR_SIZE_Y*0.75,RGBA(128,128,128,confirmIntensity),128,1.5)
			AffTextBorder(lsGet("YES"),screenSizeX/2-*font16\charSizeX-AfftextGetLength(lsGet("YES"))*3,screenSizeY/2-#CHAR_SIZE_Y*1.5,RGBA(255,128,0,confirmIntensity),128,1.5,RGBA(255,255,255,confirmIntensity),192,*font32,*font32Border)
		Else
			AfftextColor(lsGet("YES"),screenSizeX/2-*font16\charSizeX-AfftextGetLength(lsGet("YES"))*1.5,screenSizeY/2-#CHAR_SIZE_Y*0.75,RGBA(128,128,128,confirmIntensity),128,1.5)
			AffTextBorder(lsGet("NO"),screenSizeX/2+*font16\charSizeX,screenSizeY/2-#CHAR_SIZE_Y*1.5,RGBA(255,128,0,confirmIntensity),128,1.5,RGBA(255,255,255,confirmIntensity),192,*font32,*font32Border)
		EndIf
	EndIf
	If confirming
		If playerHasCommand(*player1,#H2H_CONTROL_SPECIAL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or menuCancel()
			confirmWhat=#False
			ProcedureReturn #True
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_SPECIAL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or menuAccept()
			ProcedureReturn #True
		EndIf
	EndIf
	ProcedureReturn #False
EndProcedure

Global Dim menuTextItem.s(10)
menuTextItem(0)="MENU_VERSUS"
menuTextItem(1)="MENU_SOLO"
menuTextItem(2)="MENU_GALERY"
menuTextItem(3)="MENU_SETTINGS"
menuTextItem(4)="MENU_TUTORIAL"
menuTextItem(5)="MENU_CREDITS"
menuTextItem(6)="MENU_EXIT"
menuTextItem(7)="MENU_DISCORD"
menuTextItem(8)="MENU_STEAM"
menuTextItem(9)="MENU_ITCHIO"
menuTextItem(10)="MENU_WIKI"
 Procedure.i menuLoop(x.i=0,y.i=0,startingIndex.i=-1)
 	Static index=0
 	If startingIndex<>-1
 		index=startingIndex
 	EndIf
 	displayMenuInstruction(x+50,screenSizeY-100)
	h=50
	h=AffTextBorder("HAND2HAND PROJECT",100+x,h,0,128,2,#Orange,255,*font32,*font32Border)
	h=AfftextColor(#H2H_VERSION,600+x,h,#H2H_STANCE_COLOR_GRAY)+50
	hTop=h
	For i=0 To 6
		If index=i
			menuTextScale(i)=lerp(menuTextScale(i),2,deltaGlobal/10)
		Else
			menuTextScale(i)=lerp(menuTextScale(i),1.5,deltaGlobal/5)
		EndIf
		h=displayMenuButtonText(150/menuTextScale(i)*1.5+75*i+x,h,textPad(lsGet(menuTextItem(i))),i,index,0,menuTextScale(i))+5
	Next
	If index=7
		UIDisplay(#H2H_ICON_DISCORD,screenSizeX-320,screenSizeY-128,RGB(114,137,218),menuTextIntensity)
	Else
		UIDisplay(#H2H_ICON_DISCORD,screenSizeX-320,screenSizeY-128,RGB(114,137,218),192,128)
	EndIf
	If index=8
		UIDisplay(#H2H_ICON_STEAM,screenSizeX-256,screenSizeY-128,RGB(42,71,94),menuTextIntensity)
	Else
		UIDisplay(#H2H_ICON_STEAM,screenSizeX-256,screenSizeY-128,RGB(42,71,94),192,128)
	EndIf
	If index=9
		UIDisplay(#H2H_ICON_ITCHIO,screenSizeX-192,screenSizeY-128,$5c5cfa,menuTextIntensity)
	Else
		UIDisplay(#H2H_ICON_ITCHIO,screenSizeX-192,screenSizeY-128,$5c5cfa,192,128)
	EndIf
	If index=10
		AffTextBorder("W",screenSizeX-128+8,screenSizeY-128+8,#Orange,menuTextIntensity,1.5,#White,128,*font32,*font32Border)
	Else
		AffTextBorder("W",screenSizeX-128+8,screenSizeY-128+8,#Gray,128,1.5,#Gray,255,*font32,*font32Border)
	EndIf
	AfftextColor(lsGet(menuTextItem(index)+"_DESC"),x+100,hTop+5*55,RGB(32,32,128))
	previousIndex=index
	If menuUp() Or menuLeft() Or playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True)
		index-1
	EndIf
	If menuDown() Or menuRight() Or playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True)
		index+1
	EndIf
	If index<0
		index=0
	EndIf
	If index>10
		index=10
	EndIf
	If previousIndex<>index
		Select stereoWidth
			Case SOUND_STEREO_DEFAULT_WIDTH
				psound(#H2H_SOUND_ID_MENUCLIC,400+50*index)
			Case SOUND_STEREO_SMALL_WIDTH
				psound(#H2H_SOUND_ID_MENUCLIC,((screenSizeX/2)+400+50*index)/2)
			Case SOUND_STEREO_NONE_WIDTH
				psound(#H2H_SOUND_ID_MENUCLIC)
		EndSelect
	EndIf
	
	If Not blackScreenEnabled
		If menuaccept() Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
			ProcedureReturn index
		EndIf
	EndIf
	menuTextLoop(deltaGlobal)
	ProcedureReturn -1
EndProcedure

Declare difficultyMenu(x.i=0,y.i=0)
Declare creditMenu(x.i=0,y.i=0)
Declare tutorialMenu(x.i=0,y.i=0)
Declare terrainSelection(x.i=0,y.i=0)
Declare optionMenu(x.i=0,y.i=0)

; statLoad()

Procedure classGallery(*gadget.animationGadget=0,delta.d=1)
	Static currentSelection=0
	Static stanceSelection=0
	shineLoop(delta)
	previousSelection=currentSelection
	previousStance=stanceSelection
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight()
		stanceSelection=0
		Repeat
			currentSelection+1
			If currentSelection>ArraySize(*allClasses())
				currentSelection=0
			EndIf
		Until Not classIsNotSelectablePlayer(*allClasses(currentSelection))
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft()
		Repeat 
			currentSelection-1
			If currentSelection<0
				currentSelection=ArraySize(*allClasses())
			EndIf
		Until Not classIsNotSelectablePlayer(*allClasses(currentSelection))
		stanceSelection=0
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or menuUp()
		stanceSelection-1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or menuDown()
		stanceSelection+1
	EndIf
	If stanceSelection<0
		stanceSelection=0
	EndIf
	If stanceSelection>ArraySize(*allClasses(currentSelection)\allStances())
		stanceSelection=ArraySize(*allClasses(currentSelection)\allStances())
	EndIf
	If previousSelection<>currentSelection Or stanceSelection<>previousStance
		If previousSelection<>currentSelection
			psound(#H2H_SOUND_ID_MENUCLIC)
			classFreeIcon(*allClasses(previousSelection))
			classLoadIcon(*allClasses(currentSelection))
			gadgetReset(*gadget)
		Else
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
	c=*gadget\color&$FFFFFF
	t=*gadget\color>>24
; 	f.f=(Red(c)+Green(c)+Blue(c))/(128.0*3.0)
	c2=c
	If isTooWhite(c,64)
; 		Debug "too white"
		AffTextBorder(*allClasses(currentSelection)\name,100,60,c,t,1,colorLerp(c,#Black),(255+t)/2,*font32,*font32Border)
		AffTextBorder(*allClasses(currentSelection)\allStances(stanceSelection)\name,100,100,colorLerp(c,#Black),(255+t)/2,1,c&$FFFFFF,t)
	Else
		AffTextBorder(*allClasses(currentSelection)\name,100,60,colorLerp(c,#White),(128+t)/2,1,c&$FFFFFF,t,*font32,*font32Border)
		AffTextBorder(*allClasses(currentSelection)\allStances(stanceSelection)\name,100,100,c&$FFFFFF,t,1,colorLerp(c,#White),(128+t)/2)
	EndIf
	refreshAllGadget(delta)
	gadgetDisplayAll(#H2H_GADGET_LAYER_BACK)
	If *gadget And *gadget\what And *gadget\display
		frameDisplayShadow(*gadget\what\frames(*gadget\index),*gadget\where\x,*gadget\where\y,0,#False,*gadget\color)
	EndIf
	gadgetDisplayAll(#H2H_GADGET_LAYER_FRONT)
	classDisplay(*allClasses(currentSelection),75,200,stanceSelection,*gadget)
	If screenSizeX>=1500
		classGridDisplay(currentSelection,1000,100)
	EndIf
	CompilerIf #H2H_MOUSE_ENABLED
		ExamineMouse()
		cursorDisplay()
	CompilerEndIf
EndProcedure

Procedure.i distanceInList(startI.i,currentSelection)
	s=startI
	distance=0
	While s<>currentSelection
		s+1
		distance+1
		If s>ArraySize(*availableClasses())
			s=0
		EndIf
	Wend
	ProcedureReturn distance
EndProcedure

Procedure terrainSelection(x.i=0,y.i=0)
	Static currentSelection=0
	Static pressNext=0
	Static pressPrevious=0
	Static pressAccept=0
	Static pressReturn=0
	exit=0
	result=-2 ; not picked
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or menuRight() Or menuUp()
		psound(#H2H_SOUND_ID_MENUCLIC)
		If currentSelection>-1
			backgroundDestroy(*allBackground(currentSelection))
		EndIf
		currentSelection+1
		If currentSelection>ArraySize(*allBackground())
			currentSelection=-1
		Else
			backgroundLoad(*allBackground(currentSelection))
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or menuLeft() Or menuDown()
		psound(#H2H_SOUND_ID_MENUCLIC)
		If currentSelection>-1
			backgroundDestroy(*allBackground(currentSelection))
		EndIf
		currentSelection-1
		If currentSelection<-1
			currentSelection=ArraySize(*allBackground())
		Else
			If currentSelection>=0
				backgroundLoad(*allBackground(currentSelection))
			EndIf
		EndIf
	EndIf
	
	If playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or menuAccept()
		psound(#H2H_SOUND_ID_MENUACCEPT)
		If currentSelection>=0
  			result=currentSelection
  		Else
  			result=Random(ArraySize(*allBackground()))
  		EndIf
  	EndIf

	subY=y
	subY=AfftextColor("       "+UCase(lsGet("TERRAIN")),100+x,subY,#Orange,128,1,*font32)+8
	If currentSelection=-1
		AfftextColor(lsGet("RANDOM"),100+x,80+subY,0,128,1,*font32)
		jx=100+x
		jy=120+subY
		AfftextColor("?",jx,jy,#H2H_STANCE_COLOR_BLACK,128,4,*font32)
	Else
		*b.background=*allBackground(currentSelection)
		AfftextColor(*b\name$,100+x,80+subY,0,128,1,*font32)
		size=*b\rightLimit-*b\leftLimit
		If *b\size<=3000
			AfftextColor(lsGet("TERRAIN_SMALL"),100+x,120+subY,#Blue)
		Else
			If *b\size<=5000
				AfftextColor(lsGet("TERRAIN_MEDIUM"),100+x,120+subY,#Blue)
			Else
				AfftextColor(lsGet("TERRAIN_LARGE"),100+x,120+subY,#Blue)
			EndIf
		EndIf
		If Not *b\training
			jx=100+x
			jy=140+subY
			If Not IsSprite(*b\imagesId(0))
				backgroundLoad(*b)
			EndIf
			For i=0 To ArraySize(*b\imagesId())
				sprite=*b\imagesId(i)
				ZoomSprite(sprite,SpriteWidth(sprite)/8,SpriteHeight(sprite)/8)
				DisplaySprite(sprite,jx,jy)
				jx+*b\sizes(i)/8
				ZoomSprite(sprite,#PB_Default,#PB_Default)
			Next
		EndIf
	EndIf
	ProcedureReturn result
EndProcedure

Global ready=0
Global ready2=0
Global playerSelected=#False

Procedure gadgetRefreshColorById(*gadget.animationGadget,*p.player,whatClass.i,whatStance.i)
	If whatClass>=0
		If whatStance>-1
			*gadget\color=*allClasses(whatClass)\allStances(whatStance)\specialcolor
			;*gadget\colorIntensity=*allClasses(whatClass)\allStances(whatStance)\specialcolor>>24
			If Not *gadget\color
				*gadget\color=*p\color
				;*gadget\colorIntensity=128
			EndIf
		Else
			If whatStance=-2
				*gadget\color=RGBA(255,255,255,224) ; TODO constant
			Else
				*gadget\color=RGBA(1,1,1,224)
			EndIf
			;*gadget\colorIntensity=224
		EndIf
; 		Debug "set color to "+Hex(*gadget\color)
	EndIf
EndProcedure

Procedure classSelectionVersus(*gadgetLeft.animationGadget,*gadgetRight.animationGadget,versusBot.i=#False)
	Static currentSelection=0
	Static stanceSelection=0
	Static pressNext=0
	Static pressPrevious=0
	Static exit=0
	
	Static currentSelection2=0
	Static stanceSelection2=0
	Static pressNext2=0
	Static pressPrevious2=0
	Static startI=0
	Static startI2=0

	rightPosition=screenSizeX
	leftPosition=0
	If stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
		leftPosition=rightPosition/4
		rightPosition-rightPosition/4
	EndIf
	If stereoWidth=#H2H_SOUND_STEREO_NONE_WIDTH
		rightPosition/2
		leftPosition=rightPosition
	EndIf

	Protected *pRight.player=*player1
	Protected *pLeft.player=*player2
	Protected *gadget1.animationGadget=*gadgetRight
	Protected *gadget2.animationGadget=*gadgetLeft
	If player1OnTheLeft
		Swap *pRight, *pLeft
		Swap *gadget1, *gadget2
		Swap leftPosition, rightPosition
	EndIf
	If currentSelection=99
		currentSelection=-1
	EndIf
	If currentSelection2=99
		currentSelection2=-1
	EndIf
	If stanceSelection=99
		stanceSelection=-1
	EndIf
	If stanceSelection2=99
		stanceSelection2=-1
	EndIf
	If currentSelection=98
		currentSelection=-2
	EndIf
	If currentSelection2=98
		currentSelection2=-2
	EndIf
	If stanceSelection=98
		stanceSelection=-2
	EndIf
	If stanceSelection2=98
		stanceSelection2=-2
	EndIf

	;{ player 1 commands
	previousSelection=*availableClasses(currentSelection)
	previousStance=stanceSelection
	If Not ready
		;Debug "player right "+controlGet(*player1\keyboardControl,#H2H_CONTROL_RIGHT) ;playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True)
		If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True)
			currentSelection+1
			If currentSelection>ArraySize(*availableClasses())
				currentSelection=0
			EndIf
			If distanceInList(startI,currentSelection)>=#H2H_CLASS_GALLERY_GRID_SIZE_X/100
				startI+1
				If startI>ArraySize(*availableClasses())
					startI=0
				EndIf
			EndIf
			stanceSelection=0
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True)
			currentSelection-1
			If currentSelection<0
				currentSelection=ArraySize(*availableClasses())
				If startI=0
					startI=ArraySize(*availableClasses())
				EndIf
			EndIf
			If startI>currentSelection And distanceInList(startI,currentSelection)>#H2H_CLASS_GALLERY_GRID_SIZE_X/100-1
				startI-1
				If startI<0
					startI=ArraySize(*availableClasses())
				EndIf
			EndIf
			stanceSelection=0
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_UP,#True)
			stanceSelection-1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True)
			stanceSelection+1
		EndIf
		If currentSelection>ArraySize(*availableClasses())
			currentSelection=0
		EndIf
		If currentSelection<0
			currentSelection=ArraySize(*availableClasses())
		EndIf
		If stanceSelection<-2
			stanceSelection=-2
		EndIf
		If *availableClasses(currentSelection)>=0
			If stanceSelection>ArraySize(*allClasses(*availableClasses(currentSelection))\allStances())
				stanceSelection=ArraySize(*allClasses(*availableClasses(currentSelection))\allStances())
			EndIf
		Else
			If stanceSelection>0
				stanceSelection=0
			EndIf
		EndIf
		If previousSelection<>*availableClasses(currentSelection) Or stanceSelection<>previousStance
			If previousSelection<>*availableClasses(currentSelection)
				psound(#H2H_SOUND_ID_MENUCLIC,rightPosition)
				gadgetReset(*gadget1)
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
			EndIf
		EndIf
		If Not ready And ((playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True)) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True))
			If player1OnTheLeft
				psound(#H2H_SOUND_ID_MENUCLIC,leftPosition)
			Else
				psound(#H2H_SOUND_ID_MENUCLIC,rightPosition)
			EndIf
			ready=#True
			If versusBot
				playerSelected=#True
				keyClear()
			EndIf
			If playerHasJustPressed(*player1,#H2H_CONTROL_ACCEPT)
				controlGet(*player1\pushed,#H2H_CONTROL_ACCEPT)=2
			EndIf
			If playerHasJustPressed(*player1,#H2H_CONTROL_ATTACK)
				controlGet(*player1\pushed,#H2H_CONTROL_ATTACK)=2
			EndIf
			*gadget1\opacity=255
		EndIf
	Else
		If ready And (playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True))
			psound(#H2H_SOUND_ID_MENUCLIC,rightPosition)
			If versusBot
				If playerSelected
					If ready2
						ready2=#False
						*gadget2\opacity=64
					Else
						ready=#False
						playerSelected=#False
						*gadget1\opacity=64
					EndIf
				Else
					ready=#False
				EndIf
				keyClear()
; 				keyJustpressedClear()
				controlGet(*player1\pushed,#H2H_CONTROL_HEAVY)=42
				controlGet(*player1\pushed,#H2H_CONTROL_CANCEL)=42
			Else
				ready=#False
				*gadget1\opacity=64
			EndIf
		EndIf
	EndIf
	finalSelection=*availableClasses(currentSelection)
	;}
	;{ player 2 command
	previousSelection2=*availableClasses(currentSelection2)
	previousStance2=stanceSelection2
	If Not ready2
		If (Not versusBot And playerHasCommand(*player2,#H2H_CONTROL_RIGHT,#True)) Or (playerSelected And playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True))
			pressNext2=1
			currentSelection2+1
			If currentSelection2>ArraySize(*availableClasses())
				currentSelection2=0
			EndIf
			If distanceInList(startI2,currentSelection2)>=#H2H_CLASS_GALLERY_GRID_SIZE_X/100
				startI2+1
				If startI2>ArraySize(*availableClasses())
					startI2=0
				EndIf
			EndIf
			stanceSelection2=0
		EndIf
		If (Not versusBot And  playerHasCommand(*player2,#H2H_CONTROL_LEFT,#True)) Or (playerSelected And playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True))
			pressPrevious2=1
			currentSelection2-1
			If currentSelection2<0
				currentSelection2=ArraySize(*availableClasses())
				If startI2=0
					startI2=ArraySize(*availableClasses())
				EndIf
			EndIf
			If startI2>currentSelection2 And distanceInList(startI2,currentSelection2)>#H2H_CLASS_GALLERY_GRID_SIZE_X/100-1
				startI2-1
				If startI2<0
					startI2=ArraySize(*availableClasses())
				EndIf
			EndIf
			stanceSelection2=0
		EndIf
		If (Not versusBot And playerHasCommand(*player2,#H2H_CONTROL_UP,#True)) Or (playerSelected And playerHasCommand(*player1,#H2H_CONTROL_UP,#True))
			stanceSelection2-1
		EndIf
		If (Not versusBot And playerHasCommand(*player2,#H2H_CONTROL_DOWN,#True)) Or (playerSelected And playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True))
			stanceSelection2+1
		EndIf
		If currentSelection2>ArraySize(*availableClasses())
			currentSelection2=-2
		EndIf
		If currentSelection2<-2
			currentSelection2=ArraySize(*availableClasses())
		EndIf
		If stanceSelection2<-2
			stanceSelection2=-2
		EndIf
		If *availableClasses(currentSelection2)>=0
			If stanceSelection2>ArraySize(*allClasses(*availableClasses(currentSelection2))\allStances())
				stanceSelection2=ArraySize(*allClasses(*availableClasses(currentSelection2))\allStances())
			EndIf
		Else
			If stanceSelection2>0
				stanceSelection2=0
			EndIf
		EndIf
		If previousSelection2<>*availableClasses(currentSelection2) Or stanceSelection2<>previousStance2
			If previousSelection2<>*availableClasses(currentSelection2)
				psound(#H2H_SOUND_ID_MENUCLIC,leftPosition)
				gadgetReset(*gadget2)
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
			EndIf
		EndIf
		If Not ready2
			If versusBot
				If playerSelected
					If playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True)
						psound(#H2H_SOUND_ID_MENUCLIC,leftPosition)
						*gadget2\opacity=255
						ready2=1
						If playerHasJustPressed(*player1,#H2H_CONTROL_ACCEPT)
							controlGet(*player1\pushed,#H2H_CONTROL_ACCEPT)=2
						EndIf
						If playerHasJustPressed(*player1,#H2H_CONTROL_ATTACK)
							controlGet(*player1\pushed,#H2H_CONTROL_ATTACK)=2
						EndIf
					EndIf
				EndIf
			Else
				If playerHasCommand(*player2,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player2,#H2H_CONTROL_ATTACK,#True)
					psound(#H2H_SOUND_ID_MENUCLIC,leftPosition)
					*gadget2\opacity=255
					ready2=1
					If playerHasJustPressed(*player2,#H2H_CONTROL_ACCEPT)
						controlGet(*player2\pushed,#H2H_CONTROL_ACCEPT)=2
					EndIf
					If playerHasJustPressed(*player2,#H2H_CONTROL_ATTACK)
						controlGet(*player2\pushed,#H2H_CONTROL_ATTACK)=2
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		If Not versusBot And ready2 And (playerHasCommand(*player2,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player2,#H2H_CONTROL_HEAVY,#True))
			If player1OnTheLeft
				psound(#H2H_SOUND_ID_MENUCLIC,rightPosition)
			Else
				psound(#H2H_SOUND_ID_MENUCLIC,leftPosition)
			EndIf
			*gadget2\opacity=64
			ready2=0
			playerSelected=#False
		EndIf
	EndIf
	finalSelection2=*availableClasses(currentSelection2)
	;}
	;{ display
	
	shineLoop(deltaGlobal)
	mirror=#False
	mirror2=#False
	If finalSelection=-2 And finalSelection2>=0
		mirror=#True
	Else
		If finalSelection2=-2 And finalSelection>=0
			mirror2=#True
		EndIf
	EndIf
	s.s=""
	scale.d=1
	size.d=0
	Protected finalRight=finalSelection
	Protected finalLeft=finalSelection2
	Protected stanceRight=stanceSelection
	Protected stanceLeft=stanceSelection2
	Protected readyRight=ready
	Protected readyLeft=ready2
	If player1OnTheLeft
 		Swap finalRight, finalLeft
		Swap stanceRight, stanceLeft
		Swap readyRight, readyLeft
	EndIf
	
	; gadget color
	If stanceSelection>=0
		*gadget1\stanceId=stanceSelection
	Else
		*gadget1\stanceId=0
	EndIf
	If stanceSelection2>=0
		*gadget2\stanceId=stanceSelection2
	Else
		*gadget2\stanceId=0
	EndIf
 	gadgetRefreshColorById(*gadget1,*player1,finalSelection,stanceSelection)
 	gadgetRefreshColorById(*gadget2,*player2,finalSelection2,stanceSelection2)
 	If mirror
 		Select stanceSelection2
 			Case -1
				*gadget1\color=#Black+$D0000000
				;*gadget1\colorIntensity=224
 			Case -2
				*gadget1\color=#White+$D0000000
				;*gadget1\colorIntensity=224
 			Default
				*gadget1\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialcolor
				;*gadget1\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialTransparency
				If Not *gadget1\color
					*gadget1\color=*gadget2\color
				EndIf
				*gadget1\stanceId=stanceSelection2
		EndSelect
	EndIf
	If mirror2
		Select stanceSelection
			Case -1
				*gadget2\color=#Black+$D0000000
				;*gadget2\colorIntensity=224
			Case -2
				*gadget2\color=#White+$D0000000
				;*gadget2\colorIntensity=224
			Default
				*gadget2\color=*allClasses(finalSelection)\allStances(stanceSelection)\alternatecolor
				;*gadget2\colorIntensity=*allClasses(finalSelection)\allStances(stanceSelection)\alternateTransparency
		 		If Not *gadget2\color
					*gadget2\color=*player2\color
					;*gadget2\colorIntensity=128
				EndIf
				If playerColorMode=#H2H_PLAYER_COLOR_MODE_ALTERNATIVE Or isColorClose(*gadget1\color,*gadget2\color)
					*gadget2\color=*allClasses(finalSelection)\allStances(stanceSelection)\alternatecolor
					;*gadget2\colorIntensity=*allClasses(finalSelection)\allStances(stanceSelection)\alternateTransparency
					If Not *gadget2\color
						*gadget2\color=*player2\alternateColor
						;*gadget2\colorIntensity=128
					EndIf
				EndIf
				*gadget2\stanceId=stanceSelection
		EndSelect
	EndIf
	If finalSelection2>-1
		If stanceSelection2>-1
			*gadget2\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialcolor
	 		;*gadget2\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialTransparency
	 		If Not *gadget2\color
				*gadget2\color=*player2\color
				;*gadget2\colorIntensity=128
			EndIf
 			If playerColorMode=#H2H_PLAYER_COLOR_MODE_ALTERNATIVE Or isColorClose(*gadget1\color,*gadget2\color)
				*gadget2\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\alternatecolor
				;*gadget2\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\alternateTransparency
				If Not *gadget2\color
					*gadget2\color=*player2\alternateColor
					;*gadget2\colorIntensity=128
				EndIf
			EndIf
		Else
			If stanceSelection2=-2
				*gadget2\color=RGBA(255,255,255,224)
			Else
				*gadget2\color=RGBA(1,1,1,224)
			EndIf
			;*gadget2\colorIntensity=224
		EndIf
	EndIf
	*gadgetRight\display=Bool(screenSizeX>1200 And finalRight<>-1)
	*gadgetLeft\display=Bool(screenSizeX>1200 And finalLeft<>-1)
	If screenSizeX>1200 And versusBot And Not playerSelected
 		If player1OnTheLeft
			*gadgetRight\display=#False
 		Else
 	 		*gadgetLeft\display=#False
 		EndIf
 	EndIf
  	If finalSelection=-2 And finalSelection2=-2
  		*gadgetLeft\display=#False
  		*gadgetRight\display=#False
  	EndIf
  	If finalSelection=-2 And finalSelection2=-1
  		*gadget1\display=#False
  	EndIf
  	If finalSelection2=-2 And finalSelection=-1
  		*gadget2\display=#False
  	EndIf
  		
  	If versusBot And Not playerSelected
	  	If finalSelection=-2
	  		*gadget1\display=#False
	  	EndIf
  	EndIf

	; Shadow
	shifterX=0
	shifterY=0
	If screenSizeX>1500
		shifterX=300
		shifterY=-150
	EndIf
	If *gadgetRight\display
		i=*gadgetRight\index
		If i>ArraySize(*gadgetRight\what\frames())
			i=ArraySize(*gadgetRight\what\frames())
		EndIf
		If finalRight=-2 And stanceLeft<0
			; mirrors the black or white color
			frameDisplayShadow(*gadgetRight\what\frames(i),*gadgetRight\where\x,*gadgetRight\where\y,#False,#False,*gadgetLeft\color)
		Else
			frameDisplayShadow(*gadgetRight\what\frames(i),*gadgetRight\where\x,*gadgetRight\where\y,#False,#False,*gadgetRight\color)
		EndIf
	EndIf
	If *gadgetLeft\display
		i=*gadgetLeft\index
		If i>ArraySize(*gadgetLeft\what\frames())
			i=ArraySize(*gadgetLeft\what\frames())
		EndIf
		If finalLeft=-2 And stanceRight<0
			frameDisplayShadow(*gadgetLeft\what\frames(i),*gadgetLeft\where\x,*gadgetLeft\where\y,#True,#False,*gadgetRight\color)
		Else
			frameDisplayShadow(*gadgetLeft\what\frames(i),*gadgetLeft\where\x,*gadgetLeft\where\y,#True,#False,*gadgetLeft\color)
		EndIf
	EndIf

	If *gadgetRight\display
		displayMode.i=#H2H_CLASS_DISPLAY_MODE_SELECTION
		If readyRight
			displayMode=#H2H_CLASS_DISPLAY_MODE_SELECTED
		EndIf
		If finalRight>-1
			If stanceRight<=-1
				If finalRight=finalLeft And stanceRight=-2 And stanceLeft<>2
					; mirror
					classDisplaySelection(*allClasses(finalRight),stanceLeft,screenSizeX-75,150,*gadgetRight,#True,displayMode)
				Else
					; different class so random display
					classDisplaySelection(*allClasses(finalRight),-1,screenSizeX-75,150,*gadgetRight,#True,displayMode)
				EndIf
			Else
				; normal display
				classDisplaySelection(*allClasses(finalRight),stanceRight,screenSizeX-75,150,*gadgetRight,#True,displayMode)
			EndIf
		EndIf
		If finalRight=-2 And finalLeft>=0
			If stanceRight=0
				classDisplaySelection(*allClasses(finalLeft),stanceLeft,screenSizeX-75,150,*gadgetRight,#True,displayMode)
			Else
				classDisplaySelection(*allClasses(finalLeft),-1,screenSizeX-75,150,*gadgetRight,#True,displayMode)
			EndIf
		EndIf
	EndIf
	If finalRight=-1 Or (finalRight=-2 And finalLeft=-1)
		If versusBot
			If player1OnTheLeft And versusBot And playerSelected
				classDisplaySelection(-1,0,screenSizeX-75,150,*gadgetRight,#True,displayMode)
			EndIf
		Else
			classDisplaySelection(-1,0,screenSizeX-75,150,*gadgetRight,#True,displayMode)
		EndIf
	EndIf
	If *gadgetLeft\display
		displayMode.i=#H2H_CLASS_DISPLAY_MODE_SELECTION
		If readyLeft
			displayMode=#H2H_CLASS_DISPLAY_MODE_SELECTED
		EndIf
		If finalLeft>-1
			If stanceLeft<=-1
				If finalRight=finalLeft And stanceRight<>-2 And stanceLeft=2
					classDisplaySelection(*allClasses(finalLeft),stanceRight,75,150,*gadgetLeft,#False,displayMode)
				Else
					classDisplaySelection(*allClasses(finalLeft),-1,75,150,*gadgetLeft,#False,displayMode)
				EndIf
			Else
				classDisplaySelection(*allClasses(finalLeft),stanceLeft,75,150,*gadgetLeft,#False,displayMode)
			EndIf
		EndIf
		If finalLeft=-2 And finalRight>=0
			If stanceLeft=0
				classDisplaySelection(*allClasses(finalRight),stanceRight,75,150,*gadgetLeft,#False,displayMode)
			Else
				classDisplaySelection(*allClasses(finalRight),-1,75,150,*gadgetLeft,#False,displayMode)
			EndIf
		EndIf
	EndIf
	;}
	If finalLeft=-1 Or (finalLeft=-2 And finalRight=-1)
		If versusBot
			If Not player1OnTheLeft And versusBot And playerSelected
				classDisplaySelection(-1,0,75,150,*gadgetLeft,#False,displayMode)
			EndIf
		Else
			classDisplaySelection(-1,0,75,150,*gadgetLeft,#False,displayMode)
		EndIf
	EndIf
	If screenSizeX>=1200
		refreshAllGadget(deltaGlobal)
		gadgetDisplayAll(#H2H_GADGET_LAYER_BACK)
		gadgetDisplayAll(#H2H_GADGET_LAYER_FRONT)
	Else
		If finalRight>-1
			classLoadIcon(*allClasses(finalRight))
			classDisplayIcon(*allClasses(finalRight),screenSizeX-600,150,*gadgetRight\color,*gadgetRight\opacity)
		EndIf
		If finalLeft>-1
			classLoadIcon(*allClasses(finalLeft))
			classDisplayIcon(*allClasses(finalLeft),75,150,*gadgetLeft\color,*gadgetLeft\opacity,#True)
		EndIf
	EndIf
	;{ right
	If Not player1OnTheLeft Or Not versusBot Or playerSelected
		other.s=""
		If Not versusBot
			If readyRight
				If *pRight\joystickId>-1 And Not controlEmpty(*pRight\joystickControl,#H2H_CONTROL_HEAVY)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pRight\joystickControl,#H2H_CONTROL_HEAVY))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_CANCEL",-1,keyToString(controlGet(*pRight\keyboardControl,#H2H_CONTROL_HEAVY))+other)
				AfftextColor(s$,screenSizeX-100-AfftextGetLength(s$)*classLevelScale()*3-shifterX,925*classLevelScale()*2+shifterY,#Gray,128,classLevelScale()*3)
			Else
				If *pRight\joystickId>-1 And Not controlEmpty(*pRight\joystickControl,#H2H_CONTROL_ATTACK)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pRight\joystickControl,#H2H_CONTROL_ATTACK))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_SELECT",-1,keyToString(controlGet(*pRight\keyboardControl,#H2H_CONTROL_ATTACK))+other)
				AfftextColor(s$,screenSizeX-100-AfftextGetLength(s$)*classLevelScale()*3-shifterX,925*classLevelScale()*2+shifterY,*pRight\color,128,classLevelScale()*3)
			EndIf
 		EndIf
 		scale=3
		Protected c.i=*gadgetRight\color&$FFFFFF
		Protected t.i=*gadgetRight\color>>24
		s.s=""
		ss.s=""
		cc=c ; player stance color
 		Select finalRight
 			Case -1
 				c=#Black
 				t=128
 				s=lsGet("RANDOM")
 				Select stanceRight
 					Case -2
						cc=colorLerp(colorLerp(#Black,*pRight\color),#Black)
 						ss=lsGet("ANY")
					Case -1
						cc=colorLerp(colorLerp(#Gray,*pRight\color),#Gray)
 						ss=lsGet("VERSUS_SELECT_STANCE_DIFFERENT")
 					Case 0
 						ss=lsGet("VERSUS_SELECT_CLASS_DIFFERENT")
				EndSelect
				If readyRight
					AffTextBorder("?",*gadgetRight\where\x+350,*gadgetRight\where\y+350,*pRight\color,128,8,*pRight\color&$FFFFFF,255,*font32,*font32Border)
				Else
					AffTextBorder("?",*gadgetRight\where\x+350,*gadgetRight\where\y+350,#Gray,128,8,#Black+$20000000,128,*font32,*font32Border)
				EndIf
 			Case -2
 				c=#White
 				t=128
 				s=lsGet("MIRROR")
				Select stanceRight
					Case -2
						cc=colorLerp(#Black,*pRight\color)
						ss=lsGet("VERSUS_SELECT_STANCE_RANDOM")
					Case -1
						cc=colorLerp(#Gray,*pRight\color)
 						ss=lsGet("VERSUS_SELECT_STANCE_DIFFERENT")
					Case 0
 						ss=lsGet("VERSUS_SELECT_STANCE_MIRROR")
				EndSelect
				If readyRight
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetRight\where\x+350,*gadgetRight\where\y+350,#White,128,8,*pRight\color&$FFFFFF,*font32,*font32Border)
				Else
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetRight\where\x+350,*gadgetRight\where\y+350,#White,128,8,#White+$80000000,128,*font32,*font32Border)
				EndIf
 			Default
 				s=*allClasses(finalRight)\name
 				Select stanceRight
 					Case -2
						ss=lsGet("VERSUS_SELECT_STANCE_MIRROR")
 					Case -1
						ss=lsGet("VERSUS_SELECT_STANCE_RANDOM")
 					Default
 						ss=*allClasses(finalRight)\allStances(stanceRight)\name
 				EndSelect
 		EndSelect
		size=AfftextGetLength(s)*scale
		If size>screenSizeX/2-150
			scale/(size/(screenSizeX/2-150))
			size=screenSizeX/2-150
		EndIf
		If isTooWhite(c,64)
			AffTextBorder(s,screenSizeX-100-size,3*(40/scale),c&$FFFFFF,t,scale/2,colorLerp(c,#Black),(255+t)/2,*font32,*font32Border)
		Else
			AffTextBorder(s,screenSizeX-100-size,3*(40/scale),colorLerp(c,#White),(128+t)/2,scale/2,c&$FFFFFF,t,*font32,*font32Border)
		EndIf
		If isTooWhite(cc,64)
			AffTextBorder(ss,screenSizeX-100-AfftextGetLength(ss),100,colorLerp(cc,#Black),(255+t)/2,1,cc&$FFFFFF,t)
		Else
			AffTextBorder(ss,screenSizeX-100-AfftextGetLength(ss),100,cc&$FFFFFF,t,1,colorLerp(cc,#White),(128+t)/2)
		EndIf
	EndIf
	; left display
	If player1OnTheLeft Or Not versusBot Or playerSelected
		If Not versusBot
			other.s=""
			If readyLeft
				If *pLeft\joystickId>-1 And Not controlEmpty(*pLeft\joystickControl,#H2H_CONTROL_HEAVY)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pLeft\joystickControl,#H2H_CONTROL_HEAVY))+")"
				EndIf
				AfftextColor(lsGet("VERSUS_SELECT_PRESS_TO_CANCEL",-1,keyToString(controlGet(*pLeft\keyboardControl,#H2H_CONTROL_HEAVY))+other),100+shifterX,975*classLevelScale()*2+shifterY,#Gray,128,classLevelScale()*3)
			Else
				If *pLeft\joystickId>-1 And Not controlEmpty(*pLeft\joystickControl,#H2H_CONTROL_ATTACK)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pLeft\joystickControl,#H2H_CONTROL_ATTACK))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_SELECT",-1,keyToString(controlGet(*pLeft\keyboardControl,#H2H_CONTROL_ATTACK))+other)
				AfftextColor(s$,100+shifterX,975*classLevelScale()*2+shifterY,*pLeft\color&$FFFFFF,128,classLevelScale()*3)
				other=""
			EndIf
		EndIf
 		scale=3
		c=*gadgetLeft\color&$FFFFFF
		t=*gadgetLeft\color>>24;*gadgetLeft\colorIntensity
		s.s=""
		ss.s=""
		cc=c ; player stance color
		Select finalLeft
			Case -1
 				c=#Black
 				t=128
 				s=lsGet("RANDOM")
 				Select stanceLeft
 					Case -2
						cc=colorLerp(colorLerp(#Black,*pLeft\color),#Black)
 						ss=lsGet("ANY")
					Case -1
 						ss=lsGet("VERSUS_SELECT_STANCE_DIFFERENT")
						cc=colorLerp(colorLerp(#Gray,*pLeft\color),#Gray)
					Case 0
 						ss=lsGet("VERSUS_SELECT_CLASS_DIFFERENT")
				EndSelect
				If readyLeft
					AffTextBorder("?",*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,*pLeft\color&$FFFFFF,128,8,*pLeft\color&$FFFFFF,255,*font32,*font32Border)
				Else
					AffTextBorder("?",*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#Gray,128,8,#Black,128,*font32,*font32Border)
				EndIf
			Case -2
 				s=lsGet("MIRROR")
				Select stanceLeft
					Case -2
						cc=colorLerp(#Black,*pLeft\color)
 						ss=lsGet("VERSUS_SELECT_STANCE_RANDOM")
					Case -1
						cc=colorLerp(#Gray,*pLeft\color)
 						ss=lsGet("VERSUS_SELECT_STANCE_DIFFERENT")
					Case 0
 						ss=lsGet("VERSUS_SELECT_STANCE_MIRROR")
				EndSelect
				If readyLeft
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#White,128,8,*pLeft\color&$FFFFFF,*font32,*font32Border)
				Else
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#White,128,8,#White,128,*font32,*font32Border)
				EndIf
			Default
				s=*allClasses(finalLeft)\name
 				Select stanceLeft
 					Case -2
						ss=lsGet("VERSUS_SELECT_STANCE_MIRROR")
 					Case -1
						ss=lsGet("VERSUS_SELECT_STANCE_RANDOM")
 					Default
 						ss=*allClasses(finalLeft)\allStances(stanceLeft)\name
 				EndSelect
		EndSelect
		scale=3
		size=AfftextGetLength(s)*scale
		If size>screenSizeX/2-150
			scale/(size/(screenSizeX/2-150))
		EndIf
		If isTooWhite(c,64)
			AffTextBorder(s,100,3*(40/scale),c&$FFFFFF,t,scale/2,colorLerp(c,#Black),(255+t)/2,*font32,*font32Border)
		Else
			AffTextBorder(s,100,3*(40/scale),colorLerp(c,#White),(128+t)/2,scale/2,c&$FFFFFF,t,*font32,*font32Border)
		EndIf
		If isTooWhite(cc,64)
			AffTextBorder(ss,100,100,colorLerp(cc,#Black),(255+t)/2,1,cc&$FFFFFF,t)
		Else
			AffTextBorder(ss,100,100,cc,t,1,colorLerp(cc,#White),(128+t)/2)
		EndIf
	EndIf
	If screenSizeY>=800
		If player1OnTheLeft
			If Not versusBot Or playerSelected
				classLineDisplay(finalRight,screenSizeX-575,screenSizeY-150,#True,#True,startI2)
			EndIf
			classLineDisplay(finalLeft,75,screenSizeY-150,#True,#True,startI)
		Else
			classLineDisplay(finalRight,screenSizeX-575,screenSizeY-150,#True,#True,startI)
			If Not versusBot Or playerSelected
				classLineDisplay(finalLeft,75,screenSizeY-150,#True,#True,startI2)
			EndIf
		EndIf
	EndIf
	If finalRight>=0
		If stanceRight=-1
			If readyRight
				AffTextBorder("?",*gadgetRight\where\x+350,*gadgetRight\where\y+350,*pRight\color+$80000000,128,8,*pRight\color&$FFFFFF,255,*font32,*font32Border)
			Else
				AffTextBorder("?",*gadgetRight\where\x+350,*gadgetRight\where\y+350,#Gray+$80000000,128,8,#Black+$20000000,128,*font32,*font32Border)
			EndIf
		EndIf
		If stanceRight=-2
			If readyRight
				AffTextBorder(lsGet("MIRROR_MINI"),*gadgetRight\where\x+350,*gadgetRight\where\y+350,#White+$80000000,128,8,*pRight\color&$FFFFFF,255,*font32,*font32Border)
			Else
				AffTextBorder(lsGet("MIRROR_MINI"),*gadgetRight\where\x+350,*gadgetRight\where\y+350,#White+$80000000,128,8,#White+$80000000,128,*font32,*font32Border)
			EndIf
		EndIf
	EndIf
	If Not versusBot Or playerSelected
		If finalLeft>=0
			If stanceLeft=-1
				If readyLeft
					AffTextBorder("?",*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,*pLeft\color+$80000000,128,8,*pLeft\color&$FFFFFF,255,*font32,*font32Border)
				Else
					AffTextBorder("?",*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#Gray+$80000000,128,8,#Black+$20000000,128,*font32,*font32Border)
				EndIf
			EndIf
			If stanceLeft=-2
				If readyLeft
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#White+$80000000,128,8,*pLeft\color&$FFFFFF,255,*font32,*font32Border)
				Else
					AffTextBorder(lsGet("MIRROR_MINI"),*gadgetLeft\where\x+350,*gadgetLeft\where\y+350,#White+$80000000,128,8,#White+$80000000,128,*font32,*font32Border)
				EndIf
			EndIf
		EndIf
	EndIf
	;}
	If ready And ready2
		other.s=""
		If *pRight\joystickId>-1 And Not controlEmpty(*pRight\joystickControl,#H2H_CONTROL_ACCEPT)
			other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pRight\joystickControl,#H2H_CONTROL_ACCEPT))
		Else
			If *pLeft\joystickId>-1 And Not controlEmpty(*pLeft\joystickControl,#H2H_CONTROL_ACCEPT)
				other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*pLeft\joystickControl,#H2H_CONTROL_ACCEPT))+")"
			EndIf
		EndIf
		s$=lsGet("VERSUS_SELECT_PRESS_TO_START",-1,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_ACCEPT))+other)
		l=AffTextBorder(s$,(screenSizeX-AfftextGetLength(s$)*classLevelScale()*5)/2,570,#Orange,menuTextIntensity,classLevelScale()*5,#White)
		If versusBot
			If *player1\joystickId>-1 And Not controlEmpty(*player1\joystickControl,#H2H_CONTROL_HEAVY)
				other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*player1\joystickControl,#H2H_CONTROL_HEAVY))+")"
			EndIf
			s$=lsGet("VERSUS_SELECT_PRESS_TO_CANCEL_BOT",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_HEAVY))+other)
			AfftextBorder(s$,(screenSizeX-AfftextGetLength(s$)*classLevelScale()*6)/1.5,l,#Gray,menuTextIntensity,classLevelScale()*6*0.75,#White)
		EndIf
		If menuAccept() Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
			If finalSelection=-1
				finalSelection=99
			EndIf
			If finalSelection2=-1
				finalSelection2=99
			EndIf
			If stanceSelection=-1
				stanceSelection=99
			EndIf
			If stanceSelection2=-1
				stanceSelection2=99
			EndIf
			
			If finalSelection=-2
				finalSelection=98
			EndIf
			If finalSelection2=-2
				finalSelection2=98
			EndIf
			If stanceSelection=-2
				stanceSelection=98
			EndIf
			If stanceSelection2=-2
				stanceSelection2=98
			EndIf
			psound(#H2H_SOUND_ID_MENUACCEPT)
			ProcedureReturn finalSelection+stanceSelection*100+(finalSelection2+stanceSelection2*100)*100*100
		EndIf
	Else
		If versusBot
			If playerSelected
				other.s=""
				If *player1\joystickId>-1 And Not controlEmpty(*player1\joystickControl,#H2H_CONTROL_ATTACK)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*player1\joystickControl,#H2H_CONTROL_ATTACK))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_SELECT_BOT",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ATTACK))+other)
				l=AfftextColor(s$,(screenSizeX-AfftextGetLength(s$)*classLevelScale()*6)/2,520*classLevelScale()*3,#Blue,menuTextIntensity,classLevelScale()*6)
				If *player1\joystickId>-1 And Not controlEmpty(*player1\joystickControl,#H2H_CONTROL_HEAVY)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*player1\joystickControl,#H2H_CONTROL_HEAVY))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_CANCEL",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_HEAVY))+other)
				AfftextColor(s$,(screenSizeX-AfftextGetLength(s$)*classLevelScale()*4)/2*0.75,l,#Gray,menuTextIntensity,classLevelScale()*6*0.75)
			Else
				If *player1\joystickId>-1 And Not controlEmpty(*player1\joystickControl,#H2H_CONTROL_ATTACK)
					other+" ("+lsGet("OR")+" "+controllerButtonName(controlGet(*player1\joystickControl,#H2H_CONTROL_ATTACK))+")"
				EndIf
				s$=lsGet("VERSUS_SELECT_PRESS_TO_SELECT",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ATTACK))+other)
				l=AfftextColor(s$,(screenSizeX-AfftextGetLength(s$)*classLevelScale()*6)/2,520*classLevelScale()*3,#Orange,menuTextIntensity,classLevelScale()*6)
			EndIf
		EndIf
	EndIf
	If menuExit()
		playerSelected=0
	EndIf
	ProcedureReturn -999
EndProcedure
#H2H_SETTINGS_VERSION=1
Procedure exportOptions()
	Debug "exported"
	*settings=CreateJSONObject(0)
	addJSONInteger(*settings,"Version",#H2H_SETTINGS_VERSION)
	addJSONInteger(*settings,"SoundVolume",soundlevel)
	addJSONInteger(*settings,"MusicVolume",musicLevel)
	addJSONInteger(*settings,"SoundStereo",stereoWidth)
	addJSONInteger(*settings,"SoundVariation",soundVariationEnabled)
	addJSONInteger(*settings,"KeyboardType",keyboardType)
	addJSONInteger(*settings,"ComboDisplay",comboDisplayMode)
	addJSONInteger(*settings,"WindEnabled",windEnabled)
	addJSONInteger(*settings,"ParticleEnabled",particleEnabled)
	addJSONInteger(*settings,"BuffedFrames",buffedFrames)
	addJSONInteger(*settings,"AttackDelay",attackDelayMode)
	addJSONInteger(*settings,"ShowFPS",showFPS)
	addJSONInteger(*settings,"FPSMode",currentFPSMode)
	addJSONInteger(*settings,"ScreenSize",selectedType)
	addJSONInteger(*settings,"Fullscreen",fullscreen)
	addJSONInteger(*settings,"Debug",debugOption)
	addJSONInteger(*settings,"PlayerColorMode",playerColorMode)
	addJSONInteger(*settings,"ScreenShakeMode",screenShakeMode)
	addJSONInteger(*settings,"rounds",maxRound)
	addJSONInteger(*settings,"roundDuration",roundLength)
	addJSONInteger(*settings,"language",currentLanguage)
	addJSONInteger(*settings,"player1OnTheLeft",player1OnTheLeft)
	
	*child=addJSONObject(*settings,"player1")
	controlJSONExport(*player1\keyboardControl,addJSONObject(*child,"keyboard"))
	controlJSONExport(*player1\joystickControl,addJSONObject(*child,"joystick"),#True)
	addJSONInteger(*child,"directionMode",*player1\directionMode,#True)
	addJSONInteger(*child,"jumpWithUp",*player1\jumpWithUp)
	
	*child=addJSONObject(*settings,"player2")
	controlJSONExport(*player2\keyboardControl,addJSONObject(*child,"keyboard"))
	controlJSONExport(*player2\joystickControl,addJSONObject(*child,"joystick"),#True)
	addJSONInteger(*child,"directionMode",*player2\directionMode,#True)
	addJSONInteger(*child,"jumpWithUp",*player2\jumpWithUp)
	
	If CreateFile(0,"settings.txt")
		WriteString(0,ComposeJSON(0,#PB_JSON_PrettyPrint))
		CloseFile(0)
	Else
		MessageRequester("H2H error","Cannot create settings file")
	EndIf
	FreeJSON(0)
EndProcedure

Procedure.i importOptions()
	If LoadJSON(JSONindex,"settings.txt") And loadJSONInteger(JSONValue(JSONindex),"Version")=#H2H_SETTINGS_VERSION
		*parent=JSONValue(JSONindex)
		soundlevel=				loadJSONInteger(*parent,"SoundVolume")
		If soundLevel<0
			soundlevel=0
		EndIf
		If soundlevel>100
			soundlevel=100
		EndIf
		musicLevel=				loadJSONInteger(*parent,"MusicVolume")
		If musicLevel<0
			musicLevel=0
		EndIf
		If musicLevel>100
			musicLevel=100
		EndIf
		stereoWidth=			loadJSONInteger(*parent,"SoundStereo")
		If stereoWidth<0
			stereoWidth=0
		EndIf
		If stereoWidth>SOUND_STEREO_DEFAULT_WIDTH
			stereoWidth=SOUND_STEREO_DEFAULT_WIDTH
		EndIf
		soundVariationEnabled=	loadJSONInteger(*parent,"SoundVariation")
		keyboardType=			loadJSONInteger(*parent,"KeyboardType")
		comboDisplayMode=		loadJSONInteger(*parent,"ComboDisplay")
		If comboDisplayMode<#H2H_COMBO_DISPLAY_BIG
			comboDisplayMode=#H2H_COMBO_DISPLAY_BIG
		EndIf
		If comboDisplayMode>#H2H_COMBO_DISPLAY_NONE
			comboDisplayMode=#H2H_COMBO_DISPLAY_NONE
		EndIf
		windEnabled=			loadJSONInteger(*parent,"WindEnabled")
		particleEnabled=		loadJSONInteger(*parent,"ParticleEnabled")
		buffedFrames=			loadJSONInteger(*parent,"BuffedFrames")
		If buffedFrames=0 Or buffedFrames>#H2H_FRAME_BUFFER_OFF
			buffedFrames=#H2H_FRAME_BUFFER_DEFAULT
		EndIf
		attackDelayMode=		loadJSONInteger(*parent,"AttackDelay")
		If attackDelayMode<#H2H_DELTA_DELAY_MODE_OFF Or attackDelayMode>#H2H_DELTA_DELAY_MODE_RELATIVE
			attackDelayMode=#H2H_DELTA_DELAY_MODE
		EndIf
		showFPS=				loadJSONInteger(*parent,"ShowFPS")
		currentFPSMode=			loadJSONInteger(*parent,"FPSMode")
		If Not currentFPSMode
			currentFPSMode=#H2H_FPS_MODE_DEFAULT
		EndIf
		If currentFPSMode>ArraySize(fpsMode())
			currentFPSMode=ArraySize(fpsMode())
		EndIf
		fpsModeChange(currentFPSMode)
		selectedType=			loadJSONInteger(*parent,"ScreenSize")
		If selectedType<0
			selectedType=0
		EndIf
		If selectedType>ArraySize(*screenType())
			selectedType=ArraySize(*screenType())
		EndIf
		*child=			GetJSONMember(*parent,"Fullscreen")
		If *child
			fullscreen=GetJSONInteger(*child)
		Else
			fullscreen=#H2H_SCREEN_FULL_DEFAULT
		EndIf
		fullscreenTmp=fullscreen
		debugOption=loadJSONInteger(*parent,"Debug")
		If debugOption
			debugEnabled=-1
			If *player1
				*player1\displayDebug=-1
			EndIf
			If *player2
				*player2\displayDebug=-1
			EndIf
		Else
			debugEnabled=0
			If *player1
				*player1\displayDebug=0
			EndIf
			If *player2
				*player2\displayDebug=0
			EndIf
		EndIf
		If GetJSONMember(*parent,"ScreenShakeMode")
			screenShakeMode=loadJSONInteger(*parent,"ScreenShakeMode")
		Else
			screenShakeMode=#H2H_SCREEN_SHAKE_DEFAULT
		EndIf
		screenShakeModeSet(screenShakeMode)
		If GetJSONMember(*parent,"rounds")
			maxRound=loadJSONInteger(*parent,"rounds")
		Else
			maxRound=#H2H_ROUND_BASE
		EndIf
		If GetJSONMember(*parent,"roundDuration")
			roundLength=loadJSONInteger(*parent,"roundDuration")
		Else
			roundLength=#H2H_ROUND_LENGTH
		EndIf
		If GetJSONMember(*parent,"language")
			currentLanguage=loadJSONInteger(*parent,"language")
		Else
			currentLanguage=#H2H_LANGUAGE_DEFAULT
		EndIf
		If GetJSONMember(*parent,"player1OnTheLeft")
			player1OnTheLeft=loadJSONInteger(*parent,"player1OnTheLeft")
		Else
			player1OnTheLeft=#H2H_PLAYER_ONE_ON_THE_LEFT
		EndIf
		playerColorMode=loadJSONInteger(*parent,"PlayerColorMode")
		If *player1
			*child=GetJSONMember(*parent,"player1")
			If *child
				*player1\keyboardControl=controlJSONImport(GetJSONMember(*child,"keyboard"))
				If GetJSONMember(*child,"joystick")
					*player1\joystickControl=controlJSONImport(GetJSONMember(*child,"joystick"),#Null,#True)
					playerRefreshJoystickMap(*player1)
				Else
					playerResetJoystickToDefault(*player1)
				EndIf
				*player1\jumpWithUp=	loadJSONInteger(*child,"jumpWithUp")
				*player1\directionMode=loadJSONInteger(*child,"directionMode")
				If *player1\directionMode<#H2H_PLAYER_DIRECTION_DYNAMIC Or *player1\directionMode>#H2H_PLAYER_DIRECTION_STATIC_RIGHT
					*player1\directionMode=#H2H_PLAYER_DIRECTION_DEFAULT
				EndIf
			Else
				playerResetKeyboardToDefault(*player1,#Null)
				playerResetJoystickToDefault(*player1)
			EndIf
		EndIf
		If *player2
			*child=GetJSONMember(*parent,"player2")
			If *child
				*player2\keyboardControl=controlJSONImport(GetJSONMember(*child,"keyboard"))
				If GetJSONMember(*child,"joystick")
					*player2\joystickControl=controlJSONImport(GetJSONMember(*child,"joystick"),#Null,#True)
					playerRefreshJoystickMap(*player2)
				Else
					playerResetJoystickToDefault(*player2)
				EndIf
				*player2\jumpWithUp=	loadJSONInteger(*child,"jumpWithUp")
				*player2\directionMode=loadJSONInteger(*child,"directionMode")
				If *player2\directionMode<#H2H_PLAYER_DIRECTION_DYNAMIC Or *player2\directionMode>#H2H_PLAYER_DIRECTION_STATIC_RIGHT
					*player2\directionMode=#H2H_PLAYER_DIRECTION_DEFAULT
				EndIf
			Else
				controlClear(*player2\keyboardControl)
				playerResetKeyboardToDefault(#Null,*player2)
				playerResetJoystickToDefault(*player2)
			EndIf
		EndIf
; 		For i=0 To ArraySize(keyToStringEN$())
; 			Debug "for "+i+" "+keyToStringEN$(i)
; 		Next
		FreeJSON(JSONindex)
		ProcedureReturn 1
	EndIf
	playerResetKeyboardToDefault(*player1,*player2)
	playerResetJoystickToDefault(*player1)
	playerResetJoystickToDefault(*player2)
	ProcedureReturn 0
EndProcedure

Procedure getLastKey()
	For i=0 To ArraySize(keyToString$())
		If keyJustPushed(i)
			ProcedureReturn i
		EndIf
	Next
	ProcedureReturn 0
EndProcedure
#H2H_SETTINGS_LINE_HEIGHT=20

Global inputMode=0
Procedure controlMenu(x.i=0,y.i=0)
	Static currentLine=0
	Static column=0
	Protected *rPlayer.player=*player1
	Protected *lPlayer.player=*player2
	If player1OnTheLeft
		Swap *rPlayer, *lplayer
	EndIf
	If screenSizeX>1300
		x+100
		y+50
	EndIf
	subY=y
	Protected small.i=#False
	Protected bigSize.f=1.5
	Protected bigShift=#H2H_SETTINGS_LINE_HEIGHT*2
	If screenSizeY<800
		small=#True
		bigSize=1.25
		bigShift=#H2H_SETTINGS_LINE_HEIGHT*1.5
	Else
		subY+50
	EndIf
	subY=AfftextColor("       "+UCase(lsGet("SETTINGS_KEYBOARD")),100+x,subY,#Orange,128,1,*font32)+8
	If column=0
		AfftextColor(textPad(" "+lsGet("PLAYER")+" 1 ",21,"="),400+x,subY,#Orange)
		subY=AfftextColor("                       "+textPad(" "+lsGet("PLAYER")+" 2 ",17,"="),400+x,subY,#Gray)
	Else
		AfftextColor(textPad(" "+lsGet("PLAYER")+" 1 ",21,"="),400+x,subY,#Gray)
		subY=AfftextColor("                       "+textPad(" "+lsGet("PLAYER")+" 2 ",17,"="),400+x,subY,#Orange)
	EndIf
	Protected subIndex=0
	For i=0 To #H2H_CONTROL_EXIT
		displayMenuButtonText(100+x,subY,textpad(controlNameLoc(i)),i,currentLine)
		unasigned1=#False
		unasigned2=#False
		If player1OnTheLeft
			p1$=keyToString(controlGet(*player1\keyboardControl,i))
			unasigned1=controlEmpty(*player1\keyboardControl,i)
		Else
			p2$=keyToString(controlGet(*player1\keyboardControl,i))
			unasigned2=controlEmpty(*player1\keyboardControl,i)
		EndIf
		If player1OnTheLeft
			p2$=keyToString(controlGet(*player2\keyboardControl,i))
			unasigned2=controlEmpty(*player2\keyboardControl,i)
		Else
			p1$=keyToString(controlGet(*player2\keyboardControl,i))
			unasigned1=controlEmpty(*player2\keyboardControl,i)
		EndIf
		c1=#White
		c2=#White
		If inputMode And i=currentLine
			c1=RGB(128+127*Bool(column=0),128*Bool(column=0)+127*Bool(column<>0 Or currentLine<>i),255*Bool(column<>0))
			c2=RGB(128+127*Bool(column=1),128*Bool(column=1)+127*Bool(column<>1 Or currentLine<>i),255*Bool(column<>1))
		Else
			c1=RGB(128,128*Bool(column<>0 Or currentLine<>i),128*Bool(column<>0 Or currentLine<>i))
			If unasigned1
				If i<>currentLine Or column<>0
					c1=RGB(Red(c1)/4,Green(c1)/4,Blue(c1)/4)
				Else
					c1=RGB(Red(c1)/2,Green(c1)/2,Blue(c1)/2)
				EndIf
			EndIf
			c2=RGB(128,128*Bool(column<>1 Or currentLine<>i),128*Bool(column<>1 Or currentLine<>i))
			If unasigned2
				If i<>currentLine Or column<>1
					c2=RGB(Red(c2)/4,Green(c2)/4,Blue(c2)/4)
				Else
					c2=RGB(Red(c2)/2,Green(c2)/2,Blue(c2)/2)
				EndIf
			EndIf
		EndIf
		AfftextColor(textPad(p1$,10),x+500,subY,c1)
		AfftextColor(textPad(p2$,10),x+500+250,subY,c2)
		subY+#H2H_SETTINGS_LINE_HEIGHT
	Next
	subIndex=i
	Protected jumpWithUpIndex=subIndex
	displayMenuButtonText(100+x,subY,textPad(lsGet("SETTINGS_KEYBOARD_JUMP_WITH_UP")),subIndex,currentLine)
	If *rPlayer\jumpWithUp
		If column=0 And subIndex=currentLine
			AfftextColor(lsGet("ENABLED"),510+x,subY,#Orange)
		Else
			AfftextColor(lsGet("ENABLED"),510+x,subY,#Gray)
		EndIf
	Else
		If column=0 And subIndex=currentLine
			AfftextColor(lsGet("DISABLED"),510+x,subY,#Orange)
		Else
			AfftextColor(lsGet("DISABLED"),510+x,subY,#Gray)
		EndIf
	EndIf
	If *lPlayer\jumpWithUp
		If column=1 And subIndex=currentLine
			AfftextColor(lsGet("ENABLED"),760+x,subY,#Orange)
		Else
			AfftextColor(lsGet("ENABLED"),760+x,subY,#Gray)
		EndIf
	Else
		If column=1 And subIndex=currentLine
			AfftextColor(lsGet("DISABLED"),760+x,subY,#Orange)
		Else
			AfftextColor(lsGet("DISABLED"),760+x,subY,#Gray)
		EndIf
	EndIf
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	Protected playerDirectionIndex=subIndex
	displayMenuButtonText(100+x,subY,textPad(lsGet("SETTINGS_KEYBOARD_ATTACK_DIRECTION")),subIndex,currentLine)
	Select *lPlayer\directionMode
		Case #H2H_PLAYER_DIRECTION_DYNAMIC
			If column=1 And subIndex=currentLine
				AfftextColor(lsGet("DYNAMIC"),760+x,subY,#Orange)
			Else
				AfftextColor(lsGet("DYNAMIC"),760+x,subY,#Gray)
			EndIf
		Case #H2H_PLAYER_DIRECTION_STATIC_LEFT
			If column=1 And subIndex=currentLine
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_LEFT"),760+x,subY,#Orange)
			Else
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_LEFT"),760+x,subY,#Gray)
			EndIf
		Case #H2H_PLAYER_DIRECTION_STATIC_RIGHT
			If column=1 And subIndex=currentLine
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_RIGHT"),760+x,subY,#Orange)
			Else
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_RIGHT"),760+x,subY,#Gray)
			EndIf
	EndSelect
	Select *rPlayer\directionMode
		Case #H2H_PLAYER_DIRECTION_DYNAMIC
			If column=0 And subIndex=currentLine
				AfftextColor(lsGet("DYNAMIC"),510+x,subY,#Orange)
			Else
				AfftextColor(lsGet("DYNAMIC"),510+x,subY,#Gray)
			EndIf
		Case #H2H_PLAYER_DIRECTION_STATIC_LEFT
			If column=0 And subIndex=currentLine
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_LEFT"),510+x,subY,#Orange)
			Else
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_LEFT"),510+x,subY,#Gray)
			EndIf
		Case #H2H_PLAYER_DIRECTION_STATIC_RIGHT
			If column=0 And subIndex=currentLine
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_RIGHT"),510+x,subY,#Orange)
			Else
				AfftextColor(lsGet("PLAYER_DIRECTION_STATIC_RIGHT"),510+x,subY,#Gray)
			EndIf
	EndSelect
	subIndex+1:subY+bigShift
	Protected keyBoardSwapIndex=subIndex
	displayMenuButtonText(100+x,subY,textPad(lsGet("SETTINGS_KEYBOARD_SWAP")),subIndex,currentLine,0,bigSize)
	subIndex+1:subY+bigShift
	Protected resetIndex=subIndex
	displayMenuButtonText(100+x,subY,textPad(lsGet("RESET_TO_DEFAULT")),subIndex,currentLine,0,bigSize)
	subIndex+1:subY+bigShift
	Protected saveIndex=subIndex
	Protected lastIndex=subIndex
	displayMenuButtonText(100+x,subY,textPad(lsGet("SAVE")),subIndex,currentLine,0,bigSize)
	subY+bigShift
; 	AfftextColor("N.B. The game may mix up AZERTY and QWERTY",120+x,subY,#Gray,128,0.75)

	caught=0
	previousIndex=currentLine
	If inputMode
		last=0
		If lastPushed>0
			last=lastPushed
		EndIf
		If keyToString(last)=lsGet("KEY_ESCAPE")
			inputMode=0
			keyClear()
			psound(#H2H_SOUND_ID_MENUCANCEL)
		EndIf
		If inputMode And last And keyToString(last)<>lsGet("UNASIGNED")
			If keyToString(last)=lsGet("KEY_RETURN")
				last=#H2H_CONTROL_EMPTY
			EndIf
			psound(#H2H_SOUND_ID_MENUACCEPT)
; 			keyClear()
			*p.player=*player1
			If column=1
				*p=*player2
			EndIf
			controlSet(*p\keyboardControl,currentLine,last)
			inputMode=0
		EndIf
	Else
		If Not confirming And (playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or menuAccept())
			If currentLine=resetIndex ; reset to default 
				psound(#H2H_SOUND_ID_MENUACCEPT)
				confirming=#True
				keyClear()
; 				playerClearKey(*player1)
; 				controlClear(*menuControl)
			EndIf
			If currentLine=subIndex
				psound(#H2H_SOUND_ID_MENUACCEPT)
				ProcedureReturn 1
			EndIf
			If currentLine<jumpWithUpIndex ; key set
				psound(#H2H_SOUND_ID_MENUCLIC)
				If inputMode
					inputMode=0
				Else
					inputMode=1
					lastPushed=-1
				EndIf
			EndIf
			If currentLine=playerDirectionIndex
				psound(#H2H_SOUND_ID_MENUCHANGE)
				If column=0
					*rPlayer\directionMode+1
					If *rPlayer\directionMode>#H2H_PLAYER_DIRECTION_STATIC_RIGHT
						*rPlayer\directionMode=#H2H_PLAYER_DIRECTION_DYNAMIC
					EndIf
				Else
					*lPlayer\directionMode+1
					If *lPlayer\directionMode>#H2H_PLAYER_DIRECTION_STATIC_RIGHT
						*lPlayer\directionMode=#H2H_PLAYER_DIRECTION_DYNAMIC
					EndIf
				EndIf
			EndIf
			If currentLine=jumpWithUpIndex
				psound(#H2H_SOUND_ID_MENUCHANGE)
				If column=0
					If *rPlayer\jumpWithUp
						*rPlayer\jumpWithUp=0
					Else
						*rPlayer\jumpWithUp=1
					EndIf
				Else
					If *lPlayer\jumpWithUp
						*lPlayer\jumpWithUp=0
					Else
						*lPlayer\jumpWithUp=1
					EndIf
				EndIf
			EndIf
			If currentLine=keyBoardSwapIndex ; swap controls
				psound(#H2H_SOUND_ID_MENUCHANGE)
				Swap *player1\keyboardControl, *player2\keyboardControl
				Swap *player1\jumpWithUp, *player2\jumpWithUp
			EndIf
		EndIf
	EndIf
	If confirming
		If confirm()
			If confirmWhat
				psound(#H2H_SOUND_ID_MENUACCEPT)
				Debug "reset"
				playerResetKeyboardToDefault(*player1,*player2)
			Else
				psound(#H2H_SOUND_ID_MENUCANCEL)
			EndIf
			confirming=#False
			confirmWhat=#False
			keyClear()
; 			playerClearKey(*player1)
; 			controlClear(*menuControl)
		EndIf
	Else
		If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or menuUp()
			psound(#H2H_SOUND_ID_MENUCLIC)
			currentLine-1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or menuDown()
			psound(#H2H_SOUND_ID_MENUCLIC)
			currentLine+1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft()
			psound(#H2H_SOUND_ID_MENUCLIC)
			column-1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight()
			psound(#H2H_SOUND_ID_MENUCLIC)
			column+1
		EndIf
	EndIf
	If column<0
		column=1
	EndIf
	If column>1
		column=0
	EndIf
	If currentLine<0
		currentLine=subIndex
	EndIf
	If currentLine>subIndex
		currentLine=0
	EndIf
	If inputMode
		blackScreenOpacity=128
		blackScreenDisplay()
		s.s=lsGet("SETTINGS_KEYBOARD_SELECT",currentLanguage,controlNameLoc(currentLine))
		y=AfftextColor(s,max(0,(screenSizeX-AfftextGetLength(s)*2)/2),screenSizeY/2,#Orange,128,1,*font32)
		s=lsGet("SETTINGS_KEYBOARD_CANCEL",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_EXIT)))
		y=AfftextColor(s,max(0,screenSizeX-AfftextGetLength(s))/2,y,#Blue)
		s=lsGet("SETTINGS_KEYBOARD_REMOVE",currentLanguage,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_ACCEPT)))
		y=AfftextColor(s,max(0,screenSizeX-AfftextGetLength(s))/2,y)
	EndIf
	menuTextLoop(deltaGlobal)
	ProcedureReturn 0
EndProcedure

Procedure controllerMenu(x.i=0,y.i=0)
	currentLine=0
	column=0
	loop=ElapsedMilliseconds()+currentMillisecond
	Static selectedInput=0
	caught=0
	delta.d=defaultDelta
	setMovement=0
	Static currentIndex.i=0
	Static currentPlayer=0
	Protected *rPlayer.player=*player1
	Protected *lPlayer.player=*player2
	If player1OnTheLeft
		Swap *rPlayer, *lPlayer
	EndIf
	*currentPlayer.player=*player1
	If currentPlayer=1
		*currentPlayer=*player2
	EndIf
	
	Protected subY=y
	subY=AfftextColor("       "+UCase(lsGet("SETTINGS_CONTROLLER")),100+x,subY,#Orange,128,1,*font32)+8
	If Not confirming
		Protected up=		Bool(playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or menuUp())
		Protected down=		Bool(playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or menuDown())
		Protected left=		Bool(playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft())
		Protected right=	Bool(playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight())
		Protected accept=	Bool(playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or menuAccept() Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True))
		Protected cancel=	Bool(playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or menuCancel() Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True))
		Protected exit=	Bool(playerHasCommand(*player1,#H2H_CONTROL_EXIT,#True) Or menuExit())
	
		If Not inputMode
			If up
				psound(#H2H_SOUND_ID_MENUCLIC)
				currentIndex-1
			Else
				If down
					psound(#H2H_SOUND_ID_MENUCLIC)
					currentIndex+1
				EndIf
			EndIf
		EndIf
		If *player1\joystickId>-1 And *player2\joystickId>-1 And currentIndex<12
			If left Or right
				psound(#H2H_SOUND_ID_MENUCLIC)
				If currentPlayer=0
					*currentPlayer=*player2
					currentPlayer=1
				Else
					currentPlayer=0
					*currentPlayer=*player1
				EndIf
			EndIf
		Else
			If *player1\joystickId>-1
				currentPlayer=0
				*currentPlayer=*player1
			EndIf
			If *player2\joystickId>-1
				currentPlayer=1
				*currentPlayer=*player2
			EndIf
		EndIf
	EndIf
	If *player1\joystickId>-1 Or *player2\joystickId>-1
		If currentIndex<0
			currentIndex=16
		EndIf
		If currentIndex>16
			currentIndex=0
		EndIf
	Else
		If currentIndex<=11
			currentIndex=16
		EndIf
		If currentIndex>16
			currentIndex=12
		EndIf
	EndIf
	previousIndex=currentIndex
	playerJoystickDisplay(*rPlayer,x+700,y,currentIndex+-1000*Bool(*currentPlayer<>*rPlayer))
	playerJoystickDisplay(*lPlayer,x+200,y,currentIndex+-1000*Bool(*currentPlayer<>*lPlayer))
	subY=y+450
	If currentIndex=12
		AfftextColor("=["+textpad(lsGet("SETTINGS_CONTROLLER_RESCAN"))+"]=",x+50,subY,#Orange)
		If accept
			key_joy_temp_deprected=InitJoystick()
; 			detectJoystick()
; 			If nbJoystick>0
; 				*player1\joystickId=0
; 			Else
; 				*player1\joystickId=-1
; 			EndIf
; 			If nbJoystick>1
; 				*player2\joystickId=1
; 			Else
; 				*player2\joystickId=-1
; 			EndIf
			psound(#H2H_SOUND_ID_MENUACCEPT)
		EndIf
	Else
		AfftextColor("  "+lsGet("SETTINGS_CONTROLLER_RESCAN")+"  ",x+50,subY,#White)
	EndIf
	subY+30
	nbJoystick=2;key_joy_temp_deprected ; TODO temporary
	If currentIndex=13
; 		If nbJoystick>0
			AfftextColor("<- "+lsGet("PLAYER")+" 1 ("+lsGet("RIGHT")+") ->",x+50,subY,#Orange)
			previous=*player1\joystickId
			If right
				*player1\joystickId+1
				If *player1\joystickId>=nbJoystick
					*player1\joystickId=-1
				EndIf
; 				Repeat
; 					*player1\joystickId+1
; 					If *player1\joystickId>=nbJoystick
; 						*player1\joystickId=-1
; 					EndIf
; 				Until *player1\joystickId=previous Or (*player1\joystickId<>-1 And IsJoy(*player1\joystickId) And JoyTick(*player1\joystickId))
			EndIf
			If left
				*player1\joystickId-1
				If *player1\joystickId<-1
					*player1\joystickId=nbJoystick-1
				EndIf
; 				Repeat
; 					*player1\joystickId-1
; 					If *player1\joystickId<-1
; 						*player1\joystickId=nbJoystick-1
; 					EndIf
; 				Until *player1\joystickId=previous Or (*player1\joystickId<>-1 And IsJoy(*player1\joystickId) And JoyTick(*player1\joystickId))
			EndIf
			If previous<>*player1\joystickId
				psound(#H2H_SOUND_ID_MENUCHANGE)
			EndIf
			If *player1\joystickId>-1
; 				AfftextColor("["+*player1\joystickId+"] "+JoystickName(*player1\joystickId),x+350,subY,#Orange)
				AfftextColor("["+Str(1+*player1\joystickId)+"] Controller",x+350,subY,#Orange)
			Else
				AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
			EndIf
; 		Else
; 			AfftextColor("   "+lsGet("PLAYER")+" 1 ("+lsGet("RIGHT")+")   ",x+50,subY,#Orange)
; 			AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
; 		EndIf
	Else
		AfftextColor("   "+lsGet("PLAYER")+" 1 ("+lsGet("RIGHT")+")   ",x+50,subY,#White)
		If *player1\joystickId>-1
; 			AfftextColor("["+*player1\joystickId+"] "+JoystickName(*player1\joystickId),x+350,subY,#White)
			AfftextColor("["+Str(1+*player1\joystickId)+"] Controller",x+350,subY,#White)
		Else
			AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
		EndIf
	EndIf
	subY+30
	If currentIndex=14
; 		If nbJoystick>0
			AfftextColor("<- "+lsGet("PLAYER")+" 2 ("+lsGet("LEFT")+") ->",x+50,subY,#Orange)
			previous=*player2\joystickId
			If right
				*player2\joystickId+1
				If *player2\joystickId>=nbJoystick
					*player2\joystickId=-1
				EndIf
			EndIf
			If left
				*player2\joystickId-1
				If *player2\joystickId<-1
					*player2\joystickId=nbJoystick-1
				EndIf
			EndIf
			If previous<>*player2\joystickId
				psound(#H2H_SOUND_ID_MENUCHANGE)
			EndIf
; 			If accept
; 				*player2\joystickId=-1
; 			EndIf
			If *player2\joystickId>-1
; 				AfftextColor("["+*player2\joystickId+"] "+JoystickName(*player2\joystickId),x+350,subY,#Orange)
				AfftextColor("["+Str(1+*player2\joystickId)+"] Controller",x+350,subY,#Orange)
			Else
				AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
			EndIf
; 		Else
; 			AfftextColor("   "+lsGet("PLAYER")+" 2 ("+lsGet("LEFT")+")   ",x+50,subY,#Orange)
; 			If *player2\joystickId>-1
; 				AfftextColor("["+Str(1+*player2\joystickId)+"] Controller",x+350,subY,#Orange)
; 			Else
; 				AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
; 			EndIf
; 		EndIf
	Else
		AfftextColor("   "+lsGet("PLAYER")+" 2 ("+lsGet("LEFT")+")   ",x+50,subY,#White)
		If *player2\joystickId>-1
; 			AfftextColor("["+*player2\joystickId+"] "+JoystickName(*player2\joystickId),x+350,subY,#White)
			AfftextColor("["+Str(1+*player2\joystickId)+"] Controller",x+350,subY,#White)
		Else
			AfftextColor(lsGet("NONE"),x+350,subY,#Gray)
		EndIf
	EndIf
	subY+30
	If currentIndex=15
		AfftextColor("=["+lsGet("RESET_TO_DEFAULT")+"]=",x+50,subY,#Orange)
		If accept
			psound(#H2H_SOUND_ID_MENUACCEPT)
			confirming=#True
			keyClear()
; 			playerClearKey(*player1)
; 			controlClear(*menuControl)
		EndIf
	Else
		AfftextColor("  "+lsGet("RESET_TO_DEFAULT")+"  ",x+50,subY,#White)
	EndIf
	subY+30
	If currentIndex=16
		AfftextColor("=["+lsGet("SAVE_AND_RETURN")+"]=",x+50,subY,#Orange)
		If accept
			psound(#H2H_SOUND_ID_MENUACCEPT)
			ProcedureReturn 1
		EndIf
	Else
		AfftextColor("  "+lsGet("SAVE_AND_RETURN")+"  ",x+50,subY,#White)
	EndIf
	If currentIndex<=11
		If *rPlayer\joystickId>-1 And *currentPlayer=*rPlayer
			If *rPlayer\joystickMap(currentIndex)
; 				AfftextColor(joystickButtonName$(currentIndex)+" : "+joystickActionName$(*player1\joystickMap(currentIndex)),x+700,y+100)
				AfftextColor(controllerButtonName(currentIndex)+" : "+controlNameLoc(*rPlayer\joystickMap(currentIndex)),x+700,y+100)
			Else
				AfftextColor(controllerButtonName(currentIndex)+" "+lsGet("UNASIGNED"),x+700,y+100,#Gray)
			EndIf
		EndIf
		If *lPlayer\joystickId>-1 And *currentPlayer=*lPlayer
			If *lPlayer\joystickMap(currentIndex)
				AfftextColor(controllerButtonName(currentIndex)+" : "+controlNameLoc(*lPlayer\joystickMap(currentIndex)),x+100,y+100)
			Else
				AfftextColor(controllerButtonName(currentIndex)+" "+lsGet("UNASIGNED"),x+100,y+100,#Gray)
			EndIf
		EndIf
		If accept
			If inputMode=0
				inputMode=1
; 				Debug "enable"
				selectedInput=*currentPlayer\joystickMap(currentIndex)
				psound(#H2H_SOUND_ID_MENUACCEPT)
			Else
; 				Debug "disable"
				playerJoystickSet(*currentPlayer,currentIndex,selectedInput)
				psound(#H2H_SOUND_ID_MENUACCEPT)
				inputMode=0
			EndIf
		EndIf
		If inputMode
			subX=550+Bool(*currentPlayer=*player1)*500
			subY=100
			subX2=subX+200
			subY2=subY
			other$=keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ACCEPT))
			If *player1\joystickId>-1
				
			EndIf
			AfftextColor(lsGet("SETTINGS_CONTROLLER_HINT",-1,keyToString(controlget(*menuControlKeys,#H2H_CONTROL_ACCEPT)),keyToString(controlget(*menuControlKeys,#H2H_CONTROL_EXIT))),subX,subY-60,#Gray,128,0.75)
			If setMovement
				AfftextColor(lsGet("SETTINGS_CONTROLLER_HINT"),subX,subY-20,#Gray,128,0.75)
			EndIf
; 			If currentIndex=#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT Or currentIndex=#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
; 					setMovement=1 ; might enable it later
; 			EndIf
			If exit
; 				Debug "cancel"
				inputMode=0
				setMovement=0
				psound(#H2H_SOUND_ID_MENUCANCEL)
			Else
				If down
					selectedInput+1
					If selectedInput>ArraySize(controlNameLoc())
						selectedInput=0
					EndIf
					psound(#H2H_SOUND_ID_MENUCHANGE)
; 					If Not setMovement;currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
; 						If selectedInput<4 And selectedInput>0
; 							selectedInput=4
; 						EndIf
; 					EndIf
				EndIf
				If up
					selectedInput-1
					If selectedInput<0
						selectedInput=#H2H_CONTROL_EXIT
; 					Else
; 						If Not setMovement And selectedInput<4 And selectedInput>0;currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
; 							selectedInput=0
; 						EndIf
					EndIf
					psound(#H2H_SOUND_ID_MENUCHANGE)
				EndIf
				For i=0 To #H2H_CONTROL_EXIT
					If currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
; 						If i<>#H2H_ACTION_MOVEMENT And i<>#H2H_ACTION_MOVEMENT_COMBAT And i<>#H2H_ACTION_MOVEMENT_MENU
							If i=selectedInput
								AfftextColor(controlNameLoc(i),subX,subY,#Orange,128,0.75)
							Else
								AfftextColor(controlNameLoc(i),subX,subY,#White,128,0.75)
							EndIf
							subY+12
; 						EndIf
					Else
; 						If i<>#H2H_ACTION_MOVEMENT And i<>#H2H_ACTION_MOVEMENT_COMBAT And i<>#H2H_ACTION_MOVEMENT_MENU
							If i=selectedInput
								AfftextColor(controlNameLoc(i),subX,subY,#Orange,128,0.75)
							Else
								AfftextColor(controlNameLoc(i),subX,subY,#White,128,0.75)
							EndIf
							subY+12
; 						Else
; 							If setMovement
; 								If i=selectedInput
; 									AfftextColor(controlName(i),subX2,subY2,#Orange,128,0.75)
; 								Else
; 									AfftextColor(controlName(i),subX2,subY2,#White,128,0.75)
; 								EndIf
; 								subY2+12
; 							EndIf
; 						EndIf
					EndIf
				Next
			EndIf
		EndIf
	EndIf
	If confirming
; 		Debug "confirming check"
		If confirm()
			If confirmWhat
				psound(#H2H_SOUND_ID_MENUACCEPT)
				playerResetJoystickToDefault(*player1)
				playerResetJoystickToDefault(*player2)
			Else
				psound(#H2H_SOUND_ID_MENUCANCEL)
			EndIf
 			keyClear()
; 			playerClearKey(*player1)
; 			controlClear(*menuControl)
			confirming=#False
			confirmWhat=#False
		EndIf
	EndIf
	menuTextLoop(deltaGlobal)
	ProcedureReturn 0
EndProcedure

Enumeration 0
	#H2H_MENU_SETTINGS_SOUND_VOLUME
	#H2H_MENU_SETTINGS_MUSIC_VOLUME
	#H2H_MENU_SETTINGS_SOUND_STEREO
	#H2H_MENU_SETTINGS_SOUND_VARIATION

	#H2H_MENU_SETTINGS_PLAYER_SWAP
	#H2H_MENU_SETTINGS_PLAYER_COLOR
	#H2H_MENU_SETTINGS_COMBO_DISPLAY
	#H2H_MENU_SETTINGS_WIND_DISPLAY
	#H2H_MENU_SETTINGS_PARTICLE_DISPLAY
	#H2H_MENU_SETTINGS_ATTACK_DELAY
	#H2H_MENU_SETTINGS_SCREEN_SHAKE
	#H2H_MENU_SETTINGS_ROUNDS
	#H2H_MENU_SETTINGS_ROUNDS_LENGTH

	#H2H_MENU_SETTINGS_PERFORMANCE
	#H2H_MENU_SETTINGS_REFRESH_RATE
	#H2H_MENU_SETTINGS_SHOW_FPS
	#H2H_MENU_SETTINGS_SCREEN_SIZE
	#H2H_MENU_SETTINGS_FULLSCREEN
	#H2H_MENU_SETTINGS_LANGUAGE

	#H2H_MENU_SETTINGS_DEBUG_MODE
	#H2H_MENU_SETTINGS_KEYBOARD_TYPE
	#H2H_MENU_SETTINGS_KEYBOARD
	#H2H_MENU_SETTINGS_CONTROLLER
	#H2H_MENU_SETTINGS_RESET
	#H2H_MENU_SETTINGS_SAVE_AND_EXIT
EndEnumeration

Procedure optionMenu(x.i=0,y.i=0)
	Static index=#H2H_MENU_SETTINGS_SOUND_VOLUME
	up=0
	down=0
	right=0
	left=0
	accept=0

	previousIndex=index
	If Not confirming
		If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft()
			left=1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight()
			right=1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or menuAccept() Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
			accept=1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or menuUp()
			index-1
		EndIf
		If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or menuDown()
			index+1
		EndIf
	EndIf
	If index<#H2H_MENU_SETTINGS_SOUND_VOLUME
		index=#H2H_MENU_SETTINGS_SAVE_AND_EXIT
	EndIf
	If index>#H2H_MENU_SETTINGS_SAVE_AND_EXIT
		index=#H2H_MENU_SETTINGS_SOUND_VOLUME
	EndIf
	rightPosition=screenSizeX
	leftPosition=0
	If stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
		leftPosition=rightPosition/4
		rightPosition-rightPosition/4
	EndIf
	If stereoWidth=#H2H_SOUND_STEREO_NONE_WIDTH
		rightPosition/2
		leftPosition=rightPosition
	EndIf

	If screenSizeX>1300
		x+100
		y+50
	EndIf
	;{ List
	subY=y
	subY=AfftextColor("       "+UCase(lsGet("MENU_SETTINGS")),x,subY,#Orange,128,1,*font32)+8
	subX=x+425
	Protected small.i=#False
	Protected bigSize.f=1.5
	Protected bigShift=#H2H_SETTINGS_LINE_HEIGHT
	If screenSizeY<800
		small=#True
		bigSize=1.25
		bigShift=#H2H_SETTINGS_LINE_HEIGHT/2
	Else
		subY+50
	EndIf
	descX=x+100;
	descY=subY+(#H2H_MENU_SETTINGS_SAVE_AND_EXIT+1)*#H2H_SETTINGS_LINE_HEIGHT+bigShift*5
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PLAYER_COLOR*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_PLAYER_COLOR"),20),#H2H_MENU_SETTINGS_PLAYER_COLOR,index)
	s.s=""
	Select playerColorMode
		Case #H2H_PLAYER_COLOR_MODE_ADAPTATIVE
			s=lsGet("SETTINGS_PLAYER_COLOR_ADAPTATIVE")
		Case #H2H_PLAYER_COLOR_MODE_ALTERNATIVE
			s=lsGet("SETTINGS_PLAYER_COLOR_ALTERNATIVE")
		Case #H2H_PLAYER_COLOR_MODE_BASIC
			s=lsGet("SETTINGS_PLAYER_COLOR_BASIC")
		Case #H2H_PLAYER_COLOR_MODE_CONTRAST
			s=lsGet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST")
	EndSelect
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PLAYER_COLOR))
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_DEFAULT
		AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,#Blue)
	EndIf
	If index=#H2H_MENU_SETTINGS_PLAYER_COLOR
		If right Or accept
			playerColorMode+1
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left 
			playerColorMode-1
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
		If playerColorMode<#H2H_PLAYER_COLOR_MODE_ADAPTATIVE
			playerColorMode=#H2H_PLAYER_COLOR_MODE_CONTRAST
		EndIf
		If playerColorMode>#H2H_PLAYER_COLOR_MODE_CONTRAST
			playerColorMode=#H2H_PLAYER_COLOR_MODE_ADAPTATIVE
		EndIf
		Select playerColorMode
			Case #H2H_PLAYER_COLOR_MODE_ADAPTATIVE
				AfftextBloc(lsGet("SETTINGS_PLAYER_COLOR_ADAPTATIVE_DESC"),descX,descY,screenSizeX-200,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_ALTERNATIVE
				AfftextBloc(lsGet("SETTINGS_PLAYER_COLOR_ALTERNATIVE_DESC"),descX,descY,screenSizeX-200,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_BASIC
				AfftextBloc(lsGet("SETTINGS_PLAYER_COLOR_BASIC_DESC"),descX,descY,screenSizeX-200,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_CONTRAST
				AfftextBloc(lsGet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST_DESC"),descX,descY,screenSizeX-200,#Blue)
		EndSelect
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PLAYER_SWAP*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_PLAYER_SWAP"),20),#H2H_MENU_SETTINGS_PLAYER_SWAP,index)
	s.s=""
	If player1OnTheLeft
		s=lsGet("LEFT")
	Else
		s=lsGet("RIGHT")
	EndIf
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PLAYER_SWAP))
 	If player1OnTheLeft=#H2H_PLAYER_ONE_ON_THE_LEFT
 		AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,#Blue)
 	EndIf
	If index=#H2H_MENU_SETTINGS_PLAYER_SWAP
		If right Or accept Or left
			player1OnTheLeft=Bool(Not player1OnTheLeft)
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
	EndIf
	;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_VOLUME*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SOUND_LEVEL"),20),#H2H_MENU_SETTINGS_SOUND_VOLUME,index)
	AfftextColor(Str(soundlevel),subX-AfftextGetLength(Str(soundlevel)),tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SOUND_VOLUME))
	classDisplayLevel(soundlevel/10,subX+25,tmpY,-1,#False,0.25)
	If index=#H2H_MENU_SETTINGS_SOUND_VOLUME
		If right
			soundlevel+10
			If soundlevel>100
				soundlevel=100
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
; 				SoundSetLevel(soundlevel)
			EndIf
		Else
			If left
				soundlevel-10
				If soundlevel<0
					soundlevel=0
				Else
					psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
; 					SoundSetLevel(soundlevel)
				EndIf
			EndIf
		EndIf
	EndIf
	;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_MUSIC_VOLUME*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_MUSIC_LEVEL"),20),#H2H_MENU_SETTINGS_MUSIC_VOLUME,index)
	AfftextColor(Str(musicLevel),subX-AfftextGetLength(Str(musicLevel)),tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_MUSIC_VOLUME))
	classDisplayLevel(musicLevel/10,subX+25,tmpY,-1,#False,0.25)
	If index=#H2H_MENU_SETTINGS_MUSIC_VOLUME
		If right
			If musicLevel<=0
				musicExPlay(*allMusic(Str(#H2H_MUSIC_MENU)))
			EndIf
			musicLevel+10
			If musicLevel>100
				musicLevel=100
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
				musicLevelRefresh()
			EndIf
		Else
			If left
				musicLevel-10
				If musicLevel<0
					musicLevel=0
				Else
					musicLevelRefresh()
					psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
				EndIf
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_STEREO*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SOUND_STEREO"),20),#H2H_MENU_SETTINGS_SOUND_STEREO,index)
	Select stereoWidth
		Case SOUND_STEREO_DEFAULT_WIDTH
			AfftextColor(lsGet("SETTINGS_SOUND_STEREO_COMPLETE"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SOUND_STEREO))
			AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(lsGet("SETTINGS_SOUND_STEREO_COMPLETE"))+*font16\charSizeX,tmpY,RGB(0,0,255))
		Case SOUND_STEREO_SMALL_WIDTH
			AfftextColor(lsGet("REDUCED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SOUND_STEREO))
		Case SOUND_STEREO_NONE_WIDTH
			AfftextColor(lsGet("NONE"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SOUND_STEREO))
	EndSelect
	If index=#H2H_MENU_SETTINGS_SOUND_STEREO
		If right Or accept
			b=0
			If stereoWidth=SOUND_STEREO_SMALL_WIDTH
				b=1
				stereoWidth=SOUND_STEREO_DEFAULT_WIDTH
			EndIf
			If stereoWidth=SOUND_STEREO_NONE_WIDTH
				b=1
				stereoWidth=SOUND_STEREO_SMALL_WIDTH
			EndIf
			If left<>1 And b
				psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
			EndIf
			Debug "switched to "+stereoWidth
		EndIf
		If left
			b=0
			If stereoWidth=SOUND_STEREO_SMALL_WIDTH
				b=1
				stereoWidth=SOUND_STEREO_NONE_WIDTH
			EndIf
			If stereoWidth=SOUND_STEREO_DEFAULT_WIDTH
				b=1
				stereoWidth=SOUND_STEREO_SMALL_WIDTH
			EndIf
			If right<>1 And b
				psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
			EndIf
			Debug "switched to "+stereoWidth
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_VARIATION*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SOUND_VARIATION"),20),#H2H_MENU_SETTINGS_SOUND_VARIATION,index)
	s=""
	If soundVariationEnabled
		s=lsGet("ENABLED")
	Else
		s=lsGet("DISABLED")
	EndIf
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SOUND_VARIATION))
	If soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT
		AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_SOUND_VARIATION
		If right Or left Or accept
			If soundVariationEnabled
				soundVariationEnabled=0
			Else
				soundVariationEnabled=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
		AfftextBloc(lsGet("SETTINGS_SOUND_VARIATION_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_KEYBOARD_TYPE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_KEYBOARD_TYPE"),20),#H2H_MENU_SETTINGS_KEYBOARD_TYPE,index)
	If keyboardType
		AfftextColor("AZERTY",subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_KEYBOARD_TYPE))
	Else 
		AfftextColor("QWERTY",subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_KEYBOARD_TYPE))
	EndIf
	If index=#H2H_MENU_SETTINGS_KEYBOARD_TYPE
		If right Or left Or accept
			keyboardType=Bool(Not keyboardType)
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_COMBO_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_COMBO_DISPLAY"),20),#H2H_MENU_SETTINGS_COMBO_DISPLAY,index)
	s=""
	Select comboDisplayMode
		Case #H2H_COMBO_DISPLAY_BIG
			s=lsGet("SETTINGS_COMBO_DISPLAY_BIG")
		Case #H2H_COMBO_DISPLAY_SMALL
			s=lsGet("SETTINGS_COMBO_DISPLAY_SMALL")
		Case #H2H_COMBO_DISPLAY_NONE
			s=lsGet("DISABLED")
	EndSelect
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_COMBO_DISPLAY))
	If comboDisplayMode=#H2H_COMBO_DISPLAY_DEFAULT
		AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_COMBO_DISPLAY
		If right
			comboDisplayMode+1
			If comboDisplayMode>#H2H_COMBO_DISPLAY_NONE
				comboDisplayMode=#H2H_COMBO_DISPLAY_NONE
			Else
				If left<>1
					psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
				EndIf
			EndIf
		EndIf
		If left
			comboDisplayMode-1
			If comboDisplayMode<#H2H_COMBO_DISPLAY_BIG
				comboDisplayMode=#H2H_COMBO_DISPLAY_BIG
			Else
				If right<>1
					psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
				EndIf
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_WIND_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_WIND_DISPLAY"),20),#H2H_MENU_SETTINGS_WIND_DISPLAY,index)
	s=""
	Select windEnabled
		Case #H2H_FRAME_WIND_MODE_ENABLED
			s=lsGet("ENABLED")
		Case #H2H_FRAME_WIND_MODE_HALVED
			s=lsGet("REDUCED")
		Case #H2H_FRAME_WIND_MODE_ONLY_ACTIVE
			s=lsGet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY")
		Case #H2H_FRAME_WIND_MODE_HALVED_NONACTIVE
			s=lsGet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE")
		Case #H2H_FRAME_WIND_MODE_DISABLED
			s=lsGet("DISABLED")
	EndSelect
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_WIND_DISPLAY))
	If index=#H2H_MENU_SETTINGS_WIND_DISPLAY
		If windEnabled=#H2H_FRAME_WIND_ENABLED_DEFAULT
			AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,RGB(0,0,255))
		EndIf
		s=""
		Select windEnabled
			Case #H2H_FRAME_WIND_MODE_HALVED
				s=lsGet("SETTINGS_WIND_DISPLAY_REDUCED_DESC")
			Case #H2H_FRAME_WIND_MODE_HALVED_NONACTIVE
				s=lsGet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE_DESC")
			Case #H2H_FRAME_WIND_MODE_ONLY_ACTIVE
				s=lsGet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY_DESC")
		EndSelect
		If windEnabled=#H2H_FRAME_WIND_MODE_DISABLED
			AfftextBloc(s,descX,descY,screenSizeX-200,RGB(0,0,255))
		Else
			AfftextColor(lsGet("PERFORMANCE_SQUEEZE"),descX,descY,RGB(0,0,255))
			AfftextBloc(s,descX,descY+#CHAR_SIZE_Y,screenSizeX-200,RGB(0,0,255))
		EndIf
		If right Or accept
			windEnabled+1
			If windEnabled>#H2H_FRAME_WIND_MODE_ENABLED
				windEnabled=#H2H_FRAME_WIND_MODE_DISABLED
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			windEnabled-1
			If windEnabled<#H2H_FRAME_WIND_MODE_DISABLED
				windEnabled=#H2H_FRAME_WIND_MODE_ENABLED
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PARTICLE_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_PARTICLE_DISPLAY"),20),#H2H_MENU_SETTINGS_PARTICLE_DISPLAY,index)
	If particleEnabled
		AfftextColor(lsGet("ENABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PARTICLE_DISPLAY))
	Else
		AfftextColor(lsGet("DISABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PARTICLE_DISPLAY))
	EndIf
	If index=#H2H_MENU_SETTINGS_PARTICLE_DISPLAY
		AfftextColor(lsGet("PERFORMANCE_SQUEEZE"),descX,descY,RGB(0,0,255))
		If right Or left Or accept
			If particleEnabled
				particleEnabled=0
			Else
				particleEnabled=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_ATTACK_DELAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_ATTACK_DELAY"),20),#H2H_MENU_SETTINGS_ATTACK_DELAY,index)
	s=""
	Select attackDelayMode
		Case #H2H_DELTA_DELAY_MODE_OFF
			s=lsGet("DISABLED")
		Case #H2H_DELTA_DELAY_MODE_FIX
			s=lsGet("SETTINGS_ATTACK_DELAY_FIX")
		Case #H2H_DELTA_DELAY_MODE_RELATIVE
			s=lsGet("SETTINGS_ATTACK_DELAY_RELATIVE")
	EndSelect
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_ATTACK_DELAY))
	If index=#H2H_MENU_SETTINGS_ATTACK_DELAY
		s=""
		Select attackDelayMode
			Case #H2H_DELTA_DELAY_MODE_FIX
				s=lsGet("SETTINGS_ATTACK_DELAY_FIX_DESC")
			Case #H2H_DELTA_DELAY_MODE_RELATIVE
				s=lsGet("SETTINGS_ATTACK_DELAY_RELATIVE_DESC")
		EndSelect
		AfftextBloc(s,descX,descY,screenSizeX-200,RGB(0,0,255))
		If right Or accept
			Select attackDelayMode
				Case #H2H_DELTA_DELAY_MODE_OFF
					attackDelayMode=#H2H_DELTA_DELAY_MODE_FIX
				Case #H2H_DELTA_DELAY_MODE_FIX
					attackDelayMode=#H2H_DELTA_DELAY_MODE_RELATIVE
				Case #H2H_DELTA_DELAY_MODE_RELATIVE
					attackDelayMode=#H2H_DELTA_DELAY_MODE_OFF
			EndSelect
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			Select attackDelayMode
				Case #H2H_DELTA_DELAY_MODE_OFF
					attackDelayMode=#H2H_DELTA_DELAY_MODE_RELATIVE
				Case #H2H_DELTA_DELAY_MODE_FIX
					attackDelayMode=#H2H_DELTA_DELAY_MODE_OFF
				Case #H2H_DELTA_DELAY_MODE_RELATIVE
					attackDelayMode=#H2H_DELTA_DELAY_MODE_FIX
			EndSelect
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SCREEN_SHAKE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SCREEN_SHAKE"),20),#H2H_MENU_SETTINGS_SCREEN_SHAKE,index)
	s=""
	Select screenShakeMode
		Case #H2H_SCREEN_SHAKE_NONE
			s=lsGet("DISABLED")
		Case #H2H_SCREEN_SHAKE_LOW
			s=lsGet("SETTINGS_SCREEN_SHAKE_LOW")
		Case #H2H_SCREEN_SHAKE_NORMAL
			s=lsGet("SETTINGS_SCREEN_SHAKE_NORMAL")
		Case #H2H_SCREEN_SHAKE_HIGH
			s=lsGet("SETTINGS_SCREEN_SHAKE_HIGH")
	EndSelect
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SCREEN_SHAKE))
	If index=#H2H_MENU_SETTINGS_SCREEN_SHAKE
		AfftextBloc(lsGet("SETTINGS_SCREEN_SHAKE_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
		If screenShakeMode=#H2H_SCREEN_SHAKE_DEFAULT
			AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,#Blue,128)
		EndIf
		If right Or accept
			screenShakeMode+1
			If screenShakeMode>#H2H_SCREEN_SHAKE_HIGH
				screenShakeMode=#H2H_SCREEN_SHAKE_NONE
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			screenShakeMode-1
			If screenShakeMode<#H2H_SCREEN_SHAKE_NONE
				screenShakeMode=#H2H_SCREEN_SHAKE_HIGH
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
		screenShakeModeSet(screenShakeMode)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_ROUNDS*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_ROUND_NUMBER"),20),#H2H_MENU_SETTINGS_ROUNDS,index)
	s=lsGet("SETTINGS_ROUND_NUMBER_BEST_OF")+" "+maxRound
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_ROUNDS))
	If index=#H2H_MENU_SETTINGS_ROUNDS
		AfftextBloc(lsGet("SETTINGS_ROUND_NUMBER_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
		If maxRound=#H2H_ROUND_BASE
			AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,#Blue,128)
		EndIf
		If right Or accept
			maxRound+2
			If maxRound>#H2H_ROUND_MAX
				maxRound=#H2H_ROUND_MAX
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
			EndIf
		EndIf
		If left
			maxRound-2
			If maxRound<#H2H_ROUND_MIN
				maxRound=#H2H_ROUND_MIN
			Else
				psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_ROUNDS_LENGTH*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_ROUND_DURATION"),20),#H2H_MENU_SETTINGS_ROUNDS_LENGTH,index)
	If roundLength=0
		s=lsGet("INFINITE")
	Else
		s=lsGet("SECONDS",currentLanguage,Str(roundLength))
	EndIf
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_ROUNDS_LENGTH))
	If index=#H2H_MENU_SETTINGS_ROUNDS_LENGTH
		If roundLength=#H2H_ROUND_LENGTH
			AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,#Blue,128)
		EndIf
		If right Or accept
			roundLength+#H2H_ROUND_LENGTH_STEP
			If roundLength>#H2H_ROUND_LENGTH_MAX
				roundLength=0
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			roundLength-#H2H_ROUND_LENGTH_STEP
			If roundLength<0
				roundLength=#H2H_ROUND_LENGTH_MAX
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PERFORMANCE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_PERFORMANCE"),20),#H2H_MENU_SETTINGS_PERFORMANCE,index)
	If index=#H2H_MENU_SETTINGS_PERFORMANCE
		If buffedFrames=#H2H_FRAME_BUFFER_ON
			AfftextBloc(lsGet("SETTINGS_PERFORMANCE_LOAD_FAST_DESC"),descX,descY,screenSizeX-200,#Blue)
		Else
			AfftextBloc(lsGet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING_DESC"),descX,descY,screenSizeX-200,#Blue)
		EndIf
		If right Or left Or accept
			If buffedFrames=#H2H_FRAME_BUFFER_ON
				buffedFrames=#H2H_FRAME_BUFFER_OFF
			Else
				buffedFrames=#H2H_FRAME_BUFFER_ON
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
	If buffedFrames=#H2H_FRAME_BUFFER_ON
		AfftextColor(lsGet("SETTINGS_PERFORMANCE_LOAD_FAST"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PERFORMANCE))
	Else
		AfftextColor(lsGet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_PERFORMANCE))
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_REFRESH_RATE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_REFRESH_RATE"),20),#H2H_MENU_SETTINGS_REFRESH_RATE,index)
	s=Str(fpsMode(currentFPSMode))+" "+lsGet("FPS")
	AfftextColor(s,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_REFRESH_RATE))
	If currentFPSMode=#H2H_FPS_MODE_DEFAULT
		AfftextColor(lsGet("DEFAULT"),subX+AfftextGetLength(s)+*font16\charSizeX,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_REFRESH_RATE
		If right
			If currentFPSMode<ArraySize(fpsMode())
				If Not left
					psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
				EndIf
				currentFPSMode+1
				;fpsModeChange(currentFPSMode)
			EndIf
		EndIf
		If left
			If currentFPSMode>1
				If Not right
					psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
				EndIf
				currentFPSMode-1
				;fpsModeChange(currentFPSMode)
			EndIf
		EndIf
		If fpsMode(currentFPSMode)<70
			AfftextBloc(lsGet("SETTINGS_REFRESH_RATE_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SHOW_FPS*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_FPS_DISPLAY"),20),#H2H_MENU_SETTINGS_SHOW_FPS,index)
	If showFPS
		AfftextColor(lsGet("ENABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SHOW_FPS))
	Else
		AfftextColor(lsGet("DISABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SHOW_FPS))
	EndIf
	If index=#H2H_MENU_SETTINGS_SHOW_FPS
		AfftextBloc(lsGet("SETTINGS_FPS_DISPLAY_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
		If right Or left
			If showFPS
				showFPS=0
			Else
				showFPS=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SCREEN_SIZE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SCREEN_RESOLUTION"),20),#H2H_MENU_SETTINGS_SCREEN_SIZE,index)
	AfftextColor(Str(*screenType(selectedTypeTmp)\x)+"x"+Str(*screenType(selectedTypeTmp)\y),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_SCREEN_SIZE))
	If index=#H2H_MENU_SETTINGS_SCREEN_SIZE
; 		AfftextColor(lsGet("SETTINGS_SCREEN_RESOLUTION_DESC"),subX+350-(Bool(screenSizeX<1500)*200),tmpY+#H2H_SETTINGS_LINE_HEIGHT,RGB(0,0,255))
		AfftextBloc(lsGet("SETTINGS_SCREEN_RESOLUTION_DESC"),descX,descY,screenSizeX-200,RGB(0,0,255))
		If screenSizeX=1920 And screenSizeY=1080
			AfftextColor(lsGet("SETTINGS_SCREEN_RESOLUTION_BIG"),descX,descY+#CHAR_SIZE_Y,RGB(255,128,0))
		EndIf
		If screenSizeX=1280 And screenSizeY=720
			AfftextColor(lsGet("SETTINGS_SCREEN_RESOLUTION_SMALL"),descX,descY+#CHAR_SIZE_Y,RGB(255,128,0))
		EndIf
		If right Or accept
			selectedTypeTmp+1
			If selectedTypeTmp>ArraySize(*screenType()) Or Not *screenType(selectedTypeTmp)
				selectedTypeTmp=0
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			selectedTypeTmp-1
			If selectedTypeTmp<0
				selectedTypeTmp=ArraySize(*screenType())
				While Not *screenType(selectedTypeTmp)
					selectedTypeTmp-1
				Wend
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_FULLSCREEN*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_SCREEN_FULL"),20),#H2H_MENU_SETTINGS_FULLSCREEN,index)
	If fullscreenTmp
		AfftextColor(lsGet("ENABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_FULLSCREEN))
	Else
		AfftextColor(lsGet("DISABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_FULLSCREEN))
	EndIf
	If index=#H2H_MENU_SETTINGS_FULLSCREEN
		If right Or left Or accept
			fullscreenTmp=Bool(Not fullscreenTmp)
; 			changeScreen(*screenType(selectedTypeTmp)\x,*screenType(selectedTypeTmp)\y)
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
		AfftextBloc(lsGet("SETTINGS_SCREEN_FULL_DESC"),descX,descY,screenSizeX-200,#Orange)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_LANGUAGE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_LANGUAGE"),20),#H2H_MENU_SETTINGS_LANGUAGE,index)
	If index=#H2H_MENU_SETTINGS_LANGUAGE
		Select *allLanguages(currentLanguage)\support
			Case #H2H_LANGUAGE_SUPPORT_FULL
				AfftextColor(*allLanguages(currentLanguage)\name,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_LANGUAGE))
			Case #H2H_LANGUAGE_SUPPORT_PARTIAL
				AfftextColor(*allLanguages(currentLanguage)\name+" (partial support)",subX,tmpY,#Blue)
			Case #H2H_LANGUAGE_SUPPORT_NONE
				AfftextColor(*allLanguages(currentLanguage)\name+" (no support)",subX,tmpY,RGB(64,64,64),128)
		EndSelect
		If right Or accept
			currentLanguage+1
			If currentLanguage>ArraySize(*allLanguages())
				currentLanguage=0
			EndIf
			lsRefresh()
			psound(#H2H_SOUND_ID_MENUCHANGE,rightPosition)
		EndIf
		If left
			currentLanguage-1
			If currentLanguage<0
				currentLanguage=ArraySize(*allLanguages())
			EndIf
			lsRefresh()
			psound(#H2H_SOUND_ID_MENUCHANGE,leftPosition)
		EndIf
	Else
		Select *allLanguages(currentLanguage)\support
			Case #H2H_LANGUAGE_SUPPORT_FULL
				AfftextColor(*allLanguages(currentLanguage)\name,subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_LANGUAGE))
			Case #H2H_LANGUAGE_SUPPORT_PARTIAL
				AfftextColor(*allLanguages(currentLanguage)\name+" (partial support)",subX,tmpY,colorLerp(#Blue,#Gray))
			Case #H2H_LANGUAGE_SUPPORT_NONE
				AfftextColor(*allLanguages(currentLanguage)\name+" (no support)",subX,tmpY,RGB(32,32,32),128)
		EndSelect
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_DEBUG_MODE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_DEBUG"),20),#H2H_MENU_SETTINGS_DEBUG_MODE,index)
	If debugOption
		AfftextColor(lsGet("ENABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_DEBUG_MODE))
	Else
		AfftextColor(lsGet("DISABLED"),subX,tmpY,#Gray*Bool(index<>#H2H_MENU_SETTINGS_DEBUG_MODE))
	EndIf
	If index=#H2H_MENU_SETTINGS_DEBUG_MODE
		AfftextColor(lsGet("SETTINGS_DEBUG_DESC"),descX,descY,RGB(0,0,255))
		If right Or left Or accept
			If debugOption
				debugOption=0
				debugEnabled=0
				slomo=0
			Else
				debugOption=1
				debugEnabled=-1
			EndIf
			psound(#H2H_SOUND_ID_MENUCHANGE)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_KEYBOARD*#H2H_SETTINGS_LINE_HEIGHT+bigShift
	displayMenuButtonText(x,tmpY,textpad(lsGet("SETTINGS_KEYBOARD"),20),#H2H_MENU_SETTINGS_KEYBOARD,index,0,bigSize)
	If index=#H2H_MENU_SETTINGS_KEYBOARD
		AfftextBloc(lsGet("SETTINGS_KEYBOARD_DESC"),descX,descY,screenSizeX-200,#Blue)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_CONTROLLER*#H2H_SETTINGS_LINE_HEIGHT+bigShift*2
	displayMenuButtonText(x,tmpY,textPad(lsGet("SETTINGS_CONTROLLER"),20),#H2H_MENU_SETTINGS_CONTROLLER,index,0,bigSize)
	If index=#H2H_MENU_SETTINGS_CONTROLLER
		AfftextBloc(lsGet("SETTINGS_CONTROLLER_DESC"),descX,descY,screenSizeX-200,#Blue)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_RESET*#H2H_SETTINGS_LINE_HEIGHT+bigShift*3
	displayMenuButtonText(x,tmpY,textPad(lsGet("RESET_TO_DEFAULT"),20),#H2H_MENU_SETTINGS_RESET,index,0,bigSize)
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SAVE_AND_EXIT*#H2H_SETTINGS_LINE_HEIGHT+bigShift*4
	displayMenuButtonText(x,tmpY,textPad(lsGet("SAVE_AND_RETURN"),20),#H2H_MENU_SETTINGS_SAVE_AND_EXIT,index,0,bigSize)
;=======================================================================================================================================================================================================================
	;}
	If confirming
		If confirm()
			If confirmWhat
				; reset to default
				psound(#H2H_SOUND_ID_MENUCLIC)
				soundlevel=#H2H_SOUND_DEFAULT_VOLUME
				If musicLevel=0
					musicExPlay(*allMusic(Str(#H2H_MUSIC_MENU)))
				EndIf
				musicLevel=#H2H_MUSIC_DEFAULT_VOLUME
				windEnabled=#H2H_FRAME_WIND_ENABLED_DEFAULT
				particleEnabled=#H2H_PARTICLE_ENABLED_DEFAULT
				musicLevelRefresh()
				keyboardType=#PB_Keyboard_International
				comboDisplayMode=#H2H_COMBO_DISPLAY_DEFAULT
				stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
				soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT
				buffedFrames=#H2H_FRAME_BUFFER_DEFAULT
				debugOption=#H2H_DEBUG
				playerColorMode=#H2H_PLAYER_COLOR_MODE_DEFAULT
				currentFPSMode=#H2H_FPS_MODE_DEFAULT
; 				fpsModeChange(#H2H_FPS_MODE_DEFAULT)
				showFPS=1
				screenShakeMode=#H2H_SCREEN_SHAKE_DEFAULT
				screenShakeModeSet(screenShakeMode)
				roundLength=#H2H_ROUND_LENGTH
				attackDelayMode=#H2H_DELTA_DELAY_MODE
			Else
				psound(#H2H_SOUND_ID_MENUCANCEL)
			EndIf
			keyClear()
; 			playerClearKey(*player1)
; 			controlClear(*menuControl)
			confirming=#False
		EndIf
		menuTextLoop(deltaGlobal)
	Else
		menuTextLoop(deltaGlobal)
		; Actions
		;{
		If previousIndex<>index
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
		If accept
			If index=#H2H_MENU_SETTINGS_SAVE_AND_EXIT
				ProcedureReturn 1
			EndIf
			If index=#H2H_MENU_SETTINGS_RESET
				confirming=#True
				psound(#H2H_SOUND_ID_MENUACCEPT)
			EndIf
			If index=#H2H_MENU_SETTINGS_KEYBOARD
				ProcedureReturn 2
			EndIf
			If index=#H2H_MENU_SETTINGS_CONTROLLER
				ProcedureReturn 3
			EndIf
		EndIf
		;}
	EndIf
	ProcedureReturn -1
EndProcedure

Procedure difficultyMenu(x.i=0,y.i=0)
	Static index=0
	subY=y
	subY=AfftextColor("       "+lsGet("DIFFICULTY"),x,subY,#Orange,128,1,*font32)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,textPad(lsGet("DIFFICULTY_EASY"),12),#H2H_AI_LEVEL_EASY-1,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,textPad(lsGet("DIFFICULTY_NORMAL"),12),#H2H_AI_LEVEL_MEDIUM-1,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,textPad(lsGet("DIFFICULTY_HARD"),12),#H2H_AI_LEVEL_HARD-1,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,textPad(lsGet("DIFFICULTY_INSANE"),12),#H2H_AI_LEVEL_INSANE-1,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,textPad(lsGet("MENU_EXIT"),12),#H2H_AI_LEVEL_INSANE,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	Select index
		Case #H2H_AI_LEVEL_EASY-1
			AfftextColor(lsGet("DIFFICULTY_EASY_DESC"),x+100,subY,#Blue,64)
		Case #H2H_AI_LEVEL_MEDIUM-1
			AfftextColor(lsGet("DIFFICULTY_NORMAL_DESC"),x+100,subY,#Blue,64)
		Case #H2H_AI_LEVEL_HARD-1
			AfftextColor(lsGet("DIFFICULTY_HARD_DESC"),x+100,subY,#Blue,64)
		Case #H2H_AI_LEVEL_INSANE-1
			AfftextColor(lsGet("DIFFICULTY_INSANE_DESC"),x+100,subY,#Blue,64)
	EndSelect
	menuTextLoop(deltaGlobal)
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuUp() Or menuLeft()
		index-1
		If index<0
			index=0
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuDown() Or menuRight()
		index+1
		If index>#H2H_AI_LEVEL_INSANE
			index=#H2H_AI_LEVEL_INSANE
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or menuAccept()
		psound(#H2H_SOUND_ID_MENUACCEPT)
		ProcedureReturn index
	EndIf
	ProcedureReturn -1
EndProcedure

#H2H_DABEDIDABUDA=$FF8080
Global nbHands.i=0
Global page.i=0
Global screenSprite=spriteIndexAdd()
Procedure creditMenu(x.i=0,y.i=0)
	Static tutorialWave.f=128
	Static tutorialWaveDirection=-4
	Static needRemake=#True

	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft()
		page-1
		If page<0
			page=0
		Else
			needRemake=#True
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight()
		page+1
		If page>2
			page=2
		Else
			needRemake=#True
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	tutorialWave+tutorialWaveDirection*deltaGlobal
	If tutorialWave<16
		tutorialWave=16
		tutorialWaveDirection=-tutorialWaveDirection
	EndIf
	If tutorialWave>128
		tutorialWave=128
		tutorialWaveDirection=-tutorialWaveDirection
	EndIf
	;{
	level=y
	If needRemake
		Select page
			Case 0:
				level=AfftextColor(lsGet("CREDITS_CONTRIBUTORS"),80+x,level,#Orange,128,1,*font32)+20
				level=AfftextColor("FlameofChange",80+x,level,#Orange,128,1.5)+5
				level=AfftextColor(lsGet("CREDITS_FLAMEOFCHANGE"),80+x,level,#H2H_DABEDIDABUDA,64)+20
				level=AfftextColor("Nemerod",80+x,level,#Orange,128,1.5)
				level=AfftextColor(lsGet("CREDITS_NEMEROD"),80+x,level,#H2H_DABEDIDABUDA,64)+20
				
				level=AfftextColor(lsGet("CREDITS_TOTAL_DRAWN_HAND"),80+x,level,#Orange,128,1.5)+5
				level=AfftextColor(Str(nbHands-44-5-4-4-1)+" FlameofChange "+lsGet("CREDITS_SCRAPPED"),80+x,level,#H2H_DABEDIDABUDA,64)+5
				level=AfftextColor("  44  Myst2D",80+x,level,#H2H_DABEDIDABUDA,64)
				level=AfftextColor("   5  Kei",80+x,level,#H2H_DABEDIDABUDA,64)
				level=AfftextColor("   4  Gwendolyn",80+x,level,#H2H_DABEDIDABUDA,64)
				level=AfftextColor("   4  Nemerod",80+x,level,#H2H_DABEDIDABUDA,64)
				level=AfftextColor("   1  Stalfos H. Dubois",80+x,level,#H2H_DABEDIDABUDA,64)
			Case 1:
				level=AfftextColor(lsGet("CREDITS_LIBRARIES_CODE"),80+x,level,#Orange,128,1.5)
				level=AfftextColor("> RotateImage - Luis http://luis.no-ip.net",80+x,level,#H2H_DABEDIDABUDA,64)+20
				level=AfftextColor(lsGet("CREDITS_SOFTWARES"),80+x,level,#Orange,128,1.5)+5
				level=AfftextColor("> PureBasic\> Idle (python)\> Reaper\> Audacity\> FL studio 12\> Paint Tool Sai\> Paint.net\> MS Paint\> Illustrator",80+x,level,#H2H_DABEDIDABUDA,64)+20
				
				level=AfftextColor(lsGet("CREDITS_SOUNDS"),80+x,level,#Orange,128,1.5)+5
				level=AfftextColor(lsGet("CREDITS_BORROWED"),80+x,level,#Orange,64,1.25)+2
				level=AfftextColor("> Brawlhalla\> Mount&Blade Warband\> Warcraft 3\> Europa Universalis IV\> Rise of Nations",80+x,level,#H2H_DABEDIDABUDA,64)+10
				level=AfftextColor(lsGet("CREDITS_LIBRARIES_SOUND"),80+x,level,#Orange,64,1.25)+2
				level=AfftextColor("> Full Deadly Kombat Sound Library - @DanielSoundsGood",80+x,level,#H2H_DABEDIDABUDA,64)
			Case 2:
				level=AfftextColor(lsGet("CREDITS_SPECIAL_THANKS"),80+x,level,#Orange,128,1,*font32)+20
				level=AfftextColor(lsGet("CREDITS_SPECIAL_THANKS_LIST"),80+x,level,#H2H_DABEDIDABUDA,64)
		EndSelect
		If Not IsSprite(screenSprite)
			CreateSprite(screenSprite,screenSizeX,screenSizeY)
		EndIf
		GrabSprite(screenSprite,0,0,screenSizeX,screenSizeY)
		needRemake=#False
	Else
		DisplaySprite(screenSprite,0,0)
	EndIf
	;}
	If page>0
		displayComboSprite(#H2H_COMBO_NSIDE,25,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
	If page<2
		displayComboSprite(#H2H_COMBO_NBACK,screenSizeX-100,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
EndProcedure

Procedure tutorialMenu(x.i=0,y.i=0)
	Static tutorialWave.d=16
	Static tutorialWaveDirection.d=3
	Static needRemake=#True
	;{
	level=y
	level=AfftextColor(UCase(lsGet("MENU_TUTORIAL")),80+x,level,#Orange,128,1,*font32)+5
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or menuLeft()
		page-1
		If page<0
			page=0
		Else
			needRemake=#True
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or menuRight()
		page+1
		If page>6
			page=6
		Else
			needRemake=#True
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	tutorialWave+tutorialWaveDirection*deltaGlobal
	If tutorialWave<16
		tutorialWave=16
		tutorialWaveDirection=-tutorialWaveDirection
	EndIf
	If tutorialWave>128
		tutorialWave=128
		tutorialWaveDirection=-tutorialWaveDirection
	EndIf
	If Not IsSprite(screenSprite)
		needRemake=#True
		CreateSprite(screenSprite,screenSizeX,screenSizeY)
	EndIf
; 	titleScale.d=2
; 	iconScale.d=1
	textX=100
	textY=100
	;Protected blueLess=
	If needRemake
		Select page
			Case 0:
				; basics handling
				frameDisplayNoShift(*allClasses(2)\animations[1]\frames(0),100,100,255,#H2H_STANCE_COLOR_BLUE)
				frameDisplayNoShift(*allClasses(2)\animations[0]\frames(0),450,0,64,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$20000000)
				frameDisplayNoShift(*allClasses(2)\animations[2]\frames(0),750,50,255,#H2H_STANCE_COLOR_BLUE)
				afftext(lsGet("TUTORIAL_MOVE_LEFT",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_LEFT))),100,300)
				afftext(lsGet("TUTORIAL_MOVE_RIGHT",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_RIGHT))),800,300)
				
				frameDisplayNoShift(*allClasses(2)\animations[3]\backWind(2,0)\frames(0),100,400,224,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$30000000)
				frameDisplayNoShift(*allClasses(2)\animations[3]\frames(2),100,400,255,#H2H_STANCE_COLOR_BLUE)
				frameDisplayNoShift(*allClasses(2)\animations[3]\frontWind(2,0)\frames(0),100,250,224,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$20000000)
				afftext(lsGet("TUTORIAL_NEUTRAL",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_NEUTRAL))),100,650)
				frameDisplayNoShift(*allClasses(2)\animations[8]\frames(2),700,350,255,#H2H_STANCE_COLOR_BLUE)
				afftext(lsGet("TUTORIAL_HEAVY",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_HEAVY))),800,650)
			Case 1:
				; attack direction
				level=afftext(lsGet("TUTORIAL_DIRECTION"),80+x,level)
				; neutral
				frameDisplayNoShift(*allClasses(2)\animations[3]\backWind(2,0)\frames(0),350,300,60,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$0C000000)
				frameDisplayNoShift(*allClasses(2)\animations[3]\frames(2),350,300,64,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$20000000)
				frameDisplayNoShift(*allClasses(2)\animations[3]\frontWind(2,0)\frames(0),350,150,60,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$08000000)
				; side
				frameDisplayNoShift(*allClasses(2)\animations[4]\backWind(3,0)\frames(0),200,265,224,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$30000000)
				frameDisplayNoShift(*allClasses(2)\animations[4]\frames(3),200,265,255,#H2H_STANCE_COLOR_BLUE)
				frameDisplayNoShift(*allClasses(2)\animations[4]\frontWind(3,0)\frames(0),0,250,224,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$20000000)
				afftext(keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ATTACK))+" + "+keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_LEFT)),200,565)
				; back
				frameDisplayNoShift(*allClasses(2)\animations[5]\frames(3),950,265,255,#H2H_STANCE_COLOR_BLUE)
				frameDisplayNoShift(*allClasses(2)\animations[5]\frontWind(3,0)\frames(0),675,290,224,(#H2H_STANCE_COLOR_BLUE&$FFFFFF)+$20000000)
				afftext(keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_ATTACK))+" + "+keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_RIGHT)),900,230)
			Case 2:
				; combo
				level=afftext(lsGet("TUTORIAL_COMBO"),80+x,level)
				k=0
				For i=#H2H_COMBO_NEUTRAL To #H2H_COMBO_HEAVY
					displayComboSprite(i,50,200+75*k,#H2H_STANCE_COLOR_BLUE,128,#False,#False,0.5)
					displayComboSprite(i,150,235+75*k,#H2H_STANCE_COLOR_BLUE,128,#True)
					k+1
				Next
				AfftextColor(lsGet("CONTROL_NAME_NEUTRAL"),200,235,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("CONTROL_NAME_ATTACK_SIDE"),200,310,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("UP"),200,385,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("CONTROL_NAME_ATTACK_BACK"),200,460,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("CONTROL_NAME_ATTACK_DOWN"),200,535,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("CONTROL_NAME_HEAVY"),200,610,#H2H_STANCE_COLOR_BLUE,64,1.5)
				AfftextColor(lsGet("EXAMPLE"),600,225,#H2H_STANCE_COLOR_BLUE,64,1.5)
	; 			s.s=lsGet("ACTION_NAME_ATTACK_SIDE")+" - "+lsGet("ACTION_NAME_ATTACK_SIDE")+" - "+lsGet("ACTION_NAME_ATTACK_SIDE")
	; 			size.d=AfftextGetLength(s)/800
	; 			If size<0.5
	; 				size=0.5
	; 			EndIf
	; 			If size>1
	; 				size=1
	; 			EndIf
	; 			Debug "size "+size
	; 			AfftextColor(s,600,255,#H2H_STANCE_COLOR_BLUE,128,size)
				AfftextColor(lsGet("CONTROL_NAME_ATTACK_SIDE")+" - "+lsGet("CONTROL_NAME_ATTACK_SIDE")+" - "+lsGet("CONTROL_NAME_ATTACK_SIDE"),600,255,#H2H_STANCE_COLOR_BLUE)
				For i=0 To 2
					displayComboSprite(#H2H_COMBO_NSIDE,600+i*75,275,#H2H_STANCE_COLOR_BLUE,128,#False,#False,0.5)
				Next
				
				afftextColor(lsGet("CONTROL_NAME_ATTACK_BACK")+" - "+lsGet("CONTROL_NAME_HEAVY")+" - "+lsGet("CONTROL_NAME_ATTACK_BACK"),600,405,#H2H_STANCE_COLOR_WOOD)
				displayComboSprite(#H2H_COMBO_NBACK,600,425,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
				displayComboSprite(#H2H_COMBO_HEAVY,675,415,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
				displayComboSprite(#H2H_COMBO_NBACK,750,425,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
				
				afftextColor(lsGet("UP")+" - "+lsGet("CONTROL_NAME_HEAVY")+" - "+lsGet("CONTROL_NAME_NEUTRAL"),600,555,#H2H_STANCE_COLOR_YELLOW)
				displayComboSprite(#H2H_COMBO_NUP,600,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
				displayComboSprite(#H2H_COMBO_HEAVY,675,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
				displayComboSprite(#H2H_COMBO_NEUTRAL,750,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
			Case 3:
				; special
				level=AfftextBloc(lsGet("TUTORIAL_DODGE",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_SPECIAL))),80+x,level,screenSizeX-80-x)+3
				level=AfftextBloc(lsGet("TUTORIAL_JUMP",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_SPECIAL)),keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_UP))),80+x,level,screenSizeX-80-x)+3
				level=AfftextBloc(lsGet("TUTORIAL_DASH",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_SPECIAL)),keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_LEFT)),keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_RIGHT)))+" ("+lsGet("TOBEADDED")+")",80+x,level,screenSizeX-80-x,#Blue)+3
				level=AfftextBloc(lsGet("TUTORIAL_PARRY",-1,keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_SPECIAL)),keyToString(controlGet(*player1\keyboardControl,#H2H_CONTROL_DOWN))),80+x,level,screenSizeX-80-x)+3
				level=AfftextBloc(lsGet("TUTORIAL_PAUSE",-1,keyToString(controlGet(*menuControlKeys,#H2H_CONTROL_CANCEL))),80+x,level,screenSizeX-80-x)+25
				level=AfftextBloc(lsGet("TUTORIAL_HP"),80+x,level,screenSizeX-80-x)+3
				level=AfftextBloc(lsGet("TUTORIAL_GUARD"),80+x,level,screenSizeX-80-x)+3
			Case 4:
				; Stats part 1
				AfftextColor(lsGet("STRENGTH"),textX+85,textY,iconColor(#H2H_ICON_STRENGTH),128,1,*font32)
				UIDisplay(#H2H_ICON_STRENGTH,textX,textY-25,iconColor(#H2H_ICON_STRENGTH))
				textY=AfftextBloc(lsGet("STRENGTH_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_STRENGTH),64)+50

				AfftextColor(lsGet("AGILITY"),textX+85,textY,iconColor(#H2H_ICON_AGILITY),128,1,*font32)
				UIDisplay(#H2H_ICON_AGILITY,textX,textY-25,iconColor(#H2H_ICON_AGILITY))
				textY=AfftextBloc(lsGet("AGILITY_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_AGILITY),64)+50
				
				AfftextColor(lsGet("SPEED"),textX+85,textY,iconColor(#H2H_ICON_SPEED),128,1,*font32)
				UIDisplay(#H2H_ICON_SPEED,textX,textY-25,iconColor(#H2H_ICON_SPEED))
				textY=AfftextBloc(lsGet("SPEED_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_SPEED),64)+50
				
				AfftextColor(lsGet("WEIGHT"),textX+85,textY,iconColor(#H2H_ICON_WEIGHT),128,1,*font32)
				UIDisplay(#H2H_ICON_WEIGHT,textX,textY-25,iconColor(#H2H_ICON_WEIGHT))
				AfftextBloc(lsGet("WEIGHT_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_WEIGHT),64)
			Case 5:
				; Stats part 2
				AfftextColor(lsGet("STAMINA"),textX+85,textY,iconColor(#H2H_ICON_ENDURENCE),128,1,*font32)
				UIDisplay(#H2H_ICON_ENDURENCE,textX,textY-25,iconColor(#H2H_ICON_ENDURENCE))
				textY=AfftextBloc(lsGet("STAMINA_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_ENDURENCE),64)+50

				AfftextColor(lsGet("LIFE"),textX+85,textY,iconColor(#H2H_ICON_LIFE),128,1,*font32)
				UIDisplay(#H2H_ICON_LIFE,textX,textY-25,iconColor(#H2H_ICON_LIFE))
				textY=AfftextBloc(lsGet("LIFE_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_LIFE),64)+50

				AfftextColor(lsGet("CUT"),textX+85,textY,iconColor(#H2H_ICON_CUT),128,1,*font32)
				UIDisplay(#H2H_ICON_CUT,textX,textY-25,iconColor(#H2H_ICON_CUT))
				textY=AfftextBloc(lsGet("CUT_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_CUT),64)+50

				AfftextColor(lsGet("PIERCE"),textX+85,textY,iconColor(#H2H_ICON_PIERCE),128,1,*font32)
				UIDisplay(#H2H_ICON_PIERCE,textX,textY-25,iconColor(#H2H_ICON_PIERCE))
				AfftextBloc(lsGet("PIERCE_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_PIERCE),64)
			Case 6:
				; Stats part 3
				AfftextColor(lsGet("BLUNT"),textX+85,textY,iconColor(#H2H_ICON_BLUNT),128,1,*font32)
				UIDisplay(#H2H_ICON_BLUNT,textX,textY-25,iconColor(#H2H_ICON_BLUNT))
				textY=AfftextBloc(lsGet("BLUNT_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_BLUNT),64)+50

				AfftextColor(lsGet("REACH"),textX+85,textY,iconColor(#H2H_ICON_REACH),128,1,*font32)
				UIDisplay(#H2H_ICON_REACH,textX,textY-25,iconColor(#H2H_ICON_REACH))
				textY=AfftextBloc(lsGet("REACH_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_REACH),64)+50
				
				AfftextColor(lsGet("DIFFICULTY"),textX+85,textY,iconColor(#H2H_ICON_DIFFICULTY),128,1,*font32)
				UIDisplay(#H2H_ICON_DIFFICULTY,textX,textY-25,iconColor(#H2H_ICON_DIFFICULTY))
				AfftextBloc(lsGet("DIFFICULTY_DESC"),textX,textY+40,screenSizeX-350,iconColor(#H2H_ICON_DIFFICULTY),64)
		EndSelect
		GrabSprite(screenSprite,0,0,screenSizeX,screenSizeY)
		needRemake=#False
	Else
		DisplaySprite(screenSprite,0,0)
	EndIf
	;}
	If page>0
		displayComboSprite(#H2H_COMBO_NSIDE,25,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
	If page<6
		displayComboSprite(#H2H_COMBO_NBACK,screenSizeX-100,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
EndProcedure

importOptions()
musicLevelRefresh()
If musicLevel>0
	musicExPlay(*allMusic(Str(#H2H_MUSIC_MENU)))
EndIf

blackScreenEnabled=#True
blackScreenVelocity=-#H2H_BLACK_SCREEN_VELOCITY_BASE
blackScreenOpacity=255

; frameCount.f=0
; animationCount.f=0
; length.f=0
; For i=0 To ArraySize(*allClasses())
;  	frameCount+classCountFrames(*allClasses(i))
;  	animationCount+classCountAnimations(*allClasses(i))
;  	length+classLengthRec(*allClasses(i))
; Next
; Debug "frame count : "+frameCount
; Debug "animation count : "+animationCount
; Debug "average : "+Str(frameCount/animationCount)
; Debug "total length : "+Str(length/50.0)

Procedure enterMenu(target)
	If target=previousMenu(currentMenuIndex)
; 		Debug "already targeting "+target
		ProcedureReturn
	EndIf
;  	Debug "entering to "+target
;  	Debug "were at "+currentMenuIndex
 	If targetMenu<>target
;  		playerClearKey(*player1)
;  		playerClearKey(*player2)
 		*player1\controlEnabled=#False
 		*player2\controlEnabled=#False
	EndIf
	targetMenu=target
	found=#False
	For i=0 To currentMenuIndex
		If target=previousMenu(i)
			For k=i+1 To currentMenuIndex
				previousMenu(k)=0
			Next
			currentMenuIndex=i
			found=#True
			Break
		EndIf
	Next
	If Not found
; 		Debug "not found"
		currentMenuIndex+1
	EndIf
; 	Debug "we are now at "+currentMenuIndex
	previousMenu(currentMenuIndex)=targetMenu
EndProcedure

; totalX=0
; totalY=0
; surface=0
; count=0
; If ExamineDirectory(0,"image","*.png")
; 	While NextDirectoryEntry(0)
; 		count+1
; 		Debug DirectoryEntryName(0)
; 		LoadSprite(0,"image/"+DirectoryEntryName(0))
; 		totalX+SpriteWidth(0)
; 		totalY+SpriteHeight(0)
; 		surface+(SpriteWidth(0)*SpriteHeight(0))
; 		FreeSprite(0)
; 	Wend
; EndIf
; Debug "average X "+Str(totalX/count)
; Debug "average Y "+Str(totalY/count)
; Debug "surface "+Str(Sqr(surface))
; End
Procedure startDemo()
	playerSetClassRandom(*player1)
	playerSetClassRandom(*player2,*player1,#True)
	playerSetStanceRandom(*player1)
	playerSetStanceRandom(*player2)
	playerPrepareColor(*player1,*player2)
	*player1\isAI=#H2H_AI_LEVEL_HARD
	*player2\isAI=#H2H_AI_LEVEL_HARD
	*bot1\mode=#H2H_AI_MODE_IDLE
	*bot1\difficulty=#H2H_AI_LEVEL_HARD
	*bot2\mode=#H2H_AI_MODE_IDLE
	*bot2\difficulty=#H2H_AI_LEVEL_HARD
	*mainGame\terrain=*allBackground(Random(ArraySize(*allBackground())))
	startGame(*mainGame\terrain)
EndProcedure

; toremake=0
; For i=0 To ArraySize(*allAnimations())
; 	If *allAnimations(i) And animationIsAttack(*allAnimations(i)) And Not *allAnimations(i)\frontWind() And Not *allAnimations(i)\backWind() And *allAnimations(i)\recovery
; 		Debug *allAnimations(i)\name+" must be remade"
; 		toremake+ArraySize(*allAnimations(i)\frames())
; 	EndIf
; Next
; Debug "to remake "+toremake
; End
; CreateRegularExpression(0,"hand*[")
; ExamineDirectory(0,"image/","hand*)
; r1=RegularExpressionGroup
; While NextDirectoryEntry(0)
; 	n=DirectoryEntryName(0)
; 	If 
; CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Global NewMap entry.i()

Procedure countHandAnimation(*a.animation)
	For i=0 To 5
		If *a\animations[i]
			countHandAnimation(*a\animations[i])
		EndIf
	Next
	For i=0 To ArraySize(*a\frames())
		If FindMapElement(entry(),*a\frames(i)\path$)
			Debug "already found "+*a\frames(i)\path$
		Else
			entry(*a\frames(i)\path$)=1
		EndIf
	Next
EndProcedure
; 
Procedure countHandClass(*c.class)
	For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
		If *c\animations[i]
			countHandAnimation(*c\animations[i])
		EndIf
	Next
	For i=0 To ArraySize(*c\otherIdle())
		countHandAnimation(*c\otherIdle(i))
	Next
EndProcedure
For i=0 To ArraySize(*allClasses())
	countHandClass(*allClasses(i))
Next
nbHands=MapSize(entry())
FreeMap(entry())
Debug "number of hands "+nbHands
; End
; CompilerEndIf
;------ string load
; CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	For i=0 To ArraySize(*allLanguages())
		If *allLanguages(i)\support<>#H2H_LANGUAGE_SUPPORT_NONE
			Debug "loaded "+i
			lsLoad("language_"+*allLanguages(i)\code+".json",i)
			lsLoad("class_string_"+*allLanguages(i)\code+".json",i)
		EndIf
	Next
; lsLoad("language_en.json",#H2H_LANGUAGE_ENGLISH)
; lsLoad("language_fr.json",#H2H_LANGUAGE_FRENCH)
; CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_SAVE And #False
	For i=0 To ArraySize(*allClasses())
		*c.class=*allClasses(i)
		If *c
			key.s="CLASS_"+i;UCase(ReplaceString(*c\name," ","_"))
			lsSet(key+"_NAME",#H2H_LANGUAGE_ENGLISH,*c\name)
			If *c\desc$<>""
				lsSet(key+"_DESC",#H2H_LANGUAGE_ENGLISH,*c\desc$)
			EndIf
			For j=0 To ArraySize(*c\allStances())
				lsSet(key+"_STANCE"+j,#H2H_LANGUAGE_ENGLISH,*c\allStances(j)\name)
			Next
		EndIf
	Next
 	lsSave("language_en.json",#H2H_LANGUAGE_ENGLISH)
; 	only For Next
	For i=0 To ArraySize(*allLanguages())
		If *allLanguages(i)\support<>#H2H_LANGUAGE_SUPPORT_NONE
			lsSave("language_"+*allLanguages(i)\code+".json",i)
		EndIf
	Next
 lsSave("language_fr.json",#H2H_LANGUAGE_FRENCH)
CompilerEndIf
; replace all the local names for keys & actions
Procedure lsRefresh()
	Debug "current language "+currentLanguage
	controllerButtonName$(#H2H_CONTROLLER_BUTTON_BOTTOM)		=lsGet("CONTROLLER_BUTTON_NAME_BOTTOM")
	controllerButtonName$(#H2H_CONTROLLER_BUTTON_LEFT)			=lsGet("CONTROLLER_BUTTON_NAME_LEFT")
	controllerButtonName$(#H2H_CONTROLLER_BUTTON_RIGHT)			=lsGet("CONTROLLER_BUTTON_NAME_RIGHT")
	controllerButtonName$(#H2H_CONTROLLER_BUTTON_TOP)			=lsGet("CONTROLLER_BUTTON_NAME_TOP")
	controllerButtonName$(#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT)	=lsGet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_LEFT")
	controllerButtonName$(#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT)	=lsGet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_RIGHT")

	;controlName(#H2H_CONTROL_EMPTY)=lsGet("ACTION_NAME_NONE")
; 	controlName(#H2H_CONTROL_MOVEMENT)=lsGet("ACTION_NAMEMOVEMENT")
; 	controlName(#H2H_CONTROL_MOVEMENT_MENU)=lsGet("ACTION_NAMEMOVEMENT_MENU")
; 	controlName(#H2H_CONTROL_MOVEMENT_COMBAT)=lsGet("ACTION_NAMEMOVEMENT_COMBAT")
	controlNameLoc(#H2H_CONTROL_ATTACK)		=lsGet("CONTROL_NAME_ATTACK")
	controlNameLoc(#H2H_CONTROL_NEUTRAL)	=lsGet("CONTROL_NAME_NEUTRAL")
	controlNameLoc(#H2H_CONTROL_ATTACK_SIDE)=lsGet("CONTROL_NAME_ATTACK_SIDE")
	controlNameLoc(#H2H_CONTROL_ATTACK_BACK)=lsGet("CONTROL_NAME_ATTACK_BACK")
	controlNameLoc(#H2H_CONTROL_ATTACK_UP)	=lsGet("CONTROL_NAME_ATTACK_UP")
	controlNameLoc(#H2H_CONTROL_ATTACK_DOWN)=lsGet("CONTROL_NAME_ATTACK_DOWN")
	controlNameLoc(#H2H_CONTROL_HEAVY)		=lsGet("CONTROL_NAME_HEAVY")
	controlNameLoc(#H2H_CONTROL_SPECIAL)	=lsGet("CONTROL_NAME_SPECIAL")
	controlNameLoc(#H2H_CONTROL_DODGE)		=lsGet("CONTROL_NAME_DODGE")
	controlNameLoc(#H2H_CONTROL_JUMP)		=lsGet("CONTROL_NAME_JUMP")
	controlNameLoc(#H2H_CONTROL_PARRY)		=lsGet("CONTROL_NAME_PARRY")
	controlNameLoc(#H2H_CONTROL_DASH_RIGHT)	=lsGet("CONTROL_NAME_DASH_RIGHT")
	controlNameLoc(#H2H_CONTROL_DASH_LEFT)	=lsGet("CONTROL_NAME_DASH_LEFT")
	controlNameLoc(#H2H_CONTROL_ACCEPT)		=lsGet("CONTROL_NAME_ACCEPT")
	controlNameLoc(#H2H_CONTROL_CANCEL)		=lsGet("CONTROL_NAME_CANCEL")
	controlNameLoc(#H2H_CONTROL_EXIT)		=lsGet("CONTROL_NAME_EXIT")

	keyToString$(#VK_NUMPAD0) 				=lsGet("KEY_PAD_0")
	keyToString$(#VK_NUMPAD1) 				=lsGet("KEY_PAD_1")
	keyToString$(#VK_NUMPAD2) 				=lsGet("KEY_PAD_2")
	keyToString$(#VK_NUMPAD3) 				=lsGet("KEY_PAD_3")
	keyToString$(#VK_NUMPAD4) 				=lsGet("KEY_PAD_4")
	keyToString$(#VK_NUMPAD5) 				=lsGet("KEY_PAD_5")
	keyToString$(#VK_NUMPAD6) 				=lsGet("KEY_PAD_6")
	keyToString$(#VK_NUMPAD7) 				=lsGet("KEY_PAD_7")
	keyToString$(#VK_NUMPAD8) 				=lsGet("KEY_PAD_8")
	keyToString$(#VK_NUMPAD9) 				=lsGet("KEY_PAD_9")
	keyToString$(#VK_DECIMAL)				=lsGet("KEY_PAD_COMMA")
	keyToString$(#VK_DIVIDE)				=lsGet("KEY_PAD_DIVIDE")
	keyToString$(#VK_LEFT)					=lsGet("LEFT")
	keyToString$(#VK_RIGHT)					=lsGet("RIGHT")
	keyToString$(#VK_UP)					=lsGet("UP")
	keyToString$(#VK_DOWN)					=lsGet("DOWN")
	keyToString$(#VK_SPACE) 				=lsGet("KEY_SPACEBAR")
	keyToString$(#VK_TAB) 					=lsGet("KEY_TAB")
	keyToString$(#VK_LSHIFT)				=lsGet("KEY_SHIFT_LEFT")
	keyToString$(#VK_RSHIFT)				=lsGet("KEY_SHIFT_RIGHT")
	keyToString$(#VK_LCONTROL)				=lsGet("KEY_CONTROL_LEFT")
	keyToString$(#VK_RCONTROL)				=lsGet("KEY_CONTROL_RIGHT")
	keyToString$(#VK_LMENU)					=lsGet("KEY_ALT_LEFT")
	keyToString$(#VK_RMENU)					=lsGet("KEY_ALT_RIGHT")
	keyToString$(#VK_RETURN)				=lsGet("KEY_RETURN")
	keyToString$(#VK_ESCAPE)				=lsGet("KEY_ESCAPE")
	keyToString$(#VK_BACK)					=lsGet("KEY_BACKSPACE")

	controlNameLoc(#H2H_CONTROL_LEFT)		=lsGet("LEFT")
	controlNameLoc(#H2H_CONTROL_RIGHT)		=lsGet("RIGHT")
	controlNameLoc(#H2H_CONTROL_UP)			=lsGet("UP")
	controlNameLoc(#H2H_CONTROL_DOWN)		=lsGet("DOWN")
	controlNameLoc(#H2H_CONTROL_ATTACK)		=lsGet("CONTROL_NAME_ATTACK")
	controlNameLoc(#H2H_CONTROL_HEAVY)		=lsGet("CONTROL_NAME_HEAVY")
	controlNameLoc(#H2H_CONTROL_SPECIAL)	=lsGet("CONTROL_NAME_SPECIAL")
	controlNameLoc(#H2H_CONTROL_NEUTRAL)	=lsGet("CONTROL_NAME_NEUTRAL")
	controlNameLoc(#H2H_CONTROL_ATTACK_SIDE)=lsGet("CONTROL_NAME_ATTACK_SIDE")
	controlNameLoc(#H2H_CONTROL_ATTACK_BACK)=lsGet("CONTROL_NAME_ATTACK_BACK")
	controlNameLoc(#H2H_CONTROL_ATTACK_UP)	=lsGet("CONTROL_NAME_ATTACK_UP")
	controlNameLoc(#H2H_CONTROL_ATTACK_DOWN)=lsGet("CONTROL_NAME_ATTACK_DOWN")
	controlNameLoc(#H2H_CONTROL_DODGE)		=lsGet("CONTROL_NAME_DODGE")
	controlNameLoc(#H2H_CONTROL_JUMP)		=lsGet("CONTROL_NAME_JUMP")
	controlNameLoc(#H2H_CONTROL_PARRY)		=lsGet("CONTROL_NAME_PARRY")
	controlNameLoc(#H2H_CONTROL_DASH_RIGHT)	=lsGet("CONTROL_NAME_DASH_RIGHT")
	controlNameLoc(#H2H_CONTROL_DASH_LEFT)	=lsGet("CONTROL_NAME_DASH_LEFT")
	controlNameLoc(#H2H_CONTROL_ACCEPT)		=lsGet("CONTROL_NAME_ACCEPT")
	controlNameLoc(#H2H_CONTROL_CANCEL)		=lsGet("CONTROL_NAME_CANCEL")
	controlNameLoc(#H2H_CONTROL_EXIT)		=lsGet("CONTROL_NAME_EXIT")
	
	i=1
	While #True
		s.s=lsGet("HINT_"+i)
		If s<>"HINT_"+i
			ReDim hint$(i)
			hint$(i)=s
		Else
			Break
		EndIf
		i+1
	Wend
	
	For i=0 To ArraySize(*allClasses())
		*c.class=*allClasses(i)
		If *c
			key.s="CLASS_"+i
			r.s=LSGet(key+"_NAME")
			Debug r
			If r<>key+"_NAME"
				*c\name=r
			EndIf
			r=LSGet(key+"_DESC")
			If r<>key+"_DESC"
				*c\desc$=r
			EndIf
			For j=0 To ArraySize(*c\allStances())
				r=LSGet(key+"_STANCE"+j)
				If r<>key+"_STANCE"+j
					*c\allStances(j)\name=r
				EndIf
			Next
		EndIf
	Next
	If *player1
		*player1\name=lsGet("PLAYER_RIGHT")
		*player2\name=lsGet("PLAYER_LEFT")
	EndIf
EndProcedure
lsRefresh()
; Debug "vk "+vkeyToKey(256)
;- Procedure.i globalLoop(x.i=0,y.i=0)
screenshoting=#False
x=0
y=#H2H_SCREEN_BORDER_THICKNESS*2
	currentMenu=#H2H_MENU_MAIN
	previousMenu(0)=currentMenu
	targetMenu=#H2H_MENU_MAIN
	
	*classIdleRight.animationGadget=gadgetCreate(0,*player1\class\animations[0],locationCreate(screenSizeX-1000,-150),9999,1,1)
	*classIdleRight\freed=#True
	*classIdleRight\display=#True
	*classIdleRight\absolute=#True
	*classIdleRight\enabled=#True
	*classIdleRight\indestructible=#True
	*classIdleRight\display=Bool(screenSizeX>1200)
	
	*classIdleLeft.animationGadget=gadgetCreate(0,*player2\class\animations[0],locationCreate(50,-150),9999,1,1)
	*classIdleLeft\freed=#True
	*classIdleLeft\display=#True
	*classIdleLeft\enabled=#True
	*classIdleLeft\absolute=#True
	*classIdleLeft\fliped=1
	*classIdleLeft\indestructible=#True
	
	If player1OnTheLeft
		Swap *classIdleLeft\what, *classIdleRight\what
	EndIf
	*mainGame.game=gameCreate1v1(0,*allBackground(0),#False)
	If musicLevel>0
		musicExPlay(*allMusic(Str(#H2H_MUSIC_MENU)))
	EndIf
	active=Bool((Not blackScreenEnabled Or blackScreenVelocity<0) And GetActiveWindow()<>-1)
	idle.b=Bool(currentMenu<>#H2H_MENU_BATTLE And currentMenu<>#H2H_MENU_RESTART);#True;active;Bool(active And currentMenu<>#H2H_MENU_BATTLE)
	stamp.d=ElapsedMillisecondsPrecise()
; 	Dim averageFPS.d(99)
; 	aFI=0
	f7.d=1
; 	controlPrint(*menuControl)
; 	controlPrint(*menuControlKeys)
; 	controlPrint(*player1\keyboardControl)
; 	controlPrint(*player2\keyboardControl)
; 	controlPrint(*player1\joystickControl,#True)
; 	controlPrint(*player2\joystickControl,#True)
	Repeat
		confirmDisplayed=#False
		eee = WindowEvent()
		If active And KeyUpdate(eee) And eee<>512 And eee<>160 And eee<>674 And eee<>275 And eee<>13114 And eee<>13104; mouse movement doesn't break idle, as well as entering/exiting focus
; 			Debug eee
			idle=#False
		EndIf
; 		For j=0 To 15
; 			For i=0 To 31
; 				If JoyPushed(j,i)
; 					Debug Str(j)+" pushed "+i
; 				EndIf
; 			Next
; 		Next
;  		Debug deltaGlobal
		Select eee
			Case $0;{
				If tin&$100000000
					tin!$100000000
					tampon=unique
					unique=PeekQ($7ffe0014)
					temp.d=(unique-tampon)
					If temp<1000000
						f7.d=((f7*31)+temp)/32
					EndIf
					For i=0 To 31
						If JoyPushed(0,i) Or JoyPushed(1,i)
;   							Debug "idle broken"
							idle=#False
						EndIf
					Next
					If Not active
						keyClear(#True)
						; 			playerClearKey(*player1)
						; 			playerClearKey(*player2)
						; 			controlClear(*menuControl)
					EndIf
					clearScreenGray()
	; 				For i=1 To nbJoystick
	; 					If ExamineJoystick(i-1)
	; 						For j=1 To 32
	; 							If JoystickButton(i-1,j)
	; 								idle=#False
	; 								; 						Debug "pressed "+j
	; 								Break 2
	; 							EndIf
	; 						Next
	; 					EndIf
	; 				Next
					;----- commands
					;{
					For dc=0 To ArraySize(*allDebugCommands())
						If debugCommandIsPressed(*allDebugCommands(dc))
	 						Debug "pressed "+dc
							Select *allDebugCommands(dc)\id
								Case #H2H_DEBUG_COMMAND_SCREENSHOT
									screenshoting=#True
								Case #H2H_DEBUG_COMMAND_HEAL
									If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
										playerResetLife(*player1)
										playerResetLife(*player2)
										playerGuardSet(*player1)
										playerGuardSet(*player2)
									EndIf
								Case #H2H_DEBUG_COMMAND_TOGGLE_DEBUG
									If debugEnabled<>0
										*player1\displayDebug=*player1\displayDebug*-1
										*player2\displayDebug=*player2\displayDebug*-1
										debugEnabled*-1
										If debugEnabled=1
											createDebugSprites(*mainGame\terrain)
										Else
											destroyDebugSprites()
										EndIf
									EndIf
								Case #H2H_DEBUG_COMMAND_TOGGLE_SLOMO
									If slomo
										slomo=#False
									Else
										slomo=#True
									EndIf
								Case #H2H_DEBUG_COMMAND_TOGGLE_FPS
									If showFPS
										showFPS=0
									Else
										showFPS=1
									EndIf
								Case #H2H_DEBUG_COMMAND_RESTART
									If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
										resetGame()
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
									If isPlayerAlive(*player1)
										selectedClass=*player1\class\id
										Repeat
											selectedClass+1
											If selectedClass>=ArraySize(*allClasses())
												selectedClass=0
											EndIf
											CompilerIf #H2H_MODE=#H2H_MODE_SAVE
												If Not classgetIdle(*allClasses(selectedClass))
													Debug *allClasses(selectedClass)\name+" has no idle"
												EndIf
											CompilerEndIf
										Until classgetIdle(*allClasses(selectedClass))
										playerSetClass(*player1,*allClasses(selectedClass),0)
										classLoadIconCroped(*player1\class)
										playerPrepareColor(*player1,*player2)
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE
									If isPlayerAlive(*player2)
										selectedClass=*player2\class\id
										Repeat
											selectedClass+1
											If selectedClass>=ArraySize(*allClasses())
												selectedClass=0
											EndIf
											CompilerIf #H2H_MODE=#H2H_MODE_SAVE
												If Not classgetIdle(*allClasses(selectedClass))
													Debug *allClasses(selectedClass)\name+" has no idle"
												EndIf
											CompilerEndIf
										Until classgetIdle(*allClasses(selectedClass))
										playerSetClass(*player2,*allClasses(selectedClass),0)
										classLoadIconCroped(*player2\class)
										playerPrepareColor(*player1,*player2)
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE
									If isPlayerAlive(*player1)
										selectedStance=*player1\classStanceId+1
										If selectedStance>ArraySize(*player1\class\allStances())
											selectedStance=0
										EndIf
										playerSetClass(*player1,*player1\class,selectedStance)
										playerPrepareColor(*player1,*player2)
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE
									If isPlayerAlive(*player2)
										selectedStance=*player2\classStanceId+1
										If selectedStance>ArraySize(*player2\class\allStances())
											selectedStance=0
										EndIf
										playerSetClass(*player2,*player2\class,selectedStance)
										playerPrepareColor(*player1,*player2)
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER1_TOGGLE_AI
									If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
										If Not *bot1
											*bot1=AICreate(*player1)
										EndIf
										If *bot1\mode=#H2H_AI_MODE_DISABLED
											*bot1\difficulty=#H2H_AI_LEVEL_MEDIUM
											AIEnable(*bot1)
											Debug "set player 1 to bot"
										Else
											*bot1\difficulty=0
											AIDisable(*bot1)
											Debug "set player 1 to player"
										EndIf
									EndIf
								Case #H2H_DEBUG_COMMAND_PLAYER2_TOGGLE_AI
									If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
										If Not *bot2
											*bot2=AICreate(*player2)
										EndIf
										If *bot2\mode=#H2H_AI_MODE_DISABLED
											*bot2\difficulty=#H2H_AI_LEVEL_MEDIUM
											AIEnable(*bot2)
											Debug "set player 2 to bot"
										Else
											*bot2\difficulty=0
											AIDisable(*bot2)
											Debug "set player 2 to player"
										EndIf
									EndIf
								Case #H2H_DEBUG_COMMAND_TOGGLE_HUD
									HUDEnabled=Bool(Not HUDEnabled)
								Case #H2H_DEBUG_COMMAND_PLAYER_SWAP
									player1OnTheLeft=Bool(Not player1OnTheLeft)
							EndSelect
						EndIf
					Next
					;}
					If idle
; 						Debug "idle"
						If Not demoFight And currentMenu<>#H2H_MENU_BATTLE And currentMenu<>#H2H_MENU_RESTART And currentMenu<>#H2H_MENU_DEMO
							If active
								If demoFightTimer=0
									demoFightTimer=ElapsedMilliseconds()
								EndIf
								If demoFightTimer+#H2H_FIGHT_DEMO_DELAY*1000<ElapsedMilliseconds()
; 									Debug "DEMO LAUNCH"
 									currentMenu=#H2H_MENU_DEMO
 									demoFight=#True
								EndIf
							EndIf
						EndIf
					Else
						If currentMenu=#H2H_MENU_BATTLE Or currentMenu=#H2H_MENU_RESTART
							If demoFight And demoFightTimer
								demoFightTimer=0
								enterMenu(previousMenu(currentMenuIndex-1))
; 								Debug "RETURN"
							EndIf
						Else
							demoFightTimer=0
						EndIf
					EndIf
					If active
						If Not demoFight
							playerCheckKey(*player1)
							playerCheckKey(*player2)
	; 						If Not inputMode And currentMenu=targetMenu And Not confirming And (playerHasCommand(*player1,#H2H_CONTROL_EXIT,#True) Or menuExit()) And currentMenu<>#H2H_MENU_1V1
							If Not inputMode And currentMenu=targetMenu And Not confirming And menuExit()
; 								Debug "pressed ? "+Str(Bool(menuExit()))
								If currentMenuIndex=0
									targetMenu=#H2H_MENU_EXIT
									psound(#H2H_SOUND_ID_MENUCANCEL)
								Else
									If currentMenu<>#H2H_MENU_BATTLE
										enterMenu(previousMenu(currentMenuIndex-1))
										psound(#H2H_SOUND_ID_MENUCANCEL)
									Else
										If gamePaused
											*player1\controlEnabled=#True
											If Not *player2\isAI
												*player2\controlEnabled=#True
											EndIf
											fightPhase=0
											If *mainGame\type=#H2H_GAME_1V1
												enterMenu(#H2H_MENU_1V1)
											EndIf
											If *mainGame\type=#H2H_GAME_1VBOT
												enterMenu(#H2H_MENU_1VBOT)
											EndIf
											psound(#H2H_SOUND_ID_MENUCANCEL)
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
						If Not blackScreenEnabled
							If targetMenu<>currentMenu
								Debug "["+currentMenuIndex+"] initiated transition from "+currentMenu+" To "+targetMenu
								blackScreenStart()
							EndIf
						EndIf
					EndIf
					;-- current menu
					Select currentMenu
						Case #H2H_MENU_MAIN ;==========================================================================================================================
							index=menuLoop(x,y)
							If index>=0
								Select stereoWidth
									Case #H2H_SOUND_STEREO_DEFAULT_WIDTH
										psound(#H2H_SOUND_ID_MENUACCEPT,400+50*index)
									Case #H2H_SOUND_STEREO_SMALL_WIDTH
										psound(#H2H_SOUND_ID_MENUACCEPT,((screenSizeX/2)+400+50*index)/2)
									Case #H2H_SOUND_STEREO_NONE_WIDTH
										psound(#H2H_SOUND_ID_MENUACCEPT)
								EndSelect
								Select index
									Case 0
										targetMenu=#H2H_MENU_1V1
									Case 1
										targetMenu=#H2H_MENU_1VBOT
									Case 2
										targetMenu=#H2H_MENU_GALLERY
									Case 3
										targetMenu=#H2H_MENU_SETTINGS
									Case 4
										targetMenu=#H2H_MENU_TUTORIAL
										page=0
									Case 5
										targetMenu=#H2H_MENU_CREDITS
									Case 6
										targetMenu=#H2H_MENU_EXIT
									Case 7
										RunProgram("https://discord.com/invite/Tqqr5Q6KXu")
									Case 8
										RunProgram("https://store.steampowered.com/app/2301060/Hand2Hand")
									Case 9
										RunProgram("https://flameofchange.itch.io/hand2hand")
									Case 10
										RunProgram("https://sites.google.com/view/hand2hand-wiki/home-page")
								EndSelect
								If index<7
									enterMenu(targetMenu)
								EndIf
							EndIf
						Case #H2H_MENU_GALLERY ;==========================================================================================================================
							classGallery(*classIdleRight,deltaGlobal)
						Case #H2H_MENU_1V1 ;==========================================================================================================================
							result=classSelectionVersus(*classIdleLeft,*classIdleRight)
							If result<>-999
								*player1\isAI=0
								*player2\isAI=0
								*bot1\mode=#H2H_AI_MODE_DISABLED
								*bot2\mode=#H2H_AI_MODE_DISABLED
								playerPrepare(*player1,*player2,result)
								*mainGame\type=#H2H_GAME_1V1
								enterMenu(#H2H_MENU_TERRAIN)
							EndIf
						Case #H2H_MENU_1VBOT ;==========================================================================================================================
							result=classSelectionVersus(*classIdleLeft,*classIdleRight,#True)
							If result<>-999
								*player1\isAI=0
								*bot1\mode=#H2H_AI_MODE_DISABLED
								*bot2\mode=#H2H_AI_MODE_IDLE
								enterMenu(#H2H_MENU_DIFFICULTY)
								*mainGame\type=#H2H_GAME_1VBOT
								playerPrepare(*player1,*player2,result)
								*player2\controlEnabled=#False
							EndIf
						Case #H2H_MENU_BATTLE ;==========================================================================================================================
							If fightLoop(*mainGame)
								If Not demoFight
									If currentRound>=maxRound Or *player1\victories>=(maxRound+1)/2 Or *player2\victories>=(maxRound+1)/2
										If *mainGame\type=#H2H_GAME_1V1
											enterMenu(#H2H_MENU_1V1)
										EndIf
										If *mainGame\type=#H2H_GAME_1VBOT
											enterMenu(#H2H_MENU_1VBOT)
										EndIf
									Else
										currentMenu=#H2H_MENU_RESTART
										blackScreenStart()
									EndIf
								Else
									currentMenu=#H2H_MENU_RESTART
									blackScreenStart()
								EndIf
							EndIf
						Case #H2H_MENU_RESTART ; same as battle ==========================================================================================================================
							fightLoop(*mainGame)
						Case #H2H_MENU_TUTORIAL ;==========================================================================================================================
							tutorialMenu(x,y)
						Case #H2H_MENU_CREDITS ;==========================================================================================================================
							creditMenu(x,y)
						Case #H2H_MENU_SETTINGS ;==========================================================================================================================
							Select optionMenu(x,y)
								Case 1
									; return
									enterMenu(#H2H_MENU_MAIN)
									psound(#H2H_SOUND_ID_MENUACCEPT)
									If selectedTypeTmp<>selectedType Or fullscreen<>fullscreenTmp
										selectedType=selectedTypeTmp
										fullscreen=fullscreenTmp
							 			changeScreen(*screenType(selectedType)\x,*screenType(selectedType)\y)
							 		EndIf
									exportOptions()
								Case 2
									; control menu
									enterMenu(#H2H_MENU_CONTROLS)
									psound(#H2H_SOUND_ID_MENUACCEPT)
								Case 3
									; controller menu
									enterMenu(#H2H_MENU_JOYSTICK)
									psound(#H2H_SOUND_ID_MENUACCEPT)
							EndSelect
						Case #H2H_MENU_CONTROLS ;==========================================================================================================================
							If controlMenu(x,y)
								exportOptions()
								enterMenu(#H2H_MENU_SETTINGS)
							EndIf
						Case #H2H_MENU_JOYSTICK ;==========================================================================================================================
							If controllerMenu(x,y)
								exportOptions()
								enterMenu(#H2H_MENU_SETTINGS)
							EndIf
						Case #H2H_MENU_TERRAIN ;==========================================================================================================================
							t=terrainSelection(x,y)
							If t>-2
								*mainGame\terrain=*allBackground(t)
								enterMenu(#H2H_MENU_BATTLE)
								*classIdleRight\display=#False
								*classIdleLeft\display=#False
							EndIf
						Case #H2H_MENU_DIFFICULTY ;==========================================================================================================================
							d=difficultyMenu(x,y)
							If d>=0
								If d=#H2H_AI_LEVEL_INSANE
									enterMenu(#H2H_MENU_1VBOT)
								Else
									d+1
									If Not *bot1
										returnTo=1
										*bot1=AICreate(*player1)
									EndIf
									AIDisable(*bot1)
									If Not *bot2
										*bot2=AICreate(*player2)
									EndIf
									*bot2\difficulty=d
									AIEnable(*bot2)
									enterMenu(#H2H_MENU_TERRAIN)
								EndIf
							EndIf
						Case #H2H_MENU_DEMO
							*classIdleRight\display=#False
							*classIdleLeft\display=#False
							enterMenu(#H2H_MENU_BATTLE)
					EndSelect
					;---- next menu
					If blackScreenEnabled
						If blackScreenLoop(deltaGlobal)=1
							;--- transition to new menu
							; when a black screen just reached the blackest color
							; we transition to the targeted menu
							*player1\displayDebug=-1
							*player2\displayDebug=-1
							destroyDebugSprites()
							slomo=#False
							debugEnabled=-1
							unpauseGame(#True)
							*player1\controlEnabled=#True
							*player2\controlEnabled=#True
							; currentMenu contains the menu from where we come from
							If currentMenu=#H2H_MENU_TUTORIAL Or currentMenu=#H2H_MENU_CREDITS
								FreeSprite(screenSprite)
							EndIf
							If currentMenu=#H2H_MENU_SETTINGS
								selectedTypeTmp=selectedType
								fullscreenTmp=fullscreen
							EndIf
							If currentMenu=#H2H_MENU_BATTLE
								classUnload(*player1\class,#True)
								classUnload(*player2\class,#True)
								*player1\victories=0
								*player2\victories=0
								If targetMenu<>#H2H_MENU_BATTLE And targetMenu<>#H2H_MENU_RESTART
									demoFight=#False
									demoFightTimer=0
								EndIf
								*player1\isAI=0
								*player2\isAI=0
								*bot1\mode=#H2H_AI_MODE_DISABLED
								*bot2\mode=#H2H_AI_MODE_DISABLED
							EndIf
							CompilerIf #H2H_SOUND_DYNAMIC_ENABLE
								dynamicSoundStopAll()
							CompilerEndIf
							Debug "Changed to menu "+currentMenu
							If demoFight
								currentMenu=#H2H_MENU_BATTLE
								startDemo()
							Else
								If currentMenu=#H2H_MENU_RESTART
									If currentRound>=maxRound
										currentRound=1
									Else
										If Not (currentRound=maxRound-1 And Not isPlayerAlive(*player1) And Not isPlayerAlive(*player2))
; 											Debug "INCREASED"
											currentRound+1
										EndIf
										currentMenu=#H2H_MENU_BATTLE
									EndIf
								Else
									If currentMenu<>#H2H_MENU_BATTLE
										currentRound=1
									EndIf
									currentMenu=targetMenu
								EndIf
								
							EndIf
							destroyAllParticles()
							gadgetDestroyAll()
							Select currentMenu
								Case #H2H_MENU_1V1,#H2H_MENU_1VBOT
									ready=0
									ready2=0
									playerSelected=0
									*classIdleRight\display=Bool(screenSizeX>1200)
									*classIdleLeft\display=Bool(Not #H2H_MENU_1VBOT And screenSizeX>1200)
									If screenSizeX<=1500
	; 									set(*classIdleRight\where,screenSizeX-1000,-150) ; TODO constants
										set(*classIdleRight\where,screenSizeX-900,-150)
	; 									set(*classIdleLeft\where,0,-150)
										set(*classIdleLeft\where,-100,-150)
									Else
										set(*classIdleRight\where,screenSizeX-1100) ; TODO constants
										set(*classIdleLeft\where,100)
									EndIf
									*classIdleRight\opacity=64
									*classIdleLeft\opacity=64
	; 							Case #H2H_MENU_1VBOT
	; 								ready=0
	; 								ready2=0
	; 								playerSelected=0
	; 								*classIdleRight\display=Bool(screenSizeX>1200)
	; 								*classIdleLeft\display=#False;Bool(screenSizeX>1200)
	; 								set(*classIdleRight\where,screenSizeX-1000,-150) ; TODO constants
	; 								If screenSizeX<=1500
	; ; 									set(*classIdleLeft\where,0,-150)
	; 									set(*classIdleLeft\where,-50,-150)
	; 								Else
	; 									set(*classIdleLeft\where,50,-150)
	; 								EndIf
	; 								*classIdleRight\opacity=64
									*classIdleLeft\opacity=64
								Case #H2H_MENU_GALLERY
									*classIdleRight\display=Bool(screenSizeX>1200)
									*classIdleLeft\display=0
									set(*classIdleRight\where,50,-150)
									*classIdleRight\opacity=255
									*classIdleLeft\opacity=255
								Case #H2H_MENU_RESTART
									currentMenu=#H2H_MENU_BATTLE
								Case #H2H_MENU_EXIT
									DSP_STOP()
									End
							EndSelect
							If currentMenu=#H2H_MENU_BATTLE
								startGame(*mainGame\terrain)
							Else
								If musicLevel>0
									musicExPlay(*allMusic(Str(#H2H_MUSIC_MENU)))
								EndIf
							EndIf
						EndIf
						blackScreenDisplay()
					EndIf
					CompilerIf #H2H_MOUSE_ENABLED
						cursorDisplay()
					CompilerEndIf
					If Not confirming And confirmIntensity>0
						confirm()
					EndIf
					If screenshoting
						screenShot()
						screenshoting=#False
					EndIf
	; 				tampon=unique
	; 				unique=PeekQ($7FFE0014)
	; 				afftext(RSet(Str(10000000/(unique-tampon)),22,"0"),500,500)
	; 				Delay(200)
	; 					afftext("FPS : "+Str(),500,500)
; 					averageFPS(aFI)=10000000/(temp)
; 					aFI+1
; 					If aFI>99
; 						aFI=0
; 					EndIf
; 					av.d=0
; 					For i=0 To ArraySize(averageFPS())
; 						av+averageFPS(i)
; 					Next
; 					av/ArraySize(averageFPS())
; 					afftext(StrD(temp/10000,5)+"ms / "+StrD(10000000/(temp)),500,500)
					CompilerIf #False
						afftext("FPS "+StrD(10000000/f7,1),500,500)
						afftext(StrD(temp/10000,5)+"ms",500,520)
					CompilerEndIf
					FlipBuffers()
					frameUnloadLoop()
					KeyClear()
; 					active=Bool((Not blackScreenEnabled Or blackScreenVelocity<0) And GetActiveWindow()<>-1)
					active=Bool((Not blackScreenEnabled Or blackScreenVelocity<0))
					idle=#True;Bool(currentMenu<>#H2H_MENU_BATTLE And currentMenu<>#H2H_MENU_RESTART And currentMenu<>#H2H_MENU_DEMO);#True;active;Bool(active And currentMenu<>#H2H_MENU_BATTLE)
					deltaGlobal=deltaSet(stamp)
					stamp=ElapsedMillisecondsPrecise()
	; 				deltaGlobal=(unique-tampon)/10000
				Else
					Delay(1)
				EndIf
					;}
			Case #PB_Event_Gadget
				If EventGadget()=0
					DSP_STOP()
					End
				EndIf
			Case #PB_Event_CloseWindow
				DSP_STOP()
				End
; 			Case #PB_Event_ActivateWindow
; 				If fullscreen
; 					changeScreen(screenSizeX,screenSizeY)
; 				EndIf
		EndSelect
; 		For i=1 To 32
; 			If JoystickButton(0,i)
; 				Debug "Button "+i+" "+joystickButtonName$(i)
; 			EndIf
; 		Next
	Until Event=#PB_Event_CloseWindow
; EndProcedure
DSP_STOP()
End;--- EndMain
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5291
; FirstLine = 4448
; Folding = ++4--8FGm-PLnGNz7r6-+---
; EnableXP
; Executable = hand2handDemo2_1.exe
; CPU = 1