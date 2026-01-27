;___________________________________________________________________________;
;                                                                           ;
;    ##############=             ################=   ##############=        ;
;  ####################=     ####################= ####################=    ;
;  ####=           ####=     ####=                 ####=           ####=    ;
;  ##=               ####= ####=        For        ##=               ####=  ;
;  ##=  Created      ####= ####=    Hand 2 Hand    ##=               ####=  ;
;  ##=  by             ##=   ####=                 ##=             ######=  ;
;  ##=  Nemerod        ##=   ##############=       ####################=    ;
;  ##=                 ##=       ##############=   ##############=          ;
;  ##=  in purebasic   ##=                 ####=   ####=                    ;
;  ##=  & assembler  ####=    adapted for    ####= ##=   not allowed        ;
;  ##=    FASM <3    ####=   FlameOfChange   ####= ##=  shard this code     ;
;  ####=           ####=                   ######= ##= without permission   ;
;  ####################=   ####################=   ##= of original creator  ;
;    ##############=       ################=       ##=                      ;
;___________________________________________________________________________;
;                                                                           ;
;==============================
;- DSP ALL FUNCTION REQUIRED
;==============================
;- DONT TOUCHE / PAS TOUCHE 
;{ l'assembleur est sensible, tout modification va ruiné les resulta attendu
DisableExplicit:DisableASM:

;=========================
;DSP variable global
Global *DSP_MAIN_RAM     ;DONT TOUCHE
Global *DSP_REGI         ;DONT TOUCHE
Global *DSP_WAVE_MIXE_OUT;DONT TOUCHE
Global *DSP_BUFF_OUT     ;lecture seulement si tu est fou, ne pas écrire car inutile
Global *DSP_INTERNAL_TASK;ne pas utilisé sans savoir se que tu fais surtout en ecriture, lecture possible (voir note discord)
Global *DSP_POOL_FLAME   ;TODO ? (low priority)
Global *DSP_TAIL_RAM     ;useless mais pas touche quant meme, future usage possible
Global DSP_HWAVE_MIX_OUT.q=  0; TU TOUCHE SE TRUC, tu casse le DSP et tes mort et le PC va te le faire comprendre
Global DSP_EEE.q=0;ne pas touché sans savoir se que tu fais, lire sera inutile pour toi, valeur interne au DSP
Global DSP_IRQ.q=0;essais de pas touché, tu peu lire sans probleme, c'est prévus pour

Global DSP_MASTER_VOLUME.q=$8000; lui tu peu lui faire un viol total sans peur en ecriture et lecture

;=========================
;{ long jump for dodge the assembler part without procedure error code
!DSP_AREA_FUNCTION_START:
!JMP DSP_AREA_FUNCTION_END;IMPORTANT ne pas touché l'assembleur, risque de plantage du programme ou systeme
!int3
!int3
!int3
!int3
!or dword[rsi+$45],$4F52454D;delimiteur de section signé pour control, pas touche, utilisé pour debug, se code n'est executé que en mode avancé via mes outil
!add [rax-$6FA6BD70],r10l
!or dword[rsi+$45],$4F52454D
!add [rax-$6FA6BD70],r10l

!x0  equ xmm0 ;INPUT DATA
!x1  equ xmm1 ;INPUT VOL
!x2  equ xmm2 ;ECHO0
!x3  equ xmm3 ;ECHO1
!x4  equ xmm4 ;CAPMIN
!x5  equ xmm5 ;CAPMAX
!x6  equ xmm6 ;
!x7  equ xmm7 ;
!x8  equ xmm8 ;$0FF0
!x9  equ xmm9 ;
!x10 equ xmm10;OUT
!x11 equ xmm11;OUT VOL
!x12 equ xmm12;$F000 MASK
!x13 equ xmm13;$0F00 (16=128)
!x14 equ xmm14;$00F0
!x15 equ xmm15;$000F

!nop; blank part, no effect, never executed, dont remove used for debug 
!nop
!nop
!nop
!nop
!nop
!nop
!nop

;Procedure buffer_audio_all(DSP_INTERNAL_UNUSED_1,DSP_INTERNAL_EVENT,DSP_INTERNAL_INSTANCE,DSP_INTERNAL_EVENT_INDEX);:DisableDebugger
;!mov [rsp+08],rcx ; DSP_INTERNAL_UNUSED_1
;!mov [rsp+10],rdx ; DSP_INTERNAL_EVENT
;!mov [rsp+18],r8  ; DSP_INTERNAL_INSTANCE
;!mov [rsp+20],r9  ; DSP_INTERNAL_EVENT_INDEX

;=========================
;call procedure, DONT PUT THIS CODE in procedure or sub function
DSP_AUDIO_WORKER:
;=========================
;If DSP_EEE<>$10200 And DSP_INTERNAL_EVENT=#MM_WOM_DONE
!cmp [v_DSP_EEE],$10200
!je DSP_LOOP_END
!cmp rdx,957 ; !cmp word [p.v_DSP_INTERNAL_EVENT],957
!jne DSP_LOOP_END

!bts qword[v_DSP_IRQ],61;flag start
!sub rsp,$18;shift
!pushfq  ;ROL FLG
!push r15;REF BUF
!push r14;CNT CSA
!push r13;MAX CSA
!push r12;CNT BUF
!push r11;RET CH1
!push r10;RET CH0
!push r9 ;REF CNT
!push r8 ;CNT SAM
!push rsp;VAL DAT
!push rbp;REF PIT
!push rbx;VAL TMP
!push rax;VAL TMP
!push rdi;REL PIT
!push rsi;REF TYP
!push rdx;RES API
!push rcx;VAL TMP

;!mov rdx,$ffaa55000055aaff;BY API
!mov rax,$ffaa55000055aaff;    TEST DEBUG    
!mov rbx,$ffaa55000055aaff;                  
!mov rcx,$ffaa55000055aaff;    DONT REMOVE   
!mov r8 ,$ffaa55000055aaff;     ANY LINE     
!mov r9 ,$ffaa55000055aaff;    HERE PLEASE   
!mov r10,$ffaa55000055aaff;    IT'S USED     
!mov r11,$ffaa55000055aaff;     FOR TESTING  
!mov r12,$ffaa55000055aaff;     THE STABILITY
!mov r15,$ffaa55000055aaff;     AND REGISTRE 
!mov r13,$ffaa55000055aaff;   USAGE BY       
!mov r14,$ffaa55000055aaff;ADVANCED DEBUG    
!mov rsi,$ffaa55000055aaff;     FOR ME       
!mov rdi,$ffaa55000055aaff;  THANKS NEMEROD  
!mov rbp,$ffaa55000055aaff;                  

;=========================
;define SSE registre for buffer
!mov r10,[v_DSP_MASTER_VOLUME]
!mov r11, $ffff;mask 16 bit
!mov r12, $7fff;capmin
!mov r13,-$8000;capmax
!xorpd  x0 ,x0 

!pinsrq x11,r10,0
!pinsrq x15,r11,0
!pinsrq x4 ,r12,0
!pinsrq x5 ,r13,0

!pinsrq x11,r10,1
!pinsrq x15,r11,1
!pinsrq x4 ,r12,1
!pinsrq x5 ,r13,1

!pmaxsd x11,x0 ;pre-math master volume
!pminsd x11,x15
!movdqa x14,x15;clone orignal mask
!movdqa x13,x15
!movdqa x12,x15
!pslldq x14,$02;define final mask
!pslldq x13,$04
!pslldq x12,$06
!movdqa x8 ,x13;sub mask
!orpd   x8 ,x14

;=========================
;*DSP_OUT=*DSP_BUFF_OUT+(DSP_R4 * $1000)
!mov r15,[p_DSP_REGI]
!mov r15,[r15+$40]
!shl r15,12
!add r15,[p_DSP_BUFF_OUT]

;=========================
;for COUNTER
!xor r12,r12;COUNTER_BUFFER = r12
!DSP_LOOP_BUFFER:;{
!xor r10,r10;audio channel 1 = r10
!xor r11,r11;audio channel 2 = r11
!xorpd x10,x10
!xorpd x0 ,x0 

;=========================
;for TASK = r8
!xor r8,r8; +$100
!DSP_LOOP_BUFFER_TASK:;{ HACK function FOR 
!mov r9,r8
!add r9,[p_DSP_INTERNAL_TASK]

;=========================
;load sample info
!mov rcx,[r9+$20];base    pointer address
!mov r14,[r9+$38];max     relatif address x16
!mov r13,[r9+$28];current relatif address x16
!mov rbp,[r9+$90];pitch $0000-$ffff
!add rbp,$8000;center on $8000
!movzx rbp,bp

;=========================
;testing if need loop
!cmp qword[r9+$18],0
!je  DSP_LOOP_BUFFER_TASK_START

!cmp r13,r14;13<=14
!jb DSP_LOOP_BUFFER_TASK_START;if loop
!mov rcx,qword[r9+$30];base sample location
!mov qword[r9+$20],rcx;then reset 
!mov r13,0;reset relatif location

;=========================
; favored part
!DSP_LOOP_BUFFER_TASK_START:
!mov rdi,r13;convert to real location (important here)

;=========================
;testing sample if need work
!cmp r13,r14
!jnb DSP_LOOP_BUFFER_TASK_END
!cmp rcx,0
!je DSP_LOOP_BUFFER_TASK_END
;=========================
;import sample from original buffer
!movdqa x1,[r9+$80];volume sample
!xor rax,rax;pre-clear
!xor rbx,rbx

;type sample
!mov rax,[r9+$10]

; 16 bit task type default and mono
!cmp rax,$00
!je DSP_LOOP_BUFFER_TYPE_00;stereo 
!cmp rax,$01
!je DSP_LOOP_BUFFER_TYPE_01;mono   

; 08 bit task type deprecated ?
!cmp rax,$02
!je DSP_LOOP_BUFFER_TYPE_10;stereo 
!cmp rax,$03
!je DSP_LOOP_BUFFER_TYPE_11;mono   

; 16 bit task type special effect
!cmp rax,$55
!je DSP_LOOP_BUFFER_TYPE_20;stereo 
!cmp rax,$56
!je DSP_LOOP_BUFFER_TYPE_21;stereo 

;=========================
;indefined type sample, skip
!jmp DSP_LOOP_BUFFER_TASK_END

;=========================
;{ 16 bit stereo
!DSP_LOOP_BUFFER_TYPE_00:
!shr   rdi,16
!and   rdi,-4
!PMOVSXWQ x0,dword[rcx+rdi]
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl rbp,3
!add r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;{ 16 bit mono
!DSP_LOOP_BUFFER_TYPE_01:
!shr rdi,16
!and rdi,-2
!movsx rax,word[rcx+rdi];only 16 bit
!movq x0,rax
!pshufd x0,x0,0
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl rbp,2
!add r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;{  8 bit stereo (deprecated ?)
!DSP_LOOP_BUFFER_TYPE_10:
!shr   rdi,16
!and   rdi,-2
!PMOVZXBQ x0,word[rcx+rdi]
!pslldq x0,1
!paddq  x0,x5
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl   rbp,2
!add   r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;{  8 bit mono (deprecated ?)
!DSP_LOOP_BUFFER_TYPE_11:
!shr   rdi,16
!and   rdi,-1
!movzx rax,byte[rcx+rdi]
!sub   rax,$80
!movq   x0,rax
!pshufd x0,x0,0
!pslldq x0,1
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl   rbp,1
!add   r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;{ 16 bit stereo corrupted channel LEFT<>RIGHT by PITCH
!DSP_LOOP_BUFFER_TYPE_20:
!shr   rdi,16
!and   rdi,-2
!PMOVSXWQ x0,dword[rcx+rdi]
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl rbp,3
!add r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;{  8 bit stereo corrupted channel LEFT<>RIGHT by PITCH
!DSP_LOOP_BUFFER_TYPE_21:
!shr rdi,16
!and rdi,-2
!PMOVZXBQ x0,word[rcx+rdi]
!pmuldq x0,x1;sample volume
!andpd  x0,x8
!psrldq x0,2
!paddq x10,x0;added to global
!shl rbp,2
!add r13,rbp
!mov qword[r9+$28],r13
!jmp DSP_LOOP_BUFFER_TASK_END
;} 

;=========================
;space for debug
!nop
!nop
!nop
!nop
!nop
!nop
!nop
!nop

!DSP_LOOP_BUFFER_TASK_END:

;=========================
;VU indicator
!cmp r12,0
!sete cl
!movzx rcx,cl
!shl rcx,9
!movdqa x1,[r9+$f0]
!xorpd  x3 ,x3
!pinsrq x2,rcx,0
!pinsrq x2,rcx,1
!psubq  x1,x2;DOWN SMOOTH
!pmaxsd x1,x3
!pmuldq x0,x0
!psrldq x0,$02
!pminsd x0,x15
!pmaxsd x0,x1;TOP
!movdqa [r9+$f0],x0
!xorpd x0,x0

;=========================
;next TASK
!add r8,$00100
!cmp r8,$10000
!jne DSP_LOOP_BUFFER_TASK;}

;=========================
;unextractor
!mov r10w,[r15+r12  ]
!mov r11w,[r15+r12+2]
!movsx r10,r10w;sign
!movsx r11,r11w
!pinsrq x0 ,r10,0;set word
!pinsrq x0 ,r11,1
!movdqa x1,x0
!mov r10,[p_DSP_REGI]
!movdqa x2,[r10+$10];volume echo mode 0
!movdqa x3,[r10+$20];volume echo mode 1

;=========================
;master volume (part 1) (multiplieur)
!pmuldq x10,x11

;=========================
;re-injector dual mode
!pmuldq x0,x2
!pmuldq x1,x3
!pshufd x0,x0,$E4
!pshufd x1,x1,$4E;swap
!paddq x10,x0
!paddq x10,x1

;=========================
;master volume (part 2) (limiteur)
!psrldq x10,2
!pmaxsd x10,x5 
!pminsd x10,x4 
!andpd  x10,x15

;=========================
;extract
!pextrq r10,x10,0
!pextrq r11,x10,1
!shl r11,16
!or  r10,r11
!mov [r15+r12  ],r10d

;=========================
;Next COUNTER
!add r12,$0004
!cmp r12,$1000
!jne DSP_LOOP_BUFFER;}

;=========================
;waveOutWrite_(HWAVE_MIX_OUT,*wave_mix_out+(DSP_R4 *$30),$30):DSP_R4+1:DSP_R4%nBuf
!mov r15,[p_DSP_REGI]
!mov r9,[r15+$40]
!imul rdx,r9,$30
!inc r9
!and r9,$7
!mov [r15+$40],r9
!add rdx,[p_DSP_WAVE_MIXE_OUT]
!mov rcx,[v_DSP_HWAVE_MIX_OUT]
!mov r8 ,$30
!bts qword[v_DSP_IRQ],62
!call waveOutWrite;RETURN RAX
!btr qword[v_DSP_IRQ],62

;=========================
;replace with all original value for system, DONT TOUCHE
!pop rcx
!pop rdx
!pop rsi
!pop rdi
!pop rax
!pop rbx
!pop rbp
!pop rsp;INVALIDATOR STACK
!pop r8 
!pop r9 
!pop r10
!pop r11
!pop r12
!pop r13
!pop r14
!pop r15
!popfq  
!add rsp,$18;unshift
!btr qword[v_DSP_IRQ],61;flag done
!DSP_LOOP_END:

!ret 
;= END PROCEDURE DSP_AUDIO_ALL

!nop
!nop
!nop
!nop
!nop
!nop
!nop
!nop

;=========================
;delimiteur de section signé pour control, pas touche, utilisé pour debug, se code n'est executé que en mode avancé via mes outil
!or dword[rsi+$45],$4F52454D
!add [rax-$6FA6BD70],r10l
!or dword[rsi+$45],$4F52454D
!add [rax-$6FA6BD70],r10l
!DSP_AREA_FUNCTION_END:
;} EndProcedure

;=========================
;- fonction DSP divert
Procedure DSP_H2H_LETTER_RE_IMPORT(image_id,first_letter=' ');SET CLIPBOARD H2H PICTURE ASCII to DATASECTION COMPRESSED, self end process after use
  Static *load,*mmm,temp,a,x,y,t$
  *load=AllocateMemory(8192):first_letter&$ff
  *mmm=*load+(first_letter*$20)
  temp=0
  StartDrawing(ImageOutput(image_id))
  For a = $00 To $ff
    GrabImage(0,a,((a-$20)*16),0,16,16)
    
    For x = 0 To 15
      For y = 0 To 15
        temp>>1
        temp|(Bool(Point(x+((a-$20)*16),y)=$ffffff)*$8000)
      Next
      PokeU(*mmm,temp):*mmm+2
    Next
  Next
  *mmm=*load
  t$+"DSP_LE:     :Data.q $"
  For a = 0 To 8191-8 Step 8
    t$+RSet(Hex(PeekQ(*mmm)),16,"0"):*mmm+8
    t$+",$"
  Next:t$+RSet(Hex(PeekQ(*mmm)),16,"0")
  SetClipboardText(t$)
  End
EndProcedure
Procedure DSP_H2H_LETTER(PL_X,PL_Y,PL_LETTER,PL_COLOR);DRAW LETTER H2H from datasection without loading picture, minimal version
  *PL_INDEX=?DSP_LE+((PL_LETTER&$ff)<<5)
  For PL_TX = 0 To 15
    PL_LETTER=PeekU(*PL_INDEX):*PL_INDEX+2
    For PL_TY = 0 To 15
      If PL_LETTER&1
        Box(PL_X+1+PL_TX,PL_Y+PL_TY,1,1,((PL_COLOR>>1)&$007f7f7f)|(PL_COLOR&$ff000000)):Box(PL_X+  PL_TX,PL_Y+PL_TY,1,1,PL_COLOR)
      EndIf:PL_LETTER>>1
    Next
  Next
EndProcedure

Procedure.q DSP_PMB(MX,MY,PX,PY,LX,LY);test zone position (BOX 0 ou 1 si dans la zone (voir plus bas)))
  !mov rax,[p.v_MX]
  !mov rbx,[p.v_MY]
  !sub rax,[p.v_PX]
  !sub rbx,[p.v_PY]
  !mov rcx,[p.v_LX]
  !mov rdx,[p.v_LY]
  !sub rcx,rax
  !sub rdx,rbx
  !dec rcx
  !dec rdx
  !or  rcx,rdx
  !or  rcx,rbx
  !or  rcx,rax
  !sar rcx,31
  !mov rax,rcx  ;0 ou 1
  !inc rax      ;0 ou 1
  ProcedureReturn 
EndProcedure
Procedure.q DSP_PMG(MM); roration couleur noir/blanc (voir a droit                                                                                   voir ici ==>)
  !xor rax,rax;oui j'ai dit roration, car rourquoi pas, je fais se que je reux, rerci
  !MOV rcx,[p.v_MM]
  !MOV al,cl
  !shl rax,8
  !MOV al,cl
  !shl rax,8
  !MOV al,cl
  ProcedureReturn
EndProcedure

;=========================
;- CORE aucun besoin de faire initsound
;  le DSP le fais lui meme au propre
Procedure DSP_INIT(ID=0,PICT=-1);lance le DSP, retourne 0 en cas d'erreur, sinon retourne 1 si aucun erreur, voir la variable DSP_IRQ pour le code d'erreur
  ;SECRET NOTE > si PICT est equal ou superieur a 0, une image sera crée qui pourra etre affiché pour voir le DSP, l'image sera crée tout seul
  ;              laisse la valeur a -1 pour ne pas utilisé la fonction caché qui est juste la pour du debug a la base
  Static a,wiw,wic,wie,wit,qqx=512,qqy=266,tmx,tmy,foc,done,temp,*block
  If DSP_HWAVE_MIX_OUT:ProcedureReturn 2:EndIf:If ID<1:ID=1:EndIf:ID-1
  CompilerIf Defined(poolCreate,#PB_Procedure)|Defined(poolInit,#PB_Procedure):DSP_IRQ=-2:ProcedureReturn 0:CompilerEndIf
  If PICT=>0
    CreateImage(PICT,1024,512,24):GetObject_(ImageID(PICT),$100,@PICT):*DSP_MAIN_RAM=PeekQ(@PICT+24)
  Else
    If *DSP_MAIN_RAM=0
      *DSP_MAIN_RAM=AllocateMemory($120000)
    Else
      PICT=*block
      !mov rax,[p_DSP_MAIN_RAM]
      !mov r8 ,rax
      !mov r9 ,rax
      !mov r10,rax
      !mov r11,rax
      !mov r12,rax
      !mov r13,rax
      !mov r14,rax
      !add r8 ,$000000
      !add r9 ,$007E00
      !add r10,$007E80
      !add r11,$008000
      !add r12,$010000
      !add r13,$020000
      !add r14,$120000
      !xor r15,r15
      
      !mov rax,[r9    ]
      !mov rbx,[r9+$08]
      !xor rax,r8 
      !xor rbx,r14
      
      !xor r8 ,[p.v_PICT             ]
      !xor r9 ,[  p_DSP_REGI         ]
      !xor r10,[  p_DSP_WAVE_MIXE_OUT]
      !xor r11,[  p_DSP_BUFF_OUT     ]
      !xor r12,[  p_DSP_INTERNAL_TASK]
      !xor r13,[  p_DSP_POOL_FLAME   ]
      !xor r14,[  p_DSP_TAIL_RAM     ]
      
      !or  r15,r8
      !or  r15,r9
      !or  r15,r10
      !or  r15,r11
      !or  r15,r12
      !or  r15,r13
      !or  r15,r14
      
      !or  r15,rax
      !or  r15,rbx
      
      !jz @f
      !mov [v_DSP_IRQ],-3
      ProcedureReturn 0
      !@@:
    EndIf
  EndIf
  ZwAllocateVirtualMemory_(0,0,0,0,0,0)
  ZwFreeVirtualMemory_(0,0,0,0)
  If *DSP_MAIN_RAM=0:DSP_IRQ=-3:ProcedureReturn 0:EndIf:*block=*DSP_MAIN_RAM
  *DSP_REGI         =*DSP_MAIN_RAM+$007E00;registre file and main internal variable
  *DSP_WAVE_MIXE_OUT=*DSP_MAIN_RAM+$007E80;api systeme allocation for buffer
  *DSP_BUFF_OUT     =*DSP_MAIN_RAM+$008000;buffer allocation Sereo 16 bit loop api
  *DSP_INTERNAL_TASK=*DSP_MAIN_RAM+$010000;256 task with 256 byte per task allocation
  *DSP_POOL_FLAME   =*DSP_MAIN_RAM+$020000;65536 index with 16 byte 
  *DSP_TAIL_RAM     =*DSP_MAIN_RAM+$120000;END_RAM
  CompilerIf #PB_Compiler_Thread=0 Or #PB_Compiler_Processor<>#PB_Processor_x64 Or #PB_Compiler_ExecutableFormat<>#PB_Compiler_Executable Or #PB_Compiler_OS<>#PB_OS_Windows:wiw=OpenWindow(#PB_Any,0,0,qqx,qqy,"WARNING",#PB_Window_BorderLess|#PB_Window_ScreenCentered):wic=CanvasGadget(#PB_Any,0,0,qqx,qqy):Repeat:wie=WindowEvent():Select wie:Case 0:wit+1:If foc&1:ResizeWindow(wiw,DesktopMouseX()-tmx,DesktopMouseY()-tmy,#PB_Ignore,#PB_Ignore):Delay(10):Else:If StartDrawing(CanvasOutput(wic)):Box(0,0,qqx,qqy,$ff000000):temp=4:r0=32:PokeS(*DSP_REGI,"    /!\ WARNING DEV CODE /!\    ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff00ffff):Next:temp+20:PokeS(*DSP_REGI," This software use custom audio ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"engine and it's adapted for run ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"with Enable Thread flag for best",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"  result, if you keep run with  ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"mono thread flag, the audio can ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"get drop and glitch in any time ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"and can get instabililty during ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"usage, Ask to FlameOfChange for ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"get version multi-thread enable.",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"                                ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"  Are you sure for keep run ?   ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)+8,temp,PeekA(*DSP_REGI+a),$ffffffff):Next:temp+16:PokeS(*DSP_REGI,"                                ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI,"                   -= NO =-     ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff00ff00!(Bool((done=1) And (wit&$10))*$0000ffff)):Next:PokeS(*DSP_REGI,"   -= YES! =-                   ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff00ff00!(Bool((done=0) And (wit&$10))*$0000ffff)):Next:temp+16:PokeS(*DSP_REGI,"                                ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff007fff):Next:temp+16:PokeS(*DSP_REGI," use arrow for select and enter ",32,#PB_Ascii):For a = 0 To 31:DSP_H2H_LETTER((a*16)  ,temp,PeekA(*DSP_REGI+a),$ff404040):Next:temp+16:DrawingMode($10):If DSP_PMB(WindowMouseX(wiw),WindowMouseY(wiw),qqx-24,0,24,24):For a = 3 To 18:Box((qqx-24)+a,a,2,2,$ffffffff):Box((qqx-03)-a,a,2,2,$ffffffff):Next:Else:For a = 3 To 18:Box((qqx-24)+a,a,2,2,$80ffffff):Box((qqx-03)-a,a,2,2,$80ffffff):Next:EndIf:For a = 0 To 15:Box(0,a,qqx,1,DSP_PMG((15-a)<<4)|$700000ff):Next:Box(    0,    16,qqx  ,     8,$700000ff):temp=0:For x = 1 To 22:For y = 1 To 22:Plot(x,y,(PeekA(?DSP_H2H_IC+temp)<<24)|$00ffffff):temp+1:Next:Next:Box(    0,    24,    1,qqy-24,$700000FF):Box(qqx-1,    24,    1,qqy-24,$700000FF):Box(    1,qqy- 1,qqx-2,     1,$700000FF):StopDrawing():EndIf:Delay(20):EndIf:Case $202:foc&$fffe:Case $201,$203:If DSP_PMB(WindowMouseX(wiw),WindowMouseY(wiw),qqx-24,  0,    24, 24):wie=$10:done=1:EndIf:If DSP_PMB(WindowMouseX(wiw),WindowMouseY(wiw),     0,  0,qqx-24, 24):foc|$01:tmx=DesktopMouseX()-WindowX(wiw,1):tmy=DesktopMouseY()-WindowY(wiw,1):EndIf:Case $100:Select EventwParam():Case $27:wit=$10:done=1:Case $25:wit=$10:done=0:Case $20,$0D:wie=#PB_Event_CloseWindow:Case $1B:wie=#PB_Event_CloseWindow:done=1:EndSelect:EndSelect:Until wie=#PB_Event_CloseWindow:FreeGadget(wic):CloseWindow(wiw):If done<>0:End -1:EndIf:CompilerEndIf
  PokeQ(*DSP_REGI+$00,*DSP_MAIN_RAM)
  PokeQ(*DSP_REGI+$08,*DSP_TAIL_RAM)
  PokeQ(*DSP_REGI+$10,0            );ECHO left  volume M0
  PokeQ(*DSP_REGI+$18,0            );ECHO right volume M0
  PokeQ(*DSP_REGI+$20,0            );ECHO left  volume M1
  PokeQ(*DSP_REGI+$28,0            );ECHO right volume M1
  PokeQ(*DSP_REGI+$30,0            );LAST FILE LOCATION ADDRESS
  PokeQ(*DSP_REGI+$38,0            );LAST FILE SIZE + TYPE + FLAG
  PokeQ(*DSP_REGI+$40,0            );spin forever :)
  PokeQ(*DSP_REGI+$48,-1           );LAST FILE INDEX FOUND
  PokeQ(*DSP_REGI+$50,0            );EQ hit
  PokeQ(*DSP_REGI+$58,0            );EQ hit
  PokeQ(*DSP_REGI+$60,0            );EQ boost
  PokeQ(*DSP_REGI+$68,0            );EQ boost
  PokeQ(*DSP_REGI+$70,0            );EQ low
  PokeQ(*DSP_REGI+$78,0            );EQ low
  If waveOutOpen_(@DSP_HWAVE_MIX_OUT,#WAVE_MAPPER+ID,?DSP_AU_LOF,?DSP_AUDIO_WORKER,$10,#WAVE_FORMAT_DIRECT|#CALLBACK_FUNCTION)<>#MMSYSERR_NOERROR:DSP_IRQ=-1:ProcedureReturn 0:EndIf
  waveOutSetVolume_(DSP_HWAVE_MIX_OUT,$ffffffff)
  For a = 0 To 7
    ;PokeQ(*DSP_WAVE_MIXE_OUT+ (a*$30)       ,*DSP_BUFF_OUT+(a*$1000))
    ;PokeQ(*DSP_WAVE_MIXE_OUT+ (a*$30)+8     ,                 $1000 )
    PokeQ(*DSP_WAVE_MIXE_OUT+ (a*$30)       ,*DSP_BUFF_OUT+(a*$1000))
    PokeQ(*DSP_WAVE_MIXE_OUT+ (a*$30)+8     ,                 $1000 )
    waveOutPrepareHeader_(DSP_HWAVE_MIX_OUT,*DSP_WAVE_MIXE_OUT+(a*$30),$30)
  Next
  For a = 0 To 3:waveOutWrite_        (DSP_HWAVE_MIX_OUT,*DSP_WAVE_MIXE_OUT+(a*$30),$30):Next
  !bts qword[v_DSP_IRQ],63
  ProcedureReturn 1
EndProcedure
Procedure DSP_STOP();coupe le DSP de façon propre et correct pour le systeme, fortement recommandé
  Static temp,a; WARNING : le faite de coupé le DSP ne liberde pas les son, car il peuvent etre reutilisé par la suite si un nouvelle INIT, donc pas besoin de reload les fichier
  If DSP_HWAVE_MIX_OUT:waveOutClose_(DSP_HWAVE_MIX_OUT)
    Repeat:DSP_EEE=$10200:Delay(10):temp=#WHDR_DONE
      For a = 0 To 7:temp&PeekA(*DSP_WAVE_MIXE_OUT+(a*$30)+$18):Next
    Until temp
    !btr qword[v_DSP_IRQ],63
    DSP_HWAVE_MIX_OUT=0:DSP_EEE=0
  EndIf
  ProcedureReturn 1
EndProcedure

;=========================
;- Principal
Procedure.q DSP_PlaySoundEx(*buffer_or_ID,size_buffer=0,pan_gauche=$8000,pan_droit=$8000,pitch=0,FLAG=$FF,type=0,loop=0);return 0 to 255 if free slot, return -1 if no free slot
  ;detail des argument
  ; *buffer     = doit etre un pointeur memoir sur le sample audio ou un ID
  ; size_buffer = la taille du buffer en octet brute, attention valeur faible peu avoir un arteface etrange avec le pitch si non zero surtout si le sample est mal fais de base, la valeur peu est mise a zero si le premier argument est un ID de 0 a 65535
  ; pan_gauche  = volume coté gauche, valeur $ffff sera volume maximal de la sorti, valeur negatif fera extreme saturation
  ; pan_droit   = volume coté droit, valeur superieur $ffff fera saturé le son si l'audio source et deja maximal
  ; pitch       = valeur pouvant allée en negatif pour ralentire ou en positif pour allée plus vite, une valeur a 0 fais la vitesse normal
  ; FLAG        = 
  ;   bit 01 = autorise la reutilisation si aucun slot est libre en normal via stop, 
  ; type        = voir list
  ;   $00 = Sereo 16 bit   signed > adapted for song or stereo effect if required
  ;   $01 = mono  16 bit   signed > recommended for normal effect with panL/panR
  ;   $02 = Sereo  8 bit unsigned > deprecated, use 16 bit mono if basic effect and use panL/panR for stereo
  ;   $03 = mono   8 bit unsigned > deprecated, use 16 bit mono
  ;   $55 = Sereo 16 bit   signed > corrupted pitch effect
  ;   $56 = Sereo  8 bit unsigned > corrupted pitch effect
  ;
  ; loop        = si non zero, le sample recommance depuis le debut une fois arrivé a la fin, auto re-active sa lecture si il etais deja a la fin
  
  ; valeur de retour sera une chiffre de 0 a 255 si le sample a etais ajouté a la liste de lecture, c'est le ID, sinon la valeur -1 sera donné si il y a plus de place en lecture
  
  Static a
  Static ra
  Static *temp
  Static *buffer
  Static *last_id
  *last_id=*buffer_or_ID
  If *buffer_or_ID<=$ffff
    ;TODO> loading from table of sample ID loaded
    !xorpd  x0,x0;ZERO
    !mov    r12,[p_DSP_POOL_FLAME];BASE
    !mov    rcx,[p.p_buffer_or_ID]
    !and    rcx,$0ffff
    !shl    rcx,4  ;16 BYTE
    !xor    rax,rax
    !movdqa x1,[r12+rcx];128 bit argument
    !ptest  x0,x1;IF equal
    !setnc   al
    !dec    rax
    !not    rax
    !pextrq r10 ,x1, 0;64 ADR
    !pextrd r11d,x1, 2;32 LEN WTFFFFFFFFF
    !pextrb r12 ,x1,12; 8 TYP
    !movsxd r11 ,r11d
    !movzx  r12 ,r12b
    !and r10,rax
    !and r11,rax
    !and r12,rax
    !mov [p.p_buffer_or_ID],r10
    !mov [p.v_size_buffer ],r11
    !mov [p.v_type        ],r12
  EndIf
  *buffer=*buffer_or_ID
  If pan_gauche>$ffff:pan_gauche=$ffff:EndIf:If pan_gauche<0:pan_gauche=0:EndIf:If *buffer     =0:ProcedureReturn -1:EndIf
  If pan_droit >$ffff:pan_droit =$ffff:EndIf:If pan_droit <0:pan_droit =0:EndIf:If size_buffer<=0:ProcedureReturn -1:EndIf
  For a = 0 To $ff
    *temp=*DSP_INTERNAL_TASK+(((a+ra)&$ff)<<8)
    If PeekQ(*temp+$20)=0;pas touche l'ordre des ligne
      PokeQ(*temp+$00,FLAG           );flag
      PokeQ(*temp+$10,type           );type
      PokeQ(*temp+$18,loop           );enable loop
      PokeQ(*temp+$90,pitch          );pitch o mo bitch, la brioche super bonne (remixe de la pub)
      PokeQ(*temp+$80,pan_gauche     );pan droit
      PokeQ(*temp+$88,pan_droit      );pan gauche
      PokeQ(*temp+$30,*buffer        );original pointer
      PokeQ(*temp+$38,size_buffer<<16);original size 
      PokeQ(*temp+$28,              0);current location
      PokeQ(*temp+$20,*buffer        );unlock play by original pointer
      PokeQ(*temp+$e0,*last_id+$10000);Last id 
      PokeQ(*temp+$e8,0              );clear
      ra+1;rotate table
      ProcedureReturn (a+ra-1)&$ff
    EndIf
  Next
  For a = 0 To $ff
    *temp=*DSP_INTERNAL_TASK+(((a+ra)&$ff)<<8)
    If (PeekQ(*temp+$28)=>PeekQ(*temp+$38)) And (PeekQ(*temp+$18)=0 Or (PeekQ(*temp+$00)&$1)>0);pas touche l'ordre des ligne
      PokeQ(*temp+$00,FLAG           );flag
      PokeQ(*temp+$10,type           );type
      PokeQ(*temp+$18,loop           );enable loop
      PokeQ(*temp+$90,pitch          );pitch o mo bitch, la brioche super bonne (remixe de la pub)
      PokeQ(*temp+$80,pan_gauche     );pan droit
      PokeQ(*temp+$88,pan_droit      );pan gauche
      PokeQ(*temp+$30,*buffer        );original pointer
      PokeQ(*temp+$38,size_buffer<<16);original size 
      PokeQ(*temp+$28,              0);current location
      PokeQ(*temp+$20,*buffer        );unlock play by original pointer
      PokeQ(*temp+$e0,*last_id+$10000);Last id 
      PokeQ(*temp+$e8,0              );clear
      ra+1;rotate table
      ProcedureReturn (a+ra-1)&$ff
    EndIf
  Next
  
  ProcedureReturn -1
EndProcedure
Procedure.q DSP_StopSoundEx(index.q=-2);stop un seul son via sont ID ou tous les son actuel en lecture si equal a -2
  !lea  rcx,[p_DSP_INTERNAL_TASK]
  !mov  rax,[p.v_index]
  !xor   r15,r15
  !cmp  qword[rcx],0
  !je   DSP_StopSoundEx_END;no ram
  !cmp  rax,-2
  !je   DSP_StopSoundEx_E2
  !cmp  rax,$ff
  !jnbe DSP_StopSoundEx_END
  !cmp  rax,$00
  !jnae DSP_StopSoundEx_END
  !xchg ah,al
  !add   rax,[rcx]
  !mov   qword[rax+$20],r15
  
  !DSP_StopSoundEx_END:
  ProcedureReturn 
  
  !DSP_StopSoundEx_E2:
  !mov   rax,[rcx]
  !times 256 mov qword[rax+(%*256)-224],r15
  ProcedureReturn 
EndProcedure
Procedure.q DSP_ReplayEx(index);rejous un son depuis le début sans changé les setting, attention, si le son et deja en cours de lecture, il sera forcé 
  !lea  rcx,[p_DSP_INTERNAL_TASK]
  !mov  rax,[p.v_index]
  !xor  r15,r15
  !cmp  qword[rcx],0
  !je   DSP_ReplayEx_END;no ram
  !test rax,-256
  !jnz DSP_ReplayEx_END
  !xchg  ah,al
  !add  rax,[rcx]
  !mov  rbx,qword[rax+$30]
  !mov  qword[rax+$20],rbx
  !mov  qword[rax+$28],r15
  !DSP_ReplayEx_END:
  ProcedureReturn 
EndProcedure
Procedure.q DSP_ResumEx(index);continu la lecture d'un sample qui aurai etais stoppé sans changé les setting
  !lea  rcx,[p_DSP_INTERNAL_TASK]
  !mov  rax,[p.v_index]
  !cmp  qword[rcx],0
  !je   DSP_ResumEx_END;no ram
  !cmp  rax,$ff
  !jnbe DSP_ResumEx_END
  !cmp  rax,$00
  !jnae DSP_ResumEx_END
  !xchg ah,al
  !add   rax,[rcx]
  !mov   rbx,qword[rax+$30]
  !mov   qword[rax+$20],rbx
  !DSP_ResumEx_END:
  ProcedureReturn 
EndProcedure
Procedure.q DSP_StateEx(index);récuper le statu du samble sur la piste INDEX, voir constant #DSP_STATUT_xxx pour detail des valeur
  !lea   rcx,[p_DSP_INTERNAL_TASK]
  !xor   rax,rax
  !cmp   qword[rcx],0
  !je    @f;no ram
  !and   rax,0
  !mov   ah,[p.v_index]
  !add   rax,[rcx]
  !and   rcx,0
  !cmp   qword[rax+$20],0;0>
  !setg  cl
  !cmp   qword[rax+$30],0;0>
  !setg  bl
  !mov   rdx,[rax+$28]
  !cmp   rdx,[rax+$38];=>
  !setge bh
  !shl   bl,1
  !shl   bh,2
  !or    cl,bl
  !or    cl,bh
  !shl   cl,3
  !mov   rax,$02FEFE000103FEFF
  !shr   rax,cl
  !movzx rax,al
  !@@:
  ProcedureReturn 
EndProcedure
Procedure.q DSP_GetSoundId(index);récuper l'ID d'un sample qui a etais donné dans play sound, retourne une valeur autre que -1 si l'ID etais depuis la table principal
  !lea  rcx,[p_DSP_INTERNAL_TASK]
  !xor rax,rax
  !cmp  qword[rcx],0
  !je @f
  !and   rax,0
  !mov   ah,[p.v_index]
  !add   rax,[rcx]
  !and   rcx,0
  !mov   rax,qword[rax+$E0]
  !sub   rax,$10000
  !test  rax,$ffffffffffff0000
  !setz  cl
  !dec   rcx
  !or    rax,rcx
  !@@:
  ProcedureReturn 
EndProcedure

;=========================
;- Pan
Procedure.q DSP_SetPan(index,pan_gauche=$8000,pan_droit=$8000);défini le nouveau pan gauche et droit d'un sample, utile si DSP_replay est utilisé ou pour avoir une modification temps réèl
  If index=>$00 And index<=$ff
    If pan_gauche>$ffff:pan_gauche=$ffff:EndIf:If pan_gauche<0:pan_gauche=0:EndIf:PokeQ(*DSP_INTERNAL_TASK+(index<<8)+$80,pan_gauche );pan droit
    If pan_droit >$ffff:pan_droit =$ffff:EndIf:If pan_droit <0:pan_droit =0:EndIf:PokeQ(*DSP_INTERNAL_TASK+(index<<8)+$88,pan_droit  );pan gauche
  EndIf
EndProcedure
Procedure.q DSP_GetPan(index,FLAG=0);récuper le pan du sample, flag 0 ou 1, pour gauche ou droit, si index a -1, retourne valeur par defaut
  If index=>$00 And index<=$ff
    ProcedureReturn PeekQ(*DSP_INTERNAL_TASK+(index<<8)+$80+((flag&1)<<3));pan droit
  EndIf
  ProcedureReturn $8000
EndProcedure

;=========================
;- Pitch
Procedure.q DSP_SetPitch(index=-2,pitch=0,mode=0);défini le nouveau pitch (negatif fera ralentire, positif fera allé plus vite, ZERO fera vitesse normal) (valeur de -32768 to +32767) (les valeur autre seron coupé en interne, aucun limite de valeur si tu veux faire passé d'autre valeur en note sans que cela affect le pitch)
  !mov     r15,[p_DSP_INTERNAL_TASK];DSP required started
  !mov     rcx,[p.v_index]
  !mov     r10,[p.v_pitch]
  !mov     r11,[p.v_mode ]
  
  !cmp     r15,  0;µcode
  !mov     rax,  0;
  !je      DSP_SetPitch_Over_0
  !add     r15,$90;pre-offset
  !cmp     rcx, -2;µcode
  
  !mov     r14,$ff;
  !mov     rbx,$00;
  !cmove   rax,r14;RAX loop $ff if index =-2
  !cmove   rcx,rbx;validate to first index if loop true
  
  !test    rcx,-256;skip if index not equal (0 to 255)
  !jnz DSP_SetPitch_Over_0
  
  !shl     rcx,8
  !add     r15,rcx
  
  !mov     r14, $7fff
  !mov     rbx,-$8000
  
  !DSP_SetPitch_Loop_base:
  !mov     r12,$0000
  
  !cmp     r11,$0000;set pitch
  !je DSP_SetPitch_00
  !cmp     r11,$0001;ADD
  !je DSP_SetPitch_01
  !cmp     r11,$0002;ADD BYPASS
  !je DSP_SetPitch_02
  
  !jmp DSP_SetPitch_SKIP
  
  !DSP_SetPitch_01:;ADD
  !bt qword[r15-$90],8;protect flag
  !jc DSP_SetPitch_SKIP
  
  !DSP_SetPitch_02:;ADD FORCE
  !mov    r12 ,[r15]
  !DSP_SetPitch_00:;SET
  !add    r12 , r10
  !cmp    r12 , r14;clamp
  !cmovg  r12 , r14
  !cmp    r12 , rbx
  !cmovl  r12 , rbx
  !mov   [r15], r12;SET/ADD
  
  !DSP_SetPitch_SKIP:
  !add   r15 ,$100
  !dec   rax
  !jns DSP_SetPitch_Loop_base
  
  !DSP_SetPitch_Over_0:
  !mov   rax ,r12
  ProcedureReturn 
EndProcedure
Procedure.q DSP_Getpitch(index);récuper le pitch du sample
  !mov    rax,[p_DSP_INTERNAL_TASK];DSP required started
  !cmp    rax,   0
  !je     DSP_Getpitch_Over_0
  
  !mov    rcx,[p.v_index]
  !test   rcx,-256
  !mov    rbx,   0
  !cmovnz rax, rbx
  !jnz    DSP_Getpitch_Over_0
  
  !shl    rcx,   8
  !add    rcx, rax
  
  !mov    rax,[rcx+$90]
  !DSP_Getpitch_Over_0:
  ProcedureReturn 
EndProcedure

;=========================
;- Flag
Procedure.q DSP_SetFlag(index,FLAG);défini les flag via des bit 0 ou 1 (voir DSP_PlaySoundEx pour la liste des flag)
  !mov    rax ,[p_DSP_INTERNAL_TASK];DSP required started
  !cmp    rax ,   0
  !je     DSP_SetFlag_Over_0
  
  !mov    rcx ,[p.v_index]
  !test   rcx ,-256
  !mov    rbx , $ff
  !cmovnz rax , rbx
  !jnz    DSP_SetFlag_Over_0
  
  !shl    rcx ,   8
  !add    rcx , rax
  
  !mov    rax ,[p.v_FLAG ]
  !mov   [rcx],rax
  !DSP_SetFlag_Over_0:
  ProcedureReturn 
EndProcedure
Procedure.q DSP_GetFlag(index);récuper les flag actuel du sample
  !mov    rax,[p_DSP_INTERNAL_TASK];DSP required started
  !cmp    rax,   0
  !je     DSP_GetFlag_Over_0
  
  !mov    rcx,[p.v_index]
  !test   rcx,-256
  !mov    rbx,$ff
  !cmovnz rax,rbx
  !jnz    DSP_GetFlag_Over_0
  
  !shl    rcx,   8
  !add    rcx, rax
  
  !mov    rax,[rcx]
  !DSP_GetFlag_Over_0:
  ProcedureReturn 
EndProcedure

;=========================
;- loop
Procedure.q DSP_SetLoop(index,enable_loop);permé de rejoué un son depuis le début sans changé les setting si le sample etais arrivé a la fin sans est stoppé, il sera rejoué automatiquement
  !mov    rax,[p_DSP_INTERNAL_TASK];DSP required started
  !cmp    rax,   0
  !je     DSP_SetLoop_Over_0
  
  !mov    rcx,[p.v_index]
  !test   rcx,-256
  !mov    rbx,$ff
  !cmovnz rax,rbx
  !jnz    DSP_SetLoop_Over_0
  
  !shl    rcx,   8
  !add    rcx, rax
  
  !mov    rax,[p.v_enable_loop]
  !mov   [rcx+$18],rax
  !DSP_SetLoop_Over_0:
  ProcedureReturn 
EndProcedure
Procedure.q DSP_GetLoop(index);savoir si le sample est en mode lecture loop ou non
  !mov    rax,[p_DSP_INTERNAL_TASK];DSP required started
  !cmp    rax,   0
  !je     DSP_GetLoop_Over_0
  
  !mov    rcx,[p.v_index]
  !test   rcx,-256
  !mov    rbx,$ff
  !cmovnz rax,rbx
  !jnz    DSP_GetLoop_Over_0
  
  !shl    rcx,   8
  !add    rcx, rax
  
  !mov    rax,[rcx+$18]
  !DSP_GetLoop_Over_0:
  ProcedureReturn 
EndProcedure

;=========================
;- global ECHO re-injector
;  attention des valeur trop grande peu provoqué un effect continu voir d'amplification
;  la duré de l'echo n'est pas vraiment reglable car elle est propre au buffer interne du DSP, mais il est possible de faire un pseudo effect de reverbe ou de spacialisation et simulation de salle sommair
;  mode 0 = l'echo se fais uniquement sur le meme coté, se qui est a gauche reste a gauche et se qui est a droit reste a droit
;  mode 1 = l'echo est passé sur le coté opposé, il est possible de combiné les 2 mode pour avoir un echo qui serai comme un echo qui partiré sur un coté ou l'autre pour disparaitre avec le temps
Procedure.q DSP_setEchoMode0(value_gauche=$0000,value_droit=$0000);active l'echo mode 0 via le control volume gauche et droit, une valeur a ZERO, coupe l'echo, une valeur a 65535, fais un echo maximal (cancer des oreille possible)
  If value_gauche>$ffff:value_gauche=$ffff:EndIf:If value_gauche<0:value_gauche=0:EndIf:PokeQ(*DSP_REGI+$10,value_gauche);padding 48 bit
  If value_droit >$ffff:value_droit =$ffff:EndIf:If value_droit <0:value_droit =0:EndIf:PokeQ(*DSP_REGI+$18,value_droit );quick SSE
  ProcedureReturn (value_gauche+value_droit)>>1;AVE ECHO center
EndProcedure
Procedure.q DSP_getEchoMode0(FLAG=0);récuper la valeur de la re-injection de l'ECHO gauche ou droit
  ProcedureReturn PeekA(*DSP_REGI+$10+((FLAG&1)<<3))
EndProcedure
Procedure.q DSP_setEchoMode1(value_gauche=$0000,value_droit=$0000);active l'echo mode 1 via le control volume gauche et droit, une valeur a ZERO, coupe l'echo, une valeur a 65535, fais un echo maximal (cancer des oreille possible)
  If value_gauche>$ffff:value_gauche=$ffff:EndIf:If value_gauche<0:value_gauche=0:EndIf:PokeQ(*DSP_REGI+$20,value_gauche);padding 48 bit
  If value_droit >$ffff:value_droit =$ffff:EndIf:If value_droit <0:value_droit =0:EndIf:PokeQ(*DSP_REGI+$28,value_droit );quick SSE
  ProcedureReturn (value_gauche+value_droit)>>1;AVE ECHO center
EndProcedure
Procedure.q DSP_getEchoMode1(FLAG=0);récuper la valeur de la re-injection de l'ECHO gauche ou droit
  ProcedureReturn PeekA(*DSP_REGI+$20+((FLAG&1)<<3))
EndProcedure

;=========================
;- Loading
Macro DSP_GetLast_OfLoadAddress();retourne une valeur non null si le dernier fichier a etais chargé sans erreur, sinon retourn 0
  PeekQ(*DSP_REGI+$30)
EndMacro
Macro DSP_GetLast_OfSizeAddress();retourne une valeur superieur a zero si le dernier fichier a etais correctement chargé, sinon 0
  (PeekQ(*DSP_REGI+$38)&$ffffffff)
EndMacro
Macro DSP_GetLast_OfTypeAddress();retourne une valeur sur 8bit du TYPE qui a etais reconnu depuis le fichier wav, argument TYPE dans le DSP_PlaySoundEx
  PeekA(*DSP_REGI+$3C)
EndMacro
Macro DSP_GetLast_IsWaveAddress();retourne une valeur non null si le fichier est un fichier en format WAVE original
  Bool(PeekA(*DSP_REGI+$3D)=1)
EndMacro
Macro DSP_GetLast_IndexPool();retourne une valeur non negatif si le dernier fichier a etais chargé dans la table des index principal
  PeekQ(*DSP_REGI+$48)
EndMacro
Procedure DSP_IsSampleByIndex(index);retourne 1 si le sample dans la table de lecture est une entré valide, sinon retour 0
  !xor    rax,rax
  !mov    r12,[p_DSP_POOL_FLAME];BASE
  !mov    rcx,[p.v_index]
  !and    rcx,$ffff
  !shl    rcx,4  ;16 BYTE
  !xorpd  x0 ,x0;ZERO
  !movdqa x1 ,[r12+rcx];128 bit argument
  !ptest  x0 ,x1;IF equal
  !setnc   al
  ProcedureReturn 
EndProcedure

Procedure.q DSP_loadWaveFile(file$);charge un fichier WAV en memoir, retourne une valeur non negatif si a etais correctement chargé
  ;si negatif, les valeur des fonction prefixe "DSP_GetLast_" seron tout a 0
  !mov     rax,[p_DSP_REGI];DSP required started
  !cmp     rax,0
  !je      DSP_loadWaveFile_Over_1
  !xorpd   x0,x0
  !movdqa [rax+$30],x0;CLEAR LAST all for return
  
  ReadFile(#PB_Any,file$);if TRUE from RAX
  !cmp rax,0
  !mov qword[l_dsp_au_blk],rax
  !je DSP_loadWaveFile_Over_1
  Lof(PeekQ(?DSP_AU_BLK+$00));if SIZE from RAX
  !cmp rax,0
  !mov [l_dsp_au_blk+$08],rax
  !je DSP_loadWaveFile_Over_0
  ReadData(PeekQ(?DSP_AU_BLK+$00),?DSP_AU_BLK+$80,$2C);if 2C minimum
  !cmp rax,$2C
  !jl DSP_loadWaveFile_Over_0
  
  !mov r10,$0000000046464952;magic wave file with size -8
  !mov r11,$20746D6645564157;sub wave header if true wave file
  !mov r12,$6174616400000000;sub wave data if true wave file
  !xor r10,[l_dsp_au_blk+$80];turned to 0 if match
  !xor r11,[l_dsp_au_blk+$88];
  !xor r12,[l_dsp_au_blk+$A0];
  !movsxd r10,r10d
  !shr r12,32
  !or r10,r11;merge for flag jump
  !or r10,r12
  !jnz DSP_loadWaveFile_Over_0
  
  ;real loading file start here
  !xor rax,rax
  !mov eax,[l_dsp_au_blk+$A8]
  !cmp eax,$00000000
  !jle DSP_loadWaveFile_Over_0
  !cmp eax,$03000000
  !jge DSP_loadWaveFile_Over_0
  
  !sub  rsp ,$38
  !mov  r10 ,$00101000
  !mov  r11 ,$00000204
  !mov [rsp +$20],r10
  !mov [rsp +$28],r11
  !lea  rdx ,[l_dsp_au_blk+$20];location  $20
  !lea  r9  ,[l_dsp_au_blk+$28];size real $28
  !xor  r8  ,r8
  !or   rcx ,-1
  !mov [r9 ],rax
  !mov [rdx],r8 
  !mov [l_dsp_au_blk+$38],rax;size original
  !call ZwAllocateVirtualMemory
  !add rsp,$38
  !cmp rax,0
  !jne DSP_loadWaveFile_Over_0
  
  ReadData(PeekQ(?DSP_AU_BLK+$00),PeekQ(?DSP_AU_BLK+$20),PeekQ(?DSP_AU_BLK+$38))
  !cmp rax,0
  !je DSP_loadWaveFile_Over_Z
  
  !xorpd  x0,x0;ZERO
  !mov    r12,[p_DSP_POOL_FLAME];BASE
  !mov    r11,[p_DSP_REGI];DSP required started
  !mov    r14,$ffff             ;COUNTER
  
  !@@:
  !mov    r13,r14;CNT to OFFSET
  !shl    r13,4  ;16 BYTE
  !add    r13,r12
  !movdqa x1,[r13];128 bit argument
  !ptest  x0,x1;IF equal
  !jc @f
  !dec r14;
  !jns @r;$ffff to $0000
  !movdqa [r11+$30],x0;CLEAR
  !mov    qword[r11+$48],-1;LAST INDEX
  !jmp DSP_loadWaveFile_Over_Z
  !@@:
  
  !mov  r10 ,[l_dsp_au_blk+$20]
  !mov  r8d ,[l_dsp_au_blk+$38]
  !mov   ax ,[l_dsp_au_blk+$94];true wave 1
  !mov   bx ,[l_dsp_au_blk+$96];channel 
  !mov   cx ,[l_dsp_au_blk+$A2];bits sample
  
  !cmp    ax, 1
  !setne  al
  !and    bx, 1
  !cmp    cx,16
  !setne  cl
  !shl    cl, 1
  !or     bl,cl
  
  !mov    [r11+$30],r10;location 64bit
  !mov    [r11+$38],r8d;size 32bit max
  !mov    [r11+$3C], bl;type
  !mov    [r11+$3D], al;format file
  !movdqa x0,[r11+$30]       ;ARG
  
  !mov    [r11+$48],r14;LAST INDEX
  !movdqa [r13],x0 ;128 bit argument
  
  ;end loading file and release with number ID from RAX befors
  CloseFile(PeekQ(?DSP_AU_BLK+$00))
  !mov r11,[p_DSP_REGI];DSP required started
  !mov rax,[r11+$48]
  ProcedureReturn 
  ;bypass error
  !DSP_loadWaveFile_Over_Z:
  !lea  rdx,[l_dsp_au_blk+$20]
  !lea  r8 ,[l_dsp_au_blk+$28]
  !mov  r9 ,$8000
  !or   rcx,-1
  !call ZwFreeVirtualMemory
  !DSP_loadWaveFile_Over_0:
  CloseFile(PeekQ(?DSP_AU_BLK+$00))
  !DSP_loadWaveFile_Over_1:
  ProcedureReturn -1
EndProcedure

;=========================
;- DSP public constant (sans effect si elle sont modifier ici, elle sont donné a titre d'information)
;default value 
#DSP_DEFAULT_VOLUME  = $8000
#DSP_DEFAULT_PAN     = $8000
#DSP_DEFAULT_PITCH   = $0000
#DSP_DEFAULT_FLAG    = $00ff
#DSP_DEFAULT_ECHO    = $0000
; sample FLAG
#DSP_FLAG_PROTECT_SAMPLE=$0001;va demandé au DSP d'utilisé d'autre piste de lecture en priorité, sinon elle sera utilisé que SI aucun place normal n'est dispo ET que le mode loop de la piste n'est pas activé ET que aucun lecture est actif
#DSP_FLAG_PROTECT_PITCH =$0100;protege le pitch des operation, notament si c'est une operation sur tout les pistge via l'index special -2, seul le FORCE ou SET permé de bypass la protection, tout les autre operation ne sont sans effect
; sample constant
#DSP_SAMPLE_STOP_ALL     = -2
#DSP_SAMPLE_NO_FREE_SLOT = -1
; sample constant pitch
#DSP_SAMPLE_PITCH_INDEX_ALL     = -2
#DSP_SAMPLE_PITCH_MODE_SET      =  0;re-défini le pitch
#DSP_SAMPLE_PITCH_MODE_ADD      =  1;n'edit pas les piste qui on le bit FLAG $100 définit sur TRUE (protection du pitch si c'est utilisé avec index a -2 biensur)
#DSP_SAMPLE_PITCH_MODE_ADD_FORCE=  2;bypass la protection du pitch, utile si tu veux redéfinir tous les pitch 
; statut sample
#DSP_STATUT_FREE      =   0; aucun sample
#DSP_STATUT_PLAYING   =   1; actuellement en lecture
#DSP_STATUT_WAITING   =   2; en attent, peu etre re-utilisé a nouveau via DSP_ReplayEx, le sample peu etre changé si le flag a etais validé
#DSP_STATUT_PAUSE     =   3; a etais mise en pause sur demande ou est arrivé a la fin sans loop activé
#DSP_STATUT_ERROR     = $FF; le DSP ou l'allocation memoir n'est pas valide
#DSP_STATUT_MISSING   = $FE; un code invalide a etais retourné, une corruption des donné a etais forcé et retourne un code invalide, attention, risque de plantage du programme, j'avais prevenu que le code est sensible
; internal type supported
#DSP_TYPE_DEFAULT     = $00;wave 16bit stereo
#DSP_TYPE_STEREO_16   = $00;wave 16bit stereo
#DSP_TYPE_MONO_16     = $01;wave 16bit mono
#DSP_TYPE_STEREO_8    = $02;wave  8bit stereo
#DSP_TYPE_MONO_8      = $03;wave  8bit mono
#DSP_TYPE_PTEREO_16   = $55;easter egg
#DSP_TYPE_PTEREO_8    = $56;easter egg
#DSP_TYPE_VOID        = -1;NOTHING PLAY
; list ERROR value from IRQ
#DSP_ERROR_NOTHING    =$0000000000000000;dsp not starter yet, all bit flag it's FALSE
#DSP_ERROR_BAD_START  =$ffffffffffffffff;invalide permission OR no devise available OR wrong value, fault by system
#DSP_ERROR_DUPLICATED =$fffffffffffffffe;can't start with duplicated code or invalide code
#DSP_ERROR_BAD_MEMORY =$fffffffffffffffd;invalide memory region OR corrupted

;=========================
;- list DSP_IRQ code d'erreur
Procedure.s DSP_RESULT_STRING_MSG():t$="DSP > "
  If DSP_IRQ=$ffffffffffffffff:t$="DSP > ERREUR > lancement du DSP en erreur, le systeme audio de l'ordinateur n'a pas donné une réponse favorable, autorisation OU périphéri invalide ou indisponible, les fonction du DSP n'onron aucun effect":ProcedureReturn t$:EndIf
  If DSP_IRQ=$fffffffffffffffe:t$="DSP > ERREUR > detection d'une declaration surcouche pouvent entré en confli avec le DSP, refus de lancement par prevention":ProcedureReturn t$:EndIf
  If DSP_IRQ=$fffffffffffffffd:t$="DSP > ERREUR > une allocation memoir n'est pas valide le DSP a etais stoppé par sécurité":ProcedureReturn t$:EndIf
  If DSP_IRQ=$0000000000000000:t$="DSP > INFO   > le DSP n'a pas etais lancé, utilisé DSP_INIT() et vire le initsound() de purebasic":ProcedureReturn t$:EndIf
  If DSP_IRQ&$8000000000000000:t$+"RUNNING  /":EndIf;63
  If DSP_IRQ&$4000000000000000:t$+"BUFFERING/":EndIf;62
  If DSP_IRQ&$2000000000000000:t$+"WORKING  /":EndIf;61
  If DSP_IRQ&$1000000000000000:t$+"LOADING  /":EndIf;60
  If DSP_IRQ&$0800000000000000:t$+"NONE     /":EndIf;59
  If DSP_IRQ&$0400000000000000:t$+"NONE     /":EndIf;58
  If DSP_IRQ&$0200000000000000:t$+"NONE     /":EndIf;57
  If DSP_IRQ&$0100000000000000:t$+"NONE     /":EndIf;56
  If DSP_IRQ&$0080000000000000:t$+"NONE     /":EndIf;55
  If DSP_IRQ&$0040000000000000:t$+"NONE     /":EndIf;54
  If DSP_IRQ&$0020000000000000:t$+"NONE     /":EndIf;53
  If DSP_IRQ&$0010000000000000:t$+"NONE     /":EndIf;52
  If DSP_IRQ&$0008000000000000:t$+"NONE     /":EndIf;51
  If DSP_IRQ&$0004000000000000:t$+"NONE     /":EndIf;50
  If DSP_IRQ&$0002000000000000:t$+"NONE     /":EndIf;49
  If DSP_IRQ&$0001000000000000:t$+"NONE     /":EndIf;48
  If DSP_IRQ&$0000800000000000:t$+"NONE     /":EndIf;47
  If DSP_IRQ&$0000400000000000:t$+"NONE     /":EndIf;46
  If DSP_IRQ&$0000200000000000:t$+"NONE     /":EndIf;45
  If DSP_IRQ&$0000100000000000:t$+"NONE     /":EndIf;44
  If DSP_IRQ&$0000080000000000:t$+"NONE     /":EndIf;43
  If DSP_IRQ&$0000040000000000:t$+"NONE     /":EndIf;42
  If DSP_IRQ&$0000020000000000:t$+"NONE     /":EndIf;41
  If DSP_IRQ&$0000010000000000:t$+"NONE     /":EndIf;40
  If DSP_IRQ&$0000008000000000:t$+"NONE     /":EndIf;39
  If DSP_IRQ&$0000004000000000:t$+"NONE     /":EndIf;38
  If DSP_IRQ&$0000002000000000:t$+"NONE     /":EndIf;37
  If DSP_IRQ&$0000001000000000:t$+"NONE     /":EndIf;36
  If DSP_IRQ&$0000000800000000:t$+"NONE     /":EndIf;35
  If DSP_IRQ&$0000000400000000:t$+"NONE     /":EndIf;34
  If DSP_IRQ&$0000000200000000:t$+"NONE     /":EndIf;33
  If DSP_IRQ&$0000000100000000:t$+"NONE     /":EndIf;32
  If DSP_IRQ&$0000000080000000:t$+"NONE     /":EndIf;31
  If DSP_IRQ&$0000000040000000:t$+"NONE     /":EndIf;30
  If DSP_IRQ&$0000000020000000:t$+"NONE     /":EndIf;29
  If DSP_IRQ&$0000000010000000:t$+"NONE     /":EndIf;28
  If DSP_IRQ&$0000000008000000:t$+"NONE     /":EndIf;27
  If DSP_IRQ&$0000000004000000:t$+"NONE     /":EndIf;26
  If DSP_IRQ&$0000000002000000:t$+"NONE     /":EndIf;25
  If DSP_IRQ&$0000000001000000:t$+"NONE     /":EndIf;24
  If DSP_IRQ&$0000000000800000:t$+"NONE     /":EndIf;23
  If DSP_IRQ&$0000000000400000:t$+"NONE     /":EndIf;22
  If DSP_IRQ&$0000000000200000:t$+"NONE     /":EndIf;21
  If DSP_IRQ&$0000000000100000:t$+"NONE     /":EndIf;20
  If DSP_IRQ&$0000000000080000:t$+"NONE     /":EndIf;19
  If DSP_IRQ&$0000000000040000:t$+"NONE     /":EndIf;18
  If DSP_IRQ&$0000000000020000:t$+"NONE     /":EndIf;17
  If DSP_IRQ&$0000000000010000:t$+"NONE     /":EndIf;16
  If DSP_IRQ&$0000000000008000:t$+"NONE     /":EndIf;15
  If DSP_IRQ&$0000000000004000:t$+"NONE     /":EndIf;14
  If DSP_IRQ&$0000000000002000:t$+"NONE     /":EndIf;13
  If DSP_IRQ&$0000000000001000:t$+"NONE     /":EndIf;12
  If DSP_IRQ&$0000000000000800:t$+"NONE     /":EndIf;11
  If DSP_IRQ&$0000000000000400:t$+"NONE     /":EndIf;10
  If DSP_IRQ&$0000000000000200:t$+"NONE     /":EndIf;09
  If DSP_IRQ&$0000000000000100:t$+"NONE     /":EndIf;08
  If DSP_IRQ&$0000000000000080:t$+"NONE     /":EndIf;07
  If DSP_IRQ&$0000000000000040:t$+"NONE     /":EndIf;06
  If DSP_IRQ&$0000000000000020:t$+"NONE     /":EndIf;05
  If DSP_IRQ&$0000000000000010:t$+"NONE     /":EndIf;04
  If DSP_IRQ&$0000000000000008:t$+"NONE     /":EndIf;03
  If DSP_IRQ&$0000000000000004:t$+"NONE     /":EndIf;02
  If DSP_IRQ&$0000000000000002:t$+"NONE     /":EndIf;01
  If DSP_IRQ&$0000000000000001:t$+"NONE     /":EndIf;00
  ProcedureReturn t$+"NO_MORE"
EndProcedure

;=========================
;- FIN des fonction principal du DSP
; list des fonction bonus
Procedure.q DSP_DRAW_MIXER_CHANNEL(ID,dx,dy):ID&$ff;affiche une tranche de la piste en image, requise une surface de dessin actice via startdrawing, le mode de traitement de l'image et les couleur est modifier
  DrawingMode(#PB_2DDrawing_AllChannels):Box(dx   ,dy    ,64,512,$FF524541)
  ;DrawingMode(#PB_2DDrawing_AllChannels):Box(dx   ,dy    ,64,512,(pmr((ID<<6)+tin)>>1)&$7f7f7f)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx   ,dy    ,01,512,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx   ,dy    ,64,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+01,dy+001,01,510,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+01,dy+001,62,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+63,dy    ,01,512,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx   ,dy+511,64,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+62,dy+001,01,510,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+01,dy+510,62,001,$40000000)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+31,dy+015,01,244,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+28,dy+258,04,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+28,dy+015,01,244,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+28,dy+015,04,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+29,dy+016,02,242,$ff000000)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+51,dy+015,01,244,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+48,dy+258,04,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+48,dy+015,01,244,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+48,dy+015,04,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+49,dy+016,02,242,$FF000000)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+04,dy+271,55,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+05,dy+272,55,001,$40FFFFFF)
  
  dvr=241-((PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$80)*241)>>16)&$ff;((pmo((ID<<6)+$000+tin)+128)*241)>>08;Random(241)
  dvl=241-((PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$88)*241)>>16)&$ff;((pmo((ID<<6)+$020+tin)+128)*241)>>08;Random(241)
  
  dur=Sqr(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$f0)):dur=16-(dur>>2);((pmo((ID<<6)+$000+tin)+128)*241)>>12;Random(16)
  dul=Sqr(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$f8)):dul=16-(dul>>2);((pmo((ID<<6)+$020+tin)+128)*241)>>12;Random(16)
  
  dmr=(Bool(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$20)>0)*$2000ff00)
  dmr|(Bool(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$20)>0 And PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$28)=>PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$38))*$200000ff)
  
  dml=(Bool(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$18))*$20ffff00)
  dp0=120-(PeekQ(*DSP_INTERNAL_TASK+(ID<<8)+$90)>>8);Random(255)
  
  ;Box(256,0,dur>>5,8,$ff00ff00)
  ;Box(256,0,dul>>5,8,$ff00ff00)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend)
  For da = 0 To 4
    Box(dx+da+37,dy+dvr+da+007,01,21,$5f000000)
    Box(dx+da+57,dy+dvl+da+007,01,21,$5f000000)
    Box(dx+da+24,dy+dvr+da+028,14,01,$5f000000)
    Box(dx+da+44,dy+dvl+da+028,14,01,$5f000000)
  Next
  For da = 0 To 15
    Box(dx+09,dy+9+(da<<4),4,15,PeekL(?DSP_VU_LED+(da<<2))&($ffffffff!(Bool(da<dur)*$00D4E1DE)))
    Box(dx+14,dy+9+(da<<4),4,15,PeekL(?DSP_VU_LED+(da<<2))&($ffffffff!(Bool(da<dul)*$00D4E1DE)))
  Next
  For da = 0 To 21
    Box(dx+23,dy+dvr+da+006,14,1,PeekL(?DSP_VU_CUR+(da<<2))&$ffffffff)
    Box(dx+43,dy+dvl+da+006,14,1,PeekL(?DSP_VU_CUR+(da<<2))&$ffffffff)
  Next
  
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+31,dy+276,01,015,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+05,dy+290,27,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+05,dy+276,01,015,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+05,dy+276,27,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+06,dy+277,25,013,$ff000000)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+58,dy+276,01,015,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+32,dy+290,27,001,$40FFFFFF)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+32,dy+276,01,015,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+32,dy+276,27,001,$40000000)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+33,dy+277,25,013,$ff000000)
  
  For da = 0 To 2
    If dmr=0
      Box(dx+da+08,dy+da+290,23,01,$4f000000)
      Box(dx+da+31,dy+da+279,01,12,$4f000000)
    EndIf
    If dml=0
      Box(dx+da+35,dy+da+290,23,01,$4f000000)
      Box(dx+da+58,dy+da+279,01,12,$4f000000)
    EndIf
  Next
  
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+07,dy+277,23,013,$8064787F|dmr)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+06,dy+278,25,011,$8064787F|dmr)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+34,dy+277,23,013,$8064787F|dml)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+33,dy+278,25,011,$8064787F|dml)
  
  DrawingMode(#PB_2DDrawing_AlphaBlend )
  For da = 0 To 3:Box(dx+da+17,dy+da+280,1,7-(da<<1),$a0ffffff):Next
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+43,dy+280,5,1,$a0ffffff):Box(dx+43,dy+286,5,1,$a0ffffff):Box(dx+48,dy+281,1,5,$a0ffffff):Box(dx+42,dy+285,1,1,$a0ffffff)
  DrawingMode(#PB_2DDrawing_AlphaBlend ):Box(dx+42,dy+282,1,1,$a0ffffff):Box(dx+41,dy+283,3,1,$a0ffffff):Box(dx+40,dy+284,5,1,$a0ffffff)
  
  db = 0
  DrawingMode(#PB_2DDrawing_AlphaBlend|#PB_2DDrawing_Gradient)
  BackColor($FF626262)
  FrontColor($ff000000)
  CircularGradient(dx+26,dy+(db*60)+318,20)
  Circle(dx+31,dy+(db*60)+323,14)
  DrawingMode(#PB_2DDrawing_AlphaBlend|#PB_2DDrawing_Gradient)
  BackColor($FF002AFD)
  FrontColor($ff000000)
  CircularGradient(dx+29,dy+(db*60)+321,17)
  Circle(dx+31,dy+(db*60)+323,8)
  DrawingMode(#PB_2DDrawing_AlphaBlend )
  For da = 4 To 32
    df0.d=Radian(da*10)
    LineXY(dx+(Sin(df0)*22)+31,dy+(db*60)+(Cos(df0)*22)+323,dx+(Sin(df0)*24)+31,dy+(db*60)+(Cos(df0)*24)+323,$c0ffffff)
  Next
  df0.d=Radian((dp0*1.130380859375)+48)
  LineXY(dx              +31,dy              +(db*60)+323,dx+(Sin(df0)*08)+31,dy+(Cos(df0)*08)+(db*60)+323,$80000000)
  LineXY(dx+(Sin(df0)*09)+31,dy+(Cos(df0)*09)+(db*60)+323,dx+(Sin(df0)*13)+31,dy+(Cos(df0)*13)+(db*60)+323,$ffffffff)
  
  
  dtr=DSP_StateEx(ID)
  For da = 0 To 7
    Box(dx+ 9,dy+351+(da<<3),5,3,$ff0000ff!(Bool(dtr&($80>>da))*$0000ffff))
    Box(dx+10,dy+350+(da<<3),3,5,$ff0000ff!(Bool(dtr&($80>>da))*$0000ffff))
  Next
  
  
  DrawingMode(#PB_2DDrawing_AlphaBlend )
  
EndProcedure
Procedure.q DSP_PITCH_MAP_FtU(float_percentage100.d=100):ProcedureReturn ((float_percentage100 /100  )-1)*$7fff:EndProcedure;converti une valeur en pourcentage de 0 a 200% en valeur pour le pitch du DSP en valeur entier
Procedure.d DSP_PITCH_MAP_UtF(PitchDSPToPercentage.q=0 ):ProcedureReturn ((PitchDSPToPercentage/$7fff)+1)*  100:EndProcedure;converti une valeur de pitch du DSP en valeur de pourcentage de 0 a 200%

;=========================
;- DATASECTION du DSP
;  ne pas touché si aucun idée de se que tu fais sous penne de cassé le DSP
DataSection
  DSP_AU_BLK: :Data.q 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  DSP_BG_ARG: :Data.q 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  DSP_AU_LOF: :Data.a $01,$00,$02,$00,$44,$AC,$00,$00,$10,$B1,$02,$00,$04,$00,$10,$00,$00,$00
  DSP_VU_CUR: :Data.l $FF3A2E2B,$FF2F2522,$FF261E1B,$FF28201D,$FF2A221F,$FF2E2421,$FF302623,$FF332926,$FF372C28,$FF3A2E2B,$FFA58C84,$FFCFC2BE,$FF725B53,$FF775F58,$FF7A6159,$FF7F665E,$FF846961,$FF896D64,$FF8D7168,$FF94776D,$FF91746A,$FF82685F
  DSP_VU_LED: :Data.l $ff0000ff,$ff0088ff,$ff00ffff,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ff00ff00,$ffffff00
  DSP_VU_M:   :Data.l $FF000CFC,$FF000E7E,$FF002CFC,$FF001E7E,$FF004CFC,$FF002E7E,$FF006CFC,$FF003E7E,$FF008CFC,$FF004E7E,$FF00ACFC,$FF005E7E,$FF00CCFC,$FF006E7E,$FF00ECFC,$FF007E7E,$FF00FCFC,$FF007E76,$FF00FCDC,$FF007E66,$FF00FCBC,$FF007E56,$FF00FC9C,$FF007E46,$FF00FC7C,$FF007E36,$FF00FC5C,$FF007E26,$FF00FC3C,$FF007E16,$FF00FC1C,$FF007E06,$FF00FC00,$FF007E00,$FF04FC00,$FF027E00,$FF08FC00,$FF047E00,$FF0CFC00,$FF067E00,$FF10FC00,$FF087E00,$FF14FC00,$FF0A7E00,$FF18FC00,$FF0C7E00,$FF1CFC00,$FF0E7E00,$FF20FC00,$FF107E00,$FF24FC00,$FF127E00,$FF28FC00,$FF147E00,$FF2CFC00,$FF167E00,$FF30FC00,$FF187E00,$FF34FC00,$FF1A7E00,$FF38FC00,$FF1C7E00,$FF3CFC00,$FF1E7E00,$FF40FC00,$FF207E00,$FF44FC00,$FF227E00,$FF48FC00,$FF247E00,$FF4CFC00,$FF267E00,$FF50FC00,$FF287E00,$FF54FC00,$FF2A7E00,$FF58FC00,$FF2C7E00,$FF5CFC00,$FF2E7E00,$FF60FC00,$FF307E00,$FF64FC00,$FF327E00,$FF68FC00,$FF347E00,$FF6CFC00,$FF367E00,$FF70FC00,$FF387E00,$FF74FC00,$FF3A7E00,$FF78FC00,$FF3C7E00,$FF7CFC00,$FF3E7E00,$FF80FC00,$FF407E00,$FF84FC00,$FF427E00,$FF88FC00,$FF447E00,$FF8CFC00,$FF467E00,$FF90FC00,$FF487E00,$FF94FC00,$FF4A7E00,$FF98FC00,$FF4C7E00,$FF9CFC00,$FF4E7E00,$FFA0FC00,$FF507E00,$FFA4FC00,$FF527E00,$FFA8FC00,$FF547E00,$FFACFC00,$FF567E00,$FFB0FC00,$FF587E00,$FFB4FC00,$FF5A7E00,$FFB8FC00,$FF5C7E00,$FFBCFC00,$FF5E7E00
  DSP_LE:     :Data.q $0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$71FE201E00060002,$000200020002201E,$0000000000000000,$007E000000000000,$000000000070006E,$0070006E007E0000,$0000000000000000,$1830183000000000,$1830183018307FFE,$18307FFE18301830,$0000000000001830,$0DB000E000000000,$7FFE0DB00DB00DB0,$0DB00DB00DB00DB0,$0000000000000700,$380E000000000000,$038007000E001C06,$2038207000E001C0,$000000000000001C,$338C1E7800000000,$6186618661866186,$1C003C7076D8638C,$0000000033003600,$0000000000000000,$006E007E00000000,$0000000000000070,$0000000000000000,$0000000000000000,$18180FF000000000,$000000006006300C,$0000000000000000,$0000000000000000,$1818300C60060000,$0000000000000FF0,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0180000000000000,$1FF8018001800180,$0180018001800180,$0000000000000000,$0000000000000000,$74007C0070000000,$0000000000003800,$0000000000000000,$0180000000000000,$0180018001800180,$0100010001800180,$0000000000000000,$0000000000000000,$5000600000000000,$0000000000006000,$0000000000000000,$1800300060000000,$0180030006000C00,$00180030006000C0,$000000000000000C,$30180FE000000000,$600C600C600C2008,$10102008600C600C,$0000000000000FE0,$0000000000000000,$7FFC601840100000,$0000400020004000,$0000000000000000,$0300060000000000,$0180018001800180,$00F0018001800180,$0000000000000070,$0010000000000000,$000C000C00040004,$027C000C010C000C,$0000000000000418,$071C03F800000000,$060006000600060C,$06007EC006000600,$0000000000000600,$01FC000000000000,$018C018C018C018C,$030C018C018C018C,$0000000000000608,$3FF0000000000000,$618C608C60086318,$63006188618C618C,$0000000000003E00,$0018000000000000,$018C000C000C000C,$61807FF8018C018C,$0000000000000180,$33D81E6000000000,$618C618C618C6188,$33D86188618C618C,$0000000000001E60,$0070000000000000,$618C618C018C00D8,$3FF83198618C618C,$0000000000000FE0,$0000000000000000,$0E700C3000000000,$0000000000000C30,$0000000000000000,$0000000000000000,$74707C3070000000,$0000000000001830,$0000000000000000,$0000000000000000,$0C30066003C00180,$00006006300C1818,$0000000000000000,$0C300C3000000000,$0C300C300C300C30,$0820082008200C20,$0000000000000000,$0000000000000000,$0C301818300C6006,$0000018003C00660,$0000000000000000,$0008001000000000,$7386600600060004,$00C800C400C66086,$0000000000000070,$1FF8000000000000,$67E660066006300C,$1FF8318C61866186,$0000000000000000,$0E00780000000000,$01860184019803E0,$0E0003E001980184,$0000000000007800,$718E3FFC00000000,$6186618661866186,$3300633861CC6186,$0000000000001E00,$381C0FF000000000,$600660066006300C,$300C600460066006,$0000000000003C3C,$700E3FFC00000000,$6006600660066006,$3C3C300C60066006,$0000000000000FF0,$718E3FFC00000000,$6186618661866186,$6006600660066186,$000000000000700E,$01867FFE00000000,$0186018601860186,$0006000600060186,$000000000000000E,$700E3FFC00000000,$6006600660066006,$730E630660066006,$0000000000007F1C,$43C27FFE00000000,$0180018001800180,$43C2018001800180,$0000000000007FFE,$0000000000000000,$7FFE600640020000,$0000000040026006,$0000000000000000,$6000380000000000,$600C600C60006000,$701C600C600C600C,$0000000000003FF8,$03C07FFE00000000,$0180018001800180,$18380C30066003C0,$000000006006300C,$70003FFE00000000,$6000600060006000,$6000600060006000,$0000000000006000,$40387FFE00000000,$07C000C000600030,$40380030006000C0,$0000000000007FFE,$401E7FFE00000000,$00C000600030001C,$1C02060003000180,$0000000000007FFE,$700E3FFC00000000,$6006600660066006,$700E600660066006,$0000000000003FFC,$038E7FFC00000000,$0186018601860186,$00FC00CC00860186,$0000000000000070,$700E3FFC00000000,$6006600660066006,$180E0C0666066006,$00000000700473FC,$018E7FFC00000000,$0386018601860186,$30CE19860D860786,$00000000000060FC,$60FC603000000000,$61866186618660CC,$3F06330661866186,$0000000000001C06,$0006000600060000,$7FFE000E00060006,$000600060006000E,$0000000000060006,$38000FFE00000000,$6000600060003000,$3800300060006000,$0000000000000FFE,$01E0007E00000000,$700030001C000780,$01E007801C003000,$000000000000007E,$3C007FFE00000000,$01F0018006000C00,$3C000C0006000180,$0000000000007FFE,$1818300C60060000,$03C003C006600C30,$18180C30066003C0,$000000006006300C,$0030001E00000000,$7F80018000C00060,$0030006000C00180,$000000000000001E,$7806300400000000,$6186630666067C06,$601E603E606660C6,$000000000000200C,$0000000000000000,$60067FFE00000000,$0000000060066006,$0000000000000000,$0018000C00060000,$018000C000600030,$18000C0006000300,$0000000060003000,$0000000000000000,$6006600660060000,$0000000000007FFE,$0000000000000000,$006000C000000000,$000E000C00180030,$006000300018000C,$00000000000000C0,$6000600060000000,$6000600060006000,$4000400040006000,$0000000040004000,$0000000000000000,$0018000C00060000,$0000004000600030,$0000000000000000,$7E003C0000000000,$6660666066606660,$6660666066606660,$0000000000007FC0,$31C00FFE00000000,$60C060C060C020C0,$3180208060C060C0,$0000000000000E00,$30C00F0000000000,$6060606060602040,$6060606060606060,$00000000000030C0,$31800E0000000000,$60C060C060C02080,$70C060C060C060C0,$0000000000007FFE,$36C00F0000000000,$6660666066602640,$06C0664066606660,$0000000000000700,$00C000C000C00000,$00C600C600CE7FFC,$0006000600060006,$000000000000001C,$066003C000000000,$0660066006600660,$6660666066600660,$0000000000003FC0,$00C07FFE00000000,$00C000C000C000C0,$0180008000C000C0,$0000000000007E00,$0000000000000000,$7FDC600C00000000,$000000000000600C,$0000000000000000,$6000300000000000,$6000600060006000,$700C600060006000,$00000000000C3FDC,$06007FFC00000000,$0600060006000600,$19800F0006000600,$00000000606030C0,$0000000000000000,$38000FFE00000000,$6000600060003000,$0000000000000000,$00607FC000000000,$7FE0006000600060,$00C0006000600060,$0000000000007F80,$00607FC000000000,$0060006000600060,$01C000C000600060,$0000000000007F00,$60603FC000000000,$6060606060606060,$6060606060606060,$0000000000003FC0,$06607FC000000000,$0660066006600660,$03C0024006600660,$0000000000000000,$066003C000000000,$0660066006600660,$7FE0066006600660,$0000000000006000,$00607FC000000000,$0060006000600060,$0060006000600060,$00000000000000C0,$666003C000000000,$6660666066606660,$6660666066606660,$0000000000003C00,$00C000C000C00000,$60C060C060C03FFC,$6000600060006000,$0000000000003000,$38000FE000000000,$6000600060003000,$1800300060006000,$0000000000000FE0,$060003E000000000,$7000300018000C00,$06000C0018003000,$00000000000003E0,$60003FE000000000,$3F00700060006000,$6000600060003000,$0000000000003FE0,$30C0606000000000,$060006000F001980,$30C019800F000600,$0000000000006060,$030000E000000000,$0600060006000200,$3600260066006600,$0000000000000FE0,$6060606000000000,$66606C6078607060,$606060E061E06360,$0000000000006060,$0000000000000000,$1E78018000000000,$000000006006300C,$0000000000000000,$0000000000000000,$7E7E000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$1E78300C60040000,$0000000000000180,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000,$0000000000000000
  DSP_H2H_IC: :Data.a $00,$00,$00,$00,$00,$00,$00,$02,$05,$0B,$0C,$0D,$0C,$0C,$0A,$06,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$24,$46,$7D,$60,$24,$24,$5A,$4F,$27,$1C,$0F,$0A,$02,$00,$00,$00,$00,$00,$00,$00,$04,$10,$37,$7F,$E6,$F2,$B2,$67,$6F,$CF,$CE,$B9,$97,$51,$11,$08,$00,$00,$00,$00,$00,$01,$10,$57,$82,$66,$8C,$CE,$FB,$EE,$7A,$8F,$FB,$DF,$F8,$E1,$7C,$16,$0B,$00,$00,$00,$00,$06,$43,$AA,$F7,$CE,$89,$6B,$82,$BD,$8F,$8A,$C7,$D2,$FF,$FF,$E7,$5D,$16,$00,$00,$00,$00,$08,$4F,$D4,$FF,$FF,$FE,$EF,$B2,$69,$59,$A5,$C8,$FE,$FF,$FF,$FF,$AB,$21,$00,$00,$03,$0C,$23,$1B,$6A,$C2,$FB,$FF,$F3,$E3,$E7,$6F,$A7,$FE,$FF,$FF,$FF,$FF,$EB,$44,$00,$05,$1A,$80,$C1,$98,$6A,$56,$7F,$9C,$76,$7F,$9A,$71,$D0,$FD,$FE,$FF,$FF,$FF,$F0,$49,$00,$0C,$4F,$E2,$EE,$FA,$FA,$E5,$AB,$54,$A3,$A1,$2C,$80,$ED,$DA,$F1,$FF,$FF,$FF,$EB,$42,$00,$0D,$67,$F8,$E7,$FE,$FF,$F4,$8B,$93,$EA,$90,$38,$9C,$CD,$D6,$D9,$F4,$FE,$FF,$E2,$36,$00,$09,$41,$C2,$EA,$FB,$C4,$73,$50,$A5,$C7,$98,$2E,$9C,$A0,$8A,$B3,$F8,$FF,$FF,$D2,$29,$00,$01,$14,$31,$53,$66,$42,$7D,$E6,$C8,$D6,$BD,$26,$4C,$59,$B5,$FE,$FF,$FF,$FF,$BC,$1D,$00,$0D,$3F,$65,$71,$63,$4F,$CB,$FA,$FE,$FD,$91,$21,$35,$B0,$FF,$FF,$FF,$FF,$FF,$AA,$16,$08,$4B,$D3,$F9,$FC,$D0,$6C,$F4,$FF,$FF,$DF,$43,$32,$A5,$FE,$FF,$FF,$FF,$FF,$FE,$9E,$12,$0B,$66,$FD,$FF,$FF,$D8,$40,$C2,$FE,$F0,$91,$21,$98,$FE,$FF,$FF,$FF,$FF,$FF,$FD,$81,$0E,$06,$2E,$A0,$DB,$F4,$E2,$48,$98,$EC,$C0,$A6,$92,$DC,$FF,$FF,$FF,$FF,$FF,$FF,$EE,$4E,$08,$00,$0C,$20,$48,$72,$71,$2E,$67,$F7,$FD,$FF,$F6,$FE,$FE,$FF,$FF,$FF,$FF,$F3,$90,$16,$01,$00,$01,$0F,$4D,$A0,$C2,$6F,$2C,$BA,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$DA,$75,$18,$08,$00,$00,$00,$02,$0C,$21,$65,$77,$35,$60,$E4,$FF,$FF,$FF,$FF,$FF,$FE,$C1,$5C,$12,$07,$00,$00,$00,$00,$00,$00,$03,$0A,$13,$16,$16,$84,$FA,$FF,$FF,$FF,$FE,$AE,$40,$0D,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$06,$18,$8F,$E7,$FA,$E8,$9E,$2E,$08,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$07,$16,$3F,$5C,$45,$16,$04,$00,$00,$00,$00,$00,$00
EndDataSection

;==============================
;- DSP END CODE
;}=============================

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1460
; FirstLine = 1438
; Folding = --------
; EnableThread
; EnableXP
; DPIAware
; Executable = dspdesesmorts.exe
; CPU = 4