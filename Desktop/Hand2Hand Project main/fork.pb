*Fork_stat.statistic=statisticCreate(0,2,2,1,3,2,2,0,2,3,3,3)
ReDim *tmpArray(1)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*finger_hit
*Fork_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
statisticCreate(*Fork_stance_plastic\modificator,-1,4,4,-3,0,0,0,-2,-2,0)
*Fork_stance_plastic\specialcolor=#H2H_STANCE_COLOR_WHITE

*tmpArray(0)=*wood_hit
*tmpArray(1)=*finger_hit
*Fork_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
statisticCreate(*Fork_stance_wood\modificator,0,0,0,-1,1,1,0,-1,0,0)
*Fork_stance_wood\specialcolor=#H2H_STANCE_COLOR_WOOD

*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*Fork_stance_silver.stance=stanceCreate(*tmpArray(),0,"Silver")
statisticCreate(*Fork_stance_silver\modificator,1,-1,-1,1,1,-1,0,0,0,0)
*Fork_stance_silver\specialcolor=#H2H_STANCE_COLOR_BLACK
*Fork_stance_silver\specialcolor=#H2H_STANCE_COLOR_WHITE

*fork.class=classCreate(0,"Fork",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*fork\allStances(0)\specialcolor=#H2H_STANCE_COLOR_METAL
*fork\allStances(0)\specialcolor=#H2H_STANCE_COLOR_DARKMETAL
*fork\toBeAdded=1
*fork\allStances(0)\name="Stainless (Default)"

Dim *fork\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*fork\allStances(0)\materialClass(i)=*tmpArray(i)
Next
classAddStance(*fork,*Fork_stance_plastic)
classAddStance(*fork,*Fork_stance_wood)
classAddStance(*fork,*Fork_stance_silver)
*fork\iconSprite=spriteIndex
*fork\iconPath$="image\Fork.png"
spriteIndex+1
*fork\stat=*Fork_stat
*fork\desc$="Short ranged polearm with broad attacks and balanced stats, good for thrusts.\Can easily catch ennemies and manipulate them."
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 26
; EnableXP
; CPU = 1