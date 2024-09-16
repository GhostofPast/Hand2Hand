*pencil_stat.statistic=statisticCreate(0,2,3,4,0,0,0,1,4,3,3,0)

; material
*tmpArray(0)=*wood_hit
*pencil_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
statisticCreate(*pencil_stance_wood\modificator,0,0,0,0,0,0,0,0,0,0)

*tmpArray(0)=*plastic_hit
*pencil_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
statisticCreate(*pencil_stance_plastic\modificator,0,0,1,0,0,0,0,0,-1,0)

*pencil_stance_graphite.stance=stanceCreate(*tmpArray(),0,"Graphite")
statisticCreate(*pencil_stance_graphite\modificator,0,0,-1,1,0,0,0,0,0,0)

; hardness
*pencil_stance_HB.stance=stanceCreate(*tmpArray(),0,"HB")
statisticCreate(*pencil_stance_HB\modificator,0,0,0,0,0,0,0,0,0,0)

*pencil_stance_4B.stance=stanceCreate(*tmpArray(),0,"4B")
statisticCreate(*pencil_stance_HB\modificator,1,0,-1,0,0,0,0,0,0,0)

*pencil_stance_8B.stance=stanceCreate(*tmpArray(),0,"8B")
statisticCreate(*pencil_stance_8B\modificator,2,0,-2,0,0,0,0,0,0,0)

*pencil_stance_4H.stance=stanceCreate(*tmpArray(),0,"4H")
statisticCreate(*pencil_stance_4H\modificator,-1,0,0,0,0,0,0,1,0,0)

*pencil_stance_8H.stance=stanceCreate(*tmpArray(),0,"8H")
statisticCreate(*pencil_stance_8H\modificator,-2,0,1,0,0,0,0,1,0,0)

; Color
*pencil_stance_gray.stance=stanceCreate(*tmpArray(),0,"Gray")
*pencil_stance_gray\specialcolor=#H2H_STANCE_COLOR_GRAY
statisticCreate(*pencil_stance_gray\modificator,0,0,0,0,0,0,0,0,0,0)

*pencil_stance_color.stance=stanceCreate(*tmpArray(),0,"Color")
*pencil_stance_color\specialcolor=#H2H_STANCE_COLOR_GREEN
statisticCreate(*pencil_stance_color\modificator,0,0,0,0,1,1,-1,-1,0,0)

*pencil_stance_white.stance=stanceCreate(*tmpArray(),0,"White")
*pencil_stance_white\specialcolor=#H2H_STANCE_COLOR_WHITE
statisticCreate(*pencil_stance_white\modificator,0,0,2,0,0,0,-1,-1,0,0)

; stance combos
Dim *pencilMaterial.stance(2)
*pencilMaterial(0)=*pencil_stance_wood
*pencilMaterial(1)=*pencil_stance_plastic
*pencilMaterial(2)=*pencil_stance_graphite
Dim *pencilHardness.stance(4)
*pencilHardness(0)=*pencil_stance_HB
*pencilHardness(1)=*pencil_stance_4B
*pencilHardness(2)=*pencil_stance_8B
*pencilHardness(3)=*pencil_stance_4H
*pencilHardness(4)=*pencil_stance_8H
Dim *pencilColor.stance(2)
*pencilColor(0)=*pencil_stance_gray
*pencilColor(1)=*pencil_stance_color
*pencilColor(2)=*pencil_stance_white

*pencil.class=classCreate(0,"Pencil",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*pencil\toBeAdded=1
; *pencil\allStances(0)\name="Wood - HB - Gray (default)"
; *pencil\allStances(0)\specialcolor=#H2H_STANCE_COLOR_GRAY
Dim *pencil\allStances(0)
*pencil\allStances(0)=0
i=0
For m=0 To 2
	For h=0 To 4
		For c=0 To 2
			classAddStance(*pencil,stanceCreate(*pencilMaterial(m)\materialClass(),0,*pencilMaterial(m)\name+" - "+*pencilHardness(h)\name+" - "+*pencilColor(c)\name,*pencilMaterial(m)\modificator))
			*pencil\allStances(i)\specialcolor=*pencilColor(c)\specialcolor
			*pencil\allStances(i)\modificator\strength	+*pencilHardness(h)\modificator\strength	+*pencilColor(c)\modificator\strength
			*pencil\allStances(i)\modificator\agility	+*pencilHardness(h)\modificator\agility		+*pencilColor(c)\modificator\agility
			*pencil\allStances(i)\modificator\speed		+*pencilHardness(h)\modificator\speed		+*pencilColor(c)\modificator\speed
			*pencil\allStances(i)\modificator\endurence	+*pencilHardness(h)\modificator\endurence	+*pencilColor(c)\modificator\endurence
			*pencil\allStances(i)\modificator\weight	+*pencilHardness(h)\modificator\weight		+*pencilColor(c)\modificator\weight
			*pencil\allStances(i)\modificator\life		+*pencilHardness(h)\modificator\life		+*pencilColor(c)\modificator\life
			*pencil\allStances(i)\modificator\cut		+*pencilHardness(h)\modificator\cut			+*pencilColor(c)\modificator\cut
			*pencil\allStances(i)\modificator\pierce	+*pencilHardness(h)\modificator\pierce		+*pencilColor(c)\modificator\pierce
			*pencil\allStances(i)\modificator\blunt		+*pencilHardness(h)\modificator\blunt		+*pencilColor(c)\modificator\blunt
			i+1
		Next
	Next
Next
*pencil\allStances(0)\name+" (default)"
FreeArray(*pencilMaterial())
FreeArray(*pencilHardness())
FreeArray(*pencilColor())

*pencil\iconSprite=spriteIndex
*pencil\iconPath$="image\Pencil.png"
spriteIndex+1
*pencil\stat=*pencil_stat
*pencil\desc$="Basic spearman with a lot of options. Good range and pierce attacks, perfect for beginners.\Easy to learn but hard to master. Can outreach heavy fighters to keep the distance, as well as punishing fast opponents."

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 67
; FirstLine = 46
; EnableXP
; CPU = 1