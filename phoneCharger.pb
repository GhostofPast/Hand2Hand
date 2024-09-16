*charger_stat.statistic=statisticCreate(0,2,2,2,2,2,1,2,3,3,1,4)
ReDim *tmpArray(2)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*metal_hit
*tmpArray(2)=*finger_hit

*charger.class=classCreate(0,"Charger",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*charger\toBeAdded=1
*charger\allStances(0)\name="(Default)"
*charger\allStances(0)\specialcolor=#H2H_STANCE_COLOR_WHITE
ReDim *charger\allStances(0)\materialClass(2)
For i=0 To ArraySize(*tmpArray())
	*charger\allStances(0)\materialClass(i)=*tmpArray(i)
Next

*charger\iconSprite=spriteIndex
*charger\iconPath$="image\Charger.png"
spriteIndex+1
*charger\stat=*charger_stat
*charger\desc$="Thunderous warrior with multiple types of attacks. Can claw, blunt and zap simultanousely but\prefeer to stay at close range. It is a balanced caster with some area of effect abilities to catch passive opponents."

ReDim *charger\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*charger\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 6
; EnableXP
; CPU = 1