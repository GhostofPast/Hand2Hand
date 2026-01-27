;------ Unarmed
;------- Idle 1
*UAIdle1.animation=classGenerateAnimation(9,"image/hand_unarmed_idle1_",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1",1,*UAIdle1Raw)

; setFrameLength(*UAIdle1,1,5)
animationSetFrameLength(*UAIdle1,2,4)
animationSetFrameLength(*UAIdle1,6,4)
; setFrameLength(*UAIdle1,7,5)

animationPrepareWind(*UAIdle1)
*UAIdle1_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle1_1windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 wind front",0,*UAIdle1_1WindFrontRaw)
animationSetFrameLength(*UAIdle1_1WindFront,1,6)
animationSetFrameOpacity(*UAIdle1_1WindFront,0,128)
animationSetFrameOpacity(*UAIdle1_1WindFront,1,64)
*UAIdle1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_2windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 wind front",0,*UAIdle1_2WindFrontRaw)
animationSetFrameOpacity(*UAIdle1_2WindFront,0,128)
*UAIdle1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_3windfront",4,#H2H_ANIMATIONTYPE_IDLE,"idle 1 3 wind front",0,*UAIdle1_3WindFrontRaw)
animationSetFrameOpacity(*UAIdle1_3WindFront,0,128)
*UAIdle1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle1_5windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 wind front",0,*UAIdle1_5WindFrontRaw)
animationSetFrameOpacity(*UAIdle1_5WindFront,0,128)
*UAIdle1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle1_6windfront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 6 wind front",0,*UAIdle1_6WindFrontRaw)
animationSetFrameLength(*UAIdle1_6WindFront,1,6)
animationSetFrameOpacity(*UAIdle1_6WindFront,0,128)
animationSetFrameOpacity(*UAIdle1_6WindFront,1,64)

*UAIdle1\frontWind(0,0)=*UAIdle1_1WindFront
*UAIdle1\frontWind(1,0)=*UAIdle1_2WindFront
*UAIdle1\frontWind(2,0)=*UAIdle1_3WindFront
*UAIdle1\frontWind(4,0)=*UAIdle1_5WindFront
*UAIdle1\frontWind(5,0)=*UAIdle1_6WindFront

animationShiftShift(*UAIdle1,1,5)
animationShiftShift(*UAIdle1,2,20)
animationShiftShift(*UAIdle1,3,10)
animationShiftShift(*UAIdle1,4,5)
animationShiftShift(*UAIdle1,6,5,5)
animationShiftShift(*UAIdle1,7,10,10)
animationShiftShift(*UAIdle1,8,10,20)
animationShiftShift(*UAIdle1,9,5,10)

animationSetFrameShadow(*UAIdle1,1,5)
animationSetFrameShadow(*UAIdle1,2,20)
animationSetFrameShadow(*UAIdle1,3,10)
animationSetFrameShadow(*UAIdle1,4,5)
animationSetFrameShadow(*UAIdle1,6,5,5)
animationSetFrameShadow(*UAIdle1,7,10,10)
animationSetFrameShadow(*UAIdle1,8,10,20)
animationSetFrameShadow(*UAIdle1,9,5,10)

;------- Idle 2
*UAIdle2.animation=classGenerateAnimation(7,"image/hand_unarmed_idle2_",3,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*UAIdle2Raw)
animationSetFrameLength(*UAIdle2,3,4)
animationSetFrameLength(*UAIdle2,4,8)
animationSetFrameLength(*UAIdle2,6,5)
animationSetFrameLength(*UAIdle2,7,8)
animationShiftShift(*UAIdle2,1,5)
animationShiftShift(*UAIdle2,2,10)
animationShiftShift(*UAIdle2,3,15)
animationShiftShift(*UAIdle2,4,20)
animationShiftShift(*UAIdle2,5,10)
animationShiftShift(*UAIdle2,6,-5)
animationShiftShift(*UAIdle2,7,-20)

animationSetFrameShadow(*UAIdle2,1,5)
animationSetFrameShadow(*UAIdle2,2,10)
animationSetFrameShadow(*UAIdle2,3,15)
animationSetFrameShadow(*UAIdle2,4,20)
animationSetFrameShadow(*UAIdle2,5,10)
animationSetFrameShadow(*UAIdle2,6,-5)
animationSetFrameShadow(*UAIdle2,7,-20)

animationPrepareWind(*UAIdle2)
*UAIdle2_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_idle2_5WindFront",4,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*UAIdle2_5WindFrontRaw)
animationSetFrameLength(*UAIdle1_6WindFront,1,5)
animationSetFrameOpacity(*UAIdle2_5WindFront,0,128)
animationSetFrameOpacity(*UAIdle2_5WindFront,1,64)
*UAIdle2_6WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind front",0,*UAIdle2_6WindFrontRaw)
animationSetFrameOpacity(*UAIdle2_6WindFront,0,128)
*UAIdle2_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_7WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 7 wind front",0,*UAIdle2_7WindFrontRaw)
animationSetFrameOpacity(*UAIdle2_7WindFront,0,128)
*UAIdle2_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_idle2_8WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 2 8 wind front",0,*UAIdle2_8WindFrontRaw)
animationSetFrameOpacity(*UAIdle2_8WindFront,0,128)
animationShiftShift(*UAIdle2_8WindFront,0,-30)

*UAIdle2\frontWind(4,0)=*UAIdle2_5WindFront
*UAIdle2\frontWind(5,0)=*UAIdle2_6WindFront
*UAIdle2\frontWind(6,0)=*UAIdle2_7WindFront
*UAIdle2\frontWind(7,0)=*UAIdle2_8WindFront

;------- Move Front 1
*UAMoveFront1.animation=classGenerateAnimation(6,"image/hand_unarmed_move_front1_",3,#H2H_ANIMATIONTYPE_FRONT,"front 1",1,*UAMoveFront1Raw)
animationShiftShift(*UAMoveFront1,0,10,-10)
animationShiftShift(*UAMoveFront1,1,15,-15)
animationShiftShift(*UAMoveFront1,2,20,-20)
animationShiftShift(*UAMoveFront1,3,10,-10)
animationShiftShift(*UAMoveFront1,4,0,0)
animationShiftShift(*UAMoveFront1,5,-10,-10)
animationShiftShift(*UAMoveFront1,6,-20,-20)
Dim *tmpArray(6)
For i=0 To 6
	*tmpArray(i)=*UAMoveFront1\frames(i)
Next
ReDim *UAMoveFront1\frames(11)
; special shift
*UAMoveFront1\frames(0)=*tmpArray(0)
*UAMoveFront1\frames(1)=*tmpArray(1)
*UAMoveFront1\frames(2)=*tmpArray(2)
*UAMoveFront1\frames(3)=*tmpArray(1)
*UAMoveFront1\frames(4)=*tmpArray(0)
*UAMoveFront1\frames(5)=*tmpArray(3)
*UAMoveFront1\frames(6)=*tmpArray(4)
*UAMoveFront1\frames(7)=*tmpArray(5)
*UAMoveFront1\frames(8)=*tmpArray(6)
*UAMoveFront1\frames(9)=*tmpArray(5)
*UAMoveFront1\frames(10)=*tmpArray(4)
*UAMoveFront1\frames(11)=*tmpArray(3)
animationSetFrameLength(*UAMoveFront1,2,6)
animationSetFrameLength(*UAMoveFront1,8,6)

*UAMoveFront1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_1windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 1",0,*UAMoveFront1_1WindFrontRaw)
animationSetFrameOpacity(*UAMoveFront1_1WindFront,0,128)
*UAMoveFront1_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_front1_2windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 2",0,*UAMoveFront1_2WindFrontRaw)
animationSetFrameLength(*UAMoveFront1_2WindFront,1,4)
animationSetFrameOpacity(*UAMoveFront1_2WindFront,0,128)
animationSetFrameOpacity(*UAMoveFront1_2WindFront,1,64)
*UAMoveFront1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_5windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 5",0,*UAMoveFront1_5WindFrontRaw)
animationSetFrameOpacity(*UAMoveFront1_5WindFront,0,128)
*UAMoveFront1_6WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_6windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 6",0,*UAMoveFront1_6WindFrontRaw)
animationSetFrameOpacity(*UAMoveFront1_6WindFront,0,128)
*UAMoveFront1_7WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_front1_7windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 7",0,*UAMoveFront1_7WindFrontRaw)
animationSetFrameLength(*UAMoveFront1_7WindFront,1,4)
animationSetFrameOpacity(*UAMoveFront1_7WindFront,0,128)
animationSetFrameOpacity(*UAMoveFront1_7WindFront,1,64)
*UAMoveFront1_12WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_12windfront",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind front 12",0,*UAMoveFront1_12WindFrontRaw)
animationSetFrameOpacity(*UAMoveFront1_12WindFront,0,128)

*UAMoveFront1_11WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_11windback",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind back 11",0,*UAMoveFront1_11WindBackRaw)
animationSetFrameOpacity(*UAMoveFront1_11WindBack,0,128)
*UAMoveFront1_12WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_move_front1_12windback",3,#H2H_ANIMATIONTYPE_FRONT,"move front wind back 12",0,*UAMoveFront1_12WindBackRaw)
animationSetFrameOpacity(*UAMoveFront1_12WindBack,0,128)

animationPrepareWind(*UAMoveFront1)
*UAMoveFront1\frontWind(0,0)=*UAMoveFront1_1WindFront
*UAMoveFront1\frontWind(1,0)=*UAMoveFront1_2WindFront
*UAMoveFront1\frontWind(4,0)=*UAMoveFront1_5WindFront
*UAMoveFront1\frontWind(5,0)=*UAMoveFront1_6WindFront
*UAMoveFront1\frontWind(6,0)=*UAMoveFront1_7WindFront
*UAMoveFront1\frontWind(11,0)=*UAMoveFront1_12WindFront

*UAMoveFront1\backWind(10,0)=*UAMoveFront1_11WindBack
*UAMoveFront1\backWind(11,0)=*UAMoveFront1_12WindBack

;------- Move Back 1
*UAMoveBack1.animation=classGenerateAnimation(10,"image/hand_unarmed_move_back1_",5,#H2H_ANIMATIONTYPE_BACK,"back",1,*UAMoveBack1Raw)
*UAMoveBack1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_1windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 1",0,*UAMoveBack1_1WindFrontRaw)
animationSetFrameOpacity(*UAMoveBack1_1WindFront,0,128)
*UAMoveBack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_2windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 2",0,*UAMoveBack1_2WindFrontRaw)
animationSetFrameOpacity(*UAMoveBack1_2WindFront,0,128)
*UAMoveBack1_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_move_back1_3windfront",3,#H2H_ANIMATIONTYPE_BACK,"move back wind front 3",0,*UAMoveBack1_3WindFrontRaw)
animationSetFrameLength(*UAMoveBack1_3WindFront,1,4)
animationSetFrameOpacity(*UAMoveBack1_3WindFront,0,128)
animationSetFrameOpacity(*UAMoveBack1_3WindFront,1,64)
*UAMoveBack1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_4windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 4",0,*UAMoveBack1_4WindFrontRaw)
animationSetFrameOpacity(*UAMoveBack1_4WindFront,0,128)
*UAMoveBack1_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_7windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 7",0,*UAMoveBack1_7WindFrontRaw)
animationSetFrameOpacity(*UAIdle1_1WindFront,0,128)
*UAMoveBack1_9WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_9windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 9",0,*UAMoveBack1_9WindFrontRaw)
animationSetFrameOpacity(*UAMoveBack1_9WindFront,0,128)
*UAMoveBack1_11WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_move_back1_11windfront",5,#H2H_ANIMATIONTYPE_BACK,"move back wind front 11",0,*UAMoveBack1_11WindFrontRaw)
animationSetFrameOpacity(*UAMoveBack1_11WindFront,0,128)

animationPrepareWind(*UAMoveBack1)
*UAMoveBack1\frontWind(0,0)=*UAMoveBack1_1WindFront
*UAMoveBack1\frontWind(1,0)=*UAMoveBack1_2WindFront
*UAMoveBack1\frontWind(2,0)=*UAMoveBack1_3WindFront
*UAMoveBack1\frontWind(3,0)=*UAMoveBack1_4WindFront
*UAMoveBack1\frontWind(6,0)=*UAMoveBack1_7WindFront
*UAMoveBack1\frontWind(8,0)=*UAMoveBack1_9WindFront
*UAMoveBack1\frontWind(10,0)=*UAMoveBack1_11WindFront

;------- Neutral 1
*UANeutral1.animation=classGenerateAnimation(5,"image/hand_unarmed_neutral1_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*UANeutral1Raw,10,#H2H_DAMAGETYPE_BLUNT,3)
animationSetFrameCDN(*UANeutral1,5,4)
animationSetFrameSound(*UANeutral1,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UANeutral1,3,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UANeutral1,5,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFramePush(*UANeutral1,1,-7)
animationSetFramePush(*UANeutral1,3,-7)
animationSetFramePush(*UANeutral1,5,-5)
animationSetFrameLength(*UANeutral1,0,2)
animationSetFrameLength(*UANeutral1,2,2)
animationSetFrameLength(*UANeutral1,4,2)
animationSetFrameLength(*UANeutral1,5,8)
animationSetFrameMovement(*UANeutral1,0,10)
animationSetFrameMovement(*UANeutral1,1,-40)
animationSetFrameMovement(*UANeutral1,2,10)
animationSetFrameMovement(*UANeutral1,3,-40)
animationSetFrameMovement(*UANeutral1,4,10)
animationSetFrameMovement(*UANeutral1,5,-40)
animationSetFrameDamageCut(*UANeutral1,2)
animationSetFrameDamageCut(*UANeutral1,4)

*UANeutral1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*UANeutral1_2WindFrontRaw)
animationSetFrameLength(*UANeutral1_2WindFront,1,4)
animationSetFrameLength(*UANeutral1_2WindFront,2,5)
animationSetFrameOpacity(*UANeutral1_2WindFront,1,192)
animationSetFrameOpacity(*UANeutral1_2WindFront,2,128)
*UANeutral1_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral1_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*UANeutral1_4WindFrontRaw)
animationSetFrameLength(*UANeutral1_4WindFront,1,4)
animationSetFrameOpacity(*UANeutral1_4WindFront,1,192)
*UANeutral1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral1_6WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind front",0,*UANeutral1_6WindFrontRaw)
animationSetFrameLength(*UANeutral1_6WindFront,1,4)
animationSetFrameOpacity(*UANeutral1_6WindFront,1,192)

*UANeutral1_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_4WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind back",0,*UANeutral1_4WindBackRaw)
animationSetFrameLength(*UANeutral1_4WindBack,1,4)
animationSetFrameLength(*UANeutral1_4WindBack,2,5)
animationSetFrameOpacity(*UANeutral1_4WindBack,1,192)
animationSetFrameOpacity(*UANeutral1_4WindBack,2,128)
*UANeutral1_6WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral1_6WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind back",0,*UANeutral1_6WindBackRaw)
animationSetFrameLength(*UANeutral1_4WindBack,1,4)
animationSetFrameLength(*UANeutral1_4WindBack,2,5)
animationSetFrameOpacity(*UANeutral1_4WindBack,1,192)
animationSetFrameOpacity(*UANeutral1_4WindBack,2,128)

animationPrepareWind(*UANeutral1,0)
*UANeutral1\frontWind(1,0)=*UANeutral1_2WindFront
*UANeutral1\frontWind(3,0)=*UANeutral1_4WindFront
*UANeutral1\frontWind(5,0)=*UANeutral1_6WindFront
*UANeutral1\backWind(3,0)=*UANeutral1_4WindBack
*UANeutral1\backWind(5,0)=*UANeutral1_6WindBack
animationFreeMovementWind(*UANeutral1)

;------- Neutral 2
*UANeutral2.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral2_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2",0,*UANeutral2Raw,12,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameCDN(*UANeutral2,2,3)
animationSetUngrounded(*UANeutral2)
animationSetFrameSound(*UANeutral2,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFramePush(*UANeutral2,1,-10,5)
animationSetFramePush(*UANeutral2,2,-5,5)
animationSetFrameMovement(*UANeutral2,0,10)
animationSetFrameMovement(*UANeutral2,1,-40,10)
animationSetFrameMovement(*UANeutral2,2,-40,10)
animationSetFrameLength(*UANeutral2,2,8)
*UANeutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral2_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 1 wind front",0,*UANeutral2_1WindFrontRaw)
*UANeutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral2_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 2 wind front",0,*UANeutral2_2WindFrontRaw)
*UANeutral2_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_neutral2_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind front",0,*UANeutral2_3WindFrontRaw)
animationSetFrameLength(*UANeutral2_3WindFront,1,4)
animationSetFrameOpacity(*UANeutral2_3WindFront,1,192)
animationPrepareWind(*UANeutral2,0)
*UANeutral2\frontWind(0,0)=*UANeutral2_1WindFront
*UANeutral2\frontWind(1,0)=*UANeutral2_2WindFront
*UANeutral2\frontWind(2,0)=*UANeutral2_3WindFront
animationFreeMovementWind(*UANeutral2)

animationGetNeutral(*UANeutral1)=*UANeutral2

;------- Neutral 3
*UANeutral3.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral3_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*UANeutral3Raw,12,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameCDN(*UANeutral3,2,1)
animationSetFramePush(*UANeutral3,1,-5,-5)
animationSetUngrounded(*UANeutral3)
animationSetFrameLength(*UANeutral3,1,5)
animationSetFrameLength(*UANeutral3,2,7)
animationSetFrameSound(*UANeutral3,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameMovement(*UANeutral3,0,-30,-10)
animationSetFrameMovement(*UANeutral3,1,-30,-10)

*UANeutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral3_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind front",0,*UANeutral3_1WindFrontRaw)
*UANeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral3_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*UANeutral3_2WindFrontRaw)
animationSetFrameLength(*UANeutral3_2WindFront,1,4)
animationSetFrameLength(*UANeutral3_2WindFront,2,5)
animationSetFrameOpacity(*UANeutral3_2WindFront,1,192)
animationSetFrameOpacity(*UANeutral3_2WindFront,2,128)

*UANeutral3_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral3_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind back",0,*UANeutral3_1WindBackRaw)

animationPrepareWind(*UANeutral3,0)
*UANeutral3\frontWind(0,0)=*UANeutral3_1WindFront
*UANeutral3\frontWind(1,0)=*UANeutral3_2WindFront
*UANeutral3\backWind(0,0)=*UANeutral3_1WindBack
animationFreeMovementWind(*UANeutral3)
animationGetNeutral(*UANeutral2)=*UANeutral3

;------- Neutral 4
*UANeutral4.animation=classGenerateAnimation(4,"image/hand_unarmed_neutral4_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4",0,*UANeutral4Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameMovement(*UANeutral4,0,50,-5)
animationSetFrameMovement(*UANeutral4,1,65,0)
animationSetFrameMovement(*UANeutral4,2,-70,-30)
animationSetFrameMovement(*UANeutral4,3,-80,-30)
animationSetFrameMovement(*UANeutral4,4,-5,30)
animationSetFrameGrab(*UANeutral4,2)
animationSetFrameGrab(*UANeutral4,3)
animationSetFrameSound(*UANeutral4,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UANeutral4,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameLength(*UANeutral4,0,3)
animationSetFrameLength(*UANeutral4,1,3)
animationSetFrameLength(*UANeutral4,1,6)
animationSetFrameLength(*UANeutral4,3,6)
animationSetFrameLength(*UANeutral4,4,10)
animationSetFrameCDN(*UANeutral4,4,5)
animationPrepareWind(*UANeutral4)

*UANeutral4_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_1WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 1 wind back",0,*UANeutral4_1WindBackRaw)
*UANeutral4_2WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 2 wind back",0,*UANeutral4_2WindBackRaw)
animationSetFrameLength(*UANeutral4_2WindBack,1,5)
animationSetFrameLength(*UANeutral4_2WindBack,2,6)
animationSetFrameOpacity(*UANeutral4_2WindBack,1,192)
animationSetFrameOpacity(*UANeutral4_2WindBack,2,128)
*UANeutral4_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 3 wind back",0,*UANeutral4_3WindBackRaw)
*UANeutral4_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_4WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 4 wind back",0,*UANeutral4_4WindBackRaw)
animationSetFrameLength(*UANeutral4_4WindBack,1,5)
animationSetFrameLength(*UANeutral4_4WindBack,2,6)
animationSetFrameOpacity(*UANeutral4_4WindBack,1,192)
animationSetFrameOpacity(*UANeutral4_4WindBack,2,128)

*UANeutral4_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_neutral4_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 2 wind front",0,*UANeutral4_2WindFrontRaw)
animationSetFrameLength(*UANeutral4_2WindFront,1,5)
animationSetFrameLength(*UANeutral4_2WindFront,2,6)
animationSetFrameOpacity(*UANeutral4_2WindFront,1,192)
animationSetFrameOpacity(*UANeutral4_2WindFront,2,128)
*UANeutral4_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_neutral4_5WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4 5 wind front",0,*UANeutral4_5WindFrontRaw)

*UANeutral4\backWind(0,0)=*UANeutral4_1WindBack
*UANeutral4\backWind(1,0)=*UANeutral4_2WindBack
*UANeutral4\backWind(2,0)=*UANeutral4_3WindBack
*UANeutral4\backWind(3,0)=*UANeutral4_4WindBack

*UANeutral4\frontWind(1,0)=*UANeutral4_4WindFront
*UANeutral4\frontWind(4,0)=*UANeutral4_5WindFront

animationFreeMovementWind(*UANeutral4)

;------- Side 1
*UASide1.animation=classGenerateAnimation(9,"image/hand_unarmed_side1_",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*UASide1Raw,30,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameSound(*UASide1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UASide1,7,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameDamageCut(*UASide1,6)
animationSetFrameLength(*UASide1,0,2)
animationSetFrameLength(*UASide1,1,4)
animationSetFrameLength(*UASide1,3,2)
animationSetFrameLength(*UASide1,4,5)
animationSetFrameLength(*UASide1,6,2)
animationSetFrameLength(*UASide1,7,2)
animationSetFrameLength(*UASide1,9,12)
*UASide1\frames(9)\damageDuration=4
animationSetFrameMovement(*UASide1,0,30)
animationSetFrameMovement(*UASide1,1,10)
animationSetFrameMovement(*UASide1,2,-20)
animationSetFrameMovement(*UASide1,3,-20,-50)
animationSetFrameMovement(*UASide1,4,-20)
animationSetFrameMovement(*UASide1,5,-20)
animationSetFrameMovement(*UASide1,6,0,25)
animationSetFrameMovement(*UASide1,7,-10,25)
animationSetFrameMovement(*UASide1,8,-40,25)
animationSetFrameMovement(*UASide1,9,-40)
animationSetFrameCDN(*UASide1,9,4)
animationPrepareWind(*UASide1)
animationSetFramePush(*UASide1,2,-10)
animationSetFramePush(*UASide1,3,-10)
animationSetFramePush(*UASide1,4,-10)
animationSetFramePush(*UASide1,5,-10)
animationSetFramePush(*UASide1,8,-15)
animationSetFramePush(*UASide1,9,-15)

*UASide1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_1WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind front",0,*UASide1_1WindFrontRaw)
*UASide1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side1_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind front",0,*UASide1_2WindFrontRaw)
animationSetFrameLength(*UASide1_2WindFront,1,5)
animationSetFrameLength(*UASide1_2WindFront,2,6)
animationSetFrameOpacity(*UASide1_2WindFront,1,192)
animationSetFrameOpacity(*UASide1_2WindFront,2,128)
*UASide1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind front",0,*UASide1_3WindFrontRaw)
*UASide1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind front",0,*UASide1_4WindFrontRaw)
*UASide1_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 5 wind front",0,*UASide1_5WindFrontRaw)
*UASide1_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side1_6WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 6 wind front",0,*UASide1_6WindFrontRaw)
animationSetFrameLength(*UASide1_6WindFront,1,4)
animationSetFrameLength(*UASide1_6WindFront,2,5)
animationSetFrameOpacity(*UASide1_6WindFront,1,192)
animationSetFrameOpacity(*UASide1_6WindFront,2,128)
*UASide1_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_8WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 8 wind front",0,*UASide1_8WindFrontRaw)
*UASide1_9WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side1_9WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 9 wind front",0,*UASide1_9WindFrontRaw)
animationSetFrameLength(*UASide1_9WindFront,1,4)
animationSetFrameOpacity(*UASide1_9WindFront,1,192)
*UASide1_10WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side1_10WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 10 wind front",0,*UASide1_10WindFrontRaw)
animationSetFrameLength(*UASide1_10WindFront,1,4)
animationSetFrameLength(*UASide1_10WindFront,2,5)
animationSetFrameLength(*UASide1_10WindFront,3,6)
animationSetFrameOpacity(*UASide1_10WindFront,1,192)
animationSetFrameOpacity(*UASide1_10WindFront,2,128)
animationSetFrameOpacity(*UASide1_10WindFront,3,64)

*UASide1_8WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_8WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 8 wind back",0,*UASide1_8WindBackRaw)
*UASide1_9WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side1_9WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 9 wind back",0,*UASide1_9WindBackRaw)
*UASide1_10WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_side1_10WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 10 wind back",0,*UASide1_10WindBackRaw)
animationSetFrameLength(*UASide1_10WindBack,1,4)
animationSetFrameOpacity(*UASide1_10WindBack,1,192)

*UASide1\frontWind(0,0)=*UASide1_1WindFront
*UASide1\frontWind(1,0)=*UASide1_2WindFront
*UASide1\frontWind(2,0)=*UASide1_3WindFront
*UASide1\frontWind(3,0)=*UASide1_4WindFront
*UASide1\frontWind(4,0)=*UASide1_5WindFront
*UASide1\frontWind(5,0)=*UASide1_6WindFront
*UASide1\frontWind(7,0)=*UASide1_8WindFront
*UASide1\frontWind(8,0)=*UASide1_9WindFront
*UASide1\frontWind(9,0)=*UASide1_10WindFront

*UASide1\backWind(7,0)=*UASide1_8WindBack
*UASide1\backWind(8,0)=*UASide1_9WindBack
*UASide1\backWind(9,0)=*UASide1_10WindBack
animationFreeMovementWind(*UASide1)

;------- Side 2
*UASide2.animation=classGenerateAnimation(4,"image/hand_unarmed_side2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*UASide2Raw,8,#H2H_DAMAGETYPE_BLUNT,7)
animationSetUngrounded(*UASide2)
animationGetSide(*UANeutral3)=*UASide2
animationSetFrameSound(*UASide2,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UASide2,3,#H2H_SOUND_ID_HAND_LAND)
animationSetFramePushD(*UASide2,1,-10)
animationSetFramePushD(*UASide2,2,-10)
animationSetFramePushD(*UASide2,3,-5)
animationSetFrameDamage(*UASide2,1,5)
animationSetFrameMovement(*UASide2,0,-20)
animationSetFrameMovement(*UASide2,1,-40)
animationSetFrameMovement(*UASide2,2,-60,20)
animationSetFrameMovement(*UASide2,3,-60,25)
animationSetFrameMovement(*UASide2,4,35,-15)
animationSetFrameLength(*UASide2,0,3)
animationSetFrameLength(*UASide2,1,3)
animationSetFrameLength(*UASide2,3,6)
animationSetFrameLength(*UASide2,4,6)
animationSetFrameShake(*UASide2,3,5)
*UASide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind front",0,*UASide2_1WindFrontRaw)
*UASide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind front",0,*UASide2_2WindFrontRaw)
*UASide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side2_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind front",0,*UASide2_3WindFrontRaw)
*UASide2_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side2_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front",0,*UASide2_4WindFrontRaw)
animationSetFrameLength(*UASide2_4WindFront,1,6)
animationSetFrameLength(*UASide2_4WindFront,2,7)
animationSetFrameOpacity(*UASide2_4WindFront,1,192)
animationSetFrameOpacity(*UASide2_4WindFront,2,128)

*UASide2_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_side2_4WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind back",0,*UASide2_4WindBackRaw)
animationSetFrameLength(*UASide2_4WindBack,1,6)
animationSetFrameLength(*UASide2_4WindBack,2,9)
animationSetFrameOpacity(*UASide2_4WindBack,1,192)
animationSetFrameOpacity(*UASide2_4WindBack,2,128)
animationPrepareWind(*UASide2,0)
*UASide2\frontWind(0,0)=*UASide2_1WindFront
*UASide2\frontWind(1,0)=*UASide2_2WindFront
*UASide2\frontWind(2,0)=*UASide2_3WindFront
*UASide2\frontWind(3,0)=*UASide2_4WindFront
*UASide2\backWind(3,0)=*UASide2_4WindBack
animationFreeMovementWind(*UASide2)

;------- Side 3
*UASide3.animation=classGenerateAnimation(3,"image/hand_unarmed_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3",0,*UASide3Raw,40,#H2H_DAMAGETYPE_BLUNT,6)
animationSetUngrounded(*UASide3)
animationSetComboEnd(*UASide3,#True)
animationSetFrameSound(*UASide3,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UASide3,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameLength(*UASide3,1,3)
animationSetFrameLength(*UASide3,2,3)
animationSetFrameLength(*UASide3,3,11)
animationSetFrameDamageDuration(*UASide3,3,5)
animationSetFrameMovementDelta(*UASide3,3,-10)
animationSetFrameMovement(*UASide3,0,32,-40)
animationSetFrameMovement(*UASide3,1,-96)
animationSetFrameMovement(*UASide3,2,-140,20)
animationSetFrameMovement(*UASide3,3,-64,20)
animationSetFramePush(*UASide3,1,-10)
animationSetFramePush(*UASide3,2,-30)
animationSetFramePush(*UASide3,3,-20)

*UASide3_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side3_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 1 wind front",0,*UASide3_1WindFrontRaw)
animationFreeMovement(*UASide3_1WindFront)
animationSetFrameLength(*UASide3_1WindFront,1,6)
animationSetFrameOpacity(*UASide3_1WindFront,1,192)
*UASide3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side3_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 2 wind front",0,*UASide3_2WindFrontRaw)
animationFreeMovement(*UASide3_2WindFront)
*UASide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side3_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 3 wind front",0,*UASide3_3WindFrontRaw)
animationFreeMovement(*UASide3_3WindFront)
*UASide3_4WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side3_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 4 wind front",0,*UASide3_4WindFrontRaw)
animationSetFrameFreeMovement(*UASide3_4WindFront\frames(2))
animationSetFrameFreeMovement(*UASide3_4WindFront\frames(3))
animationSetFrameLength(*UASide3_4WindFront,1,6)
animationSetFrameLength(*UASide3_4WindFront,2,7)
animationSetFrameLength(*UASide3_4WindFront,3,8)
animationSetFrameOpacity(*UASide3_4WindFront,1,192)
animationSetFrameOpacity(*UASide3_4WindFront,2,128)
animationSetFrameOpacity(*UASide3_4WindFront,3,64)

animationPrepareWind(*UASide3,0)
*UASide3\frontWind(0,0)=*UASide3_1WindFront
*UASide3\frontWind(1,0)=*UASide3_2WindFront
*UASide3\frontWind(2,0)=*UASide3_3WindFront
*UASide3\frontWind(3,0)=*UASide3_4WindFront

;------- Side 4
*UASide4.animation=classGenerateAnimation(5,"image/hand_unarmed_side4_",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*UASide4Raw,25,#H2H_DAMAGETYPE_BLUNT,7)
animationSetComboEnd(*UASide4,#True)
animationSetFrameLength(*UASide4,3,3)
animationSetFrameLength(*UASide4,4,5)
animationSetFrameLength(*UASide4,5,7)
animationSetFrameMovement(*UASide4,0,10,40)
animationSetFrameMovement(*UASide4,1,20,20)
animationSetFrameMovement(*UASide4,2,30,20)
animationSetFrameMovement(*UASide4,3,-64,-30)
animationSetFrameMovement(*UASide4,4,-64,-10)
animationSetFrameMovement(*UASide4,5,-32)
animationSetFrameSound(*UASide4,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UASide4,3,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameStun(*UASide4,3,5)
animationSetFrameStun(*UASide4,4,5)
animationSetFrameStun(*UASide4,5,5)
animationSetFramePushD(*UASide4,3,-20)
animationSetFramePushD(*UASide4,4,-20)
animationSetFramePushD(*UASide4,5,-20)
animationSetFrameDamageDuration(*UASide4,5,4)

*UASide4_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_1WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind front",0,*UASide4_1WindFrontRaw)
*UASide4_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_2WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 2 wind front",0,*UASide4_2WindFrontRaw)
*UASide4_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_side4_3WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 3 wind front",0,*UASide4_3WindFrontRaw)
animationSetFrameLength(*UASide4_3WindFront,1,4)
animationSetFrameOpacity(*UASide4_3WindFront,1,192)
*UASide4_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 4 wind front",0,*UASide4_4WindFrontRaw)
*UASide4_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side4_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind front",0,*UASide4_5WindFrontRaw)
*UASide4_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side4_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 6 wind front",0,*UASide4_6WindFrontRaw)
animationSetFrameLength(*UASide4_6WindFront,1,6)
animationSetFrameLength(*UASide4_6WindFront,2,7)
animationSetFrameOpacity(*UASide4_6WindFront,1,192)
animationSetFrameOpacity(*UASide4_6WindFront,2,128)

animationPrepareWind(*UASide4,0)
*UASide4\frontWind(0,0)=*UASide4_1WindFront
*UASide4\frontWind(1,0)=*UASide4_2WindFront
*UASide4\frontWind(2,0)=*UASide4_3WindFront
*UASide4\frontWind(3,0)=*UASide4_4WindFront
*UASide4\frontWind(4,0)=*UASide4_5WindFront
*UASide4\frontWind(5,0)=*UASide4_6WindFront
animationFreeMovementWind(*UASide4)

;------- Side 5
*UASide5.animation=classGenerateAnimation(3,"image/hand_unarmed_side5_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*UASide5Raw,15,#H2H_DAMAGETYPE_BLUNT,6)
ReDim *UASide5\frames(4)
Swap *UASide5\frames(3),*UASide5\frames(4)
*UASide5\frames(3)=frameDataGive()
frameCopy(*UASide5\frames(3),*UASide5\frames(2),#True)
*UASide5\frames(3)\hurtpath$="image/hand_unarmed_side5_4"
*UASide5\frames(3)\hurtId=spriteIndexAdd()
*UASide5\frames(3)\hurtFlip=spriteIndexAdd()
Swap *UASide5\frames(3)\hurtShift,*UASide5\frames(4)\hurtShift
*UASide5\frames(4)\hurtId=0
*UASide5\frames(4)\hurtFlip=0
animationPrepareWind(*UASide5,0)

animationSetFrameCDN(*UASide5,4,5)
animationSetFrameSound(*UASide5,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UASide5,0,16)
animationSetFrameMovement(*UASide5,1,16)
animationSetFrameMovement(*UASide5,2,-128)
animationSetFrameLength(*UASide5,2,2)
animationSetFrameLength(*UASide5,3,6)
animationSetFrameLength(*UASide5,4,10)
animationSetFrameMovementDelta(*UASide5,2,-40)
animationSetFrameMovementDelta(*UASide5,3,-30)
animationSetFramePushD(*UASide5,2,-15)
animationSetFramePushD(*UASide5,3,-15)

*UASide5_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side5_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*UASide5_2WindFrontRaw)
animationSetFrameLength(*UASide5_2WindFront,1,4)
animationSetFrameLength(*UASide5_2WindFront,2,5)
animationSetFrameOpacity(*UASide5_2WindFront,1,192)
animationSetFrameOpacity(*UASide5_2WindFront,2,128)
*UASide5_3WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side5_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 3 wind front",0,*UASide5_3WindFrontRaw)
animationSetFrameFreeMovement(*UASide5_3WindFront\frames(2))
animationSetFrameFreeMovement(*UASide5_3WindFront\frames(3))
animationSetFrameLength(*UASide5_3WindFront,1,6)
animationSetFrameLength(*UASide5_3WindFront,2,7)
animationSetFrameLength(*UASide5_3WindFront,3,8)
animationSetFrameOpacity(*UASide5_3WindFront,1,192)
animationSetFrameOpacity(*UASide5_3WindFront,2,128)
animationSetFrameOpacity(*UASide5_3WindFront,3,64)
*UASide5_2WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side5_2WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind back",0,*UASide5_2WindBackRaw)

animationPrepareWind(*UASide5,0)
*UASide5\frontWind(1,0)=*UASide5_2WindFront
*UASide5\frontWind(2,0)=*UASide5_3WindFront
*UASide5\backWind(1,0)=*UASide5_2WindBack

;------- Side 6
*UASide6.animation=classGenerateAnimation(4,"image/hand_unarmed_side6_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6",0,*UASide6Raw,25,#H2H_DAMAGETYPE_BLUNT,6)
animationSetComboEnd(*UASide6,#True)
animationSetFrameLength(*UASide6,0,6)
animationSetFrameLength(*UASide6,2,2)
animationSetFrameLength(*UASide6,3,2)
animationSetFrameLength(*UASide6,4,9)
animationSetFrameDamageDuration(*UASide6,4,4)
For i=1 To 3
	animationSetFramePush(*UASide6,i,-45)
Next
animationSetFrameMovement(*UASide6,0,48,32)
animationSetFrameMovement(*UASide6,1,-64,16)
animationSetFrameMovement(*UASide6,2,-96,8)
animationSetFrameMovement(*UASide6,3,-96,4)
animationSetFrameMovement(*UASide6,4,-64,2)
animationSetFrameMovementDelta(*UASide6,4,-8)
animationSetFrameSound(*UASide6,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UASide6,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)

animationGetSide(*UANeutral4)=*UASide6

*UASide6_1WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_side6_1WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 1 wind front",0,*UASide6_1WindFrontRaw)
animationSetFrameLength(*UASide6_1WindFront,1,4)
animationSetFrameLength(*UASide6_1WindFront,2,5)
animationSetFrameOpacity(*UASide6_1WindFront,1,192)
animationSetFrameOpacity(*UASide6_1WindFront,2,128)
*UASide6_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 2 wind front",0,*UASide6_2WindFrontRaw)
*UASide6_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_3WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 3 wind front",0,*UASide6_3WindFrontRaw)
*UASide6_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_4WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 4 wind front",0,*UASide6_4WindFrontRaw)
*UASide6_5WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_side6_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 5 wind front",0,*UASide6_5WindFrontRaw)
animationSetFrameLength(*UASide6_5WindFront,1,4)
animationSetFrameLength(*UASide6_5WindFront,2,5)
animationSetFrameLength(*UASide6_5WindFront,3,6)
animationSetFrameOpacity(*UASide6_5WindFront,1,192)
animationSetFrameOpacity(*UASide6_5WindFront,2,128)
animationSetFrameOpacity(*UASide6_5WindFront,3,64)

*UASide6_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_3WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 3 wind back",0,*UASide6_3WindBackRaw)
*UASide6_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_side6_4WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 4 wind back",0,*UASide6_4WindBackRaw)
*UASide6_5WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_side6_5WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 5 wind back",0,*UASide6_5WindBackRaw)
animationSetFrameLength(*UASide6_5WindBack,1,5)
animationSetFrameLength(*UASide6_5WindBack,2,6)
animationSetFrameOpacity(*UASide6_5WindBack,1,192)
animationSetFrameOpacity(*UASide6_5WindBack,2,128)

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

;------- Back 1 
*UABack1.animation=classGenerateAnimation(9,"image/hand_unarmed_back1_",2,#H2H_ANIMATIONTYPE_NBACK,"back 1",0,*UABack1Raw,20,#H2H_DAMAGETYPE_BLUNT,3)
animationSetFrameSound(*UABack1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UABack1,5,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

animationSetFrameMovement(*UABack1,1,50,-20)
animationSetFrameMovement(*UABack1,2,60,-30)
animationSetFrameMovement(*UABack1,3,60,20)
animationSetFrameMovement(*UABack1,4,50,30)
animationSetFrameMovement(*UABack1,5,40)
animationSetFrameMovement(*UABack1,6,-150,-20)
animationSetFrameMovement(*UABack1,7,-125,20)
animationSetFrameMovement(*UABack1,8,-125)
animationSetFrameMovement(*UABack1,9,100)

animationSetFrameStun(*UABack1,6,30)
animationSetFrameStun(*UABack1,7,20)
animationSetFrameStun(*UABack1,8,15)

animationSetFramePushD(*UABack1,6,-60)
animationSetFramePushD(*UABack1,7,-40)
animationSetFramePushD(*UABack1,8,-30)

animationSetFrameDamage(*UABack1,7,6)
animationSetFrameDamage(*UABack1,8,5)

animationSetFrameLength(*UABack1,4,5)
animationSetFrameLength(*UABack1,5,4)
animationSetFrameLength(*UABack1,7,4)
animationSetFrameLength(*UABack1,8,5)
animationSetFrameLength(*UABack1,9,5)
animationGetSide(*UABack1)=*UASide5

*UABack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_2frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*UABack1_2WindFrontRaw)
*UABack1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_3frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*UABack1_3WindFrontRaw)
*UABack1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_4frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*UABack1_4WindFrontRaw)
*UABack1_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back1_5frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 wind front",0,*UABack1_5WindFrontRaw)
frameSetFreeMovement(*UABack1_5WindFront\frames(0),#True)
animationSetFrameLength(*UABack1_5WindFront,1,5)
animationSetFrameOpacity(*UABack1_5WindFront,1,192)
*UABack1_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back1_6frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind front",0,*UABack1_6WindFrontRaw)
animationSetFrameLength(*UABack1_6WindFront,1,5)
animationSetFrameOpacity(*UABack1_6WindFront,1,192)
*UABack1_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_7frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 wind front",0,*UABack1_7WindFrontRaw)
*UABack1_8WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_8frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 wind front",0,*UABack1_8WindFrontRaw)
frameSetFreeMovement(*UABack1_8WindFront\frames(0),#True)
*UABack1_9WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back1_9frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 wind front",0,*UABack1_9WindFrontRaw)
frameSetFreeMovement(*UABack1_9WindFront\frames(0),#True)
For i=0 To 3
	animationSetFrameMovement(*UABack1_9WindFront,i,-20)
Next
animationSetFrameLength(*UABack1_9WindFront,1,5)
animationSetFrameLength(*UABack1_9WindFront,2,6)
animationSetFrameLength(*UABack1_9WindFront,3,7)
animationSetFrameOpacity(*UABack1_9WindFront,1,192)
animationSetFrameOpacity(*UABack1_9WindFront,2,128)
animationSetFrameOpacity(*UABack1_9WindFront,3,64)

*UABack1_2WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_2backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind back",0,*UABack1_2WindBackRaw)
*UABack1_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_3backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind back",0,*UABack1_3WindBackRaw)
*UABack1_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back1_4backwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind back",0,*UABack1_4WindBackRaw)
*UABack1_5WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_back1_5backwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 wind back",0,*UABack1_5WindBackRaw)
animationSetFrameLength(*UABack1_5WindBack,1,5)
animationSetFrameLength(*UABack1_5WindBack,2,6)
animationSetFrameOpacity(*UABack1_5WindBack,1,192)
animationSetFrameOpacity(*UABack1_5WindBack,2,128)
frameSetFreeMovement(*UABack1_5WindBack\frames(0),#True)

animationPrepareWind(*UABack1)
*UABack1\frontWind(1,0)=*UABack1_2WindFront
*UABack1\frontWind(2,0)=*UABack1_3WindFront
*UABack1\frontWind(3,0)=*UABack1_4WindFront
*UABack1\frontWind(4,0)=*UABack1_5WindFront
*UABack1\frontWind(5,0)=*UABack1_6WindFront
*UABack1\frontWind(6,0)=*UABack1_7WindFront
*UABack1\frontWind(7,0)=*UABack1_8WindFront
*UABack1\frontWind(8,0)=*UABack1_9WindFront

*UABack1\backWind(1,0)=*UABack1_2WindBack
*UABack1\backWind(2,0)=*UABack1_3WindBack
*UABack1\backWind(3,0)=*UABack1_4WindBack
*UABack1\backWind(4,0)=*UABack1_5WindBack

;------- Back 2
*UABack2.animation=classGenerateAnimation(5,"image/hand_unarmed_back2_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2",0,*UABack2Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*UABack2,5,4)
animationSetFrameLength(*UABack2,5,10)
animationSetFrameSound(*UABack2,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UABack2,0,-30)
animationSetFrameMovement(*UABack2,1,-30,-5)
animationSetFrameMovement(*UABack2,2,5,5)
animationSetFrameMovement(*UABack2,3,20)
animationSetFrameMovement(*UABack2,4,40)
animationSetFrameMovement(*UABack2,5,40)
animationSetFramePush(*UABack2,3,-5)
animationSetFramePush(*UABack2,4,0,-10)
animationSetFramePush(*UABack2,5,30)
animationSetFrameDamageDuration(*UABack2,5,4)

*UABack2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind front",0,*UABack2_1WindFrontRaw)
*UABack2_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_back2_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front",0,*UABack2_2WindFrontRaw)
animationSetFrameLength(*UABack2_2WindFront,1,5)
animationSetFrameOpacity(*UABack2_2WindFront,1,192)
*UABack2_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back2_5WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 5 wind front",0,*UABack2_5WindFrontRaw)
*UABack2_6WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back2_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 6 wind front",0,*UABack2_6WindFrontRaw)
animationSetFrameLength(*UABack2_6WindFront,1,5)
animationSetFrameLength(*UABack2_6WindFront,2,6)
animationSetFrameLength(*UABack2_6WindFront,3,7)
animationSetFrameOpacity(*UABack2_6WindFront,1,192)
animationSetFrameOpacity(*UABack2_6WindFront,2,128)
animationSetFrameOpacity(*UABack2_6WindFront,3,64)

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
*UABack3.animation=classGenerateAnimation(2,"image/hand_unarmed_back3_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*UABack3Raw,10,#H2H_DAMAGETYPE_BLUNT,1)
animationSetComboEnd(*UABack3,#True)
animationSetFrameSound(*UABack3,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UABack3,0,64,48)
animationSetFrameMovement(*UABack3,0,128,48)
animationSetFrameMovement(*UABack3,0,128,48)
animationSetFrameLength(*UABack3,2,8)
animationSetFrameDamageDuration(*UABack3,2,4)
For i=0 To 2
	animationSetFrameGrab(*UABack3,i)
	animationSetFrameDamageCut(*UABack3,i)
Next
animationSetFramePush(*UABack3,0,60,30)
animationSetFramePushD(*UABack3,1,50,20)
animationSetFramePushD(*UABack3,2,80,10)
*UABack3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back3_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind front",0,*UABack3_1WindFrontRaw)
*UABack3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back3_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind front",0,*UABack3_2WindFrontRaw)
*UABack3_3WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_back3_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*UABack3_3WindFrontRaw)
animationSetFrameLength(*UABack3_3WindFront,1,5)
animationSetFrameLength(*UABack3_3WindFront,2,6)
animationSetFrameLength(*UABack3_3WindFront,3,7)
animationSetFrameOpacity(*UABack3_3WindFront,1,192)
animationSetFrameOpacity(*UABack3_3WindFront,2,128)
animationSetFrameOpacity(*UABack3_3WindFront,3,64)
animationFreeMovementWind(*UABack3)

animationPrepareWind(*UABack3,0)
*UABack3\frontWind(0,0)=*UABack3_1WindFront
*UABack3\frontWind(1,0)=*UABack3_2WindFront
*UABack3\frontWind(2,0)=*UABack3_3WindFront
animationGetBack(*UANeutral4)=*UABack3

;------- Down 1
*UADown1.animation=classGenerateAnimation(4,"image/hand_unarmed_down1_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*UADown1Raw,15,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameCDN(*UADown1,2,7)
animationSetFrameMovement(*UADown1,0,10)
animationSetFrameMovement(*UADown1,1,20)
animationSetFrameMovement(*UADown1,2,-50)
animationSetFrameMovement(*UADown1,3,50)
animationSetFrameMovement(*UADown1,4,50)
animationSetFrameGrab(*UADown1,2)
animationSetFrameGrab(*UADown1,3)
animationSetFrameGrab(*UADown1,4)
animationSetFramePush(*UADown1,3,10)
animationSetFramePush(*UADown1,4,10)
animationSetFrameLength(*UADown1,2,8)
animationSetFrameLength(*UADown1,4,12)
animationSetFrameSound(*UADown1,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UADown1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)

*UADown1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down1_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind front",0,*UADown1_1WindFrontRaw)
*UADown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*UADown1_2WindFrontRaw)
animationSetFrameLength(*UADown1_2WindFront,1,5)
animationSetFrameLength(*UADown1_2WindFront,2,6)
animationSetFrameOpacity(*UADown1_2WindFront,1,192)
animationSetFrameOpacity(*UADown1_2WindFront,2,128)
*UADown1_3WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*UADown1_3WindFrontRaw)
animationSetFrameLength(*UADown1_3WindFront,1,5)
animationSetFrameLength(*UADown1_3WindFront,2,6)
animationSetFrameOpacity(*UADown1_3WindFront,1,192)
animationSetFrameOpacity(*UADown1_3WindFront,2,128)

*UADown1_2WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down1_2WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind back",0,*UADown1_2WindBackRaw)
animationSetFrameLength(*UADown1_2WindBack,1,5)
animationSetFrameLength(*UADown1_2WindBack,2,6)
animationSetFrameOpacity(*UADown1_2WindBack,1,192)
animationSetFrameOpacity(*UADown1_2WindBack,2,128)
*UADown1_3WindBack.animation=classGenerateAnimation(3,"image/hand_unarmed_down1_3WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind back",0,*UADown1_3WindBackRaw)
animationSetFrameLength(*UADown1_3WindBack,1,5)
animationSetFrameLength(*UADown1_3WindBack,2,6)
animationSetFrameLength(*UADown1_3WindBack,3,7)
animationSetFrameOpacity(*UADown1_3WindBack,1,192)
animationSetFrameOpacity(*UADown1_3WindBack,2,128)
animationSetFrameOpacity(*UADown1_3WindBack,3,64)
animationPrepareWind(*UADown1,0)
*UADown1\frontWind(0,0)=*UADown1_1WindFront
*UADown1\frontWind(1,0)=*UADown1_2WindFront
*UADown1\frontWind(2,0)=*UADown1_3WindFront
*UADown1\backWind(1,0)=*UADown1_2WindBack
*UADown1\backWind(2,0)=*UADown1_3WindBack
animationFreeMovementWind(*UADown1)

;------- Down 2
*UADown2.animation=classGenerateAnimation(5,"image/hand_unarmed_down2_",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*UADown2Raw,15,#H2H_DAMAGETYPE_BLUNT,6)
; animationSetComboEnd(*UADown2,#True)
animationSetFrameSound(*UADown2,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
For i=0 To 5
	animationSetFrameMovement(*UADown2,i,-20)
Next
animationSetFrameLength(*UADown2,4,4)
animationSetFrameLength(*UADown2,5,8)
animationSetFrameCDN(*UADown2,5,4)
animationSetFrameDamageDuration(*UADown2,5,4)

*UADown2_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_1WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*UADown2_1WindFrontRaw)
*UADown2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_2WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*UADown2_2WindFrontRaw)
*UADown2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind front",0,*UADown2_3WindFrontRaw)
*UADown2_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_4WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 4 wind front",0,*UADown2_4WindFrontRaw)
*UADown2_5WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down2_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 5 wind front",0,*UADown2_5WindFrontRaw)
animationSetFrameLength(*UADown2_5WindFront,1,6)
animationSetFrameLength(*UADown2_5WindFront,2,7)
animationSetFrameOpacity(*UADown2_5WindFront,1,192)
animationSetFrameOpacity(*UADown2_5WindFront,2,128)

*UADown2_3WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_3WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind back",0,*UADown2_3WindBackRaw)
*UADown2_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_down2_4WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 4 wind back",0,*UADown2_4WindBackRaw)
*UADown2_6WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_down2_6WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 6 wind back",0,*UADown2_6WindBackRaw)
animationSetFrameLength(*UADown2_6WindBack,1,6)
animationSetFrameOpacity(*UADown2_6WindBack,1,192)

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
*UADown3.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 3",0,*UADown3Raw,50,#H2H_DAMAGETYPE_BLUNT,1)
; animationSetComboEnd(*UADown3,#True)
ReDim *UADown3\frames(3)
*UADown3\frames(3)=AllocateStructure(frame)
frameCopy(*UADown3\frames(3),*UADown3\frames(2))
animationSetFrameMovement(*UADown3,0,-96,-96)
animationSetFrameLength(*UADown3,0,5)
animationSetFrameMovementDelta(*UADown3,1,-1,50) ; was -1 45 / 60 ; 90
animationSetFrameMovementDelta(*UADown3,2,-2,65) ; was -2 70 / 90 ; 130
For i=1 To 3
	animationSetFrameGrab(*UADown3,i)
	animationSetFramePush(*UADown3,i,-i,20)
	animationSetFrameDamageCut(*UADown3,i)
Next
animationSetFrameLength(*UADown3,3,15)
animationSetFrameCDN(*UADown3,3,5)
animationSetFrameDamage(*UADown3,3,8)
animationSetFrameDamageDuration(*UADown3,3,5)
animationSetUngrounded(*UADown3,1)
animationSetFrameSound(*UADown3,3,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*UADown3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameShake(*UADown3,3,10)

*UADown3_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_down3_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 2 wind front",0,*UADown3_2WindFrontRaw)
*UADown3_3WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_down3_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind front",0,*UADown3_3WindFrontRaw)
For i=1 To 4
	animationSetFrameLength(*UADown3_3WindFront,i,3+i*2)
Next
frameSetFreeMovement(*UADown3_3WindFront\frames(1))
frameSetFreeMovement(*UADown3_3WindFront\frames(2))
frameSetFreeMovement(*UADown3_3WindFront\frames(3))
*UADown3_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_4WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 4 wind front",0,*UADown3_4WindFrontRaw)
animationSetFrameLength(*UADown3_4WindFront,1,4)
animationSetFrameLength(*UADown3_4WindFront,2,6)
animationSetFrameOpacity(*UADown3_4WindFront,1,192)
animationSetFrameOpacity(*UADown3_4WindFront,2,128)
animationFreeMovement(*UADown3_4WindFront)

*UADown3_3WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_3WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind back",0,*UADown3_3WindBackRaw)
*UADown3_4WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_down3_4WindBack",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 4 wind back",0,*UADown3_4WindBackRaw)
animationSetFrameLength(*UADown3_4WindBack,1,4)
animationSetFrameLength(*UADown3_4WindBack,2,6)
animationSetFrameOpacity(*UADown3_4WindBack,1,192)
animationSetFrameOpacity(*UADown3_4WindBack,2,128)
animationFreeMovement(*UADown3_4WindBack)
animationGetDown(*UANeutral4)=*UADown3

animationPrepareWind(*UADown3)
*UADown3\frontWind(1,0)=*UADown3_2WindFront
*UADown3\frontWind(2,0)=*UADown3_3WindFront
*UADown3\frontWind(3,0)=*UADown3_4WindFront
*UADown3\backWind(2,0)=*UADown3_3WindBack
*UADown3\backWind(3,0)=*UADown3_4WindBack

;------- Down 4
*UADown4.animation=classGenerateAnimation(3,"image/hand_unarmed_down4_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4",0,*UADown4Raw,15,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameCDN(*UADown4,3,5)
animationSetFrameLength(*UADown4,3,10)
animationSetUngrounded(*UADown4)
animationSetFrameMovement(*UADown4,0,32,-16)
animationSetFrameMovement(*UADown4,1,-64,64)
animationSetFrameMovement(*UADown4,2,-64,64)
animationSetFrameMovementDelta(*UADown4,2,-40,-4)
animationSetFrameMovementDelta(*UADown4,3,-8,-2)
animationSetFramePush(*UADown4,1,-32,16)
animationSetFramePushD(*UADown4,2,-16,-16)
animationSetFrameSound(*UADown4,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UADown4,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)

*UADown4_1WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_down4_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 1 wind front",0,*UADown4_1WindFrontRaw)
animationFreeMovement(*UADown4_1WindFront)
animationSetFrameLength(*UADown4_1WindFront,1,5)
animationSetFrameLength(*UADown4_1WindFront,2,6)
animationSetFrameOpacity(*UADown4_1WindFront,1,192)
animationSetFrameOpacity(*UADown4_1WindFront,2,128)
*UADown4_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down4_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 2 wind front",0,*UADown4_2WindFrontRaw)
*UADown4_3WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_down4_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 3 wind front",0,*UADown4_3WindFrontRaw)
animationSetFrameFreeMovement(*UADown4_3WindFront\frames(2))
animationSetFrameLength(*UADown4_3WindFront,1,5)
animationSetFrameLength(*UADown4_3WindFront,2,6)
animationSetFrameLength(*UADown4_3WindFront,3,7)
animationSetFrameOpacity(*UADown4_3WindFront,1,192)
animationSetFrameOpacity(*UADown4_3WindFront,2,128)
animationSetFrameOpacity(*UADown4_3WindFront,3,64)
animationPrepareWind(*UADown4,0)
*UADown4\frontWind(0,0)=*UADown4_1WindFront
*UADown4\frontWind(1,0)=*UADown4_2WindFront
*UADown4\frontWind(2,0)=*UADown4_3WindFront
animationGetDown(*UABack1)=*UADown4

;------- Down 5
*UADown5.animation=classGenerateAnimation(5,"image/hand_unarmed_down5_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5",0,*UADown5Raw,20,#H2H_DAMAGETYPE_BLUNT,8)
animationSetUngrounded(*UADown5)
animationSetComboEnd(*UADown5,#True)
animationSetFrameSound(*UADown5,0,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameMovement(*UADown5,0,32,-24) ; -16
animationSetFrameMovement(*UADown5,1,32,-32) ; -24
animationSetFrameMovement(*UADown5,2,-56) ; -48
animationSetFrameMovement(*UADown5,3,-48,-48) ; -40
animationSetFrameMovement(*UADown5,4,-32,-64) ; -56
animationSetFrameMovement(*UADown5,5,32,48)
animationSetFrameLength(*UADown5,4,6)
animationSetFrameLength(*UADown5,5,8)
animationSetFrameDamage(*UADown5,4,10)
animationSetFramePush(*UADown5,3,-16,16)
animationSetFramePush(*UADown5,4,0,32)
animationSetFrameStun(*UADown5,3,5)
animationSetFrameStun(*UADown5,4,10)
animationGetDown(*UADown4)=*UADown5

*UADown5_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down5_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5 1 wind front",0,*UADown5_1WindFrontRaw)
*UADown5_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_down5_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5 2 wind front",0,*UADown5_2WindFrontRaw)
animationSetFrameLength(*UADown5_2WindFront,1,5)
animationSetFrameOpacity(*UADown5_2WindFront,1,192)
*UADown5_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down5_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5 3 wind front",0,*UADown5_3WindFrontRaw)
*UADown5_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down5_4WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5 4 wind front",0,*UADown5_4WindFrontRaw)
*UADown5_5WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_down5_5WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 5 5 wind front",0,*UADown5_5WindFrontRaw)
animationSetFrameLength(*UADown5_5WindFront,1,5)
animationSetFrameLength(*UADown5_5WindFront,2,6)
animationSetFrameLength(*UADown5_5WindFront,3,6)
animationSetFrameLength(*UADown5_5WindFront,4,5)
animationSetFrameOpacity(*UADown5_5WindFront,2,192)
animationSetFrameOpacity(*UADown5_5WindFront,3,128)
animationSetFrameOpacity(*UADown5_5WindFront,4,64)

animationPrepareWind(*UADown5,0)
*UADown5\frontWind(0,0)=*UADown5_1WindFront
*UADown5\frontWind(1,0)=*UADown5_2WindFront
*UADown5\frontWind(2,0)=*UADown5_3WindFront
*UADown5\frontWind(3,0)=*UADown5_4WindFront
*UADown5\frontWind(4,0)=*UADown5_5WindFront
animationFreeMovementWind(*UADown5)

;------- Down 6
*UADown6.animation=classGenerateAnimation(4,"image/hand_unarmed_down6_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 6",0,*UADown6Raw,30,#H2H_DAMAGETYPE_BLUNT,8)
animationSetUngrounded(*UADown6)
animationSetComboEnd(*UADown6,#True)
; frame order is 1 - 2 - 3 - 4 - 4 - 5
ReDim *UADown6\frames(5)
*UADown6\frames(5)=*UADown6\frames(4)
*UADown6\frames(4)=frameDataGive()
frameCopy(*UADown6\frames(4),*UADown6\frames(3),#True)

*UADown6\frames(4)\hurtId=*UADown6\frames(5)\hurtId
*UADown6\frames(4)\hurtPath$="image/hand_unarmed_down6_5"
*UADown6\frames(4)\hurtShift=*UADown6\frames(5)\hurtShift

*UADown6\frames(5)\hurtId=*UADown6\frames(2)\hurtId
*UADown6\frames(5)\hurtPath$="image/hand_unarmed_down6_3"
*UADown6\frames(5)\hurtShift=*UADown6\frames(2)\hurtShift
*UADown6\frames(2)\hurtId=0
*UADown6\frames(2)\hurtShift=#Null
animationSetFrameDamageDuration(*UADown6,5,5)
animationSetFrameDamageCut(*UADown6,5)
animationSetFrameDamage(*UADown6,5,4)
animationSetFramePureProjectile(*UADown6,5)
animationSetFrameMovement(*UADown6,0,-16,-144) ; -128
animationSetFrameMovement(*UADown6,1,-16,-144) ; -128
animationSetFrameMovement(*UADown6,2,0,-80) ; -64
animationSetFrameMovement(*UADown6,3,-16,64) ; 32
animationSetFrameMovement(*UADown6,4,-32,128) ; 96
animationSetFrameMovement(*UADown6,5,-16,160) ; 128
animationSetFrameLength(*UADown6,5,12)
animationSetFrameLength(*UADown6,1,2)
animationSetFrameLength(*UADown6,2,6)
animationSetFrameLength(*UADown6,3,2)
animationSetFrameLength(*UADown6,4,2)
animationSetFrameSound(*UADown6,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UADown6,3,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*UADown6,5,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameShake(*UADown6,5,20)
animationSetFrameCDN(*UADown6,5,5)
animationGetDown(*UADown3)=*UADown6

*UADown6_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down6_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 6 1 wind front",0,*UADown6_1WindFrontRaw)
*UADown6_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down6_2WindFront",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 6 2 wind front",0,*UADown6_2WindFrontRaw)
*UADown6_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_down6_3WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 6 3 wind front",0,*UADown6_3WindFrontRaw)
animationSetFrameLength(*UADown6_3WindFront,1,4)
animationSetFrameOpacity(*UADown6_3WindFront,1,192)
*UADown6_4WindFront.animation=classGenerateAnimation(5,"image/hand_unarmed_down6_4WindFront",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 6 4 wind front",0,*UADown6_4WindFrontRaw)
animationSetFrameLength(*UADown6_4WindFront,1,3)
animationSetFrameLength(*UADown6_4WindFront,2,4)
animationSetFrameLength(*UADown6_4WindFront,3,5)
animationSetFrameLength(*UADown6_4WindFront,4,6)
animationSetFrameLength(*UADown6_4WindFront,5,7)
animationSetFrameOpacity(*UADown6_4WindFront,3,192)
animationSetFrameOpacity(*UADown6_4WindFront,4,128)
animationSetFrameOpacity(*UADown6_4WindFront,5,64)
*UADown6_5WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_down6_5WindFront",2,#H2H_ANIMATIONTYPE_NDOWN,"Down 6 5 wind front",0,*UADown6_5WindFrontRaw)
animationSetFrameLength(*UADown6_5WindFront,1,3)
animationSetFrameLength(*UADown6_5WindFront,2,4)
animationSetFrameLength(*UADown6_5WindFront,3,5)
animationSetFrameLength(*UADown6_5WindFront,4,6)
animationSetFrameOpacity(*UADown6_4WindFront,2,192)
animationSetFrameOpacity(*UADown6_4WindFront,3,128)
animationSetFrameOpacity(*UADown6_4WindFront,4,64)
animationFreeMovement(*UADown6_5WindFront)
animationPrepareWind(*UADown6,0)
*UADown6\frontWind(0,0)=*UADown6_1WindFront
*UADown6\frontWind(1,0)=*UADown6_2WindFront
*UADown6\frontWind(2,0)=*UADown6_3WindFront
*UADown6\frontWind(3,0)=*UADown6_4WindFront
*UADown6\frontWind(5,0)=*UADown6_5WindFront

;------- Down 7
*UADown7.animation=classGenerateAnimation(3,"image/hand_unarmed_down7_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7",0,*UADown7Raw,15,#H2H_DAMAGETYPE_BLUNT,8)
animationSetFrameCDN(*UADown7,3,4)
animationSetComboEnd(*UADown7,#True)
animationSetFrameLength(*UADown7,1,6)
animationSetFrameLength(*UADown7,3,8)
animationSetFrameDamageDuration(*UADown7,3,4)
animationSetFrameSound(*UADown7,0,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UADown7,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UADown7,0,16,-16)
animationSetFrameMovement(*UADown7,1,16,-16)
animationSetFrameMovement(*UADown7,2,-32,32)
animationSetFrameMovement(*UADown7,3,-32,32)
animationGetDown(*UADown2)=*UADown7

*UADown7_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down7_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 1 wind front",0,*UADown7_1WindFrontRaw)
*UADown7_2WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_down7_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 2 wind front",0,*UADown7_2WindFrontRaw)
animationSetFrameLength(*UADown7_2WindFront,1,5)
animationSetFrameLength(*UADown7_2WindFront,2,6)
animationSetFrameLength(*UADown7_2WindFront,3,7)
animationSetFrameOpacity(*UADown7_2WindFront,1,192)
animationSetFrameOpacity(*UADown7_2WindFront,2,128)
animationSetFrameOpacity(*UADown7_2WindFront,3,64)
*UADown7_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_down7_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 3 wind front",0,*UADown7_3WindFrontRaw)
*UADown7_4WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_down7_4WindFront",3,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 4 wind front",0,*UADown7_4WindFrontRaw)
animationSetFrameLength(*UADown7_4WindFront,1,4)
animationSetFrameLength(*UADown7_4WindFront,2,5)
animationSetFrameLength(*UADown7_4WindFront,3,6)
animationSetFrameLength(*UADown7_4WindFront,4,7)
animationSetFrameOpacity(*UADown7_4WindFront,2,192)
animationSetFrameOpacity(*UADown7_4WindFront,3,128)
animationSetFrameOpacity(*UADown7_4WindFront,4,64)

*UADown7_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_down7_1WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 1 wind back",0,*UADown7_1WindBackRaw)
*UADown7_2WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_down7_2WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 7 2 wind back",0,*UADown7_2WindBackRaw)
animationSetFrameLength(*UADown7_2WindBack,0,3)
animationSetFrameOpacity(*UADown7_2WindBack,1,192)

animationPrepareWind(*UADown7,0)
*UADown7\frontWind(0,0)=*UADown7_1WindFront
*UADown7\frontWind(1,0)=*UADown7_2WindFront
*UADown7\frontWind(2,0)=*UADown7_3WindFront
*UADown7\frontWind(3,0)=*UADown7_4WindFront
*UADown7\backWind(0,0)=*UADown7_1WindBack
*UADown7\backWind(1,0)=*UADown7_2WindBack
animationFreeMovementWind(*UADown7)

;------- Back 4
*UABack4.animation=classGenerateAnimation(3,"image/hand_unarmed_back4_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4",0,*UABack4Raw,12,#H2H_DAMAGETYPE_BLUNT,7)
animationSetComboEnd(*UABack4,#True)
ReDim *UABack4\frames(4)
*UABack4\frames(4)=*UABack4\frames(3)
*UABack4\frames(3)=*UABack4\frames(2)
*UABack4\frames(2)=*UABack4\frames(1)
*UABack4\frames(1)=*UABack4\frames(0)
*UABack4\frames(0)=frameDataGive()
frameCopy(*UABack4\frames(0),*UADown7\frames(0),#True)
animationSetFrameLength(*UABack4,4,10)
animationSetFrameSound(*UABack4,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UABack4,1,32)
animationSetFrameMovement(*UABack4,2,40)
animationSetFrameMovement(*UABack4,3,48)

*UABack4_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back4_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 1 wind front",0,*UABack4_1WindFrontRaw)
*UABack4_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_back4_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 2 wind front",0,*UABack4_2WindFrontRaw)
*UABack4_3WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_back4_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 3 wind front",0,*UABack4_3WindFrontRaw)
animationSetFrameLength(*UABack4_3WindFront,1,5)
animationSetFrameLength(*UABack4_3WindFront,2,6)
animationSetFrameLength(*UABack4_3WindFront,3,7)
animationSetFrameLength(*UABack4_3WindFront,4,8)
animationSetFrameOpacity(*UABack4_3WindFront,2,192)
animationSetFrameOpacity(*UABack4_3WindFront,3,128)
animationSetFrameOpacity(*UABack4_3WindFront,4,64)

*UABack4_1WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_back4_1WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"Back 4 1 wind back",0,*UABack4_1WindBackRaw)

animationPrepareWind(*UABack4,0)
*UABack4\frontWind(0,0)=*UADown7_1WindFront
*UABack4\frontWind(1,0)=*UABack4_1WindFront
*UABack4\frontWind(2,0)=*UABack4_2WindFront
*UABack4\frontWind(3,0)=*UABack4_3WindFront

*UABack4\backWind(0,0)=*UADown7_1WindBack
*UABack4\backWind(1,0)=*UABack4_1WindBack
animationFreeMovementWind(*UABack4)
animationGetBack(*UADown2)=*UABack4

;------- Up 1
*UAUp1.animation=classGenerateAnimation(5,"image/hand_unarmed_up1_",4,#H2H_ANIMATIONTYPE_NUP,"Up 1",0,*UAUp1Raw,8,#H2H_DAMAGETYPE_BLUNT,5)
animationSetFrameCDN(*UAUp1,5,4)
animationSetFrameLength(*UAUp1,5,10)
animationSetFrameSound(*UAUp1,1,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UAUp1,3,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UAUp1,5,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameMovement(*UAUp1,0,-50,-70)
animationSetFrameMovement(*UAUp1,1,-10,-30)
animationSetFrameMovement(*UAUp1,2,-5,5)
animationSetFrameMovement(*UAUp1,3,-10,-30)
animationSetFrameMovement(*UAUp1,4,5,5)
animationSetFrameMovement(*UAUp1,5,-10,-30)
animationSetFrameNeedCatch(*UAUp1,3)
animationSetFrameDamageCut(*UAUp1,2)
animationSetFrameDamageCut(*UAUp1,4)
animationSetFrameLength(*UAUp1,2,3)
animationSetFrameLength(*UAUp1,4,3)

*UAUp1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up1_1WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 1 1 wind front",0,*UAUp1_1WindFrontRaw)
*UAUp1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 2 wind front",0,*UAUp1_2WindFrontRaw)
animationSetFrameLength(*UAUp1_2WindFront,1,4)
animationSetFrameLength(*UAUp1_2WindFront,2,5)
animationSetFrameOpacity(*UAUp1_2WindFront,1,192)
animationSetFrameOpacity(*UAUp1_2WindFront,2,128)
*UAUp1_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_4WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 4 wind front",0,*UAUp1_4WindFrontRaw)
animationSetFrameLength(*UAUp1_4WindFront,1,4)
animationSetFrameLength(*UAUp1_4WindFront,2,5)
animationSetFrameOpacity(*UAUp1_4WindFront,1,192)
animationSetFrameOpacity(*UAUp1_4WindFront,2,128)
*UAUp1_6WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up1_6WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 6 wind front",0,*UAUp1_6WindFrontRaw)
animationSetFrameLength(*UAUp1_6WindFront,1,4)
animationSetFrameLength(*UAUp1_6WindFront,2,5)
animationSetFrameOpacity(*UAUp1_6WindFront,1,192)
animationSetFrameOpacity(*UAUp1_6WindFront,2,128)

animationPrepareWind(*UAUp1,0)
*UAUp1\frontWind(0,0)=*UAUp1_1WindFront
*UAUp1\frontWind(1,0)=*UAUp1_2WindFront
*UAUp1\frontWind(3,0)=*UAUp1_4WindFront
*UAUp1\frontWind(5,0)=*UAUp1_6WindFront
animationFreeMovementWind(*UAUp1)

animationGetDown(*UAUp1)=*UADown2

;------- Up 2
*UAUp2.animation=classGenerateAnimation(8,"image/hand_unarmed_up2_",2,#H2H_ANIMATIONTYPE_NUP,"Up 2",0,*UAUp2Raw,22,#H2H_DAMAGETYPE_BLUNT,10)
animationSetComboEnd(*UAUp2,#True)
animationSetFrameSound(*UAUp2,0,#H2H_SOUND_ID_FINGERBLOCK)
animationSetFrameSound(*UAUp2,1,#H2H_SOUND_ID_HAND_JUMPLIGHT)
animationSetFrameSound(*UAUp2,4,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UAUp2,6,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameMovement(*UAUp2,0,-10,32)
animationSetFrameMovement(*UAUp2,1,-10,-160)
animationSetFrameMovementDelta(*UAUp2,2,-5,-40)
animationSetFrameMovementDelta(*UAUp2,3,0,-20)
animationSetFrameMovementDelta(*UAUp2,4,5,-10)
animationSetFrameMovementDelta(*UAUp2,5,5,-5)
animationSetFrameMovementDelta(*UAUp2,6,0,-2.5)
animationSetFrameMovement(*UAUp2,6,-32)
animationSetFrameMovement(*UAUp2,7,-64)
animationSetFrameMovement(*UAUp2,8,32)
animationSetFrameLength(*UAUp2,7,6)
animationSetFrameLength(*UAUp2,8,4)

*UAUp2_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_2WindFront",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 2 wind front",0,*UAUp2_2WindFrontRaw)
animationFreeMovement(*UAUp2_2WindFront)
*UAUp2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_3WindFront",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 3 wind front",0,*UAUp2_3WindFrontRaw)
*UAUp2_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up2_4WindFront",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 4 wind front",0,*UAUp2_4WindFrontRaw)
animationSetFrameLength(*UAUp2_4WindFront,1,5)
animationSetFrameLength(*UAUp2_4WindFront,2,7)
animationSetFrameOpacity(*UAUp2_4WindFront,1,192)
animationSetFrameOpacity(*UAUp2_4WindFront,2,128)
*UAUp2_7WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_7WindFront",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 7 wind front",0,*UAUp2_7WindFrontRaw)
*UAUp2_8WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up2_8WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 2 8 wind front",0,*UAUp2_8WindFrontRaw)
animationFreeMovement(*UAUp2_8WindFront)
animationSetFrameLength(*UAUp2_8WindFront,1,5)
animationSetFrameLength(*UAUp2_8WindFront,2,7)
animationSetFrameOpacity(*UAUp2_8WindFront,1,192)
animationSetFrameOpacity(*UAUp2_8WindFront,2,128)

*UAUp2_1WindBack.animation=classGenerateAnimation(3,"image/hand_unarmed_up2_1WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 1 wind back",0,*UAUp2_1WindBackRaw)
animationFreeMovement(*UAUp2_1WindBack)
animationSetFrameLength(*UAUp2_1WindBack,1,5)
animationSetFrameLength(*UAUp2_1WindBack,2,6)
animationSetFrameLength(*UAUp2_1WindBack,2,7)
animationSetFrameOpacity(*UAUp2_1WindBack,1,192)
animationSetFrameOpacity(*UAUp2_1WindBack,2,128)
animationSetFrameOpacity(*UAUp2_1WindBack,3,64)
*UAUp2_4WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_4WindBack",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 4 wind back",0,*UAUp2_4WindBackRaw)
*UAUp2_5WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_5WindBack",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 5 wind back",0,*UAUp2_5WindBackRaw)
*UAUp2_6WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_up2_6WindBack",2,#H2H_ANIMATIONTYPE_NUP,"Up 2 6 wind back",0,*UAUp2_6WindBackRaw)
*UAUp2_7WindBack.animation=classGenerateAnimation(2,"image/hand_unarmed_up2_7WindBack",3,#H2H_ANIMATIONTYPE_NUP,"Up 2 7 wind back",0,*UAUp2_7WindBackRaw)
animationFreeMovement(*UAUp2_7WindBack)
animationSetFrameLength(*UAUp2_7WindBack,1,5)
animationSetFrameLength(*UAUp2_7WindBack,2,7)
animationSetFrameOpacity(*UAUp2_7WindBack,1,192)
animationSetFrameOpacity(*UAUp2_7WindBack,2,128)

animationPrepareWind(*UAUp2,0)
*UAUp2\frontWind(1,0)=*UAUp2_2WindFront
*UAUp2\frontWind(2,0)=*UAUp2_3WindFront
*UAUp2\frontWind(3,0)=*UAUp2_4WindFront
*UAUp2\frontWind(6,0)=*UAUp2_7WindFront
*UAUp2\frontWind(7,0)=*UAUp2_8WindFront
*UAUp2\backWind(0,0)=*UAUp2_1WindBack
*UAUp2\backWind(3,0)=*UAUp2_4WindBack
*UAUp2\backWind(4,0)=*UAUp2_5WindBack
*UAUp2\backWind(5,0)=*UAUp2_6WindBack
*UAUp2\backWind(6,0)=*UAUp2_7WindBack

;------- Up 3
*UAUp3.animation=classGenerateAnimation(4,"image/hand_unarmed_up3_",3,#H2H_ANIMATIONTYPE_NUP,"Up 3",0,*UAUp3Raw,20,#H2H_DAMAGETYPE_BLUNT,4)
animationSetFrameCDN(*UAUp3,4,4)
animationSetFrameLength(*UAUp3,4,9)
animationSetFrameMovement(*UAUp3,0,-10,-10)
animationSetFrameMovement(*UAUp3,1,-10,-20)
animationSetFrameMovement(*UAUp3,2,-10,-30)
animationSetFrameMovement(*UAUp3,3,-10,-40)
animationSetFrameMovement(*UAUp3,4,-10,40)
For i=0 To 4
	animationSetFramePush(*UAUp3,i,8-i,-25)
Next
animationSetFrameSound(*UAUp3,0,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAUp3_1WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_up3_1WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 1 wind front",0,*UAUp3_1WindFrontRaw)
animationSetFrameLength(*UAUp3_1WindFront,1,4)
animationSetFrameOpacity(*UAUp3_1WindFront,1,192)
*UAUp3_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up3_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 2 wind front",0,*UAUp3_2WindFrontRaw)
*UAUp3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_up3_3WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 3 wind front",0,*UAUp3_3WindFrontRaw)
*UAUp3_4WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_up3_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 3 4 wind front",0,*UAUp3_4WindFrontRaw)
animationSetFrameLength(*UAUp3_4WindFront,1,6)
animationSetFrameLength(*UAUp3_4WindFront,2,8)
animationSetFrameOpacity(*UAUp3_4WindFront,1,192)
animationSetFrameOpacity(*UAUp3_4WindFront,2,128)

animationPrepareWind(*UAUp3,0)
*UAUp3\frontWind(0,0)=*UAUp3_1WindFront
*UAUp3\frontWind(1,0)=*UAUp3_2WindFront
*UAUp3\frontWind(2,0)=*UAUp3_3WindFront
*UAUp3\frontWind(3,0)=*UAUp3_4WindFront
animationFreeMovementWind(*UAUp3)
animationGetUp(*UASide1)=*UAUp3
animationGetSide(*UAUp3)=*UASide4

;------- Heavy 1
*UAHeavy1.animation=classGenerateAnimation(5,"image/hand_unarmed_heavy1_",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*UAHeavy1Raw,75,#H2H_DAMAGETYPE_BLUNT,10)
animationSetFrameMovement(*UAHeavy1,0,20,5)
animationSetFrameMovement(*UAHeavy1,1,40,10)
animationSetFrameMovement(*UAHeavy1,2,-40,-20)
animationSetFrameMovement(*UAHeavy1,3,-40,-30)
animationSetFrameMovement(*UAHeavy1,4,-40,-40)
animationSetFrameMovement(*UAHeavy1,5,-10,40)
animationSetFrameLength(*UAHeavy1,1,7)
animationSetFrameLength(*UAHeavy1,5,20)
animationSetFrameCDN(*UAHeavy1,5,4)
animationSetFrameSound(*UAHeavy1,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UAHeavy1,2,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
For i=2 To 4
;  	setFramePush(*UAHeavy1,i,-40+i*10,-i*15)
	animationSetFramePushD(*UAHeavy1,i,-20+i*5,-i*4)
	animationSetFrameDamage(*UAHeavy1,i,8+i)
Next
animationGetNeutral(*UAHeavy1)=*UANeutral4

animationPrepareWind(*UAHeavy1)
*UAHeavy1_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind front",0,*UAHeavy1_1WindFrontRaw)
*UAHeavy1_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy1_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 2 wind front",0,*UAHeavy1_2WindFrontRaw)
animationSetFrameLength(*UAHeavy1_2WindFront,1,5)
animationSetFrameLength(*UAHeavy1_2WindFront,2,6)
animationSetFrameOpacity(*UAHeavy1_2WindFront,1,192)
animationSetFrameOpacity(*UAHeavy1_2WindFront,2,128)
*UAHeavy1_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind front",0,*UAHeavy1_3WindFrontRaw)
*UAHeavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind front",0,*UAHeavy1_4WindFrontRaw)
*UAHeavy1_5WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind front",0,*UAHeavy1_5WindFrontRaw)
animationSetFrameLength(*UAHeavy1_5WindFront,1,5)
animationSetFrameLength(*UAHeavy1_5WindFront,2,6)
animationSetFrameLength(*UAHeavy1_5WindFront,3,7)
animationSetFrameMovement(*UAHeavy1_5WindFront,1,-5,-10)
animationSetFrameMovement(*UAHeavy1_5WindFront,2,-5,-10)
animationSetFrameMovement(*UAHeavy1_5WindFront,3,-5,-10)
animationSetFrameOpacity(*UAHeavy1_5WindFront,1,192)
animationSetFrameOpacity(*UAHeavy1_5WindFront,2,128)
animationSetFrameOpacity(*UAHeavy1_5WindFront,3,64)
*UAHeavy1\frontWind(0,0)=*UAHeavy1_1WindFront
*UAHeavy1\frontWind(1,0)=*UAHeavy1_2WindFront
*UAHeavy1\frontWind(2,0)=*UAHeavy1_3WindFront
*UAHeavy1\frontWind(3,0)=*UAHeavy1_4WindFront
*UAHeavy1\frontWind(4,0)=*UAHeavy1_5WindFront
animationFreeMovementWind(*UAHeavy1)

;------- Heavy 2
*UAHeavy2.animation=classGenerateAnimation(4,"image/hand_unarmed_heavy2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*UAHeavy2Raw,40,#H2H_DAMAGETYPE_BLUNT,9)
animationSetFrameCDN(*UAHeavy2,4,6)
animationSetFrameLength(*UAHeavy2,0,6)
animationSetFrameLength(*UAHeavy2,1,6)
animationSetFrameLength(*UAHeavy2,4,13)
animationSetFrameMovement(*UAHeavy2,0,30)
animationSetFrameMovement(*UAHeavy2,1,50)
animationSetFrameMovement(*UAHeavy2,2,-160)
animationSetFrameMovement(*UAHeavy2,3,-80)
animationSetFrameMovementDelta(*UAHeavy2,3,-20)
animationSetFrameMovementDelta(*UAHeavy2,4,-10)
animationSetFrameStun(*UAHeavy2,2,14)
animationSetFrameStun(*UAHeavy2,3,12)
animationSetFramePushD(*UAHeavy2,2,-50)
animationSetFramePushD(*UAHeavy2,3,-50)
animationSetFrameSound(*UAHeavy2,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAHeavy2_2WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy2_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind front",0,*UAHeavy2_2WindFrontRaw)
animationFreeMovement(*UAHeavy2_2WindFront)
animationSetFrameLength(*UAHeavy2_2WindFront,1,5)
animationSetFrameLength(*UAHeavy2_2WindFront,2,6)
animationSetFrameOpacity(*UAHeavy1_5WindFront,1,192)
animationSetFrameOpacity(*UAHeavy1_5WindFront,2,128)
*UAHeavy2_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy2_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind front",0,*UAHeavy2_3WindFrontRaw)
animationFreeMovement(*UAHeavy2_3WindFront)
*UAHeavy2_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy2_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*UAHeavy2_4WindFrontRaw)
animationSetFrameOpacity(*UAHeavy2_4WindFront,1,192)
*UAHeavy2_5WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy2_5WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind front",0,*UAHeavy2_5WindFrontRaw)
animationSetFrameLength(*UAHeavy2_5WindFront,1,8)
animationSetFrameOpacity(*UAHeavy2_5WindFront,1,192)
animationFreeMovement(*UAHeavy2_5WindFront)

animationPrepareWind(*UAHeavy2,0)
*UAHeavy2\frontWind(1,0)=*UAHeavy2_2WindFront
*UAHeavy2\frontWind(2,0)=*UAHeavy2_3WindFront
*UAHeavy2\frontWind(3,0)=*UAHeavy2_4WindFront
*UAHeavy2\frontWind(4,0)=*UAHeavy2_5WindFront
animationGetHeavy(*UADown1)=*UAHeavy2
animationGetSide(*UAHeavy2)=*UASide3
animationGetUp(*UAHeavy2)=*UAUp2

;------- Heavy 3
*UAHeavy3.animation=classGenerateAnimation(4,"image/hand_unarmed_heavy3_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3",0,*UAHeavy3Raw,50,#H2H_DAMAGETYPE_BLUNT,13)
animationSetComboEnd(*UAHeavy3,#True)
animationSetFrameLength(*UAHeavy3,0,4)
animationSetFrameLength(*UAHeavy3,1,4)
animationSetFrameLength(*UAHeavy3,3,7)
animationSetFrameLength(*UAHeavy3,4,8)
animationSetFrameMovement(*UAHeavy3,0,20)
animationSetFrameMovement(*UAHeavy3,1,20)
animationSetFrameMovement(*UAHeavy3,2,-100)
animationSetFrameMovement(*UAHeavy3,3,-128)
animationSetFrameMovementDelta(*UAHeavy3,3,-30)
animationSetFrameMovementDelta(*UAHeavy3,4,-8)
animationSetFramePush(*UAHeavy3,3,-40)
animationSetFramePush(*UAHeavy3,4,-40)
animationSetFrameSound(*UAHeavy3,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*UAHeavy3_1WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy3_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 1 wind front",0,*UAHeavy3_1WindFrontRaw)
animationFreeMovement(*UAHeavy3_1WindFront)
*UAHeavy3_2WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy3_2WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 2 wind front",0,*UAHeavy3_2WindFrontRaw)
animationFreeMovement(*UAHeavy3_2WindFront)
animationSetFrameLength(*UAHeavy3_2WindFront,1,5)
animationSetFrameOpacity(*UAHeavy3_2WindFront,1,192)
*UAHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_heavy3_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 3 wind front",0,*UAHeavy3_3WindFrontRaw)
animationFreeMovement(*UAHeavy3_3WindFront)
*UAHeavy3_4WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_heavy3_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 4 wind front",0,*UAHeavy3_4WindFrontRaw)
animationSetFrameLength(*UAHeavy3_4WindFront,1,5)
animationSetFrameOpacity(*UAHeavy3_4WindFront,1,192)
*UAHeavy3_5WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_heavy3_5WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 5 wind front",0,*UAHeavy3_5WindFrontRaw)
animationSetFrameLength(*UAHeavy3_5WindFront,1,6)
animationSetFrameLength(*UAHeavy3_5WindFront,2,7)
animationSetFrameOpacity(*UAHeavy3_5WindFront,1,192)
animationSetFrameOpacity(*UAHeavy3_5WindFront,2,128)
animationFreeMovement(*UAHeavy3_5WindFront)

animationPrepareWind(*UAHeavy3,0)
*UAHeavy3\frontWind(0,0)=*UAHeavy3_1WindFront
*UAHeavy3\frontWind(1,0)=*UAHeavy3_2WindFront
*UAHeavy3\frontWind(2,0)=*UAHeavy3_3WindFront
*UAHeavy3\frontWind(3,0)=*UAHeavy3_4WindFront
*UAHeavy3\frontWind(4,0)=*UAHeavy3_5WindFront
animationGetHeavy(*UABack2)=*UAHeavy3

;------ Hit
*UAHit.animation=classGenerateAnimation(4,"image/hand_unarmed_hit",50,#H2H_ANIMATIONTYPE_HIT,"hit",0,*UAHitRaw)

;------ Spawn
*UASpawn.animation=classGenerateAnimation(12,"image/hand_unarmed_spawn",4,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*UASPawnRaw)
animationSetFrameLength(*UASpawn,0,25)
For i=0 To 7
	animationSetFrameLength(*UASpawn,i,2+i*2)
Next
For i=8 To 11
	animationSetFrameLength(*UASpawn,i,i)
Next
animationSetFrameSound(*UASpawn,6,#H2H_SOUND_ID_HAND_CREAK)
animationSetFrameSound(*UASpawn,12,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationPrepareWind(*UASpawn)
*UASpawn\frontWind(12,0)=classGenerateAnimation(1,"image/hand_unarmed_spawn13windfront",5,#H2H_ANIMATIONTYPE_SPAWN,"spawn 13 wind front",0,*UASpawn1_13WindFrontRaw)
animationSetFrameLength(*UAHeavy3_5WindFront,1,7)
animationSetFrameOpacity(*UAHeavy3_5WindFront,1,192)

;------ Death
*UADeath.animation=classGenerateAnimation(13,"image/hand_unarmed_death",8,#H2H_ANIMATIONTYPE_DEATH,"death",0,*UADeathRaw)
animationSetFrameSound(*UADeath,11,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*UADeath,13,#H2H_SOUND_ID_HAND_FALL)

animationSetFrameShadow(*UADeath,1,-10)
animationSetFrameShadow(*UADeath,2,-40)
animationSetFrameShadow(*UADeath,5,20)
animationSetFrameShadow(*UADeath,6,70)
animationSetFrameShadow(*UADeath,7,150)
animationSetFrameShadow(*UADeath,8,60)
animationSetFrameShadow(*UADeath,10,-125)
animationSetFrameShadow(*UADeath,11,-225)
animationSetFrameShadow(*UADeath,12,-275)
animationSetFrameShadow(*UADeath,13,-275)

animationSetFrameShake(*UADeath,11,10)
animationSetFrameLength(*UADeath,7,20)
For i=8 To 13
	animationSetFrameLength(*UADeath,i,5)
Next
animationPrepareWind(*UADeath,1)

*UADeath9WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_death9WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 9 wind front",0,*UADeath9WindFrontRaw)
*UADeath12WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"death 12 wind front",0,*UADeath12WindFrontRaw)

*UADeath10WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_death10WindBack",5,#H2H_ANIMATIONTYPE_DEATH,"death 10 wind back",0,*UADeath10WindBackRaw)
*UADeath11WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_death11WindBack",5,#H2H_ANIMATIONTYPE_DEATH,"death 11 wind back",0,*UADeath11WindBackRaw)
*UADeath12WindBack1.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindBack1_",4,#H2H_ANIMATIONTYPE_DEATH,"death 12 1 wind back",0,*UADeath12WindBack1Raw)
*UADeath12WindBack2.animation=classGenerateAnimation(3,"image/hand_unarmed_death12WindBack2_",4,#H2H_ANIMATIONTYPE_DEATH,"death 12 2 wind back",0,*UADeath12WindBack2Raw)
For i=0 To 3
	animationSetFrameLength(*UADeath12WindBack1,i,5+i)
	animationSetFrameLength(*UADeath12WindBack2,i,6+i)
	animationSetFrameLength(*UADeath12WindFront,i,6+i)
	animationSetFrameOpacity(*UADeath12WindFront,i,min(256-64*i,255))
	animationSetFrameOpacity(*UADeath12WindFront,i,min(256-64*i,255))
	animationSetFrameOpacity(*UADeath12WindFront,i,min(256-64*i,255))
Next

*UADeath\frontWind( 8,0)=*UADeath9WindFront
*UADeath\frontWind(11,0)=*UADeath12WindFront

*UADeath\backWind( 9,0)=*UADeath10WindBack
*UADeath\backWind(10,0)=*UADeath11WindBack
*UADeath\backWind(11,0)=*UADeath12WindBack1
*UADeath\backWind(11,1)=*UADeath12WindBack2

;------ Jump
*UAJump.animation=classGenerateAnimation(8,"image/hand_unarmed_jump",4,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*UAJumpRaw)

;------ Land
*UALand.animation=classGenerateAnimation(3,"image/hand_unarmed_land",4,#H2H_ANIMATIONTYPE_LAND,"land",0,*UALandRaw)
animationSetFrameLength(*UALand,1,6)
animationSetFrameLength(*UALand,2,5)
animationSetFrameShadow(*UALand,0,-65,100)
animationSetFrameShadow(*UALand,1,-90,200)
animationSetFrameShadow(*UALand,2,-65,100)
animationSetFrameShadow(*UALand,3,-30,50)

;------ Dodge
*UADodge.animation=classGenerateAnimation(1,"image/hand_unarmed_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*UADodgeRaw)
animationSetFrameLength(*UADodge,1,20)

;------ Parry
*UAParry.animation=classGenerateAnimation(5,"image/hand_unarmed_parry",5,#H2H_ANIMATIONTYPE_PARRY,"Parry",0,*UAParryRaw)

;------ Selection
*UASelection.animation=classGenerateAnimation(9,"image/hand_unarmed_selection",18,#H2H_ANIMATIONTYPE_SELECTION,"Selection",0,*UASelectionRaw)
*UASelection\loopStart=5
animationSetFrameLength(*UASelection,0,18)
animationSetFrameLength(*UASelection,1,7)
animationSetFrameLength(*UASelection,2,7)
animationSetFrameLength(*UASelection,3,10)
animationSetFrameLength(*UASelection,4,10)
animationSetFrameShadow(*UASelection,0,-32)
animationSetFrameShadow(*UASelection,1,-24)
animationSetFrameShadow(*UASelection,2,-16)
animationSetFrameShadow(*UASelection,3,-8)
animationSetFrameShadow(*UASelection,4,-4)

*UASelection_2WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selection2WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 2 wind front",0,*UASelection_2WindFrontRaw)
*UASelection_3WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selection3WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 3 wind front",0,*UASelection_3WindFrontRaw)
*UASelection_4WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selection4WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 4 wind front",0,*UASelection_4WindFrontRaw)

*UASelection_5WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_selection5WindBack",10,#H2H_ANIMATIONTYPE_SELECTION,"Selection 5 wind back",0,*UASelection_5WindBackRaw)

animationPrepareWind(*UASelection,0)
*UASelection\frontWind(1,0)=*UASelection_2WindFront
*UASelection\frontWind(2,0)=*UASelection_3WindFront
*UASelection\frontWind(3,0)=*UASelection_4WindFront
*UASelection\backWind(4,0)=*UASelection_5WindBack
For i=0 To 9
	animationShiftShift(*UASelection,i,0,12)
	If *UASelection\frontWind()
		For j=0 To ArraySize(*UASelection\frontWind(),0)
			For kk=0 To ArraySize(*UASelection\frontWind(),1)
				animationShiftShift(*UASelection\frontWind(i,j),kk,0,12)
			Next
		Next
	EndIf
	If *UASelection\backWind()
		For j=0 To ArraySize(*UASelection\backWind(),0)
			For kk=0 To ArraySize(*UASelection\backWind(),1)
				animationShiftShift(*UASelection\backWind(i,j),kk,0,12)
			Next
		Next
	EndIf
Next

;------ Selected
*UASelected.animation=classGenerateAnimation(21,"image/hand_unarmed_selected",8,#H2H_ANIMATIONTYPE_SELECTED,"Selected",0,*UASelectedRaw,8,#H2H_DAMAGETYPE_CUT,5)
*UASelected\loopStart=15
animationSetFrameSound(*UASelected,6,#H2H_SOUND_ID_HAND_CREAK)
animationSetFrameSound(*UASelected,11,#H2H_SOUND_ID_FINGER_SWISHLIGHT)
animationSetFrameSound(*UASelected,12,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*UASelected,14,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameLength(*UASelected,0,13)
animationSetFrameLength(*UASelected,1,11)
animationSetFrameLength(*UASelected,2,9)
animationSetFrameLength(*UASelected,3,7)
animationSetFrameLength(*UASelected,5,6)
animationSetFrameLength(*UASelected,6,6)
animationSetFrameLength(*UASelected,7,6)
animationSetFrameLength(*UASelected,8,5)
animationSetFrameLength(*UASelected,9,5)
animationSetFrameLength(*UASelected,10,8)
animationSetFrameLength(*UASelected,11,6)
animationSetFrameLength(*UASelected,12,4)
animationSetFrameLength(*UASelected,13,7)
animationSetFrameLength(*UASelected,14,4)
animationSetFrameShadow(*UASelected,1,-16)
animationSetFrameShadow(*UASelected,5,-16)
animationSetFrameShadow(*UASelected,6,-16)
animationSetFrameShadow(*UASelected,9,32)
animationSetFrameShadow(*UASelected,10,64)
animationSetFrameShadow(*UASelected,11,128)
animationSetFrameShadow(*UASelected,12,64)
animationSetFrameShadow(*UASelected,13,16)
For i=15 To 21
	animationSetFrameLength(*UASelected,i,10)
Next

*UASelected_3WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_selected3WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind front",0,*UASelected_3WindFrontRaw)
animationSetFrameLength(*UASelected_3WindFront,1,7)
animationSetFrameOpacity(*UASelected_3WindFront,1,192)
*UASelected_5WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selected5WindFront",9,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind front",0,*UASelected_5WindFrontRaw)
*UASelected_6WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_selected6WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind front",0,*UASelected_6WindFrontRaw)
animationSetFrameLength(*UASelected_6WindFront,1,7)
animationSetFrameOpacity(*UASelected_6WindFront,1,192)
*UASelected_7WindFront.animation=classGenerateAnimation(4,"image/hand_unarmed_selected7WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 7 wind front",0,*UASelected_7WindFrontRaw) ; crack
*UASelected_9WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selected9WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind front",0,*UASelected_9WindFrontRaw)
*UASelected_10WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selected10WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind front",0,*UASelected_10WindFrontRaw)
*UASelected_11WindFront.animation=classGenerateAnimation(1,"image/hand_unarmed_selected11WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 11 wind front",0,*UASelected_11WindFrontRaw)
animationSetFrameLength(*UASelected_11WindFront,1,7)
animationSetFrameOpacity(*UASelected_11WindFront,1,192)
*UASelected_12WindFront.animation=classGenerateAnimation(2,"image/hand_unarmed_selected12WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind front",0,*UASelected_12WindFrontRaw)
animationSetFrameLength(*UASelected_12WindFront,1,5)
animationSetFrameLength(*UASelected_12WindFront,2,6)
animationSetFrameOpacity(*UASelected_12WindFront,1,192)
animationSetFrameOpacity(*UASelected_12WindFront,2,128)
*UASelected_13WindFront.animation=classGenerateAnimation(0,"image/hand_unarmed_selected13WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 13 wind front",0,*UASelected_13WindFrontRaw)
*UASelected_14WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_selected14WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 14 wind front",0,*UASelected_14WindFrontRaw)
animationSetFrameLength(*UASelected_14WindFront,1,4)
animationSetFrameLength(*UASelected_14WindFront,2,5)
animationSetFrameLength(*UASelected_14WindFront,3,6)
animationSetFrameOpacity(*UASelected_14WindFront,1,192)
animationSetFrameOpacity(*UASelected_14WindFront,2,128)
animationSetFrameOpacity(*UASelected_14WindFront,3,64)
*UASelected_15WindFront.animation=classGenerateAnimation(3,"image/hand_unarmed_selected15WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 15 wind front",0,*UASelected_15WindFrontRaw)
animationSetFrameLength(*UASelected_15WindFront,1,4)
animationSetFrameLength(*UASelected_15WindFront,2,5)
animationSetFrameLength(*UASelected_15WindFront,3,6)
animationSetFrameOpacity(*UASelected_15WindFront,1,192)
animationSetFrameOpacity(*UASelected_15WindFront,2,128)
animationSetFrameOpacity(*UASelected_15WindFront,3,64)

*UASelected_5WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_selected5WindBack",8,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind back",0,*UASelected_5WindBackRaw)
*UASelected_6WindBack.animation=classGenerateAnimation(1,"image/hand_unarmed_selected6WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind back",0,*UASelected_6WindBackRaw)
animationSetFrameLength(*UASelected_6WindBack,1,5)
animationSetFrameOpacity(*UASelected_6WindBack,1,192)
*UASelected_8WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_selected8WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind back",0,*UASelected_8WindBackRaw)
*UASelected_9WindBack.animation=classGenerateAnimation(0,"image/hand_unarmed_selected9WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind back",0,*UASelected_9WindBackRaw)
*UASelected_14WindBack.animation=classGenerateAnimation(3,"image/hand_unarmed_selected14WindBack",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 14 wind back",0,*UASelected_14WindBackRaw)
animationSetFrameLength(*UASelected_14WindBack,1,4)
animationSetFrameLength(*UASelected_14WindBack,2,6)
animationSetFrameLength(*UASelected_14WindBack,3,8)
animationSetFrameOpacity(*UASelected_14WindBack,1,192)
animationSetFrameOpacity(*UASelected_14WindBack,2,128)
animationSetFrameOpacity(*UASelected_14WindBack,3,64)
*UASelected_15WindBack.animation=classGenerateAnimation(4,"image/hand_unarmed_selected15WindBack",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 15 wind back",0,*UASelected_15WindBackRaw)
animationSetFrameLength(*UASelected_15WindBack,1,4)
animationSetFrameLength(*UASelected_15WindBack,2,6)
animationSetFrameLength(*UASelected_15WindBack,3,8)
animationSetFrameLength(*UASelected_15WindBack,4,10)
animationSetFrameOpacity(*UASelected_15WindBack,2,192)
animationSetFrameOpacity(*UASelected_15WindBack,3,128)
animationSetFrameOpacity(*UASelected_15WindBack,4,64)

animationPrepareWind(*UASelected,0)
*UASelected\frontWind(2,0)=*UASelected_3WindFront
*UASelected\frontWind(4,0)=*UASelected_5WindFront
*UASelected\frontWind(5,0)=*UASelected_6WindFront
*UASelected\frontWind(6,0)=*UASelected_7WindFront
*UASelected\frontWind(8,0)=*UASelected_9WindFront
*UASelected\frontWind(9,0)=*UASelected_10WindFront
*UASelected\frontWind(10,0)=*UASelected_11WindFront
*UASelected\frontWind(11,0)=*UASelected_12WindFront
*UASelected\frontWind(12,0)=*UASelected_13WindFront
*UASelected\frontWind(13,0)=*UASelected_14WindFront
*UASelected\frontWind(14,0)=*UASelected_15WindFront
*UASelected\backWind(4,0)=*UASelected_5WindBack
*UASelected\backWind(5,0)=*UASelected_6WindBack
*UASelected\backWind(7,0)=*UASelected_8WindBack
*UASelected\backWind(8,0)=*UASelected_9WindBack
*UASelected\backWind(13,0)=*UASelected_14WindBack
*UASelected\backWind(14,0)=*UASelected_15WindBack
For i=0 To 21
	animationShiftShift(*UASelected,i,0,16)
	If *UASelected\frontWind()
		For j=0 To ArraySize(*UASelected\frontWind(),0)
			For kk=0 To ArraySize(*UASelected\frontWind(),1)
				animationShiftShift(*UASelected\frontWind(i,j),kk,0,16)
			Next
		Next
	EndIf
	If *UASelected\backWind()
		For j=0 To ArraySize(*UASelected\backWind(),0)
			For kk=0 To ArraySize(*UASelected\backWind(),1)
				animationShiftShift(*UASelected\backWind(i,j),kk,0,16)
			Next
		Next
	EndIf
Next

;------ Branch
; *unarmed_stat.statistic=statisticCreate(0,3,5,5,0,2,2,-1,-1,3,0,4)
*unarmed_stat.statistic=statisticCreate(0,4,4,4,0,4,4,-1,-1,5,1,4)
Dim *tmpArray(0)
*tmpArray(0)=*finger_hit
*unarmed_stance_thumb.stance=stanceCreate(*tmpArray(),0,"Defense")
; statisticCreate(*unarmed_stance_thumb\modificator,1,-2,-2,1,1,1,0,0,0,0)
  statisticCreate(*unarmed_stance_thumb\modificator,1,-2,-3,1,2,1,0,0,0,0)

*unarmed_stance_index.stance=stanceCreate(*tmpArray(),0,"Dexterity")
; statisticCreate(*unarmed_stance_index\modificator,-1,1,0,0,0,0 ,0,0,0,0)
  statisticCreate(*unarmed_stance_index\modificator,-2,3,0,0,0,-1,0,0,0,0)

*unarmed_stance_middle.stance=stanceCreate(*tmpArray(),0,"Power")
; statisticCreate(*unarmed_stance_middle\modificator,1,-2,-1,1, 0,-1,0,0,2,0)
  statisticCreate(*unarmed_stance_middle\modificator,4,-2,-2,1,-1, 0,0,0,0,0)

*unarmed_stance_ring.stance=stanceCreate(*tmpArray(),0,"Speed")
; statisticCreate(*unarmed_stance_ring\modificator, 0,1,1,0,-2,0,0,0,0,0)
  statisticCreate(*unarmed_stance_ring\modificator,-1,0,3,0,-2,0,0,0,0,0)

*unarmed_stance_pinky.stance=stanceCreate(*tmpArray(),0,"Hyperactive")
; statisticCreate(*unarmed_stance_pinky\modificator,-1,2,2,0,-1,-1,0,0,-1,0)
  statisticCreate(*unarmed_stance_pinky\modificator,-3,4,4,0,-3,-2,0,0, 0,0)

*unarmed.class=classCreate(0,"Unarmed",*UAIdle1,*UAMoveFront1,*UAMoveBack1,*UANeutral1,*UASide1,*UAUp1,*UABack1,*UADown1,*UAHeavy1)
*unarmed\allStances(0)\name="Balanced (default)"
Dim *unarmed\allStances(0)\materialClass(0)
*unarmed\allStances(0)\materialClass(0)=*finger_hit
classAddStance(*unarmed,*unarmed_stance_thumb)
classAddStance(*unarmed,*unarmed_stance_index)
classAddStance(*unarmed,*unarmed_stance_middle)
classAddStance(*unarmed,*unarmed_stance_ring)
classAddStance(*unarmed,*unarmed_stance_pinky)
*unarmed\iconPath$="image\Unarmed.png"
; *unarmed\desc$="Nervous fighter, with quick response and combos.\Lacks of any range control, but hugely compensated by an excellent agility.\The unarmed hand can deal serious consecutive blows And take some.\Can close up And keep distance whenever it wants."
*unarmed\desc$="Nervous fighter with quick response and combos. Where it lacks range it gains high push power, easily destroying enemy combos.\Its stances grant a lot of different playstyles."
*unarmed\stat=*unarmed_stat

classGetSpawn(*unarmed)=*UASpawn
classGetDeath(*unarmed)=*UADeath
classGetJump(*unarmed)=*UAJump
classGetLand(*unarmed)=*UALand
classGetHit(*unarmed)=*UAHit
classGetDodge(*unarmed)=*UADodge
classGetParry(*unarmed)=*UAParry
classGetSelection(*unarmed)=*UASelection
classGetSelected(*unarmed)=*UASelected

Dim *unarmed\otherIdle(0)
*unarmed\otherIdle(0)=*UAIdle2
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 110
; FirstLine = 96
; EnableXP
; CPU = 1