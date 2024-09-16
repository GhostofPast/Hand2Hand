#chunkSize=32
UsePNGImageDecoder()
UsePNGImageEncoder()

Procedure digestImage(path$,export$="noname")
	LoadImage(0,path$+".png")
	sizeX=ImageWidth(0)
	sizeY=ImageHeight(0)
	nbChunk=sizeX*sizeY/#chunkSize
	Dim emptyCase(nbChunk)
	Dim whiteCase(nbChunk)
	x=0
	y=0
	chunkId=0
	drawnChunk=0
	StartDrawing(ImageOutput(0))
	DrawingMode(#PB_2DDrawing_AlphaBlend)
	For x=0 To sizeX Step #chunkSize
		For y=0 To sizeY Step #chunkSize
			If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
				empty=1
				white=1
				For i=0 To 1024
					iX=x+i%#chunkSize
					iY=y+i/#chunkSize
					If iX<sizeX And iY<sizeY
						p=Point(iX,iY)
						If p<>0
							empty=0
						EndIf
						If Red(p)<>255 Or Green(p)<>255 Or Blue(p)<>255 ;RGBA(255,255,255,255)
							white=0
						EndIf
						If Not white And Not empty
							Break
						EndIf
					EndIf
				Next
				;Debug "alpha "+Alpha(Point(x,y))
				emptyCase(chunkId)=empty
				whiteCase(chunkId)=white
				;Debug "chunk "+chunkId
				If empty 
					;Debug "empty"
				EndIf
				If white
					;Debug "white"
				EndIf
				chunkId+1
			EndIf
		Next
	Next
	StopDrawing()
	CreateImage(1,512,512,32)
	StartDrawing(ImageOutput(1))
	DrawingMode(#PB_2DDrawing_AlphaChannel)
	Box(0,0,512,512,RGBA(0,0,0,0))
	DrawingMode(#PB_2DDrawing_AlphaBlend)
	chunkId=0
	For x=0 To sizeX Step #chunkSize
		For y=0 To sizeY Step #chunkSize
			If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
				If Not emptyCase(chunkId) And Not whiteCase(chunkId)
					;Debug "drawn "+drawnChunk
					DrawAlphaImage(ImageID(2),(drawnChunk%#chunkSize)*#chunkSize,(drawnChunk/#chunkSize)*32)
					drawnChunk+1
				EndIf
				chunkId+1
			EndIf
		Next
	Next
	StopDrawing()
	If export$="" Or export$=path$
		export$="noname"
	EndIf
	SaveImage(1,export$+".png",#PB_ImagePlugin_PNG)
EndProcedure
;digestImage("image\hand_ballpen_back1_6","digested")

#exportSizeX=8192
#exportSizeY=8192*2
Procedure printAnimationData(animationData$)
	Debug "print"
	If OpenFile(1,animationData$)
		While Not Eof(1)
			Debug "data "+ReadInteger(1)
		Wend
		CloseFile(1)
	Else
		Debug animationData$+" not existing !"
	EndIf
EndProcedure

; returns
; -1 transparent
; 0 normal
; 1 white
Procedure.i chunkCheck()
	empty=1
	white=1
	For i=0 To 1023
		iX=x+i%#chunkSize
		iY=y+i/#chunkSize
		If iX<sizeX And iY<sizeY
			p=Point(iX,iY)
			If p<>0
				empty=0
			EndIf
			If Red(p)<>255 Or Green(p)<>255 Or Blue(p)<>255
				white=0
			EndIf
			If Not white And Not empty
				ProcedureReturn 0
			EndIf
		EndIf
	Next
	If white
		ProcedureReturn 1
	EndIf
	ProcedureReturn -1
EndProcedure

Procedure digestAnimation(path$,export$="noname")
	; for each image we find the white and empty sections
	number=1
	nbImage=0
	Dim isHurtBox(0)
	While FileSize(path$+number+".png")>0
		ReDim isHurtBox(nbImage)
		isHurtBox(nbImage)=Bool(FileSize(path$+number+"hurt.png")>0)
		number+1
		nbImage+1
	Wend
	nbChunk=0
	chunkId=0
	CreateImage(1,#exportSizeX,#exportSizeY,32) ; digested output
	Dim emptyCase(#exportSizeX*#exportSizeY/(#chunkSize*#chunkSize))
	Debug "size "+ArraySize(emptyCase())
	Dim whiteCase(#exportSizeX*#exportSizeY/(#chunkSize*#chunkSize))
	Dim imageSize(nbImage*2-1)
	; Get the indexes of the basic sprites
	For number=1 To nbImage
		Debug path$+number+".png"
		LoadImage(0,path$+number+".png")
		sizeX=ImageWidth(0)
		sizeY=ImageHeight(0)
		imageSize(number-1)=sizeX+sizeY*1000
		Debug "image size 1 "+imageSize(number-1)
		StartDrawing(ImageOutput(0))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
		For y=0 To sizeY Step #chunkSize
			For x=0 To sizeX Step #chunkSize
				If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
					c=chunkCheck()
					emptyCase(chunkId)=Bool(c=-1)
					whiteCase(chunkId)=Bool(c=1)
					chunkId+1
				EndIf
			Next
		Next
		StopDrawing()
	Next
	For number=1 To nbImage
		If isHurtBox(number-1)
			hurtbox=1
			Debug "detected hurtbox "+Str(number-1)
			LoadImage(0,path$+number+"hurt.png")
			sizeX=ImageWidth(0)
			sizeY=ImageHeight(0)
			imageSize(nbImage+number-1)=sizeX+sizeY*1000
			Debug "image size 4 "+imageSize(nbImage+number-1)
			StartDrawing(ImageOutput(0))
			DrawingMode(#PB_2DDrawing_AlphaBlend)
			For y=0 To sizeY Step #chunkSize
				For x=0 To sizeX Step #chunkSize
					If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
						empty=1
						white=1
						For i=0 To 1023
							iX=x+i%#chunkSize
							iY=y+i/#chunkSize
							If iX<sizeX And iY<sizeY
								p=Point(iX,iY)
								If p<>0
									empty=0
								EndIf
								If Red(p)>0 Or Blue(p)>0
									white=0
								EndIf
								If Not white And Not empty
									Break
								EndIf
							EndIf
						Next
						emptyCase(chunkId)=empty
						whiteCase(chunkId)=white
						chunkId+1
					EndIf
				Next
			Next
			StopDrawing()
		EndIf
	Next
	StartDrawing(ImageOutput(1))
	DrawingMode(#PB_2DDrawing_AlphaChannel)
	Box(0,0,#exportSizeX,#exportSizeY,RGBA(0,0,0,0))
	StopDrawing()
	nbChunk=chunkId
	chunkId=0
	drawnChunk=0
	Dim isHurtBox(nbImage)
	; then we put the non-white and non-empty chunks together in an image
	For number=1 To nbImage
		If FileSize(path$+number+".png")<=0
			Debug path$+number+".png not found"
			Break
		EndIf
		LoadImage(0,path$+number+".png")
		StartDrawing(ImageOutput(1))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
		For y=0 To sizeY Step #chunkSize
			For x=0 To sizeX Step #chunkSize
				If Not emptyCase(chunkId) And Not whiteCase(chunkId)
					If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
						DrawAlphaImage(ImageID(2),(drawnChunk%(#exportSizeX/#chunkSize))*#chunkSize,(drawnChunk/(#exportSizeX/#chunkSize))*#chunkSize)
					Else
						Debug "error ?"
					EndIf
					drawnChunk+1
				EndIf
				chunkId+1
			Next
		Next
		StopDrawing()
	Next
	Debug "found "+drawnChunk+" drawn chunks"
	; hurtbox
	For number=1 To nbImage
		If isHurtBox(number-1)
			LoadImage(0,path$+number+"hurt.png")
			sizeX=ImageWidth(0)
			sizeY=ImageHeight(0)
			StartDrawing(ImageOutput(1))
			DrawingMode(#PB_2DDrawing_AlphaBlend)
			For y=0 To sizeY Step #chunkSize
				For x=0 To sizeX Step #chunkSize
					If Not emptyCase(chunkId) And Not whiteCase(chunkId)
						If GrabImage(0,2,x,y,#chunkSize,#chunkSize)
							DrawAlphaImage(ImageID(2),(drawnChunk%(#exportSizeX/#chunkSize))*#chunkSize,(drawnChunk/(#exportSizeX/#chunkSize))*#chunkSize)
						EndIf
						drawnChunk+1
					EndIf
					chunkId+1
				Next
			Next
			StopDrawing()
		EndIf
	Next
	If export$="" Or export$=path$
		export$="noname"
	EndIf
	Debug "drawn chunks "+drawnChunk
	nbLines=drawnChunk/(#exportSizeX/#chunkSize)+1
	Debug "lines "+nbLines
	GrabImage(1,1,0,0,#exportSizeX,#chunkSize*nbLines)
	SaveImage(1,export$+".png",#PB_ImagePlugin_PNG)
	; export the blank index
	k=0
	Dim compressedData(nbChunk)
	Debug "number "+nbChunk
	For i=0 To nbChunk
		If whiteCase(i)
			compressedData(k)=-i
			k+1
		Else
			If emptyCase(i)
				compressedData(k)=i
				k+1
			EndIf
		EndIf
	Next
	If k>0
		k-1
		ReDim compressedData(k)
		If CreateFile(0,export$+"data.txt")
			; first data is the number of images
			WriteInteger(0,nbImage-1)
			; if hurtbox, we specify which indexes are
			hurtbox=0
			If hurtbox
				For i=0 To nbImage
					If isHurtBox(i)
						If Not hurtbox
							WriteInteger(0,1)
							hurtbox=1
						EndIf
						WriteInteger(0,i)
					EndIf
				Next
				; if there were a hurtbox, we plug it with a -1
				WriteInteger(0,-1)
			Else
				WriteInteger(0,0)
			EndIf
			; then the image sizes
			If hurtbox
				For i=0 To ArraySize(imageSize())
					Debug "image size 2 "+imageSize(i)
					WriteInteger(0,imageSize(i))
				Next
			Else
				For i=0 To nbImage
					Debug "image size 3 "+imageSize(i)
					WriteInteger(0,imageSize(i))
				Next
			EndIf
			; then the blank indexes
			Debug "nb blank "+k
			For i=0 To k
				WriteInteger(0,compressedData(i))
			Next
			CloseFile(0)
		EndIf
	EndIf
EndProcedure
; digestAnimation("image\hand_ballpen_back","animation_hand_ballpen_back")
;digestAnimation("test","animation_test")
;digestAnimation("image\hand_ballpen_back1_","animation_hand_ballpen_back1hurt",#True)
;digestAnimation("image\hand_gluestick_spawn","animation_hand_gluestick_spawn",#False)

; Procedure digestClassSub(*c.class, *a.animation, fileId.i)
; 	If *a
; 		OpenFile(fileId)
; 		For i=0 To ArraySize(*c\animations())
; 			digestClassSub(*c,*c\animations(i),3)
; 		Next
; 		CloseFile(fileId)
; 	EndIf
; EndProcedure
; 
; Procedure digestClass(*c.class)
; 	CreateFile(3,*c\name+"_data")
; 	For i=0 To ArraySize(*c\animations())
; 		digestClassSub(*c,*c\animations(i),3)
; 	Next
; EndProcedure
;printAnimationData("animation_hand_ballpen_back1.txt")
; printAnimationData("animation_hand_ballpen_back1hurtdata.txt")
Procedure recreateAnimation(animationImage$,animationData$,exportToPNG.i=0,*c.class=0)
	If ReadFile(0,animationData$)
		;Debug "verification"
		printAnimationData(animationData$)
		FileSeek(0,0)
		; number of images
		nbImage=ReadInteger(0)
		Debug "number "+nbImage
		hurtbox=ReadInteger(0)
		; has hurtboxes
		Debug "hurtbox "+hurtbox
		Dim isHurtBox(nbImage+1)
		If hurtbox
			While #True
				h=ReadInteger(0)
				If h=-1
					Break
				EndIf
				Debug "hurtbox["+h+"]"
				isHurtBox(h)=#True
			Wend
		EndIf
		Dim imageSize(nbImage)
		Dim hurtSize(nbImage)
		For i=0 To nbImage
			imageSize(i)=ReadInteger(0)
			If imageSize(i)=0
				Debug "error"
				End
			EndIf
			Debug "size "+Str(imageSize(i)%1000)+" "+Str(imageSize(i)/1000)
			CreateImage(i+1,imageSize(i)%1000,imageSize(i)/1000,32)
			StartDrawing(ImageOutput(i+1))
			DrawingMode(#PB_2DDrawing_AlphaChannel)
			Box(0,0,imageSize(i)%1000,imageSize(i)/1000,RGBA(0,0,0,0))
			StopDrawing()
		Next
		If hurtbox
			For i=0 To nbImage
				hurtSize(i)=ReadInteger(i)
				If hurtSize(i)
					Debug "hurt size "+Str(hurtSize(i)%1000)+" "+Str(hurtSize(i)/1000)
					CreateImage(i+1,hurtSize(i)%1000,hurtSize(i)/1000,32)
					StartDrawing(ImageOutput(i+1))
					DrawingMode(#PB_2DDrawing_AlphaChannel)
					Box(0,0,hurtSize(i)%1000,hurtSize(i)/1000,RGBA(0,0,0,0))
					StopDrawing()
				EndIf
			Next
		EndIf
		Dim compressedData(2048) ; enough space
		k=0
		While Not Eof(0)
			i=ReadInteger(0)
			compressedData(k)=i
			k+1
		Wend
		LoadImage(0,animationImage$)
		k=0
		chunkId=0
		subChunk=0
		For i=0 To ArraySize(imageSize())
			StartDrawing(ImageOutput(i+1))
			DrawingMode(#PB_2DDrawing_AlphaBlend)
			chunkX=(imageSize(i)%1000)
			chunkY=(imageSize(i)/1000)
			For y=0 To chunkY Step #chunkSize
				For x=0 To chunkX Step #chunkSize
					Debug "for chunk "+chunkId+" compressed "+k+" "+compressedData(k)
					If compressedData(k)=-chunkId And chunkId<>0
						k+1
						If isHurtBox(i)
							Box(x,y,#chunkSize,#chunkSize,RGBA(1,255,1,255))
						Else
							Box(x,y,#chunkSize,#chunkSize,RGBA(255,255,255,255))
						EndIf
 						Debug "["+x+"|"+y+"] "+compressedData(k)
 						Debug "white box"
					Else
						If compressedData(k)=chunkId
 							Debug "["+x+"|"+y+"] "+compressedData(k)
 							Debug "transparent box"
							k+1
						Else
							iX=(subChunk%(#exportSizeX/#chunkSize))*#chunkSize
							iY=(subChunk/(#exportSizeX/#chunkSize))*#chunkSize
							If GrabImage(0,nbImage+10,iX,iY,#chunkSize,#chunkSize)
								DrawAlphaImage(ImageID(nbImage+10),x,y)
								Debug "["+iX+"|"+iY+"] image chunk"
							Else
								Debug "no image"
							EndIf
							subChunk+1
						EndIf
					EndIf
					chunkId+1
; 					Debug "chunk id "+chunkId
				Next
			Next
			StopDrawing()
			If exportToPNG
				If Not SaveImage(i+1,"verification"+i+".png",#PB_ImagePlugin_PNG)
					Debug "failed "+i+".png"
				Else
					Debug "created "+i+".png"
				EndIf
			EndIf
		Next
		CloseFile(0)
	Else
		MessageRequester("H2H error","Cannot open data "+animationData$)
	EndIf
EndProcedure

;  recreateAnimation("animation_hand_ballpen_back.png","animation_hand_ballpen_backdata.txt",#True)
;recreateAnimation("animation_test.png","animation_testdata.txt",#True)
;recreateAnimation("animation_hand_ballpen_back1hurt.png","animation_hand_ballpen_back1hurtdata.txt",#True)
;recreateAnimation("animation_hand_gluestick_spawn.png","animation_hand_gluestick_spawndata.txt",#True)

Procedure autoDigest(name$) ; TODO
	If FileSize("image\"+name$+"1.png")>0
		digestAnimation("image\"+name$,"animation_"+name$)
; 		i=1
; 		While FileSize("image\"+name$+Str(i)+".png")
; 			If FileSize("image\"+name$+Str(i)+"hurt.png")
; 				digestAnimation("image\"+name$,"animation_"+name$)
; 				Break
; 			EndIf
; 			i+1
; 		Wend
	EndIf
EndProcedure
; digestAnimation("image\hand_ballpen_up2_","animation_hand_ballpen_up2",0)
; recreateAnimation("animation_hand_ballpen_up2.png","animation_hand_ballpen_up2data.txt",#True)

Procedure postDigest(animationImage$)
	If FileSize(animationImage$+".png")>0
		If LoadImage(0,animationImage$+".png")
			width=ImageWidth(0)
			height=ImageHeight(0)
			CreateImage(1,width,height/4,32)
			Dim pix(width-1,(height/4)-1)
			Debug "size "+width+" "+height
			StartDrawing(ImageOutput(0))
			DrawingMode(#PB_2DDrawing_AllChannels)
			subY=0
			subX=0
			For y=0 To height-1
				For x=0 To width-1 Step 4
					; pick 4 pixels and fuse into one
					; each picked pixel is converted into 8 bit : 6 for gray and 2 for alpha
					c=0
					For i=0 To 3
						dot=Point(x+i,y)
						gray=Red(dot)>>2
						a=(Alpha(dot)>>6)<<6
						c+(gray|a)
						If i<>3
							c<<8
						EndIf
					Next
					If subX<width-1 And subY<height/4-1
						pix(subX,subY)+c
					EndIf
					subX+1
				Next
				If Not y%4
					subY+1
					subX=0
				EndIf
			Next
			StopDrawing()
			StartDrawing(ImageOutput(1))
			DrawingMode(#PB_2DDrawing_AllChannels)
			For y=0 To (height/4)-1
				For x=0 To width-1
					Plot(x,y,pix(x,y))
; 					c=pix(x,y)
; 					Debug ""+Hex(Red(c))+" "+Hex(Blue(c))+" "+Hex(Green(c))+" "+Hex(Alpha(c))
; 					Delay(100)
				Next
			Next
			StopDrawing()
			SaveImage(1,animationImage$+"again.png",#PB_ImagePlugin_PNG,0,32)
		Else
			MessageRequester("H2H error", "Unable to load animation image "+animationImage$)
		EndIf
	Else
		MessageRequester("H2H error", "Animation image not existing "+animationImage$)
	EndIf
EndProcedure
; postDigest("animation_hand_ballpen_up2")
Procedure postDigestReverse(digestedAnimationImage$)
	If FileSize(digestedAnimationImage$+"again.png")>0
		If LoadImage(0,digestedAnimationImage$+"again.png")
			width=ImageWidth(0)
			height=ImageHeight(0)
			Dim pix(width-1,height*4-1)
			Debug "size "+width+" "+height
			StartDrawing(ImageOutput(0))
			DrawingMode(#PB_2DDrawing_AllChannels)
			x=0
			y=0
			For pointY=0 To height-1
				For pointX=0 To width-1
					c=Point(pointX,pointY)
					For i=0 To 3
						p=c&$3F000000
						If p>=$3F000000 ; reconstitute the pure white
							p=$FF
						Else
							p>>24
						EndIf
						a=c&$C0000000
; 						Debug Hex(a)
						If a>=$C0000000
							a=$FF
						Else
							a>>24
						EndIf
						pix(x,y)=RGBA(p,p,p,a)
; 						Debug Hex(pix(x,y))
						x+1
						c<<8
					Next
					If x>=width-1
						y+1
						x=0
					EndIf
				Next
				If y>=height*4-1
					Break
				EndIf
			Next
			StopDrawing()
			CreateImage(1,width,height*4,32)
			StartDrawing(ImageOutput(1))
			DrawingMode(#PB_2DDrawing_AllChannels)
			For y=0 To height*4-1
				For x=0 To width-1
					;Debug "x "+x+" y "+y+" "+Hex(pix(x,y))
					Plot(x,y,pix(x,y))
				Next
			Next
			StopDrawing()
			SaveImage(1,digestedAnimationImage$+".png",#PB_ImagePlugin_PNG,0,32)
		Else
			MessageRequester("H2H error", "Unable to load animation image "+digestedAnimationImage$)
		EndIf
	Else
		MessageRequester("H2H error", "Animation image not existing "+digestedAnimationImage$)
	EndIf
EndProcedure
; digestAnimation("image\hand_ballpen_spawn","animation_hand_ballpen_spawn",0)
; postDigest("animation_hand_ballpen_spawn")
; postDigestReverse("animation_hand_ballpen_spawn")
; recreateAnimation("animation_hand_ballpen_spawn.png","animation_hand_ballpen_spawndata.txt",#True)

Global imageIndex=1000
Global spriteIndexCompressedFrame=-1

Structure compressedFrame
	path$
	hurt.i ; is hurt
	wind.i ; is wind
	chunks.i ; number of chunks
	width.i
	height.i
	Array bits.i(0)
	Array white.i(0)
	Array transparent.i(0)
EndStructure
Global createdImages=0
Global Dim *allCompressedFrames.compressedFrame(0)
Procedure.i compressedFrameCreate(path$,hurt.i=0,wind.i=0,export.i=#False)
	If spriteIndexCompressedFrame=-1
		Debug "started at "+spriteIndex
		spriteIndexCompressedFrame=spriteIndex
	EndIf
	If hurt
		If Not fileExist(path$+"hurt.png")
			ProcedureReturn 0
		EndIf
	Else
		If Not fileExist(path$+".png")
			ProcedureReturn 0
		EndIf
	EndIf
	*cF.compressedFrame=AllocateStructure(compressedFrame)
	If hurt
		*cF\path$=path$+"hurt"
	Else
		*cF\path$=path$
	EndIf
	*cF\hurt=hurt
	*cF\wind=wind
; 	Debug "COMPRESSING "+*cF\path$
	Protected x=0
	Protected y=0
	Protected xi=0
	Protected yi=0
	If hurt
		LoadImage(0,path$+"hurt.png",#PB_Image_Transparent)
; 		Debug "loaded hurt"
; 		LoadSprite(0,path$+"hurt.png",#PB_Sprite_AlphaBlending)
	Else
		LoadImage(0,path$+".png",#PB_Image_Transparent)
; 		LoadSprite(0,path$+".png",#PB_Sprite_AlphaBlending)
	EndIf
; 	If Not IsSprite(0)
; 		Debug "problem sir"
; 	EndIf
	*cF\width=ImageWidth(0)
	*cF\height=ImageHeight(0)
	Protected xiMax=(*cF\width-1)/#chunkSize
	Protected yiMax=(*cF\height-1)/#chunkSize
	*cF\chunks=(xiMax+1)*(yiMax+1)
;  	Debug "CHUNKS "+*cF\chunks
	Protected nbChunks=0
	Dim *cF\bits(*cF\chunks)
	Dim *cF\white(*cF\chunks)
	Dim *cF\transparent(*cF\chunks)
	Protected nbWhite=0
	Protected nbTransparent=0
	Protected currentChunk=0
	For xi=0 To xiMax
		For yi=0 To yiMax
			; Debug "CHUNK --- "+currentChunk
			;CreateImage(imageIndex,32,32,32,RGBA(0,0,0,0))
; 			GrabSprite(spriteIndex,xi*#chunkSize,yi*#chunkSize,#chunkSize,#PB_Sprite_AlphaBlending)
; 			If IsSprite(spriteIndex)
;Debug "Grabbed "+xi+" "+yi
; 			cre
			white.i=1
			transparent.i=1
			dx=(xi+1)*#chunkSize-1
			If dx>=*cF\width
				dx=*cF\width-1
			EndIf
			dy=(yi+1)*#chunkSize-1
			If dy>=*cF\height
				dy=*cF\height-1
			EndIf
			StartDrawing(ImageOutput(0))
			DrawingMode(#PB_2DDrawing_AlphaBlend)
			For x=xi*#chunkSize To dx
				For y=yi*#chunkSize To dy
					p=Point(x,y)
					r=Red(p)
					g=Green(p)
					b=Blue(p)
					a=Alpha(p)
					;Debug "Color at "+x+"|"+y+" ("+r+","+g+","+b+","+a+")"
					If *cF\hurt
						If r>1 Or g<254 Or b>1
							white=0
						EndIf
					Else
						If r<254 Or g<254 Or b<254
							white=0
							;Debug "detected non-white"
						EndIf
					EndIf
					If a>0
						transparent=0
						;Debug "detected non-transparent"
					EndIf
					If Not white And Not transparent
						;Debug "Grabbed "+xi+" "+yi+" is not white nor transparent"
						Break 2
					EndIf
				Next
			Next
			StopDrawing()
			If white
				nbWhite+1
				*cF\white(currentChunk)=#True
				;Debug "Grabbed "+xi+" "+yi+" is white"
; 				FreeSprite(spriteIndex)
			Else
				If transparent
					nbTransparent+1
					;Debug "Grabbed "+xi+" "+yi+" is transparent"
					*cF\transparent(currentChunk)=#True
; 					FreeSprite(spriteIndex)
				Else
; 					If *cF\hurt
; 						Debug "drawn chunk hurt "
; 					EndIf
					createdImages+1
					GrabImage(0,1,xi*#chunkSize,yi*#chunkSize,#chunkSize,#chunkSize)
; 					Debug "depth "+ImageDepth(1)
					CreateSprite(spriteIndex,#chunkSize,#chunkSize,#PB_Sprite_AlphaBlending)
					StartDrawing(SpriteOutput(spriteIndex))
					DrawingMode(#PB_2DDrawing_AlphaChannel)
					Box(0,0,#chunkSize,#chunkSize,RGBA(0,0,0,0))
					DrawingMode(#PB_2DDrawing_AlphaBlend)
					DrawAlphaImage(ImageID(1),0,0)
					StopDrawing()
					FreeImage(1)
					*cF\bits(nbChunks)=spriteIndex
; 					Debug "created sprite "+Str(spriteIndex-spriteIndexCompressedFrame)
					spriteIndex+1
					nbChunks+1
				EndIf
			EndIf
; 			EndIf
			currentChunk+1
		Next
	Next
	FreeImage(0)
	*cF\chunks=nbChunks-1
;  	Debug *cF\path$+" "+nbChunks+" "+spriteIndex
	If *cF\chunks>0
		ReDim *cF\bits(*cF\chunks)
	Else
		Debug *cF\path$+" empty..."
		If *cF\hurt
			;Debug *cF\path$+"hurt doesn't have any chunks"
		Else
			;Debug *cF\path$+" doesn't have any chunks"
		EndIf
		ReDim *cF\bits(0)
	EndIf
	If nbWhite=0
		FreeArray(*cF\white())
	EndIf
	If nbTransparent=0
		FreeArray(*cF\transparent())
	EndIf
	If Not *allCompressedFrames(0)
		*allCompressedFrames(0)=*cF
	Else
		ReDim *allCompressedFrames(ArraySize(*allCompressedFrames())+1)
		*allCompressedFrames(ArraySize(*allCompressedFrames()))=*cF
	EndIf
	ProcedureReturn *cF
EndProcedure

Procedure arrayCompress(Array *origin(1),Array *destination(1))
	Protected k=0
	For i=0 To ArraySize(*origin())
		If *origin(i)
			*destination(k)=i
			k+1
		EndIf
	Next
	If k>0
		k-1
	EndIf
	ReDim *destination(k)
EndProcedure

#H2H_JSON_COMPRESSED_FRAME_PATH="path"
#H2H_JSON_COMPRESSED_FRAME_WHITE="white"
#H2H_JSON_COMPRESSED_FRAME_TRANSPARENT="transparent"
#H2H_JSON_COMPRESSED_FRAME_HURT="hurt"
#H2H_JSON_COMPRESSED_FRAME_CHUNK="chunk"
#H2H_JSON_COMPRESSED_FRAME_WIDTH="width"
#H2H_JSON_COMPRESSED_FRAME_HEIGHT="height"

Procedure compressedFrameJSONExport(*cF.compressedFrame,*parent=#Null)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf	
	addJSONString(*parent,#H2H_JSON_COMPRESSED_FRAME_PATH,*cF\path$)
	addJSONInteger(*parent,#H2H_JSON_COMPRESSED_FRAME_HURT,*cF\hurt)
	addJSONInteger(*parent,#H2H_JSON_COMPRESSED_FRAME_WIDTH,*cF\width)
	addJSONInteger(*parent,#H2H_JSON_COMPRESSED_FRAME_HEIGHT,*cF\height)
	
	If ArraySize(*cF\white())>=0
; 		Dim destination(ArraySize(*cF\white()))
; 		arrayCompress(*cF\white(),destination())
		*array=AddJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_WHITE)
		SetJSONArray(*array)
		For i=0 To ArraySize(*cF\white())
			If *cF\white(i)
				*child=AddJSONElement(*array)
				SetJSONInteger(*child,i)
			EndIf
		Next
	Else
		addJSONInteger(*parent,#H2H_JSON_COMPRESSED_FRAME_WHITE,-1)
	EndIf
	
	If ArraySize(*cF\transparent())>=0
; 		Debug "array "+*cF\transparent()
; 		ReDim destination(ArraySize(*cF\transparent()))
; 		arrayCompress(*cF\transparent(),destination())
		*array=AddJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_TRANSPARENT)
		SetJSONArray(*array)
		For i=0 To ArraySize(*cF\transparent())
			If *cF\transparent(i)
				*child=AddJSONElement(*array)
				SetJSONInteger(*child,i)
			EndIf
		Next
	Else
		addJSONInteger(*parent,#H2H_JSON_COMPRESSED_FRAME_TRANSPARENT,-1)
	EndIf
	
	*array=AddJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_CHUNK)
	SetJSONArray(*array)
	For i=0 To ArraySize(*cF\bits())
		*child=AddJSONElement(*array)
; 		Debug "saved "+Str(*cF\bits(i)-spriteIndexCompressedFrame)
		SetJSONInteger(*child,*cF\bits(i)-spriteIndexCompressedFrame)
	Next
	
	ProcedureReturn *parent
EndProcedure

Global NewMap *atlas.compressedFrame()

Procedure compressedFrameJSONImport(*parent)
	path$=GetJSONString(GetJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_PATH))
	If FindMapElement(*atlas(),path$)
		ProcedureReturn 0
	EndIf

	*cF.compressedFrame=AllocateStructure(compressedFrame)
	*cF\path$=path$
	*cF\width= GetJSONIntegerSimple(*parent,#H2H_JSON_COMPRESSED_FRAME_WIDTH)
	*cF\height=GetJSONIntegerSimple(*parent,#H2H_JSON_COMPRESSED_FRAME_HEIGHT)
	*cF\hurt=GetJSONIntegerSimple(*parent,#H2H_JSON_COMPRESSED_FRAME_HURT)
	Debug "Loaded size "+*cF\width+" "+*cF\height
	*array=GetJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_CHUNK)
	If JSONType(*array)<>#PB_JSON_Number
		Dim *cF\bits(JSONArraySize(*array)-1)
		For i=0 To ArraySize(*cF\bits())
			*cF\bits(i)=GetJSONInteger(GetJSONElement(*array,i))
		Next
	EndIf
	
	*array=GetJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_WHITE)
	If JSONType(*array)<>#PB_JSON_Number
		Dim *cF\white(JSONArraySize(*array)-1)
		For i=0 To ArraySize(*cF\white())
			*cF\white(i)=GetJSONInteger(GetJSONElement(*array,i))
		Next
	Else
		FreeArray(*cF\white())
	EndIf
	
	*array=GetJSONMember(*parent,#H2H_JSON_COMPRESSED_FRAME_TRANSPARENT)
	If JSONType(*array)<>#PB_JSON_Number
		Dim *cF\transparent(JSONArraySize(*array)-1)
		For i=0 To ArraySize(*cF\transparent())
			*cF\transparent(i)=GetJSONInteger(GetJSONElement(*array,i))
		Next
	Else
		FreeArray(*cF\transparent())
	EndIf
	*atlas(path$)=*cF
	ProcedureReturn *cF
EndProcedure


Procedure compressedFrameDestroy(*cF.compressedFrame)
	If *cf
		FreeArray(*cF\bits())
		FreeArray(*cF\white())
		FreeArray(*cF\transparent())
		FreeStructure(*cF)
	EndIf
EndProcedure

#H2H_ATLAS_JSON_PATH="everything.json"
Global NewMap alreadyCompressed.i()
Procedure compressedFrameToJSONAll()
	current=JSONindex
	Debug "index : "+JSONindex
	*parent=CreateJSONObject()
	Debug "index : "+JSONindex
; 	SetJSONObject(*parent)
	For i=0 To ArraySize(*allCompressedFrames())
		*cF.compressedFrame=*allCompressedFrames(i)
		*child=addJSONObject(*parent,*cF\path$)
		compressedFrameJSONExport(*cF,*child)
	Next
	SaveJSON(current,#H2H_ATLAS_JSON_PATH)
	FreeMap(alreadyCompressed())
	ProcedureReturn *parent
EndProcedure

#H2H_ATLAS_IMAGE_PATH="allframes32.png"
Procedure compressedFrameFuse()
	CreateImage(0,#exportSizeX,#exportSizeY,32)
	StartDrawing(ImageOutput(0))
	DrawingMode(#PB_2DDrawing_AlphaChannel)
	Box(0,0,#exportSizeX,#exportSizeY,RGBA(0,0,0,0))
	StopDrawing()
	x=0
	y=0
	For i=0 To ArraySize(*allCompressedFrames())
		*cF.compressedFrame=*allCompressedFrames(i)
		For c=0 To ArraySize(*cF\bits())
			b=*cF\bits(c)
; 			Debug "bits("+c+")="+b
; 			If b<>0 And IsSprite(b)
			putSpriteInImage(b,1)
			createdImages+1
			StartDrawing(ImageOutput(0))
			DrawingMode(#PB_2DDrawing_AlphaBlend)
			DrawAlphaImage(ImageID(1),x,y)
			StopDrawing()
			FreeImage(1)
			FreeSprite(b)
; 			EndIf
			x+#chunkSize
			If x>=#exportSizeX
				x=0
				y+#chunkSize
			EndIf
		Next
	Next
	Debug "created "+createdImages
	SaveImage(0,#H2H_ATLAS_IMAGE_PATH,#PB_ImagePlugin_PNG)
EndProcedure

Procedure compressFrame(*f.frame)
	If Not *f
		ProcedureReturn
	EndIf
	If Not FindMapElement(alreadyCompressed(),*f\path$)
		*cF.compressedFrame=compressedFrameCreate(*f\path$)
		If *cF
			AddMapElement(alreadyCompressed(),*f\path$)
		EndIf
		If *f\hurtId
; 			Debug "hurt"
			compressedFrameCreate(*f\path$,*f\hurtId)
		EndIf
	Else
		Debug *f\path$+" already compressed"
	EndIf
EndProcedure

Procedure compressAnimation(*a.animation)
	If Not *a
		ProcedureReturn
	EndIf
	Debug "COMPRESSION ANIMATION ["+*a\frames()+"] "+*a\name
	For i=0 To ArraySize(*a\frames())
		compressFrame(*a\frames(i))
	Next
	For i=0 To ArraySize(*a\animations())
		compressAnimation(*a\animations(i))
	Next
	For i=0 To ArraySize(*a\frontWind(),1)
		For j=0 To ArraySize(*a\frontWind(),2)
			compressAnimation(*a\frontWind(i,j))
		Next
	Next
	For i=0 To ArraySize(*a\backWind(),1)
		For j=0 To ArraySize(*a\backWind(),2)
			compressAnimation(*a\backWind(i,j))
		Next
	Next
EndProcedure

Procedure compressClass(*c.class)
	If Not *c
		ProcedureReturn
	EndIf
	Debug "COMPRESSION CLASS "+*c\name
	For i=0 To ArraySize(*c\animations())
		compressAnimation(*c\animations(i))
	Next
	For i=0 To ArraySize(*c\hitFrames())
		compressFrame(*c\hitFrames(i))
	Next
	For i=0 To ArraySize(*c\otherIdle())
		compressAnimation(*c\otherIdle(i))
	Next
EndProcedure

Procedure compressClassAll()
	; 	compressClass(*allClasses(0))
;  	compressAnimation(*allClasses(0)\neutral)
	For i=0 To ArraySize(*allClasses())
		compressClass(*allClasses(i))
	Next
EndProcedure
 
Global atlasImageId=imageIndex
imageIndex+1
#H2H_ATLAS_IMAGE_BIT_HEIGHT=128
#H2H_ATLAS_IMAGE_CUT_ENABLE=#False
#H2H_ATLAS_IMAGE_CUT_TOTAL=#exportSizeY/#H2H_ATLAS_IMAGE_BIT_HEIGHT
#H2H_ATLAS_CHUNK_PER_CUT=(#exportSizeX*#H2H_ATLAS_IMAGE_BIT_HEIGHT)/#chunkSize
Global atlasBitsAmount.i=#H2H_ATLAS_CHUNK_PER_CUT
Global Dim atlasImageBit(atlasBitsAmount)

Global atlasSpriteId=spriteIndex
spriteIndex+1
Global atlasJSONId=JSONindex
JSONindex+1

Procedure isAtlasInit()
; 	ProcedureReturn Bool(IsImage(atlasImageId) And IsSprite(atlasSpriteId))
	ProcedureReturn IsImage(atlasImageId)
EndProcedure

Procedure compressedFrameJSONImportAll()
	If isAtlasInit()
		*parent=JSONValue(atlasJSONId)
		ExamineJSONMembers(*parent)
		While NextJSONMember(*parent)
			
			compressedFrameJSONImport(GetJSONMember(*parent,JSONMemberKey(*parent)))
		Wend
	EndIf
EndProcedure

Procedure atlasInit()
	If Not IsImage(atlasImageId)
		Debug "new atlas image"
		LoadImage(atlasImageId,#H2H_ATLAS_IMAGE_PATH)
		If #H2H_ATLAS_IMAGE_CUT_ENABLE
			For i=0 To #H2H_ATLAS_IMAGE_CUT_TOTAL
				atlasImageBit(i)=imageIndex
; 				Debug "bit number "+imageIndex
				imageIndex+1
				broken=#False
				GrabImage(atlasImageId,atlasImageBit(i),0,i*#H2H_ATLAS_IMAGE_BIT_HEIGHT,#exportSizeX,#H2H_ATLAS_IMAGE_BIT_HEIGHT)
				StartDrawing(ImageOutput(atlasImageBit(i)))
				DrawingMode(#PB_2DDrawing_AlphaChannel)
				For x=0 To #exportSizeX-1
					For y=0 To #H2H_ATLAS_IMAGE_BIT_HEIGHT-1
						If Point(x,y)<>RGBA(0,0,0,0)
							broken=#True
							Break 2
						EndIf
					Next
				Next
				StopDrawing()
				If Not broken
					atlasBitsAmount=i-1
					FreeImage(atlasImageBit(i))
					Debug "broken at "+i
					ReDim atlasImageBit(atlasBitsAmount)
					Break
				EndIf
			Next
			FreeImage(atlasImageId)
			atlasImageId=atlasImageBit(0)
			Debug "new atlas start "+atlasImageId
; 			End
		EndIf
	EndIf
	If Not IsSprite(atlasSpriteId)
		Debug "new atlas sprite"
; 		LoadSprite(atlasSpriteId,#H2H_ATLAS_IMAGE_PATH,#PB_Sprite_AlphaBlending)
	EndIf
	If Not IsJSON(atlasJSONId)
		Debug "new atlas JSON"
		LoadJSON(atlasJSONId,#H2H_ATLAS_JSON_PATH)
		compressedFrameJSONImportAll()
	EndIf
EndProcedure

Procedure compressedFramePuke(*cF.compressedFrame,destination.i,preview.i=#False)
	Debug "puking "+*cF\path$
	If isAtlasInit() And Not IsSprite(destination)
		stamp.d=ElapsedMillisecondsPrecise()
; 		Debug "size "+*cF\width+" "+*cF\height
		If *cF\hurt
			CreateSprite(destination,*cF\width,*cF\height,#PB_Sprite_AlphaBlending|#PB_Sprite_PixelCollision)
		Else
			CreateSprite(destination,*cF\width,*cF\height,#PB_Sprite_AlphaBlending)
		EndIf
 		Protected xiMax=((*cF\width -1)/#chunkSize)*#chunkSize
 		Protected yiMax=((*cF\height-1)/#chunkSize)*#chunkSize
		StartDrawing(SpriteOutput(destination))
		DrawingMode(#PB_2DDrawing_AlphaChannel)
		Box(0,0,*cF\width,*cF\height,RGBA(0,0,0,0))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
		Protected nbChunks=(xiMax)*(yiMax)
		Protected currentBit=0
		Protected currentWhite=0
		Protected currentTransparent=0
		Static testIndex=0
		x=0
		y=0
		; 		Debug "chunk array size "+ArraySize(*cF\bits())
		;Dim points(#chunkSize*#chunkSize-1)
		Protected workplace=imageIndex
		imageIndex+1
		For c=0 To nbChunks
			If ArraySize(*cF\transparent())>-1 And *cF\transparent(currentTransparent)=c
; 				Debug "transparent at "+currentTransparent
				If currentTransparent<ArraySize(*cF\transparent())
					currentTransparent+1
				EndIf
			Else
				If ArraySize(*cF\white())>-1 And *cF\white(currentWhite)=c
					w=RGBA(255,255,255,255)
					If *cF\hurt
						w=RGBA(0,255,0,255)
; 						Debug "green at "+currentWhite
					Else
; 						Debug "white at "+currentWhite
					EndIf
					Box(x,y,#chunkSize,#chunkSize,w)
					If currentWhite<ArraySize(*cF\white())
						currentWhite+1
					EndIf
				Else
					If currentBit<=ArraySize(*cF\bits())
						bit.i=*cF\bits(currentBit)
						ax=Mod(bit,#exportSizeX/#chunkSize)
						ay=bit/(#exportSizeX/#chunkSize)
						
						If #H2H_ATLAS_IMAGE_CUT_ENABLE
							GrabImage(atlasImageBit((ay*#chunkSize)/#H2H_ATLAS_IMAGE_BIT_HEIGHT),workplace,ax*#chunkSize,Mod(ay,#H2H_ATLAS_IMAGE_BIT_HEIGHT/#chunkSize)*#chunkSize,#chunkSize,#chunkSize)
						Else
							GrabImage(atlasImageId,workplace,ax*#chunkSize,ay*#chunkSize,#chunkSize,#chunkSize)
						EndIf
; 						ClipSprite(atlasSpriteId,ax*#chunkSize,ay*#chunkSize,#chunkSize,#chunkSize)
; 						putSpriteInImage(atlasSpriteId,0)
; 						ClipSprite(atlasSpriteId,#PB_Default,#PB_Default,#PB_Default,#PB_Default)
; 						StartDrawing(SpriteOutput(destination))
; 						DrawingMode(#PB_2DDrawing_AlphaBlend)
; 						Debug "drawn "+currentBit+" "+ax+" "+ay
						DrawImage(ImageID(workplace),x,y)
; 						StopDrawing()
						currentBit+1
					EndIf
				EndIf
			EndIf
			y+#chunkSize
			If y>=*cF\height
				y=0
				x+#chunkSize
			EndIf
		Next
		StopDrawing()
		If IsImage(0)
			FreeImage(0)
		EndIf
		If preview
			Debug "Saved test"+testIndex+".png"
			SaveSprite(destination,"test"+testIndex+".png",#PB_ImagePlugin_PNG)
			testIndex+1
		EndIf
		stamp=ElapsedMillisecondsPrecise()-stamp
		Debug "needed "+stamp
; 		MessageRequester("needed",Str(stamp))
		ProcedureReturn #True
	Else
; 		Debug "Error : no atlas loaded"
; 		MessageRequester("H2H Error","No atlas found")
		ProcedureReturn #False
	EndIf
EndProcedure


Procedure compressedFramePukePath(path$,destination.i,preview.i=#False)
	If FindMapElement(*atlas(),path$)
		compressedFramePuke(*atlas(path$),destination,preview)
		ProcedureReturn #True
	EndIf
	ProcedureReturn #False
EndProcedure

Procedure framePuke(*f.frame,preview.i=#False)
	If *f\hurtId
		compressedFramePukePath(*f\path$+"hurt",*f\hurtId,preview)
	EndIf
	ProcedureReturn compressedFramePukePath(*f\path$,*f\id,preview)
EndProcedure

Procedure framePukeThreadSub(*f.frame)
	framePuke(*f)
EndProcedure

Procedure framePukeThread(*f.frame)
	CreateThread(@framePukeThreadSub(),*f)
EndProcedure
; *test.compressedFrame=compressedFrameCreate("image/hand_chinese_staffnUp1_4",0,0,#True)
; Debug "test size "+*test\chunks
; End
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1178
; FirstLine = 227
; Folding = AAr8-
; EnableXP
; CPU = 1
; EnablePurifier