;------ Plain stylet (basic ennemy)
;------- Idle
*plainstylet_Idle.animation=classGenerateAnimation(4,"image/hand_plainstylet_idle",6,#H2H_ANIMATIONTYPE_IDLE,"idle",1,*PSIdleRaw)

;------- Front
*plainstylet_Front.animation=classGenerateAnimation(4,"image/hand_plainstylet_front",5,#H2H_ANIMATIONTYPE_FRONT,"front",1,*PSFrontRaw)

;------- Back
*plainstylet_Back.animation=classGenerateAnimation(5,"image/hand_plainstylet_back",4,#H2H_ANIMATIONTYPE_BACK,"back",1,*PSBackRaw)

;------- Neutral 1
*plainstylet_Neutral1.animation=classGenerateAnimation(5,"image/hand_plainstylet_neutral1_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1",0,*PSNeutral1Raw,15,#H2H_DAMAGETYPE_CUT,6)
setFrameSound(*plainstylet_Neutral1,1,*chineseStaff_AttackS\id)
setFrameMovement(*plainstylet_Neutral1,2,-20)
setFrameMovement(*plainstylet_Neutral1,3,-10)

;------- Side 1
*plainstylet_Side1.animation=classGenerateAnimation(7,"image/hand_plainstylet_side1_",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*PSSide1Raw,20,#H2H_DAMAGETYPE_CUT,8)
setFrameSound(*plainstylet_Side1,1,*chineseStaff_AttackS\id)
setFrameMovement(*plainstylet_Side1,2,-40)
setFrameMovement(*plainstylet_Side1,3,-30)
setFrameMovement(*plainstylet_Side1,4,-25)
setFrameMovement(*plainstylet_Side1,5,15)

;------- Jump
*plainstylet_Jump.animation=classGenerateAnimation(4,"image/hand_plainstylet_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",1,*PSJumpRaw)

;------- Hit
*plainstylet_Hit.animation=classGenerateAnimation(4,"image/hand_plainstylet_hit",50,#H2H_ANIMATIONTYPE_HIT,"hit",1,*PSHitRaw)

;------- Death
*plainstylet_Death.animation=classGenerateAnimation(7,"image/hand_plainstylet_death",6,#H2H_ANIMATIONTYPE_DEATH,"death",1,*PSDeathRaw)
setFrameSound(*plainstylet_Death,2,*penfallSound1\id)
setFrameSound(*plainstylet_Death,3,*penfallSound2\id)
setFrameSound(*plainstylet_Death,4,*bodyFallSound\id)
setFrameSound(*plainstylet_Death,6,*bodyFallSound\id)

*plainstylet_stat.statistic=statisticCreate(0,0,0,0,0,0,0,0,-1,1,2,6)
*tmpArray(0)=*plastic_hit
*plainstylet_stance_sergeant.stance=stanceCreate(*tmpArray(),0,"Sergeant")
statisticCreate(*plainstylet_stance_sergeant\modificator,1,1,1,1,1,1,0,0,0,0)

*plainstylet_stance_captain.stance=stanceCreate(*tmpArray(),0,"Captain")
statisticCreate(*plainstylet_stance_captain\modificator,2,2,2,2,2,2,1,0,0,0)

*plainstylet_stance_lieutenant.stance=stanceCreate(*tmpArray(),0,"Lieutenant")
statisticCreate(*plainstylet_stance_lieutenant\modificator,4,4,4,2,4,4,2,0,1,0)

*plainstylet_stance_commander.stance=stanceCreate(*tmpArray(),0,"Commander")
statisticCreate(*plainstylet_stance_commander\modificator,6,6,6,3,6,6,3,0,2,0)

*plainstylet_stance_general.stance=stanceCreate(*tmpArray(),0,"General")
statisticCreate(*plainstylet_stance_general\modificator,10,10,10,4,10,10,4,0,3,0)

*plainstylet_stance_hero.stance=stanceCreate(*tmpArray(),0,"Hero")
statisticCreate(*plainstylet_stance_hero\modificator,15,15,15,6,15,14,5,0,4,0)

*plainstylet.class=classCreate(0,"Plain stylet",*plainstylet_Idle,*plainstylet_Front,*plainstylet_Back,*plainstylet_Neutral1,*plainstylet_Side1,#Null,#Null,#Null,#Null)
*plainstylet\allStances(0)\name="Grunt"
*plainstylet\allStances(0)\materialClass(0)=*plastic_hit
Debug *plainstylet\allStances(0)\materialClass(0)\id
*plainstylet\stat=*plainstylet_stat
*plainstylet\desc$="Basic ennemy for the single player mode, with an axe-gun."

classGetDeath(*plainstylet)=*plainstylet_Death
classGetJump(*plainstylet)=*plainstylet_Jump
; Dim *plainstylet\hitFrames(4)
; For i=0 To 4
; 	*plainstylet\hitFrames(i)=*plainstylet_Hit\frames(i)
; Next

classAddStance(*plainstylet,*plainstylet_stance_sergeant)
classAddStance(*plainstylet,*plainstylet_stance_captain)
classAddStance(*plainstylet,*plainstylet_stance_lieutenant)
classAddStance(*plainstylet,*plainstylet_stance_commander)
classAddStance(*plainstylet,*plainstylet_stance_general)
classAddStance(*plainstylet,*plainstylet_stance_hero)
*plainstylet\notSelectable=1
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 60
; FirstLine = 21
; EnableXP
; CPU = 1