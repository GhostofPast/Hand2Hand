;- struct is in player

#H2H_DATA_DAMAGEGADGET_BASE=$10
Global DATA_DAMAGEGADGET_BASE=#H2H_DATA_DAMAGEGADGET_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_DAMAGEGADGET_BASE=loadJSONInteger(*parent,"damageGadget")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataDamageGadgetSize.i=DATA_DAMAGEGADGET_BASE*SizeOf(damageGadget)
Global *dataDamageGadget=AllocateMemory(dataDamageGadgetSize,#PB_Memory_NoClear)
Global dataDamageGadgetIndex=0
Global Dim dataDamageGadgetPile(7) ; byte indexes of available locations
Global dataDamageGadgetPileIndex=-1

Global NewList *allDamageGadgets.damageGadget()

; creates a damage gadget colored of the player by default
Procedure.i damageGadgetCreate(*who.player,*whatRef.animation,*whatAnimation.animation,x.i,y.i,*b.background)
	If *whatRef And *whatAnimation
		*dg.damageGadget
		If dataDamageGadgetPileIndex>-1
			If dataDamageGadgetPile(dataDamageGadgetPileIndex)<dataDamageDataSize
				*dg=*dataDamageGadget+dataDamageGadgetPile(dataDamageGadgetPileIndex)
			Else
				*dg=dataDamageGadgetPile(dataDamageGadgetPileIndex)
			EndIf
			dataDamageGadgetPileIndex-1
		Else
			If dataDamageGadgetIndex>=dataDamageGadgetSize
				Debug "Not enough damage gadgets !"
				*dg=AllocateStructure(damageGadget)
; 				MessageRequester("warning","reallocate damage gadget")
; 				End
; 				dataDamageGadgetSize*2
; 				*dataDamageGadget=ReAllocateMemory(*dataDamageGadget,dataDamageGadgetSize,#PB_Memory_NoClear)
			Else
				*dg=*dataDamageGadget+dataDamageGadgetIndex
				*dg\animation=animationDataGive()
				dataDamageGadgetIndex+SizeOf(damageGadget)
			EndIf
		EndIf
		*dg\player=*who
		*dg\animation=*whatAnimation
		*dg\ref=*whatRef
		*dg\position=locationCreate(x,y)
		*dg\direction=*who\lockedDirection
		*dg\color=playerGetColor(*who)
		*dg\frameIndicator=1
		*dg\frameIndex=0
		NewList *dg\hit()
		Protected *f.frame=*dg\animation\frames(0)
		If *f\movement
			If *dg\direction
				locationAdd(*dg\position,-*f\movement\x,*f\movement\y)
			Else
				locationAdd(*dg\position,*f\movement\x,*f\movement\y)
			EndIf
		EndIf
		
		If *b\white
			*dg\colorIntensity=playerGetColorIntensity(*who)
		Else
			*dg\colorIntensity=playerGetColorIntensity(*who)/2
		EndIf
		*currentFrame.frame=*dg\animation\frames(0)
		frameLoad(*currentFrame)
		If *dg\direction
			framePlaySound(*currentFrame,x-screenFocus+shiftFlip(*currentFrame\shift)+SpriteWidth(*currentFrame\id)/2)
		Else
			framePlaySound(*currentFrame,x-screenFocus+shiftN(*currentFrame\shift)+SpriteWidth(*currentFrame\id)/2)
		EndIf
		animationSpawnWindIndex(*whatAnimation,0,*dg\position,*dg\direction,playerGetColor(*dg\player),255,playerGetColorIntensity(*dg\player),*b\white)
		screenShakeAdd(*f\shake,*f\shake)

		AddElement(*allDamageGadgets())
		
		*allDamageGadgets()=*dg
	EndIf
	ProcedureReturn *dg
EndProcedure

; Return true if the gadget is about to be finished
Procedure.i damageGadgetRefresh(*dg.damageGadget,delta.d)
	*dg\sub+delta
	Protected destroy.i=#False
	While *dg\sub>1 And Not destroy
		*dg\sub-1
		*dg\frameIndicator+1
		*currentFrame.frame=*dg\animation\frames(*dg\frameIndex)
		If *dg\frameIndicator>*dg\animation\frames(*dg\frameIndex)\length
			*dg\frameIndicator-*currentFrame\length
			*dg\frameIndex+1
			If *dg\frameIndex>ArraySize(*dg\animation\frames())
				*dg\frameIndex=ArraySize(*dg\animation\frames())
				destroy=#True
				*currentFrame=*dg\animation\frames(*dg\frameIndex)
				*dg\frameIndicator=1
			Else
				*currentFrame=*dg\animation\frames(*dg\frameIndex)
				If *currentFrame\movement
					If *dg\direction
						locationAdd(*dg\position,-*currentFrame\movement\x,*currentFrame\movement\y)
					Else
						locationAdd(*dg\position,*currentFrame\movement\x,*currentFrame\movement\y)
					EndIf
				EndIf
				If frameIsDamageCut(*currentFrame)
					ClearList(*dg\hit())
				EndIf
				If *currentFrame\soundId
					frameLoad(*currentFrame)
					f=0
					If *dg\direction
						f=shiftFlip(*currentFrame\shift)
					Else
						f=shiftN(*currentFrame\shift)
					EndIf
					framePlaySound(*currentFrame,*dg\position\x-screenFocus+f+SpriteWidth(*currentFrame\id)/2)
				EndIf
				screenShakeAdd(*currentFrame\shake,*currentFrame\shake)
			EndIf
		EndIf
		*currentFrame=*dg\animation\frames(*dg\frameIndex)
		If *currentFrame\movementD
			If *dg\direction
				locationAdd(*dg\position,-*currentFrame\movementD\x,*currentFrame\movementD\y)
			Else
				locationAdd(*dg\position,*currentFrame\movementD\x,*currentFrame\movementD\y)
			EndIf
		EndIf
	Wend
	ProcedureReturn destroy
EndProcedure

Procedure damageGadgetDisplay(*dg.damageGadget,withDebug.i=#False)
	If *dg\animation\frames(*dg\frameIndex)
		*currentFrame.frame=*dg\animation\frames(*dg\frameIndex)
		frameDisplay(*currentFrame,*dg\position\x-screenFocus+*screenShake\x,*dg\position\y-screenFocusHeight+*screenShake\y,255,*dg\color,*dg\direction)
		If withDebug And *currentFrame\hurtId
			If Not *currentFrame\damageDuration Or *currentFrame\damageDuration<*dg\frameIndex
				frameHurtDisplay(*currentFrame,*dg\position\x-screenFocus+*screenShake\x,*dg\position\y-screenFocusHeight+*screenShake\y,128,0,*dg\direction)
			Else
				frameHurtDisplay(*currentFrame,*dg\position\x-screenFocus+*screenShake\x,*dg\position\y-screenFocusHeight+*screenShake\x,32,0,*dg\direction)
			EndIf
; 			x=*dg\position\x-screenFocus
; 			y=*dg\position\y+*currentFrame\hurtShift\y-screenFocusHeight
; 			If frameExtended(*currentFrame)
; 				x+#H2H_LOCATION_SHIFT_CONVERT
; 				y+#H2H_LOCATION_SHIFT_CONVERT
; 			EndIf
; 			If *dg\direction
; 				If frameHurtXFlipNegative(*currentFrame)
; 					x-shiftFlip(*currentFrame\hurtShift)
; 				Else
; 					x+shiftFlip(*currentFrame\hurtShift)
; 				EndIf
; 				DisplaySpriteOptional(*currentFrame\hurtFlip,x,y,128)
; 			Else
; 				If frameHurtXFlipNegative(*currentFrame)
; 					x-shiftN(*currentFrame\hurtShift)
; 				Else
; 					x+shiftN(*currentFrame\hurtShift)
; 				EndIf
; 				DisplaySpriteOptional(*currentFrame\hurtId,x,y,128)
; 			EndIf
		EndIf
	EndIf
EndProcedure

Procedure damageGadgetDisplayAll(withDebug.i=#False)
	ForEach *allDamageGadgets()
		damageGadgetDisplay(*allDamageGadgets(),withDebug)
	Next
EndProcedure

Procedure damageGadgetHasHit(*dg.damageGadget,*target.player)
	If ListSize(*dg\hit())=0
		ProcedureReturn #False
	EndIf
	ForEach *dg\hit()
		If *dg\hit()=*target
			ProcedureReturn #True
		EndIf
	Next
	ProcedureReturn #False
EndProcedure

Procedure damageGadgetApply(*dg.damageGadget,*target.player,delta.d)
	If playerIsDodgeActive(*target)
		ProcedureReturn
	EndIf
	*currentFrame.frame=*dg\animation\frames(*dg\frameIndex)
	If Not damageGadgetHasHit(*dg,*target) And (Not *currentFrame\damageDuration Or *currentFrame\damageDuration<=*dg\frameIndicator)
		If playerIsTouchingPlayer(*dg\player,*target,*currentFrame,*dg\position)
			damage=playerProcessDamage(*dg\player,*target,*currentFrame)
			playerhurt(*dg\player,*target,*currentFrame,damage,#True,*dg\player\currentStance\materialClass(*currentFrame\damageSide),delta)
; 			damageDataAdd(*dg\player,*target,damage,*currentFrame\stunDuration,*currentFrame\pushPower,*currentFrame\pushPowerD,*currentFrame\moveTargetTo)
			If *dg\player\currentAnimation\id=*dg\ref\id
				playerHit(*dg\player,*target)
			Else
				playerHitAdd(*dg\player,*target)
			EndIf
			AddElement(*dg\hit())
			*dg\hit()=*target
		EndIf
	Else
		If playerIsTouchingPlayer(*dg\player,*target,*currentFrame,*dg\position)
			playerhurt(*dg\player,*target,*currentFrame,0,0,0,delta)
		EndIf
	EndIf
EndProcedure

; TODO manage whole games with groups
Procedure damageGadgetApplyAllGroup(*group.group,delta.d)
	ForEach *group\players()
		*p.player=*group\players()
		ForEach *allDamageGadgets()
			If *p<>*allDamageGadgets()\player
				damageGadgetApply(*allDamageGadgets(),*p,delta)
			EndIf
		Next
	Next
EndProcedure

Procedure damageGadgetDestroy(*dg.damageGadget)
	If *dg
		dataDamageGadgetPileIndex+1
		If dataDamageGadgetPileIndex>=ArraySize(dataDamageGadgetPile())
			ReDim dataDamageGadgetPile( (ArraySize(dataDamageGadgetPile())+1)*2 -1)
		EndIf
		If *dg>=*dataDamageGadget And *dg<=*dataDamageGadget+dataDamageDataSize
			dataDamageGadgetPile(dataDamageGadgetPileIndex)=*dg-*dataDamageGadget
		Else
			dataDamageGadgetPile(dataDamageGadgetPileIndex)=*dg
		EndIf
 		locationDestroy(*dg\position)
		FreeList(*dg\hit())
	EndIf
EndProcedure

Procedure damageGadgetDestroyAll()
	ForEach *allDamageGadgets()
		damageGadgetDestroy(*allDamageGadgets())
		DeleteElement(*allDamageGadgets())
	Next
EndProcedure

Procedure damageGadgetRefreshAll(delta.d)
	ForEach *allDamageGadgets()
		If damageGadgetRefresh(*allDamageGadgets(),delta)
			damageGadgetDestroy(*allDamageGadgets())
			DeleteElement(*allDamageGadgets())
		EndIf
	Next
EndProcedure

; could not be usefull afterall
;Structure damageModel
;	*a.animation
;	*where.position ; instant shift when spawned
	
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 144
; FirstLine = 122
; Folding = --
; EnableXP
; DPIAware
; CPU = 4