*eraserpen_stat.statistic=statisticCreate(0,2,3,2,1,3,3,-1,-1,3,3,3)
ReDim *tmpArray(1)
*tmpArray(0)=*plastic_hit
*tmpArray(1)=*finger_hit
*eraserpen_stance_dry.stance=stanceCreate(*tmpArray(),0,"Dry")
; *graphicpen_stance_dry\specialcolor=H2H_STANCE_COLOR_WHITE
statisticCreate(*eraserpen_stance_dry\modificator,0,0,1,-1,0,0,0,0,0,0)

*eraserpen.class=classCreate(0,"Eraser pen",#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null,#Null)
*eraserpen\toBeAdded=1
*eraserpen\allStances(0)\name="(Default)"
*eraserpen\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLUE
classAddStance(*eraserpen,*eraserpen_stance_dry)

*eraserpen\iconSprite=spriteIndex
*eraserpen\iconPath$="image\Eraserpen.png"
spriteIndex+1
*eraserpen\stat=*eraserpen_stat
*eraserpen\desc$="Defender with good reach, blunt, speed and defenses. Harasses the ennemy with fast attacks.\ Excels at parying and doing light attacks for continuous aggression."

ReDim *eraserpen\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*eraserpen\allStances(0)\materialClass(i)=*tmpArray(i)
Next

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 8
; EnableXP
; CPU = 1