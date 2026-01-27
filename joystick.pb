Global nbJoystick=-1
; Procedure detectJoystick()
; 	nbJoystick=InitJoystick()
; 	If InitJoystick()
; 		For i=0 To nbJoystick-1
; 			Debug "detected "+JoystickName(i)
; 		Next
; 	EndIf
; 	ProcedureReturn nbJoystick
; EndProcedure
; detectJoystick()

#H2H_CONTROLLER_DISPLAY_BUTTONS_X=250
#H2H_CONTROLLER_DISPLAY_BUTTONS_Y=250
#H2H_CONTROLLER_DISPLAY_BUTTONS_SHIFT=30

#H2H_CONTROLLER_DISPLAY_LR_X=100
#H2H_CONTROLLER_DISPLAY_LR_Y=150
#H2H_CONTROLLER_DISPLAY_LR_SHIFT=150
#H2H_CONTROLLER_DISPLAY_LR2_SHIFT=25
#H2H_CONTROLLER_DISPLAY_START_X=125
#H2H_CONTROLLER_DISPLAY_START_Y=250
#H2H_CONTROLLER_DISPLAY_START_SHIFT_X=50

#H2H_CONTROLLER_DISPLAY_JOYSTICK_X=125
#H2H_CONTROLLER_DISPLAY_JOYSTICK_Y=325
#H2H_CONTROLLER_DISPLAY_JOYSTICK_SHIFT=100

Procedure joystickDisplaySub(current.i,what.i,txt.s,x.i,y.i,scale.f,Array enabled.b(1))
	If current=what
		If enabled(what)
			AfftextColor(txt,x,y,#Orange,128,scale)
		Else
			AfftextColor(txt,x,y,RGB(128,64,0),128,scale)
		EndIf
	Else
		AfftextColor(txt,x,y,RGB(1,1,1),128-Bool(enabled(what))*64,scale)
	EndIf
EndProcedure

; Display the controller of the player as an ascii art
; Highlights the current button and what it does
Procedure joystickDisplay(joystickId.i,x.i,y.i,currentButton.i,Array enabled.b(1))
	If joystickId<=-1
		ProcedureReturn
	EndIf
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_BUTTON_BOTTOM,	"O",x+#H2H_CONTROLLER_DISPLAY_BUTTONS_X,y+#H2H_CONTROLLER_DISPLAY_BUTTONS_Y+#H2H_CONTROLLER_DISPLAY_BUTTONS_SHIFT,2,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_BUTTON_LEFT,	"O",x+#H2H_CONTROLLER_DISPLAY_BUTTONS_X-#H2H_CONTROLLER_DISPLAY_BUTTONS_SHIFT,y+#H2H_CONTROLLER_DISPLAY_BUTTONS_Y,2,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_BUTTON_RIGHT,	"O",x+#H2H_CONTROLLER_DISPLAY_BUTTONS_X+#H2H_CONTROLLER_DISPLAY_BUTTONS_SHIFT,y+#H2H_CONTROLLER_DISPLAY_BUTTONS_Y,2,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_BUTTON_TOP,	"O",x+#H2H_CONTROLLER_DISPLAY_BUTTONS_X,y+#H2H_CONTROLLER_DISPLAY_BUTTONS_Y-#H2H_CONTROLLER_DISPLAY_BUTTONS_SHIFT,2,enabled())
	
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_L1,"-",x+#H2H_CONTROLLER_DISPLAY_LR_X-#H2H_CONTROLLER_DISPLAY_LR_SHIFT,y+#H2H_CONTROLLER_DISPLAY_LR_Y,4,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_R1,"-",x+#H2H_CONTROLLER_DISPLAY_LR_X+#H2H_CONTROLLER_DISPLAY_LR_SHIFT,y+#H2H_CONTROLLER_DISPLAY_LR_Y,4,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_L2,"=",x+#H2H_CONTROLLER_DISPLAY_LR_X-#H2H_CONTROLLER_DISPLAY_LR_SHIFT,y+#H2H_CONTROLLER_DISPLAY_LR_Y-#H2H_CONTROLLER_DISPLAY_LR2_SHIFT,4,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_R2,"=",x+#H2H_CONTROLLER_DISPLAY_LR_X+#H2H_CONTROLLER_DISPLAY_LR_SHIFT,y+#H2H_CONTROLLER_DISPLAY_LR_Y-#H2H_CONTROLLER_DISPLAY_LR2_SHIFT,4,enabled())
	
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_START,	"o",x+#H2H_CONTROLLER_DISPLAY_START_X-#H2H_CONTROLLER_DISPLAY_START_SHIFT_X,y+#H2H_CONTROLLER_DISPLAY_START_Y,2,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_SELECT,"o",x+#H2H_CONTROLLER_DISPLAY_START_X+#H2H_CONTROLLER_DISPLAY_START_SHIFT_X,y+#H2H_CONTROLLER_DISPLAY_START_Y,2,enabled())
	
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT, "O",x+#H2H_CONTROLLER_DISPLAY_JOYSTICK_X-#H2H_CONTROLLER_DISPLAY_JOYSTICK_SHIFT,y+#H2H_CONTROLLER_DISPLAY_JOYSTICK_Y,5,enabled())
	joystickDisplaySub(currentButton,#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT,"O",x+#H2H_CONTROLLER_DISPLAY_JOYSTICK_X+#H2H_CONTROLLER_DISPLAY_JOYSTICK_SHIFT,y+#H2H_CONTROLLER_DISPLAY_JOYSTICK_Y,5,enabled())
	
	AfftextColor("+",x-50,y+225,RGBA(32,32,32,32),192,6)
EndProcedure

Macro JoystickButtonEx(id,what)
	Bool(what>=0 And JoyPushed(id,what))
EndMacro

Procedure JoystickAxisXEx(id,what)
	If id>=0
		ProcedureReturn JoyX(id,what)*CONTROLLER_SENSITIVITY
	EndIf
	ProcedureReturn 0
EndProcedure
Procedure JoystickAxisYEx(id,what)
	If id>=0
		ProcedureReturn JoyY(id,what)*CONTROLLER_SENSITIVITY
	EndIf
	ProcedureReturn 0
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 55
; FirstLine = 29
; Folding = -
; EnableXP
; CPU = 1