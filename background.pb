#H2H_MUSIC_MENU=1
#H2H_MUSIC_MENU_PATH="music/Hand2Hand menu v04.ogg"
If musicLevel>0
	LoadSound(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
EndIf

#H2H_MUSIC_THEME01=2
#H2H_MUSIC_THEME01_PATH="music/Hand2Hand main v06 loop.ogg"

#H2H_MUSIC_STARTUP=3
#H2H_MUSIC_STARTUP_PATH="sound/counter.ogg"
#H2H_MUSIC_VICTORY=4
#H2H_MUSIC_VICTORY_PATH="sound/victory.ogg"
#H2H_MUSIC_DEFEAT=5
#H2H_MUSIC_DEFEAT_PATH="sound/defeat.ogg"

#H2H_MUSIC_THEME02=6
#H2H_MUSIC_THEME02_PATH="music/Stick da being v05.ogg"

#H2H_MUSIC_THEME03=7
#H2H_MUSIC_THEME03_PATH="music/Pouwap v02 loop.ogg"

#H2H_MUSIC_STARTUP03=8
#H2H_MUSIC_STARTUP03_PATH="music/Pouwap intro.ogg"

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
	music.i ; played for the level
	musicPath$
	introMusic.i ; played at start of the level
	introMusicPath$
	name$
	white.i ; if true, wind effects will be a bit more colored
EndStructure

Global Dim *allBackground.background(0)

Procedure backgroundLoad(*what.background)
	k=1
	ReDim *what\sizes(ArraySize(*what\imagesId()))
	*what\size=0
	For i=0 To ArraySize(*what\imagesId())
		LoadSprite(*what\imagesId(0)+i,*what\path$+k+".png")
		*what\sizes(i)=SpriteWidth(*what\imagesId(i))
		*what\size+SpriteWidth(*what\imagesId(i))
		k+1
	Next
EndProcedure

Procedure backgroundCreate(*what.background,path.s,leftLimit.i=0,rightLimit.i=-1)
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
	*what\introMusic=#H2H_MUSIC_STARTUP
	*what\introMusicPath$=#H2H_MUSIC_STARTUP_PATH
	*what\leftLimit=leftLimit
	If rightLimit=-1 
		*what\rightLimit=*what\size
	EndIf
	n=0
	k=1
	While fileExist(path+k+".png")
		ReDim *what\imagesId(i)
		ReDim *what\show(i)
		ReDim *what\sizes(i)
		*what\imagesId(i)=spriteIndexAdd()
		k+1
		i+1
	wend
	ProcedureReturn *what
EndProcedure

Procedure backgroundDestroy(*what.background)
	For i=0 To ArraySize(*what\imagesId())
		If IsSprite(*what\imagesId(0)+i)
			FreeSprite(*what\imagesId(0)+i)
		EndIf
	Next
EndProcedure

Procedure backgroundRefreshOLD(*what.background, focus.i, screenSize.i)
	*what\focus=focus
	size=*what\size/(ArraySize(*what\show())+1)
	For i=0 To ArraySize(*what\show())
		*what\show(i)=0
	Next
	start=(focus/size)-1
	If start<0
		start=0
	EndIf
	theEnd=min((focus+screenSize)/size,ArraySize(*what\imagesId()))
	For i=start To theEnd
		*what\show(i)=1
	Next
EndProcedure

Procedure backgroundRefresh(*what.background, focus.i, screenSize.i)
	*what\focus=focus
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
	size=*what\size/(ArraySize(*what\show())+1)
	tmpx=0
	For i=0 To ArraySize(*what\show())
		If *what\show(i)
			DisplaySprite(*what\imagesId(i),tmpx-focus+*screenShake\x,*what\height+*screenShake\y-(1080-screenSizeY)-screenFocusHeight)
		EndIf
		tmpx+*what\sizes(i)
	Next
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 86
; FirstLine = 64
; Folding = --
; EnableXP
; CPU = 1