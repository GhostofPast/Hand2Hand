Global textIndex.i=0
Global textWhite.i=0
Global textBig.i=0
; Global textBlue=0
; Global textOrange=0
#CHAR_SIZE_X=16.0
#CHAR_SIZE_Y=16.0
#H2H_LINE_SPACE=2.0
#H2H_CHAR_SPACE=-3.0
Structure textWidget
	id.i ; constructed sprite
	text$
	lifespan.i ; frames left to live
EndStructure

Global NewMap *buffedText.textWidget()
;Procedure Afftext(Text$,x.i,y.i):lg=Len(Text$):For i=1 To lg:code=Asc(Mid(Text$,i,1))-32:If code>=0 And code<= 89:DisplayTransparentSprite(textIndex+code,x,y):EndIf:x+15:Next
;EndProcedure

; will create a new text widget if it doesn't exist
; else, will simply return the existing one
; but i have to found a solution to draw text eficiently
Procedure.i textWidgetCreate(text$)
	If text$=#LF$
		ProcedureReturn 0
	EndIf
	*newTextWidget.textWidget=FindMapElement(*buffedText(),text$)
	If Not *newTextWidget
		*newTextWidget=AllocateStructure(textWidget)
		*newTextWidget\lifespan=500
		*newTextWidget\text$=text$
		*newTextWidget\id=spriteIndex
		spriteIndex+1
		*buffedText(text$)=*newTextWidget
	;=====================
		originX=0
		y=0
		lg=Len(Text$)
		start=1
		CreateImage(0,1024,1024)
		StartDrawing(ImageOutput(0))
		x=0
		maxX=x
		For i=start To lg
			char$=Mid(Text$,i,1)
			If char$="\" ;next line
				x=originX
				y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
			Else
				code=Asc(char$)-32
				If char$<>" " And code>=0 And code<=90
					If char$="." Or char$="," Or char$=";"
						x-5
					EndIf
					If char$="," Or char$=";"
						;DisplayTransparentSprite(textColor+code,x,y+3)
						
					Else
						;DisplayTransparentSprite(textColor+code,x,y)
					EndIf
				EndIf
				x+#CHAR_SIZE_X+#H2H_CHAR_SPACE
				maxX=max(x,maxX)
			EndIf
		Next
		y+#CHAR_SIZE_Y
		StopDrawing()
		CreateSprite(*newTextWidget\id,maxX,y)
		StartDrawing(SpriteOutput(*newTextWidget\id))
		DrawImage(0,0,0)
		StopDrawing()
		FreeImage(0)	
	;=====================
	EndIf
	ProcedureReturn *newTextWidget
EndProcedure

Procedure textWidgetRefresh()
	ForEach *buffedText()
		If *buffedText()\lifespan<0
			If IsSprite(*buffedText()\id)
				FreeSprite(*buffedText()\id)
			EndIf
			FreeStructure(*buffedText())
			DeleteMapElement(*buffedText())
		Else
			*buffedText()\lifespan-1
		EndIf
	Next
EndProcedure

Procedure initBigText()
	If Not textBig
		textBig=spriteIndex
		spriteIndex+1
	EndIf
	LoadSprite(textBig,"image/number.png",#PB_Sprite_AlphaBlending)
EndProcedure

Procedure.i initAffText(path$)
	If textWhite=0
		textWhite=spriteIndex
		spriteIndex+1
	EndIf
	If Not IsSprite(textWhite)
		LoadSprite(textWhite,path$)
	EndIf
	initBigText()
	ProcedureReturn textWhite
EndProcedure

Procedure displayCharAt(code.f,x.i,y.i,textColor.i=0,textColorIntensity.i=128,scale.f=1)
	ZoomSprite(textWhite,#PB_Default,#PB_Default)
	ClipSprite(textWhite,code*#CHAR_SIZE_X,0,#CHAR_SIZE_X,#CHAR_SIZE_Y)
	ZoomSprite(textWhite,#CHAR_SIZE_X*scale,#CHAR_SIZE_Y*scale)
	char$=Chr(Int(Round(code,#PB_Round_Nearest))+32)
	If char$="," Or char$=";" 
		DisplayTransparentSprite(textWhite,x,y+3*scale)
		If textColor
			DisplayTransparentSprite(textWhite,x,y+3*scale,textColorIntensity,textColor)
		EndIf
	Else
		DisplayTransparentSprite(textWhite,x,y)
		If textColor
			DisplayTransparentSprite(textWhite,x,y,textColorIntensity,textColor)
		EndIf
	EndIf
EndProcedure

Procedure AfftextColor(Text$,x.f,y.f,textColor.i=0,textColorIntensity=128,scale.f=1)
	If Text$=#LF$
		ProcedureReturn 0
	EndIf
	originX=x
	lg=Len(Text$)
	If y>-#CHAR_SIZE_Y And y<ScreenSizeY
		start=1
		If x<0
			start+(-x)/#CHAR_SIZE_X
		EndIf
		If x>ScreenSizeX-#CHAR_SIZE_X
			lg-(x-ScreenSizeX)/#CHAR_SIZE_X
		EndIf
		For i=start To lg
			char$=Mid(Text$,i,1)
			If char$="\" ;next line
				x=originX
				y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)*scale
				If y>ScreenSizeY ; no need to continue if it's to low
					ProcedureReturn y
				EndIf
			Else
				code=Asc(char$)-32
				;If char$<>" " And code>=0 And code<=90
				If char$="." Or char$="," Or char$=";" 
					x-4.0*scale
				EndIf
				If char$="'"
					x-3.0*scale
				EndIf
				displayCharAt(code,x,y,textColor,textColorIntensity,scale)
				x+(#CHAR_SIZE_X+#H2H_CHAR_SPACE)*scale
				If char$="'"
					x-3.0*scale
				EndIf
			EndIf
		Next
	EndIf
	ProcedureReturn y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)*scale
EndProcedure

Procedure AfftextGetLength(t$)
	x=0
	If t$=#LF$
		ProcedureReturn 0
	EndIf
	lg=Len(t$)
	start=1
	For i=start To lg
		char$=Mid(t$,i,1)
		code=Asc(char$)-32
		If char$="." Or char$="," Or char$=";" 
			x-5
		EndIf
		If char$="'"
			x-3
		EndIf
		x+#CHAR_SIZE_X+#H2H_CHAR_SPACE
		If char$="'"
			x-3
		EndIf
	Next
	ProcedureReturn x
EndProcedure

Procedure Afftext(Text$,x.i,y.i)
	ProcedureReturn AfftextColor(Text$,x.i,y.i)
EndProcedure

Procedure AfftextBloc(text$,x.i,y.i,width.i,textColor.i=0)
	If Text$=#LF$
		ProcedureReturn 0
	EndIf
	text$=ReplaceString(text$,"\"," ")
	Dim words$(500)
	For i=0 To ArraySize(words$())
		words$(i)=StringField(text$,i+1," ")
		If words$(i)=""
			ReDim words$(i-1)
			Break
		EndIf
	Next
	originX=x
	dx=0
	first.i=#False
	For i=0 To ArraySize(words$())
		l=Len(words$(i))
		lx=l*#CHAR_SIZE_X
		dx+lx
		If dx>width
			dx=0
			x=originX
			y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
		EndIf
		For j=1 To l
			char$=Mid(words$(i),j,1)
			code=Asc(char$)-32
			;If char$<>" " And code>=0 And code<=90
			If char$="." Or char$="," Or char$=";"
				x-5
			EndIf
			If char$="'"
				x-3
			EndIf
			displayCharAt(code,x,y,textColor)
			x+#CHAR_SIZE_X+#H2H_CHAR_SPACE
			If char$="'"
				x-3
			EndIf
		Next
		x+#CHAR_SIZE_X
	Next
	FreeArray(words$())
	ProcedureReturn y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
EndProcedure


; Procedure displayBigCharAt(code.f,x.i,y.i,textColor.i=0,textColorIntensity.i=128,scale.f=1)
; 	ZoomSprite(textWhite,#PB_Default,#PB_Default)
; 	ClipSprite(textWhite,code*#CHAR_SIZE_X,0,#CHAR_SIZE_X,#CHAR_SIZE_Y)
; 	ZoomSprite(textWhite,#CHAR_SIZE_X*scale,#CHAR_SIZE_Y*scale)
; 	char$=Chr(Int(Round(code,#PB_Round_Nearest))+32)
; 	If char$="," Or char$=";" 
; 		DisplayTransparentSprite(textWhite,x,y+3*scale)
; 		If textColor
; 			DisplayTransparentSprite(textWhite,x,y+3*scale,textColorIntensity,textColor)
; 		EndIf
; 	Else
; 		DisplayTransparentSprite(textWhite,x,y)
; 		If textColor
; 			DisplayTransparentSprite(textWhite,x,y,textColorIntensity,textColor)
; 		EndIf
; 	EndIf
; EndProcedure

Procedure displayBigText(x.i,y.i,text$,color.i=0,scale.d=1)
	originX=x
	lg=Len(text$)
	For i=1 To lg
		found=#False
		c$=Mid(text$,i,1)
		If c$=":"
			found=1
			x-20*scale
			ClipSprite(textBig,640,0,64,64)
		Else
			code=Asc(c$)-Asc("0")
			If code>=0 And code <=9
				found=2
				ClipSprite(textBig,code*64,0,64,64)
			EndIf
		EndIf
		ZoomSprite(textBig,64.0*scale,64.0*scale)
		If found
			If gamePaused
				DisplayTransparentSprite(textBig,x,y,255)
				If color
					DisplayTransparentSprite(textBig,x,y,128,color)
				EndIf
			Else
				tX=x+Random(*screenShakeDistance\x)-*screenShakeDistance\x/2
				tY=y+Random(*screenShakeDistance\y)-*screenShakeDistance\y/2
				DisplayTransparentSprite(textBig,tX,tY,255-(*screenShakeDistance\x+*screenShakeDistance\y)*2)
				If color
					DisplayTransparentSprite(textBig,tX,tY,128-(*screenShakeDistance\x+*screenShakeDistance\y),color)
				EndIf
			EndIf
		EndIf
		ZoomSprite(textBig,#PB_Default,#PB_Default)
		If found=1
			x+44*scale
		Else
			x+64*scale
		EndIf
	Next
	ProcedureReturn x
EndProcedure

Procedure displayTimer(time.i,scale.d=1)
	x=(screenSizeX-(64*4+24)*scale)/2
	y=16
	m=time/60
	If m>99
		m=99
	EndIf
	If m<0
		m=0
	EndIf
	m$=Str(m)
	If m<10
		m$="0"+m$
	EndIf
	s=Mod(time,60)
	If s<0
		s=0
	EndIf
	s$=Str(s)
	If s<10
		s$="0"+s$
	EndIf
	If gamePaused
		displayBigText(x,y,m$+":"+s$,RGB(128,64,0),scale)
	Else
		displayBigText(x,y,m$+":"+s$,0,scale)
	EndIf
EndProcedure

; Procedure AfftextBlocOLD(text$,x.i,y.i,width.i,textColor.i=0)
; 	If Text$=#LF$
; 		ProcedureReturn 0
; 	EndIf
; 	text$=ReplaceString(text$,"\"," ")
; 	Dim words$(500)
; 	For i=0 To ArraySize(words$())
; 		words$(i)=StringField(text$,i+1," ")
; 		If words$(i)=""
; 			ReDim words$(i-1)
; 			Break
; 		EndIf
; 	Next
; 	originX=x
; 	dx=0
; 	For i=0 To ArraySize(words$())
; 		l=Len(words$(i))
; 		lx=l*#CHAR_SIZE_X
; 		dx+lx
; 		If dx>width
; 			dx=0
; 			x=originX
; 			y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
; 		EndIf
; 		For j=1 To l
; 			char$=Mid(words$(i),j,1)
; 			code=Asc(char$)-32
; 			;If char$<>" " And code>=0 And code<=90
; 			If char$="." Or char$="," Or char$=";"
; 				x-5
; 			EndIf
; 			If char$="'"
; 				x-3
; 			EndIf
; 			If char$="," Or char$=";"
; 				DisplayTransparentSprite(textWhite+code,x,y+3)
; 				If textColor
; 					DisplayTransparentSprite(textWhite+code,x,y+3,128,textColor)
; 				EndIf
; 			Else
; 				DisplayTransparentSprite(textWhite+code,x,y)
; 				If textColor
; 					DisplayTransparentSprite(textWhite+code,x,y,128,textColor)
; 				EndIf
; 			EndIf
; 			;EndIf
; 			x+#CHAR_SIZE_X+#H2H_CHAR_SPACE
; 			If char$="'"
; 				x-3
; 			EndIf
; 		Next
; 		x+#CHAR_SIZE_X
; 	Next
; 	FreeArray(words$())
; 	ProcedureReturn y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
; EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 310
; FirstLine = 246
; Folding = +-
; EnableXP
; CPU = 1