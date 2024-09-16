Structure frameShift
	*shift.location
	*shift_mir.location
	*shift_hurt.location
	*shift_hurt_mir.location
	
	*shiftSize.location
	*hurtSize.location
EndStructure

Procedure frameShiftCreate(*fS.frameShift,*s.location,*sm.location,*sh.location,*shm.location,*sSize.location,*hSize.location)
	set(*fS\shift)
	set(*fS\shift_mir)
	set(*fS\shift_hurt)
	set(*fS\shift_hurt_mir)
	
	set(*fS\shiftSize)
	set(*fS\hurtSize)
	
	locationCopy(*fS\shift,*s)
	locationCopy(*fS\shift_mir,*sm)
	locationCopy(*fS\shift_hurt,*sh)
	locationCopy(*fS\shift_hurt_mir,*smh)
	
	locationCopy(*fS\shiftSize,*sSize)
	locationCopy(*fS\hurtSize,*hSize)
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; Folding = -
; EnableXP
; CPU = 1