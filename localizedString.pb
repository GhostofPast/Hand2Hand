; I don't know why top and bottom are reversed
#H2H_CONTROLLER_BUTTON_TOP=0				:#H2H_CONTROLLER_BUTTON_TOP_NAME="top button"
#H2H_CONTROLLER_BUTTON_RIGHT=1				:#H2H_CONTROLLER_BUTTON_RIGHT_NAME="right button"
#H2H_CONTROLLER_BUTTON_BOTTOM=2				:#H2H_CONTROLLER_BUTTON_BOTTOM_NAME="bottom button"
#H2H_CONTROLLER_BUTTON_LEFT=3				:#H2H_CONTROLLER_BUTTON_LEFT_NAME="left button"
#H2H_CONTROLLER_L1=4						:#H2H_CONTROLLER_L1_NAME="L1"
#H2H_CONTROLLER_R1=5						:#H2H_CONTROLLER_R1_NAME="R1"
#H2H_CONTROLLER_L2=6						:#H2H_CONTROLLER_L2_NAME="L2"
#H2H_CONTROLLER_R2=7						:#H2H_CONTROLLER_R2_NAME="R2"
#H2H_CONTROLLER_START=8						:#H2H_CONTROLLER_START_NAME="start"
#H2H_CONTROLLER_SELECT=9					:#H2H_CONTROLLER_SELECT_NAME="select"
#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT=10		:#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT_NAME="left joystick click"
#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT=11		:#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT_NAME="right joystick click"

; They are sorted by control priority
; Higher the number, higher the priority
; #H2H_ACTION_NONE			=0	:#H2H_ACTION_NONE_NAME				="-none-"
; #H2H_JOYSTICK_MOVEMENT_NAME		="Movement"
; #H2H_JOYSTICK_MOVEMENT_MENU_NAME	="Movement (menu)"
; #H2H_JOYSTICK_MOVEMENT_COMBAT_NAME	="Movement (battle)"
#H2H_CONTROL_ATTACK_NAME		="Attack"
#H2H_CONTROL_HEAVY_NAME			="Heavy"
#H2H_CONTROL_SPECIAL_NAME		="Special"
#H2H_CONTROL_NEUTRAL_NAME		="Neutral"
#H2H_CONTROL_ATTACK_SIDE_NAME	="Side attack"
#H2H_CONTROL_ATTACK_BACK_NAME	="Back attack"
#H2H_CONTROL_ATTACK_UP_NAME		="Up attack"
#H2H_CONTROL_ATTACK_DOWN_NAME	="Down attack"
#H2H_CONTROL_JUMP_NAME			="Jump"
#H2H_CONTROL_PARRY_NAME			="Parry"
#H2H_CONTROL_DASH_RIGHT_NAME	="Dash right"
#H2H_CONTROL_DASH_LEFT_NAME		="Dash left"
#H2H_CONTROL_ACCEPT_NAME		="Accept"
#H2H_CONTROL_CANCEL_NAME		="Cancel"
#H2H_CONTROL_EXIT_NAME			="Exit"
#H2H_CONTROL_DODGE_NAME			="Dodge"

#H2H_CONTROL_EMPTY=$ffff
#H2H_CONTROL_NONE_NAME="None"
#H2H_CONTROLLER_DEFAULT_ATTACK=#H2H_CONTROLLER_BUTTON_BOTTOM
#H2H_CONTROLLER_DEFAULT_HEAVY=#H2H_CONTROLLER_BUTTON_RIGHT
#H2H_CONTROLLER_DEFAULT_SPECIAL=#H2H_CONTROLLER_BUTTON_LEFT
#H2H_CONTROLLER_DEFAULT_NEUTRAL=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_ATTACK_SIDE=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_ATTACK_BACK=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_ATTACK_UP=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_ATTACK_DOWN=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_JUMP=#H2H_CONTROLLER_BUTTON_TOP
#H2H_CONTROLLER_DEFAULT_DODGE=#H2H_CONTROLLER_R1
#H2H_CONTROLLER_DEFAULT_DODGE_ALTERNATE=#H2H_CONTROLLER_L1
#H2H_CONTROLLER_DEFAULT_PARRY=#H2H_CONTROLLER_R2
#H2H_CONTROLLER_DEFAULT_PARRY_ALTERNATE=#H2H_CONTROLLER_L2
#H2H_CONTROLLER_DEFAULT_DASH_RIGHT=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_DASH_LEFT=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_ACCEPT=#H2H_CONTROLLER_START
#H2H_CONTROLLER_DEFAULT_CANCEL=#H2H_CONTROL_EMPTY
#H2H_CONTROLLER_DEFAULT_EXIT=#H2H_CONTROLLER_SELECT

Global Dim controllerButtonName$(#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT)
controllerButtonName$(#H2H_CONTROLLER_BUTTON_BOTTOM)=#H2H_CONTROLLER_BUTTON_BOTTOM_NAME
controllerButtonName$(#H2H_CONTROLLER_BUTTON_LEFT)=#H2H_CONTROLLER_BUTTON_LEFT_NAME
controllerButtonName$(#H2H_CONTROLLER_BUTTON_RIGHT)=#H2H_CONTROLLER_BUTTON_RIGHT_NAME
controllerButtonName$(#H2H_CONTROLLER_BUTTON_TOP)=#H2H_CONTROLLER_BUTTON_TOP_NAME
controllerButtonName$(#H2H_CONTROLLER_L1)=#H2H_CONTROLLER_L1_NAME
controllerButtonName$(#H2H_CONTROLLER_L2)=#H2H_CONTROLLER_L2_NAME
controllerButtonName$(#H2H_CONTROLLER_R1)=#H2H_CONTROLLER_R1_NAME
controllerButtonName$(#H2H_CONTROLLER_R2)=#H2H_CONTROLLER_R2_NAME
controllerButtonName$(#H2H_CONTROLLER_START)=#H2H_CONTROLLER_START_NAME
controllerButtonName$(#H2H_CONTROLLER_SELECT)=#H2H_CONTROLLER_SELECT_NAME
controllerButtonName$(#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT)=#H2H_CONTROLLER_JOYSTICK_PRESS_LEFT_NAME
controllerButtonName$(#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT)=#H2H_CONTROLLER_JOYSTICK_PRESS_RIGHT_NAME

Global Dim controllerButtonNameEN$(0)
CopyArray(controllerButtonName$(),controllerButtonNameEN$())

Declare.s lsGet(key.s,langage.i=-1,arg1.s="",arg2.s="",arg3.s="",arg4.s="",arg5.s="",arg6.s="")
Procedure.s controllerButtonName(what.c)
	If what<=ArraySize(controllerButtonName$())
		ProcedureReturn controllerButtonName$(what)
	EndIf
	ProcedureReturn lsGet("UNASIGNED")
EndProcedure

; Global Dim joystickActionName$(#H2H_ACTION_DODGE)
; joystickActionName$(#H2H_ACTION_NONE)=#H2H_ACTION_NONE_NAME
; joystickActionName$(#H2H_ACTION_MOVEMENT)=#H2H_ACTION_MOVEMENT_NAME
; joystickActionName$(#H2H_ACTION_MOVEMENT_MENU)=#H2H_ACTION_MOVEMENT_MENU_NAME
; joystickActionName$(#H2H_ACTION_MOVEMENT_COMBAT)=#H2H_ACTION_MOVEMENT_COMBAT_NAME
; joystickActionName$(#H2H_ACTION_ATTACK)=#H2H_ACTION_ATTACK_NAME
; joystickActionName$(#H2H_ACTION_ATTACK_NEUTRAL)=#H2H_ACTION_ATTACK_NEUTRAL_NAME
; joystickActionName$(#H2H_ACTION_ATTACK_SIDE)=#H2H_ACTION_ATTACK_SIDE_NAME
; joystickActionName$(#H2H_ACTION_ATTACK_BACK)=#H2H_ACTION_ATTACK_BACK_NAME
; joystickActionName$(#H2H_ACTION_ATTACK_UP)=#H2H_ACTION_ATTACK_UP_NAME
; joystickActionName$(#H2H_ACTION_ATTACK_DOWN)=#H2H_ACTION_ATTACK_DOWN_NAME
; joystickActionName$(#H2H_ACTION_HEAVY)=#H2H_ACTION_HEAVY_NAME
; joystickActionName$(#H2H_ACTION_SPECIAL)=#H2H_ACTION_SPECIAL_NAME
; joystickActionName$(#H2H_ACTION_JUMP)=#H2H_ACTION_JUMP_NAME
; joystickActionName$(#H2H_ACTION_PARRY)=#H2H_ACTION_PARRY_NAME
; joystickActionName$(#H2H_ACTION_DASH_RIGHT)=#H2H_ACTION_DASH_RIGHT_NAME
; joystickActionName$(#H2H_ACTION_DASH_LEFT)=#H2H_ACTION_DASH_LEFT_NAME
; joystickActionName$(#H2H_ACTION_ACCCEPT)=#H2H_ACTION_ACCCEPT_NAME
; joystickActionName$(#H2H_ACTION_CANCEL)=#H2H_ACTION_CANCEL_NAME
; joystickActionName$(#H2H_ACTION_EXIT)=#H2H_ACTION_EXIT_NAME
; joystickActionName$(#H2H_ACTION_DODGE)=#H2H_ACTION_DODGE_NAME

;------ Language struct
Structure language
	name.s
	code.s
	support.i
EndStructure

Global Dim *allLanguages.language(0)

Procedure.i languageCreate(newName.s,newCode.s,newSupport.i)
; 	Debug "create language "+newName+" "+newSupport
	*l.language=AllocateStructure(language)
	*l\name=newName
	*l\code=newCode
	*l\support=newSupport
	If *allLanguages(ArraySize(*allLanguages()))
		ReDim *allLanguages(ArraySize(*allLanguages())+1)
	EndIf
	*allLanguages(ArraySize(*allLanguages()))=*l
	ProcedureReturn *l
EndProcedure

;------ Language support
Enumeration
	#H2H_LANGUAGE_SUPPORT_NONE
	#H2H_LANGUAGE_SUPPORT_PARTIAL
	#H2H_LANGUAGE_SUPPORT_FULL
EndEnumeration

Enumeration
	#H2H_LANGUAGE_ENGLISH
	#H2H_LANGUAGE_FRENCH
	#H2H_LANGUAGE_GERMAN
	#H2H_LANGUAGE_SPANISH
	#H2H_LANGUAGE_ITALIAN
	#H2H_LANGUAGE_PORTGUESE
	#H2H_LANGUAGE_POLISH
	#H2H_LANGUAGE_RUSSIAN
	; more to come
EndEnumeration

Global currentLanguage.b=#H2H_LANGUAGE_ENGLISH
#H2H_LANGUAGE_DEFAULT=#H2H_LANGUAGE_ENGLISH

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure languageExport(*parent,*l.language)
	SetJSONObject(*parent)
	;*child=addJSONObject(*parent,*l\code)
	addJSONString(*parent,"name",*l\name)
	addJSONString(*parent,"code",*l\code)
	addJSONInteger(*parent,"support",*l\support)
ProcedureReturn *parent
EndProcedure

Procedure languageExportAll(*parent)
; 	*child=addJSONObject(*parent,"languages")
	*child=AddJSONMember(*parent,"languages")
	SetJSONArray(*child)
	For i=0 To ArraySize(*allLanguages())
		*a=AddJSONElement(*child)
		languageExport(*a,*allLanguages(i))
	Next
	ProcedureReturn *child
EndProcedure

#H2H_LANGUAGE_COUNT=#H2H_LANGUAGE_RUSSIAN+1

; Global Dim languageName.s(#H2H_LANGUAGE_COUNT-1)
; languageName(#H2H_LANGUAGE_ENGLISH)="English"
; languageName(#H2H_LANGUAGE_FRENCH)="French"
; languageName(#H2H_LANGUAGE_GERMAN)="German"
; languageName(#H2H_LANGUAGE_SPANISH)="Spanish"
; languageName(#H2H_LANGUAGE_ITALIAN)="Italian"
; languageName(#H2H_LANGUAGE_PORTGUESE)="Portugese"
; languageName(#H2H_LANGUAGE_POLISH)="Polish"
; languageName(#H2H_LANGUAGE_RUSSIAN)="Russian"
; 
; Global Dim languageSupport.b(#H2H_LANGUAGE_COUNT-1)
; languageSupport(#H2H_LANGUAGE_ENGLISH)=#H2H_LANGUAGE_SUPPORT_FULL
; languageSupport(#H2H_LANGUAGE_FRENCH)=#H2H_LANGUAGE_SUPPORT_PARTIAL
; languageSupport(#H2H_LANGUAGE_GERMAN)=#H2H_LANGUAGE_SUPPORT_NONE
; languageSupport(#H2H_LANGUAGE_SPANISH)=#H2H_LANGUAGE_SUPPORT_NONE
; languageSupport(#H2H_LANGUAGE_ITALIAN)=#H2H_LANGUAGE_SUPPORT_NONE
; languageSupport(#H2H_LANGUAGE_PORTGUESE)=#H2H_LANGUAGE_SUPPORT_NONE
; languageSupport(#H2H_LANGUAGE_POLISH)=#H2H_LANGUAGE_SUPPORT_NONE
; languageSupport(#H2H_LANGUAGE_RUSSIAN)=#H2H_LANGUAGE_SUPPORT_NONE

languageCreate("English","en",#H2H_LANGUAGE_SUPPORT_FULL)
languageCreate("French","fr",#H2H_LANGUAGE_SUPPORT_FULL)
languageCreate("German","de",#H2H_LANGUAGE_SUPPORT_NONE)
languageCreate("Spanish","es",#H2H_LANGUAGE_SUPPORT_NONE)
languageCreate("Italian","it",#H2H_LANGUAGE_SUPPORT_NONE)
languageCreate("Portugese","pt",#H2H_LANGUAGE_SUPPORT_NONE)
languageCreate("Polish","pl",#H2H_LANGUAGE_SUPPORT_NONE)
languageCreate("Russian","ru",#H2H_LANGUAGE_SUPPORT_NONE)
CompilerEndIf

CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	
Procedure.i languageImport(*parent)
	ProcedureReturn languageCreate(loadJSONString(*parent,"name"),loadJSONString(*parent,"code"),loadJSONInteger(*parent,"support"))
EndProcedure

Procedure languageImportAll(*parent)
	*child=GetJSONMember(*parent,"languages")
	For i=0 To JSONArraySize(*child)-1
		*e=GetJSONElement(*child,i)
; 		Debug "imported "+*e
		languageImport(*e)
	Next
EndProcedure
CompilerEndIf

Global Dim keyToString$($ff)
keyToString$(0)="-unasigned-"
For i=1 To ArraySize(keyToString$())
	keyToString$(i)="-unkown-"
Next

Declare.s lsGet(key.s,langage.i=-1,arg1.s="",arg2.s="",arg3.s="",arg4.s="",arg5.s="",arg6.s="")
Procedure.s keyToString(s.i)
	If s=#H2H_CONTROL_EMPTY
		ProcedureReturn LSGet("UNASIGNED")
	EndIf
	ProcedureReturn keyToString$(s)
EndProcedure
;{
keyToString$(#VK_A)="A"
keyToString$(#VK_B)="B"
keyToString$(#VK_C)="C"
keyToString$(#VK_D)="D"
keyToString$(#VK_E)="E"
keyToString$(#VK_F)="F"
keyToString$(#VK_G)="G"
keyToString$(#VK_H)="H"
keyToString$(#VK_I)="I"
keyToString$(#VK_J)="J"
keyToString$(#VK_K)="K"
keyToString$(#VK_L)="L"
keyToString$(#VK_M)="M"
keyToString$(#VK_N)="N"
keyToString$(#VK_O)="O"
keyToString$(#VK_P)="P"
keyToString$(#VK_Q)="Q"
keyToString$(#VK_R)="R"
keyToString$(#VK_S)="S"
keyToString$(#VK_T)="T"
keyToString$(#VK_U)="U"
keyToString$(#VK_V)="V"
keyToString$(#VK_W)="W"
keyToString$(#VK_X)="X"
keyToString$(#VK_Y)="Y"
keyToString$(#VK_Z)="Z"

keyToString$(#VK_NUMPAD0)="NUM0"
keyToString$(#VK_NUMPAD1)="NUM1"
keyToString$(#VK_NUMPAD2)="NUM2"
keyToString$(#VK_NUMPAD3)="NUM3"
keyToString$(#VK_NUMPAD4)="NUM4"
keyToString$(#VK_NUMPAD5)="NUM5"
keyToString$(#VK_NUMPAD6)="NUM6"
keyToString$(#VK_NUMPAD7)="NUM7"
keyToString$(#VK_NUMPAD8)="NUM8"
keyToString$(#VK_NUMPAD9)="NUM9"

keyToString$(#VK_0)="0"
keyToString$(#VK_1)="1"
keyToString$(#VK_2)="2"
keyToString$(#VK_3)="3"
keyToString$(#VK_4)="4"
keyToString$(#VK_5)="5"
keyToString$(#VK_6)="6"
keyToString$(#VK_7)="7"
keyToString$(#VK_8)="8"
keyToString$(#VK_9)="9"

keyToString$(#VK_F1)="F1"
keyToString$(#VK_F2)="F2"
keyToString$(#VK_F3)="F3"
keyToString$(#VK_F4)="F4"
keyToString$(#VK_F5)="F5"
keyToString$(#VK_F6)="F6"
keyToString$(#VK_F7)="F7"
keyToString$(#VK_F8)="F8"
keyToString$(#VK_F9)="F9"
keyToString$(#VK_F10)="F10"
keyToString$(#VK_F11)="F11"
keyToString$(#VK_F12)="F12"
keyToString$(#VK_F13)="F13"
keyToString$(#VK_F14)="F14"
keyToString$(#VK_F15)="F15"
keyToString$(#VK_F16)="F16"
keyToString$(#VK_F17)="F17"
keyToString$(#VK_F18)="F18"
keyToString$(#VK_F19)="F19"
keyToString$(#VK_F20)="F20"
keyToString$(#VK_F21)="F21"
keyToString$(#VK_F22)="F22"
keyToString$(#VK_F23)="F23"
keyToString$(#VK_F24)="F24"

keyToString$(#VK_LEFT)="Left"
keyToString$(#VK_RIGHT)="Right"
keyToString$(#VK_UP)="Up"
keyToString$(#VK_DOWN)="Down"

keyToString$(#VK_OEM_COMMA)		=","
keyToString$(#VK_OEM_1)	=";"
keyToString$(#VK_OEM_7)="'"
keyToString$(#VK_DIVIDE)		="/"
keyToString$(#VK_OEM_2) ="\"
keyToString$(#VK_OEM_PLUS) 	="="
keyToString$(#VK_ADD) 		="+"
keyToString$(#VK_SUBTRACT) 	="-"
keyToString$(#VK_MULTIPLY) 	="*"
keyToString$(#VK_DECIMAL) 	="."

keyToString$(#VK_SHIFT) 	="Shift"
keyToString$(#VK_LSHIFT) 	="Left Shift"
keyToString$(#VK_RSHIFT) 	="Right Shift"
keyToString$(#VK_CONTROL) 	="Control"
keyToString$(#VK_LCONTROL) 	="Left Control"
keyToString$(#VK_RCONTROL) 	="Right Control"

Global Dim keyToStringEN$(0)
CopyArray(keyToString$(),keyToStringEN$())

;--- hints
Global Dim hint$(0)
Global nbHint=-1
Global currentHint
Procedure hintAdd(str$)
	nbHint+1
	ReDim hint$(nbHint)
	hint$(nbHint)=str$
EndProcedure

Structure localizedString 
	Array s.s(0)
EndStructure

Global NewMap *allStrings.localizedString()

Procedure.s lsGet(key.s,langage.i=-1,arg1.s="",arg2.s="",arg3.s="",arg4.s="",arg5.s="",arg6.s="")
	If langage<=-1
		langage=currentLanguage
	EndIf
	*ls.localizedString=FindMapElement(*allStrings(),key)
	If Not *ls
		ProcedureReturn key
	EndIf
	*ls=*allStrings(key)
	s.s=*ls\s(langage)
	If *ls\s(langage)=""
		s=*ls\s(#H2H_LANGUAGE_ENGLISH)
		;Debug key+" not found for "+*allLanguages(langage)\name
	EndIf
	If arg1<>""
		s=ReplaceString(s,"[ARG1]",arg1)
		If arg2<>""
			s=ReplaceString(s,"[ARG2]",arg2)
			If arg3<>""
				s=ReplaceString(s,"[ARG3]",arg3)
				If arg4<>""
					s=ReplaceString(s,"[ARG4]",arg4)
					If arg5<>""
						s=ReplaceString(s,"[ARG5]",arg5)
						If arg6<>""
							s=ReplaceString(s,"[ARG6]",arg6)
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	ProcedureReturn s
EndProcedure

Procedure.i lsSet(key.s,langage.i=#H2H_LANGUAGE_ENGLISH,what.s="")
	; 	Debug "creating ["+key+"] for ["+what+"]"
; 	If langage<>#H2H_LANGUAGE_ENGLISH
; 		ProcedureReturn 0
; 	EndIf
	*ls.localizedString=FindMapElement(*allStrings(),key)
	If Not *ls
		*ls=AllocateStructure(localizedString)
		*allStrings(key)=*ls
		ReDim *ls\s(ArraySize(*allLanguages()))
	Else
		*ls=*allStrings(key)
	EndIf
	*ls\s(langage)=what
; 	Debug "created "+*ls\s[langage]
	ProcedureReturn *ls
EndProcedure

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure lsSave(filename.s,langage.i)
	*parent=0
	j=JSONindex
; 	If fileExist(filename)
; 		*parent=LoadJSON(j,filename)
; 	Else
		*parent=CreateJSONObject()
		ForEach *allStrings()
			;Debug "saving "+MapKey(*allStrings())+" "+lsGet(MapKey(*allStrings()),langage)
			addJSONString(*parent,MapKey(*allStrings()),lsGet(MapKey(*allStrings()),langage))
	; 		Debug "saving "+loadJSONString(*parent,MapKey(*allStrings()))
		Next
		If Not SaveJSON(j,filename,#PB_JSON_PrettyPrint)
			Debug "ERROR"
		EndIf
; 	EndIf
; 	Debug ComposeJSON(j)
	FreeJSON(j)
EndProcedure

#H2H_STRING_LOCALIZATION_EXPORT=#False
CompilerIf #H2H_STRING_LOCALIZATION_EXPORT
;------ list of strings
;{
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
hintAdd("The game has much to offer in later developpements. Stay tuned for more in the official pages !")
hintAdd("Don't hesitate to join the discord in the steam and itch.io pages !")
hintAdd("Some AI stances has specific behaviors")

lsSet("OR",#H2H_LANGUAGE_ENGLISH,"or")
lsSet("OR",#H2H_LANGUAGE_FRENCH	,"ou")

lsSet("YES",#H2H_LANGUAGE_ENGLISH,"Yes")
lsSet("YES",#H2H_LANGUAGE_FRENCH ,"Oui")

lsSet("NO",#H2H_LANGUAGE_ENGLISH,"No")
lsSet("NO",#H2H_LANGUAGE_FRENCH ,"NON")

lsSet("ANY",#H2H_LANGUAGE_ENGLISH,"Any")
lsSet("ANY",#H2H_LANGUAGE_FRENCH,"Tout")

lsSet("FPS",#H2H_LANGUAGE_ENGLISH	,"FPS")
lsSet("FPS",#H2H_LANGUAGE_FRENCH	,"IPS")

lsSet("LEFT",#H2H_LANGUAGE_ENGLISH	,"Left")
lsSet("LEFT",#H2H_LANGUAGE_FRENCH	,"Gauche")

lsSet("RIGHT",#H2H_LANGUAGE_ENGLISH	,"Right")
lsSet("RIGHT",#H2H_LANGUAGE_FRENCH	,"Droite")

lsSet("UP",#H2H_LANGUAGE_ENGLISH	,"Up")
lsSet("UP",#H2H_LANGUAGE_FRENCH	,"Dessus")

lsSet("DOWN",#H2H_LANGUAGE_ENGLISH	,"Down")
lsSet("DOWN",#H2H_LANGUAGE_FRENCH	,"Dessous")

lsSet("EXAMPLE",#H2H_LANGUAGE_ENGLISH	,"Example")
lsSet("EXAMPLE",#H2H_LANGUAGE_FRENCH	,"Exemple")

lsSet("NONE",#H2H_LANGUAGE_ENGLISH	,"None")
lsSet("NONE",#H2H_LANGUAGE_FRENCH	,"Aucun")

lsSet("REDUCED",#H2H_LANGUAGE_ENGLISH	,"Reduced")
lsSet("REDUCED",#H2H_LANGUAGE_FRENCH	,"Réduit")

lsSet("DEFAULT",#H2H_LANGUAGE_ENGLISH	,"(default)")
lsSet("DEFAULT",#H2H_LANGUAGE_FRENCH	,"(par défaut)")

lsSet("ENABLED",#H2H_LANGUAGE_ENGLISH	,"Enabled")
lsSet("ENABLED",#H2H_LANGUAGE_FRENCH	,"Activé")

lsSet("DISABLED",#H2H_LANGUAGE_ENGLISH	,"Disabled")
lsSet("DISABLED",#H2H_LANGUAGE_FRENCH	,"Désactivé")

lsSet("MIRROR",#H2H_LANGUAGE_ENGLISH,"Mirror")
lsSet("MIRROR",#H2H_LANGUAGE_FRENCH,"Miroir")

lsSet("MIRROR_MINI",#H2H_LANGUAGE_ENGLISH,"M")
lsSet("MIRROR_MINI",#H2H_LANGUAGE_FRENCH,"M")

lsSet("RANDOM",#H2H_LANGUAGE_ENGLISH,"Random")
lsSet("RANDOM",#H2H_LANGUAGE_FRENCH,"Aléatoire")

lsSet("SECONDS",#H2H_LANGUAGE_ENGLISH,"[ARG1] seconds")
lsSet("SECONDS",#H2H_LANGUAGE_FRENCH,"[ARG1] secondes")

lsSet("INFINITE",#H2H_LANGUAGE_ENGLISH,"Infinite")
lsSet("INFINITE",#H2H_LANGUAGE_FRENCH,"Infini")

lsSet("PERFORMANCE_SQUEEZE",#H2H_LANGUAGE_ENGLISH	,"Disable it for squeeze more performance if needed")
lsSet("PERFORMANCE_SQUEEZE",#H2H_LANGUAGE_FRENCH	,"Peut être désactivé si besoin pour gratter davantage de performances")

lsSet("CONTROL",#H2H_LANGUAGE_ENGLISH	,"Controls")
lsSet("CONTROL",#H2H_LANGUAGE_FRENCH	,"Contrôles")

lsSet("RESET_TO_DEFAULT",#H2H_LANGUAGE_ENGLISH	,"Reset to default")
lsSet("RESET_TO_DEFAULT",#H2H_LANGUAGE_FRENCH	,"Réinitialiser par défaut")

lsSet("SAVE",#H2H_LANGUAGE_ENGLISH	,"Save")
lsSet("SAVE",#H2H_LANGUAGE_FRENCH	,"Sauvegarder")

lsSet("SAVE_AND_RETURN",#H2H_LANGUAGE_ENGLISH	,"Save and return")
lsSet("SAVE_AND_RETURN",#H2H_LANGUAGE_FRENCH	,"Sauvegarder et quitter")

lsSet("UNKNOWN",#H2H_LANGUAGE_ENGLISH	,"-unkown-")
lsSet("UNKNOWN",#H2H_LANGUAGE_FRENCH	,"-inconnu-")

lsSet("UNASIGNED",#H2H_LANGUAGE_ENGLISH	,"-unasigned-")
lsSet("UNASIGNED",#H2H_LANGUAGE_FRENCH	,"-inconnu-")

lsSet("TOBEADDED",#H2H_LANGUAGE_ENGLISH	,"to be added...")
lsSet("TOBEADDED",#H2H_LANGUAGE_FRENCH	,"prochainement...")

lsSet("LOADING",#H2H_LANGUAGE_ENGLISH	,"Loading...")
lsSet("LOADING",#H2H_LANGUAGE_FRENCH	,"Chargement...")

lsSet("HINT",#H2H_LANGUAGE_ENGLISH	,"Hint")
lsSet("HINT",#H2H_LANGUAGE_FRENCH	,"Astuce")

For i=1 To ArraySize(hint$())
	lsSet("HINT_"+i,#H2H_LANGUAGE_ENGLISH	,hint$(i))
Next

lsSet("PAUSE",#H2H_LANGUAGE_ENGLISH	,"GAME PAUSED")
lsSet("PAUSE",#H2H_LANGUAGE_FRENCH	,"JEU EN PAUSE")

lsSet("DEMO_ANY_KEY",#H2H_LANGUAGE_ENGLISH	,"Press any key to resume")
lsSet("DEMO_ANY_KEY",#H2H_LANGUAGE_FRENCH	,"Appuie sur n'importequelle touche pour reprendre")

lsSet("PAUSE_RESUME",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to resume")
lsSet("PAUSE_RESUME",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour reprendre")

lsSet("PAUSE_RESUME_JOYSTICK",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] (or [ARG2]) to resume")
lsSet("PAUSE_RESUME_JOYSTICK",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] (ou [ARG2]) pour reprendre")

lsSet("PAUSE_QUIT",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to quit")
lsSet("PAUSE_QUIT",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour quitter")

lsSet("PAUSE_QUIT_JOYSTICK",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] (or [ARG2]) to quit")
lsSet("PAUSE_QUIT_JOYSTICK",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] (ou [ARG2]) pour quitter")

lsSet("PLAYER",#H2H_LANGUAGE_ENGLISH	,"Player")
lsSet("PLAYER",#H2H_LANGUAGE_FRENCH		,"Joueur")

lsSet("PLAYER_LEFT",#H2H_LANGUAGE_ENGLISH	,"Player 2")
lsSet("PLAYER_LEFT",#H2H_LANGUAGE_FRENCH	,"Joueur 2")

lsSet("PLAYER_RIGHT",#H2H_LANGUAGE_ENGLISH	,"Player 1")
lsSet("PLAYER_RIGHT",#H2H_LANGUAGE_FRENCH	,"Joueur 1")

lsSet("CLASS",#H2H_LANGUAGE_ENGLISH	,"Class")
lsSet("CLASS",#H2H_LANGUAGE_FRENCH		,"Classe")

lsSet("STANCE",#H2H_LANGUAGE_ENGLISH	,"Stance")
lsSet("STANCE",#H2H_LANGUAGE_FRENCH		,"Posture")

lsSet("STRENGTH",#H2H_LANGUAGE_ENGLISH	,"Strength")
lsSet("STRENGTH",#H2H_LANGUAGE_FRENCH	,"Force")

lsSet("STRENGTH_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases push, stun and parry power\> Decreases weight penalty on mobility and incoming attack pushes\> Slightly increases damage")
lsSet("STRENGTH_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente la puissance des poussées, étourdissements et des parades\> Réduit la pénalité de masse sur la mobilité et les poussées d'attaque reçues\> Augmente légèrement les dégâts")

lsSet("AGILITY",#H2H_LANGUAGE_ENGLISH	,"Agility")
lsSet("AGILITY",#H2H_LANGUAGE_FRENCH	,"Agilité")

lsSet("AGILITY_DESC",#H2H_LANGUAGE_ENGLISH	,"> Reduces attack, dodge, block, dash and jump cooldowns\> Slighlty increases pierce damage")
lsSet("AGILITY_DESC",#H2H_LANGUAGE_FRENCH	,"> Réduit le temps de recharge des attaques, esquives, parrades, glissades et sauts\> Augmente légèrement les dégâts perçants")

lsSet("SPEED",#H2H_LANGUAGE_ENGLISH	,"Speed")
lsSet("SPEED",#H2H_LANGUAGE_FRENCH	,"Vitesse")

lsSet("SPEED_DESC",#H2H_LANGUAGE_ENGLISH,"> Increases movement speed and jump height\> Reduces dodge & parry delay\> Slighlty increases cut damage")
lsSet("SPEED_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente la vitesse de mouvement et la hauteur de saut\> Réduit les délais d'esquive et de parade\> Augmente légèrement les dégâts tranchants")

lsSet("WEIGHT",#H2H_LANGUAGE_ENGLISH,"Weight")
lsSet("WEIGHT",#H2H_LANGUAGE_FRENCH	,"Masse")

lsSet("WEIGHT_DESC",#H2H_LANGUAGE_ENGLISH,"> Increases push resistance, inflicted stun and jump cooldown\> Reduces movement speed and jump height\> Slightly increases blunt damage\> Increase the max guard")
lsSet("WEIGHT_DESC",#H2H_LANGUAGE_FRENCH,"> Augmente la résistance aux poussées et aux étourdissements, mais aussi le temps de recharge des sauts\> Réduit la vitesse de mouvement et la hauteur des sauts\> Augmente la garde maximale et légèrement les dégâts contondants.")

lsSet("LIFE",#H2H_LANGUAGE_ENGLISH	,"Life")
lsSet("LIFE",#H2H_LANGUAGE_FRENCH	,"Vie")

lsSet("LIFE_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases max HP, added to the second HP bar")
lsSet("LIFE_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente la vie maximale, ajouté dans une seconde barre de vie")

lsSet("STAMINA",#H2H_LANGUAGE_ENGLISH	,"Stamina")
lsSet("STAMINA",#H2H_LANGUAGE_FRENCH	,"Endurance")

lsSet("STAMINA_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases regeneration speed & max regeneration when at the first HP bar\> Reduces incoming stun and damage\> Increases the guard regen rate")
lsSet("STAMINA_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente la régénération de vie et le total de vie régénéré de la première barre de vie\ Réduit les étourdissement et les dégâts reçus\> Augmente la régénération de la garde")

lsSet("CUT",#H2H_LANGUAGE_ENGLISH	,"Cut")
lsSet("CUT",#H2H_LANGUAGE_FRENCH	,"Tranchant")

lsSet("CUT_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases cut damage")
lsSet("CUT_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente les dégâts tranchants")

lsSet("PIERCE",#H2H_LANGUAGE_ENGLISH	,"Pierce")
lsSet("PIERCE",#H2H_LANGUAGE_FRENCH	,"Perçant")

lsSet("PIERCE_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases pierce damage")
lsSet("PIERCE_DESC",#H2H_LANGUAGE_FRENCH	,"> Augmente les dégâts perçants")

lsSet("BLUNT",#H2H_LANGUAGE_ENGLISH	,"Blunt")
lsSet("BLUNT",#H2H_LANGUAGE_FRENCH	,"Contondant")

lsSet("BLUNT_DESC",#H2H_LANGUAGE_ENGLISH	,"> Increases blunt damage")
lsSet("BLUNT_DESC",#H2H_LANGUAGE_FRENCH		,"> Augmente les dégâts contondants")

lsSet("REACH",#H2H_LANGUAGE_ENGLISH	,"Reach")
lsSet("REACH",#H2H_LANGUAGE_FRENCH	,"Portée")

lsSet("REACH_DESC",#H2H_LANGUAGE_ENGLISH	,"> Average attack distance and coverage\> Informative only")
lsSet("REACH_DESC",#H2H_LANGUAGE_FRENCH	,"> Portée moyenne et couverture indicative")

lsSet("WINNER",#H2H_LANGUAGE_ENGLISH	,"Winner is [ARG1] !")
lsSet("WINNER",#H2H_LANGUAGE_FRENCH	,"[ARG1] a gagné !")

lsSet("VICTORY",#H2H_LANGUAGE_ENGLISH	,"You won !")
lsSet("VICTORY",#H2H_LANGUAGE_FRENCH	,"Tu as gagné !")

lsSet("DEFEAT",#H2H_LANGUAGE_ENGLISH	,"You lose...")
lsSet("DEFEAT",#H2H_LANGUAGE_FRENCH	,"Tu as perdu...")

lsSet("TIE",#H2H_LANGUAGE_ENGLISH	,"Tie !")
lsSet("TIE",#H2H_LANGUAGE_FRENCH	,"Ex-aequo !")

lsSet("BACK_TO_MENU_IN",#H2H_LANGUAGE_ENGLISH	,"Back to main menu in [ARG1]...")
lsSet("BACK_TO_MENU_IN",#H2H_LANGUAGE_FRENCH	,"Retour au menu principal dans [ARG1]...")

lsSet("DIFFICULTY",#H2H_LANGUAGE_ENGLISH,"Difficulty")
lsSet("DIFFICULTY",#H2H_LANGUAGE_FRENCH	,"Difficulté")

lsSet("DIFFICULTY_DESC",#H2H_LANGUAGE_ENGLISH,"> Estimation of the complexity\> Informative only")
lsSet("DIFFICULTY_DESC",#H2H_LANGUAGE_FRENCH	,"> Estimation indicative de sa complexité")

lsSet("TERRAIN",#H2H_LANGUAGE_ENGLISH,"Terrain selection")
lsSet("TERRAIN",#H2H_LANGUAGE_FRENCH	,"Sélection de terrain")

lsSet("TERRAIN_SMALL",#H2H_LANGUAGE_ENGLISH,"Small")
lsSet("TERRAIN_SMALL",#H2H_LANGUAGE_FRENCH	,"Petit")

lsSet("TERRAIN_MEDIUM",#H2H_LANGUAGE_ENGLISH,"Medium")
lsSet("TERRAIN_MEDIUM",#H2H_LANGUAGE_FRENCH	,"Moyen")

lsSet("TERRAIN_LARGE",#H2H_LANGUAGE_ENGLISH,"Large")
lsSet("TERRAIN_LARGE",#H2H_LANGUAGE_FRENCH	,"Grand")

lsSet("MENU_INSTRUCTIONS",#H2H_LANGUAGE_ENGLISH	,"[ARG1] or [ARG2] to quit\Arrows to move\[ARG3] or [ARG4] to Select")
lsSet("MENU_INSTRUCTIONS",#H2H_LANGUAGE_FRENCH	,"[ARG1] ou [ARG2] pour quitter\Flèches directionnelles pour défiler\[ARG3] ou [ARG4] pour sélectionner")

lsSet("MENU_VERSUS",#H2H_LANGUAGE_ENGLISH	,"Player vs Player")
lsSet("MENU_VERSUS",#H2H_LANGUAGE_FRENCH	,"Joueur vs Joueur")

lsSet("MENU_VERSUS_DESC",#H2H_LANGUAGE_ENGLISH	,"Fight against someone on the same machine")
lsSet("MENU_VERSUS_DESC",#H2H_LANGUAGE_FRENCH	,"Fait un combat avec un autre sur la même machine")

lsSet("MENU_SOLO",#H2H_LANGUAGE_ENGLISH	,"Player vs Bot")
lsSet("MENU_SOLO",#H2H_LANGUAGE_FRENCH	,"Joueur vs IA ")

lsSet("MENU_SOLO_DESC",#H2H_LANGUAGE_ENGLISH	,"Fight against AI")
lsSet("MENU_SOLO_DESC",#H2H_LANGUAGE_FRENCH	,"Fait un combat contre une IA")

lsSet("MENU_GALERY",#H2H_LANGUAGE_ENGLISH	,"View fighters")
lsSet("MENU_GALERY",#H2H_LANGUAGE_FRENCH	,"Voir combattants")

lsSet("MENU_GALERY_DESC",#H2H_LANGUAGE_ENGLISH	,"See current and future classes, their stats, desc and combos")
lsSet("MENU_GALERY_DESC",#H2H_LANGUAGE_FRENCH	,"Consulter la liste des classes courantes et futures, leur statistiques,\leur description et combos")

lsSet("MENU_SETTINGS",#H2H_LANGUAGE_ENGLISH	,"Options")
; lsSet("MENU_GALERY",#H2H_LANGUAGE_FRENCH	,"Options")

lsSet("MENU_SETTINGS_DESC",#H2H_LANGUAGE_ENGLISH,"Change display, combat and control settings")
lsSet("MENU_SETTINGS_DESC",#H2H_LANGUAGE_FRENCH	,"Changer les paramètres d'affichage, de combat et de contrôles")

lsSet("MENU_TUTORIAL",#H2H_LANGUAGE_ENGLISH	,"Tutorial")
lsSet("MENU_TUTORIAL",#H2H_LANGUAGE_FRENCH	,"Tutoriel")

lsSet("MENU_TUTORIAL_DESC",#H2H_LANGUAGE_ENGLISH,"Learn the basics of the game")
lsSet("MENU_TUTORIAL_DESC",#H2H_LANGUAGE_FRENCH	,"Comprendre les bases du jeu")

lsSet("MENU_CREDITS",#H2H_LANGUAGE_ENGLISH	,"Credits")
lsSet("MENU_CREDITS",#H2H_LANGUAGE_FRENCH	,"Crédits")

lsSet("MENU_CREDITS_DESC",#H2H_LANGUAGE_ENGLISH,"")
lsSet("MENU_CREDITS_DESC",#H2H_LANGUAGE_FRENCH	,"")

lsSet("MENU_EXIT",#H2H_LANGUAGE_ENGLISH	,"Exit")
lsSet("MENU_EXIT",#H2H_LANGUAGE_FRENCH	,"Quitter")

lsSet("MENU_EXIT_DESC",#H2H_LANGUAGE_ENGLISH,"Back to desktop")
lsSet("MENU_EXIT_DESC",#H2H_LANGUAGE_FRENCH	,"Retour au bureau")

lsSet("MENU_DISCORD_DESC",#H2H_LANGUAGE_ENGLISH	,"Join the official Discord server !")
lsSet("MENU_DISCORD_DESC",#H2H_LANGUAGE_FRENCH	,"Rejoint le serveur Discord officiel !")

lsSet("MENU_STEAM_DESC",#H2H_LANGUAGE_ENGLISH	,"Steam page")
lsSet("MENU_STEAM_DESC",#H2H_LANGUAGE_FRENCH	,"Page Steam")

lsSet("MENU_ITCHIO_DESC",#H2H_LANGUAGE_ENGLISH	,"Itch.io page")
lsSet("MENU_ITCHIO_DESC",#H2H_LANGUAGE_FRENCH	,"Page Itch.io")

lsSet("MENU_WIKI_DESC",#H2H_LANGUAGE_ENGLISH	,"Official wiki")
lsSet("MENU_WIKI_DESC",#H2H_LANGUAGE_FRENCH		,"Wiki officiel")

lsSet("VERSUS_SELECT_PRESS_TO_START",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to start !")
lsSet("VERSUS_SELECT_PRESS_TO_START",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour commencer !")

lsSet("VERSUS_SELECT_PRESS_TO_SELECT",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to select")
lsSet("VERSUS_SELECT_PRESS_TO_SELECT",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour sélectionner")

lsSet("VERSUS_SELECT_PRESS_TO_SELECT_BOT",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to select bot")
lsSet("VERSUS_SELECT_PRESS_TO_SELECT_BOT",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour sélectionner l'IA")

lsSet("VERSUS_SELECT_PRESS_TO_CANCEL",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to cancel")
lsSet("VERSUS_SELECT_PRESS_TO_CANCEL",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour annuler")

lsSet("VERSUS_SELECT_PRESS_TO_CANCEL_BOT",#H2H_LANGUAGE_ENGLISH	,"Press [ARG1] to cancel bot")
lsSet("VERSUS_SELECT_PRESS_TO_CANCEL_BOT",#H2H_LANGUAGE_FRENCH	,"Appuie sur [ARG1] pour annuler l'IA")

lsSet("VERSUS_SELECT_STANCE_RANDOM",#H2H_LANGUAGE_ENGLISH	,"Random stance")
lsSet("VERSUS_SELECT_STANCE_RANDOM",#H2H_LANGUAGE_FRENCH	,"Posture aléatoire")

lsSet("VERSUS_SELECT_STANCE_DIFFERENT",#H2H_LANGUAGE_ENGLISH	,"Different stance")
lsSet("VERSUS_SELECT_STANCE_DIFFERENT",#H2H_LANGUAGE_FRENCH	,"Posture différente")

lsSet("VERSUS_SELECT_STANCE_MIRROR",#H2H_LANGUAGE_ENGLISH	,"Mirror stance")
lsSet("VERSUS_SELECT_STANCE_MIRROR",#H2H_LANGUAGE_FRENCH	,"Posture miroir")

lsSet("VERSUS_SELECT_CLASS_DIFFERENT",#H2H_LANGUAGE_ENGLISH	,"Different class")
lsSet("VERSUS_SELECT_CLASS_DIFFERENT",#H2H_LANGUAGE_FRENCH	,"Classe différente")

lsSet("GALERY_COMBO_LIST",#H2H_LANGUAGE_ENGLISH	,"Combo list")
lsSet("GALERY_COMBO_LIST",#H2H_LANGUAGE_FRENCH	,"Liste des combos")

lsSet("DIFFICULTY",#H2H_LANGUAGE_ENGLISH,"Difficulty")
lsSet("DIFFICULTY",#H2H_LANGUAGE_FRENCH	,"Difficulté")

lsSet("DIFFICULTY_EASY",#H2H_LANGUAGE_ENGLISH	,"Easy")
lsSet("DIFFICULTY_EASY",#H2H_LANGUAGE_FRENCH	,"Facile")

lsSet("DIFFICULTY_EASY_DESC",#H2H_LANGUAGE_ENGLISH	,"Attacks randomly, heavy attacks are rare.")
lsSet("DIFFICULTY_EASY_DESC",#H2H_LANGUAGE_FRENCH	,"Attaque aléatoirement, les attaques lourdes sont rares.")

lsSet("DIFFICULTY_NORMAL",#H2H_LANGUAGE_ENGLISH	,"Normal")
lsSet("DIFFICULTY_NORMAL",#H2H_LANGUAGE_FRENCH	,"Intermédiaire")

lsSet("DIFFICULTY_NORMAL_DESC",#H2H_LANGUAGE_ENGLISH	,"Attacks frequently, punishes you in the air\and may use random combos.")
lsSet("DIFFICULTY_NORMAL_DESC",#H2H_LANGUAGE_FRENCH	,"Attaque fréquement, punit l'adversaire en l'air.\Peut utiliser des combos aléatoires.")

lsSet("DIFFICULTY_HARD",#H2H_LANGUAGE_ENGLISH	,"Hard")
lsSet("DIFFICULTY_HARD",#H2H_LANGUAGE_FRENCH	,"Difficile")

lsSet("DIFFICULTY_HARD_DESC",#H2H_LANGUAGE_ENGLISH	,"Attacks very frequently with semi-intelligent combos.\Some classes and stances may have specific behaviors.")
lsSet("DIFFICULTY_HARD_DESC",#H2H_LANGUAGE_FRENCH	,"Attaque très fréquement avec des combo semi-intelligents.\Certaines classes et stances peuvent avoir des comportements spécifiques.")

lsSet("DIFFICULTY_INSANE",#H2H_LANGUAGE_ENGLISH	,"Insane")
lsSet("DIFFICULTY_INSANE",#H2H_LANGUAGE_FRENCH	,"Très difficile")

lsSet("DIFFICULTY_INSANE_DESC",#H2H_LANGUAGE_ENGLISH	,"Same as Hard, but has +1 stats everywhere")
lsSet("DIFFICULTY_INSANE_DESC",#H2H_LANGUAGE_FRENCH	,"Même chose que Difficile, mais avec +1 de stat partout.")
;--- settings
lsSet("SETTINGS_PLAYER_SWAP",#H2H_LANGUAGE_ENGLISH	,"Player 1 side")
lsSet("SETTINGS_PLAYER_SWAP",#H2H_LANGUAGE_FRENCH	,"Côté du joueur 1")

lsSet("SETTINGS_PLAYER_COLOR",#H2H_LANGUAGE_ENGLISH	,"Player color")
lsSet("SETTINGS_PLAYER_COLOR",#H2H_LANGUAGE_FRENCH	,"Couleur de joueur")

lsSet("SETTINGS_PLAYER_COLOR_ADAPTATIVE",#H2H_LANGUAGE_ENGLISH	,"Adaptative")
lsSet("SETTINGS_PLAYER_COLOR_ADAPTATIVE",#H2H_LANGUAGE_FRENCH	,"Adaptatif")

lsSet("SETTINGS_PLAYER_COLOR_ADAPTATIVE_DESC",#H2H_LANGUAGE_ENGLISH	,"Player 2 (left) will have alternate color if the other player has a too similar color")
lsSet("SETTINGS_PLAYER_COLOR_ADAPTATIVE_DESC",#H2H_LANGUAGE_FRENCH	,"Joueur 2 (gauche) aura une couleur alternative lorsque celle de l'autre joueur est trop similaire")

lsSet("SETTINGS_PLAYER_COLOR_ALTERNATIVE",#H2H_LANGUAGE_ENGLISH	,"Alternative")
lsSet("SETTINGS_PLAYER_COLOR_ALTERNATIVE",#H2H_LANGUAGE_FRENCH	,"Alternatif")

lsSet("SETTINGS_PLAYER_COLOR_ALTERNATIVE_DESC",#H2H_LANGUAGE_ENGLISH,"Player 2 (left) will have alternate color if the stance has a specific color")
lsSet("SETTINGS_PLAYER_COLOR_ALTERNATIVE_DESC",#H2H_LANGUAGE_FRENCH	,"Joueur 2 (gauche) aura une couleur alternative lorsque sa posture en a une spécifique")

lsSet("SETTINGS_PLAYER_COLOR_BASIC",#H2H_LANGUAGE_ENGLISH	,"Basic")
lsSet("SETTINGS_PLAYER_COLOR_BASIC",#H2H_LANGUAGE_FRENCH	,"Basique")

lsSet("SETTINGS_PLAYER_COLOR_BASIC_DESC",#H2H_LANGUAGE_ENGLISH	,"Player 1 (right) is orange, Player 2 (left) is blue")
lsSet("SETTINGS_PLAYER_COLOR_BASIC_DESC",#H2H_LANGUAGE_FRENCH	,"Joueur 1 (droite) est orange, Joueur 2 (gauche) est bleu")

lsSet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST",#H2H_LANGUAGE_ENGLISH	,"High contrast")
lsSet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST",#H2H_LANGUAGE_FRENCH	,"Contraste élevé")

lsSet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST_DESC",#H2H_LANGUAGE_ENGLISH	,"Player 1 (right) is black, Player 2 (left) has high contrast")
lsSet("SETTINGS_PLAYER_COLOR_HIGH_CONTRAST_DESC",#H2H_LANGUAGE_FRENCH	,"Joueur 1 (droite) est noir, Joueur 2 (gauche) a un contraste élevé")

lsSet("SETTINGS_LANGUAGE",#H2H_LANGUAGE_ENGLISH	,"Language")
lsSet("SETTINGS_LANGUAGE",#H2H_LANGUAGE_FRENCH	,"Langage")

lsSet("SETTINGS_KEYBOARD",#H2H_LANGUAGE_ENGLISH	,"Keyboard")
lsSet("SETTINGS_KEYBOARD",#H2H_LANGUAGE_FRENCH	,"Clavier")

lsSet("SETTINGS_KEYBOARD_SWAP",#H2H_LANGUAGE_ENGLISH,"Swap controls")
lsSet("SETTINGS_KEYBOARD_SWAP",#H2H_LANGUAGE_FRENCH	,"Échanger les contrôles")

lsSet("SETTINGS_KEYBOARD_DESC",#H2H_LANGUAGE_ENGLISH,"Change keyboard controls here")
lsSet("SETTINGS_KEYBOARD_DESC",#H2H_LANGUAGE_FRENCH	,"Change les contrôles clavier ici")

lsSet("SETTINGS_KEYBOARD_SELECT",#H2H_LANGUAGE_ENGLISH	,"Select a key for [ARG1]")
lsSet("SETTINGS_KEYBOARD_SELECT",#H2H_LANGUAGE_FRENCH	,"Sélectionne une touche pour [ARG1]")

lsSet("SETTINGS_KEYBOARD_CANCEL",#H2H_LANGUAGE_ENGLISH	,"Cancel with [ARG1]")
lsSet("SETTINGS_KEYBOARD_CANCEL",#H2H_LANGUAGE_FRENCH	,"Annule avec [ARG1]")

lsSet("SETTINGS_KEYBOARD_REMOVE",#H2H_LANGUAGE_ENGLISH	,"Remove with [ARG1]")
lsSet("SETTINGS_KEYBOARD_REMOVE",#H2H_LANGUAGE_FRENCH	,"Retire avec [ARG1]")

lsSet("SETTINGS_KEYBOARD_TYPE",#H2H_LANGUAGE_ENGLISH	,"Keyboard type")
lsSet("SETTINGS_KEYBOARD_TYPE",#H2H_LANGUAGE_FRENCH	,"Type de clavier")

lsSet("SETTINGS_KEYBOARD_JUMP_WITH_UP",#H2H_LANGUAGE_ENGLISH	,"Jump with up")
lsSet("SETTINGS_KEYBOARD_JUMP_WITH_UP",#H2H_LANGUAGE_FRENCH	,"Sauter avec haut")

lsSet("SETTINGS_KEYBOARD_ATTACK_DIRECTION",#H2H_LANGUAGE_ENGLISH	,"Attack direction")
lsSet("SETTINGS_KEYBOARD_ATTACK_DIRECTION",#H2H_LANGUAGE_FRENCH		,"Direction d'attaque")

lsSet("DYNAMIC",#H2H_LANGUAGE_ENGLISH	,"Dynamic")
lsSet("DYNAMIC",#H2H_LANGUAGE_FRENCH	,"Dynamique")

lsSet("PLAYER_DIRECTION_STATIC_LEFT",#H2H_LANGUAGE_ENGLISH	,"Static Left")
lsSet("PLAYER_DIRECTION_STATIC_LEFT",#H2H_LANGUAGE_FRENCH	,"Statique Gauche")

lsSet("PLAYER_DIRECTION_STATIC_RIGHT",#H2H_LANGUAGE_ENGLISH	,"Static Right")
lsSet("PLAYER_DIRECTION_STATIC_RIGHT",#H2H_LANGUAGE_FRENCH	,"Statique Droit")

lsSet("SETTINGS_SOUND_LEVEL",#H2H_LANGUAGE_ENGLISH	,"Sound level")
lsSet("SETTINGS_SOUND_LEVEL",#H2H_LANGUAGE_FRENCH	,"Volume du son")

lsSet("SETTINGS_MUSIC_LEVEL",#H2H_LANGUAGE_ENGLISH	,"Music level")
lsSet("SETTINGS_MUSIC_LEVEL",#H2H_LANGUAGE_FRENCH	,"Volume de la musique")

lsSet("SETTINGS_SOUND_STEREO",#H2H_LANGUAGE_ENGLISH	,"Stereo sound")
lsSet("SETTINGS_SOUND_STEREO",#H2H_LANGUAGE_FRENCH	,"Son stéréo")

lsSet("SETTINGS_SOUND_STEREO_COMPLETE",#H2H_LANGUAGE_ENGLISH	,"Complete")
lsSet("SETTINGS_SOUND_STEREO_COMPLETE",#H2H_LANGUAGE_FRENCH	,"Complet")

lsSet("SETTINGS_SOUND_VARIATION",#H2H_LANGUAGE_ENGLISH	,"Sound variation")
lsSet("SETTINGS_SOUND_VARIATION",#H2H_LANGUAGE_FRENCH	,"Variation de son")

lsSet("SETTINGS_SOUND_VARIATION_DESC",#H2H_LANGUAGE_ENGLISH	,"Sounds are played in random pitches")
lsSet("SETTINGS_SOUND_VARIATION_DESC",#H2H_LANGUAGE_FRENCH	,"Les sons sont joués à des hauteurs aléatoires")

lsSet("SETTINGS_COMBO_DISPLAY",#H2H_LANGUAGE_ENGLISH	,"Combo display")
lsSet("SETTINGS_COMBO_DISPLAY",#H2H_LANGUAGE_FRENCH	,"Affichage des combos")

lsSet("SETTINGS_COMBO_DISPLAY_BIG",#H2H_LANGUAGE_ENGLISH	,"Big icons")
lsSet("SETTINGS_COMBO_DISPLAY_BIG",#H2H_LANGUAGE_FRENCH	,"Grandes icônes")

lsSet("SETTINGS_COMBO_DISPLAY_SMALL",#H2H_LANGUAGE_ENGLISH	,"Small icons")
lsSet("SETTINGS_COMBO_DISPLAY_SMALL",#H2H_LANGUAGE_FRENCH	,"Petites icônes")

lsSet("SETTINGS_WIND_DISPLAY",#H2H_LANGUAGE_ENGLISH	,"Wind display")
lsSet("SETTINGS_WIND_DISPLAY",#H2H_LANGUAGE_FRENCH	,"Effets de vent")

lsSet("SETTINGS_WIND_DISPLAY_REDUCED_DESC",#H2H_LANGUAGE_ENGLISH	,"All winds are more transparent")
lsSet("SETTINGS_WIND_DISPLAY_REDUCED_DESC",#H2H_LANGUAGE_FRENCH	,"Tous les effets de vent sont + transparents")

lsSet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY",#H2H_LANGUAGE_ENGLISH	,"Active only")
lsSet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY",#H2H_LANGUAGE_FRENCH	,"Seulements actifs")

lsSet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY_DESC",#H2H_LANGUAGE_ENGLISH	,"Only frames with hurtbox spawns wind")
lsSet("SETTINGS_WIND_DISPLAY_ACTIVE_ONLY_DESC",#H2H_LANGUAGE_FRENCH	,"Seuls les frames avec hurtbox génèrent du vent")

lsSet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE",#H2H_LANGUAGE_ENGLISH	,"Reduced passive")
lsSet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE",#H2H_LANGUAGE_FRENCH	,"Passifs réduits")

lsSet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE_DESC",#H2H_LANGUAGE_ENGLISH	,"Attack frames with no hurbox have more transparent wind effects")
lsSet("SETTINGS_WIND_DISPLAY_REDUCED_PASSIVE_DESC",#H2H_LANGUAGE_FRENCH	,"Les frames d'attaque sans hurtbox ont leurs vents + transparents")

lsSet("SETTINGS_PARTICLE_DISPLAY",#H2H_LANGUAGE_ENGLISH	,"Particles display")
lsSet("SETTINGS_PARTICLE_DISPLAY",#H2H_LANGUAGE_FRENCH	,"Particules")

lsSet("SETTINGS_ATTACK_DELAY",#H2H_LANGUAGE_ENGLISH	,"Attack delay")
lsSet("SETTINGS_ATTACK_DELAY",#H2H_LANGUAGE_FRENCH	,"Délai d'attaque")

lsSet("SETTINGS_ATTACK_DELAY_FIX",#H2H_LANGUAGE_ENGLISH	,"Fix")
lsSet("SETTINGS_ATTACK_DELAY_FIX",#H2H_LANGUAGE_FRENCH	,"Fixe")

lsSet("SETTINGS_ATTACK_DELAY_FIX_DESC",#H2H_LANGUAGE_ENGLISH,"Damage freezes the game for a fix duration and shakes the screen more")
lsSet("SETTINGS_ATTACK_DELAY_FIX_DESC",#H2H_LANGUAGE_FRENCH	,"Les dommages interomptent le jeu d'une durée fixe et secouent davantage l'écran")

lsSet("SETTINGS_ATTACK_DELAY_RELATIVE",#H2H_LANGUAGE_ENGLISH,"Relative")
lsSet("SETTINGS_ATTACK_DELAY_RELATIVE",#H2H_LANGUAGE_FRENCH	,"Relatif")

lsSet("SETTINGS_ATTACK_DELAY_RELATIVE_DESC",#H2H_LANGUAGE_ENGLISH	,"Damage proportionally freezes the game and shakes the screen more")
lsSet("SETTINGS_ATTACK_DELAY_RELATIVE_DESC",#H2H_LANGUAGE_FRENCH	,"Les dommages interomptent le jeu d'une durée proportionnelle et secouent davantage l'écran")

lsSet("SETTINGS_ROUND_NUMBER",#H2H_LANGUAGE_ENGLISH	,"Number of rounds")
lsSet("SETTINGS_ROUND_NUMBER",#H2H_LANGUAGE_FRENCH	,"Nombre de rounds")

lsSet("SETTINGS_ROUND_NUMBER_DESC",#H2H_LANGUAGE_ENGLISH,"Sets the max number of rounds per fights")
lsSet("SETTINGS_ROUND_NUMBER_DESC",#H2H_LANGUAGE_FRENCH	,"Définit le nombre max de round par combat")

lsSet("SETTINGS_ROUND_NUMBER_BEST_OF",#H2H_LANGUAGE_ENGLISH	,"Best of")
lsSet("SETTINGS_ROUND_NUMBER_BEST_OF",#H2H_LANGUAGE_FRENCH	,"Best of")

lsSet("SETTINGS_ROUND_DURATION",#H2H_LANGUAGE_ENGLISH	,"Round duration")
lsSet("SETTINGS_ROUND_DURATION",#H2H_LANGUAGE_FRENCH	,"Durée de round")

lsSet("SETTINGS_PERFORMANCE",#H2H_LANGUAGE_ENGLISH	,"Performance")
lsSet("SETTINGS_PERFORMANCE",#H2H_LANGUAGE_FRENCH	,"Performance")

lsSet("SETTINGS_PERFORMANCE_LOAD_FAST",#H2H_LANGUAGE_ENGLISH	,"Load on demand")
lsSet("SETTINGS_PERFORMANCE_LOAD_FAST",#H2H_LANGUAGE_FRENCH	,"Chargement à la demande")

lsSet("SETTINGS_PERFORMANCE_LOAD_FAST_DESC",#H2H_LANGUAGE_ENGLISH	,"High CPU & disk usage")
lsSet("SETTINGS_PERFORMANCE_LOAD_FAST_DESC",#H2H_LANGUAGE_FRENCH	,"Utilisation intense du processeur et du stockage")

lsSet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING",#H2H_LANGUAGE_ENGLISH	,"Load everything")
lsSet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING",#H2H_LANGUAGE_FRENCH	,"Tout charger")

lsSet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING_DESC",#H2H_LANGUAGE_ENGLISH	,"High GPU & RAM usage")
lsSet("SETTINGS_PERFORMANCE_LOAD_EVERYTHING_DESC",#H2H_LANGUAGE_FRENCH	,"Utilisation intense de la mémoire vive et graphique")

lsSet("SETTINGS_REFRESH_RATE",#H2H_LANGUAGE_ENGLISH	,"Refresh rate")
lsSet("SETTINGS_REFRESH_RATE",#H2H_LANGUAGE_FRENCH	,"Taux de rafraîchissement")

lsSet("SETTINGS_REFRESH_RATE_DESC",#H2H_LANGUAGE_ENGLISH,"Too low FPS can break the gameplay")
lsSet("SETTINGS_REFRESH_RATE_DESC",#H2H_LANGUAGE_FRENCH	,"Une valeur trop basse peut casser le gameplay")

lsSet("SETTINGS_FPS_DISPLAY",#H2H_LANGUAGE_ENGLISH	,"FPS display")
lsSet("SETTINGS_FPS_DISPLAY",#H2H_LANGUAGE_FRENCH	,"Affichage des IPS")

lsSet("SETTINGS_FPS_DISPLAY_DESC",#H2H_LANGUAGE_ENGLISH,"Can be toggled in debug mode with shift+0")
lsSet("SETTINGS_FPS_DISPLAY_DESC",#H2H_LANGUAGE_FRENCH,"Peut être basculé en jeu en mode debug avec shift+0")

lsSet("SETTINGS_SCREEN_RESOLUTION",#H2H_LANGUAGE_ENGLISH,"Screen resolution")
lsSet("SETTINGS_SCREEN_RESOLUTION",#H2H_LANGUAGE_FRENCH	,"Résolution d'écran")

lsSet("SETTINGS_SCREEN_RESOLUTION_DESC",#H2H_LANGUAGE_ENGLISH,"Also changes the fight border width")
lsSet("SETTINGS_SCREEN_RESOLUTION_DESC",#H2H_LANGUAGE_FRENCH	,"Change aussi l'envergure de l'écran en combat")

lsSet("SETTINGS_SCREEN_RESOLUTION_SMALL",#H2H_LANGUAGE_ENGLISH,"Recommended for windowed/small screens")
lsSet("SETTINGS_SCREEN_RESOLUTION_SMALL",#H2H_LANGUAGE_FRENCH	,"Recommandé pour les écrans fenêtrés ou de petite taille")

lsSet("SETTINGS_SCREEN_RESOLUTION_BIG",#H2H_LANGUAGE_ENGLISH,"Recommended for big screens")
lsSet("SETTINGS_SCREEN_RESOLUTION_BIG",#H2H_LANGUAGE_FRENCH	,"Recommandé pour les grands écrans")

lsSet("SETTINGS_SCREEN_FULL",#H2H_LANGUAGE_ENGLISH,"Fullscreen")
lsSet("SETTINGS_SCREEN_FULL",#H2H_LANGUAGE_FRENCH	,"Plein écran")

lsSet("SETTINGS_SCREEN_FULL_DESC",#H2H_LANGUAGE_ENGLISH,"On Windows be sure to set the UI scale at 100%")
lsSet("SETTINGS_SCREEN_FULL_DESC",#H2H_LANGUAGE_FRENCH	,"Sur Windows vérifier que l'échelle d'interface est à 100%")

lsSet("SETTINGS_SCREEN_SHAKE",#H2H_LANGUAGE_ENGLISH,"Screen shake")
lsSet("SETTINGS_SCREEN_SHAKE",#H2H_LANGUAGE_FRENCH	,"Secousses d'écran")

lsSet("SETTINGS_SCREEN_SHAKE_LOW",#H2H_LANGUAGE_ENGLISH,"Low")
lsSet("SETTINGS_SCREEN_SHAKE_LOW",#H2H_LANGUAGE_FRENCH	,"Réduits")

lsSet("SETTINGS_SCREEN_SHAKE_NORMAL",#H2H_LANGUAGE_ENGLISH,"Normal")
lsSet("SETTINGS_SCREEN_SHAKE_NORMAL",#H2H_LANGUAGE_FRENCH	,"Normaux")

lsSet("SETTINGS_SCREEN_SHAKE_HIGH",#H2H_LANGUAGE_ENGLISH,"High")
lsSet("SETTINGS_SCREEN_SHAKE_HIGH",#H2H_LANGUAGE_FRENCH	,"Élevés")

lsSet("SETTINGS_SCREEN_SHAKE_DESC",#H2H_LANGUAGE_ENGLISH,"Changes the intensity of image and screen shakes")
lsSet("SETTINGS_SCREEN_SHAKE_DESC",#H2H_LANGUAGE_FRENCH	,"Change l'intensité des secousses d'image et d'écran")

lsSet("SETTINGS_DEBUG",#H2H_LANGUAGE_ENGLISH,"Debug mode")
lsSet("SETTINGS_DEBUG",#H2H_LANGUAGE_FRENCH	,"Mode débug")

lsSet("SETTINGS_DEBUG_DESC",#H2H_LANGUAGE_ENGLISH,"Enables special hidden commands")
lsSet("SETTINGS_DEBUG_DESC",#H2H_LANGUAGE_FRENCH,"Débloque des commandes spéciales cachées")

lsSet("SETTINGS_CONTROLLER",#H2H_LANGUAGE_ENGLISH,"Controller")
lsSet("SETTINGS_CONTROLLER",#H2H_LANGUAGE_FRENCH	,"Manettes")

lsSet("SETTINGS_CONTROLLER_DESC",#H2H_LANGUAGE_ENGLISH,"Detect new controllers.\Change controller commands and owner.")
lsSet("SETTINGS_CONTROLLER_DESC",#H2H_LANGUAGE_FRENCH	,"Détecte de nouvelles manettes.\Change les touches et propriétaires.")

lsSet("SETTINGS_CONTROLLER_RESCAN",#H2H_LANGUAGE_ENGLISH,"Rescan controllers")
lsSet("SETTINGS_CONTROLLER_RESCAN",#H2H_LANGUAGE_FRENCH	,"Recharger les manettes")

lsSet("SETTINGS_CONTROLLER_HINT",#H2H_LANGUAGE_ENGLISH,"[ARG1] to define\[ARG2] to cancel\N.B. Dashes are not yet supported")
lsSet("SETTINGS_CONTROLLER_HINT",#H2H_LANGUAGE_FRENCH	,"[ARG1] pour définir\[ARG2] pour annuler\N.B. Les glissades ne sont pas encore supportées")

lsSet("TUTORIAL_MOVE_LEFT",#H2H_LANGUAGE_ENGLISH,"<---- Move left with [ARG1]")
lsSet("TUTORIAL_MOVE_LEFT",#H2H_LANGUAGE_FRENCH	,"<---- Déplacer à gauche avec [ARG1]")

lsSet("TUTORIAL_MOVE_RIGHT",#H2H_LANGUAGE_ENGLISH,"Move right with [ARG1] ---->")
lsSet("TUTORIAL_MOVE_RIGHT",#H2H_LANGUAGE_FRENCH,"Déplacer à droite avec [ARG1] ---->")

lsSet("TUTORIAL_NEUTRAL",#H2H_LANGUAGE_ENGLISH,"Neutral attack with [ARG1]")
lsSet("TUTORIAL_NEUTRAL",#H2H_LANGUAGE_FRENCH,"Attaque neutre avec [ARG1]")

lsSet("TUTORIAL_HEAVY",#H2H_LANGUAGE_ENGLISH,"Heavy attack with [ARG1]")
lsSet("TUTORIAL_HEAVY",#H2H_LANGUAGE_FRENCH,"Attaque lourde avec [ARG1]")

lsSet("TUTORIAL_DIRECTION",#H2H_LANGUAGE_ENGLISH,"Use neutral + direction do make other types of attacks ! (front, back, up, down)\Heavy attacks do not have direction...\Attack direction is always relative to where the hand is turned.\Facing the enemy is automatic when not attacking.")
lsSet("TUTORIAL_DIRECTION",#H2H_LANGUAGE_FRENCH,"Utilise neutre + une direction pour faire d'autres types d'attaque !")

lsSet("TUTORIAL_COMBO",#H2H_LANGUAGE_ENGLISH,"Follow a hit with another attack to make combos !\Each class has its own combo tree.\Missing, stop attacking or doing the wrong combo put the hand on cooldown.\Successfuly finishing a combo has low-to-no cooldown !\Attacks and direction can be kept pressed.")
lsSet("TUTORIAL_COMBO",#H2H_LANGUAGE_FRENCH,"Continue une attaque touchée avec une autre pour faire des combos !\Chaque classe a son propre arbre de combo.\Rater, arrêter une attaque ou faire le mauvais combo met la main en temps de recharge.\Terminer avec succès un combo n'a pas ou presque de recharge !\Les boutons d'attaque et de direction peuvent être maintenus.")

lsSet("TUTORIAL_DODGE",#H2H_LANGUAGE_ENGLISH,"Dodge with [ARG1] with no direction")
lsSet("TUTORIAL_DODGE",#H2H_LANGUAGE_FRENCH,"Esquive avec [ARG1] sans direction")

lsSet("TUTORIAL_JUMP",#H2H_LANGUAGE_ENGLISH,"Jump with [ARG1] + [ARG2]")
lsSet("TUTORIAL_JUMP",#H2H_LANGUAGE_FRENCH,"Saute avec [ARG1] + [ARG2]")

lsSet("TUTORIAL_DASH",#H2H_LANGUAGE_ENGLISH,"Dash with [ARG1] + [ARG2]/[ARG3]")
lsSet("TUTORIAL_DASH",#H2H_LANGUAGE_FRENCH,"Fais une glissage avec [ARG1] + [ARG2]/[ARG3]")

lsSet("TUTORIAL_PARRY",#H2H_LANGUAGE_ENGLISH,"Parry with [ARG1] + [ARG2]")
lsSet("TUTORIAL_PARRY",#H2H_LANGUAGE_FRENCH,"Parre avec [ARG1] + [ARG2]")

lsSet("TUTORIAL_PAUSE",#H2H_LANGUAGE_ENGLISH,"Pause the game with [ARG1]")
lsSet("TUTORIAL_PAUSE",#H2H_LANGUAGE_FRENCH,"Met le jeu en pause avec [ARG1]")

lsSet("TUTORIAL_HP",#H2H_LANGUAGE_ENGLISH,"Each player has up to 2 HP Bar\Some HP are regenerated when the last one is damaged")
lsSet("TUTORIAL_HP",#H2H_LANGUAGE_FRENCH,"Chaque joueur peut avoir jusqu'à 2 barres de vie\Quelques points de vie sont régénérés quand le dernier est endomagé")

lsSet("TUTORIAL_GUARD",#H2H_LANGUAGE_ENGLISH,"Each damage and stun destroys the guard bar\When the guard bar is destroyed, all damage stuns !")
lsSet("TUTORIAL_GUARD",#H2H_LANGUAGE_FRENCH,"Les dégâts et étourdissements détruisent la barre de garde\Quand elle est vide, tout dommage étourdis !")

lsSet("TUTORIAL_STAMINA",#H2H_LANGUAGE_ENGLISH,"The stamina bar between the HP and Guard bar indicates how much HP can be regenerated.\It is also consumed to regen guard faster or when starting heavy attacks.\However succesfuly finishing a combo gives some stamina back !")
lsSet("TUTORIAL_STAMINA",#H2H_LANGUAGE_FRENCH,"La barre d'endurance entre les points de vie et la garde indique combien de vie peut être régénérée.\Elle est aussi consommée pour récupérer la garde plus vite ou lors d'attaques lourdes initiées.\Cependant finir un combo avec succès redonne un peu d'endurance !")

lsSet("CONTROLLER_BUTTON_NAME_BOTTOM",#H2H_LANGUAGE_ENGLISH	,"bottom button")
lsSet("CONTROLLER_BUTTON_NAME_BOTTOM",#H2H_LANGUAGE_FRENCH	,"bouton bas")

lsSet("CONTROLLER_BUTTON_NAME_LEFT",#H2H_LANGUAGE_ENGLISH	,"left button")
lsSet("CONTROLLER_BUTTON_NAME_LEFT",#H2H_LANGUAGE_FRENCH	,"bouton gauche")

lsSet("CONTROLLER_BUTTON_NAME_RIGHT",#H2H_LANGUAGE_ENGLISH	,"right button")
lsSet("CONTROLLER_BUTTON_NAME_RIGHT",#H2H_LANGUAGE_FRENCH	,"bouton droit")

lsSet("CONTROLLER_BUTTON_NAME_TOP",#H2H_LANGUAGE_ENGLISH	,"top button")
lsSet("CONTROLLER_BUTTON_NAME_TOP",#H2H_LANGUAGE_FRENCH	,"bouton haut")

lsSet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_LEFT",#H2H_LANGUAGE_ENGLISH,"left joystick click")
lsSet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_LEFT",#H2H_LANGUAGE_FRENCH,"clic joystick gauche")

lsSet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_RIGHT",#H2H_LANGUAGE_ENGLISH,"right joystick click")
lsSet("CONTROLLER_BUTTON_NAME_JOYSTICK_PRESS_RIGHT",#H2H_LANGUAGE_FRENCH,"clic joystick droit")

; I don't know why top and bottom are reversed
; #H2H_CONTROLLER_BUTTON_TOP=1				:#H2H_CONTROLLER_BUTTON_TOP_NAME="top button"
; #H2H_CONTROLLER_BUTTON_RIGHT=2				:#H2H_CONTROLLER_BUTTON_RIGHT_NAME="right button"
; #H2H_CONTROLLER_BUTTON_BOTTOM=3				:#H2H_CONTROLLER_BUTTON_BOTTOM_NAME="bottom button"
; #H2H_CONTROLLER_BUTTON_LEFT=4				:#H2H_CONTROLLER_BUTTON_LEFT_NAME="left button"
; #H2H_CONTROLLER_L1=5						:#H2H_CONTROLLER_L1_NAME="L1"
; #H2H_CONTROLLER_L2=6						:#H2H_CONTROLLER_L2_NAME="L2"
; #H2H_CONTROLLER_R1=7						:#H2H_CONTROLLER_R1_NAME="R1"
; #H2H_CONTROLLER_R2=8						:#H2H_CONTROLLER_R2_NAME="R2"
; #H2H_CONTROLLER_START=9						:#H2H_CONTROLLER_START_NAME="start"
; #H2H_CONTROLLER_SELECT=10					:#H2H_CONTROLLER_SELECT_NAME="select"

lsSet("CONTROL_NAME_EMPTY",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_NONE_NAME)
lsSet("CONTROL_NAME_EMPTY",#H2H_LANGUAGE_FRENCH,			"-aucun-")

; lsSet("CONTROL_NAME_MOVEMENT",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_MOVEMENT_NAME)
; lsSet("CONTROL_NAME_MOVEMENT",#H2H_LANGUAGE_FRENCH,			"Déplacement")
; 
; lsSet("CONTROL_NAME_MOVEMENT_MENU",#H2H_LANGUAGE_ENGLISH,	#H2H_CONTROL_MOVEMENT_MENU_NAME)
; lsSet("CONTROL_NAME_MOVEMENT_MENU",#H2H_LANGUAGE_FRENCH,	"Navigation menu")
; 
; lsSet("CONTROL_NAME_MOVEMENT_COMBAT",#H2H_LANGUAGE_ENGLISH,	#H2H_CONTROL_MOVEMENT_COMBAT_NAME)
; lsSet("CONTROL_NAME_MOVEMENT_COMBAT",#H2H_LANGUAGE_FRENCH,	"Direction d'attaque")

lsSet("CONTROL_NAME_ATTACK",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_ATTACK_NAME)
lsSet("CONTROL_NAME_ATTACK",#H2H_LANGUAGE_FRENCH,			"Attaque")

lsSet("CONTROL_NAME_HEAVY",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_HEAVY_NAME)
lsSet("CONTROL_NAME_HEAVY",#H2H_LANGUAGE_FRENCH,			"Lourd")

lsSet("CONTROL_NAME_SPECIAL",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_SPECIAL_NAME)
lsSet("CONTROL_NAME_SPECIAL",#H2H_LANGUAGE_FRENCH,			"Spécial")

lsSet("CONTROL_NAME_NEUTRAL",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_NEUTRAL_NAME)
lsSet("CONTROL_NAME_NEUTRAL",#H2H_LANGUAGE_FRENCH,			"Attaque neutre")

lsSet("CONTROL_NAME_ATTACK_SIDE",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_ATTACK_SIDE_NAME)
lsSet("CONTROL_NAME_ATTACK_SIDE",#H2H_LANGUAGE_FRENCH,		"Attaque avant")

lsSet("CONTROL_NAME_ATTACK_BACK",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_ATTACK_BACK_NAME)
lsSet("CONTROL_NAME_ATTACK_BACK",#H2H_LANGUAGE_FRENCH,		"Attaque arrière")

lsSet("CONTROL_NAME_ATTACK_UP",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_ATTACK_UP_NAME)
lsSet("CONTROL_NAME_ATTACK_UP",#H2H_LANGUAGE_FRENCH,		"Attaque haute")

lsSet("CONTROL_NAME_ATTACK_DOWN",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_ATTACK_DOWN_NAME)
lsSet("CONTROL_NAME_ATTACK_DOWN",#H2H_LANGUAGE_FRENCH,		"Attaque basse")

lsSet("CONTROL_NAME_DODGE",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_DODGE_NAME)
lsSet("CONTROL_NAME_DODGE",#H2H_LANGUAGE_FRENCH,			"Esquive")

lsSet("CONTROL_NAME_JUMP",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_JUMP_NAME)
lsSet("CONTROL_NAME_JUMP",#H2H_LANGUAGE_FRENCH,				"Saut")

lsSet("CONTROL_NAME_PARRY",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_PARRY_NAME)
lsSet("CONTROL_NAME_PARRY",#H2H_LANGUAGE_FRENCH,			"Parrade")

lsSet("CONTROL_NAME_DASH_RIGHT",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_DASH_RIGHT_NAME)
lsSet("CONTROL_NAME_DASH_RIGHT",#H2H_LANGUAGE_FRENCH,		"Glissade à droite")

lsSet("CONTROL_NAME_DASH_LEFT",#H2H_LANGUAGE_ENGLISH,		#H2H_CONTROL_DASH_LEFT_NAME)
lsSet("CONTROL_NAME_DASH_LEFT",#H2H_LANGUAGE_FRENCH,		"Glissade à gauche")

lsSet("CONTROL_NAME_ACCEPT",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_ACCEPT_NAME)
lsSet("CONTROL_NAME_ACCEPT",#H2H_LANGUAGE_FRENCH,			"Valider")

lsSet("CONTROL_NAME_CANCEL",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_CANCEL_NAME)
lsSet("CONTROL_NAME_CANCEL",#H2H_LANGUAGE_FRENCH,			"Annuler")

lsSet("CONTROL_NAME_EXIT",#H2H_LANGUAGE_ENGLISH,			#H2H_CONTROL_EXIT_NAME)
lsSet("CONTROL_NAME_EXIT",#H2H_LANGUAGE_FRENCH,				"Quitter")

lsSet("KEY_SPACEBAR",#H2H_LANGUAGE_ENGLISH,"Space")
lsSet("KEY_SPACEBAR",#H2H_LANGUAGE_FRENCH,"Espace")

For i=0 To 9
	lsSet("KEY_PAD_"+i,#H2H_LANGUAGE_ENGLISH,"Pad "+i)
	lsSet("KEY_PAD_"+i,#H2H_LANGUAGE_FRENCH,"Num "+i)
Next

lsSet("KEY_PAD_COMMA",#H2H_LANGUAGE_ENGLISH,"Pad comma")
lsSet("KEY_PAD_COMMA",#H2H_LANGUAGE_FRENCH,"Num virgule")

lsSet("KEY_PAD_DIVIDE",#H2H_LANGUAGE_ENGLISH,"Pad divide")
lsSet("KEY_PAD_DIVIDE",#H2H_LANGUAGE_FRENCH,"Num division")

lsSet("KEY_TAB",#H2H_LANGUAGE_ENGLISH,"Tab")
lsSet("KEY_TAB",#H2H_LANGUAGE_FRENCH,"Tabulation")

lsSet("KEY_SHIFT_LEFT",#H2H_LANGUAGE_ENGLISH,"Left shift")
lsSet("KEY_SHIFT_LEFT",#H2H_LANGUAGE_FRENCH,"Shift gauche")

lsSet("KEY_SHIFT_RIGHT",#H2H_LANGUAGE_ENGLISH,"Right shift")
lsSet("KEY_SHIFT_RIGHT",#H2H_LANGUAGE_FRENCH,"Shift droit")

lsSet("KEY_CONTROL_LEFT",#H2H_LANGUAGE_ENGLISH,"Left control")
lsSet("KEY_CONTROL_LEFT",#H2H_LANGUAGE_FRENCH,"Control right")

lsSet("KEY_CONTROL_RIGHT",#H2H_LANGUAGE_ENGLISH,"Right control")
lsSet("KEY_CONTROL_RIGHT",#H2H_LANGUAGE_FRENCH,"Control droit")

lsSet("KEY_ALT_LEFT",#H2H_LANGUAGE_ENGLISH,"Left alt")
lsSet("KEY_ALT_LEFT",#H2H_LANGUAGE_FRENCH,"Alt gauche")

lsSet("KEY_ALT_RIGHT",#H2H_LANGUAGE_ENGLISH,"Right alt")
lsSet("KEY_ALT_RIGHT",#H2H_LANGUAGE_FRENCH,"Alt droit")

lsSet("KEY_BACKSPACE",#H2H_LANGUAGE_ENGLISH,"Backspace")
lsSet("KEY_BACKSPACE",#H2H_LANGUAGE_FRENCH,"Effacer")

lsSet("KEY_ESCAPE",#H2H_LANGUAGE_ENGLISH,"Escape")
lsSet("KEY_ESCAPE",#H2H_LANGUAGE_FRENCH,"Echap")

lsSet("KEY_RETURN",#H2H_LANGUAGE_ENGLISH,"Return")
lsSet("KEY_RETURN",#H2H_LANGUAGE_FRENCH,"Entrée")

lsSet("CREDITS_CONTRIBUTORS",#H2H_LANGUAGE_ENGLISH,"Main contributors")
lsSet("CREDITS_CONTRIBUTORS",#H2H_LANGUAGE_FRENCH,"Contributeurs principaux")

lsSet("CREDITS_FLAMEOFCHANGE",#H2H_LANGUAGE_ENGLISH,"> Game design\> Code\> Graphics\> Music\> Sound design\> Hand rotoscoping")
lsSet("CREDITS_FLAMEOFCHANGE",#H2H_LANGUAGE_FRENCH,"> Game design\> Développement\> Graphiques\> Musique\> Sound design\> Rotoscopie de main")

lsSet("CREDITS_NEMEROD",#H2H_LANGUAGE_ENGLISH,"> Sound load/play system\> Back-end support\> Discord assistance")
lsSet("CREDITS_NEMEROD",#H2H_LANGUAGE_FRENCH,"> Système de chargement/lancement des sons\> Support back-end\> Assistance sur Discord")

lsSet("CREDITS_TOTAL_DRAWN_HAND",#H2H_LANGUAGE_ENGLISH,"Total drawn hand")
lsSet("CREDITS_TOTAL_DRAWN_HAND",#H2H_LANGUAGE_FRENCH,"Total de mains dessinées")

lsSet("CREDITS_SCRAPPED",#H2H_LANGUAGE_ENGLISH,"(not counting scrapped)")
lsSet("CREDITS_SCRAPPED",#H2H_LANGUAGE_FRENCH,"(sans compter celles supprimées)")

lsSet("CREDITS_LIBRARIES_CODE",#H2H_LANGUAGE_ENGLISH,"Code libraries")
lsSet("CREDITS_LIBRARIES_CODE",#H2H_LANGUAGE_FRENCH,"Bibliothèques de développement")

lsSet("CREDITS_LIBRARIES_SOUND",#H2H_LANGUAGE_ENGLISH,"Sound libraries")
lsSet("CREDITS_LIBRARIES_SOUND",#H2H_LANGUAGE_FRENCH,"Bibliothèques de sons")

lsSet("CREDITS_SOUNDS",#H2H_LANGUAGE_ENGLISH,"Sounds")
lsSet("CREDITS_SOUNDS",#H2H_LANGUAGE_FRENCH,"Sons")

lsSet("CREDITS_BORROWED",#H2H_LANGUAGE_ENGLISH,"'Borrowed' from")
lsSet("CREDITS_BORROWED",#H2H_LANGUAGE_FRENCH,"'Empruntés' de")

lsSet("CREDITS_SOFTWARES",#H2H_LANGUAGE_ENGLISH,"Softwares used")
lsSet("CREDITS_SOFTWARES",#H2H_LANGUAGE_FRENCH,"Logiciels utilisés")

lsSet("CREDITS_SPECIAL_THANKS",#H2H_LANGUAGE_ENGLISH,"Special thanks")
lsSet("CREDITS_SPECIAL_THANKS",#H2H_LANGUAGE_FRENCH,"Remerciements")

lsSet("CREDITS_SPECIAL_THANKS_LIST",#H2H_LANGUAGE_ENGLISH,"> Kaldrin (animation support)\> Serane155 (twitch promotion)\> Yeon (former Discord assistant)\> John Batch (former support dev)\> Johen Sound (sound design support)\> Black Door Games (regional gamedev cluster)\> Aspect (discord community)\> Arcadia corp (discord community)\> La Gamecup 2,3 and 4 (contest entry)\> Alex d'or 2023 (community & contest entry)\> Beben (beta-test & QA support)")
lsSet("CREDITS_SPECIAL_THANKS_LIST",#H2H_LANGUAGE_FRENCH,"> Kaldrin (support animation)\> Serane155 (promotion twitch)\> Yeon (ancienne assistante Discord)\> John Batch (ancien support dev)\> Johen Sound (support en sound design)\> Black Door Games (association régionale de développement de jeu)\> Aspect (communauté Discord)\> Arcadia corp (communauté discord)\> La Gamecup 2,3 and 4 (participation au concours)\> Alex d'or 2023 (communauté et participation au concours)\> Beben (beta-test et support QA)")


lsSet("HINT_1" ,#H2H_LANGUAGE_FRENCH,"Les classes lourdes sont efficaces à bourrer l'adversaire,\infligeant des dégâts élevés et pouvant en encaisser beaucoup")
lsSet("HINT_2" ,#H2H_LANGUAGE_FRENCH,"Les classes légères sont très mobiles et efficaces à esquiver les attaques")
lsSet("HINT_3" ,#H2H_LANGUAGE_FRENCH,"Les classes à haute force ne sont pas encombrés de leur masse")
lsSet("HINT_4" ,#H2H_LANGUAGE_FRENCH,"La régénération affecte seulement la barre de vie intérieure et d'une quantité limité par match")
lsSet("HINT_5" ,#H2H_LANGUAGE_FRENCH,"Les postures altèrent les statistiques mais ne changent jamais le total\Ils rendent la classe plus équilibrée ou spécialisée")
lsSet("HINT_6" ,#H2H_LANGUAGE_FRENCH,"Une attaque qui touche mais pas continuée en combo a un temps de recharge divisé par deux")
lsSet("HINT_7" ,#H2H_LANGUAGE_FRENCH,"Prend une capture d'écran avec shift+F")
lsSet("HINT_8" ,#H2H_LANGUAGE_FRENCH,"Les parades et les esquives ne sont pas instantanées.\Le temps d'entrée et de sortie sont réduits par la vitesse")
lsSet("HINT_9" ,#H2H_LANGUAGE_FRENCH,"Pare les attaques légères et esquive les attaques lourdes, pas l'inverse !")
lsSet("HINT_10",#H2H_LANGUAGE_FRENCH,"Les attaques neutres ont moins d'effets mais sont rapides et touchent facilement")
lsSet("HINT_11",#H2H_LANGUAGE_FRENCH,"Les attaques frontales ont tendance à avancer la main, efficace à poursuivre l'ennemi qui recule")
lsSet("HINT_12",#H2H_LANGUAGE_FRENCH,"Les attaques aériennes sont efficaces à punir un adversaire en l'air")
lsSet("HINT_13",#H2H_LANGUAGE_FRENCH,"Les attaques en bas sont défensives et ont une courte portée")
lsSet("HINT_14",#H2H_LANGUAGE_FRENCH,"les attaques lourdes sont facile à esquiver mais infligent beaucoup de dégâts")
lsSet("HINT_15",#H2H_LANGUAGE_FRENCH,"La hitbox du joueur est un disque centré sur sa paume\Les doigts ne sont pas des points faibles")
lsSet("HINT_16",#H2H_LANGUAGE_FRENCH,"Ne faites pas ça chez vous avec des objets pointus ou tranchants !")
lsSet("HINT_17",#H2H_LANGUAGE_FRENCH,"Pour ne pas déranger les autres, ne pas frapper les objets ensemble\lors des entraînements dans la réalité")
lsSet("HINT_18",#H2H_LANGUAGE_FRENCH,"Les effets d'atterissage donnent des indices sur la masse du joueur")
lsSet("HINT_19",#H2H_LANGUAGE_FRENCH,"Certaines attaques étourdissent, d'autres non !\Infliger des dommages ne veux pas toujours dire étourdir.\Certaines attaques sont faites pour rendre les combos plus faciles")
lsSet("HINT_20",#H2H_LANGUAGE_FRENCH,"Pas encore de mode en ligne, mais le Steam Remote Play peut faire l'affaire en attendant")
lsSet("HINT_21",#H2H_LANGUAGE_FRENCH,"Supprimer le fichier de paramettres (settings.json) va les remettre par défaut au prochain démarrage")
lsSet("HINT_22",#H2H_LANGUAGE_FRENCH,"Le jeu fonctionne mieux au clavier")
lsSet("HINT_23",#H2H_LANGUAGE_FRENCH,"Garanti sans IA génératives !")
lsSet("HINT_24",#H2H_LANGUAGE_FRENCH,"Le jeu a encore bon nombre de mécaniques à venir dans son développement.\Reste attentif aux nouveautées sur les pages officielles !")
lsSet("HINT_25",#H2H_LANGUAGE_FRENCH,"N'hésite pas à rejoindre le discord officiel, lien sur la page steam et itch.io !")
lsSet("HINT_26",#H2H_LANGUAGE_FRENCH,"Certaines postures d'IA ont des comportements spéciaux")
;}
CompilerEndIf
CompilerEndIf

; CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure lsLoad(filename.s,langage.i)
; 	Debug "loading language file "+filename
	j=JSONindex
	JSONindex+1
	If LoadJSON(j,filename)
		*parent=JSONValue(j)
		If ExamineJSONMembers(*parent)
			While NextJSONMember(*parent)
				lsSet(JSONMemberKey(*parent),langage,loadJSONString(*parent,JSONMemberKey(*parent)))
			Wend
		EndIf
		FreeJSON(j)
	EndIf
EndProcedure
; CompilerEndIf

Declare lsRefresh()
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 418
; FirstLine = 402
; Folding = ----
; EnableXP
; DPIAware
; CPU = 4