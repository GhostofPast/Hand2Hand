*fineFelt_stat.statistic=statisticCreate(0,6,2,2,0,2,2,-1,-1,3,3,4)
*tmpArray(0)=*plastic_hit ;TODO scifi impact
*fineFelt_stance_blue.stance=stanceCreate(*tmpArray(),0,"Blue")
*fineFelt_stance_blue\specialcolor=#H2H_STANCE_COLOR_BLUE
statisticCreate(*fineFelt_stance_blue\modificator,-1,1,0,0,0,0,0,0,0,0)

*fineFelt_stance_green.stance=stanceCreate(*tmpArray(),0,"Green")
*fineFelt_stance_green\specialcolor=#H2H_STANCE_COLOR_GREEN
statisticCreate(*fineFelt_stance_green\modificator,-2,1,1,0,0,0,0,0,0,0)

*fineFelt_stance_red.stance=stanceCreate(*tmpArray(),0,"Red")
*fineFelt_stance_red\specialcolor=#H2H_STANCE_COLOR_RED
statisticCreate(*fineFelt_stance_red\modificator,1,0,-1,0,0,0,0,0,0,0)

*fineFelt_stance_yellow.stance=stanceCreate(*tmpArray(),0,"Yellow")
*fineFelt_stance_yellow\specialcolor=#H2H_STANCE_COLOR_YELLOW
statisticCreate(*fineFelt_stance_yellow\modificator,-2,2,2,0,-1,-1,0,0,0,0)

*fineFelt.class=classCreate(0,"Fine felt",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
classSetToBeAdded(*fineFelt,1)
*fineFelt\allStances(0)\name="Black (default)"
*fineFelt\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLACK
*fineFelt\allStances(0)\materialClass(0)=*plastic_hit
classAddStance(*fineFelt,*fineFelt_stance_blue)
classAddStance(*fineFelt,*fineFelt_stance_green)
classAddStance(*fineFelt,*fineFelt_stance_red)
classAddStance(*fineFelt,*fineFelt_stance_yellow)

*fineFelt\iconSprite=spriteIndex
*fineFelt\iconPath$="image\fineFelt.png"
spriteIndex+1
*fineFelt\stat=*fineFelt_stat
; *point88\desc$="High tech spearman with the best offense output and parry, but costing a lot of defense and mobility.\As long as it maintain contact it can dangerousely DPS. Its medium\range makes attacks easy to land."
*fineFelt\desc$="High tech spear fighter with excellent offense and parry, but costing a lot of defense and mobility.\Applies a lot of pressure at medium-to-long-range."
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 33
; EnableXP
; CPU = 1