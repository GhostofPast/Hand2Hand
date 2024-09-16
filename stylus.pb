*graphicpen_stat.statistic=statisticCreate(0,3,3,3,0,3,3,-1,1,2,2)
ReDim *tmpArray(1)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*finger_hit
*graphicpen_stance_battery.stance=stanceCreate(*tmpArray(),0,"Battery")
*graphicpen_stance_battery\specialcolor=#H2H_STANCE_COLOR_PLASTIC
statisticCreate(*graphicpen_stance_battery\modificator,0,0,-3,2,1,0,0,0,0,0)

*graphicpen.class=classCreate(0,"Stylus",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*graphicpen\toBeAdded=1
*graphicpen\allStances(0)\name="No battery (default)"
*graphicpen\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLACK
classAddStance(*graphicpen,*graphicpen_stance_battery)

*graphicpen\iconSprite=spriteIndex
*graphicpen\iconPath$="image\Graphicpen.png"
spriteIndex+1
*graphicpen\stat=*graphicpen_stat
*graphicpen\desc$="Balanced blunt brawler with a bit of piercing.\Hits heavily and stays fast, although doesn't have a good range nor coverage.\Can fend off light or heavy foes but isn't specialized enough to pursue or block efficiently."

ReDim *graphicpen\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*graphicpen\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1
; EnableXP
; CPU = 1