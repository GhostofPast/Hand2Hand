;- Notes for FlameofChange by FlameofChange
; 			12/01/2022
; ======== make a rematch system
; --DROP-- bufferize the afftexts sprites (find a solution)
; ======== Display combo animation when hoovering them
; ☼=DONE=☼ Tutorial explains the stats (with + and -) and controls
; ☼=DONE=☼ controls options + save system
; ☼=DONE=☼ mouse
; ☼=DONE=☼ windowed system
; ☼=DONE=☼ gluestick hit sound damage variation
; ☼=DONE=☼ option for enabling/disabling dynamic frame loading
; ☼=DONE=☼ shaking screen when taking damage
; ☼=DONE=☼ shaking feedback screen when taking damage
; ☼=DONE=☼ get a working icon for the executable
; 			13/01/2022
; --DROP-- Double framerate but half all speed ?
;			24/02/2022
; ☼=DONE=☼ Seperate shadow display
; ☼=DONE=☼ Slowmo command
; ======== Interface elements sprites
; ☼=DONE=☼ Fix auto jump when hit
; ======== Disturbed movement system when attacked
; ☼=DONE=☼ Push system (with border check)
; ☼=DONE=☼ True afftext color
;			19/04/2022
; ☼=DONE=☼ Compress the images with 32x32 chunks
;			11/05/2022
; ☼=DONE=☼ Only store one version of a frame, delete on flip except for two occurences
; --DROP-- Bufferize to avoid frequent image flip
;			24/05/2022
; ☼=DONE=☼ Positive combo feedback
; ======== Negative combo feedback
; ☼=DONE=☼ recovery feedback
; 			24/07/2022
; ======== Juice up the animations !
;			11/09/2022
; ☼=DONE=☼ Controls options save
; ☼=DONE=☼ Two player selection screen
; 			02/10/2022
; ☼=DONE=☼ Screen options
;			27/01/2023
; ======== Layers of scrolling in arenas
; ☼=DONE=☼ Guard amount ?
;			18/02/2023
; ☼=DONE=☼ Auto check resolution
;			21/02/2023
; ======== Load sound when necessary
;			08/03/2023
; ☼=DONE=☼ Fade black when in/out of game
;			12/03/2023
; ☼=DONE=☼ Random class selection
; ☼=DONE=☼ Random stance selection
; ☼=DONE=☼ Random terrain selection
; ☼=DONE=☼ Random exclusive option
; ☼=DONE=☼ Mirror option
;			05/05/2023
; ☼=DONE=☼ Land wind effects
;			22/06/2023
; ☼=DONE=☼ 30, 50, 60, 120 and 144 fps options
;			24/06/2023
; ☼=DONE=☼ Rework player delta loop because of frameindicator overflow
;			26/06/2023
; ======== Rework player physics when delta>1
; --DROP-- Threaded player imputs
;			07/07/2023
; ☼=DONE=☼ Bot class selection
; ======== Rework interface sounds
; ☼=DONE=☼ Joystick options
; ☼=DONE=☼ Rework joystick detection & loop
;			08/07/2023
; ======== Index all structures into allocated arrays for easier access
;			[Done] location
;			[Done] frame
;			[Done] animation
;			[Done] gadget
;			       class
;			       player
;				   particle
;				   damage gadget
;				   damage data
; ======== Use interfaces to make the code lighter
; ☼=DONE=☼ Cleanup combo icons
;			17/07/2023
; ======== Fix the OpenGL x86 rotated color sprite display
; ======== Compress the images with palet
; ======== Recode pixel collision
;			02/08/2023
; ======== Selection animation
; ======== Victory animation
;			04/08/2023
; ☼=DONE=☼ frame load buffer (load a certain amount per frame)
;			05/08/2023
; ☼=DONE=☼ frame unload buffer (load a certain amount per frame)
; --DROP-- load wind only at start phase
;			12/08/2023
; ☼=DONE=☼ enable player movement at CanDoNext
;			26/10/2023
; ☼=DONE=☼ Manual screenshot & clipboard
;			30/10/2023
; ☼=DONE=☼ Rework HP bar
;			31/10/2023
; ☼=DONE=☼ idle variant in menus
; ☼=DONE=☼ Mirror in selection menu shows the mirrored class
; ☼=DONE=☼ Random in selection menu shows something (to be decided)
; ☼=DONE=☼ Hex key Heavy 1 - Heavy 2
; ☼=DONE=☼ Hex key Side 1 - Back 1 - Up 2
;			01/11/2023
; ======== Standardize image names
; ======== Standardize animation names
; ======== Standardize rawdata names
; ☼=DONE=☼ Ballpen Side 1 - Back 4 - Up 2 - Neutral 6 - Side 7
; ☼=DONE=☼ Ballpen Side 1 - Back 4 - Up 2 - Side 6
; ☼=DONE=☼ Ballpen Back 1 - Heavy 2
;			02/11/2023
; ☼=DONE=☼ Gray out dead player HUD
; ======== Spawn one player then the other at start, shift camera from one to another with half black mask if needed
; ☼=DONE=☼ Custom cannon sound
; ======== Parry
; ☼=DONE=☼ Dodge
;			03/11/2023
; ☼=DONE=☼ More colored wind effects when background is too white
;			04/11/2023
; ======== Class selection icon fade & size dynamic transition
; ☼=DONE=☼ Clean keys in menus when switching to another while still pressed
;			21/11/2023
; ☼=DONE=☼ Export remaked Unarmed Heavy 1 - Neutral 4
; ======== Animation alternates for stances
; ☼=DONE=☼ Recalculate jump animation speed minimum and maximum
; 			01/12/2023
; ======== Pause system
;			       Black screen transition
;			[Done] Quit when escaping only in pause
;			       Interrupt and resume sounds
;			[Done] Start game
;			[Done] End Game
;			[Done] During game
;			       Pause quick fading
; 			03/12/2023
; ☼=DONE=☼ Move hit frames into an animation in struct
; ======== Add Class selection idle
; ======== Add Class selection selected
; ======== Add Class selection selecting
; ☼=DONE=☼ Rename jump into special
; ☼=DONE=☼ Jump with special + up
; ☼=DONE=☼ Dodge with special
; ======== Pary with special + down
; ======== Pary only when coming from front
; ======== Countdown in rythm with the music
; 			13/02/2024
; ======== Migrate to spritesheet system & switch in code
;           01/05/2024
; ======== Flicker HP bar in red when low
; ======== VFX and SFX when the outer HP bar is broken
;           15/05/2024
; ======== Repeating attacks
;           16/05/2024
; ☼=DONE=☼	 Chopstick Up 1 - Side 7
; ☼=DONE=☼ Chopstick Back 1 - Heavy 2 - Back 2 - Side 8 
;           18/05/2024
; ☼=DONE=☼ Ballpen Down 1 - Down 3 - Down 4
; ☼=DONE=☼ Damage loop change
;           20/05/2024
; ======== ArePlayersEnemy
; ======== AreGroupsEnemy
;           23/05/2024
; ======== Joystick sensibility settings
;           27/05/2024
; ======== JSON flags
;		[Done]	Frames
;		[Done]	animations
;				classes
; ☼=DONE=☼ Seperate jump button option
; ☼=DONE=☼ Seperate parry button option
; ☼=DONE=☼ Seperate dash button option
;           11/06/2024
; ======== Joystick mode : classic, legacy and custom
; ======== Joystick settings explicit JSON button names
; ======== Save Joystick ID for player
; ======== Detect joystick entry and exit + notification
;           03/06/2024
; ======== Import/export game constants in the JSON
;           28/08/2024
; ======== Tutorial scaled for screen sizes
;           29/08/2024
; ☼=DONE=☼ Chopstick Down 1 - Down 2 - Back 5 - Side 9
;           13/09/2024
; ======== Text color code
; ======== Cyrilic font
; ======== Export strings to langage file
; ======== Read langage file
; ======== Langage option
; ======== Langage detection
; ======== Button structure to save string
;
; IncludeFile "noleak.pb"

#H2H_VERSION="alpha 0.1.1.1"
#Orange=$0080FF
CompilerIf #PB_Compiler_Processor<>#PB_Processor_x86 And #PB_Compiler_Processor<>#PB_Processor_x64
	CompilerError "This game only works on x86 or x64 processors"
CompilerEndIf

#H2H_MODE_LOAD=0
#H2H_MODE_SAVE=1
;------ Mode
#H2H_MODE=#H2H_MODE_SAVE
#H2H_MOUSE_ENABLED=#False
#H2H_DIGESTION_ENABLE=#False
#H2H_CONTROL_UPGRADE=#True
;---- time
initTime=ElapsedMilliseconds()
#H2H_FRAMEPERSECOND=50.0
#H2H_FRAMEMILISECONDS=1000.0/#H2H_FRAMEPERSECOND
Global deltaGlobal.d=1 ; in frames
Global Dim fpsMode(10)
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
#H2H_FPS_MODE_DEFAULT=6
Global currentFPSMode=#H2H_FPS_MODE_DEFAULT
Global globalFPS.i=fpsMode(currentFPSMode)
Global currentMillisecond.d=1000.0/globalFPS
Global defaultMillisecond.d=1000.0/#H2H_FRAMEPERSECOND
Global defaultDelta.d=currentMillisecond/defaultMillisecond
Debug "global "+currentMillisecond
#H2H_FPS_SHOW_DEFAULT=1
Global showFPS=#H2H_FPS_SHOW_DEFAULT
Procedure fpsModeChange(toWhat.i)
	currentFPSMode=toWhat
	globalFPS=fpsMode(currentFPSMode)
	currentMillisecond=1000.0/globalFPS
	defaultDelta=currentMillisecond/defaultMillisecond
EndProcedure

#H2H_HALFMODE=0 ; if true FPS is halved and sounds are 2x slower
;--- Macro
#H2H_DEBUG=0
Global debugEnabled=#H2H_DEBUG
Global debugOption=debugEnabled
Macro sensibleInit(what,whatstring):If Not what:MessageRequester("Hand2Hand error","Could not be able to init "+whatstring,#PB_MessageRequester_Ok):End:EndIf:EndMacro
Procedure.d lerp(y0.d,y1.d,t.d)
	ProcedureReturn (y1-y0)*t+y0
EndProcedure
; mauvais pour le proq !
Procedure.i max(a.i,b.i=0)
	If a>b
		ProcedureReturn a
	EndIf
	ProcedureReturn b
EndProcedure

Procedure.i min(a.i,b.i=0)
	If a<b
		ProcedureReturn a
	EndIf
	ProcedureReturn b
EndProcedure

#H2H_THREADED_LOAD=0 ; doesn't work, freezes

;-- combo icon
#H2H_COMBO_X_SHIFT=680
Enumeration 1
	#H2H_COMBO_DISPLAY_BIG
	#H2H_COMBO_DISPLAY_SMALL
	#H2H_COMBO_DISPLAY_NONE
EndEnumeration

#H2H_COMBO_DISPLAY_DEFAULT=#H2H_COMBO_DISPLAY_BIG

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
sensibleInit(InitKeyboard(),"Keyboard")
sensibleInit(InitSound(),"sounds")
sensibleInit(InitSprite(),"sprites")
UsePNGImageDecoder()
UseOGGSoundDecoder()
ExamineDesktops()
Global spriteIndex=1
Global Dim isSpriteSwaped(0)
Procedure spriteIndexAdd(add.i=1)
	spriteindex+add
	If spriteIndex>ArraySize(isSpriteSwaped())
		ReDim isSpriteSwaped(spriteIndex)
	EndIf
	ProcedureReturn spriteIndex-add
EndProcedure
Global screenSizeX=DesktopWidth(0)
Global screenSizeY=DesktopHeight(0)
Global keyboardType=#PB_Keyboard_International

#H2H_CONSOLE_ENABLED=0

;--- Background screen
#H2H_SCREEN_BORDER_THICKNESS=20
#H2H_SCREEN_BORDER_STEP=8
#H2H_SCREEN_BORDER_TEMPER=0.3
Global backscreen=spriteIndexAdd()
Global selectedType=0
Procedure clearScreenGray()
	If Not IsSprite(backscreen)
		CreateSprite(backscreen,screenSizeX,screenSizeY)
		TransparentSpriteColor(backscreen,RGB(1,1,1))
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
#H2H_BLACK_SCREEN_VELOCITY_BASE=12.8
Global blackScreenVelocity.d=0;#H2H_BLACK_SCREEN_VELOCITY_BASE
Global blackScreenEnabled=#False

Macro blackScreenControlBlock()
	(Bool(blackScreenEnabled And blackScreenVelocity>0))
EndMacro

Procedure blackScreenDisplay()
	If Not IsSprite(blackScreen)
		CreateSprite(blackScreen,screenSizeX,screenSizeY)
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
; 		If delta<=0
; 			delta=defaultDelta
; 		EndIf
; 		Debug "opacity "+blackScreenOpacity
; 		Debug "velocity "+blackScreenVelocity
		blackScreenOpacity+(blackScreenVelocity*delta)
; 		Debug "after "+blackScreenOpacity
		If blackScreenOpacity>255
			blackScreenOpacity=255
			blackScreenVelocity=-#H2H_BLACK_SCREEN_VELOCITY_BASE
			ProcedureReturn 1
		EndIf
		If blackScreenOpacity<=0
			blackScreenOpacity=0
			blackScreenVelocity=0
; 			Debug "broke"
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
	Debug "start"
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

IncludeFile "location.pb"
;--- JSON

Global JSONindex=0
IncludeFile "json.pb"

Global Dim *screenType.location(9)

*screenType(0)=locationCreate(1024, 768)
*screenType(1)=locationCreate(1280, 720)
*screenType(2)=locationCreate(1280, 768)
*screenType(3)=locationCreate(1280, 800)
*screenType(4)=locationCreate(1280, 960)
*screenType(5)=locationCreate(1280,1024)
*screenType(6)=locationCreate(1360, 768)
*screenType(7)=locationCreate(1680,1050)
*screenType(8)=locationCreate(1920,1080)
*screenType(9)=locationCreate(1920,1200)
DisableASM
;--- console
Global consoleCreated=0
If debugEnabled
	CompilerIf #H2H_CONSOLE_ENABLED
		If Not OpenConsole("Hand2Hand "+#H2H_VERSION)
			MessageRequester("Hand2Hand error","Could not be able to init console",#PB_MessageRequester_Ok)
			End
		EndIf
		consoleCreated=1
	CompilerEndIf
EndIf

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

;----- UI Atlas
#H2H_ICON_ATLAS_ENABLED=#True
CompilerIf #H2H_ICON_ATLAS_ENABLED
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
; 	#H2H_ICON_SOON²
EndEnumeration
Declare spriteFlip(what.i,mirrored.i=0)
Global iconAtlas=spriteIndexAdd()
LoadSprite(iconAtlas,"image/icons.png",#PB_Sprite_AlphaBlending)
; Prepare the atlat so select the sprite
; returns the coords of the element in YYYXXX format
Procedure.i UISelect(what.i)
 	RotateSprite(iconAtlas,0,#PB_Absolute)
	spriteFlip(iconAtlas,0)
	ZoomSprite(iconAtlas,#PB_Default,#PB_Default)
	ClipSprite(iconAtlas,#PB_Default,#PB_Default,#PB_Default,#PB_Default)
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
CompilerElse
;--- dot & crescent
Global dot=spriteIndexAdd()
Global crescent=spriteIndexAdd()
#H2H_CRESCENT_SPACE=18
Global comboIconSmallNeutral=spriteIndexAdd()
Global comboIconSmallUp=spriteIndexAdd();spriteIndex:spriteIndex+2 ; Because we need a flip for this one
Global comboIconSmallHeavy=spriteIndexAdd()
CompilerEndIf

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

Global Dim isSpriteSwaped.i(0)
Global Dim isSpriteZoomed.i(0)
Declare spriteFlip(what.i,mirror.i=#False)

Procedure displayComboSprite(what.i,x.i,y.i,color.i=-1,intensity.i=128,small.i=#False,mirror.i=#False,size.d=1,opacity.i=255)
	s=0
	Select what
		Case #H2H_COMBO_NUP,#H2H_COMBO_NSIDE,#H2H_COMBO_NDOWN,#H2H_COMBO_NBACK
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			If small
				s=iconAtlas
				UISelect(#H2H_ICON_UP)
			Else
				s=comboIconUp
; 				If mirror
; 					s+1
; 				EndIf
			EndIf	
			CompilerElse
			If small
				s=comboIconSmallUp
			Else
				s=comboIconUp
			EndIf
; 			If mirror
; 				s+1
; 			EndIf
			CompilerEndIf
		Case #H2H_COMBO_HEAVY
			If small
			CompilerIf #H2H_ICON_ATLAS_ENABLED
				UISelect(#H2H_ICON_STRENGTH)
				s=iconAtlas
			CompilerElse
				s=comboIconSmallHeavy
			CompilerEndIf
			Else
				s=comboIconHeavy
			EndIf
		Case #H2H_COMBO_NEUTRAL
			If small
			CompilerIf #H2H_ICON_ATLAS_ENABLED
				UISelect(#H2H_ICON_NEUTRAL)
				s=iconAtlas
			CompilerElse
				s=comboIconSmallNeutral
			CompilerEndIf
			Else
				s=comboIconNeutral
			EndIf
	EndSelect
	If s>0
		SpriteQuality(#PB_Sprite_BilinearFiltering)
		spriteFlip(s,0)
		ZoomSprite(s,#PB_Default,#PB_Default)
		CompilerIf #H2H_ICON_ATLAS_ENABLED
		If small
			size/2
		EndIf
		CompilerEndIf
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
	Else
		Debug "Unkown combo !"
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
Declare resetGroundLevel()
#H2H_WINDOWED=1
#H2H_SCREEN_FULL_DEFAULT=1
Global fullscreen=#H2H_SCREEN_FULL_DEFAULT
#HITBOX_SIZE=200
Global screenLineSpan=screenSizeX-#HITBOX_SIZE
Macro refreshScreenLifeSpan()
	screenLineSpan=screenSizeX-#HITBOX_SIZE
EndMacro

Procedure changeScreen(x.i,y.i)
	CompilerIf #H2H_WINDOWED
		screenSizeX=x
		screenSizeY=y
		If gamescreen
			CloseWindow(0)
		EndIf
		If fullscreen
; 			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_BorderLess)
			gamescreen=OpenWindow(0,0,0,x,y,"Hand2Hand project "+#H2H_VERSION)
; 			gamescreen=OpenWindow(0,0,0,windowSizeX,windowSizeY,"Hand2Hand project "+#H2H_VERSION,#PB_Window_BorderLess)
; 			gamescreen=OpenScreen(screenSizeX,screenSizeY,32,"Hand2Hand project "+#H2H_VERSION,#PB_Screen_NoSynchronization)
		Else
; 			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_SystemMenu|#PB_Window_ScreenCentered|#PB_Window_Maximize|#PB_Window_MinimizeGadget)
			gamescreen=OpenWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y,"Hand2Hand project "+#H2H_VERSION,#PB_Window_SystemMenu|#PB_Window_ScreenCentered|#PB_Window_Maximize|#PB_Window_MinimizeGadget)
		EndIf
		If Not gamescreen
			MessageRequester("Hand2Hand error","Could not be able to create screen",#PB_MessageRequester_Error)
			End
		EndIf
		If fullscreen
			If Not OpenWindowedScreen(WindowID(0),0,0,x,y,#True,0,0,#PB_Screen_NoSynchronization)
				MessageRequester("Hand2Hand error","Could not be able to create windowed screen",#PB_MessageRequester_Error)
				End
			EndIf
		Else
			If Not OpenWindowedScreen(WindowID(0),0,0,x,y,#True,0,0,#PB_Screen_NoSynchronization)
				MessageRequester("Hand2Hand error","Could not be able to create windowed screen",#PB_MessageRequester_Error)
				End
			EndIf
		EndIf
		
		If fullscreen
			Debug "Full screen resize "+windowSizeX+" "+windowSizeY+" | "+x+" "+y
			ResizeWindow(0,-3,-28,windowSizeX,windowSizeY)
 			WindowBounds(0,windowSizeX,windowSizeY,windowSizeX,windowSizeY)
 		Else
			Debug "resize"
 			ResizeWindow(0,(windowSizeX-x)/2,(windowSizeY-y)/2,x,y)
 			WindowBounds(0,x,y,x,y)
 		EndIf
		loadBasicSprites()
		resetGroundLevel()
		refreshScreenLifeSpan()
	CompilerElse
		gamescreen=OpenScreen(x,y,32,"Hand2Hand project "+#H2H_VERSION,#PB_Screen_NoSynchronization)
	CompilerEndIf
EndProcedure
Declare importOptions()
If importOptions()
	screenSizeX=*screenType(selectedType)\x
	screenSizeY=*screenType(selectedType)\y
Else
	detectWindowSize()
EndIf
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
#H2H_TEXT_WHITE_PATH="image\letter_white.png"
textWhite=initAffText(#H2H_TEXT_WHITE_PATH)
initBigText()
; Depreciated, must be deleted
Global randomClassIcon=-1;spriteIndexAdd()
Global mirrorClassIcon=-1;spriteIndexAdd()

#H2H_CLASS_ICON_SIZE=170
Procedure classIconLoad()
; 	If Not IsSprite(randomClassIcon)
; 		LoadImage(0,#H2H_TEXT_WHITE_PATH)
; 		GrabImage(0,1,(Asc("?")-Asc(" "))*#CHAR_SIZE_X,0,#CHAR_SIZE_X,#CHAR_SIZE_Y)
; 		FreeImage(0)
; 		CreateSprite(randomClassIcon,16,16)
; 		TransparentSpriteColor(randomClassIcon,RGB(0,0,0))
; 		StartDrawing(SpriteOutput(randomClassIcon))
; 		DrawImage(ImageID(1),0,0)
; 		StopDrawing()
; 		FreeImage(1)
; 		ZoomSprite(randomClassIcon,96,96)
; 	EndIf
; 	If Not IsSprite(mirrorClassIcon)
; 		LoadImage(0,#H2H_TEXT_WHITE_PATH)
; 		GrabImage(0,1,(Asc("M")-Asc(" "))*#CHAR_SIZE_X,0,#CHAR_SIZE_X,#CHAR_SIZE_Y)
; 		FreeImage(0)
; 		CreateSprite(mirrorClassIcon,16,16)
; 		TransparentSpriteColor(mirrorClassIcon,RGB(0,0,0))
; 		StartDrawing(SpriteOutput(mirrorClassIcon))
; 		DrawImage(ImageID(1),0,0)
; 		StopDrawing()
; 		FreeImage(1)
; 		ZoomSprite(mirrorClassIcon,96,96)
; 	EndIf
	If Not IsSprite(classIconBack)
		CreateSprite(classIconBack,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
		StartDrawing(SpriteOutput(classIconBack))
		Box(0,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#White)
		StopDrawing()
	EndIf
EndProcedure

classIconLoad()

;--- Colors
Macro Color(r,g,b)
	r+(g<<8)+(b<<16)
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
#H2H_STANCE_COLOR_ORANGE=#Orange
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

;--- hints

Global Dim hint$(20)
Global nbHint=-1
Global currentHint
Procedure hintAdd(str$)
	nbHint+1
	ReDim hint$(nbHint)
	hint$(nbHint)=str$
EndProcedure
hintAdd("Heavy classes are strong at buldozing the opponent,\dealing raw damage and taking a lot of hits")
hintAdd("Light classes are very mobile & effective at dodging attacks")
hintAdd("High strength classes aren't hindered by their weight")
hintAdd("Regeneration only affect the inner HP bar and only regenerates a finite amount")
hintAdd("Stances alter the stats but never changes the total\They can make a class more balanced or specialized")
hintAdd("A successful hit but failed combo has only half cooldown")
hintAdd("Take a screenshot with shift+F")
hintAdd("Parry and dodge is not instant going in and out, speed reduces the delay")
hintAdd("Parry light attacks and dodge heavy attacks, not the reverse !")
hintAdd("Neutral attacks have low effects but are very quick & easy to hit")
hintAdd("Side attacks tends to advance the hand forward, effective at pursing the retreating enemy")
hintAdd("Up attacks are effective at punishing someone in the air")
hintAdd("Down attacks are often short ranged and defensive")
hintAdd("Heavy attacks are easy to dodge but hits very hard")
hintAdd("The player hitbox is a circle centered on its palm\Fingers are not vital")
hintAdd("Don't do this at home with sharp or pointy objects !")
hintAdd("If you practice IRL when you're not alone, don't clash both objects together")
hintAdd("Landing effects hint the player weight")
hintAdd("Some attacks stuns, others dont !\Dealing damage doesn't mean stunning too !\Other attacks are meant to make the combos easier to hit")
hintAdd("No online yet, but Steam Remote Play somewhat works")
hintAdd("Deleting the settings file will reset them to default")
hintAdd("The game works better on keyboard")
hintAdd("Guaranteed without generative AI !")
hintAdd("Hitbox roughly corresponds to the palm\nThis means its fingers and weapon don't hurt when hit")
hintAdd("Don't hesitate to join the discord in the steam and itch.io pages !")
hintAdd("Some AI stances has specific behaviors")

;--- includes
IncludeFile "joystick.pb"
IncludeFile "timertest.pb"
IncludeFile "RotateImage.pb"
IncludeFile "soundpool.pb"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	IncludeFile "rawdata.pb"
CompilerEndIf
IncludeFile "frame.pb"
IncludeFile "animation.pb"
IncludeFile "control.pb" ; /!\ contains also controlstate
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

Procedure screenShot()
	StartDrawing(ScreenOutput())
	GrabDrawingImage(0,0,0,screenSizeX,screenSizeY)
	StopDrawing()
	SetClipboardImage(0)
	FreeImage(0)
EndProcedure
;------ pause system
Declare refreshMusicLevel()
Procedure pauseGame()
	If Not gamePaused
		Debug "paused"
		gamePaused=#True
		musicLevel=musicLevel/2
		psound(#H2H_SOUND_ID_MENUCANCEL)
		refreshMusicLevel()
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
		refreshMusicLevel()
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

Procedure displayPause(*p.player=0)
	DisplayTransparentSprite(backscreen,0,0,128)
	AfftextColor("GAME PAUSED",200,200,#Red,192,3)
	If *p And *p\joystickId>-1
		AfftextColor("Press "+keyToString$(*menuControlKeys\heavy)+" (or "+joystickButtonName$(*p\joystickControl\accept)+") to resume",300,300)
		AfftextColor("Press "+keyToString$(*menuControlKeys\special)+" (or "+joystickButtonName$(*p\joystickControl\exit)+") to quit",400,400,#Orange)
	Else
		AfftextColor("Press "+keyToString$(*menuControlKeys\heavy)+" to resume",300,300)
		AfftextColor("Press "+keyToString$(*menuControlKeys\special)+" to quit",400,400,#Orange)
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

;- music
; in the background file

;--- Background
Global terrainWidth=3000

Global *desktop.background=backgroundCreate(0,"image/background1_")
*desktop\height=100
*desktop\music=#H2H_MUSIC_THEME01
*desktop\musicPath$=#H2H_MUSIC_THEME01_PATH
*desktop\name$="Home desktop"
*desktop\leftLimit=25
*desktop\rightLimit=1975

Global *college.background=backgroundCreate(0,"image/background2_",6,1000)
*college\height=-520
*college\music=#H2H_MUSIC_THEME02
*college\musicPath$=#H2H_MUSIC_THEME02_PATH
*college\name$="College"
*college\leftLimit=275
*college\rightLimit=5975
*college\white=#True

Global *boardGameClub.background=backgroundCreate(0,"image/background3_",5,1000)
*boardGameClub\height=-560

*boardGameClub\music=#H2H_MUSIC_THEME03
*boardGameClub\musicPath$=#H2H_MUSIC_THEME03_PATH

*boardGameClub\introMusic=#H2H_MUSIC_STARTUP03
*boardGameClub\introMusicPath$=#H2H_MUSIC_STARTUP03_PATH

*boardGameClub\name$="Board game club"
*boardGameClub\leftLimit=25
*boardGameClub\rightLimit=4975
*boardGameClub\white=#True

Global Dim allMusic(#H2H_MUSIC_STARTUP03)
Procedure refreshMusicLevel()
	For i=#H2H_MUSIC_MENU To #H2H_MUSIC_STARTUP03
		If IsSound(i)
			SoundVolume(i,musicLevel)
		EndIf
	Next
EndProcedure

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

hitSoundCreate(*wood_hitCut,*wood_hitCutBlocked,*wood_hitCutLight,*wood_hitCutMedium,*wood_hitCutHeavy)
hitSoundSet(*wood_hitCut)
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

*plastic_hitPierceHeavy=*wood_hitPierceHeavy
*plastic_hitCut=*wood_hitCut
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
hitSoundCreate(*crackHitBlunt,*allSoundPool(#H2H_SOUND_ID_HAND_CREAK),*allSoundPool(#H2H_SOUND_ID_HAND_CREAK),*allSoundPool(#H2H_SOUND_ID_HAND_CREAK),*allSoundPool(#H2H_SOUND_ID_HAND_CREAK))
hitSoundSet(*crackHitBlunt,4,9,16)
*crack_hitS.hitSoundMaterial=hitSoundMaterialCreate(0,*crackHitBlunt,*crackHitBlunt,*crackHitBlunt)

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
	decodeAllShift(*loadingAnimations(0),*loading1Raw)
	decodeAllShift(*loadingAnimations(1),*loading2Raw)
	setFrameLength(*loadingAnimations(1),0,8)
	setFrameLength(*loadingAnimations(1),1,8)
	setFrameLength(*loadingAnimations(1),2,12)
	setFrameLength(*loadingAnimations(1),3,8)
	setFrameLength(*loadingAnimations(1),4,8)
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

Procedure swishesFree()
	animationArrayFree(*landLightFront)
	animationArrayFree(*landLightBack)
	animationArrayFree(*landHeavyFront)
	animationArrayFree(*landHeavyBack)
EndProcedure

Declare loadComboSprites()
Procedure loadBasicSprites()
	; cursor
	CompilerIf #H2H_MOUSE_ENABLED
		LoadSprite(cursorNormal,"image/cursor_normal.png")
		TransparentSpriteColor(cursorNormal,RGB(0,0,0))
		LoadSprite(cursorSelect,"image/cursor_select.png")
		TransparentSpriteColor(cursorSelect,RGB(0,0,0))
		LoadSprite(cursorClick,"image/cursor_click.png")
		TransparentSpriteColor(cursorClick,RGB(0,0,0))
	CompilerEndIf
	initAffText("image/letter_white.png")
	
	statLoad()
	
	createShadowSprite()
	createHitBoxSprite()
	
; 	hpBarInit()
	
	LoadSprite(counter(1),"image/counterTwo.png",#PB_Sprite_AlphaBlending)
	LoadSprite(counter(2),"image/counterThree.png",#PB_Sprite_AlphaBlending)
	
	classIconLoad()
	
	;ground
	CreateSprite(groundSprite,screenSizeX,100)
	StartDrawing(SpriteOutput(groundSprite))
	Box(0,0,screenSizeX,100,RGB(128,0,0))
	StopDrawing()
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
		*newAnimation.animation=animationCreate(0,looped,recovery+damage+damageType+side,recovery,name$)
		*newAnimation\animationType=type
		For i=0 To number
			k=i+1
			animationAddFrame(*newAnimation,frameCreate(0,baseLength,path$+k,1,0,1,damage,0,damageType,side))
		Next
; 		Debug "for path "+path$
		decodeAllShift(*newAnimation,*raw)
		ProcedureReturn *newAnimation
	EndProcedure
	*landLightFront(0)=classGenerateAnimation(3,"image/land_light_front1_",3,#H2H_ANIMATIONTYPE_LAND,"light land front wind",0,*landLightFront1Raw)
	setFrameFreeMovement(*landLightFront(0)\frames(0))
	setFrameLength(*landLightFront(0),2,6)
	setFrameLength(*landLightFront(0),3,9)
	*landLightBack(0)=classGenerateAnimation(3,"image/land_light_back1_",3,#H2H_ANIMATIONTYPE_LAND,"light land back wind",0,*landLightBack1Raw)
	setFrameFreeMovement(*landLightBack(0)\frames(0))
	setFrameLength(*landLightBack(0),2,6)
	setFrameLength(*landLightBack(0),3,9)
	*landHeavyFront(0)=classGenerateAnimation(4,"image/land_heavy_front1_",3,#H2H_ANIMATIONTYPE_LAND,"heavy land front wind",0,*landHeavyFront1Raw)
	setFrameFreeMovement(*landHeavyFront(0)\frames(0))
	setFrameLength(*landHeavyFront(0),3,6)
	setFrameLength(*landHeavyFront(0),4,9)
	*landHeavyBack(0)=classGenerateAnimation(3,"image/land_heavy_back1_",3,#H2H_ANIMATIONTYPE_LAND,"heavy land back wind",0,*landHeavyBack1Raw)
	setFrameFreeMovement(*landHeavyBack(0)\frames(0))
	setFrameLength(*landHeavyBack(0),2,6)
	setFrameLength(*landHeavyBack(0),3,9)
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
; IncludeFile "stylus.pb"
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
IncludeFile "plainStylet.pb"

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
		animationExportJSON(*what(i),*e)
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
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure JSONExportAll(path$)
	current=JSONindex
	*parent=CreateJSONObject()
	
	*class=AddJSONMember(*parent,#H2H_JSON_CLASS)
	SetJSONArray(*class)
	classJSONExportAll(*class)
	
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
	JSONPlayerExport(*player)
	
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
		hitSoundJSONImportAll(GetJSONMember(*parent,#H2H_JSON_SOUND_CLASS))
		materialJSONImportAll(GetJSONMember(*parent,#H2H_JSON_SOUND_MATERIAL))
		classJSONImportAll(GetJSONMember(*parent,#H2H_JSON_CLASS))
		JSONImportEffectAll(GetJSONMember(*parent,#H2H_JSON_EFFECT))
		JSONImportLoadingAll(GetJSONMember(*parent,#H2H_JSON_LOADING))
		JSONPlayerImport(GetJSONMember(*parent,#H2H_JSON_PLAYER))
		FreeJSON(JSONindex)
	Else
		MessageRequester("Error","Failed to open the data file\n(do not move or delete it !)",#PB_MessageRequester_Error)
	EndIf
EndProcedure
CompilerEndIf
;--- import export
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	JSONExportAll("data.json")
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	JSONImportAll("data.json")
	Define *chineseStaff.class=*allClasses(0)
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
	LoadSprite(comboIconNeutral		,"image/comboNeutral.png",#PB_Sprite_AlphaBlending)
	LoadSprite(comboIconUp		,"image/comboUp.png",#PB_Sprite_AlphaBlending)
; 	LoadSprite(comboIconUp			,"image/comboUp.png",#PB_Sprite_AlphaBlending)
; 	loadAndMir(comboIconUp			,"image/comboUp.png")
	LoadSprite(comboIconHeavy		,"image/comboHeavy.png",#PB_Sprite_AlphaBlending)
	CompilerIf Not #H2H_ICON_ATLAS_ENABLED
	LoadSprite(comboIconSmallNeutral,"image/comboNeutral_small.png",#PB_Sprite_AlphaBlending)
	LoadSprite(comboIconSmallUp,"image/comboNUp_small.png",#PB_Sprite_AlphaBlending)
; 	LoadSprite(comboIconSmallUp		,"image/comboNUp_small.png",#PB_Sprite_AlphaBlending)
; 	loadAndMir(comboIconSmallUp			,"image/comboNUp_small.png")
	LoadSprite(comboIconSmallHeavy	,"image/comboHeavy_small.png",#PB_Sprite_AlphaBlending)
	CompilerEndIf
EndProcedure
loadComboSprites()

;------ Player creation
; *player3ctrl.control=controlSet(0,#PB_Key_Up,#PB_Key_Down,#PB_Key_Right,#PB_Key_Left,#PB_Key_P,#PB_Key_O,#PB_Key_L)
; Global player3.player
; createPlayer(player3,"Player one",RGB(192,64,0),*player3ctrl,*chineseStaff)
; animationcopy(player3\currentAnimation,player3\class\idle)
; player3\direction=0
; set(player3\position,2000+screenSizeX/3-#HITBOX_SIZE-#HITBOX_SHIFT_X,screenSizeY-1200+#HITBOX_SHIFT_Y)

Global *bot1.bot
*player1ctrl.control=controlSet(0,#PB_Key_Up,#PB_Key_Down,#PB_Key_Right,#PB_Key_Left,#PB_Key_P,#PB_Key_O,#PB_Key_I)
Global *player1.player=createPlayer(0,"Player one",#H2H_STANCE_COLOR_VERMILLON,*player1ctrl,*chineseStaff)
*player1\alternateColor=#Yellow
If InitJoystick()>0
	*player1\joystickId=0
EndIf
playerSetClass(*player1,*unarmed,0)
Debug "player class "+*player1\class\name
playerResetAnimationTo(*player1,playerGetIdle(*player1))

Global *bot2.bot
*player2ctrl.control=controlSet(0,#PB_Key_Y,#PB_Key_H,#PB_Key_J,#PB_Key_G,#PB_Key_Q,#PB_Key_W,#PB_Key_E)
Global *player2.player=createPlayer(0,"Player two",#H2H_STANCE_COLOR_LIGHTBLUE,*player2ctrl,*chineseStaff,1)
playerResetAnimationTo(*player2,playerGetIdle(*player2))
playerSetClass(*player2,*chineseStaff,0)
If InitJoystick()>1
	*player2\joystickId=1
EndIf
*player2\alternateColor=#White

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
		CreateSprite(debugLine,2,*college\size/40)
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
; Declare gameloop(*what.game=0,gameType.i=#H2H_GAME_1V1)
Declare endGame(deadplayer.i=0,*what.game=0, gameType.i=#H2H_GAME_1V1,*b.background=0)
Declare selectmenu(x.i=0,y.i=0)
Enumeration 1
	#H2H_CLASS_GALLERY_MODE_PREVIEW
	#H2H_CLASS_GALLERY_MODE_SELECTION
	#H2H_CLASS_GALLERY_MODE_VERSUS
EndEnumeration
; Declare classGalleryLoop(mode.i=#H2H_CLASS_GALLERY_MODE_PREVIEW)

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

Procedure resetGame(*game.game=0)
	If Not *game
		*game=*mainGame
	EndIf
	resetPlayer(*player1,*game\terrain\size/2+screenSizeX/3-#HITBOX_SIZE-#HITBOX_SHIFT_X)
	resetPlayer(*player2,*game\terrain\size/2-screenSizeX/3-#HITBOX_BACKSHIFT_X)
	screenFocus=(*game\terrain\size-screenSizeX)/2
	screenFocusSet(*game)
	*player1\direction=0
	*player1\lockedDirection=0
	*player2\direction=1
	*player2\lockedDirection=1
	checkScreenFocus()
	checkPlayerFacing()
; 	hpBarFitToScreen(*player1\hpb)
; 	hpBarFitToScreen(*player2\hpb,1)
	gadgetDestroyAll()
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

Procedure.i displayMenuButtonText(x.i,y.i,text$,index.i,current.i,wip.i=0,scale.f=1)
	#H2H_MENU_BUTTON_SHIFT=#CHAR_SIZE_X*3
	If current=index
		If wip
			ProcedureReturn AfftextColor("-=["+text$+"]=- Soon...",x+#H2H_MENU_BUTTON_SHIFT,y,#Blue,128,scale)
		EndIf
		ProcedureReturn AfftextColor("-=["+text$+"]=-",x+#H2H_MENU_BUTTON_SHIFT,y,#Orange,menuTextIntensity,scale)
	EndIf
	If wip
		ProcedureReturn AfftextColor("   "+text$+"   ",x+#H2H_MENU_BUTTON_SHIFT,y,#Blue,128,scale)
	EndIf
	ProcedureReturn AfftextColor("   "+text$+"   ",x+#H2H_MENU_BUTTON_SHIFT,y,0,128,scale)
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
;Global fightTimer.d=0 ; in milliseconds
Global fightStamp.d=0 ; in milliseconds
Global totalTime.d=0 ; cumulated time starting at 0

Procedure startGame(*b.background=0)
	If Not *b
		*b=*desktop
	EndIf
	keyClear()
	*player1\controlEnabled=#False
	*player2\controlEnabled=#False
; 	hpBarFitToScreen(*player1\hpb,#True)
; 	hpBarFitToScreen(*player2\hpb)
	resetGame()
	backgroundLoad(*b)
	CompilerIf #H2H_DEBUG=1
		createDebugSprites(*b)
	CompilerEndIf
	If IsSound(#H2H_MUSIC_MENU)
		StopSound(#H2H_MUSIC_MENU)
		FreeSound(#H2H_MUSIC_MENU)
	EndIf
	If buffedFrames=#H2H_FRAME_BUFFER_OFF
		loadingStart()
		classLoad(*player2\class,#False,#False,#False,classLoad(*player1\class,#False,#False))
		loadingStop()
	EndIf
	If windEnabled
		classLoadWind(*player1\class)
		classLoadWind(*player2\class)
	EndIf
	*player1\direction=0
	*player1\lockedDirection=0
	*player2\direction=1
	*player2\lockedDirection=1
	resetLife(*player1)
	resetLife(*player2)
	*player1\recovery=0
	*player2\recovery=0
	playerGuardSet(*player1)
	playerGuardSet(*player2)
	If playerGetSpawn(*player1)
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
	ProcedureReturn
EndProcedure

Global slomo=#False

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
	ProcedureReturn Bool(c1=c2)
EndProcedure

Procedure playerPrepareColor(*p1.player,*p2.player)
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
		Debug "derp"
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
		Debug "derp 2"
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf
	
	; Case 3 : player 1 is normal and player 2 is mirror
	If Not p1Mirror And p2Mirror
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
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_ALL)
			Case 99
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
			Case 98
				playerMirror(*p1,*p2,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
		EndSelect
		; if the player 1 has taken the mirror stance
		If Not p1Random And p1Stance=98
			If p1Class=p2Class
				*p1\classStanceId=*p2\classStanceId
			Else
				playerSetStanceRandom(*p1)
			EndIf
		EndIf
		Debug "derp 3"
		playerPrepareColor(*p1,*p2)
		ProcedureReturn
	EndIf

	; Case 4 : player 2 is normal and player 1 is mirror
	If Not p2Mirror And p1Mirror
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
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_ALL)
			Case 99
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_DIFFERENT_STANCE)
			Case 98
				playerMirror(*p2,*p1,#H2H_PLAYER_MIRROR_RANDOM_STANCE)
		EndSelect
		; if the player 2 has taken the mirror stance
		If Not p2Random And p2Stance=98
			If p1Class=p2Class
				*p2\classStanceId=*p1\classStanceId
			Else
				playerSetStanceRandom(*p2)
			EndIf
		EndIf
		Debug "derp4"
		playerPrepareColor(*p1,*p2)
	EndIf
	
	; Case 5 : one player is random and the other not
	If p1Random XOr p2Random
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
		playerPrepareColor(*p1,*p2)
		Debug "derp 5"
	EndIf
EndProcedure

;--- menu enum
Enumeration 0
	#H2H_MENU_MAIN
	#H2H_MENU_1V1
	#H2H_MENU_1VBOT
	#H2H_MENU_BATTLE
	#H2H_MENU_TUTORIAL
	#H2H_MENU_SETTINGS
	#H2H_MENU_CONTROLS
	#H2H_MENU_JOYSTICK
	#H2H_MENU_TERRAIN
	#H2H_MENU_DIFFICULTY
	#H2H_MENU_GALLERY
	#H2H_MENU_CREDITS
	#H2H_MENU_EXIT ; if current menu is this, exits the game !
EndEnumeration

Global Dim previousMenu.i(4)
Global currentMenuIndex.i=0
Global targetMenu.i=#H2H_MENU_MAIN

#H2H_LOOP_DELTA=1
#H2H_HALFWAIT=0 ; for recording
#H2H_TIMER_ENABLED=#True
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
	If gamePaused
		If controlJustPressed(*menuControlKeys,heavy) Or controlJustPressed(*menuControlKeys,accept) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
			unpauseGame()
		EndIf
	Else
		If controlJustPressed(*menuControlKeys,heavy) Or controlJustPressed(*menuControlKeys,cancel) Or playerHasCommand(*player1,#H2H_CONTROL_EXIT,#True)
			pauseGame()
		EndIf
	EndIf

	If fightPhase=#H2H_FIGHT_PHASE_START
		If fightStamp=0
			If musicLevel>0
				refreshMusicLevel()
				LoadSound(*game\terrain\introMusic,*game\terrain\introMusicPath$)
				PlaySound(*game\terrain\introMusic,0,musicLevel)
			EndIf
			fightStamp=ElapsedMillisecondsPrecise()
		EndIf
		If totalTime>=3000
			fightPhase=#H2H_FIGHT_PHASE_BATTLE
			totalTime=0
			endTime=0
			cleanPlayerKey(*player1)
			cleanPlayerKey(*player2)
			*player1\controlEnabled=#True
			*player2\controlEnabled=#True
			keyClear()
			If musicLevel>0
				LoadSound(*game\terrain\music,*game\terrain\musicPath$)
				PlaySound(*game\terrain\music,#PB_Sound_Loop,musicLevel)
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
		delta/5.0
	EndIf
	If Not gamePaused
		screenShakeLoop(delta)
		damageGadgetRefreshAll(delta)
	Else
		delta=0
	EndIf
	
	remainder.d=delta
	Repeat
		td.d=0.25
		If td>remainder
			td=remainder
		EndIf
		;---actions player 1
		If isPlayerAlive(*player1)
			If *player1\pushed\attack
				at1=1
			EndIf
			If *player1\isAI And *bot1\mode<>#H2H_AI_MODE_DISABLED
				cleanPlayerKey(*player1)
				If *bot1=0
					*bot1=createAI(*player1)
				EndIf
				AI_decision(*bot1,*player2,td,*game\terrain\leftLimit,*game\terrain\rightLimit)
			EndIf
		EndIf
		If deltaDelay<=0
			refreshPlayer(*player1,*game\terrain,td,td)
		EndIf
		;---actions player 2
		If isPlayerAlive(*player2)
			If *player2\isAI And *bot2\mode<>#H2H_AI_MODE_DISABLED
				cleanPlayerKey(*player2)
				If *bot2=0
					*bot2=createAI(*player2)
				EndIf
				AI_decision(*bot2,*player1,td,*game\terrain\leftLimit,*game\terrain\rightLimit)
			EndIf
		EndIf
		If deltaDelay<=0
			refreshPlayer(*player2,*game\terrain,td,td)
		EndIf
		If deltaDelay<=0
			playerPush(*player1,*player2,*game\terrain,td)
		EndIf
		checkGrab(*player1,*player2)
		checkGrab(*player2,*player1)
		If deltaDelay<=0
			If isPlayerAlive(*player1) And isPlayerAlive(*player2)
				playerAttack(*player1,*player2,td)
				playerAttack(*player2,*player1,td)
			EndIf
			If *player1\caught And *player2\caught
				*player1\caught=0
				*player2\caught=0
			EndIf
		EndIf
		ForEach *game\allGroups()
			damageGadgetApplyAllGroup(*game\allGroups(),td)
		Next
		remainder-0.25
	Until remainder<=0
	applyDamageAll()
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
		dead=1
	EndIf
	set(*player2\screenPosition,*player2\position\x-screenFocus,*player2\position\y)
	If Not isPlayerAlive(*player2)
		dead=2
	EndIf
	
	If dead>0 And endTime=0
		If dead=1
			*player1\feedback+25
		Else
			*player2\feedback+25
		EndIf
		deltaDelay+25
		endTime=totalTime
		fightPhase=#H2H_FIGHT_PHASE_END
		If musicLevel>0
			StopSound(*game\terrain\music)
			FreeSound(*game\terrain\music)
			If *game\type=#H2H_GAME_1VBOT
				If dead=1
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
	EndIf
	
	refreshAllParticles(delta)
	displayPlayerShadow(*player1)
	displayPlayerShadow(*player2)
	displayAllParticles(#H2H_PARTICLE_LAYER_BACK)
	If deltaDelay<=0
		refreshAllGadget(delta)
	EndIf
	displayAllGadget(#H2H_GADGET_LAYER_BACK)
	If *player1\attacking And Not *player2\attacking
		displayPlayer(*player2,0,delta)
		displayPlayer(*player1,0,delta)
	Else
		displayPlayer(*player1,0,delta)
		displayPlayer(*player2,0,delta)
	EndIf
		
	damageGadgetDisplayAll(Bool(debugOption And *player1\displayDebug>0))
	displayAllParticles(#H2H_PARTICLE_LAYER_FRONT)
	displayAllGadget(#H2H_GADGET_LAYER_FRONT)
; 	hpBarDisplay(*player2\hpb,delta)
; 	hpBarDisplay(*player1\hpb,delta)
	HUDRefresh(*player1\hud,deltaGlobal)
	HUDRefresh(*player2\hud,deltaGlobal)
	playerHUDDisplay(*player1)
	playerHUDDisplay(*player2,#True)
	If debugOption
		If *player1\displayDebug>0
			displayPlayerDebug(*player1)
		EndIf
		If *player2\displayDebug>0
			displayPlayerDebug(*player2)
		EndIf
	EndIf
	
	If comboDisplayMode<>#H2H_COMBO_DISPLAY_NONE
		If isPlayerAlive(*player1)
			displayPlayerCombo(*player1,deltaGlobal)
		EndIf
		If isPlayerAlive(*player2)
			displayPlayerCombo(*player2,deltaGlobal)
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
			If at1
				Afftext("attack",600,600)
			EndIf
		EndIf
	EndIf
	If *game\terrain\white
		AfftextColor("Hand2Hand project "+#H2H_VERSION,0,screenSizeY-#CHAR_SIZE_Y*2,#Orange)
	Else
		AfftextColor("Hand2Hand project "+#H2H_VERSION,0,screenSizeY-#CHAR_SIZE_Y*2)
	EndIf
	
	If fightPhase=#H2H_FIGHT_PHASE_END
		y=0
		If *game\type=#H2H_GAME_1V1
			If dead=2
				y=AfftextColor("Winner is player 1 !",100,200,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
			Else
				y=AfftextColor("Winner is player 2 !",100,300,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
			EndIf
		EndIf
		If *game\type=#H2H_GAME_1VBOT
			If dead=2
				y=AfftextColor("You win !!!",100,300,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
			Else
				y=AfftextColor("You lose...",100,300,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
			EndIf
		EndIf
		If dead=2
			AfftextColor("Back to the main menu in "+Str(max(5-((totalTime-endtime)/1000)))+" seconds",100,y,playerGetColor(*player1),playerGetColorIntensity(*player1)/2,2)
		Else
			AfftextColor("Back to the main menu in "+Str(max(5-((totalTime-endtime)/1000)))+" seconds",100,y,playerGetColor(*player2),playerGetColorIntensity(*player2)/2,2)
		EndIf
		If totalTime>=endTime+5000
			finished=#True
			totalTime=endTime+5000
		EndIf
	EndIf
	;----- commands
	If debugOption
		;{
		If KeyPushedPB(#PB_Key_LeftShift) Or KeyPushedPB(#PB_Key_RightShift)
			If isPlayerAlive(*player1) And isPlayerAlive(*player2) And fightPhase=#H2H_FIGHT_PHASE_BATTLE
				If keyJustPushedPB(#PB_Key_R)
					resetGame()
				EndIf
				If keyJustPushedPB(#PB_Key_V)
					If Not *bot1
						*bot1=createAI(*player1)
					EndIf
					If *bot1\mode=#H2H_AI_MODE_DISABLED
						enableAI(*bot1)
					Else
						disableAI(*bot1)
					EndIf
				EndIf
				If keyJustPushedPB(#PB_Key_B)
					If Not *bot2
						*bot2=createAI(*player2)
					EndIf
					If *bot2\mode=#H2H_AI_MODE_DISABLED
						enableAI(*bot2)
					Else
						disableAI(*bot2)
					EndIf
				EndIf
				If keyJustPushedPB(#PB_Key_2)
					resetLife(*player1)
					resetLife(*player2)
				EndIf
			EndIf
			If debugEnabled<>0
				If keyJustPushedPB(#PB_Key_D)
					*player1\displayDebug=*player1\displayDebug*-1
					*player2\displayDebug=*player2\displayDebug*-1
					debugEnabled*-1
					If debugEnabled=1
						createDebugSprites(*game\terrain)
					Else
						destroyDebugSprites()
					EndIf
				EndIf
			EndIf
			If keyJustPushedPB(#PB_Key_0)
				If showFPS
					showFPS=0
				Else
					showFPS=1
				EndIf
			EndIf
			If isPlayerAlive(*player1)
				If keyJustPushedPB(#PB_Key_3)
					If keyPushedPB(#PB_Key_LeftControl)
						selectedStance=*player1\classStanceId+1
						If selectedStance>ArraySize(*player1\class\allStances())
							selectedStance=0
						EndIf
						playerSetClass(*player1,*player1\class,selectedStance)
					Else
						selectedClass=*player1\class\id+1
						If selectedClass>=ArraySize(*allClasses())
							selectedClass=0
						EndIf
						While Not classgetIdle(*allClasses(selectedClass))
							Debug *allClasses(selectedClass)\name+" has no idle"
							selectedClass+1
						Wend
						playerSetClass(*player1,*allClasses(selectedClass),0)
						classLoadIconCroped(*player1\class)
					EndIf
					playerPrepareColor(*player1,*player2)
				EndIf
			EndIf
			If isPlayerAlive(*player2)
				If keyJustPushedPB(#PB_Key_4)
					If keyPushedPB(#PB_Key_LeftControl)
						selectedStance=*player2\classStanceId+1
						If selectedStance>ArraySize(*player2\class\allStances())
							selectedStance=0
						EndIf
						playerSetClass(*player2,*player2\class,selectedStance)
					Else
						selectedClass=*player2\class\id+1
						If selectedClass>=ArraySize(*allClasses())
							selectedClass=0
						EndIf
						While Not classGetIdle(*allClasses(selectedClass))
							selectedClass+1
						Wend
						playerSetClass(*player2,*allClasses(selectedClass),0)
						classLoadIconCroped(*player2\class)
					EndIf
					playerPrepareColor(*player1,*player2)
				EndIf
			EndIf
			If keyJustPushedPB(#PB_Key_5)
				If slomo
					slomo=#False
				Else
					slomo=#True
				EndIf
				Debug "slomo "+slomo
			EndIf
		EndIf
		;}
	EndIf
	
	gameType=#H2H_GAME_1V1
	If gameType=#H2H_GAME_1VBOT
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
		afftext("FPS : "+Str(currentFPS),0,240)
	EndIf
	timerScale.d=1
	If screenSizeX<1300
		timerScale=0.5
	EndIf
	CompilerIf #H2H_TIMER_ENABLED
		Select fightPhase
			Case #H2H_FIGHT_PHASE_START
				displayTimer(0,timerScale)
			Case #H2H_FIGHT_PHASE_END
				displayTimer(endTime/1000,timerScale)
			Default
				displayTimer(totalTime/1000,timerScale)
		EndSelect
	CompilerEndIf
  	If fightPhase=#H2H_FIGHT_PHASE_START
  		counterDisplay(i,(screenSizeX-#H2H_COMBO_DISPLAY_BIG_DISTANCE)/2,300,255-transparency,zoom)
  	EndIf
	If gamePaused
	  displayPause(*player1)
	EndIf
	
	If Not gamePaused
  		If slomo
  			averageDelta(aD)=delta
  		Else
  			averageDelta(aD)=deltaGlobal
  		EndIf
  		aD+1
  		If aD>99
  			aD=0
  		EndIf
  	EndIf
	frameLoadLoop(1)
	
	If Not gamePaused And deltaDelay<=0
  		If slomo
  			totalTime+(ElapsedMillisecondsPrecise()-fightStamp)/5.0
  		Else
  			totalTime+(ElapsedMillisecondsPrecise()-fightStamp)
  		EndIf
  	EndIf
  	deltaDelay-delta
  	If deltaDelay<0
  		deltaDelay=0
  	EndIf
  	fightStamp=ElapsedMillisecondsPrecise()
	ProcedureReturn finished
EndProcedure

Macro displayMenuInstruction(x,y)
  AfftextColor(keyToString$(*player1\keyboardControl\special)+" or "+keyToString$(*menuControlKeys\special)+" to quit\Arrows to move\"+keyToString$(*player1\keyboardControl\attack)+" or "+keyToString$(*menuControlKeys\attack)+" to Select",x,y,#Gray,128,0.75)
EndMacro

; returns the index of the pressed button from 0 to 6
; returns -1 if none is selected
 Procedure.i menuLoop(x.i=0,y.i=0,startingIndex.i=-1)
 	Static index=0
 	If startingIndex<>-1
 		index=startingIndex
 	EndIf
	displayMenuInstruction(x+50,screenSizeY-100)
	h=50
	h=AfftextColor("HAND2HAND PROJECT ",100+x,h,#Orange,192,4)
	h=AfftextColor(#H2H_VERSION,600+x,h,#H2H_STANCE_COLOR_GRAY)+50
	h=displayMenuButtonText(100+x,h,"Player vs Player",0,index,0,1.5)+5
	h=displayMenuButtonText(175+x,h," Player vs Bot  ",1,index,0,1.5)+5
	h=displayMenuButtonText(250+x,h," View fighters  ",2,index,0,1.5)+5
	h=displayMenuButtonText(325+x,h,"    Options     ",3,index,0,1.5)+5
	h=displayMenuButtonText(400+x,h,"    Tutorial    ",4,index,0,1.5)+5
	h=displayMenuButtonText(475+x,h,"    Credits     ",5,index,0,1.5)+5
	h=displayMenuButtonText(550+x,h,"      Exit      ",6,index,0,1.5)+5
	previousIndex=index
	If controlJustPressed(*menuControlKeys,up) Or controlJustPressed(*menuControlKeys,left) Or playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True)
		index-1
	EndIf
	If controlJustPressed(*menuControlKeys,down) Or controlJustPressed(*menuControlKeys,right) Or playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True)
		index+1
	EndIf
	If index<0
		index=0
	EndIf
	If index>6
		index=6
	EndIf
	If previousIndex<>index
		psound(#H2H_SOUND_ID_MENUCLIC)
	EndIf
	If Not blackScreenEnabled
		If controlJustPressed(*menuControlKeys,attack) Or controlJustPressed(*menuControlKeys,accept) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
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

statInit()

Procedure classGallery(*gadget.animationGadget=0,delta.d=1)
	Static currentSelection=0
	Static stanceSelection=0
	shineLoop(delta)
	previousSelection=currentSelection
	previousStance=stanceSelection
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControlKeys,right)
		stanceSelection=0
		Repeat 
			currentSelection+1
			If currentSelection>=ArraySize(*allClasses())
				currentSelection=0
			EndIf
		Until Not *allClasses(currentSelection)\notSelectable
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControlKeys,left)
		Repeat 
			currentSelection-1
			If currentSelection<0
				currentSelection=ArraySize(*allClasses())-1
			EndIf
		Until Not *allClasses(currentSelection)\notSelectable
		stanceSelection=0
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or controlJustPressed(*menuControlKeys,up)
		stanceSelection-1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or controlJustPressed(*menuControlKeys,down)
		stanceSelection+1
	EndIf
	If currentSelection>ArraySize(*allClasses())
		currentSelection=0
	EndIf
	If currentSelection<0
		currentSelection=ArraySize(*allClasses())
	EndIf
	If stanceSelection<0
		stanceSelection=0
	EndIf
	If stanceSelection>ArraySize(*allClasses(currentSelection)\allStances())
		stanceSelection=ArraySize(*allClasses(currentSelection)\allStances())
	EndIf
	If previousSelection<>currentSelection Or stanceSelection<>previousStance
		psound(#H2H_SOUND_ID_MENUCLIC)
		If previousSelection<>currentSelection
			classFreeIcon(*allClasses(previousSelection))
			classLoadIcon(*allClasses(currentSelection))
			gadgetReset(*gadget)
		EndIf
	EndIf
	c=*gadget\color
	t=*gadget\colorIntensity
	AfftextColor(*allClasses(currentSelection)\name,100,60,colorLerp(c,#White),(128+t)/2,2)
	AfftextColor(*allClasses(currentSelection)\allStances(stanceSelection)\name,100,100,c,t)
	refreshAllGadget(delta)
	displayAllGadget(#H2H_GADGET_LAYER_BACK)
	If *gadget And *gadget\what And *gadget\display
		displayFrameShadow(*gadget\what\frames(*gadget\index),*gadget\where\x,*gadget\where\y,0,#False,*gadget\color,*gadget\colorIntensity)
	EndIf
	classDisplay(*allClasses(currentSelection),75,200,stanceSelection,*gadget)
	displayAllGadget(#H2H_GADGET_LAYER_FRONT)
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
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or controlJustPressed(*menuControlKeys,right) Or controlJustPressed(*menuControlKeys,up)
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
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or controlJustPressed(*menuControlKeys,left) Or controlJustPressed(*menuControlKeys,down)
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
	
	If playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or controlJustPressed(*menuControlKeys,exit) Or controlJustPressed(*menuControlKeys,accept) Or controlJustPressed(*menuControlKeys,attack)
		psound(#H2H_SOUND_ID_MENUACCEPT)
		If currentSelection>=0
  			result=currentSelection
  		Else
  			result=Random(ArraySize(*allBackground()))
  		EndIf
	EndIf
; 	If playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True) Or playerHasCommand(*player1,#H2H_CONTROL_SPECIAL,#True) Or controlJustPressed(*menuControlKeys,cancel) Or controlJustPressed(*menuControlKeys,exit)  Or controlJustPressed(*menuControlKeys,heavy) Or controlJustPressed(*menuControlKeys,special)
; 		psound(#H2H_SOUND_ID_MENUCANCEL)
; 	EndIf
	If currentSelection=-1
		AfftextColor("Random",100+x,80+y,0,128,2)
		jx=100+x
		jy=120+y
		ZoomSprite(randomClassIcon,100,100)
		DisplayTransparentSprite(randomClassIcon,jx,jy)
	Else
		AfftextColor(*allBackground(currentSelection)\name$,100+x,80+y,0,128,2)
		size=*allBackground(currentSelection)\rightLimit-*allBackground(currentSelection)\leftLimit
		If *allBackground(currentSelection)\size<=3000
			AfftextColor("Small",100+x,120+y,#Blue)
		Else
			If *allBackground(currentSelection)\size<=5000
				AfftextColor("Medium",100+x,120+y,#Blue)
			Else
				AfftextColor("Large",100+x,120+y,#Blue)
			EndIf
		EndIf
		jx=100+x
		jy=140+y
		If Not IsSprite(*allBackground(currentSelection)\imagesId(0))
			backgroundLoad(*allBackground(currentSelection))
		EndIf
		For i=0 To ArraySize(*allBackground(currentSelection)\imagesId())
			sprite=*allBackground(currentSelection)\imagesId(i)
			ZoomSprite(sprite,SpriteWidth(sprite)/8,SpriteHeight(sprite)/8)
			DisplaySprite(sprite,jx,jy)
			jx+*allBackground(currentSelection)\sizes(i)/8
			ZoomSprite(sprite,#PB_Default,#PB_Default)
		Next
	EndIf
	ProcedureReturn result
EndProcedure

Global ready=0
Global ready2=0
Global playerSelected=#False

Procedure classSelectionVersus(*gadget.animationGadget,*gadget2.animationGadget,versusBot.i=#False)
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
	;{ player 1
	previousSelection=*availableClasses(currentSelection)
	previousStance=stanceSelection
	If Not ready
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
			psound(#H2H_SOUND_ID_MENUCLIC,screenSizeX)
			If previousSelection<>*availableClasses(currentSelection)
				gadgetReset(*gadget)
			EndIf
		EndIf
		other.s=""
		If *player1\joystickId>-1
			other+" (or "+joystickButtonName$(*player1\joystickControl\attack)+")"
		EndIf
		s$="Press "+keyToString$(*player1\keyboardControl\attack)+other+" to select"
		AfftextColor(s$,screenSizeX-100-AfftextGetLength(s$),670,#Orange)
		If Not ready And (playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True))
			psound(#H2H_SOUND_ID_MENUCLIC,screenSizeX)
			ready=#True
			If versusBot
				playerSelected=#True
				keyClear()
				*player1\pushed\accept=42
				*player1\pushed\attack=42
			EndIf
			*gadget\opacity=255
		EndIf
	Else
		other.s=""
		If *player1\joystickId>-1
			other+" (or "+joystickButtonName$(*player1\joystickControl\heavy)+")"
		EndIf
		s$="Press "+keyToString$(*player1\keyboardControl\heavy)+other+" to cancel"
		AfftextColor(s$,screenSizeX-100-AfftextGetLength(s$),670,#Gray)
		If ready And (playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True))
			psound(#H2H_SOUND_ID_MENUCLIC,screenSizeX)
			ready=0
			If versusBot
				If playerSelected
					playerSelected=#False
					*gadget\opacity=64
					*gadget2\opacity=64
					*gadget2\display=#False
				EndIf
				keyClear()
				*player1\pushed\heavy=42
				*player1\pushed\cancel=42
			EndIf
			*gadget\opacity=64
		EndIf
	EndIf
	finalSelection=*availableClasses(currentSelection)
	;}
	;{ player 2
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
			psound(#H2H_SOUND_ID_MENUCLIC,0)
			If previousSelection2<>*availableClasses(currentSelection2)
				gadgetReset(*gadget2)
			EndIf
		EndIf
		If versusBot
			If playerSelected
				other.s=""
				If *player1\joystickId>-1
					other=" (or "+joystickButtonName$(*player1\joystickControl\attack)+")"
				EndIf
				AfftextColor("Press "+keyToString$(*player1\keyboardControl\attack)+other+" to select bot",100,670,#Blue)
			EndIf
		Else
			other.s=""
			If *player2\joystickId>-1
				other=" (or "+joystickButtonName$(*player2\joystickControl\attack)+")"
			EndIf
			AfftextColor("Press "+keyToString$(*player2\keyboardControl\attack)+other+" To Select",100,670,#Blue)
		EndIf
		If Not ready2
			If versusBot
				If playerSelected
					If playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True)
						psound(#H2H_SOUND_ID_MENUCLIC,0)
						*gadget2\opacity=255
						ready2=1
					EndIf
				EndIf
			Else
				If playerHasCommand(*player2,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player2,#H2H_CONTROL_ATTACK,#True)
					psound(#H2H_SOUND_ID_MENUCLIC,0)
					*gadget2\opacity=255
					ready2=1
				EndIf
			EndIf
		EndIf
	Else
		If versusBot
			If playerSelected
				other.s=""
				If *player1\joystickId>-1
					other=" (or "+joystickButtonName$(*player1\joystickControl\heavy)+")"
				EndIf
				AfftextColor("Press "+keyToString$(*player1\keyboardControl\heavy)+other+" to cancel bot",100,670,#Gray)
				If ready2 And (playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True))
					psound(#H2H_SOUND_ID_MENUCLIC,0)
					*gadget2\opacity=64
					*gadget2\display=0
					ready2=0
					playerSelected=#False
					*gadget\opacity=64
				EndIf
			EndIf
		Else
			other.s=""
			If *player2\joystickId>-1
				other=" (or "+joystickButtonName$(*player2\joystickControl\heavy)+")"
			EndIf
			AfftextColor("Press "+keyToString$(*player2\keyboardControl\heavy)+other+" to cancel",100,670,#Gray)
			If ready2 And (playerHasCommand(*player2,#H2H_CONTROL_CANCEL,#True) Or playerHasCommand(*player2,#H2H_CONTROL_HEAVY,#True))
				psound(#H2H_SOUND_ID_MENUCLIC,0)
				*gadget2\opacity=64
				ready2=0
				playerSelected=#False
			EndIf
		EndIf
	EndIf
	finalSelection2=*availableClasses(currentSelection2)
	;}
	;{ display
	shineLoop(deltaGlobal)
	mirror=#False
	mirror2=#False
	If finalSelection=-2 And finalSelection2>=0
; 		finalSelection=finalSelection2
		mirror=#True
	Else
		If finalSelection2=-2 And finalSelection>=0
; 			finalSelection2=finalSelection
			mirror2=#True
		EndIf
	EndIf
	If finalSelection>-1
		*gadget\display=#True
		AfftextColor(*allClasses(finalSelection)\name,screenSizeX-100-AfftextGetLength(*allClasses(finalSelection)\name)*3,40,colorLerp(*gadget\color,#White),(*gadget\colorIntensity+128)/2,3)
		If stanceSelection=-1
			AfftextColor("Random",screenSizeX-100-AfftextGetLength("Random"),100,colorLerp(*gadget\color,#Black),(*gadget\colorIntensity+128)/2)
		Else
			If stanceSelection=-2
				Afftext("Mirror",screenSizeX-100-AfftextGetLength("Random"),100)
			Else
				AfftextColor(*allClasses(finalSelection)\allStances(stanceSelection)\name,screenSizeX-100-AfftextGetLength(*allClasses(finalSelection)\allStances(stanceSelection)\name),100,*gadget\color,*gadget\colorIntensity)
			EndIf
		EndIf
	Else
		*gadget\display=#False
		If finalSelection=-2
; 			Afftext("Mirror",screenSizeX-100-500,80)
			AfftextColor("Mirror",screenSizeX-100-AfftextGetLength("Mirror")*3,40,#White,128,3)
			Select stanceSelection
				Case -2
					AfftextColor("Random stance",screenSizeX-100-AfftextGetLength("Random stance"),100,#Gray)
				Case -1
					AfftextColor("Different stance",screenSizeX-100-AfftextGetLength("Different stance"),100,#Black)
				Case 0
					Afftext("Mirror stance",screenSizeX-100-AfftextGetLength("Mirror stance"),100)
			EndSelect
			If ready
				AfftextColor("M",*gadget\where\x+450,*gadget\where\y+350,#White,128,16)
			Else
				AfftextColor("M",*gadget\where\x+450,*gadget\where\y+350,#White,128,16)
			EndIf
		Else
			AfftextColor("Random",screenSizeX-100-AfftextGetLength("Random")*3,40,#Black,128,3)
			Select stanceSelection
				Case -2
					AfftextColor("Any",screenSizeX-100-AfftextGetLength("Any"),100,colorLerp(#Black,*player1\color))
				Case -1
					AfftextColor("Different stance",screenSizeX-100-AfftextGetLength("Different stance"),100,colorLerp(#Gray,*player1\color))
				Case 0
					AfftextColor("Different class",screenSizeX-100-AfftextGetLength("Different class"),100,colorLerp(#White,*player1\color))
			EndSelect
			If ready
				AfftextColor("?",*gadget\where\x+450,*gadget\where\y+350,#Orange,128,16)
			Else
				AfftextColor("?",*gadget\where\x+450,*gadget\where\y+350,#Gray,128,16)
			EndIf
		EndIf
	EndIf
	If Not versusBot Or playerSelected
		If finalSelection2>-1
			*gadget2\display=#True
	; 		Afftext(*allClasses(finalSelection2)\name,100,80)
			AfftextColor(*allClasses(finalSelection2)\name,100,40,colorLerp(*gadget2\color,#White),(*gadget2\colorIntensity+128)/2,3)
			If stanceSelection2=-1
				AfftextColor("Random",100,100,colorLerp(*gadget2\color,#Black),(*gadget2\colorIntensity+128)/2)
			Else
				If stanceSelection2=-2
					Afftext("Mirror",100,100)
				Else
					AfftextColor(*allClasses(finalSelection2)\allStances(stanceSelection2)\name,100,100,*gadget2\color,*gadget2\colorIntensity)
				EndIf
			EndIf
		Else
			*gadget2\display=#False
			If finalSelection2=-2
	; 			Afftext("Mirror",100,80)
				AfftextColor("Mirror",100,40,#White,128,3)
				Select stanceSelection2
					Case -2
						AfftextColor("Random stance",100,100,#Gray)
					Case -1
						AfftextColor("Different stance",100,100,#Black)
					Case 0
						Afftext("Mirror stance",100,100)
				EndSelect
				If ready
					AfftextColor("M",*gadget2\where\x+250,*gadget2\where\y+350,#White,128,16)
				Else
					AfftextColor("M",*gadget2\where\x+250,*gadget2\where\y+350,#White,128,16)
				EndIf
			Else
				AfftextColor("Random",100,40,#Black,128,3)
				Select stanceSelection2
					Case -2
						AfftextColor("Any",100,100,colorLerp(#Black,*player2\color))
					Case -1
						AfftextColor("Different stance",100,100,colorLerp(#Gray,*player2\color))
					Case 0
						AfftextColor("Different class",100,100,colorLerp(#White,*player2\color))
				EndSelect
				If ready2
					AfftextColor("?",*gadget2\where\x+250,*gadget2\where\y+350,#Blue,128,16)
				Else
					AfftextColor("?",*gadget2\where\x+250,*gadget2\where\y+350,#Gray,128,16)
				EndIf
			EndIf
		EndIf
	EndIf
	If finalSelection>-1
		If stanceSelection>-1
			*gadget\color=*allClasses(finalSelection)\allStances(stanceSelection)\specialcolor
		 	*gadget\colorIntensity=*allClasses(finalSelection)\allStances(stanceSelection)\specialTransparency
			If Not *gadget\color
				*gadget\color=*player1\color
				*gadget2\colorIntensity=128
			EndIf
		Else
			If stanceSelection=-2
				*gadget\color=RGB(255,255,255)
			Else
				*gadget\color=RGB(1,1,1)
			EndIf
			*gadget\colorIntensity=254
		EndIf
	EndIf
	If Not versusBot Or playerSelected
		If mirror And stanceSelection2>=0
			*gadget\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialcolor
			*gadget\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialTransparency
			If Not *gadget\color
				*gadget\color=*player1\color
			EndIf
		EndIf
		If mirror2 And stanceSelection>=0
			*gadget2\color=*allClasses(finalSelection)\allStances(stanceSelection)\alternatecolor
			*gadget2\colorIntensity=*allClasses(finalSelection)\allStances(stanceSelection)\alternateTransparency
	 		If *gadget2\color 
	 			If playerColorMode=#H2H_PLAYER_COLOR_MODE_ALTERNATIVE Or isColorClose(*gadget2\color,*gadget\color)
					*gadget2\color=*allClasses(finalSelection)\allStances(stanceSelection)\alternatecolor
					*gadget2\colorIntensity=*allClasses(finalSelection)\allStances(stanceSelection)\alternateTransparency
					If Not *gadget2\color
						*gadget2\color=*player2\color
						*gadget2\colorIntensity=128
					EndIf
				EndIf
			Else
				*gadget2\color=*player2\color
				*gadget2\colorIntensity=128
			EndIf
		EndIf
	EndIf
	If Not versusBot Or playerSelected
		If finalSelection2>-1
			If stanceSelection2>-1
				*gadget2\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialcolor
		 		*gadget2\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\specialTransparency
		 		If *gadget2\color 
		 			If playerColorMode=#H2H_PLAYER_COLOR_MODE_ALTERNATIVE Or isColorClose(*gadget2\color,*gadget\color)
						*gadget2\color=*allClasses(finalSelection2)\allStances(stanceSelection2)\alternatecolor
						*gadget2\colorIntensity=*allClasses(finalSelection2)\allStances(stanceSelection2)\alternateTransparency
						If Not *gadget2\color
							*gadget2\color=*player2\color
							*gadget2\colorIntensity=128
						EndIf
					EndIf
				Else
					*gadget2\color=*player2\color
					*gadget2\colorIntensity=128
				EndIf
			Else
				If stanceSelection2=-2
					*gadget2\color=RGB(255,255,255)
				Else
					*gadget2\color=RGB(1,1,1)
				EndIf
				*gadget2\colorIntensity=254
			EndIf
		EndIf
	EndIf
	If screenSizeX>=1200
		refreshAllGadget(deltaGlobal)
		displayAllGadget(#H2H_GADGET_LAYER_BACK)
	EndIf
	If finalSelection>-1
		If stanceSelection<=-1
			If finalSelection=finalSelection2 And stanceSelection=-2 And stanceSelection2<>2
				classDisplaySelection(*allClasses(finalSelection),stanceSelection2,screenSizeX-75,150,*gadget,#True)
			Else
				classDisplaySelection(*allClasses(finalSelection),0,screenSizeX-75,150,*gadget,#True)
			EndIf
		Else
			classDisplaySelection(*allClasses(finalSelection),stanceSelection,screenSizeX-75,150,*gadget,#True)
		EndIf
	EndIf
	If finalSelection=-1
		classDisplaySelection(-1,0,screenSizeX-75,150,*gadget,#True)
	EndIf
	If mirror And (Not versusBot Or playerSelected)
		classDisplaySelection(*allClasses(finalSelection2),stanceSelection2,screenSizeX-75,150,*gadget,#True)
	EndIf
	If Not versusBot Or playerSelected
		If finalSelection2>-1
			If stanceSelection2<=-1
				If finalSelection=finalSelection2 And stanceSelection<>-2 And stanceSelection2=2
					classDisplaySelection(*allClasses(finalSelection2),stanceSelection,75,150,*gadget2)
				Else
					classDisplaySelection(*allClasses(finalSelection2),0,75,150,*gadget2)
				EndIf
			Else
				classDisplaySelection(*allClasses(finalSelection2),stanceSelection2,75,150,*gadget2)
			EndIf
		EndIf
	EndIf
	If finalSelection2=-1
		classDisplaySelection(-1,0,75,150,*gadget2)
	EndIf
	If mirror2 And (Not versusBot Or playerSelected)
		classDisplaySelection(*allClasses(finalSelection),stanceSelection,75,150,*gadget2)
	EndIf
	If screenSizeX>=1200
		displayAllGadget(#H2H_GADGET_LAYER_FRONT)
	Else
		If finalSelection>-1
			classLoadIcon(*allClasses(finalSelection))
			classDisplayIcon(*allClasses(finalSelection),screenSizeX-600,150,*gadget\color,*gadget\opacity)
		EndIf
		If finalSelection2>-1
			classLoadIcon(*allClasses(finalSelection2))
			classDisplayIcon(*allClasses(finalSelection2),75,150,*gadget2\color,*gadget2\opacity,#True)
		EndIf
	EndIf
	If screenSizeY>=800
		classLineDisplay(finalSelection,screenSizeX-575,screenSizeY-150,#True,#True,startI)
		classLineDisplay(finalSelection2,75,screenSizeY-150,#True,#True,startI2)
	EndIf
	If finalSelection>=0
		If stanceSelection=-1
			If ready
				AfftextColor("?",*gadget\where\x+450,*gadget\where\y+350,#Orange,128,16)
			Else
				AfftextColor("?",*gadget\where\x+450,*gadget\where\y+350,#Gray,128,16)
			EndIf
		EndIf
		If stanceSelection=-2
			If ready
				AfftextColor("M",*gadget\where\x+450,*gadget\where\y+350,#White,128,16)
			Else
				AfftextColor("M",*gadget\where\x+450,*gadget\where\y+350,#White,128,16)
			EndIf
		EndIf
	EndIf
	If Not versusBot Or playerSelected
		If finalSelection2>=0
			If stanceSelection2=-1
				If ready2
					AfftextColor("?",*gadget2\where\x+250,*gadget2\where\y+350,#Blue,128,16)
				Else
					AfftextColor("?",*gadget2\where\x+250,*gadget2\where\y+350,#Gray,128,16)
				EndIf
			EndIf
			If stanceSelection2=-2
				If ready
					AfftextColor("M",*gadget2\where\x+250,*gadget2\where\y+350,#White,128,16)
				Else
					AfftextColor("M",*gadget2\where\x+250,*gadget2\where\y+350,#White,128,16)
				EndIf
			EndIf
		EndIf
	EndIf
	;}
	If ready And ready2
		other.s=""
		If *player1\joystickId>-1
			other+" (or "+joystickButtonName$(*player1\joystickControl\accept)
			If *player2\joystickId>-1
				other+" or "+joystickButtonName$(*player2\joystickControl\accept)+")"
			Else
				other+")"
			EndIf
		Else
			If *player2\joystickId>-1
				other+" (or "+joystickButtonName$(*player2\joystickControl\accept)+")"
			EndIf
		EndIf
		s$="Press "+keyToString$(*menuControlKeys\attack)+other+" to start !"
		AfftextColor(s$,(screenSizeX-AfftextGetLength(s$)*1.5)/2,570,#Orange,menuTextIntensity,1.5)
		If controlJustPressed(*menuControlKeys,attack) Or controlJustPressed(*menuControlKeys,accept) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True)
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
	EndIf
	ProcedureReturn -999
EndProcedure

Procedure exportOptions()
	Debug "exported"
	*settings=CreateJSONObject(0)
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
	*child=addJSONObject(*settings,"player1right")
	controlJSONExport(*player1\keyboardControl,addJSONObject(*child,"keyboard"))
	controlJSONExport(*player1\joystickControl,addJSONObject(*child,"joystick"))
	addJSONInteger(*child,"jumpWithUp",*player1\jumpWithUp)
	*child=addJSONObject(*settings,"player2left")
	controlJSONExport(*player2\keyboardControl,addJSONObject(*child,"keyboard"))
	controlJSONExport(*player2\joystickControl,addJSONObject(*child,"joystick"))
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
	If LoadJSON(JSONindex,"settings.txt")
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
		If stereoWidth>#H2H_SOUND_STEREO_DEFAULT_WIDTH
			stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
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
		playerColorMode=loadJSONInteger(*parent,"PlayerColorMode")
		If *player1
			*child=GetJSONMember(*parent,"player1right")
			If *child
				*player1\keyboardControl=controlJSONImport(GetJSONMember(*child,"keyboard"))
				If GetJSONMember(*child,"joystick")
					*player1\joystickControl=controlJSONImport(GetJSONMember(*child,"joystick"))
				Else
					resetJoystickToDefault(*player1)
				EndIf
				playerRefreshJoystickMap(*player1)
				*player1\jumpWithUp=	loadJSONInteger(*child,"jumpWithUp")
			Else
				*player1\keyboardControl\left=	#H2H_CONTROL_DEFAULT_RIGHT_LEFT
				*player1\keyboardControl\right=	#H2H_CONTROL_DEFAULT_RIGHT_RIGHT
				*player1\keyboardControl\up=	#H2H_CONTROL_DEFAULT_RIGHT_UP
				*player1\keyboardControl\down=	#H2H_CONTROL_DEFAULT_RIGHT_DOWN
				*player1\keyboardControl\attack=#H2H_CONTROL_DEFAULT_RIGHT_NEUTRAL
				*player1\keyboardControl\heavy=	#H2H_CONTROL_DEFAULT_RIGHT_HEAVY
				*player1\keyboardControl\jump=	#H2H_CONTROL_DEFAULT_RIGHT_SPECIAL
				*player1\joystickControl\attack=#H2H_JOYSTICK_DEFAULT_ATTACK
				*player1\joystickControl\heavy=	#H2H_JOYSTICK_DEFAULT_HEAVY
				*player1\joystickControl\special=#H2H_JOYSTICK_DEFAULT_SPECIAL
				*player1\jumpWithUp=	#False
				resetJoystickToDefault(*player1)
			EndIf
		EndIf
		If *player2
			*child=GetJSONMember(*parent,"player2left")
			If *child
				*player2\keyboardControl=controlJSONImport(GetJSONMember(*child,"keyboard"))
				If GetJSONMember(*child,"joystick")
					*player2\joystickControl=controlJSONImport(GetJSONMember(*child,"joystick"))
				Else
					resetJoystickToDefault(*player2)
				EndIf
				*player2\jumpWithUp=	loadJSONInteger(*child,"jumpWithUp")
				playerRefreshJoystickMap(*player2)
			Else
				*player2\keyboardControl\left=	#H2H_CONTROL_DEFAULT_LEFT_LEFT
				*player2\keyboardControl\right=	#H2H_CONTROL_DEFAULT_LEFT_RIGHT
				*player2\keyboardControl\up=	#H2H_CONTROL_DEFAULT_LEFT_UP
				*player2\keyboardControl\down=	#H2H_CONTROL_DEFAULT_LEFT_DOWN
				*player2\keyboardControl\attack=#H2H_CONTROL_DEFAULT_LEFT_NEUTRAL
				*player2\keyboardControl\heavy=	#H2H_CONTROL_DEFAULT_LEFT_HEAVY
				*player2\keyboardControl\jump=	#H2H_CONTROL_DEFAULT_LEFT_SPECIAL
				*player2\joystickControl\attack=#H2H_JOYSTICK_DEFAULT_ATTACK
				*player2\joystickControl\heavy=	#H2H_JOYSTICK_DEFAULT_HEAVY
				*player2\joystickControl\special=#H2H_JOYSTICK_DEFAULT_SPECIAL
				*player2\jumpWithUp=	#False
				resetJoystickToDefault(*player2)
			EndIf
		EndIf
		FreeJSON(JSONindex)
		ProcedureReturn 1
	Else
		If *player1
			resetJoystickToDefault(*player1)
			resetJoystickToDefault(*player2)
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Macro controlMenuSub(x,y,subLine,what)
	If inputMode And subLine=currentLine
		AfftextColor(keyToString$(*player1\keyboardControl\what),x,y,	   RGB(128+127*Bool(column=0),128*Bool(column=0)+127*Bool(column<>0 Or currentLine<>subLine),255*Bool(column<>0)))
		AfftextColor(keyToString$(*player2\keyboardControl\what),(x)+250,y,RGB(128+127*Bool(column=1),128*Bool(column=1)+127*Bool(column<>1 Or currentLine<>subLine),255*Bool(column<>1)))
	Else
		AfftextColor(keyToString$(*player1\keyboardControl\what),x,y,	   RGB(128,128*Bool(column<>0 Or currentLine<>subLine),128*Bool(column<>0 Or currentLine<>subLine)))
		AfftextColor(keyToString$(*player2\keyboardControl\what),(x)+250,y,RGB(128,128*Bool(column<>1 Or currentLine<>subLine),128*Bool(column<>1 Or currentLine<>subLine)))
	EndIf
EndMacro

Procedure getLastKey()
	For i=0 To ArraySize(keyToString$())
		If keyJustPushedPB(i)
			ProcedureReturn i
		EndIf
	Next
	ProcedureReturn 0
EndProcedure
#H2H_SETTINGS_LINE_HEIGHT=20
Global Dim keys$(15)
keys$( 0)="Left"
keys$( 1)="Right"
keys$( 2)="Up"
keys$( 3)="Down"
keys$( 4)="Attack"
keys$( 5)="Heavy"
keys$( 6)="Special"
keys$( 7)="Neutral"
keys$( 8)="Side attack"
keys$( 9)="Back attack"
keys$(10)="Up attack"
keys$(11)="Down attack"
keys$(12)="Jump"
keys$(13)="Block"
keys$(14)="Dash left"
keys$(15)="Dash right"
#H2H_SPAAAAAAACE="        "
Global Dim keysSpace$(15)
For i=0 To 15
	keysSpace$(15)=Mid(#H2H_SPAAAAAAACE,0,Len(keys$(i))/2)+keys$(i)+Mid(#H2H_SPAAAAAAACE,0,(Len(keys$(i))+1)/2)
Next
Procedure controlMenu(x.i=0,y.i=0)
	Static currentLine=0
	Static column=0
	Static inputMode=0
	
	subY=y
	subY=AfftextColor("       Controls",100+x,subY,#Orange,128,2)+8
	If column=0
		AfftextColor("=======Left player===",400+x,subY,#Orange)
		subY=AfftextColor("                       ===Right player==",400+x,subY,#Gray)
	Else
		AfftextColor("=======Left player===",400+x,subY,#Gray)
		subY=AfftextColor("                       ===Right player==",400+x,subY,#Orange)
	EndIf
	subIndex=0
	displayMenuButtonText(100+x,subY,"     Left       ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,left)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"     Right      ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,right)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"      Up        ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,up)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"     Down       ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,down)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Neutral     ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,attack)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"     Heavy      ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,heavy)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Special     ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,special)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Neutral     ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,neutral)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"   Side attack  ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,attackSide)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"   Back attack  ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,attackBack)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Up attack   ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,attackUp)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"   Down attack  ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,attackDown)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"      Jump      ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,jump)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"      Block     ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,dashLeft)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Dash left   ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,dashLeft)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"    Dash right  ",subIndex,currentLine)
	controlMenuSub(500+x,subY,subIndex,dashRight)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"  Jump with Up  ",subIndex,currentLine)
	If *player1\jumpWithUp
		If column=0 And subIndex=currentLine
			AfftextColor("Enabled",450+x,subY,#Orange)
		Else
			AfftextColor("Enabled",450+x,subY,#Gray)
		EndIf
	Else
		If column=0 And subIndex=currentLine
			AfftextColor("Disabled",450+x,subY,#Orange)
		Else
			AfftextColor("Disabled",450+x,subY,#Gray)
		EndIf
	EndIf
	If *player2\jumpWithUp
		If column=1 And subIndex=currentLine
			AfftextColor("Enabled",700+x,subY,#Orange)
		Else
			AfftextColor("Enabled",700+x,subY,#Gray)
		EndIf
	Else
		If column=1 And subIndex=currentLine
			AfftextColor("Disabled",700+x,subY,#Orange)
		Else
			AfftextColor("Disabled",700+x,subY,#Gray)
		EndIf
	EndIf
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"Reset to default",subIndex,currentLine)
	subIndex+1:subY+#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(100+x,subY,"     Save       ",subIndex,currentLine)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	AfftextColor("N.B. The game may mix up AZERTY and QWERTY",120+x,subY,#Gray,128,0.75)
	
	caught=0
	previousIndex=currentLine
	If inputMode
		last=vkeyToKey(lastPushed)
		If keyToString$(last)="Escape"
			inputMode=0
			keyClear()
		EndIf
		If inputMode And last And keyToString$(last)<>"-unkown-"
			If keyToString$(last)="Return"
				last=0
			EndIf
			psound(#H2H_SOUND_ID_MENUACCEPT)
			keyClear()
			*p.player=*player1
			If column=1
				*p=*player2
			EndIf
			Select currentLine
				Case 0
					*p\keyboardControl\left=last
				Case 1
					*p\keyboardControl\right=last
				Case 2
					*p\keyboardControl\up=last
				Case 3
					*p\keyboardControl\down=last
				Case 4
					*p\keyboardControl\attack=last
				Case 5
					*p\keyboardControl\heavy=last
				Case 6
					*p\keyboardControl\special=last
				Case 7
					*p\keyboardControl\neutral=last
				Case 8
					*p\keyboardControl\attackSide=last
				Case 9
					*p\keyboardControl\attackBack=last
				Case 10
					*p\keyboardControl\attackUp=last
				Case 11
					*p\keyboardControl\attackDown=last
				Case 12
					*p\keyboardControl\jump=last
				Case 13
					*p\keyboardControl\block=last
				Case 14
					*p\keyboardControl\dashLeft=last
				Case 15
					*p\keyboardControl\dashRight=last
			EndSelect
			inputMode=0
		EndIf
	Else
		If playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or controlJustPressed(*menuControlKeys,attack) Or controlJustPressed(*menuControlKeys,accept)
			If currentLine=subIndex-1 ; reset to default 
				psound(#H2H_SOUND_ID_MENUACCEPT)
				Debug "reset"
				*player1\keyboardControl\left=		#H2H_CONTROL_DEFAULT_RIGHT_LEFT
				*player1\keyboardControl\right=		#H2H_CONTROL_DEFAULT_RIGHT_RIGHT
				*player1\keyboardControl\up=		#H2H_CONTROL_DEFAULT_RIGHT_UP
				*player1\keyboardControl\down=		#H2H_CONTROL_DEFAULT_RIGHT_DOWN
				*player1\keyboardControl\attack=	#H2H_CONTROL_DEFAULT_RIGHT_NEUTRAL
				*player1\keyboardControl\heavy=		#H2H_CONTROL_DEFAULT_RIGHT_HEAVY
				*player1\keyboardControl\special=	#H2H_CONTROL_DEFAULT_RIGHT_SPECIAL
				*player1\keyboardControl\neutral=	0
				*player1\keyboardControl\attackSide=0
				*player1\keyboardControl\attackBack=0
				*player1\keyboardControl\attackUp=	0
				*player1\keyboardControl\attackDown=0
				*player1\keyboardControl\jump=		0
				*player1\keyboardControl\block=		0
				*player1\keyboardControl\dashLeft=	0
				*player1\keyboardControl\dashRight=	0
				*player1\jumpWithUp=		#False
				
				*player2\keyboardControl\left=		#H2H_CONTROL_DEFAULT_LEFT_LEFT
				*player2\keyboardControl\right=		#H2H_CONTROL_DEFAULT_LEFT_RIGHT
				*player2\keyboardControl\up=		#H2H_CONTROL_DEFAULT_LEFT_UP
				*player2\keyboardControl\down=		#H2H_CONTROL_DEFAULT_LEFT_DOWN
				*player2\keyboardControl\attack=	#H2H_CONTROL_DEFAULT_LEFT_NEUTRAL
				*player2\keyboardControl\heavy=		#H2H_CONTROL_DEFAULT_LEFT_HEAVY
				*player2\keyboardControl\special=	#H2H_CONTROL_DEFAULT_LEFT_SPECIAL
				*player2\keyboardControl\neutral=	0
				*player2\keyboardControl\attackSide=0
				*player2\keyboardControl\attackBack=0
				*player2\keyboardControl\attackUp=	0
				*player2\keyboardControl\attackDown=0
				*player2\keyboardControl\jump=		0
				*player2\keyboardControl\block=		0
				*player2\keyboardControl\dashLeft=	0
				*player2\keyboardControl\dashRight=	0
				*player2\jumpWithUp=		#False
			EndIf
			If currentLine=subIndex
				psound(#H2H_SOUND_ID_MENUACCEPT)
				ProcedureReturn 1
			EndIf
			If currentLine<=15 ; key set
				psound(#H2H_SOUND_ID_MENUCLIC)
				If inputMode
					inputMode=0
				Else
					inputMode=1
					keyClear()
				EndIf
			EndIf
			If currentLine=16 ;Jump with up
				psound(#H2H_SOUND_ID_MENUCLIC)
				If column=0
					If *player1\jumpWithUp
						*player1\jumpWithUp=0
					Else
						*player1\jumpWithUp=1
					EndIf
				Else
					If *player2\jumpWithUp
						*player2\jumpWithUp=0
					Else
						*player2\jumpWithUp=1
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or controlJustPressed(*menuControlKeys,up)
		psound(#H2H_SOUND_ID_MENUCLIC)
		currentLine-1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or controlJustPressed(*menuControlKeys,down)
		psound(#H2H_SOUND_ID_MENUCLIC)
		currentLine+1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControlKeys,left)
		psound(#H2H_SOUND_ID_MENUCLIC)
		column-1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControlKeys,right)
		psound(#H2H_SOUND_ID_MENUCLIC)
		column+1
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
		AfftextColor("Select a key for "+keys$(currentLine),(screenSizeX-AfftextGetLength("Select a key for "+keys$(currentLine))*4)/2,screenSizeY/2,#Orange,128,3)
	EndIf
	menuTextLoop(deltaGlobal)
	ProcedureReturn 0
EndProcedure

Procedure controllerMenu(x.i=0,y.i=0)
	currentLine=0
	column=0
	exit=0
	loop=ElapsedMilliseconds()+currentMillisecond
	inputMode=0
	selectedInput=0
	caught=0
	delta.d=defaultDelta
	setMovement=0
	Static currentIndex.i=1
	Static currentPlayer=0
	*currentPlayer.player=*player1
	If currentPlayer=1
		*currentPlayer=*player2
	EndIf
	
	subY=y
	subY=AfftextColor("       Controller",100+x,subY,#Orange,128,2)+8
	up=		Bool(playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or controlJustPressed(*menuControlKeys,up))
	down=	Bool(playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or controlJustPressed(*menuControlKeys,down))
	left=	Bool(playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControlKeys,left))
	right=	Bool(playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControlKeys,right))
	accept=	Bool(playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or controlJustPressed(*menuControlKeys,accept) Or playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or controlJustPressed(*menuControlKeys,attack))
	cancel=	Bool(playerHasCommand(*player1,#H2H_CONTROL_CANCEL,#True) Or controlJustPressed(*menuControlKeys,cancel) Or playerHasCommand(*player1,#H2H_CONTROL_HEAVY,#True) Or controlJustPressed(*menuControlKeys,heavy))

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
	If *player1\joystickId>-1 And *player2\joystickId>-1
		If left Or right
			psound(#H2H_SOUND_ID_MENUCLIC)
			If *currentPlayer=*player1
				*currentPlayer=*player2
			Else
				*currentPlayer=*player1
			EndIf
		EndIf
	Else
		If *player1\joystickId>-1
			*currentPlayer=*player1
		EndIf
		If *player2\joystickId>-1
			*currentPlayer=*player2
		EndIf
	EndIf
	If *player1\joystickId>-1 Or *player2\joystickId>-1
		If currentIndex<1
			currentIndex=17
		EndIf
		If currentIndex>17
			currentIndex=1
		EndIf
	Else
		If currentIndex<=12
			currentIndex=17
		EndIf
		If currentIndex>17
			currentIndex=13
		EndIf
	EndIf
	previousIndex=currentIndex
	playerJoystickDisplay(*player1,x+700,y,currentIndex*Bool(*currentPlayer=*player1))
	playerJoystickDisplay(*player2,x+200,y,currentIndex*Bool(*currentPlayer=*player2))
	subY=y+450
	If currentIndex=13
		AfftextColor("=[Rescan Joysticks]=",x+50,subY,#Orange)
		If accept
			detectJoystick()
			If nbJoystick>0
				*player1\joystickId=0
			Else
				*player1\joystickId=-1
			EndIf
			If nbJoystick>1
				*player2\joystickId=1
			Else
				*player2\joystickId=-1
			EndIf
			psound(#H2H_SOUND_ID_MENUACCEPT)
		EndIf
	Else
		AfftextColor("  Rescan Joysticks  ",x+50,subY,#White)
	EndIf
	subY+30
	If currentIndex=14
		If nbJoystick>0
			AfftextColor("<- Player 1 (right) ->",x+50,subY,#Orange)
			If right
				*player1\joystickId+1
				If *player1\joystickId>=nbJoystick
					*player1\joystickId=-1
				EndIf
			EndIf
			If left
				*player1\joystickId-1
				If *player1\joystickId<-1
					*player1\joystickId=nbJoystick-1
				EndIf
			EndIf
			If *player1\joystickId>-1
				AfftextColor("["+*player1\joystickId+"] "+JoystickName(*player1\joystickId),x+350,subY,#Orange)
			Else
				AfftextColor("-none-",x+350,subY,#Gray)
			EndIf
		Else
			AfftextColor("   Player 1 (right)   ",x+50,subY,#Orange)
			AfftextColor("-none-",x+350,subY,#Gray)
		EndIf
	Else
		AfftextColor("   Player 1 (right)   ",x+50,subY,#White)
		If *player1\joystickId>-1
			AfftextColor("["+*player1\joystickId+"] "+JoystickName(*player1\joystickId),x+350,subY,#White)
		Else
			AfftextColor("-none-",x+350,subY,#Gray)
		EndIf
	EndIf
	subY+30
	If currentIndex=15
		If nbJoystick>0
			AfftextColor("<- Player 2 (left)  ->",x+50,subY,#Orange)
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
			If *player2\joystickId>-1
				AfftextColor("["+*player2\joystickId+"] "+JoystickName(*player2\joystickId),x+350,subY,#Orange)
			Else
				AfftextColor("-none-",x+350,subY,#Gray)
			EndIf
		Else
			AfftextColor("   Player 2 (left)    ",x+50,subY,#Orange)
			AfftextColor("-none-",x+350,subY,#Gray)
		EndIf
	Else
		AfftextColor("   Player 2 (left)    ",x+50,subY,#White)
		If *player2\joystickId>-1
			AfftextColor("["+*player2\joystickId+"] "+JoystickName(*player2\joystickId),x+350,subY,#White)
		Else
			AfftextColor("-none-",x+350,subY,#Gray)
		EndIf
	EndIf
	subY+30
	If currentIndex=16
		AfftextColor("=[Reset to defaults]=",x+50,subY,#Orange)
		If accept
			psound(#H2H_SOUND_ID_MENUACCEPT)
			resetJoystickToDefault(*player1)
			resetJoystickToDefault(*player2)
		EndIf
	Else
		AfftextColor("  Reset to defaults  ",x+50,subY,#White)
	EndIf
	subY+30
	If currentIndex=17
		AfftextColor("=[Save and return]=",x+50,subY,#Orange)
		If accept
			psound(#H2H_SOUND_ID_MENUACCEPT)
			ProcedureReturn 1
		EndIf
	Else
		AfftextColor("  Save and return  ",x+50,subY,#White)
	EndIf
	If currentIndex<=12
		If *player1\joystickId>-1 And *currentPlayer=*player1
			If *player1\joystickMap(currentIndex)
				AfftextColor(joystickButtonName$(currentIndex)+" : "+joystickActionName$(*player1\joystickMap(currentIndex)),x+700,y+100)
			Else
				AfftextColor(joystickButtonName$(currentIndex)+" (unasigned)",x+700,y+100,#Gray)
			EndIf
		EndIf
		If *player2\joystickId>-1 And *currentPlayer=*player2
			If *player2\joystickMap(currentIndex)
				AfftextColor(joystickButtonName$(currentIndex)+" : "+joystickActionName$(*player2\joystickMap(currentIndex)),x+100,y+100)
			Else
				AfftextColor(joystickButtonName$(currentIndex)+" (unasigned)",x+100,y+100,#Gray)
			EndIf
		EndIf
		If accept
			If inputMode=0
				inputMode=1
				selectedInput=*currentPlayer\joystickMap(currentIndex)
				psound(#H2H_SOUND_ID_MENUACCEPT)
			Else
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
			AfftextColor("N.B. Block and dashes are not yet supported",subX,subY-20,#Gray,128,0.75)
			If setMovement
				AfftextColor("N.B. Block and dashes are not yet supported",subX,subY-20,#Gray,128,0.75)
			EndIf
			If currentIndex=#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT Or currentIndex=#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
; 					setMovement=1 ; might enable it later
			EndIf
			If cancel
				inputMode=0
				setMovement=0
				psound(#H2H_SOUND_ID_MENUCANCEL)
			Else
				If down
					selectedInput+1
					If selectedInput>ArraySize(joystickActionName$())
						selectedInput=0
					EndIf
					If Not setMovement;currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
						If selectedInput<4 And selectedInput>0
							selectedInput=4
						EndIf
					EndIf
				EndIf
				If up
					selectedInput-1
					If selectedInput<0
						selectedInput=ArraySize(joystickActionName$())
					Else
						If Not setMovement And selectedInput<4 And selectedInput>0;currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
							selectedInput=0
						EndIf
					EndIf
				EndIf
				For i=0 To ArraySize(joystickActionName$())
					If currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT And currentIndex<>#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT
						If i<>#H2H_ACTION_MOVEMENT And i<>#H2H_ACTION_MOVEMENT_COMBAT And i<>#H2H_ACTION_MOVEMENT_MENU
							If i=selectedInput
								AfftextColor(joystickActionName$(i),subX,subY,#Orange,128,0.75)
							Else
								AfftextColor(joystickActionName$(i),subX,subY,#White,128,0.75)
							EndIf
							subY+12
						EndIf
					Else
						If i<>#H2H_ACTION_MOVEMENT And i<>#H2H_ACTION_MOVEMENT_COMBAT And i<>#H2H_ACTION_MOVEMENT_MENU
							If i=selectedInput
								AfftextColor(joystickActionName$(i),subX,subY,#Orange,128,0.75)
							Else
								AfftextColor(joystickActionName$(i),subX,subY,#White,128,0.75)
							EndIf
							subY+12
						Else
							If setMovement
								If i=selectedInput
									AfftextColor(joystickActionName$(i),subX2,subY2,#Orange,128,0.75)
								Else
									AfftextColor(joystickActionName$(i),subX2,subY2,#White,128,0.75)
								EndIf
								subY2+12
							EndIf
						EndIf
					EndIf
				Next
			EndIf
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
	#H2H_MENU_SETTINGS_PLAYER_COLOR
	#H2H_MENU_SETTINGS_COMBO_DISPLAY
	#H2H_MENU_SETTINGS_WIND_DISPLAY
	#H2H_MENU_SETTINGS_PARTICLE_DISPLAY
	#H2H_MENU_SETTINGS_ATTACK_DELAY
	#H2H_MENU_SETTINGS_PERFORMANCE
	#H2H_MENU_SETTINGS_REFRESH_RATE
	#H2H_MENU_SETTINGS_SHOW_FPS
	#H2H_MENU_SETTINGS_SCREEN_SIZE
	#H2H_MENU_SETTINGS_FULLSCREEN
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
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControlKeys,left)
		left=1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControlKeys,right)
		right=1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or controlJustPressed(*menuControlKeys,attack) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or controlJustPressed(*menuControlKeys,accept)
		accept=1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or controlJustPressed(*menuControlKeys,up)
		index-1
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or controlJustPressed(*menuControlKeys,down)
		index+1
	EndIf
	If index<#H2H_MENU_SETTINGS_SOUND_VOLUME
		index=#H2H_MENU_SETTINGS_SAVE_AND_EXIT
	EndIf
	If index>#H2H_MENU_SETTINGS_SAVE_AND_EXIT
		index=#H2H_MENU_SETTINGS_SOUND_VOLUME
	EndIf

	; List
	;{
	subX=x+375
	subY=y
	subY=AfftextColor("       Settings",x,subY,#Orange,128,2)+8
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PLAYER_COLOR*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"Player color ",#H2H_MENU_SETTINGS_PLAYER_COLOR,index)
	Select playerColorMode
		Case #H2H_PLAYER_COLOR_MODE_ADAPTATIVE
		Afftext("Adaptative",subX,tmpY)
		Case #H2H_PLAYER_COLOR_MODE_ALTERNATIVE
		Afftext("Alternative",subX,tmpY)
		Case #H2H_PLAYER_COLOR_MODE_BASIC
		Afftext("Basic",subX,tmpY)
		Case #H2H_PLAYER_COLOR_MODE_CONTRAST
		Afftext("High contrast",subX,tmpY)
	EndSelect
	If playerColorMode=#H2H_PLAYER_COLOR_MODE_DEFAULT
		AfftextColor("(default)",subX+150,tmpY,#Blue)
	EndIf
	If index=#H2H_MENU_SETTINGS_PLAYER_COLOR
		If right Or accept
			playerColorMode+1
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
		If left 
			playerColorMode-1
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
		If playerColorMode<#H2H_PLAYER_COLOR_MODE_ADAPTATIVE
			playerColorMode=#H2H_PLAYER_COLOR_MODE_CONTRAST
		EndIf
		If playerColorMode>#H2H_PLAYER_COLOR_MODE_CONTRAST
			playerColorMode=#H2H_PLAYER_COLOR_MODE_ADAPTATIVE
		EndIf
		Select playerColorMode
			Case #H2H_PLAYER_COLOR_MODE_ADAPTATIVE
				AfftextColor("Player 2 (left) will have alternate color if the other player has a too similar color",subX+250,tmpY,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_ALTERNATIVE
				AfftextColor("Player 2 (left) will have alternate color if the stance has a specific color",subX+250,tmpY,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_BASIC
				AfftextColor("Player 1 (right) is orange, Player 2 (left) is blue",subX+250,tmpY,#Blue)
			Case #H2H_PLAYER_COLOR_MODE_CONTRAST
				AfftextColor("Player 1 (right) is black, Player 2 (left) has high contrast",subX+250,tmpY,#Blue)
		EndSelect
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_VOLUME*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"  Sound volume  ",#H2H_MENU_SETTINGS_SOUND_VOLUME,index)
	Afftext(Str(soundlevel),subX-AfftextGetLength(Str(soundlevel)),tmpY)
	classDisplayLevel(soundlevel/10,subX+25,tmpY,-1,#False,0.25)
	If index=#H2H_MENU_SETTINGS_SOUND_VOLUME
		If right
			soundlevel+10
			If soundlevel>100
				soundlevel=100
			Else
				psound(#H2H_SOUND_ID_MENUCLIC)
			EndIf
		Else
			If left
				soundlevel-10
				If soundlevel<0
					soundlevel=0
				Else
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			EndIf
		EndIf
	EndIf
	;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_MUSIC_VOLUME*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"  Music volume  ",#H2H_MENU_SETTINGS_MUSIC_VOLUME,index)
	Afftext(Str(musicLevel),subX-AfftextGetLength(Str(musicLevel)),tmpY)
	classDisplayLevel(musicLevel/10,subX+25,tmpY,-1,#False,0.25)
	If index=#H2H_MENU_SETTINGS_MUSIC_VOLUME
		If right
			musicLevel+10
			If musicLevel>100
				musicLevel=100
			Else
				psound(#H2H_SOUND_ID_MENUCLIC)
				If Not IsSound(#H2H_MUSIC_MENU)
					LoadSound(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
				EndIf
				If musicLevel>0
					If SoundStatus(#H2H_MUSIC_MENU)<>#PB_Sound_Playing
						PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop)
					EndIf
				EndIf
				refreshMusicLevel()
			EndIf
		Else
			If left
				musicLevel-10
				If musicLevel<0
					musicLevel=0
				Else
					refreshMusicLevel()
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_STEREO*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY," Sound Stereo   ",#H2H_MENU_SETTINGS_SOUND_STEREO,index)
	Select stereoWidth
		Case #H2H_SOUND_STEREO_DEFAULT_WIDTH
			Afftext("Large",subX,tmpY)
			AfftextColor("(default)",subX+75,tmpY,RGB(0,0,255))
		Case #H2H_SOUND_STEREO_SMALL_WIDTH
			Afftext("Small",subX,tmpY)
		Case #H2H_SOUND_STEREO_NONE_WIDTH
			Afftext("None",subX,tmpY)
	EndSelect
	If index=#H2H_MENU_SETTINGS_SOUND_STEREO
		If right Or accept
			b=0
			If stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
				b=1
				stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
			EndIf
			If stereoWidth=#H2H_SOUND_STEREO_NONE_WIDTH
				b=1
				stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
			EndIf
			If left<>1 And b
				psound(#H2H_SOUND_ID_MENUCLIC)
			EndIf
		EndIf
		If left
			b=0
			If stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
				b=1
				stereoWidth=#H2H_SOUND_STEREO_NONE_WIDTH
			EndIf
			If stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
				b=1
				stereoWidth=#H2H_SOUND_STEREO_SMALL_WIDTH
			EndIf
			If right<>1 And b
				psound(#H2H_SOUND_ID_MENUCLIC)
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SOUND_VARIATION*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"Sound variation ",#H2H_MENU_SETTINGS_SOUND_VARIATION,index)
	If soundVariationEnabled
		Afftext("Enabled",subX,tmpY)
		If soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT
			AfftextColor("(default)",subX+100,tmpY,RGB(0,0,255))
		EndIf
	Else
		Afftext("Disabled",subX+100,tmpY)
		If soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT
			AfftextColor("(default)",subX+100,tmpY,RGB(0,0,255))
		EndIf
	EndIf
	If index=#H2H_MENU_SETTINGS_SOUND_VARIATION
		If right Or left Or accept
			If soundVariationEnabled
				soundVariationEnabled=0
			Else
				soundVariationEnabled=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
		AfftextColor("Random pitch for sounds",subX+225,tmpY,RGB(0,0,255))
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_KEYBOARD_TYPE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY," Keyboard type  ",#H2H_MENU_SETTINGS_KEYBOARD_TYPE,index)
	If keyboardType=#PB_Keyboard_International
		Afftext("Local keyboard",subX,tmpY)
	Else 
		Afftext("Force QWERTY",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_KEYBOARD_TYPE
		If right Or left Or accept
			; TODO
			If keyboardType=#PB_Keyboard_International
; 				KeyboardMode(#PB_Keyboard_Qwerty)
				keyboardType=#PB_Keyboard_Qwerty
			Else
; 				KeyboardMode(#PB_Keyboard_International)
				keyboardType=#PB_Keyboard_International
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_COMBO_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY," Combo display  ",#H2H_MENU_SETTINGS_COMBO_DISPLAY,index)
	Select comboDisplayMode
		Case #H2H_COMBO_DISPLAY_BIG
			Afftext("Big",subX,tmpY)
		Case #H2H_COMBO_DISPLAY_SMALL
			Afftext("Small",subX,tmpY)
		Case #H2H_COMBO_DISPLAY_NONE
			Afftext("None",subX,tmpY)
	EndSelect
	If comboDisplayMode=#H2H_COMBO_DISPLAY_DEFAULT
		AfftextColor("(default)",subX+75,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_COMBO_DISPLAY
		If right
			comboDisplayMode+1
			If comboDisplayMode>#H2H_COMBO_DISPLAY_NONE
				comboDisplayMode=#H2H_COMBO_DISPLAY_NONE
			Else
				If left<>1
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			EndIf
		EndIf
		If left
			comboDisplayMode-1
			If comboDisplayMode<#H2H_COMBO_DISPLAY_BIG
				comboDisplayMode=#H2H_COMBO_DISPLAY_BIG
			Else
				If right<>1
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_WIND_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"  Wind display  ",#H2H_MENU_SETTINGS_WIND_DISPLAY,index)
	If windEnabled
		Afftext("Enabled",subX,tmpY)
	Else
		Afftext("Disabled",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_WIND_DISPLAY
		AfftextColor("Disable it for squeeze more performance if needed",subX+125,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_WIND_DISPLAY
		If right Or left Or accept
			If windEnabled
				windEnabled=0
			Else
				windEnabled=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PARTICLE_DISPLAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"Particle display",#H2H_MENU_SETTINGS_PARTICLE_DISPLAY,index)
	If particleEnabled
		Afftext("Enabled",subX,tmpY)
	Else
		Afftext("Disabled",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_PARTICLE_DISPLAY
		AfftextColor("Disable it for squeeze more performance if needed",subX+125,tmpY,RGB(0,0,255))
		If right Or left Or accept
			If particleEnabled
				particleEnabled=0
			Else
				particleEnabled=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_ATTACK_DELAY*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"  Attack delay  ",#H2H_MENU_SETTINGS_ATTACK_DELAY,index)
	Select attackDelayMode
		Case #H2H_DELTA_DELAY_MODE_OFF
			Afftext("Disabled",subX,tmpY)
		Case #H2H_DELTA_DELAY_MODE_FIX
			Afftext("Fix",subX,tmpY)
		Case #H2H_DELTA_DELAY_MODE_RELATIVE
			Afftext("Relative",subX,tmpY)
	EndSelect
	If index=#H2H_MENU_SETTINGS_ATTACK_DELAY
		AfftextColor("Damage freezes the game and shakes the screen more",subX+125,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_ATTACK_DELAY
		If right Or accept
			Select attackDelayMode
				Case #H2H_DELTA_DELAY_MODE_OFF
					attackDelayMode=#H2H_DELTA_DELAY_MODE_FIX
				Case #H2H_DELTA_DELAY_MODE_FIX
					attackDelayMode=#H2H_DELTA_DELAY_MODE_RELATIVE
				Case #H2H_DELTA_DELAY_MODE_RELATIVE
					attackDelayMode=#H2H_DELTA_DELAY_MODE_OFF
			EndSelect
			psound(#H2H_SOUND_ID_MENUCLIC)
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
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_PERFORMANCE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Performance  ",#H2H_MENU_SETTINGS_PERFORMANCE,index)
	If index=#H2H_MENU_SETTINGS_PERFORMANCE
		If buffedFrames=#H2H_FRAME_BUFFER_ON
			AfftextColor("High CPU & disk usage",subX+250,tmpY,#Blue)
		Else
			AfftextColor("High GPU usage",subX+250,tmpY,#Blue)
		EndIf
		If right Or left Or accept
			If buffedFrames=#H2H_FRAME_BUFFER_ON
				buffedFrames=#H2H_FRAME_BUFFER_OFF
			Else
				buffedFrames=#H2H_FRAME_BUFFER_ON
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If buffedFrames=#H2H_FRAME_BUFFER_ON
		Afftext("Load on demand",subX,tmpY)
	Else
		Afftext("Load everything",subX,tmpY)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_REFRESH_RATE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Refresh rate ",#H2H_MENU_SETTINGS_REFRESH_RATE,index)
	afftext(Str(fpsMode(currentFPSMode))+" FPS",subX,tmpY)
	If currentFPSMode=#H2H_FPS_MODE_DEFAULT
		AfftextColor("(default)",subX+100,tmpY,RGB(0,0,255))
	EndIf
	If globalFPS<70
		AfftextColor("Too low FPS can break the gameplay",subX+100,tmpY,RGB(0,0,255))
	EndIf
	If index=#H2H_MENU_SETTINGS_REFRESH_RATE
		If right
			If currentFPSMode<ArraySize(fpsMode())
				If Not left
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
				currentFPSMode+1
				fpsModeChange(currentFPSMode)
			EndIf
		EndIf
		If left
			If currentFPSMode>1
				If Not right
					psound(#H2H_SOUND_ID_MENUCLIC)
				EndIf
				currentFPSMode-1
				fpsModeChange(currentFPSMode)
			EndIf
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SHOW_FPS*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"    Show FPS    ",#H2H_MENU_SETTINGS_SHOW_FPS,index)
	If showFPS
		Afftext("Yes",subX,tmpY)
	Else
		Afftext("No",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_SHOW_FPS
		If debugEnabled Or accept
			AfftextColor("Can be toggled in debug mode with shift+0",subX+75,tmpY,RGB(0,0,255))
		EndIf
		If right Or left
			If showFPS
				showFPS=0
			Else
				showFPS=1
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SCREEN_SIZE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Screen size  ",#H2H_MENU_SETTINGS_SCREEN_SIZE,index)
	afftext(Str(screenSizeX)+"x"+Str(screenSizeY),subX,tmpY)
	If screenSizeX=1920 And screenSizeY=1080
		AfftextColor("(recommended for big screens)",subX+150,tmpY,RGB(255,128,0))
	EndIf
	If screenSizeX=1280 And screenSizeY=720
		AfftextColor("(recommended for windowed/small screens)",subX+150,tmpY,RGB(255,128,0))
	EndIf
	If index=#H2H_MENU_SETTINGS_SCREEN_SIZE
		AfftextColor("Also changes the fight width",subX+350-(Bool(screenSizeX<1500)*200),tmpY+#H2H_SETTINGS_LINE_HEIGHT,RGB(0,0,255))
		previousType=selectedType
		If right Or accept
			selectedType+1
			If selectedType>ArraySize(*screenType()) Or Not *screenType(selectedType)
				selectedType=0
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
		If left
			selectedType-1
			If selectedType<0
				selectedType=ArraySize(*screenType())
				While Not *screenType(selectedType)
					selectedType-1
				Wend
			EndIf
		EndIf
		If previousType<>selectedType
			psound(#H2H_SOUND_ID_MENUCLIC)
			changeScreen(*screenType(selectedType)\x,*screenType(selectedType)\y)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_FULLSCREEN*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Fullscreen   ",#H2H_MENU_SETTINGS_FULLSCREEN,index)
	If fullscreen
		Afftext("Enabled",subX,tmpY)
	Else
		Afftext("Disabled",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_FULLSCREEN
		If right Or left Or accept
			If fullscreen
				fullscreen=0
			Else
				fullscreen=1
			EndIf
			changeScreen(*screenType(selectedType)\x,*screenType(selectedType)\y)
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_DEBUG_MODE*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Debug mode   ",#H2H_MENU_SETTINGS_DEBUG_MODE,index)
	If debugOption
		Afftext("Enabled",subX,tmpY)
	Else
		Afftext("Disabled",subX,tmpY)
	EndIf
	If index=#H2H_MENU_SETTINGS_DEBUG_MODE
		AfftextColor("Enables special hidden commands",subX+150,tmpY,RGB(0,0,255))
		If right Or left Or accept
			If debugOption
				debugOption=0
				debugEnabled=0
				slomo=0
			Else
				debugOption=1
				debugEnabled=-1
			EndIf
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_KEYBOARD*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"    Keyboard    ",#H2H_MENU_SETTINGS_KEYBOARD,index)
	If index=#H2H_MENU_SETTINGS_KEYBOARD
		AfftextColor("Change keyboard controls here",subX,tmpY,#Blue)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_CONTROLLER*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"   Controller   ",#H2H_MENU_SETTINGS_CONTROLLER,index)
	If index=#H2H_MENU_SETTINGS_CONTROLLER
		AfftextColor("Change controller controls here",subX,tmpY,#Blue)
	EndIf
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_RESET*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY,"Reset to default",#H2H_MENU_SETTINGS_RESET,index)
;=======================================================================================================================================================================================================================
	tmpY=subY+#H2H_MENU_SETTINGS_SAVE_AND_EXIT*#H2H_SETTINGS_LINE_HEIGHT
	displayMenuButtonText(x,tmpY," Save & Return  ",#H2H_MENU_SETTINGS_SAVE_AND_EXIT,index)
;=======================================================================================================================================================================================================================
	;}
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
			psound(#H2H_SOUND_ID_MENUACCEPT)
			soundlevel=#H2H_SOUND_DEFAULT_VOLUME
			If musicLevel=0
				PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop)
			EndIf
			musicLevel=#H2H_MUSIC_DEFAULT_VOLUME
			windEnabled=#H2H_FRAME_WIND_ENABLED_DEFAULT
			particleEnabled=#H2H_PARTICLE_ENABLED_DEFAULT
			refreshMusicLevel()
			keyboardType=#PB_Keyboard_International
			KeyboardMode(#PB_Keyboard_International)
			comboDisplayMode=#H2H_COMBO_DISPLAY_DEFAULT
			stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
			soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT
			buffedFrames=#H2H_FRAME_BUFFER_DEFAULT
			debugOption=#H2H_DEBUG
			playerColorMode=#H2H_PLAYER_COLOR_MODE_DEFAULT
			fpsModeChange(#H2H_FPS_MODE_DEFAULT)
			showFPS=1
		EndIf
		If index=#H2H_MENU_SETTINGS_KEYBOARD
			ProcedureReturn 2
		EndIf
		If index=#H2H_MENU_SETTINGS_CONTROLLER
			ProcedureReturn 3
		EndIf
	EndIf
	;}

	ProcedureReturn -1
EndProcedure

Procedure difficultyMenu(x.i=0,y.i=0)
	Static index=0
	
	subY=y
	subY=AfftextColor("       Difficulty",x,subY,#Orange,128,2)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	If index=0 
		AfftextColor("Attacks randomly, heavy attacks are rare.",500+x,50+y,#Blue,64)
	EndIf
	subY=displayMenuButtonText(x,subY,"    Easy    ",0,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	If index=1
		AfftextColor("Attacks frequently, punishes you in the air\and may use random combos.",500+x,50+y,#Blue,64)
	EndIf
	subY=displayMenuButtonText(x,subY,"   Medium   ",1,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	If index=2
		AfftextColor("Attacks very frequently with semi-intelligent combos.\Some classes and stances may have specific behaviors.",500+x,50+y,#Blue,64)
	EndIf
	subY=displayMenuButtonText(x,subY,"    Hard    ",2,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	subY=displayMenuButtonText(x,subY,"  (go back) ",3,index,0,1.5)
	subY+#H2H_SETTINGS_LINE_HEIGHT
	If playerHasCommand(*player1,#H2H_CONTROL_UP,#True) Or playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControlKeys,up) Or controlJustPressed(*menuControlKeys,left)
		index-1
		If index<0
			index=0
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_DOWN,#True) Or playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControlKeys,down) Or controlJustPressed(*menuControlKeys,right)
		index+1
		If index>3
			index=3
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_ATTACK,#True) Or playerHasCommand(*player1,#H2H_CONTROL_ACCEPT,#True) Or controlJustPressed(*menuControlKeys,attack) Or controlJustPressed(*menuControlKeys,accept)
		psound(#H2H_SOUND_ID_MENUACCEPT)
		ProcedureReturn index
	EndIf
	ProcedureReturn -1
EndProcedure

#H2H_DABEDIDABUDA=$FF8080

Procedure creditMenu(x.i=0,y.i=0)
	Static tutorialWave.f=128
	Static tutorialWaveDirection=-4
	Static page=0

	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControl,left)
		page-1
		If page<0
			page=0
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControl,right)
		page+1
		If page>2
			page=2
		Else
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
	Select page
		Case 0:
			level=AfftextColor("Main contributors",80+x,level,#Orange,128,2)+20
			level=AfftextColor("FlameofChange",80+x,level,#Orange,128,1.5)+5
			level=AfftextColor("> Game design\> Code\> Graphics\> Music\> Sound design\> Hand rotoscoping",80+x,level,#H2H_DABEDIDABUDA,64)+20
			level=AfftextColor("Nemerod",80+x,level,#Orange,128,1.5)
			level=AfftextColor("> Sound load/play system\> Back-end support\> Discord assistance",80+x,level,#H2H_DABEDIDABUDA,64)+20
			
			level=AfftextColor("Total Hand drawn",80+x,level,#Orange,128,1.5)+5
			level=AfftextColor("950+ FlameofChange (stoped counting)",80+x,level,#H2H_DABEDIDABUDA,64)+5
			level=AfftextColor(" 27  Myst2D",80+x,level,#H2H_DABEDIDABUDA,64)
			level=AfftextColor("  4  Gwendolyn",80+x,level,#H2H_DABEDIDABUDA,64)
			level=AfftextColor("  1  Stalfos H. Dubois",80+x,level,#H2H_DABEDIDABUDA,64)
		Case 1:
			level=AfftextColor("Libraries",80+x,level,#Orange,128,1.5)
			level=AfftextColor("> RotateImage by Luis http://luis.no-ip.net",80+x,level,#H2H_DABEDIDABUDA,64)+20
			level=AfftextColor("Softwares used",80+x,level,#Orange,128,1.5)+5
			level=AfftextColor("> PureBasic\> Idle (python)\> Reaper\> Audacity\> FL studio 12\> Paint Tool Sai\> Paint.net\> MS Paint\> Illustrator",80+x,level,#H2H_DABEDIDABUDA,64)+20

			level=AfftextColor("Sounds",80+x,level,#Orange,128,1.5)+5
			level=AfftextColor("'Borrowed' from",80+x,level,#Orange,64,1.25)+2
			level=AfftextColor("> Brawlhalla\> Mount&Blade Warband\> Warcraft 3\> Europa Universalis IV\> Rise of Nations",80+x,level,#H2H_DABEDIDABUDA,64)+10
			level=AfftextColor("Libraries",80+x,level,#Orange,64,1.25)+2
			level=AfftextColor("> Full Deadly Kombat Sound Library by @DanielSoundsGood",80+x,level,#H2H_DABEDIDABUDA,64)
		Case 2:
			level=AfftextColor("Special thanks",80+x,level,#Orange,128,2)+20
			level=AfftextColor("> Kaldrin (animation support)\> Serane155 (twitch promotion)\> Yeon (former Discord assistant)\> John Batch (former support dev)\> Johen Sound (sound design support)\> Black Door Games (regional gamedev cluster)\> Aspect (discord community)\> Arcadia corp (discord community)\> La Gamecup 2,3 and 4 (contest entry)\> Alex d'or 2023 (community & contest entry)\> Beben (beta-test & QA support)",80+x,level,#H2H_DABEDIDABUDA,64)
		
	EndSelect
	;}
	If page>0
		displayComboSprite(#H2H_COMBO_NSIDE,25,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
	If page<2
		displayComboSprite(#H2H_COMBO_NBACK,screenSizeX-100,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
EndProcedure

Global page.i=0
Procedure tutorialMenu(x.i=0,y.i=0)
	Static tutorialWave.d=16
	Static tutorialWaveDirection.d=3
	ExamineKeyboard()
	checkPlayerKey(*player1)
	checkMenuKey()
	If *player1\pushed\special=1 Or *menuControl\special=1 Or *player1\pushed\exit=1
		goBack=2
	EndIf
	;{
	level=y
	level=AfftextColor("TUTORIAL",80+x,level,#Orange,128,2)+5
	If playerHasCommand(*player1,#H2H_CONTROL_LEFT,#True) Or controlJustPressed(*menuControl,left)
		page-1
		If page<0
			page=0
		Else
			psound(#H2H_SOUND_ID_MENUCLIC)
		EndIf
	EndIf
	If playerHasCommand(*player1,#H2H_CONTROL_RIGHT,#True) Or controlJustPressed(*menuControl,right)
		page+1
		If page>7
			page=7
		Else
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
	Select page
		Case 0:
			; basics handling
			frameDisplay(*allClasses(2)\animations[1]\frames(0),100,100,255,#H2H_STANCE_COLOR_BLUE)
			frameDisplay(*allClasses(2)\animations[0]\frames(0),450,0,64,#H2H_STANCE_COLOR_BLUE,0,32)
			frameDisplay(*allClasses(2)\animations[2]\frames(0),750,50,255,#H2H_STANCE_COLOR_BLUE)
			afftext("<---- Move left with "+keyToString$(*player1\keyboardControl\left),100,300)
			afftext("Move right with "+keyToString$(*player1\keyboardControl\right)+" ---->",800,300)
			
			frameDisplay(*allClasses(2)\animations[3]\backWind(2,0)\frames(0),100,400,224,#H2H_STANCE_COLOR_BLUE,0,48)
			frameDisplay(*allClasses(2)\animations[3]\frames(2),100,400,255,#H2H_STANCE_COLOR_BLUE)
			frameDisplay(*allClasses(2)\animations[3]\frontWind(2,0)\frames(0),100,250,224,#H2H_STANCE_COLOR_BLUE,0,32)
			afftext("Neutral attack with "+keyToString$(*player1\keyboardControl\attack),100,650)
; 				frameDisplay(*allClasses(2)\animations[8]\backWind(2,0)\frames(0),800,400,255,#H2H_STANCE_COLOR_BLUE,0,48)
			frameDisplay(*allClasses(2)\animations[8]\frames(2),700,350,255,#H2H_STANCE_COLOR_BLUE)
; 				frameDisplay(*allClasses(2)\animations[8]\frontWind(2,0)\frames(0),800,250,255,#H2H_STANCE_COLOR_BLUE,0,32)
			afftext("Heavy attack with "+keyToString$(*player1\keyboardControl\heavy),800,650)
		Case 1:
			; attack direction
			level=afftext("Use neutral + direction do make other types of attacks ! (front, back, up, down)\Heavy attacks do not have direction...\Attack direction is always relative to where the hand is turned.\Facing the enemy is automatic when not attacking.",80+x,level)
			; neutral
			frameDisplay(*allClasses(2)\animations[3]\backWind(2,0)\frames(0),350,300,60,#H2H_STANCE_COLOR_BLUE,0,12)
			frameDisplay(*allClasses(2)\animations[3]\frames(2),350,300,64,#H2H_STANCE_COLOR_BLUE,0,32)
			frameDisplay(*allClasses(2)\animations[3]\frontWind(2,0)\frames(0),350,150,60,#H2H_STANCE_COLOR_BLUE,0,8)
			; side
			frameDisplay(*allClasses(2)\animations[4]\backWind(3,0)\frames(0),200,265,224,#H2H_STANCE_COLOR_BLUE,0,48)
			frameDisplay(*allClasses(2)\animations[4]\frames(3),200,265,255,#H2H_STANCE_COLOR_BLUE)
			frameDisplay(*allClasses(2)\animations[4]\frontWind(3,0)\frames(0),0,250,224,#H2H_STANCE_COLOR_BLUE,0,32)
			afftext(keyToString$(*player1\keyboardControl\attack)+" + "+keyToString$(*player1\keyboardControl\left),200,565)
			; back
			frameDisplay(*allClasses(2)\animations[6]\frames(3),950,265,255,#H2H_STANCE_COLOR_BLUE)
			frameDisplay(*allClasses(2)\animations[6]\frontWind(3,0)\frames(0),675,290,224,#H2H_STANCE_COLOR_BLUE,0,32)
			afftext(keyToString$(*player1\keyboardControl\attack)+" + "+keyToString$(*player1\keyboardControl\right),900,230)
		Case 2:
			; combo
			level=afftext("Follow a hit with another attack to make combos !\Each class has its own combo tree.\Missing, stop attacking or doing the wrong combo put the hand on cooldown.\Successfuly finishing a combo has low-to-no cooldown !\Attacks and direction can be kept pressed.",80+x,level)
			k=0
			For i=#H2H_COMBO_NEUTRAL To #H2H_COMBO_HEAVY
				displayComboSprite(i,50,200+75*k,#H2H_STANCE_COLOR_BLUE,128,#False,#False,0.5)
				displayComboSprite(i,150,235+75*k,#H2H_STANCE_COLOR_BLUE,128,#True)
				k+1
			Next
			AfftextColor("Neutral",200,235,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Side",200,310,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Up",200,385,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Back",200,460,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Down",200,535,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Heavy",200,610,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Examples",600,225,#H2H_STANCE_COLOR_BLUE,64,1.5)
			AfftextColor("Side Side Side",600,255,#H2H_STANCE_COLOR_BLUE)
			For i=0 To 2
				displayComboSprite(#H2H_COMBO_NSIDE,600+i*75,275,#H2H_STANCE_COLOR_BLUE,128,#False,#False,0.5)
			Next
			
			afftextColor("Back Heavy Back",600,405,#H2H_STANCE_COLOR_WOOD)
			displayComboSprite(#H2H_COMBO_NBACK,600,425,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
			displayComboSprite(#H2H_COMBO_HEAVY,675,415,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
			displayComboSprite(#H2H_COMBO_NBACK,750,425,#H2H_STANCE_COLOR_WOOD,128,#False,#False,0.5)
			
			afftextColor("Up Heavy Neutral",600,555,#H2H_STANCE_COLOR_YELLOW)
			displayComboSprite(#H2H_COMBO_NUP,600,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
			displayComboSprite(#H2H_COMBO_HEAVY,675,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
			displayComboSprite(#H2H_COMBO_NEUTRAL,750,575,#H2H_STANCE_COLOR_YELLOW,128,#False,#False,0.5)
		Case 3:
			; special
			level=afftext("Dodge with "+keyToString$(*player1\keyboardControl\special)+" with no direction",80+x,level)+3
			level=afftext("Jump with  "+keyToString$(*player1\keyboardControl\special)+" + "+keyToString$(*player1\keyboardControl\up),80+x,level)+3
			level=AfftextColor("Dash with  "+keyToString$(*player1\keyboardControl\special)+" + "+keyToString$(*player1\keyboardControl\left)+"/"+keyToString$(*player1\keyboardControl\right)+" (to be added...)",80+x,level,#Blue)+3
			level=AfftextColor("Block with "+keyToString$(*player1\keyboardControl\special)+" + "+keyToString$(*player1\keyboardControl\down)+" (to be added...)",80+x,level,#Blue)+3
			level=AfftextColor("Pause the game with back space",80+x,level,#Blue)+25
			level=AfftextColor("Each player has up to 2 HP Bar\Some HP are regenerated when the last one is damaged",80+x,level)+3
			level=AfftextColor("Each damage and stun destroys the guard bar\When the guard bar is destroyed, all damage stuns !",80+x,level)+3
		Case 4:
			; Stats part 1
			AfftextColor("Strength",385,100,#H2H_STANCE_COLOR_RED,128,2)
			AfftextColor("> Increases damage, push power and block power\> Decreases weight penalty on mobility and received movement pushes\> Slightly increases cut and blunt damage",300,140,#H2H_STANCE_COLOR_RED,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_STRENGTH),25,100)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_STRENGTH,300,75,iconColor(#H2H_ICON_STRENGTH))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_STRENGTH),300,75)
			CompilerEndIf
			
			AfftextColor("Agility",385,300,#H2H_STANCE_COLOR_BLUE,128,2)
			AfftextColor("> Reduces attack, dodge, block, dash and jump cooldowns\> Slighlty increases pierce damage",300,340,#H2H_STANCE_COLOR_BLUE,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_AGILITY),25,300)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_AGILITY,300,275,iconColor(#H2H_ICON_AGILITY))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_AGILITY),300,275)
			CompilerEndIf
			
			AfftextColor("Speed",385,500,#H2H_STANCE_COLOR_YELLOW,128,2)
			AfftextColor("> Increases movement speed and jump height\> reduces dodge & parry delay\> Slighlty increases cut damage",300,540,#H2H_STANCE_COLOR_YELLOW,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_SPEED),25,500)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_SPEED,300,475,iconColor(#H2H_ICON_SPEED))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_SPEED),300,475)
			CompilerEndIf
		Case 5:
			; Stats part 2
			AfftextColor("Weight",385,100,#H2H_STANCE_COLOR_WOOD,128,2)
			AfftextColor("> Increases push resistance, inflicted stun and jump cooldown\> Reduces movement speed and jump height\> Slightly increases blunt damage\> Increase the max guard",300,140,#H2H_STANCE_COLOR_WOOD,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_WEIGHT),25,100)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_WEIGHT,300,75,iconColor(#H2H_ICON_WEIGHT))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_WEIGHT),300,95)
			CompilerEndIf
			
			AfftextColor("Stamina",385,300,#H2H_STANCE_COLOR_ORANGE,128,2)
			AfftextColor("> Increases regeneration speed & max regeneration when at the first HP bar\> Reduces incoming stun and damage\> Increases the guard regen rate",300,340,#H2H_STANCE_COLOR_ORANGE,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_ENDURENCE),25,300)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_ENDURENCE,300,275,iconColor(#H2H_ICON_ENDURENCE))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_ENDURENCE),300,275)
			CompilerEndIf
			
			AfftextColor("Life",385,500,RGB(255,0,128),128,2)
			AfftextColor("> Increases max HP, added to the second HP bar",300,540,RGB(255,0,128),64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_LIFE),25,500)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_LIFE,300,475,iconColor(#H2H_ICON_LIFE))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_LIFE),300,475)
			CompilerEndIf
		Case 6:
			; Stats part 3
			AfftextColor("Cut",385,100,#H2H_STANCE_COLOR_GRAY,128,2)
			AfftextColor("> Increases cut damage",300,140,#H2H_STANCE_COLOR_GRAY,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_CUT),25,75)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_CUT,300,75,iconColor(#H2H_ICON_CUT))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_CUT),300,50)
			CompilerEndIf
			
			AfftextColor("Pierce",385,300,#H2H_STANCE_COLOR_GRAY,128,2)
			AfftextColor("> Increases pierce damage",300,340,#H2H_STANCE_COLOR_GRAY,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_PIERCE),25,300)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_PIERCE,300,275,iconColor(#H2H_ICON_PIERCE))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_PIERCE),300,275)
			CompilerEndIf
			
			AfftextColor("Blunt",385,500,#H2H_STANCE_COLOR_GRAY,128,2)
			AfftextColor("> Increases blunt damage",300,540,#H2H_STANCE_COLOR_GRAY,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_BLUNT),25,500)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_BLUNT,300,475,iconColor(#H2H_ICON_BLUNT))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_BLUNT),300,475)
			CompilerEndIf
		Case 7:
			; Stats part 4
			AfftextColor("Range",385,100,#H2H_STANCE_COLOR_GRAY,128,2)
			AfftextColor("> Average attack distance and coverage\> Informative only",300,140,#H2H_STANCE_COLOR_GRAY,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_REACH),75,125)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_REACH,300,75,iconColor(#H2H_ICON_REACH))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_REACH),300,100)
			CompilerEndIf
			
			AfftextColor("Difficulty",385,300,#H2H_STANCE_COLOR_GRAY,128,2)
			AfftextColor("> Estimation of the complexity\> Informative only",300,340,#H2H_STANCE_COLOR_GRAY,64)
			DisplayTransparentSprite(statIcon(#H2H_ICON_DIFFICULTY),100,300)
			CompilerIf #H2H_ICON_ATLAS_ENABLED
			UIDisplay(#H2H_ICON_DIFFICULTY,300,275,iconColor(#H2H_ICON_DIFFICULTY))
			CompilerElse
			DisplayTransparentSprite(statIconMini(#H2H_ICON_DIFFICULTY),300,275)
			CompilerEndIf
	EndSelect
	;}
	If page>0
		displayComboSprite(#H2H_COMBO_NSIDE,25,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
	If page<7
		displayComboSprite(#H2H_COMBO_NBACK,screenSizeX-100,screenSizeY-100,#H2H_STANCE_COLOR_GRAY,128,#False,#False,0.5,tutorialWave)
	EndIf
EndProcedure

importOptions()
refreshMusicLevel()
If musicLevel
	PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop)
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
		Debug "already targeting "+target
		ProcedureReturn
	EndIf
	Debug "entering to "+target
	Debug "were at "+currentMenuIndex
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
		Debug "not found"
		currentMenuIndex+1
	EndIf
	Debug "we are now at "+currentMenuIndex
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

Procedure.i globalLoop(x.i=0,y.i=0)
	currentMenu=#H2H_MENU_MAIN
	previousMenu(0)=currentMenu
	targetMenu=#H2H_MENU_MAIN
	*classIdle.animationGadget=gadgetCreate(0,0,locationCreate(screenSizeX-1000,-150),9999,1,1)
	*classIdle\freed=#True
	*classIdle\display=#True
	*classIdle\absolute=#True
	*classIdle\enabled=#True
	*classIdle\indestructible=#True
	*classIdle\display=Bool(screenSizeX>1200)
	
	*classIdle2.animationGadget=gadgetCreate(0,0,locationCreate(50,-150),9999,1,1)
	*classIdle2\freed=#True
	*classIdle2\display=#True
	*classIdle2\enabled=#True
	*classIdle2\absolute=#True
	*classIdle2\fliped=1
	*classIdle2\indestructible=#True
	*mainGame.game=gameCreate1v1(0,*desktop,#False)
	Repeat
		active=Bool((Not blackScreenEnabled Or blackScreenVelocity<0) And GetActiveWindow()<>-1)
		Repeat
			Event = WindowEvent()
			If active
				KeyUpdate(Event)
			EndIf
			Select Event
				Case #PB_Event_Gadget
					If EventGadget()=0
						End
					EndIf
				Case #PB_Event_CloseWindow
					End
			EndSelect
		Until Not Event
		stamp.d=ElapsedMillisecondsPrecise()
		clearScreenGray()
		If active
			checkPlayerKey(*player1)
			checkPlayerKey(*player2)
			If currentMenu=targetMenu And (playerHasCommand(*player1,#H2H_CONTROL_EXIT,#True) Or controlJustPressed(*menuControlKeys,special) Or controlJustPressed(*menuControlKeys,exit))
				Debug "duh"
				If currentMenuIndex=0
; 							Debug "exit 3"
					targetMenu=#H2H_MENU_EXIT
					psound(#H2H_SOUND_ID_MENUCANCEL)
				Else
					If currentMenu<>#H2H_MENU_BATTLE
; 						Debug "exit 2"
						enterMenu(previousMenu(currentMenuIndex-1))
						psound(#H2H_SOUND_ID_MENUCANCEL)
					Else
						If gamePaused
; 							Debug "exit 1"
							*player1\controlEnabled=#True
							*player2\controlEnabled=#True
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

		If active
			If Not blackScreenEnabled
				If targetMenu<>currentMenu
					Debug "["+currentMenuIndex+"] initiated transition from "+currentMenu+" To "+targetMenu
					blackScreenStart()
				EndIf
			EndIf
		EndIf

		Select currentMenu
			Case #H2H_MENU_MAIN ;==========================================================================================================================
				index=menuLoop(x,y)
				If index>=0
					psound(#H2H_SOUND_ID_MENUACCEPT)
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
					EndSelect
					enterMenu(targetMenu)
				EndIf
			Case #H2H_MENU_GALLERY ;==========================================================================================================================
				classGallery(*classIdle,deltaGlobal)
			Case #H2H_MENU_1V1 ;==========================================================================================================================
				result=classSelectionVersus(*classIdle,*classIdle2)
				If result<>-999
					enterMenu(#H2H_MENU_TERRAIN)
					playerPrepare(*player1,*player2,result)
					*mainGame\type=#H2H_GAME_1V1
				EndIf
			Case #H2H_MENU_1VBOT ;==========================================================================================================================
; 				classSelectionSolo(*classIdle,*classIdle2,deltaGlobal)
				result=classSelectionVersus(*classIdle,*classIdle2,#True)
				If result<>-999
					enterMenu(#H2H_MENU_DIFFICULTY)
					*mainGame\type=#H2H_GAME_1VBOT
					playerPrepare(*player1,*player2,result)
				EndIf
			Case #H2H_MENU_BATTLE ;==========================================================================================================================
				If fightLoop(*mainGame)
					If *mainGame\type=#H2H_GAME_1V1
						enterMenu(#H2H_MENU_1V1)
					EndIf
					If *mainGame\type=#H2H_GAME_1VBOT
						enterMenu(#H2H_MENU_1VBOT)
					EndIf
				EndIf
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
					*classIdle\display=#False
					*classIdle2\display=#False
				EndIf
			Case #H2H_MENU_DIFFICULTY ;==========================================================================================================================
				d=difficultyMenu(x,y)
				If d>=0
					If d=3
						enterMenu(#H2H_MENU_1VBOT)
					Else
						d+1
						If Not *bot1
							returnTo=1
							*bot1=createAI(*player1)
						EndIf
						disableAI(*bot1)
						If Not *bot2
							*bot2=createAI(*player2)
						EndIf
						*bot2\difficulty=d
						enableAI(*bot2)
						enterMenu(#H2H_MENU_TERRAIN)
					EndIf
				EndIf
		EndSelect
; 		Debug "deltaGlobal "+deltaGlobal
		If blackScreenEnabled
			If blackScreenLoop(deltaGlobal)=1
				*player1\displayDebug=-1
				*player2\displayDebug=-1
				destroyDebugSprites()
				slomo=#False
				debugEnabled=-1
				unpauseGame(#True)
				If currentMenu=#H2H_MENU_BATTLE
					classUnload(*player1\class,#True)
					classUnload(*player2\class,#True)
				EndIf
				currentMenu=targetMenu
				Debug "Changed to menu "+currentMenu
				Select currentMenu
					Case #H2H_MENU_1V1
						ready=0
						ready2=0
						playerSelected=0
						*classIdle\display=Bool(screenSizeX>1200)
						*classIdle2\display=Bool(screenSizeX>1200)
						set(*classIdle\where,screenSizeX-1000,-150)
						If screenSizeX<=1500
							set(*classIdle2\where,0,-150)
						Else
							set(*classIdle2\where,50,-150)
						EndIf
						*classIdle\opacity=64
						*classIdle2\opacity=64
					Case #H2H_MENU_1VBOT
						ready=0
						ready2=0
						playerSelected=0
						*classIdle\display=Bool(screenSizeX>1200)
						*classIdle2\display=#False;Bool(screenSizeX>1200)
 						set(*classIdle\where,screenSizeX-1000,-150)
						If screenSizeX<=1500
							set(*classIdle2\where,0,-150)
						Else
							set(*classIdle2\where,50,-150)
						EndIf
						*classIdle\opacity=64
						*classIdle2\opacity=64
					Case #H2H_MENU_GALLERY
						*classIdle\display=Bool(screenSizeX>1200)
						*classIdle2\display=0
						set(*classIdle\where,50,-150)
						*classIdle\opacity=255
						*classIdle2\opacity=255
					Case #H2H_MENU_EXIT
						End
				EndSelect
				If currentMenu=#H2H_MENU_BATTLE
					startGame(*mainGame\terrain)
				Else
					If musicLevel>0
						If Not IsSound(#H2H_MUSIC_MENU)
							LoadSound(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
						EndIf
						If SoundStatus(#H2H_MUSIC_MENU)<>#PB_Sound_Playing
							PlaySound(#H2H_MUSIC_MENU,#PB_Sound_Loop,musicLevel)
						EndIf
						If IsSound(*mainGame\terrain\music)
							FreeSound(*mainGame\terrain\music)
						EndIf
						If IsSound(*mainGame\terrain\introMusic)
							FreeSound(*mainGame\terrain\introMusic)
						EndIf
					EndIf
				EndIf
			EndIf
			blackScreenDisplay()
		EndIf
		CompilerIf #H2H_MOUSE_ENABLED
			cursorDisplay()
		CompilerEndIf
	  	If keyPushedPB(#PB_Key_LeftShift) And keyJustPushedPB(#PB_Key_F)
	  		screenShot()
	  	EndIf
	  	FlipBuffers()
	  	frameUnloadLoop()
	  	KeyClear()
		cleanPlayerKey(*player1)
		cleanPlayerKey(*player2)
		deltaGlobal=deltaSet(stamp)
	Until exit=1
EndProcedure
; toremake=0
; For i=0 To ArraySize(*allAnimations())
; 	If *allAnimations(i) And animationIsAttack(*allAnimations(i)) And Not *allAnimations(i)\frontWind() And Not *allAnimations(i)\backWind()
; 		toremake+ArraySize(*allAnimations(i)\frames())
; 	EndIf
; Next
; Debug "to remake "+toremake
; End
globalLoop(0,#H2H_SCREEN_BORDER_THICKNESS*2)

End;--- EndMain
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 5515
; FirstLine = 5040
; Folding = -+---nP1-4X-xc7-fv8-----
; EnableXP
; Executable = hand2handDemo2_1.exe
; CPU = 1