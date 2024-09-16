;------ Chopstick

;------- Idle 1 new
*chopstick_Idle1.animation=classGenerateAnimation(7,"image/hand_chopstick_idle1_",8,#H2H_ANIMATIONTYPE_IDLE,"idle 1 new",1,*CSidle1NewRaw)
frameShiftShift(*chopstick_Idle1,1,5)
frameShiftShift(*chopstick_Idle1,2,10,5)
frameShiftShift(*chopstick_Idle1,3,15,10)
frameShiftShift(*chopstick_Idle1,4,10,5)
frameShiftShift(*chopstick_Idle1,5,5)
frameShiftShift(*chopstick_Idle1,6,0,-5)
frameShiftShift(*chopstick_Idle1,7,-5)

*chopstick_Idle1_2WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle1_2WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 wind back",0,*CSidle1_2WindBackRaw)
*chopstick_Idle1_3WindBack=classGenerateAnimation(0,"image/hand_chopstick_idle1_3WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 1 3 wind back",0,*CSidle1_3WindBackRaw)
*chopstick_Idle1_4WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle1_4WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 wind back",0,*CSidle1_4WindBackRaw)
*chopstick_Idle1_7WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle1_7WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 7 wind back",0,*CSidle1_7WindBackRaw)
*chopstick_Idle1_8WindFront=classGenerateAnimation(1,"image/hand_chopstick_idle1_8WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 wind front",0,*CSidle1_8WindFrontRaw)


FreeArray(*chopstick_Idle1\backWind())
Dim *chopstick_Idle1\backWind(7,0)
*chopstick_Idle1\backWind(1,0)=*chopstick_Idle1_2WindBack
*chopstick_Idle1\backWind(2,0)=*chopstick_Idle1_3WindBack
*chopstick_Idle1\backWind(3,0)=*chopstick_Idle1_4WindBack
*chopstick_Idle1\backWind(6,0)=*chopstick_Idle1_7WindBack

FreeArray(*chopstick_Idle1\frontWind())
Dim *chopstick_Idle1\frontWind(7,0)
*chopstick_Idle1\frontWind(7,0)=*chopstick_Idle1_8WindFront

animationFreeMovementWind(*chopstick_Idle1)

;------- Idle 2
*chopstick_Idle2.animation=classGenerateAnimation(5,"image/hand_chopstick_idle2_",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*CSidle2NewRaw)

frameShiftShift(*chopstick_Idle2,1,5)
frameShiftShift(*chopstick_Idle2,2,5,5)
frameShiftShift(*chopstick_Idle2,3,10,5)
frameShiftShift(*chopstick_Idle2,4,10)
frameShiftShift(*chopstick_Idle2,5,5)

*chopstick_Idle2_1WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle2_1WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 1 wind back",0,*CSidle2_1WindBackRaw)
*chopstick_Idle2_2WindBack=classGenerateAnimation(0,"image/hand_chopstick_idle2_2WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind back",0,*CSidle2_2WindBackRaw)
*chopstick_Idle2_3WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle2_3WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind back",0,*CSidle2_3WindBackRaw)
*chopstick_Idle2_6WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle2_6WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind back",0,*CSidle2_6WindBackRaw)

*chopstick_Idle2_2WindFront=classGenerateAnimation(0,"image/hand_chopstick_idle2_2WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind front",0,*CSidle2_2WindFrontRaw)
*chopstick_Idle2_3WindFront=classGenerateAnimation(1,"image/hand_chopstick_idle2_3WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind front",0,*CSidle2_3WindFrontRaw)
*chopstick_Idle2_5WindFront=classGenerateAnimation(1,"image/hand_chopstick_idle2_5WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*CSidle2_5WindFrontRaw)

FreeArray(*chopstick_Idle2\backWind())
Dim *chopstick_Idle2\backWind(5,0)
*chopstick_Idle2\backWind(0,0)=*chopstick_Idle2_1WindBack
*chopstick_Idle2\backWind(1,0)=*chopstick_Idle2_2WindBack
*chopstick_Idle2\backWind(2,0)=*chopstick_Idle2_3WindBack
*chopstick_Idle2\backWind(5,0)=*chopstick_Idle2_6WindBack

FreeArray(*chopstick_Idle2\frontWind())
Dim *chopstick_Idle2\frontWind(5,0)
*chopstick_Idle2\frontWind(1,0)=*chopstick_Idle2_2WindFront
*chopstick_Idle2\frontWind(2,0)=*chopstick_Idle2_3WindFront
*chopstick_Idle2\frontWind(4,0)=*chopstick_Idle2_5WindFront

animationFreeMovementWind(*chopstick_Idle2)

;------- Idle 3
*chopstick_Idle3.animation=classGenerateAnimation(4,"image/hand_chopstick_idle3_",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3",1,*CSidle3Raw)
setFrameLength(*chopstick_Idle3,2,25)
*chopstick_Idle3_1WindBack=classGenerateAnimation(0,"image/hand_chopstick_idle3_1WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 1 wind back",0,*CSidle3_1WindBackRaw)
*chopstick_Idle3_2WindBack=classGenerateAnimation(0,"image/hand_chopstick_idle3_2WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind back",0,*CSidle3_2WindBackRaw)
*chopstick_Idle3_3WindBack=classGenerateAnimation(1,"image/hand_chopstick_idle3_3WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind back",0,*CSidle3_3WindBackRaw)

*chopstick_Idle3_1WindFront=classGenerateAnimation(0,"image/hand_chopstick_idle3_1WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 1 wind front",0,*CSidle3_1WindFrontRaw)
*chopstick_Idle3_2WindFront=classGenerateAnimation(0,"image/hand_chopstick_idle3_2WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind front",0,*CSidle3_2WindFrontRaw)
*chopstick_Idle3_3WindFront=classGenerateAnimation(0,"image/hand_chopstick_idle3_3WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind front",0,*CSidle3_3WindFrontRaw)
*chopstick_Idle3_4WindFront=classGenerateAnimation(0,"image/hand_chopstick_idle3_4WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind front",0,*CSidle3_4WindFrontRaw)
*chopstick_Idle3_5WindFront=classGenerateAnimation(1,"image/hand_chopstick_idle3_5WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind front",0,*CSidle3_5WindFrontRaw)

FreeArray(*chopstick_Idle3\backWind())
Dim *chopstick_Idle3\backWind(4,0)
*chopstick_Idle3\backWind(0,0)=*chopstick_Idle3_1WindBack
*chopstick_Idle3\backWind(1,0)=*chopstick_Idle3_2WindBack
*chopstick_Idle3\backWind(2,0)=*chopstick_Idle3_3WindBack

FreeArray(*chopstick_Idle3\frontWind())
Dim *chopstick_Idle3\frontWind(4,0)
*chopstick_Idle3\frontWind(0,0)=*chopstick_Idle3_1WindFront
*chopstick_Idle3\frontWind(1,0)=*chopstick_Idle3_2WindFront
*chopstick_Idle3\frontWind(2,0)=*chopstick_Idle3_3WindFront
*chopstick_Idle3\frontWind(3,0)=*chopstick_Idle3_4WindFront
*chopstick_Idle3\frontWind(4,0)=*chopstick_Idle3_5WindFront

animationFreeMovementWind(*chopstick_Idle3)

setFrameShadow(*chopstick_Idle3,0,-5)
setFrameShadow(*chopstick_Idle3,0,-10)
setFrameShadow(*chopstick_Idle3,0,-15)
setFrameShadow(*chopstick_Idle3,4,-10)

;------- Front new
*chopstick_moveFront.animation=classGenerateAnimation(8,"image/hand_chopstick_move_front1_",5,#H2H_ANIMATIONTYPE_FRONT,"front new",1,*CSFrontNewRaw)

frameShiftShift(*chopstick_moveFront,1,-5)
frameShiftShift(*chopstick_moveFront,2,-10)
frameShiftShift(*chopstick_moveFront,3,-15)
frameShiftShift(*chopstick_moveFront,4,-10)
frameShiftShift(*chopstick_moveFront,5,-5,-5)
frameShiftShift(*chopstick_moveFront,6,0,-10)
frameShiftShift(*chopstick_moveFront,7,0,-5)

;------- Move Back new
*chopstick_moveBack.animation=classGenerateAnimation(6,"image/hand_chopstick_move_back1_",6,#H2H_ANIMATIONTYPE_BACK,"move back new",1,*CSMoveBackRaw)
setFrameLength(*chopstick_moveBack,0,8)

frameShiftShift(*chopstick_moveBack,1,5)
frameShiftShift(*chopstick_moveBack,2,10)
frameShiftShift(*chopstick_moveBack,3,15)
frameShiftShift(*chopstick_moveBack,4,10,5)
frameShiftShift(*chopstick_moveBack,5,5,10)
frameShiftShift(*chopstick_moveBack,6,0,5)

;------ Neutral 3
*CSNeutral3.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*CSNeutral3Raw,8,#H2H_DAMAGETYPE_PIERCE,3)
ReDim *CSNeutral3\frames(3)
*CSNeutral3\frames(3)=frameDataGive()
frameCopy(*CSNeutral3\frames(3),*CSNeutral3\frames(2),#True)
setFrameCanDoNext(*CSNeutral3,3,1)
setFrameSound(*CSNeutral3,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameMovement(*CSNeutral3,0,30,60)
setFrameMovement(*CSNeutral3,1,30,40)
setFrameMovementDelta(*CSNeutral3,1,30)
setFrameMovementDelta(*CSNeutral3,2,30)
setFrameMovementDelta(*CSNeutral3,3,5)
enableFrameWindNeedCatch(*CSNeutral3,2)
enableFrameMovementDeltaNeedCatch(*CSNeutral3,1)
enableFrameMovementDeltaNeedCatch(*CSNeutral3,2)
enableFrameMovementDeltaNeedCatch(*CSNeutral3,3)

*CSNeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_2WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*CSNeutral3_2WindFrontRaw)
setFrameLength(*CSNeutral3_2WindFront,1,6)
setFrameLength(*CSNeutral3_2WindFront,2,7)
*CSNeutral3_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_3WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 3 wind front",0,*CSNeutral3_3WindFrontRaw)
setFrameLength(*CSNeutral3_3WindFront,1,6)
setFrameLength(*CSNeutral3_3WindFront,2,7)
*CSNeutral3_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind back",0,*CSNeutral3_1WindBackRaw)
setFrameLength(*CSNeutral3_1WindBack,1,5)
*CSNeutral3_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral3_2WindBack",8,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind back",0,*CSNeutral3_2WindBackRaw)
setFrameLength(*CSNeutral3_2WindBack,1,9)
animationFreeMovement(*CSNeutral3_2WindFront)
animationFreeMovement(*CSNeutral3_2WindBack)
animationPrepareWind(*CSNeutral3,0)
*CSNeutral3\frontWind(1,0)=*CSNeutral3_2WindFront
*CSNeutral3\frontWind(2,0)=*CSNeutral3_3WindFront
*CSNeutral3\backWind(0,0)=*CSNeutral3_1WindBack
*CSNeutral3\backWind(1,0)=*CSNeutral3_2WindBack

;------ Neutral 4
*CSNeutral4.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral4_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4",0,*CSNeutral4Raw,12,#H2H_DAMAGETYPE_PIERCE,3)
ReDim *CSNeutral4\frames(4)
*CSNeutral4\frames(4)=frameDataGive()
frameCopy(*CSNeutral4\frames(4),*CSNeutral4\frames(3),#True)
setFrameMovementDelta(*CSNeutral4,1,5)
setFrameMovement(*CSNeutral4,1,-10)
setFrameMovementDelta(*CSNeutral4,2,30)
setFrameMovementDelta(*CSNeutral4,3,30)
setFrameMovementDelta(*CSNeutral4,4,5)
setFrameSound(*CSNeutral4,1,#H2H_SOUND_ID_SWISHLIGHT)
For i=1 To 4
	enableFrameWindNeedCatch(*CSNeutral4,i)
	enableFrameMovementDeltaNeedCatch(*CSNeutral4,i)
Next
setFrameLength(*CSNeutral4,1,4)
setFrameLength(*CSNeutral4,2,4)
setFrameCanDoNext(*CSNeutral4,4,1)
animationGetNeutral(*CSNeutral3)=*CSNeutral4

*CSNeutral4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral4_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind front",0,*CSNeutral4_2WindFrontRaw)
*CSNeutral4_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral4_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind front",0,*CSNeutral4_3WindFrontRaw)
animationFreeMovement(*CSNeutral4_2WindFront)
animationFreeMovement(*CSNeutral4_3WindFront)

*CSNeutral4_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral4_1WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 1 wind back",0,*CSNeutral4_1WindBackRaw)
*CSNeutral4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral4_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind back",0,*CSNeutral4_2WindBackRaw)
*CSNeutral4_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral4_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind back",0,*CSNeutral4_3WindBackRaw)
*CSNeutral4_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral4_4WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 4 wind back",0,*CSNeutral4_4WindBackRaw)
animationFreeMovement(*CSNeutral4_1WindBack)
animationFreeMovement(*CSNeutral4_2WindBack)
animationFreeMovement(*CSNeutral4_3WindBack)
setFrameLength(*CSNeutral4_1WindBack,1,6)
setFrameLength(*CSNeutral4_1WindBack,2,7)
setFrameLength(*CSNeutral4_3WindBack,1,7)
setFrameLength(*CSNeutral4_4WindBack,1,7)

animationPrepareWind(*CSNeutral4,0)
*CSNeutral4\frontWind(1,0)=*CSNeutral4_2WindFront
*CSNeutral4\frontWind(2,0)=*CSNeutral4_3WindFront
*CSNeutral4\backWind(0,0)=*CSNeutral4_1WindBack
*CSNeutral4\backWind(1,0)=*CSNeutral4_2WindBack
*CSNeutral4\backWind(2,0)=*CSNeutral4_3WindBack
*CSNeutral4\backWind(3,0)=*CSNeutral4_4WindBack

;------ Neutral 5
*CSNeutral5.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral5_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5",0,*CSNeutral5Raw,8,#H2H_DAMAGETYPE_PIERCE,3)
setFrameMovementDelta(*CSNeutral5,1,28)
enableFrameMovementDeltaNeedCatch(*CSNeutral5,1)
setFrameMovementDelta(*CSNeutral5,2,28)
enableFrameMovementDeltaNeedCatch(*CSNeutral5,2)
enableFrameWindNeedCatch(*CSNeutral5,2)
setFrameSound(*CSNeutral5,1,#H2H_SOUND_ID_SWISHLIGHT)

*CSNeutral5_1WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral5_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind front",0,*CSNeutral5_1WindFrontRaw)
*CSNeutral5_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral5_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind front",0,*CSNeutral5_2WindFrontRaw)
animationFreeMovementWind(*CSNeutral5_1WindFront)
animationFreeMovementWind(*CSNeutral5_2WindFront)
*CSNeutral5_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral5_1WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind back",0,*CSNeutral5_1WindBackRaw)
*CSNeutral5_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral5_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind back",0,*CSNeutral5_2WindBackRaw)
animationFreeMovementWind(*CSNeutral5_1WindBack)
animationFreeMovementWind(*CSNeutral5_2WindBack)
*CSNeutral5_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral5_3WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 3 wind back",0,*CSNeutral5_3WindBackRaw)
*CSNeutral5_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral5_4WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 4 wind back",0,*CSNeutral5_4WindBackRaw)

animationPrepareWind(*CSNeutral5,0)
*CSNeutral5\frontWind(0,0)=*CSNeutral5_1WindFront
*CSNeutral5\frontWind(1,0)=*CSNeutral5_2WindFront
*CSNeutral5\backWind(0,0)=*CSNeutral5_1WindBack
*CSNeutral5\backWind(1,0)=*CSNeutral5_2WindBack
*CSNeutral5\backWind(2,0)=*CSNeutral5_3WindBack
*CSNeutral5\backWind(3,0)=*CSNeutral5_4WindBack


animationGetNeutral(*CSNeutral4)=*CSNeutral5

;------ Neutral 1
*CSNeutral1.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral1_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*CSNeutral1Raw,20,#H2H_DAMAGETYPE_PIERCE,5,2)
setFrameCanDoNext(*CSNeutral1,3,7)
setFrameLength(*CSNeutral1,0,4)
setFrameLength(*CSNeutral1,1,9)
setFrameLength(*CSNeutral1,3,50)
setFrameDamageDuration(*CSNeutral1,1,5)
setFrameDamageDuration(*CSNeutral1,3,4)
enableFrameDamageCut(*CSNeutral1,2)
enableFrameCatch(*CSNeutral1,2)
enableFrameCatch(*CSNeutral1,3)
setFrameMovement(*CSNeutral1,0,35)
setFrameMovement(*CSNeutral1,1,-35,50)
setFrameMovement(*CSNeutral1,2,-35,-50)
setFrameMovement(*CSNeutral1,3,-70,-100)
setFrameStun(*CSNeutral1,2,20)
setFrameStun(*CSNeutral1,3,20)
*CSNeutral1\frames(1)\damageSide=0
setFrameSound(*CSNeutral1,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSNeutral1,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationUngrounded(*CSNeutral1)

*CSNeutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind front",0,*CSNeutral1_1WindFrontRaw)
*CSNeutral1_2WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral1_2WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*CSNeutral1_2WindFrontRaw)
*CSNeutral1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral1_3WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind front",0,*CSNeutral1_3WindFrontRaw)
*CSNeutral1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral1_4WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*CSNeutral1_4WindFrontRaw)

*CSNeutral1_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral1_2WindBack",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind back",0,*CSNeutral1_2WindBackRaw)

animationPrepareWind(*CSNeutral1,0)
*CSNeutral1\frontWind(0,0)=*CSNeutral1_1WindFront
*CSNeutral1\frontWind(1,0)=*CSNeutral1_2WindFront
*CSNeutral1\frontWind(2,0)=*CSNeutral1_3WindFront
*CSNeutral1\frontWind(3,0)=*CSNeutral1_4WindFront
*CSNeutral1\backWind(1,0)=*CSNeutral1_2WindBack
animationFreeMovementWind(*CSNeutral1)
animationGetNeutral(*CSNeutral1)=*CSNeutral3

;------ Neutral 2 New
*chopstick_Neutral2.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral2_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*CSNeutral2Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
setFrameSound(*chopstick_Neutral2,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameMovement(*chopstick_Neutral2,0,-30)
setFrameMovement(*chopstick_Neutral2,1,-30)
setFrameMovement(*chopstick_Neutral2,2,-20)
setFrameLength(*chopstick_Neutral2,2,5)
*chopstick_Neutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral2_1WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 1 wind front",0,*CSNeutral2_1WindFrontRaw)
*chopstick_Neutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral2_2WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 2 wind front",0,*CSNeutral2_2WindFrontRaw)
*chopstick_Neutral2_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral2_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 3 wind front",0,*CSNeutral2_3WindFrontRaw)
setFrameLength(*chopstick_Neutral2_3WindFront,1,5)
setFrameLength(*chopstick_Neutral2_3WindFront,2,6)
frameSetFreeMovement(*chopstick_Neutral2_3WindFront\frames(1),#True)
animationPrepareWind(*chopstick_Neutral2)

*chopstick_Neutral2\frontWind(0,0)=*chopstick_Neutral2_1WindFront
*chopstick_Neutral2\frontWind(1,0)=*chopstick_Neutral2_2WindFront
*chopstick_Neutral2\frontWind(2,0)=*chopstick_Neutral2_3WindFront

;------ Side 3 new
*chopstick_side3.animation=classGenerateAnimation(4,"image/hand_chopstick_side3_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 new",0,*CSSide3Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
setFrameSound(*chopstick_side3,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopstick_side3,3,#H2H_SOUND_ID_SWISHLIGHT)
enableFrameDamageCut(*chopstick_side3,2)
animationSetComboEnd(*chopstick_side3,1)
setFrameLength(*chopstick_side3,2,3)
setFrameLength(*chopstick_side3,3,3)
setFrameLength(*chopstick_side3,4,10)
setFrameMovement(*chopstick_side3,0,30)
setFrameMovement(*chopstick_side3,1,20)
setFrameMovement(*chopstick_side3,2,0,5)
setFrameMovement(*chopstick_side3,3,-20,10)
setFrameMovement(*chopstick_side3,4,-30,10)

animationPrepareWind(*chopstick_side3)

*chopstick_side3_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind front",0,*CSSide3_1WindFrontRaw)
*chopstick_side3_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind front",0,*CSSide3_2WindFrontRaw)
*chopstick_side3_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind front",0,*CSSide3_3WindFrontRaw)
*chopstick_side3_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind front",0,*CSSide3_4WindFrontRaw)
*chopstick_side3_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side3_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind front",0,*CSSide3_5WindFrontRaw)
setFrameMovement(*chopstick_side3_5WindFront,1,-70)
setFrameMovement(*chopstick_side3_5WindFront,2,-50)
setFrameMovement(*chopstick_side3_5WindFront,3,-20)
setFrameLength(*chopstick_side3_5WindFront,0,3)
setFrameLength(*chopstick_side3_5WindFront,2,5)
setFrameLength(*chopstick_side3_5WindFront,3,6)
animationFreeMovement(*chopstick_side3_5WindFront)

*chopstick_side3_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind back",0,*CSSide3_1WindBackRaw)
*chopstick_side3_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind back",0,*CSSide3_2WindBackRaw)
*chopstick_side3_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind back",0,*CSSide3_3WindBackRaw)
*chopstick_side3_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind back",0,*CSSide3_4WindBackRaw)
*chopstick_side3_5WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side3_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind back",0,*CSSide3_5WindBackRaw)
setFrameLength(*chopstick_side3_5WindBack,0,3)
animationFreeMovement(*chopstick_side3_5WindBack)

*chopstick_side3\frontWind(0,0)=*chopstick_side3_1WindFront
*chopstick_side3\frontWind(1,0)=*chopstick_side3_2WindFront
*chopstick_side3\frontWind(2,0)=*chopstick_side3_3WindFront
*chopstick_side3\frontWind(3,0)=*chopstick_side3_4WindFront
*chopstick_side3\frontWind(4,0)=*chopstick_side3_5WindFront

*chopstick_side3\backWind(0,0)=*chopstick_side3_1WindBack
*chopstick_side3\backWind(1,0)=*chopstick_side3_2WindBack
*chopstick_side3\backWind(2,0)=*chopstick_side3_3WindBack
*chopstick_side3\backWind(3,0)=*chopstick_side3_4WindBack
*chopstick_side3\backWind(4,0)=*chopstick_side3_5WindBack

;------ Side 2
*chopstick_side2.animation=classGenerateAnimation(4,"image/hand_chopstick_side2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*CSSide2Raw,20,#H2H_DAMAGETYPE_PIERCE,7)
setFrameSound(*chopstick_side2,0,*chineseStaff_AttackS\id)
setFrameSound(*chopstick_side2,2,*chineseStaff_AttackS\id)
setFrameLength(*chopstick_side2,1,6)
setFrameLength(*chopstick_side2,4,20)
setFrameCanDoNext(*chopstick_side2,4,5)
setFrameDamageType(*chopstick_side2,0,#H2H_DAMAGETYPE_BLUNT)
setFrameDamageType(*chopstick_side2,1,#H2H_DAMAGETYPE_BLUNT)
*chopstick_side2\frames(4)\damageDuration=4
setFrameMovement(*chopstick_side2,0,84,22)
setFrameMovement(*chopstick_side2,1,120,25)
setFrameMovement(*chopstick_side2,2,-110,-25)
setFrameMovement(*chopstick_side2,3,-90,-22)

animationPrepareWind(*chopstick_side2)
*chopstick_side2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind front",0,*CSSide2_1WindFrontRaw)
*chopstick_side2_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side2_5WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 2 5 wind front",0,*CSSide2_5WindFrontRaw)
setFrameLength(*chopstick_side2_5WindFront,1,3)
setFrameLength(*chopstick_side2_5WindFront,2,4)
setFrameLength(*chopstick_side2_5WindFront,3,5)

*chopstick_side2_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind back",0,*CSSide2_1WindBackRaw)
*chopstick_side2_2WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side2_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 wind back",0,*CSSide2_2WindBackRaw)
*chopstick_side2_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side2_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 3 wind back",0,*CSSide2_3WindBackRaw)
*chopstick_side2_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 wind back",0,*CSSide2_4WindBackRaw)


*chopstick_side2\frontWind(0,0)=*chopstick_side2_1WindFront
*chopstick_side2\frontWind(4,0)=*chopstick_side2_5WindFront

*chopstick_side2\backWind(0,0)=*chopstick_side2_1WindBack
*chopstick_side2\backWind(1,0)=*chopstick_side2_2WindBack
*chopstick_side2\backWind(2,0)=*chopstick_side2_3WindBack
*chopstick_side2\backWind(3,0)=*chopstick_side2_4WindBack

animationFreeMovementWind(*chopstick_side2)

animationGetSide(*chopstick_side2)=*chopstick_side3

;------ Side 1
*chopStick_side1.animation=classGenerateAnimation(6,"image/hand_chopstick_side1_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 1",0,*CSSide1Raw,20,#H2H_DAMAGETYPE_BLUNT,4)
setFrameLength(*chopStick_side1,3,5)
setFrameLength(*chopStick_side1,6,10)
setFrameDamage(*chopStick_side1,4,5)
setFrameDamage(*chopStick_side1,5,5)
setFrameDamage(*chopStick_side1,6,5)
setFrameCanDoNext(*chopStick_side1,6,4)
*chopStick_side1\frames(6)\damageDuration=6
setFrameSound(*chopStick_side1,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopStick_side1,4,#H2H_SOUND_ID_SWISHLIGHT)
setFrameMovement(*chopStick_side1,0,15,-6)
setFrameMovement(*chopStick_side1,1,15,-6)
setFrameMovement(*chopStick_side1,2,15,-6)
setFrameMovement(*chopStick_side1,3,15,-6)
setFrameMovement(*chopStick_side1,4,-20,9)
setFrameMovement(*chopStick_side1,5,-20,9)
setFrameMovement(*chopStick_side1,6,-20,9)
enableFrameDamageCut(*chopStick_side1,2)
enableFrameDamageCut(*chopStick_side1,4)
animationGetSide(*chopStick_side1)=*chopstick_side2
animationPrepareWind(*chopStick_side1)
*chopstick_side1_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind front",0,*CSSide1_1WindFrontRaw)
*chopstick_side1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind front",0,*CSSide1_2WindFrontRaw)
*chopstick_side1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind front",0,*CSSide1_3WindFrontRaw)
*chopstick_side1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side1_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind front",0,*CSSide1_4WindFrontRaw)
*chopstick_side1_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind front",0,*CSSide1_5WindFrontRaw)
*chopstick_side1_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_6WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind front",0,*CSSide1_6WindFrontRaw)
*chopstick_side1_7WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side1_7WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 7 wind front",0,*CSSide1_7WindFrontRaw)

*chopstick_side1_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind back",0,*CSSide1_1WindBackRaw)
*chopstick_side1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind back",0,*CSSide1_2WindBackRaw)
*chopstick_side1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind back",0,*CSSide1_3WindBackRaw)
*chopstick_side1_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side1_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind back",0,*CSSide1_4WindBackRaw)
*chopstick_side1_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind back",0,*CSSide1_5WindBackRaw)
*chopstick_side1_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_6WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind back",0,*CSSide1_6WindBackRaw)
*chopstick_side1_7WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side1_7WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 7 wind back",0,*CSSide1_7WindBackRaw)

*chopStick_side1\frontWind(0,0)=*chopstick_side1_1WindFront
*chopStick_side1\frontWind(1,0)=*chopstick_side1_2WindFront
*chopStick_side1\frontWind(2,0)=*chopstick_side1_3WindFront
*chopStick_side1\frontWind(3,0)=*chopstick_side1_4WindFront
*chopStick_side1\frontWind(4,0)=*chopstick_side1_5WindFront
*chopStick_side1\frontWind(5,0)=*chopstick_side1_6WindFront
*chopStick_side1\frontWind(6,0)=*chopstick_side1_7WindFront

*chopStick_side1\backWind(0,0)=*chopstick_side1_1WindBack
*chopStick_side1\backWind(1,0)=*chopstick_side1_2WindBack
*chopStick_side1\backWind(2,0)=*chopstick_side1_3WindBack
*chopStick_side1\backWind(3,0)=*chopstick_side1_4WindBack
*chopStick_side1\backWind(4,0)=*chopstick_side1_5WindBack
*chopStick_side1\backWind(5,0)=*chopstick_side1_6WindBack
*chopStick_side1\backWind(6,0)=*chopstick_side1_7WindBack

animationFreeMovementWind(*chopStick_side1)

;------ side 4 new
*chopstick_side4.animation=classGenerateAnimation(4,"image/hand_chopstick_side4_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*CSSide4Raw,15,#H2H_DAMAGETYPE_BLUNT,7)
setFrameSound(*chopstick_side4,1,*chineseStaff_AttackS\id)
setFrameLength(*chopstick_side4,1,2)
setFrameLength(*chopstick_side4,3,2)
setFrameLength(*chopstick_side4,4,8)
setFrameCanDoNext(*chopstick_side4,4,3)
setFrameMovement(*chopstick_side4,0,-40)
setFrameMovement(*chopstick_side4,1,-80)
setFrameMovement(*chopstick_side4,2,-20)
setFrameMovement(*chopstick_side4,3,0,15)
setFrameMovement(*chopstick_side4,4,0,15)
animationSetComboEnd(*chopstick_side4,1)
animationPrepareWind(*chopstick_side4)
t=4
*chopstick_side4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_1WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 1 wind front",0,*CSSide4_1WindFrontRaw)
animationFreeMovement(*chopstick_side4_1WindFront)
*chopstick_side4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_2WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 2 wind front",0,*CSSide4_2WindFrontRaw)
animationFreeMovement(*chopstick_side4_2WindFront)
*chopstick_side4_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_3WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 3 wind front",0,*CSSide4_3WindFrontRaw)
animationFreeMovement(*chopstick_side4_3WindFront)
*chopstick_side4_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_4WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 4 wind front",0,*CSSide4_4WindFrontRaw)
animationFreeMovement(*chopstick_side4_4WindFront)
*chopstick_side4_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side4_5WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 5 wind front",0,*CSSide4_5WindFrontRaw)
animationFreeMovement(*chopstick_side4_5WindFront)
setFrameLength(*chopstick_side4_5WindFront,1,6)
setFrameLength(*chopstick_side4_5WindFront,2,7)
setFrameLength(*chopstick_side4_5WindFront,3,8)

*chopstick_side4_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_4WindBack",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 4 wind back",0,*CSSide4_4WindBackRaw)
animationFreeMovement(*chopstick_side4_4WindBack)
*chopstick_side4_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side4_5WindBack",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 5 wind back",0,*CSSide4_5WindBackRaw)
animationFreeMovement(*chopstick_side4_5WindBack)

*chopstick_side4\frontWind(0,0)=*chopstick_side4_1WindFront
*chopstick_side4\frontWind(1,0)=*chopstick_side4_2WindFront
*chopstick_side4\frontWind(2,0)=*chopstick_side4_3WindFront
*chopstick_side4\frontWind(3,0)=*chopstick_side4_4WindFront
*chopstick_side4\frontWind(4,0)=*chopstick_side4_5WindFront

*chopstick_side4\backWind(3,0)=*chopstick_side4_4WindBack
*chopstick_side4\backWind(4,0)=*chopstick_side4_5WindBack

;------ Side 5
*CSSide5.animation=classGenerateAnimation(4,"image/hand_chopstick_side5_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*CSSide5Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationSetComboEnd(*CSSide5,#True)
setFrameSound(*CSSide5,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSSide5,3,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameMovement(*CSSide5,0,10,-100)
setFrameMovement(*CSSide5,1,20,10)
setFrameMovement(*CSSide5,2,20,20)
setFrameMovement(*CSSide5,3,20,40)
setFrameMovement(*CSSide5,4,20,80)
setFrameMovement(*CSSide5,4,20,40)
enableFrameDamageCut(*CSSide5,3)
setFrameLength(*CSSide5,0,5)
setFrameLength(*CSSide5,3,5)
setFrameLength(*CSSide5,4,10)

*CSSide5_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 1 wind front",0,*CSSide5_1WindFrontRaw)
*CSSide5_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*CSSide5_2WindFrontRaw)
*CSSide5_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 3 wind front",0,*CSSide5_3WindFrontRaw)
*CSSide5_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind front",0,*CSSide5_4WindFrontRaw)
*CSSide5_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side5_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind front",0,*CSSide5_5WindFrontRaw)
setFrameLength(*CSSide5_5WindFront,1,5)
setFrameLength(*CSSide5_5WindFront,2,6)
setFrameLength(*CSSide5_5WindFront,3,7)

*CSSide5_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind back",0,*CSSide5_4WindBackRaw)
*CSSide5_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side5_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind back",0,*CSSide5_5WindBackRaw)
setFrameLength(*CSSide5_5WindBack,1,5)
setFrameLength(*CSSide5_5WindBack,2,6)

animationPrepareWind(*CSSide5,0)
*CSSide5\frontWind(0,0)=*CSSide5_1WindFront
*CSSide5\frontWind(1,0)=*CSSide5_2WindFront
*CSSide5\frontWind(2,0)=*CSSide5_3WindFront
*CSSide5\frontWind(3,0)=*CSSide5_4WindFront
*CSSide5\frontWind(4,0)=*CSSide5_5WindFront
*CSSide5\backWind(3,0)=*CSSide5_4WindBack
*CSSide5\backWind(4,0)=*CSSide5_5WindBack

animationFreeMovementWind(*CSSide5)

;------ Side 6
*chopstick_side6.animation=classGenerateAnimation(10,"image/hand_chopstick_side6_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6",0,*CSSide6Raw,30,#H2H_DAMAGETYPE_PIERCE,7)
animationSetComboEnd(*chopstick_side6,1)
animationPrepareWind(*chopstick_side6)
setFrameSound(*chopstick_side6,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopstick_side6,6,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopstick_side6,8,#H2H_SOUND_ID_SWISHLIGHT)

setFrameMovement(*chopstick_side6,0,-50)
setFrameMovement(*chopstick_side6,1,-50)
setFrameMovement(*chopstick_side6,2,-50)
setFrameMovement(*chopstick_side6,3,75)
setFrameMovement(*chopstick_side6,4,-100)
frameSetNeedCatch(*chopstick_side6\frames(4),1)
setFrameMovement(*chopstick_side6,5,-200)
frameSetNeedCatch(*chopstick_side6\frames(5),1)
setFrameMovementDelta(*chopstick_side6,5,-20)
For i=7 To 10
	setFrameDamageType(*chopstick_side6,i,#H2H_DAMAGETYPE_BLUNT)
	setFrameMovement(*chopstick_side6,i,-40+i)
	setFrameLength(*chopstick_side6,i,4)
Next
enableFrameDamageCut(*chopstick_side6,6)
animationSetComboEnd(*chopstick_side6,1)

*chopstick_Side6_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_1WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 1 wind back",0,*CSSide6_1WindBackRaw)
*chopstick_Side6_2WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_2WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind back",0,*CSSide6_2WindBackRaw)
*chopstick_Side6_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_4WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 4 wind back",0,*CSSide6_4WindBackRaw)
*chopstick_Side6_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_5WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind back",0,*CSSide6_5WindBackRaw)
*chopstick_Side6_7WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_7WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 7 wind back",0,*CSSide6_7WindBackRaw)
*chopstick_Side6_9WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_9WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 9 wind back",0,*CSSide6_9WindBackRaw)
*chopstick_Side6_10WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_10WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 10 wind back",0,*CSSide6_10WindBackRaw)
animationFreeMovement(*chopstick_Side6_9WindBack)
animationFreeMovement(*chopstick_Side6_10WindBack)

*chopstick_Side6_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind front",0,*CSSide6_2WindFrontRaw)
*chopstick_Side6_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_side6_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 3 wind front",0,*CSSide6_3WindFrontRaw)
*chopstick_Side6_5WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_5WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind front",0,*CSSide6_5WindFrontRaw)
*chopstick_Side6_6WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side6_6WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 6 wind front",0,*CSSide6_6WindFrontRaw)
*chopstick_Side6_8WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_8WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 8 wind front",0,*CSSide6_8WindFrontRaw)
*chopstick_Side6_9WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_9WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 9 wind front",0,*CSSide6_9WindFrontRaw)
*chopstick_Side6_10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_10WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 10 wind front",0,*CSSide6_10WindFrontRaw)
*chopstick_Side6_11WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_11WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 11 wind front",0,*CSSide6_11WindFrontRaw)
animationFreeMovement(*chopstick_Side6_9WindFront)
animationFreeMovement(*chopstick_Side6_10WindFront)
animationFreeMovement(*chopstick_Side6_11WindFront)

*chopstick_side6\backWind(0,0)=*chopstick_Side6_1WindBack
*chopstick_side6\backWind(1,0)=*chopstick_Side6_2WindBack
*chopstick_side6\backWind(3,0)=*chopstick_Side6_4WindBack
*chopstick_side6\backWind(4,0)=*chopstick_Side6_5WindBack
*chopstick_side6\backWind(6,0)=*chopstick_Side6_7WindBack
*chopstick_side6\backWind(8,0)=*chopstick_Side6_9WindBack
*chopstick_side6\backWind(9,0)=*chopstick_Side6_10WindBack

*chopstick_side6\frontWind(1 ,0)=*chopstick_Side6_2WindFront
*chopstick_side6\frontWind(2 ,0)=*chopstick_Side6_3WindFront
*chopstick_side6\frontWind(4 ,0)=*chopstick_Side6_5WindFront
*chopstick_side6\frontWind(5 ,0)=*chopstick_Side6_6WindFront
*chopstick_side6\frontWind(7 ,0)=*chopstick_Side6_8WindFront
*chopstick_side6\frontWind(8 ,0)=*chopstick_Side6_9WindFront
*chopstick_side6\frontWind(9 ,0)=*chopstick_Side6_10WindFront
*chopstick_side6\frontWind(10,0)=*chopstick_Side6_11WindFront
 
;------ Side 7
*CSSide7.animation=classGenerateAnimation(3,"image/hand_chopstick_side7_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7",0,*CSSide7Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
setFrameCanMove(*CSSide7,3,7)
setFrameLength(*CSSide7,0,6)
setFrameLength(*CSSide7,3,14)
setFrameMovement(*CSSide7,0,-50)
setFrameMovement(*CSSide7,1,-100,30)
setFrameMovement(*CSSide7,2,-50,20)
setFrameMovement(*CSSide7,3,-50,10)
setFrameDamageDuration(*CSSide7,3,5)
setFramePush(*CSSide7,2,-20,20)
setFrameSound(*CSSide7,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*CSSide7,3,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetComboEnd(*CSSide7,#True)

*CSSide7_1WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side7_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 1 wind front",0,*CSSide7_1WindFrontRaw)
*CSSide7_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side7_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind front",0,*CSSide7_2WindFrontRaw)
*CSSide7_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side7_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind front",0,*CSSide7_3WindFrontRaw)
*CSSide7_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side7_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 4 wind front",0,*CSSide7_4WindFrontRaw)
setFrameMovement(*CSSide7_4WindFront,1,-40)
setFrameMovement(*CSSide7_4WindFront,2,-30)
setFrameMovement(*CSSide7_4WindFront,3,-20)

animationPrepareWind(*CSSide7,0)
*CSSide7\frontWind(0,0)=*CSSide7_1WindFront
*CSSide7\frontWind(1,0)=*CSSide7_2WindFront
*CSSide7\frontWind(2,0)=*CSSide7_3WindFront
*CSSide7\frontWind(3,0)=*CSSide7_4WindFront
animationFreeMovementWind(*CSSide7)

;------ Side 8
*CSSide8.animation=classGenerateAnimation(6,"image/hand_chopstick_side8_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8",0,*CSSide8Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
setFrameSound(*CSSide8,1,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*CSSide8,4,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetComboEnd(*CSSide8,#True)
setFrameMovement(*CSSide8,3,0,-100)
setFrameMovement(*CSSide8,5,0,50)
setFrameMovement(*CSSide8,6,-40,50)
setFrameLength(*CSSide8,2,4)
setFrameLength(*CSSide8,3,5)
setFrameLength(*CSSide8,4,4)
setFrameLength(*CSSide8,5,8)
setFrameLength(*CSSide8,6,5)

*CSSide8_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 1 wind front",0,*CSSide8_1WindFrontRaw)
*CSSide8_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 2 wind front",0,*CSSide8_2WindFrontRaw)
*CSSide8_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 3 wind front",0,*CSSide8_3WindFrontRaw)
*CSSide8_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 4 wind front",0,*CSSide8_4WindFrontRaw)
*CSSide8_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 5 wind front",0,*CSSide8_5WindFrontRaw)
*CSSide8_6WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side8_6WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 6 wind front",0,*CSSide8_6WindFrontRaw)
setFrameLength(*CSSide8_6WindFront,1,5)
setFrameLength(*CSSide8_6WindFront,2,6)
setFrameLength(*CSSide8_6WindFront,3,7)

*CSSide8_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_5WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 5 wind back",0,*CSSide8_5WindBackRaw)
*CSSide8_6WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_side8_6WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 6 wind back",0,*CSSide8_6WindBackRaw)
setFrameLength(*CSSide8_6WindBack,1,5)
setFrameLength(*CSSide8_6WindBack,2,6)
setFrameLength(*CSSide8_6WindBack,3,7)
animationPrepareWind(*CSSide8,0)
*CSSide8\frontWind(0,0)=*CSSide8_1WindFront
*CSSide8\frontWind(1,0)=*CSSide8_2WindFront
*CSSide8\frontWind(2,0)=*CSSide8_3WindFront
*CSSide8\frontWind(3,0)=*CSSide8_4WindFront
*CSSide8\frontWind(4,0)=*CSSide8_5WindFront
*CSSide8\frontWind(5,0)=*CSSide8_6WindFront
*CSSide8\backWind(4,0)=*CSSide8_5WindBack
*CSSide8\backWind(5,0)=*CSSide8_6WindBack
animationFreeMovementWind(*CSSide8)

;------ Side 9
*CSSide9.animation=classGenerateAnimation(4,"image/hand_chopstick_side9_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9",0,*CSSide9Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationUngrounded(*CSSide9)
animationSetComboEnd(*CSSide9,#True)
setFrameMovement(*CSSide9,0,50,-40)
setFrameMovement(*CSSide9,1,-70,-40)
setFrameMovement(*CSSide9,2,-40,-20)
setFrameMovement(*CSSide9,3,-40,20)
setFrameMovement(*CSSide9,4,40,40)
enableFrameDamageCut(*CSSide9,2)
setFrameDamage(*CSSide9,1,5)
setFrameLength(*CSSide9,0,7)
setFrameLength(*CSSide9,3,7)
setFrameSound(*CSSide9,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSSide9,3,#H2H_SOUND_ID_SWISHMEDIUM)

*CSSide9_1WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 1 wind front",0,*CSSide9_1WindFrontRaw)
setFrameDamage(*CSSide9_1WindFront,1,6)
setFrameDamage(*CSSide9_1WindFront,2,7)
*CSSide9_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side9_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 2 wind front",0,*CSSide9_2WindFrontRaw)
*CSSide9_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side9_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 3 wind front",0,*CSSide9_3WindFrontRaw)
*CSSide9_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side9_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 4 wind front",0,*CSSide9_4WindFrontRaw)
setFrameDamage(*CSSide9_4WindFront,1,6)
setFrameDamage(*CSSide9_4WindFront,2,7)
setFrameDamage(*CSSide9_4WindFront,3,8)

*CSSide9_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_1WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 1 wind back",0,*CSSide9_1WindBackRaw)
setFrameDamage(*CSSide9_1WindBack,1,6)
setFrameDamage(*CSSide9_1WindBack,2,7)
*CSSide9_4WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_4WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 4 wind back",0,*CSSide9_4WindBackRaw)
setFrameDamage(*CSSide9_4WindBack,1,6)
setFrameDamage(*CSSide9_4WindBack,2,7)

animationPrepareWind(*CSSide9,0)
*CSSide9\frontWind(0,0)=*CSSide9_1WindFront
*CSSide9\frontWind(1,0)=*CSSide9_2WindFront
*CSSide9\frontWind(2,0)=*CSSide9_3WindFront
*CSSide9\frontWind(3,0)=*CSSide9_4WindFront
*CSSide9\backWind(0,0)=*CSSide9_1WindBack
*CSSide9\backWind(3,0)=*CSSide9_4WindBack

animationFreeMovementWind(*CSSide9)

;------ Neutral 6
*chopstick_Neutral6.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral6_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*CSNeutral6Raw,10,#H2H_DAMAGETYPE_BLUNT,4)
animationGetSide(*chopstick_Neutral6)=*chopstick_side4
setFrameSound(*chopstick_Neutral6,1,*chineseStaff_AttackS\id)
setFrameLength(*chopstick_Neutral6,3,12)
setFrameLength(*chopstick_Neutral6,0,4)
setFrameCanDoNext(*chopstick_Neutral6,3,3)
animationPrepareWind(*chopstick_Neutral6)
For i=0 To 3
	setFrameMovement(*chopstick_Neutral6,i,2+i*8)
Next

*chopstick_Neutral6_1FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 1 wind front",0,*CSNeutral6_1WindFrontRaw)
*chopstick_Neutral6_2FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 2 wind front",0,*CSNeutral6_2WindFrontRaw)
*chopstick_Neutral6_3FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind front",0,*CSNeutral6_3WindFrontRaw)
*chopstick_Neutral6_4FrontWind.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral6_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 4 wind front",0,*CSNeutral6_4WindFrontRaw)

*chopstick_Neutral6\frontWind(0,0)=*chopstick_Neutral6_1FrontWind
*chopstick_Neutral6\frontWind(1,0)=*chopstick_Neutral6_2FrontWind
*chopstick_Neutral6\frontWind(2,0)=*chopstick_Neutral6_3FrontWind
*chopstick_Neutral6\frontWind(3,0)=*chopstick_Neutral6_4FrontWind

;------ Up new
*chopstick_up1.animation=classGenerateAnimation(4,"image/hand_chopstick_up1_",4,#H2H_ANIMATIONTYPE_NUP,"up 1",0,*CSUp1Raw,8,#H2H_DAMAGETYPE_BLUNT,3)
setFrameSound(*chopstick_up1,1,*chineseStaff_AttackS\id)
setFrameDamageType(*chopstick_up1,2,#H2H_DAMAGETYPE_PIERCE)
setFrameDamageType(*chopstick_up1,3,#H2H_DAMAGETYPE_PIERCE)
setFrameMovement(*chopstick_up1,0,-5,20)
setFrameMovement(*chopstick_up1,1,-40,-20)
setFrameMovement(*chopstick_up1,2,0,-20)
setFrameMovement(*chopstick_up1,3,0,-10)
setFrameMovement(*chopstick_up1,4,0,30)
setFrameCanDoNext(*chopstick_up1,3,3)
setFrameLength(*chopstick_up1,0,6)
setFrameLength(*chopstick_up1,4,9)
setFrameDamage(*chopstick_up1,2,8)
setFrameDamage(*chopstick_up1,3,10)
animationGetNeutral(*chopstick_up1)=*chopstick_Neutral6
animationGetSide(*chopstick_up1)=*CSSide7
animationPrepareWind(*chopstick_up1)

*chopstick_up1_1WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up1_1WindFront",6,#H2H_ANIMATIONTYPE_NUP,"up 1 1 wind front",0,*CSUp1_1WindFrontRaw)
*chopstick_up1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_2WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind front",0,*CSUp1_2WindFrontRaw)
*chopstick_up1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_3WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind front",0,*CSUp1_3WindFrontRaw)
*chopstick_up1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_up1_4WindFront",6,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind front",0,*CSUp1_4WindFrontRaw)
setFrameFreeMovement(*chopstick_up1_4WindFront\frames(0))
setFrameLength(*chopstick_up1_4WindFront,2,7)
*chopstick_up1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_2WindBack",4,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind back",0,*CSUp1_2WindBackRaw)
*chopstick_up1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_3WindBack",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind back",0,*CSUp1_3WindBackRaw)
*chopstick_up1_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_up1_4WindBack",8,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind back",0,*CSUp1_4WindBackRaw)
setFrameFreeMovement(*chopstick_up1_4WindBack\frames(0))

*chopstick_up1\frontWind(0,0)=*chopstick_up1_1WindFront
*chopstick_up1\frontWind(1,0)=*chopstick_up1_2WindFront
*chopstick_up1\frontWind(2,0)=*chopstick_up1_3WindFront
*chopstick_up1\frontWind(3,0)=*chopstick_up1_4WindFront

*chopstick_up1\backWind(1,0)=*chopstick_up1_2WindBack
*chopstick_up1\backWind(2,0)=*chopstick_up1_3WindBack
*chopstick_up1\backWind(3,0)=*chopstick_up1_4WindBack

;------ Up 2
*chopstick_Up2.animation=classGenerateAnimation(6,"image/hand_chopstick_up2_",2,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*CSUp2Raw,8,#H2H_DAMAGETYPE_BLUNT,4)
animationSetComboEnd(*chopstick_Up2,1)

setFrameLength(*chopstick_Up2,3,4)
setFrameLength(*chopstick_Up2,6,5)
setFrameMovement(*chopstick_Up2,0,10)
setFrameMovement(*chopstick_Up2,1,20,-10)
setFrameMovement(*chopstick_Up2,2,30,-10)
setFrameMovement(*chopstick_Up2,3,20,20)
setFrameMovement(*chopstick_Up2,4,-40,-50)
setFrameMovement(*chopstick_Up2,5,-30,-25)
setFrameMovement(*chopstick_Up2,6,-30,-50)
setFrameSound(*chopstick_Up2,3,*chineseStaff_AttackS\id)

animationGetUp(*chopstick_Neutral2)=*chopstick_Up2

*chopstick_Up2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_1frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 1 front wind",0,*CSUp2_1WindFrontRaw)
*chopstick_Up2_2WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_2frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 2 front wind",0,*CSUp2_2WindFrontRaw)
setFrameLength(*chopstick_Up2_2WindFront,1,4)
*chopstick_Up2_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_3frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 3 front wind",0,*CSUp2_3WindFrontRaw)
setFrameLength(*chopstick_Up2_3WindFront,1,4)
*chopstick_Up2_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_4frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 4 front wind",0,*CSUp2_4WindFrontRaw)
*chopstick_Up2_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_5frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 5 front wind",0,*CSUp2_5WindFrontRaw)
*chopstick_Up2_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_6frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 6 front wind",0,*CSUp2_6WindFrontRaw)
*chopstick_Up2_7WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_up2_7frontwind",4,#H2H_ANIMATIONTYPE_NUP,"up 2 7 front wind",0,*CSUp2_7WindFrontRaw)
setFrameLength(*chopstick_Up2_7WindFront,1,5)
setFrameLength(*chopstick_Up2_7WindFront,2,6)
animationFreeMovement(*chopstick_Up2_7WindFront)

*chopstick_Up2_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_5backwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 5 back wind",0,*CSUp2_5WindBackRaw)
*chopstick_Up2_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_6backwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 6 back wind",0,*CSUp2_6WindBackRaw)
*chopstick_Up2_7WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_7backwind",4,#H2H_ANIMATIONTYPE_NUP,"up 2 7 back wind",0,*CSUp2_7WindBackRaw)
setFrameLength(*chopstick_Up2_7WindBack,1,6)
animationFreeMovement(*chopstick_Up2_7WindBack)

FreeArray(*chopstick_Up2\frontWind())
Dim *chopstick_Up2\frontWind(6,0)
*chopstick_Up2\frontWind(0,0)=*chopstick_Up2_1WindFront
*chopstick_Up2\frontWind(1,0)=*chopstick_Up2_2WindFront
*chopstick_Up2\frontWind(2,0)=*chopstick_Up2_3WindFront
*chopstick_Up2\frontWind(3,0)=*chopstick_Up2_4WindFront
*chopstick_Up2\frontWind(4,0)=*chopstick_Up2_5WindFront
*chopstick_Up2\frontWind(5,0)=*chopstick_Up2_6WindFront
*chopstick_Up2\frontWind(6,0)=*chopstick_Up2_7WindFront

FreeArray(*chopstick_Up2\backWind())
Dim *chopstick_Up2\backWind(6,0)
*chopstick_Up2\backWind(4,0)=*chopstick_Up2_5WindBack
*chopstick_Up2\backWind(5,0)=*chopstick_Up2_6WindBack
*chopstick_Up2\backWind(6,0)=*chopstick_Up2_7WindBack

;------ Back 1
*CSBack1.animation=classGenerateAnimation(4,"image/hand_chopstick_back1_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1",0,*CSBack1Raw,12,#H2H_DAMAGETYPE_PIERCE,5)
setFrameCanDoNext(*CSBack1,4,6)
animationUngrounded(*CSBack1)
setFrameLength(*CSBack1,3,6)
setFrameLength(*CSBack1,4,12)
setFrameMovement(*CSBack1,0,-5,20)
setFrameMovement(*CSBack1,1,-5,20)
setFrameMovementDelta(*CSBack1,1,25)
setFrameMovementDelta(*CSBack1,2,25)
setFrameMovementDelta(*CSBack1,3,25,-0.5)
setFrameMovementDelta(*CSBack1,4,5,-3)
setFrameSound(*CSBack1,1,#H2H_SOUND_ID_SWISHLIGHT)
enableFrameWindNeedCatch(*CSBack1,3)
enableFrameWindNeedCatch(*CSBack1,4)
enableFrameMovementDeltaNeedCatch(*CSBack1,1)
enableFrameMovementDeltaNeedCatch(*CSBack1,2)
enableFrameMovementDeltaNeedCatch(*CSBack1,3)
enableFrameMovementDeltaNeedCatch(*CSBack1,4)

*CSBack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back1_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1 2 wind front",0,*CSBack1_2WindFrontRaw)
*CSBack1_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1 3 wind front",0,*CSBack1_3WindFrontRaw)
*CSBack1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_4WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"Back 1 4 wind front",0,*CSBack1_4WindFrontRaw)

*CSBack1_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_5WindBack",6,#H2H_ANIMATIONTYPE_NBACK,"Back 1 5 wind back",0,*CSBack1_5WindBackRaw)

animationPrepareWind(*CSBack1,0)
*CSBack1\frontWind(1,0)=*CSBack1_2WindFront
*CSBack1\frontWind(2,0)=*CSBack1_3WindFront
*CSBack1\frontWind(3,0)=*CSBack1_4WindFront
*CSBack1\backWind(4,0)=*CSBack1_5WindBack

;------ Back 2
*CSBack2.animation=classGenerateAnimation(3,"image/hand_chopstick_back2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2",0,*CSBack2Raw,8,#H2H_DAMAGETYPE_BLUNT,6)
setFrameCanDoNext(*CSBack2,3,5)
setFrameLength(*CSBack2,0,7)
setFrameLength(*CSBack2,3,10)
setFrameSound(*CSBack2,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSBack2,1,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameMovement(*CSBack2,0,-5)
setFrameMovement(*CSBack2,1,20,-5)
setFrameMovement(*CSBack2,2,40,-5)
setFrameMovement(*CSBack2,3,60,-5)
setFrameDamageDuration(*CSBack2,3,4)
*CSBack2_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_2WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front",0,*CSBack2_2WindFrontRaw)
*CSBack2_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 3 wind front",0,*CSBack2_3WindFrontRaw)
*CSBack2_4WindFront.animation=classGenerateAnimation(4,"image/hand_chopstick_back2_4WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 2 4 wind front",0,*CSBack2_4WindFrontRaw)

*CSBack2_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_back2_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind back",0,*CSBack2_1WindBackRaw)
*CSBack2_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_2WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind back",0,*CSBack2_2WindBackRaw)
setFrameLength(*CSBack2_4WindFront,1,4)
setFrameLength(*CSBack2_4WindFront,2,5)
setFrameLength(*CSBack2_4WindFront,3,6)
setFrameLength(*CSBack2_4WindFront,4,7)
animationFreeMovementWind(*CSBack2)
animationPrepareWind(*CSBack2,0)
*CSBack2\frontWind(1,0)=*CSBack2_2WindFront
*CSBack2\frontWind(2,0)=*CSBack2_3WindFront
*CSBack2\frontWind(3,0)=*CSBack2_4WindFront
*CSBack2\backWind(0,0)=*CSBack2_1WindBack
*CSBack2\backWind(1,0)=*CSBack2_2WindBack
animationGetSide(*CSBack2)=*CSSide8

;------ Back 3 new
*CSBack3.animation=classGenerateAnimation(4,"image/hand_chopstick_back3_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*CSBack3Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
animationSetComboEnd(*CSBack3,#True)
setFrameMovement(*CSBack3,0,25)
setFrameMovement(*CSBack3,1,25,50)
setFrameMovement(*CSBack3,2,-75,-50)
setFrameMovementDelta(*CSBack3,2,35)
setFrameMovementDelta(*CSBack3,3,10)
enableFrameMovementDeltaNeedCatch(*CSBack3,2)
enableFrameMovementDeltaNeedCatch(*CSBack3,3)
setFrameLength(*CSBack3,2,8)
setFrameLength(*CSBack3,3,7)
setFrameLength(*CSBack3,4,8)
setFrameSound(*CSBack3,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSBack3,2,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameDamageDuration(*CSBack3,2,5)

*CSBack3_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back3_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*CSBack3_3WindFrontRaw)
setFrameLength(*CSBack3_3WindFront,1,6)
setFrameLength(*CSBack3_3WindFront,2,7)

*CSBack3_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back3_1WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind back",0,*CSBack3_1WindBackRaw)
*CSBack3_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back3_2WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind back",0,*CSBack3_2WindBackRaw)
setFrameLength(*CSBack3_2WindBack,1,5)
*CSBack3_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back3_3WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind back",0,*CSBack3_3WindBackRaw)
setFrameLength(*CSBack3_3WindBack,1,5)

animationPrepareWind(*CSBack3,0)
*CSBack3\frontWind(2,0)=*CSBack3_3WindFront
*CSBack3\backWind(0,0)=*CSBack3_1WindBack
*CSBack3\backWind(1,0)=*CSBack3_2WindBack
*CSBack3\backWind(2,0)=*CSBack3_3WindBack
animationFreeMovementWind(*CSBack3)

;----- Back 5
*CSBack4.animation=classGenerateAnimation(5,"image/hand_chopstick_back4_",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4",0,*CSBack4Raw,18,#H2H_DAMAGETYPE_BLUNT,6)
setFrameCanDoNext(*CSBack4,5,5)
setFrameLength(*CSBack4,5,12)
setFrameDamageDuration(*CSBack4,5,5)
setFrameMovement(*CSBack4,0,50)
setFrameMovement(*CSBack4,1,50,-50)
setFrameMovement(*CSBack4,2,50,50)
setFrameMovement(*CSBack4,3,50)
setFrameMovement(*CSBack4,4,50)
setFrameMovement(*CSBack4,5,50)
enableFrameDamageCut(*CSBack4,3)
setFrameDamage(*CSBack4,2,5)
setFrameSound(*CSBack4,1,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*CSBack4,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationGetBack(*chopstick_side2)=*CSBack4
animationGetSide(*CSBack4)=*CSSide5

*CSBack4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 1 wind front",0,*CSBack4_1WindFrontRaw)
*CSBack4_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_4WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 4 wind front",0,*CSBack4_4WindFrontRaw)
*CSBack4_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_5WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 5 wind front",0,*CSBack4_5WindFrontRaw)
*CSBack4_6WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back4_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 6 wind front",0,*CSBack4_6WindFrontRaw)
setFrameLength(*CSBack4_6WindFront,1,6)
setFrameLength(*CSBack4_6WindFront,2,7)

*CSBack4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_2WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 2 wind back",0,*CSBack4_2WindBackRaw)
*CSBack4_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_3WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 3 wind back",0,*CSBack4_3WindBackRaw)
*CSBack4_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_4WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 4 wind back",0,*CSBack4_4WindBackRaw)
*CSBack4_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_5WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 5 wind back",0,*CSBack4_5WindBackRaw)
*CSBack4_6WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back4_6WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"Back 4 6 wind back",0,*CSBack4_6WindBackRaw)

animationPrepareWind(*CSBack4,0)
*CSBack4\frontWind(0,0)=*CSBack4_1WindFront
*CSBack4\frontWind(3,0)=*CSBack4_4WindFront
*CSBack4\frontWind(4,0)=*CSBack4_5WindFront
*CSBack4\frontWind(5,0)=*CSBack4_6WindFront
*CSBack4\backWind(1,0)=*CSBack4_2WindBack
*CSBack4\backWind(2,0)=*CSBack4_3WindBack
*CSBack4\backWind(3,0)=*CSBack4_4WindBack
*CSBack4\backWind(4,0)=*CSBack4_5WindBack
*CSBack4\backWind(5,0)=*CSBack4_6WindBack

animationFreeMovementWind(*CSBack4)

;------ Back 5
*CSBack5.animation=classGenerateAnimation(2,"image/hand_chopstick_back5_",6,#H2H_ANIMATIONTYPE_NBACK,"Back 5",0,*CSBack5Raw,8,#H2H_DAMAGETYPE_BLUNT,5)
animationUngrounded(*CSBack5)
setFrameLength(*CSBack5,2,12)
setFrameCanDoNext(*CSBack5,2,6)
setFrameMovement(*CSBack5,0,75,-10)
setFrameMovement(*CSBack5,1,-75,-10)
setFrameMovement(*CSBack5,2,0,-10)
enableFrameMovementDeltaNeedCatch(*CSBack5,2)
setFrameMovementDelta(*CSBack5,2,33)

*CSBack5_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back5_2WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 5 2 wind front",0,*CSBack5_2WindFrontRaw)
setFrameLength(*CSBack5_2WindFront,1,4)
setFrameLength(*CSBack5_2WindFront,2,5)

*CSBack5_1WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back5_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 5 1 wind back",0,*CSBack5_1WindBackRaw)
setFrameLength(*CSBack5_1WindBack,1,5)
*CSBack5_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back5_2WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 5 2 wind back",0,*CSBack5_2WindBackRaw)
setFrameLength(*CSBack5_2WindBack,1,5)

animationPrepareWind(*CSBack5,0)
*CSBack5\frontWind(1,0)=*CSBack5_2WindFront
*CSBack5\backWind(0,0)=*CSBack5_1WindBack
*CSBack5\backWind(1,0)=*CSBack5_2WindBack
animationFreeMovementWind(*CSBack5)
animationGetSide(*CSBack5)=*CSSide9

;------ Down 1
*CSDown1.animation=classGenerateAnimation(6,"image/hand_chopstick_down1_",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*CSDown1Raw,1,#H2H_DAMAGETYPE_BLUNT,6)
; animationUngrounded(*CSDown1)
setFrameMovement(*CSDown1,0,20)
setFrameMovement(*CSDown1,1,-100,-100)
setFrameMovement(*CSDown1,2,-297,-265)
setFrameMovement(*CSDown1,3,-50,-50)
setFrameMovement(*CSDown1,4,-25,-12)
setFrameMovement(*CSDown1,5,-25)
setFrameMovement(*CSDown1,6,-1,-25)
setFrameLength(*CSDown1,0,3)
setFrameLength(*CSDown1,3,4)
setFrameLength(*CSDown1,4,4)
setFrameLength(*CSDown1,5,4)
setFrameLength(*CSDown1,6,12)
setFrameCanDoNext(*CSDown1,6,6)
setFrameDamageDuration(*CSDown1,6,5)
setFrameSound(*CSDown1,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*CSDown1,2,#H2H_SOUND_ID_CHOPSTICK_NDOWN)
setFrameSound(*CSDown1,3,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*CSDown1,5,#H2H_SOUND_ID_SWISHLIGHT)
enableFrameDamageCut(*CSDown1,2)
enableFrameDamageCut(*CSDown1,5)
setFrameDamageType(*CSDown1,1,#H2H_DAMAGETYPE_PIERCE)

*CSDown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_down1_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*CSDown1_2WindFrontRaw)
*CSDown1_3WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*CSDown1_3WindFrontRaw)
frameShiftShift(*CSDown1_3WindFront,0,297,265)
frameShiftShift(*CSDown1_3WindFront,1,297,265)
frameShiftShift(*CSDown1_3WindFront,2,297,265)
frameShiftShift(*CSDown1_3WindFront,3,297,265)
setFrameLength(*CSDown1_3WindFront,1,4)
setFrameLength(*CSDown1_3WindFront,2,5)
setFrameLength(*CSDown1_3WindFront,3,6)
*CSDown1_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind front",0,*CSDown1_5WindFrontRaw)
*CSDown1_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_6WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind front",0,*CSDown1_6WindFrontRaw)
*CSDown1_7WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_7WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 7 wind front",0,*CSDown1_7WindFrontRaw)
setFrameLength(*CSDown1_7WindFront,1,4)
setFrameLength(*CSDown1_7WindFront,2,5)
setFrameLength(*CSDown1_7WindFront,3,6)

*CSDown1_1WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_down1_1WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind back",0,*CSDown1_1WindBackRaw)
*CSDown1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_2WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind back",0,*CSDown1_2WindBackRaw)
*CSDown1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_3WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind back",0,*CSDown1_3WindBackRaw)
*CSDown1_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_4WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 4 wind back",0,*CSDown1_4WindBackRaw)
*CSDown1_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_5WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind back",0,*CSDown1_5WindBackRaw)
*CSDown1_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_6WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind back",0,*CSDown1_6WindBackRaw)
*CSDown1_7WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_7WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 7 wind back",0,*CSDown1_7WindBackRaw)
setFrameLength(*CSDown1_7WindBack,1,4)
setFrameLength(*CSDown1_7WindBack,2,5)
setFrameLength(*CSDown1_7WindBack,3,6)

animationPrepareWind(*CSDown1,0)
*CSDown1\frontWind(1,0)=*CSDown1_2WindFront
*CSDown1\frontWind(2,0)=*CSDown1_3WindFront
*CSDown1\frontWind(4,0)=*CSDown1_5WindFront
*CSDown1\frontWind(5,0)=*CSDown1_6WindFront
*CSDown1\frontWind(6,0)=*CSDown1_7WindFront
*CSDown1\backWind(0,0)=*CSDown1_1WindBack
*CSDown1\backWind(1,0)=*CSDown1_2WindBack
*CSDown1\backWind(2,0)=*CSDown1_3WindBack
*CSDown1\backWind(3,0)=*CSDown1_4WindBack
*CSDown1\backWind(4,0)=*CSDown1_5WindBack
*CSDown1\backWind(5,0)=*CSDown1_6WindBack
*CSDown1\backWind(6,0)=*CSDown1_7WindBack

animationFreeMovementWind(*CSDown1)

;------ Down 2
*CSDown2.animation=classGenerateAnimation(1,"image/hand_chopstick_down2_",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*CSDown2Raw,8,#H2H_DAMAGETYPE_BLUNT,5)
animationUngrounded(*CSDown2)
setFrameMovement(*CSDown2,0,1)
setFrameSound(*CSDown2,1,#H2H_SOUND_ID_HAND_LAND)
ReDim *CSDown2\frames(5)
*CSDown2\frames(5)=*CSDown2\frames(1)
For i=1 To 4
	*CSDown2\frames(i)=AllocateStructure(frame)
	frameCopy(*CSDown2\frames(i),*CSDown2\frames(0),#True)
Next
; k.d=427.0/5
k.d=427.0/4.5
setFrameMovementDelta(*CSDown2,0,0,k/4)
setFrameMovementDelta(*CSDown2,1,0,k/2)
setFrameMovementDelta(*CSDown2,2,0,k)
setFrameMovementDelta(*CSDown2,3,0,k)
setFrameMovementDelta(*CSDown2,4,0,k)
setFrameLength(*CSDown2,0,4)
setFrameLength(*CSDown2,1,2)
setFrameLength(*CSDown2,2,1)
setFrameLength(*CSDown2,3,1)
setFrameLength(*CSDown2,4,1)
setFrameLength(*CSDown2,5,12)
setFrameCanDoNext(*CSDown2,5,6)

*CSDown2_1WindFront.animation=classGenerateAnimation(4,"image/hand_chopstick_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*CSDown2_1WindFrontRaw)
setFrameLength(*CSDown2_1WindFront,1,2)
setFrameLength(*CSDown2_1WindFront,2,1)
setFrameLength(*CSDown2_1WindFront,3,1)
setFrameLength(*CSDown2_1WindFront,4,1)
*CSDown2_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_down2_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*CSDown2_2WindFrontRaw)
animationFreeMovement(*CSDown2_2WindFront)
setFrameLength(*CSDown2_2WindFront,1,6)
setFrameLength(*CSDown2_2WindFront,2,7)

*CSDown2_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_down2_1WindBack",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind back",0,*CSDown2_1WindBackRaw)
setFrameLength(*CSDown2_1WindBack,1,3)
setFrameLength(*CSDown2_1WindBack,2,5)
animationFreeMovement(*CSDown2_1WindBack)

animationPrepareWind(*CSDown2,0)
*CSDown2\frontWind(0,0)=*CSDown2_1WindFront
*CSDown2\frontWind(5,0)=*CSDown2_2WindFront
*CSDown2\backWind(0,0)=*CSDown2_1WindBack
*CSDown2\backWind(1,0)=*CSDown2_1WindBack
*CSDown2\backWind(2,0)=*CSDown2_1WindBack
*CSDown2\backWind(3,0)=*CSDown2_1WindBack
*CSDown2\backWind(4,0)=*CSDown2_1WindBack

animationGetDown(*CSDown1)=*CSDown2
animationGetBack(*CSDown2)=*CSBack5

;------ heavy new
*chopstick_Heavy1.animation=classGenerateAnimation(5,"image/hand_chopstick_heavy1_",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*CSHeavy1Raw,60,#H2H_DAMAGETYPE_BLUNT,10)
setFrameMovement(*chopstick_Heavy1,0,50)
setFrameMovement(*chopstick_Heavy1,1,25)
setFrameMovement(*chopstick_Heavy1,2,-75)
setFrameMovement(*chopstick_Heavy1,3,-75)
setFrameMovement(*chopstick_Heavy1,4,-90)
setFrameMovement(*chopstick_Heavy1,5,-20)
setFrameSound(*chopstick_Heavy1,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*chopstick_Heavy1,3,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameLength(*chopstick_Heavy1,0,4)
setFrameLength(*chopstick_Heavy1,1,6)
setFrameLength(*chopstick_Heavy1,2,4)
setFrameLength(*chopstick_Heavy1,3,2)
setFrameLength(*chopstick_Heavy1,4,6)
setFrameLength(*chopstick_Heavy1,5,10)
setFramePush(*chopstick_Heavy1,2,-3)
setFramePush(*chopstick_Heavy1,3,-5)
setFramePush(*chopstick_Heavy1,4,-10)
setFrameStun(*chopstick_Heavy1,2,5)
setFrameStun(*chopstick_Heavy1,3,10)
setFrameStun(*chopstick_Heavy1,4,15)
setFrameCanDoNext(*chopstick_Heavy1,5)
animationGetNeutral(*chopstick_Heavy1)=*chopstick_Neutral2
; animationGetBack(*chopstick_Heavy1)=*chineseStaff_NBack3
animationGetBack(*chopstick_Heavy1)=*CSBack3
animationPrepareWind(*chopstick_Heavy1)

*chopstick_Heavy1_1WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_heavy1_1WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind back",0,*CSHeavy1_1WindBackRaw)
For i=1 To 3
	setFrameMovement(*chopstick_Heavy1_1WindBack,i,10)
Next
*chopstick_Heavy1_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy1_3WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind back",0,*CSHeavy1_3WindBackRaw)
*chopstick_Heavy1_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy1_5WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind back",0,*CSHeavy1_5WindBackRaw)

*chopstick_Heavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind front",0,*CSHeavy1_4WindFrontRaw)
*chopstick_Heavy1_5WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind front",0,*CSHeavy1_5WindFrontRaw)

*chopstick_Heavy1\frontWind(3,0)=*chopstick_Heavy1_4WindFront
*chopstick_Heavy1\frontWind(4,0)=*chopstick_Heavy1_5WindFront

*chopstick_Heavy1\backWind(0,0)=*chopstick_Heavy1_1WindBack
*chopstick_Heavy1\backWind(2,0)=*chopstick_Heavy1_3WindBack
*chopstick_Heavy1\backWind(4,0)=*chopstick_Heavy1_5WindBack

;------ heavy 2
*CSHeavy2.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*CSHeavy2Raw,20,#H2H_DAMAGETYPE_BLUNT,12)
setFrameMovement(*CSHeavy2,1,-122,-107)
setFrameMovement(*CSHeavy2,2,-98,114)
setFrameMovement(*CSHeavy2,3,30,37)
setFrameSound(*CSHeavy2,1,#H2H_SOUND_ID_SWISHMEDIUM)
ReDim *CSHeavy2\frames(5)
*CSHeavy2\frames(5)=frameDataGive()
frameCopy(*CSHeavy2\frames(5),*CSHeavy2\frames(3),#True)
setFrameSound(*CSHeavy2,3,#H2H_SOUND_ID_BALLPEN_FALL_1)
setFrameShake(*CSHeavy2,3,5)
setFrameCanDoNext(*CSHeavy2,5,3)
setFrameLength(*CSHeavy2,2,4)
setFrameLength(*CSHeavy2,3,4)
setFrameLength(*CSHeavy2,5,10)
setFrameMovement(*CSHeavy2,4,0,20)
setFrameMovement(*CSHeavy2,5,0,-20)
*CSHeavy2\frames(5)\hurtId=0
locationDestroy(*CSHeavy2\frames(5)\hurtShift)
animationSetUngrounded(*CSHeavy2,1)
*CSHeavy2\frames(5)\hurtShift=0
*CSHeavy2_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_heavy2_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*CSHeavy2_4WindFrontRaw)

*CSHeavy2_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_1WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 1 wind back",0,*CSHeavy2_1WindBackRaw)
*CSHeavy2_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_2WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind back",0,*CSHeavy2_2WindBackRaw)
*CSHeavy2_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_3WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind back",0,*CSHeavy2_3WindBackRaw)
*CSHeavy2_4WindBack.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy2_4WindBack",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind back",0,*CSHeavy2_4WindBackRaw)
setFrameLength(*CSHeavy2_4WindBack,1,4)
setFrameLength(*CSHeavy2_4WindBack,2,5)
setFrameLength(*CSHeavy2_4WindBack,3,6)
setFrameLength(*CSHeavy2_4WindBack,4,7)
setFrameMovement(*CSHeavy2_4WindBack,2,-40)
setFrameMovement(*CSHeavy2_4WindBack,3,-40)
setFrameMovement(*CSHeavy2_4WindBack,4,-40)

animationPrepareWind(*CSHeavy2)
*CSHeavy2\frontWind(3,0)=*CSHeavy2_4WindFront
*CSHeavy2\backWind(0,0)=*CSHeavy2_1WindBack
*CSHeavy2\backWind(1,0)=*CSHeavy2_2WindBack
*CSHeavy2\backWind(2,0)=*CSHeavy2_3WindBack
*CSHeavy2\backWind(3,0)=*CSHeavy2_4WindBack
animationFreeMovementWind(*CSHeavy2)

animationGetHeavy(*CSBack1)=*CSHeavy2
animationGetBack(*CSHeavy2)=*CSBack2


;------ heavy 3
*chopstick_Heavy3.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy3_",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3",0,*CSHeavy3Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
For i=1 To 4
	setFrameMovement(*chopstick_Heavy3,i,50)
	setFramePush(*chopstick_Heavy3,i,25)
	frameSetCatch(*chopstick_Heavy3\frames(i),1)
Next
setFramePush(*chopstick_Heavy3,1,75)
setFramePush(*chopstick_Heavy3,4,75)
setFrameGrab(*chopstick_Heavy3,1)
setFrameGrab(*chopstick_Heavy3,2)
setFrameGrab(*chopstick_Heavy3,3)
setFrameGrab(*chopstick_Heavy3,4)

setFrameSound(*chopstick_Heavy3,0,*chineseStaff_HeavyS\id)
animationGetHeavy(*chopstick_Heavy1)=*chopstick_Heavy3
animationGetSide(*chopstick_Heavy3)=*chopstick_side6
animationPrepareWind(*chopstick_Heavy3)

*chopstick_Heavy3_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_2WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 2 wind back",0,*CSheavy3_2WindBackRaw)
*chopstick_Heavy3_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_3WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 3 wind back",0,*CSheavy3_3WindBackRaw)

*chopstick_Heavy3_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_2WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 2 wind front",0,*CSheavy3_2WindFrontRaw)
*chopstick_Heavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 3 wind front",0,*CSheavy3_3WindFrontRaw)
*chopstick_Heavy3_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 4 wind front",0,*CSheavy3_4WindFrontRaw)
*chopstick_Heavy3_5WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy3_5WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 5 wind front",0,*CSheavy3_5WindFrontRaw)

setFrameMovement(*chopstick_Heavy3_5WindFront,0,10)
setFrameMovement(*chopstick_Heavy3_5WindFront,1,10)

*chopstick_Heavy3\frontWind(1,0)=*chopstick_Heavy3_2WindFront
*chopstick_Heavy3\frontWind(2,0)=*chopstick_Heavy3_3WindFront
*chopstick_Heavy3\frontWind(3,0)=*chopstick_Heavy3_4WindFront
*chopstick_Heavy3\frontWind(4,0)=*chopstick_Heavy3_5WindFront

*chopstick_Heavy3\backWind(1,0)=*chopstick_Heavy3_2WindBack
*chopstick_Heavy3\backWind(2,0)=*chopstick_Heavy3_3WindBack

;------ heavy 4
*chopstick_Heavy4.animation=classGenerateAnimation(10,"image/hand_chopstick_heavy4_",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4",0,*CSHeavy4Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
For i=0 To 4
	setFrameMovement(*chopstick_Heavy4,i,80-i*8)
	setFrameDamage(*chopstick_Heavy4,i,4)
	setFrameLength(*chopstick_Heavy4,i,4)
Next
setFrameSound(*chopstick_Heavy4,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*chopstick_Heavy4,4,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopstick_Heavy4,7,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*chopstick_Heavy4,8,#H2H_SOUND_ID_SWISHMEDIUM)
enableFrameDamageCut(*chopstick_Heavy4,4)
setFrameStun(*chopstick_Heavy4,7,10)
setFrameStun(*chopstick_Heavy4,8,10)
setFrameStun(*chopstick_Heavy4,9,10)
setFrameStun(*chopstick_Heavy4,10,10)
setFrameMovement(*chopstick_Heavy4,7,-50,-10)
setFrameMovement(*chopstick_Heavy4,8,-80,-10)
setFrameMovement(*chopstick_Heavy4,9,-80,-40)
setFrameMovement(*chopstick_Heavy4,10,-50,10)
setFrameLength(*chopstick_Heavy4,3,7)
setFrameLength(*chopstick_Heavy4,9,7)
setFrameLength(*chopstick_Heavy4,10,7)
; *chineseStaff_Neutral6\heavy=*chopstick_Heavy4
animationPrepareWind(*chopstick_Heavy4)
animationGetHeavy(*chopstick_Neutral6)=*chopstick_Heavy4

*chopstick_Heavy4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_2WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 2 wind back",0,*CSheavy4_2WindBackRaw)
*chopstick_Heavy4_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_3WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 3 wind back",0,*CSheavy4_3WindBackRaw)
*chopstick_Heavy4_4WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_4WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 4 wind back",0,*CSheavy4_4WindBackRaw)
frameSetFreeMovement(*chopstick_Heavy4_4WindBack\frames(1),#True)
*chopstick_Heavy4_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_5WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 5 wind back",0,*CSheavy4_5WindBackRaw)
*chopstick_Heavy4_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_6WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 6 wind back",0,*CSheavy4_6WindBackRaw)
*chopstick_Heavy4_7WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_7WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 7 wind back",0,*CSheavy4_7WindBackRaw)
frameSetFreeMovement(*chopstick_Heavy4_7WindBack\frames(1),#True)
*chopstick_Heavy4_9WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_9WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 9 wind back",0,*CSheavy4_9WindBackRaw)
*chopstick_Heavy4_10WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_10WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 10 wind back",0,*CSheavy4_10WindBackRaw)
frameSetFreeMovement(*chopstick_Heavy4_10WindBack\frames(1),#True)

*chopstick_Heavy4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_1WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 1 wind front",0,*CSheavy4_1WindFrontRaw)
*chopstick_Heavy4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_2WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 2 wind front",0,*CSheavy4_2WindFrontRaw)
*chopstick_Heavy4_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy4_3WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 3 wind front",0,*CSheavy4_3WindFrontRaw)
*chopstick_Heavy4_8WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_8WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 8 wind front",0,*CSheavy4_8WindFrontRaw)
*chopstick_Heavy4_9WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_9WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 9 wind front",0,*CSheavy4_9WindFrontRaw)
*chopstick_Heavy4_10WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_10WindFront",8,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 10 wind front",0,*CSheavy4_10WindFrontRaw)
frameSetFreeMovement(*chopstick_Heavy4_10WindFront\frames(1),#True)
setFrameMovement(*chopstick_Heavy4_10WindFront,1,30)
setFrameMovement(*chopstick_Heavy4_10WindFront,2,30)

*chopstick_Heavy4\backWind(1,0)=*chopstick_Heavy4_2WindBack
*chopstick_Heavy4\backWind(2,0)=*chopstick_Heavy4_3WindBack
*chopstick_Heavy4\backWind(4,0)=*chopstick_Heavy4_5WindBack
*chopstick_Heavy4\backWind(5,0)=*chopstick_Heavy4_6WindBack
*chopstick_Heavy4\backWind(6,0)=*chopstick_Heavy4_7WindBack
*chopstick_Heavy4\backWind(8,0)=*chopstick_Heavy4_9WindBack
*chopstick_Heavy4\backWind(9,0)=*chopstick_Heavy4_10WindBack

*chopstick_Heavy4\frontWind(0,0)=*chopstick_Heavy4_1WindFront
*chopstick_Heavy4\frontWind(1,0)=*chopstick_Heavy4_2WindFront
*chopstick_Heavy4\frontWind(2,0)=*chopstick_Heavy4_3WindFront
*chopstick_Heavy4\frontWind(3,0)=*chopstick_Heavy4_4WindFront
*chopstick_Heavy4\frontWind(7,0)=*chopstick_Heavy4_8WindFront
*chopstick_Heavy4\frontWind(8,0)=*chopstick_Heavy4_9WindFront
*chopstick_Heavy4\frontWind(9,0)=*chopstick_Heavy4_10WindFront

;------ hit new
*chopstick_Hit.animation=classGenerateAnimation(2,"image/hand_chopstick_hit",50,#H2H_ANIMATIONTYPE_HIT,"hit new",0,*CSHitNewRaw)
setFrameShadow(*chopstick_Hit,2,50,-100)

;------ death new
*chopstick_Death.animation=classGenerateAnimation(6,"image/hand_chopstick_death",7,#H2H_ANIMATIONTYPE_DEATH,"death new",0,*CSDeathNewRaw)
setFrameSound(*chopstick_Death,3,#H2H_SOUND_ID_BALLPEN_FALL_2)
setFrameShake(*chopstick_Death,3,2)
setFrameSound(*chopstick_Death,4,*bodyFallSound\id)
setFrameShake(*chopstick_Death,4,10)
setFrameSound(*chopstick_Death,5,#H2H_SOUND_ID_BALLPEN_FALL_3)
setFrameShake(*chopstick_Death,5,2)
setFrameSound(*chopstick_Death,6,*bodyFallSound\id)

setFrameLength(*chopstick_Death,1,10)
setFrameLength(*chopstick_Death,3,10)

animationPrepareWind(*chopstick_Death)
*chopstick_Death5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_death5windback",7,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind back",0,*CSDeath5WindBackRaw)

*chopstick_Death2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_death2WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind front",0,*CSDeath2WindFrontRaw)
*chopstick_Death3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_death3WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind front",0,*CSDeath3WindFrontRaw)
*chopstick_Death4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_death4WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind front",0,*CSDeath4WindFrontRaw)
*chopstick_Death6WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_death6WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front",0,*CSDeath6WindFrontRaw)

*chopstick_Death\backWind(4,0)=*chopstick_Death5WindBack

*chopstick_Death\frontWind(1,0)=*chopstick_Death2WindFront
*chopstick_Death\frontWind(2,0)=*chopstick_Death3WindFront
*chopstick_Death\frontWind(3,0)=*chopstick_Death4WindFront
*chopstick_Death\frontWind(5,0)=*chopstick_Death6WindFront

setFrameShadow(*chopstick_Death,1,50,-50)
setFrameShadow(*chopstick_Death,2,75,-75)
setFrameShadow(*chopstick_Death,3,125,-75)
setFrameShadow(*chopstick_Death,4,100,-25)
setFrameShadow(*chopstick_Death,5,50,50)
setFrameShadow(*chopstick_Death,6,0,50)

;------ spawn new
*chopstick_Spawn.animation=classGenerateAnimation(12,"image/hand_chopstick_spawn",5,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*CSSPawnNewRaw)

setFrameShake(*chopstick_Spawn,7,10)
setFrameSound(*chopstick_Spawn,7,*bodyFallSound\id)
setFrameSound(*chopstick_Spawn,10,*chineseStaff_HeavyS\id)
For i=0 To 5
	setFrameLength(*chopstick_Spawn,i,10)
Next
setFrameLength(*chopstick_Spawn,8,10)
setFrameLength(*chopstick_Spawn,9,8)
setFrameLength(*chopstick_Spawn,11,10)
setFrameLength(*chopstick_Spawn,12,8)
animationPrepareWind(*chopstick_Spawn)

*chopstick_Spawn4WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn4WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind front",0,*CSSpawn4WindFrontRaw)
*chopstick_Spawn5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn5WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind front",0,*CSSpawn5WindFrontRaw)
*chopstick_Spawn6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn6WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind front",0,*CSSpawn6WindFrontRaw)
*chopstick_Spawn7WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn7WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind front",0,*CSSpawn7WindFrontRaw)
*chopstick_Spawn8WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn8WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind front",0,*CSSpawn8WindFrontRaw)
*chopstick_Spawn9WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_spawn9WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind front",0,*CSSpawn9WindFrontRaw)
*chopstick_Spawn10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn10WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind front",0,*CSSpawn10WindFrontRaw)
*chopstick_Spawn11WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_spawn11WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind front",0,*CSSpawn11WindFrontRaw)

*chopstick_Spawn10WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn10WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind back",0,*CSSpawn10WindBackRaw)
*chopstick_Spawn11WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn11WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind back",0,*CSSpawn11WindBackRaw)
*chopstick_Spawn12WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn12WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind back",0,*CSSpawn12WindBackRaw)

*chopstick_Spawn\frontWind( 3,0)=*chopstick_Spawn4WindFront
*chopstick_Spawn\frontWind( 4,0)=*chopstick_Spawn5WindFront
*chopstick_Spawn\frontWind( 5,0)=*chopstick_Spawn6WindFront
*chopstick_Spawn\frontWind( 6,0)=*chopstick_Spawn7WindFront
*chopstick_Spawn\frontWind( 7,0)=*chopstick_Spawn8WindFront
*chopstick_Spawn\frontWind( 8,0)=*chopstick_Spawn9WindFront
*chopstick_Spawn\frontWind( 9,0)=*chopstick_Spawn10WindFront
*chopstick_Spawn\frontWind(10,0)=*chopstick_Spawn11WindFront

*chopstick_Spawn\backWind(9 ,0)=*chopstick_Spawn10WindBack
*chopstick_Spawn\backWind(10,0)=*chopstick_Spawn11WindBack
*chopstick_Spawn\backWind(11,0)=*chopstick_Spawn12WindBack

setFrameShadow(*chopstick_Spawn, 0,0,-200)
setFrameShadow(*chopstick_Spawn, 1,-5,-200)
setFrameShadow(*chopstick_Spawn, 2,0,-200)
setFrameShadow(*chopstick_Spawn, 3,10,-200)
setFrameShadow(*chopstick_Spawn, 4,20,-175)
setFrameShadow(*chopstick_Spawn, 5,20,-170)
setFrameShadow(*chopstick_Spawn, 6,75,-100)
setFrameShadow(*chopstick_Spawn, 7,92,-50)
setFrameShadow(*chopstick_Spawn, 8,100,-25)
setFrameShadow(*chopstick_Spawn, 9,50)
setFrameShadow(*chopstick_Spawn,10,25)

;------ jump new
*chopstick_Jump.animation=classGenerateAnimation(5,"image/hand_chopstick_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump new",0,*CSJumpNewRaw)

;------ land new
*chopstick_Land.animation=classGenerateAnimation(2,"image/hand_chopstick_land",3,#H2H_ANIMATIONTYPE_LAND,"land new",0,*CSLandNewRaw)
frameShiftShift(*chopstick_Land,0,0,50)
frameShiftShift(*chopstick_Land,1,0,50)
frameShiftShift(*chopstick_Land,2,0,25)
setFrameLength(*chopstick_Land,0,6)
setFrameShadow(*chopstick_Land,0,0,200)
setFrameShadow(*chopstick_Land,1,1,100)
setFrameShadow(*chopstick_Land,2,2,50)

;------ Dodge
*CSDodge.animation=classGenerateAnimation(3,"image/hand_chopstick_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*CSDodgeRaw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameLength(*CSDodge,0,2)
setFrameLength(*CSDodge,1,2)
setFrameLength(*CSDodge,2,2)
;--------- Chopstick
*chineseStaff_stat.statistic=statisticCreate(0,1,4,4,0,0,1,-1,3,3,4,6)
ReDim *tmpArray(2)
*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*tmpArray(2)=*crack_hitS
*chopStick_stance_metal.stance=stanceCreate(*tmpArray(),0,"Metal")
*chopStick_stance_metal\specialcolor=#H2H_STANCE_COLOR_METAL
*chopStick_stance_metal\alternatecolor=#H2H_STANCE_COLOR_LIGHTMETAL
statisticCreate(*chopStick_stance_metal\modificator,0,-1,0,1,0,0,0,0,0,0)

*tmpArray(0)=*plastic_hit
*chopStick_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
statisticCreate(*chopStick_stance_plastic\modificator,0,0,0,0,0,0,0,1,-1,0)

*chineseStaff.class=classCreate(0,"Chopstick", *chopstick_Idle1, *chopstick_moveFront, *chopstick_moveBack, *CSNeutral1,*chopStick_side1,*chopstick_up1,*CSBack1,*CSDown1,*chopstick_Heavy1)

classGetDeath(*chineseStaff)=*chopstick_Death
classGetSpawn(*chineseStaff)=*chopstick_Spawn
classGetJump(*chineseStaff)=*chopstick_Jump
classGetLand(*chineseStaff)=*chopstick_Land
classGetHit(*chineseStaff)=*chopstick_Hit
classGetDodge(*chineseStaff)=*CSDodge

classAddStance(*chineseStaff,*chopStick_stance_metal)
classAddStance(*chineseStaff,*chopStick_stance_plastic)

*chineseStaff\allStances(0)\name="Wood (default)"
*chineseStaff\allStances(0)\specialcolor=#H2H_STANCE_COLOR_WOOD
*chineseStaff\allStances(0)\alternatecolor=#H2H_STANCE_COLOR_LIGHTWOOD
*chineseStaff\allStances(0)\alternateTransparency=96
Dim *chineseStaff\allStances(0)\materialClass(2)
*chineseStaff\allStances(0)\materialClass(0)=*wood_hit
*chineseStaff\allStances(0)\materialClass(1)=*finger_hit
*chineseStaff\allStances(0)\materialClass(2)=*crack_hitS
*chineseStaff\iconPath$="image\Chopstick.png"

*chineseStaff\stat=*chineseStaff_stat

*chineseStaff\desc$="Very balanced long ranged fighter. Its long reach makes it excellent to keep the distance,\coupled with very good agility. The defense would be on maintaining pressure\than taking hits, as it lacks of any flesh to absorb attacks."
; Dim *chineseStaff\hitFrames(2)
; For i=0 To 2
; 	*chineseStaff\hitFrames(i)=*chopstick_Hit\frames(i)
; Next

Dim *chineseStaff\otherIdle(1)
*chineseStaff\otherIdle(0)=*chopstick_Idle2
*chineseStaff\otherIdle(1)=*chopstick_Idle3
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 169
; FirstLine = 142
; EnableXP
; CPU = 1
; DisableDebugger