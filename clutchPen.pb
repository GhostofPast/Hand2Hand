*criterium_stat.statistic=statisticCreate(0,2,2,2,1,1,2,3,3,2,2,3)
ReDim *tmpArray(1)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*finger_hit
*criterium_stance_opaque.stance=stanceCreate(*tmpArray(),0,"Opaque")
*criterium_stance_opaque\specialcolor=#H2H_STANCE_COLOR_PLASTIC
statisticCreate(*criterium_stance_opaque\modificator,0,0,-1,0,1,0,0,0,0,0)

*criterium.class=classCreate(0,"Clutch pen",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*criterium\toBeAdded=1
*criterium\allStances(0)\name="Transparent (default)"
classAddStance(*criterium,*criterium_stance_opaque)

*criterium\iconSprite=spriteIndex
*criterium\iconPath$="image\Criterium.png"
spriteIndex+1
*criterium\stat=*criterium_stat
*criterium\desc$="Medium ranged Musketer with a very precise rifle, able to take down aerial ennemies.\Very balanced with good range, but precise aiming is slow.\His weapon have multiple purposes for many situations."

ReDim *criterium\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*criterium\allStances(0)\materialClass(i)=*tmpArray(i)
Next
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1
; EnableXP
; CPU = 1