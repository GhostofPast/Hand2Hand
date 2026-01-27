Macro ElapsedPicoSeconds()
	PeekQ($7FFE0014)
EndMacro
#H2H_FRAMEPERSECOND=50.0
#H2H_FRAMEMILISECONDS=1000.0/#H2H_FRAMEPERSECOND
Global deltaGlobal.d=1 ; in frames

#H2H_FPS_MODE_DEFAULT=6
Global currentFPSMode=#H2H_FPS_MODE_DEFAULT
Global globalFPS.i=fpsMode(currentFPSMode)
Global currentMillisecond.d=1000.0/globalFPS
Global defaultMillisecond.d=1000.0/#H2H_FRAMEPERSECOND
Global defaultDelta.d=currentMillisecond/defaultMillisecond
; Debug "global "+currentMillisecond
#H2H_FPS_SHOW_DEFAULT=1
Global showFPS=#H2H_FPS_SHOW_DEFAULT
Global FPSset.q=0
Global slomo=#False

Global eee.q

Procedure.q timer(i.q);4 octet compteur (ecri 0 = reset, 8 flag a 1, 3 octet disponible)
	Debug "called with "+i
	i*-1:NtDelayExecution_(0,@i)
	!lea r12,[p.v_i]
	!label_timer_loop:
	!xor rcx,rcx
	!mov rdx,r12
	!call NtDelayExecution;Sleep
	!inc dword[v_tin]
	!mov byte [v_tin+4],$ff
	!cmp qword[v_eee],$10200
	!jnz label_timer_loop
	!mov rcx,0
	!rdrand rax
EndProcedure
Procedure fpsModeChange(toWhat.i)
	If Not FPSset
		currentFPSMode=toWhat
		globalFPS=fpsMode(currentFPSMode)
		currentMillisecond=1000.0/globalFPS
		defaultDelta=currentMillisecond/defaultMillisecond
		Debug "default delta set to "+defaultDelta
	Else
		Debug "attempted to change FPS "+FPSset+" times"
	EndIf
	FPSset+1
EndProcedure

#H2H_PICOSECONDS2MILLISECONDS=1000*10.0
#H2H_TIME_SCALE=1.0
#H2H_TIME_SCALE_KEY="timeScale"
Global TIME_SCALE.d=#H2H_TIME_SCALE
#H2H_TIME_SLOMO=0.2
#H2H_TIME_SLOMO_KEY="slomo"
Global TIME_SLOMO.d=#H2H_TIME_SLOMO

Macro ElapsedMillisecondsPrecise()
	(ElapsedPicoSeconds()/(#H2H_PICOSECONDS2MILLISECONDS))
EndMacro

Global GLOBAL_SYSTEME_TIN.q
Procedure.d deltaSet(stamp.d,withSlomo=#False)
; 	Static leftover.d=0
	stamp=ElapsedMillisecondsPrecise()-stamp
; 	delta.d=stamp/currentMillisecond
; 	Debug "stamp "+stamp
; 	Debug "delta set to "+delta
	delta.d=defaultDelta
	
; ; 	NtDelayExecution_(0,-(currentMillisecond-stamp)*10000)
; 	wait.d=currentMillisecond-stamp
; 	wait+Int(leftover)
; 	leftover-Int(leftover)
; 	
; 	If wait>0
;  		Delay(wait)
; 		delta=defaultDelta
; 		leftover+wait-Int(wait)
; 	Else
; 		leftover=0
; 		delta=stamp/defaultMillisecond
; 	EndIf
; 	
	If delta<defaultDelta/2.0
		delta=defaultDelta/2.0
	EndIf
	If delta>defaultDelta*2.0
		delta=defaultDelta*2.0
	EndIf
	If withSlomo
		delta*TIME_SLOMO
	EndIf
	
	ProcedureReturn delta*TIME_SCALE
EndProcedure

Declare loadingLoop(delta.d=1)
Declare loadingSelect()
Declare loadingStop()
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 20
; Folding = -
; EnableXP
; CPU = 1