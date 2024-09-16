*Spoon_stat.statistic=statisticCreate(0,3,2,2,2,2,2,1,-1,4,2,1)
ReDim *tmpArray(1)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*finger_hit
*Spoon_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
statisticCreate(*Spoon_stance_plastic\modificator,0,2,2,-2,-1,-1,0,0,0,0)
*Spoon_stance_plastic\specialcolor=#H2H_STANCE_COLOR_WHITE

*tmpArray(0)=*wood_hit
*tmpArray(1)=*finger_hit
*Spoon_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
statisticCreate(*Spoon_stance_wood\modificator,0,0,0,-1,1,1,-1,0,0,0)
*Spoon_stance_wood\specialcolor=#H2H_STANCE_COLOR_WOOD
*Spoon_stance_wood\alternatecolor=#H2H_STANCE_COLOR_LIGHTWOOD

*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*Spoon_stance_silver.stance=stanceCreate(*tmpArray(),0,"Silver")
statisticCreate(*Spoon_stance_silver\modificator,1,-1,-1,1,1,-1,0,0,0,0)
*Spoon_stance_silver\specialcolor=#H2H_STANCE_COLOR_BLACK
*Spoon_stance_silver\specialcolor=#H2H_STANCE_COLOR_WHITE

*spoon.class=classCreate(0,"Spoon",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*spoon\allStances(0)\specialcolor=#H2H_STANCE_COLOR_METAL
*spoon\allStances(0)\specialcolor=#H2H_STANCE_COLOR_DARKMETAL
*spoon\toBeAdded=1
*spoon\allStances(0)\name="Stainless (Default)"

Dim *spoon\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*spoon\allStances(0)\materialClass(i)=*tmpArray(i)
Next
classAddStance(*spoon,*Spoon_stance_plastic)
classAddStance(*spoon,*Spoon_stance_silver)
classAddStance(*spoon,*Spoon_stance_wood)
*spoon\iconSprite=spriteIndex
*spoon\iconPath$="image\Spoon.png"
spriteIndex+1
*spoon\stat=*Spoon_stat
*spoon\desc$="Shovel like fighter with good reach and defensive abilities\His combos hits easily but have low control of the ennemy."
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 26
; EnableXP
; CPU = 1