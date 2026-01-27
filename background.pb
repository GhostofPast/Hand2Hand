Structure background
	Array imagesId.i(1)
	Array show.i(1)
	Array sizes.i(1)
	size.i ; total size in pixels
	focus.i; coord x where the center of the screen points
	height.i
	leftLimit.i
	rightLimit.i
	path$
	*music.musicEx;music.q ; played for the level
; 	musicPath$
	*introMusic.musicEx;introMusic.q ; played at start of the level
	*victoryMusic.musicEx
	*defeatMusic.musicEx
; 	introMusicPath$
	name$
	white.a ; if true, wind effects will be a bit more colored
	training.a
EndStructure

Global Dim *allBackground.background(0)

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure backGroundExportJSON(*parent,*b.background)
	If *b\name$<>""
		addJSONString(*parent,"name",*b\name$)
	EndIf
	If *b\path$<>""
		addJSONString(*parent,"path",*b\path$)
	EndIf
	If *b\music
		addJSONInteger(*parent,"musicId",*b\music\id,#True)
	EndIf
	If *b\introMusic
		addJSONInteger(*parent,"introMusicId",*b\introMusic\id,#True)
	EndIf
	If *b\victoryMusic
		addJSONInteger(*parent,"victoryMusicId",*b\victoryMusic\id,#True)
	EndIf
	If *b\defeatMusic
		addJSONInteger(*parent,"defeatMusicId",*b\defeatMusic\id,#True)
	EndIf
; 	If *b\musicPath$<>""
; 		addJSONString(*parent,"musicPath",*b\musicPath$)
; 	EndIf
; 	If *b\introMusicPath$<>""
; 		addJSONString(*parent,"introMusicPath",*b\introMusicPath$)
; 	EndIf
	addJSONInteger(*parent,"size",*b\size)
	addJSONInteger(*parent,"height",*b\height)
	addJSONInteger(*parent,"leftLimit",*b\leftLimit,#True)
	addJSONInteger(*parent,"rightLimit",*b\rightLimit,#True)
	addJSONInteger(*parent,"white",*b\white,#True)
	addJSONInteger(*parent,"training",*b\training,#True)
EndProcedure

Procedure backGroundExportJSONAll(*parent)
	For i=0 To ArraySize(*allBackground())
		*child=AddJSONElement(*parent)
		SetJSONObject(*child)
		backGroundExportJSON(*child,*allBackground(i))
	Next
EndProcedure
CompilerEndIf

; Procedure backgroundBlur(*what.background,enable.i=#True,blurSize.i=1)
; 	If enable
; 		For i=0 To ArraySize(*what\sizes())
; 			j=*what\imagesId(i)
; 			sizeX=SpriteWidth(j)
; 			sizeY=SpriteHeight(j)
; 			Dim dots(sizeX-1,sizeY-1)
; 			StartDrawing(SpriteOutput(j))
; 			For x=0 To sizeX-1
; 				For y=0 To sizeY-1
; 					r=0
; 					g=0
; 					b=0
; 					hit=0
; 					For x1=x-blurSize To x+blurSize
; 						For y1=y-blurSize To y+blurSize
; 							If x1>=0 And x1<sizeX And y1>=0 And y1<sizeY
; 								p=Point(x1,y1)
; 								r+Red(p)
; 								g+Green(p)
; 								b+Blue(p)
; 								hit+1
; 							EndIf
; 						Next
; 					Next
; 					dots(x,y)=RGB(r/hit,g/hit,b/hit)
; 				Next
; 			Next
; 			
; 			For x=0 To sizeX-1
; 				For y=0 To sizeY-1
; 					Plot(x,y,dots(x,y))
; 				Next
; 			Next
; 			
; 			StopDrawing()
; 			FreeArray(dots())
; 		Next
; 	EndIf
; EndProcedure

Procedure backgroundLoad(*what.background)
	If *what\training
		ProcedureReturn
	EndIf
	k=1
	ReDim *what\sizes(ArraySize(*what\imagesId()))
	*what\size=0
	For i=0 To ArraySize(*what\imagesId())
		If Not IsSprite(*what\imagesId(0)+i)
			LoadSprite(*what\imagesId(0)+i,*what\path$+k+".png")
			*what\sizes(i)=SpriteWidth(*what\imagesId(i))
		EndIf
		*what\size+SpriteWidth(*what\imagesId(i))
		k+1
	Next
EndProcedure

Procedure backgroundCreate(*what.background,path.s,leftLimit.i=0,rightLimit.i=-1,training.i=#False)
	If Not *what
		*what=AllocateStructure(background)
		If *allBackground(0)=0
			*allBackground(0)=*what
		Else
			ReDim *allBackground(ArraySize(*allBackground())+1)
			*allBackground(ArraySize(*allBackground()))=*what
		EndIf
		*what\name$="terrain "+ArraySize(*allBackground())
	EndIf
	*what\focus=0
	*what\size=0
	*what\path$=path
	*what\leftLimit=leftLimit
	If rightLimit=-1
		*what\rightLimit=3000
	Else
		*what\rightLimit=rightLimit
	EndIf
	*what\size=*what\rightLimit-*what\leftLimit
	*what\training=training
	If Not *what\training
		n=0
		k=1
		While fileExist(path+k+".png")
			ReDim *what\imagesId(i)
			ReDim *what\show(i)
			ReDim *what\sizes(i)
			*what\imagesId(i)=spriteIndexAdd()
			k+1
			i+1
		Wend
	EndIf
	ProcedureReturn *what
EndProcedure

;--- Background
Global terrainWidth=3000
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Global *desktop.background=backgroundCreate(0,"image/background1_")
*desktop\height=100
*desktop\music=*allMusic(Str(#H2H_MUSIC_THEME01))
*desktop\introMusic=*allMusic(Str(#H2H_MUSIC_STARTUP))
*desktop\victoryMusic=*allMusic(Str(#H2H_MUSIC_VICTORY))
*desktop\defeatMusic=*allMusic(Str(#H2H_MUSIC_DEFEAT))
*desktop\name$="Home desktop"
*desktop\leftLimit=25
*desktop\rightLimit=1975

Global *college.background=backgroundCreate(0,"image/background2_",275,5975)
*college\height=-520
*college\music=*allMusic(Str(#H2H_MUSIC_THEME02))
*college\introMusic=*allMusic(Str(#H2H_MUSIC_STARTUP))
*college\victoryMusic=*allMusic(Str(#H2H_MUSIC_VICTORY))
*college\defeatMusic=*allMusic(Str(#H2H_MUSIC_DEFEAT))
*college\name$="College"
*college\white=#True

Global *boardGameClub.background=backgroundCreate(0,"image/background3_",25,4975)
*boardGameClub\height=-560

*boardGameClub\music=*allMusic(Str(#H2H_MUSIC_THEME03))
*boardGameClub\introMusic=*allMusic(Str(#H2H_MUSIC_STARTUP03))
*boardGameClub\victoryMusic=*allMusic(Str(#H2H_MUSIC_VICTORY))
*boardGameClub\defeatMusic=*allMusic(Str(#H2H_MUSIC_DEFEAT))

*boardGameClub\name$="Board game club"
*boardGameClub\white=#True

; Global *training.background=backgroundCreate(0,"",0,4000,#True)
; *training\name$="Training"
CompilerEndIf

CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure backGroundImportJSON(*parent)
	
	*b.background=backgroundCreate(*b,loadJSONString(*parent,"path"),loadJSONInteger(*parent,"leftLimit"),loadJSONInteger(*parent,"rightLimit"),loadJSONInteger(*parent,"training"))
	*b\height=loadJSONInteger(*parent,"height")
	*b\name$=loadJSONString(*parent,"name")
	*b\music=loadJSONInteger(*parent,"musicId")
	If *b\music
		*b\music=*allMusic(Str(*b\music))
		Debug "Music "+*b\music
	EndIf
	*b\introMusic=loadJSONInteger(*parent,"introMusicId")
	If *b\introMusic
		*b\introMusic=*allMusic(Str(*b\introMusic))
		Debug "intro "+*b\introMusic
	EndIf
	*b\victoryMusic=loadJSONInteger(*parent,"victoryMusicId")
	If *b\victoryMusic
		*b\victoryMusic=*allMusic(Str(*b\victoryMusic))
		Debug "Victory "+*b\victoryMusic
	EndIf
	*b\defeatMusic=loadJSONInteger(*parent,"defeatMusicId")
	If *b\defeatMusic
		*b\defeatMusic=*allMusic(Str(*b\defeatMusic))
		Debug "Defeat "+*b\defeatMusic
	EndIf
	;*b\musicPath$=loadJSONString(*parent,"musicPath")
	;*b\introMusicPath$=loadJSONString(*parent,"introMusicPath")
	*b\white=loadJSONInteger(*parent,"white")
	*b\training=loadJSONInteger(*parent,"training")
	ProcedureReturn *b
EndProcedure
Procedure backGroundImportJSONAll(*parent)
	size=JSONArraySize(*parent)
	For i=0 To size-1
		backGroundImportJSON(GetJSONElement(*parent,i))
	Next
EndProcedure
CompilerEndIf
Procedure backgroundDestroy(*what.background)
	If *what\training
		ProcedureReturn
	EndIf
	For i=0 To ArraySize(*what\imagesId())
		If IsSprite(*what\imagesId(0)+i)
			FreeSprite(*what\imagesId(0)+i)
		EndIf
	Next
EndProcedure

; Procedure backgroundRefreshOLD(*what.background, focus.i, screenSize.i)
; 	*what\focus=focus
; 	size=*what\size/(ArraySize(*what\show())+1)
; 	For i=0 To ArraySize(*what\show())
; 		*what\show(i)=0
; 	Next
; 	start=(focus/size)-1
; 	If start<0
; 		start=0
; 	EndIf
; 	theEnd=min((focus+screenSize)/size,ArraySize(*what\imagesId()))
; 	For i=start To theEnd
; 		*what\show(i)=1
; 	Next
; EndProcedure

Procedure backgroundRefresh(*what.background, focus.i, screenSize.i)
	*what\focus=focus
	
	If *what\training
		ProcedureReturn
	EndIf
	For i=0 To ArraySize(*what\show())
		*what\show(i)=0
	Next
	start=0
	where=0
	While where<focus And start<ArraySize(*what\sizes())
		where+*what\sizes(start)
		start+1
	Wend
	start-1
	If start<0
		start=0
	EndIf
	theEnd=start
	where=focus
	While theEnd<focus+screenSize And theEnd<ArraySize(*what\sizes())
		where+*what\sizes(theEnd)
		theEnd+1
	Wend
	For i=start To theEnd
		*what\show(i)=1
	Next
EndProcedure

Procedure backgroundDisplay(*what.background, focus.i, screenSize.i, screenHeight.i)
	If *what\training
		StartDrawing(ScreenOutput())
		groundHeight=*screenShake\y+#HITBOX_SHIFT_Y+#HITBOX_SIZE+groundLevel-screenFocusHeight
		Box(0,0,screenSize,screenHeight,RGB(32,32,32))
		Box(0,groundHeight,screenSize,200,RGB(64,64,64))
		#size=50
		shift=Mod(focus,#size)
		For x=0 To screenSize Step #size
			LineXY(x-shift+*screenShake\x,0,x-shift+*screenShake\x,screenHeight,#Gray)
		Next
		shift=Mod(groundHeight,#size)
		For y=0 To screenHeight Step #size
			LineXY(0,y+shift,screenSize,y+shift,#Gray)
		Next
		shift=Mod(focus,#size*4)
		For x=0 To screenSize Step #size*4
			LineXY(x-shift+*screenShake\x,0,x-shift+*screenShake\x,screenHeight,#White)
		Next
		shift=Mod(groundHeight,#size*4)
		For y=0 To screenHeight Step #size*4
			LineXY(0,y+shift,screenSize,y+shift,#White)
		Next
		StopDrawing()
		ProcedureReturn
	EndIf
	If Not IsSprite(*what\imagesId(0))
		backgroundLoad(*what)
	EndIf
	size=*what\size/(ArraySize(*what\show())+1)
	tmpx=0
	For i=0 To ArraySize(*what\show())
		If *what\show(i)
			DisplayTransparentSprite(*what\imagesId(i),tmpx-focus+*screenShake\x,*what\height+*screenShake\y-(1080-screenHeight)-screenFocusHeight)
			If *what\white
				DisplayTransparentSprite(*what\imagesId(i),tmpx-focus+*screenShake\x,*what\height+*screenShake\y-(1080-screenHeight)-screenFocusHeight,8,#Black)
			EndIf
		EndIf
		tmpx+*what\sizes(i)
	Next
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 19
; Folding = ---
; EnableXP
; CPU = 1