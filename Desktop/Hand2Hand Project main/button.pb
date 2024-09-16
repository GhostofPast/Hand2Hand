#H2H_ADVANCED_MENU_ENABLED=#False
CompilerIf #H2H_ADVANCED_MENU_ENABLED
;-- mouse
CompilerIf #H2H_MOUSE_ENABLED
	InitMouse()
	Global cursorNormal=spriteIndex
	spriteIndex+1
	Global cursorSelect=spriteIndex
	spriteIndex+1
	Global cursorClick=spriteIndex
	spriteIndex+1
	Global cursorCurrent=cursorNormal
	Global cursorHover=0
	Global cursorCliking=0
	
	
	Procedure cursorDisplay()
		If cursorCliking
			cursorCurrent=cursorClick
		Else
			If cursorHover
				cursorCurrent=cursorSelect
			Else
				cursorCurrent=cursorNormal
			EndIf
		EndIf
		DisplayTransparentSprite(cursorCurrent,max(0,min(screenSizeX,MouseX())),max(0,min(screenSizeY,MouseY())))
	EndProcedure
CompilerEndIf
;-> button structure
Structure button
	*where.location
	*end.location
	*to.buttonBoard
	id.i ; for click function
	label.s
	enabled.i
	show.i
	hoover.i
	clicked.i
	iconId.i
EndStructure

Global NewList *allButtons.button()

XIncludeFile "Afftext.pb"
#H2H_BUTTON_TEXT_OFFSET=4
Procedure affTextInImage(id.i,text$)
	If text$=#LF$
		ProcedureReturn 0
	EndIf
	Protected x.i=0
	Protected y.i=0
	lg=Len(text$)
	start=1
; 	If x<0
; 		start+(-x)/#CHAR_SIZE_X
; 	EndIf
	For i=start To lg
		Protected char$=Mid(text$,i,1)
		Protected code.i=Asc(char$)-32+28 ; why it must have +28 ?
		;If char$<>" " And code>=0 And code<=90
		If char$="." Or char$="," Or char$=";"
			x-5
		EndIf
		If char$="'"
			x-3
		EndIf
		Protected selectedLetter=textWhite+code
		putSpriteInImage(selectedLetter)
		StartDrawing(ImageOutput(id))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
		If char$="," Or char$=";" 
			DrawImage(ImageID(0),x,y+3)
		Else
			DrawImage(ImageID(0),x,y)
		EndIf
		StopDrawing()
		FreeImage(0)
		;EndIf
		x+#CHAR_SIZE_X+#H2H_CHAR_SPACE
		If char$="'"
			x-3
		EndIf
	Next
	ProcedureReturn x+#H2H_BUTTON_TEXT_OFFSET
EndProcedure

Procedure.i buttonCreate(x.i,y.i,sizeX.i,sizeY.i,label.s,iconId.i=0)
	Static count.i=0
	*what.button=AllocateStructure(button)
	*what\label=label
	*what\iconId=iconId
	*what\enabled=1
	*what\show=1
	AddElement(*allButtons())
	*allButtons()=*what
	*what\id=count
	count+1
	*what\iconId=spriteIndex
	spriteIndex+1
	CreateImage(1,sizeX,sizeY,32,#PB_Image_Transparent)
	length=affTextInImage(1,*what\label)
; 	If sizeX<length
		sizeX=length
; 	EndIf
	CreateSprite(*what\iconId,sizeX,sizeY,#PB_Sprite_AlphaBlending)
	StartDrawing(SpriteOutput(*what\iconId))
	DrawingMode(#PB_2DDrawing_AllChannels)
	DrawImage(ImageID(1),0,0)
	StopDrawing()
	FreeImage(1)
	ClipSprite(*what\iconId,0,0,sizeX,sizeY)
	ZoomSprite(*what\iconId,sizeX*2,sizeY*2)
	*what\where=locationCreate(x,y)
	*what\end=locationCreate(sizeX*2+x,sizeY*2+y)
	ProcedureReturn *what
EndProcedure

Procedure.i buttonDisplay(*what.button,x.i=0,y.i=0)
	If *what\show
		If IsSprite(*what\iconId)
			DisplayTransparentSprite(*what\iconId,*what\where\x+x,*what\where\y+y)
			If *what\enabled
				If *what\hoover 
					If *what\clicked;>1 And *what\clicked<4
						DisplayTransparentSprite(*what\iconId,*what\where\x+x,*what\where\y+y,128,#White)
					Else
						DisplayTransparentSprite(*what\iconId,*what\where\x+x,*what\where\y+y,128,#Orange)
					EndIf
				Else
					DisplayTransparentSprite(*what\iconId,*what\where\x+x,*what\where\y+y,128,RGB(128,128,128))
				EndIf
			Else
				DisplayTransparentSprite(*what\iconId,*what\where\x+x,*what\where\y+y,128,RGB(64,64,64))
			EndIf
		Else
			If *what\enabled
				If *what\hoover 
					If *what\clicked;>1 And *what\clicked<4
						AfftextColor(*what\label,*what\where\x+x,*what\where\y+y,#White)
					Else
						AfftextColor(*what\label,*what\where\x+x,*what\where\y+y,#Orange)
					EndIf	
				Else
					AfftextColor(*what\label,*what\where\x+x,*what\where\y+y,RGB(128,128,128))
				EndIf
			Else
				AfftextColor(*what\label,*what\where\x+x,*what\where\y+y,RGB(64,64,64))
			EndIf
		EndIf
	EndIf
EndProcedure

Global mouseClick=0

Procedure buttonRefresh(*what.button)
	CompilerIf #H2H_MOUSE_ENABLED
		If MouseX()>=*what\where\x And MouseY()>=*what\where\y And MouseX()<*what\end\x And MouseY()<*what\end\y
			*what\hoover=1
			If mouseClick=1
				*what\clicked+1
			Else
				*what\clicked=0
			EndIf
		Else
			*what\hoover=0
		EndIf
	CompilerEndIf
EndProcedure

Procedure buttonIsClicked(*what.button)
	ProcedureReturn Bool(*what\enabled And *what\show And *what\clicked>1 And *what\clicked<4)
EndProcedure

Procedure buttonRefreshAll()
	ForEach *allButtons()
		buttonRefresh(*allButtons())
	Next
EndProcedure

Procedure buttonDisplayAll()
	ForEach *allButtons()
		buttonDisplay(*allButtons())
	Next
EndProcedure

Structure buttonBoard
	List *buttonList.button()
	id.i
	display.i
	label.s
	*where.location
EndStructure

Global NewList *allButtonBoards.buttonBoard()

Procedure.i buttonBoardCreate(x.i,y.i,label.s)
	*what.buttonBoard=AllocateStructure(buttonBoard)
	NewList *what\buttonList()
	*what\where=locationCreate(x,y)
	*what\label=label
	*what\display=1
	AddElement(*allButtonBoards())
	*allButtonBoards()=*what
	ProcedureReturn *what
EndProcedure

Procedure buttonBoardAdd(*bB.buttonBoard,*b.button)
	Debug *bB
	AddElement(*bB\buttonList())
	*bB\buttonList()=*b
	ProcedureReturn *b
EndProcedure

Procedure buttonBoardAddNew(*bB.buttonBoard,x.i,y.i,sizeX.i,sizeY.i,label.s,iconId.i=0)
	ProcedureReturn buttonBoardAdd(*bB,buttonCreate(x,y,sizeX,sizeY,label,iconId))
EndProcedure

Macro buttonBoardShow(bB,b)
	bB\display=b
EndMacro

Procedure buttonBoardSwitch(*bB.buttonBoard,*new.buttonBoard)
	buttonBoardShow(*bB,#False)
	buttonBoardShow(*new,#True)
EndProcedure

Procedure buttonSwitch(*b.button)
	If *b\to
		ForEach *allButtonBoards()
			buttonBoardShow(*allButtonBoards(),#False)
		Next
		buttonBoardShow(*b\to,#True)
		Debug "Switched to "+*b\to\label
	Else
		Debug *b\label+" doesn't have destination"
	EndIf
EndProcedure

Procedure boardDisplay(*what.buttonBoard)
	If *what\display
		ForEach *what\buttonList()
			buttonDisplay(*what\buttonList(),*what\where\x,*what\where\y)
		Next
	EndIf
EndProcedure

Procedure boardDisplayAll()
	ForEach *allButtonBoards()
		If *allButtonBoards()\display
			boardDisplay(*allButtonBoards())
		EndIf
	Next
EndProcedure

Procedure interfaceLoop()
	*clicked.button=#Null
	CompilerIf #H2H_MOUSE_ENABLED
	Protected x.i=MouseX()
	Protected y.i=MouseY()
	Protected hovering=0
	ForEach *allButtonBoards()
		If *allButtonBoards()\display
			ForEach *allButtonBoards()\buttonList()
				*b.button=*allButtonBoards()\buttonList()
				If *b\enabled And *b\show
					If x>=*allButtonBoards()\where\x+*b\where\x And y>=*allButtonBoards()\where\y+*b\where\y And x<*allButtonBoards()\where\x+*b\end\x And y<*allButtonBoards()\where\y+*b\end\y
						If MouseButton(#PB_MouseButton_Left)
							*b\clicked=1
							*clicked.button=*b
							cursorCliking=1
						Else
							*b\clicked=0
						EndIf
						cursorHover=1
						*b\hoover=1
						hovering=1
					Else
						*b\hoover=0
					EndIf
				Else
					*b\hoover=0
					*b\clicked=0
				EndIf
			Next
		EndIf
	Next
	If *clicked
		buttonSwitch(*clicked)
	Else
		cursorCliking=0
	EndIf
	If Not hovering
		cursorHover=0
	EndIf
	CompilerEndIf
	ProcedureReturn *clicked
EndProcedure
CompilerIf #H2H_MOUSE_ENABLED
	*mainMenu.buttonBoard=buttonBoardCreate(500,500,"Hand2Hand menu")
	*solo.button=		buttonBoardAddNew(*mainMenu,0,0,150,20,"Solo")
	*multi.button=		buttonBoardAddNew(*mainMenu,50,50,150,20,"Multi")
	*settings.button=	buttonBoardAddNew(*mainMenu,100,100,150,20,"Settings")
	*credits.button=	buttonBoardAddNew(*mainMenu,150,150,150,20,"Credits")
	*quitMain.button=	buttonBoardAddNew(*mainMenu,200,200,150,20,"Quit")
	
	*soloMenu.buttonBoard=buttonBoardCreate(500,500,"Solo")
	*soloMenu\display=0
	*vsbot.button=		buttonBoardAddNew(*soloMenu,0,0,150,20,"Versus bot")
	*tutorial.button=	buttonBoardAddNew(*soloMenu,50,50,150,20,"Tutorial")
	*training.button=	buttonBoardAddNew(*soloMenu,100,100,150,20,"Training")
	*quitSolo.button=	buttonBoardAddNew(*soloMenu,150,150,150,20,"Back")
	
	*solo\to=*soloMenu
	*quitSolo\to=*mainMenu
CompilerEndIf

Enumeration
	#H2H_BUTTON_TEXT_TYPE_BUTTON
	#H2H_BUTTON_TEXT_TYPE_SLIDER
	#H2H_BUTTON_TEXT_TYPE_LOOP
EndEnumeration

Structure buttonText
	enabled.i
	text$
	selected.i
	soon.i
	type.i
	
	*shift.location
	*destination.location
	*size.location
	
	*goTo.menuText
	*from.menuText
	
	value.i
	defaultValue.i ;-1 is none
	Array values$(0)
EndStructure

#H2H_BUTTON_TEXT_TWEENING=0.9

Procedure.i buttonTextCreate(whatText$,isEnabled.i=1)
	*bt.buttonText=AllocateStructure(buttonText)
	*bt\shift=locationCreate(0,0)
	*bt\destination=locationCreate(0,0)
	*bt\size=locationCreate(1,1)
	*bt\enabled=isEnabled
	*bt\selected=0
	*bt\goTo=0
	*bt\from=0
	*bt\defaultValue=-1
	*bt\text$=whatText$
	ProcedureReturn *bt
EndProcedure

Procedure buttonTextAddValue(*bt.buttonText,value$)
	If *bt\type<>#H2H_BUTTON_TEXT_TYPE_BUTTON
		If ArraySize(*bt\values$())=-1
			Dim *bt\values$(0)
		Else
			ReDim *bt\values$(ArraySize(*bt\values$())+1)
		EndIf
		*bt\values$(ArraySize(*bt\values$()))=value$
	EndIf
EndProcedure

; sets a button text to a toggle version
Procedure buttonTextToggle(*bt.buttonText,defaultValue.i)
	*bt\type=#H2H_BUTTON_TEXT_TYPE_LOOP
	*bt\defaultValue=defaultValue
	buttonTextAddValue(*bt,"Enabled")
	buttonTextAddValue(*bt,"Disabled")
EndProcedure

Procedure buttonTextSwitch(*bt.buttonText,direction) ; -1 or 1
	If direction And ArraySize(*bt\values$())>-1
		*bt\value+direction
		If *bt\value>ArraySize(*bt\values$())
			If *bt\type=#H2H_BUTTON_TEXT_TYPE_LOOP
				*bt\value=0
			Else
				*bt\value=ArraySize(*bt\values$())
			EndIf
		EndIf
		If *bt\value<0
			If *bt\type=#H2H_BUTTON_TEXT_TYPE_LOOP
				*bt\value=ArraySize(*bt\values$())
			Else
				*bt\value=0
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure buttonTextLoop(*bt.buttonText,delta.d=1)
	*bt\shift\x=lerp(*bt\shift\x,*bt\destination\x,#H2H_BUTTON_TEXT_TWEENING)
	*bt\shift\y=lerp(*bt\shift\y,*bt\destination\y,#H2H_BUTTON_TEXT_TWEENING)
EndProcedure

Declare displayMenuButtonText(x.i,y.i,text$,index.i,current.i,wip.i=0,scale.f=1)

Procedure buttonTextDisplay(*bt.buttonText,x.i=0,y.i=0)
	x+*bt\shift\x
	y+*bt\shift\y
; 	Debug "loop for "+*bt\text$
	displayMenuButtonText(x,y,*bt\text$,*bt\selected,1,*bt\soon)
	If ArraySize(*bt\values$())>-1
		x+AfftextGetLength(*bt\text$)
		Afftext(*bt\values$(*bt\value),x,y)
		If *bt\value=*bt\defaultValue
			x+AfftextGetLength(*bt\values$(*bt\value))
			AfftextColor(*bt\values$(*bt\value),x,y,#Blue)
		EndIf
	EndIf
	ProcedureReturn x
EndProcedure

Enumeration
	#H2H_MENU_TEXT_TYPE_SELECTION
	#H2H_MENU_TEXT_TYPE_SETTINGS
EndEnumeration

Structure menuText
	name$
	selected.i
	Array *buttons.buttonText(0)
	loopSelection.i
	type.i
	*parent.menuText
EndStructure

Procedure menuTextCreate(newName$,*parent.menuText=0)
	*mt.menuText=AllocateStructure(menuText)
	*mt\name$=newName$
	Dim *mt\buttons(0)
	*mt\parent=*parent
	ProcedureReturn *mt
EndProcedure

Procedure menuTextAdd(*mt.menuText,*bt.buttonText)
	If *mt\buttons(0)
		ReDim *mt\buttons(ArraySize(*mt\buttons())+1)
	EndIf
	*mt\buttons(ArraySize(*mt\buttons()))=*bt
EndProcedure

Procedure menuTextDisplay(*mt.menuText,x.i=0,y.i=0)
	AfftextColor("HAND2HAND PROJECT "+#H2H_VERSION+" =======",x,y,#Orange)
	y+20
	AfftextColor("======="+*mt\name$,140+x,y,#Orange)
	y+20
	For i=0 To ArraySize(*mt\buttons())
		buttonTextDisplay(*mt\buttons(i),x,y)
		y+20
	Next
	AfftextColor("==============",x,y,#Orange)
EndProcedure

Macro menuTextGet(mt)
	mt\buttons(mt\selected)
EndMacro

Enumeration
	#H2H_MENU_SELECTION_NOT_SELECTED=-1
	#H2H_MENU_SELECTION_GOBACK=-2
EndEnumeration

Procedure menuTextLoopX(*mt.menuText,up.i=0,down.i=0,left.i=0,right.i=0,enter.i=0,back.i=0,delta.d=1)
	menuTextLoop(delta)
	For i=0 To ArraySize(*mt\buttons())
		buttonTextLoop(*mt\buttons(i),delta)
		buttonTextDisplay(*mt\buttons(i),0,i*#CHAR_SIZE_Y)
	Next
	Static nextPressed=0
	Static previousPressed=0
	Static previousSelection
	previousSelection=*mt\selected
	If up
		menuTextGet(*mt)\selected=0
		*mt\selected-1
		If *mt\selected<0
			If *mt\loopSelection
				*mt\selected=ArraySize(*mt\buttons())
			Else
				*mt\selected=0
			EndIf
		EndIf
		menuTextGet(*mt)\selected=1
	EndIf
	If down
		menuTextGet(*mt)\selected=0
		*mt\selected+1
		If *mt\selected>ArraySize(*mt\buttons())
			If *mt\loopSelection
				*mt\selected=0
			Else
				*mt\selected=ArraySize(*mt\buttons())
			EndIf
		EndIf
		menuTextGet(*mt)\selected=1
	EndIf
	If previousSelection<>*mt\selected
		psound(#H2H_SOUND_ID_MENUCLIC)
	EndIf
	If enter
		ProcedureReturn *mt\selected
	EndIf
	If back
		ProcedureReturn #H2H_MENU_SELECTION_GOBACK
	EndIf
	ProcedureReturn #H2H_MENU_SELECTION_NOT_SELECTED
EndProcedure

Global *currentMenuText.menuText

Procedure menuTextLoopXX(delta.d,*cMain.control,*cP1.control=0,*cP2.control=0)
	If *currentMenuText
		If Not blackScreenControlBlock()
			up=controlJustPressed(*cMain,#H2H_CONTROL_UP)			+controlJustPressed(*cP1,#H2H_CONTROL_UP)		+controlJustPressed(*cP2,#H2H_CONTROL_UP)
			down=controlJustPressed(*cMain,#H2H_CONTROL_DOWN)		+controlJustPressed(*cP1,#H2H_CONTROL_DOWN)		+controlJustPressed(*cP2,#H2H_CONTROL_DOWN)
			right=controlJustPressed(*cMain,#H2H_CONTROL_RIGHT)		+controlJustPressed(*cP1,#H2H_CONTROL_RIGHT)	+controlJustPressed(*cP2,#H2H_CONTROL_UP)
			left=controlJustPressed(*cMain,#H2H_CONTROL_LEFT)		+controlJustPressed(*cP1,#H2H_CONTROL_LEFT)		+controlJustPressed(*cP2,#H2H_CONTROL_LEFT)
			attack=controlJustPressed(*cMain,#H2H_CONTROL_ATTACK)	+controlJustPressed(*cP1,#H2H_CONTROL_ATTACK)	+controlJustPressed(*cP2,#H2H_CONTROL_ATTACK)
			heavy=controlJustPressed(*cMain,#H2H_CONTROL_HEAVY)		+controlJustPressed(*cP1,#H2H_CONTROL_HEAVY)	+controlJustPressed(*cP2,#H2H_CONTROL_HEAVY)
		EndIf
		ProcedureReturn menuTextLoopX(*currentMenuText,up,down,left,right,attack,heavy,delta)
	EndIf
	ProcedureReturn #H2H_MENU_SELECTION_NOT_SELECTED
EndProcedure

Procedure menuTextSwitch(*toWhat.menuText)
	*currentMenuText=*toWhat
	For i=0 To ArraySize(*currentMenuText\buttons())
		*currentMenuText\buttons(i)\shift\x=2000
		*currentMenuText\buttons(i)\destination\x=0
	Next
	*currentMenuText\buttons(*currentMenuText\selected)\destination\x=50
EndProcedure

Global *menuMain.menuText=menuTextCreate("Main menu")
menuTextAdd(*menuMain,buttonTextCreate("Player vs Player"))
menuTextAdd(*menuMain,buttonTextCreate(" Player vs Bot  "))
menuTextAdd(*menuMain,buttonTextCreate(" View fighters  "))
menuTextAdd(*menuMain,buttonTextCreate("    Options     "))
menuTextAdd(*menuMain,buttonTextCreate("    Tutorial    ",0))
menuTextAdd(*menuMain,buttonTextCreate("    Credits     "))
menuTextAdd(*menuMain,buttonTextCreate("      Exit      "))
*currentMenuText=*menuMain
menuTextGet(*currentMenuText)\selected=1
CompilerEndIf
#H2H_TEXT_MENU_INTENSITY_DEFAULT=128
Global menuTextIntensity.d=#H2H_TEXT_MENU_INTENSITY_DEFAULT
#H2H_TEXT_MENU_INTENSITY_DEFAULT_DELTA=4
Global menuTextIntensityDelta.d=#H2H_TEXT_MENU_INTENSITY_DEFAULT_DELTA
#H2H_TEXT_MENU_INTENSITY_MAX=192
#H2H_TEXT_MENU_INTENSITY_MIN=64

Procedure menuTextLoop(delta.d=1)
	menuTextIntensity+menuTextIntensityDelta*delta
	If menuTextIntensity>#H2H_TEXT_MENU_INTENSITY_MAX
		menuTextIntensity=#H2H_TEXT_MENU_INTENSITY_MAX-(menuTextIntensity-#H2H_TEXT_MENU_INTENSITY_MAX)
		menuTextIntensityDelta*-1
	EndIf
	If menuTextIntensity<#H2H_TEXT_MENU_INTENSITY_MIN
		menuTextIntensity=#H2H_TEXT_MENU_INTENSITY_MIN+(#H2H_TEXT_MENU_INTENSITY_MIN-menuTextIntensity)
		menuTextIntensityDelta*-1
	EndIf
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 315
; FirstLine = 254
; Folding = ---8---
; EnableXP
; CPU = 1