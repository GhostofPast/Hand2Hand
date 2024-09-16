XIncludeFile "frameshift.pb"
;- Frame struct
Structure frame
	id.i ; What sprite is used
	length.i ; number of frames
	hurtId.i ;used for the corresponding hurtbox
	hurtFlip.i ;used for the correspinding mirrored hurtbox
	soundId.i  ; if >0 then play the coresponding sound
	damage.c	 ; if >0 inflict damage in collision
	canDoNext.b			   ; if >0 indicates the combo can start from here, at the specified frame indicator if needed
	canMove.b				; if >0 the player can move after this frame indicator
	*movement.location	   ; indicates the forced movement at each frames.
	*movementD.location	   ; indicates the added delta at each frames
	*shift.location		   ; coordinates of the 0x0 based on the 1000x1000 image. The flip must be get with a /1000 and the normal %1000
	*hurtShift.location	   ; same but for the hurtbox
	*pushPower.location	   ; applies a specific movement to the target
	*instantPush.location  ; applies an instant movement to the target once
	*moveTargetTo.location ; When hit the target will be moved relative to the player
	
	*pushPowerD.location   ; applies a specific delta to the target which cumulates, increased by weight + strength, reduced by endurance
	stunDuration.c		   ; applies a stun duration to the target, increased by weight + strength, reduced by endurance
	damageType.b
	damageSide.b ; Defined by the user, will indicates with which side the unit attacks. For example a screwdriver have one metal spike and a blunt plastic handle.
				 ; If equal to 0, will use default damageType/materialClass combo.
	damageDuration.c ; if >0, indicates when the frames no longer checks damage
	shake.c			 ; when reaching this frame, will shake with this intensity, cumulates

	*shadowShift.location ; changes the shadow sprite display depending on the position of the hand, only relevant for spawn & death animations
	path$
	bufferTimeout.i
	
	hurtPath$ ; if specified, will pick this path for the hurt
; 	isBuffed.i
; 	isLoaded.i
; 	isFliped.i
; 	catch.i			 ; If true, will stop the player movements then keep him from moving further as long as he is caught on the ennemy frame
;	freeMovement.i		   ; for wind effects of players. If enabled will detach the wind movement from the player
;	noRecSound.i ; if >0 then the sound will not do its recursive sound
;	damageCut.i	 ; if >0 reset animation damage limit
; 	needCatch.b			   ; if >0 indicates to the animation to continue or not if it hit before
;	pureProjectileDamage.c ; if <> 0 the damage is not altered from the dealer
; 	windNeedCatch.b ; bitwise mask for which wind effect is being used, from front wind to back wind ; only if it has hit before
;	movementDNeedCatch.i   ; enables the delta movement
	
	flag.c
EndStructure

EnumerationBinary
	#H2H_FRAME_FLAG_BUFFED
	#H2H_FRAME_FLAG_LOADED	
	#H2H_FRAME_FLAG_FLIPED	
	#H2H_FRAME_FLAG_CATCH
	#H2H_FRAME_FLAG_FREE_MOVEMENT
	#H2H_FRAME_FLAG_NO_REC_SOUND
	#H2H_FRAME_FLAG_DAMAGE_CUT
	#H2H_FRAME_FLAG_NEED_CATCH
	#H2H_FRAME_FLAG_PURE_PROJECTILE_DAMAGE
	#H2H_FRAME_FLAG_WIND_NEED_CATCH
	#H2H_FRAME_FLAG_MOVEMENT_DELTA_NEED_CATCH
	#H2H_FRAME_FLAG_SHIFT_X_NEGATIVE
	#H2H_FRAME_FLAG_SHIFT_X_FLIP_NEGATIVE
	#H2H_FRAME_FLAG_SHIFT_Y_NEGATIVE
EndEnumeration

Macro frameIsLoaded(f)
	(f\flag&#H2H_FRAME_FLAG_LOADED)
EndMacro
Macro frameIsBuffed(f)
	(f\flag&#H2H_FRAME_FLAG_BUFFED)
EndMacro
Macro frameIsFliped(f)
	(f\flag&#H2H_FRAME_FLAG_FLIPED)
EndMacro
Macro frameIsCatch(f)
	(f\flag&#H2H_FRAME_FLAG_CATCH)
EndMacro
Macro frameIsFreeMovement(f)
	(f\flag&#H2H_FRAME_FLAG_FREE_MOVEMENT)
EndMacro
Macro frameIsNoRecSound(f)
	(f\flag&#H2H_FRAME_FLAG_NO_REC_SOUND)
EndMacro
Macro frameIsDamageCut(f)
	(f\flag&#H2H_FRAME_FLAG_DAMAGE_CUT)
EndMacro
Macro frameNeedCatch(f)
	(f\flag&#H2H_FRAME_FLAG_NEED_CATCH)
EndMacro
Macro frameIsPureProjectile(f)
	(f\flag&#H2H_FRAME_FLAG_PURE_PROJECTILE_DAMAGE)
EndMacro
Macro frameWindNeedCatch(f)
	(f\flag&#H2H_FRAME_FLAG_WIND_NEED_CATCH)
EndMacro
Macro frameMovementDeltaNeedCatch(f)
	(f\flag&#H2H_FRAME_FLAG_MOVEMENT_DELTA_NEED_CATCH)
EndMacro
Macro frameShiftXNegative(f)
	(f\flag&#H2H_FRAME_FLAG_SHIFT_X_NEGATIVE)
EndMacro
Macro frameShiftXFlipNegative(f)
	(f\flag&#H2H_FRAME_FLAG_SHIFT_X_FLIP_NEGATIVE)
EndMacro
Macro frameShiftYNegative(f)
	(f\flag&#H2H_FRAME_FLAG_SHIFT_Y_NEGATIVE)
EndMacro
Macro frameShiftYFlipNegative(f)
	(f\flag&#H2H_FRAME_FLAG_SHIFT_Y_FLIP_NEGATIVE)
EndMacro

Macro frameSetLoaded(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_LOADED:Else:f\flag&(~#H2H_FRAME_FLAG_LOADED):EndIf
EndMacro

Macro frameSetBuffed(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_BUFFED:Else:f\flag&(~#H2H_FRAME_FLAG_BUFFED):EndIf
EndMacro

Macro frameSetFlipped(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_FLIPED:Else:f\flag&(~#H2H_FRAME_FLAG_FLIPED):EndIf
EndMacro

Macro frameSetCatch(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_CATCH:Else:f\flag&(~#H2H_FRAME_FLAG_CATCH):EndIf
EndMacro

Macro frameSetFreeMovement(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_FREE_MOVEMENT:Else:f\flag&(~#H2H_FRAME_FLAG_FREE_MOVEMENT):EndIf
EndMacro

Macro frameSetNoRecSound(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_NO_REC_SOUND:Else:f\flag&(~#H2H_FRAME_FLAG_NO_REC_SOUND):EndIf
EndMacro

Macro frameSetDamageCut(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_DAMAGE_CUT:Else:f\flag&(~#H2H_FRAME_FLAG_DAMAGE_CUT):EndIf
EndMacro

Macro frameSetNeedCatch(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_NEED_CATCH:Else:f\flag&(~#H2H_FRAME_FLAG_NEED_CATCH):EndIf
EndMacro

Macro frameSetPureProjectile(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_PURE_PROJECTILE_DAMAGE:Else:f\flag&(~#H2H_FRAME_FLAG_PURE_PROJECTILE_DAMAGE):EndIf
EndMacro

Macro frameSetWindNeedCatch(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_WIND_NEED_CATCH:Else:f\flag&(~#H2H_FRAME_FLAG_WIND_NEED_CATCH):EndIf
EndMacro

Macro frameSetMovementDeltaNeedCatch(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_MOVEMENT_DELTA_NEED_CATCH:Else:f\flag&(~#H2H_FRAME_FLAG_MOVEMENT_DELTA_NEED_CATCH):EndIf
EndMacro

Macro frameSetShiftXNegative(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_SHIFT_X_NEGATIVE:Else:f\flag&(~#H2H_FRAME_FLAG_SHIFT_X_NEGATIVE):EndIf
EndMacro

Macro frameSetShiftYNegative(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_SHIFT_Y_NEGATIVE:Else:f\flag&(~#H2H_FRAME_FLAG_SHIFT_Y_NEGATIVE):EndIf
EndMacro

Macro frameSetShiftXFlipNegative(f,v=1)
	If v:f\flag|#H2H_FRAME_FLAG_SHIFT_X_FLIP_NEGATIVE:Else:f\flag&(~#H2H_FRAME_FLAG_SHIFT_X_FLIP_NEGATIVE):EndIf
EndMacro

Global Dim *allFrames.frame(1)
Global nbFrame.i=0
Global NewList *frameBuffer.frame()
Global NewList *frameToUnBuff.frame()

Macro frameAddToBuffer(f)
	AddElement(*frameBuffer()):*frameBuffer()=f
EndMacro

Enumeration 1
	#H2H_FRAME_BUFFER_ON 					; everything is buffed
	;#H2H_FRAME_BUFFER_ONLY_BASIC			; All basic animations are loaded, the rest is buffed
	;#H2H_FRAME_BUFFER_ON_PLUS_HALF			; Half of all frames are loaded, the rest is buffed
	;#H2H_FRAME_BUFFER_ONLY_BASIC_PLUS_HALF	; All basic animations and half of other frames are loaded, the rest is buffed
	#H2H_FRAME_BUFFER_OFF					; everything is loaded
EndEnumeration
#H2H_FRAME_BUFFER_DEFAULT=#H2H_FRAME_BUFFER_OFF
Global buffedFrames.i=#H2H_FRAME_BUFFER_DEFAULT
Global frameAlternator.i=0

Macro fileExist(FileName)
	Bool(FileSize(FileName)>0)
EndMacro

#H2H_FRAME_MODE_CLASSIC=1
#H2H_FRAME_MODE_ATLAS=2
#H2H_FRAME_MODE=#H2H_FRAME_MODE_CLASSIC

Procedure.i importFrame(FileName$)
	If FileSize(FileName$)>0
		LoadSprite(spriteIndex,FileName$,#PB_Sprite_AlphaBlending)
		ProcedureReturn #True
	EndIf
	ProcedureReturn #False
EndProcedure

#H2H_DATA_FRAME_BASE=$1000 ; increase if needed
Global dataFrameSize.i=#H2H_DATA_FRAME_BASE*SizeOf(frame)
Global *dataFrame=AllocateMemory(dataFrameSize)
Global dataFrameindex=0
; Debug "size of frame : "+SizeOf(frame)
Procedure.i frameDataGive()
	*f.frame=*dataFrame+dataFrameindex*SizeOf(frame)
	dataFrameindex+1
	If dataFrameindex>=#H2H_DATA_FRAME_BASE
		Debug "Not enough frames !"
		MessageRequester("H2H Error","Not enough frames !")
		End
	EndIf
	ProcedureReturn *f
EndProcedure

Procedure.i frameCreate(*f.frame,length.i,path.s,	 hasHurt.i,*sound.soundPool,needFlip.i,newDamage.i=0,newDamageCut.i=0,newDamageType.i=0,newDamageSide.i=0)
	If Not *f
		*f=frameDataGive()
	EndIf
	spriteIndex+1
	*f\id=spriteIndex
	*f\length=length
	*f\damage=newDamage
	frameSetDamageCut(*f,newDamageCut)
	*f\path$=path
	*f\canDoNext=0
	If *sound
		soundId=*sound\id
	EndIf	
	ReDim isSpriteSwaped(spriteIndex)
	spriteIndex+1
	If hasHurt
		If FileSize(*f\path$+"hurt.png")>0
			*f\hurtId=spriteIndex
			ReDim isSpriteSwaped(spriteIndex)
			spriteIndex+1
		Else
			*f\hurtId=0
			*f\damage=0
		EndIf
	EndIf
	If needFlip
		If hasHurt
			If FileSize(*f\path$+"hurt.png")>0
				*f\hurtFlip=spriteIndexAdd()
				ReDim isSpriteSwaped(spriteIndex-1)
			Else
				*f\hurtFlip=0
				*f\damage=0
			EndIf
		EndIf
	EndIf
	*f\shift=locationCreate()
	*f\damageType=newDamageType
	*f\damageSide=newDamageSide
	
	*allFrames(nbFrame)=f
	If nbFrame=ArraySize(*allFrames())
		ReDim *allFrames(nbFrame*2)
	EndIf
	*f\bufferTimeout=0
	nbFrame+1
	frameSetBuffed(*f,1)
	frameSetLoaded(*f,0)
	*f\shadowShift=locationCreate()
	ProcedureReturn *f
EndProcedure
#H2H_FRAME_BUFFER_DURATION_MAX=10000
#H2H_FRAME_BUFFER_DURATION_INCREMENT=2000
EnableDebugger
Declare framePuke(*f.frame,export.i=#False)
Declare framePukeThread(*f.frame)

#H2H_FRAME_PUKE_ENABLE=#False

; Returns true if flipped
Procedure.i spriteFlip(what.i,mirrored.i=0)
	If IsSprite(what)
		If what>ArraySize(isSpriteSwaped())
			ReDim isSpriteSwaped(what)
		EndIf
		If isSpriteSwaped(what)<>mirrored
			isSpriteSwaped(what)=mirrored
			If mirrored
				TransformSprite(what,
				                SpriteWidth(what),0,
				                0,					0,
				                0,					SpriteHeight(what)-1,
				                SpriteWidth(what),SpriteHeight(what)-1)
			Else
				TransformSprite(what,
				                0,					0,
				                SpriteWidth(what)-1,0,
				                SpriteWidth(what)-1,SpriteHeight(what)-1,
				                0,					SpriteHeight(what)-1)
			EndIf
			ProcedureReturn 1
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure
Declare putSpriteInImage(sprite.i,image.i=0)
Procedure spriteSaveMirror(what.i,toWhat.i,collision.i=0)
	width=SpriteWidth(what)
	height=SpriteHeight(what)
	CreateSprite(towhat,width,height,#PB_Sprite_AlphaBlending|collision)
	putSpriteInImage(what,0)
	mirr=MirrorImage(0)
	StartDrawing(SpriteOutput(toWhat))
	DrawingMode(#PB_2DDrawing_AllChannels)
	DrawImage(ImageID(mirr),0,0)
	StopDrawing()
	FreeImage(mirr)
	FreeImage(0)
	spriteFlip(toWhat,0)
EndProcedure

Procedure.i frameFlip(*f.frame,mirrored.i=0)
	ProcedureReturn spriteFlip(*f\id,mirrored)
EndProcedure

Procedure.d frameLoad(*f.frame,path.s="",onlyFlip.i=0,parallel.i=#False)
	If Not *f
		ProcedureReturn 0
	EndIf
	frameSetLoaded(*f,1)
	If path<>""
		*f\path$=path
	EndIf
	Protected stamp.d=ElapsedMillisecondsPrecise()
	CompilerIf #H2H_DIGESTION_ENABLE
		puked=#False
		If Not IsSprite(*f\id)
			CompilerIf #H2H_FRAME_PUKE_ENABLE
				If parallel
					framePukeThread(*f)
					puked=#True
				Else
					puked=framePuke(*f)
				EndIf
			CompilerEndIf
			If Not puked
				LoadSprite(*f\id,*f\path$+".png",#PB_Sprite_AlphaBlending)
			EndIf
		EndIf
		If Not puked
			If *f\hurtId
				If Not IsSprite(*f\hurtId) And Not IsSprite(*f\hurtFlip)
					If fileExist(*f\path$+"hurt.png")
						CompilerIf #H2H_FRAME_PUKE_ENABLE
							puked=framePuke(*f)
						CompilerEndIf
						If Not puked
							LoadSprite(*f\hurtId,*f\path$+"hurt.png",#PB_Sprite_AlphaBlending|#PB_Sprite_PixelCollision)
							spriteSaveMirror(*f\hurtId,*f\hurtFlip)
						Else
							*f\hurtId=0
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	CompilerElse
		If Not IsSprite(*f\id)
			;Debug "loading "+*f\path$
			If *f\id>ArraySize(isSpriteSwaped())
				ReDim isSpriteSwaped(*f\id)
			EndIf
			isSpriteSwaped(*f\id)=0
			LoadSprite(*f\id,*f\path$+".png",#PB_Sprite_AlphaBlending)
		EndIf
		If *f\hurtId
			If Not IsSprite(*f\hurtId) And Not IsSprite(*f\hurtFlip)
				If *f\hurtPath$<>#Empty$ And fileExist(*f\hurtPath$+"hurt.png")
					If Not LoadSprite(*f\hurtId,*f\hurtPath$+"hurt.png",#PB_Sprite_AlphaBlending|#PB_Sprite_PixelCollision)
						Debug "failed !"
					EndIf
					spriteSaveMirror(*f\hurtId,*f\hurtFlip,#PB_Sprite_PixelCollision)
				Else
					If fileExist(*f\path$+"hurt.png")
						If Not LoadSprite(*f\hurtId,*f\path$+"hurt.png",#PB_Sprite_AlphaBlending|#PB_Sprite_PixelCollision)
							Debug "failed !"
						EndIf
						spriteSaveMirror(*f\hurtId,*f\hurtFlip,#PB_Sprite_PixelCollision)
					Else
						*f\hurtId=0
						*f\hurtFlip=0
					EndIf
				EndIf
			EndIf
		EndIf
	CompilerEndIf
	ProcedureReturn ElapsedMillisecondsPrecise()-stamp
EndProcedure

Procedure putSpriteInImage(sprite.i,image.i=0)
	If IsSprite(sprite)
		CreateImage(3,SpriteWidth(sprite),SpriteHeight(sprite),32,RGBA(0,0,0,0))
		*mdraw=AllocateMemory($200)
		StartDrawing(SpriteOutput(sprite))
		DrawingMode(#PB_2DDrawing_AllChannels)
		GetObject_(ImageID(3),$200,*mdraw)
		*buffer_source = DrawingBuffer()
		CompilerIf #PB_Compiler_Processor=#PB_Processor_x64
			CopyMemory(*buffer_source,PeekQ(*mdraw+24),SpriteWidth(sprite)*SpriteHeight(sprite)*4)
		CompilerElse
			CopyMemory(*buffer_source,PeekI(*mdraw+$14),SpriteWidth(sprite)*SpriteHeight(sprite)*4)
		CompilerEndIf
		StopDrawing()
		FreeMemory(*mdraw)
		CreateImage(image,SpriteWidth(sprite),SpriteHeight(sprite),32,#PB_Image_Transparent)
		If Not Subsystem("OpenGL")
			StartDrawing(ImageOutput(image))
			DrawingMode(#PB_2DDrawing_AllChannels)
			DrawImage(ImageID(3),0,0)
			StopDrawing()
		Else
			;Debug "OpenGL"
			fI=FlipImage(3)
			StartDrawing(ImageOutput(image))
			DrawingMode(#PB_2DDrawing_AllChannels)
			DrawImage(ImageID(fI),0,0)
			StopDrawing()
			FreeImage(fI)
		EndIf
		FreeImage(3)
	EndIf
EndProcedure

Procedure DisplaySpriteOptional(sprite.i,x.i,y.i,opacity.i=-1,c.i=0)
	If IsSprite(sprite)
		If opacity<=0
			opacity=255
		EndIf
		If sprite>0
			If c>0
				DisplayTransparentSprite(sprite,x,y,opacity,c)
			Else
				DisplayTransparentSprite(sprite,x,y,opacity)
			EndIf
		Else
			Debug "error 2"
		EndIf
	Else
		Debug "error"
	EndIf
EndProcedure

Procedure frameDisplay(*f.frame,x.i,y.i,opacity.i=255,color.i=0,mirrored.i=0,colorIntensity.i=128)
	frameLoad(*f)
	frameFlip(*f,mirrored)
	what.i=*f\id
	DisplaySpriteOptional(what,x,y,opacity)
	If color
		DisplaySpriteOptional(what,x,y,colorIntensity,color)
	EndIf
EndProcedure

Procedure.d frameUnload(*f.frame)
	If Not frameIsLoaded(*f)
		ProcedureReturn 0
	EndIf
	stamp.d=ElapsedMillisecondsPrecise()
	frameSetLoaded(*f,0)
	If *f\id And IsSprite(*f\id)
		isSpriteSwaped(*f\id)=0
		FreeSprite(*f\id)
	EndIf
	If *f\hurtId And IsSprite(*f\hurtId)
		FreeSprite(*f\hurtId)
	EndIf
	If *f\hurtFlip And IsSprite(*f\hurtFlip)
		FreeSprite(*f\hurtFlip)
	EndIf
	ProcedureReturn ElapsedMillisecondsPrecise()-stamp
EndProcedure

Procedure.i framePlaySound(*f.frame,where.i)
	If *f\soundId
		If frameIsNoRecSound(*f)
			playPoolSoundNoRec(*allSoundPool(*f\soundId),where)
		Else
			playPoolSound(*allSoundPool(*f\soundId),where)
		EndIf
	EndIf
	ProcedureReturn *f\soundId
EndProcedure

Procedure frameCopy(*fDestination.frame,*fSource.frame,deep.i=#False)
	CopyStructure(*fSource,*fDestination,frame)
	If deep
		If *fSource\movement
			*fDestination\movement=locationCreate(*fSource\movement\x,*fSource\movement\y)
		EndIf
		If *fSource\movementD
			*fDestination\movementD=locationCreate(*fSource\movementD\x,*fSource\movementD\y)
		EndIf
		If *fSource\shift
			*fDestination\shift=locationCreate(*fSource\shift\x,*fSource\shift\y)
		EndIf
		If *fSource\hurtShift
			*fDestination\hurtShift=locationCreate(*fSource\hurtShift\x,*fSource\hurtShift\y)
		EndIf
		If *fSource\pushPower
			*fDestination\pushPower=locationCreate(*fSource\pushPower\x,*fSource\pushPower\y)
		EndIf
		If *fSource\pushPowerD
			*fDestination\pushPowerD=locationCreate(*fSource\pushPowerD\x,*fSource\pushPowerD\y)
		EndIf
		If *fSource\moveTargetTo
			*fDestination\moveTargetTo=locationCreate(*fSource\moveTargetTo\x,*fSource\moveTargetTo\y)
		EndIf
		If *fSource\instantPush
			*fDestination\instantPush=locationCreate(*fSource\instantPush\x,*fSource\instantPush\y)
		EndIf
		If *fSource\shadowShift
			*fDestination\shadowShift=locationCreate(*fSource\shadowShift\x,*fSource\shadowShift\y)
		EndIf
	EndIf
EndProcedure
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure decodeShift(*f.frame,*item.rawdata)
		;XXX-YYY-FXX-HXX-HYY-HFX
		If *item=#Null Or *f=#Null
			ProcedureReturn
		EndIf
		x1=*item\item[0]
		If x1<0
			x1=-x1
			frameSetShiftXNegative(*f)
		EndIf
		x2=*item\item[2]
		If x2<0
			x2=-x2
			frameSetShiftXFlipNegative(*f)
		EndIf
		y1=*item\item[1]
		If y1<0
			y1=-y1
			frameSetShiftYNegative(*f)
		EndIf
		set(*f\shift,x1+x2*1000,y1)
		If *item\item[3] Or *item\item[4] Or *item\item[5]
			*f\hurtShift=locationCreate(*item\item[3]+*item\item[5]*1000,*item\item[4])
		EndIf
	EndProcedure

Procedure shiftShift(*f.frame,x.i,y.i)
	x1=Mod(*f\shift\x,1000)
	If frameShiftXNegative(*f)
		x1=-x1
	EndIf
	x1+x
	If x1<0
		frameSetShiftXNegative(*f)
		x1=-x1
	Else
		frameSetShiftXNegative(*f,0)
	EndIf
	
	x2=Int(*f\shift\x)/1000
	If frameShiftXFlipNegative(*f)
		x2=-x2
	EndIf
	x2-x
	If x2<0
		frameSetShiftXFlipNegative(*f)
		x2=-x2
	Else
		frameSetShiftXFlipNegative(*f,0)
	EndIf
	
	y1=*f\shift\y
	If frameShiftYNegative(*f)
		y1=-y1
	EndIf
	y1+y
	If y1<0
		frameSetShiftYNegative(*f)
		y1=-y1
	Else
		frameSetShiftYNegative(*f,0)
	EndIf
	
	set(*f\shift,x1+x2*1000,y1)
	If *f\hurtId
		locationAdd(*f\hurtShift,x-x*1000,y)
	EndIf
EndProcedure
CompilerEndIf
#H2H_JSON_FRAME_LENGTH="length"
#H2H_JSON_FRAME_DAMAGE="damage"
#H2H_JSON_FRAME_DAMAGECUT="damageCut"
#H2H_JSON_FRAME_MOVEMENT="movement"
#H2H_JSON_FRAME_MOVEMENTDELTA="movementDelta"
#H2H_JSON_FRAME_SHIFT="shift"
#H2H_JSON_FRAME_HURTSHIFT="hurtShift"
#H2H_JSON_FRAME_DAMAGETYPE="damageType"
#H2H_JSON_FRAME_DAMAGESIDE="damageSide"
#H2H_JSON_FRAME_SOUND="sound"
#H2H_JSON_FRAME_CANDONEXT="canDoNext"
#H2H_JSON_FRAME_PUSH="pushPower"
#H2H_JSON_FRAME_PUSHINSTANT="pushInstant"
#H2H_JSON_FRAME_PUSHDELTA="pushPowerDelta"
#H2H_JSON_FRAME_PUSHRELATIVE="moveTargetTo"
#H2H_JSON_FRAME_STUN="stun"
#H2H_JSON_FRAME_SHAKE="shake"
#H2H_JSON_FRAME_PATH="path"
#H2H_JSON_FRAME_SHADOW_SHIFT="shadowShift"
#H2H_JSON_FRAME_CANMOVE="canMove"
#H2H_JSON_FRAME_FLAG="flag"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure frameExportJSON(*f.frame,*parent=0)
	current=0
	If Not *parent
		current=JSONindex
		*parent=CreateJSONObject()
	EndIf
	addJSONInteger(*parent,#H2H_JSON_FRAME_LENGTH,*f\length)
	addJSONInteger(*parent,#H2H_JSON_FRAME_SHIFT,*f\shift\x*1000+*f\shift\y)
	If *f\hurtShift
		addJSONInteger(*parent,#H2H_JSON_FRAME_HURTSHIFT,*f\hurtShift\x*1000+*f\hurtShift\y)
	EndIf
	If *f\movement
		addJSONCoord(*parent,#H2H_JSON_FRAME_MOVEMENT,*f\movement)
	EndIf
	If *f\movementD
		addJSONCoord(*parent,#H2H_JSON_FRAME_MOVEMENTDELTA,*f\movementD)
	EndIf
	If *f\pushPower
		addJSONCoord(*parent,#H2H_JSON_FRAME_PUSH,*f\pushPower)
	EndIf
	If *f\pushPowerD
		addJSONCoord(*parent,#H2H_JSON_FRAME_PUSHDELTA,*f\pushPowerD)
	EndIf
	If *f\instantPush
		addJSONCoord(*parent,#H2H_JSON_FRAME_PUSHINSTANT,*f\instantPush)
	EndIf
	If *f\moveTargetTo
		addJSONCoord(*parent,#H2H_JSON_FRAME_PUSHRELATIVE,*f\moveTargetTo)
	EndIf
	If *f\shadowShift
		addJSONCoord(*parent,#H2H_JSON_FRAME_SHADOW_SHIFT,*f\shadowShift)
	EndIf
	If *f\path$<>""
		addJSONString(*parent,#H2H_JSON_FRAME_PATH,Mid(*f\path$,7))
	EndIf
	addJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGE,*f\damage								,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGESIDE,*f\damageSide						,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGETYPE,*f\damageType						,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_SOUND,*f\soundId								,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_CANDONEXT,*f\canDoNext						,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_STUN,*f\stunDuration							,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_SHAKE,*f\shake								,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_CANMOVE,*f\canMove							,#True)
	addJSONInteger(*parent,#H2H_JSON_FRAME_FLAG,*f\flag&(~(#H2H_FRAME_FLAG_LOADED|#H2H_FRAME_FLAG_FLIPED|#H2H_FRAME_FLAG_BUFFED)),#True)
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure frameImportJSON(*parent,*f.frame=0)
	If Not *f
		*f=AllocateStructure(frame)
		ClearStructure(*f,frame)
	EndIf
	
	*f\length=				loadJSONInteger(*parent,#H2H_JSON_FRAME_LENGTH)
	*f\damage=				loadJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGE)
	*f\damageSide=			loadJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGESIDE)
	*f\damageType=			loadJSONInteger(*parent,#H2H_JSON_FRAME_DAMAGETYPE)
	*f\soundId=				loadJSONInteger(*parent,#H2H_JSON_FRAME_SOUND)
	*f\canDoNext=			loadJSONInteger(*parent,#H2H_JSON_FRAME_CANDONEXT)
	*f\stunDuration=		loadJSONInteger(*parent,#H2H_JSON_FRAME_STUN)
	*f\shake=				loadJSONInteger(*parent,#H2H_JSON_FRAME_SHAKE)
	*f\canMove=				loadJSONInteger(*parent,#H2H_JSON_FRAME_CANMOVE)
	*f\flag=				loadJSONInteger(*parent,#H2H_JSON_FRAME_FLAG)
	*f\id=spriteIndexAdd()
	*f\path$=				"image/"+loadJSONString(*parent,#H2H_JSON_FRAME_PATH)
	i=loadJSONInteger(*parent,#H2H_JSON_FRAME_SHIFT)
	*f\shift=				locationCreate(i/1000,Mod(i,1000))
	i=loadJSONInteger(*parent,#H2H_JSON_FRAME_HURTSHIFT)
	If i
		*f\hurtShift=locationCreate(i/1000,Mod(i,1000))
		*f\hurtId=spriteIndexAdd()
		*f\hurtFlip=spriteIndexAdd()
	EndIf
	*f\movement=			loadJSONCoord(*parent,#H2H_JSON_FRAME_MOVEMENT,#True)
	*f\movementD=			loadJSONCoord(*parent,#H2H_JSON_FRAME_MOVEMENTDELTA,#True)
	*f\pushPower=			loadJSONCoord(*parent,#H2H_JSON_FRAME_PUSH,#True)
	*f\pushPowerD=			loadJSONCoord(*parent,#H2H_JSON_FRAME_PUSHDELTA,#True)
	*f\instantPush=			loadJSONCoord(*parent,#H2H_JSON_FRAME_PUSHINSTANT,#True)
	*f\moveTargetTo=		loadJSONCoord(*parent,#H2H_JSON_FRAME_PUSHRELATIVE,#True)
	*f\shadowShift=			loadJSONCoord(*parent,#H2H_JSON_FRAME_SHADOW_SHIFT,#True)
	ProcedureReturn *f
EndProcedure
CompilerEndIf

Procedure frameCloneBranchHurt(*f1.frame,*f2.frame)
 	*f1\hurtId=*f2\hurtId
 	*f1\hurtFlip=*f2\hurtFlip
 	*f1\hurtShift=*f2\hurtShift
EndProcedure
Procedure refreshFrameBuffer(*f.frame)
	*f\bufferTimeout=max(*f\bufferTimeout-1)
	If Not *f\bufferTimeout
		AddElement(*frameToUnBuff())
		*frameToUnBuff()=*f
	EndIf
EndProcedure
#H2H_FRAME_PURGE_PER_FRAME=1
Procedure purgeFrameBuffer()
	If ListSize(*frameBuffer())
		purged=0
		ResetList(*frameBuffer())
		While NextElement(*frameBuffer())
			refreshFrameBuffer(*frameBuffer())
		Wend
		If ListSize(*frameToUnBuff())
			ResetList(*frameBuffer())
			While NextElement(*frameBuffer())
				ResetList(*frameToUnBuff())
				While NextElement(*frameToUnBuff())
					If *frameToUnBuff()\id=*frameBuffer()\id
						frameUnload(*frameBuffer())
						DeleteElement(*frameBuffer())
						DeleteElement(*frameToUnBuff())
						purged+1
						If purged>=#H2H_FRAME_PURGE_PER_FRAME
							ClearList(*frameToUnBuff())
						EndIf
						If ListSize(*frameToUnBuff())=0
							; no more element to purge
							ProcedureReturn
						EndIf
						Break
					EndIf
				Wend
			Wend
		EndIf
	EndIf
EndProcedure

Macro frameCanDoNext(f,when)
	Bool(f\canDoNext And f\canDoNext-1<=when)
EndMacro

Global NewList *frameToLoad.frame()

Procedure frameAddToLoad(*f.frame)
	If *f
		AddElement(*frameToLoad())
		*frameToLoad()=*f
	EndIf
EndProcedure

Procedure.i frameLoadLoop(loadLimit.i=999)
	Protected stamp.d=0
	Static limit.d=0
	If limit=0
		limit=currentMillisecond/2
	EndIf
	Protected previous.i=ListSize(*frameToLoad())
	ResetList(*frameToLoad())
	Protected amount.i=0
	While stamp<limit And NextElement(*frameToLoad()) And amount<loadLimit
		stamp+frameLoad(*frameToLoad())
		DeleteElement(*frameToLoad())
		amount+1
	Wend
	ProcedureReturn previous-ListSize(*frameToLoad())
EndProcedure

Global NewList *frameToUnLoad.frame()

Procedure frameAddToUnload(*f.frame)
	If *f
		AddElement(*frameToUnLoad())
		*frameToUnLoad()=*f
	EndIf
EndProcedure

Procedure.i frameUnloadLoop()
	Protected stamp.d=0
	Static limit.d=0
	If limit=0
		limit=currentMillisecond/2
	EndIf
	Protected previous.i=ListSize(*frameToUnLoad())
	ResetList(*frameToUnLoad())
	While stamp<limit And NextElement(*frameToUnLoad())
;  		Debug "unloading "+*frameToUnLoad()\path$
		stamp+frameUnload(*frameToUnLoad())
		DeleteElement(*frameToUnLoad())
		amount+1
	Wend
	ProcedureReturn previous-ListSize(*frameToUnLoad())
EndProcedure

#H2H_FRAME_HURTBOX_COMPACT=#False
CompilerIf #H2H_FRAME_HURTBOX_COMPACT
Structure hurtBox
	width.i
	height.i
	start.i
	Array bits.q(0)
EndStructure

Procedure.i loadhurtFromFrame(*hb.hurtBox,*f.frame)
	frameLoad(*f)
	If *f\hurtId And IsSprite(*f\hurtId)
		Protected width.i=SpriteWidth(*f\hurtId)-1
		Protected height.i=SpriteHeight(*f\hurtId)-1
		StartDrawing(SpriteOutput(*f\hurtId))
		index.i=0
		currentColor.i=Bool(Point(0,0))
		currentAmount.i=0
		ReDim *hb\bits(index)
		For h=0 To height
			For w=0 To width
				p=Bool(Point(w,h))
				If currentColor<>p
					currentColor=p
					*hb\bits(index)=currentAmount
					currentAmount=0
					index+1
					ReDim *hb\bits(index)
				Else
					currentAmount+1
				EndIf
			Next
		Next
		StopDrawing()
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.i hurtBoxGetIndex(*hb.hurtBox,x.i,y.i)
	spot.i=x+y**hb\width
	at.i=0
	index.i=0
	While spot>*hb\bits(index)
		spot-*hb\bits(index)
		index+1
	Wend
	ProcedureReturn index
EndProcedure

Procedure.i hurtBoxMoveBy(*hb.hurtbox,startIndex.i,from.i,by.i)
	by-from
	While by>*hb\bits(startIndex)
		by-*hb\bits(startIndex)
		startIndex+1
	Wend
	ProcedureReturn startIndex
EndProcedure

Procedure.i hasCollisionWith(*hb1.hurtBox,x1.i,y1.i,*hb2.hurtBox,x2.i,y2.i)
	; TODO
	ProcedureReturn 0
EndProcedure
CompilerEndIf
#HITBOX_SHIFT_X=450
#HITBOX_SHIFT_Y=425
#HITBOX_BACKSHIFT_X=1000-#HITBOX_SHIFT_X-#HITBOX_SIZE
#HITBOX_BACKSHIFT_Y=#HITBOX_SHIFT_Y
#H2H_SHADOW_WIDTH=(#HITBOX_SIZE*3)/2
#H2H_SHADOW_HEIGHT=#HITBOX_SIZE/5
Global groundLevel
Procedure displayFrameShadow(*f.frame,x.i,y.i,direction.i,checkHeight=#True,color.i=0,intensity.i=128)
	If *f
		intensity/32
		Protected displayX.i
		If checkHeight
			displayY.i=y+*f\shift\y+*screenShake\y-screenFocusHeight
			Protected heightProportion.f=1000
			Protected heightFactor.f=1-(Abs(y-groundLevel))/heightProportion
			Protected shadowShiftX=0
			If *f\shadowShift
				heightFactor+*f\shadowShift\y/heightProportion
				shadowShiftX=*f\shadowShift\x
			EndIf
			If heightFactor<0.1
				heightFactor=0.1
			EndIf
			ZoomSprite(shadowSprite,#PB_Default,#PB_Default)
			ZoomSprite(shadowSprite,SpriteWidth(shadowSprite)*heightFactor,SpriteHeight(shadowSprite)*heightFactor)
			If direction
				displayX=x+*f\shift\x/1000+shift+*screenShake\x
				DisplaySpriteOptional(shadowSprite,x+#HITBOX_BACKSHIFT_X-20+*screenShake\x+(#H2H_SHADOW_WIDTH-#H2H_SHADOW_WIDTH*heightFactor)/2-shadowShiftX,
				                      groundLevel+#HITBOX_SIZE*2+200+*screenShake\y-screenFocusHeight+(#H2H_SHADOW_HEIGHT-#H2H_SHADOW_HEIGHT*heightFactor)/2,
				                      128*heightFactor)
				If color>0
					DisplaySpriteOptional(shadowSprite,x+#HITBOX_BACKSHIFT_X-20+*screenShake\x+(#H2H_SHADOW_WIDTH-#H2H_SHADOW_WIDTH*heightFactor)/2-shadowShiftX,
					                      groundLevel+#HITBOX_SIZE*2+200+*screenShake\y-screenFocusHeight+(#H2H_SHADOW_HEIGHT-#H2H_SHADOW_HEIGHT*heightFactor)/2,
					                      intensity*heightFactor,color)
				EndIf
			Else
				displayX=x+Mod(*f\shift\x,1000+shift)+*screenShake\x
				DisplaySpriteOptional(shadowSprite,x+#HITBOX_SHIFT_X-20+*screenShake\x+(#H2H_SHADOW_WIDTH-#H2H_SHADOW_WIDTH*heightFactor)/2+shadowShiftX,
				                      groundLevel+#HITBOX_SIZE*2+200+*screenShake\y-screenFocusHeight+(#H2H_SHADOW_HEIGHT-#H2H_SHADOW_HEIGHT*heightFactor)/2,
				                      128*heightFactor)
				If color>0
					DisplaySpriteOptional(shadowSprite,x+#HITBOX_SHIFT_X-20+*screenShake\x+(#H2H_SHADOW_WIDTH-#H2H_SHADOW_WIDTH*heightFactor)/2+shadowShiftX,
					                      groundLevel+#HITBOX_SIZE*2+200+*screenShake\y-screenFocusHeight+(#H2H_SHADOW_HEIGHT-#H2H_SHADOW_HEIGHT*heightFactor)/2,
					                      intensity*heightFactor,color)
				EndIf
			EndIf
		Else
			ZoomSprite(shadowSprite,#PB_Default,#PB_Default)
			displayX=x-20
			If direction
				displayX+#HITBOX_BACKSHIFT_X
			Else
				displayX+#HITBOX_SHIFT_X
			EndIf
			If *f\shadowShift
				If direction
					displayX-*f\shadowShift\x
				Else
					displayX+*f\shadowShift\x
				EndIf
			EndIf
			DisplaySpriteOptional(shadowSprite,displayX,
			                      y+#HITBOX_SIZE*2+200+#H2H_SHADOW_HEIGHT/2,
			                      128)
			DisplaySpriteOptional(shadowSprite,displayX,
			                      y+#HITBOX_SIZE*2+200+#H2H_SHADOW_HEIGHT/2,
			                      intensity,color)
		EndIf
	EndIf
EndProcedure


; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 377
; FirstLine = 355
; Folding = ---------z--
; EnableXP
; CPU = 1