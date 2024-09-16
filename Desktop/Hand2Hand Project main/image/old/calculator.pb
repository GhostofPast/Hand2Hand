; UsePNGImageDecoder()
; 
; totalFilledSize=0
; totalRealSize=0
; 
; Debug Str((8192*8192-7609*7074)*4/1024/1024)
; End
; 
; If ExamineDirectory(0, "./", "hand_*.png")
; 	While NextDirectoryEntry(0)
; 		If DirectoryEntryType(0)=#PB_DirectoryEntry_File
; ; 			Debug DirectoryEntryName(0)
; 			LoadImage(0,DirectoryEntryName(0))
; 			x=1
; 			While x<ImageWidth(0)
; 				x*2
; 			Wend
; 			y=1
; 			While y<ImageHeight(0)
; 				y*2
; 			Wend
; 			totalFilledSize+(ImageWidth(0)*ImageHeight(0))
; 			totalRealSize+(x*y)
; 			FreeImage(0)
; 		EndIf
; 	Wend
; 	totalLost=totalRealSize-totalFilledSize
; 	Debug "total filled size "+totalFilledSize
; 	Debug "total filled side: "+Round(Sqr(totalFilledSize),#PB_Round_Up)
; 	
; 	Debug "total real size "+totalRealSize
; 	Debug "total real side: "+Round(Sqr(totalRealSize),#PB_Round_Up)
; 	
; 	Debug "total lost area : "+totalLost
; 	Debug "total lost side: "+Round(Sqr(totalLost),#PB_Round_Up)
; 	Debug "total lost 32b memory : "+Str(totalLost*4/1024/1024)+" Mb"
; EndIf


Procedure.f getPerformance(produced.f,consumed.f)
	If produced=0
		ProcedureReturn 0
	EndIf
	If produced>=consumed
		ProcedureReturn 1
	EndIf
	If consumed>=produced*2
		ProcedureReturn 0
	EndIf
	ProcedureReturn 1-Abs((consumed-produced)/produced)
EndProcedure

Debug "100/100 expected 1 got "+getPerformance(100,100)
Debug "100/150 expected 0.5 got "+getPerformance(100,150)
Debug "100/175 expected 0.25 got "+getPerformance(100,175)
Debug "100/199 expected 0.01 got "+getPerformance(100,199)
Debug "100/200 expected 0 got "+getPerformance(100,200)

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 55
; FirstLine = 7
; Folding = -
; EnableXP
; DPIAware