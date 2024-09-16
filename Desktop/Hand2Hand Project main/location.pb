Structure location
	x.d
	y.d
EndStructure

#H2H_DATA_LOCATION_BASE=$10000
Global dataLocationSize.i=#H2H_DATA_LOCATION_BASE*SizeOf(location)
Global *dataLocation=AllocateMemory(dataLocationSize,#PB_Memory_NoClear)
Global dataLocationindex=0
Global Dim dataLocationPile(7) ; byte indexes of available locations
Global dataLocationPileIndex=-1

Procedure set(*l.location,newX.f=0,newY.f=0)
	If *l
		*l\x=newX
		*l\y=newY
	EndIf
EndProcedure

Procedure locationAdd(*l.location,newX.f=0,newY.f=0)
	If *l
		set(*l,*l\x+newX,*l\y+newY)
	EndIf
EndProcedure

Procedure locationMult(*l.location,newX.f=0,newY.f=0)
	If *l
		set(*l,*l\x*newX,*l\y*newY)
	EndIf
EndProcedure

Procedure locationAddLoc(*l.location,*other.location)
	If *l And *other
		locationAdd(*l,*other\x,*other\y)
	EndIf
EndProcedure

Procedure locationCopy(*target.location,*l.location)
	If *l And *target
		set(*target,*l\x,*l\y)
	EndIf
EndProcedure

Procedure locationCreate(newX.f=0,newY.f=0)
	*l.location
	If dataLocationPileIndex>-1
		*l=*dataLocation+dataLocationPile(dataLocationPileIndex)
		dataLocationPileIndex-1
	Else
		*l=*dataLocation+dataLocationindex
		dataLocationindex+SizeOf(location)
		If dataLocationindex>=dataLocationSize
			Debug "reallocate"
			MessageRequester("warning","reallocate")
			End
			dataLocationSize*2
			*dataLocation=ReAllocateMemory(*dataLocation,dataLocationSize,#PB_Memory_NoClear)
		EndIf
	EndIf
	set(*l,newX,newY)
	ProcedureReturn *l
EndProcedure

Procedure locationDestroyEx(*l.location)
	If *l
		dataLocationPileIndex+1
		If dataLocationPileIndex>=ArraySize(dataLocationPile())
			ReDim dataLocationPile( (ArraySize(dataLocationPile())+1)*2 -1)
		EndIf
		dataLocationPile(dataLocationPileIndex)=*l-*dataLocation
	EndIf
EndProcedure

Macro locationDestroy(l)
	locationDestroyEx(l):l=0
EndMacro

Macro locationIsNull(l)
	(Bool((l) And Abs(l\x)<0.01 And Abs(l\x)<0.01))
EndMacro

Procedure.f locationDistanceX(*l1.location,*l2.location)
	If Not *l1 Or Not *l2
		ProcedureReturn 0
	EndIf
	ProcedureReturn Abs(*l1\x-*l2\x)
EndProcedure

Procedure.f locationDistanceY(*l1.location,*l2.location)
	If Not *l1 Or Not *l2
		ProcedureReturn 0
	EndIf
	ProcedureReturn Abs(*l1\y-*l2\y)
EndProcedure

Procedure.f locationDistance(*l1.location,*l2.location)
	x.f=locationDistanceX(*l1,*l2)
	y.f=locationDistanceY(*l1,*l2)
	ProcedureReturn Sqr(x*x+y*y)
EndProcedure

Procedure.f locationAngle(*l1.location,*l2.location)
	ProcedureReturn ATan((*l2\y-*l1\y)/(*l2\x-*l1\x))
EndProcedure

;--- screenshake
Global *screenShake.location=locationCreate()
Global *screenShakeDistance.location=locationCreate()
#H2H_SCREEN_SHAKE_DISTANCE=20
#H2H_SCREEN_SHAKE_REDUCTION_FACTOR=0.8
#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY=0.9
Procedure screenShakeLoop(delta.d=1)
  Static sub.d=0
  If Not gamePaused
	  set(*screenShake,Random(*screenShakeDistance\x)-*screenShakeDistance\x/2,Random(*screenShakeDistance\y)-*screenShakeDistance\y/2)
  	iterations.i=Int(sub)
  	For i=1 To iterations
  		CompilerSelect #H2H_DELTA_DELAY_MODE
  				CompilerCase #H2H_DELTA_DELAY_MODE_OFF
  					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR)
  				CompilerCase #H2H_DELTA_DELAY_MODE_FIX
  					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY)
  				CompilerCase #H2H_DELTA_DELAY_MODE_RELATIVE
  					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY)
  		CompilerEndSelect
  	Next
  	sub-iterations
  	sub+delta
	EndIf
EndProcedure

Macro screenShakeStart(damage)
	screenShakeAdd((max((damage)-5),(max((damage)-5));:Debug "Started shake by "+damage
EndMacro

Macro screenShakeAdd(x,y)
	locationAdd(*screenShakeDistance,x,y);:Debug "Added shake by "+Str(x)+" "+Str(y)
EndMacro

Macro toString(l)
	Str(l\x)+" "+Str(l\y)
EndMacro
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 111
; FirstLine = 91
; Folding = ---
; EnableXP
; CPU = 1