
Structure damageGadget
	id.i
	*animation.animation
	*ref.animation ; to which animation it is refered for damage hit check
	*player.player
	List *hit()
	sub.d
	frameIndex.i
	frameIndicator.i
	direction.i
	color.i ; can be different than the player
	colorIntensity.i
	*position.location
EndStructure

Global NewList *allDamageGadgets.damageGadget()

; creates a damage gadget colored of the player by default
Procedure.i damageGadgetCreate(*who.player,*whatRef.animation,*whatAnimation.animation,x.i,y.i,*b.background)
	If *whatRef And *whatAnimation
		*dg.damageGadget=AllocateStructure(damageGadget)
		*dg\player=*who
		*dg\animation=*whatAnimation
		*dg\ref=*whatRef
		*dg\position=locationCreate(x,y)
		*dg\direction=*who\lockedDirection
		*dg\color=playerGetColor(*who)
		
		If *b\white
			*dg\colorIntensity=playerGetColorIntensity(*who)
		Else
			*dg\colorIntensity=playerGetColorIntensity(*who)/2
		EndIf
		Debug "spawn projectile for "+*whatRef\name+" with "+*whatAnimation\name

		framePlaySound(*dg\animation\frames(0),x)
		Protected *f.frame=*dg\animation\frames(0)
		animationSpawnWindIndex(*whatAnimation,0,*dg\position,*dg\direction,playerGetColor(*dg\player),255,playerGetColorIntensity(*dg\player),*b\white)
		If *f\movement
			locationAddLoc(*dg\position,*f\movement)
		EndIf
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
			*dg\frameIndicator=0
			*dg\frameIndex+1
			If *dg\frameIndex>ArraySize(*dg\animation\frames())
				*dg\frameIndex=ArraySize(*dg\animation\frames())
				destroy=#True
				*currentFrame=*dg\animation\frames(*dg\frameIndex)
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
				framePlaySound(*currentFrame,*dg\position\x)
				screenShakeAdd(*currentFrame\shake,*currentFrame\shake)
			EndIf
		EndIf
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
		x=*dg\position\x-screenFocus
		y=*dg\position\y+*currentFrame\shift\y-screenFocusHeight
		frameLoad(*currentFrame)
		If *dg\direction
			x+*currentFrame\shift\x/1000
		Else
			x+Mod(*currentFrame\shift\x,1000)
		EndIf
		frameFlip(*currentFrame,*dg\direction)
		DisplaySpriteOptional(*currentFrame\id,x,y)
		If *dg\color>=0
			DisplaySpriteOptional(*currentFrame\id,x,y,*dg\colorIntensity,*dg\color)
		EndIf
		If withDebug And *currentFrame\hurtId
			x=*dg\position\x-screenFocus
			y=*dg\position\y+*currentFrame\hurtShift\y-screenFocusHeight
			If *dg\direction
				x+*currentFrame\hurtShift\x/1000
			Else
				x+Mod(*currentFrame\hurtShift\x,1000)
			EndIf
			DisplaySpriteOptional(*currentFrame\hurtId,x,y,128)
		EndIf
		;frameDisplay(*dg\animation\frames(*dg\frameIndex),*dg\position\x-screenFocus,*dg\position\y-screenFocusHeight,255,*dg\color,*dg\direction,*dg\colorIntensity)
	EndIf
EndProcedure

Procedure damageGadgetDisplayAll(withDebug.i=#False)
	ForEach *allDamageGadgets()
		damageGadgetDisplay(*allDamageGadgets(),withDebug)
	Next
EndProcedure

Procedure damageGadgetApply(*dg.damageGadget,*target.player,delta.d)
; 	Debug "loop for "+*dg
	If Not hasHit(*dg\player,*target)
		*currentFrame.frame=*dg\animation\frames(*dg\frameIndex)
		If isPlayerTouchingPlayer(*dg\player,*target,*currentFrame,*dg\position)
; 			Debug "touch"
			damage=processDamage(*dg\player,*target,*currentFrame)
			playerhurt(*dg\player,*target,*currentFrame,damage,#True,*dg\player\currentStance\materialClass(*currentFrame\damageSide),delta)
			damageDataAdd(*dg\player,*target,damage,*currentFrame\stunDuration,*currentFrame\movement,*currentFrame\movementD,*currentFrame\moveTargetTo)
			If *dg\player\currentAnimation\id=*dg\ref\id
				playerHit(*dg\player,*target)
			Else
				playerHitAdd(*dg\player,*target)
			EndIf
		Else
			playerhurt(*dg\player,*target,*currentFrame,0,#False,0,delta)
		EndIf
	EndIf
EndProcedure

; TODO manage whole games with groups
Procedure damageGadgetApplyAllGroup(*group.group,delta.d)
	ForEach *group\players()
		*p.player=*group\players()
		ForEach *allDamageGadgets()
; 			Debug "loop out for "+*allDamageGadgets()
			If *p<>*allDamageGadgets()\player
				damageGadgetApply(*allDamageGadgets(),*p,delta)
			EndIf
		Next
	Next
EndProcedure

Procedure damageGadgetDestroy(*dg.damageGadget)
	If *dg
		locationDestroy(*dg\position)
		FreeList(*dg\hit())
		FreeStructure(*dg)
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
; CursorPosition = 42
; FirstLine = 11
; Folding = --
; EnableXP
; DPIAware