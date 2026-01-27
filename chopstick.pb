;------ Chopstick

;------- Idle 1
*CSIdle1.animation=classGenerateAnimation(7,"image/hand_chopstick_idle1_",8,#H2H_ANIMATIONTYPE_IDLE,"idle 1",1,*CSidle1Raw)
animationShiftShift(*CSIdle1,1,5)
animationShiftShift(*CSIdle1,2,10,5)
animationShiftShift(*CSIdle1,3,15,10)
animationShiftShift(*CSIdle1,4,10,5)
animationShiftShift(*CSIdle1,5,5)
animationShiftShift(*CSIdle1,6,0,-5)
animationShiftShift(*CSIdle1,7,-5)

*CSIdle1_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle1_2WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 wind back",0,*CSIdle1_2WindBackRaw)
animationSetFrameLength(*CSIdle1_2WindBack,1,8)
animationSetFrameOpacity(*CSIdle1_2WindBack,0,128)
animationSetFrameOpacity(*CSIdle1_2WindBack,1,64)
*CSIdle1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_idle1_3WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 1 3 wind back",0,*CSIdle1_3WindBackRaw)
animationSetFrameOpacity(*CSIdle1_3WindBack,0,128)
*CSIdle1_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle1_4WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 wind back",0,*CSIdle1_4WindBackRaw)
animationSetFrameLength(*CSIdle1_4WindBack,1,8)
animationSetFrameOpacity(*CSIdle1_4WindBack,0,128)
animationSetFrameOpacity(*CSIdle1_4WindBack,1,64)
*CSIdle1_7WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle1_7WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 7 wind back",0,*CSIdle1_7WindBackRaw)
animationSetFrameLength(*CSIdle1_7WindBack,1,8)
animationSetFrameOpacity(*CSIdle1_7WindBack,0,128)
animationSetFrameOpacity(*CSIdle1_7WindBack,1,64)
*CSIdle1_8WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_idle1_8WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 wind front",0,*CSIdle1_8WindFrontRaw)
animationSetFrameLength(*CSIdle1_8WindFront,1,8)
animationSetFrameOpacity(*CSIdle1_8WindFront,0,128)
animationSetFrameOpacity(*CSIdle1_8WindFront,1,64)

animationPrepareWind(*CSIdle1)
*CSIdle1\backWind(1,0)=*CSIdle1_2WindBack
*CSIdle1\backWind(2,0)=*CSIdle1_3WindBack
*CSIdle1\backWind(3,0)=*CSIdle1_4WindBack
*CSIdle1\backWind(6,0)=*CSIdle1_7WindBack

*CSIdle1\frontWind(7,0)=*CSIdle1_8WindFront

animationFreeMovementWind(*CSIdle1)

;------- Idle 2
*CSIdle2.animation=classGenerateAnimation(5,"image/hand_chopstick_idle2_",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*CSidle2Raw)

animationShiftShift(*CSIdle2,1,5)
animationShiftShift(*CSIdle2,2,5,5)
animationShiftShift(*CSIdle2,3,10,5)
animationShiftShift(*CSIdle2,4,10)
animationShiftShift(*CSIdle2,5,5)

*CSIdle2_1WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle2_1WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 1 wind back",0,*CSidle2_1WindBackRaw)
animationSetFrameLength(*CSIdle2_1WindBack,1,8)
animationSetFrameOpacity(*CSIdle2_1WindBack,0,128)
animationSetFrameOpacity(*CSIdle2_1WindBack,1,64)
*CSIdle2_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_idle2_2WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind back",0,*CSidle2_2WindBackRaw)
animationSetFrameOpacity(*CSIdle2_2WindBack,0,128)
*CSIdle2_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle2_3WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind back",0,*CSidle2_3WindBackRaw)
animationSetFrameLength(*CSIdle2_3WindBack,1,8)
animationSetFrameOpacity(*CSIdle2_3WindBack,0,128)
animationSetFrameOpacity(*CSIdle2_3WindBack,1,64)
*CSIdle2_6WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle2_6WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind back",0,*CSidle2_6WindBackRaw)
animationSetFrameLength(*CSIdle2_6WindBack,1,8)
animationSetFrameOpacity(*CSIdle2_6WindBack,0,128)
animationSetFrameOpacity(*CSIdle2_6WindBack,1,64)

*CSIdle2_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_idle2_2WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind front",0,*CSidle2_2WindFrontRaw)
animationSetFrameOpacity(*CSIdle2_2WindFront,0,128)
*CSIdle2_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_idle2_3WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind front",0,*CSidle2_3WindFrontRaw)
animationSetFrameLength(*CSIdle2_3WindFront,1,8)
animationSetFrameOpacity(*CSIdle2_3WindFront,0,128)
animationSetFrameOpacity(*CSIdle2_3WindFront,1,64)
*CSIdle2_5WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_idle2_5WindFront",7,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*CSidle2_5WindFrontRaw)
animationSetFrameLength(*CSIdle2_5WindFront,1,8)
animationSetFrameOpacity(*CSIdle2_5WindFront,0,128)
animationSetFrameOpacity(*CSIdle2_5WindFront,1,64)

animationPrepareWind(*CSIdle2)

*CSIdle2\backWind(0,0)=*CSIdle2_1WindBack
*CSIdle2\backWind(1,0)=*CSIdle2_2WindBack
*CSIdle2\backWind(2,0)=*CSIdle2_3WindBack
*CSIdle2\backWind(5,0)=*CSIdle2_6WindBack

*CSIdle2\frontWind(1,0)=*CSIdle2_2WindFront
*CSIdle2\frontWind(2,0)=*CSIdle2_3WindFront
*CSIdle2\frontWind(4,0)=*CSIdle2_5WindFront

animationFreeMovementWind(*CSIdle2)

;------- Idle 3
*CSIdle3.animation=classGenerateAnimation(4,"image/hand_chopstick_idle3_",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3",1,*CSidle3Raw)
animationSetFrameLength(*CSIdle3,2,25)
*CSIdle3_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_1WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 1 wind back",0,*CSIdle3_1WindBackRaw)
animationSetFrameOpacity(*CSIdle3_1WindBack,0,128)
*CSIdle3_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_2WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind back",0,*CSIdle3_2WindBackRaw)
animationSetFrameOpacity(*CSIdle3_2WindBack,0,128)
*CSIdle3_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_idle3_3WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind back",0,*CSIdle3_3WindBackRaw)
animationSetFrameLength(*CSIdle3_3WindBack,1,8)
animationSetFrameOpacity(*CSIdle3_3WindBack,0,128)
animationSetFrameOpacity(*CSIdle3_3WindBack,1,64)

*CSIdle3_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_1WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 1 wind front",0,*CSIdle3_1WindFrontRaw)
animationSetFrameOpacity(*CSIdle3_1WindFront,0,128)
*CSIdle3_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_2WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind front",0,*CSIdle3_2WindFrontRaw)
animationSetFrameOpacity(*CSIdle3_2WindFront,0,128)
*CSIdle3_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_3WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind front",0,*CSIdle3_3WindFrontRaw)
animationSetFrameOpacity(*CSIdle3_3WindFront,0,128)
*CSIdle3_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_idle3_4WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind front",0,*CSIdle3_4WindFrontRaw)
animationSetFrameOpacity(*CSIdle3_4WindFront,0,128)
*CSIdle3_5WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_idle3_5WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind front",0,*CSIdle3_5WindFrontRaw)
animationSetFrameLength(*CSIdle3_5WindFront,1,8)
animationSetFrameOpacity(*CSIdle3_5WindFront,0,128)
animationSetFrameOpacity(*CSIdle3_5WindFront,1,64)

animationPrepareWind(*CSIdle3)

*CSIdle3\backWind(0,0)=*CSIdle3_1WindBack
*CSIdle3\backWind(1,0)=*CSIdle3_2WindBack
*CSIdle3\backWind(2,0)=*CSIdle3_3WindBack

*CSIdle3\frontWind(0,0)=*CSIdle3_1WindFront
*CSIdle3\frontWind(1,0)=*CSIdle3_2WindFront
*CSIdle3\frontWind(2,0)=*CSIdle3_3WindFront
*CSIdle3\frontWind(3,0)=*CSIdle3_4WindFront
*CSIdle3\frontWind(4,0)=*CSIdle3_5WindFront

animationFreeMovementWind(*CSIdle3)

animationSetFrameShadow(*CSIdle3,0,-5)
animationSetFrameShadow(*CSIdle3,0,-10)
animationSetFrameShadow(*CSIdle3,0,-15)
animationSetFrameShadow(*CSIdle3,4,-10)

;------- Move Front
*CSMoveFront.animation=classGenerateAnimation(8,"image/hand_chopstick_move_front1_",5,#H2H_ANIMATIONTYPE_FRONT,"move front",1,*CSMoveFrontRaw)
animationShiftShift(*CSMoveFront,1,-5)
animationShiftShift(*CSMoveFront,2,-10)
animationShiftShift(*CSMoveFront,3,-15)
animationShiftShift(*CSMoveFront,4,-10)
animationShiftShift(*CSMoveFront,5,-5,-5)
animationShiftShift(*CSMoveFront,6,0,-10)
animationShiftShift(*CSMoveFront,7,0,-5)

;------- Move Back
*CSMoveBack.animation=classGenerateAnimation(6,"image/hand_chopstick_move_back1_",6,#H2H_ANIMATIONTYPE_BACK,"move back",1,*CSMoveBackRaw)
animationSetFrameLength(*CSMoveBack,0,8)

animationShiftShift(*CSMoveBack,1,5)
animationShiftShift(*CSMoveBack,2,10)
animationShiftShift(*CSMoveBack,3,15)
animationShiftShift(*CSMoveBack,4,10,5)
animationShiftShift(*CSMoveBack,5,5,10)
animationShiftShift(*CSMoveBack,6,0,5)

;------ Neutral 3
*CSNeutral3.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*CSNeutral3Raw,8,#H2H_DAMAGETYPE_PIERCE,3)
ReDim *CSNeutral3\frames(3)
*CSNeutral3\frames(3)=frameDataGive()
frameCopy(*CSNeutral3\frames(3),*CSNeutral3\frames(2),#True)
animationSetFrameCDN(*CSNeutral3,3,1)
animationSetFrameSound(*CSNeutral3,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameMovement(*CSNeutral3,0,30,60)
animationSetFrameMovement(*CSNeutral3,1,30,40)
animationSetFrameMovementDelta(*CSNeutral3,1,30)
animationSetFrameMovementDelta(*CSNeutral3,2,30)
animationSetFrameMovementDelta(*CSNeutral3,3,5)
animationSetFrameWindNeedCatch(*CSNeutral3,2)
animationSetFrameMovementDeltaNeedCatch(*CSNeutral3,1)
animationSetFrameMovementDeltaNeedCatch(*CSNeutral3,2)
animationSetFrameMovementDeltaNeedCatch(*CSNeutral3,3)

*CSNeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_2WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*CSNeutral3_2WindFrontRaw)
animationSetFrameLength(*CSNeutral3_2WindFront,1,6)
animationSetFrameLength(*CSNeutral3_2WindFront,2,7)
animationSetFrameOpacity(*CSNeutral3_2WindFront,1,192)
animationSetFrameOpacity(*CSNeutral3_2WindFront,2,128)
*CSNeutral3_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_3WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 3 wind front",0,*CSNeutral3_3WindFrontRaw)
animationSetFrameLength(*CSNeutral3_3WindFront,1,6)
animationSetFrameLength(*CSNeutral3_3WindFront,2,7)
animationSetFrameOpacity(*CSNeutral3_3WindFront,1,192)
animationSetFrameOpacity(*CSNeutral3_3WindFront,2,128)
*CSNeutral3_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral3_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind back",0,*CSNeutral3_1WindBackRaw)
animationSetFrameLength(*CSNeutral3_1WindBack,1,5)
animationSetFrameOpacity(*CSNeutral3_1WindBack,1,192)
*CSNeutral3_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral3_2WindBack",8,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind back",0,*CSNeutral3_2WindBackRaw)
animationSetFrameLength(*CSNeutral3_2WindBack,1,9)
animationSetFrameOpacity(*CSNeutral3_2WindBack,1,192)
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
animationSetFrameMovementDelta(*CSNeutral4,1,5)
animationSetFrameMovement(*CSNeutral4,1,-10)
animationSetFrameMovementDelta(*CSNeutral4,2,30)
animationSetFrameMovementDelta(*CSNeutral4,3,30)
animationSetFrameMovementDelta(*CSNeutral4,4,5)
animationSetFrameSound(*CSNeutral4,1,#H2H_SOUND_ID_SWISHLIGHT)
For i=1 To 4
	animationSetFrameWindNeedCatch(*CSNeutral4,i)
	animationSetFrameMovementDeltaNeedCatch(*CSNeutral4,i)
Next
animationSetFrameLength(*CSNeutral4,1,4)
animationSetFrameLength(*CSNeutral4,2,4)
animationSetFrameCDN(*CSNeutral4,4,1)
animationGetNeutral(*CSNeutral3)=*CSNeutral4

*CSNeutral4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral4_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind front",0,*CSNeutral4_2WindFrontRaw)
*CSNeutral4_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral4_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind front",0,*CSNeutral4_3WindFrontRaw)
animationFreeMovement(*CSNeutral4_2WindFront)
animationFreeMovement(*CSNeutral4_3WindFront)
animationSetFrameLength(*CSNeutral4_3WindFront,1,5)
animationSetFrameLength(*CSNeutral4_3WindFront,2,6)
animationSetFrameOpacity(*CSNeutral4_3WindFront,1,192)
animationSetFrameOpacity(*CSNeutral4_3WindFront,2,128)

*CSNeutral4_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral4_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 1 wind back",0,*CSNeutral4_1WindBackRaw)
animationSetFrameLength(*CSNeutral4_1WindBack,1,6)
animationSetFrameLength(*CSNeutral4_1WindBack,2,7)
animationSetFrameOpacity(*CSNeutral4_1WindBack,1,192)
animationSetFrameOpacity(*CSNeutral4_1WindBack,2,128)
*CSNeutral4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral4_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind back",0,*CSNeutral4_2WindBackRaw)
*CSNeutral4_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral4_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind back",0,*CSNeutral4_3WindBackRaw)
animationSetFrameLength(*CSNeutral4_3WindBack,1,7)
animationSetFrameOpacity(*CSNeutral4_3WindBack,1,192)
*CSNeutral4_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral4_4WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 4 wind back",0,*CSNeutral4_4WindBackRaw)
animationFreeMovement(*CSNeutral4_1WindBack)
animationFreeMovement(*CSNeutral4_2WindBack)
animationFreeMovement(*CSNeutral4_3WindBack)
animationSetFrameLength(*CSNeutral4_4WindBack,1,7)

animationPrepareWind(*CSNeutral4,0)
*CSNeutral4\frontWind(1,0)=*CSNeutral4_2WindFront
*CSNeutral4\frontWind(2,0)=*CSNeutral4_3WindFront
*CSNeutral4\backWind(0,0)=*CSNeutral4_1WindBack
*CSNeutral4\backWind(1,0)=*CSNeutral4_2WindBack
*CSNeutral4\backWind(2,0)=*CSNeutral4_3WindBack
*CSNeutral4\backWind(3,0)=*CSNeutral4_4WindBack

;------ Neutral 5
*CSNeutral5.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral5_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5",0,*CSNeutral5Raw,8,#H2H_DAMAGETYPE_PIERCE,3)
animationSetFrameMovementDelta(*CSNeutral5,1,28)
animationSetFrameMovementDeltaNeedCatch(*CSNeutral5,1)
animationSetFrameMovementDelta(*CSNeutral5,2,28)
animationSetFrameMovementDeltaNeedCatch(*CSNeutral5,2)
animationSetFrameWindNeedCatch(*CSNeutral5,2)
animationSetFrameSound(*CSNeutral5,1,#H2H_SOUND_ID_SWISHLIGHT)

*CSNeutral5_1WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral5_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind front",0,*CSNeutral5_1WindFrontRaw)
animationSetFrameLength(*CSNeutral5_1WindFront,1,4)
animationSetFrameOpacity(*CSNeutral5_1WindFront,1,192)
animationFreeMovementWind(*CSNeutral5_1WindFront)
*CSNeutral5_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral5_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind front",0,*CSNeutral5_2WindFrontRaw)
animationFreeMovementWind(*CSNeutral5_2WindFront)
animationSetFrameLength(*CSNeutral5_2WindFront,1,4)
animationSetFrameLength(*CSNeutral5_2WindFront,2,5)
animationSetFrameOpacity(*CSNeutral5_2WindFront,1,192)
animationSetFrameOpacity(*CSNeutral5_2WindFront,2,128)
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
animationSetFrameCDN(*CSNeutral1,3,7)
animationSetFrameLength(*CSNeutral1,0,4)
animationSetFrameLength(*CSNeutral1,1,9)
animationSetFrameLength(*CSNeutral1,3,50)
animationSetFrameDamageDuration(*CSNeutral1,1,5)
animationSetFrameDamageDuration(*CSNeutral1,3,4)
animationSetFrameDamageCut(*CSNeutral1,2)
animationSetFrameNeedCatch(*CSNeutral1,2)
animationSetFrameNeedCatch(*CSNeutral1,3)
animationSetFrameMovement(*CSNeutral1,0,35)
animationSetFrameMovement(*CSNeutral1,1,-35,50)
animationSetFrameMovement(*CSNeutral1,2,-35,-50)
animationSetFrameMovement(*CSNeutral1,3,-70,-100)
animationSetFrameStun(*CSNeutral1,2,20)
animationSetFrameStun(*CSNeutral1,3,20)
*CSNeutral1\frames(1)\damageSide=0
animationSetFrameSound(*CSNeutral1,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSNeutral1,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetUngrounded(*CSNeutral1)
animationSetFrameCanMove(*CSNeutral1,3,5)

*CSNeutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind front",0,*CSNeutral1_1WindFrontRaw)
*CSNeutral1_2WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral1_2WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*CSNeutral1_2WindFrontRaw)
animationSetFrameLength(*CSNeutral1_2WindFront,1,8)
animationSetFrameOpacity(*CSNeutral1_2WindFront,1,192)
*CSNeutral1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral1_3WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind front",0,*CSNeutral1_3WindFrontRaw)
*CSNeutral1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral1_4WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*CSNeutral1_4WindFrontRaw)
animationSetFrameLength(*CSNeutral1_4WindFront,1,7)
animationSetFrameLength(*CSNeutral1_4WindFront,2,8)
animationSetFrameOpacity(*CSNeutral1_4WindFront,1,192)
animationSetFrameOpacity(*CSNeutral1_4WindFront,2,128)
*CSNeutral1_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_neutral1_2WindBack",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind back",0,*CSNeutral1_2WindBackRaw)
animationSetFrameLength(*CSNeutral1_2WindBack,1,7)
animationSetFrameOpacity(*CSNeutral1_2WindBack,1,192)

animationPrepareWind(*CSNeutral1,0)
*CSNeutral1\frontWind(0,0)=*CSNeutral1_1WindFront
*CSNeutral1\frontWind(1,0)=*CSNeutral1_2WindFront
*CSNeutral1\frontWind(2,0)=*CSNeutral1_3WindFront
*CSNeutral1\frontWind(3,0)=*CSNeutral1_4WindFront
*CSNeutral1\backWind(1,0)=*CSNeutral1_2WindBack
animationFreeMovementWind(*CSNeutral1)
animationGetNeutral(*CSNeutral1)=*CSNeutral3

;------ Neutral 2
*CSNeutral2.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral2_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*CSNeutral2Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameSound(*CSNeutral2,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameMovement(*CSNeutral2,0,-30)
animationSetFrameMovement(*CSNeutral2,1,-30)
animationSetFrameMovement(*CSNeutral2,2,-20)
animationSetFrameLength(*CSNeutral2,2,5)
*CSNeutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral2_1WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 1 wind front",0,*CSNeutral2_1WindFrontRaw)
*CSNeutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral2_2WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 2 wind front",0,*CSNeutral2_2WindFrontRaw)
*CSNeutral2_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral2_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 3 wind front",0,*CSNeutral2_3WindFrontRaw)
animationSetFrameLength(*CSNeutral2_3WindFront,1,5)
animationSetFrameLength(*CSNeutral2_3WindFront,2,6)
animationSetFrameOpacity(*CSNeutral2_3WindFront,1,192)
animationSetFrameOpacity(*CSNeutral2_3WindFront,2,128)
frameSetFreeMovement(*CSNeutral2_3WindFront\frames(1),#True)
animationPrepareWind(*CSNeutral2)

*CSNeutral2\frontWind(0,0)=*CSNeutral2_1WindFront
*CSNeutral2\frontWind(1,0)=*CSNeutral2_2WindFront
*CSNeutral2\frontWind(2,0)=*CSNeutral2_3WindFront

;------ Side 3
*CSSide3.animation=classGenerateAnimation(4,"image/hand_chopstick_side3_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3",0,*CSSide3Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
animationSetFrameSound(*CSSide3,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide3,3,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide3,4,#H2H_SOUND_ID_BALLPEN_FALL_1)
animationSetFrameDamageCut(*CSSide3,2)
animationSetComboEnd(*CSSide3,1)
animationSetFrameCDN(*CSSide3,4,5)
animationSetFrameDamageDuration(*CSSide3,4,5)
animationSetFrameLength(*CSSide3,2,3) ; 11
animationSetFrameLength(*CSSide3,3,3) ; 14
animationSetFrameLength(*CSSide3,4,10) ; 24
animationSetFrameMovement(*CSSide3,0,30)
animationSetFrameMovement(*CSSide3,1,20)
animationSetFrameMovement(*CSSide3,2,0,5)
animationSetFrameMovement(*CSSide3,3,-20,10)
animationSetFrameMovement(*CSSide3,4,-30,10)

animationPrepareWind(*CSSide3)

*CSSide3_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind front",0,*CSSide3_1WindFrontRaw)
*CSSide3_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind front",0,*CSSide3_2WindFrontRaw)
*CSSide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind front",0,*CSSide3_3WindFrontRaw)
*CSSide3_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind front",0,*CSSide3_4WindFrontRaw)
*CSSide3_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side3_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind front",0,*CSSide3_5WindFrontRaw)
animationSetFrameMovement(*CSSide3_5WindFront,1,-70)
animationSetFrameMovement(*CSSide3_5WindFront,2,-50)
animationSetFrameMovement(*CSSide3_5WindFront,3,-20)
animationSetFrameLength(*CSSide3_5WindFront,0,3)
animationSetFrameLength(*CSSide3_5WindFront,2,5)
animationSetFrameLength(*CSSide3_5WindFront,3,6)
animationSetFrameOpacity(*CSSide3_5WindFront,1,192)
animationSetFrameOpacity(*CSSide3_5WindFront,2,128)
animationSetFrameOpacity(*CSSide3_5WindFront,3,64)
animationFreeMovement(*CSSide3_5WindFront)

*CSSide3_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind back",0,*CSSide3_1WindBackRaw)
*CSSide3_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind back",0,*CSSide3_2WindBackRaw)
*CSSide3_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_3WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind back",0,*CSSide3_3WindBackRaw)
*CSSide3_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side3_4WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind back",0,*CSSide3_4WindBackRaw)
*CSSide3_5WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side3_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind back",0,*CSSide3_5WindBackRaw)
animationSetFrameLength(*CSSide3_5WindBack,0,3)
animationSetFrameOpacity(*CSSide3_5WindBack,1,192)
animationFreeMovement(*CSSide3_5WindBack)

*CSSide3\frontWind(0,0)=*CSSide3_1WindFront
*CSSide3\frontWind(1,0)=*CSSide3_2WindFront
*CSSide3\frontWind(2,0)=*CSSide3_3WindFront
*CSSide3\frontWind(3,0)=*CSSide3_4WindFront
*CSSide3\frontWind(4,0)=*CSSide3_5WindFront

*CSSide3\backWind(0,0)=*CSSide3_1WindBack
*CSSide3\backWind(1,0)=*CSSide3_2WindBack
*CSSide3\backWind(2,0)=*CSSide3_3WindBack
*CSSide3\backWind(3,0)=*CSSide3_4WindBack
*CSSide3\backWind(4,0)=*CSSide3_5WindBack

;------ Side 2
*CSSide2.animation=classGenerateAnimation(4,"image/hand_chopstick_side2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*CSSide2Raw,20,#H2H_DAMAGETYPE_PIERCE,7)
animationSetFrameSound(*CSSide2,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide2,2,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameLength(*CSSide2,1,6)
animationSetFrameLength(*CSSide2,4,20)
animationSetFrameCDN(*CSSide2,4,5)
animationSetFrameDamageType(*CSSide2,0,#H2H_DAMAGETYPE_BLUNT)
animationSetFrameDamageType(*CSSide2,1,#H2H_DAMAGETYPE_BLUNT)
animationSetFrameDamageDuration(*CSSide2,4,4)
animationSetFrameMovement(*CSSide2,0,84,22)
animationSetFrameMovement(*CSSide2,1,120,25)
animationSetFrameMovement(*CSSide2,2,-110,-25)
animationSetFrameMovement(*CSSide2,3,-90,-22)

animationPrepareWind(*CSSide2)
*CSSide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind front",0,*CSSide2_1WindFrontRaw)
*CSSide2_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side2_5WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 2 5 wind front",0,*CSSide2_5WindFrontRaw)
animationSetFrameLength(*CSSide2_5WindFront,1,3)
animationSetFrameLength(*CSSide2_5WindFront,2,4)
animationSetFrameLength(*CSSide2_5WindFront,3,5)
animationSetFrameOpacity(*CSSide2_5WindFront,1,192)
animationSetFrameOpacity(*CSSide2_5WindFront,2,128)
animationSetFrameOpacity(*CSSide2_5WindFront,3,64)

*CSSide2_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_1WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind back",0,*CSSide2_1WindBackRaw)
*CSSide2_2WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side2_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 wind back",0,*CSSide2_2WindBackRaw)
animationSetFrameLength(*CSSide2_2WindBack,1,5)
animationSetFrameLength(*CSSide2_2WindBack,2,6)
animationSetFrameOpacity(*CSSide2_2WindBack,1,192)
animationSetFrameOpacity(*CSSide2_2WindBack,2,128)
*CSSide2_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side2_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 3 wind back",0,*CSSide2_3WindBackRaw)
animationSetFrameLength(*CSSide2_3WindBack,1,5)
animationSetFrameOpacity(*CSSide2_3WindBack,1,192)
*CSSide2_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side2_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 wind back",0,*CSSide2_4WindBackRaw)

*CSSide2\frontWind(0,0)=*CSSide2_1WindFront
*CSSide2\frontWind(4,0)=*CSSide2_5WindFront

*CSSide2\backWind(0,0)=*CSSide2_1WindBack
*CSSide2\backWind(1,0)=*CSSide2_2WindBack
*CSSide2\backWind(2,0)=*CSSide2_3WindBack
*CSSide2\backWind(3,0)=*CSSide2_4WindBack

animationFreeMovementWind(*CSSide2)

animationGetSide(*CSSide2)=*CSSide3

;------ Side 1
*CSSide1.animation=classGenerateAnimation(6,"image/hand_chopstick_side1_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 1",0,*CSSide1Raw,20,#H2H_DAMAGETYPE_BLUNT,4)
; 3
; 6
; 9
animationSetFrameLength(*CSSide1,3,5) ; 14
; 17
; 20
animationSetFrameLength(*CSSide1,6,10) ; 30
animationSetFrameDamage(*CSSide1,2,3)
animationSetFrameDamage(*CSSide1,3,3)
animationSetFrameDamage(*CSSide1,4,5)
animationSetFrameDamage(*CSSide1,5,5)
animationSetFrameDamage(*CSSide1,6,5)
animationSetFrameCDN(*CSSide1,6,5)
animationSetFrameDamageDuration(*CSSide1,6,5)
animationSetFrameSound(*CSSide1,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide1,4,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide1,0,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*CSSide1,4,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*CSSide1,6,#H2H_SOUND_ID_BALLPEN_FALL_1)
animationSetFrameSound(*CSSide1,6,#H2H_SOUND_ID_METALBLUNTBLOCK,1)
animationSetFrameMovement(*CSSide1,0,15,-6)
animationSetFrameMovement(*CSSide1,1,15,-6)
animationSetFrameMovement(*CSSide1,2,15,-6)
animationSetFrameMovement(*CSSide1,3,15,-6)
animationSetFrameMovement(*CSSide1,4,-20,9)
animationSetFrameMovement(*CSSide1,5,-20,9)
animationSetFrameMovement(*CSSide1,6,-20,9)
animationSetFrameDamageCut(*CSSide1,2)
animationSetFrameDamageCut(*CSSide1,4)
animationGetSide(*CSSide1)=*CSSide2
animationPrepareWind(*CSSide1)

*CSSide1_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind front",0,*CSSide1_1WindFrontRaw)
*CSSide1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind front",0,*CSSide1_2WindFrontRaw)
*CSSide1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind front",0,*CSSide1_3WindFrontRaw)
*CSSide1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side1_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind front",0,*CSSide1_4WindFrontRaw)
animationSetFrameLength(*CSSide1_4WindFront,1,4)
animationSetFrameLength(*CSSide1_4WindFront,2,5)
animationSetFrameOpacity(*CSSide1_4WindFront,1,192)
animationSetFrameOpacity(*CSSide1_4WindFront,2,128)
*CSSide1_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind front",0,*CSSide1_5WindFrontRaw)
*CSSide1_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_6WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind front",0,*CSSide1_6WindFrontRaw)
*CSSide1_7WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side1_7WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 7 wind front",0,*CSSide1_7WindFrontRaw)
animationSetFrameLength(*CSSide1_7WindFront,1,5)
animationSetFrameLength(*CSSide1_7WindFront,2,6)
animationSetFrameLength(*CSSide1_7WindFront,3,7)
animationSetFrameOpacity(*CSSide1_7WindFront,1,192)
animationSetFrameOpacity(*CSSide1_7WindFront,2,128)
animationSetFrameOpacity(*CSSide1_7WindFront,3,64)

*CSSide1_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_1WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind back",0,*CSSide1_1WindBackRaw)
*CSSide1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_2WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind back",0,*CSSide1_2WindBackRaw)
*CSSide1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_3WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind back",0,*CSSide1_3WindBackRaw)
*CSSide1_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side1_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind back",0,*CSSide1_4WindBackRaw)
animationSetFrameLength(*CSSide1_4WindBack,1,5)
animationSetFrameOpacity(*CSSide1_4WindBack,1,192)
*CSSide1_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_5WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind back",0,*CSSide1_5WindBackRaw)
*CSSide1_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side1_6WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind back",0,*CSSide1_6WindBackRaw)
*CSSide1_7WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_side1_7WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1 7 wind back",0,*CSSide1_7WindBackRaw)
animationSetFrameLength(*CSSide1_7WindBack,1,7)
animationSetFrameOpacity(*CSSide1_7WindBack,1,192)

*CSSide1\frontWind(0,0)=*CSSide1_1WindFront
*CSSide1\frontWind(1,0)=*CSSide1_2WindFront
*CSSide1\frontWind(2,0)=*CSSide1_3WindFront
*CSSide1\frontWind(3,0)=*CSSide1_4WindFront
*CSSide1\frontWind(4,0)=*CSSide1_5WindFront
*CSSide1\frontWind(5,0)=*CSSide1_6WindFront
*CSSide1\frontWind(6,0)=*CSSide1_7WindFront

*CSSide1\backWind(0,0)=*CSSide1_1WindBack
*CSSide1\backWind(1,0)=*CSSide1_2WindBack
*CSSide1\backWind(2,0)=*CSSide1_3WindBack
*CSSide1\backWind(3,0)=*CSSide1_4WindBack
*CSSide1\backWind(4,0)=*CSSide1_5WindBack
*CSSide1\backWind(5,0)=*CSSide1_6WindBack
*CSSide1\backWind(6,0)=*CSSide1_7WindBack
animationFreeMovementWind(*CSSide1)

;------ Side 4
*CSSide4.animation=classGenerateAnimation(4,"image/hand_chopstick_side4_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*CSSide4Raw,15,#H2H_DAMAGETYPE_BLUNT,7)
animationSetFrameSound(*CSSide4,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide4,4,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetFrameLength(*CSSide4,1,2)
animationSetFrameLength(*CSSide4,3,2)
animationSetFrameLength(*CSSide4,4,8)
animationSetFrameCDN(*CSSide4,4,4)
animationSetFrameMovement(*CSSide4,0,-40)
animationSetFrameMovement(*CSSide4,1,-80)
animationSetFrameMovement(*CSSide4,2,-20)
animationSetFrameMovement(*CSSide4,3,0,15)
animationSetFrameMovement(*CSSide4,4,0,15)
animationSetComboEnd(*CSSide4,1)
animationPrepareWind(*CSSide4)
t=4
*CSSide4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_1WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 1 wind front",0,*CSSide4_1WindFrontRaw)
*CSSide4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_2WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 4 2 wind front",0,*CSSide4_2WindFrontRaw)
*CSSide4_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_3WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 3 wind front",0,*CSSide4_3WindFrontRaw)
*CSSide4_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_4WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 4 4 wind front",0,*CSSide4_4WindFrontRaw)
*CSSide4_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side4_5WindFront",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 5 wind front",0,*CSSide4_5WindFrontRaw)
animationSetFrameLength(*CSSide4_5WindFront,1,6)
animationSetFrameLength(*CSSide4_5WindFront,2,7)
animationSetFrameLength(*CSSide4_5WindFront,3,8)
animationSetFrameOpacity(*CSSide4_5WindFront,1,192)
animationSetFrameOpacity(*CSSide4_5WindFront,2,128)
animationSetFrameOpacity(*CSSide4_5WindFront,3,64)

*CSSide4_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side4_4WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"side 4 4 wind back",0,*CSSide4_4WindBackRaw)
*CSSide4_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side4_5WindBack",t,#H2H_ANIMATIONTYPE_NSIDE,"side 4 5 wind back",0,*CSSide4_5WindBackRaw)
animationSetFrameLength(*CSSide4_5WindBack,1,5)
animationSetFrameLength(*CSSide4_5WindBack,2,6)
animationSetFrameOpacity(*CSSide4_5WindBack,1,192)
animationSetFrameOpacity(*CSSide4_5WindBack,2,128)

*CSSide4\frontWind(0,0)=*CSSide4_1WindFront
*CSSide4\frontWind(1,0)=*CSSide4_2WindFront
*CSSide4\frontWind(2,0)=*CSSide4_3WindFront
*CSSide4\frontWind(3,0)=*CSSide4_4WindFront
*CSSide4\frontWind(4,0)=*CSSide4_5WindFront

*CSSide4\backWind(3,0)=*CSSide4_4WindBack
*CSSide4\backWind(4,0)=*CSSide4_5WindBack
animationFreeMovementWind(*CSSide4)

;------ Side 5
*CSSide5.animation=classGenerateAnimation(4,"image/hand_chopstick_side5_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*CSSide5Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationSetComboEnd(*CSSide5,#True)
animationSetFrameSound(*CSSide5,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide5,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameMovement(*CSSide5,0,10,-100)
animationSetFrameMovement(*CSSide5,1,20,10)
animationSetFrameMovement(*CSSide5,2,20,20)
animationSetFrameMovement(*CSSide5,3,20,40)
animationSetFrameMovement(*CSSide5,4,20,80)
animationSetFrameMovement(*CSSide5,4,20,40)
animationSetFrameDamageCut(*CSSide5,3)
animationSetFrameLength(*CSSide5,0,5)
animationSetFrameLength(*CSSide5,3,5)
animationSetFrameLength(*CSSide5,4,10)

*CSSide5_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 1 wind front",0,*CSSide5_1WindFrontRaw)
*CSSide5_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*CSSide5_2WindFrontRaw)
*CSSide5_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 3 wind front",0,*CSSide5_3WindFrontRaw)
*CSSide5_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind front",0,*CSSide5_4WindFrontRaw)
*CSSide5_5WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side5_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind front",0,*CSSide5_5WindFrontRaw)
animationSetFrameLength(*CSSide5_5WindFront,1,5)
animationSetFrameLength(*CSSide5_5WindFront,2,6)
animationSetFrameLength(*CSSide5_5WindFront,3,7)
animationSetFrameOpacity(*CSSide5_5WindFront,1,192)
animationSetFrameOpacity(*CSSide5_5WindFront,2,128)
animationSetFrameOpacity(*CSSide5_5WindFront,3,64)

*CSSide5_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side5_4WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind back",0,*CSSide5_4WindBackRaw)
*CSSide5_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side5_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind back",0,*CSSide5_5WindBackRaw)
animationSetFrameLength(*CSSide5_5WindBack,1,5)
animationSetFrameLength(*CSSide5_5WindBack,2,6)
animationSetFrameOpacity(*CSSide5_5WindBack,1,192)
animationSetFrameOpacity(*CSSide5_5WindBack,2,128)

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
*CSSide6.animation=classGenerateAnimation(10,"image/hand_chopstick_side6_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 6",0,*CSSide6Raw,30,#H2H_DAMAGETYPE_PIERCE,7)
animationSetComboEnd(*CSSide6,1)
animationPrepareWind(*CSSide6)
animationSetFrameSound(*CSSide6,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide6,6,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide6,8,#H2H_SOUND_ID_SWISHLIGHT)

animationSetFrameMovement(*CSSide6,0,-50)
animationSetFrameMovement(*CSSide6,1,-50)
animationSetFrameMovement(*CSSide6,2,-50)
animationSetFrameMovement(*CSSide6,3,75)
animationSetFrameMovement(*CSSide6,4,-100)
frameSetNeedCatch(*CSSide6\frames(4),1)
animationSetFrameMovement(*CSSide6,5,-200)
frameSetNeedCatch(*CSSide6\frames(5),1)
animationSetFrameMovementDelta(*CSSide6,5,-20)
For i=7 To 10
	animationSetFrameDamageType(*CSSide6,i,#H2H_DAMAGETYPE_BLUNT)
	animationSetFrameMovement(*CSSide6,i,-40+i)
; 	setFrameLength(*CSSide6,i,4)
Next
animationSetFrameDamageCut(*CSSide6,6)
animationSetComboEnd(*CSSide6,1)

*CSSide6_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 1 wind back",0,*CSSide6_1WindBackRaw)
*CSSide6_2WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind back",0,*CSSide6_2WindBackRaw)
animationSetFrameLength(*CSSide6_2WindBack,1,5)
animationSetFrameLength(*CSSide6_2WindBack,2,6)
animationSetFrameOpacity(*CSSide6_2WindBack,1,192)
animationSetFrameOpacity(*CSSide6_2WindBack,2,128)
*CSSide6_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 4 wind back",0,*CSSide6_4WindBackRaw)
*CSSide6_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_5WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind back",0,*CSSide6_5WindBackRaw)
*CSSide6_7WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_7WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 7 wind back",0,*CSSide6_7WindBackRaw)
*CSSide6_9WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_9WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 9 wind back",0,*CSSide6_9WindBackRaw)
*CSSide6_10WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_10WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 10 wind back",0,*CSSide6_10WindBackRaw)
animationFreeMovement(*CSSide6_9WindBack)
animationFreeMovement(*CSSide6_10WindBack)

*CSSide6_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind front",0,*CSSide6_2WindFrontRaw)
animationSetFrameLength(*CSSide6_2WindFront,1,5)
animationSetFrameLength(*CSSide6_2WindFront,2,6)
animationSetFrameOpacity(*CSSide6_2WindFront,1,192)
animationSetFrameOpacity(*CSSide6_2WindFront,2,128)
*CSSide6_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_side6_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 3 wind front",0,*CSSide6_3WindFrontRaw)
animationSetFrameLength(*CSSide6_3WindFront,1,6)
animationSetFrameOpacity(*CSSide6_3WindFront,1,192)
*CSSide6_5WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind front",0,*CSSide6_5WindFrontRaw)
animationSetFrameLength(*CSSide6_5WindFront,1,5)
animationSetFrameLength(*CSSide6_5WindFront,2,6)
animationSetFrameOpacity(*CSSide6_5WindFront,1,192)
animationSetFrameOpacity(*CSSide6_5WindFront,2,128)
*CSSide6_6WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side6_6WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 6 wind front",0,*CSSide6_6WindFrontRaw)
animationSetFrameLength(*CSSide6_6WindFront,1,5)
animationSetFrameLength(*CSSide6_6WindFront,2,6)
animationSetFrameLength(*CSSide6_6WindFront,3,7)
animationSetFrameOpacity(*CSSide6_6WindFront,1,192)
animationSetFrameOpacity(*CSSide6_6WindFront,2,128)
animationSetFrameOpacity(*CSSide6_6WindFront,2,128)
*CSSide6_8WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_8WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 8 wind front",0,*CSSide6_8WindFrontRaw)
*CSSide6_9WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_9WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 9 wind front",0,*CSSide6_9WindFrontRaw)
*CSSide6_10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side6_10WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 10 wind front",0,*CSSide6_10WindFrontRaw)
*CSSide6_11WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side6_11WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 11 wind front",0,*CSSide6_11WindFrontRaw)
animationSetFrameLength(*CSSide6_11WindFront,1,5)
animationSetFrameLength(*CSSide6_11WindFront,2,6)
animationSetFrameOpacity(*CSSide6_11WindFront,1,192)
animationSetFrameOpacity(*CSSide6_11WindFront,2,128)
animationFreeMovement(*CSSide6_9WindFront)
animationFreeMovement(*CSSide6_10WindFront)
animationFreeMovement(*CSSide6_11WindFront)

*CSSide6\backWind(0,0)=*CSSide6_1WindBack
*CSSide6\backWind(1,0)=*CSSide6_2WindBack
*CSSide6\backWind(3,0)=*CSSide6_4WindBack
*CSSide6\backWind(4,0)=*CSSide6_5WindBack
*CSSide6\backWind(6,0)=*CSSide6_7WindBack
*CSSide6\backWind(8,0)=*CSSide6_9WindBack
*CSSide6\backWind(9,0)=*CSSide6_10WindBack

*CSSide6\frontWind(1 ,0)=*CSSide6_2WindFront
*CSSide6\frontWind(2 ,0)=*CSSide6_3WindFront
*CSSide6\frontWind(4 ,0)=*CSSide6_5WindFront
*CSSide6\frontWind(5 ,0)=*CSSide6_6WindFront
*CSSide6\frontWind(7 ,0)=*CSSide6_8WindFront
*CSSide6\frontWind(8 ,0)=*CSSide6_9WindFront
*CSSide6\frontWind(9 ,0)=*CSSide6_10WindFront
*CSSide6\frontWind(10,0)=*CSSide6_11WindFront
 
;------ Side 7
*CSSide7.animation=classGenerateAnimation(3,"image/hand_chopstick_side7_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7",0,*CSSide7Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationSetFrameCanMove(*CSSide7,3,7)
animationSetFrameLength(*CSSide7,0,3)
animationSetFrameLength(*CSSide7,1,3)
animationSetFrameLength(*CSSide7,3,14)
animationSetFrameMovement(*CSSide7,0,-50)
animationSetFrameMovement(*CSSide7,1,-100,30)
animationSetFrameMovement(*CSSide7,2,-50,20)
animationSetFrameMovement(*CSSide7,3,-50,10)
animationSetFrameDamageDuration(*CSSide7,3,5)
animationSetFramePush(*CSSide7,2,-20,20)
animationSetFrameSound(*CSSide7,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSSide7,3,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetComboEnd(*CSSide7,#True)

*CSSide7_1WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side7_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 1 wind front",0,*CSSide7_1WindFrontRaw)
animationSetFrameLength(*CSSide7_1WindFront,1,4)
animationSetFrameLength(*CSSide7_1WindFront,2,5)
animationSetFrameOpacity(*CSSide7_1WindFront,1,192)
animationSetFrameOpacity(*CSSide7_1WindFront,2,128)
*CSSide7_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side7_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind front",0,*CSSide7_2WindFrontRaw)
*CSSide7_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side7_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind front",0,*CSSide7_3WindFrontRaw)
*CSSide7_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side7_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 4 wind front",0,*CSSide7_4WindFrontRaw)
animationSetFrameLength(*CSSide7_4WindFront,1,5)
animationSetFrameLength(*CSSide7_4WindFront,2,6)
animationSetFrameLength(*CSSide7_4WindFront,3,7)
animationSetFrameMovement(*CSSide7_4WindFront,1,-40)
animationSetFrameMovement(*CSSide7_4WindFront,2,-30)
animationSetFrameMovement(*CSSide7_4WindFront,3,-20)
animationSetFrameOpacity(*CSSide7_4WindFront,1,192)
animationSetFrameOpacity(*CSSide7_4WindFront,2,128)
animationSetFrameOpacity(*CSSide7_4WindFront,2,128)

animationPrepareWind(*CSSide7,0)
*CSSide7\frontWind(0,0)=*CSSide7_1WindFront
*CSSide7\frontWind(1,0)=*CSSide7_2WindFront
*CSSide7\frontWind(2,0)=*CSSide7_3WindFront
*CSSide7\frontWind(3,0)=*CSSide7_4WindFront
animationFreeMovementWind(*CSSide7)

;------ Side 8
*CSSide8.animation=classGenerateAnimation(6,"image/hand_chopstick_side8_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8",0,*CSSide8Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationSetFrameSound(*CSSide8,1,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSSide8,4,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetComboEnd(*CSSide8,#True)
animationSetFrameMovement(*CSSide8,3,0,-100)
animationSetFrameMovement(*CSSide8,5,0,50)
animationSetFrameMovement(*CSSide8,6,-40,50)
animationSetFrameLength(*CSSide8,2,4)
animationSetFrameLength(*CSSide8,3,5)
animationSetFrameLength(*CSSide8,4,4)
animationSetFrameLength(*CSSide8,5,8)
animationSetFrameLength(*CSSide8,6,5)

*CSSide8_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 1 wind front",0,*CSSide8_1WindFrontRaw)
*CSSide8_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 2 wind front",0,*CSSide8_2WindFrontRaw)
*CSSide8_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 3 wind front",0,*CSSide8_3WindFrontRaw)
*CSSide8_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 4 wind front",0,*CSSide8_4WindFrontRaw)
*CSSide8_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 5 wind front",0,*CSSide8_5WindFrontRaw)
*CSSide8_6WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side8_6WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 6 wind front",0,*CSSide8_6WindFrontRaw)
animationSetFrameLength(*CSSide8_6WindFront,1,5)
animationSetFrameLength(*CSSide8_6WindFront,2,6)
animationSetFrameLength(*CSSide8_6WindFront,3,7)
animationSetFrameOpacity(*CSSide8_6WindFront,1,192)
animationSetFrameOpacity(*CSSide8_6WindFront,2,128)
animationSetFrameOpacity(*CSSide8_6WindFront,3,64)

*CSSide8_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_side8_5WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 5 wind back",0,*CSSide8_5WindBackRaw)
*CSSide8_6WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_side8_6WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 8 6 wind back",0,*CSSide8_6WindBackRaw)
animationSetFrameLength(*CSSide8_6WindBack,1,5)
animationSetFrameLength(*CSSide8_6WindBack,2,6)
animationSetFrameLength(*CSSide8_6WindBack,3,7)
animationSetFrameOpacity(*CSSide8_6WindBack,1,192)
animationSetFrameOpacity(*CSSide8_6WindBack,2,128)
animationSetFrameOpacity(*CSSide8_6WindBack,3,64)
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
animationSetUngrounded(*CSSide9)
animationSetComboEnd(*CSSide9,#True)
animationSetFrameMovement(*CSSide9,0,50,-40)
animationSetFrameMovement(*CSSide9,1,-70,-40)
animationSetFrameMovement(*CSSide9,2,-40,-20)
animationSetFrameMovement(*CSSide9,3,-40,20)
animationSetFrameMovement(*CSSide9,4,40,40)
animationSetFrameDamageCut(*CSSide9,2)
animationSetFrameDamage(*CSSide9,1,5)
animationSetFrameLength(*CSSide9,0,4)
animationSetFrameLength(*CSSide9,3,7)
animationSetFrameCDN(*CSSide9,4,4)
animationSetFrameSound(*CSSide9,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSSide9,3,#H2H_SOUND_ID_SWISHMEDIUM)

*CSSide9_1WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 1 wind front",0,*CSSide9_1WindFrontRaw)
animationSetFrameLength(*CSSide9_1WindFront,1,6)
animationSetFrameLength(*CSSide9_1WindFront,2,7)
animationSetFrameOpacity(*CSSide9_1WindFront,1,192)
animationSetFrameOpacity(*CSSide9_1WindFront,2,128)
*CSSide9_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side9_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 2 wind front",0,*CSSide9_2WindFrontRaw)
*CSSide9_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_side9_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 3 wind front",0,*CSSide9_3WindFrontRaw)
*CSSide9_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_side9_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 4 wind front",0,*CSSide9_4WindFrontRaw)
animationSetFrameLength(*CSSide9_4WindFront,1,6)
animationSetFrameLength(*CSSide9_4WindFront,2,7)
animationSetFrameLength(*CSSide9_4WindFront,3,8)
animationSetFrameOpacity(*CSSide9_4WindFront,1,192)
animationSetFrameOpacity(*CSSide9_4WindFront,2,128)
animationSetFrameOpacity(*CSSide9_4WindFront,3,64)

*CSSide9_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 1 wind back",0,*CSSide9_1WindBackRaw)
animationSetFrameLength(*CSSide9_1WindBack,1,5)
animationSetFrameLength(*CSSide9_1WindBack,2,6)
animationSetFrameOpacity(*CSSide9_1WindBack,1,192)
animationSetFrameOpacity(*CSSide9_1WindBack,2,128)
*CSSide9_4WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_side9_4WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 9 4 wind back",0,*CSSide9_4WindBackRaw)
animationSetFrameLength(*CSSide9_4WindBack,1,6)
animationSetFrameLength(*CSSide9_4WindBack,2,7)
animationSetFrameOpacity(*CSSide9_4WindBack,1,192)
animationSetFrameOpacity(*CSSide9_4WindBack,2,128)

animationPrepareWind(*CSSide9,0)
*CSSide9\frontWind(0,0)=*CSSide9_1WindFront
*CSSide9\frontWind(1,0)=*CSSide9_2WindFront
*CSSide9\frontWind(2,0)=*CSSide9_3WindFront
*CSSide9\frontWind(3,0)=*CSSide9_4WindFront
*CSSide9\backWind(0,0)=*CSSide9_1WindBack
*CSSide9\backWind(3,0)=*CSSide9_4WindBack

animationFreeMovementWind(*CSSide9)

;------ Neutral 6
*CSSNeutral6.animation=classGenerateAnimation(3,"image/hand_chopstick_neutral6_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*CSNeutral6Raw,10,#H2H_DAMAGETYPE_BLUNT,4)
animationGetSide(*CSSNeutral6)=*CSSide4
animationSetFrameSound(*CSSNeutral6,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameLength(*CSSNeutral6,0,4)
animationSetFrameLength(*CSSNeutral6,3,12)
animationSetFrameCDN(*CSSNeutral6,3,3)
animationPrepareWind(*CSSNeutral6)
For i=0 To 3
	animationSetFrameMovement(*CSSNeutral6,i,2+i*8)
Next

*CSSNeutral6_1FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 1 wind front",0,*CSNeutral6_1WindFrontRaw)
*CSSNeutral6_2FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 2 wind front",0,*CSNeutral6_2WindFrontRaw)
*CSSNeutral6_3FrontWind.animation=classGenerateAnimation(0,"image/hand_chopstick_neutral6_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind front",0,*CSNeutral6_3WindFrontRaw)
*CSSNeutral6_4FrontWind.animation=classGenerateAnimation(2,"image/hand_chopstick_neutral6_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 4 wind front",0,*CSNeutral6_4WindFrontRaw)
animationSetFrameLength(*CSSNeutral6_4FrontWind,1,5)
animationSetFrameLength(*CSSNeutral6_4FrontWind,2,6)
animationSetFrameOpacity(*CSSNeutral6_4FrontWind,1,192)
animationSetFrameOpacity(*CSSNeutral6_4FrontWind,2,128)

*CSSNeutral6\frontWind(0,0)=*CSSNeutral6_1FrontWind
*CSSNeutral6\frontWind(1,0)=*CSSNeutral6_2FrontWind
*CSSNeutral6\frontWind(2,0)=*CSSNeutral6_3FrontWind
*CSSNeutral6\frontWind(3,0)=*CSSNeutral6_4FrontWind

;------ Up 1
*CSUp1.animation=classGenerateAnimation(4,"image/hand_chopstick_up1_",4,#H2H_ANIMATIONTYPE_NUP,"up 1",0,*CSUp1Raw,20,#H2H_DAMAGETYPE_BLUNT,3)
animationSetFrameSound(*CSUp1,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameDamageType(*CSUp1,2,#H2H_DAMAGETYPE_PIERCE)
animationSetFrameDamageType(*CSUp1,3,#H2H_DAMAGETYPE_PIERCE)
animationSetFrameMovement(*CSUp1,0,-5,20)
animationSetFrameMovement(*CSUp1,1,-40,-20)
animationSetFrameMovement(*CSUp1,2,0,-20)
animationSetFrameMovement(*CSUp1,3,0,-10)
animationSetFrameMovement(*CSUp1,4,0,30)
animationSetFrameCDN(*CSUp1,3,3)
animationSetFrameLength(*CSUp1,0,3)
animationSetFrameLength(*CSUp1,1,3)
animationSetFrameDamage(*CSUp1,2,7)
animationSetFrameDamage(*CSUp1,3,9)
animationSetFrameLength(*CSUp1,4,5)
animationSetFrameDamageDuration(*CSUp1,3,4)
animationGetNeutral(*CSUp1)=*CSSNeutral6
animationGetSide(*CSUp1)=*CSSide7
animationPrepareWind(*CSUp1)

*CSUp1_1WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up1_1WindFront",3,#H2H_ANIMATIONTYPE_NUP,"up 1 1 wind front",0,*CSUp1_1WindFrontRaw)
animationSetFrameLength(*CSUp1_1WindFront,1,4)
animationSetFrameOpacity(*CSUp1_1WindFront,1,192)
*CSUp1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind front",0,*CSUp1_2WindFrontRaw)
*CSUp1_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_3WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind front",0,*CSUp1_3WindFrontRaw)
*CSUp1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_up1_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind front",0,*CSUp1_4WindFrontRaw)
animationSetFrameFreeMovement(*CSUp1_4WindFront\frames(0))
animationSetFrameLength(*CSUp1_1WindFront,1,5)
animationSetFrameLength(*CSUp1_4WindFront,2,6)
animationSetFrameOpacity(*CSUp1_4WindFront,1,192)
animationSetFrameOpacity(*CSUp1_4WindFront,2,128)
*CSUp1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_2WindBack",4,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind back",0,*CSUp1_2WindBackRaw)
*CSUp1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up1_3WindBack",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind back",0,*CSUp1_3WindBackRaw)
*CSUp1_4WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_up1_4WindBack",6,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind back",0,*CSUp1_4WindBackRaw)
animationSetFrameLength(*CSUp1_4WindBack,1,7)
animationSetFrameOpacity(*CSUp1_4WindBack,1,192)
animationSetFrameFreeMovement(*CSUp1_4WindBack\frames(0))

*CSUp1\frontWind(0,0)=*CSUp1_1WindFront
*CSUp1\frontWind(1,0)=*CSUp1_2WindFront
*CSUp1\frontWind(2,0)=*CSUp1_3WindFront
*CSUp1\frontWind(3,0)=*CSUp1_4WindFront

*CSUp1\backWind(1,0)=*CSUp1_2WindBack
*CSUp1\backWind(2,0)=*CSUp1_3WindBack
*CSUp1\backWind(3,0)=*CSUp1_4WindBack

;------ Up 2
*CSUp2.animation=classGenerateAnimation(6,"image/hand_chopstick_up2_",2,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*CSUp2Raw,8,#H2H_DAMAGETYPE_BLUNT,4)
animationSetComboEnd(*CSUp2,1)

animationSetFrameLength(*CSUp2,3,4)
animationSetFrameLength(*CSUp2,6,5)
animationSetFrameMovement(*CSUp2,0,10)
animationSetFrameMovement(*CSUp2,1,20,-10)
animationSetFrameMovement(*CSUp2,2,30,-10)
animationSetFrameMovement(*CSUp2,3,20,20)
animationSetFrameMovement(*CSUp2,4,-40,-50)
animationSetFrameMovement(*CSUp2,5,-30,-25)
animationSetFrameMovement(*CSUp2,6,-30,-50)
animationSetFrameSound(*CSUp2,3,#H2H_SOUND_ID_SWISHLIGHT)

animationGetUp(*CSNeutral2)=*CSUp2

*CSUp2_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_1frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 1 wind front",0,*CSUp2_1WindFrontRaw)
*CSUp2_2WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_2frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 2 wind front",0,*CSUp2_2WindFrontRaw)
animationSetFrameLength(*CSUp2_2WindFront,1,4)
animationSetFrameOpacity(*CSUp2_2WindFront,1,192)
*CSUp2_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_3frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 3 wind front",0,*CSUp2_3WindFrontRaw)
animationSetFrameLength(*CSUp2_3WindFront,1,4)
animationSetFrameOpacity(*CSUp2_3WindFront,1,192)
*CSUp2_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_4frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 4 wind front",0,*CSUp2_4WindFrontRaw)
*CSUp2_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_5frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 5 wind front",0,*CSUp2_5WindFrontRaw)
*CSUp2_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_6frontwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 6 wind front",0,*CSUp2_6WindFrontRaw)
*CSUp2_7WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_up2_7frontwind",4,#H2H_ANIMATIONTYPE_NUP,"up 2 7 wind front",0,*CSUp2_7WindFrontRaw)
animationSetFrameLength(*CSUp2_7WindFront,1,5)
animationSetFrameLength(*CSUp2_7WindFront,2,6)
animationSetFrameOpacity(*CSUp2_7WindFront,1,192)
animationSetFrameOpacity(*CSUp2_7WindFront,2,128)
animationFreeMovement(*CSUp2_7WindFront)

*CSUp2_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_5backwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 5 wind back",0,*CSUp2_5WindBackRaw)
*CSUp2_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_up2_6backwind",2,#H2H_ANIMATIONTYPE_NUP,"up 2 6 wind back",0,*CSUp2_6WindBackRaw)
*CSUp2_7WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_up2_7backwind",4,#H2H_ANIMATIONTYPE_NUP,"up 2 7 wind back",0,*CSUp2_7WindBackRaw)
animationSetFrameLength(*CSUp2_7WindBack,1,6)
animationFreeMovement(*CSUp2_7WindBack)

animationPrepareWind(*CSUp2)

*CSUp2\frontWind(0,0)=*CSUp2_1WindFront
*CSUp2\frontWind(1,0)=*CSUp2_2WindFront
*CSUp2\frontWind(2,0)=*CSUp2_3WindFront
*CSUp2\frontWind(3,0)=*CSUp2_4WindFront
*CSUp2\frontWind(4,0)=*CSUp2_5WindFront
*CSUp2\frontWind(5,0)=*CSUp2_6WindFront
*CSUp2\frontWind(6,0)=*CSUp2_7WindFront

*CSUp2\backWind(4,0)=*CSUp2_5WindBack
*CSUp2\backWind(5,0)=*CSUp2_6WindBack
*CSUp2\backWind(6,0)=*CSUp2_7WindBack

;------ Back 1
*CSBack1.animation=classGenerateAnimation(4,"image/hand_chopstick_back1_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1",0,*CSBack1Raw,12,#H2H_DAMAGETYPE_PIERCE,5)
animationSetFrameCDN(*CSBack1,4,6)
animationSetUngrounded(*CSBack1)
animationSetFrameLength(*CSBack1,3,6)
animationSetFrameLength(*CSBack1,4,12)
animationSetFrameMovement(*CSBack1,0,-5,20)
animationSetFrameMovement(*CSBack1,1,-5,20)
animationSetFrameMovementDelta(*CSBack1,1,25)
animationSetFrameMovementDelta(*CSBack1,2,25)
animationSetFrameMovementDelta(*CSBack1,3,25,-0.5)
animationSetFrameMovementDelta(*CSBack1,4,5,-3)
animationSetFrameSound(*CSBack1,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameWindNeedCatch(*CSBack1,3)
animationSetFrameWindNeedCatch(*CSBack1,4)
animationSetFrameMovementDeltaNeedCatch(*CSBack1,1)
animationSetFrameMovementDeltaNeedCatch(*CSBack1,2)
animationSetFrameMovementDeltaNeedCatch(*CSBack1,3)
animationSetFrameMovementDeltaNeedCatch(*CSBack1,4)

*CSBack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back1_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1 2 wind front",0,*CSBack1_2WindFrontRaw)
*CSBack1_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 1 3 wind front",0,*CSBack1_3WindFrontRaw)
animationSetFrameLength(*CSBack1_3WindFront,1,5)
animationSetFrameLength(*CSBack1_3WindFront,2,6)
animationSetFrameOpacity(*CSBack1_3WindFront,1,192)
animationSetFrameOpacity(*CSBack1_3WindFront,2,128)
*CSBack1_4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_4WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"Back 1 4 wind front",0,*CSBack1_4WindFrontRaw)
animationSetFrameOpacity(*CSBack1_4WindFront,2,192)

*CSBack1_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_back1_5WindBack",6,#H2H_ANIMATIONTYPE_NBACK,"Back 1 5 wind back",0,*CSBack1_5WindBackRaw)
animationSetFrameOpacity(*CSBack1_5WindBack,2,192)

animationPrepareWind(*CSBack1,0)
*CSBack1\frontWind(1,0)=*CSBack1_2WindFront
*CSBack1\frontWind(2,0)=*CSBack1_3WindFront
*CSBack1\frontWind(3,0)=*CSBack1_4WindFront
*CSBack1\backWind(4,0)=*CSBack1_5WindBack

;------ Back 2
*CSBack2.animation=classGenerateAnimation(3,"image/hand_chopstick_back2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2",0,*CSBack2Raw,8,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*CSBack2,3,5)
animationSetFrameLength(*CSBack2,0,7)
animationSetFrameLength(*CSBack2,3,10)
animationSetFrameSound(*CSBack2,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSBack2,1,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameMovement(*CSBack2,0,-5)
animationSetFrameMovement(*CSBack2,1,20,-5)
animationSetFrameMovement(*CSBack2,2,40,-5)
animationSetFrameMovement(*CSBack2,3,60,-5)
animationSetFrameDamageDuration(*CSBack2,3,4)
*CSBack2_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_2WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front",0,*CSBack2_2WindFrontRaw)
*CSBack2_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 3 wind front",0,*CSBack2_3WindFrontRaw)
*CSBack2_4WindFront.animation=classGenerateAnimation(4,"image/hand_chopstick_back2_4WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 2 4 wind front",0,*CSBack2_4WindFrontRaw)
animationSetFrameLength(*CSBack2_4WindFront,1,4)
animationSetFrameLength(*CSBack2_4WindFront,2,5)
animationSetFrameLength(*CSBack2_4WindFront,3,6)
animationSetFrameLength(*CSBack2_4WindFront,4,7)
animationSetFrameOpacity(*CSBack2_4WindFront,2,192)
animationSetFrameOpacity(*CSBack2_4WindFront,3,128)
animationSetFrameOpacity(*CSBack2_4WindFront,4,64)
*CSBack2_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_back2_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind back",0,*CSBack2_1WindBackRaw)
animationSetFrameLength(*CSBack2_1WindBack,1,5)
animationSetFrameLength(*CSBack2_1WindBack,2,6)
animationSetFrameOpacity(*CSBack2_1WindBack,1,192)
animationSetFrameOpacity(*CSBack2_1WindBack,2,128)
*CSBack2_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back2_2WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind back",0,*CSBack2_2WindBackRaw)

animationFreeMovementWind(*CSBack2)
animationPrepareWind(*CSBack2,0)
*CSBack2\frontWind(1,0)=*CSBack2_2WindFront
*CSBack2\frontWind(2,0)=*CSBack2_3WindFront
*CSBack2\frontWind(3,0)=*CSBack2_4WindFront
*CSBack2\backWind(0,0)=*CSBack2_1WindBack
*CSBack2\backWind(1,0)=*CSBack2_2WindBack
animationGetSide(*CSBack2)=*CSSide8

;------ Back 3
*CSBack3.animation=classGenerateAnimation(4,"image/hand_chopstick_back3_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*CSBack3Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
animationSetComboEnd(*CSBack3,#True)
animationSetFrameMovement(*CSBack3,0,25)
animationSetFrameMovement(*CSBack3,1,25,50)
animationSetFrameMovement(*CSBack3,2,-75,-50)
animationSetFrameMovementDelta(*CSBack3,2,35)
animationSetFrameMovementDelta(*CSBack3,3,10)
animationSetFrameMovementDeltaNeedCatch(*CSBack3,2)
animationSetFrameMovementDeltaNeedCatch(*CSBack3,3)
animationSetFrameLength(*CSBack3,2,8)
animationSetFrameLength(*CSBack3,3,7)
animationSetFrameLength(*CSBack3,4,8)
animationSetFrameSound(*CSBack3,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSBack3,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameDamageDuration(*CSBack3,2,5)

*CSBack3_3WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back3_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*CSBack3_3WindFrontRaw)
animationSetFrameLength(*CSBack3_3WindFront,1,6)
animationSetFrameLength(*CSBack3_3WindFront,2,7)
animationSetFrameOpacity(*CSBack3_3WindFront,1,192)
animationSetFrameOpacity(*CSBack3_3WindFront,2,128)

*CSBack3_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back3_1WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind back",0,*CSBack3_1WindBackRaw)
*CSBack3_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back3_2WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind back",0,*CSBack3_2WindBackRaw)
animationSetFrameLength(*CSBack3_2WindBack,1,5)
animationSetFrameOpacity(*CSBack3_2WindBack,1,192)
*CSBack3_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back3_3WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind back",0,*CSBack3_3WindBackRaw)
animationSetFrameLength(*CSBack3_3WindBack,1,5)
animationSetFrameOpacity(*CSBack3_3WindBack,1,192)

animationPrepareWind(*CSBack3,0)
*CSBack3\frontWind(2,0)=*CSBack3_3WindFront
*CSBack3\backWind(0,0)=*CSBack3_1WindBack
*CSBack3\backWind(1,0)=*CSBack3_2WindBack
*CSBack3\backWind(2,0)=*CSBack3_3WindBack
animationFreeMovementWind(*CSBack3)

;------ Back 4
*CSBack4.animation=classGenerateAnimation(5,"image/hand_chopstick_back4_",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4",0,*CSBack4Raw,18,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*CSBack4,5,5)
animationSetFrameLength(*CSBack4,5,12)
animationSetFrameDamageDuration(*CSBack4,5,5)
animationSetFrameMovement(*CSBack4,0,50)
animationSetFrameMovement(*CSBack4,1,50,-50)
animationSetFrameMovement(*CSBack4,2,50,50)
animationSetFrameMovement(*CSBack4,3,50)
animationSetFrameMovement(*CSBack4,4,50)
animationSetFrameMovement(*CSBack4,5,50)
animationSetFrameDamageCut(*CSBack4,3)
animationSetFrameDamage(*CSBack4,2,5)
animationSetFrameSound(*CSBack4,1,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSBack4,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationGetBack(*CSSide2)=*CSBack4
animationGetSide(*CSBack4)=*CSSide5

*CSBack4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 1 wind front",0,*CSBack4_1WindFrontRaw)
*CSBack4_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_4WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 4 wind front",0,*CSBack4_4WindFrontRaw)
*CSBack4_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_5WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 5 wind front",0,*CSBack4_5WindFrontRaw)
*CSBack4_6WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back4_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 6 wind front",0,*CSBack4_6WindFrontRaw)
animationSetFrameLength(*CSBack4_6WindFront,1,6)
animationSetFrameLength(*CSBack4_6WindFront,2,7)
animationSetFrameOpacity(*CSBack4_6WindFront,1,192)
animationSetFrameOpacity(*CSBack4_6WindFront,2,128)

*CSBack4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_2WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 2 wind back",0,*CSBack4_2WindBackRaw)
*CSBack4_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_3WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 3 wind back",0,*CSBack4_3WindBackRaw)
*CSBack4_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_4WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 4 wind back",0,*CSBack4_4WindBackRaw)
*CSBack4_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_back4_5WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"Back 4 5 wind back",0,*CSBack4_5WindBackRaw)
*CSBack4_6WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back4_6WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 6 wind back",0,*CSBack4_6WindBackRaw)
animationSetFrameLength(*CSBack4_6WindBack,1,6)
animationSetFrameOpacity(*CSBack4_6WindBack,1,192)

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
*CSBack5.animation=classGenerateAnimation(2,"image/hand_chopstick_back5_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 5",0,*CSBack5Raw,8,#H2H_DAMAGETYPE_BLUNT,5)
animationSetUngrounded(*CSBack5)
animationSetFrameLength(*CSBack5,2,12)
animationSetFrameCDN(*CSBack5,2,5)
animationSetFrameMovement(*CSBack5,0,85,-10)
animationSetFrameMovement(*CSBack5,1,-85,-10)
animationSetFrameMovement(*CSBack5,2,-15,-10)
animationSetFrameMovementDeltaNeedCatch(*CSBack5,2)
animationSetFrameMovementDelta(*CSBack5,2,33)

*CSBack5_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_back5_2WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 5 2 wind front",0,*CSBack5_2WindFrontRaw)
animationSetFrameLength(*CSBack5_2WindFront,1,4)
animationSetFrameLength(*CSBack5_2WindFront,2,5)
animationSetFrameOpacity(*CSBack5_2WindFront,1,192)
animationSetFrameOpacity(*CSBack5_2WindFront,2,128)

*CSBack5_1WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back5_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 5 1 wind back",0,*CSBack5_1WindBackRaw)
animationSetFrameLength(*CSBack5_1WindBack,1,5)
animationSetFrameOpacity(*CSBack5_1WindBack,1,192)
*CSBack5_2WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_back5_2WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 5 2 wind back",0,*CSBack5_2WindBackRaw)
animationSetFrameLength(*CSBack5_2WindBack,1,5)
animationSetFrameOpacity(*CSBack5_2WindBack,1,192)

animationPrepareWind(*CSBack5,0)
*CSBack5\frontWind(1,0)=*CSBack5_2WindFront
*CSBack5\backWind(0,0)=*CSBack5_1WindBack
*CSBack5\backWind(1,0)=*CSBack5_2WindBack
animationFreeMovementWind(*CSBack5)
animationGetSide(*CSBack5)=*CSSide9

;------ Down 1
*CSDown1.animation=classGenerateAnimation(6,"image/hand_chopstick_down1_",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*CSDown1Raw,1,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameMovement(*CSDown1,0,20)
animationSetFrameMovement(*CSDown1,1,-100,-100)
animationSetFrameMovement(*CSDown1,2,-297,-265)
animationSetFrameMovement(*CSDown1,3,-50,-50)
animationSetFrameMovement(*CSDown1,4,-25,-12)
animationSetFrameMovement(*CSDown1,5,-25)
animationSetFrameMovement(*CSDown1,6,-1,-25)
animationSetFrameLength(*CSDown1,0,3)
animationSetFrameLength(*CSDown1,3,4)
animationSetFrameLength(*CSDown1,4,4)
animationSetFrameLength(*CSDown1,5,4)
animationSetFrameLength(*CSDown1,6,12)
animationSetFrameCDN(*CSDown1,6,4)
animationSetFrameDamageDuration(*CSDown1,6,5)
animationSetFrameSound(*CSDown1,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSDown1,2,#H2H_SOUND_ID_CHOPSTICK_NDOWN)
animationSetFrameSound(*CSDown1,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSDown1,5,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameDamageCut(*CSDown1,2)
animationSetFrameDamageCut(*CSDown1,5)
animationSetFrameDamageType(*CSDown1,1,#H2H_DAMAGETYPE_PIERCE)

*CSDown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_down1_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*CSDown1_2WindFrontRaw)
animationSetFrameLength(*CSDown1_2WindFront,1,5)
animationSetFrameLength(*CSDown1_2WindFront,2,6)
animationSetFrameOpacity(*CSDown1_2WindFront,1,192)
animationSetFrameOpacity(*CSDown1_2WindFront,2,128)
*CSDown1_3WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*CSDown1_3WindFrontRaw)
animationShiftShift(*CSDown1_3WindFront,0,297,265)
animationShiftShift(*CSDown1_3WindFront,1,297,265)
animationShiftShift(*CSDown1_3WindFront,2,297,265)
animationShiftShift(*CSDown1_3WindFront,3,297,265)
animationSetFrameLength(*CSDown1_3WindFront,1,4)
animationSetFrameLength(*CSDown1_3WindFront,2,5)
animationSetFrameLength(*CSDown1_3WindFront,3,6)
animationSetFrameOpacity(*CSDown1_3WindFront,1,192)
animationSetFrameOpacity(*CSDown1_3WindFront,2,128)
animationSetFrameOpacity(*CSDown1_3WindFront,3,64)
*CSDown1_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_5WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind front",0,*CSDown1_5WindFrontRaw)
*CSDown1_6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_6WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind front",0,*CSDown1_6WindFrontRaw)
*CSDown1_7WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_7WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 7 wind front",0,*CSDown1_7WindFrontRaw)
animationSetFrameLength(*CSDown1_7WindFront,1,4)
animationSetFrameLength(*CSDown1_7WindFront,2,5)
animationSetFrameLength(*CSDown1_7WindFront,3,6)
animationSetFrameOpacity(*CSDown1_7WindFront,1,192)
animationSetFrameOpacity(*CSDown1_7WindFront,2,128)
animationSetFrameOpacity(*CSDown1_7WindFront,3,64)

*CSDown1_1WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_down1_1WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind back",0,*CSDown1_1WindBackRaw)
animationSetFrameLength(*CSDown1_1WindBack,1,5)
animationSetFrameOpacity(*CSDown1_1WindBack,1,192)
*CSDown1_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_2WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind back",0,*CSDown1_2WindBackRaw)
*CSDown1_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_3WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind back",0,*CSDown1_3WindBackRaw)
*CSDown1_4WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_4WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 4 wind back",0,*CSDown1_4WindBackRaw)
*CSDown1_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_5WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind back",0,*CSDown1_5WindBackRaw)
*CSDown1_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_down1_6WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind back",0,*CSDown1_6WindBackRaw)
*CSDown1_7WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_down1_7WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 7 wind back",0,*CSDown1_7WindBackRaw)
animationSetFrameLength(*CSDown1_7WindBack,1,4)
animationSetFrameLength(*CSDown1_7WindBack,2,5)
animationSetFrameLength(*CSDown1_7WindBack,3,6)
animationSetFrameOpacity(*CSDown1_7WindBack,1,192)
animationSetFrameOpacity(*CSDown1_7WindBack,2,128)
animationSetFrameOpacity(*CSDown1_7WindBack,3,64)

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
animationSetUngrounded(*CSDown2)
animationSetFrameMovement(*CSDown2,0,1)
animationSetFrameSound(*CSDown2,1,#H2H_SOUND_ID_HAND_LAND)
ReDim *CSDown2\frames(5)
*CSDown2\frames(5)=*CSDown2\frames(1)
For i=1 To 4
	*CSDown2\frames(i)=AllocateStructure(frame)
	frameCopy(*CSDown2\frames(i),*CSDown2\frames(0),#True)
Next
; k.d=427.0/5
k.d=427.0/4.5
animationSetFrameMovementDelta(*CSDown2,0,0,k/4)
animationSetFrameMovementDelta(*CSDown2,1,0,k/2)
animationSetFrameMovementDelta(*CSDown2,2,0,k)
animationSetFrameMovementDelta(*CSDown2,3,0,k)
animationSetFrameMovementDelta(*CSDown2,4,0,k)
animationSetFrameLength(*CSDown2,0,4)
animationSetFrameLength(*CSDown2,1,2)
animationSetFrameLength(*CSDown2,2,1)
animationSetFrameLength(*CSDown2,3,1)
animationSetFrameLength(*CSDown2,4,1)
animationSetFrameLength(*CSDown2,5,12)
animationSetFrameCDN(*CSDown2,5,5)

*CSDown2_1WindFront.animation=classGenerateAnimation(4,"image/hand_chopstick_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*CSDown2_1WindFrontRaw)
animationSetFrameLength(*CSDown2_1WindFront,1,2)
animationSetFrameLength(*CSDown2_1WindFront,2,1)
animationSetFrameLength(*CSDown2_1WindFront,3,1)
animationSetFrameLength(*CSDown2_1WindFront,4,1)
*CSDown2_2WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_down2_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*CSDown2_2WindFrontRaw)
animationFreeMovement(*CSDown2_2WindFront)
animationSetFrameLength(*CSDown2_2WindFront,1,6)
animationSetFrameLength(*CSDown2_2WindFront,2,7)
animationSetFrameOpacity(*CSDown2_2WindFront,1,192)
animationSetFrameOpacity(*CSDown2_2WindFront,2,128)

*CSDown2_1WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_down2_1WindBack",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind back",0,*CSDown2_1WindBackRaw)
animationSetFrameLength(*CSDown2_1WindBack,1,3)
animationSetFrameLength(*CSDown2_1WindBack,2,5)
animationSetFrameOpacity(*CSDown2_1WindBack,1,192)
animationSetFrameOpacity(*CSDown2_1WindBack,2,128)
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

;------ Heavy 1
*CSHeavy1.animation=classGenerateAnimation(5,"image/hand_chopstick_heavy1_",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*CSHeavy1Raw,60,#H2H_DAMAGETYPE_BLUNT,10)
animationSetFrameMovement(*CSHeavy1,0,50)
animationSetFrameMovement(*CSHeavy1,1,25)
animationSetFrameMovement(*CSHeavy1,2,-75)
animationSetFrameMovement(*CSHeavy1,3,-75)
animationSetFrameMovement(*CSHeavy1,4,-90)
animationSetFrameMovement(*CSHeavy1,5,-20)
animationSetFrameSound(*CSHeavy1,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSHeavy1,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameLength(*CSHeavy1,0,4)
animationSetFrameLength(*CSHeavy1,1,6)
animationSetFrameLength(*CSHeavy1,2,4)
animationSetFrameLength(*CSHeavy1,3,2)
animationSetFrameLength(*CSHeavy1,4,6)
animationSetFrameLength(*CSHeavy1,5,10)
animationSetFramePush(*CSHeavy1,2,-3)
animationSetFramePush(*CSHeavy1,3,-5)
animationSetFramePush(*CSHeavy1,4,-10)
animationSetFrameStun(*CSHeavy1,2,5)
animationSetFrameStun(*CSHeavy1,3,10)
animationSetFrameStun(*CSHeavy1,4,15)
animationSetFrameCDN(*CSHeavy1,5)
animationGetNeutral(*CSHeavy1)=*CSNeutral2
animationGetBack(*CSHeavy1)=*CSBack3
animationPrepareWind(*CSHeavy1)

*CSHeavy1_1WindBack.animation=classGenerateAnimation(3,"image/hand_chopstick_heavy1_1WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind back",0,*CSHeavy1_1WindBackRaw)
For i=1 To 3
	animationSetFrameMovement(*CSHeavy1_1WindBack,i,10)
Next
animationSetFrameLength(*CSHeavy1_1WindBack,1,5)
animationSetFrameLength(*CSHeavy1_1WindBack,2,6)
animationSetFrameLength(*CSHeavy1_1WindBack,3,7)
animationSetFrameOpacity(*CSHeavy1_1WindBack,1,192)
animationSetFrameOpacity(*CSHeavy1_1WindBack,2,128)
animationSetFrameOpacity(*CSHeavy1_1WindBack,3,64)
*CSHeavy1_3WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy1_3WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind back",0,*CSHeavy1_3WindBackRaw)
animationSetFrameLength(*CSHeavy1_3WindBack,1,5)
animationSetFrameOpacity(*CSHeavy1_3WindBack,1,192)
*CSHeavy1_5WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy1_5WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind back",0,*CSHeavy1_5WindBackRaw)
animationSetFrameLength(*CSHeavy1_5WindBack,1,5)
animationSetFrameLength(*CSHeavy1_5WindBack,2,6)
animationSetFrameOpacity(*CSHeavy1_5WindBack,1,192)
animationSetFrameOpacity(*CSHeavy1_5WindBack,2,128)

*CSHeavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind front",0,*CSHeavy1_4WindFrontRaw)
*CSHeavy1_5WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind front",0,*CSHeavy1_5WindFrontRaw)
animationSetFrameLength(*CSHeavy1_5WindFront,1,5)
animationSetFrameLength(*CSHeavy1_5WindFront,2,6)
animationSetFrameOpacity(*CSHeavy1_5WindFront,1,192)
animationSetFrameOpacity(*CSHeavy1_5WindFront,2,128)

*CSHeavy1\frontWind(3,0)=*CSHeavy1_4WindFront
*CSHeavy1\frontWind(4,0)=*CSHeavy1_5WindFront

*CSHeavy1\backWind(0,0)=*CSHeavy1_1WindBack
*CSHeavy1\backWind(2,0)=*CSHeavy1_3WindBack
*CSHeavy1\backWind(4,0)=*CSHeavy1_5WindBack

;------ Heavy 2
*CSHeavy2.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy2_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*CSHeavy2Raw,20,#H2H_DAMAGETYPE_BLUNT,12)
animationSetFrameMovement(*CSHeavy2,1,-122,-107) ; was -122 -107
animationSetFrameMovement(*CSHeavy2,2,-98,114) ; was -98 114
animationSetFrameMovement(*CSHeavy2,3,0,37) ; was 30 37
animationSetFrameSound(*CSHeavy2,1,#H2H_SOUND_ID_SWISHMEDIUM)
ReDim *CSHeavy2\frames(5)
*CSHeavy2\frames(5)=frameDataGive()
frameCopy(*CSHeavy2\frames(5),*CSHeavy2\frames(3),#True)
animationSetFrameSound(*CSHeavy2,3,#H2H_SOUND_ID_BALLPEN_FALL_1)
animationSetFrameShake(*CSHeavy2,3,5)
animationSetFrameCDN(*CSHeavy2,5,3)
animationSetFrameLength(*CSHeavy2,2,3)
animationSetFrameLength(*CSHeavy2,3,3)
animationSetFrameLength(*CSHeavy2,5,10)
animationSetFrameMovement(*CSHeavy2,4,-25,20)
animationSetFrameMovement(*CSHeavy2,5,0,-20)
*CSHeavy2\frames(5)\hurtId=0
locationDestroy(*CSHeavy2\frames(5)\hurtShift)
animationSetUngrounded(*CSHeavy2,1)
*CSHeavy2\frames(5)\hurtShift=0
*CSHeavy2_4WindFront.animation=classGenerateAnimation(3,"image/hand_chopstick_heavy2_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*CSHeavy2_4WindFrontRaw)
animationSetFrameLength(*CSHeavy2_4WindFront,1,5)
animationSetFrameLength(*CSHeavy2_4WindFront,2,6)
animationSetFrameLength(*CSHeavy2_4WindFront,3,7)
animationSetFrameOpacity(*CSHeavy2_4WindFront,1,192)
animationSetFrameOpacity(*CSHeavy2_4WindFront,2,128)
animationSetFrameOpacity(*CSHeavy2_4WindFront,3,64)

*CSHeavy2_1WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_1WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 1 wind back",0,*CSHeavy2_1WindBackRaw)
*CSHeavy2_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_2WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind back",0,*CSHeavy2_2WindBackRaw)
*CSHeavy2_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy2_3WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind back",0,*CSHeavy2_3WindBackRaw)
*CSHeavy2_4WindBack.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy2_4WindBack",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind back",0,*CSHeavy2_4WindBackRaw)
animationSetFrameLength(*CSHeavy2_4WindBack,1,4)
animationSetFrameLength(*CSHeavy2_4WindBack,2,5)
animationSetFrameLength(*CSHeavy2_4WindBack,3,6)
animationSetFrameLength(*CSHeavy2_4WindBack,4,7)
animationSetFrameMovement(*CSHeavy2_4WindBack,2,-40)
animationSetFrameMovement(*CSHeavy2_4WindBack,3,-40)
animationSetFrameMovement(*CSHeavy2_4WindBack,4,-40)
animationSetFrameOpacity(*CSHeavy2_4WindBack,2,192)
animationSetFrameOpacity(*CSHeavy2_4WindBack,3,128)
animationSetFrameOpacity(*CSHeavy2_4WindBack,4,64)

animationPrepareWind(*CSHeavy2)
*CSHeavy2\frontWind(3,0)=*CSHeavy2_4WindFront
*CSHeavy2\backWind(0,0)=*CSHeavy2_1WindBack
*CSHeavy2\backWind(1,0)=*CSHeavy2_2WindBack
*CSHeavy2\backWind(2,0)=*CSHeavy2_3WindBack
*CSHeavy2\backWind(3,0)=*CSHeavy2_4WindBack
animationFreeMovementWind(*CSHeavy2)

animationGetHeavy(*CSBack1)=*CSHeavy2
animationGetBack(*CSHeavy2)=*CSBack2

;------ Heavy 3
*CSHeavy3.animation=classGenerateAnimation(4,"image/hand_chopstick_heavy3_",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3",0,*CSHeavy3Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
For i=1 To 4
	animationSetFrameMovement(*CSHeavy3,i,50)
	animationSetFramePush(*CSHeavy3,i,25)
	frameSetCatch(*CSHeavy3\frames(i),1)
Next
animationSetFramePush(*CSHeavy3,1,75)
animationSetFramePush(*CSHeavy3,4,75)
animationSetFrameGrab(*CSHeavy3,1)
animationSetFrameGrab(*CSHeavy3,2)
animationSetFrameGrab(*CSHeavy3,3)
animationSetFrameGrab(*CSHeavy3,4)

animationSetFrameSound(*CSHeavy3,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationGetHeavy(*CSHeavy1)=*CSHeavy3
animationGetSide(*CSHeavy3)=*CSSide6
animationPrepareWind(*CSHeavy3)

*CSHeavy3_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_2WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 2 wind back",0,*CSheavy3_2WindBackRaw)
*CSHeavy3_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_3WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 3 wind back",0,*CSheavy3_3WindBackRaw)

*CSHeavy3_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_2WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 2 wind front",0,*CSheavy3_2WindFrontRaw)
*CSHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 3 wind front",0,*CSheavy3_3WindFrontRaw)
*CSHeavy3_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy3_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 4 wind front",0,*CSheavy3_4WindFrontRaw)
*CSHeavy3_5WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy3_5WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3 5 wind front",0,*CSheavy3_5WindFrontRaw)
animationSetFrameLength(*CSHeavy3_5WindFront,1,7)
animationSetFrameMovement(*CSHeavy3_5WindFront,0,10)
animationSetFrameMovement(*CSHeavy3_5WindFront,1,10)
animationSetFrameOpacity(*CSHeavy3_5WindFront,1,192)

*CSHeavy3\frontWind(1,0)=*CSHeavy3_2WindFront
*CSHeavy3\frontWind(2,0)=*CSHeavy3_3WindFront
*CSHeavy3\frontWind(3,0)=*CSHeavy3_4WindFront
*CSHeavy3\frontWind(4,0)=*CSHeavy3_5WindFront

*CSHeavy3\backWind(1,0)=*CSHeavy3_2WindBack
*CSHeavy3\backWind(2,0)=*CSHeavy3_3WindBack

;------ heavy 4
*CSHeavy4.animation=classGenerateAnimation(10,"image/hand_chopstick_heavy4_",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4",0,*CSHeavy4Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
For i=0 To 4
	animationSetFrameMovement(*CSHeavy4,i,80-i*8)
	animationSetFrameDamage(*CSHeavy4,i,4)
	animationSetFrameLength(*CSHeavy4,i,4)
Next
animationSetFrameSound(*CSHeavy4,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSHeavy4,4,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSHeavy4,7,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*CSHeavy4,8,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameDamageCut(*CSHeavy4,4)
animationSetFrameStun(*CSHeavy4,7,10)
animationSetFrameStun(*CSHeavy4,8,10)
animationSetFrameStun(*CSHeavy4,9,10)
animationSetFrameStun(*CSHeavy4,10,10)
animationSetFrameMovement(*CSHeavy4,7,-50,-10)
animationSetFrameMovement(*CSHeavy4,8,-80,-10)
animationSetFrameMovement(*CSHeavy4,9,-80,-40)
animationSetFrameMovement(*CSHeavy4,10,-50,10)
animationSetFrameLength(*CSHeavy4,3,7)
animationSetFrameLength(*CSHeavy4,9,7)
animationSetFrameLength(*CSHeavy4,10,7)
animationPrepareWind(*CSHeavy4)
animationGetHeavy(*CSSNeutral6)=*CSHeavy4

*CSHeavy4_2WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_2WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 2 wind back",0,*CSheavy4_2WindBackRaw)
*CSHeavy4_3WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_3WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 3 wind back",0,*CSheavy4_3WindBackRaw)
*CSHeavy4_4WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_4WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 4 wind back",0,*CSheavy4_4WindBackRaw)
animationSetFrameLength(*CSHeavy4_4WindBack,1,6)
animationSetFrameLength(*CSHeavy4_4WindBack,2,7)
animationSetFrameOpacity(*CSHeavy4_4WindBack,1,192)
animationSetFrameOpacity(*CSHeavy4_4WindBack,2,128)
frameSetFreeMovement(*CSHeavy4_4WindBack\frames(1),#True)
*CSHeavy4_5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_5WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 5 wind back",0,*CSheavy4_5WindBackRaw)
*CSHeavy4_6WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_6WindBack",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 6 wind back",0,*CSheavy4_6WindBackRaw)
*CSHeavy4_7WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_7WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 7 wind back",0,*CSheavy4_7WindBackRaw)
animationSetFrameLength(*CSHeavy4_7WindBack,1,6)
animationSetFrameLength(*CSHeavy4_7WindBack,2,7)
animationSetFrameOpacity(*CSHeavy4_7WindBack,1,192)
animationSetFrameOpacity(*CSHeavy4_7WindBack,2,128)
frameSetFreeMovement(*CSHeavy4_7WindBack\frames(1),#True)
*CSHeavy4_9WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_9WindBack",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 9 wind back",0,*CSheavy4_9WindBackRaw)
*CSHeavy4_10WindBack.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_10WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 10 wind back",0,*CSheavy4_10WindBackRaw)
animationSetFrameLength(*CSHeavy4_10WindBack,1,6)
animationSetFrameLength(*CSHeavy4_10WindBack,2,7)
animationSetFrameOpacity(*CSHeavy4_10WindBack,1,192)
animationSetFrameOpacity(*CSHeavy4_10WindBack,2,128)
frameSetFreeMovement(*CSHeavy4_10WindBack\frames(1),#True)

*CSHeavy4_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 1 wind front",0,*CSheavy4_1WindFrontRaw)
*CSHeavy4_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 2 wind front",0,*CSheavy4_2WindFrontRaw)
*CSHeavy4_3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_heavy4_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 3 wind front",0,*CSheavy4_3WindFrontRaw)
animationSetFrameLength(*CSHeavy4_3WindFront,1,6)
animationSetFrameOpacity(*CSHeavy4_3WindFront,1,192)
*CSHeavy4_8WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_8WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 8 wind front",0,*CSheavy4_8WindFrontRaw)
*CSHeavy4_9WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_heavy4_9WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 9 wind front",0,*CSheavy4_9WindFrontRaw)
*CSHeavy4_10WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_heavy4_10WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 4 10 wind front",0,*CSheavy4_10WindFrontRaw)
animationSetFrameLength(*CSHeavy4_10WindFront,1,5)
animationSetFrameLength(*CSHeavy4_10WindFront,2,6)
animationSetFrameOpacity(*CSHeavy4_10WindFront,1,192)
animationSetFrameOpacity(*CSHeavy4_10WindFront,2,128)
frameSetFreeMovement(*CSHeavy4_10WindFront\frames(1),#True)
animationSetFrameMovement(*CSHeavy4_10WindFront,1,30)
animationSetFrameMovement(*CSHeavy4_10WindFront,2,30)

*CSHeavy4\backWind(1,0)=*CSHeavy4_2WindBack
*CSHeavy4\backWind(2,0)=*CSHeavy4_3WindBack
*CSHeavy4\backWind(3,0)=*CSHeavy4_4WindBack
*CSHeavy4\backWind(4,0)=*CSHeavy4_5WindBack
*CSHeavy4\backWind(5,0)=*CSHeavy4_6WindBack
*CSHeavy4\backWind(6,0)=*CSHeavy4_7WindBack
*CSHeavy4\backWind(8,0)=*CSHeavy4_9WindBack
*CSHeavy4\backWind(9,0)=*CSHeavy4_10WindBack

*CSHeavy4\frontWind(0,0)=*CSHeavy4_1WindFront
*CSHeavy4\frontWind(1,0)=*CSHeavy4_2WindFront
*CSHeavy4\frontWind(2,0)=*CSHeavy4_3WindFront
*CSHeavy4\frontWind(3,0)=*CSHeavy4_4WindFront
*CSHeavy4\frontWind(7,0)=*CSHeavy4_8WindFront
*CSHeavy4\frontWind(8,0)=*CSHeavy4_9WindFront
*CSHeavy4\frontWind(9,0)=*CSHeavy4_10WindFront

;------ Hit
*CSHit.animation=classGenerateAnimation(2,"image/hand_chopstick_hit",50,#H2H_ANIMATIONTYPE_HIT,"hit",0,*CSHitRaw)
animationSetFrameShadow(*CSHit,2,50,-100)

;------ Death
*CSDeath.animation=classGenerateAnimation(6,"image/hand_chopstick_death",7,#H2H_ANIMATIONTYPE_DEATH,"death",0,*CSDeathRaw)
animationSetFrameSound(*CSDeath,3,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetFrameShake(*CSDeath,3,2)
animationSetFrameSound(*CSDeath,4,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameShake(*CSDeath,4,10)
animationSetFrameSound(*CSDeath,5,#H2H_SOUND_ID_BALLPEN_FALL_3)
animationSetFrameShake(*CSDeath,5,2)
animationSetFrameSound(*CSDeath,6,#H2H_SOUND_ID_HAND_FALL)

animationSetFrameLength(*CSDeath,1,10)
animationSetFrameLength(*CSDeath,3,10)

animationPrepareWind(*CSDeath)
*CSDeath5WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_death5windback",7,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind back",0,*CSDeath5WindBackRaw)

*CSDeath2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_death2WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind front",0,*CSDeath2WindFrontRaw)
*CSDeath3WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_death3WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind front",0,*CSDeath3WindFrontRaw)
animationSetFrameLength(*CSDeath3WindFront,1,6)
animationSetFrameOpacity(*CSDeath3WindFront,1,192)
*CSDeath4WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_death4WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind front",0,*CSDeath4WindFrontRaw)
animationSetFrameLength(*CSDeath4WindFront,1,6)
animationSetFrameLength(*CSDeath4WindFront,2,7)
animationSetFrameOpacity(*CSDeath4WindFront,1,192)
animationSetFrameOpacity(*CSDeath4WindFront,2,128)
*CSDeath6WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_death6WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front",0,*CSDeath6WindFrontRaw)
animationSetFrameLength(*CSDeath6WindFront,1,6)
animationSetFrameLength(*CSDeath6WindFront,2,7)
animationSetFrameOpacity(*CSDeath6WindFront,1,192)
animationSetFrameOpacity(*CSDeath6WindFront,2,128)

*CSDeath\backWind(4,0)=*CSDeath5WindBack

*CSDeath\frontWind(1,0)=*CSDeath2WindFront
*CSDeath\frontWind(2,0)=*CSDeath3WindFront
*CSDeath\frontWind(3,0)=*CSDeath4WindFront
*CSDeath\frontWind(5,0)=*CSDeath6WindFront

animationSetFrameShadow(*CSDeath,1,50,-50)
animationSetFrameShadow(*CSDeath,2,75,-75)
animationSetFrameShadow(*CSDeath,3,125,-75)
animationSetFrameShadow(*CSDeath,4,100,-25)
animationSetFrameShadow(*CSDeath,5,50,50)
animationSetFrameShadow(*CSDeath,6,0,50)

;------ Spawn
*CSSpawn.animation=classGenerateAnimation(12,"image/hand_chopstick_spawn",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*CSSPawnRaw)

animationSetFrameShake(*CSSpawn,7,10)
animationSetFrameSound(*CSSpawn,7,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*CSSpawn,10,#H2H_SOUND_ID_SWISHMEDIUM)
For i=0 To 5
	animationSetFrameLength(*CSSpawn,i,10)
Next
animationSetFrameLength(*CSSpawn,8,10)
animationSetFrameLength(*CSSpawn,9,8)
animationSetFrameLength(*CSSpawn,11,10)
animationSetFrameLength(*CSSpawn,12,8)
animationPrepareWind(*CSSpawn)

*CSSpawn4WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn4WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind front",0,*CSSpawn4WindFrontRaw)
animationSetFrameLength(*CSSpawn4WindFront,1,8)
animationSetFrameOpacity(*CSSpawn4WindFront,1,192)
*CSSpawn5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn5WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind front",0,*CSSpawn5WindFrontRaw)
*CSSpawn6WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn6WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind front",0,*CSSpawn6WindFrontRaw)
*CSSpawn7WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn7WindFront",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind front",0,*CSSpawn7WindFrontRaw)
*CSSpawn8WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn8WindFront",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind front",0,*CSSpawn8WindFrontRaw)
animationSetFrameLength(*CSSpawn8WindFront,1,6)
animationSetFrameOpacity(*CSSpawn8WindFront,1,192)
*CSSpawn9WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_spawn9WindFront",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind front",0,*CSSpawn9WindFrontRaw)
animationSetFrameLength(*CSSpawn9WindFront,1,6)
animationSetFrameLength(*CSSpawn9WindFront,2,7)
animationSetFrameOpacity(*CSSpawn9WindFront,1,192)
animationSetFrameOpacity(*CSSpawn9WindFront,2,128)
*CSSpawn10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn10WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind front",0,*CSSpawn10WindFrontRaw)
*CSSpawn11WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_spawn11WindFront",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind front",0,*CSSpawn11WindFrontRaw)
animationSetFrameLength(*CSSpawn11WindFront,1,6)
animationSetFrameLength(*CSSpawn11WindFront,2,7)
animationSetFrameOpacity(*CSSpawn11WindFront,1,192)
animationSetFrameOpacity(*CSSpawn11WindFront,2,128)

*CSSpawn10WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_spawn10WindBack",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind back",0,*CSSpawn10WindBackRaw)
*CSSpawn11WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn11WindBack",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind back",0,*CSSpawn11WindBackRaw)
animationSetFrameLength(*CSSpawn11WindBack,1,6)
animationSetFrameOpacity(*CSSpawn11WindBack,1,192)
*CSSpawn12WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_spawn12WindBack",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind back",0,*CSSpawn12WindBackRaw)
animationSetFrameLength(*CSSpawn12WindBack,1,6)
animationSetFrameOpacity(*CSDeath6WindFront,1,192)

*CSSpawn\frontWind( 3,0)=*CSSpawn4WindFront
*CSSpawn\frontWind( 4,0)=*CSSpawn5WindFront
*CSSpawn\frontWind( 5,0)=*CSSpawn6WindFront
*CSSpawn\frontWind( 6,0)=*CSSpawn7WindFront
*CSSpawn\frontWind( 7,0)=*CSSpawn8WindFront
*CSSpawn\frontWind( 8,0)=*CSSpawn9WindFront
*CSSpawn\frontWind( 9,0)=*CSSpawn10WindFront
*CSSpawn\frontWind(10,0)=*CSSpawn11WindFront

*CSSpawn\backWind(9 ,0)=*CSSpawn10WindBack
*CSSpawn\backWind(10,0)=*CSSpawn11WindBack
*CSSpawn\backWind(11,0)=*CSSpawn12WindBack

animationSetFrameShadow(*CSSpawn, 0,0,-200)
animationSetFrameShadow(*CSSpawn, 1,-5,-200)
animationSetFrameShadow(*CSSpawn, 2,0,-200)
animationSetFrameShadow(*CSSpawn, 3,10,-200)
animationSetFrameShadow(*CSSpawn, 4,20,-175)
animationSetFrameShadow(*CSSpawn, 5,20,-170)
animationSetFrameShadow(*CSSpawn, 6,75,-100)
animationSetFrameShadow(*CSSpawn, 7,92,-50)
animationSetFrameShadow(*CSSpawn, 8,100,-25)
animationSetFrameShadow(*CSSpawn, 9,50)
animationSetFrameShadow(*CSSpawn,10,25)

;------ Jump
*CSJump.animation=classGenerateAnimation(5,"image/hand_chopstick_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*CSJumpRaw)

;------ Land
*CSLand.animation=classGenerateAnimation(2,"image/hand_chopstick_land",3,#H2H_ANIMATIONTYPE_LAND,"land",0,*CSLandRaw)
animationShiftShift(*CSLand,0,0,50)
animationShiftShift(*CSLand,1,0,50)
animationShiftShift(*CSLand,2,0,25)
animationSetFrameLength(*CSLand,0,6)
animationSetFrameShadow(*CSLand,0,0,200)
animationSetFrameShadow(*CSLand,1,1,100)
animationSetFrameShadow(*CSLand,2,2,50)

;------ Dodge
*CSDodge.animation=classGenerateAnimation(3,"image/hand_chopstick_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*CSDodgeRaw)
animationSetFrameLength(*CSDodge,0,2)
animationSetFrameLength(*CSDodge,1,2)
animationSetFrameLength(*CSDodge,2,2)

;------ Parry
*CSParry.animation=classGenerateAnimation(6,"image/hand_chopstick_parry",5,#H2H_ANIMATIONTYPE_SELECTION,"Selection",0,*CSParryRaw)

;------ Selection
*CSSelection.animation=classGenerateAnimation(10,"image/hand_chopstick_selection",10,#H2H_ANIMATIONTYPE_SELECTION,"Selection",0,*CSSelectionRaw)
*CSSelection\loopStart=5
animationSetFrameLength(*CSSelection,0,10)
animationSetFrameLength(*CSSelection,1,4)
animationSetFrameLength(*CSSelection,2,5)
animationSetFrameLength(*CSSelection,3,6)
animationSetFrameLength(*CSSelection,4,7)
animationSetFrameShadow(*CSSelection,0,-4)
animationSetFrameShadow(*CSSelection,1,-8)
animationSetFrameShadow(*CSSelection,2,-12)
animationSetFrameShadow(*CSSelection,3,-16)
For i=4 To 10
	animationSetFrameShadow(*CSSelection,i,-20)
Next

*CSSelection_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selection2WindFront",4,#H2H_ANIMATIONTYPE_SELECTION,"Selection 2 wind front",0,*CSSelection_2WindFrontRaw)
*CSSelection_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selection3WindFront",5,#H2H_ANIMATIONTYPE_SELECTION,"Selection 3 wind front",0,*CSSelection_3WindFrontRaw)
*CSSelection_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selection4WindFront",6,#H2H_ANIMATIONTYPE_SELECTION,"Selection 4 wind front",0,*CSSelection_4WindFrontRaw)
*CSSelection_5WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_selection5WindFront",5,#H2H_ANIMATIONTYPE_SELECTION,"Selection 5 wind front",0,*CSSelection_5WindFrontRaw)
animationSetFrameOpacity(*CSSelection_5WindFront,1,192)
animationSetFrameOpacity(*CSSelection_5WindFront,2,128)
animationSetFrameLength(*CSSelection_5WindFront,1,6)
animationSetFrameLength(*CSSelection_5WindFront,2,7)
*CSSelection_10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selection10WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 10 wind front",0,*CSSelection_10WindFrontRaw)
*CSSelection_11WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_selection11WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 11 wind front",0,*CSSelection_11WindFrontRaw)
animationSetFrameOpacity(*CSSelection_11WindFront,1,192)
animationSetFrameOpacity(*CSSelection_11WindFront,2,128)
animationSetFrameLength(*CSSelection_11WindFront,1,6)
animationSetFrameLength(*CSSelection_11WindFront,2,7)

animationPrepareWind(*CSSelection,0)
*CSSelection\frontWind(1,0)=*CSSelection_2WindFront
*CSSelection\frontWind(2,0)=*CSSelection_3WindFront
*CSSelection\frontWind(3,0)=*CSSelection_4WindFront
*CSSelection\frontWind(4,0)=*CSSelection_5WindFront
*CSSelection\frontWind(9,0)=*CSSelection_10WindFront
*CSSelection\frontWind(10,0)=*CSSelection_11WindFront

;------ Selected
*CSSelected.animation=classGenerateAnimation(21,"image/hand_chopstick_selected",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected",1,*CSSelectedRaw)
*CSSelected\loopStart=14
animationSetFrameSound(*CSSelected,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSSelected,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSSelected,7,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*CSSelected,10,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameLength(*CSSelected,0,2)
animationSetFrameLength(*CSSelected,1,3)
animationSetFrameLength(*CSSelected,2,3)
animationSetFrameLength(*CSSelected,3,3)
animationSetFrameLength(*CSSelected,4,2)
animationSetFrameLength(*CSSelected,5,5)
animationSetFrameLength(*CSSelected,6,10)
animationSetFrameLength(*CSSelected,7,2)
animationSetFrameLength(*CSSelected,8,3)
animationSetFrameLength(*CSSelected,9,6)
animationSetFrameLength(*CSSelected,10,5)
animationSetFrameLength(*CSSelected,12,3)
animationSetFrameLength(*CSSelected,13,5)
For i=14 To 21
	animationSetFrameLength(*CSSelected,i,10)
Next
animationSetFrameShadow(*CSSelected,0,-20)
animationSetFrameShadow(*CSSelected,1,-10)
animationSetFrameShadow(*CSSelected,3,20)
animationSetFrameShadow(*CSSelected,4,64,-16)
animationSetFrameShadow(*CSSelected,5,64,-18)
animationSetFrameShadow(*CSSelected,6,64,-20)
animationSetFrameShadow(*CSSelected,7,32,-20)
animationSetFrameShadow(*CSSelected,8,32,-20)
animationSetFrameShadow(*CSSelected,9,16,-10)
animationSetFrameShadow(*CSSelected,10,-22)
animationSetFrameShadow(*CSSelected,11,-22)
animationSetFrameShadow(*CSSelected,12,-22)
animationSetFrameShadow(*CSSelected,13,-14)
animationSetFrameShadow(*CSSelected,14,-22)
animationSetFrameShadow(*CSSelected,15,-20)
animationSetFrameShadow(*CSSelected,16,-22)
animationSetFrameShadow(*CSSelected,17,-14)
animationSetFrameShadow(*CSSelected,18,-14)
animationSetFrameShadow(*CSSelected,19,-22)
animationSetFrameShadow(*CSSelected,20,-20)
animationSetFrameShadow(*CSSelected,21,-22)
*CSSelected_1WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected1WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 1 wind front",0,*CSSelected_1WindFrontRaw)
*CSSelected_2WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected2WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind front",0,*CSSelected_2WindFrontRaw)
*CSSelected_3WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected3WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind front",0,*CSSelected_3WindFrontRaw)
*CSSelected_4WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected4WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind front",0,*CSSelected_4WindFrontRaw)
*CSSelected_5WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected5WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind front",0,*CSSelected_5WindFrontRaw)
*CSSelected_6WindFront.animation=classGenerateAnimation(5,"image/hand_chopstick_selected6WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind front",0,*CSSelected_6WindFrontRaw)
animationSetFrameLength(*CSSelected_6WindFront,1,4)
animationSetFrameLength(*CSSelected_6WindFront,2,5)
animationSetFrameLength(*CSSelected_6WindFront,3,6)
animationSetFrameLength(*CSSelected_6WindFront,4,7)
animationSetFrameLength(*CSSelected_6WindFront,5,8)
animationSetFrameOpacity(*CSSelected_6WindFront,3,192)
animationSetFrameOpacity(*CSSelected_6WindFront,4,128)
animationSetFrameOpacity(*CSSelected_6WindFront,5,64)
*CSSelected_8WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected8WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind front",0,*CSSelected_8WindFrontRaw)
*CSSelected_9WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected9WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind front",0,*CSSelected_9WindFrontRaw)
*CSSelected_10WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected10WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind front",0,*CSSelected_10WindFrontRaw)
*CSSelected_11WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected11WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 11 wind front",0,*CSSelected_11WindFrontRaw)
*CSSelected_12WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected12WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind front",0,*CSSelected_12WindFrontRaw)
*CSSelected_13WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected13WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 13 wind front",0,*CSSelected_13WindFrontRaw)
*CSSelected_14WindFront.animation=classGenerateAnimation(4,"image/hand_chopstick_selected14WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 14 wind front",0,*CSSelected_14WindFrontRaw)
animationSetFrameLength(*CSSelected_14WindFront,1,5)
animationSetFrameLength(*CSSelected_14WindFront,2,6)
animationSetFrameLength(*CSSelected_14WindFront,3,7)
animationSetFrameLength(*CSSelected_14WindFront,4,8)
animationSetFrameOpacity(*CSSelected_14WindFront,2,192)
animationSetFrameOpacity(*CSSelected_14WindFront,3,128)
animationSetFrameOpacity(*CSSelected_14WindFront,4,64)
*CSSelected_17WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_selected17WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 17 wind front",0,*CSSelected_17WindFrontRaw)
animationSetFrameLength(*CSSelected_17WindFront,1,7)
animationSetFrameOpacity(*CSSelected_17WindFront,1,192)
*CSSelected_19WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected19WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 19 wind front",0,*CSSelected_19WindFrontRaw)
*CSSelected_20WindFront.animation=classGenerateAnimation(1,"image/hand_chopstick_selected20WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 20 wind front",0,*CSSelected_20WindFrontRaw)
animationSetFrameLength(*CSSelected_20WindFront,1,7)
animationSetFrameOpacity(*CSSelected_20WindFront,1,192)
*CSSelected_21WindFront.animation=classGenerateAnimation(0,"image/hand_chopstick_selected21WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 21 wind front",0,*CSSelected_21WindFrontRaw)
*CSSelected_22WindFront.animation=classGenerateAnimation(2,"image/hand_chopstick_selected22WindFront",10,#H2H_ANIMATIONTYPE_SELECTED,"Selected 22 wind front",0,*CSSelected_22WindFrontRaw)
animationSetFrameLength(*CSSelected_22WindFront,1,6)
animationSetFrameLength(*CSSelected_22WindFront,2,7)
animationSetFrameOpacity(*CSSelected_22WindFront,1,192)
animationSetFrameOpacity(*CSSelected_22WindFront,2,128)

*CSSelected_8WindBack.animation=classGenerateAnimation(1,"image/hand_chopstick_selected8WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind back",0,*CSSelected_8WindBackRaw)
animationSetFrameLength(*CSSelected_8WindBack,1,6)
animationSetFrameOpacity(*CSSelected_8WindBack,1,192)
*CSSelected_10WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_selected10WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind back",0,*CSSelected_10WindBackRaw)
*CSSelected_11WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_selected11WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 11 wind back",0,*CSSelected_11WindBackRaw)
*CSSelected_12WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_selected12WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind back",0,*CSSelected_12WindBackRaw)
*CSSelected_13WindBack.animation=classGenerateAnimation(0,"image/hand_chopstick_selected13WindBack",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 13 wind back",0,*CSSelected_13WindBackRaw)
*CSSelected_14WindBack.animation=classGenerateAnimation(4,"image/hand_chopstick_selected14WindBack",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 14 wind back",0,*CSSelected_14WindBackRaw)
animationSetFrameLength(*CSSelected_14WindBack,1,4)
animationSetFrameLength(*CSSelected_14WindBack,2,5)
animationSetFrameLength(*CSSelected_14WindBack,3,6)
animationSetFrameLength(*CSSelected_14WindBack,4,7)
animationSetFrameOpacity(*CSSelected_14WindBack,2,192)
animationSetFrameOpacity(*CSSelected_14WindBack,3,128)
animationSetFrameOpacity(*CSSelected_14WindBack,4,64)

animationPrepareWind(*CSSelected,0)
*CSSelected\frontWind(0,0)=*CSSelected_1WindFront
*CSSelected\frontWind(1,0)=*CSSelected_2WindFront
*CSSelected\frontWind(2,0)=*CSSelected_3WindFront
*CSSelected\frontWind(3,0)=*CSSelected_4WindFront
*CSSelected\frontWind(4,0)=*CSSelected_5WindFront
*CSSelected\frontWind(5,0)=*CSSelected_6WindFront
*CSSelected\frontWind(7,0)=*CSSelected_8WindFront
*CSSelected\frontWind(8,0)=*CSSelected_9WindFront
*CSSelected\frontWind(9,0)=*CSSelected_10WindFront
*CSSelected\frontWind(10,0)=*CSSelected_11WindFront
*CSSelected\frontWind(11,0)=*CSSelected_12WindFront
*CSSelected\frontWind(12,0)=*CSSelected_13WindFront
*CSSelected\frontWind(13,0)=*CSSelected_14WindFront
*CSSelected\frontWind(16,0)=*CSSelected_17WindFront
*CSSelected\frontWind(18,0)=*CSSelected_19WindFront
*CSSelected\frontWind(19,0)=*CSSelected_20WindFront
*CSSelected\frontWind(20,0)=*CSSelected_21WindFront
*CSSelected\frontWind(21,0)=*CSSelected_22WindFront
*CSSelected\backWind(7,0)=*CSSelected_8WindBack
*CSSelected\backWind(9,0)=*CSSelected_10WindBack
*CSSelected\backWind(10,0)=*CSSelected_11WindBack
*CSSelected\backWind(11,0)=*CSSelected_12WindBack
*CSSelected\backWind(12,0)=*CSSelected_13WindBack
*CSSelected\backWind(13,0)=*CSSelected_14WindBack

;------- Branch
*chopstick_stat.statistic=statisticCreate(0,2,7,6,1,1,3,-1,5,5,7,6)
; *chopstick_stat.statistic=statisticCreate(0,1,4,4,0,0,1,-1,3,3,4,6)
ReDim *tmpArray(2)
*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*tmpArray(2)=*crack_hitS
*chopstick_stance_metal.stance=stanceCreate(*tmpArray(),0,"Metal")
*chopstick_stance_metal\specialcolor=#H2H_STANCE_COLOR_METAL
*chopstick_stance_metal\alternatecolor=#H2H_STANCE_COLOR_LIGHTMETAL
*chopstick_stance_metal\badge=#H2H_STANCE_BADGE_BRUISER
; statisticCreate(*chopstick_stance_metal\modificator,0,-1,0,1,0,0,0,0,0,0)
statisticCreate(*chopstick_stance_metal\modificator,0,-2,0,2,0,0,0,0,0,0)

*tmpArray(0)=*plastic_hit
*chopstick_stance_plastic.stance=stanceCreate(*tmpArray(),0,"Plastic")
*chopstick_stance_plastic\badge=#H2H_STANCE_BADGE_RESILLIENT
statisticCreate(*chopstick_stance_plastic\modificator,0,0,0,0,0,0,0,-2,2,0)
; statisticCreate(*chopstick_stance_plastic\modificator,0,0,0,0,0,0,0,1,-1,0)

*chopstick.class=classCreate(0,"Chopstick", *CSIdle1, *CSMoveFront, *CSMoveBack, *CSNeutral1,*CSSide1,*CSUp1,*CSBack1,*CSDown1,*CSHeavy1)

classGetDeath(*chopstick)=*CSDeath
classGetSpawn(*chopstick)=*CSSpawn
classGetJump(*chopstick)=*CSJump
classGetLand(*chopstick)=*CSLand
classGetHit(*chopstick)=*CSHit
classGetDodge(*chopstick)=*CSDodge
classGetParry(*chopstick)=*CSParry
classGetSelection(*chopstick)=*CSSelection
classGetSelected(*chopstick)=*CSSelected

classAddStance(*chopstick,*chopstick_stance_metal)
classAddStance(*chopstick,*chopstick_stance_plastic)

*chopstick\allStances(0)\name="Wood (default)"
*chopstick\allStances(0)\specialcolor=#H2H_STANCE_COLOR_WOOD
*chopstick\allStances(0)\alternatecolor=(#H2H_STANCE_COLOR_LIGHTWOOD&$FFFFFF)+$60000000
*chopstick\allStances(0)\badge=#H2H_STANCE_BADGE_EVADER
; *chopstick\allStances(0)\alternateTransparency=96
Dim *chopstick\allStances(0)\materialClass(2)
*chopstick\allStances(0)\materialClass(0)=*wood_hit
*chopstick\allStances(0)\materialClass(1)=*finger_hit
*chopstick\allStances(0)\materialClass(2)=*crack_hitS
*chopstick\iconPath$="image\Chopstick.png"

*chopstick\stat=*chopstick_stat

; *chopstick\desc$="Very balanced long ranged fighter. Its long reach makes it excellent to keep the distance,\coupled with very good agility. The defense would be on maintaining pressure\than taking hits, as it lacks of any flesh to absorb attacks."
*chopstick\desc$="Long ranged agile spear fighter, expert at messing around enemies by staying at distance even cornered. However it doesn't have much flesh to take the hits, nor punching harder."

Dim *chopstick\otherIdle(1)
*chopstick\otherIdle(0)=*CSIdle2
*chopstick\otherIdle(1)=*CSIdle3
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1875
; FirstLine = 1850
; EnableXP
; CPU = 1
; DisableDebugger