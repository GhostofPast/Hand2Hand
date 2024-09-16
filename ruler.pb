; displayLoading("Loading classes OOOOOOOOOOOOOOOOOOOOO")
*ruler_stat.statistic=statisticCreate(0,2,1,1,2,2,1,4,-1,2,5,4)

ReDim *tmpArray(1)
*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*ruler_stance_metal.stance=stanceCreate(*tmpArray(),0,"Metal")
*ruler_stance_metal\specialcolor=#H2H_STANCE_COLOR_METAL
statisticCreate(*ruler_stance_metal\modificator,0,0,-1,1,0,0,0,0,0,0)
*tmpArray(0)=*wood_hit
*ruler_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
*ruler_stance_wood\specialcolor=#H2H_STANCE_COLOR_WOOD
*ruler_stance_wood\alternatecolor=#H2H_STANCE_COLOR_LIGHTWOOD
statisticCreate(*ruler_stance_wood\modificator,0,0,0,0,1,0,-2,0,1,0)

*ruler.class=classCreate(0,"Ruler",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*ruler\toBeAdded=1
*ruler\allStances(0)\name="Plastic (default)"
*ruler\allStances(0)\specialcolor=#H2H_STANCE_COLOR_PLASTIC
classAddStance(*ruler,*ruler_stance_metal)
classAddStance(*ruler,*ruler_stance_wood)

*ruler\iconSprite=spriteIndex
*ruler\iconPath$="image\Ruler.png"
spriteIndex+1
*ruler\stat=*ruler_stat
*ruler\desc$="Heavy long ranged fighter with excellent statistics but cumbersome attacks.\Have hard time against close ranged ennemies while it focuses on dealing damage\than controlling. Straightforward although not stupid, as it's difficult to handle for the player."

*tmpArray(0)=*plastic_hit
ReDim *ruler\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*ruler\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 28
; EnableXP
; CPU = 1