;------ Unarmed

;------- Idle 1 new
*unarmed_Idle1.animation=classGenerateAnimation(9,"image/hand_unarmed_idle1_",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 new",1,*UAIdle1Raw)

setFrameLength(*unarmed_Idle1,1,5)
setFrameLength(*unarmed_Idle1,2,4)
setFrameLength(*unarmed_Idle1,6,4)
setFrameLength(*unarmed_Idle1,7,5)

animationPrepareWind(*unarmed_Idle1)
*unarmed_Idle1_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle1_1windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 wind front",0,*UAIdle1_1WindFrontRaw)
*unarmed_Idle1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_2windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 wind front",0,*UAIdle1_2WindFrontRaw)
*unarmed_Idle1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_3windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 3 wind front",0,*UAIdle1_3WindFrontRaw)
*unarmed_Idle1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_5windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 wind front",0,*UAIdle1_5WindFrontRaw)
*unarmed_Idle1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle1_6windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 6 wind front",0,*UAIdle1_6WindFrontRaw)

*unarmed_Idle1\frontWind(0,0)=*unarmed_Idle1_1WindFront
*unarmed_Idle1\frontWind(1,0)=*unarmed_Idle1_2WindFront
*unarmed_Idle1\frontWind(2,0)=*unarmed_Idle1_3WindFront
*unarmed_Idle1\frontWind(4,0)=*unarmed_Idle1_5WindFront
*unarmed_Idle1\frontWind(5,0)=*unarmed_Idle1_6WindFront

assert(*unarmed_Idle1\frontWind())

frameShiftShift(*unarmed_Idle1,1,5)
frameShiftShift(*unarmed_Idle1,2,20)
frameShiftShift(*unarmed_Idle1,3,10)
frameShiftShift(*unarmed_Idle1,4,5)
frameShiftShift(*unarmed_Idle1,6,5,5)
frameShiftShift(*unarmed_Idle1,7,10,10)
frameShiftShift(*unarmed_Idle1,8,10,20)
frameShiftShift(*unarmed_Idle1,9,5,10)

setFrameShadow(*unarmed_Idle1,1,5)
setFrameShadow(*unarmed_Idle1,2,20)
setFrameShadow(*unarmed_Idle1,3,10)
setFrameShadow(*unarmed_Idle1,4,5)
setFrameShadow(*unarmed_Idle1,6,5,5)
setFrameShadow(*unarmed_Idle1,7,10,10)
setFrameShadow(*unarmed_Idle1,8,10,20)
setFrameShadow(*unarmed_Idle1,9,5,10)

;------- Idle 2
*unarmed_Idle2.animation=classGenerateAnimation(7,"image/hand_unarmed_idle2_",3,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*UAIdle2Raw)
setFrameLength(*unarmed_Idle2,3,4)
setFrameLength(*unarmed_Idle2,4,8)
setFrameLength(*unarmed_Idle2,6,5)
setFrameLength(*unarmed_Idle2,7,8)
frameShiftShift(*unarmed_Idle2,1,5)
frameShiftShift(*unarmed_Idle2,2,10)
frameShiftShift(*unarmed_Idle2,3,15)
frameShiftShift(*unarmed_Idle2,4,20)
frameShiftShift(*unarmed_Idle2,5,10)
frameShiftShift(*unarmed_Idle2,6,-5)
frameShiftShift(*unarmed_Idle2,7,-20)

setFrameShadow(*unarmed_Idle2,1,5)
setFrameShadow(*unarmed_Idle2,2,10)
setFrameShadow(*unarmed_Idle2,3,15)
setFrameShadow(*unarmed_Idle2,4,20)
setFrameShadow(*unarmed_Idle2,5,10)
setFrameShadow(*unarmed_Idle2,6,-5)
setFrameShadow(*unarmed_Idle2,7,-20)

animationPrepareWind(*unarmed_Idle2)
*unarmed_Idle2_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle2_5WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*UAIdle2_5WindFrontRaw)
*unarmed_Idle2_6WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind front",0,*UAIdle2_6WindFrontRaw)
*unarmed_Idle2_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_7WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 7 wind front",0,*UAIdle2_7WindFrontRaw)
*unarmed_Idle2_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_8WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 8 wind front",0,*UAIdle2_8WindFrontRaw)
frameShiftShift(*unarmed_Idle2_8WindFront,0,-30)

*unarmed_Idle2\frontWind(4,0)=*unarmed_Idle2_5WindFront
*unarmed_Idle2\frontWind(5,0)=*unarmed_Idle2_6WindFront
*unarmed_Idle2\frontWind(6,0)=*unarmed_Idle2_7WindFront
*unarmed_Idle2\frontWind(7,0)=*unarmed_Idle2_8WindFront

;------- Front 1
*unarmed_Move_Front1.animation=classGenerateAnimation(6,"image/hand_unarmed_move_front1_",3,#H2H_ANIMATIONTYPE_FRONT,"front 1",1,*UAMoveFront1Raw)
frameShiftShift(*unarmed_Move_Front1,0,10,-10)
frameShiftShift(*unarmed_Move_Front1,1,15,-15)
frameShiftShift(*unarmed_Move_Front1,2,20,-20)
frameShiftShift(*unarmed_Move_Front1,3,10,-10)
frameShiftShift(*unarmed_Move_Front1,4,0,0)
frameShiftShift(*unarmed_Move_Front1,5,-10,-10)
frameShiftShift(*unarmed_Move_Front1,6,-20,-20)
Dim *tmpArray(6)
For i=0 To 6
	*tmpArray(i)=*unarmed_Move_Front1\frames(i)
Next
ReDim *unarmed_Move_Front1\frames(11)
; special shift
*unarmed_Move_Front1\frames(0)=*tmpArray(0)
*unarmed_Move_Front1\frames(1)=*tmpArray(1)
*unarmed_Move_Front1\frames(2)=*tmpArray(2)
*unarmed_Move_Front1\frames(3)=*tmpArray(1)
*unarmed_Move_Front1\frames(4)=*tmpArray(0)
*unarmed_Move_Front1\frames(5)=*tmpArray(3)
*unarmed_Move_Front1\frames(6)=*tmpArray(4)
*unarmed_Move_Front1\frames(7)=*tmpArray(5)
*unarmed_Move_Front1\frames(8)=*tmpArray(6)
*unarmed_Move_Front1\frames(9)=*tmpArray(5)
*unarmed_Move_Front1\frames(10)=*tmpArray(4)
*unarmed_Move_Front1\frames(11)=*tmpArray(3)
setFrameLength(*unarmed_Move_Front1,2,6)
setFrameLength(*unarmed_Move_Front1,8,6)

*unarmed_Move_Front1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_1windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 1",0,*UAMoveFront1_1WindFrontRaw)
*unarmed_Move_Front1_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_front1_2windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 2",0,*UAMoveFront1_2WindFrontRaw)
*unarmed_Move_Front1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_5windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 5",0,*UAMoveFront1_5WindFrontRaw)
*unarmed_Move_Front1_6WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_6windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 6",0,*UAMoveFront1_6WindFrontRaw)
*unarmed_Move_Front1_7WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_front1_7windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 7",0,*UAMoveFront1_7WindFrontRaw)
*unarmed_Move_Front1_12WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_12windfront",3,#H2H_ANIMATIONTYPE_FRONT,"front wind front 12",0,*UAMoveFront1_12WindFrontRaw)

*unarmed_Move_Front1_11WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_11windback",3,#H2H_ANIMATIONTYPE_FRONT,"front wind back 11",0,*UAMoveFront1_11WindBackRaw)
*unarmed_Move_Front1_12WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_12windback",3,#H2H_ANIMATIONTYPE_FRONT,"front wind back 12",0,*UAMoveFront1_12WindBackRaw)

animationPrepareWind(*unarmed_Move_Front1)
*unarmed_Move_Front1\frontWind(0,0)=*unarmed_Move_Front1_1WindFront
*unarmed_Move_Front1\frontWind(1,0)=*unarmed_Move_Front1_2WindFront
*unarmed_Move_Front1\frontWind(4,0)=*unarmed_Move_Front1_5WindFront
*unarmed_Move_Front1\frontWind(5,0)=*unarmed_Move_Front1_6WindFront
*unarmed_Move_Front1\frontWind(6,0)=*unarmed_Move_Front1_7WindFront
*unarmed_Move_Front1\frontWind(11,0)=*unarmed_Move_Front1_12WindFront

*unarmed_Move_Front1\backWind(10,0)=*unarmed_Move_Front1_11WindBack
*unarmed_Move_Front1\backWind(11,0)=*unarmed_Move_Front1_12WindBack

;------- Move Back 1
*unarmed_Move_Back1.animation=classGenerateAnimation(10,"image/hand_unarmed_move_back1_",5,#H2H_ANIMATIONTYPE_BACK,"back",1,*UAMoveBack1Raw)
*unarmed_Move_Back1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_1windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 1",0,*UAMoveBack1_1WindFrontRaw)
*unarmed_Move_Back1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_2windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 2",0,*UAMoveBack1_2WindFrontRaw)
*unarmed_Move_Back1_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_back1_3windfront",3,#H2H_ANIMATIONTYPE_BACK,"back wind front 3",0,*UAMoveBack1_3WindFrontRaw)
*unarmed_Move_Back1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_4windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 4",0,*UAMoveBack1_4WindFrontRaw)
*unarmed_Move_Back1_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_7windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 7",0,*UAMoveBack1_7WindFrontRaw)
*unarmed_Move_Back1_9WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_9windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 9",0,*UAMoveBack1_9WindFrontRaw)
*unarmed_Move_Back1_11WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_11windfront",5,#H2H_ANIMATIONTYPE_BACK,"back wind front 11",0,*UAMoveBack1_11WindFrontRaw)

animationPrepareWind(*unarmed_Move_Back1)
*unarmed_Move_Back1\frontWind(0,0)=*unarmed_Move_Back1_1WindFront
*unarmed_Move_Back1\frontWind(1,0)=*unarmed_Move_Back1_2WindFront
*unarmed_Move_Back1\frontWind(2,0)=*unarmed_Move_Back1_3WindFront
*unarmed_Move_Back1\frontWind(3,0)=*unarmed_Move_Back1_4WindFront
*unarmed_Move_Back1\frontWind(6,0)=*unarmed_Move_Back1_7WindFront
*unarmed_Move_Back1\frontWind(8,0)=*unarmed_Move_Back1_9WindFront
*unarmed_Move_Back1\frontWind(10,0)=*unarmed_Move_Back1_11WindFront

;------- Neutral 1
*UANeutral1.animation=classGenerateAnimation(5,"image/hand_unarmed_neutral1_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*UANeutral1Raw,10,#H2H_DAMAGETYPE_BLUNT,3)
setFrameCanDoNext(*UANeutral1,5,4)
setFrameSound(*UANeutral1,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UANeutral1,3,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UANeutral1,5,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameLength(*UANeutral1,0,2)
setFrameLength(*UANeutral1,2,2)
setFrameLength(*UANeutral1,4,2)
setFrameLength(*UANeutral1,5,8)
setFrameMovement(*UANeutral1,0,10)
setFrameMovement(*UANeutral1,1,-40)
setFrameMovement(*UANeutral1,2,10)
setFrameMovement(*UANeutral1,3,-40)
setFrameMovement(*UANeutral1,4,10)
setFrameMovement(*UANeutral1,5,-40)
enableFrameDamageCut(*UANeutral1,2)
enableFrameDamageCut(*UANeutral1,4)

*UANeutral1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*UANeutral1_2WindFrontRaw)
setFrameLength(*UANeutral1_2WindFront,1,4)
setFrameLength(*UANeutral1_2WindFront,2,5)
*UANeutral1_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral1_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*UANeutral1_4WindFrontRaw)
setFrameLength(*UANeutral1_4WindFront,1,4)
*UANeutral1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral1_6WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind front",0,*UANeutral1_6WindFrontRaw)
setFrameLength(*UANeutral1_6WindFront,1,4)

*UANeutral1_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_4WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind back",0,*UANeutral1_4WindBackRaw)
setFrameLength(*UANeutral1_4WindBack,1,4)
setFrameLength(*UANeutral1_4WindBack,2,5)
*UANeutral1_6WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_6WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind back",0,*UANeutral1_6WindBackRaw)
setFrameLength(*UANeutral1_4WindBack,1,4)
setFrameLength(*UANeutral1_4WindBack,2,5)

animationPrepareWind(*UANeutral1,0)
*UANeutral1\frontWind(1,0)=*UANeutral1_2WindFront
*UANeutral1\frontWind(3,0)=*UANeutral1_4WindFront
*UANeutral1\frontWind(5,0)=*UANeutral1_6WindFront
*UANeutral1\backWind(3,0)=*UANeutral1_4WindBack
*UANeutral1\backWind(5,0)=*UANeutral1_6WindBack
animationFreeMovementWind(*UANeutral1)

;------- Neutral 2
*UANeutral2.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral2_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2",0,*UANeutral2Raw,12,#H2H_DAMAGETYPE_BLUNT,5)
setFrameCanDoNext(*UANeutral2,2,3)
animationUngrounded(*UANeutral2)
setFrameSound(*UANeutral2,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameMovement(*UANeutral2,0,10)
setFrameMovement(*UANeutral2,1,-40,10)
setFrameMovement(*UANeutral2,2,-40,10)
setFrameLength(*UANeutral2,2,8)
*UANeutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral2_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 1 wind front",0,*UANeutral2_1WindFrontRaw)
*UANeutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral2_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 2 wind front",0,*UANeutral2_2WindFrontRaw)
*UANeutral2_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral2_3WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind front",0,*UANeutral2_3WindFrontRaw)
setFrameLength(*UANeutral2_3WindFront,1,3)
animationPrepareWind(*UANeutral2,0)
*UANeutral2\frontWind(0,0)=*UANeutral2_1WindFront
*UANeutral2\frontWind(1,0)=*UANeutral2_2WindFront
*UANeutral2\frontWind(2,0)=*UANeutral2_3WindFront
animationFreeMovementWind(*UANeutral2)

animationGetNeutral(*UANeutral1)=*UANeutral2

;------- Neutral 3
*UANeutral3.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral3_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*UANeutral3Raw,12,#H2H_DAMAGETYPE_BLUNT,5)
setFrameCanDoNext(*UANeutral3,2,1)
animationUngrounded(*UANeutral3)
setFrameLength(*UANeutral3,1,5)
setFrameLength(*UANeutral3,2,7)
setFrameSound(*UANeutral3,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameMovement(*UANeutral3,0,-30,-10)
setFrameMovement(*UANeutral3,1,-30,-10)

*UANeutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral3_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind front",0,*UANeutral3_1WindFrontRaw)
*UANeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral3_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*UANeutral3_2WindFrontRaw)
setFrameLength(*UANeutral3_2WindFront,1,4)
setFrameLength(*UANeutral3_2WindFront,2,5)

*UANeutral3_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral3_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind back",0,*UANeutral3_1WindBackRaw)

animationPrepareWind(*UANeutral3,0)
*UANeutral3\frontWind(0,0)=*UANeutral3_1WindFront
*UANeutral3\frontWind(1,0)=*UANeutral3_2WindFront
*UANeutral3\backWind(0,0)=*UANeutral3_1WindBack
animationFreeMovementWind(*UANeutral3)
animationGetNeutral(*UANeutral2)=*UANeutral3

;------- Neutral 4
*unarmed_Neutral4.animation=classGenerateAnimation(4,"image/hand_unarmed_neutral4_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4",0,*UANeutral4Raw,20,#H2H_DAMAGETYPE_BLUNT,8)
setFrameMovement(*unarmed_Neutral4,0,20,-5)
setFrameMovement(*unarmed_Neutral4,1,25,0)
setFrameMovement(*unarmed_Neutral4,2,-40,-30)
setFrameMovement(*unarmed_Neutral4,3,-40,-30)
setFrameMovement(*unarmed_Neutral4,4,-5,30)
setFrameGrab(*unarmed_Neutral4,2)
setFrameGrab(*unarmed_Neutral4,3)
setFrameSound(*unarmed_Neutral4,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*unarmed_Neutral4,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameLength(*unarmed_Neutral4,1,6)
setFrameLength(*unarmed_Neutral4,3,6)
setFrameLength(*unarmed_Neutral4,4,10)
setFrameCanDoNext(*unarmed_Neutral4,4,5)
animationPrepareWind(*unarmed_Neutral4)

*unarmed_neutral4_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 1 wind back",0,*UANeutral4_1WindBackRaw)
*unarmed_neutral4_2WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 2 wind back",0,*UANeutral4_2WindBackRaw)
*unarmed_neutral4_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 3 wind back",0,*UANeutral4_3WindBackRaw)
*unarmed_neutral4_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_4WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 4 wind back",0,*UANeutral4_4WindBackRaw)

*unarmed_neutral4_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 2 wind front",0,*UANeutral4_2WindFrontRaw)
*unarmed_neutral4_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 5 wind front",0,*UANeutral4_5WindFrontRaw)

*unarmed_Neutral4\backWind(0,0)=*unarmed_neutral4_1WindBack
*unarmed_Neutral4\backWind(1,0)=*unarmed_neutral4_2WindBack
*unarmed_Neutral4\backWind(2,0)=*unarmed_neutral4_3WindBack
*unarmed_Neutral4\backWind(3,0)=*unarmed_neutral4_4WindBack

*unarmed_Neutral4\frontWind(1,0)=*unarmed_neutral4_4WindFront
*unarmed_Neutral4\frontWind(4,0)=*unarmed_neutral4_5WindFront

animationFreeMovementWind(*unarmed_neutral4)

;------- Side 1 new
*unarmed_Side1.animation=classGenerateAnimation(9,"image/hand_unarmed_side1_",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 new",0,*UASide1Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
setFrameSound(*unarmed_Side1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*unarmed_Side1,7,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
enableFrameDamageCut(*unarmed_Side1,6)
setFrameLength(*unarmed_Side1,0,2)
setFrameLength(*unarmed_Side1,1,4)
setFrameLength(*unarmed_Side1,3,2)
setFrameLength(*unarmed_Side1,4,5)
setFrameLength(*unarmed_Side1,6,2)
setFrameLength(*unarmed_Side1,7,2)
setFrameLength(*unarmed_Side1,9,12)
*unarmed_Side1\frames(9)\damageDuration=4
setFrameMovement(*unarmed_Side1,0,30)
setFrameMovement(*unarmed_Side1,1,10)
setFrameMovement(*unarmed_Side1,2,-20)
setFrameMovement(*unarmed_Side1,3,-20,-50)
setFrameMovement(*unarmed_Side1,4,-20)
setFrameMovement(*unarmed_Side1,5,-20)
setFrameMovement(*unarmed_Side1,6,0,25)
setFrameMovement(*unarmed_Side1,7,-10,25)
setFrameMovement(*unarmed_Side1,8,-40,25)
setFrameMovement(*unarmed_Side1,9,-40)
setFrameCanDoNext(*unarmed_Side1,9,4)
animationPrepareWind(*unarmed_Side1)

*unarmed_Side1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_1WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind front",0,*UASide1_1WindFrontRaw)
animationFreeMovement(*unarmed_Side1_1WindFront)
*unarmed_Side1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side1_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind front",0,*UASide1_2WindFrontRaw)
animationFreeMovement(*unarmed_Side1_2WindFront)
*unarmed_Side1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind front",0,*UASide1_3WindFrontRaw)
animationFreeMovement(*unarmed_Side1_3WindFront)
*unarmed_Side1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind front",0,*UASide1_4WindFrontRaw)
animationFreeMovement(*unarmed_Side1_4WindFront)
*unarmed_Side1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind front",0,*UASide1_5WindFrontRaw)
animationFreeMovement(*unarmed_Side1_5WindFront)
*unarmed_Side1_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side1_6WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind front",0,*UASide1_6WindFrontRaw)
animationFreeMovement(*unarmed_Side1_6WindFront)
*unarmed_Side1_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_8WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 8 wind front",0,*UASide1_8WindFrontRaw)
animationFreeMovement(*unarmed_Side1_8WindFront)
*unarmed_Side1_9WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side1_9WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 9 wind front",0,*UASide1_9WindFrontRaw)
animationFreeMovement(*unarmed_Side1_9WindFront)
*unarmed_Side1_10WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side1_10WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 10 wind front",0,*UASide1_10WindFrontRaw)
animationFreeMovement(*unarmed_Side1_10WindFront)

*unarmed_Side1_8WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_8WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 8 wind back",0,*UASide1_8WindBackRaw)
animationFreeMovement(*unarmed_Side1_8WindBack)
*unarmed_Side1_9WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_9WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 9 wind back",0,*UASide1_9WindBackRaw)
animationFreeMovement(*unarmed_Side1_9WindBack)
*unarmed_Side1_10WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_side1_10WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 10 wind back",0,*UASide1_10WindBackRaw)
animationFreeMovement(*unarmed_Side1_10WindBack)

*unarmed_Side1\frontWind(0,0)=*unarmed_Side1_1WindFront
*unarmed_Side1\frontWind(1,0)=*unarmed_Side1_2WindFront
*unarmed_Side1\frontWind(2,0)=*unarmed_Side1_3WindFront
*unarmed_Side1\frontWind(3,0)=*unarmed_Side1_4WindFront
*unarmed_Side1\frontWind(4,0)=*unarmed_Side1_5WindFront
*unarmed_Side1\frontWind(5,0)=*unarmed_Side1_6WindFront
*unarmed_Side1\frontWind(7,0)=*unarmed_Side1_8WindFront
*unarmed_Side1\frontWind(8,0)=*unarmed_Side1_9WindFront
*unarmed_Side1\frontWind(9,0)=*unarmed_Side1_10WindFront

*unarmed_Side1\backWind(7,0)=*unarmed_Side1_8WindBack
*unarmed_Side1\backWind(8,0)=*unarmed_Side1_9WindBack
*unarmed_Side1\backWind(9,0)=*unarmed_Side1_10WindBack

;------- Side 2
*UASide2.animation=classGenerateAnimation(4,"image/hand_unarmed_side2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*UASide2Raw,8,#H2H_DAMAGETYPE_BLUNT,7)
animationUngrounded(*UASide2)
animationGetSide(*UANeutral3)=*UASide2
setFrameSound(*UASide2,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*UASide2,3,#H2H_SOUND_ID_HAND_LAND)
setFrameDamage(*UASide2,1,5)
setFrameMovement(*UASide2,0,-20)
setFrameMovement(*UASide2,1,-40)
setFrameMovement(*UASide2,2,-60,20)
setFrameMovement(*UASide2,3,-60,25)
setFrameMovement(*UASide2,4,35,-15)
setFrameLength(*UASide2,0,3)
setFrameLength(*UASide2,1,3)
setFrameLength(*UASide2,3,6)
setFrameLength(*UASide2,4,6)
setFrameShake(*UASide2,3,5)
*UASide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind front",0,*UASide2_1WindFrontRaw)
*UASide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind front",0,*UASide2_2WindFrontRaw)
*UASide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind front",0,*UASide2_3WindFrontRaw)
*UASide2_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side2_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front",0,*UASide2_4WindFrontRaw)
setFrameLength(*UASide2_4WindFront,1,6)
setFrameLength(*UASide2_4WindFront,2,7)

*UASide2_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_side2_4WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind back",0,*UASide2_4WindBackRaw)
setFrameLength(*UASide2_4WindBack,1,6)
setFrameLength(*UASide2_4WindBack,2,9)
animationPrepareWind(*UASide2,0)
*UASide2\frontWind(0,0)=*UASide2_1WindFront
*UASide2\frontWind(1,0)=*UASide2_2WindFront
*UASide2\frontWind(2,0)=*UASide2_3WindFront
*UASide2\frontWind(3,0)=*UASide2_4WindFront
*UASide2\backWind(3,0)=*UASide2_4WindBack
animationFreeMovementWind(*UASide2)

;------- Side 3
; *unarmed_Side3.animation=classGenerateAnimation(6,"image/hand_unarmed_side3_",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3",0,*UASide3Raw,40,#H2H_DAMAGETYPE_BLUNT,6)
; setFrameMovement(*unarmed_Side3,1,20,-30)
; setFrameMovement(*unarmed_Side3,2,-50,-30)
; setFrameMovement(*unarmed_Side3,3,-110,-10)
; setFrameMovement(*unarmed_Side3,4,-60,10)
; setFrameMovement(*unarmed_Side3,5,-50,10)
; setFrameMovement(*unarmed_Side3,6,-30,10)
; ; setFrameLength(*unarmed_Side3,5,3)
; setFrameLength(*unarmed_Side3,6,4)
; animationUngrounded(*unarmed_Side3)
; ; For i=0 To 3
; ; 	setFrameLength(*unarmed_Side3,i,5)
; ; Next
; setFrameSound(*unarmed_Side3,3,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; animationSetComboEnd(*unarmed_Side3,1)
*UASide3.animation=classGenerateAnimation(3,"image/hand_unarmed_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3",0,*UASide3Raw,40,#H2H_DAMAGETYPE_BLUNT,6)
animationUngrounded(*UASide3)
animationSetComboEnd(*UASide3,#True)
setFrameSound(*UASide3,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UASide3,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameLength(*UASide3,1,3)
setFrameLength(*UASide3,2,3)
setFrameLength(*UASide3,3,9)
setFrameDamageDuration(*UASide3,3,5)
setFrameMovementDelta(*UASide3,3,-10)
setFrameMovement(*UASide3,0,32,-40)
setFrameMovement(*UASide3,1,-96)
setFrameMovement(*UASide3,2,-140,20)
setFrameMovement(*UASide3,3,-64,20)
setFramePush(*UASide3,1,-10)
setFramePush(*UASide3,2,-30)
setFramePush(*UASide3,3,-20)

*UASide3_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side3_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 1 wind front",0,*UASide3_1WindFrontRaw)
animationFreeMovement(*UASide3_1WindFront)
setFrameLength(*UASide3_1WindFront,1,6)
*UASide3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side3_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 2 wind front",0,*UASide3_2WindFrontRaw)
animationFreeMovement(*UASide3_2WindFront)
*UASide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side3_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 3 wind front",0,*UASide3_3WindFrontRaw)
animationFreeMovement(*UASide3_3WindFront)
*UASide3_4WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side3_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 4 wind front",0,*UASide3_4WindFrontRaw)
setFrameFreeMovement(*UASide3_4WindFront\frames(2))
setFrameFreeMovement(*UASide3_4WindFront\frames(3))
setFrameLength(*UASide3_4WindFront,1,6)
setFrameLength(*UASide3_4WindFront,2,7)
setFrameLength(*UASide3_4WindFront,3,8)
animationPrepareWind(*UASide3,0)
*UASide3\frontWind(0,0)=*UASide3_1WindFront
*UASide3\frontWind(1,0)=*UASide3_2WindFront
*UASide3\frontWind(2,0)=*UASide3_3WindFront
*UASide3\frontWind(3,0)=*UASide3_4WindFront

;------- Side 4
; *unarmed_Side4.animation=classGenerateAnimation(12,"image/hand_unarmed_side4_",3,#H2H_ANIMATIONTYPE_NSIDE,"side 4",0,*UASide4Raw,25,#H2H_DAMAGETYPE_BLUNT,10)
; setFrameSound(*unarmed_Side4,1,*chineseStaff_AttackS\id)
; setFrameSound(*unarmed_Side4,6,*chineseStaff_AttackS\id)
; setFrameSound(*unarmed_Side4,8,*chineseStaff_HeavyS\id)
; setFrameMovement(*unarmed_Side4,3,0,-20)
; setFrameMovement(*unarmed_Side4,4,0,-1)
; setFrameMovement(*unarmed_Side4,5,0,1)
; setFrameMovement(*unarmed_Side4,6,0,20)
; setFrameMovement(*unarmed_Side4,9,-40,-30)
; setFrameMovement(*unarmed_Side4,10,-20)
; setFrameMovement(*unarmed_Side4,11,-10,-15)
; setFrameMovement(*unarmed_Side4,12,-5,-15)
; For i=1 To 3
; 	setFrameDamage(*unarmed_Side4,i,6-i)
; 	setFrameStun(*unarmed_Side4,i,6-i)
; 	setFramePushD(*unarmed_Side4,i,i*5-20,i*3-15)
; Next
; setFrameLength(*unarmed_Side4,0,2)
; setFrameLength(*unarmed_Side4,1,2)
; setFrameLength(*unarmed_Side4,4,2)
; setFrameLength(*unarmed_Side4,5,2)
; setFrameLength(*unarmed_Side4,6,2)
; setFrameLength(*unarmed_Side4,7,2)
; setFrameLength(*unarmed_Side4,8,2)
; setFrameLength(*unarmed_Side4,9,2)
; enableFrameDamageCut(*unarmed_Side4,7)
; enableFrameCatch(*unarmed_Side4,6)
; animationGetSide(*unarmed_side1)=*unarmed_Side4
*UASide4.animation=classGenerateAnimation(5,"image/hand_unarmed_side4_",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*UASide4Raw,25,#H2H_DAMAGETYPE_BLUNT,8)
animationSetComboEnd(*UASide4,#True)
setFrameLength(*UASide4,3,3)
setFrameLength(*UASide4,4,5)
setFrameLength(*UASide4,5,7)
setFrameMovement(*UASide4,0,10,40)
setFrameMovement(*UASide4,1,20,20)
setFrameMovement(*UASide4,2,30,20)
setFrameMovement(*UASide4,3,-64,-30)
setFrameMovement(*UASide4,4,-64,-10)
setFrameMovement(*UASide4,5,-32)
setFrameSound(*UASide4,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*UASide4,3,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameStun(*UASide4,3,5)
setFrameStun(*UASide4,4,5)
setFrameStun(*UASide4,5,5)
setFramePushD(*UASide4,3,-20)
setFramePushD(*UASide4,4,-20)
setFramePushD(*UASide4,5,-20)
setFrameDamageDuration(*UASide4,5,4)

*UASide4_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_1WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind front",0,*UASide4_1WindFrontRaw)
*UASide4_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_2WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 2 wind front",0,*UASide4_2WindFrontRaw)
*UASide4_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side4_3WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 3 wind front",0,*UASide4_3WindFrontRaw)
setFrameLength(*UASide4_3WindFront,1,4)
*UASide4_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 4 wind front",0,*UASide4_4WindFrontRaw)
*UASide4_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind front",0,*UASide4_5WindFrontRaw)
*UASide4_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side4_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 6 wind front",0,*UASide4_6WindFrontRaw)
setFrameLength(*UASide4_6WindFront,1,6)
setFrameLength(*UASide4_6WindFront,2,7)

animationPrepareWind(*UASide4,0)
*UASide4\frontWind(0,0)=*UASide4_1WindFront
*UASide4\frontWind(1,0)=*UASide4_2WindFront
*UASide4\frontWind(2,0)=*UASide4_3WindFront
*UASide4\frontWind(3,0)=*UASide4_4WindFront
*UASide4\frontWind(4,0)=*UASide4_5WindFront
*UASide4\frontWind(5,0)=*UASide4_6WindFront
animationFreeMovementWind(*UASide4)

;------- Side 5
; *unarmed_Side5.animation=classGenerateAnimation(4,"image/hand_unarmed_side5_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 5",0,*UASide5Raw,20,#H2H_DAMAGETYPE_BLUNT,8)
; setFrameSound(*unarmed_side5,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; setFrameMovement(*unarmed_side5,1,-100,-25)
; setFrameMovement(*unarmed_side5,2,-100)
; setFrameMovement(*unarmed_side5,3,-20,5)
; setFrameMovement(*unarmed_side5,4,0,5)
; setFramePushD(*unarmed_side5,2,-15)
; setFramePushD(*unarmed_side5,3,-15)
; setFrameCanDoNext(*unarmed_Side5,3)
*UASide5.animation=classGenerateAnimation(2,"image/hand_unarmed_side5_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*UASide5Raw,20,#H2H_DAMAGETYPE_BLUNT,8)
ReDim *UASide5\frames(3)

Swap *UASide5\frames(2),*UASide5\frames(3)
*UASide5\frames(2)=AllocateStructure(frame)
frameCopy(*UASide5\frames(2),*UASide5\frames(1),#True)
*UASide5\frames(2)\hurtpath$="image/hand_unarmed_side5_3"
*UASide5\frames(2)\hurtId=spriteIndexAdd()
*UASide5\frames(2)\hurtFlip=spriteIndexAdd()
Swap *UASide5\frames(2)\hurtShift,*UASide5\frames(3)\hurtShift

*UASide5\frames(3)\hurtId=0
*UASide5\frames(3)\hurtFlip=0


setFrameCanDoNext(*UASide5,3,5)
setFrameSound(*UASide5,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameMovement(*UASide5,0,32)
setFrameMovement(*UASide5,1,-128)
setFrameLength(*UASide5,0,3)
setFrameLength(*UASide5,1,2)
setFrameLength(*UASide5,2,6)
setFrameMovementDelta(*UASide5,1,-40)
setFrameMovementDelta(*UASide5,2,-30)
setFramePushD(*UASide5,1,-15)
setFramePushD(*UASide5,2,-15)

*UASide5_2WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side5_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*UASide5_2WindFrontRaw)
setFrameFreeMovement(*UASide5_2WindFront\frames(2))
setFrameFreeMovement(*UASide5_2WindFront\frames(3))
setFrameLength(*UASide5_2WindFront,1,6)
setFrameLength(*UASide5_2WindFront,2,7)
setFrameLength(*UASide5_2WindFront,3,8)
animationPrepareWind(*UASide5,0)
*UASide5\frontWind(1,0)=*UASide5_2WindFront

;------- Side 6
; *unarmed_Side6.animation=classGenerateAnimation(4,"image/hand_unarmed_side6_",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6",0,*UASide6Raw,25,#H2H_DAMAGETYPE_BLUNT,6)
; setFrameSound(*unarmed_Side6,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; setFrameMovement(*unarmed_Side6,0,-50)
; setFrameMovement(*unarmed_Side6,1,-40)
; setFrameMovement(*unarmed_Side6,2,-20)
; For i=0 To 3
; 	setFramePush(*unarmed_side6,i,-50+i*15)
; Next
; setFrameLength(*unarmed_Side6,3,5)
; setFrameLength(*unarmed_Side6,4,3)
; animationGetSide(*unarmed_neutral4)=*unarmed_Side6
; animationSetComboEnd(*unarmed_Side6,1)
*UASide6.animation=classGenerateAnimation(4,"image/hand_unarmed_side6_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6",0,*UASide6Raw,25,#H2H_DAMAGETYPE_BLUNT,6)
animationSetComboEnd(*UASide6,#True)
setFrameLength(*UASide6,0,6)
setFrameLength(*UASide6,2,2)
setFrameLength(*UASide6,3,2)
setFrameLength(*UASide6,4,9)
setFrameDamageDuration(*UASide6,4,4)
For i=1 To 3
	setFramePush(*UASide6,i,-45)
Next
setFrameMovement(*UASide6,0,48,32)
setFrameMovement(*UASide6,1,-64,16)
setFrameMovement(*UASide6,2,-96,8)
setFrameMovement(*UASide6,3,-96,4)
setFrameMovement(*UASide6,4,-64,2)
setFrameMovementDelta(*UASide6,4,-8)
setFrameSound(*UASide6,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UASide6,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)

animationGetSide(*unarmed_neutral4)=*UASide6

*UASide6_1WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side6_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 1 wind front",0,*UASide6_1WindFrontRaw)
setFrameLength(*UASide6_1WindFront,1,4)
setFrameLength(*UASide6_1WindFront,2,5)
*UASide6_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 2 wind front",0,*UASide6_2WindFrontRaw)
*UASide6_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_3WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 3 wind front",0,*UASide6_3WindFrontRaw)
*UASide6_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_4WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 4 wind front",0,*UASide6_4WindFrontRaw)
*UASide6_5WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side6_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 5 wind front",0,*UASide6_5WindFrontRaw)
setFrameLength(*UASide6_5WindFront,1,4)
setFrameLength(*UASide6_5WindFront,2,5)
setFrameLength(*UASide6_5WindFront,3,6)

*UASide6_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_3WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 3 wind back",0,*UASide6_3WindBackRaw)
*UASide6_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_4WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 4 wind back",0,*UASide6_4WindBackRaw)
*UASide6_5WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_side6_5WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 5 wind back",0,*UASide6_5WindBackRaw)
setFrameLength(*UASide6_5WindBack,1,5)
setFrameLength(*UASide6_5WindBack,2,6)

animationPrepareWind(*UASide6,0)
*UASide6\frontWind(0,0)=*UASide6_1WindFront
*UASide6\frontWind(1,0)=*UASide6_2WindFront
*UASide6\frontWind(2,0)=*UASide6_3WindFront
*UASide6\frontWind(3,0)=*UASide6_4WindFront
*UASide6\frontWind(4,0)=*UASide6_5WindFront
*UASide6\backWind(2,0)=*UASide6_3WindBack
*UASide6\backWind(3,0)=*UASide6_4WindBack
*UASide6\backWind(4,0)=*UASide6_5WindBack
animationFreeMovementWind(*UASide6)

;------- Back 1 new
*unarmed_Back1.animation=classGenerateAnimation(9,"image/hand_unarmed_back1_",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 new",0,*UABack1NewRaw,20,#H2H_DAMAGETYPE_BLUNT,3)
setFrameSound(*unarmed_Back1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*unarmed_Back1,5,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

setFrameMovement(*unarmed_Back1,1,50,-20)
setFrameMovement(*unarmed_Back1,2,60,-30)
setFrameMovement(*unarmed_Back1,3,60,20)
setFrameMovement(*unarmed_Back1,4,50,30)
setFrameMovement(*unarmed_Back1,5,40)
setFrameMovement(*unarmed_Back1,6,-150,-20)
setFrameMovement(*unarmed_Back1,7,-125,20)
setFrameMovement(*unarmed_Back1,8,-125)
setFrameMovement(*unarmed_Back1,9,100)

setFrameStun(*unarmed_Back1,6,30)
setFrameStun(*unarmed_Back1,7,20)
setFrameStun(*unarmed_Back1,8,15)

setFramePushD(*unarmed_Back1,6,-60)
setFramePushD(*unarmed_Back1,7,-40)
setFramePushD(*unarmed_Back1,8,-30)

setFrameDamage(*unarmed_Back1,7,6)
setFrameDamage(*unarmed_Back1,8,5)

setFrameLength(*unarmed_Back1,4,5)
setFrameLength(*unarmed_Back1,5,4)
setFrameLength(*unarmed_Back1,7,4)
setFrameLength(*unarmed_Back1,8,5)
setFrameLength(*unarmed_Back1,9,5)
animationGetSide(*unarmed_Back1)=*UASide5

*unarmed_Back1_2WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_2backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 back wind",0,*UABack1_2WindBackRaw)
*unarmed_Back1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_2frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 front wind",0,*UABack1_2WindFrontRaw)

*unarmed_Back1_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_3backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 back wind",0,*UABack1_3WindBackRaw)
*unarmed_Back1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_3frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 front wind",0,*UABack1_3WindFrontRaw)

*unarmed_Back1_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_4backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 back wind",0,*UABack1_4WindBackRaw)
*unarmed_Back1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_4frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 front wind",0,*UABack1_4WindFrontRaw)

*unarmed_Back1_5WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_back1_5backwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 back wind",0,*UABack1_5WindBackRaw)
frameSetFreeMovement(*unarmed_Back1_5WindBack\frames(0),#True)
*unarmed_Back1_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back1_5frontwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 front wind",0,*UABack1_5WindFrontRaw)
frameSetFreeMovement(*unarmed_Back1_5WindFront\frames(0),#True)

*unarmed_Back1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back1_6frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 front wind",0,*UABack1_6WindFrontRaw)

*unarmed_Back1_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_7frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 front wind",0,*UABack1_7WindFrontRaw)

*unarmed_Back1_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_8frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 front wind",0,*UABack1_8WindFrontRaw)
frameSetFreeMovement(*unarmed_Back1_8WindFront\frames(0),#True)

*unarmed_Back1_9WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back1_9frontwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 front wind",0,*UABack1_9WindFrontRaw)
frameSetFreeMovement(*unarmed_Back1_9WindFront\frames(0),#True)
For i=0 To 3
	setFrameMovement(*unarmed_Back1_9WindFront,i,-20)
Next

FreeArray(*unarmed_Back1\frontWind())
Dim *unarmed_Back1\frontWind(9,0)
*unarmed_Back1\frontWind(1,0)=*unarmed_Back1_2WindFront
*unarmed_Back1\frontWind(2,0)=*unarmed_Back1_3WindFront
*unarmed_Back1\frontWind(3,0)=*unarmed_Back1_4WindFront
*unarmed_Back1\frontWind(4,0)=*unarmed_Back1_5WindFront
*unarmed_Back1\frontWind(5,0)=*unarmed_Back1_6WindFront
*unarmed_Back1\frontWind(6,0)=*unarmed_Back1_7WindFront
*unarmed_Back1\frontWind(7,0)=*unarmed_Back1_8WindFront
*unarmed_Back1\frontWind(8,0)=*unarmed_Back1_9WindFront

FreeArray(*unarmed_Back1\backWind())
Dim *unarmed_Back1\backWind(9,0)
*unarmed_Back1\backWind(1,0)=*unarmed_Back1_2WindBack
*unarmed_Back1\backWind(2,0)=*unarmed_Back1_3WindBack
*unarmed_Back1\backWind(3,0)=*unarmed_Back1_4WindBack
*unarmed_Back1\backWind(4,0)=*unarmed_Back1_5WindBack

;------- Back 2
; *unarmed_Back2.animation=classGenerateAnimation(9,"image/hand_unarmed_back2_",4,#H2H_ANIMATIONTYPE_NBACK,"back 2",0,*UABack2Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
; setFrameSound(*unarmed_Back2,1,*chineseStaff_AttackS\id)
; setFrameSound(*unarmed_Back2,4,*chineseStaff_HeavyS\id)
; setFrameMovement(*unarmed_Back2,0,-15,10)
; setFrameMovement(*unarmed_Back2,1,-15)
; setFrameMovement(*unarmed_Back2,2,-20,3)
; setFrameMovement(*unarmed_Back2,3,0,2)
; setFrameMovement(*unarmed_Back2,4,1)
; setFrameMovement(*unarmed_Back2,5,10)
; setFrameMovement(*unarmed_Back2,6,1)
; setFrameMovement(*unarmed_Back2,7,-15,-5)
; setFrameMovement(*unarmed_Back2,8,0,-5)
; setFrameMovement(*unarmed_Back2,9,0,-5)
; setFramePush(*unarmed_Back2,4,-1)
; setFramePush(*unarmed_Back2,5,3)
; setFramePush(*unarmed_Back2,6,30,-2)
; animationGetBack(*UASide5)=*unarmed_Back2
*UABack2.animation=classGenerateAnimation(5,"image/hand_unarmed_back2_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2",0,*UABack2Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
setFrameCanDoNext(*UABack2,5,4)
setFrameLength(*UABack2,5,10)
setFrameSound(*UABack2,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameMovement(*UABack2,0,-30)
setFrameMovement(*UABack2,1,-30,-5)
setFrameMovement(*UABack2,2,5,5)
setFrameMovement(*UABack2,3,20)
setFrameMovement(*UABack2,4,40)
setFrameMovement(*UABack2,5,40)
setFramePush(*UABack2,3,-5)
setFramePush(*UABack2,4,0,-10)
setFramePush(*UABack2,5,30)

*UABack2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind front",0,*UABack2_1WindFrontRaw)
*UABack2_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back2_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front",0,*UABack2_2WindFrontRaw)
setFrameLength(*UABack2_2WindFront,1,5)
*UABack2_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_5WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 5 wind front",0,*UABack2_5WindFrontRaw)
*UABack2_6WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back2_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 6 wind front",0,*UABack2_6WindFrontRaw)
setFrameLength(*UABack2_6WindFront,1,5)
setFrameLength(*UABack2_6WindFront,2,6)
setFrameLength(*UABack2_6WindFront,3,7)

*UABack2_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind back",0,*UABack2_1WindBackRaw)
*UABack2_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_4WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 4 wind back",0,*UABack2_4WindBackRaw)

animationPrepareWind(*UABack2,0)
*UABack2\frontWind(0,0)=*UABack2_1WindFront
*UABack2\frontWind(1,0)=*UABack2_2WindFront
*UABack2\frontWind(4,0)=*UABack2_5WindFront
*UABack2\frontWind(5,0)=*UABack2_6WindFront
*UABack2\backWind(0,0)=*UABack2_1WindBack
*UABack2\backWind(3,0)=*UABack2_4WindBack
animationFreeMovementWind(*UABack2)
animationGetBack(*UASide5)=*UABack2


;------- Back 3
; *unarmed_Back3.animation=classGenerateAnimation(4,"image/hand_unarmed_back3_",4,#H2H_ANIMATIONTYPE_NBACK,"back 3",0,*UABack3Raw,10,#H2H_DAMAGETYPE_BLUNT,3)
; setFrameSound(*unarmed_Back3,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; For i=0 To 2
; 	setFrameMovement(*unarmed_Back3,i,40-i*7)
; Next
; setFramePush(*unarmed_Back3,0,40)
; setFramePushD(*unarmed_Back3,1,20)
; setFramePushD(*unarmed_Back3,2,10)
; setFrameGrab(*unarmed_Back3,0)
; setFrameGrab(*unarmed_Back3,1)
; setFrameGrab(*unarmed_Back3,2)
; animationGetBack(*unarmed_neutral4)=*unarmed_Back3
*UABack3.animation=classGenerateAnimation(2,"image/hand_unarmed_back3_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*UABack3Raw,10,#H2H_DAMAGETYPE_BLUNT,1)
animationSetComboEnd(*UABack3,#True)
setFrameSound(*UABack3,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameMovement(*UABack3,0,64,48)
setFrameMovement(*UABack3,0,128,48)
setFrameMovement(*UABack3,0,128,48)
setFrameLength(*UABack3,2,8)
setFrameDamageDuration(*UABack3,2,4)
For i=0 To 2
	setFrameGrab(*UABack3,i)
	enableFrameDamageCut(*UABack3,i)
Next
setFramePush(*UABack3,0,60,30)
setFramePushD(*UABack3,1,50,20)
setFramePushD(*UABack3,2,80,10)
*UABack3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back3_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind front",0,*UABack3_1WindFrontRaw)
*UABack3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back3_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind front",0,*UABack3_2WindFrontRaw)
*UABack3_3WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back3_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*UABack3_3WindFrontRaw)
setFrameLength(*UABack3_3WindFront,1,5)
setFrameLength(*UABack3_3WindFront,2,6)
setFrameLength(*UABack3_3WindFront,3,7)
animationFreeMovementWind(*UABack3)

animationPrepareWind(*UABack3,0)
*UABack3\frontWind(0,0)=*UABack3_1WindFront
*UABack3\frontWind(1,0)=*UABack3_2WindFront
*UABack3\frontWind(2,0)=*UABack3_3WindFront
animationGetBack(*unarmed_neutral4)=*UABack3


;------- Down 1
*UADown1.animation=classGenerateAnimation(4,"image/hand_unarmed_down1_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*UADown1Raw,15,#H2H_DAMAGETYPE_BLUNT,5)
setFrameCanDoNext(*UADown1,2,6)
setFrameMovement(*UADown1,0,10)
setFrameMovement(*UADown1,1,20)
setFrameMovement(*UADown1,2,-50)
setFrameMovement(*UADown1,3,50)
setFrameMovement(*UADown1,4,50)
setFrameGrab(*UADown1,2)
setFrameGrab(*UADown1,3)
setFrameGrab(*UADown1,4)
setFramePush(*UADown1,3,10)
setFramePush(*UADown1,4,10)
setFrameLength(*UADown1,2,8)
setFrameLength(*UADown1,4,12)
setFrameSound(*UADown1,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UADown1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)

*UADown1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down1_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind front",0,*UADown1_1WindFrontRaw)
*UADown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*UADown1_2WindFrontRaw)
setFrameLength(*UADown1_2WindFront,1,5)
setFrameLength(*UADown1_2WindFront,2,6)
*UADown1_3WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*UADown1_3WindFrontRaw)
setFrameLength(*UADown1_3WindFront,1,5)
setFrameLength(*UADown1_3WindFront,2,6)

*UADown1_2WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_2WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind back",0,*UADown1_2WindBackRaw)
setFrameLength(*UADown1_2WindBack,1,5)
setFrameLength(*UADown1_2WindBack,2,6)
*UADown1_3WindBack.animation=classGenerateAnimation(3,"image/hand_unarmed_down1_3WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind back",0,*UADown1_3WindBackRaw)
setFrameLength(*UADown1_3WindBack,1,5)
setFrameLength(*UADown1_3WindBack,2,6)
setFrameLength(*UADown1_3WindBack,3,7)
animationPrepareWind(*UADown1,0)
*UADown1\frontWind(0,0)=*UADown1_1WindFront
*UADown1\frontWind(1,0)=*UADown1_2WindFront
*UADown1\frontWind(2,0)=*UADown1_3WindFront
*UADown1\backWind(1,0)=*UADown1_2WindBack
*UADown1\backWind(2,0)=*UADown1_3WindBack
animationFreeMovementWind(*UADown1)

;------- Down 2
; *unarmed_Down2.animation=classGenerateAnimation(7,"image/hand_unarmed_down2_",3,#H2H_ANIMATIONTYPE_NDOWN,"down 2",0,*UADown2Raw,15,#H2H_DAMAGETYPE_BLUNT,6)
; setFrameLength(*unarmed_Down2,4,6)
; For i=5 To 7
; 	setFrameLength(*unarmed_Down2,i,2)
; Next
; setFrameCanDoNext(*unarmed_Down2,6)
; For i=0 To 7
; 	setFrameMovement(*unarmed_Down2,i,1,1)
; Next
; setFrameMovement(*unarmed_Down2,5,0,15)
; setFrameMovement(*unarmed_Down2,6,0,5)
; setFrameMovement(*unarmed_Down2,7,0,5)
; setFrameSound(*unarmed_Down2,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; animationSetComboEnd(*unarmed_Down2,1)
*UADown2.animation=classGenerateAnimation(5,"image/hand_unarmed_down2_",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*UADown2Raw,15,#H2H_DAMAGETYPE_BLUNT,6)
animationSetComboEnd(*UADown2,#True)
; setFrameSound(*UADown2,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UADown2,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
For i=0 To 5
	setFrameMovement(*UADown2,i,-20)
Next
setFrameLength(*UADown2,4,4)
setFrameLength(*UADown2,5,8)

*UADown2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_1WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*UADown2_1WindFrontRaw)
*UADown2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_2WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*UADown2_2WindFrontRaw)
*UADown2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind front",0,*UADown2_3WindFrontRaw)
*UADown2_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_4WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 4 wind front",0,*UADown2_4WindFrontRaw)
*UADown2_5WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down2_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 5 wind front",0,*UADown2_5WindFrontRaw)
setFrameLength(*UADown2_5WindFront,1,6)
setFrameLength(*UADown2_5WindFront,2,7)

*UADown2_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_3WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind back",0,*UADown2_3WindBackRaw)
*UADown2_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_4WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 4 wind back",0,*UADown2_4WindBackRaw)
*UADown2_6WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_down2_6WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 6 wind back",0,*UADown2_6WindBackRaw)
setFrameLength(*UADown2_6WindBack,1,6)

animationPrepareWind(*UADown2,0)
*UADown2\frontWind(0,0)=*UADown2_1WindFront
*UADown2\frontWind(1,0)=*UADown2_2WindFront
*UADown2\frontWind(2,0)=*UADown2_3WindFront
*UADown2\frontWind(3,0)=*UADown2_4WindFront
*UADown2\frontWind(4,0)=*UADown2_5WindFront
*UADown2\backWind(2,0)=*UADown2_3WindBack
*UADown2\backWind(3,0)=*UADown2_4WindBack
*UADown2\backWind(5,0)=*UADown2_6WindBack
animationFreeMovementWind(*UADown2)

;------- Down 3
; *unarmed_Down3.animation=classGenerateAnimation(4,"image/hand_unarmed_down3_",6,#H2H_ANIMATIONTYPE_NDOWN,"down 3",0,*UADown3Raw,50,#H2H_DAMAGETYPE_BLUNT,8)
; animationGetDown(*unarmed_Neutral4)=*unarmed_Down3
; setFrameSound(*unarmed_Down3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
; setFrameSound(*unarmed_Down3,2,#H2H_SOUND_ID_HAND_FALL)
; setFrameDamage(*unarmed_Down3,0,1)
; setFrameDamage(*unarmed_Down3,1,1)
; setFrameDamage(*unarmed_Down3,2,1)
; enableFrameDamageCut(*unarmed_Down3,1)
; enableFrameDamageCut(*unarmed_Down3,2)
; enableFrameDamageCut(*unarmed_Down3,3)
; setFrameLength(*unarmed_Down3,4,12)
; setFrameMovement(*unarmed_Down3,0,-50,-100)
; setFrameMovement(*unarmed_Down3,1,40,0)
; setFrameMovement(*unarmed_Down3,2,-70,125)
; setFrameMovement(*unarmed_Down3,3,0,150)
; setFramePush(*unarmed_Down3,0,0,20)
; setFramePush(*unarmed_Down3,1,1,24)
; setFramePush(*unarmed_Down3,2,2,24)
; setFramePush(*unarmed_Down3,3,3,20)
; setFramePush(*unarmed_Down3,4,4,4)
; setFrameGrab(*unarmed_Down3,0)
; setFrameGrab(*unarmed_Down3,1)
; setFrameGrab(*unarmed_Down3,2)
; setFrameShake(*unarmed_Down3,2,10)
; animationUngrounded(*unarmed_Down3)
; animationSetComboEnd(*unarmed_Down3,1)
*UADown3.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 3",0,*UADown3Raw,50,#H2H_DAMAGETYPE_BLUNT,1)
animationSetComboEnd(*UADown3,#True)
ReDim *UADown3\frames(3)
*UADown3\frames(3)=AllocateStructure(frame)
frameCopy(*UADown3\frames(3),*UADown3\frames(2))
setFrameMovement(*UADown3,0,-96,-96)
setFrameLength(*UADown3,0,5)
setFrameMovementDelta(*UADown3,1,-1,45)
setFrameMovementDelta(*UADown3,2,-2,70)
For i=1 To 3
	setFrameGrab(*UADown3,i)
	setFramePush(*UADown3,i,-i,20)
	enableFrameDamageCut(*UADown3,i)
Next
setFrameLength(*UADown3,3,15)
setFrameDamage(*UADown3,3,8)
setFrameDamageDuration(*UADown3,3,5)
animationSetUngrounded(*UADown3,#True)
setFrameSound(*UADown3,3,#H2H_SOUND_ID_HAND_FALL)
setFrameSound(*UADown3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)


*UADown3_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_down3_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 2 wind front",0,*UADown3_2WindFrontRaw)
*UADown3_3WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_down3_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind front",0,*UADown3_3WindFrontRaw)
For i=1 To 4
	setFrameLength(*UADown3_3WindFront,i,3+i*2)
Next
frameSetFreeMovement(*UADown3_3WindFront\frames(2))
frameSetFreeMovement(*UADown3_3WindFront\frames(3))
*UADown3_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_4WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 4 wind front",0,*UADown3_4WindFrontRaw)
setFrameLength(*UADown3_4WindFront,1,4)
setFrameLength(*UADown3_4WindFront,2,6)
animationFreeMovement(*UADown3_4WindFront)

*UADown3_3WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_3WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind back",0,*UADown3_3WindBackRaw)
*UADown3_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_4WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 4 wind back",0,*UADown3_4WindBackRaw)
setFrameLength(*UADown3_4WindBack,1,4)
setFrameLength(*UADown3_4WindBack,2,6)
animationFreeMovement(*UADown3_4WindBack)
animationGetDown(*unarmed_Neutral4)=*UADown3

animationPrepareWind(*UADown3)
*UADown3\frontWind(1,0)=*UADown3_2WindFront
*UADown3\frontWind(2,0)=*UADown3_3WindFront
*UADown3\frontWind(3,0)=*UADown3_4WindFront
*UADown3\backWind(2,0)=*UADown3_3WindBack
*UADown3\backWind(3,0)=*UADown3_4WindBack


;------- Up 1
*UAUp1.animation=classGenerateAnimation(5,"image/hand_unarmed_up1_",4,#H2H_ANIMATIONTYPE_NUP,"Up 1",0,*UAUp1Raw,8,#H2H_DAMAGETYPE_BLUNT,5)
setFrameCanDoNext(*UAUp1,5,4)
setFrameLength(*UAUp1,5,10)
setFrameSound(*UAUp1,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UAUp1,3,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*UAUp1,5,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameMovement(*UAUp1,0,-50,-70)
setFrameMovement(*UAUp1,1,-10,-30)
setFrameMovement(*UAUp1,2,-5,5)
setFrameMovement(*UAUp1,3,-10,-30)
setFrameMovement(*UAUp1,4,5,5)
setFrameMovement(*UAUp1,5,-10,-30)
enableFrameCatch(*UAUp1,3)
enableFrameDamageCut(*UAUp1,2)
enableFrameDamageCut(*UAUp1,4)
setFrameLength(*UAUp1,2,3)
setFrameLength(*UAUp1,4,3)

*UAUp1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up1_1WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 1 1 wind front",0,*UAUp1_1WindFrontRaw)
*UAUp1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 2 wind front",0,*UAUp1_2WindFrontRaw)
*UAUp1_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_4WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 4 wind front",0,*UAUp1_4WindFrontRaw)
*UAUp1_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_6WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 6 wind front",0,*UAUp1_6WindFrontRaw)
setFrameLength(*UAUp1_2WindFront,1,4)
setFrameLength(*UAUp1_2WindFront,2,5)
setFrameLength(*UAUp1_4WindFront,1,4)
setFrameLength(*UAUp1_4WindFront,2,5)
setFrameLength(*UAUp1_6WindFront,1,4)
setFrameLength(*UAUp1_6WindFront,2,5)
animationPrepareWind(*UAUp1,0)
*UAUp1\frontWind(0,0)=*UAUp1_1WindFront
*UAUp1\frontWind(1,0)=*UAUp1_2WindFront
*UAUp1\frontWind(3,0)=*UAUp1_4WindFront
*UAUp1\frontWind(5,0)=*UAUp1_6WindFront
animationFreeMovementWind(*UAUp1)

; animationGetDown(*UAUp1)=*unarmed_Down2
animationGetDown(*UAUp1)=*UADown2

;------- Up 2
*unarmed_Up2.animation=classGenerateAnimation(12,"image/hand_unarmed_up2_",3,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*UAUp2Raw,22,#H2H_DAMAGETYPE_BLUNT,10)
setFrameMovement(*unarmed_Up2,2,0,-40)
setFrameMovement(*unarmed_Up2,3,0,-40)
setFrameMovement(*unarmed_Up2,4,0,-70)
setFrameMovement(*unarmed_Up2,5,0,-40)
setFrameMovement(*unarmed_Up2,6,0,-30)
setFrameMovement(*unarmed_Up2,7,0,-15)
setFrameMovement(*unarmed_Up2,8,-1,-5)
setFrameMovement(*unarmed_Up2,9,-1,5)
setFrameMovement(*unarmed_Up2,10,-1,10)
setFrameMovement(*unarmed_Up2,11,-1,10)
setFrameMovement(*unarmed_Up2,12,-1,10)
setFrameSound(*unarmed_Up2,2,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
setFrameSound(*unarmed_Up2,3,#H2H_SOUND_ID_HAND_JUMPLIGHT)
setFrameSound(*unarmed_Up2,4,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*unarmed_Up2,9,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
For i=0 To 3
	setFrameLength(*unarmed_Up2,i,2)
Next
For i=4 To 7
	setFrameLength(*unarmed_Up2,i,1)
Next
animationSetComboEnd(*unarmed_Up2,1)

;------- Up 3
*UAUp3.animation=classGenerateAnimation(4,"image/hand_unarmed_up3_",3,#H2H_ANIMATIONTYPE_NUP,"Up 3",0,*UAUp3Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
setFrameCanDoNext(*UAUp3,4,4)
setFrameLength(*UAUp3,4,9)
setFrameMovement(*UAUp3,0,-10,-10)
setFrameMovement(*UAUp3,1,-10,-20)
setFrameMovement(*UAUp3,2,-10,-30)
setFrameMovement(*UAUp3,3,-10,-40)
setFrameMovement(*UAUp3,4,-10,40)
For i=0 To 4
	setFramePush(*UAUp3,i,8-i,-25)
Next
setFrameSound(*UAUp3,0,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAUp3_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_up3_1WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 1 wind front",0,*UAUp3_1WindFrontRaw)
setFrameLength(*UAUp3_1WindFront,1,4)
*UAUp3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up3_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 2 wind front",0,*UAUp3_2WindFrontRaw)
*UAUp3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up3_3WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 3 wind front",0,*UAUp3_3WindFrontRaw)
*UAUp3_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up3_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 3 4 wind front",0,*UAUp3_4WindFrontRaw)
setFrameLength(*UAUp3_4WindFront,1,5)
setFrameLength(*UAUp3_4WindFront,2,6)

animationPrepareWind(*UAUp3,0)
*UAUp3\frontWind(0,0)=*UAUp3_1WindFront
*UAUp3\frontWind(1,0)=*UAUp3_2WindFront
*UAUp3\frontWind(2,0)=*UAUp3_3WindFront
*UAUp3\frontWind(3,0)=*UAUp3_4WindFront
animationFreeMovementWind(*UAUp3)
animationGetUp(*unarmed_Side1)=*UAUp3
animationGetSide(*UAUp3)=*UASide4

;------- Heavy 1
*unarmed_Heavy1.animation=classGenerateAnimation(5,"image/hand_unarmed_heavy1_",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*UAHeavy1Raw,75,#H2H_DAMAGETYPE_BLUNT,10)
setFrameMovement(*unarmed_Heavy1,0,20,5)
setFrameMovement(*unarmed_Heavy1,1,40,10)
setFrameMovement(*unarmed_Heavy1,2,-40,-20)
setFrameMovement(*unarmed_Heavy1,3,-40,-30)
setFrameMovement(*unarmed_Heavy1,4,-40,-40)
setFrameMovement(*unarmed_Heavy1,5,-10,40)
setFrameLength(*unarmed_Heavy1,1,7)
setFrameLength(*unarmed_Heavy1,5,20)
setFrameCanDoNext(*unarmed_Heavy1,5,4)
; setFrameCanMove(*unarmed_Heavy1,5,10)
setFrameSound(*unarmed_Heavy1,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
setFrameSound(*unarmed_Heavy1,2,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
For i=2 To 4
	setFramePush(*unarmed_Heavy1,i,-40+i*10,-i*15)
	setFramePushD(*unarmed_Heavy1,i,-20+i*5,-i*5)
	setFrameDamage(*unarmed_Heavy1,i,8+i)
Next
animationGetNeutral(*unarmed_Heavy1)=*unarmed_Neutral4

animationPrepareWind(*unarmed_Heavy1)
*unarmed_Heavy1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind front",0,*UAHeavy1_1WindFrontRaw)
*unarmed_Heavy1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy1_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 2 wind front",0,*UAHeavy1_2WindFrontRaw)
*unarmed_Heavy1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind front",0,*UAHeavy1_3WindFrontRaw)
*unarmed_Heavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind front",0,*UAHeavy1_4WindFrontRaw)
*unarmed_Heavy1_5WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind front",0,*UAHeavy1_5WindFrontRaw)
setFrameMovement(*unarmed_Heavy1_5WindFront,1,-5,-10)
setFrameMovement(*unarmed_Heavy1_5WindFront,2,-5,-10)
setFrameMovement(*unarmed_Heavy1_5WindFront,3,-5,-10)
*unarmed_Heavy1\frontWind(0,0)=*unarmed_Heavy1_1WindFront
*unarmed_Heavy1\frontWind(1,0)=*unarmed_Heavy1_2WindFront
*unarmed_Heavy1\frontWind(2,0)=*unarmed_Heavy1_3WindFront
*unarmed_Heavy1\frontWind(3,0)=*unarmed_Heavy1_4WindFront
*unarmed_Heavy1\frontWind(4,0)=*unarmed_Heavy1_5WindFront

;------- Heavy 2
; *unarmed_Heavy2.animation=classGenerateAnimation(10,"image/hand_unarmed_heavy2_",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2",0,*UAHeavy2Raw,50,#H2H_DAMAGETYPE_BLUNT,9)
; For i=2 To 6
; 	setFrameLength(*unarmed_Heavy2,i,2)
; Next
; setFrameDamage(*unarmed_Heavy2,2,8)
; setFrameDamage(*unarmed_Heavy2,6,5)
; setFrameDamage(*unarmed_Heavy2,7,4)
; enableFrameDamageCut(*unarmed_Heavy2,6)
; setFrameMovement(*unarmed_Heavy2,0,30)
; setFrameMovement(*unarmed_Heavy2,1,30)
; setFrameMovement(*unarmed_Heavy2,2,-40)
; setFrameMovement(*unarmed_Heavy2,3,-35)
; setFrameMovement(*unarmed_Heavy2,4,-35)
; setFrameMovement(*unarmed_Heavy2,5,-35)
; setFrameMovement(*unarmed_Heavy2,6,-35)
; setFrameSound(*unarmed_Heavy2,3,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
; setFrameCanDoNext(*unarmed_Heavy2,7,1)
; For i=2 To 7
; 	setFramePushD(*unarmed_Heavy2,i,-100+i*12)
; 	setFrameStun(*unarmed_Heavy2,i,14-i*2)
; Next
; animationGetHeavy(*UADown1)=*unarmed_Heavy2
; animationGetSide(*unarmed_Heavy2)=*unarmed_Side3
; animationGetUp(*unarmed_Heavy2)=*unarmed_Up2
*UAHeavy2.animation=classGenerateAnimation(4,"image/hand_unarmed_heavy2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*UAHeavy2Raw,50,#H2H_DAMAGETYPE_BLUNT,9)
setFrameCanDoNext(*UAHeavy2,4,6)
setFrameLength(*UAHeavy2,1,6)
; setFrameLength(*UAHeavy2,2,5)
; setFrameLength(*UAHeavy2,3,5)
setFrameLength(*UAHeavy2,4,10)
setFrameMovement(*UAHeavy2,0,30)
setFrameMovement(*UAHeavy2,1,50)
setFrameMovement(*UAHeavy2,2,-160)
setFrameMovement(*UAHeavy2,3,-80)
setFrameMovementDelta(*UAHeavy2,3,-20)
setFrameMovementDelta(*UAHeavy2,4,-10)
setFrameStun(*UAHeavy2,2,14)
setFrameStun(*UAHeavy2,3,12)
setFramePushD(*UAHeavy2,2,-50)
setFramePushD(*UAHeavy2,3,-50)
setFrameSound(*UAHeavy2,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAHeavy2_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy2_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind front",0,*UAHeavy2_2WindFrontRaw)
animationFreeMovement(*UAHeavy2_2WindFront)
setFrameLength(*UAHeavy2_2WindFront,1,5)
setFrameLength(*UAHeavy2_2WindFront,2,6)
*UAHeavy2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy2_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind front",0,*UAHeavy2_3WindFrontRaw)
animationFreeMovement(*UAHeavy2_3WindFront)
*UAHeavy2_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy2_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*UAHeavy2_4WindFrontRaw)
*UAHeavy2_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy2_5WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind front",0,*UAHeavy2_5WindFrontRaw)
setFrameLength(*UAHeavy2_5WindFront,1,8)
animationFreeMovement(*UAHeavy2_5WindFront)

animationPrepareWind(*UAHeavy2,0)
*UAHeavy2\frontWind(1,0)=*UAHeavy2_2WindFront
*UAHeavy2\frontWind(2,0)=*UAHeavy2_3WindFront
*UAHeavy2\frontWind(3,0)=*UAHeavy2_4WindFront
*UAHeavy2\frontWind(4,0)=*UAHeavy2_5WindFront
animationGetHeavy(*UADown1)=*UAHeavy2
animationGetSide(*UAHeavy2)=*UASide3
animationGetUp(*UAHeavy2)=*unarmed_Up2


;------- Heavy 3
; *unarmed_Heavy3.animation=classGenerateAnimation(6,"image/hand_unarmed_heavy3_",2,#H2H_ANIMATIONTYPE_HEAVY,"heavy 3",0,*UAHeavy3Raw,50,#H2H_DAMAGETYPE_BLUNT,15)
; setFrameLength(*unarmed_Heavy3,0,6)
; setFrameLength(*unarmed_Heavy3,1,5)
; setFrameLength(*unarmed_Heavy3,6,6)
; setFrameMovement(*unarmed_Heavy3,0,-50)
; setFrameMovement(*unarmed_Heavy3,1,-50)
; setFrameMovement(*unarmed_Heavy3,2,-60)
; setFrameMovement(*unarmed_Heavy3,3,-60)
; setFrameMovement(*unarmed_Heavy3,4,-60)
; setFrameMovement(*unarmed_Heavy3,5,-60)
; setFrameMovement(*unarmed_Heavy3,6,-20)
; For i=2 To 5
; 	setFramePush(*unarmed_Heavy3,i,-40)
; Next
; animationSetComboEnd(*unarmed_Heavy3,1)
; ; animationGetHeavy(*unarmed_Back2)=*unarmed_Heavy3
; animationGetHeavy(*UABack2)=*unarmed_Heavy3
; setFrameSound(*unarmed_Heavy3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
*UAHeavy3.animation=classGenerateAnimation(4,"image/hand_unarmed_heavy3_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3",0,*UAHeavy3Raw,50,#H2H_DAMAGETYPE_BLUNT,15)
animationSetComboEnd(*UAHeavy3,#True)
setFrameLength(*UAHeavy3,0,4)
setFrameLength(*UAHeavy3,1,4)
setFrameLength(*UAHeavy3,3,7)
setFrameLength(*UAHeavy3,4,8)
setFrameMovement(*UAHeavy3,0,20)
setFrameMovement(*UAHeavy3,1,20)
setFrameMovement(*UAHeavy3,2,-100)
setFrameMovement(*UAHeavy3,3,-128)
setFrameMovementDelta(*UAHeavy3,3,-30)
setFrameMovementDelta(*UAHeavy3,4,-8)
setFramePush(*UAHeavy3,3,-40)
setFramePush(*UAHeavy3,4,-40)
setFrameSound(*UAHeavy3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAHeavy3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy3_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 1 wind front",0,*UAHeavy3_1WindFrontRaw)
animationFreeMovement(*UAHeavy3_1WindFront)
*UAHeavy3_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy3_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 2 wind front",0,*UAHeavy3_2WindFrontRaw)
animationFreeMovement(*UAHeavy3_2WindFront)
*UAHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy3_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 3 wind front",0,*UAHeavy3_3WindFrontRaw)
animationFreeMovement(*UAHeavy3_3WindFront)
*UAHeavy3_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy3_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 4 wind front",0,*UAHeavy3_4WindFrontRaw)
*UAHeavy3_5WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy3_5WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 5 wind front",0,*UAHeavy3_5WindFrontRaw)
setFrameLength(*UAHeavy3_5WindFront,1,6)
setFrameLength(*UAHeavy3_5WindFront,2,7)
animationFreeMovement(*UAHeavy3_5WindFront)

animationPrepareWind(*UAHeavy3,0)
*UAHeavy3\frontWind(0,0)=*UAHeavy3_1WindFront
*UAHeavy3\frontWind(1,0)=*UAHeavy3_2WindFront
*UAHeavy3\frontWind(2,0)=*UAHeavy3_3WindFront
*UAHeavy3\frontWind(3,0)=*UAHeavy3_4WindFront
*UAHeavy3\frontWind(4,0)=*UAHeavy3_5WindFront
animationGetHeavy(*UABack2)=*UAHeavy3


;-------- Hit New
*unarmed_HitNew.animation=classGenerateAnimation(4,"image/hand_unarmed_hit",50,#H2H_ANIMATIONTYPE_HIT,"hit",0,*UAHitNewRaw)

;------ spawn new
*unarmed_SpawnNew.animation=classGenerateAnimation(12,"image/hand_unarmed_spawn",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn new",0,*UASPawnNewRaw)
setFrameLength(*unarmed_SpawnNew,0,25)
For i=0 To 7
	setFrameLength(*unarmed_SpawnNew,i,2+i*2)
Next
For i=8 To 11
	setFrameLength(*unarmed_SpawnNew,i,i)
Next
setFrameSound(*unarmed_SpawnNew,6,*jointCrack\id)
setFrameSound(*unarmed_SpawnNew,12,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationPrepareWind(*unarmed_SpawnNew)
*unarmed_SpawnNew\frontWind(12,0)=classGenerateAnimation(1,"image/hand_unarmed_spawn13windfront",5,#H2H_ANIMATIONTYPE_SPAWN,"spawn 13 wind front",0,*UASpawn1_13WindFrontRaw)

;------ death new
*unarmed_Death.animation=classGenerateAnimation(13,"image/hand_unarmed_death",8,#H2H_ANIMATIONTYPE_DEATH,"death",0,*UADeathRaw)
setFrameSound(*unarmed_Death,11,*bodyFallSound\id)
setFrameSound(*unarmed_Death,13,*bodyFallSound\id)

setFrameShadow(*unarmed_Death,1,-10)
setFrameShadow(*unarmed_Death,2,-40)
setFrameShadow(*unarmed_Death,5,20)
setFrameShadow(*unarmed_Death,6,70)
setFrameShadow(*unarmed_Death,7,150)
setFrameShadow(*unarmed_Death,8,60)
setFrameShadow(*unarmed_Death,10,-125)
setFrameShadow(*unarmed_Death,11,-225)
setFrameShadow(*unarmed_Death,12,-275)
setFrameShadow(*unarmed_Death,13,-275)

setFrameShake(*unarmed_Death,11,10)
setFrameLength(*unarmed_Death,7,20)
For i=8 To 13
	setFrameLength(*unarmed_Death,i,5)
Next
animationPrepareWind(*unarmed_Death,1)

*unarmed_Death9WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_death9WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 9 wind front",0,*UADeath9WindFrontRaw)
*unarmed_Death12WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 12 wind front",0,*UADeath12WindFrontRaw)

*unarmed_Death10WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_death10WindBack",5,#H2H_ANIMATIONTYPE_DEATH,"death 10 wind back",0,*UADeath10WindBackRaw)
*unarmed_Death11WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_death11WindBack",5,#H2H_ANIMATIONTYPE_DEATH,"death 11 wind back",0,*UADeath11WindBackRaw)
*unarmed_Death12WindBack1.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindBack1_",4,#H2H_ANIMATIONTYPE_DEATH,"death 12 1 wind back",0,*UADeath12WindBack1Raw)
*unarmed_Death12WindBack2.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindBack2_",4,#H2H_ANIMATIONTYPE_DEATH,"death 12 2 wind back",0,*UADeath12WindBack2Raw)
For i=0 To 3
	setFrameLength(*unarmed_Death12WindBack1,i,5+i)
	setFrameLength(*unarmed_Death12WindBack2,i,6+i)
	setFrameLength(*unarmed_Death12WindFront,i,6+i)
Next

*unarmed_Death\frontWind( 8,0)=*unarmed_Death9WindFront
*unarmed_Death\frontWind(11,0)=*unarmed_Death12WindFront

*unarmed_Death\backWind( 9,0)=*unarmed_Death10WindBack
*unarmed_Death\backWind(10,0)=*unarmed_Death11WindBack
*unarmed_Death\backWind(11,0)=*unarmed_Death12WindBack1
*unarmed_Death\backWind(11,1)=*unarmed_Death12WindBack2

;------ jump
*unarmed_Jump.animation=classGenerateAnimation(8,"image/hand_unarmed_jump",4,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*UAJumpRaw)

;------ land
*unarmed_Land.animation=classGenerateAnimation(3,"image/hand_unarmed_land",4,#H2H_ANIMATIONTYPE_LAND,"land",0,*UALandRaw)
setFrameLength(*unarmed_Land,1,6)
setFrameLength(*unarmed_Land,2,5)
setFrameShadow(*unarmed_Land,0,-65,100)
setFrameShadow(*unarmed_Land,1,-90,200)
setFrameShadow(*unarmed_Land,2,-65,100)
setFrameShadow(*unarmed_Land,3,-30,50)

;------ Dodge
*UADodge.animation=classGenerateAnimation(1,"image/hand_unarmed_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*UADodgeRaw)
setFrameLength(*UADodge,1,20)

;------ branch
*unarmed_stat.statistic=statisticCreate(0,3,5,5,0,2,2,-1,-1,3,0,4)
Dim *tmpArray(0)
*tmpArray(0)=*finger_hit
*unarmed_stance_thumb.stance=stanceCreate(*tmpArray(),0,"Defense")
statisticCreate(*unarmed_stance_thumb\modificator,1,-2,-2,1,1,1,0,0,0,0)

*unarmed_stance_index.stance=stanceCreate(*tmpArray(),0,"Dexterity")
statisticCreate(*unarmed_stance_index\modificator,-1,1,0,0,0,0,0,0,0,0)

*unarmed_stance_middle.stance=stanceCreate(*tmpArray(),0,"Power")
statisticCreate(*unarmed_stance_middle\modificator,1,-2,-1,1,0,-1,0,0,2,0)

*unarmed_stance_ring.stance=stanceCreate(*tmpArray(),0,"Speed")
statisticCreate(*unarmed_stance_ring\modificator,0,1,1,0,-2,0,0,0,0,0)

*unarmed_stance_pinky.stance=stanceCreate(*tmpArray(),0,"Hyperactive")
statisticCreate(*unarmed_stance_pinky\modificator,-1,2,2,0,-1,-1,0,0,-1,0)

*unarmed.class=classCreate(0,"Unarmed",*unarmed_Idle1,*unarmed_Move_Front1,*unarmed_Move_Back1,*UANeutral1,*unarmed_Side1,*UAUp1,*unarmed_Back1,*UADown1,*unarmed_Heavy1)
*unarmed\allStances(0)\name="Balanced (default)"
Dim *unarmed\allStances(0)\materialClass(0)
*unarmed\allStances(0)\materialClass(0)=*finger_hit
classAddStance(*unarmed,*unarmed_stance_thumb)
classAddStance(*unarmed,*unarmed_stance_index)
classAddStance(*unarmed,*unarmed_stance_middle)
classAddStance(*unarmed,*unarmed_stance_ring)
classAddStance(*unarmed,*unarmed_stance_pinky)
*unarmed\iconPath$="image\Unarmed.png"
*unarmed\desc$="Nervous fighter, with quick response and combos.\Lacks of any range control, but hugely compensated by an excellent agility.\The unarmed hand can deal serious consecutive blows and take some.\Can close up and keep distance whenever it wants."
*unarmed\stat=*unarmed_stat

classGetSpawn(*unarmed)=*unarmed_SpawnNew
classGetDeath(*unarmed)=*unarmed_Death
classGetJump(*unarmed)=*unarmed_Jump
classGetLand(*unarmed)=*unarmed_Land
classGetHit(*unarmed)=*unarmed_HitNew
classGetDodge(*unarmed)=*UADodge

Dim *unarmed\otherIdle(0)
*unarmed\otherIdle(0)=*unarmed_Idle2
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 393
; FirstLine = 370
; EnableXP
; CPU = 1