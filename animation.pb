Global animationId=0
;--- animation enum
Enumeration 1
	#H2H_ANIMATIONTYPE_IDLE
	#H2H_ANIMATIONTYPE_FRONT
	#H2H_ANIMATIONTYPE_BACK
	
	#H2H_ANIMATIONTYPE_NEUTRAL
	#H2H_ANIMATIONTYPE_NSIDE
	#H2H_ANIMATIONTYPE_NBACK
	#H2H_ANIMATIONTYPE_NUP
	#H2H_ANIMATIONTYPE_NDOWN
	#H2H_ANIMATIONTYPE_HEAVY
	
	#H2H_ANIMATIONTYPE_DEATH
	#H2H_ANIMATIONTYPE_SPAWN
	#H2H_ANIMATIONTYPE_JUMP
	#H2H_ANIMATIONTYPE_LAND
	#H2H_ANIMATIONTYPE_HIT
	
	#H2H_ANIMATIONTYPE_DODGE
	#H2H_ANIMATIONTYPE_PARRY
	#H2H_ANIMATIONTYPE_SELECTION
	#H2H_ANIMATIONTYPE_SELECTED
EndEnumeration

#H2H_ANIMATION_DIGEST=0
;--- animation struct
Structure animation
	Array *frames.frame(0)
	id.i
	index.i ; what to display
	recovery.i
					; if finished, checks out a specific player movement to do a combo
	loopStart.i ; Define from where frame the animation restarts when it ends. 0 doesn't change anything. Do not put something negative.
	*animations.animation[6]
; 	0 neutral
; 	1 nSide
; 	2 nBack
; 	3 nDown
; 	4 nUp
; 	5 heavy
	Array *frontWind.animation(1,1) ; array in case of multiple types of wind, or if we need to spawn some
	Array *backWind.animation(1,1)	;
	Array *projectiles.animation(1,1)
	*wind
	windMax.i ; max number of wind, by default 1
	; miscalenous
	name.s
	animationType.b
	CompilerIf #H2H_DIGESTION_ENABLE
		digested.s ; path to the digested animation sprite sheet, TODO
	CompilerEndIf
	gadgetLoaded.b  	; indicates it have loaded a normal version, 
	gadgetLoadedMir.b	; second the flipped version usefull for frame flipping shenaningans, see frameSwitchTo()
	
	flag.b
EndStructure

Enumeration 1
	#H2H_ANIMATION_WIND_FRONT
	#H2H_ANIMATION_WIND_BACK
	#H2H_ANIMATION_WIND_PROJECTILE
EndEnumeration

Procedure animationGetWind(*a.animation,what.b,index.i,subIndex=0)
	CompilerIf #PB_Compiler_Debugger
		If Not *a
			Debug "TRIED TO ACCESS A NULL ANIMATION"
			CallDebugger
		EndIf
	CompilerElse
		If Not *a Or what>#H2H_ANIMATION_WIND_PROJECTILE Or what<#H2H_ANIMATION_WIND_FRONT
			ProcedureReturn #Null
		EndIf
	CompilerEndIf
	ProcedureReturn *a\wind+(*a\windMax*index+subIndex)*32
EndProcedure

Macro animationGetWindFront(a,index,subIndex=0)
	animationGetWind(a,#H2H_ANIMATION_WIND_FRONT,index,subIndex)
EndMacro
Macro animationGetWindBack(a,index,subIndex=0)
	animationGetWind(a,#H2H_ANIMATION_WIND_BACK,index,subIndex)
EndMacro
Macro animationGetProjectile(a,index,subIndex=0)
	animationGetWind(a,#H2H_ANIMATION_WIND_PROJECTILE,index,subIndex)
EndMacro

Procedure animationSetWind(*a.animation,what.b,index.i,*withWhat.animation=0,subIndex=0)
	CompilerIf #PB_Compiler_Debugger
		If Not *a
			Debug "TRIED TO WRITE A NULL ANIMATION"
			CallDebugger
		EndIf
	CompilerElse
		If Not *a Or what>#H2H_ANIMATION_WIND_PROJECTILE Or what<#H2H_ANIMATION_WIND_FRONT
			ProcedureReturn
		EndIf
	CompilerEndIf
	PokeI(*a\wind+(*a\windMax*index+subIndex)*32,*withWhat)
EndProcedure

Macro animationSetWindFront(a,index,withwhat,subIndex=0)
	animationSetWind(a,#H2H_ANIMATION_WIND_FRONT,index,withwhat,subIndex)
EndMacro
Macro animationSetWindBack(a,index,withwhat,subIndex=0)
	animationSetWind(a,#H2H_ANIMATION_WIND_BACK,index,withwhat,subIndex)
EndMacro
Macro animationSetProjectile(a,index,withwhat,subIndex=0)
	animationSetWind(a,#H2H_ANIMATION_WIND_PROJECTILE,index,withwhat,subIndex)
EndMacro

EnumerationBinary
	#H2H_ANIMATION_FLAG_LOOPED
	#H2H_ANIMATION_FLAG_ATTACK
	#H2H_ANIMATION_FLAG_COMBO_END
	#H2H_ANIMATION_FLAG_UNGROUNDED
	
	#H2H_ANIMATION_FLAG_WIND_FRONT
	#H2H_ANIMATION_FLAG_WIND_BACK
	#H2H_ANIMATION_FLAG_PROJECTILE
EndEnumeration

Macro animationIsLooped(a)
	(a\flag&#H2H_ANIMATION_FLAG_LOOPED)
EndMacro
Macro animationIsAttack(a)
	(a\flag&#H2H_ANIMATION_FLAG_ATTACK)
EndMacro
Macro animationIsComboEnd(a)
	(a\flag&#H2H_ANIMATION_FLAG_COMBO_END)
EndMacro
Macro animationIsUngrounded(a)
	(a\flag&#H2H_ANIMATION_FLAG_UNGROUNDED)
EndMacro
Macro animationHasWindFront(a)
	(a\flag&#H2H_ANIMATION_FLAG_WIND_FRONT)
EndMacro
Macro animationHasWindBack(a)
	(a\flag&#H2H_ANIMATION_FLAG_WIND_BACK)
EndMacro
Macro animationHasProjectile(a)
	(a\flag&#H2H_ANIMATION_FLAG_PROJECTILE)
EndMacro

Macro animationSetLooped(a,v)
	If v:a\flag|#H2H_ANIMATION_FLAG_LOOPED:Else:a\flag&(~#H2H_ANIMATION_FLAG_LOOPED):EndIf
EndMacro
Macro animationSetAttack(a,v)
	If v:a\flag|#H2H_ANIMATION_FLAG_ATTACK:Else:a\flag&(~#H2H_ANIMATION_FLAG_ATTACK):EndIf
EndMacro
Macro animationSetComboEnd(a,v)
	If v:a\flag|#H2H_ANIMATION_FLAG_COMBO_END:Else:a\flag&(~#H2H_ANIMATION_FLAG_COMBO_END):EndIf
EndMacro
Macro animationSetUngrounded(a,v=#True)
	If v:a\flag|#H2H_ANIMATION_FLAG_UNGROUNDED:Else:a\flag&(~#H2H_ANIMATION_FLAG_UNGROUNDED):EndIf
EndMacro
Macro animationSetWindFrontPresence(a,v=#False)
	If v:a\flag|#H2H_ANIMATION_FLAG_WIND_FRONT:Else:a\flag&(~#H2H_ANIMATION_FLAG_WIND_FRONT):EndIf
EndMacro
Macro animationSetWindBackPresence(a,v=#False)
	If v:a\flag|#H2H_ANIMATION_FLAG_WIND_BACK:Else:a\flag&(~#H2H_ANIMATION_FLAG_WIND_BACK):EndIf
EndMacro
Macro animationSetProjectilePresence(a,v=#False)
	If v:a\flag|#H2H_ANIMATION_FLAG_PROJECTILE:Else:a\flag&(~#H2H_ANIMATION_FLAG_PROJECTILE):EndIf
EndMacro

Procedure animationSetupWind(*a.animation,hasWindFront.i,hasWindBack.i,hasProjectile.i)
	animationSetWindFrontPresence(*a,haveWindFront)
	animationSetWindFrontPresence(*a,haveWindBack)
	animationSetWindFrontPresence(*a,haveProjectile)
	amount=Bool(hasWindFront)+Bool(hasWindBack)+Bool(hasProjectile)
	If *a\wind
		FreeMemory(*a\wind)
	EndIf
	If amount
		*a\wind=AllocateMemory(amount*ArraySize(*a\frames())*4)
	EndIf
EndProcedure

Global Dim *allAnimations.animation(animationId)
#H2H_DATA_ANIMATION_BASE=$800
Global DATA_ANIMATION_BASE=#H2H_DATA_ANIMATION_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_ANIMATION_BASE=loadJSONInteger(*parent,"animation")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global *dataAnimation=AllocateMemory(SizeOf(animation)*DATA_ANIMATION_BASE)
Global dataAnimationIndex=0
Procedure animationDataGive()
	If dataAnimationIndex>=DATA_ANIMATION_BASE
		Debug "Not enough animations !"
		MessageRequester("H2H Error","Not enough animations !")
		End
	EndIf
	dataAnimationIndex+1
	ProcedureReturn *dataAnimation+(dataAnimationIndex-1)*SizeOf(animation)
EndProcedure

Macro animationGetNeutral(a)
	a\animations[0]
EndMacro
Macro animationGetSide(a)
	a\animations[1]
EndMacro
Macro animationGetBack(a)
	a\animations[2]
EndMacro
Macro animationGetUp(a)
	a\animations[3]
EndMacro
Macro animationGetDown(a)
	a\animations[4]
EndMacro
Macro animationGetHeavy(a)
	a\animations[5]
EndMacro

Declare animationLoad(*a.animation,rec.i=#False,half.i=#False,parallel.i=#False,winds.i=#True)
Declare animationUnload(*a.animation,rec.i=#False)
Declare animationCreate(*a.animation=0,isLooped=0,isattack=0,newRecovery=0,newName.s="No name")
Declare animationCopy(*a1.animation,*a2.animation)

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure animationDecodeAllShift(*a.animation,*item.rawdataArray)
	If *a And *item
		For i=0 To min(ArraySize(*a\frames()),ArraySize(*item\rd()))
			decodeShift(*a\frames(i),*item\rd(i))
		Next
	Else
		If Not *a
			DebuggerError("Animation is null !")
		EndIf
		If Not *item
			DebuggerError(*a\name+" has null data !")
		EndIf
	EndIf
EndProcedure

Procedure animationShiftShift(*a.animation,i.i,x.i,y.i=0)
	If *a
		shiftShift(*a\frames(i),x,y)
	EndIf
EndProcedure
CompilerEndIf
Procedure animationCreate(*a.animation=0,isLooped=0,isattack=0,newRecovery=0,newName.s="No name")
	If Not *a
		*a=animationDataGive()
	EndIf
	Dim *a\frames.frame(0)
	*a\id=animationId
	*allAnimations(animationId)=*a
	animationId+1
	ReDim *allAnimations(animationId)
	animationSetLooped(*a,isLooped)
	animationSetAttack(*a,isattack)
	*a\recovery=newRecovery
	For i=0 To 5
		*a\animations[i]=0
	Next
	*a\name=newName
	FreeArray(*a\frontWind())
	FreeArray(*a\backWind())
	FreeArray(*a\projectiles())
	ProcedureReturn *a
EndProcedure

Procedure animationLoadWind(*a.animation,rec.i=#False)
	If *a\frontWind()
		For i=0 To ArraySize(*a\frontWind(),1)
			For j=0 To ArraySize(*a\frontWind(),2)
				animationLoad(*a\frontWind(i,j),#False,#False,#False,#False)
			Next	
		Next
	EndIf
	If *a\backWind()
		For i=0 To ArraySize(*a\backWind(),1)
			For j=0 To ArraySize(*a\backWind(),2)
				animationLoad(*a\backWind(i,j),#False,#False,#False,#False)
			Next
		Next
	EndIf
	If rec
		For i=0 To 5
			If *a\animations[i]
				animationLoadWind(*a\animations[i],#True)
			EndIf
		Next
	EndIf
EndProcedure

Procedure animationUnloadWind(*a.animation)
	If *a\frontWind()
		For i=0 To ArraySize(*a\frontWind(),1)
			For j=0 To ArraySize(*a\frontWind(),2)
				animationUnload(*a\frontWind(i,j))
			Next	
		Next
	EndIf
	If *a\backWind()
		For i=0 To ArraySize(*a\backWind(),1)
			For j=0 To ArraySize(*a\backWind(),2)
				animationUnload(*a\backWind(i,j))
			Next	
		Next
	EndIf
EndProcedure

Procedure animationLoad(*a.animation,rec.i=#False,half.i=#False,parallel.i=#False,winds.i=#True)
	If Not *a
		Debug "Attempted to load a null animation"
		ProcedureReturn
	EndIf
	; 	Debug "loading animation "+*a\name
	CompilerIf #H2H_DIGESTION_ENABLE
		If *a\digested=""
			If half
				For i=0 To ArraySize(*a\frames())
					If frameAlternator
						frameAddToLoad(*a\frames(i));,"",0,parallel)
						If winds
							animationLoadWind(*a)
						EndIf
						frameSetBuffed(*a\frames(i),0)
						frameAlternator=0
					Else
						frameSetBuffed(*a\frames(i),1)
						frameAlternator=1
					EndIf
				Next
			Else
				For i=0 To ArraySize(*a\frames())
					CompilerIf #H2H_THREADED_LOAD ; doesn't work, freezes
	; 					Debug "thread loading "+*a\frames(i)\path$
						CreateThread(@frameLoadSimple(),*a\frames(i))
					CompilerElse
						frameaddToLoad(*a\frames(i));,"",0,parallel)
						frameSetBuffed(*a\frames(i),0)
					CompilerEndIf
					If winds
						animationLoadWind(*a)
					EndIf
				Next
			EndIf
			If rec
				For i=0 To 5
					animationLoad(*a\animations[i],#True,half,parallel,winds)
				Next
			EndIf
		EndIf
	CompilerElse
		If half
			For i=0 To ArraySize(*a\frames())
				If frameAlternator
					frameAddToLoad(*a\frames(i));,"",0,parallel)
					If winds
						animationLoadWind(*a)
					EndIf
					frameSetBuffed(*a\frames(i),0)
					frameAlternator=0
				Else
					frameSetBuffed(*a\frames(i),1)
					frameAlternator=1
				EndIf
			Next
		Else
			For i=0 To ArraySize(*a\frames())
				frameaddToLoad(*a\frames(i));,"",0,parallel)
				frameSetBuffed(*a\frames(i),0)
				If winds
					animationLoadWind(*a)
				EndIf
			Next
		EndIf
		If rec
			For i=0 To 5
				animationLoad(*a\animations[i],#True,half,parallel,winds)
			Next
		EndIf
	CompilerEndIf
	
EndProcedure

Procedure animationUnload(*a.animation,rec.i=#False)
	If Not *a
		ProcedureReturn
	EndIf
	animationUnloadWind(*a)
	For i=0 To ArraySize(*a\frames())
		frameAddToUnload(*a\frames(i))
		frameSetBuffed(*a\frames(i),0)
	Next
	If rec
		For i=0 To 5
			animationUnload(*a\animations[i],#True)
		Next
	EndIf
EndProcedure

Procedure animationCopy(*destination.animation,*source.animation) ; sets a1 to the value of a2
	If *source And *destination
		CopyStructure(*source,*destination,animation)
		For f=0 To ArraySize(*destination\frontWind(),1)
			For i=0 To ArraySize(*destination\frontWind(),2)
				*destination\frontWind(f,i)=*source\frontWind(f,i)
			Next
		Next
		For f=0 To ArraySize(*destination\backWind(),1)
			For i=0 To ArraySize(*destination\backWind(),2)
				*destination\backWind(f,i)=*source\backWind(f,i)
			Next
		Next
		*source\index=0
	EndIf
EndProcedure

Macro animationIndex(a)
	a\index
EndMacro

Procedure.i animationAddFrameCase(*a.animation)
	If ArraySize(*a\frames())<>-1
		size=ArraySize(*a\frames())
		ReDim *a\frames(size+1)
	EndIf
	ProcedureReturn ArraySize(*a\frames())
EndProcedure

Procedure.i animationAddFrame(*a.animation,*f.frame)
	i=0
	If *a\frames(0)
		i=animationAddFrameCase(*a)
	EndIf
	*a\frames(i)=*f
	ProcedureReturn i
EndProcedure

Procedure animationAddAllFramesActions(*a.animation, amount.i, length.i, path.s, needflip.i, damage.i, damageType.i=0)
	For i=1 To amount
		If i-1=0
			animationAddFrameCase(*a)
		EndIf
		*a\frames(i-1)=frameCreate(0,length,path+i,1,emptySound,needflip,damage,0,damageType)
	Next
EndProcedure

Macro animationAddAllFrames(a,amount,length,path,needflip,damage,damageType)
	animationAddAllFramesActions(a,amount,length,path,needflip,damage,damageType)
EndMacro

Macro animationInit(a)
	a\index=0
EndMacro

; somewhat unused
; Macro animationIsEmpty(a)
; 	Bool(Not a Or Not a\frames() Or ArraySize(a\frames())=0)
; EndMacro

Procedure animationLength(*a.animation)
	l=0
	If *a
		For i=0 To ArraySize(*a\frames())
			l+*a\frames(i)\length
		Next
	EndIf
	ProcedureReturn l
EndProcedure

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure animationLengthRec(*a.animation)
		If *a
			l=animationLength(*a)
			For i=0 To 5
				If *a\animations[i]
					l+animationLengthRec(*a\animations[i])
				EndIf
			Next
			EndIf
		ProcedureReturn l
	EndProcedure
CompilerEndIf

Procedure.i animationAt(*a.animation,where.i)
	i=0
	While i<ArraySize(*a\frames()) And where>*a\frames(i)\length
		where-*a\frames(i)\length
		i+1
	Wend
; 	Debug "found at "+i
	ProcedureReturn *a\frames(i)
EndProcedure

Macro animationSetSomething(a,what,index,value)
	If a And a\frames() And index<=ArraySize(a\frames()) And a\frames(index)
		a\frames(index)\what=value
	CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Else
		If Not a
			DebuggerError("Animation is null !")
		Else
			If Not a\frames()
				DebuggerError("Frame array is null !")
			Else
				If index>ArraySize(a\frames())
					DebuggerError ("Index out of bounds ! Max is "+Str(ArraySize(a\frames()))+", got "+Str(index))
				Else
					If Not a\frames(index)
						DebuggerError("Frame is null !")
					EndIf
				EndIf
			EndIf
		EndIf
	CompilerEndIf
	EndIf
EndMacro

Procedure animationSetFrameLength(*a.animation,index.i,value.i)
	If Not *a
		ProcedureReturn
	EndIf
	If value<=0
		DebuggerError(*a\name+" frame "+Str(index)+" can't have value "+Str(value)+", must be greater than 1")
	EndIf
; 	If index>ArraySize(*a\frames())
; 		DebuggerError(*a\name+" frame "+Str(index)+" out of bounds ("+Str(ArraySize(*a\frames()))+")")
; 	EndIf
	animationSetSomething(*a,length,index,value)
EndProcedure

Macro animationSetFrameDamage(a,index,value)
	animationSetSomething(a,damage,index,value)
EndMacro

Macro animationSetFrameDamageDuration(a,index,value)
	animationSetSomething(a,damageDuration,index,value)
EndMacro

Macro animationSetFrameDamageType(a,index,value)
	animationSetSomething(a,damageType,index,value)
EndMacro

Macro animationSetFrameSound(a,index,newSoundId,stanceId=0)
	frameSetSound(a\frames(index),newSoundId,stanceId)
EndMacro

Macro animationSetFrameNeedCatch(a,index)
	frameSetNeedCatch(a\frames(index),1)
EndMacro

Macro animationSetFrameDamageCut(a,index)
	frameSetDamageCut(a\frames(index),1)
EndMacro

Macro animationSetFrameWindNeedCatch(a,index)
	frameSetWindNeedCatch(a\frames(index),1)
EndMacro

Macro animationSetFrameMovementDeltaNeedCatch(a,index)
	frameSetMovementDeltaNeedCatch(a\frames(index),1)
EndMacro

Macro animationFrameDisableSoundRec(a,index)
	frameSetNoRecSound(a\frames(index),1)
EndMacro

Macro animationSetFrameLocation(a,what,i,x,y)
	If x Or y
		If Not a\frames(i)\what
			a\frames(i)\what=locationCreate(x,y)
		Else
			set(a\frames(i)\what,x,y)
		EndIf
	EndIf
EndMacro

Macro animationSetFrameMovement(a,i,x=0,y=0)
	animationSetFrameLocation(a,movement,i,x,y)
EndMacro

Macro animationSetFrameMovementDelta(a,i,x=0,y=0)
	animationSetFrameLocation(a,movementD,i,x,y)
EndMacro

Macro animationSetFrameShadow(a,i,x=0,y=0)
	animationSetFrameLocation(a,shadowShift,i,x,y)
EndMacro

Macro animationSetFrameStun(a,i,value)
	a\frames(i)\stunDuration=value
EndMacro

Macro animationSetFramePush(a,i,x=0,y=0)
	animationSetFrameLocation(a,pushPower,i,x,y)
EndMacro

Macro animationSetFramePushD(a,i,x=0,y=0) ; delta
	animationSetFrameLocation(a,pushPowerD,i,x,y)
EndMacro

Macro animationSetFramePushI(a,i,x=0,y=0) ; instant
	animationSetFrameLocation(a,instantPush,i,x,y)
EndMacro

Macro animationSetFramePushR(a,i,x=0,y=0) ; relative
	animationSetFrameLocation(a,moveTargetTo,i,x,y)
EndMacro

Macro animationSetFrameShake(a,i,intensity=0)
	animationSetSomething(a,shake,i,intensity)
EndMacro

Macro animationSetFrameGrab(a,i)
	frameSetCatch(a\frames(i),#True)
EndMacro

Macro animationSetFramePureProjectile(a,i)
	frameSetPureProjectile(a\frames(i),#True)
EndMacro

Macro animationSetFrameOpacity(a,i,op=0)
	animationSetSomething(a,opacity,i,op)
EndMacro

Procedure animationSetExtended(*a.animation,includeWind.i=#True)
	For f=0 To ArraySize(*a\frames())
		frameSetExtended(*a\frames(f))
	Next
	If *a\frontWind()
		For f=0 To ArraySize(*a\frontWind(),1)
			For w=0 To ArraySize(*a\frontWind(),2)
				If *a\frontWind(f,w)
					animationSetExtended(*a\frontWind(f,w),includeWind)
				EndIf
			Next
		Next
	EndIf
	If *a\backWind()
		For f=0 To ArraySize(*a\backWind(),1)
			For w=0 To ArraySize(*a\backWind(),2)
				If *a\backWind(f,w)
					animationSetExtended(*a\backWind(f,w),includeWind)
				EndIf
			Next
		Next
	EndIf
EndProcedure

; return the total potential movement of this animation
Procedure.i animationRange(*a.animation)
	Protected range=0
	For i=0 To ArraySize(*a\frames())
		Protected *f.frame=*a\frames(i)
		If *f\movement
			range+*f\movement\x
		EndIf
		If *f\movementD
			range+*f\movementD\x* *f\length
		EndIf
	Next
	ProcedureReturn range
EndProcedure

; checks if the attack stuns
Procedure.i animationStun(*a.animation)
	If Not *a
		ProcedureReturn #False
	EndIf
	For i=0 To ArraySize(*a\frames())
		If *a\frames(i)\stunDuration
			ProcedureReturn #True
		EndIf
	Next
	ProcedureReturn #False
EndProcedure

; returns a random child animation type which has a stun
Procedure.i animationPickStun(*a.animation)
	Protected Dim *picked.animation(0)
	For i=0 To 5;ArraySize(*a\animations())
		If animationStun(*a\animations[i])
			If Not *picked(0)
				*picked(0)=*a\animations[i]
			Else
				ReDim *picked(ArraySize(*picked())+1)
				*picked(ArraySize(*picked()))=*a\animations[i]
			EndIf
		EndIf
	Next
	*p.animation=*picked(Random(ArraySize(*picked())))
	FreeArray(*picked())
	ProcedureReturn *p
EndProcedure

#H2H_COMBO_ENABLE_SHORTCUTS=1
CompilerIf #H2H_COMBO_ENABLE_SHORTCUTS
Procedure animationSetFrameCDN(*a.animation,i.i,when.i=-1)
	If when<0
		when=ArraySize(*a\frames())/2
	EndIf
	*a\frames(i)\canDoNext=when
	For j=i+1 To ArraySize(*a\frames())
		*a\frames(j)\canDoNext=1
	Next
EndProcedure
Procedure animationSetFrameCanMove(*a.animation,i.i,when.i=-1)
	If when<0
		when=ArraySize(*a\frames())/2
	EndIf
	*a\frames(i)\canMove=when
	For j=i+1 To ArraySize(*a\frames())
		*a\frames(j)\canMove=1
	Next
EndProcedure
CompilerEndIf

Macro animationSetFrameFreeMovement(f)
	frameSetFreeMovement(f,#True)
EndMacro

Procedure animationFreeMovement(*a.animation)
	If *a
		For i=0 To ArraySize(*a\frames())
			animationSetFrameFreeMovement(*a\frames(i))
		Next
	EndIf
EndProcedure

Procedure animationFreeMovementWind(*a.animation)
	If *a\frontWind()
		For i=0 To ArraySize(*a\frontWind(),1)
			For j=0 To ArraySize(*a\frontWind(),2)
				animationFreeMovement(*a\frontWind(i,j))
			Next
		Next
	EndIf
	If *a\backWind()
		For i=0 To ArraySize(*a\backWind(),1)
			For j=0 To ArraySize(*a\backWind(),2)
				animationFreeMovement(*a\backWind(i,j))
			Next
		Next
	EndIf
EndProcedure

#H2H_JSON_ANIMATION_ID="id"
#H2H_JSON_ANIMATION_FRAMES="frames"
#H2H_JSON_ANIMATION_RECOVERY="recovery"
#H2H_JSON_ANIMATION_LOOPSTART="loopStart"
#H2H_JSON_ANIMATION_NEUTRAL="neutral"
#H2H_JSON_ANIMATION_SIDE="side"
#H2H_JSON_ANIMATION_BACK="back"
#H2H_JSON_ANIMATION_UP="up"
#H2H_JSON_ANIMATION_DOWN="down"
#H2H_JSON_ANIMATION_HEAVY="heavy"
#H2H_JSON_ANIMATION_WINDFRONT="frontWind"
#H2H_JSON_ANIMATION_WINDBACK="backWind"
#H2H_JSON_ANIMATION_NAME="name"
#H2H_JSON_ANIMATION_TYPE="type"
#H2H_JSON_ANIMATION_PROJECTILES="projectiles"
#H2H_JSON_ANIMATION_FLAG="flag"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Declare animationJSONAdd(*parent,key$,*a.animation,optional.i=0)

Procedure.i animationJSONExport(*a.animation,*parent=0,export.i=#False)
	current=JSONindex
	If Not *a
		Debug "null animation !"
		ProcedureReturn 
	EndIf
	If Not *parent
		*parent=CreateJSONObject(current)
		JSONindex+1
	EndIf
; 	addJSONString(*parent,#H2H_JSON_ANIMATION_NAME,*a\name)
	addJSONInteger(*parent,#H2H_JSON_ANIMATION_ID,*a\id)
	addJSONInteger(*parent,#H2H_JSON_ANIMATION_RECOVERY,*a\recovery		,#True)
	addJSONInteger(*parent,#H2H_JSON_ANIMATION_LOOPSTART,*a\loopStart	,#True)
	addJSONInteger(*parent,#H2H_JSON_ANIMATION_TYPE,*a\animationType	,#True)
	addJSONInteger(*parent,#H2H_JSON_ANIMATION_FLAG,*a\flag,#True)
	
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_NEUTRAL,animationGetNeutral(*a),#True)
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_SIDE,animationGetSide(*a),#True)
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_BACK,animationGetBack(*a),#True)
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_UP,animationGetUp(*a),#True)
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_DOWN,animationGetDown(*a),#True)
	animationJSONAdd(*parent,#H2H_JSON_ANIMATION_HEAVY,animationGetHeavy(*a),#True)
	
	If *a\frontWind()
		*array=SetJSONArray(AddJSONMember(*parent,#H2H_JSON_ANIMATION_WINDFRONT))
		For f=0 To ArraySize(*a\frontWind(),1)
			For w=0 To ArraySize(*a\frontWind(),2)
				*child=AddJSONElement(*array)
				If *a\frontWind(f,w)
					SetJSONObject(*child)
					animationJSONExport(*a\frontWind(f,w),*child)
				Else
					SetJSONInteger(*child,0)
				EndIf
			Next
		Next
	EndIf
	If *a\backWind()
		*array=SetJSONArray(AddJSONMember(*parent,#H2H_JSON_ANIMATION_WINDBACK))
		For f=0 To ArraySize(*a\backWind(),1)
			For w=0 To ArraySize(*a\backWind(),2)
				*child=AddJSONElement(*array)
				If *a\backWind(f,w)
					SetJSONObject(*child)
					animationJSONExport(*a\backWind(f,w),*child)
				Else
					SetJSONInteger(*child,0)
				EndIf
			Next
		Next
	EndIf
	If *a\projectiles()
		*array=SetJSONArray(AddJSONMember(*parent,#H2H_JSON_ANIMATION_PROJECTILES))
		For f=0 To ArraySize(*a\projectiles(),1)
			For p=0 To ArraySize(*a\projectiles(),2)
				*child=AddJSONElement(*array)
				If *a\projectiles(f,p)
					SetJSONObject(*child)
					animationJSONExport(*a\projectiles(f,p),*child)
				Else
					SetJSONInteger(*child,0)
				EndIf
			Next
		Next
	EndIf
	*array=SetJSONArray(AddJSONMember(*parent,#H2H_JSON_ANIMATION_FRAMES))
	For f=0 To ArraySize(*a\frames())
		*child=SetJSONObject(AddJSONElement(*array))
		frameExportJSON(*a\frames(f),*child)
	Next
	If export
		SaveJSON(current,"test.txt",#PB_JSON_PrettyPrint)
	EndIf
	ProcedureReturn *parent
EndProcedure
Procedure animationJSONAdd(*parent,key$,*a.animation,optional.i=0)
	If Not optional Or *a
		*child=AddJSONMember(*parent,key$)
		SetJSONObject(*child)
		animationJSONExport(*a,*child)
	EndIf
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure animationJSONImport(*parent,*a.animation=0)
	If Not *parent
		ProcedureReturn #Null
	EndIf
	If Not *a
		*a=animationDataGive()
	EndIf
	If *allAnimations(0)
		animationId+1
		ReDim *allAnimations(animationId)
	EndIf
	*allAnimations(animationId)=*a
	*a\name=loadJSONString(*parent,#H2H_JSON_ANIMATION_NAME)
	*array=GetJSONMember(*parent,#H2H_JSON_ANIMATION_FRAMES)
	Protected size=0
	If *array
		size=JSONArraySize(*array)
		If *array
			Dim *a\frames(size-1)
			For i=0 To size-1
				*a\frames(i)=frameImportJSON(GetJSONElement(*array,i))
			Next
		EndIf
	EndIf
	*a\id=loadJSONInteger(*parent,#H2H_JSON_ANIMATION_ID)
	*a\recovery=loadJSONInteger(*parent,#H2H_JSON_ANIMATION_RECOVERY)
	*a\loopStart=loadJSONInteger(*parent,#H2H_JSON_ANIMATION_LOOPSTART)
	*a\animationType=loadJSONInteger(*parent,#H2H_JSON_ANIMATION_TYPE)
	*a\flag=loadJSONInteger(*parent,#H2H_JSON_ANIMATION_FLAG)
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_NEUTRAL)
	If *child
		animationGetNeutral(*a)=animationJSONImport(*child)
	EndIf
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_SIDE)
	If *child
		animationGetSide(*a)=animationJSONImport(*child)
	EndIf
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_BACK)
	If *child
		animationGetBack(*a)=animationJSONImport(*child)
	EndIf
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_UP)
	If *child
		animationGetUp(*a)=animationJSONImport(*child)
	EndIf
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_DOWN)
	If *child
		animationGetDown(*a)=animationJSONImport(*child)
	EndIf
	*child=GetJSONMember(*parent,#H2H_JSON_ANIMATION_HEAVY)
	If *child
		animationGetHeavy(*a)=animationJSONImport(*child)
	EndIf
	*array=GetJSONMember(*parent,#H2H_JSON_ANIMATION_WINDFRONT)
	If *array
		size2=JSONArraySize(*array)/size
		Dim *a\frontWind(size-1,size2-1)
		k=0
		For f=0 To size-1
			For w=0 To size2-1
				*e=GetJSONElement(*array,k)
				If JSONType(*e)=#PB_JSON_Object
					*a\frontWind(f,w)=animationJSONImport(*e)
				EndIf
				k+1
			Next
		Next
	EndIf
	*array=GetJSONMember(*parent,#H2H_JSON_ANIMATION_WINDBACK)
	If *array
		size2=JSONArraySize(*array)/size
		Dim *a\backWind(size-1,size2-1)
		k=0
		For f=0 To size-1
			For w=0 To size2-1
				*e=GetJSONElement(*array,k)
				If JSONType(*e)=#PB_JSON_Object
					*a\backWind(f,w)=animationJSONImport(*e)
				EndIf
				k+1
			Next
		Next
	EndIf
	*array=GetJSONMember(*parent,#H2H_JSON_ANIMATION_PROJECTILES)
	If *array
		size2=JSONArraySize(*array)/size
		Dim *a\projectiles(size-1,size2-1)
		k=0
		For f=0 To size-1
			For p=0 To size2-1
				*e=GetJSONElement(*array,k)
				If JSONType(*e)=#PB_JSON_Object
					*a\projectiles(f,p)=animationJSONImport(*e)
				EndIf
				k+1
			Next
		Next
	EndIf
	ProcedureReturn *a
EndProcedure
CompilerEndIf
; Procedure animationClearFrames(*a.animation)
; 	If Not *a
; 		ProcedureReturn
; 	EndIf
; 	For i=0 To ArraySize(*a\frames())
; 		frameUnload(*a\frames(i))
; 	Next
; 	For i=0 To 5
; 		animationClearFrames(*a\animations[i])
; 	Next
; EndProcedure

Macro animationEquals(a1,a2)
	Bool(a1=a2 Or (a1 And a2 And a1\id=a2\id))
EndMacro

Procedure animationSelectRandomCombo(*what.animation)
	If Not *what
		ProcedureReturn 0
	EndIf
	Dim *tmpArray.animation(0)
	For i=0 To 5
		If *what\animations[i]
  			Debug "found "+*what\animations[i]\name
			If *tmpArray(ArraySize(*tmpArray()))
				ReDim *tmpArray(ArraySize(*tmpArray())+1)
			EndIf
			*tmpArray(ArraySize(*tmpArray()))=*what\animations[i]
		EndIf
	Next
	*a.animation=*tmpArray(Random(ArraySize(*tmpArray())))
	FreeArray(*tmpArray())
	ProcedureReturn *a
EndProcedure

Procedure animationBranchAll()
	; will automaticaly branch all animations to their combo
	For i=0 To ArraySize(*allAnimations())
		If *allAnimations(i)
			*allAnimations(i)\animations[0]=animationGetNeutral(*allAnimations(i))
			*allAnimations(i)\animations[1]=animationGetSide(*allAnimations(i))
			*allAnimations(i)\animations[2]=animationGetBack(*allAnimations(i))
			*allAnimations(i)\animations[3]=animationGetUp(*allAnimations(i))
			*allAnimations(i)\animations[4]=animationGetDown(*allAnimations(i))
			*allAnimations(i)\animations[5]=animationGetHeavy(*allAnimations(i))
		EndIf
	Next
EndProcedure

;-> Gadget struct
Structure animationGadget
	*what.animation
	*where.location
	duration.i
	enabled.b
	display.b
	sub.d ; for delta
	absolute.d ; not bothered by screen focus
	index.i
	looped.b
	frameIndicator.i
	fliped.b ; boolean
	id.i
	layer.i
	freed.b
	color.i
	opacity.i ; whole gadget opacity
	colorIntensity.i
	indestructible.b
	stanceId.i ; for sound related indexes
	deltaFactor.d ; by default 1, the animation speed 
	
	hasFinished.b ; when looped
EndStructure

Global animationGindex.i=0
Global Dim *allAnimationGadget.animationGadget(0)

Enumeration
	#H2H_GADGET_LAYER_FRONT
	#H2H_GADGET_LAYER_BACK
EndEnumeration

#H2H_DATA_ANIMATION_GADGET_BASE=$40 ; increase if needed
Global DATA_ANIMATION_GADGET_BASE=#H2H_DATA_ANIMATION_GADGET_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_ANIMATION_GADGET_BASE=loadJSONInteger(*parent,"gadget")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataAnimationGadgetSize.i=DATA_ANIMATION_GADGET_BASE*SizeOf(animationGadget)
Global *dataAnimationGadget=AllocateMemory(dataAnimationGadgetSize)
Global dataAnimationGadgetindex=-1
Global Dim dataAnimationGadgetPile(7) ; byte indexes of available locations
Global dataAnimationGadgetPileIndex=-1

Procedure.i animationGadgetDataGive()
	If dataAnimationGadgetPileIndex>=0
		dataAnimationGadgetPileIndex-1
		If dataAnimationGadgetPile(dataAnimationGadgetPileIndex+1)<dataLocationSize
			ProcedureReturn *dataAnimationGadget+dataAnimationGadgetPile(dataAnimationGadgetPileIndex+1)
		EndIf
		ProcedureReturn dataAnimationGadgetPile(dataAnimationGadgetPileIndex+1)
	EndIf
	If dataAnimationGadgetindex>=DATA_ANIMATION_GADGET_BASE
		Debug "Created rogue gadget"
; 		End
		ProcedureReturn AllocateStructure(animationGadget)
	EndIf
	dataAnimationGadgetindex+1
	ProcedureReturn *dataAnimationGadget+dataAnimationGadgetindex*SizeOf(animationGadget)
EndProcedure

Procedure gadgetDestroyEx(*g.animationGadget)
	If dataAnimationGadgetPileIndex>=ArraySize(dataAnimationGadgetPile())
		ReDim dataAnimationGadgetPile( (ArraySize(dataAnimationGadgetPile())+1)*2-1 )
	EndIf
	dataAnimationGadgetPileIndex+1
	If *g>=*dataAnimationGadget And *g<*dataAnimationGadget+dataAnimationGadgetSize
		dataAnimationGadgetPile(dataAnimationGadgetPileIndex)=*g-*dataAnimationGadget
	Else
		dataAnimationGadgetPile(dataAnimationGadgetPileIndex)=*g
	EndIf
EndProcedure

Procedure gadgetPlaySound(*what.animationGadget,where.i=-9999,stanceId.i=-1)
	If *what And *what\what
		If stanceId<0
			stanceId=*what\stanceId
		EndIf
		If where=-9999
			If *what\where
				framePlaySound(*what\what\frames(*what\index),*what\where\x,stanceId)
			Else
				framePlaySound(*what\what\frames(*what\index),0,stanceId)
			EndIf
		Else
			framePlaySound(*what\what\frames(*what\index),where,stanceId)
		EndIf
	EndIf
EndProcedure
Declare gadgetReset(*what.animationGadget)
Procedure gadgetAnimationSet(*what.animationGadget,*withWhat.animation,stanceId.i=-1)
	If *what
		If *withWhat
			*what\what=*withWhat
			*what\index=0
			*what\frameIndicator=0
			If stanceId<0
				stanceId=*what\stanceId
			EndIf
			gadgetPlaySound(*what,-9999,stanceId)
		EndIf
	EndIf
EndProcedure

Procedure gadgetCreate(*what.animationGadget,*withWhat.animation,*where.location,howLong.i,isEnabled.i,isLooped.i,whatLayer.i=#H2H_GADGET_LAYER_FRONT,stanceId=0)
	If Not *what
		*what=animationGadgetDataGive()
	EndIf
	*what\what=*withWhat
	gadgetReset(*what)
	*what\display=1
	If *what\where And *what\freed
		locationDestroy(*what\where)
	EndIf
	*what\where=*where
	*what\duration=howLong
	*what\enabled=isEnabled
	*what\id=animationGindex
	*what\index=0
	*what\looped=isLooped
	*what\frameIndicator=0
	*what\opacity=255
	*what\color=-1
	*what\colorIntensity=255
	*what\freed=#False
	*what\sub=0
	*what\fliped=0
	*what\stanceId=stanceId
	*what\deltaFactor=1
	If *allAnimationGadget(0)
		ReDim *allAnimationGadget(animationGindex+1)
		animationGindex+1
	EndIf
	*allAnimationGadget(animationGindex)=*what
	*what\layer=whatLayer
	If *withWhat
		*withWhat\gadgetLoaded+1
		If *withWhat\frames(0)\movement
			*what\freed=#True
			If *where
				*what\where=locationCreate(*where\x,*where\y)
			Else
				*what\where=locationCreate()
			EndIf
			locationAddLoc(*what\where,*withWhat\frames(0)\movement)
		EndIf
		gadgetPlaySound(*what,-9999,*what\stanceId)
	EndIf
	ProcedureReturn *what
EndProcedure

Procedure gadgetDisplay(*what.animationGadget,c.i=-1,opacity.i=-1)
	If *what And *what\what And *what\enabled
		If opacity=-1
			opacity=255
		EndIf
		If opacity>0
			If *what\index>ArraySize(*what\what\frames())
				*what\index=ArraySize(*what\what\frames())
			EndIf
			Protected *currentFrame.frame=*what\what\frames(*what\index)
			Protected x=*what\where\x+*screenShake\x
			Protected y=*what\where\y+*screenShake\y
			If Not *what\absolute
				x-screenFocus
				y-screenFocusHeight
			EndIf
			If *what\color>=0 And c<0
				c=*what\color
			EndIf
; 			Debug "Color "+Hex(c)
			frameDisplay(*currentFrame,x,y,(opacity**what\opacity)/255,c,*what\fliped)
		EndIf
	EndIf
EndProcedure
; Declare animationSpawnWind(*a.animation,*where.location,direction.i,color.i=-1,opacity.i=255,intensity.i=128,white.i=#False,absolute.i=#False)
; Declare gadgetSpawnWind(*gadget.animationGadget,white.i=#False)
#H2H_DEBUG_GADGET=0

#H2H_FRAME_WIND_OPACITY_FACTOR=224
Global FRAME_WIND_OPACITY_FACTOR=224

Enumeration
	#H2H_FRAME_WIND_MODE_DISABLED
	#H2H_FRAME_WIND_MODE_HALVED
	#H2H_FRAME_WIND_MODE_ONLY_ACTIVE
	#H2H_FRAME_WIND_MODE_HALVED_NONACTIVE
	#H2H_FRAME_WIND_MODE_ENABLED
EndEnumeration

#H2H_FRAME_WIND_ENABLED_DEFAULT=#H2H_FRAME_WIND_MODE_ENABLED

Global windEnabled=#H2H_FRAME_WIND_ENABLED_DEFAULT

Procedure animationSpawnWindIndex(*a.animation,index.i,*where.location,direction.i,color.i=-1,opacity.i=255,intensity.i=255,white.i=#False,absolute.i=#False)
	If Not *a
		Debug "attempted to spawn wind from null animation", 2
		ProcedureReturn
	EndIf
	If windEnabled
		opacity=(opacity*#H2H_FRAME_WIND_OPACITY_FACTOR)/255
		Select windEnabled
			Case #H2H_FRAME_WIND_MODE_HALVED
				opacity/2
			Case #H2H_FRAME_WIND_MODE_HALVED_NONACTIVE
				If animationIsAttack(*a) And Not *a\frames(index)\hurtId
					opacity/2
				EndIf
		EndSelect
		If white
			intensity*3
		EndIf
		Protected size=0
		Protected t.i=(((((color>>24)*intensity)/255)*opacity)/255)
		If t>$FF
			t=$FF
		EndIf
		Protected t2.i=t/4
		Protected c.i=(color&$FFFFFF)+(t2<<24)
		If *a\frontWind()
			size=ArraySize(*a\frontWind(),2)
			For i=0 To size
				If *a\frontWind(index,i)
					*newGadget.animationGadget=gadgetCreate(0,*a\frontWind(index,i),*where,1,#True,0,#H2H_GADGET_LAYER_FRONT)
					*newGadget\fliped=direction
					*newGadget\absolute=absolute
 					If *newGadget\fliped
 						*newGadget\what\gadgetLoaded-1
 						*newGadget\what\gadgetLoadedMir+1
 					EndIf
					*newGadget\color=c
					;*newGadget\colorIntensity=((intensity/4)*opacity)/255
					*newGadget\opacity=opacity
					; Debug "spawned front wind "+i+" at "+toString(*where)
					CompilerIf #PB_Compiler_Debugger
						If *newGadget\layer<>#H2H_GADGET_LAYER_FRONT
							MessageRequester("Wait","That's illegal !")
						EndIf
					CompilerEndIf
					If frameIsFreeMovement(*newGadget\what\frames(0))
						*newGadget\freed=#True
						*newGadget\where=locationCreate(*newGadget\where\x,*newGadget\where\y)
					EndIf
				EndIf
			Next
		EndIf
		If white
			t2=t/3
		Else
			t2=t/2
		EndIf
		c=(color&$FFFFFF)+(t2<<24)
		If *a\backWind()
			size=ArraySize(*a\backWind(),2)
			For i=0 To size
				If *a\backWind(index,i)
					*newGadget.animationGadget=gadgetCreate(0,*a\backWind(index,i),*where,1,#True,0,#H2H_GADGET_LAYER_BACK)
					*newGadget\fliped=direction
					*newGadget\absolute=absolute
 					If *newGadget\fliped
 						*newGadget\what\gadgetLoaded-1
 						*newGadget\what\gadgetLoadedMir+1
					EndIf
					; Debug "spawned back wind "+i+" at "+toString(*where)
					*newGadget\color=c
					*newGadget\opacity=opacity
					CompilerIf #PB_Compiler_Debugger
						If *newGadget\layer<>#H2H_GADGET_LAYER_BACK
							MessageRequester("Wait","That's illegal !")
						EndIf
					CompilerEndIf
					If frameIsFreeMovement(*newGadget\what\frames(0))
						*newGadget\freed=#True
						*newGadget\where=locationCreate(*newGadget\where\x,*newGadget\where\y)
					EndIf
				EndIf
			Next
		EndIf
	EndIf
EndProcedure

Macro animationSpawnWind(a,where,direction,color=-1,opacity=255,intensity=255,white=#False,absolute=#False)
	animationSpawnWindIndex(a,a\index,where,direction,color,opacity,intensity,white,absolute)
EndMacro

Macro gadgetSpawnWind(gadget,white=#False)
	If gadget\display:animationSpawnWindIndex(gadget\what,gadget\index,gadget\where,gadget\fliped,gadget\color,gadget\opacity,gadget\colorIntensity,white,gadget\absolute):EndIf
EndMacro

Procedure gadgetRefresh(*what.animationGadget,delta.d=1.0)
	If Not *what
		CompilerIf #H2H_DEBUG_GADGET
			Debug "gadget null"
		CompilerEndIf
		ProcedureReturn
	EndIf
	CompilerIf #H2H_DEBUG_GADGET
		If Not *what\what
			If #H2H_DEBUG_GADGET
				Debug "gadget "+*what+" don't have any animation"
			EndIf
		EndIf
		If Not *what\enabled
			Debug "gadget "+*what+" is not enabled"
		EndIf
	CompilerEndIf
	If Not (*what\what And *what\enabled)
		CompilerIf #H2H_DEBUG_GADGET
			Debug "gadget "+*what+" has no animation"
		CompilerEndIf
		ProcedureReturn
	EndIf
	
	finished=0
	*what\sub+delta**what\deltaFactor
	iteration.i=Int(*what\sub)
	*what\sub-iteration
	If *what\index>ArraySize(*what\what\frames())
		*what\index=ArraySize(*what\what\frames())
	EndIf
	*currentFrame.frame=*what\what\frames(*what\index)
	For i=1 To iteration
		*what\frameIndicator+1
		Protected frameAmount=ArraySize(*what\what\frames())
		If *what\index>frameAmount
			*what\index=frameAmount
		EndIf
		*currentFrame=*what\what\frames(*what\index)
		If *currentFrame And Not finished
			If *what\frameIndicator>*currentFrame\length
				*what\frameIndicator-*currentFrame\length
				*what\index+1
				If *what\index>frameAmount
					If *what\looped
						finished=1
						*what\index=*what\what\loopStart ; by default 0
						*what\duration-1
						If *what\duration<=0
							*what\enabled=0
						Else
							If *what\display
								gadgetSpawnWind(*what)
								gadgetPlaySound(*what)
							EndIf
						EndIf
					Else
						*what\enabled=0
					EndIf
				Else
					*currentFrame=*what\what\frames(*what\index)
					; manual movement
					If frameIsFreeMovement(*currentFrame)
						If Not *what\freed
							*what\freed=#True
							*what\where=locationCreate(*what\where\x,*what\where\y)
						EndIf
					EndIf
					If *currentFrame\movement
						If Not *what\freed
							*what\where=locationCreate(*what\where\x,*what\where\y)
							*what\freed=#True
						EndIf
						If *what\fliped
							locationAdd(*what\where,-*currentFrame\movement\x,*currentFrame\movement\y)
						Else
							locationAddLoc(*what\where,*currentFrame\movement)
						EndIf
					EndIf
					If *what\display
						gadgetSpawnWind(*what)
						gadgetPlaySound(*what)
					EndIf
				EndIf
			EndIf
		EndIf
	Next
	If Not finished
		If *currentFrame\movementD
			If Not *what\freed
				*what\where=locationCreate(*what\where\x,*what\where\y)
				*what\freed=#True
			EndIf
			If *what\fliped
				locationAdd(*what\where,-*currentFrame\movementD\x*delta,*currentFrame\movementD\y*delta)
			Else
				locationAdd(*what\where,*currentFrame\movementD\x*delta,*currentFrame\movementD\y*delta)
			EndIf
		EndIf
	EndIf
	*what\hasFinished=finished
	ProcedureReturn finished
EndProcedure

Procedure gadgetReset(*what.animationGadget)
	If *what
		*what\enabled=1
		*what\index=0
		*what\frameIndicator=1
		gadgetPlaySound(*what)
		gadgetSpawnWind(*what) ; TODO get whiteness
	EndIf
EndProcedure

; Macro gadgetChangeAnimation(w,withWhat)
; 	w\what=withWhat:gadgetReset(w)
; EndMacro

Procedure gadgetDisplayAll(whatLayer.i=#H2H_GADGET_LAYER_FRONT)
	For i=0 To ArraySize(*allAnimationGadget())
		If *allAnimationGadget(i)=0
			Continue
		EndIf
		If *allAnimationGadget(i)\layer=whatLayer
			If *allAnimationGadget(i)\display
				gadgetDisplay(*allAnimationGadget(i))
			EndIf
		EndIf
	Next
EndProcedure

Declare gadgetDestroy(*what.animationGadget,destroyLoc.i=#False)
Procedure purgeAllGadget()
	Dim *newArray(ArraySize(*allAnimationGadget()))
	k=0
	For i=0 To ArraySize(*allAnimationGadget())
		If *allAnimationGadget(i)
			If Not *allAnimationGadget(i)\enabled And Not *allAnimationGadget(i)\indestructible
				gadgetDestroy(*allAnimationGadget(i))
			Else
				*newArray(k)=*allAnimationGadget(i)
				k+1
			EndIf
		EndIf
	Next
	If k>0
		animationGindex=k-1
	Else
		animationGindex=0
	EndIf
	ReDim *allAnimationGadget(animationGindex)
	For i=0 To animationGindex
		*allAnimationGadget(i)=*newArray(i)
	Next
	FreeArray(*newArray())
EndProcedure

Procedure refreshAllGadget(delta.d=1)
	dead=#False
	For i=0 To ArraySize(*allAnimationGadget())
		If Not *allAnimationGadget(i)
			dead=#True
			Continue
		EndIf
		gadgetRefresh(*allAnimationGadget(i),delta)
		If Not dead And Not *allAnimationGadget(i)\enabled; And Not *allAnimationGadget(i)\indestructible
			dead=#True
		EndIf
	Next
	If dead
		purgeAllGadget()
	EndIf
EndProcedure

Procedure animationDestroy(*a.animation)
	If *a
		If *a\frontWind()
			FreeArray(*a\frontWind())
		EndIf
		If *a\backWind()
			FreeArray(*a\backWind())
		EndIf
		If *a\projectiles()
			FreeArray(*a\projectiles())
		EndIf
		FreeStructure(*a)
	EndIf
EndProcedure

Procedure gadgetDestroy(*what.animationGadget,destroyLoc.i=#False)
	If Not *what
		ProcedureReturn
	EndIf
	If *what\freed
		locationDestroy(*what\where)
		*what\where=0
		*what\freed=0
	EndIf
	gadgetDestroyEx(*what)
EndProcedure

Procedure gadgetDestroyAll()
	Dim *indestructible.animationGadget(0)
	Protected k=0
	For i=0 To ArraySize(*allAnimationGadget())
		If *allAnimationGadget(i)
			If *allAnimationGadget(i)\indestructible
				If *indestructible(k)
					k+1
				EndIf
				ReDim *indestructible(k)
				*indestructible(k)=*allAnimationGadget(i)
			Else
				gadgetDestroy(*allAnimationGadget(i))
			EndIf
		EndIf
	Next
	ReDim *allAnimationGadget(k)
	For i=0 To k
		Debug "saved "+*indestructible(i)
		*allAnimationGadget(i)=*indestructible(i)
	Next
	FreeArray(*indestructible())
	animationGindex=k
EndProcedure

Procedure.i gadgetSpawnEffect(*a.animation,*where.location,layer.i,fliped.i)
	*newGadget.animationGadget=gadgetCreate(0,*a,locationCreate(*where\x,*where\y),1,1,0,layer.i)
	*newGadget\fliped=fliped
	*newGadget\freed=#True
	ProcedureReturn *newGadget
EndProcedure

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure animationPrepareWind(*a.animation,dimension.i=0)
		FreeArray(*a\frontWind())
		Dim *a\frontWind(ArraySize(*a\frames()),dimension)
		FreeArray(*a\backWind())
		Dim *a\backWind(ArraySize(*a\frames()),dimension)
	EndProcedure
CompilerEndIf

Procedure animationCanDoNext(*a.animation,when)
	index.i=*a\index
	If index>ArraySize(*a\frames())
		index=ArraySize(*a\frames())
	EndIf
	ProcedureReturn Bool(frameCanDoNext(*a\frames(index),when))
EndProcedure

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure animationCountFrames(*a.animation)
		If Not *a
			ProcedureReturn 0
		EndIf
		Debug "===== For animation "+*a\name
		Protected count=ArraySize(*a\frames())
		For i=0 To 5
			count+animationCountFrames(*a\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
	Procedure animationCountAnimations(*a.animation)
		If Not *a
			ProcedureReturn 0
		EndIf
		Debug "===== For animation "+*a\name
		Protected count=1
		For i=0 To 5
			count+animationCountAnimations(*a\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1180
; FirstLine = 1056
; Folding = ------xf3+------+-----
; EnableXP
; CPU = 1