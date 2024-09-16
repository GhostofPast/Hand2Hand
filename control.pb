#H2H_CONTROL_DEFAULT_LEFT_LEFT		=#PB_Key_A
#H2H_CONTROL_DEFAULT_LEFT_RIGHT		=#PB_Key_D
#H2H_CONTROL_DEFAULT_LEFT_UP		=#PB_Key_W
#H2H_CONTROL_DEFAULT_LEFT_DOWN		=#PB_Key_S
#H2H_CONTROL_DEFAULT_LEFT_NEUTRAL	=#PB_Key_C
#H2H_CONTROL_DEFAULT_LEFT_HEAVY		=#PB_Key_V
#H2H_CONTROL_DEFAULT_LEFT_SPECIAL	=#PB_Key_B

#H2H_CONTROL_DEFAULT_RIGHT_LEFT		=#PB_Key_Left
#H2H_CONTROL_DEFAULT_RIGHT_RIGHT	=#PB_Key_Right
#H2H_CONTROL_DEFAULT_RIGHT_UP		=#PB_Key_Up
#H2H_CONTROL_DEFAULT_RIGHT_DOWN		=#PB_Key_Down
#H2H_CONTROL_DEFAULT_RIGHT_NEUTRAL	=#PB_Key_P
#H2H_CONTROL_DEFAULT_RIGHT_HEAVY	=#PB_Key_O
#H2H_CONTROL_DEFAULT_RIGHT_SPECIAL	=#PB_Key_I

CompilerIf #H2H_CONTROL_UPGRADE
Global Dim vkeyToKey($ff)
Global Dim keyTovkey($ff)
	
CompilerEndIf
;----- keyToString
Global Dim keyToString$($ff)
Procedure.i stringToKey(key$)
	key$=UCase(Trim(key$))
	For i=0 To ArraySize(keyToString$())
		If key$=UCase(keyToString$(i))
			ProcedureReturn i
		EndIf
	Next
	ProcedureReturn 0
EndProcedure

keyToString$(0)="-unasigned-"
For i=1 To ArraySize(keyToString$())
	keyToString$(i)="-unkown-"
Next
;{
keyToString$(#PB_Key_A)="A"
keyToString$(#PB_Key_B)="B"
keyToString$(#PB_Key_C)="C"
keyToString$(#PB_Key_D)="D"
keyToString$(#PB_Key_E)="E"
keyToString$(#PB_Key_F)="F"
keyToString$(#PB_Key_G)="G"
keyToString$(#PB_Key_H)="H"
keyToString$(#PB_Key_I)="I"
keyToString$(#PB_Key_J)="J"
keyToString$(#PB_Key_K)="K"
keyToString$(#PB_Key_L)="L"
keyToString$(#PB_Key_M)="M"
keyToString$(#PB_Key_N)="N"
keyToString$(#PB_Key_O)="O"
keyToString$(#PB_Key_P)="P"
keyToString$(#PB_Key_Q)="Q"
keyToString$(#PB_Key_R)="R"
keyToString$(#PB_Key_S)="S"
keyToString$(#PB_Key_T)="T"
keyToString$(#PB_Key_U)="U"
keyToString$(#PB_Key_V)="V"
keyToString$(#PB_Key_W)="W"
keyToString$(#PB_Key_X)="X"
keyToString$(#PB_Key_Y)="Y"
keyToString$(#PB_Key_Z)="Z"

keyToString$(#PB_Key_0)="0"
keyToString$(#PB_Key_1)="1"
keyToString$(#PB_Key_2)="2"
keyToString$(#PB_Key_3)="3"
keyToString$(#PB_Key_4)="4"
keyToString$(#PB_Key_5)="5"
keyToString$(#PB_Key_6)="6"
keyToString$(#PB_Key_7)="7"
keyToString$(#PB_Key_8)="8"
keyToString$(#PB_Key_9)="9"

keyToString$(#PB_Key_Pad0) 		="Pad 0"
keyToString$(#PB_Key_Pad1) 		="Pad 1"
keyToString$(#PB_Key_Pad2) 		="Pad 2"
keyToString$(#PB_Key_Pad3) 		="Pad 3"
keyToString$(#PB_Key_Pad4) 		="Pad 4"
keyToString$(#PB_Key_Pad5) 		="Pad 5"
keyToString$(#PB_Key_Pad6) 		="Pad 6"
keyToString$(#PB_Key_Pad7) 		="Pad 7"
keyToString$(#PB_Key_Pad8) 		="Pad 8"
keyToString$(#PB_Key_Pad9) 		="Pad 9"
keyToString$(#PB_Key_PadComma)	="Pad Comma"
keyToString$(#PB_Key_Divide)	="Pad Divide"

keyToString$(#PB_Key_Left)	="Left"
keyToString$(#PB_Key_Right)	="Right"
keyToString$(#PB_Key_Up)	="Up"
keyToString$(#PB_Key_Down)	="Down"

keyToString$(#PB_Key_Comma)		=","
keyToString$(#PB_Key_SemiColon)	=";"
keyToString$(#PB_Key_Apostrophe)="'"
keyToString$(#PB_Key_Slash)		="/"
; keyToString$(#PB_Key_BackSlash) ="\"
keyToString$(#PB_Key_Equals) 	="="
keyToString$(#PB_Key_Add) 		="+"
keyToString$(#PB_Key_Minus) 	="-"
keyToString$(#PB_Key_Multiply) 	="*"
keyToString$(#PB_Key_Decimal) 	="."
keyToString$(#PB_Key_Space) 	="Space"
keyToString$(#PB_Key_Tab) 		="Tab"
keyToString$(#PB_Key_LeftShift)	="Left shift"
keyToString$(#PB_Key_RightShift)="Right shift"
keyToString$(#PB_Key_LeftControl)	="Left control"
keyToString$(#PB_Key_RightControl)="Right control"
keyToString$(#PB_Key_LeftAlt)	="Left alt"
keyToString$(#PB_Key_RightAlt)	="Right alt"
keyToString$(#PB_Key_Return)	="Return"
keyToString$(#PB_Key_Escape)	="Escape"
keyToString$(#PB_Key_Back)	="Back"

CompilerIf #H2H_CONTROL_UPGRADE
keyTovKey(#PB_Key_A)=#VK_A
keyTovKey(#PB_Key_B)=#VK_B
keyTovKey(#PB_Key_C)=#VK_C
keyTovKey(#PB_Key_D)=#VK_D
keyTovKey(#PB_Key_E)=#VK_E
keyTovKey(#PB_Key_F)=#VK_F
keyTovKey(#PB_Key_G)=#VK_G
keyTovKey(#PB_Key_H)=#VK_H
keyTovKey(#PB_Key_I)=#VK_I
keyTovKey(#PB_Key_J)=#VK_J
keyTovKey(#PB_Key_K)=#VK_K
keyTovKey(#PB_Key_L)=#VK_L
keyTovKey(#PB_Key_M)=#VK_M
keyTovKey(#PB_Key_N)=#VK_N
keyTovKey(#PB_Key_O)=#VK_O
keyTovKey(#PB_Key_P)=#VK_P
keyTovKey(#PB_Key_Q)=#VK_Q
keyTovKey(#PB_Key_R)=#VK_R
keyTovKey(#PB_Key_S)=#VK_S
keyTovKey(#PB_Key_T)=#VK_T
keyTovKey(#PB_Key_U)=#VK_U
keyTovKey(#PB_Key_V)=#VK_V
keyTovKey(#PB_Key_W)=#VK_W
keyTovKey(#PB_Key_X)=#VK_X
keyTovKey(#PB_Key_Y)=#VK_Y
keyTovKey(#PB_Key_Z)=#VK_Z

keyTovKey(#PB_Key_0)=#VK_0
keyTovKey(#PB_Key_1)=#VK_1
keyTovKey(#PB_Key_2)=#VK_2
keyTovKey(#PB_Key_3)=#VK_3
keyTovKey(#PB_Key_4)=#VK_4
keyTovKey(#PB_Key_5)=#VK_5
keyTovKey(#PB_Key_6)=#VK_6
keyTovKey(#PB_Key_7)=#VK_7
keyTovKey(#PB_Key_8)=#VK_8
keyTovKey(#PB_Key_9)=#VK_9

keyTovKey(#PB_Key_Pad0)=#VK_NUMPAD0
keyTovKey(#PB_Key_Pad1)=#VK_NUMPAD1
keyTovKey(#PB_Key_Pad2)=#VK_NUMPAD2
keyTovKey(#PB_Key_Pad3)=#VK_NUMPAD3
keyTovKey(#PB_Key_Pad4)=#VK_NUMPAD4
keyTovKey(#PB_Key_Pad5)=#VK_NUMPAD5
keyTovKey(#PB_Key_Pad6)=#VK_NUMPAD6
keyTovKey(#PB_Key_Pad7)=#VK_NUMPAD7
keyTovKey(#PB_Key_Pad8)=#VK_NUMPAD8
keyTovKey(#PB_Key_Pad9)=#VK_NUMPAD9
keyTovKey(#PB_Key_PadComma)=#VK_DECIMAL
keyTovKey(#PB_Key_Divide)=#VK_DIVIDE

keyTovKey(#PB_Key_Left)=#VK_LEFT
keyTovKey(#PB_Key_Right)=#VK_RIGHT
keyTovKey(#PB_Key_Up)=#VK_UP
keyTovKey(#PB_Key_Down)=#VK_DOWN

keyTovKey(#PB_Key_Comma)=#VK_OEM_COMMA
keyTovKey(#PB_Key_SemiColon)=#VK_OEM_PERIOD
keyTovKey(#PB_Key_Apostrophe)=#VK_OEM_4
keyTovKey(#PB_Key_Slash)=#VK_DIVIDE
;keyTovKey(#PB_Key_BackSlash)=
keyTovKey(#PB_Key_Equals)=#VK_OEM_PLUS
keyTovKey(#PB_Key_Add)=#VK_OEM_PLUS
keyTovKey(#PB_Key_Minus)=#VK_OEM_MINUS
keyTovKey(#PB_Key_Multiply)=#VK_MULTIPLY
keyTovKey(#PB_Key_Decimal)=#VK_OEM_PERIOD
keyTovKey(#PB_Key_Space)=#VK_SPACE
keyTovKey(#PB_Key_Tab)=#VK_TAB
keyTovKey(#PB_Key_LeftShift)=16;#VK_LSHIFT
keyTovKey(#PB_Key_RightShift)=16;#VK_RSHIFT
keyTovKey(#PB_Key_LeftControl)=17;#VK_LCONTROL
keyTovKey(#PB_Key_RightControl)=17;#VK_RCONTROL
keyTovKey(#PB_Key_LeftAlt)=#VK_LMENU
keyTovKey(#PB_Key_RightAlt)=#VK_RMENU
keyTovKey(#PB_Key_Return)=#VK_RETURN
keyTovKey(#PB_Key_Back)=#VK_BACK
keyTovKey(#PB_Key_Escape)=#VK_ESCAPE

For i=0 To $ff
	vkeyToKey(keyTovKey(i))=i
Next
vkeyToKey(16)=#PB_Key_LeftShift
vkeyToKey(17)=#PB_Key_LeftControl
;}

; KeyUpdate = doit etre absolument etre placé apres un windows event avec la valeur qu'il a donné, donc passe par une variable de base, voir exemple de mise en pratique
; 
; KeyPushed = retourne 1 si le bouton est actuellement utilisé sinon 0
; 
; KeyReleased = retourne 0 si le bouton est relâché, c'est le contraitre de KeyPushed
; 
; KeyEventPushed = permé de savoir une seul fois si le bouton a été touché en appuis
; 
; KeyEventReleased = meme chose, mais en version relâché
; 
; KeyEventSwitch = retourne 1 si le bouton a changé de statut depuis le dernier appel a KeyUpdate

; 0XX -> pushed or not pushed
; 1XX -> pushed
; 2XX -> released
; 3XX -> switched
; OLD
;{
; Global *key:*key=AllocateMemory($400)
; 
; Procedure KeyUpdate(eee):a=EventwParam()&$ff
;   If (EventlParam()&$C0000000)<>$40000000
;     If eee=$100:PokeA(*key+a+$100,1):PokeA(*key+a+$300,1):PokeA(*key+a,1):ProcedureReturn 1:EndIf;key Pushed
;     If eee=$101:PokeA(*key+a+$200,1):PokeA(*key+a+$300,1):PokeA(*key+a,0):ProcedureReturn 1:EndIf;key Released
;   EndIf
;   ProcedureReturn 0
; EndProcedure
; Procedure KeyPushed(       a):                                                      :ProcedureReturn PeekA(*key+( a&$ff)     )  :EndProcedure
; Procedure KeyReleased(     a):                                                      :ProcedureReturn PeekA(*key+( a&$ff)     )!1:EndProcedure
; Procedure KeyEventPushed(  a):r0=PeekA(*key+(a&$ff)+$100):PokeA(*key+(a&$ff)+$100,0):ProcedureReturn             r0             :EndProcedure
; Procedure KeyEventReleased(a):r0=PeekA(*key+(a&$ff)+$200):PokeA(*key+(a&$ff)+$200,0):ProcedureReturn             r0             :EndProcedure
; Procedure KeyEventSwitch(  a):r0=PeekA(*key+(a&$ff)+$300):PokeA(*key+(a&$ff)+$300,0):ProcedureReturn             r0             :EndProcedure
;}
; NEW
; 0XX -> pushed or not pushed
; 1XX -> switched
; 2XX -> just pushed
; 3XX -> just released
Global *key:*key=AllocateMemory($400)
Global lastPushed.i
Global lastReleased.i

Procedure KeyUpdate(eee)
	If (EventlParam()&$C0000000)<>$40000000
		a=EventwParam()&$ff
		If eee=$100
			PokeA(*key+a+$200,1)
			PokeA(*key+a+$100,1)
			PokeA(*key+a,1)
			lastPushed=a
;  			Debug "pressed "+a+" "+keyToString$(vkeyToKey(a))
			ProcedureReturn 1
		EndIf;key Pushed
		If eee=$101
			PokeA(*key+a+$300,1)
			PokeA(*key+a+$100,1)
			PokeA(*key+a,0)
			lastReleased=a
			ProcedureReturn 1
		EndIf;key Released
	EndIf
	ProcedureReturn 0
EndProcedure
#H2H_CONTROL_MACRO_ENABLED=0

CompilerIf #H2H_CONTROL_MACRO_ENABLED
Macro KeyPushed(a)		:PeekA(*key+(a&$ff)):EndMacro
Macro KeyReleased(a)	:PeekA(*key+(a&$ff)):EndMacro
Macro KeySwitched(a)	:PeekA(*key+(a&$ff)+$100):EndMacro
Macro KeyJustPushed(a)	:PeekA(*key+(a&$ff)+$200):EndMacro
Macro KeyJustReleased(a):PeekA(*key+(a&$ff)+$300):EndMacro
CompilerElse
Procedure KeyPushed(a)		:ProcedureReturn PeekA(*key+(a&$ff)):EndProcedure
Procedure KeyReleased(a)	:ProcedureReturn PeekA(*key+(a&$ff)):EndProcedure
Procedure KeySwitched(a)	:ProcedureReturn PeekA(*key+(a&$ff)+$100):EndProcedure
Procedure KeyJustPushed(a)	:ProcedureReturn PeekA(*key+(a&$ff)+$200):EndProcedure
Procedure KeyJustReleased(a):ProcedureReturn PeekA(*key+(a&$ff)+$300):EndProcedure
CompilerEndIf
Procedure keyClear()
	lastPushed=0
	lastReleased=0
	max=*key+$3ff
	For i=*key+$100 To max
		PokeA(i,0)
	Next
EndProcedure
CompilerEndIf
Structure control
	up.i
	down.i
	right.i
	left.i
	attack.i
	heavy.i
	special.i
	neutral.i
	attackSide.i
	attackBack.i
	attackUp.i
	attackDown.i
	jump.i
	block.i
	dashRight.i
	dashLeft.i
	accept.i
	cancel.i
	exit.i
	*alternate.control
EndStructure

Macro controlEmpty(c)
	Bool(Not(c\up Or c\down Or c\right Or c\left Or c\attack Or c\heavy Or c\special Or c\neutral Or c\attackSide Or c\attackBack Or c\attackUp Or c\attackDown Or c\jump Or c\block Or c\dashRight Or c\dashLeft))
EndMacro

Macro DoubleQuote()
    "
EndMacro

Macro addJSONControl(p,c,what)
	addJSONInteger(p,DoubleQuote()what",c\what,#True)
EndMacro

Macro getJSONControl(p,c,what)
	c\what=loadJSONInteger(p,DoubleQuote()what")
EndMacro

Procedure.i controlJSONExport(*c.control,*parent=0)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONControl(*parent,*c,up)
	addJSONControl(*parent,*c,down)
	addJSONControl(*parent,*c,right)
	addJSONControl(*parent,*c,left)
	addJSONControl(*parent,*c,attack)
	addJSONControl(*parent,*c,heavy)
	addJSONControl(*parent,*c,special)
	addJSONControl(*parent,*c,neutral)
	addJSONControl(*parent,*c,attackSide)
	addJSONControl(*parent,*c,attackBack)
	addJSONControl(*parent,*c,attackUp)
	addJSONControl(*parent,*c,attackDown)
	addJSONControl(*parent,*c,jump)
	addJSONControl(*parent,*c,block)
	addJSONControl(*parent,*c,dashRight)
	addJSONControl(*parent,*c,dashLeft)
	addJSONControl(*parent,*c,accept)
	addJSONControl(*parent,*c,cancel)
	addJSONControl(*parent,*c,exit)
	If *c\alternate And Not controlEmpty(*c\alternate)
		controlJSONExport(*c\alternate,addJSONObject(*parent,"alternate"))
	EndIf
	ProcedureReturn *parent
EndProcedure

Declare controlcreate()
Procedure.i controlJSONImport(*parent,*c.control=0)
	If Not *c
		*c=controlcreate()
	EndIf
	If Not *parent
		ProcedureReturn *c
	EndIf
	getJSONControl(*parent,*c,up)
	getJSONControl(*parent,*c,down)
	getJSONControl(*parent,*c,right)
	getJSONControl(*parent,*c,left)
	getJSONControl(*parent,*c,attack)
	getJSONControl(*parent,*c,heavy)
	getJSONControl(*parent,*c,special)
	getJSONControl(*parent,*c,neutral)
	getJSONControl(*parent,*c,attackSide)
	getJSONControl(*parent,*c,attackBack)
	getJSONControl(*parent,*c,attackUp)
	getJSONControl(*parent,*c,attackDown)
	getJSONControl(*parent,*c,jump)
	getJSONControl(*parent,*c,block)
	getJSONControl(*parent,*c,dashRight)
	getJSONControl(*parent,*c,dashLeft)
	getJSONControl(*parent,*c,accept)
	getJSONControl(*parent,*c,cancel)
	getJSONControl(*parent,*c,exit)
	*alternate=GetJSONMember(*parent,"alternate")
	If *alternate
		*c\alternate=controlJSONImport(*alternate)
	EndIf
	ProcedureReturn *c
EndProcedure

CompilerIf #H2H_CONTROL_UPGRADE
	Macro controlHasPressed(c,what)
		(keyPushedPB(c\what) Or (c\alternate\what And keyPushedPB(c\alternate\what)))
	EndMacro
	Macro controlHasReleased(c,what)
		(KeyReleasedPB(c\what) Or (c\alternate\what And KeyReleasedPB(c\alternate\what)))
	EndMacro
	Macro controlJustPressed(c,what)
		(keyJustPushedPB(c\what) Or (c\alternate\what And keyJustPushedPB(c\alternate\what)))
	EndMacro
	Macro controlJustReleased(c,what)
		(keyJustReleasedPB(c\what) Or (c\alternate\what And keyJustReleasedPB(c\alternate\what)))
	EndMacro
CompilerElse
	Macro controlHasPressed(c,what)
		(KeyboardPushed(c\what) Or (c\alternate\what And KeyboardPushed(c\alternate\what)))
	EndMacro
	Macro controlHasReleased(c,what)
		(KeyboardReleased(c\what) Or (c\alternate\what And KeyboardReleased(c\alternate\what)))
	EndMacro
CompilerEndIf

Procedure controlSet(*c.control=0,setUp.i=0,setDown.i=0,setRight.i=0,setLeft.i=0,setAttack.i=0,setHeavy.i=0,setSpecial.i=0)
	If Not *c
		*c=controlcreate()
	EndIf
	*c\up=setUp
	*c\down=setDown
	*c\right=setRight
	*c\left=setLeft
	*c\attack=setAttack
	*c\heavy=setHeavy
	*c\special=setSpecial
	ProcedureReturn *c
EndProcedure

Procedure.i controlcreate()
	*c.control=AllocateStructure(control)
	ClearStructure(*c,control)
	*c\alternate=AllocateStructure(control)
	ClearStructure(*c\alternate,control)
	ProcedureReturn *c
EndProcedure

Procedure controlCopy(*c1.control,*c2.control)
	If *c2
		CopyStructure(*c2,*c1,control)
	EndIf
EndProcedure

Structure controlState
	keep.i
	pushed.i
	jump.i
EndStructure

Procedure controlStateInit(*cs.controlState)
	*cs\jump=0
	*cs\keep=0
	*cs\pushed=0
EndProcedure

Procedure controlClear(*c.control)
	controlSet(*c)
	*c\neutral=0
	*c\attackSide=0
	*c\attackBack=0
	*c\attackUp=0
	*c\attackDown=0
	*c\jump=0
	*c\block=0
	*c\dashLeft=0
	*c\dashRight=0
EndProcedure
CompilerIf #H2H_CONTROL_MACRO_ENABLED
Macro keyPushedPB(what)
	(KeyPushed(keyTovkey(what)))
EndMacro

Macro keyReleasedPB(what)
	(KeyReleased(keyTovkey(what)))
EndMacro

Macro keyJustPushedPB(what)
	(KeyJustPushed(keyTovkey(what)))
EndMacro

Macro keyJustReleasedPB(what)
	(KeyJustReleased(keyTovkey(what)))
EndMacro
CompilerElse
Procedure keyPushedPB(what)
	ProcedureReturn KeyPushed(keyTovkey(what))
EndProcedure

Procedure keyReleasedPB(what)
	ProcedureReturn KeyReleased(keyTovkey(what))
EndProcedure

Procedure keyJustPushedPB(what)
	ProcedureReturn KeyJustPushed(keyTovkey(what))
EndProcedure

Procedure keyJustReleasedPB(what)
	ProcedureReturn KeyJustReleased(keyTovkey(what))
EndProcedure
CompilerEndIf
Enumeration
	#H2H_CONTROL_LEFT
	#H2H_CONTROL_RIGHT
	#H2H_CONTROL_UP
	#H2H_CONTROL_DOWN
	#H2H_CONTROL_ATTACK
	#H2H_CONTROL_HEAVY
	#H2H_CONTROL_SPECIAL
	#H2H_CONTROL_NEUTRAL
	#H2H_CONTROL_ATTACK_SIDE
	#H2H_CONTROL_ATTACK_BACK
	#H2H_CONTROL_ATTACK_UP
	#H2H_CONTROL_ATTACK_DOWN
	#H2H_CONTROL_DODGE
	#H2H_CONTROL_JUMP
	#H2H_CONTROL_BLOCK
	#H2H_CONTROL_DASH_RIGHT
	#H2H_CONTROL_DASH_LEFT
	#H2H_CONTROL_ACCEPT
	#H2H_CONTROL_CANCEL
	#H2H_CONTROL_EXIT
EndEnumeration

Procedure controlGet(*c.control,what)
	Select what
		Case #H2H_CONTROL_LEFT
			ProcedureReturn *c\left
		Case #H2H_CONTROL_RIGHT
			ProcedureReturn *c\right
		Case #H2H_CONTROL_UP
			ProcedureReturn *c\up
		Case #H2H_CONTROL_DOWN
			ProcedureReturn *c\down
		Case #H2H_CONTROL_ATTACK
			ProcedureReturn *c\attack
		Case #H2H_CONTROL_HEAVY
			ProcedureReturn *c\heavy
		Case #H2H_CONTROL_SPECIAL
			ProcedureReturn *c\special
		Case #H2H_CONTROL_NEUTRAL
			ProcedureReturn *c\neutral
		Case #H2H_CONTROL_ATTACK_SIDE
			ProcedureReturn *c\attackSide
		Case #H2H_CONTROL_ATTACK_BACK
			ProcedureReturn *c\attackBack
		Case #H2H_CONTROL_ATTACK_UP
			ProcedureReturn *c\attackUp
		Case #H2H_CONTROL_ATTACK_DOWN
			ProcedureReturn *c\attackDown
		Case #H2H_CONTROL_JUMP
			ProcedureReturn *c\jump
		Case #H2H_CONTROL_BLOCK
			ProcedureReturn *c\block
		Case #H2H_CONTROL_DASH_RIGHT
			ProcedureReturn *c\dashRight
		Case #H2H_CONTROL_DASH_LEFT
			ProcedureReturn *c\dashLeft
		Case #H2H_CONTROL_ACCEPT
			ProcedureReturn *c\accept
		Case #H2H_CONTROL_CANCEL
			ProcedureReturn *c\cancel
		Case #H2H_CONTROL_EXIT
			ProcedureReturn *c\exit
	EndSelect
EndProcedure

Procedure.i controlPressed(*c.control,what)
	If Not *c
		ProcedureReturn 0
	EndIf
	ProcedureReturn controlGet(*c,what)+controlPressed(*c\alternate,what)
EndProcedure

Global *menuControlKeys.control=controlSet(0,#PB_Key_Up,#PB_Key_Down,#PB_Key_Right,#PB_Key_Left,#PB_Key_Return,#PB_Key_Back,#PB_Key_Escape)
Global *menuControl.control=controlSet()
Procedure.i controlStateCreate()
	*cs=AllocateStructure(controlState)
	controlStateInit(*cs)
	ProcedureReturn *cs
EndProcedure

Procedure checkMenuKey()
	If controlHasPressed(*menuControlKeys,attack) Or controlHasPressed(*menuControlKeys,accept)
	  *menuControl\attack+1
	Else
	  *menuControl\attack=0
	EndIf
	If controlHasPressed(*menuControlKeys,left)
		*menuControl\left+1
	Else
	  *menuControl\left=0
	EndIf
	If controlHasPressed(*menuControlKeys,right)
		*menuControl\right+1
	Else
	  *menuControl\right=0
	EndIf
	If controlHasPressed(*menuControlKeys,up)
		*menuControl\up+1
	Else
	  *menuControl\up=0
	EndIf
	If controlHasPressed(*menuControlKeys,down)
		*menuControl\down+1 
	Else
	  *menuControl\down=0
	EndIf
	If controlHasPressed(*menuControlKeys,heavy) Or controlHasPressed(*menuControlKeys,cancel)
		*menuControl\heavy+1
	Else
	  *menuControl\heavy=0
	EndIf
	If controlHasPressed(*menuControlKeys,special) Or controlHasPressed(*menuControlKeys,exit)
		*menuControl\special+1
	Else
	  *menuControl\special=0
	EndIf
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 252
; FirstLine = 221
; Folding = v--P---4+
; EnableXP
; CPU = 1