#H2H_PARTICLE_ENABLED_DEFAULT=#True
Global particleEnabled=#H2H_PARTICLE_ENABLED_DEFAULT

EnumerationBinary
	#H2H_PARTICLE_TYPE_BASIC
	#H2H_PARTICLE_TYPE_FADING_LINEAR
	#H2H_PARTICLE_TYPE_FADING_FACTOR
	#H2H_PARTICLE_TYPE_FEEDBACK
	#H2H_PARTICLE_TYPE_ACCELERATION_LINEAR
	#H2H_PARTICLE_TYPE_ACCELERATION_FACTOR
EndEnumeration

Structure particleModel
	path$
	name$
	Array sprites.i(0)
	Array *shift.location(0)
	lifeSpan.i ; duration per step
	animationSpeed.i
	type.i
	opacityDelta.f ; can be an integer
	feedbackColor.i
	*acceleration.location
EndStructure

Enumeration
	#H2H_PARTICLE_LAYER_FRONT
	#H2H_PARTICLE_LAYER_BACK
EndEnumeration

Structure particle
	*position.location
	*delta.location
	*model.particleModel
	sub.f
	spriteId.i ; index to the model
	lifespan.i ; duration per step
	opacity.i
	color.i
	rotation.i ; from 0 to 360°
	layer.i ; in font or behind players, by default in front
EndStructure

Procedure.i particleCreate(x.i,y.i,dX.i,dY.i)
	*newParticle.particle=AllocateStructure(particle)
	*newParticle\position=locationCreate(x,y)
	*newParticle\delta=locationCreate(dX,dY)
	*newParticle\color=-1
	*newParticle\opacity=255
	*newParticle\rotation=0
	*newParticle\sub=0
	ProcedureReturn *newParticle
EndProcedure

Procedure particleDestroy(*what.particle)
	;Debug "particle destroyed"
	locationDestroy(*what\position)
	locationDestroy(*what\delta)
	FreeStructure(*what)
EndProcedure

Procedure particleDisplay(*what.particle)
	If *what\spriteId<0
		*what\spriteId=0
	EndIf
	
	id=*what\model\sprites(*what\spriteId)
	x=0
	y=0
	DisplayTransparentSprite(id,*what\position\x-screenFocus,*what\position\y,*what\opacity)
	If *what\color<>-1
		DisplayTransparentSprite(id,*what\position\x-screenFocus,*what\position\y,*what\opacity/2,*what\color)
	EndIf
EndProcedure

Procedure.i particleRotate(*what.particle,amount.i)
	*what\rotation+amount
	ProcedureReturn *what\rotation
EndProcedure

Procedure.i particleOpacityReduce(*what.particle,amount.i)
	*what\opacity=max(*what\opacity-amount,0)
	ProcedureReturn *what\opacity
EndProcedure

Procedure.i particleOpacityMult(*what.particle, amount.f)
	*what\opacity=min(max(*what\opacity*amount,0),255)
	ProcedureReturn *what\opacity
EndProcedure

Procedure particleSetColor(*what.particle, color.i=-1)
	*what\color=color
EndProcedure

Procedure particleSetLifeSpan(*what.particle, lifeSpan.i=50)
	*what\lifespan=lifeSpan
EndProcedure

Global NewList *allParticles.particle()

; will return 1 if dead
Procedure.i particleRefresh(*what.particle,delta.f=1)
	*model.particleModel=*what\model
	*what\sub+delta
	difference=Int(*what\sub)
	;Debug "difference "+difference
	*what\lifespan-*model\animationSpeed*difference
	*what\sub-difference
	If *what\lifespan<=0
		*what\spriteId-difference
		If *what\spriteId<0
			ProcedureReturn 1
		EndIf
		*what\lifespan=*model\lifeSpan
	EndIf
	For i=1 To difference
		If *model\type&#H2H_PARTICLE_TYPE_FADING_LINEAR
			If particleOpacityReduce(*what,*model\opacityDelta)=0
				ProcedureReturn 1 ; no need to keep the particle if it's invisible
			EndIf
		EndIf
		If *model\type&#H2H_PARTICLE_TYPE_FADING_FACTOR
			If particleOpacityMult(*what,*model\opacityDelta)=0
				ProcedureReturn 1 ; no need to keep the particle if it's invisible
			EndIf
		EndIf
		If i=1
			If *model\type&#H2H_PARTICLE_TYPE_FEEDBACK
				If *what\color=-1
					*what\color=*model\feedbackColor
				Else
					*what\color=-1
				EndIf
			EndIf
		EndIf
		If *model\type&#H2H_PARTICLE_TYPE_ACCELERATION_FACTOR
			locationMult(*what\delta,*model\acceleration\x,*model\acceleration\y)
		EndIf
		If *model\type&#H2H_PARTICLE_TYPE_ACCELERATION_LINEAR
			; TODO movement overflow 0
	; 		dX=*model\acceleration\x*Sign(*what\delta\x)
	; 		If Sign(*what\delta\x)=Sign(*model\acceleration\x)
	; 			If Abs(*model\acceleration\x)<Abs(*what\delta\x)
	; 				
	; 			EndIf
	; 		EndIf
			locationAdd(*what\delta,*model\acceleration\x*Sign(*what\delta\x),*model\acceleration\y)
		EndIf
	Next
	locationAdd(*what\position,*what\delta\x*delta,*what\delta\y*delta)
	ProcedureReturn 0
EndProcedure

Procedure refreshAllParticles(delta.f=1)
	If particleEnabled
		x=0
		ForEach *allParticles()
			If particleRefresh(*allParticles(),delta)
				particleDestroy(*allParticles())
				DeleteElement(*allParticles())
			EndIf
			x+1
		Next
	EndIf
EndProcedure

Procedure displayAllParticles(whatLayer.i=#H2H_PARTICLE_LAYER_FRONT)
	ForEach *allParticles()
		If *allParticles()\layer=whatLayer
			particleDisplay(*allParticles())
		EndIf
	Next
EndProcedure

Procedure destroyAllParticles()
	ForEach *allParticles()
		particleDestroy(*allParticles())
		DeleteElement(*allParticles())
	Next
EndProcedure

Procedure.i particleModelCreate(path$,name$,sprites.i,lifeSpan.i,speed.i=5)
	*newModel.particleModel=AllocateStructure(particleModel)
	*newModel\name$=name$
	*newModel\path$=path$
	*newModel\lifeSpan=lifeSpan
	ReDim *newModel\sprites(sprites)
	ReDim *newModel\shift(sprites)
	For i=0 To sprites
		k=i+1
		*newModel\sprites(i)=spriteIndex
		LoadSprite(spriteIndex,path$+k+".png",#PB_Sprite_AlphaBlending)
		spriteIndex+1
	Next
	*newModel\animationSpeed=speed
	ProcedureReturn *newModel
EndProcedure

Procedure particleModelAddType(*model.particleModel,type.i,valueX.f,valueY.f=0)
	*model\type|type
	Select type.i
		Case #H2H_PARTICLE_TYPE_FADING_LINEAR
			*model\opacityDelta=valueX
		Case #H2H_PARTICLE_TYPE_FADING_FACTOR
			*model\opacityDelta=valueX
		Case #H2H_PARTICLE_TYPE_ACCELERATION_LINEAR
			*model\acceleration=locationCreate(valueX,valueY)
		Case #H2H_PARTICLE_TYPE_ACCELERATION_FACTOR
			*model\acceleration=locationCreate(valueX,valueY)
		Case #H2H_PARTICLE_TYPE_FEEDBACK
			*model\feedbackColor=valueX
	EndSelect
EndProcedure

Procedure.i particleSpawn(*model.particleModel,x.i,y.i,dX.f,dY.f,lifeSpan.i,whatLayer.i=#H2H_PARTICLE_LAYER_FRONT)
	AddElement(*allParticles())
	*allParticles()=particleCreate(x,y,dX,dY)
	particleSetLifeSpan(*allParticles(),lifeSpan)
	*allParticles()\model=*model
	ProcedureReturn *allParticles()
EndProcedure

Procedure.i particleAdd(*model.particleModel,x.i,y.i,dX.f,dY.f,duration.i=-1,whatLayer.i=#H2H_PARTICLE_LAYER_FRONT)
	If particleEnabled
		start=ArraySize(*model\sprites())
		size=start+1
		If duration=-1
			lifeSpan=*model\lifeSpan
		Else
			lifeSpan=Mod(duration,*model\lifeSpan)
			start=duration/size
		EndIf
		If *model\shift(start)
			x-*model\shift(start)\x
			y-*model\shift(start)\y
		EndIf
		*newParticle.particle=particleSpawn(*model,x,y,dX,dY,lifeSpan)
		*newParticle\spriteId=start
	EndIf
EndProcedure
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
	Procedure decodeParticleShift(*pm.particleModel,*item.rawdataArray)
		If *pm And *item
			For i=0 To min(ArraySize(*pm\sprites()),ArraySize(*item\rd()))
				*pm\shift(i)=locationCreate(*item\rd(i)\item[0]+*item\rd(i)\item[2]*1000,*item\rd(i)\item[1])
			Next
		EndIf
	EndProcedure
CompilerEndIf
Global *hitParticle.particleModel;=particleModelCreate("image\hurt","hurt",6,5,2)
Procedure initParticles()
	*hitParticle=particleModelCreate("image\hurt","hurt",6,5,2)
	particleModelAddType(*hitParticle,#H2H_PARTICLE_TYPE_ACCELERATION_FACTOR,0.95,0.95)
	particleModelAddType(*hitParticle,#H2H_PARTICLE_TYPE_FEEDBACK,RGB(255,0,0))
	particleModelAddType(*hitParticle,#H2H_PARTICLE_TYPE_FADING_LINEAR,2)
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 38
; FirstLine = 18
; Folding = ----
; EnableXP
; CPU = 1