Macro ElapsedPicoSeconds()
	PeekQ($7FFE0014)
EndMacro

#H2H_PICOSECONDS2MILLISECONDS=1000*10.0

Macro ElapsedMillisecondsPrecise()
	(ElapsedPicoSeconds()/(#H2H_PICOSECONDS2MILLISECONDS))
EndMacro

Procedure.d deltaSet(stamp.d,withSlomo=#False)
  Static leftover.d=0
  
;   If gamePaused
;     ProcedureReturn 0
;   EndIf
	
	delta.d=defaultDelta
	stamp=ElapsedMillisecondsPrecise()-stamp
	
	wait.d=currentMillisecond-stamp
	wait+Int(leftover)
	leftover-Int(leftover)
	
	If wait>0
		Delay(wait)
		delta=defaultDelta
		leftover+wait-Int(wait)
	Else
		leftover=0
		delta=stamp/defaultMillisecond
	EndIf
	
	If delta<defaultDelta/2.0
		delta=defaultDelta/2.0
	EndIf
	If delta>defaultDelta*2.0
		delta=defaultDelta*2.0
	EndIf
	If withSlomo
		delta/5.0
	EndIf
	ProcedureReturn delta
EndProcedure

Declare loadingLoop(delta.d=1)
Declare loadingSelect()
Declare loadingStop()
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 15
; Folding = -
; EnableXP
; CPU = 1