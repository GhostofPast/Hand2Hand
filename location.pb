Structure location
	x.d
	y.d
EndStructure

Structure locationI
	x.q
	y.q
EndStructure

#H2H_JSON_MEMORY_KEY="memory"
#H2H_DATA_LOCATION_BASE=$10000
Global DATA_LOCATION_BASE=#H2H_DATA_LOCATION_BASE
Declare loadJSONInteger(*parent,key$)
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_LOCATION_BASE=loadJSONInteger(*parent,"location")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataLocationSize.i=DATA_LOCATION_BASE*SizeOf(location)
; Global dataLocationSize.i=#H2H_DATA_LOCATION_BASE*SizeOf(location)
Global *dataLocation=AllocateMemory(dataLocationSize,#PB_Memory_NoClear)
Global dataLocationIndex=0
Global Dim dataLocationPile(7) ; byte indexes of available locations
Global dataLocationPileIndex=-1

; Macro DebuggerError(s)
; EndMacro
; Macro DebuggerWarning(s)
; EndMacro

; CompilerIf #H2H_MODE=#H2H_MODE_SAVE
; Procedure set(*l.location,newX.d=0,newY.d=0)
;  	If *l
; 		*l\x=newX
; 		*l\y=newY
; 	Else
; 		DebuggerError("Attempted to set a null location")
; 	EndIf
; EndProcedure
; CompilerElse
	Macro set(l,nx=0,ny=0)
		l\x=nx:l\y=ny
	EndMacro
; CompilerEndIf

Macro locationAdd(l,nx=0,ny=0)
	set(l,l\x+nx,l\y+ny)
EndMacro

Macro locationMult(l,nx=0,ny=0)
	set(l,l\x*nx,l\y*ny)
EndMacro

CompilerIf #H2H_MODE_SAVE
Procedure locationAddLoc(*l.location,*other.location)
	If *l
		If *other
			locationAdd(*l,*other\x,*other\y)
		Else
			DebuggerWarning("Attempted To add a null location To a location")
		EndIf
	Else
		DebuggerWarning("Attempted to add a null location to a null location")
	EndIf
EndProcedure
CompilerElse
	Macro locationAddLoc(l1,l2)
		locationAdd(l1,l2\x,l2\y)
	EndMacro
CompilerEndIf

CompilerIf #H2H_MODE_SAVE
	Procedure locationCopy(*target.location,*l.location)
		If *target
			If *l
				set(*target,*l\x,*l\y)
			Else
				DebuggerWarning("Attempted to set a location with a null location")
			EndIf
		Else
			DebuggerWarning("Attempted to set a null location with a location")
		EndIf
EndProcedure
CompilerElse
	Macro locationCopy(l1,l2)
		set(l1,l2\x,l2\y)
	EndMacro
CompilerEndIf
Global excedent=0
Procedure.q locationCreate(newX.d=0,newY.d=0)
	*l.location
	If dataLocationPileIndex>-1
		If dataLocationPile(dataLocationPileIndex)<dataLocationSize
			*l=*dataLocation+dataLocationPile(dataLocationPileIndex)
		Else
			*l=dataLocationPile(dataLocationPileIndex)
; 			Debug "yoinked a rogue "+dataLocationPileIndex
		EndIf
		dataLocationPileIndex-1
	Else
		*l=*dataLocation+dataLocationIndex
		dataLocationIndex+SizeOf(location)
		If dataLocationIndex>=dataLocationSize
			; 			MessageRequester("warning","reallocate location")
			excedent+1
; 			Debug "WARNING not enough locations, exceded by "+excedent
			*l=AllocateStructure(location)
; 			End
; 			dataLocationSize*2
; 			Debug "reallocate location to "+Hex(dataLocationSize)
; 			*dataLocation=ReAllocateMemory(*dataLocation,dataLocationSize,#PB_Memory_NoClear)
		EndIf
	EndIf
	set(*l,newX,newY)
	ProcedureReturn *l
EndProcedure

Procedure.q locationCreateI(newX.q=0,newY.q=0)
	*l.locationI
	If dataLocationPileIndex>-1
		If dataLocationPile(dataLocationPileIndex)<dataLocationSize
			*l=*dataLocation+dataLocationPile(dataLocationPileIndex)
		Else
			*l=dataLocationPile(dataLocationPileIndex)
; 			Debug "yoinked a rogue "+dataLocationPileIndex
		EndIf
		dataLocationPileIndex-1
	Else
		*l=*dataLocation+dataLocationIndex
		dataLocationIndex+SizeOf(locationI)
		If dataLocationIndex>=dataLocationSize
			; 			MessageRequester("warning","reallocate location")
			excedent+1
; 			Debug "WARNING not enough locations, exceded by "+excedent
			*l=AllocateStructure(locationI)
; 			End
; 			dataLocationSize*2
; 			Debug "reallocate location to "+Hex(dataLocationSize)
; 			*dataLocation=ReAllocateMemory(*dataLocation,dataLocationSize,#PB_Memory_NoClear)
		EndIf
	EndIf
	set(*l,newX,newY)
	ProcedureReturn *l
EndProcedure

Procedure locationDestroyEx(*l.location)
	If *l
		For i=0 To ArraySize(dataLocationPile())
			If dataLocationPile(i)=*l-*dataLocation
; 				Debug "already freed !"
				ProcedureReturn
			EndIf
		Next
		dataLocationPileIndex+1
		If dataLocationPileIndex>=ArraySize(dataLocationPile())
			ReDim dataLocationPile( (ArraySize(dataLocationPile())+1)*2 -1)
		EndIf
		If *l>=*dataLocation And *l<*dataLocation+dataLocationSize
			dataLocationPile(dataLocationPileIndex)=*l-*dataLocation
		Else
			dataLocationPile(dataLocationPileIndex)=*l
; 			Debug "added a rogue "+dataLocationPileIndex
		EndIf
;  		Debug "new pile index "+dataLocationPileIndex
		set(*l)
	EndIf
EndProcedure

Macro locationDestroy(l)
	locationDestroyEx(l):l=0
EndMacro

Macro locationIsNull(l)
	(Bool(Not (l) Or (Abs(l\x)<0.01 And Abs(l\x)<0.01)))
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

Macro locationAngle(l1,l2)
	ATan((l2\y-l1\y)/(l2\x-l1\x))
EndMacro

;--- screenshake
Global *screenShake.location=locationCreate()
Global *screenShakeDistance.location=locationCreate()
#H2H_SCREEN_SHAKE_DISTANCE=20
#H2H_SCREEN_SHAKE_REDUCTION_FACTOR=0.8
#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY=0.85
Procedure screenShakeLoop(delta.d=1)
; 	Static sub.d=0
	If Not gamePaused
		factor.d=#H2H_SCREEN_SHAKE_REDUCTION_FACTOR
		If attackDelayMode=#H2H_DELTA_DELAY_MODE_FIX Or attackDelayMode=#H2H_DELTA_DELAY_MODE_RELATIVE
			factor=#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY
		EndIf
		factor.d=lerp(1.0,factor,min(delta,1))
		set(*screenShake,Random(*screenShakeDistance\x)-*screenShakeDistance\x/2,Random(*screenShakeDistance\y)-*screenShakeDistance\y/2)
		locationMult(*screenShakeDistance,factor,factor)
; 		iterations.i=Int(sub)
; 		For i=1 To iterations
; 			CompilerSelect attackDelayMode
; 				CompilerCase #H2H_DELTA_DELAY_MODE_OFF
; 					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR)
; 				CompilerCase #H2H_DELTA_DELAY_MODE_FIX
; 					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY)
; 				CompilerCase #H2H_DELTA_DELAY_MODE_RELATIVE
; 					locationMult(*screenShakeDistance,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY,#H2H_SCREEN_SHAKE_REDUCTION_FACTOR_DELAY)
; 			CompilerEndSelect
; 		Next
; 		sub-iterations
; 		sub+delta
	EndIf
EndProcedure

Macro screenShakeStart(damage)
	screenShakeAdd((max((damage)-5),(max((damage)-5));:Debug "Started shake by "+damage
EndMacro

Enumeration
	#H2H_SCREEN_SHAKE_NONE
	#H2H_SCREEN_SHAKE_LOW
	#H2H_SCREEN_SHAKE_NORMAL
	#H2H_SCREEN_SHAKE_HIGH
EndEnumeration

#H2H_SCREEN_SHAKE_DEFAULT=#H2H_SCREEN_SHAKE_NORMAL

#H2H_SCREEN_SHAKE_FORCE_NONE=0
#H2H_SCREEN_SHAKE_FORCE_LOW=0.5
#H2H_SCREEN_SHAKE_FORCE_NORMAL=1
#H2H_SCREEN_SHAKE_FORCE_HIGH=1.5
Global screenShakeMode.i=#H2H_SCREEN_SHAKE_DEFAULT
Global screenShakeForceFactor.d=#H2H_SCREEN_SHAKE_FORCE_NORMAL

Procedure screenShakeModeSet(what.i)
	Select what
		Case #H2H_SCREEN_SHAKE_LOW
			screenShakeForceFactor=#H2H_SCREEN_SHAKE_FORCE_LOW
		Case #H2H_SCREEN_SHAKE_NORMAL
			screenShakeForceFactor=#H2H_SCREEN_SHAKE_FORCE_NORMAL
		Case #H2H_SCREEN_SHAKE_HIGH
			screenShakeForceFactor=#H2H_SCREEN_SHAKE_FORCE_HIGH
		Default
			screenShakeForceFactor=#H2H_SCREEN_SHAKE_NONE
	EndSelect
EndProcedure

Macro screenShakeAdd(x,y)
	locationAdd(*screenShakeDistance,x*screenShakeForceFactor,y*screenShakeForceFactor);:Debug "Added shake by "+Str(x)+" "+Str(y)
EndMacro

Macro toString(l)
	Str(l\x)+" "+Str(l\y)
EndMacro
#H2H_LOCATION_SHIFT=2048
#H2H_LOCATION_SHIFT_MASK=#H2H_LOCATION_SHIFT-1
#H2H_LOCATION_SHIFT_BIT=11
#H2H_LOCATION_SHIFT_CONVERT=(1000-#H2H_LOCATION_SHIFT)/2
Macro shiftN(l) ; shift Normal
; 	Mod(l\x,#H2H_LOCATION_SHIFT)
	(l\x&#H2H_LOCATION_SHIFT_MASK)
EndMacro
Macro shiftFlip(l)
; 	(l\x/#H2H_LOCATION_SHIFT)
	(l\x>>#H2H_LOCATION_SHIFT_BIT)
EndMacro
Macro shiftCreate(x,xFlip)
; 	(x+xFlip*#H2H_LOCATION_SHIFT)
	(x+(xFlip<<#H2H_LOCATION_SHIFT_BIT))
EndMacro

; Structure dummy
; 	*l.location
; 	*lI.locationI
; EndStructure
; *d.dummy=AllocateStructure(dummy)
; *d\l=AllocateStructure(location)
; *d\lI=AllocateStructure(location)
; set(*d\lI,1,2)
; Debug shiftFlip(*d\lI)
; ; Debug toString(*d\lI)
; End
; *l.locationI=AllocateStructure(locationI);locationCreate(1)
; set(*l,1,1)
; Debug *l\x
; *l\x=1
; Debug *l\x
; End
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 177
; FirstLine = 152
; Folding = -----
; EnableXP
; CPU = 1