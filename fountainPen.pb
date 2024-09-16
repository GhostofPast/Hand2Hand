#H2H_BIGBALLPEN_SIDE_BLADE=0
#H2H_BIGBALLPEN_SIDE_HAFT=1
#H2H_BIGBALLPEN_SIDE_UNHARMED=2
*bigballpen_stat.statistic=statisticCreate(*bigballpen_stat,3,1,2,3,3,1,4,-1,4,1,2)

*bigballpen.class=classCreate(0,"Big ballpen",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*bigballpen\toBeAdded=1
; exact same stances than the ballpen.
*bigballpen\allStances(0)\name="Black (default)"
*bigballpen\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLACK
stanceAddSoundMaterial(*bigballpen\allStances(0),*plastic_hit)
stanceAddSoundMaterial(*bigballpen\allStances(0),*wood_hit)
ReDim *tmpArray(2)
*tmpArray(#H2H_BIGBALLPEN_SIDE_BLADE)=*metal_hit
*tmpArray(#H2H_BIGBALLPEN_SIDE_HAFT)=*plastic_hit
*tmpArray(#H2H_BIGBALLPEN_SIDE_UNHARMED)=*finger_hit
ReDim *bigballpen\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*bigballpen\allStances(0)\materialClass(i)=*tmpArray(i)
Next
*bigballpen_stance_blue.stance=stanceCreate(*tmpArray(),0,"Blue")
statisticCreate(*bigballpen_stance_blue\modificator,0,1,0,-1,0,0,0,0,0,0)
*bigballpen_stance_blue\specialcolor=#H2H_STANCE_COLOR_BLUE

*bigballpen_stance_green.stance=stanceCreate(*tmpArray(),0,"Green")
statisticCreate(*bigballpen_stance_green\modificator,-1,1,1,-1,0,0,0,0,0,0)
*bigballpen_stance_green\specialcolor=#H2H_STANCE_COLOR_GREEN

*bigballpen_stance_red.stance=stanceCreate(*tmpArray(),0,"Red")
*bigballpen_stance_red\specialcolor=#H2H_STANCE_COLOR_RED
statisticCreate(*bigballpen_stance_red\modificator,1,0,-1,0,0,0,0,0,0,0)

classAddStance(*bigballpen,*bigballpen_stance_blue)
classAddStance(*bigballpen,*bigballpen_stance_green)
classAddStance(*bigballpen,*bigballpen_stance_red)

*bigballpen\iconSprite=spriteIndex
*bigballpen\iconPath$="image\Bigballpen.png"
spriteIndex+1
*bigballpen\stat=*bigballpen_stat
*bigballpen\desc$="Offensive damage dealer with good passive defense. This bulky warrior seeks\close combat and doesn't fear taking damage. Can somewhat do strong pary\but can't deal with too many incoming attacks. Works like a balanced axeman."
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 15
; EnableXP
; CPU = 1