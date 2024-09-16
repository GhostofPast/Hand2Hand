*scissors_stat.statistic=statisticCreate(0,2,0,0,3,2,2,4,3,2,2,3)

*scissors.class=classCreate(0,"scissors",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*scissors\toBeAdded=1
*scissors\allStances(0)\name="Plastic handle - metal blade (default)"
*scissors\allStances(0)\specialcolor=#H2H_STANCE_COLOR_METAL
*scissors\allStances(0)\specialcolor=#H2H_STANCE_COLOR_DARKMETAL

*scissors\iconSprite=spriteIndex
*scissors\iconPath$="image\scissors.png"
spriteIndex+1
*scissors\stat=*scissors_stat
*scissors\desc$="Heavy swordsman with great swings and lots of different attacks, lacking however reactivity to reach more agile ennemies."

*tmpArray(0)=*metal_hit
*tmpArray(1)=*plastic_hit
*tmpArray(2)=*finger_hit
ReDim *scissors\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*scissors\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 2
; EnableXP
; DPIAware