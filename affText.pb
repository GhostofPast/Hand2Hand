Global textIndex.i=0
; Global textWhite.i=0
; Global textBig.i=0
; Global textBorder.i=spriteIndexAdd()
; Global textBorderBig.i=spriteIndexAdd()
#H2H_TEXT_FONT_BORDER_THICKNESS=2
#H2H_TEXT_FONT_BORDER_DISTANCE=2
Global textBorderThickness.s
; Global textBlue=0
; Global textOrange=0
#CHAR_SIZE_X=16.0
#CHAR_SIZE_Y=16.0
#H2H_LINE_SPACE=2.0
#H2H_CHAR_SPACE=-3.0

; depreciated
; Structure borderType
; 	spriteId.i
; 	thickness.i
; 	distance.i
; EndStructure

Structure font
	path$
	spriteId.i
	; the size of each sub sprite to crop
	charSizeX.i
	charSizeY.i 
	
	charSpace.i ; by default 0, the X space between each char
	lineSpace.i	; by default 0, the Y space between lines
	
	thickness.i ; by default 0, for text border pixel thickness around each char
	distance.i ; by default 0, for text border pixel max distance around each char
	
	scale.d ; by default 1
	charShift.i ; by default 32, where to start the ascii code
EndStructure

Procedure AfftextBorderCreate(*f.font,*model.font)
	If Not *f
		ProcedureReturn 0
	EndIf
	Debug "creating for "+*model\path$
	thickness=*f\thickness
	euclidianDistance=*f\distance
	id=*f\spriteId
	charSizeX=*f\charSizeX
	charSizeY=*f\charSizeY
	If Not IsSprite(id)
		LoadSprite(id,*model\path$)
		shiftX.i=charSizeX+thickness*2
		shiftY.i=charSizeY+thickness*2
; 		ZoomSprite(id,#PB_Default,#PB_Default)
; 		RotateSprite(id,0,#PB_Absolute)
		max.i=SpriteWidth(id)/charSizeX
		Dim dots(max*shiftX-1,shiftY-1)
		If StartDrawing(SpriteOutput(id))
			For i=0 To max-1
				For x=0 To charSizeX-1
					For y=0 To charSizeY-1
						If Point(i*charSizeX+x,y)
							For x1=-thickness To thickness
								For y1=-thickness To thickness
									If Abs(x1)+Abs(y1)<=euclidianDistance
										dots(x+i*shiftX+x1+thickness,y+thickness+y1)=1
									EndIf
								Next
							Next
						EndIf
					Next
				Next
			Next
		EndIf
		StopDrawing()
		FreeSprite(id)
		CreateSprite(id,max*shiftX,shiftY)
		StartDrawing(SpriteOutput(id))
		For x=0 To SpriteWidth(id)-1
			For y=0 To SpriteHeight(id)-1
				If dots(x,y)
					Plot(x,y,#White)
				EndIf
			Next
		Next
		StopDrawing()
; 		TransparentSpriteColor(id,#Black)
		FreeArray(dots())
	EndIf
EndProcedure

Procedure fontCreate(*f.font,path$,newCharSizeX.i,newCharSizeY.i,newLineSpace.i,newCharSpace.i)
	If Not *f
		*f=AllocateStructure(font)
	EndIf
	If Not *f\spriteId
		*f\spriteId=spriteIndexAdd()
	EndIf
	*f\path$=path$
	*f\spriteId=newSpriteId
	*f\charSizeX=newCharSizeX
	*f\charSizeY=newCharSizeY
	*f\lineSpace=newLineSpace
	*f\charSpace=newCharSpace
	*f\scale=1
	*f\charShift=32
	ProcedureReturn *f
EndProcedure

Procedure fontLoad(*f.font)
	If Not *f\spriteId 
		*f\spriteId=spriteIndexAdd()
	EndIf
	If Not IsSprite(*f\spriteId) And *f\path$<>""
		LoadSprite(*f\spriteId,*f\path$)
	EndIf
EndProcedure

Global *currentFont.font
Global *font16.font
Global *font32.font
Global *font16Border.font
Global *font16BorderBig.font
Global *font32Border.font

; Global *textBorder.borderType=AllocateStructure(borderType)
; *textBorder\spriteId=spriteIndexAdd()
; *textBorder\thickness=#H2H_TEXT_FONT_BORDER_THICKNESS
; *textBorder\distance=#H2H_TEXT_FONT_BORDER_DISTANCE
; Global *textBorderBig.borderType=AllocateStructure(borderType)
; *textBorderBig\spriteId=spriteIndexAdd()
; *textBorderBig\thickness=4
; *textBorderBig\distance=4

#H2H_TEXT_WIDGET_ENABLED=#False
CompilerIf #H2H_TEXT_WIDGET_ENABLED
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
CompilerEndIf

; All chars not supported are replaced by their normal version
CompilerIf 0 ; put to 0 to disable it
Procedure.s charSafe(c.s)
	r.s=LCase(c)
	upper=Bool(r<>c)
	Select r
		; add new chars if needed
	EndSelect
	If upper
		r=UCase(r)
	EndIf
	ProcedureReturn r
EndProcedure
CompilerElse
	Macro charsafe(s)
		s
	EndMacro
CompilerEndIf

#H2H_TEXT_WHITE_PATH="image\letter_white.png"
#H2H_TEXT_WHITE_BIG_PATH="image\letter_white_big.png"

CompilerIf #H2H_MODE_SAVE
Procedure initAffText()
	; TODO constants
	; TODO import/export font
	*font16=fontCreate(*font16,#H2H_TEXT_WHITE_PATH,#CHAR_SIZE_X,#CHAR_SIZE_Y,#H2H_LINE_SPACE,#H2H_CHAR_SPACE)
	*font32=fontCreate(*font32,#H2H_TEXT_WHITE_BIG_PATH,#CHAR_SIZE_X*2,#CHAR_SIZE_Y*2,#H2H_LINE_SPACE*2,#H2H_CHAR_SPACE*2)
	*font16Border=fontCreate(*font16Border,"",#CHAR_SIZE_X,#CHAR_SIZE_Y,#H2H_LINE_SPACE,#H2H_CHAR_SPACE)
	*font16Border\thickness=#H2H_TEXT_FONT_BORDER_THICKNESS
	*font16Border\distance=#H2H_TEXT_FONT_BORDER_DISTANCE
	*font16BorderBig=fontCreate(*font16BorderBig,"",#CHAR_SIZE_X,#CHAR_SIZE_Y,#H2H_LINE_SPACE,#H2H_CHAR_SPACE)
	*font16BorderBig\thickness=#H2H_TEXT_FONT_BORDER_THICKNESS*2
	*font16BorderBig\distance=#H2H_TEXT_FONT_BORDER_DISTANCE*2
	*font32Border=fontCreate(*font32Border,"",#CHAR_SIZE_X*2,#CHAR_SIZE_Y*2,#H2H_LINE_SPACE*2,#H2H_CHAR_SPACE*2)
	*font32Border\thickness=#H2H_TEXT_FONT_BORDER_THICKNESS*2
	*font32Border\distance=#H2H_TEXT_FONT_BORDER_DISTANCE*2
	*currentFont=*font16
	
	fontLoad(*font16)
	fontLoad(*font32)
	fontLoad(*font16Border)
	fontLoad(*font16BorderBig)
	fontLoad(*font32Border)
	AfftextBorderCreate(*font16Border,*font16)
	AfftextBorderCreate(*font16BorderBig,*font16)
	AfftextBorderCreate(*font32Border,*font32)
EndProcedure
Procedure fontJSONExport(*f.font,*parent=#Null)
	current=JSONindex
	If Not *parent
		*parent=CreateJSONObject(current)
		JSONindex+1
	EndIf
	addJSONString(*parent,"path",*f\path$,#True)
	addJSONInteger(*parent,"charSizeX",*f\charSizeX)
	addJSONInteger(*parent,"charSizeY",*f\charSizeY)
	addJSONInteger(*parent,"lineSpace",*f\lineSpace,#True)
	addJSONInteger(*parent,"charSpace",*f\charSpace,#True)
	addJSONInteger(*parent,"charShift",*f\charShift,#True)
	addJSONInteger(*parent,"thickness",*f\thickness,#True)
	addJSONInteger(*parent,"distance",*f\distance,#True)
	If *f\scale<>1
		addJSONDouble(*parent,"scale",*f\scale)
	EndIf
	ProcedureReturn *parent
EndProcedure
CompilerElse
Procedure initAffText()
 	*currentFont=*font16
	fontLoad(*font16)
	fontLoad(*font32)
	fontLoad(*font16Border)
	fontLoad(*font16BorderBig)
	fontLoad(*font32Border)
	AfftextBorderCreate(*font16Border,*font16)
	AfftextBorderCreate(*font16BorderBig,*font16)
	AfftextBorderCreate(*font32Border,*font32)
EndProcedure
CompilerEndIf
Procedure fontJSONImport(*parent,*f.font=#Null)
	*f=fontCreate(*f,loadJSONString(*parent,"path"),loadJSONInteger(*parent,"charSizeX"),loadJSONInteger(*parent,"charSizeY"),loadJSONInteger(*parent,"lineSpace"),loadJSONInteger(*parent,"charSpace"))
	*f\charShift=loadJSONInteger(*parent,"charShift")
	*f\thickness=loadJSONInteger(*parent,"thickness")
	*f\distance=loadJSONInteger(*parent,"distance")
	*f\scale=loadJSONDouble(*parent,"scale")
	If *f\scale<=0
		*f\scale=1
	EndIf
	ProcedureReturn *f
EndProcedure
; Enumeration
; 	#H2H_TEXT_FONT_NORMAL
; 	#H2H_TEXT_FONT_BIG
; 	#H2H_TEXT_FONT_BORDER
; 	#H2H_TEXT_FONT_BORDER_BIG
; EndEnumeration

Procedure displayCharAt(code.f,x.i,y.i,textColor.i=0,textColorIntensity.i=128,scale.f=1,flipped.i=#False,*whatFont.font=#Null)
; 	If scale>=1.9
; 		*currentFont=*fontBig
; 	Else
; 		*currentFont=*fontNormal
; 	EndIf
	If *whatFont<100
		*whatFont=*currentFont
	EndIf
	char$=Chr(Int(Round(code,#PB_Round_Nearest))+*whatFont\charShift)
	scale* *whatFont\scale
	Protected textFont
	Protected shiftX
	Protected shiftY
	Protected opacity=Alpha(textColor)
; 	If opacity<>0 And opacity<>255 And font=#H2H_TEXT_FONT_NORMAL
; 		Debug "opacity "+opacity
; 	EndIf
	If opacity<=0
		opacity=255
	EndIf
	textColorIntensity=(textColorIntensity*opacity)/255
	textFont=*whatFont\spriteId
	shiftX=*whatFont\charSizeX+*whatFont\thickness*2
	shiftY=*whatFont\charSizeY+*whatFont\thickness*2
	;{ char list
	If char$="á"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="a"
	EndIf
	If char$="à"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="a"
	EndIf
	If char$="â"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="a"
	EndIf
	If char$="ã"
		displayCharAt(Asc("~")-*whatFont\charShift,x+4*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="a"
	EndIf
	If char$="ä"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="a"
	EndIf
	If char$="Á"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="A"
	EndIf
	If char$="À"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="A"
	EndIf
	If char$="Â"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-6*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="A"
	EndIf
	If char$="Ã"
		displayCharAt(Asc("~")-*whatFont\charShift,x+2*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="A"
	EndIf
	If char$="Ä"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="A"
	EndIf
	
	If char$="é"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="e"
	EndIf
	If char$="è"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="e"
	EndIf
	If char$="ê"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="e"
	EndIf
	If char$="ë"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="e"
	EndIf
	If char$="É"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="E"
	EndIf
	If char$="È"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="E"
	EndIf
	If char$="Ê"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-6*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="E"
	EndIf
	If char$="Ë"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="E"
	EndIf
	
	If char$="í"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="i"
	EndIf
	If char$="ì"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="i"
	EndIf
	If char$="î"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="i"
	EndIf
	If char$="Ï"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="i"
	EndIf
	If char$="Í"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="I"
	EndIf
	If char$="Ì"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="Ì"
	EndIf
	If char$="Î"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-6*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="I"
	EndIf
	If char$="Ï"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="I"
	EndIf
	
	If char$="ó"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="o"
	EndIf
	If char$="ò"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="o"
	EndIf
	If char$="ô"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="o"
	EndIf
	If char$="ö"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="a"
	EndIf
	If char$="Ó"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="O"
	EndIf
	If char$="Ò"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="O"
	EndIf
	If char$="Ô"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-6*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="O"
	EndIf
	If char$="Ö"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="O"
	EndIf
	
	If char$="ú"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="u"
	EndIf
	If char$="ù"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="u"
	EndIf
	If char$="û"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="u"
	EndIf
	If char$="ü"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="u"
	EndIf
	If char$="Ú"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#True,*whatFont)
		char$="U"
	EndIf
	If char$="Ù"
		displayCharAt(Asc("`")-*whatFont\charShift,x,y-4*scale,textColor,textColorIntensity,scale,#False,*whatFont)
		char$="U"
	EndIf
	If char$="Û"
		displayCharAt(Asc("^")-*whatFont\charShift,x+2*scale,y-6*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="U"
	EndIf
	If char$="Ü"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="U"
	EndIf

	If char$="ÿ"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="y"
	EndIf
	If char$="Ÿ"
		displayCharAt(Asc(".")-*whatFont\charShift,x-1*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		displayCharAt(Asc(".")-*whatFont\charShift,x+5*scale,y-12*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="Y"
	EndIf

	If char$="ñ"
		displayCharAt(Asc("~")-*whatFont\charShift,x+4*scale,y-4*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="n"
	EndIf
	If char$="Ñ"
		displayCharAt(Asc("~")-*whatFont\charShift,x+2*scale,y-8*scale,textColor,textColorIntensity,scale*0.75,#False,*whatFont)
		char$="N"
	EndIf

	If char$="ç"
		displayCharAt(Asc("5")-*whatFont\charShift,x+4*scale,y+12*scale,textColor,textColorIntensity,scale/2,#False,*whatFont)
		char$="c"
	EndIf
	If char$="Ç"
		displayCharAt(Asc("5")-*whatFont\charShift,x+4*scale,y+12*scale,textColor,textColorIntensity,scale/2,#False,*whatFont)
		char$="C"
	EndIf
	spainRoll=#False
	If char$="¿"
		spainRoll=#True	
		char$="?"
	EndIf
	If char$="¡"
		spainRoll=#True	
		char$="!"
	EndIf
	If char$="·"
		char$="."
		y-4*scale
	EndIf
	If char$="°"
		char$="o"
		y-3*scale
		scale/2
	EndIf
	;}
	code=Asc(char$)-*whatFont\charShift
	ZoomSprite(textFont,#PB_Default,#PB_Default)
	ClipSprite(textFont,code*shiftX,0,shiftX,shiftY)
	ZoomSprite(textFont,shiftX*scale,shiftY*scale)
	spriteFlip(textFont,flipped,0)
	If char$="," Or char$=";"
		DisplayTransparentSprite(textFont,x,y+3*scale,opacity)
		If textColor
			DisplayTransparentSprite(textFont,x,y+3*scale,textColorIntensity,textColor)
		EndIf
	Else
		If spainRoll
			RotateSprite(textFont,180,#PB_Absolute)
			y+4*scale
		EndIf
		DisplayTransparentSprite(textFont,x,y,opacity)
		If textColor
			DisplayTransparentSprite(textFont,x,y,textColorIntensity,textColor)
		EndIf
		If spainRoll
			RotateSprite(textFont,0,#PB_Absolute)
		EndIf
	EndIf
EndProcedure

Procedure AfftextColor(Text$,x.f,y.f,textColor.i=0,textColorIntensity=128,scale.f=1,*whatFont.font=#Null)
	If Text$=#LF$
		ProcedureReturn 0
	EndIf
	Protected font
	Protected shiftX
	Protected shiftY
	Protected printX=0
	Protected printY=0
	If *whatFont<100
		*whatFont=*font16
	EndIf
	textFont=*whatFont\spriteId
	shiftX=*whatFont\charSizeX
	shiftY=*whatFont\charSizeY
	printX=-*whatFont\thickness*scale
	printY=-*whatFont\thickness*scale
	charSpace=*whatFont\charSpace
	lineSpace=*whatFont\lineSpace
	originX=x
	lg=Len(Text$)
	If y>-shiftY And y<ScreenSizeY
		start=1
		If x<0
			start+(-x)/shiftX
		EndIf
		If x>ScreenSizeX-shiftX
			lg-(x-ScreenSizeX)/shiftX
		EndIf
		For i=start To lg
			char$=charSafe(Mid(Text$,i,1))
			If char$="\" ;next line
				x=originX
				y+(shiftY+lineSpace)*scale
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
				displayCharAt(code,x+printX,y+printY,textColor,textColorIntensity,scale,#False,*whatFont)
				x+(shiftX+charSpace)*scale
				If char$="'"
					x-3.0*scale
				EndIf
			EndIf
		Next
	EndIf
	ProcedureReturn y+(shiftY+lineSpace)*scale
EndProcedure

Procedure AfftextGetLength(t$)
	x=0
	If t$=#LF$
		ProcedureReturn 0
	EndIf
	lg=Len(t$)
	start=1
	For i=start To lg
		char$=charSafe(Mid(t$,i,1))
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

Procedure AfftextGetBox(*size.location=0,t$="",scale.d=1,width.i=0)
	If Not *size
		*size=locationCreate(0,0)
	EndIf
	If Text$=#LF$
		ProcedureReturn *size
	EndIf
	If width>0
		text$=ReplaceString(text$,"\"," ")
		Dim words$(100)
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
				*size\x=width
				dx=0
				x=originX
				y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
			Else
				If *size\x<dx
					*size\x=dx
				EndIf
			EndIf
			For j=1 To l
				char$=charSafe(Mid(words$(i),j,1))
				code=Asc(char$)-32
				;If char$<>" " And code>=0 And code<=90
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
			x+#CHAR_SIZE_X
		Next
		*size\y=y
		FreeArray(words$())
	Else
		set(*size,AfftextGetLength(t$),#CHAR_SIZE_Y)
	EndIf
	ProcedureReturn *size;y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)
EndProcedure

Macro Afftext(Text,x,y)
	AfftextColor(Text,x,y)
EndMacro

; returns the y of the bottom border
Procedure AfftextBloc(text$,x.i,y.i,width.i,textColor.i=0,colorIntensity.i=128,scale.d=1)
	If text$=#LF$ Or text$=""
		ProcedureReturn 0
	EndIf
	text$=ReplaceString(text$,"\","\ ")
	Dim words$(100)
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
		lx=l*#CHAR_SIZE_X*scale
		dx+lx
		If dx>width
			dx=0
			x=originX
			y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)*scale
		EndIf
		nextLine=#False
		For j=1 To l
			char$=charSafe(Mid(words$(i),j,1))
			If char$="\" ;next line
				dx=0
				x=originX
				y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)*scale
				nextLine=#True
			Else
				code=Asc(char$)-32
				;If char$<>" " And code>=0 And code<=90
				If char$="." Or char$="," Or char$=";"
					x-5*scale
				EndIf
				If char$="'"
					x-3*scale
				EndIf
				displayCharAt(code,x,y,textColor,colorIntensity,scale)
				x+(#CHAR_SIZE_X+#H2H_CHAR_SPACE)*scale
				If char$="'"
					x-3*scale
				EndIf
			EndIf
		Next
		If Not nextLine
			x+#CHAR_SIZE_X*scale
		EndIf
	Next
	FreeArray(words$())
	ProcedureReturn y+(#CHAR_SIZE_Y+#H2H_LINE_SPACE)*scale
EndProcedure

Procedure displayBigText(x.i,y.i,text$,color.i=0,scale.d=1)
	originX=x
	lg=Len(text$)
	For i=1 To lg
		found=#False
		c$=Mid(text$,i,1)
		If c$=":"
			found=1
			x-20*scale
			what=#H2H_ICON_NUMBER_SEPARATOR
; 			ClipSprite(textBig,640,0,64,64)
		Else
			code=Asc(c$)-Asc("0")
			If code>=0 And code <=9
				found=2
; 				ClipSprite(textBig,code*64,0,64,64)
				what=#H2H_ICON_NUMBER_0+code
			EndIf
		EndIf
; 		ZoomSprite(textBig,64.0*scale,64.0*scale)
		If found
			If gamePaused
				If color
					UIDisplay(what,x,y,color,128,255,#False,scale)
				Else
					UIDisplay(what,x,y,-1,128,255,#False,scale)
				EndIf
; 				DisplayTransparentSprite(textBig,x,y,255)
; 				If color
; 					DisplayTransparentSprite(textBig,x,y,128,color)
; 				EndIf
			Else
				tX=x+Random(*screenShakeDistance\x)-*screenShakeDistance\x/2
				tY=y+Random(*screenShakeDistance\y)-*screenShakeDistance\y/2
; 				DisplayTransparentSprite(textBig,tX,tY,255-(*screenShakeDistance\x+*screenShakeDistance\y)*2)
; 				If color
; 					DisplayTransparentSprite(textBig,tX,tY,128-(*screenShakeDistance\x+*screenShakeDistance\y),color)
; 				EndIf
				If color
					UIDisplay(what,tX,tY,color,128,255-(*screenShakeDistance\x+*screenShakeDistance\y),#False,scale)
				Else
					UIDisplay(what,x,y,-1,128,255-(*screenShakeDistance\x+*screenShakeDistance\y),#False,scale)
				EndIf
			EndIf
		EndIf
; 		ZoomSprite(textBig,#PB_Default,#PB_Default)
		If found=1
			x+44*scale
		Else
			x+64*scale
		EndIf
	Next
	ProcedureReturn x
EndProcedure

Procedure displayTimer(time.i,scale.d=1,color.i=0)
	If time<0
		time=0
	EndIf
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
	If color>0
		If gamePaused
			displayBigText(x,y,m$+":"+s$,RGB((Red(color)+128)/2,(Green(color)+64)/2,Blue(color)/2),scale)
		Else
			displayBigText(x,y,m$+":"+s$,color,scale)
		EndIf
	Else
		If gamePaused
			displayBigText(x,y,m$+":"+s$,RGB(128,64,0),scale)
		Else
			displayBigText(x,y,m$+":"+s$,0,scale)
		EndIf
	
	EndIf
EndProcedure

; Display the border only
Procedure AffTextBorder(Text$,x.f,y.f,textColor.i=0,textColorIntensity=128,scale.f=1,borderColor.i=0,borderColorIntensity.i=128,*f.font=#Null,*bf.font=#Null)
	If *f<100
		*f=*font16
	EndIf
	If *bf<100
		*bf=*font16Border
	EndIf
	afftextColor(Text$,x,y,borderColor,borderColorIntensity,scale,*bf)
	ProcedureReturn afftextColor(Text$,x,y,textColor,textColorIntensity,scale,*f)
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 549
; FirstLine = 210
; Folding = 4+-7-
; EnableXP
; CPU = 1