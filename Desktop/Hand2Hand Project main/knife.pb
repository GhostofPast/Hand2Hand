*knife_stat.statistic=statisticCreate(0,2,1,1,3,0,0,5,4,1,3,3)
ReDim *tmpArray(2)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*plastic_hit
*tmpArray(2)=*finger_hit
*knife_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
*knife_stance_plastic\specialcolor=#H2H_STANCE_COLOR_PLASTIC
statisticCreate(*knife_stance_plastic\modificator,-1,4,4,-3,0,0,0,-2,-2,0)

*tmpArray(0)=*wood_hit
*tmpArray(1)=*wood_hit
*tmpArray(2)=*finger_hit
*knife_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
*knife_stance_wood\specialcolor=#H2H_STANCE_COLOR_WOOD
*knife_stance_wood\alternatecolor=#H2H_STANCE_COLOR_LIGHTWOOD
statisticCreate(*knife_stance_wood\modificator,0,0,0,-1,1,1,0,-1,0,0)

*tmpArray(0)=*metal_hit
*tmpArray(1)=*metal_hit
*tmpArray(2)=*finger_hit
*knife_stance_silver.stance=stanceCreate(*tmpArray(),0,"Silver")
*knife_stance_silver\specialcolor=#H2H_STANCE_COLOR_BLACK
*knife_stance_silver\alternatecolor=#H2H_STANCE_COLOR_WHITE
statisticCreate(*knife_stance_silver\modificator,1,-1,-1,1,1,0,0,-1,0,0)

*knife.class=classCreate(0,"knife",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*knife\toBeAdded=1
*knife\allStances(0)\name="Stainless (default)"
*knife\allStances(0)\specialcolor=#H2H_STANCE_COLOR_METAL
*knife\allStances(0)\specialcolor=#H2H_STANCE_COLOR_DARKMETAL
classAddStance(*knife,*knife_stance_plastic)
classAddStance(*knife,*knife_stance_wood)
classAddStance(*knife,*knife_stance_silver)

*knife\iconSprite=spriteIndex
*knife\iconPath$="image\knife.png"
spriteIndex+1
*knife\stat=*knife_stat
*knife\desc$="Heavy swordsman with great swings and damage, but very frail and a bit slow.\The plastic stance has greater flexibility with the cost of potential blunt impact."

*tmpArray(0)=*metal_hit
*tmpArray(1)=*plastic_hit
*tmpArray(2)=*finger_hit
ReDim *knife\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*knife\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 24
; EnableXP
; DPIAware