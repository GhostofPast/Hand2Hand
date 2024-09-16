*point88_stat.statistic=statisticCreate(0,6,2,2,0,2,2,-1,-1,3,3,4)
*tmpArray(0)=*plastic_hit ;TODO scifi impact
*point88_stance_blue.stance=stanceCreate(*tmpArray(),0,"Blue")
*point88_stance_blue\specialcolor=#H2H_STANCE_COLOR_BLUE
statisticCreate(*point88_stance_blue\modificator,-1,1,0,0,0,0,0,0,0,0)

*point88_stance_green.stance=stanceCreate(*tmpArray(),0,"Green")
*point88_stance_green\specialcolor=#H2H_STANCE_COLOR_GREEN
statisticCreate(*point88_stance_green\modificator,-2,1,1,0,0,0,0,0,0,0)

*point88_stance_red.stance=stanceCreate(*tmpArray(),0,"Red")
*point88_stance_red\specialcolor=#H2H_STANCE_COLOR_RED
statisticCreate(*point88_stance_red\modificator,1,0,-1,0,0,0,0,0,0,0)

*point88_stance_yellow.stance=stanceCreate(*tmpArray(),0,"Yellow")
*point88_stance_yellow\specialcolor=#H2H_STANCE_COLOR_YELLOW
statisticCreate(*point88_stance_yellow\modificator,-2,2,2,0,-1,-1,0,0,0,0)

*point88.class=classCreate(0,"Fine felt",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*point88\toBeAdded=1
*point88\allStances(0)\name="Black (default)"
*point88\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLACK
*point88\allStances(0)\materialClass(0)=*plastic_hit
classAddStance(*point88,*point88_stance_blue)
classAddStance(*point88,*point88_stance_green)
classAddStance(*point88,*point88_stance_red)
classAddStance(*point88,*point88_stance_yellow)

*point88\iconSprite=spriteIndex
*point88\iconPath$="image\Point88.png"
spriteIndex+1
*point88\stat=*point88_stat
*point88\desc$="High tech spearman with the best offense output and parry, but costing a lot of defense and mobility.\As long as it maintain contact it can dangerousely DPS. Its medium\range makes attacks easy to land."

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 23
; EnableXP
; CPU = 1