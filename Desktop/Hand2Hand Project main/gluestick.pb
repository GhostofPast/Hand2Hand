;------ Gluestick
;------- Idle 1
*gluestick_Idle1.animation=classGenerateAnimation(8,"image/hand_gluestick_idle1_",10,#H2H_ANIMATIONTYPE_IDLE,"idle 1",1,*GSIdle1Raw)
setFrameLength(*gluestick_Idle1,0,6)
setFrameLength(*gluestick_Idle1,1,8)
setFrameLength(*gluestick_Idle1,7,5)
setFrameLength(*gluestick_Idle1,8,6)
animationPrepareWind(*gluestick_Idle1)
*gluestick_Idle1_8WindBack.animation= classGenerateAnimation(1,"image/hand_gluestick_idle1_8WindBack" ,5,0,"Gluestick idle 1 8 wind back" ,0,*GSIdle1_8WindBackRaw)
*gluestick_Idle1_9WindBack.animation= classGenerateAnimation(1,"image/hand_gluestick_idle1_9WindBack" ,6,0,"Gluestick idle 1 9 wind back" ,0,*GSIdle1_9WindBackRaw)
*gluestick_Idle1\backWind(7,0)=*gluestick_Idle1_8WindBack
*gluestick_Idle1\backWind(8,0)=*gluestick_Idle1_9WindBack

;------- Front
*gluestick_MoveFront.animation=classGenerateAnimation(6,"image/hand_gluestick_move_front",4,#H2H_ANIMATIONTYPE_FRONT,"move front",1,*GSMoveFrontRaw)
ReDim *gluestick_MoveFront\frames(12)
*gluestick_MoveFront\frames(9 )=*gluestick_MoveFront\frames(0)
*gluestick_MoveFront\frames(9 )=*gluestick_MoveFront\frames(5)
*gluestick_MoveFront\frames(10)=*gluestick_MoveFront\frames(6)
*gluestick_MoveFront\frames(11)=*gluestick_MoveFront\frames(5)
*gluestick_MoveFront\frames(12)=*gluestick_MoveFront\frames(0)
*gluestick_MoveFront\frames(5 )=*gluestick_MoveFront\frames(3)
*gluestick_MoveFront\frames(6 )=*gluestick_MoveFront\frames(2)
*gluestick_MoveFront\frames(7 )=*gluestick_MoveFront\frames(1)
*gluestick_MoveFront\frames(8 )=*gluestick_MoveFront\frames(0)
*gluestick_MoveFront\loopStart=1
animationPrepareWind(*gluestick_MoveFront)
*gluestick_MoveFront1WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front1WindBack",5,0,"Gluestick move front 1 wind back",0,*GSMoveFront1WindBackRaw)

*gluestick_MoveFront2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front2WindFront",5,0,"Gluestick move front 2 wind front",0,*GSMoveFront2WindFrontRaw)
*gluestick_MoveFront3WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front3WindFront",5,0,"Gluestick move front 3 wind front",0,*GSMoveFront3WindFrontRaw)
frameSetFreeMovement(*gluestick_MoveFront3WindFront\frames(0),1)
*gluestick_MoveFront4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front4WindFront",5,0,"Gluestick move front 4 wind front",0,*GSMoveFront4WindFrontRaw)
*gluestick_MoveFront5WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front5WindFront",5,0,"Gluestick move front 5 wind front",0,*GSMoveFront5WindFrontRaw)
frameSetFreeMovement(*gluestick_MoveFront5WindFront\frames(1),1)
*gluestick_MoveFront12WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front12WindFront",5,0,"Gluestick move front 12 wind front",0,*GSMoveFront12WindFrontRaw)
animationFreeMovementWind(*gluestick_MoveFront12WindFront)
*gluestick_MoveFront13WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front13WindFront",5,0,"Gluestick move front 13 wind front",0,*GSMoveFront13WindFrontRaw)

*gluestick_MoveFront\frontWind(1,0)=*gluestick_MoveFront2WindFront
*gluestick_MoveFront\frontWind(2,0)=*gluestick_MoveFront3WindFront
*gluestick_MoveFront\frontWind(3,0)=*gluestick_MoveFront4WindFront
*gluestick_MoveFront\frontWind(4,0)=*gluestick_MoveFront5WindFront
*gluestick_MoveFront\frontWind(11,0)=*gluestick_MoveFront12WindFront
*gluestick_MoveFront\frontWind(12,0)=*gluestick_MoveFront13WindFront

;------- Move Back new
*gluestick_MoveBack.animation=classGenerateAnimation(3,"image/hand_gluestick_move_back",4,#H2H_ANIMATIONTYPE_BACK,"move back",1,*GSMoveBackRaw)
ReDim *gluestick_MoveBack\frames(5)
*gluestick_MoveBack\frames(4)=*gluestick_MoveBack\frames(2)
*gluestick_MoveBack\frames(5)=*gluestick_MoveBack\frames(1)
animationPrepareWind(*gluestick_MoveBack)

*gluestick_MoveBack4WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_back4WindFront",6,0,"Gluestick move back 4 wind front",0,*GSMoveBack4WindFrontRaw)
setFrameMovement(*gluestick_MoveBack4WindFront,1,50)
setFrameFreeMovement(*gluestick_MoveBack4WindFront\frames(1))
*gluestick_MoveBack5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_back5WindFront",6,0,"Gluestick move back 5 wind front",0,*GSMoveBack5WindFrontRaw)
*gluestick_MoveBack\frontWind(3,0)=*gluestick_MoveBack4WindFront
*gluestick_MoveBack\frontWind(4,0)=*gluestick_MoveBack5WindFront
; animationFreeMovementWind(*gluestick_MoveBack)

;------- Neutral 1 new
*gluestick_Neutral1.animation=classGenerateAnimation(5,"image/hand_gluestick_neutral1_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1",0,*GSNeutral1Raw,15,#H2H_DAMAGETYPE_BLUNT,5,1)
setFrameSound(*gluestick_Neutral1,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*gluestick_Neutral1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameLength(*gluestick_Neutral1,0,3)
setFrameLength(*gluestick_Neutral1,1,4)
setFrameLength(*gluestick_Neutral1,3,5)
setFrameLength(*gluestick_Neutral1,4,8)
setFrameMovement(*gluestick_Neutral1,0,60)
setFrameMovement(*gluestick_Neutral1,1,30)
setFrameMovement(*gluestick_Neutral1,3,-160)
setFrameMovement(*gluestick_Neutral1,4,20)
setFrameMovement(*gluestick_Neutral1,5,20)
enableFrameDamageCut(*gluestick_Neutral1,2)
*gluestick_Neutral1\frames(0)\damageSide=0
*gluestick_Neutral1\frames(1)\damageSide=0
animationPrepareWind(*gluestick_Neutral1)

*gluestick_Neutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral1_1WindFront",3,0,"Gluestick neutral 1 wind front",0,*GSNeutral1_1WindFrontRaw)
*gluestick_Neutral1_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral1_2WindFront",4,0,"Gluestick neutral 2 wind front",0,*GSNeutral1_2WindFrontRaw)
setFrameMovement(*gluestick_Neutral1_2WindFront,1,-50)
setFrameMovement(*gluestick_Neutral1_2WindFront,2,-50)
*gluestick_Neutral1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral1_4WindFront",5,0,"Gluestick neutral 4 wind front",0,*GSNeutral1_4WindFrontRaw)
*gluestick_Neutral1_5WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral1_5WindFront",3,0,"Gluestick neutral 5 wind front",0,*GSNeutral1_5WindFrontRaw)
setFrameLength(*gluestick_Neutral1_5WindFront,1,6)
setFrameLength(*gluestick_Neutral1_5WindFront,2,7)

*gluestick_Neutral1_4WindBack.animation= classGenerateAnimation(3,"image/hand_gluestick_neutral1_4WindBack" ,4,0,"Gluestick neutral 4 wind front",0,*GSNeutral1_4WindBackRaw)
setFrameMovement(*gluestick_Neutral1_4WindBack,1,-30)
setFrameMovement(*gluestick_Neutral1_4WindBack,2,-30)
setFrameMovement(*gluestick_Neutral1_4WindBack,3,-30)
setFrameLength(*gluestick_Neutral1_4WindBack,1,5)
setFrameLength(*gluestick_Neutral1_4WindBack,2,6)
setFrameLength(*gluestick_Neutral1_4WindBack,3,7)

*gluestick_Neutral1\frontWind(0,0)=*gluestick_Neutral1_1WindFront
*gluestick_Neutral1\frontWind(1,0)=*gluestick_Neutral1_2WindFront
*gluestick_Neutral1\frontWind(3,0)=*gluestick_Neutral1_4WindFront
*gluestick_Neutral1\frontWind(4,0)=*gluestick_Neutral1_5WindFront

*gluestick_Neutral1\backWind(3,0)=*gluestick_Neutral1_4WindBack

;------- Neutral 2 new
*gluestick_Neutral2New.animation=classGenerateAnimation(4,"image/hand_gluestick_v2neutral2_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*GSNeutral2NewRaw,40,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*gluestick_Neutral2New,0,*gluestickSwingLight\id)
setFrameSound(*gluestick_Neutral2New,1,*gluestickSwingMedium\id)
setFrameSound(*gluestick_Neutral2New,3,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
setFrameLength(*gluestick_Neutral2New,0,4)
setFrameLength(*gluestick_Neutral2New,4,9)
setFrameMovement(*gluestick_Neutral2New,0,20)
setFrameMovement(*gluestick_Neutral2New,1,50)
setFrameMovement(*gluestick_Neutral2New,2,-50)
setFrameMovement(*gluestick_Neutral2New,3,-120)
setFrameMovement(*gluestick_Neutral2New,4,30)
setFrameShake(*gluestick_Neutral2New,3,10)

*gluestick_Neutral2New_2FrontWind.animation=classGenerateAnimation(1,"image/hand_gluestick_v2neutral2_2frontwind",4,0,"Gluestick neutral 2 front wind",0,*GSNeutral2NewFrontWind2Raw)
*gluestick_Neutral2New_2BackWind.animation=classGenerateAnimation(2,"image/hand_gluestick_v2neutral2_2backwind",4,0,"Gluestick neutral 2 back wind",0,*GSNeutral2NewBackWind2Raw)
*gluestick_Neutral2New_3FrontWind.animation=classGenerateAnimation(0,"image/hand_gluestick_v2neutral2_3frontwind",7,0,"Gluestick neutral 3 front wind",0,*GSNeutral2NewFrontWind3Raw)
*gluestick_Neutral2New_4FrontWind.animation=classGenerateAnimation(3,"image/hand_gluestick_v2neutral2_4frontwind",6,0,"Gluestick neutral 4 front wind",0,*GSNeutral2NewFrontWind4Raw)

FreeArray(*gluestick_Neutral2New\frontWind())
Dim *gluestick_Neutral2New\frontWind(5,0)
*gluestick_Neutral2New\frontWind(1,0)=*gluestick_Neutral2New_2FrontWind
*gluestick_Neutral2New\frontWind(2,0)=*gluestick_Neutral2New_3FrontWind
*gluestick_Neutral2New\frontWind(3,0)=*gluestick_Neutral2New_4FrontWind
FreeArray(*gluestick_Neutral2New\backWind())
Dim *gluestick_Neutral2New\backWind(5,0)
*gluestick_Neutral2New\backWind(1,0)=*gluestick_Neutral2New_2BackWind

animationGetNeutral(*gluestick_Neutral1)=*gluestick_Neutral2New

;------- Neutral 3
*gluestick_Neutral3.animation=classGenerateAnimation(8,"image/hand_gluestick_neutral3_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3",0,*GSNeutral3Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*gluestick_Neutral3,1,*gluestickSwingLight\id)
setFrameSound(*gluestick_Neutral3,4,*gluestickSwingLight\id)
setFrameLength(*gluestick_Neutral3,5,4)
setFrameLength(*gluestick_Neutral3,6,3)
setFrameLength(*gluestick_Neutral3,7,2)
setFrameLength(*gluestick_Neutral3,8,1)
enableFrameDamageCut(*gluestick_Neutral3,5)
For i=0 To 8
	setFrameMovement(*gluestick_Neutral3,i,-5)
Next

;------- Neutral 4
*gluestick_Neutral4.animation=classGenerateAnimation(6,"image/hand_gluestick_neutral4_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4",0,*GSNeutral4Raw,10,#H2H_DAMAGETYPE_PIERCE,3,2)
setFrameSound(*gluestick_Neutral4,0,*gluestickSwingLight\id)
; setFrameSound(*gluestick_Neutral4,2,*gluestickSwingLight\id)
setFrameSound(*gluestick_Neutral4,2,*gluestickGunLight\id)
enableFrameDamageCut(*gluestick_Neutral4,4)
enableFrameDamageCut(*gluestick_Neutral4,5)
setFrameLength(*gluestick_Neutral4,3,8)
setFrameLength(*gluestick_Neutral4,4,8)
setFrameLength(*gluestick_Neutral4,5,8)
setFrameMovement(*gluestick_Neutral4,4,40)
setFrameMovement(*gluestick_Neutral4,5,40)
setFrameMovement(*gluestick_Neutral4,6,40)
animationSetComboEnd(*gluestick_Neutral4,1)

;------- Neutral 5
*gluestick_Neutral5.animation=classGenerateAnimation(7,"image/hand_gluestick_neutral5_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 5",0,*GSNeutral5Raw,10,#H2H_DAMAGETYPE_PIERCE,3,2)
setFrameSound(*gluestick_Neutral5,0,*gluestickSwingLight\id)
setFrameSound(*gluestick_Neutral5,1,*gluestickGunLight\id)
setFrameSound(*gluestick_Neutral5,5,*gluestickSwingLight\id)
For i=1 To 4
	enableFrameDamageCut(*gluestick_Neutral5,i)
Next
animationSetComboEnd(*gluestick_Neutral5,#True)

;------- Neutral 6
*gluestick_Neutral6.animation=classGenerateAnimation(3,"image/hand_gluestick_neutral6_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*GSNeutral6Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*gluestick_Neutral6,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameSound(*gluestick_Neutral6,2,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameLength(*gluestick_Neutral6,0,10)
setFrameLength(*gluestick_Neutral6,3,20)
*gluestick_Neutral6\frames(3)\damageDuration=6
setFrameMovement(*gluestick_Neutral6,0,100)
setFrameMovement(*gluestick_Neutral6,1,-100)
setFrameMovement(*gluestick_Neutral6,2,-100)
setFrameMovement(*gluestick_Neutral6,3,-50)
setFrameCanDoNext(*gluestick_Neutral6,3,4)
animationPrepareWind(*gluestick_Neutral6)

*gluestick_Neutral6_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral6_2WindFront",5,0,"Gluestick neutral 6 2 wind front",0,*GSNeutral6_2WindFrontRaw)
*gluestick_Neutral6_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral6_3WindFront",5,0,"Gluestick neutral 6 3 wind front",0,*GSNeutral6_3WindFrontRaw)
*gluestick_Neutral6_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral6_4WindFront",5,0,"Gluestick neutral 6 4 wind front",0,*GSNeutral6_4WindFrontRaw)
setFrameMovementDelta(*gluestick_Neutral6_2WindFront,0,-10)
setFrameMovementDelta(*gluestick_Neutral6_3WindFront,0,-10)
setFrameMovement(*gluestick_Neutral6_4WindFront,0,-50)
setFrameMovement(*gluestick_Neutral6_4WindFront,1,-50)
setFrameMovement(*gluestick_Neutral6_4WindFront,2,-50)

*gluestick_Neutral6\frontWind(1,0)=*gluestick_Neutral6_2WindFront
*gluestick_Neutral6\frontWind(2,0)=*gluestick_Neutral6_3WindFront
*gluestick_Neutral6\frontWind(3,0)=*gluestick_Neutral6_4WindFront

;------- Side 1 new
*gluestick_Side1.animation=classGenerateAnimation(5,"image/hand_gluestick_side1_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*GSSide1Raw,40,#H2H_DAMAGETYPE_BLUNT,7)
setFrameSound(*gluestick_Side1,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameSound(*gluestick_Side1,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
setFrameMovement(*gluestick_Side1,4,-100)
setFrameMovement(*gluestick_Side1,5,-50)
setFrameDamage(*gluestick_Side1,5,6)
setFrameLength(*gluestick_Side1,0,6)
setFrameLength(*gluestick_Side1,1,6)
setFrameLength(*gluestick_Side1,5,15)
setFrameCanDoNext(*gluestick_Side1,5,5)
*gluestick_Side1\frames(5)\damageDuration=5
animationGetNeutral(*gluestick_Side1)=*gluestick_Neutral3
animationPrepareWind(*gluestick_Side1)

*gluestick_Side1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_1WindFront",5,0,"Gluestick side 1 1 wind front",0,*GSSide1_1WindFrontRaw)
*gluestick_Side1_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side1_2WindFront",5,0,"Gluestick side 1 2 wind front",0,*GSSide1_2WindFrontRaw)
*gluestick_Side1_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_3WindFront",5,0,"Gluestick side 1 3 wind front",0,*GSSide1_3WindFrontRaw)
*gluestick_Side1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_4WindFront",5,0,"Gluestick side 1 4 wind front",0,*GSSide1_4WindFrontRaw)
*gluestick_Side1_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_5WindFront",5,0,"Gluestick side 1 5 wind front",0,*GSSide1_5WindFrontRaw)
*gluestick_Side1_6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side1_6WindFront",5,0,"Gluestick side 1 6 wind front",0,*GSSide1_6WindFrontRaw)

*gluestick_Side1\frontWind(0,0)=*gluestick_Side1_1WindFront
*gluestick_Side1\frontWind(1,0)=*gluestick_Side1_2WindFront
*gluestick_Side1\frontWind(2,0)=*gluestick_Side1_3WindFront
*gluestick_Side1\frontWind(3,0)=*gluestick_Side1_4WindFront
*gluestick_Side1\frontWind(4,0)=*gluestick_Side1_5WindFront
*gluestick_Side1\frontWind(5,0)=*gluestick_Side1_6WindFront

animationFreeMovementWind(*gluestick_Side1)

;------- Side 2
*GSSide2.animation=classGenerateAnimation(4,"image/hand_gluestick_side2_",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*GSSide2Raw,40,#H2H_DAMAGETYPE_BLUNT,8)
setFrameCanDoNext(*GSSide2,4,6)
*GSSide2\frames(4)\damageSide=1
setFrameShake(*GSSide2,3,14)
setFrameSound(*GSSide2,0,*gluestickSwingLight\id)
setFrameSound(*GSSide2,2,*gluestickSwingMedium\id)
setFrameSound(*GSSide2,3,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
setFrameLength(*GSSide2,4,12)
setFrameMovement(*GSSide2,3,-32,64)
animationSetUngrounded(*GSSide2,#True)
*GSSide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind front",0,*GSSide2_1WindFrontRaw)
*GSSide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind front",0,*GSSide2_2WindFrontRaw)
*GSSide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind front",0,*GSSide2_3WindFrontRaw)
*GSSide2_4WindFront1.animation=classGenerateAnimation(3,"image/hand_gluestick_side2_4WindFront1_",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front 1",0,*GSSide2_4WindFront1Raw)
*GSSide2_4WindFront2.animation=classGenerateAnimation(2,"image/hand_gluestick_side2_4WindFront2_",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front 2",0,*GSSide2_4WindFront2Raw)

animationPrepareWind(*GSSide2,1)
*GSSide2\frontWind(0,0)=*GSSide2_1WindFront
*GSSide2\frontWind(1,0)=*GSSide2_2WindFront
*GSSide2\frontWind(2,0)=*GSSide2_3WindFront
*GSSide2\frontWind(3,0)=*GSSide2_4WindFront1
*GSSide2\frontWind(3,1)=*GSSide2_4WindFront2


animationGetSide(*gluestick_Side1)=*GSSide2
;------- Side 3
*gluestick_Side3.animation=classGenerateAnimation(8,"image/hand_gluestick_side3_",7,#H2H_ANIMATIONTYPE_NSIDE,"side 3",0,*GSSide3Raw,40,#H2H_DAMAGETYPE_BLUNT,9)
setFrameSound(*gluestick_Side3,0,*gluestickSwingLight\id)
setFrameSound(*gluestick_Side3,2,*gluestickSwingMedium\id)
setFrameMovement(*gluestick_Side3,0,0,-10)
setFrameMovement(*gluestick_Side3,1,1)
setFrameMovement(*gluestick_Side3,2,20,-30)
setFrameMovement(*gluestick_Side3,3,-20,-5)
setFrameMovement(*gluestick_Side3,4,-50,-10)
setFrameMovement(*gluestick_Side3,5,-40,8)
setFrameMovement(*gluestick_Side3,6,-5,10)
setFrameMovement(*gluestick_Side3,7,-1,12)
For i=6 To 8
	setFrameLength(*gluestick_Side3,i,10-i)
Next
animationGetSide(*GSSide2)=*gluestick_Side3
animationSetComboEnd(*gluestick_Side3,1)

;------- Side 4
*gluestick_Side4.animation=classGenerateAnimation(7,"image/hand_gluestick_side4_",8,#H2H_ANIMATIONTYPE_NSIDE,"side 4",0,*GSSide4Raw,20,#H2H_DAMAGETYPE_PIERCE,5,2)
setFrameSound(*gluestick_Side4,0,*gluestickSwingLight\id)
For i=3 To 5
	enableFrameDamageCut(*gluestick_Side4,i)
Next
For i=2 To 5
	setFrameSound(*gluestick_Side4,i,*gluestickGunMedium\id)
Next
setFrameSound(*gluestick_Side4,6,*gluestickSwingLight\id)
animationSetComboEnd(*gluestick_Side4,1)

; bullshit movement so the combo is not interrupted
For i=0 To 7
	setFrameMovement(*gluestick_Side4,i,0,6)
Next
setFrameLength(*gluestick_Side4,6,10)
setFrameLength(*gluestick_Side4,7,12)
For i=0 To 7
	setFramePureProjectile(*gluestick_Side4,i)
Next

;------- Side 5
*gluestick_Side5.animation=classGenerateAnimation(5,"image/hand_gluestick_side5_",7,#H2H_ANIMATIONTYPE_NSIDE,"side 5",0,*GSSide5Raw,30,#H2H_DAMAGETYPE_BLUNT,9)
setFrameSound(*gluestick_Side5,0,*gluestickSwingLight\id)
setFrameSound(*gluestick_Side5,2,#H2H_SOUND_ID_WOODBLUNTBLOCK)
setFrameSound(*gluestick_Side5,3,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*gluestick_Side5,5,#H2H_SOUND_ID_SWISHLIGHT)
setFrameMovement(*gluestick_Side5,0,-25)
setFrameMovement(*gluestick_Side5,1,-25,-5)
setFrameMovement(*gluestick_Side5,2,-25,-10)
setFrameMovement(*gluestick_Side5,3,-125,-20)
setFrameMovement(*gluestick_Side5,4,-125,20)
setFrameMovement(*gluestick_Side5,5,-50,15)
setFrameLength(*gluestick_Side5,3,8)
setFrameLength(*gluestick_Side5,4,20)
*gluestick_Side5\frames(4)\damageDuration=5
setFrameLength(*gluestick_Side5,5,10)
animationPrepareWind(*gluestick_Side5)
animationGetSide(*gluestick_neutral6)=*gluestick_Side5
animationSetComboEnd(*gluestick_Side5,1)

*gluestick_Side5_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side5_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 1 wind front",0,*GSSide5_1WindFrontRaw)
*gluestick_Side5_2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_side5_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 2 wind front",0,*GSSide5_2WindFrontRaw)
*gluestick_Side5_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side5_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 3 wind front",0,*GSSide5_3WindFrontRaw)
*gluestick_Side5_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side5_4WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 4 wind front",0,*GSSide5_4WindFrontRaw)
*gluestick_Side5_5WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_side5_5WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 5 wind front",0,*GSSide5_5WindFrontRaw)
*gluestick_Side5_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_side5_6WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 1 wind back",0,*GSSide5_6WindBackRaw)

*gluestick_Side5\frontWind(0,0)=*gluestick_Side5_1WindFront
*gluestick_Side5\frontWind(1,0)=*gluestick_Side5_2WindFront
*gluestick_Side5\frontWind(2,0)=*gluestick_Side5_3WindFront
*gluestick_Side5\frontWind(3,0)=*gluestick_Side5_4WindFront
*gluestick_Side5\frontWind(4,0)=*gluestick_Side5_5WindFront
*gluestick_Side5\backWind(5,0)=*gluestick_Side5_6WindBack

animationFreeMovementWind(*gluestick_Side5)

;-------- Back 1
*GSBack1.animation=classGenerateAnimation(5,"image/hand_gluestick_back1_",5,#H2H_ANIMATIONTYPE_NBACK,"back 1",0,*GSBack1Raw,5,#H2H_DAMAGETYPE_BLUNT,7,2)
Dim *newArray.frame(9)

*newArray(0)=*GSBack1\frames(0)
*newArray(1)=*GSBack1\frames(1)
*newArray(2)=*GSBack1\frames(2)
*newArray(3)=frameDataGive():frameCopy(*newArray(3),*newArray(2),#True)
*newArray(4)=frameDataGive():frameCopy(*newArray(4),*newArray(2),#True)
*newArray(5)=*GSBack1\frames(3)
*newArray(6)=frameDataGive():frameCopy(*newArray(6),*newArray(5),#True)
*newArray(7)=*GSBack1\frames(4)
*newArray(8)=*GSBack1\frames(5)
*newArray(9)=frameDataGive():frameCopy(*newArray(9),*newArray(8),#True)

ReDim *GSBack1\frames(9)
For i=0 To 9
	*GSBack1\frames(i)=*newArray(i)
Next
FreeArray(*newArray())

setFrameLength(*GSBack1,0,3)
setFrameLength(*GSBack1,1,3)
setFrameLength(*GSBack1,2,4)
setFrameLength(*GSBack1,4,6)
setFrameLength(*GSBack1,7,8)
setFrameLength(*GSBack1,8,8)
setFrameLength(*GSBack1,9,40)

setFrameMovement(*GSBack1,0,-25)
setFrameMovement(*GSBack1,1,-25)
setFrameMovement(*GSBack1,2,-25)
setFrameMovement(*GSBack1,3,60,-40)
setFrameMovement(*GSBack1,4,70,-30)
setFrameMovement(*GSBack1,5,80,-20)
setFrameMovement(*GSBack1,6,80,45)
setFrameMovement(*GSBack1,7,40,45)
setFrameMovement(*GSBack1,8,40)
setFrameMovementDelta(*GSBack1,8,5)

setFrameSound(*GSBack1,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameSound(*GSBack1,7,#H2H_SOUND_ID_HAND_LAND)
setFrameCanDoNext(*GSBack1,9,1)
setFrameCanMove(*GSBack1,9,15)
setFrameShake(*GSBack1,7,10)
animationPrepareWind(*GSBack1)

*GSback1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 1 wind front",0,*GSBack1_1WindFrontRaw)
*GSback1_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_2WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*GSBack1_2WindFrontRaw)
*GSback1_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_back1_3WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*GSBack1_3WindFrontRaw)
*GSback1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_4WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*GSBack1_4WindFrontRaw)
*GSback1_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_5WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 wind front",0,*GSBack1_5WindFrontRaw)
*GSback1_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_6WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind front",0,*GSBack1_6WindFrontRaw)
*GSback1_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_7WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 wind front",0,*GSBack1_7WindFrontRaw)
*GSback1_8WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_8WindFront",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 wind front",0,*GSBack1_8WindFrontRaw)
*GSback1_9WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_back1_9WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 wind front",0,*GSBack1_9WindFrontRaw)
animationFreeMovement(*GSback1_8WindFront)
animationFreeMovement(*GSback1_9WindFront)

*GSback1_4WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_back1_4WindBack",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind back",0,*GSBack1_4WindBackRaw)
*GSback1_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_back1_6WindBack",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind back",0,*GSBack1_6WindBackRaw)
animationFreeMovement(*GSback1_4WindBack)
animationFreeMovement(*GSback1_6WindBack)
setFrameLength(*GSback1_4WindBack,1,12)
setFrameLength(*GSback1_4WindBack,2,16)
setFrameLength(*GSback1_6WindBack,1,20)
setFrameMovementDelta(*GSback1_4WindBack,0,0,-0.2)
setFrameMovementDelta(*GSback1_4WindBack,1,0,-0.4)
setFrameMovementDelta(*GSback1_4WindBack,2,0,-0.6)
setFrameMovementDelta(*GSback1_6WindBack,0,0,-0.2)
setFrameMovementDelta(*GSback1_6WindBack,1,0,-0.4)

*GSBack1\frontWind(0,0)=*GSback1_1WindFront
*GSBack1\frontWind(1,0)=*GSback1_2WindFront
*GSBack1\frontWind(2,0)=*GSback1_3WindFront
*GSBack1\frontWind(3,0)=*GSback1_4WindFront
*GSBack1\frontWind(4,0)=*GSback1_5WindFront
*GSBack1\frontWind(5,0)=*GSback1_6WindFront
*GSBack1\frontWind(6,0)=*GSback1_7WindFront
*GSBack1\frontWind(7,0)=*GSback1_8WindFront
*GSBack1\frontWind(8,0)=*GSback1_9WindFront

*GSBack1\backWind(3,0)=*GSback1_4WindBack
*GSBack1\backWind(4,0)=*GSback1_4WindBack
*GSBack1\backWind(5,0)=*GSback1_6WindBack
*GSBack1\backWind(6,0)=*GSback1_6WindBack

animationGetNeutral(*GSBack1)=*gluestick_Neutral6

*GSExplosion1.animation=classGenerateAnimation(6,"image/hand_gluestick_explosion1_",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 explosion",0,*GSExplosion1Raw,0,#H2H_DAMAGETYPE_PIERCE,7,2)
setFrameSound(*GSExplosion1,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
For i=0 To 3
	setFramePureProjectile(*GSExplosion1,i)
Next
For i=0 To 6
	setFrameLength(*GSExplosion1,i,1+i)
Next
setFrameShake(*GSExplosion1,0,20)

Dim *GSBack1\projectiles(9,0)
*GSBack1\projectiles(3,0)=*GSExplosion1

;------- Back 2
*gluestick_Back2.animation=classGenerateAnimation(7,"image/hand_gluestick_back2_",8,#H2H_ANIMATIONTYPE_NBACK,"back 2",0,*GSBack2Raw,30,#H2H_DAMAGETYPE_BLUNT,8,1)
setFrameSound(*gluestick_Back2,0,*gluestickSwingLight\id)
setFrameSound(*gluestick_Back2,1,*gluestickGunHeavy\id)
setFrameSound(*gluestick_Back2,5,*landSound\id)
setFrameMovement(*gluestick_Back2,1,30,-20)
setFrameMovement(*gluestick_Back2,2,80,-20)
setFrameMovement(*gluestick_Back2,3,80,-40)
setFrameMovement(*gluestick_Back2,4,80,40)
setFrameMovement(*gluestick_Back2,5,50,20)
setFrameMovement(*gluestick_Back2,6,20,20)
setFrameMovement(*gluestick_Back2,7,10)
setFrameLength(*gluestick_Back2,2,4)
setFrameLength(*gluestick_Back2,3,5)
setFrameLength(*gluestick_Back2,4,6)
setFrameShake(*gluestick_Back2,1,20)
setFrameShake(*gluestick_Back2,5,10)

animationGetBack(*gluestick_Neutral3)=*gluestick_Back2
animationSetComboEnd(*gluestick_Back2,1)

;------- Down 1
*gluestick_Down1.animation=classGenerateAnimation(10,"image/hand_gluestick_down1_",8,#H2H_ANIMATIONTYPE_NDOWN,"down 1",0,*GSDown1Raw,40,#H2H_DAMAGETYPE_BLUNT,12,1)
setFrameSound(*gluestick_Down1,0,*gluestickSwingMedium\id)
setFrameSound(*gluestick_Down1,4,*gluestickSwingMedium\id)
setFrameSound(*gluestick_Down1,5,*gluestickBluntHeavy\id)
disableFrameSoundRec(*gluestick_Down1,5)
*gluestick_Down1\frames(4)\damageSide=0
*gluestick_Down1\frames(5)\damageSide=0
setFrameLength(*gluestick_Down1,0,3)
setFrameLength(*gluestick_Down1,1,4)
setFrameLength(*gluestick_Down1,4,3)
setFrameLength(*gluestick_Down1,5,3)
enableFrameDamageCut(*gluestick_Down1,6)
setFrameMovement(*gluestick_Down1,0,0,-60)
setFrameMovement(*gluestick_Down1,1,-40,-70)
setFrameMovement(*gluestick_Down1,2,0,-70)
setFrameMovement(*gluestick_Down1,3,-10,30)
setFrameMovement(*gluestick_Down1,4,90,70)
setFrameMovement(*gluestick_Down1,5,0,60)

setFrameStun(*gluestick_Down1,4,30)
setFrameStun(*gluestick_Down1,5,20)

setFramePush(*gluestick_Down1,4,0,40)
setFramePush(*gluestick_Down1,5,0,40)
k=-2 ; for hand trempling
For i=6 To 10
	setFrameMovement(*gluestick_Down1,i,0,k)
	k=-k
	setFrameDamage(*gluestick_Down1,i,9-i)
	setFramePushD(*gluestick_Down1,i,-5+i,-90+i*6)
	setFrameLength(*gluestick_Down1,i,9-i/2)
Next
setFrameShake(*gluestick_Down1,6,30)
setFrameCanDoNext(*gluestick_Down1,7)

;------- Up 1
*gluestick_Up1.animation=classGenerateAnimation(7,"image/hand_gluestick_up1_",7,#H2H_ANIMATIONTYPE_NUP,"up 1",0,*GSUp1Raw,20,#H2H_DAMAGETYPE_BLUNT,8)
setFrameSound(*gluestick_Up1,0,*chineseStaff_HeavyS\id)
setFrameSound(*gluestick_Up1,1,*gluestickSwingMedium\id)
setFrameCanDoNext(*gluestick_Up1,5)
setFrameDamage(*gluestick_Up1,2,10)
setFrameDamage(*gluestick_Up1,4,6)
setFrameMovement(*gluestick_Up1,0,-30,-30)
setFrameMovement(*gluestick_Up1,1,-30,-50)
setFrameMovement(*gluestick_Up1,2,-40,-30)
setFrameMovement(*gluestick_Up1,3,-40)
setFrameMovement(*gluestick_Up1,4,-40,60)
setFrameMovement(*gluestick_Up1,5,-20,50)
setFrameLength(*gluestick_Up1,0,5)
setFrameLength(*gluestick_Up1,1,6)
setFrameLength(*gluestick_Up1,3,10)
setFrameLength(*gluestick_Up1,4,10)
setFrameLength(*gluestick_Up1,5,4)
setFrameLength(*gluestick_Up1,6,3)
setFrameLength(*gluestick_Up1,7,3)

animationGetNeutral(*gluestick_Up1)=*gluestick_Neutral4

;------- Up 2
*gluestick_Up2.animation=classGenerateAnimation(5,"image/hand_gluestick_up2_",6,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*GSUp2Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
animationGetUp(*gluestick_Down1)=*gluestick_Up2
setFrameSound(*gluestick_Up2,0,*gluestickSwingMedium\id)
setFrameCanDoNext(*gluestick_Up2,4)
setFrameMovement(*gluestick_Up2,0,20,60)
setFrameMovement(*gluestick_Up2,1,-20,0)
setFrameMovement(*gluestick_Up2,2,-40,-5)
setFrameMovement(*gluestick_Up2,3,-30,-20)
setFrameMovement(*gluestick_Up2,4,-5,-20)
setFrameMovement(*gluestick_Up2,5,-5,-15)
setFramePushD(*gluestick_Up2,2,-60,-60)
setFramePushD(*gluestick_Up2,3,-30,-30)
setFrameStun(*gluestick_Up2,2,20)
setFrameStun(*gluestick_Up2,3,10)

;------- Up 3
*gluestick_Up3.animation=classGenerateAnimation(9,"image/hand_gluestick_up3_",8,#H2H_ANIMATIONTYPE_NUP,"up 3",0,*GSUp3Raw,25,#H2H_DAMAGETYPE_PIERCE,5,2)
setFrameSound(*gluestick_Up3,0,*gluestickSwingLight\id)
For i=0 To 2
	setFrameLength(*gluestick_Up3,i,5)
Next

For i=2 To 5
	setFrameSound(*gluestick_Up3,i,*gluestickGunMedium\id)
Next
setFrameLength(*gluestick_Up3,7,6)
setFrameLength(*gluestick_Up3,8,5)
setFrameLength(*gluestick_Up3,9,4)
animationGetUp(*gluestick_Neutral1)=*gluestick_Up3

;------- Heavy 1
*gluestick_Heavy1.animation=classGenerateAnimation(13,"image/hand_gluestick_heavy1_",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*GSHeavy1Raw,50,#H2H_DAMAGETYPE_BLUNT,5)
setFrameSound(*gluestick_Heavy1,1,*gluestickSwingMedium\id)
setFrameSound(*gluestick_Heavy1,8,*gluestickGunHeavy\id)
*gluestick_Heavy1\frames(8)\damageSide=2
*gluestick_Heavy1\frames(9)\damageSide=2
*gluestick_Heavy1\frames(10)\damageSide=1
setFrameDamageType(*gluestick_Heavy1,8,#H2H_DAMAGETYPE_PIERCE)
setFrameDamageType(*gluestick_Heavy1,9,#H2H_DAMAGETYPE_PIERCE)
setFrameDamage(*gluestick_Heavy1,8,10)
setFrameDamage(*gluestick_Heavy1,9,8)
setFrameDamage(*gluestick_Heavy1,10,7)
enableFrameCatch(*gluestick_Heavy1,8)
enableFrameDamageCut(*gluestick_Heavy1,8)
setFrameMovement(*gluestick_Heavy1,0,0,-30)
setFrameMovement(*gluestick_Heavy1,1,0,-30)
setFrameMovement(*gluestick_Heavy1,2,0,10)
setFrameMovement(*gluestick_Heavy1,3,-75,15)
setFrameMovement(*gluestick_Heavy1,4,-50,20)
setFrameMovement(*gluestick_Heavy1,5,-25,5)	
setFrameMovement(*gluestick_Heavy1,6,-10,3)
setFrameMovement(*gluestick_Heavy1,7,-5,2)
setFrameMovement(*gluestick_Heavy1,8,0,-50)
setFrameMovement(*gluestick_Heavy1,9,50,-25)
setFrameMovement(*gluestick_Heavy1,10,70,30)
setFrameMovement(*gluestick_Heavy1,11,40,25)
setFrameMovement(*gluestick_Heavy1,12,20,15)
setFrameMovement(*gluestick_Heavy1,13,10,10)
setFrameLength(*gluestick_Heavy1,5,3)
setFrameLength(*gluestick_Heavy1,6,3)
setFrameLength(*gluestick_Heavy1,7,2)
For i=8 To 10
	setFrameLength(*gluestick_Heavy1,i,3)
Next
setFrameLength(*gluestick_Heavy1,12,6)
setFrameLength(*gluestick_Heavy1,13,4)
setFrameStun(*gluestick_Heavy1,2,10)
setFrameStun(*gluestick_Heavy1,3,7)
setFrameStun(*gluestick_Heavy1,4,4)
For i=8 To 10
	setFrameStun(*gluestick_Heavy1,i,30-i)
	setFramePushD(*gluestick_Heavy1,i,-30+i*2)
	setFramePureProjectile(*gluestick_Heavy1,i)
; 	*gluestick_Heavy1\frames(i)\pureProjectileDamage=1
Next
setFramePush(*gluestick_Heavy1,2,-20)
setFrameCanDoNext(*gluestick_Heavy1,12)
setFrameShake(*gluestick_Heavy1,9,20)

;------- Heavy 2
*gluestick_Heavy2.animation=classGenerateAnimation(10,"image/hand_gluestick_heavy2_",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2",0,*GSHeavy2Raw,40,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*gluestick_Heavy2,0,*chineseStaff_AttackS\id)
setFrameSound(*gluestick_Heavy2,3,*gluestickSwingMedium\id)
setFrameSound(*gluestick_Heavy2,2,*wood_hitBluntBlocked\id)
setFrameLength(*gluestick_Heavy2,0,9)
setFrameLength(*gluestick_Heavy2,1,9)
setFrameLength(*gluestick_Heavy2,2,9)
setFrameLength(*gluestick_Heavy2,8,9)
setFrameLength(*gluestick_Heavy2,9,8)
setFrameLength(*gluestick_Heavy2,10,5)
setFrameCanDoNext(*gluestick_Heavy2,8)
setFrameDamage(*gluestick_Heavy2,3,6)
setFrameDamage(*gluestick_Heavy2,4,10)
setFrameDamage(*gluestick_Heavy2,7,10)
; bullshit movement so the combo is not interrupted
setFrameMovement(*gluestick_Heavy2,0,-1)
setFrameMovement(*gluestick_Heavy2,1,-1)
setFrameMovement(*gluestick_Heavy2,2,-1)
setFrameMovement(*gluestick_Heavy2,3,-30)
setFrameMovement(*gluestick_Heavy2,4,-100,-60)
setFrameMovement(*gluestick_Heavy2,5,-60,20)
setFrameMovement(*gluestick_Heavy2,6,-40,10)
setFrameMovement(*gluestick_Heavy2,7,-5,10)
setFrameMovement(*gluestick_Heavy2,8,-3,10)
setFrameMovement(*gluestick_Heavy2,8,-2,10)

animationGetHeavy(*gluestick_Heavy1)=*gluestick_Heavy2
animationGetSide(*gluestick_Heavy2)=*gluestick_Side4

;------- Heavy 3
*gluestick_Heavy3.animation=classGenerateAnimation(5,"image/hand_gluestick_heavy3_",8,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3",0,*GSHeavy3Raw,50,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*gluestick_Heavy3,0,*gluestickSwingMedium\id)
; bullshit movement so the combo is not interrupted
setFrameMovement(*gluestick_Heavy3,0,-1,5)
setFrameMovement(*gluestick_Heavy3,1,-1,5)
setFrameMovement(*gluestick_Heavy3,2,25,5)
setFrameMovement(*gluestick_Heavy3,3,1,5)
setFrameMovement(*gluestick_Heavy3,4,1,5)
setFrameMovement(*gluestick_Heavy3,5,1,5)
setFrameDamage(*gluestick_Heavy3,0,10)
setFrameDamage(*gluestick_Heavy3,1,10)
setFrameLength(*gluestick_Heavy3,3,6)
setFrameLength(*gluestick_Heavy3,4,6)
setFrameLength(*gluestick_Heavy3,5,2)
animationSetComboEnd(*gluestick_Heavy3,1)
animationGetHeavy(*gluestick_Heavy2)=*gluestick_Heavy3

;------- Heavy 4
*gluestick_Heavy4.animation=classGenerateAnimation(8,"image/hand_gluestick_heavy4_",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4",0,*GSHeavy4Raw,50,#H2H_DAMAGETYPE_BLUNT,15)

For i=3 To 6 ; the 3rd frame hurt is duplicated until the 7th
	frameCloneBranchHurt(*gluestick_Heavy4\frames(i),*gluestick_Heavy4\frames(2))
Next
setFrameShake(*gluestick_Heavy4,2,20)
setFrameSound(*gluestick_Heavy4,0,*gluestickGunHeavy\id)
For i=0 To 2
	setFrameMovement(*gluestick_Heavy4,i,0,-10)
Next
For i=2 To 6
	setFrameMovement(*gluestick_Heavy4,i,-120+i*10)
	setFrameLength(*gluestick_Heavy4,i,2+i/2)
	setFramePushD(*gluestick_Heavy4,i,-100+i*12)
Next
	setFrameMovement(*gluestick_Heavy4,7,-1)
	setFrameMovement(*gluestick_Heavy4,8,-1)
setFrameLength(*gluestick_Heavy4,7,7)
setFrameLength(*gluestick_Heavy4,8,7)

animationSetComboEnd(*gluestick_Heavy4,1)
animationGetHeavy(*gluestick_Neutral2New)=*gluestick_Heavy4

;------- Heavy 5
*gluestick_Heavy5.animation=classGenerateAnimation(7,"image/hand_gluestick_heavy5_",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 5",0,*GSHeavy5Raw,50,#H2H_DAMAGETYPE_PIERCE,10,2)
setFrameShake(*gluestick_Heavy5,2,20)
setFrameSound(*gluestick_Heavy5,0,*gluestickGunHeavy\id)
setFrameMovement(*gluestick_Heavy5,1,100)
setFrameMovement(*gluestick_Heavy5,2,90)
setFrameMovement(*gluestick_Heavy5,3,80)
setFrameMovement(*gluestick_Heavy5,4,50)
setFrameMovement(*gluestick_Heavy5,5,30)
setFrameMovement(*gluestick_Heavy5,6,20)
setFrameMovement(*gluestick_Heavy5,7,10)
setFrameLength(*gluestick_Heavy5,0,15)
setFrameLength(*gluestick_Heavy5,4,6)
setFrameLength(*gluestick_Heavy5,5,5)
setFrameLength(*gluestick_Heavy5,6,4)
setFrameLength(*gluestick_Heavy5,7,3)
setFrameCanDoNext(*gluestick_Heavy5,6)
animationGetHeavy(*gluestick_Up1)=*gluestick_Heavy5
animationGetNeutral(*gluestick_Heavy5)=*gluestick_Neutral5

;------- Hit
*gluestick_hit.animation=classGenerateAnimation(6,"image/hand_gluestick_hit",6,#H2H_ANIMATIONTYPE_HIT,"hit",0,*GSHitRaw)

;------ Jump
*gluestick_Jump.animation=classGenerateAnimation(6,"image/hand_gluestick_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*GSJumpRaw)
setFrameLength(*gluestick_Jump,6,40)

;------ Land
*gluestick_Land.animation=classGenerateAnimation(2,"image/hand_gluestick_land",8,#H2H_ANIMATIONTYPE_LAND,"land",0,*GSLandRaw)
setFrameShadow(*gluestick_Land,0,-25,25)
setFrameShadow(*gluestick_Land,1,-40,100)
setFrameShadow(*gluestick_Land,2,-10,25)
frameShiftShift(*gluestick_Land,0,0,50)
frameShiftShift(*gluestick_Land,1,0,25)
setFrameLength(*gluestick_Land,0,4)

;------ Spawn
; *gluestick_Spawn.animation=classGenerateAnimation(15,"image/hand_gluestick_spawn",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*GSSpawnRaw)
; setFrameSound(*gluestick_Spawn,0,*wood_hitBluntBlocked\id)
; setFrameSound(*gluestick_Spawn,5,*gluestickSwingMedium\id)
; setFrameSound(*gluestick_Spawn,10,*wood_hitBluntBlocked\id)
; setFrameSound(*gluestick_Spawn,11,*gluestickSwingLight\id)
; setFrameLength(*gluestick_Spawn,4,6)
; setFrameLength(*gluestick_Spawn,5,6)
; For i=10 To 15
; 	setFrameLength(*gluestick_Spawn,i,6)
; Next
*GSSpawn.animation=classGenerateAnimation(11,"image/hand_gluestick_spawn",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn",0,*GSSpawnRaw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameSound(*GSSpawn,1,#H2H_SOUND_ID_WOODBLUNTBLOCK)
setFrameSound(*GSSpawn,2,#H2H_SOUND_ID_PLASTICBLUNTLIGHT)
setFrameSound(*GSSpawn,3,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
setFrameSound(*GSSpawn,6,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
setFrameSound(*GSSpawn,7,#H2H_SOUND_ID_WOODBLUNTBLOCK)
setFrameSound(*GSSpawn,8,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameSound(*GSSpawn,11,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
setFrameLength(*GSSpawn,1,25)
setFrameLength(*GSSpawn,2,15)
setFrameLength(*GSSpawn,7,15)
setFrameLength(*GSSpawn,8,7)
setFrameLength(*GSSpawn,9,7)
setFrameLength(*GSSpawn,10,15)
setFrameLength(*GSSpawn,11,7)

*GSSpawn2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_spawn2WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 2 wind front",0,*GSSpawn2WindFrontRaw)
*GSSpawn3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn3WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 3 wind front",0,*GSSpawn3WindFrontRaw)
*GSSpawn4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn4WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 4 wind front",0,*GSSpawn4WindFrontRaw)
*GSSpawn5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn5WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 5 wind front",0,*GSSpawn5WindFrontRaw)
*GSSpawn6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn6WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 6 wind front",0,*GSSpawn6WindFrontRaw)
*GSSpawn7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn7WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 7 wind front",0,*GSSpawn7WindFrontRaw)
*GSSpawn8WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn8WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 8 wind front",0,*GSSpawn8WindFrontRaw)
*GSSpawn9WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn9WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 9 wind front",0,*GSSpawn9WindFrontRaw)
*GSSpawn10WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn10WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 10 wind front",0,*GSSpawn10WindFrontRaw)
*GSSpawn11WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_spawn11WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 11 wind front",0,*GSSpawn11WindFrontRaw)
*GSSpawn12WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn12WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 12 wind front",0,*GSSpawn12WindFrontRaw)

animationPrepareWind(*GSSpawn)
*GSSpawn\frontWind(1,0)=*GSSpawn2WindFront
*GSSpawn\frontWind(2,0)=*GSSpawn3WindFront
*GSSpawn\frontWind(3,0)=*GSSpawn4WindFront
*GSSpawn\frontWind(4,0)=*GSSpawn5WindFront
*GSSpawn\frontWind(5,0)=*GSSpawn6WindFront
*GSSpawn\frontWind(6,0)=*GSSpawn7WindFront
*GSSpawn\frontWind(7,0)=*GSSpawn8WindFront
*GSSpawn\frontWind(8,0)=*GSSpawn9WindFront
*GSSpawn\frontWind(9,0)=*GSSpawn10WindFront
*GSSpawn\frontWind(10,0)=*GSSpawn11WindFront
*GSSpawn\frontWind(11,0)=*GSSpawn12WindFront


;------ death
*GSDeath.animation=classGenerateAnimation(8,"image/hand_gluestick_death",8,#H2H_ANIMATIONTYPE_DEATH,"Death",0,*GSDeathRaw,8,#H2H_DAMAGETYPE_CUT,5)

setFrameSound(*GSDeath,1,#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT)
setFrameSound(*GSDeath,5,#H2H_SOUND_ID_GLUESTICK_BLUNTMEDIUM)
setFrameSound(*GSDeath,6,#H2H_SOUND_ID_HAND_FALL)
setFrameSound(*GSDeath,7,#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT)
setFrameSound(*GSDeath,8,#H2H_SOUND_ID_HAND_LAND)

setFrameLength(*GSDeath,0,24)
setFrameLength(*GSDeath,1,24)
setFrameLength(*GSDeath,3,6)
setFrameLength(*GSDeath,4,6)
setFrameLength(*GSDeath,5,6)

*GSDeath2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_death2WindFront",8,#H2H_ANIMATIONTYPE_DEATH,"Death 2 wind front",0,*GSDeath2WindFrontRaw)
*GSDeath3WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_death3WindFront",8,#H2H_ANIMATIONTYPE_DEATH,"Death 3 wind front",0,*GSDeath3WindFrontRaw)
*GSDeath4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_death4WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 4 wind front",0,*GSDeath4WindFrontRaw)
*GSDeath5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_death5WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 5 wind front",0,*GSDeath5WindFrontRaw)
*GSDeath6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_death6WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 6 wind front",0,*GSDeath6WindFrontRaw)
*GSDeath7WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_death7WindFront",8,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind front",0,*GSDeath7WindFrontRaw)
*GSDeath8WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_death8WindFront",8,#H2H_ANIMATIONTYPE_DEATH,"Death 8 wind front",0,*GSDeath8WindFrontRaw)

*GSDeath7WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_death7WindBack",8,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind back",0,*GSDeath7WindBackRaw)
*GSDeath8WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_death8WindBack",8,#H2H_ANIMATIONTYPE_DEATH,"Death 8 wind back",0,*GSDeath8WindBackRaw)

animationPrepareWind(*GSDeath,0)
*GSDeath\frontWind(1,0)=*GSDeath2WindFront
*GSDeath\frontWind(2,0)=*GSDeath3WindFront
*GSDeath\frontWind(3,0)=*GSDeath4WindFront
*GSDeath\frontWind(4,0)=*GSDeath5WindFront
*GSDeath\frontWind(5,0)=*GSDeath6WindFront
*GSDeath\frontWind(6,0)=*GSDeath7WindFront
*GSDeath\frontWind(7,0)=*GSDeath8WindFront
*GSDeath\backWind(6,0)=*GSDeath7WindBack
*GSDeath\backWind(7,0)=*GSDeath8WindBack

;------- Dodge
*GSDodge.animation=classGenerateAnimation(1,"image/hand_gluestick_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*GSDodgeRaw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameLength(*GSDodge,1,16)

;------- branching stuff
*gluestick_stat.statistic=statisticCreate(0,4,0,0,4,4,3,-1,-1,4,1,1)

ReDim *tmpArray(2)
*tmpArray(0)=*gluestick_hitS
*tmpArray(1)=*finger_hit
*tmpArray(2)=*metal_hit ; bullet impact

*gluestick_stance_empty.stance=stanceCreate(*tmpArray(),0,"Empty")
statisticCreate(*gluestick_stance_empty\modificator,0,0,1,-1,0,0,0,0,0,0)

*gluestick.class=classCreate(0,"Glue stick",*gluestick_Idle1,*gluestick_MoveFront,*gluestick_MoveBack,*gluestick_Neutral1,*gluestick_Side1,*gluestick_Up1,*GSBack1,*gluestick_Down1,*gluestick_Heavy1)
*gluestick\allStances(0)\name="Full (default)"
classAddStance(*gluestick,*gluestick_stance_empty)
*gluestick\allStances(0)\specialcolor=#H2H_STANCE_COLOR_YELLOW
*gluestick\allStances(0)\alternatecolor=#H2H_STANCE_COLOR_GREEN
*gluestick\iconPath$="image\Gluestick.png"
*gluestick\stat=*gluestick_stat
*gluestick\desc$="Heavy fighter with brute strength. Brawls and shoots in short range\with its canon-like glue stick while being very hard to damage. However is\slow and rigid, compensated by an excellent blunt impact."

ReDim *gluestick\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*gluestick\allStances(0)\materialClass(i)=*tmpArray(i)
Next

classGetSpawn(*gluestick)=*GSSpawn
classGetDeath(*gluestick)=*GSDeath
classGetJump(*gluestick)=*gluestick_Jump
classGetLand(*gluestick)=*gluestick_Land
classGetHit(*gluestick)=*gluestick_hit
classGetDodge(*gluestick)=*GSDodge
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 798
; FirstLine = 775
; EnableXP
; CPU = 1