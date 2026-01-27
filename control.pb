#H2H_CONTROL_DEFAULT_LEFT_LEFT		=#VK_A
#H2H_CONTROL_DEFAULT_LEFT_RIGHT		=#VK_D
#H2H_CONTROL_DEFAULT_LEFT_UP		=#VK_W
#H2H_CONTROL_DEFAULT_LEFT_DOWN		=#VK_S
#H2H_CONTROL_DEFAULT_LEFT_NEUTRAL	=#VK_C
#H2H_CONTROL_DEFAULT_LEFT_HEAVY		=#VK_V
#H2H_CONTROL_DEFAULT_LEFT_SPECIAL	=#VK_B

#H2H_CONTROL_DEFAULT_RIGHT_LEFT		=#VK_LEFT
#H2H_CONTROL_DEFAULT_RIGHT_RIGHT	=#VK_RIGHT
#H2H_CONTROL_DEFAULT_RIGHT_UP		=#VK_UP
#H2H_CONTROL_DEFAULT_RIGHT_DOWN		=#VK_DOWN
#H2H_CONTROL_DEFAULT_RIGHT_NEUTRAL	=#VK_P
#H2H_CONTROL_DEFAULT_RIGHT_HEAVY	=#VK_O
#H2H_CONTROL_DEFAULT_RIGHT_SPECIAL	=#VK_I

; Global Dim vkeyToKey($ff)
; Global Dim keyTovkey($ff)

Procedure.i stringToKey(key$,EN.i=#False)
	key$=UCase(Trim(key$))
; 	Debug "For key "+key$
	If EN
		For i=0 To ArraySize(keyToStringEN$())
;  			Debug "Is it "+UCase(keyToStringEN$(i))+" ?"
			If key$=UCase(keyToStringEN$(i))
;  				Debug "YES"
				ProcedureReturn i
			EndIf
		Next
	Else
		For i=0 To ArraySize(keyToString$())
			If key$=UCase(keyToString$(i))
				ProcedureReturn i
			EndIf
		Next
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.i stringToAction(action$,EN.i=#False)
	action$=UCase(Trim(action$))
;  	Debug "For action "+action$
	If EN
		For i=0 To ArraySize(controllerButtonNameEN$())
;  			Debug "is "+UCase(controllerButtonNameEN$(i))+" ?"
			If action$=UCase(controllerButtonNameEN$(i))
;  				Debug "FOUND !!!"
				ProcedureReturn i
			EndIf
		Next
	Else
		For i=0 To ArraySize(controllerButtonName$())
			If action$=UCase(controllerButtonName$(i))
				ProcedureReturn i
			EndIf
		Next
	EndIf
	ProcedureReturn 0
EndProcedure

;{ 
; keyTovKey(#PB_Key_A)=#VK_A
; keyTovKey(#PB_Key_B)=#VK_B
; keyTovKey(#PB_Key_C)=#VK_C
; keyTovKey(#PB_Key_D)=#VK_D
; keyTovKey(#PB_Key_E)=#VK_E
; keyTovKey(#PB_Key_F)=#VK_F
; keyTovKey(#PB_Key_G)=#VK_G
; keyTovKey(#PB_Key_H)=#VK_H
; keyTovKey(#PB_Key_I)=#VK_I
; keyTovKey(#PB_Key_J)=#VK_J
; keyTovKey(#PB_Key_K)=#VK_K
; keyTovKey(#PB_Key_L)=#VK_L
; keyTovKey(#PB_Key_M)=#VK_M
; keyTovKey(#PB_Key_N)=#VK_N
; keyTovKey(#PB_Key_O)=#VK_O
; keyTovKey(#PB_Key_P)=#VK_P
; keyTovKey(#PB_Key_Q)=#VK_Q
; keyTovKey(#PB_Key_R)=#VK_R
; keyTovKey(#PB_Key_S)=#VK_S
; keyTovKey(#PB_Key_T)=#VK_T
; keyTovKey(#PB_Key_U)=#VK_U
; keyTovKey(#PB_Key_V)=#VK_V
; keyTovKey(#PB_Key_W)=#VK_W
; keyTovKey(#PB_Key_X)=#VK_X
; keyTovKey(#PB_Key_Y)=#VK_Y
; keyTovKey(#PB_Key_Z)=#VK_Z
; 
; keyTovKey(#PB_Key_0)=#VK_0
; keyTovKey(#PB_Key_1)=#VK_1
; keyTovKey(#PB_Key_2)=#VK_2
; keyTovKey(#PB_Key_3)=#VK_3
; keyTovKey(#PB_Key_4)=#VK_4
; keyTovKey(#PB_Key_5)=#VK_5
; keyTovKey(#PB_Key_6)=#VK_6
; keyTovKey(#PB_Key_7)=#VK_7
; keyTovKey(#PB_Key_8)=#VK_8
; keyTovKey(#PB_Key_9)=#VK_9
; 
; keyTovKey(#PB_Key_Pad0)=#VK_NUMPAD0
; keyTovKey(#PB_Key_Pad1)=#VK_NUMPAD1
; keyTovKey(#PB_Key_Pad2)=#VK_NUMPAD2
; keyTovKey(#PB_Key_Pad3)=#VK_NUMPAD3
; keyTovKey(#PB_Key_Pad4)=#VK_NUMPAD4
; keyTovKey(#PB_Key_Pad5)=#VK_NUMPAD5
; keyTovKey(#PB_Key_Pad6)=#VK_NUMPAD6
; keyTovKey(#PB_Key_Pad7)=#VK_NUMPAD7
; keyTovKey(#PB_Key_Pad8)=#VK_NUMPAD8
; keyTovKey(#PB_Key_Pad9)=#VK_NUMPAD9
; keyTovKey(#PB_Key_PadComma)=#VK_DECIMAL
; keyTovKey(#PB_Key_Divide)=#VK_DIVIDE
; 
; keyTovKey(#PB_Key_Left)=#VK_LEFT
; keyTovKey(#PB_Key_Right)=#VK_RIGHT
; keyTovKey(#PB_Key_Up)=#VK_UP
; keyTovKey(#PB_Key_Down)=#VK_DOWN
; 
; keyTovKey(#PB_Key_Comma)=#VK_OEM_COMMA
; keyTovKey(#PB_Key_SemiColon)=#VK_OEM_PERIOD
; keyTovKey(#PB_Key_Apostrophe)=#VK_OEM_4
; keyTovKey(#PB_Key_Slash)=#VK_DIVIDE
; ;keyTovKey(#PB_Key_BackSlash)=
; keyTovKey(#PB_Key_Equals)=#VK_OEM_PLUS
; keyTovKey(#PB_Key_Add)=#VK_OEM_PLUS
; keyTovKey(#PB_Key_Minus)=#VK_OEM_MINUS
; keyTovKey(#PB_Key_Multiply)=#VK_MULTIPLY
; keyTovKey(#PB_Key_Decimal)=#VK_OEM_PERIOD
; keyTovKey(#PB_Key_Space)=#VK_SPACE
; keyTovKey(#PB_Key_Tab)=#VK_TAB
; keyTovKey(#PB_Key_LeftShift)=16;#VK_LSHIFT
; keyTovKey(#PB_Key_RightShift)=16;#VK_RSHIFT
; keyTovKey(#PB_Key_LeftControl)=17;#VK_LCONTROL
; keyTovKey(#PB_Key_RightControl)=17;#VK_RCONTROL
; keyTovKey(#PB_Key_LeftAlt)=#VK_LMENU
; keyTovKey(#PB_Key_RightAlt)=#VK_RMENU
; keyTovKey(#PB_Key_Return)=#VK_RETURN
; keyTovKey(#PB_Key_Back)=#VK_BACK
; keyTovKey(#PB_Key_Escape)=#VK_ESCAPE
; 
; For i=0 To $ff
; 	vkeyToKey(keyTovKey(i))=i
; Next
; vkeyToKey(16)=#PB_Key_LeftShift
; vkeyToKey(17)=#PB_Key_LeftControl
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
; Global *key:*key=AllocateMemory($400)
Global lastPushed.i
Global lastReleased.i

Global *AZERTY2QWERTY=AllocateMemory($100)
PokeB(*AZERTY2QWERTY+#VK_A,#VK_Q)
PokeB(*AZERTY2QWERTY+#VK_Z,#VK_W)
PokeB(*AZERTY2QWERTY+#VK_W,#VK_Z)
PokeB(*AZERTY2QWERTY+#VK_Q,#VK_A)
PokeB(*AZERTY2QWERTY+#VK_OEM_COMMA,#VK_M)

#H2H_CONTROL_MACRO_ENABLED=0

CompilerIf #False ;older
; Procedure KeyUpdate(eee)
; 	If (EventlParam()&$C0000000)<>$40000000
; 		a=EventwParam()&$ff
; 		If Not keyboardType And PeekB(*AZERTY2QWERTY+a)
; 			a=PeekB(*AZERTY2QWERTY+a)
; 		EndIf
; 		If eee=$100
; 			PokeA(*key+a+$200,1)
; 			PokeA(*key+a+$100,1)
; 			PokeA(*key+a,1)
; 			lastPushed=a
; 			ProcedureReturn 1
; 		EndIf
; 		If eee=$101
; 			PokeA(*key+a+$300,1)
; 			PokeA(*key+a+$100,1)
; 			PokeA(*key+a,0)
; 			lastReleased=a
; 			ProcedureReturn 1
; 		EndIf
; 	EndIf
; 	ProcedureReturn 0
; EndProcedure
; 
; CompilerIf #H2H_CONTROL_MACRO_ENABLED
; Macro KeyPushed(a)		:PeekA(*key+(a&$ff))EndMacro
; Macro KeyReleased(a)	:PeekA(*key+(a&$ff)):EndMacro
; Macro KeySwitched(a)	:PeekA(*key+(a&$ff)+$100):EndMacro
; Macro KeyJustPushed(a)	:PeekA(*key+(a&$ff)+$200):EndMacro
; Macro KeyJustReleased(a):PeekA(*key+(a&$ff)+$300):EndMacro
; CompilerElse
; 
; Procedure KeyPushed(a)
; 	ProcedureReturn PeekA(*key+(a&$ff))
; EndProcedure
; 
; Procedure KeyReleased(a)
; 	ProcedureReturn PeekA(*key+(a&$ff))
; EndProcedure
; 
; Procedure KeySwitched(a)
; 	ProcedureReturn PeekA(*key+(a&$ff)+$100)
; EndProcedure
; 
; Procedure KeyJustPushed(a)
; 	ProcedureReturn PeekA(*key+(a&$ff)+$200)
; EndProcedure
; 
; Procedure KeyJustReleased(a)
; 	ProcedureReturn PeekA(*key+(a&$ff)+$300)
; EndProcedure
; 
; CompilerEndIf
; Procedure keyJustpressedClear()
;   	max=*key+$3ff
;   	For i=*key+$200 To max
;   		PokeA(i,0)
;   	Next
; EndProcedure
; Procedure keyClear(force.i=#False)
; ; 	lastPushed=0
; ; 	lastReleased=0
; ; 	max=*key+$3ff
; ; 	If force
; ; 		For i=*key To max
; ; 			PokeA(i,0)
; ; 		Next
; ; 	Else
; ; 		For i=*key+$100 To max
; ; 			PokeA(i,0)
; ; 		Next
; ; 	EndIf
;   !mov rax,[p.v_force];load var
;   !xorpd xmm0,xmm0
;   !cmp rax,0;if force
;   !mov rcx,[p_key];pipe
;   !setne al; -1
;   !add rcx,$400
;   !add al,3
;   !@@:;for 
;   !sub rcx,$100
;   !movdqa [rcx+$00],xmm0
;   !movdqa [rcx+$10],xmm0
;   !movdqa [rcx+$20],xmm0
;   !movdqa [rcx+$30],xmm0
;   !movdqa [rcx+$40],xmm0
;   !movdqa [rcx+$50],xmm0
;   !movdqa [rcx+$60],xmm0
;   !movdqa [rcx+$70],xmm0
;   !movdqa [rcx+$80],xmm0
;   !movdqa [rcx+$90],xmm0
;   !movdqa [rcx+$a0],xmm0
;   !movdqa [rcx+$b0],xmm0
;   !movdqa [rcx+$c0],xmm0
;   !movdqa [rcx+$d0],xmm0
;   !movdqa [rcx+$e0],xmm0
;   !movdqa [rcx+$f0],xmm0
;   !dec al;step
;   !jnz @r;next
;   !mov rax,1;return 1
; EndProcedure
; CompilerEndIf
CompilerEndIf

; Macro joystickPlugged()
; 	PeekQ(*key+$1008+((a&$f)<<8)) 
; EndMacro

CompilerIf #False ; old
	Global *key,key_internal_a.q,key_internal_temp.q:*key=AllocateMemory($2000)
Procedure IsJoy(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1000
  !movzx rax,byte[rax]
  ProcedureReturn 
EndProcedure

; incrémente si branché
; -1 si pas branché
Procedure JoyTick(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1008
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure KeyUpdate(id_event):key_internal_a=EventwParam()
	If (EventlParam()&$C0000000)<>$40000000
		; TEMPORARY PATCH FOR COMPATIBILITY
		If Not keyboardType 
			a=EventwParam()&$ff
			If PeekB(*AZERTY2QWERTY+a)
				key_internal_a=PeekB(*AZERTY2QWERTY+a)
			EndIf
		EndIf
		If id_event=$100
			lastPushed=key_internal_a
		EndIf
		If id_event=$200
			lastReleased=key_internal_a
		EndIf
		; END OF TEMPORARY PATCH
    !movzx r10,byte [v_key_internal_a]
    !mov   rax,     1 
    !mov   rsi, r10   ;LKPR+(N&f)
    !mov   r8 , [p_key]
    !mov   r9 , r8    
    !add   r10, r9    
    !mov   r11, r10   
    !mov   r12, r11   
    !mov   r13, r12   
    !add   r10, $0000 
    !add   r11, $0100 
    !add   r12, $0200 
    !add   r13, $0300 
    !add   r8 , $0500; LKP +(N&f)
    !add   r9 , $0600;    R+(N&f)
    !mov rcx,[p.v_id_event]
    !cmp rcx,$102; O
    !je key_set_2
    !cmp rcx,$100; D
    !je key_set_1
    !cmp rcx,$104
    !je key_set_1
    !cmp rcx,$101; U
    !je key_set_0
    !cmp rcx,$105
    !je key_set_0
    !jmp key_set_end
    !key_set_0:;multi return selector
    !xor rax,rax
    !mov r11,r12
    !mov r8 ,r9 
    !key_set_1:
    !mov byte[r10], al;pokea $000
    !mov byte[r11],$01;pokea mux($100,$200)
    !mov byte[r13],$01;pokea $300
    !mov r10,[r8+$00]
    !mov r11,[r8+$08]
    !mov r12,[r8+$10]
    !mov r13,[r8+$18]
    !rol r10,8
    !rol r11,8
    !rol r12,8
    !rol r13,8
    !mov rax,r10
    !mov rbx,r11
    !mov rcx,r12
    !mov rdx,r13
    !and r10,-256
    !and r11,-256
    !and r12,-256
    !and r13,-256
    !and rax, 255
    !and rbx, 255
    !and rcx, 255
    !and rdx, 255
    !or  r10,rsi
    !or  r11,rax
    !or  r12,rbx
    !or  r13,rcx
    !mov [r8+$00],r10
    !mov [r8+$08],r11
    !mov [r8+$10],r12
    !mov [r8+$18],r13
    !key_set_2:
    !xor  rax,$1000101
    ProcedureReturn
    !key_set_end:
  EndIf
  !mov rcx,[p.v_id_event]
  !mov   r10,[p_key]
  !mov rax,$100020001;mouse M clic F
  !cmp rcx,$200
  !je key_mov_1
  !inc r10
  !mov rax,$100020101;mouse D clic 0
  !cmp rcx,$201
  !je key_mov_1
  !cmp rcx,$203
  !je key_mov_1
  !mov rax,$100020201;mouse U clic 0
  !cmp rcx,$202
  !je key_mov_0
  !inc r10
  !mov rax,$100020401;mouse D clic 1
  !cmp rcx,$204
  !je key_mov_1
  !cmp rcx,$206
  !je key_mov_1
  !mov rax,$100020501;mouse U clic 1
  !cmp rcx,$205
  !je key_mov_0
  !inc r10
  !mov rax,$100020701;mouse D clic 2
  !cmp rcx,$207
  !je key_mov_1
  !cmp rcx,$209
  !je key_mov_1
  !mov rax,$100020801;mouse U clic 3
  !cmp rcx,$208
  !je key_mov_0
  !inc r10
  !mov rax,$100020a01;mouse O clic 3
  !cmp rcx,$20A
  !je key_mov_1
  !jmp key_mov_end;skip to joy
  !key_mov_0:
  !xor al,al
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$00;pokea $000
  !mov byte[r12],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_1:
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$01;pokea $000
  !mov byte[r11],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_end:
  PokeQ(*key+$400,$FF00000100)
  !cmp qword[p.v_id_event],0
  !jne key_event_end
  For key_internal_a = 0 To 15
;    	If IsJoy(key_internal_a)
;    		Debug "is joy "+key_internal_a
   		key_internal_temp=joyGetPosEx_(key_internal_a,*key+$400) ; THIS LINE LAGGS IF THERE'S NO CONTROLLER
;     EndIf
    !xor r10,r10;pre-clear
    !xor r11,r11
    !xor r12,r12
    !xor rcx,rcx
    !mov r15,[p_key];quick load
    !mr15,rcx;5 variable done minimal opcode
    !mov ov r14,r15
    !mov  ch,byte [v_key_internal_a]
    !add r15,$1000
    !add r14,$0400
    !add rbx,[v_key_internal_temp]
    !cmp rbx,$A5;#JOYERR_PARMS
    !je  key_clear_2
    !cmp rbx,$06;#MMSYSERR_NODRIVER
    !je  key_clear_2
    !cmp rbx,$0B;#MMSYSERR_INVALPARAM
    !je  key_clear_2
    !cmp rbx,$02;#MMSYSERR_BADDEVICEID
    !je  key_clear_2
    !cmp rbx,$A7;#JOYERR_UNPLUGGED
    !je  key_clear_1
    !cmp rbx,$00;#JOYERR_NOERROR
    !jne key_clear_1
    !mov r10,rcx;control OK, update flag/16
    !mov r11,[r15+$f8];F1 = flag tick
    !bts r10,0
    !inc r11
    !mov [r15+$f0],r10;F0 = flag primaire 
    !mov [r15+$f8],r11;F1 = flag tick
    !or qword[p.v_id_event],$2000000
    !mov r10,[r14+$20];process data button unpacked
    !mov rcx,31
    !@@:
    !bt r10,rcx
    !setc [r15+rcx]
    !dec rcx
    !jns @b;unload
    !mov    r10w    ,[r14+$08] ; control X all axe
    !mov    r11w    ,[r14+$18] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$20], r10      ;
    !mov   [r15+$28], r11      ;
    !mov   [r15+$30], r12      ;
    !mov   [r15+$38], r13      ;
    !mov    r10w    ,[r14+$0C] ; control Y all axe
    !mov    r11w    ,[r14+$14] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$40], r10      ;
    !mov   [r15+$48], r11      ;
    !mov   [r15+$50], r12      ;
    !mov   [r15+$58], r13      ;
    !mov    r10w    ,[r14+$28] ; control Z all axe
    !mov    r11w    ,[r14+$10] ;
    !xor    r12     , r12      ;unused yet
    !xor    r13     , r13      ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ; TODO ?
    !movsx  r11     , r11w     ; TODO ?
    !movsx  r12     , r12w     ; TODO ?
    !movsx  r13     , r13w     ; TODO ?
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$60], r10      ;
    !mov   [r15+$68], r11      ;
    !mov   [r15+$70], r12      ;
    !mov   [r15+$78], r13      ;
    !jmp key_clear_end
    !key_clear_1:;post-clear
    !mov r10,$0000000000000000
    !mov r11,$ffffffffffffffff
    !mov r12,$fffffffffffffc00
    !key_clear_2:;ULTRA CLEAR in BATCH !!!! 
    !mov [r15+$00],r10;B8 = button byte     
    !mov [r15+$08],r10;B8 = button byte     
    !mov [r15+$10],r10;B8 = button byte     
    !mov [r15+$18],r10;B8 = button byte     
    !mov [r15+$f0],r10;F0 = flag primaire   
    !mov [r15+$f8],r11;F1 = flag tick       
    !mov [r15+$20],r12;X0 = stick           ;If eee=$113:eee=0:EndIf
    !mov [r15+$28],r12;X1 = stick           ;If eee=$3A0:eee=0:EndIf
    !mov [r15+$30],r12;X2 = stick           ;If eee=$3A2:eee=0:EndIf
    !mov [r15+$38],r12;X3 = stick           ;If eee=$3A5:eee=0:EndIf;button PM$F event
    !mov [r15+$40],r12;Y0 = stick           ;If eee=$3A7:eee=0:EndIf;button RM$F event
    !mov [r15+$48],r12;Y1 = stick           ;If eee=$0A5:eee=0:EndIf;INV KJOY
    !mov [r15+$50],r12;Y2 = stick           
    !mov [r15+$58],r12;Y3 = stick           
    !mov [r15+$60],r12;Z0 = stick           
    !mov [r15+$68],r12;Z1 = stick           
    !mov [r15+$70],r12;Z2 = stick           
    !mov [r15+$78],r12;Z3 = stick           
    !key_clear_end:
  Next
  !key_event_end:
  ProcedureReturn id_event
EndProcedure
Procedure KeyPushed(       a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyReleased(     a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )!1
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !xor al,$01
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyJustPushed(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$100)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$100,0)
  !add   rbx,$100
  !mov    al,[rbx]
  !movzx rax,al
  !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyJustReleased(a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$200)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$200,0)
  !add   rbx,$200
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyEventSwitch(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$300)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$300,0)
  !add   rbx,$300
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure JoyPushed(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure JoyReleased(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  !xor al,1
  ProcedureReturn 
EndProcedure
Procedure JoyX(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1020
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyY(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1040
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyZ(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1060
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure keyClear(FORCE.q=0)
  !mov rax,[p.v_FORCE];load var
  !xorpd xmm0,xmm0
  !cmp rax,0;if force
  !mov rcx,[p_key];pipe
  !setne al;
  !add rcx,$400
  !add al,3
  !@@:;for 
  !sub rcx,$100
  !movdqa [rcx+$00],xmm0
  !movdqa [rcx+$10],xmm0
  !movdqa [rcx+$20],xmm0
  !movdqa [rcx+$30],xmm0
  !movdqa [rcx+$40],xmm0
  !movdqa [rcx+$50],xmm0
  !movdqa [rcx+$60],xmm0
  !movdqa [rcx+$70],xmm0
  !movdqa [rcx+$80],xmm0
  !movdqa [rcx+$90],xmm0
  !movdqa [rcx+$a0],xmm0
  !movdqa [rcx+$b0],xmm0
  !movdqa [rcx+$c0],xmm0
  !movdqa [rcx+$d0],xmm0
  !movdqa [rcx+$e0],xmm0
  !movdqa [rcx+$f0],xmm0
  !dec al;step
  !jnz @r;next
  !mov rax,1;return 1
  ProcedureReturn 
EndProcedure
Procedure KeyLastPushed(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$500
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyLastReleased(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$600
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
CompilerEndIf
CompilerIf #False ; old 2
Global *key,key_internal_a.q,key_internal_temp.q:*key=AllocateMemory($2000)
Procedure KeyUpdate(id_event):key_internal_a=EventwParam()
	If (EventlParam()&$C0000000)<>$40000000
		; TEMPORARY PATCH FOR COMPATIBILITY
		If Not keyboardType 
			a=EventwParam()&$ff
			If PeekB(*AZERTY2QWERTY+a)
				key_internal_a=PeekB(*AZERTY2QWERTY+a)
			EndIf
		EndIf
		If id_event=$100
			lastPushed=key_internal_a
		EndIf
		If id_event=$200
			lastReleased=key_internal_a
		EndIf
		; END OF TEMPORARY PATCH
    !movzx r10,byte [v_key_internal_a]
    !mov   rax,     1 
    !mov   rsi, r10   ;LKPR+(N&f)
    !mov   r8 , [p_key]
    !mov   r9 , r8    
    !add   r10, r9    
    !mov   r11, r10   
    !mov   r12, r11   
    !mov   r13, r12   
    !add   r10, $0000 
    !add   r11, $0100 
    !add   r12, $0200 
    !add   r13, $0300 
    !add   r8 , $0500; LKP +(N&f)
    !add   r9 , $0600;    R+(N&f)
    !mov rcx,[p.v_id_event]
    !cmp rcx,$102; O
    !je key_set_2
    !cmp rcx,$100; D
    !je key_set_1
    !cmp rcx,$104
    !je key_set_1
    !cmp rcx,$101; U
    !je key_set_0
    !cmp rcx,$105
    !je key_set_0
    !jmp key_set_end
    !key_set_0:;multi return selector
    !xor rax,rax
    !mov r11,r12
    !mov r8 ,r9 
    !key_set_1:
    !mov byte[r10], al;pokea $000
    !mov byte[r11],$01;pokea mux($100,$200)
    !mov byte[r13],$01;pokea $300
    !mov r10,[r8+$00]
    !mov r11,[r8+$08]
    !mov r12,[r8+$10]
    !mov r13,[r8+$18]
    !rol r10,8
    !rol r11,8
    !rol r12,8
    !rol r13,8
    !mov rax,r10
    !mov rbx,r11
    !mov rcx,r12
    !mov rdx,r13
    !and r10,-256
    !and r11,-256
    !and r12,-256
    !and r13,-256
    !and rax, 255
    !and rbx, 255
    !and rcx, 255
    !and rdx, 255
    !or  r10,rsi
    !or  r11,rax
    !or  r12,rbx
    !or  r13,rcx
    !mov [r8+$00],r10
    !mov [r8+$08],r11
    !mov [r8+$10],r12
    !mov [r8+$18],r13
    !key_set_2:
    !xor  rax,$1000101
    ProcedureReturn
    !key_set_end:
  EndIf
  !mov rcx,[p.v_id_event]
  !mov   r10,[p_key]
  !mov rax,$100020001;mouse M clic F
  !cmp rcx,$200
  !je key_mov_1
  !inc r10
  !mov rax,$100020101;mouse D clic 0
  !cmp rcx,$201
  !je key_mov_1
  !cmp rcx,$203
  !je key_mov_1
  !mov rax,$100020201;mouse U clic 0
  !cmp rcx,$202
  !je key_mov_0
  !inc r10
  !mov rax,$100020401;mouse D clic 1
  !cmp rcx,$204
  !je key_mov_1
  !cmp rcx,$206
  !je key_mov_1
  !mov rax,$100020501;mouse U clic 1
  !cmp rcx,$205
  !je key_mov_0
  !inc r10
  !mov rax,$100020701;mouse D clic 2
  !cmp rcx,$207
  !je key_mov_1
  !cmp rcx,$209
  !je key_mov_1
  !mov rax,$100020801;mouse U clic 3
  !cmp rcx,$208
  !je key_mov_0
  !inc r10
  !mov rax,$100020a01;mouse O clic 3
  !cmp rcx,$20A
  !je key_mov_1
  !jmp key_mov_end;skip to joy
  !key_mov_0:
  !xor al,al
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$00;pokea $000
  !mov byte[r12],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_1:
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$01;pokea $000
  !mov byte[r11],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_end:
  PokeQ(*key+$400,$FF00000100)
  !cmp qword[p.v_id_event],0
  !jne key_event_end
  For key_internal_a = 0 To 15
    ;temp=joySetCapture_(WindowID(0),key_internal_a,10,0):Debug temp:If temp=0:Continue:EndIf
    ;Debug #MAX_JOYSTICKOEMVXDNAME+#MAXPNAMELEN+#MAXPNAMELEN+2+2+(4*19)
    ;Delay(100)
    ;Debug joyConfigChanged_(0)
    ;Debug joyGetDevCaps_(key_internal_a,*key+$500,$194)
    ;temp=joyGetPos_(key_internal_a,*key+$500)
    ;Debug temp
    ;Debug joyReleaseCapture_(key_internal_a)
    ;ShowMemoryViewer(*key+$500,$200)
    
    !test_joy:
    joyGetDevCaps_(key_internal_a,*key+$800,$194)
    !mov rbx,0
    !cmp rax,$A5
    !je  key_clear_S
    !cmp rax,$06
    !je  key_clear_S
    !cmp rax,$0B
    !je  key_clear_S
    !cmp rax,$02
    !je  key_clear_S
    !cmp rax,$A7
    !je  key_clear_S
    !cmp rax,$00
    !jne key_clear_S
    !mov rbx,$55
    joyGetPosEx_(key_internal_a,*key+$400)
    !key_clear_S:
    !mov [v_key_internal_temp],rbx
    ;!mov rbx,rax;[v_key_internal_temp]
    !xor r10,r10;pre-clear
    !xor r11,r11
    !xor r12,r12
    !xor rcx,rcx
    !mov r15,[p_key];quick load
    !mov r14,r15
    !mov  ch,byte [v_key_internal_a]
    !add r15,$1000
    !add r14,$0400
    !add r15,rcx;5 variable done minimal opcode
    !cmp rax,$A5;#JOYERR_PARMS
    !je  key_clear_2
    !cmp rax,$06;#MMSYSERR_NODRIVER
    !je  key_clear_2
    !cmp rax,$0B;#MMSYSERR_INVALPARAM
    !je  key_clear_2
    !cmp rax,$02;#MMSYSERR_BADDEVICEID
    !je  key_clear_2
    !cmp rax,$A7;#JOYERR_UNPLUGGED
    !je  key_clear_1
    !cmp rax,$00;#JOYERR_NOERROR
    !jne key_clear_1
    !mov r10,rcx;control OK, update flag/16
    !mov r11,[r15+$f8];F1 = flag tick
    !bts r10,0
    !inc r11
    !mov [r15+$f0],r10;F0 = flag primaire 
    !mov [r15+$f8],r11;F1 = flag tick
    !or qword[p.v_id_event],$2000000
    !mov r10,[r14+$20];process data button unpacked
    !mov rcx,31
    !@@:
    !bt r10,rcx
    !setc [r15+rcx]
    !dec rcx
    !jns @b;unload
    !mov    r10w    ,[r14+$08] ; control X all axe
    !mov    r11w    ,[r14+$18] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$20], r10      ;
    !mov   [r15+$28], r11      ;
    !mov   [r15+$30], r12      ;
    !mov   [r15+$38], r13      ;
    !mov    r10w    ,[r14+$0C] ; control Y all axe
    !mov    r11w    ,[r14+$14] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$40], r10      ;
    !mov   [r15+$48], r11      ;
    !mov   [r15+$50], r12      ;
    !mov   [r15+$58], r13      ;
    !mov    r10w    ,[r14+$28] ; control Z all axe
    !mov    r11w    ,[r14+$10] ;
    !xor    r12     , r12      ;unused yet
    !xor    r13     , r13      ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ; TODO ?
    !movsx  r11     , r11w     ; TODO ?
    !movsx  r12     , r12w     ; TODO ?
    !movsx  r13     , r13w     ; TODO ?
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$60], r10      ;
    !mov   [r15+$68], r11      ;
    !mov   [r15+$70], r12      ;
    !mov   [r15+$78], r13      ;
    !jmp key_clear_end
    !key_clear_1:;post-clear
    !mov r10,$0000000000000000
    !mov r11,$ffffffffffffffff
    !mov r12,$fffffffffffffc00
    !key_clear_2:;ULTRA CLEAR in BATCH !!!! 
    !mov [r15+$00],r10;B8 = button byte     
    !mov [r15+$08],r10;B8 = button byte     
    !mov [r15+$10],r10;B8 = button byte     
    !mov [r15+$18],r10;B8 = button byte     
    !mov [r15+$f0],r10;F0 = flag primaire   
    !mov [r15+$f8],r11;F1 = flag tick       
    !mov [r15+$20],r12;X0 = stick           ;If eee=$113:eee=0:EndIf
    !mov [r15+$28],r12;X1 = stick           ;If eee=$3A0:eee=0:EndIf
    !mov [r15+$30],r12;X2 = stick           ;If eee=$3A2:eee=0:EndIf
    !mov [r15+$38],r12;X3 = stick           ;If eee=$3A5:eee=0:EndIf;button PM$F event
    !mov [r15+$40],r12;Y0 = stick           ;If eee=$3A7:eee=0:EndIf;button RM$F event
    !mov [r15+$48],r12;Y1 = stick           ;If eee=$0A5:eee=0:EndIf;INV KJOY
    !mov [r15+$50],r12;Y2 = stick           
    !mov [r15+$58],r12;Y3 = stick           
    !mov [r15+$60],r12;Z0 = stick           
    !mov [r15+$68],r12;Z1 = stick           
    !mov [r15+$70],r12;Z2 = stick           
    !mov [r15+$78],r12;Z3 = stick           
    !key_clear_end:
  Next
  !key_event_end:
  ProcedureReturn id_event
EndProcedure
Procedure KeyPushed(       a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyReleased(     a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )!1
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !xor al,$01
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyJustPushed(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$100)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$100,0)
  !add   rbx,$100
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyJustReleased(a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$200)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$200,0)
  !add   rbx,$200
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyEventSwitch(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$300)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$300,0)
  !add   rbx,$300
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure JoyPushed(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure JoyReleased(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  !xor al,1
  ProcedureReturn 
EndProcedure
Procedure JoyX(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1020
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyY(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1040
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyZ(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1060
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure IsJoy(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1000
  !movzx rax,byte[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyTick(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1008
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure keyClear(FORCE.q=0)
  !mov rax,[p.v_FORCE];load var
  !xorpd xmm0,xmm0
  !cmp rax,0;if force
  !mov rcx,[p_key];pipe
  !setne al;
  !add rcx,$400
  !add al,3
  !@@:;for 
  !sub rcx,$100
  !movdqa [rcx+$00],xmm0
  !movdqa [rcx+$10],xmm0
  !movdqa [rcx+$20],xmm0
  !movdqa [rcx+$30],xmm0
  !movdqa [rcx+$40],xmm0
  !movdqa [rcx+$50],xmm0
  !movdqa [rcx+$60],xmm0
  !movdqa [rcx+$70],xmm0
  !movdqa [rcx+$80],xmm0
  !movdqa [rcx+$90],xmm0
  !movdqa [rcx+$a0],xmm0
  !movdqa [rcx+$b0],xmm0
  !movdqa [rcx+$c0],xmm0
  !movdqa [rcx+$d0],xmm0
  !movdqa [rcx+$e0],xmm0
  !movdqa [rcx+$f0],xmm0
  !dec al;step
  !jnz @r;next
  !mov rax,1;return 1
  ProcedureReturn 
EndProcedure
Procedure KeyLastPushed(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$500
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyLastReleased(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$600
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
CompilerEndIf
CompilerIf #True ; Ludinam patch
	Global *key,key_internal_a.q,key_internal_temp.q:*key=AllocateMemory($2000)
Global key_joy_temp_deprected:key_joy_temp_deprected=InitJoystick()
Procedure KeyUpdate(id_event):key_internal_a=EventwParam()
	If (EventlParam()&$C0000000)<>$40000000
		; TEMPORARY PATCH FOR COMPATIBILITY
		If Not keyboardType 
			a=EventwParam()&$ff
			If PeekB(*AZERTY2QWERTY+a)
				key_internal_a=PeekB(*AZERTY2QWERTY+a)
			EndIf
		EndIf
		If id_event=$100
			lastPushed=key_internal_a
		EndIf
		If id_event=$200
			lastReleased=key_internal_a
		EndIf
		; END OF TEMPORARY PATCH
    !movzx r10,byte [v_key_internal_a]
    !mov   rax,     1 
    !mov   rsi, r10   ;LKPR+(N&f)
    !mov   r8 , [p_key]
    !mov   r9 , r8    
    !add   r10, r9    
    !mov   r11, r10   
    !mov   r12, r11   
    !mov   r13, r12   
    !add   r10, $0000 
    !add   r11, $0100 
    !add   r12, $0200 
    !add   r13, $0300 
    !add   r8 , $0500; LKP +(N&f)
    !add   r9 , $0600;    R+(N&f)
    !mov rcx,[p.v_id_event]
    !cmp rcx,$102; O
    !je key_set_2
    !cmp rcx,$100; D
    !je key_set_1
    !cmp rcx,$104
    !je key_set_1
    !cmp rcx,$101; U
    !je key_set_0
    !cmp rcx,$105
    !je key_set_0
    !jmp key_set_end
    !key_set_0:;multi return selector
    !xor rax,rax
    !mov r11,r12
    !mov r8 ,r9 
    !key_set_1:
    !mov byte[r10], al;pokea $000
    !mov byte[r11],$01;pokea mux($100,$200)
    !mov byte[r13],$01;pokea $300
    !mov r10,[r8+$00]
    !mov r11,[r8+$08]
    !mov r12,[r8+$10]
    !mov r13,[r8+$18]
    !rol r10,8
    !rol r11,8
    !rol r12,8
    !rol r13,8
    !mov rax,r10
    !mov rbx,r11
    !mov rcx,r12
    !mov rdx,r13
    !and r10,-256
    !and r11,-256
    !and r12,-256
    !and r13,-256
    !and rax, 255
    !and rbx, 255
    !and rcx, 255
    !and rdx, 255
    !or  r10,rsi
    !or  r11,rax
    !or  r12,rbx
    !or  r13,rcx
    !mov [r8+$00],r10
    !mov [r8+$08],r11
    !mov [r8+$10],r12
    !mov [r8+$18],r13
    !key_set_2:
    !xor  rax,$1000101
    ProcedureReturn
    !key_set_end:
  EndIf
  !mov rcx,[p.v_id_event]
  !mov   r10,[p_key]
  !mov rax,$100020001;mouse M clic F
  !cmp rcx,$200
  !je key_mov_1
  !inc r10
  !mov rax,$100020101;mouse D clic 0
  !cmp rcx,$201
  !je key_mov_1
  !cmp rcx,$203
  !je key_mov_1
  !mov rax,$100020201;mouse U clic 0
  !cmp rcx,$202
  !je key_mov_0
  !inc r10
  !mov rax,$100020401;mouse D clic 1
  !cmp rcx,$204
  !je key_mov_1
  !cmp rcx,$206
  !je key_mov_1
  !mov rax,$100020501;mouse U clic 1
  !cmp rcx,$205
  !je key_mov_0
  !inc r10
  !mov rax,$100020701;mouse D clic 2
  !cmp rcx,$207
  !je key_mov_1
  !cmp rcx,$209
  !je key_mov_1
  !mov rax,$100020801;mouse U clic 3
  !cmp rcx,$208
  !je key_mov_0
  !inc r10
  !mov rax,$100020a01;mouse O clic 3
  !cmp rcx,$20A
  !je key_mov_1
  !jmp key_mov_end;skip to joy
  !key_mov_0:
  !xor al,al
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$00;pokea $000
  !mov byte[r12],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_1:
  !mov   r11,r10
  !mov   r12,r11
  !mov   r13,r12
  !add   r10, $0000 
  !add   r11, $0100 
  !add   r12, $0200 
  !add   r13, $0300 
  !mov byte[r10],$01;pokea $000
  !mov byte[r11],$01;pokea mux($100,$200)
  !mov byte[r13],$01;pokea $300
  !shr rax,8
  ProcedureReturn
  !key_mov_end:
  PokeQ(*key+$400,$FF00000100)
  !cmp qword[p.v_id_event],0
  !jne key_event_end
  
  
  If key_joy_temp_deprected=0
    ProcedureReturn id_event
  EndIf
  temp=key_joy_temp_deprected-1
  
  For key_internal_a = 0 To temp
    If ExamineJoystick(key_internal_a)=0:Break:EndIf
    For a = 0 To 31
      PokeA(*key+$1000+(key_internal_a<<8)+a,JoystickButton(key_internal_a,a+1))
    Next
    
    PokeQ(*key+$10f0+(key_internal_a<<8),$101)
    PokeQ(*key+$10f8+(key_internal_a<<8),PeekQ(*key+$10f8+(key_internal_a<<8)))
    
    PokeQ(*key+$1020+(key_internal_a<<8),JoystickAxisX(key_internal_a,0,#PB_Relative))
    PokeQ(*key+$1028+(key_internal_a<<8),JoystickAxisX(key_internal_a,1,#PB_Relative))
    PokeQ(*key+$1030+(key_internal_a<<8),JoystickAxisX(key_internal_a,2,#PB_Relative))
    PokeQ(*key+$1038+(key_internal_a<<8),JoystickAxisX(key_internal_a,3,#PB_Relative))
    
    PokeQ(*key+$1040+(key_internal_a<<8),JoystickAxisY(key_internal_a,0,#PB_Relative))
    PokeQ(*key+$1048+(key_internal_a<<8),JoystickAxisY(key_internal_a,1,#PB_Relative))
    PokeQ(*key+$1050+(key_internal_a<<8),JoystickAxisY(key_internal_a,2,#PB_Relative))
    PokeQ(*key+$1058+(key_internal_a<<8),JoystickAxisY(key_internal_a,3,#PB_Relative))
    
    PokeQ(*key+$1060+(key_internal_a<<8),JoystickAxisZ(key_internal_a,0,#PB_Relative))
    PokeQ(*key+$1068+(key_internal_a<<8),JoystickAxisZ(key_internal_a,1,#PB_Relative))
    PokeQ(*key+$1070+(key_internal_a<<8),JoystickAxisZ(key_internal_a,2,#PB_Relative))
    PokeQ(*key+$1078+(key_internal_a<<8),JoystickAxisZ(key_internal_a,3,#PB_Relative))
    
    Continue
    
    ;temp=joySetCapture_(WindowID(0),key_internal_a,10,0):Debug temp:If temp=0:Continue:EndIf
    ;Debug #MAX_JOYSTICKOEMVXDNAME+#MAXPNAMELEN+#MAXPNAMELEN+2+2+(4*19)
    ;Delay(100)
    ;Debug joyConfigChanged_(0)
    ;Debug joyGetDevCaps_(key_internal_a,*key+$500,$194)
    ;temp=joyGetPos_(key_internal_a,*key+$500)
    ;Debug temp
    ;Debug joyReleaseCapture_(key_internal_a)
    ;ShowMemoryViewer(*key+$500,$200)
    
    !test_joy:
    !mov rax,0
    ;joyGetDevCaps_(key_internal_a,*key+$800,$194)
    !mov rbx,0
    !cmp rax,$A5
    !je  key_clear_S
    !cmp rax,$06
    !je  key_clear_S
    !cmp rax,$0B
    !je  key_clear_S
    !cmp rax,$02
    !je  key_clear_S
    !cmp rax,$A7
    !je  key_clear_S
    !cmp rax,$00
    !jne key_clear_S
    ;!mov rbx,$55
    ;joyGetPosEx_(key_internal_a,*key+$400)
    
    
    
    
    !key_clear_S:
    !mov [v_key_internal_temp],rbx
    ;!mov rbx,rax;[v_key_internal_temp]
    !xor r10,r10;pre-clear
    !xor r11,r11
    !xor r12,r12
    !xor rcx,rcx
    !mov r15,[p_key];quick load
    !mov r14,r15
    !mov  ch,byte [v_key_internal_a]
    !add r15,$1000
    !add r14,$0400
    !add r15,rcx;5 variable done minimal opcode
    !cmp rax,$A5;#JOYERR_PARMS
    !je  key_clear_2
    !cmp rax,$06;#MMSYSERR_NODRIVER
    !je  key_clear_2
    !cmp rax,$0B;#MMSYSERR_INVALPARAM
    !je  key_clear_2
    !cmp rax,$02;#MMSYSERR_BADDEVICEID
    !je  key_clear_2
    !cmp rax,$A7;#JOYERR_UNPLUGGED
    !je  key_clear_1
    !cmp rax,$00;#JOYERR_NOERROR
    !jne key_clear_1
    !mov r10,rcx;control OK, update flag/16
    !mov r11,[r15+$f8];F1 = flag tick
    !bts r10,0
    !inc r11
    !mov [r15+$f0],r10;F0 = flag primaire 
    !mov [r15+$f8],r11;F1 = flag tick
    !or qword[p.v_id_event],$2000000
    !mov r10,[r14+$20];process data button unpacked
    !mov rcx,31
    !@@:
    !bt r10,rcx
    !setc [r15+rcx]
    !dec rcx
    !jns @b;unload
    !mov    r10w    ,[r14+$08] ; control X all axe
    !mov    r11w    ,[r14+$18] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$20], r10      ;
    !mov   [r15+$28], r11      ;
    !mov   [r15+$30], r12      ;
    !mov   [r15+$38], r13      ;
    !mov    r10w    ,[r14+$0C] ; control Y all axe
    !mov    r11w    ,[r14+$14] ;
    !xor    r12,r12            ;unused yet
    !xor    r13,r13            ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ;
    !movsx  r11     , r11w     ;
    !movsx  r12     , r12w     ;
    !movsx  r13     , r13w     ;
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$40], r10      ;
    !mov   [r15+$48], r11      ;
    !mov   [r15+$50], r12      ;
    !mov   [r15+$58], r13      ;
    !mov    r10w    ,[r14+$28] ; control Z all axe
    !mov    r11w    ,[r14+$10] ;
    !xor    r12     , r12      ;unused yet
    !xor    r13     , r13      ;unused yet 2
    !add    r10     ,     $8000;
    !add    r11     ,     $8000;
    !add    r12     ,     $8000;
    !add    r13     ,     $8000;
    !movsx  r10     , r10w     ; TODO ?
    !movsx  r11     , r11w     ; TODO ?
    !movsx  r12     , r12w     ; TODO ?
    !movsx  r13     , r13w     ; TODO ?
    !sar    r10     ,         5; DONE
    !sar    r11     ,         5; DONE
    !sar    r12     ,         5; DONE
    !sar    r13     ,         5; DONE
    !mov   [r15+$60], r10      ;
    !mov   [r15+$68], r11      ;
    !mov   [r15+$70], r12      ;
    !mov   [r15+$78], r13      ;
    !jmp key_clear_end
    !key_clear_1:;post-clear
    !mov r10,$0000000000000000
    !mov r11,$ffffffffffffffff
    !mov r12,$fffffffffffffc00
    !key_clear_2:;ULTRA CLEAR in BATCH !!!! 
    !mov [r15+$00],r10;B8 = button byte     
    !mov [r15+$08],r10;B8 = button byte     
    !mov [r15+$10],r10;B8 = button byte     
    !mov [r15+$18],r10;B8 = button byte     
    !mov [r15+$f0],r10;F0 = flag primaire   
    !mov [r15+$f8],r11;F1 = flag tick       
    !mov [r15+$20],r12;X0 = stick           ;If eee=$113:eee=0:EndIf
    !mov [r15+$28],r12;X1 = stick           ;If eee=$3A0:eee=0:EndIf
    !mov [r15+$30],r12;X2 = stick           ;If eee=$3A2:eee=0:EndIf
    !mov [r15+$38],r12;X3 = stick           ;If eee=$3A5:eee=0:EndIf;button PM$F event
    !mov [r15+$40],r12;Y0 = stick           ;If eee=$3A7:eee=0:EndIf;button RM$F event
    !mov [r15+$48],r12;Y1 = stick           ;If eee=$0A5:eee=0:EndIf;INV KJOY
    !mov [r15+$50],r12;Y2 = stick           
    !mov [r15+$58],r12;Y3 = stick           
    !mov [r15+$60],r12;Z0 = stick           
    !mov [r15+$68],r12;Z1 = stick           
    !mov [r15+$70],r12;Z2 = stick           
    !mov [r15+$78],r12;Z3 = stick           
    !key_clear_end:
  Next
  !key_event_end:
  ProcedureReturn id_event
EndProcedure
Procedure KeyPushed(       a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyReleased(     a)
  !mov    bl,[p.v_a];PeekA(*key+( a&$ff)     )!1
  !movzx rbx,bl
  !add   rbx,[p_key]
  !mov    al,[rbx]
  !xor al,$01
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyJustPushed(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$100)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$100,0)
  !add   rbx,$100
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyJustReleased(a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$200)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$200,0)
  !add   rbx,$200
  !mov    al,[rbx]
  !movzx rax,al
;   !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure KeyJustSwitch(  a)
  !mov    bl,[p.v_a];r0=PeekA(*key+(a&$ff)+$300)
  !movzx rbx,bl
  !add   rbx,[p_key];PokeA(*key+(a&$ff)+$300,0)
  !add   rbx,$300
  !mov    al,[rbx]
  !movzx rax,al
  !mov byte[rbx],$00
  ProcedureReturn 
EndProcedure
Procedure JoyPushed(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure JoyReleased(index,button)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_button]
  !and    ax,$0f1f
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1000
  !mov    al,[rax]
  !movzx rax,al
  !xor al,1
  ProcedureReturn 
EndProcedure
Procedure JoyX(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1020
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyY(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1040
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyZ(index,sub=0)
  !mov    ah,[p.v_index]
  !mov    al,[p.v_sub]
  !and    ax,$0f03
  !shl    al,3 ;factor scale to PB
  !movzx rax,ax
  !add   rax,[p_key]
  !add   rax,$1060
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure IsJoy(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1000
  !movzx rax,byte[rax]
  ProcedureReturn 
EndProcedure
Procedure JoyTick(index)
  !mov    ah,[p.v_index]
  !and   rax,$0f00
  !add   rax,[p_key]
  !add   rax,$1008
  !mov   rax,[rax]
  ProcedureReturn 
EndProcedure
Procedure keyClear(FORCE.q=0)
  !mov rax,[p.v_FORCE];load var
  !xorpd xmm0,xmm0
  !cmp rax,0;if force
  !mov rcx,[p_key];pipe
  !setne al;
  !add rcx,$400
  !add al,3
  !@@:;for 
  !sub rcx,$100
  !movdqa [rcx+$00],xmm0
  !movdqa [rcx+$10],xmm0
  !movdqa [rcx+$20],xmm0
  !movdqa [rcx+$30],xmm0
  !movdqa [rcx+$40],xmm0
  !movdqa [rcx+$50],xmm0
  !movdqa [rcx+$60],xmm0
  !movdqa [rcx+$70],xmm0
  !movdqa [rcx+$80],xmm0
  !movdqa [rcx+$90],xmm0
  !movdqa [rcx+$a0],xmm0
  !movdqa [rcx+$b0],xmm0
  !movdqa [rcx+$c0],xmm0
  !movdqa [rcx+$d0],xmm0
  !movdqa [rcx+$e0],xmm0
  !movdqa [rcx+$f0],xmm0
  !dec al;step
  !jnz @r;next
  !mov rax,1;return 1
  ProcedureReturn 
EndProcedure
Procedure KeyLastPushed(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$500
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
Procedure KeyLastReleased(index=0)
  !mov    bl,[p.v_index]
  !movzx rbx,bl
  !add   rbx,[p_key]
  !add   rbx,$600
  !mov    al,[rbx]
  !movzx rax,al
  ProcedureReturn 
EndProcedure
CompilerEndIf
;------- Control structure
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
	#H2H_CONTROL_PARRY
	#H2H_CONTROL_DASH_RIGHT
	#H2H_CONTROL_DASH_LEFT
	#H2H_CONTROL_ACCEPT
	#H2H_CONTROL_CANCEL
	#H2H_CONTROL_EXIT
EndEnumeration

; #H2H_CONTROL_EMPTY=$ffff ; moved to localizedString.pb
Global Dim controlName.s(#H2H_CONTROL_EXIT)

controlName(#H2H_CONTROL_LEFT)			="Left"
controlName(#H2H_CONTROL_RIGHT)			="Right"
controlName(#H2H_CONTROL_UP)			="Up"
controlName(#H2H_CONTROL_DOWN)			="Down"
controlName(#H2H_CONTROL_ATTACK)		=#H2H_CONTROL_ATTACK_NAME
controlName(#H2H_CONTROL_SPECIAL)		=#H2H_CONTROL_SPECIAL_NAME
controlName(#H2H_CONTROL_HEAVY)			=#H2H_CONTROL_HEAVY_NAME
controlName(#H2H_CONTROL_NEUTRAL)		=#H2H_CONTROL_NEUTRAL_NAME
controlName(#H2H_CONTROL_ATTACK_SIDE)	=#H2H_CONTROL_ATTACK_SIDE_NAME
controlName(#H2H_CONTROL_ATTACK_BACK)	=#H2H_CONTROL_ATTACK_BACK_NAME
controlName(#H2H_CONTROL_ATTACK_UP)		=#H2H_CONTROL_ATTACK_UP_NAME
controlName(#H2H_CONTROL_ATTACK_DOWN)	=#H2H_CONTROL_ATTACK_DOWN_NAME
controlName(#H2H_CONTROL_DODGE)			=#H2H_CONTROL_DODGE_NAME
controlName(#H2H_CONTROL_JUMP)			=#H2H_CONTROL_JUMP_NAME
controlName(#H2H_CONTROL_PARRY)			=#H2H_CONTROL_PARRY_NAME
controlName(#H2H_CONTROL_DASH_RIGHT)	=#H2H_CONTROL_DASH_RIGHT_NAME
controlName(#H2H_CONTROL_DASH_LEFT)		=#H2H_CONTROL_DASH_LEFT_NAME
controlName(#H2H_CONTROL_ACCEPT)		=#H2H_CONTROL_ACCEPT_NAME
controlName(#H2H_CONTROL_CANCEL)		=#H2H_CONTROL_CANCEL_NAME
controlName(#H2H_CONTROL_EXIT)			=#H2H_CONTROL_EXIT_NAME

For i=0 To #H2H_CONTROL_EXIT
	Debug controlName(i)
Next

Global Dim controlNameLoc.s(#H2H_CONTROL_EXIT)
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
Structure control
; 	up.i
; 	down.i
; 	right.i
; 	left.i
; 	attack.i
; 	heavy.i
; 	special.i
; 	neutral.i
; 	attackSide.i
; 	attackBack.i
; 	attackUp.i
; 	attackDown.i
; 	jump.i
; 	dodge.i
; 	parry.i
; 	dashRight.i
; 	dashLeft.i
; 	accept.i
; 	cancel.i
; 	exit.i
	count.c ; counts the amount of set control
	value.c[#H2H_CONTROL_EXIT+1]
	*alternate.control
EndStructure	

Macro controlGet(c,what)
	c\value[what]
EndMacro

Procedure.i controlPressed(*c.control,what.q)
	Bool(KeyPushed(controlGet(*c,what)) Or (*c\alternate And controlPressed(*c\alternate,what)))
EndProcedure

Procedure controlSet(*c.control,what.q,v.c)
	c=controlGet(*c,what)
	If c=#H2H_CONTROL_EMPTY
		If v<>#H2H_CONTROL_EMPTY
			*c\count-1
		EndIf
	Else
		If c=#H2H_CONTROL_EMPTY
			*c\count+1
		EndIf
	EndIf
	*c\value[what]=v
EndProcedure

CompilerIf #False
Procedure.i controlEmpty(*c.control)
	If *c\up>=0
		Debug "has up"
	EndIf
	If *c\down>=0
		Debug "has down"
	EndIf
	If *c\right>=0
		Debug "has right"
	EndIf
	If *c\left>=0
		Debug "has left"
	EndIf
	If *c\attack>=0
		Debug "has attack"
	EndIf
	If *c\heavy>=0
		Debug "has heavy"
	EndIf
	If *c\special>=0
		Debug "has special"
	EndIf
	If *c\neutral>=0
		Debug "has neutral"
	EndIf
	If *c\attackSide>=0
		Debug "has attackSide"
	EndIf
	If *c\attackBack>=0
		Debug "has attackBack"
	EndIf
	If *c\attackUp>=0
		Debug "has attackUp"
	EndIf
	If *c\attackBack>=0
		Debug "has attackBack"
	EndIf
	If *c\attackDown>=0
		Debug "has attackDown"
	EndIf
	If *c\jump>=0
		Debug "has jump"
	EndIf
	If *c\dodge>=0
		Debug "has dodge"
	EndIf
	If *c\parry>=0
		Debug "has parry"
	EndIf
	If *c\dashRight>=0
		Debug "has dashRight"
	EndIf
	If *c\dashLeft>=0
		Debug "has dashLeft"
	EndIf
	If *c\cancel>=0
		Debug "has cancel"
	EndIf
	If *c\accept>=0
		Debug "has accept"
	EndIf
	If *c\exit>=0
		Debug "has exit"
	EndIf
	Bool(*c\up<0 And *c\down<0 And *c\right<0 And *c\left<0 And *c\attack<0 And *c\heavy<0 And *c\special<0 And *c\neutral<0 And *c\attackSide<0 And *c\attackBack<0 And *c\attackUp<0 And *c\attackDown<0 And *c\dodge<0 And *c\jump<0 And *c\parry<0 And *c\dashRight<0 And *c\dashLeft<0 And *c\accept<0 And *c\cancel<0 And *c\exit<0)
EndProcedure
CompilerElse
Macro controlEmptyFull(c)
; 	Bool(c\up<0 And c\down<0 And c\right<0 And c\left<0 And c\attack<0 And c\heavy<0 And c\special<0 And c\neutral<0 And c\attackSide<0 And c\attackBack<0 And c\attackUp<0 And c\attackDown<0 And c\dodge<0 And c\jump<0 And c\parry<0 And c\dashRight<0 And c\dashLeft<0 And c\accept<0 And c\cancel<0 And c\exit<0)
	Bool(Not c\count)
EndMacro
CompilerEndIf
Macro controlEmpty(c,what)
	Bool(controlGet(c,what)=#H2H_CONTROL_EMPTY)
EndMacro

Procedure controlJSONAdd(*parent,*c.control,what.c,joystick.i=#False)
	If Not controlEmpty(*c,what)
		If joystick
;  			Debug "saved "+DoubleQuote()what"+" has controller "+joystickButtonNameEN$(c\what)
 			addJSONString(*parent,controlName(what),controllerButtonNameEN$(controlGet(*c,what)),#True)
; 			addJSONInteger(p,DoubleQuote()what",c\what,#True)
		Else
 			Debug "saved "+controlName(what)+" has key "+keyToStringEN$(controlGet(*c,what))
			addJSONString(*parent,controlName(what),keyToStringEN$(controlGet(*c,what)),#True)
		EndIf
	EndIf
; 	addJSONInteger(p,DoubleQuote()what",c\what,#True)
EndProcedure

Procedure controlJSONGet(*parent,*c.control,what.c,joystick.i=#False)
	n.s=controlName(what)
	Debug "importing for "+n
	If GetJSONMember(*parent,n)
		If JSONType(GetJSONMember(*parent,n))=#PB_JSON_Number
			controlSet(*c,what,loadJSONInteger(*parent,n))
		Else
			If joystick
; 				Debug "set "+what+" to "+stringToAction(loadJSONString(*parent,n))
 				controlset(*c,what,stringToAction(loadJSONString(*parent,n),#True))
 			Else
				controlset(*c,what,stringToKey(loadJSONString(*parent,n),#True))
 			EndIf
		EndIf
	EndIf
EndProcedure

Structure debugCommand
	id.i
	name$
	Array key.i(0)	; uses #VK and not #PB_Key
	available.i		; if true, doesn't need debug to be enabled to be done
	inBattle.i		; if true can be done only when fightPhase is battle
EndStructure

Global Dim *allDebugCommands.debugCommand(0)

Procedure.i debugCommandCreate(newId.i,newName$,key1.i,key2.i=0,key3.i=0,key4.i=0,key5.i=0,key6.i=0)
	*dc.debugCommand=AllocateStructure(debugCommand)
	*dc\id=newId
	If *allDebugCommands(ArraySize(*allDebugCommands()))
		ReDim *allDebugCommands(ArraySize(*allDebugCommands())+1)
	EndIf
	*allDebugCommands(ArraySize(*allDebugCommands()))=*dc
	*dc\name$=newName$
; 	Debug "created command "+newName$
	count=-1
	If key1
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key1
	EndIf
	If key2
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key2
	EndIf
	If key3
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key3
	EndIf
	If key4
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key4
	EndIf
	If key5
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key5
	EndIf
	If key6
		count+1
		If ArraySize(*dc\key())<count
			ReDim *dc\key(count)
		EndIf
		*dc\key(count)=key6
	EndIf
	ProcedureReturn *dc
	; TODO remove same keys
EndProcedure

Enumeration 
	#H2H_DEBUG_COMMAND_SCREENSHOT
	#H2H_DEBUG_COMMAND_RESTART
	#H2H_DEBUG_COMMAND_HEAL
	#H2H_DEBUG_COMMAND_TOGGLE_FPS
	#H2H_DEBUG_COMMAND_TOGGLE_SLOMO
	#H2H_DEBUG_COMMAND_TOGGLE_DEBUG
	#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
	#H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE
	#H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE
	#H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE
	#H2H_DEBUG_COMMAND_PLAYER1_TOGGLE_AI
	#H2H_DEBUG_COMMAND_PLAYER2_TOGGLE_AI
	#H2H_DEBUG_COMMAND_PLAYER_SWAP
	#H2H_DEBUG_COMMAND_TOGGLE_HUD
EndEnumeration

Procedure.i debugCommandIsPressed(*dc.debugCommand)
	If *dc\available Or debugOption
; 		If *dc\id=#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
; 			Debug "checking "+*dc\name$
; 		EndIf
		If *dc\inBattle And currentMenuIndex<>#H2H_MENU_BATTLE And currentMenuIndex<>#H2H_MENU_RESTART
; 			If *dc\id=#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
; 				Debug Str(*dc\id)+" not in battle "+currentMenuIndex+" vs "+#H2H_MENU_BATTLE
; 			EndIf
			ProcedureReturn #False
		EndIf
		For i=0 To ArraySize(*dc\key())
; 			If *dc\id=#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
; 				Debug "check for "+keyToString$(*dc\key(i))
; 			EndIf
			If (i=ArraySize(*dc\key()) And Not KeyJustPushed(*dc\key(i))) Or Not KeyPushed(*dc\key(i))
				ProcedureReturn #False
			EndIf
; 			If *dc\id=#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE
; 				Debug "not pressed"
; 			EndIf
		Next
		Debug *dc\name$+" is pressed !"
		ProcedureReturn #True
	EndIf
	ProcedureReturn #False
EndProcedure

Global Dim debugCommandIdString.s(#H2H_DEBUG_COMMAND_TOGGLE_HUD)
debugCommandIdString(#H2H_DEBUG_COMMAND_SCREENSHOT)="screenShot"
debugCommandIdString(#H2H_DEBUG_COMMAND_RESTART)="restart"
debugCommandIdString(#H2H_DEBUG_COMMAND_HEAL)="heal"
debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_FPS)="toggleFPS"
debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_SLOMO)="toggleSlomo"
debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_DEBUG)="toggleDebug"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE)="player1ClassChange"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE)="player2ClassChange"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE)="player1StanceChange"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE)="player2StanceChange"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_TOGGLE_AI)="player1ToggleAI"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_TOGGLE_AI)="player2ToggleAI"
debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER_SWAP)="playerSwap"
debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_HUD)="toggleHUD"

Global NewMap debugCommandStringId()
For i=0 To ArraySize(debugCommandIdString())
	debugCommandStringId(debugCommandIdString(i))=i
Next
;------ Debug command list
CompilerIf #H2H_mode=#H2H_MODE_SAVE
debugCommandCreate(#H2H_DEBUG_COMMAND_SCREENSHOT,			debugCommandIdString(#H2H_DEBUG_COMMAND_SCREENSHOT),			#VK_SHIFT,#VK_F):*allDebugCommands(#H2H_DEBUG_COMMAND_SCREENSHOT)\available=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_RESTART,				debugCommandIdString(#H2H_DEBUG_COMMAND_RESTART),				#VK_SHIFT,#VK_R):*allDebugCommands(#H2H_DEBUG_COMMAND_RESTART)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_HEAL,					debugCommandIdString(#H2H_DEBUG_COMMAND_HEAL),					#VK_SHIFT,#VK_2):*allDebugCommands(#H2H_DEBUG_COMMAND_HEAL)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_TOGGLE_FPS,			debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_FPS),			#VK_SHIFT,#VK_0):*allDebugCommands(#H2H_DEBUG_COMMAND_TOGGLE_FPS)\available=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_TOGGLE_SLOMO,			debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_SLOMO),			#VK_SHIFT,#VK_5):*allDebugCommands(#H2H_DEBUG_COMMAND_TOGGLE_SLOMO)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_TOGGLE_DEBUG,			debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_DEBUG),			#VK_SHIFT,#VK_D)
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE,	debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE),	#VK_SHIFT,#VK_3):*allDebugCommands(#H2H_DEBUG_COMMAND_PLAYER1_CLASS_CHANGE)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE,	debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE),	#VK_SHIFT,#VK_4):*allDebugCommands(#H2H_DEBUG_COMMAND_PLAYER2_CLASS_CHANGE)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE,debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE),	#VK_CONTROL,#VK_3):*allDebugCommands(#H2H_DEBUG_COMMAND_PLAYER1_STANCE_CHANGE)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE,debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE),	#VK_CONTROL,#VK_4):*allDebugCommands(#H2H_DEBUG_COMMAND_PLAYER2_STANCE_CHANGE)\inBattle=#True
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER1_TOGGLE_AI,	debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER1_TOGGLE_AI),		#VK_SHIFT,#VK_B)
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER2_TOGGLE_AI,	debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER2_TOGGLE_AI),		#VK_SHIFT,#VK_V)
debugCommandCreate(#H2H_DEBUG_COMMAND_PLAYER_SWAP,			debugCommandIdString(#H2H_DEBUG_COMMAND_PLAYER_SWAP),			#VK_CONTROL,#VK_SHIFT,#VK_S)
debugCommandCreate(#H2H_DEBUG_COMMAND_TOGGLE_HUD,			debugCommandIdString(#H2H_DEBUG_COMMAND_TOGGLE_HUD),			#VK_CONTROL,#VK_SHIFT,#VK_H)

Procedure debugCommandJSONExport(*parent,*dc.debugCommand)
	*c=AddJSONElement(*parent)
	SetJSONObject(*c)
	addJSONString(*c,"name",*dc\name$)
	addJSONInteger(*c,"available",*dc\available,#True)
	addJSONInteger(*c,"inBattle",*dc\inBattle,#True)
	If ArraySize(*dc\key())>=0
		If ArraySize(*dc\key())=0
			addJSONString(*c,"key",keyToStringEN$(*dc\key(0)))
		Else
			*a=addJSONObject(*c,"key")
			SetJSONArray(*a)
			For i=0 To ArraySize(*dc\key())
				*aa=AddJSONElement(*a)
				SetJSONString(*aa,keyToStringEN$(*dc\key(i)))
			Next
		EndIf
	EndIf
EndProcedure

Procedure.i debugCommandJSONExportAll(*parent)
	*c=AddJSONMember(*parent,"debugCommands")
	SetJSONArray(*c)
	For i=0 To ArraySize(*allDebugCommands())
		debugCommandJSONExport(*c,*allDebugCommands(i))
	Next
	ProcedureReturn *c
EndProcedure
CompilerEndIf

CompilerIf #H2H_mode=#H2H_MODE_LOAD

Procedure debugCommandLoad(*k,i)
	If JSONType(GetJSONElement(*k,i))=#PB_JSON_String
		ProcedureReturn stringToKey(GetJSONString(GetJSONElement(*k,i)),#True)
	EndIf
	ProcedureReturn GetJSONInteger(GetJSONElement(*k,i))
EndProcedure

Procedure.i debugCommandJSONImport(*parent)
	Protected *key=GetJSONMember(*parent,"key")
	*a.debugCommand
	If JSONType(*key)=#PB_JSON_Array
		Select JSONArraySize(*key)
			Case 2
				*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),debugCommandLoad(*key,0),debugCommandLoad(*key,1))
			Case 3
				*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),debugCommandLoad(*key,0),debugCommandLoad(*key,1),debugCommandLoad(*key,2))
			Case 4
				*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),debugCommandLoad(*key,0),debugCommandLoad(*key,1),debugCommandLoad(*key,2),debugCommandLoad(*key,3))
			Case 5
				*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),debugCommandLoad(*key,0),debugCommandLoad(*key,1),debugCommandLoad(*key,2),debugCommandLoad(*key,3),debugCommandLoad(*key,4))
			Case 6
				*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),debugCommandLoad(*key,0),debugCommandLoad(*key,1),debugCommandLoad(*key,2),debugCommandLoad(*key,3),debugCommandLoad(*key,4),debugCommandLoad(*key,5))
		EndSelect
	Else
		*a=debugCommandCreate(debugCommandStringId(loadJSONString(*parent,"name")),loadJSONString(*parent,"name"),loadJSONInteger(*parent,"key"))
	EndIf
	*a\available=loadJSONInteger(*parent,"available")
	Debug *a\name$+" available "+*a\available
	*a\inBattle=loadJSONInteger(*parent,"inBattle")
EndProcedure

Procedure debugCommandJSONImportAll(*parent)
	*c=GetJSONMember(*parent,"debugCommands")
	size=JSONArraySize(*c)-1
	For i=0 To size
		debugCommandJSONImport(GetJSONElement(*c,i))
	Next
EndProcedure
CompilerEndIf

Procedure.i controlJSONExport(*c.control,*parent=0,joystick.i=#False)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	For i=0 To #H2H_CONTROL_EXIT
		controlJSONAdd(*parent,*c,i,joystick)
	Next
	If *c\alternate And Not controlEmptyFull(*c\alternate)
		Debug "alternate "+*c\alternate
		controlJSONExport(*c\alternate,addJSONObject(*parent,"alternate"),joystick)
	EndIf
	ProcedureReturn *parent
EndProcedure
	
Declare controlcreate()
Procedure.i controlJSONImport(*parent,*c.control=0,joystick.i=#False)
	If Not *c
		*c=controlcreate()
	EndIf
	If Not *parent
		ProcedureReturn *c
	EndIf
	For i=0 To #H2H_CONTROL_EXIT
		controlJSONGet(*parent,*c,i,joystick)
	Next
	*alternate=GetJSONMember(*parent,"alternate")
	If *alternate
		Debug "imported alternate !"
		*c\alternate=controlJSONImport(*alternate,0,joystick)
	EndIf
	ProcedureReturn *c
EndProcedure

Macro controlHasPressed(c,what)
	(keyPushed(controlGet(c,what)) Or (c\alternate And KeyPushed(controlGet(c\alternate,what))))
EndMacro
Macro controlHasReleased(c,what)
	(KeyReleased(controlGet(c,what)) Or (c\alternate And KeyReleased(controlGet(c\alternate,what))))
EndMacro
Macro controlJustPressed(c,what)
	(keyJustPushed(controlGet(c,what)) Or (c\alternate And keyJustPushed(controlget(c\alternate,what))))
EndMacro
Macro controlJustReleased(c,what)
	(keyJustReleased(controlGet(c,what)) Or (c\alternate And keyJustReleased(controlget(c\alternate,what))))
EndMacro

Procedure controlDefine(*c.control=0,setUp.c=#H2H_CONTROL_EMPTY,setDown.c=#H2H_CONTROL_EMPTY,setRight.c=#H2H_CONTROL_EMPTY,setLeft.c=#H2H_CONTROL_EMPTY,setAttack.c=#H2H_CONTROL_EMPTY,setHeavy.c=#H2H_CONTROL_EMPTY,setSpecial.c=#H2H_CONTROL_EMPTY)
	If Not *c
		*c=controlcreate()
	EndIf
	controlSet(*c,#H2H_CONTROL_LEFT,setLeft)
	controlSet(*c,#H2H_CONTROL_RIGHT,setRight)
	controlSet(*c,#H2H_CONTROL_UP,setUp)
	controlSet(*c,#H2H_CONTROL_DOWN,setDown)
	controlSet(*c,#H2H_CONTROL_ATTACK,setAttack)
	controlSet(*c,#H2H_CONTROL_HEAVY,setHeavy)
	controlSet(*c,#H2H_CONTROL_SPECIAL,setSpecial)
	ProcedureReturn *c
EndProcedure

Procedure controlClear(*c.control,recursive.i=#True,value.c=#H2H_CONTROL_EMPTY)
	For i=0 To #H2H_CONTROL_EXIT
		*c\value[i]=value
	Next
	*c\count=Bool(value<>#H2H_CONTROL_EMPTY)*#H2H_CONTROL_EXIT
	If *c\alternate And recursive
		controlClear(*c\alternate,recursive,value)
	EndIf
EndProcedure

Procedure controlPrint(*c.control,joystick.q=#False)
	empty=#True
	For i=0 To #H2H_CONTROL_EXIT
		If controlget(*c,i)
			empty=#False
		EndIf
	Next
	If Not empty
		Debug "CONTROL===="
		For i=0 To #H2H_CONTROL_EXIT
			If Not controlEmpty(*c,i)
				If joystick
					Debug controlName(i)+" "+controllerButtonNameEN$(controlget(*c,i))+" ("+controlGet(*c,i)+")"
				Else
					Debug controlName(i)+" "+keyToString(controlget(*c,i))+" ("+controlGet(*c,i)+")"
				EndIf
			EndIf
		Next
		If *c\alternate And Not controlEmptyFull(*c\alternate)
			Debug "ALTERNATE===="
			controlPrint(*c\alternate)
		EndIf
	EndIf
EndProcedure

; TODO rework allocation
Procedure.i controlcreate()
	*c.control=AllocateStructure(control)
; 	ClearStructure(*c,control)
	*c\alternate=AllocateStructure(control)
	ClearStructure(*c\alternate,control)
	controlClear(*c,#True)	
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


Global *menuControlKeys.control=controlDefine(0,#VK_UP,#VK_DOWN,#VK_RIGHT,#VK_LEFT)
controlSet(*menuControlKeys,#H2H_CONTROL_ACCEPT,#VK_RETURN)
controlSet(*menuControlKeys,#H2H_CONTROL_CANCEL,#VK_BACK)
controlSet(*menuControlKeys,#H2H_CONTROL_EXIT,#VK_ESCAPE)
; Global *menuControlKeys.control=controlSet(0,#VK_UP,#VK_DOWN,#VK_RIGHT,#VK_LEFT,#VK_RETURN,#VK_BACK,#VK_ESCAPE)
Global *menuControl.control=controlDefine()
controlClear(*menuControl,#True,0)
Procedure.i controlStateCreate()
	*cs=AllocateStructure(controlState)
	controlStateInit(*cs)
	ProcedureReturn *cs
EndProcedure

; Procedure checkMenuKey()
; 	*menuControl\accept=Bool(
; 	*menuControl\left=Bool(controlJustPressed(*menuControlKeys,attack)
; 	*menuControl\right=Bool(controlJustPressed(*menuControlKeys,attack)
; 	*menuControl\up=Bool(controlJustPressed(*menuControlKeys,attack)
; 	*menuControl\down=Bool(controlJustPressed(*menuControlKeys,attack)
; 	*menuControl\cancel=Bool(controlJustPressed(*menuControlKeys,attack)
; 	*menuControl\exit=Bool(controlJustPressed(*menuControlKeys,attack)
; EndProcedure

Macro menuAccept()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_ACCEPT)
EndMacro
Macro menuCancel()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_CANCEL)
EndMacro
Macro menuExit()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_EXIT)
EndMacro
Macro menuLeft()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_LEFT)
EndMacro
Macro menuRight()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_RIGHT)
EndMacro
Macro menuUp()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_UP)
EndMacro
Macro menuDown()
	controlJustPressed(*menuControlKeys,#H2H_CONTROL_DOWN)
EndMacro

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 6
; FirstLine = 754
; Folding = jEEA9-fAA++f9-9-
; EnableXP
; CPU = 1