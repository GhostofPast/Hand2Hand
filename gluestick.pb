;------ Gluestick
;------- Idle 1
*GSIdle1.animation=classGenerateAnimation(8,"image/hand_gluestick_idle1_",10,#H2H_ANIMATIONTYPE_IDLE,"idle 1",1,*GSIdle1Raw)
animationSetFrameLength(*GSIdle1,0,6)
animationSetFrameLength(*GSIdle1,1,8)
animationSetFrameLength(*GSIdle1,7,5)
animationSetFrameLength(*GSIdle1,8,6)
animationPrepareWind(*GSIdle1)
*GSIdle1_8WindBack.animation= classGenerateAnimation(1,"image/hand_gluestick_idle1_8WindBack",5,0,"Gluestick idle 1 8 wind back",0,*GSIdle1_8WindBackRaw)
animationSetFrameLength(*GSIdle1_8WindBack,1,6)
animationSetFrameOpacity(*GSIdle1_8WindBack,0,128)
animationSetFrameOpacity(*GSIdle1_8WindBack,1,64)
*GSIdle1_9WindBack.animation= classGenerateAnimation(1,"image/hand_gluestick_idle1_9WindBack",5,0,"Gluestick idle 1 9 wind back",0,*GSIdle1_9WindBackRaw)
animationSetFrameLength(*GSIdle1_9WindBack,1,6)
animationSetFrameOpacity(*GSIdle1_9WindBack,0,128)
animationSetFrameOpacity(*GSIdle1_9WindBack,1,64)

*GSIdle1\backWind(7,0)=*GSIdle1_8WindBack
*GSIdle1\backWind(8,0)=*GSIdle1_9WindBack
animationShiftShift(*GSIdle1,1,3)
animationShiftShift(*GSIdle1,2,6)
animationShiftShift(*GSIdle1,3,9)
animationShiftShift(*GSIdle1,4,6)
animationShiftShift(*GSIdle1,5,3)
animationShiftShift(*GSIdle1,7,-3)
animationShiftShift(*GSIdle1,8,-6)
For i=0 To 8
	animationShiftShift(*GSIdle1,i,-16,-16)
Next
animationFreeMovementWind(*GSIdle1)

;------- Idle 2
*GSIdle2.animation=classGenerateAnimation(7,"image/hand_gluestick_idle2_",9,#H2H_ANIMATIONTYPE_IDLE,"Idle 2",1,*GSIdle2Raw,8,#H2H_DAMAGETYPE_CUT,5)
For i=0 To 7
	animationShiftShift(*GSIdle2,i,-8,-8)
Next
*GSIdle2_1WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_idle2_1WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"Idle 2 1 wind front",0,*GSIdle2_1WindFrontRaw)
animationSetFrameLength(*GSIdle2_1WindFront,1,8)
animationSetFrameOpacity(*GSIdle2_1WindFront,0,128)
animationSetFrameOpacity(*GSIdle2_1WindFront,1,64)
*GSIdle2_1WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_idle2_6WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"Idle 2 6 wind front",0,*GSIdle2_6WindFrontRaw)
animationSetFrameLength(*GSIdle2_1WindFront,1,8)
animationSetFrameOpacity(*GSIdle2_1WindFront,0,128)
animationSetFrameOpacity(*GSIdle2_1WindFront,1,64)

animationPrepareWind(*GSIdle2,0)
*GSIdle2\frontWind(0,0)=*GSIdle2_1WindFront
*GSIdle2\frontWind(5,0)=*GSIdle2_6WindFront
animationSetFrameLength(*GSIdle2,3,8)
animationSetFrameLength(*GSIdle2,4,7)
animationSetFrameLength(*GSIdle2,5,8)
animationFreeMovementWind(*GSIdle2)

;------- Idle 3
*GSIdle3.animation=classGenerateAnimation(5,"image/hand_gluestick_idle3_",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 3",1,*GSIdle3Raw,8,#H2H_DAMAGETYPE_CUT,5)
animationSetFrameLength(*GSIdle3,2,18)
animationSetFrameLength(*GSIdle3,4,12)
*GSIdle3_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_idle3_1WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 1 wind front",0,*GSIdle3_1WindFrontRaw)
animationSetFrameOpacity(*GSIdle3_1WindFront,0,128)
*GSIdle3_2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_idle3_2WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 2 wind front",0,*GSIdle3_2WindFrontRaw)
animationSetFrameLength(*GSIdle3_2WindFront,1,8)
animationSetFrameOpacity(*GSIdle3_2WindFront,0,128)
animationSetFrameOpacity(*GSIdle3_2WindFront,1,64)
*GSIdle3_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_idle3_3WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 3 wind front",0,*GSIdle3_3WindFrontRaw)
animationSetFrameOpacity(*GSIdle3_3WindFront,0,128)
*GSIdle3_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_idle3_4WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 4 wind front",0,*GSIdle3_4WindFrontRaw)
animationSetFrameOpacity(*GSIdle3_4WindFront,0,128)
*GSIdle3_5WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_idle3_5WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 5 wind front",0,*GSIdle3_5WindFrontRaw)
animationSetFrameLength(*GSIdle3_5WindFront,1,6)
animationSetFrameLength(*GSIdle3_5WindFront,2,7)
animationSetFrameOpacity(*GSIdle3_5WindFront,0,192)
animationSetFrameOpacity(*GSIdle3_5WindFront,1,128)
animationSetFrameOpacity(*GSIdle3_5WindFront,2,64)
*GSIdle3_6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_idle3_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"Idle 3 6 wind front",0,*GSIdle3_6WindFrontRaw)
animationSetFrameLength(*GSIdle3_6WindFront,1,6)
animationSetFrameLength(*GSIdle3_6WindFront,2,7)
animationSetFrameOpacity(*GSIdle3_6WindFront,0,192)
animationSetFrameOpacity(*GSIdle3_6WindFront,1,128)
animationSetFrameOpacity(*GSIdle3_6WindFront,2,64)

animationPrepareWind(*GSIdle3,0)
*GSIdle3\frontWind(0,0)=*GSIdle3_1WindFront
*GSIdle3\frontWind(1,0)=*GSIdle3_2WindFront
*GSIdle3\frontWind(2,0)=*GSIdle3_3WindFront
*GSIdle3\frontWind(3,0)=*GSIdle3_4WindFront
*GSIdle3\frontWind(4,0)=*GSIdle3_5WindFront
*GSIdle3\frontWind(5,0)=*GSIdle3_6WindFront
animationFreeMovementWind(*GSIdle3)

;------- Move Front
*GSMoveFront.animation=classGenerateAnimation(6,"image/hand_gluestick_move_front",4,#H2H_ANIMATIONTYPE_FRONT,"move front",1,*GSMoveFrontRaw)
ReDim *GSMoveFront\frames(12)
*GSMoveFront\frames(9 )=*GSMoveFront\frames(0)
*GSMoveFront\frames(9 )=*GSMoveFront\frames(5)
*GSMoveFront\frames(10)=*GSMoveFront\frames(6)
*GSMoveFront\frames(11)=*GSMoveFront\frames(5)
*GSMoveFront\frames(12)=*GSMoveFront\frames(0)
*GSMoveFront\frames(5 )=*GSMoveFront\frames(3)
*GSMoveFront\frames(6 )=*GSMoveFront\frames(2)
*GSMoveFront\frames(7 )=*GSMoveFront\frames(1)
*GSMoveFront\frames(8 )=*GSMoveFront\frames(0)
*GSMoveFront\loopStart=1
For i=0 To 12
	animationShiftShift(*GSMoveFront,i,-8,-8)
Next
animationPrepareWind(*GSMoveFront)
*GSMoveFront1WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front1WindBack",4,0,"Gluestick move front 1 wind back",0,*GSMoveFront1WindBackRaw)
animationSetFrameLength(*GSMoveFront1WindBack,1,5)
animationSetFrameOpacity(*GSMoveFront1WindBack,0,128)
animationSetFrameOpacity(*GSMoveFront1WindBack,1,64)

*GSMoveFront2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front2WindFront",4,0,"Gluestick move front 2 wind front",0,*GSMoveFront2WindFrontRaw)
animationSetFrameLength(*GSMoveFront2WindFront,1,5)
animationSetFrameOpacity(*GSMoveFront2WindFront,0,128)
animationSetFrameOpacity(*GSMoveFront2WindFront,1,64)
*GSMoveFront3WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front3WindFront",4,0,"Gluestick move front 3 wind front",0,*GSMoveFront3WindFrontRaw)
animationSetFrameLength(*GSMoveFront3WindFront,1,5)
animationSetFrameOpacity(*GSMoveFront3WindFront,0,128)
animationSetFrameOpacity(*GSMoveFront3WindFront,1,64)
frameSetFreeMovement(*GSMoveFront3WindFront\frames(0),1)
*GSMoveFront4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front4WindFront",5,0,"Gluestick move front 4 wind front",0,*GSMoveFront4WindFrontRaw)
animationSetFrameOpacity(*GSMoveFront4WindFront,0,128)
*GSMoveFront5WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_front5WindFront",4,0,"Gluestick move front 5 wind front",0,*GSMoveFront5WindFrontRaw)
animationSetFrameLength(*GSMoveFront5WindFront,1,5)
animationSetFrameOpacity(*GSMoveFront5WindFront,0,128)
animationSetFrameOpacity(*GSMoveFront5WindFront,1,64)
frameSetFreeMovement(*GSMoveFront5WindFront\frames(1),1)
*GSMoveFront12WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front12WindFront",5,0,"Gluestick move front 12 wind front",0,*GSMoveFront12WindFrontRaw)
animationSetFrameOpacity(*GSMoveFront12WindFront,0,128)
animationFreeMovementWind(*GSMoveFront12WindFront)
*GSMoveFront13WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_front13WindFront",5,0,"Gluestick move front 13 wind front",0,*GSMoveFront13WindFrontRaw)
animationSetFrameOpacity(*GSMoveFront13WindFront,0,128)

*GSMoveFront\frontWind(1,0)=*GSMoveFront2WindFront
*GSMoveFront\frontWind(2,0)=*GSMoveFront3WindFront
*GSMoveFront\frontWind(3,0)=*GSMoveFront4WindFront
*GSMoveFront\frontWind(4,0)=*GSMoveFront5WindFront
*GSMoveFront\frontWind(11,0)=*GSMoveFront12WindFront
*GSMoveFront\frontWind(12,0)=*GSMoveFront13WindFront

;------- Move Back
*GSMoveBack.animation=classGenerateAnimation(3,"image/hand_gluestick_move_back",4,#H2H_ANIMATIONTYPE_BACK,"move back",1,*GSMoveBackRaw)
ReDim *GSMoveBack\frames(5)
*GSMoveBack\frames(4)=*GSMoveBack\frames(2)
*GSMoveBack\frames(5)=*GSMoveBack\frames(1)
animationPrepareWind(*GSMoveBack)
*GSMoveBack4WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_move_back4WindFront",6,0,"Gluestick move back 4 wind front",0,*GSMoveBack4WindFrontRaw)
animationSetFrameLength(*GSMoveBack4WindFront,1,7)
animationSetFrameMovement(*GSMoveBack4WindFront,1,50)
animationSetFrameOpacity(*GSMoveBack4WindFront,0,128)
animationSetFrameOpacity(*GSMoveBack4WindFront,1,64)
animationSetFrameFreeMovement(*GSMoveBack4WindFront\frames(1))
*GSMoveBack5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_move_back5WindFront",6,0,"Gluestick move back 5 wind front",0,*GSMoveBack5WindFrontRaw)
animationSetFrameOpacity(*GSMoveBack5WindFront,0,128)
*GSMoveBack\frontWind(3,0)=*GSMoveBack4WindFront
*GSMoveBack\frontWind(4,0)=*GSMoveBack5WindFront

;------- Neutral 1
*GSNeutral1.animation=classGenerateAnimation(5,"image/hand_gluestick_neutral1_",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1",0,*GSNeutral1Raw,15,#H2H_DAMAGETYPE_BLUNT,5,1)
animationSetFrameSound(*GSNeutral1,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*GSNeutral1,2,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameLength(*GSNeutral1,0,3)
animationSetFrameLength(*GSNeutral1,1,4)
animationSetFrameLength(*GSNeutral1,2,5)
animationSetFrameLength(*GSNeutral1,3,5)
animationSetFrameLength(*GSNeutral1,4,8)
animationSetFrameMovement(*GSNeutral1,0,30) ;60
animationSetFrameMovement(*GSNeutral1,1,30) ;30
animationSetFrameMovement(*GSNeutral1,2,30)
animationSetFrameMovement(*GSNeutral1,3,-160)
animationSetFrameMovement(*GSNeutral1,4,20)
animationSetFrameMovement(*GSNeutral1,5,20)
animationSetFrameDamageCut(*GSNeutral1,2)
animationSetFrameCDN(*GSNeutral1,5,2)
*GSNeutral1\frames(0)\damageSide=0
*GSNeutral1\frames(1)\damageSide=0
animationPrepareWind(*GSNeutral1)

*GSNeutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral1_1WindFront",3,0,"Gluestick neutral 1 wind front",0,*GSNeutral1_1WindFrontRaw)
*GSNeutral1_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral1_2WindFront",4,0,"Gluestick neutral 2 wind front",0,*GSNeutral1_2WindFrontRaw)
animationSetFrameMovement(*GSNeutral1_2WindFront,1,-50)
animationSetFrameMovement(*GSNeutral1_2WindFront,2,-50)
animationSetFrameLength(*GSNeutral1_2WindFront,1,5)
animationSetFrameLength(*GSNeutral1_2WindFront,2,6)
animationSetFrameOpacity(*GSNeutral1_2WindFront,1,192)
animationSetFrameOpacity(*GSNeutral1_2WindFront,2,128)
*GSNeutral1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral1_4WindFront",5,0,"Gluestick neutral 4 wind front",0,*GSNeutral1_4WindFrontRaw)
*GSNeutral1_5WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral1_5WindFront",3,0,"Gluestick neutral 5 wind front",0,*GSNeutral1_5WindFrontRaw)
animationSetFrameLength(*GSNeutral1_5WindFront,1,6)
animationSetFrameLength(*GSNeutral1_5WindFront,2,7)
animationSetFrameOpacity(*GSNeutral1_5WindFront,1,192)
animationSetFrameOpacity(*GSNeutral1_5WindFront,2,128)

*GSNeutral1_4WindBack.animation= classGenerateAnimation(3,"image/hand_gluestick_neutral1_4WindBack" ,4,0,"Gluestick neutral 4 wind front",0,*GSNeutral1_4WindBackRaw)
animationSetFrameMovement(*GSNeutral1_4WindBack,1,-30)
animationSetFrameMovement(*GSNeutral1_4WindBack,2,-30)
animationSetFrameMovement(*GSNeutral1_4WindBack,3,-30)
animationSetFrameLength(*GSNeutral1_4WindBack,1,5)
animationSetFrameLength(*GSNeutral1_4WindBack,2,6)
animationSetFrameLength(*GSNeutral1_4WindBack,3,7)
animationSetFrameOpacity(*GSNeutral1_4WindBack,1,192)
animationSetFrameOpacity(*GSNeutral1_4WindBack,2,128)
animationSetFrameOpacity(*GSNeutral1_4WindBack,3,64)

*GSNeutral1\frontWind(0,0)=*GSNeutral1_1WindFront
*GSNeutral1\frontWind(1,0)=*GSNeutral1_2WindFront
*GSNeutral1\frontWind(3,0)=*GSNeutral1_4WindFront
*GSNeutral1\frontWind(4,0)=*GSNeutral1_5WindFront

*GSNeutral1\backWind(3,0)=*GSNeutral1_4WindBack

;------- Neutral 2
*GSNeutral2.animation=classGenerateAnimation(4,"image/hand_gluestick_neutral2_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*GSNeutral2Raw,40,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameSound(*GSNeutral2,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSNeutral2,1,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSNeutral2,3,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
frameSetNoRecSound(*GSNeutral2\frames(3))
animationSetFrameLength(*GSNeutral2,0,3)
animationSetFrameLength(*GSNeutral2,1,4)
animationSetFrameLength(*GSNeutral2,4,9)
animationSetFrameMovement(*GSNeutral2,0,20)
animationSetFrameMovement(*GSNeutral2,1,50)
animationSetFrameMovement(*GSNeutral2,2,-50)
animationSetFrameMovement(*GSNeutral2,3,-120)
animationSetFrameMovement(*GSNeutral2,4,30)
animationSetFrameShake(*GSNeutral2,3,10)
animationSetFrameCDN(*GSNeutral2,4,5)

*GSNeutral2_2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_neutral2_2WindFront",4,0,"Gluestick neutral 2 wind front",0,*GSNeutral2_2WindFrontRaw)
animationSetFrameLength(*GSNeutral2_2WindFront,1,5)
animationSetFrameOpacity(*GSNeutral2_2WindFront,1,192)
*GSNeutral2_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral2_3WindFront",7,0,"Gluestick neutral 3 wind front",0,*GSNeutral2_3WindFrontRaw)
*GSNeutral2_4WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_neutral2_4WindFront",5,0,"Gluestick neutral 4 wind front",0,*GSNeutral2_4WindFrontRaw)
animationSetFrameLength(*GSNeutral2_4WindFront,1,6)
animationSetFrameLength(*GSNeutral2_4WindFront,2,7)
animationSetFrameLength(*GSNeutral2_4WindFront,3,8)
animationSetFrameOpacity(*GSNeutral2_4WindFront,1,192)
animationSetFrameOpacity(*GSNeutral2_4WindFront,2,128)
animationSetFrameOpacity(*GSNeutral2_4WindFront,3,64)
*GSNeutral2_2WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral2_2WindBack",4,0,"Gluestick neutral 2 wind back",0,*GSNeutral2_2WindBackRaw)
animationSetFrameLength(*GSNeutral2_2WindBack,1,5)
animationSetFrameLength(*GSNeutral2_2WindBack,2,6)
animationSetFrameOpacity(*GSNeutral2_2WindBack,1,192)
animationSetFrameOpacity(*GSNeutral2_2WindBack,2,128)

animationPrepareWind(*GSNeutral2)

*GSNeutral2\frontWind(1,0)=*GSNeutral2_2WindFront
*GSNeutral2\frontWind(2,0)=*GSNeutral2_3WindFront
*GSNeutral2\frontWind(3,0)=*GSNeutral2_4WindFront
*GSNeutral2\backWind(1,0)=*GSNeutral2_2WindBack

animationGetNeutral(*GSNeutral1)=*GSNeutral2

;------- Neutral 3
*GSNeutral3.animation=classGenerateAnimation(6,"image/hand_gluestick_neutral3_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*GSNeutral3Raw,10,#H2H_DAMAGETYPE_BLUNT,4)
For i=0 To 6
	animationSetFrameMovement(*GSNeutral3,i,-5,5)
Next
animationSetFrameDamageCut(*GSNeutral3,5)
animationSetFrameSound(*GSNeutral3,1,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSNeutral3,4,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameLength(*GSNeutral3,0,3)
animationSetFrameLength(*GSNeutral3,6,9)
animationSetFrameCDN(*GSNeutral3,6,5)
animationSetFrameDamageDuration(*GSNeutral3,6,4)

*GSNeutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind front",0,*GSNeutral3_1WindFrontRaw)
*GSNeutral3_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*GSNeutral3_2WindFrontRaw)
*GSNeutral3_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 3 wind front",0,*GSNeutral3_3WindFrontRaw)
*GSNeutral3_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 4 wind front",0,*GSNeutral3_4WindFrontRaw)
*GSNeutral3_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 5 wind front",0,*GSNeutral3_5WindFrontRaw)
*GSNeutral3_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral3_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 6 wind front",0,*GSNeutral3_6WindFrontRaw)
*GSNeutral3_7WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral3_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 7 wind front",0,*GSNeutral3_7WindFrontRaw)
animationSetFrameLength(*GSNeutral3_7WindFront,1,5)
animationSetFrameLength(*GSNeutral3_7WindFront,2,6)
animationSetFrameOpacity(*GSNeutral3_7WindFront,1,192)
animationSetFrameOpacity(*GSNeutral3_7WindFront,2,128)

*GSNeutral3_7WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral3_7WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 7 wind back",0,*GSNeutral3_7WindBackRaw)
animationSetFrameLength(*GSNeutral3_7WindBack,1,6)
animationSetFrameLength(*GSNeutral3_7WindBack,2,8)

animationPrepareWind(*GSNeutral3,0)
*GSNeutral3\frontWind(0,0)=*GSNeutral3_1WindFront
*GSNeutral3\frontWind(1,0)=*GSNeutral3_2WindFront
*GSNeutral3\frontWind(2,0)=*GSNeutral3_3WindFront
*GSNeutral3\frontWind(3,0)=*GSNeutral3_4WindFront
*GSNeutral3\frontWind(4,0)=*GSNeutral3_5WindFront
*GSNeutral3\frontWind(5,0)=*GSNeutral3_6WindFront
*GSNeutral3\frontWind(6,0)=*GSNeutral3_7WindFront
*GSNeutral3\backWind(6,0)=*GSNeutral3_7WindBack
animationFreeMovementWind(*GSNeutral3)

;------- Neutral 4
*GSNeutral4.animation=classGenerateAnimation(6,"image/hand_gluestick_neutral4_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4",0,*GSNeutral4Raw,1)
animationSetUngrounded(*GSNeutral4)
animationSetComboEnd(*GSNeutral4,#True)
animationSetFrameSound(*GSNeutral4,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSNeutral4,2,#H2H_SOUND_ID_GLUESTICK_GUNLIGHT)
animationSetFrameSound(*GSNeutral4,6,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameLength(*GSNeutral4,0,5)
animationSetFrameLength(*GSNeutral4,1,5)
animationSetFrameLength(*GSNeutral4,5,6)
animationSetFrameLength(*GSNeutral4,6,6)

*GSNeutral4_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral4_1WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 1 wind front",0,*GSNeutral4_1WindFrontRaw)
*GSNeutral4_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral4_2WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind front",0,*GSNeutral4_2WindFrontRaw)
*GSNeutral4_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral4_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind front",0,*GSNeutral4_3WindFrontRaw)
animationSetFrameLength(*GSNeutral4_3WindFront,1,6)
animationSetFrameLength(*GSNeutral4_3WindFront,2,8)
animationSetFrameOpacity(*GSNeutral4_3WindFront,1,192)
animationSetFrameOpacity(*GSNeutral4_3WindFront,2,128)
*GSNeutral4_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral4_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 4 wind front",0,*GSNeutral4_4WindFrontRaw)
*GSNeutral4_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral4_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 5 wind front",0,*GSNeutral4_5WindFrontRaw)
*GSNeutral4_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral4_6WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 6 wind front",0,*GSNeutral4_6WindFrontRaw)
*GSNeutral4_7WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral4_7WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 7 wind front",0,*GSNeutral4_7WindFrontRaw)
animationSetFrameLength(*GSNeutral4_7WindFront,1,7)
animationSetFrameLength(*GSNeutral4_7WindFront,2,8)
animationSetFrameOpacity(*GSNeutral4_7WindFront,1,192)
animationSetFrameOpacity(*GSNeutral4_7WindFront,2,128)

animationPrepareWind(*GSNeutral4,0)
*GSNeutral4\frontWind(0,0)=*GSNeutral4_1WindFront
*GSNeutral4\frontWind(1,0)=*GSNeutral4_2WindFront
*GSNeutral4\frontWind(2,0)=*GSNeutral4_3WindFront
*GSNeutral4\frontWind(3,0)=*GSNeutral4_4WindFront
*GSNeutral4\frontWind(4,0)=*GSNeutral4_5WindFront
*GSNeutral4\frontWind(5,0)=*GSNeutral4_6WindFront
*GSNeutral4\frontWind(6,0)=*GSNeutral4_7WindFront
animationFreeMovementWind(*GSNeutral4)

;------- Neutral 5
*GSNeutral5.animation=classGenerateAnimation(6,"image/hand_gluestick_neutral5_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5",0,*GSNeutral5Raw,1,#H2H_DAMAGETYPE_BLUNT,5)
animationSetComboEnd(*GSNeutral5,#True)
animationSetFrameSound(*GSNeutral5,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSNeutral5,1,#H2H_SOUND_ID_GLUESTICK_GUNLIGHT)
animationSetFrameSound(*GSNeutral5,4,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameLength(*GSNeutral5,0,6)
animationSetFrameLength(*GSNeutral5,4,6)
animationSetFrameLength(*GSNeutral5,5,7)

*GSNeutral5_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral5_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind front",0,*GSNeutral5_1WindFrontRaw)
*GSNeutral5_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral5_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind front",0,*GSNeutral5_2WindFrontRaw)
animationSetFrameLength(*GSNeutral5_2WindFront,1,5)
animationSetFrameLength(*GSNeutral5_2WindFront,2,6)
animationSetFrameOpacity(*GSNeutral5_2WindFront,1,192)
animationSetFrameOpacity(*GSNeutral5_2WindFront,2,128)
*GSNeutral5_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral5_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 5 wind front",0,*GSNeutral5_5WindFrontRaw)
*GSNeutral5_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral5_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 6 wind front",0,*GSNeutral5_6WindFrontRaw)
*GSNeutral5_7WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral5_7WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 7 wind front",0,*GSNeutral5_7WindFrontRaw)
animationSetFrameLength(*GSNeutral5_7WindFront,1,6)
animationSetFrameLength(*GSNeutral5_7WindFront,2,7)
animationSetFrameOpacity(*GSNeutral5_7WindFront,1,192)
animationSetFrameOpacity(*GSNeutral5_7WindFront,2,128)
animationPrepareWind(*GSNeutral5,0)
*GSNeutral5\frontWind(0,0)=*GSNeutral5_1WindFront
*GSNeutral5\frontWind(1,0)=*GSNeutral5_2WindFront
*GSNeutral5\frontWind(4,0)=*GSNeutral5_5WindFront
*GSNeutral5\frontWind(5,0)=*GSNeutral5_6WindFront
*GSNeutral5\frontWind(6,0)=*GSNeutral5_7WindFront
animationFreeMovementWind(*GSNeutral5)

;------- Gatling 1, 2, 3, 4, 5 and 6
*GSGatling1.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling1_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 1",0,*GSGatling1Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
*GSGatling2.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling2_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 2",0,*GSGatling2Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
animationSetFrameMovement(*GSGatling2,0,-120)
*GSGatling3.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling3_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 3",0,*GSGatling3Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
*GSGatling4.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling4_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 4",0,*GSGatling4Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
*GSGatling5.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling5_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 5",0,*GSGatling5Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
*GSGatling6.animation=classGenerateAnimation(3,"image/hand_gluestick_gatling6_",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Gatling 6",0,*GSGatling6Raw,0,#H2H_DAMAGETYPE_PIERCE,2,2)
animationSetFrameMovement(*GSGatling4,0,-140)
animationSetFrameMovement(*GSGatling5,0,-110)
animationSetFrameMovement(*GSGatling6,0,-110)
animationSetFrameOpacity(*GSGatling1,2,192)
animationSetFrameOpacity(*GSGatling1,3,128)
animationSetFrameOpacity(*GSGatling2,2,192)
animationSetFrameOpacity(*GSGatling2,3,128)
animationSetFrameOpacity(*GSGatling3,2,192)
animationSetFrameOpacity(*GSGatling3,3,128)
animationSetFrameOpacity(*GSGatling4,2,192)
animationSetFrameOpacity(*GSGatling4,3,128)
animationSetFrameOpacity(*GSGatling5,2,192)
animationSetFrameOpacity(*GSGatling5,3,128)
animationSetFrameOpacity(*GSGatling6,2,192)
animationSetFrameOpacity(*GSGatling6,3,128)

Dim *GSNeutral4\projectiles(6,0)
*GSNeutral4\projectiles(3,0)=*GSGatling1
*GSNeutral4\projectiles(4,0)=*GSGatling2
*GSNeutral4\projectiles(5,0)=*GSGatling3
Dim *GSNeutral5\projectiles(6,0)
*GSNeutral5\projectiles(1,0)=*GSGatling4
*GSNeutral5\projectiles(2,0)=*GSGatling5
*GSNeutral5\projectiles(3,0)=*GSGatling6
For i=3 To 5
	animationSetFrameDamageCut(*GSNeutral4\projectiles(i,0),1)
	animationSetFrameLength(*GSNeutral4\projectiles(i,0),2,5)
	animationSetFrameLength(*GSNeutral4\projectiles(i,0),3,7)
	animationSetFrameDamageCut(*GSNeutral5\projectiles(i-2,0),1)
	animationSetFrameLength(*GSNeutral5\projectiles(i-2,0),2,5)
	animationSetFrameLength(*GSNeutral5\projectiles(i-2,0),3,7)
	For j=0 To 1
		animationSetFramePureProjectile(*GSNeutral4\projectiles(i,0),j)
		animationSetFramePureProjectile(*GSNeutral5\projectiles(i-2,0),j)
		animationSetFrameShake(*GSNeutral4\projectiles(i,0),j,3)
		animationSetFrameShake(*GSNeutral5\projectiles(i-2,0),j,3)
	Next
Next

;------- Neutral 6
*GSNeutral6.animation=classGenerateAnimation(3,"image/hand_gluestick_neutral6_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*GSNeutral6Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameSound(*GSNeutral6,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSNeutral6,2,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameLength(*GSNeutral6,0,4)
animationSetFrameLength(*GSNeutral6,3,15)
*GSNeutral6\frames(3)\damageDuration=6
; setFrameMovement(*GSNeutral6,0,100)
animationSetFrameMovement(*GSNeutral6,1,-100)
animationSetFrameMovement(*GSNeutral6,2,-100)
animationSetFrameMovement(*GSNeutral6,3,-50)
animationSetFrameCDN(*GSNeutral6,3,4)
animationPrepareWind(*GSNeutral6)

*GSNeutral6_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral6_2WindFront",5,0,"Gluestick neutral 6 2 wind front",0,*GSNeutral6_2WindFrontRaw)
*GSNeutral6_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_neutral6_3WindFront",5,0,"Gluestick neutral 6 3 wind front",0,*GSNeutral6_3WindFrontRaw)
*GSNeutral6_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_neutral6_4WindFront",5,0,"Gluestick neutral 6 4 wind front",0,*GSNeutral6_4WindFrontRaw)
; setFrameMovementDelta(*GSNeutral6_2WindFront,0,-10)
; setFrameMovementDelta(*GSNeutral6_3WindFront,0,-10)
animationSetFrameMovement(*GSNeutral6_4WindFront,0,-50)
animationSetFrameMovement(*GSNeutral6_4WindFront,1,-50)
animationSetFrameMovement(*GSNeutral6_4WindFront,2,-50)
animationSetFrameLength(*GSNeutral6_4WindFront,1,6)
animationSetFrameLength(*GSNeutral6_4WindFront,2,7)
animationSetFrameOpacity(*GSNeutral5_7WindFront,1,192)
animationSetFrameOpacity(*GSNeutral6_4WindFront,2,128)
animationFreeMovement(*GSNeutral6_4WindFront)

*GSNeutral6\frontWind(1,0)=*GSNeutral6_2WindFront
*GSNeutral6\frontWind(2,0)=*GSNeutral6_3WindFront
*GSNeutral6\frontWind(3,0)=*GSNeutral6_4WindFront

;------- Side 1
*GSSide1.animation=classGenerateAnimation(5,"image/hand_gluestick_side1_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*GSSide1Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
animationSetFrameSound(*GSSide1,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSSide1,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameMovement(*GSSide1,4,-100)
animationSetFrameMovement(*GSSide1,5,-50)
animationSetFrameDamage(*GSSide1,5,6)
; setFrameLength(*GSSide1,0,6)
animationSetFrameLength(*GSSide1,1,4)
animationSetFrameLength(*GSSide1,5,15)
animationSetFrameCDN(*GSSide1,5,5)
*GSSide1\frames(5)\damageDuration=5
animationSetFramePush(*GSSide1,3,-10)
animationSetFramePush(*GSSide1,4,-10)
animationSetFramePush(*GSSide1,5,-10)
animationSetFrameDamageDuration(*GSSide1,5,5)
animationGetNeutral(*GSSide1)=*GSNeutral3
animationPrepareWind(*GSSide1)

*GSSide1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_1WindFront",5,0,"Gluestick side 1 1 wind front",0,*GSSide1_1WindFrontRaw)
*GSSide1_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side1_2WindFront",4,0,"Gluestick side 1 2 wind front",0,*GSSide1_2WindFrontRaw)
animationSetFrameLength(*GSSide1_2WindFront,1,5)
animationSetFrameLength(*GSSide1_2WindFront,2,6)
animationSetFrameOpacity(*GSSide1_2WindFront,1,192)
animationSetFrameOpacity(*GSSide1_2WindFront,2,128)
*GSSide1_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_3WindFront",5,0,"Gluestick side 1 3 wind front",0,*GSSide1_3WindFrontRaw)
*GSSide1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_4WindFront",5,0,"Gluestick side 1 4 wind front",0,*GSSide1_4WindFrontRaw)
*GSSide1_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side1_5WindFront",5,0,"Gluestick side 1 5 wind front",0,*GSSide1_5WindFrontRaw)
*GSSide1_6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side1_6WindFront",5,0,"Gluestick side 1 6 wind front",0,*GSSide1_6WindFrontRaw)
animationSetFrameLength(*GSSide1_2WindFront,1,6)
animationSetFrameLength(*GSSide1_6WindFront,2,7)
animationSetFrameOpacity(*GSSide1_6WindFront,1,192)
animationSetFrameOpacity(*GSSide1_6WindFront,2,128)

*GSSide1\frontWind(0,0)=*GSSide1_1WindFront
*GSSide1\frontWind(1,0)=*GSSide1_2WindFront
*GSSide1\frontWind(2,0)=*GSSide1_3WindFront
*GSSide1\frontWind(3,0)=*GSSide1_4WindFront
*GSSide1\frontWind(4,0)=*GSSide1_5WindFront
*GSSide1\frontWind(5,0)=*GSSide1_6WindFront

animationFreeMovementWind(*GSSide1)

;------- Side 2
*GSSide2.animation=classGenerateAnimation(5,"image/hand_gluestick_side2_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*GSSide2Raw,17,#H2H_DAMAGETYPE_BLUNT,8)
animationSetFrameCDN(*GSSide2,5,3)
animationSetFrameShake(*GSSide2,4,14)
animationSetFrameSound(*GSSide2,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSSide2,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSSide2,4,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
frameSetNoRecSound(*GSSide2\frames(4))
animationSetFrameDamageDuration(*GSSide2,4,5)
animationSetFramePush(*GSSide2,4,-10,20)
animationSetFrameLength(*GSSide2,3,3)
animationSetFrameLength(*GSSide2,4,6)
animationSetFrameLength(*GSSide2,5,9) ; 12
animationSetFrameMovement(*GSSide2,4,-16,32) ; -32 64
animationSetUngrounded(*GSSide2,#True)
*GSSide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind front",0,*GSSide2_1WindFrontRaw)
*GSSide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind front",0,*GSSide2_2WindFrontRaw)
*GSSide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind front",0,*GSSide2_3WindFrontRaw)
*GSSide2_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side2_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front",0,*GSSide2_4WindFrontRaw)
*GSSide2_5WindFront.animation=classGenerateAnimation(4,"image/hand_gluestick_side2_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 5 wind front",0,*GSSide2_5WindFrontRaw)
animationSetFrameLength(*GSSide2_5WindFront,1,5)
animationSetFrameLength(*GSSide2_5WindFront,2,6)
animationSetFrameLength(*GSSide2_5WindFront,3,7)
animationSetFrameLength(*GSSide2_5WindFront,4,8)
animationSetFrameOpacity(*GSSide2_5WindFront,2,192)
animationSetFrameOpacity(*GSSide2_5WindFront,3,128)
animationSetFrameOpacity(*GSSide2_5WindFront,4,64)
*GSSide2_5WindBack.animation=classGenerateAnimation(3,"image/hand_gluestick_side2_5WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 5 wind back",0,*GSSide2_5WindBackRaw)
animationSetFrameLength(*GSSide2_5WindBack,1,4)
animationSetFrameLength(*GSSide2_5WindBack,2,5)
animationSetFrameLength(*GSSide2_5WindBack,3,6)
animationSetFrameOpacity(*GSSide2_5WindBack,1,192)
animationSetFrameOpacity(*GSSide2_5WindBack,2,128)
animationSetFrameOpacity(*GSSide2_5WindBack,3,64)
animationFreeMovement(*GSSide2_5WindFront)
animationFreeMovement(*GSSide2_5WindBack)

animationPrepareWind(*GSSide2)
*GSSide2\frontWind(0,0)=*GSSide2_1WindFront
*GSSide2\frontWind(1,0)=*GSSide2_2WindFront
*GSSide2\frontWind(2,0)=*GSSide2_3WindFront
*GSSide2\frontWind(3,0)=*GSSide2_4WindFront
*GSSide2\frontWind(4,0)=*GSSide2_5WindFront
*GSSide2\backWind(4,0)=*GSSide2_5WindBack

animationGetSide(*GSSide1)=*GSSide2

;-------- Shockwave 3
*GSShockwave3.animation=classGenerateAnimation(3,"image/hand_gluestick_shockwave3_",3,#H2H_ANIMATIONTYPE_NSIDE,"Shockwave 3",0,*GSShockwave3Raw,0,#H2H_DAMAGETYPE_BLUNT,3,1)
For i=0 To 3
	animationSetFramePureProjectile(*GSShockwave3,0)
	animationSetFrameLength(*GSShockwave3,i,i/2+2)
Next

Dim *GSSide2\projectiles(5,0)
*GSSide2\projectiles(4,0)=*GSShockwave3
animationSetFrameOpacity(*GSShockwave3,2,192)
animationSetFrameOpacity(*GSShockwave3,3,128)

;------- Side 3
*GSSide3.animation=classGenerateAnimation(5,"image/hand_gluestick_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3",0,*GSSide3Raw,20,#H2H_DAMAGETYPE_BLUNT,9)
animationSetComboEnd(*GSSide3,#True)
animationSetFrameMovement(*GSSide3,0,25,-15)
animationSetFrameMovement(*GSSide3,1,50,-15)
animationSetFrameMovement(*GSSide3,2,25,10)
animationSetFrameMovement(*GSSide3,3,-100,10)
animationSetFrameMovement(*GSSide3,4,-75,10)
animationSetFrameMovement(*GSSide3,5,-75)
animationSetFrameSound(*GSSide3,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSSide3,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameLength(*GSSide3,0,4)
; setFrameLength(*GSSide3,1,5)
; setFrameLength(*GSSide3,2,6)
animationSetFrameLength(*GSSide3,5,12)
animationSetFrameDamageDuration(*GSSide3,5,6)
animationSetFrameCDN(*GSSide3,5,6)
animationSetFramePush(*GSSide3,3,-10)
animationSetFramePush(*GSSide3,4,-10)
animationSetFramePush(*GSSide3,5,-10)

*GSSide3_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side3_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 1 wind front",0,*GSSide3_1WindFrontRaw)
*GSSide3_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side3_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 2 wind front",0,*GSSide3_2WindFrontRaw)
*GSSide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side3_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 3 wind front",0,*GSSide3_3WindFrontRaw)
*GSSide3_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side3_4WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 4 wind front",0,*GSSide3_4WindFrontRaw)
*GSSide3_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side3_5WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 5 wind front",0,*GSSide3_5WindFrontRaw)
*GSSide3_6WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_side3_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 6 wind front",0,*GSSide3_6WindFrontRaw)
For i=1 To 3
	animationSetFrameLength(*GSSide3_6WindFront,i,4+i)
Next
animationSetFrameOpacity(*GSSide3_6WindFront,1,192)
animationSetFrameOpacity(*GSSide3_6WindFront,2,128)
animationSetFrameOpacity(*GSSide3_6WindFront,3,64)

animationPrepareWind(*GSSide3,0)
*GSSide3\frontWind(0,0)=*GSSide3_1WindFront
*GSSide3\frontWind(1,0)=*GSSide3_2WindFront
*GSSide3\frontWind(2,0)=*GSSide3_3WindFront
*GSSide3\frontWind(3,0)=*GSSide3_4WindFront
*GSSide3\frontWind(4,0)=*GSSide3_5WindFront
*GSSide3\frontWind(5,0)=*GSSide3_6WindFront
animationFreeMovementWind(*GSSide3)
animationGetSide(*GSSide2)=*GSSide3

;------- Side 4
*GSSide4.animation=classGenerateAnimation(6,"image/hand_gluestick_side4_",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*GSSide4Raw,1,#H2H_DAMAGETYPE_PIERCE)
animationSetUngrounded(*GSSide4)
animationSetComboEnd(*GSSide4,#True)
animationSetFrameLength(*GSSide4,0,4)
animationSetFrameLength(*GSSide4,1,5)
animationSetFrameLength(*GSSide4,2,5)
animationSetFrameLength(*GSSide4,6,10)
animationSetFrameSound(*GSSide4,1,#H2H_SOUND_ID_WOODBLUNTBLOCK)
animationSetFrameSound(*GSSide4,2,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
For i=2 To 5
	animationSetFrameShake(*GSSide4,i,8)
Next
animationSetFrameCDN(*GSSide4,6,5)

*GSSide4_1WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side4_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind front",0,*GSSide4_1WindFrontRaw)
animationSetFrameLength(*GSSide4_1WindFront,1,6)
animationSetFrameLength(*GSSide4_1WindFront,2,7)
animationSetFrameOpacity(*GSSide4_1WindFront,1,192)
animationSetFrameOpacity(*GSSide4_1WindFront,2,128)
*GSSide4_7WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side4_7WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 7 wind front",0,*GSSide4_7WindFrontRaw)
animationSetFrameLength(*GSSide4_7WindFront,1,6)
animationSetFrameLength(*GSSide4_7WindFront,2,7)
animationSetFrameOpacity(*GSSide4_7WindFront,1,192)
animationSetFrameOpacity(*GSSide4_7WindFront,2,128)

*GSSide4_1WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_side4_1WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind back",0,*GSSide4_1WindBackRaw)
animationSetFrameLength(*GSSide4_1WindBack,1,7)
animationSetFrameOpacity(*GSSide4_1WindBack,1,192)

animationPrepareWind(*GSSide4,0)
*GSSide4\frontWind(0,0)=*GSSide4_1WindFront
*GSSide4\frontWind(6,0)=*GSSide4_7WindFront
*GSSide4\backWind(0,0)=*GSSide4_1WindBack
animationFreeMovementWind(*GSSide4)

;------- Shot 5 6 7 8
*GSShot5.animation=classGenerateAnimation(2,"image/hand_gluestick_shot5_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 1",0,*GSShot5Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
animationSetFramePureProjectile(*GSShot5,0)
animationSetFrameSound(*GSShot5,0,#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
animationSetFrameLength(*GSShot5,0,3)
animationSetFrameMovement(*GSShot5,0,-200)
animationSetFrameOpacity(*GSShot5,1,192)
animationSetFrameOpacity(*GSShot5,2,128)

*GSShot6.animation=classGenerateAnimation(2,"image/hand_gluestick_shot6_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 2",0,*GSShot6Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
animationSetFramePureProjectile(*GSShot6,0)
animationSetFrameSound(*GSShot6,0,#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
animationSetFrameLength(*GSShot6,0,3)
animationSetFrameMovement(*GSShot6,0,-165)
animationSetFrameOpacity(*GSShot6,1,192)
animationSetFrameOpacity(*GSShot6,2,128)

*GSShot7.animation=classGenerateAnimation(2,"image/hand_gluestick_shot7_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 3",0,*GSShot7Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
animationSetFrameSound(*GSShot7,0,#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
animationSetFrameLength(*GSShot7,0,3)
animationSetFramePureProjectile(*GSShot7,0)
animationSetFrameMovement(*GSShot7,0,-145)
animationSetFrameOpacity(*GSShot7,1,192)
animationSetFrameOpacity(*GSShot7,2,128)

*GSShot8.animation=classGenerateAnimation(2,"image/hand_gluestick_shot8_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 4",0,*GSShot8Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
animationSetFrameSound(*GSShot8,0,#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
animationSetFrameLength(*GSShot8,0,3)
animationSetFramePureProjectile(*GSShot8,0)
animationSetFrameMovement(*GSShot8,0,-125)
animationSetFrameOpacity(*GSShot8,1,192)
animationSetFrameOpacity(*GSShot8,2,128)

Dim *GSSide4\projectiles(7,0)
*GSSide4\projectiles(2,0)=*GSShot5
*GSSide4\projectiles(3,0)=*GSShot6
*GSSide4\projectiles(4,0)=*GSShot7
*GSSide4\projectiles(5,0)=*GSShot8

For i=2 To 5
	animationSetFrameShake(*GSSide4\projectiles(i,0),0,3)
	animationSetFrameLength(*GSSide4\projectiles(i,0),0,3)
	animationSetFrameLength(*GSSide4\projectiles(i,0),2,8)
Next

;------- Side 5
*GSSide5.animation=classGenerateAnimation(5,"image/hand_gluestick_side5_",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5",0,*GSSide5Raw,20,#H2H_DAMAGETYPE_BLUNT,10)
animationSetFrameSound(*GSSide5,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSSide5,2,#H2H_SOUND_ID_WOODBLUNTBLOCK)
animationSetFrameSound(*GSSide5,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*GSSide5,5,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameMovement(*GSSide5,0,-25)
animationSetFrameMovement(*GSSide5,1,-25,-5)
animationSetFrameMovement(*GSSide5,2,-25,-10)
animationSetFrameMovement(*GSSide5,3,-125,-20)
animationSetFrameMovement(*GSSide5,4,-125,20)
animationSetFrameMovement(*GSSide5,5,-50,15)
animationSetFrameLength(*GSSide5,0,4)
animationSetFrameLength(*GSSide5,1,5)
animationSetFrameLength(*GSSide5,2,5)
animationSetFrameLength(*GSSide5,3,7)
animationSetFrameLength(*GSSide5,4,10)
animationSetFrameLength(*GSSide5,5,10)
*GSSide5\frames(4)\damageDuration=5
animationSetFrameCDN(*GSSide5,5,5)
animationPrepareWind(*GSSide5)
animationGetSide(*GSNeutral6)=*GSSide5
animationSetComboEnd(*GSSide5,1)

*GSSide5_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side5_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 5 1 wind front",0,*GSSide5_1WindFrontRaw)
*GSSide5_2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_side5_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 5 2 wind front",0,*GSSide5_2WindFrontRaw)
animationSetFrameLength(*GSSide5_2WindFront,1,7)
animationSetFrameOpacity(*GSSide5_2WindFront,1,192)
*GSSide5_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side5_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 5 3 wind front",0,*GSSide5_3WindFrontRaw)
animationSetFrameLength(*GSSide5_3WindFront,1,7)
animationSetFrameLength(*GSSide5_3WindFront,2,8)
animationSetFrameOpacity(*GSSide5_3WindFront,1,192)
animationSetFrameOpacity(*GSSide5_3WindFront,2,128)
*GSSide5_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side5_4WindFront",7,#H2H_ANIMATIONTYPE_NSIDE,"side 5 4 wind front",0,*GSSide5_4WindFrontRaw)
*GSSide5_5WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_side5_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 5 5 wind front",0,*GSSide5_5WindFrontRaw)
animationSetFrameLength(*GSSide5_5WindFront,1,6)
animationSetFrameLength(*GSSide5_5WindFront,2,7)
animationSetFrameLength(*GSSide5_5WindFront,3,8)
animationSetFrameOpacity(*GSSide5_5WindFront,1,192)
animationSetFrameOpacity(*GSSide5_5WindFront,2,128)
animationSetFrameOpacity(*GSSide5_5WindFront,3,64)
*GSSide5_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_side5_6WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 5 1 wind back",0,*GSSide5_6WindBackRaw)
animationSetFrameLength(*GSSide5_6WindBack,1,7)
animationSetFrameOpacity(*GSSide5_6WindBack,1,192)

*GSSide5\frontWind(0,0)=*GSSide5_1WindFront
*GSSide5\frontWind(1,0)=*GSSide5_2WindFront
*GSSide5\frontWind(2,0)=*GSSide5_3WindFront
*GSSide5\frontWind(3,0)=*GSSide5_4WindFront
*GSSide5\frontWind(4,0)=*GSSide5_5WindFront
*GSSide5\backWind(5,0)=*GSSide5_6WindBack

animationFreeMovementWind(*GSSide5)

;------- Side 6
*GSSide6.animation=classGenerateAnimation(8,"image/hand_gluestick_side6_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6",0,*GSSide6Raw,1,#H2H_DAMAGETYPE_BLUNT,6)
animationSetUngrounded(*GSSide6)
animationSetComboEnd(*GSSide6,#True)
*GSSide6\frames(2)\damageSide=1
animationSetFrameSound(*GSSide6,1,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
animationSetFrameSound(*GSSide6,2,#H2H_SOUND_ID_GLUESTICK_BLUNTBLOCK)
animationSetFrameSound(*GSSide6,4,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
animationFrameDisableSoundRec(*GSSide6,4)
animationSetFrameSound(*GSSide6,5,#H2H_SOUND_ID_GLUESTICK_BLUNTBLOCK)
animationFrameDisableSoundRec(*GSSide6,5)
animationSetFrameSound(*GSSide6,7,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameMovement(*GSSide6,0,77,-22)
animationSetFrameMovement(*GSSide6,1,90)
animationSetFrameMovement(*GSSide6,2,-120)
animationSetFrameMovement(*GSSide6,3,-66,10)
animationSetFrameMovement(*GSSide6,4,-52,7)
animationSetFrameMovement(*GSSide6,5,-10)
animationSetFrameMovement(*GSSide6,6,40)
animationSetFrameMovement(*GSSide6,7,150)
animationSetFrameMovement(*GSSide6,8,40)
animationSetFrameLength(*GSSide6,1,7)
animationSetFrameLength(*GSSide6,2,3)
animationSetFrameLength(*GSSide6,3,4)
animationSetFrameLength(*GSSide6,4,4)
animationSetFrameLength(*GSSide6,6,12)
animationSetFrameDamageDuration(*GSSide6,6,5)
animationSetFrameLength(*GSSide6,7,6)
animationSetFrameLength(*GSSide6,8,7)
animationSetFrameDamageCut(*GSSide6,5)

*GSSide6_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_side6_1WindFront",7,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 1 wind front",0,*GSSide6_1WindFrontRaw)
*GSSide6_2WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_side6_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 2 wind front",0,*GSSide6_2WindFrontRaw)
animationSetFrameLength(*GSSide6_2WindFront,1,5)
animationSetFrameLength(*GSSide6_2WindFront,2,6)
animationSetFrameLength(*GSSide6_2WindFront,3,7)
animationSetFrameOpacity(*GSSide6_2WindFront,1,192)
animationSetFrameOpacity(*GSSide6_2WindFront,2,128)
animationSetFrameOpacity(*GSSide6_2WindFront,3,64)
*GSSide6_3WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_side6_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 3 wind front",0,*GSSide6_3WindFrontRaw)
animationSetFrameLength(*GSSide6_3WindFront,1,4)
animationSetFrameLength(*GSSide6_3WindFront,2,5)
animationSetFrameLength(*GSSide6_3WindFront,3,6)
animationSetFrameOpacity(*GSSide6_3WindFront,1,192)
animationSetFrameOpacity(*GSSide6_3WindFront,2,128)
animationSetFrameOpacity(*GSSide6_3WindFront,3,64)
*GSSide6_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side6_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 4 wind front",0,*GSSide6_4WindFrontRaw)
animationSetFrameLength(*GSSide6_4WindFront,1,5)
animationSetFrameLength(*GSSide6_4WindFront,2,6)
animationSetFrameOpacity(*GSSide6_4WindFront,1,192)
animationSetFrameOpacity(*GSSide6_4WindFront,2,128)
*GSSide6_5WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side6_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 5 wind front",0,*GSSide6_5WindFrontRaw)
animationSetFrameLength(*GSSide6_5WindFront,1,5)
animationSetFrameLength(*GSSide6_5WindFront,2,6)
animationSetFrameOpacity(*GSSide6_5WindFront,1,192)
animationSetFrameOpacity(*GSSide6_5WindFront,2,128)
*GSSide6_8WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_side6_8WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 8 wind front",0,*GSSide6_8WindFrontRaw)
animationSetFrameLength(*GSSide6_8WindFront,1,6)
animationSetFrameOpacity(*GSSide6_8WindFront,1,192)
*GSSide6_9WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_side6_9WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 9 wind front",0,*GSSide6_9WindFrontRaw)
animationSetFrameLength(*GSSide6_9WindFront,1,6)
animationSetFrameLength(*GSSide6_9WindFront,2,7)
animationSetFrameOpacity(*GSSide6_9WindFront,1,192)
animationSetFrameOpacity(*GSSide6_9WindFront,2,128)

*GSSide6_7WindBack.animation=classGenerateAnimation(4,"image/hand_gluestick_side6_7WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 7 wind back",0,*GSSide6_7WindBackRaw)
animationSetFrameLength(*GSSide6_7WindBack,1,5)
animationSetFrameLength(*GSSide6_7WindBack,2,6)
animationSetFrameLength(*GSSide6_7WindBack,3,7)
animationSetFrameLength(*GSSide6_7WindBack,4,8)
animationSetFrameOpacity(*GSSide6_7WindBack,2,192)
animationSetFrameOpacity(*GSSide6_7WindBack,3,128)
animationSetFrameOpacity(*GSSide6_7WindBack,4,64)
*GSSide6_8WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_side6_8WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 8 wind back",0,*GSSide6_8WindBackRaw)
*GSSide6_9WindBack.animation=classGenerateAnimation(3,"image/hand_gluestick_side6_9WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 6 9 wind back",0,*GSSide6_9WindBackRaw)
animationSetFrameLength(*GSSide6_9WindBack,1,5)
animationSetFrameLength(*GSSide6_9WindBack,2,6)
animationSetFrameLength(*GSSide6_9WindBack,3,7)
animationSetFrameOpacity(*GSSide6_9WindBack,1,192)
animationSetFrameOpacity(*GSSide6_9WindBack,2,128)
animationSetFrameOpacity(*GSSide6_9WindBack,3,64)

animationPrepareWind(*GSSide6,0)
*GSSide6\frontWind(0,0)=*GSSide6_1WindFront
*GSSide6\frontWind(1,0)=*GSSide6_2WindFront
*GSSide6\frontWind(2,0)=*GSSide6_3WindFront
*GSSide6\frontWind(3,0)=*GSSide6_4WindFront
*GSSide6\frontWind(4,0)=*GSSide6_5WindFront
*GSSide6\frontWind(7,0)=*GSSide6_8WindFront
*GSSide6\frontWind(8,0)=*GSSide6_9WindFront
*GSSide6\backWind(6,0)=*GSSide6_7WindBack
*GSSide6\backWind(7,0)=*GSSide6_8WindBack
*GSSide6\backWind(8,0)=*GSSide6_9WindBack
animationFreeMovementWind(*GSSide6)

*GSExplosion7.animation=classGenerateAnimation(5,"image/hand_gluestick_explosion7_",3,#H2H_ANIMATIONTYPE_NSIDE,"Explosion 7",0,*GSExplosion7Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
animationSetFrameLength(*GSExplosion7,1,4)
animationSetFrameLength(*GSExplosion7,2,5)
animationSetFrameLength(*GSExplosion7,3,6)
animationSetFrameLength(*GSExplosion7,4,7)
animationSetFrameLength(*GSExplosion7,5,8)
animationSetFrameSound(*GSExplosion7,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
animationSetFramePureProjectile(*GSExplosion7,0)
animationSetFramePureProjectile(*GSExplosion7,1)
animationSetFramePureProjectile(*GSExplosion7,2)
animationSetFrameOpacity(*GSExplosion7,3,192)
animationSetFrameOpacity(*GSExplosion7,4,128)
animationSetFrameOpacity(*GSExplosion7,5,64)

Dim *GSSide6\projectiles(8,0)
*GSSide6\projectiles(5,0)=*GSExplosion7

;------- Back 1
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

animationSetFrameLength(*GSBack1,0,3)
animationSetFrameLength(*GSBack1,1,3)
animationSetFrameLength(*GSBack1,2,4)
animationSetFrameLength(*GSBack1,4,6)
animationSetFrameLength(*GSBack1,7,8)
animationSetFrameLength(*GSBack1,8,8)
animationSetFrameLength(*GSBack1,9,30)

animationSetFrameMovement(*GSBack1,0,-25)
animationSetFrameMovement(*GSBack1,1,-25)
animationSetFrameMovement(*GSBack1,2,-25)
animationSetFrameMovement(*GSBack1,3,60,-40)
animationSetFrameMovement(*GSBack1,4,70,-30)
animationSetFrameMovement(*GSBack1,5,80,-20)
animationSetFrameMovement(*GSBack1,6,80,45)
animationSetFrameMovement(*GSBack1,7,40,45)
animationSetFrameMovement(*GSBack1,8,40)
animationSetFrameMovementDelta(*GSBack1,8,5)

animationSetFrameSound(*GSBack1,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSBack1,7,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameCDN(*GSBack1,9,1)
animationSetFrameCanMove(*GSBack1,9,15)
animationSetFrameShake(*GSBack1,7,10)
animationPrepareWind(*GSBack1)

*GSBack1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 1 wind front",0,*GSBack1_1WindFrontRaw)
*GSBack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_2WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*GSBack1_2WindFrontRaw)
*GSBack1_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_back1_3WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*GSBack1_3WindFrontRaw)
animationSetFrameLength(*GSBack1_3WindFront,1,4)
animationSetFrameLength(*GSBack1_3WindFront,2,5)
animationSetFrameOpacity(*GSBack1_3WindFront,1,192)
animationSetFrameOpacity(*GSBack1_3WindFront,2,128)
*GSBack1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_4WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*GSBack1_4WindFrontRaw)
*GSBack1_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_5WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 wind front",0,*GSBack1_5WindFrontRaw)
*GSBack1_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_6WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind front",0,*GSBack1_6WindFrontRaw)
*GSBack1_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_7WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 wind front",0,*GSBack1_7WindFrontRaw)
*GSBack1_8WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_back1_8WindFront",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 wind front",0,*GSBack1_8WindFrontRaw)
*GSBack1_9WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_back1_9WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 wind front",0,*GSBack1_9WindFrontRaw)
animationSetFrameLength(*GSBack1_9WindFront,1,5)
animationSetFrameLength(*GSBack1_9WindFront,2,6)
animationSetFrameLength(*GSBack1_9WindFront,3,7)
animationSetFrameOpacity(*GSBack1_9WindFront,1,192)
animationSetFrameOpacity(*GSBack1_9WindFront,2,128)
animationSetFrameOpacity(*GSBack1_9WindFront,3,64)
animationFreeMovement(*GSBack1_8WindFront)
animationFreeMovement(*GSBack1_9WindFront)

*GSBack1_4WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_back1_4WindBack",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind back",0,*GSBack1_4WindBackRaw)
animationFreeMovement(*GSBack1_4WindBack)
animationSetFrameLength(*GSBack1_4WindBack,1,12)
animationSetFrameLength(*GSBack1_4WindBack,2,16)
animationSetFrameMovementDelta(*GSBack1_4WindBack,0,0,-0.2)
animationSetFrameMovementDelta(*GSBack1_4WindBack,1,0,-0.4)
animationSetFrameMovementDelta(*GSBack1_4WindBack,2,0,-0.6)
*GSBack1_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_back1_6WindBack",8,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind back",0,*GSBack1_6WindBackRaw)
animationFreeMovement(*GSBack1_6WindBack)
animationSetFrameLength(*GSBack1_6WindBack,1,20)
animationSetFrameMovementDelta(*GSBack1_6WindBack,0,0,-0.2)
animationSetFrameMovementDelta(*GSBack1_6WindBack,1,0,-0.4)
animationSetFrameOpacity(*GSBack1_6WindBack,1,192)

*GSBack1\frontWind(0,0)=*GSBack1_1WindFront
*GSBack1\frontWind(1,0)=*GSBack1_2WindFront
*GSBack1\frontWind(2,0)=*GSBack1_3WindFront
*GSBack1\frontWind(3,0)=*GSBack1_4WindFront
*GSBack1\frontWind(4,0)=*GSBack1_5WindFront
*GSBack1\frontWind(5,0)=*GSBack1_6WindFront
*GSBack1\frontWind(6,0)=*GSBack1_7WindFront
*GSBack1\frontWind(7,0)=*GSBack1_8WindFront
*GSBack1\frontWind(8,0)=*GSBack1_9WindFront

*GSBack1\backWind(3,0)=*GSBack1_4WindBack
*GSBack1\backWind(4,0)=*GSBack1_4WindBack
*GSBack1\backWind(5,0)=*GSBack1_6WindBack
*GSBack1\backWind(6,0)=*GSBack1_6WindBack

animationGetNeutral(*GSBack1)=*GSNeutral6

;------- Explosion 1
*GSExplosion1.animation=classGenerateAnimation(6,"image/hand_gluestick_explosion1_",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 explosion",0,*GSExplosion1Raw,0,#H2H_DAMAGETYPE_PIERCE,7,2)
animationSetFrameSound(*GSExplosion1,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
For i=0 To 3
	animationSetFramePureProjectile(*GSExplosion1,i)
Next
For i=0 To 6
	animationSetFrameLength(*GSExplosion1,i,1+i)
Next
animationSetFrameShake(*GSExplosion1,0,20)
animationSetFrameOpacity(*GSExplosion1,4,192)
animationSetFrameOpacity(*GSExplosion1,5,128)
animationSetFrameOpacity(*GSExplosion1,6,64)

Dim *GSBack1\projectiles(9,0)
*GSBack1\projectiles(3,0)=*GSExplosion1

;------- Back 2
*GSBack2.animation=classGenerateAnimation(5,"image/hand_gluestick_back2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2",0,*GSBack2Raw,15,#H2H_DAMAGETYPE_PIERCE,5)
animationSetComboEnd(*GSBack2,#True)
ReDim *GSBack2\frames(6)
*GSBack2\frames(6)=*GSBack2\frames(5)
*GSBack2\frames(5)=*GSBack2\frames(4)
*GSBack2\frames(4)=*GSBack2\frames(3)
*GSBack2\frames(3)=*GSBack2\frames(2)
*GSBack2\frames(2)=*GSBack2\frames(1)
*GSBack2\frames(1)=frameDataGive()
frameCopy(*GSBack2\frames(1),*GSBack2\frames(0),#True)
animationSetFrameMovement(*GSBack2,0,-15,15)
animationSetFrameMovement(*GSBack2,1,70,-45)
animationSetFrameMovement(*GSBack2,2,100,-60)
animationSetFrameMovement(*GSBack2,3,64,45)
animationSetFrameMovement(*GSBack2,4,80,45)
animationSetFrameMovementDelta(*GSBack2,5,15)
animationSetFrameMovementDelta(*GSBack2,6,7.5)
animationSetFrameSound(*GSBack2,5,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameShake(*GSBack2,5,10)
animationSetFrameLength(*GSBack2,0,4)
animationSetFrameLength(*GSBack2,5,6)
animationSetFrameLength(*GSBack2,6,10)
animationSetFrameCanMove(*GSBack2,6,5)
animationSetFrameCDN(*GSBack2,6,5)

*GSBack2_1WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_back2_1WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 1 wind front",0,*GSBack2_1WindFrontRaw)
*GSBack2_2WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_back2_2WindFront1_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front 1",0,*GSBack2_2WindFront1Raw)
animationFreeMovement(*GSBack2_2WindFront1)
*GSBack2_2WindFront2.animation=classGenerateAnimation(2,"image/hand_gluestick_back2_2WindFront2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 2 wind front 2",0,*GSBack2_2WindFront2Raw)
animationFreeMovement(*GSBack2_2WindFront2)
animationSetFrameLength(*GSBack2_2WindFront2,1,7)
animationSetFrameLength(*GSBack2_2WindFront2,2,9)
animationSetFrameOpacity(*GSBack2_2WindFront2,1,192)
animationSetFrameOpacity(*GSBack2_2WindFront2,2,128)
*GSBack2_3WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_back2_3WindFront1_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 3 wind front 1",0,*GSBack2_3WindFront1Raw)
animationFreeMovement(*GSBack2_3WindFront1)
*GSBack2_3WindFront2.animation=classGenerateAnimation(2,"image/hand_gluestick_back2_3WindFront2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 3 wind front 2",0,*GSBack2_3WindFront2Raw)
animationSetFrameLength(*GSBack2_3WindFront2,1,7)
animationSetFrameLength(*GSBack2_3WindFront2,2,9)
animationSetFrameOpacity(*GSBack2_3WindFront2,1,192)
animationSetFrameOpacity(*GSBack2_3WindFront2,2,128)
animationFreeMovement(*GSBack2_3WindFront2)
*GSBack2_4WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_back2_4WindFront1_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 4 wind front 1",0,*GSBack2_4WindFront1Raw)
animationFreeMovement(*GSBack2_4WindFront1)
*GSBack2_4WindFront2.animation=classGenerateAnimation(1,"image/hand_gluestick_back2_4WindFront2_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 4 wind front 2",0,*GSBack2_4WindFront2Raw)
animationSetFrameLength(*GSBack2_4WindFront2,1,7)
animationFreeMovement(*GSBack2_4WindFront2)
*GSBack2_5WindFront1.animation=classGenerateAnimation(2,"image/hand_gluestick_back2_5WindFront1_",5,#H2H_ANIMATIONTYPE_NBACK,"Back 2 5 wind front 1",0,*GSBack2_5WindFront1Raw)
*GSBack2_5WindFront2.animation=classGenerateAnimation(2,"image/hand_gluestick_back2_5WindFront2_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 5 wind front 2",0,*GSBack2_5WindFront2Raw)
animationFreeMovement(*GSBack2_5WindFront2)
animationSetFrameLength(*GSBack2_5WindFront2,1,5)
animationSetFrameLength(*GSBack2_5WindFront2,2,6)
animationSetFrameOpacity(*GSBack2_5WindFront2,1,192)
animationSetFrameOpacity(*GSBack2_5WindFront2,2,128)
*GSBack2_6WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_back2_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 2 6 wind front",0,*GSBack2_6WindFrontRaw)
animationFreeMovement(*GSBack2_6WindFront)
animationSetFrameOpacity(*GSBack2_6WindFront,1,192)
animationSetFrameLength(*GSBack2_6WindFront,1,5)

animationPrepareWind(*GSBack2,1)
*GSBack2\frontWind(0,0)=*GSBack2_1WindFront
*GSBack2\frontWind(2,0)=*GSBack2_2WindFront1
*GSBack2\frontWind(2,1)=*GSBack2_2WindFront2
*GSBack2\frontWind(3,0)=*GSBack2_3WindFront1
*GSBack2\frontWind(3,1)=*GSBack2_3WindFront2
*GSBack2\frontWind(4,0)=*GSBack2_4WindFront1
*GSBack2\frontWind(4,1)=*GSBack2_4WindFront2
*GSBack2\frontWind(5,0)=*GSBack2_5WindFront1
*GSBack2\frontWind(5,1)=*GSBack2_5WindFront2
*GSBack2\frontWind(6,0)=*GSBack2_6WindFront

animationGetBack(*GSNeutral3)=*GSBack2

;------- Explosion 3
*GSExplosion3.animation=classGenerateAnimation(5,"image/hand_gluestick_explosion3_",4,#H2H_ANIMATIONTYPE_NBACK,"Explosion 3",0,*GSExplosion3Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
animationSetFramePureProjectile(*GSExplosion3,1)
animationSetFramePureProjectile(*GSExplosion3,2)
animationSetFramePureProjectile(*GSExplosion3,3)
animationSetFrameShake(*GSExplosion3,0,20)
animationSetFrameSound(*GSExplosion3,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
animationSetFrameLength(*GSExplosion3,0,2)
animationSetFrameLength(*GSExplosion3,1,3)
animationSetFrameLength(*GSExplosion3,2,4)
animationSetFrameLength(*GSExplosion3,3,5)
animationSetFrameLength(*GSExplosion3,4,6)
animationSetFrameLength(*GSExplosion3,5,7)
animationSetFrameOpacity(*GSExplosion3,3,192)
animationSetFrameOpacity(*GSExplosion3,4,128)
animationSetFrameOpacity(*GSExplosion3,5,64)

Dim *GSBack2\projectiles(6,0)
*GSBack2\projectiles(1,0)=*GSExplosion3

;------- Down 1
*GSDown1.animation=classGenerateAnimation(7,"image/hand_gluestick_down1_",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*GSDown1Raw,30,#H2H_DAMAGETYPE_BLUNT,11)
animationSetFrameCDN(*GSDown1,7,2)
animationSetFrameShake(*GSDown1,3,30)
animationSetFrameShake(*GSDown1,7,10)
animationSetFrameSound(*GSDown1,0,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSDown1,3,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSDown1,4,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
animationFrameDisableSoundRec(*GSDown1,4)
animationSetFrameSound(*GSDown1,7,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameStun(*GSDown1,3,15)
animationSetFrameStun(*GSDown1,4,20)
animationSetFramePush(*GSDown1,4,0,20)
animationSetFramePush(*GSDown1,5,0,20)
animationSetFrameMovement(*GSDown1,0,-40,-45)	; -60
animationSetFrameMovement(*GSDown1,1,-40,-130)	; -160
animationSetFrameMovement(*GSDown1,2,-20,-30)	; -200
animationSetFrameMovement(*GSDown1,3,30,50)		; -135
animationSetFrameMovement(*GSDown1,4,80,100)		;   15
animationSetFrameMovement(*GSDown1,5,-91,-127)	; -112
animationSetFrameMovement(*GSDown1,6,40,120)		;    8
animationSetFrameMovement(*GSDown1,7,-30,95)		;  103
animationSetFrameLength(*GSDown1,0,4)
animationSetFrameLength(*GSDown1,1,5)
animationSetFrameLength(*GSDown1,2,8)
animationSetFrameLength(*GSDown1,3,5)
animationSetFrameLength(*GSDown1,4,5)
animationSetFrameLength(*GSDown1,5,8)
animationSetFrameLength(*GSDown1,6,4)
animationSetFrameLength(*GSDown1,7,10)

*GSDown1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down1_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind front",0,*GSDown1_1WindFrontRaw)
*GSDown1_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down1_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*GSDown1_2WindFrontRaw)
*GSDown1_3WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_down1_3WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*GSDown1_3WindFrontRaw)
animationSetFrameLength(*GSDown1_3WindFront,1,6)
animationSetFrameLength(*GSDown1_3WindFront,2,7)
animationSetFrameLength(*GSDown1_3WindFront,3,8)
animationSetFrameOpacity(*GSDown1_3WindFront,1,192)
animationSetFrameOpacity(*GSDown1_3WindFront,2,128)
animationSetFrameOpacity(*GSDown1_3WindFront,3,64)
*GSDown1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down1_4WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 4 wind front",0,*GSDown1_4WindFrontRaw)
*GSDown1_5WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_down1_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind front",0,*GSDown1_5WindFrontRaw)
animationSetFrameLength(*GSDown1_5WindFront,1,6)
animationSetFrameLength(*GSDown1_5WindFront,2,7)
animationSetFrameLength(*GSDown1_5WindFront,3,8)
animationSetFrameOpacity(*GSDown1_5WindFront,1,192)
animationSetFrameOpacity(*GSDown1_5WindFront,2,128)
animationSetFrameOpacity(*GSDown1_5WindFront,3,64)
*GSDown1_6WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_down1_6WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind front",0,*GSDown1_6WindFrontRaw)
animationSetFrameLength(*GSDown1_6WindFront,1,6)
animationSetFrameLength(*GSDown1_6WindFront,2,7)
animationSetFrameLength(*GSDown1_6WindFront,3,8)
animationSetFrameOpacity(*GSDown1_6WindFront,1,192)
animationSetFrameOpacity(*GSDown1_6WindFront,2,128)
animationSetFrameOpacity(*GSDown1_6WindFront,3,64)
*GSDown1_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down1_7WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 7 wind front",0,*GSDown1_7WindFrontRaw)
*GSDown1_8WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_down1_8WindFront",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 8 wind front",0,*GSDown1_8WindFrontRaw)
animationSetFrameLength(*GSDown1_8WindFront,1,7)
animationSetFrameLength(*GSDown1_8WindFront,2,8)
animationSetFrameOpacity(*GSDown1_8WindFront,1,192)
animationSetFrameOpacity(*GSDown1_8WindFront,2,128)

*GSDown1_3WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_down1_3WindBack",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind back",0,*GSDown1_3WindBackRaw)
animationSetFrameLength(*GSDown1_3WindBack,1,8)
animationSetFrameOpacity(*GSDown1_3WindBack,1,192)
*GSDown1_4WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_down1_4WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 4 wind back",0,*GSDown1_4WindBackRaw)
*GSDown1_5WindBack.animation=classGenerateAnimation(4,"image/hand_gluestick_down1_5WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 5 wind back",0,*GSDown1_5WindBackRaw)
animationSetFrameLength(*GSDown1_5WindBack,1,5)
animationSetFrameLength(*GSDown1_5WindBack,2,6)
animationSetFrameLength(*GSDown1_5WindBack,3,7)
animationSetFrameOpacity(*GSDown1_5WindBack,2,192)
animationSetFrameOpacity(*GSDown1_5WindBack,3,128)
animationSetFrameOpacity(*GSDown1_5WindBack,4,64)
*GSDown1_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_down1_6WindBack",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 6 wind back",0,*GSDown1_6WindBackRaw)
animationSetFrameLength(*GSDown1_6WindBack,1,8)
animationSetFrameOpacity(*GSDown1_6WindBack,1,192)

animationPrepareWind(*GSDown1,0)
*GSDown1\frontWind(0,0)=*GSDown1_1WindFront
*GSDown1\frontWind(1,0)=*GSDown1_2WindFront
*GSDown1\frontWind(2,0)=*GSDown1_3WindFront
*GSDown1\frontWind(3,0)=*GSDown1_4WindFront
*GSDown1\frontWind(4,0)=*GSDown1_5WindFront
*GSDown1\frontWind(5,0)=*GSDown1_6WindFront
*GSDown1\frontWind(6,0)=*GSDown1_7WindFront
*GSDown1\frontWind(7,0)=*GSDown1_8WindFront
*GSDown1\backWind(2,0)=*GSDown1_3WindBack
*GSDown1\backWind(3,0)=*GSDown1_4WindBack
*GSDown1\backWind(4,0)=*GSDown1_5WindBack
*GSDown1\backWind(5,0)=*GSDown1_6WindBack
animationFreeMovementWind(*GSDown1)
animationGetSide(*GSDown1)=*GSSide6

;------- Shockwave 1
*GSShockwave1.animation=classGenerateAnimation(6,"image/hand_gluestick_shockwave1_",5,#H2H_ANIMATIONTYPE_NDOWN,"Shockwave 1",0,*GSShockwave1Raw,0,#H2H_DAMAGETYPE_BLUNT,3,1)
animationSetFramePureProjectile(*GSShockwave1,1)
animationSetFramePureProjectile(*GSShockwave1,2)
animationSetFramePureProjectile(*GSShockwave1,3)
animationSetFramePureProjectile(*GSShockwave1,4)
animationSetFramePureProjectile(*GSShockwave1,5)
For i=0 To 6
	animationSetFrameLength(*GSShockwave1,i,i/2+2)
Next
; setFramePushD(*GSShockwave1,1,0,-10)
animationSetFramePushD(*GSShockwave1,2,0,-50)
animationSetFramePushD(*GSShockwave1,3,0,-35)
animationSetFramePushD(*GSShockwave1,4,0,-20)
animationSetFramePushD(*GSShockwave1,5,0,-10)
animationSetFrameDamage(*GSShockwave1,4,1)
animationSetFrameDamage(*GSShockwave1,5,1)
animationSetFrameMovement(*GSShockwave1,0,0,-10)
animationSetFrameMovement(*GSShockwave1,5,-50)
animationSetFrameMovement(*GSShockwave1,6,-50)
animationSetFrameSound(*GSShockwave1,0,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameOpacity(*GSShockwave1,4,192)
animationSetFrameOpacity(*GSShockwave1,5,128)
animationSetFrameOpacity(*GSShockwave1,6,64)

Dim *GSDown1\projectiles(7,0)
*GSDown1\projectiles(4,0)=*GSShockwave1

;------- Down 2
*GSDown2.animation=classGenerateAnimation(5,"image/hand_gluestick_down2_",8,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*GSDown2Raw,1,#H2H_DAMAGETYPE_PIERCE,1)
animationSetUngrounded(*GSDown2)
animationSetComboEnd(*GSDown2,#True)
animationSetFrameLength(*GSDown2,0,4)
animationSetFrameLength(*GSDown2,1,15)
animationSetFrameLength(*GSDown2,3,10)
animationSetFrameLength(*GSDown2,4,5)
animationSetFrameLength(*GSDown2,5,15)
animationSetFrameSound(*GSDown2,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*GSDown2,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*GSDown2,4,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameMovement(*GSDown2,0,70,-8)
; setFrameMovement(*GSDown2,1,58,-10)
animationSetFrameMovement(*GSDown2,1,54,-10)
animationSetFrameMovement(*GSDown2,2,-14,19)
animationSetFrameMovement(*GSDown2,3,-94,-41)
animationSetFrameMovement(*GSDown2,4,28,-4)
animationSetFrameMovement(*GSDown2,5,50,-20)

*GSDown2_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*GSDown2_1WindFrontRaw)
*GSDown2_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_down2_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*GSDown2_2WindFrontRaw)
animationSetFrameLength(*GSDown2_2WindFront,1,6)
animationSetFrameLength(*GSDown2_2WindFront,2,8)
animationSetFrameOpacity(*GSDown2_2WindFront,1,192)
animationSetFrameOpacity(*GSDown2_2WindFront,2,128)
*GSDown2_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down2_3WindFront",8,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind front",0,*GSDown2_3WindFrontRaw)
*GSDown2_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_down2_4WindFront",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 4 wind front",0,*GSDown2_4WindFrontRaw)
animationSetFrameLength(*GSDown2_4WindFront,1,7)
animationSetFrameLength(*GSDown2_4WindFront,2,8)
animationSetFrameOpacity(*GSDown2_4WindFront,1,192)
animationSetFrameOpacity(*GSDown2_4WindFront,2,128)
*GSDown2_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_down2_5WindFront",8,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 5 wind front",0,*GSDown2_5WindFrontRaw)
*GSDown2_6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_down2_6WindFront",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 6 wind front",0,*GSDown2_6WindFrontRaw)
animationSetFrameLength(*GSDown2_6WindFront,1,7)
animationSetFrameLength(*GSDown2_6WindFront,2,8)
animationSetFrameOpacity(*GSDown2_6WindFront,1,192)
animationSetFrameOpacity(*GSDown2_6WindFront,2,128)

*GSDown2_2WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_down2_2WindBack",15,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind back",0,*GSDown2_2WindBackRaw)
*GSDown2_5WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_down2_5WindBack",8,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 5 wind back",0,*GSDown2_5WindBackRaw)
*GSDown2_6WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_down2_6WindBack",6,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 6 wind back",0,*GSDown2_6WindBackRaw)
animationSetFrameLength(*GSDown2_6WindBack,1,7)
animationSetFrameOpacity(*GSDown2_6WindBack,1,192)

animationPrepareWind(*GSDown2,0)
*GSDown2\frontWind(0,0)=*GSDown2_1WindFront
*GSDown2\frontWind(1,0)=*GSDown2_2WindFront
*GSDown2\frontWind(2,0)=*GSDown2_3WindFront
*GSDown2\frontWind(3,0)=*GSDown2_4WindFront
*GSDown2\frontWind(4,0)=*GSDown2_5WindFront
*GSDown2\frontWind(5,0)=*GSDown2_6WindFront
*GSDown2\backWind(1,0)=*GSDown2_2WindBack
*GSDown2\backWind(4,0)=*GSDown2_5WindBack
*GSDown2\backWind(5,0)=*GSDown2_6WindBack
animationFreeMovementWind(*GSDown2)
animationGetDown(*GSDown1)=*GSDown2

;------- Crack 1 and 2
*GSCrack1.animation=classGenerateAnimation(2,"image/hand_gluestick_crack1_",8,#H2H_ANIMATIONTYPE_NDOWN,"Crack 1",0,*GSCrack1Raw)
animationSetFrameSound(*GSCrack1,0,#H2H_SOUND_ID_HAND_LAND)

*GSCrack2.animation=classGenerateAnimation(2,"image/hand_gluestick_crack2_",8,#H2H_ANIMATIONTYPE_NDOWN,"Crack 2",0,*GSCrack2Raw)
animationSetFrameSound(*GSCrack2,0,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameShake(*GSCrack1,0,8)

;------- Shockwave 2
*GSShockwave2.animation=classGenerateAnimation(4,"image/hand_gluestick_shockwave2_",3,#H2H_ANIMATIONTYPE_NDOWN,"Shockwave 2",0,*GSShockwave2Raw,0,#H2H_DAMAGETYPE_BLUNT,5,1)
animationSetFramePushD(*GSShockwave2,0,-10,-10)
animationSetFramePushD(*GSShockwave2,1,-10,-20)
animationSetFramePushD(*GSShockwave2,2,-20,-10)
animationSetFramePushD(*GSShockwave2,3,-5,-5)
animationSetFrameMovement(*GSShockwave2,3,-70)
animationSetFrameMovement(*GSShockwave2,4,-70)
animationSetFrameLength(*GSShockwave2,1,5)
animationSetFrameLength(*GSShockwave2,2,7)
animationSetFrameLength(*GSShockwave2,3,8)
animationSetFrameLength(*GSShockwave2,4,9)
animationSetFrameOpacity(*GSShockwave2,2,192)
animationSetFrameOpacity(*GSShockwave2,3,128)
animationSetFrameOpacity(*GSShockwave2,4,64)

;------- Explosion 6
*GSExplosion6.animation=classGenerateAnimation(6,"image/hand_gluestick_explosion6_",4,#H2H_ANIMATIONTYPE_NDOWN,"Explosion 6",0,*GSExplosion6Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
animationSetFrameSound(*GSExplosion6,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
animationSetFrameShake(*GSExplosion6,0,20)
animationSetFrameLength(*GSExplosion6,0,2)
animationSetFrameLength(*GSExplosion6,1,3)
animationSetFrameLength(*GSExplosion6,5,5)
animationSetFrameLength(*GSExplosion6,6,5)
animationSetFrameOpacity(*GSExplosion6,4,192)
animationSetFrameOpacity(*GSExplosion6,5,128)
animationSetFrameOpacity(*GSExplosion6,6,64)

Dim *GSDown2\projectiles(5,1)
*GSDown2\projectiles(0,0)=*GSExplosion6
*GSDown2\projectiles(1,0)=*GSCrack1
*GSDown2\projectiles(1,1)=*GSShockwave2
*GSDown2\projectiles(4,0)=*GSCrack2

For i=0 To 5
	For j=0 To 1
		If *GSDown2\projectiles(i,j)
			For l=0 To ArraySize(*GSDown2\projectiles(i,j)\frames())
				If *GSDown2\projectiles(0,0)\frames(l)\hurtId
					animationSetFramePureProjectile(*GSDown2\projectiles(i,j),l)
				EndIf
			Next
		EndIf
	Next
Next

;------- Up 1
*GSUp1.animation=classGenerateAnimation(7,"image/hand_gluestick_up1_",5,#H2H_ANIMATIONTYPE_NUP,"Up 1",0,*GSUp1Raw,10,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*GSUp1,7,5)
animationSetUngrounded(*GSUp1)
animationSetFrameSound(*GSUp1,0,#H2H_SOUND_ID_HAND_JUMPHEAVY)
animationSetFrameSound(*GSUp1,1,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSUp1,7,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameMovement(*GSUp1,0,-5,-10)
animationSetFrameMovement(*GSUp1,1,-10,-20)
animationSetFrameMovement(*GSUp1,2,-10,-50)
animationSetFrameMovement(*GSUp1,3,-60,-20)
animationSetFrameMovement(*GSUp1,4,-70,-10)
animationSetFrameMovement(*GSUp1,5,-45)
animationSetFrameMovement(*GSUp1,6,-45,50)
animationSetFrameMovement(*GSUp1,7,-60,70)
animationSetFrameLength(*GSUp1,0,2)
animationSetFrameLength(*GSUp1,1,3)
animationSetFrameLength(*GSUp1,4,4)
animationSetFrameLength(*GSUp1,5,3)
animationSetFrameLength(*GSUp1,6,3)
animationSetFrameLength(*GSUp1,7,12)
animationSetFrameShake(*GSUp1,7,15)
animationSetFrameDamage(*GSUp1,3,8)
animationSetFrameDamage(*GSUp1,4,8)
animationSetFrameDamage(*GSUp1,5,8)
animationSetFrameDamage(*GSUp1,7,4)
animationSetFrameDamageDuration(*GSUp1,7,5)

*GSUp1_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_1WindFront",2,#H2H_ANIMATIONTYPE_NUP,"Up 1 1 wind front",0,*GSUp1_1WindFrontRaw)
*GSUp1_2WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_up1_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 2 wind front",0,*GSUp1_2WindFrontRaw)
animationSetFrameLength(*GSUp1_2WindFront,1,4)
animationSetFrameLength(*GSUp1_2WindFront,2,5)
animationSetFrameLength(*GSUp1_2WindFront,3,6)
animationSetFrameOpacity(*GSUp1_2WindFront,1,192)
animationSetFrameOpacity(*GSUp1_2WindFront,2,128)
animationSetFrameOpacity(*GSUp1_2WindFront,3,64)
*GSUp1_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_3WindFront",5,#H2H_ANIMATIONTYPE_NUP,"Up 1 3 wind front",0,*GSUp1_3WindFrontRaw)
*GSUp1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_4WindFront",5,#H2H_ANIMATIONTYPE_NUP,"Up 1 4 wind front",0,*GSUp1_4WindFrontRaw)
*GSUp1_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_5WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 1 5 wind front",0,*GSUp1_5WindFrontRaw)
*GSUp1_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_6WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 6 wind front",0,*GSUp1_6WindFrontRaw)
*GSUp1_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_7WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 7 wind front",0,*GSUp1_7WindFrontRaw)
*GSUp1_8WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_up1_8WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 1 8 wind front",0,*GSUp1_8WindFrontRaw)
animationSetFrameLength(*GSUp1_8WindFront,1,5)
animationSetFrameLength(*GSUp1_8WindFront,2,6)
animationSetFrameLength(*GSUp1_8WindFront,3,7)
animationSetFrameOpacity(*GSUp1_8WindFront,1,192)
animationSetFrameOpacity(*GSUp1_8WindFront,2,128)
animationSetFrameOpacity(*GSUp1_8WindFront,3,64)

*GSUp1_3WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_3WindBack",5,#H2H_ANIMATIONTYPE_NUP,"Up 1 3 wind back",0,*GSUp1_3WindBackRaw)
*GSUp1_4WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_up1_4WindBack",5,#H2H_ANIMATIONTYPE_NUP,"Up 1 4 wind back",0,*GSUp1_4WindBackRaw)
*GSUp1_8WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_up1_8WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 1 8 wind back",0,*GSUp1_8WindBackRaw)
animationSetFrameLength(*GSUp1_8WindBack,1,6)
animationSetFrameLength(*GSUp1_8WindBack,2,8)
animationSetFrameOpacity(*GSUp1_8WindBack,1,192)
animationSetFrameOpacity(*GSUp1_8WindBack,2,128)

animationPrepareWind(*GSUp1,0)
*GSUp1\frontWind(0,0)=*GSUp1_1WindFront
*GSUp1\frontWind(1,0)=*GSUp1_2WindFront
*GSUp1\frontWind(2,0)=*GSUp1_3WindFront
*GSUp1\frontWind(3,0)=*GSUp1_4WindFront
*GSUp1\frontWind(4,0)=*GSUp1_5WindFront
*GSUp1\frontWind(5,0)=*GSUp1_6WindFront
*GSUp1\frontWind(6,0)=*GSUp1_7WindFront
*GSUp1\frontWind(7,0)=*GSUp1_8WindFront
*GSUp1\backWind(2,0)=*GSUp1_3WindBack
*GSUp1\backWind(3,0)=*GSUp1_4WindBack
*GSUp1\backWind(7,0)=*GSUp1_8WindBack
animationFreeMovementWind(*GSUp1)

animationGetNeutral(*GSUp1)=*GSNeutral4

;------- Up 2
*GSUp2.animation=classGenerateAnimation(5,"image/hand_gluestick_up2_",4,#H2H_ANIMATIONTYPE_NUP,"Up 2",0,*GSUp2Raw,15,#H2H_DAMAGETYPE_BLUNT,7)
animationSetComboEnd(*GSUp2,#True)
animationGetUp(*GSDown1)=*GSUp2
animationSetFrameMovement(*GSUp2,0,15,15)
animationSetFrameMovement(*GSUp2,1,15,15)
animationSetFrameMovement(*GSUp2,2,-30,-30)
animationSetFrameMovement(*GSUp2,3,-64,-30)
animationSetFrameMovement(*GSUp2,4,-64,-30)
animationSetFrameMovement(*GSUp2,5,32,32)
animationSetFramePushD(*GSUp2,2,-10,-30)
animationSetFramePushD(*GSUp2,3,-10,-25)
animationSetFramePushD(*GSUp2,4,-10,-20)
animationSetFrameSound(*GSUp2,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSUp2,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameLength(*GSUp2,0,3)
animationSetFrameLength(*GSUp2,4,5)
animationSetFrameLength(*GSUp2,5,8)

*GSUp2_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up2_1WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 2 1 wind front",0,*GSUp2_1WindFrontRaw)
*GSUp2_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up2_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 4 wind front",0,*GSUp2_4WindFrontRaw)

*GSUp2_2WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_up2_2WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 2 wind back",0,*GSUp2_2WindBackRaw)
animationSetFrameLength(*GSUp2_2WindBack,1,5)
animationSetFrameLength(*GSUp2_2WindBack,2,6)
animationSetFrameOpacity(*GSUp2_2WindBack,1,192)
animationSetFrameOpacity(*GSUp2_2WindBack,2,128)
*GSUp2_3WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_up2_3WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 3 wind back",0,*GSUp2_3WindBackRaw)
*GSUp2_4WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_up2_4WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 4 wind back",0,*GSUp2_4WindBackRaw)
*GSUp2_5WindBack.animation=classGenerateAnimation(3,"image/hand_gluestick_up2_5WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 5 wind back",0,*GSUp2_5WindBackRaw)
animationSetFrameLength(*GSUp2_5WindBack,1,5)
animationSetFrameLength(*GSUp2_5WindBack,2,6)
animationSetFrameLength(*GSUp2_5WindBack,3,7)
animationSetFrameOpacity(*GSUp2_5WindBack,1,192)
animationSetFrameOpacity(*GSUp2_5WindBack,2,128)
animationSetFrameOpacity(*GSUp2_5WindBack,3,64)

animationPrepareWind(*GSUp2,0)
*GSUp2\frontWind(0,0)=*GSUp2_1WindFront
*GSUp2\frontWind(3,0)=*GSUp2_4WindFront
*GSUp2\backWind(1,0)=*GSUp2_2WindBack
*GSUp2\backWind(2,0)=*GSUp2_3WindBack
*GSUp2\backWind(3,0)=*GSUp2_4WindBack
*GSUp2\backWind(4,0)=*GSUp2_5WindBack
animationFreeMovementWind(*GSUp2)

;------- Up 3
*GSUp3.animation=classGenerateAnimation(6,"image/hand_gluestick_up3_",6,#H2H_ANIMATIONTYPE_NUP,"Up 3",0,*GSUp3Raw,10,#H2H_DAMAGETYPE_BLUNT,5)
animationSetComboEnd(*GSUp3,#True)
animationSetFrameSound(*GSUp3,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameMovement(*GSUp3,0,-10)
animationSetFrameMovement(*GSUp3,1,-10)
animationSetFrameMovement(*GSUp3,2,-10)
animationSetFrameLength(*GSUp3,0,3)
animationSetFrameLength(*GSUp3,1,3)
animationSetFrameLength(*GSUp3,2,3)
animationSetFrameLength(*GSUp3,6,10)
For i=3 To 6
	animationSetFrameShake(*GSUp3,i,8)
Next
*GSUp3_1WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_up3_1WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 3 1 wind front",0,*GSUp3_1WindFrontRaw)
animationSetFrameLength(*GSUp3_1WindFront,1,5)
animationSetFrameOpacity(*GSUp3_1WindFront,1,192)
*GSUp3_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_up3_2WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 2 wind front",0,*GSUp3_2WindFrontRaw)
*GSUp3_3WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_up3_3WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 3 3 wind front",0,*GSUp3_3WindFrontRaw)
animationSetFrameLength(*GSUp3_3WindFront,1,5)
animationSetFrameOpacity(*GSUp3_3WindFront,1,192)

animationPrepareWind(*GSUp3,0)
*GSUp3\frontWind(0,0)=*GSUp3_1WindFront
*GSUp3\frontWind(1,0)=*GSUp3_2WindFront
*GSUp3\frontWind(2,0)=*GSUp3_3WindFront
animationFreeMovementWind(*GSUp3)

animationGetUp(*GSNeutral1)=*GSUp3

;------- Shot 1 2 3 4
*GSShot1.animation=classGenerateAnimation(2,"image/hand_gluestick_shot1_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 1",0,*GSShot1Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
*GSShot2.animation=classGenerateAnimation(2,"image/hand_gluestick_shot2_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 2",0,*GSShot2Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
*GSShot3.animation=classGenerateAnimation(2,"image/hand_gluestick_shot3_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 3",0,*GSShot3Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)
*GSShot4.animation=classGenerateAnimation(2,"image/hand_gluestick_shot4_",5,#H2H_ANIMATIONTYPE_NUP,"Shot 4",0,*GSShot4Raw,0,#H2H_DAMAGETYPE_PIERCE,5,2)

Dim *GSUp3\projectiles(6,0)
*GSUp3\projectiles(3,0)=*GSShot1
*GSUp3\projectiles(4,0)=*GSShot2
*GSUp3\projectiles(5,0)=*GSShot3
*GSUp3\projectiles(6,0)=*GSShot4

For i=3 To 6
	animationSetFrameShake(*GSUp3\projectiles(i,0),0,3)
	animationSetFrameLength(*GSUp3\projectiles(i,0),0,3)
	animationSetFrameLength(*GSUp3\projectiles(i,0),2,8)
	animationSetFrameSound(*GSUp3\projectiles(i,0),0,#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
	animationSetFramePureProjectile(*GSUp3\projectiles(i,0),0)
	animationSetFrameOpacity(*GSUp3\projectiles(i,0),1,192)
	animationSetFrameOpacity(*GSUp3\projectiles(i,0),2,128)
Next

;------- Heavy 1
*GSHeavy1.animation=classGenerateAnimation(7,"image/hand_gluestick_heavy1_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1",0,*GSHeavy1Raw,25,#H2H_DAMAGETYPE_BLUNT,5)
ReDim *GSHeavy1\frames(8)
For i=8 To 6 Step -1
	*GSHeavy1\frames(i)=*GSHeavy1\frames(i-1)
Next
*GSHeavy1\frames(5)=frameDataGive()
frameCopy(*GSHeavy1\frames(5),*GSHeavy1\frames(4),#True)
animationSetUngrounded(*GSHeavy1)
animationSetFrameNeedCatch(*GSHeavy1,5)
animationSetFrameMovement(*GSHeavy1,0,32,32)
animationSetFrameMovement(*GSHeavy1,1,-64,-64)
animationSetFrameMovement(*GSHeavy1,2,-64,32)
animationSetFrameMovement(*GSHeavy1,3,-96,32)
animationSetFrameMovement(*GSHeavy1,4,-32,-32)
animationSetFrameMovement(*GSHeavy1,5,64,-16)
animationSetFrameMovement(*GSHeavy1,6,64,-16)
animationSetFrameMovement(*GSHeavy1,7,32,16)
animationSetFrameMovement(*GSHeavy1,8,32,16)
animationSetFrameLength(*GSHeavy1,0,5)
animationSetFrameLength(*GSHeavy1,1,5)
animationSetFrameLength(*GSHeavy1,2,5)
animationSetFrameLength(*GSHeavy1,3,5)
animationSetFrameLength(*GSHeavy1,4,10)
animationSetFrameStun(*GSHeavy1,2,5)
animationSetFrameStun(*GSHeavy1,3,10)
animationSetFrameStun(*GSHeavy1,4,15)
animationSetFramePush(*GSHeavy1,2,-20)
; setFramePush(*GSHeavy1,3,-15)
; setFramePush(*GSHeavy1,4,-15)
animationSetFrameDamageDuration(*GSHeavy1,4,4)
For i=5 To 7
	animationSetFrameLength(*GSHeavy1,i,4)
Next
animationSetFrameLength(*GSHeavy1,8,12)
animationSetFrameSound(*GSHeavy1,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSHeavy1,2,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameCDN(*GSHeavy1,8,6)

*GSHeavy1_1WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_heavy1_1WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 1 wind front",0,*GSHeavy1_1WindFrontRaw)
animationSetFrameLength(*GSHeavy1_1WindFront,1,5)
animationSetFrameOpacity(*GSHeavy1_1WindFront,1,192)
*GSHeavy1_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 2 wind front",0,*GSHeavy1_2WindFrontRaw)
*GSHeavy1_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 3 wind front",0,*GSHeavy1_3WindFrontRaw)
*GSHeavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_4WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 4 wind front",0,*GSHeavy1_4WindFrontRaw)
*GSHeavy1_5WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 5 wind front",0,*GSHeavy1_5WindFrontRaw)
animationSetFrameLength(*GSHeavy1_5WindFront,1,5)
animationSetFrameLength(*GSHeavy1_5WindFront,2,6)
animationSetFrameLength(*GSHeavy1_5WindFront,3,7)
animationSetFrameOpacity(*GSHeavy1_5WindFront,1,192)
animationSetFrameOpacity(*GSHeavy1_5WindFront,2,128)
animationSetFrameOpacity(*GSHeavy1_5WindFront,3,64)
*GSHeavy1_6WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_6WindFront1_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 6 wind front 1",0,*GSHeavy1_6WindFront1Raw)
*GSHeavy1_6WindFront2.animation=classGenerateAnimation(3,"image/hand_gluestick_heavy1_6WindFront2_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 6 wind front 2",0,*GSHeavy1_6WindFront2Raw)
animationSetFrameLength(*GSHeavy1_6WindFront2,1,5)
animationSetFrameLength(*GSHeavy1_6WindFront2,2,6)
animationSetFrameLength(*GSHeavy1_6WindFront2,3,7)
animationSetFrameOpacity(*GSHeavy1_6WindFront2,1,192)
animationSetFrameOpacity(*GSHeavy1_6WindFront2,2,128)
animationSetFrameOpacity(*GSHeavy1_6WindFront2,3,64)
*GSHeavy1_7WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_7WindFront1_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 7 wind front 1",0,*GSHeavy1_7WindFront1Raw)
*GSHeavy1_7WindFront2.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy1_7WindFront2_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 7 wind front 2",0,*GSHeavy1_7WindFront2Raw)
animationSetFrameLength(*GSHeavy1_7WindFront2,1,5)
animationSetFrameLength(*GSHeavy1_7WindFront2,2,6)
animationSetFrameOpacity(*GSHeavy1_7WindFront2,1,192)
animationSetFrameOpacity(*GSHeavy1_7WindFront2,2,128)
*GSHeavy1_8WindFront1.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy1_8WindFront1_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 8 wind front 1",0,*GSHeavy1_8WindFront1Raw)
animationSetFrameLength(*GSHeavy1_8WindFront1,1,5)
animationSetFrameLength(*GSHeavy1_8WindFront1,2,6)
animationSetFrameOpacity(*GSHeavy1_8WindFront1,1,192)
animationSetFrameOpacity(*GSHeavy1_8WindFront1,2,128)
*GSHeavy1_8WindFront2.animation=classGenerateAnimation(1,"image/hand_gluestick_heavy1_8WindFront2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 8 wind front 2",0,*GSHeavy1_8WindFront2Raw)
animationSetFrameLength(*GSHeavy1_8WindFront2,1,7)
animationSetFrameOpacity(*GSHeavy1_8WindFront2,1,192)

*GSHeavy1_2WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy1_2WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 2 wind back",0,*GSHeavy1_2WindBackRaw)

animationPrepareWind(*GSHeavy1,1)
*GSHeavy1\frontWind(0,0)=*GSHeavy1_1WindFront
*GSHeavy1\frontWind(1,0)=*GSHeavy1_2WindFront
*GSHeavy1\frontWind(2,0)=*GSHeavy1_3WindFront
*GSHeavy1\frontWind(3,0)=*GSHeavy1_4WindFront
*GSHeavy1\frontWind(4,0)=*GSHeavy1_5WindFront
*GSHeavy1\frontWind(6,0)=*GSHeavy1_6WindFront1
*GSHeavy1\frontWind(6,1)=*GSHeavy1_6WindFront2
*GSHeavy1\frontWind(7,0)=*GSHeavy1_7WindFront1
*GSHeavy1\frontWind(7,1)=*GSHeavy1_7WindFront2
*GSHeavy1\frontWind(8,0)=*GSHeavy1_8WindFront1
*GSHeavy1\frontWind(8,1)=*GSHeavy1_8WindFront2
*GSHeavy1\backWind(1,0)=*GSHeavy1_2WindBack
animationFreeMovementWind(*GSHeavy1)

;------- Explosion 5
*GSExplosion5.animation=classGenerateAnimation(6,"image/hand_gluestick_explosion5_",3,#H2H_ANIMATIONTYPE_HEAVY,"Explosion 5",0,*GSExplosion5Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
For i=0 To 6
	animationSetFramePureProjectile(*GSExplosion5,i)
	If -20+i*6<0
		animationSetFramePushD(*GSExplosion5,i,-20+i*6)
	EndIf
Next
animationSetFrameLength(*GSExplosion5,4,2)
animationSetFrameLength(*GSExplosion5,5,2)
animationSetFrameLength(*GSExplosion5,6,2)
animationSetFrameSound(*GSExplosion5,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
animationSetFrameSound(*GSExplosion5,4,#H2H_SOUND_ID_METALBLUNTBLOCK)
animationSetFrameMovement(*GSExplosion5,3,-186,24)
animationSetFrameMovement(*GSExplosion5,4,-144,-8)
animationSetFrameMovement(*GSExplosion5,5,-200,-16)
animationSetFrameMovement(*GSExplosion5,6,-32)
animationSetFrameDamage(*GSExplosion5,4,7)
animationSetFrameDamage(*GSExplosion5,5,6)
animationSetFrameDamage(*GSExplosion5,6,5)
animationSetFrameOpacity(*GSExplosion5,4,192)
animationSetFrameOpacity(*GSExplosion5,5,128)
animationSetFrameOpacity(*GSExplosion5,6,64)

Dim *GSHeavy1\projectiles(8,0)
*GSHeavy1\projectiles(5,0)=*GSExplosion5

;------- Heavy 2
*GSHeavy2.animation=classGenerateAnimation(7,"image/hand_gluestick_heavy2_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*GSHeavy2Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*GSHeavy2,7,5)
animationSetFrameDamageDuration(*GSHeavy2,7,5)
animationSetFrameMovement(*GSHeavy2,0,20)
animationSetFrameMovement(*GSHeavy2,1,20)
animationSetFrameMovement(*GSHeavy2,2,20)
animationSetFrameMovement(*GSHeavy2,3,-110)
animationSetFrameMovement(*GSHeavy2,4,-110)
animationSetFrameMovement(*GSHeavy2,5,-80)
animationSetFrameMovement(*GSHeavy2,6,25)
animationSetFrameMovement(*GSHeavy2,7,30)
animationSetFrameLength(*GSHeavy2,0,4)
animationSetFrameLength(*GSHeavy2,3,4)
animationSetFrameLength(*GSHeavy2,4,5)
animationSetFrameLength(*GSHeavy2,5,5)
animationSetFrameLength(*GSHeavy2,6,5)
animationSetFrameLength(*GSHeavy2,7,12)
animationSetFrameSound(*GSHeavy2,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*GSHeavy2,2,#H2H_SOUND_ID_WOODBLUNTBLOCK)
animationSetFrameSound(*GSHeavy2,3,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFramePush(*GSHeavy2,3,-10)
animationSetFramePush(*GSHeavy2,4,-10)
animationSetFramePush(*GSHeavy2,5,0,-10)
animationSetFramePush(*GSHeavy2,6,10,-10)
animationSetFramePush(*GSHeavy2,7,10)

*GSHeavy2_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_1WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 1 wind front",0,*GSHeavy2_1WindFrontRaw)
*GSHeavy2_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind front",0,*GSHeavy2_2WindFrontRaw)
*GSHeavy2_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy2_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind front",0,*GSHeavy2_3WindFrontRaw)
animationSetFrameLength(*GSHeavy2_3WindFront,1,7)
animationSetFrameLength(*GSHeavy2_3WindFront,2,8)
animationSetFrameOpacity(*GSHeavy2_3WindFront,1,192)
animationSetFrameOpacity(*GSHeavy2_3WindFront,2,128)
*GSHeavy2_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_4WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*GSHeavy2_4WindFrontRaw)
*GSHeavy2_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_5WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind front",0,*GSHeavy2_5WindFrontRaw)
*GSHeavy2_6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_6WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 6 wind front",0,*GSHeavy2_6WindFrontRaw)
*GSHeavy2_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy2_7WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 7 wind front",0,*GSHeavy2_7WindFrontRaw)
*GSHeavy2_8WindFront.animation=classGenerateAnimation(4,"image/hand_gluestick_heavy2_8WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 8 wind front",0,*GSHeavy2_8WindFrontRaw)
animationSetFrameLength(*GSHeavy2_8WindFront,1,6)
animationSetFrameLength(*GSHeavy2_8WindFront,2,7)
animationSetFrameLength(*GSHeavy2_8WindFront,3,8)
animationSetFrameLength(*GSHeavy2_8WindFront,4,9)
animationSetFrameOpacity(*GSHeavy2_8WindFront,2,192)
animationSetFrameOpacity(*GSHeavy2_8WindFront,3,128)
animationSetFrameOpacity(*GSHeavy2_8WindFront,4,64)

animationPrepareWind(*GSHeavy2,0)
*GSHeavy2\frontWind(0,0)=*GSHeavy2_1WindFront
*GSHeavy2\frontWind(1,0)=*GSHeavy2_2WindFront
*GSHeavy2\frontWind(2,0)=*GSHeavy2_3WindFront
*GSHeavy2\frontWind(3,0)=*GSHeavy2_4WindFront
*GSHeavy2\frontWind(4,0)=*GSHeavy2_5WindFront
*GSHeavy2\frontWind(5,0)=*GSHeavy2_6WindFront
*GSHeavy2\frontWind(6,0)=*GSHeavy2_7WindFront
*GSHeavy2\frontWind(7,0)=*GSHeavy2_8WindFront
animationFreeMovementWind(*GSHeavy2)

animationGetHeavy(*GSHeavy1)=*GSHeavy2
animationGetSide(*GSHeavy2)=*GSSide4

;------- Heavy 3
*GSHeavy3.animation=classGenerateAnimation(4,"image/hand_gluestick_heavy3_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3",0,*GSHeavy3Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
animationSetComboEnd(*GSHeavy3,#True)
animationSetFrameSound(*GSHeavy3,0,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameDamage(*GSHeavy3,2,9)
animationSetFrameDamage(*GSHeavy3,3,9)
animationSetFrameMovement(*GSHeavy3,0,0,-64)
animationSetFrameMovement(*GSHeavy3,1,-16,-72)
animationSetFrameMovement(*GSHeavy3,2,-8,92)
animationSetFrameMovement(*GSHeavy3,3,32,40)
animationSetFrameMovement(*GSHeavy3,4,24,24)
animationSetFrameLength(*GSHeavy3,4,12)
animationSetFrameDamageDuration(*GSHeavy3,4,5)
animationSetUngrounded(*GSHeavy3,1)
animationSetFrameCDN(*GSHeavy3,4,6)
animationSetFramePush(*GSHeavy3,1,-10)
animationSetFramePush(*GSHeavy3,2,-10,-10)
animationSetFramePush(*GSHeavy3,3,10,-10)
animationSetFramePush(*GSHeavy3,4,10)

*GSHeavy3_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy3_1WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 1 wind front",0,*GSHeavy3_1WindFrontRaw)
*GSHeavy3_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy3_2WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 2 wind front",0,*GSHeavy3_2WindFrontRaw)
*GSHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy3_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 3 wind front",0,*GSHeavy3_3WindFrontRaw)
*GSHeavy3_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy3_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 4 wind front",0,*GSHeavy3_4WindFrontRaw)
*GSHeavy3_5WindFront.animation=classGenerateAnimation(4,"image/hand_gluestick_heavy3_5WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 5 wind front",0,*GSHeavy3_5WindFrontRaw)
animationSetFrameLength(*GSHeavy3_5WindFront,1,6)
animationSetFrameLength(*GSHeavy3_5WindFront,2,7)
animationSetFrameLength(*GSHeavy3_5WindFront,3,8)
animationSetFrameLength(*GSHeavy3_5WindFront,4,9)
animationSetFrameMovement(*GSHeavy3_5WindFront,1,64)
animationSetFrameMovement(*GSHeavy3_5WindFront,2,64)
animationSetFrameMovement(*GSHeavy3_5WindFront,3,64)
animationSetFrameOpacity(*GSHeavy3_5WindFront,2,192)
animationSetFrameOpacity(*GSHeavy3_5WindFront,3,128)
animationSetFrameOpacity(*GSHeavy3_5WindFront,4,64)

animationPrepareWind(*GSHeavy3,0)
*GSHeavy3\frontWind(0,0)=*GSHeavy3_1WindFront
*GSHeavy3\frontWind(1,0)=*GSHeavy3_2WindFront
*GSHeavy3\frontWind(2,0)=*GSHeavy3_3WindFront
*GSHeavy3\frontWind(3,0)=*GSHeavy3_4WindFront
*GSHeavy3\frontWind(4,0)=*GSHeavy3_5WindFront
animationFreeMovementWind(*GSHeavy3)

animationGetHeavy(*GSHeavy2)=*GSHeavy3

;------- Heavy 4
*GSHeavy4.animation=classGenerateAnimation(3,"image/hand_gluestick_heavy4_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 4",0,*GSHeavy4Raw,25,#H2H_DAMAGETYPE_BLUNT,15)
animationSetUngrounded(*GSHeavy4)
animationSetFrameLength(*GSHeavy4,1,10)
animationSetComboEnd(*GSHeavy4,#True)
animationSetFrameMovement(*GSHeavy4,1,-60)
animationSetFrameMovementDelta(*GSHeavy4,1,-40)
animationSetFrameMovementDelta(*GSHeavy4,2,-20)
animationSetFrameMovementDelta(*GSHeavy4,3,-10)
animationSetFramePush(*GSHeavy4,1,-45)
animationSetFrameSound(*GSHeavy4,3,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)

*GSHeavy4_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy4_2WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 4 2 wind front",0,*GSHeavy4_2WindFrontRaw)
animationSetFrameLength(*GSHeavy4_2WindFront,1,3)
animationSetFrameLength(*GSHeavy4_2WindFront,2,4)
animationSetFrameOpacity(*GSHeavy4_2WindFront,1,192)
animationSetFrameOpacity(*GSHeavy4_2WindFront,2,128)
*GSHeavy4_3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy4_3WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 4 3 wind front",0,*GSHeavy4_3WindFrontRaw)
animationSetFrameLength(*GSHeavy4_3WindFront,1,5)
animationSetFrameLength(*GSHeavy4_3WindFront,2,6)
animationSetFrameOpacity(*GSHeavy4_3WindFront,1,192)
animationSetFrameOpacity(*GSHeavy4_3WindFront,2,128)
animationFreeMovement(*GSHeavy4_3WindFront)
*GSHeavy4_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy4_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 4 4 wind front",0,*GSHeavy4_4WindFrontRaw)
animationFreeMovement(*GSHeavy4_4WindFront)
animationSetFrameOpacity(*GSHeavy4_4WindFront,1,192)
animationSetFrameOpacity(*GSHeavy4_4WindFront,2,128)

*GSHeavy4_1WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_heavy4_1WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 4 1 wind back",0,*GSHeavy4_1WindBackRaw)
animationFreeMovement(*GSHeavy4_1WindBack)
animationSetFrameOpacity(*GSHeavy4_1WindBack,1,192)

animationPrepareWind(*GSHeavy4,0)
*GSHeavy4\frontWind(1,0)=*GSHeavy4_2WindFront
*GSHeavy4\frontWind(2,0)=*GSHeavy4_3WindFront
*GSHeavy4\frontWind(3,0)=*GSHeavy4_4WindFront
*GSHeavy4\backWind(0,0)=*GSHeavy4_1WindBack

animationGetHeavy(*GSNeutral2)=*GSHeavy4

;------- Explosion 2
*GSExplosion2.animation=classGenerateAnimation(5,"image/hand_gluestick_explosion2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Explosion 2",0,*GSExplosion2Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
animationSetFramePureProjectile(*GSExplosion2,0)
animationSetFramePureProjectile(*GSExplosion2,1)
animationSetFramePureProjectile(*GSExplosion2,2)
animationSetFrameShake(*GSExplosion2,0,20)
animationSetFrameSound(*GSExplosion2,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
For i=0 To 5
	animationSetFrameLength(*GSExplosion2,i,2+i)
Next
animationSetFrameOpacity(*GSExplosion2,3,192)
animationSetFrameOpacity(*GSExplosion2,4,128)
animationSetFrameOpacity(*GSExplosion2,5,64)
animationSetFrameDamage(*GSExplosion2,2,8)

Dim *GSHeavy4\projectiles(5,0)
*GSHeavy4\projectiles(1,0)=*GSExplosion2

;------- Heavy 5
*GSHeavy5.animation=classGenerateAnimation(5,"image/hand_gluestick_heavy5_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5",0,*GSHeavy5Raw,20,#H2H_DAMAGETYPE_BLUNT,5)
ReDim *GSHeavy5\frames(6)
For i=6 To 2 Step -1
	*GSHeavy5\frames(i)=*GSHeavy5\frames(i-1)
Next

*GSHeavy5\frames(2)=frameDataGive()
frameCopy(*GSHeavy5\frames(2),*GSHeavy5\frames(1),#True)

animationSetFrameCDN(*GSHeavy5,6,7)
animationSetFrameLength(*GSHeavy5,2,8)
animationSetFrameLength(*GSHeavy5,3,4)
animationSetFrameLength(*GSHeavy5,5,6)
animationSetFrameLength(*GSHeavy5,6,14)
*GSHeavy5\frames(2)\hurtId=0
*GSHeavy5\frames(2)\hurtFlip=0
*GSHeavy5\frames(2)\hurtShift=0
animationSetFrameMovement(*GSHeavy5,0,-20)
animationSetFrameMovement(*GSHeavy5,1,-30)
animationSetFrameMovement(*GSHeavy5,2,128)
animationSetFrameMovement(*GSHeavy5,3,96)
animationSetFrameMovementDelta(*GSHeavy5,4,16)
animationSetFrameMovementDelta(*GSHeavy5,5,8)
animationSetFrameSound(*GSHeavy5,0,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSHeavy5,4,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)

*GSHeavy5_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy5_1WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 1 wind front",0,*GSHeavy5_1WindFrontRaw)
animationFreeMovement(*GSHeavy5_1WindFront)
*GSHeavy5_2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy5_2WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 2 wind front",0,*GSHeavy5_2WindFrontRaw)
animationSetFrameLength(*GSHeavy5_2WindFront,1,6)
animationSetFrameLength(*GSHeavy5_2WindFront,2,7)
animationSetFrameOpacity(*GSHeavy5_2WindFront,1,192)
animationSetFrameOpacity(*GSHeavy5_2WindFront,2,128)
animationFreeMovement(*GSHeavy5_2WindFront)
*GSHeavy5_3WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy5_3WindFront1_",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 3 wind front 1",0,*GSHeavy5_3WindFront1Raw)
animationFreeMovement(*GSHeavy5_3WindFront1)
*GSHeavy5_3WindFront2.animation=classGenerateAnimation(3,"image/hand_gluestick_heavy5_3WindFront2_",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 3 wind front 2",0,*GSHeavy5_3WindFront2Raw)
animationFreeMovement(*GSHeavy5_3WindFront2)
animationSetFrameLength(*GSHeavy5_3WindFront2,1,6)
animationSetFrameLength(*GSHeavy5_3WindFront2,2,8)
animationSetFrameLength(*GSHeavy5_3WindFront2,3,10)
animationSetFrameOpacity(*GSHeavy5_3WindFront2,1,192)
animationSetFrameOpacity(*GSHeavy5_3WindFront2,2,128)
animationSetFrameOpacity(*GSHeavy5_3WindFront2,3,64)
*GSHeavy5_4WindFront1.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy5_4WindFront1_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 4 wind front 1",0,*GSHeavy5_4WindFront1Raw)
*GSHeavy5_4WindFront2.animation=classGenerateAnimation(1,"image/hand_gluestick_heavy5_4WindFront2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 4 wind front 2",0,*GSHeavy5_4WindFront2Raw)
animationSetFrameLength(*GSHeavy5_4WindFront2,1,7)
animationSetFrameOpacity(*GSHeavy5_4WindFront2,1,192)
animationFreeMovement(*GSHeavy5_4WindFront2)
*GSHeavy5_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy5_5WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 5 wind front",0,*GSHeavy5_5WindFrontRaw)
*GSHeavy5_6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_heavy5_6WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 6 wind front",0,*GSHeavy5_6WindFrontRaw)
animationFreeMovement(*GSHeavy5_6WindFront)
animationSetFrameLength(*GSHeavy5_6WindFront,1,6)
animationSetFrameLength(*GSHeavy5_6WindFront,2,7)
animationSetFrameOpacity(*GSHeavy5_6WindFront,1,192)
animationSetFrameOpacity(*GSHeavy5_6WindFront,2,128)

*GSHeavy5_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_heavy5_3WindBack",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 5 3 wind front",0,*GSHeavy5_3WindBackRaw)

animationPrepareWind(*GSHeavy5,1)
*GSHeavy5\frontWind(0,0)=*GSHeavy5_1WindFront
*GSHeavy5\frontWind(1,0)=*GSHeavy5_2WindFront
*GSHeavy5\frontWind(1,1)=*GSHeavy5_3WindFront
*GSHeavy5\frontWind(3,0)=*GSHeavy5_3WindFront1
*GSHeavy5\frontWind(3,1)=*GSHeavy5_3WindFront2
*GSHeavy5\frontWind(4,0)=*GSHeavy5_4WindFront1
*GSHeavy5\frontWind(4,1)=*GSHeavy5_4WindFront2
*GSHeavy5\frontWind(5,0)=*GSHeavy5_5WindFront
*GSHeavy5\frontWind(6,0)=*GSHeavy5_6WindFront

animationGetHeavy(*GSUp1)=*GSHeavy5
animationGetNeutral(*GSHeavy5)=*GSNeutral5

;------- Explosion 4
*GSExplosion4.animation=classGenerateAnimation(5,"image/hand_gluestick_explosion4_",4,#H2H_ANIMATIONTYPE_HEAVY,"Explosion 4",0,*GSExplosion4Raw,0,#H2H_DAMAGETYPE_PIERCE,8,2)
animationSetFrameSound(*GSExplosion4,0,#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)
animationSetFrameShake(*GSExplosion4,0,20)
For i=0 To 3
	animationSetFramePureProjectile(*GSExplosion4,i)
Next
animationSetFrameLength(*GSExplosion4,0,2)
animationSetFrameLength(*GSExplosion4,1,3)
animationSetFrameLength(*GSExplosion4,2,4)
animationSetFrameLength(*GSExplosion4,3,5)
animationSetFrameLength(*GSExplosion4,4,6)
animationSetFrameLength(*GSExplosion4,5,7)
Dim *GSHeavy5\projectiles(6,0)
*GSHeavy5\projectiles(2,0)=*GSExplosion4
animationSetFrameOpacity(*GSExplosion4,3,192)
animationSetFrameOpacity(*GSExplosion4,4,128)
animationSetFrameOpacity(*GSExplosion4,5,64)

;------- Hit
*GShit.animation=classGenerateAnimation(6,"image/hand_gluestick_hit",6,#H2H_ANIMATIONTYPE_HIT,"hit",0,*GSHitRaw)

;------ Jump
*GSJump.animation=classGenerateAnimation(6,"image/hand_gluestick_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*GSJumpRaw)
animationSetFrameLength(*GSJump,6,40)

;------ Land
*GSLand.animation=classGenerateAnimation(2,"image/hand_gluestick_land",8,#H2H_ANIMATIONTYPE_LAND,"land",0,*GSLandRaw)
animationSetFrameShadow(*GSLand,0,-25,25)
animationSetFrameShadow(*GSLand,1,-40,100)
animationSetFrameShadow(*GSLand,2,-10,25)
animationShiftShift(*GSLand,0,0,50)
animationShiftShift(*GSLand,1,0,25)
animationSetFrameLength(*GSLand,0,4)

;------ Spawn
*GSSpawn.animation=classGenerateAnimation(11,"image/hand_gluestick_spawn",7,#H2H_ANIMATIONTYPE_SPAWN,"Spawn",0,*GSSpawnRaw)
animationSetFrameSound(*GSSpawn,1,#H2H_SOUND_ID_WOODBLUNTBLOCK)
animationSetFrameSound(*GSSpawn,2,#H2H_SOUND_ID_PLASTICBLUNTLIGHT)
animationSetFrameSound(*GSSpawn,3,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSSpawn,6,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSSpawn,7,#H2H_SOUND_ID_WOODBLUNTBLOCK)
animationSetFrameSound(*GSSpawn,8,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameSound(*GSSpawn,11,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
animationSetFrameLength(*GSSpawn,1,25)
animationSetFrameLength(*GSSpawn,2,15)
animationSetFrameLength(*GSSpawn,7,15)
animationSetFrameLength(*GSSpawn,8,6)
animationSetFrameLength(*GSSpawn,9,6)
animationSetFrameLength(*GSSpawn,10,15)
; setFrameLength(*GSSpawn,11,7)

*GSSpawn2WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_spawn2WindFront",5,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 2 wind front",0,*GSSpawn2WindFrontRaw)
animationSetFrameLength(*GSSpawn2WindFront,1,6)
animationSetFrameOpacity(*GSSpawn2WindFront,1,192)
*GSSpawn3WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn3WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 3 wind front",0,*GSSpawn3WindFrontRaw)
animationSetFrameLength(*GSSpawn3WindFront,1,7)
animationSetFrameLength(*GSSpawn3WindFront,2,8)
animationSetFrameOpacity(*GSSpawn3WindFront,1,192)
animationSetFrameOpacity(*GSSpawn3WindFront,2,128)
*GSSpawn4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn4WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 4 wind front",0,*GSSpawn4WindFrontRaw)
*GSSpawn5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn5WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 5 wind front",0,*GSSpawn5WindFrontRaw)
*GSSpawn6WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn6WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 6 wind front",0,*GSSpawn6WindFrontRaw)
*GSSpawn7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn7WindFront",8,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 7 wind front",0,*GSSpawn7WindFrontRaw)
*GSSpawn8WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn8WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 8 wind front",0,*GSSpawn8WindFrontRaw)
animationSetFrameLength(*GSSpawn8WindFront,1,7)
animationSetFrameLength(*GSSpawn8WindFront,2,8)
animationSetFrameOpacity(*GSSpawn8WindFront,1,192)
animationSetFrameOpacity(*GSSpawn8WindFront,2,128)
*GSSpawn9WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn9WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 9 wind front",0,*GSSpawn9WindFrontRaw)
*GSSpawn10WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_spawn10WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 10 wind front",0,*GSSpawn10WindFrontRaw)
*GSSpawn11WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_spawn11WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 11 wind front",0,*GSSpawn11WindFrontRaw)
animationSetFrameLength(*GSSpawn11WindFront,1,7)
animationSetFrameOpacity(*GSSpawn11WindFront,1,192)
*GSSpawn12WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_spawn12WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 12 wind front",0,*GSSpawn12WindFrontRaw)
animationSetFrameLength(*GSSpawn12WindFront,1,7)
animationSetFrameLength(*GSSpawn12WindFront,2,8)
animationSetFrameOpacity(*GSSpawn12WindFront,1,192)
animationSetFrameOpacity(*GSSpawn12WindFront,2,128)

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

;------ Death
*GSDeath.animation=classGenerateAnimation(8,"image/hand_gluestick_death",8,#H2H_ANIMATIONTYPE_DEATH,"Death",0,*GSDeathRaw)
animationSetFrameSound(*GSDeath,1,#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT)
animationSetFrameSound(*GSDeath,5,#H2H_SOUND_ID_GLUESTICK_BLUNTMEDIUM)
animationSetFrameSound(*GSDeath,6,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*GSDeath,7,#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT)
animationSetFrameSound(*GSDeath,8,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameLength(*GSDeath,0,24)
animationSetFrameLength(*GSDeath,1,24)
animationSetFrameLength(*GSDeath,3,6)
animationSetFrameLength(*GSDeath,4,6)
animationSetFrameLength(*GSDeath,5,6)

*GSDeath2WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_death2WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 2 wind front",0,*GSDeath2WindFrontRaw)
animationSetFrameLength(*GSDeath2WindFront,1,7)
animationSetFrameLength(*GSDeath2WindFront,2,8)
animationSetFrameOpacity(*GSDeath2WindFront,1,192)
animationSetFrameOpacity(*GSDeath2WindFront,2,128)
*GSDeath3WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_death3WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 3 wind front",0,*GSDeath3WindFrontRaw)
animationSetFrameLength(*GSDeath3WindFront,1,7)
animationSetFrameOpacity(*GSDeath3WindFront,1,192)
*GSDeath4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_death4WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 4 wind front",0,*GSDeath4WindFrontRaw)
*GSDeath5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_death5WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 5 wind front",0,*GSDeath5WindFrontRaw)
*GSDeath6WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_death6WindFront",5,#H2H_ANIMATIONTYPE_DEATH,"Death 6 wind front",0,*GSDeath6WindFrontRaw)
animationSetFrameLength(*GSDeath6WindFront,1,6)
animationSetFrameLength(*GSDeath6WindFront,2,7)
animationSetFrameOpacity(*GSDeath6WindFront,1,192)
animationSetFrameOpacity(*GSDeath6WindFront,2,128)
*GSDeath7WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_death7WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind front",0,*GSDeath7WindFrontRaw)
animationSetFrameLength(*GSDeath7WindFront,1,7)
animationSetFrameLength(*GSDeath7WindFront,2,7)
animationSetFrameLength(*GSDeath7WindFront,3,8)
animationSetFrameOpacity(*GSDeath7WindFront,1,192)
animationSetFrameOpacity(*GSDeath7WindFront,2,128)
animationSetFrameOpacity(*GSDeath7WindFront,3,64)
*GSDeath8WindFront.animation=classGenerateAnimation(1,"image/hand_gluestick_death8WindFront",6,#H2H_ANIMATIONTYPE_DEATH,"Death 8 wind front",0,*GSDeath8WindFrontRaw)
animationSetFrameLength(*GSDeath8WindFront,1,7)
animationSetFrameOpacity(*GSDeath8WindFront,1,192)

*GSDeath7WindBack.animation=classGenerateAnimation(2,"image/hand_gluestick_death7WindBack",6,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind back",0,*GSDeath7WindBackRaw)
animationSetFrameLength(*GSDeath7WindBack,1,7)
animationSetFrameLength(*GSDeath7WindBack,2,8)
animationSetFrameOpacity(*GSDeath7WindBack,1,192)
animationSetFrameOpacity(*GSDeath7WindBack,2,128)
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
*GSDodge.animation=classGenerateAnimation(1,"image/hand_gluestick_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*GSDodgeRaw)
animationSetFrameLength(*GSDodge,1,16)

;------- Parry
*GSParry.animation=classGenerateAnimation(6,"image/hand_gluestick_parry",5,#H2H_ANIMATIONTYPE_PARRY,"Parry",0,*GSParryRaw)

;------- Selection
*GSSelection.animation=classGenerateAnimation(11,"image/hand_gluestick_selection",15,#H2H_ANIMATIONTYPE_SELECTION,"Selection",0,*GSSelectionRaw)
*GSSelection\loopStart=4
animationSetFrameLength(*GSSelection,0,25)
animationSetFrameLength(*GSSelection,1,6)
animationSetFrameLength(*GSSelection,2,7)
animationSetFrameLength(*GSSelection,3,8)
animationSetFrameLength(*GSSelection,5,14)
animationSetFrameLength(*GSSelection,7,16)
animationSetFrameLength(*GSSelection,8,17)
animationSetFrameLength(*GSSelection,9,18)
animationSetFrameLength(*GSSelection,10,16)
animationSetFrameLength(*GSSelection,11,14)
animationSetFrameShadow(*GSSelection,0,96)
animationSetFrameShadow(*GSSelection,1,32)
animationSetFrameShadow(*GSSelection,2,-32)
animationSetFrameShadow(*GSSelection,3,-40)
animationSetFrameShadow(*GSSelection,4,-48)
animationSetFrameShadow(*GSSelection,5,-50)
animationSetFrameShadow(*GSSelection,6,-52)
animationSetFrameShadow(*GSSelection,7,-54)
animationSetFrameShadow(*GSSelection,8,-50)
animationSetFrameShadow(*GSSelection,9,-48)
animationSetFrameShadow(*GSSelection,10,-48)
animationSetFrameShadow(*GSSelection,11,-40)

*GSSelection_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selection2WindFront",6,#H2H_ANIMATIONTYPE_SELECTION,"Selection 2 wind front",0,*GSSelection_2WindFrontRaw)
*GSSelection_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selection3WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 3 wind front",0,*GSSelection_3WindFrontRaw)
*GSSelection_4WindFront.animation=classGenerateAnimation(2,"image/hand_gluestick_selection4WindFront",5,#H2H_ANIMATIONTYPE_SELECTION,"Selection 4 wind front",0,*GSSelection_4WindFrontRaw)
animationSetFrameLength(*GSSelection_4WindFront,1,6)
animationSetFrameLength(*GSSelection_4WindFront,2,7)
animationSetFrameOpacity(*GSSelection_4WindFront,1,192)
animationSetFrameOpacity(*GSSelection_4WindFront,2,128)

animationPrepareWind(*GSSelection,0)
*GSSelection\frontWind(1,0)=*GSSelection_2WindFront
*GSSelection\frontWind(2,0)=*GSSelection_3WindFront
*GSSelection\frontWind(3,0)=*GSSelection_4WindFront

;------- Selected
*GSSelected.animation=classGenerateAnimation(24,"image/hand_gluestick_selected",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected",0,*GSSelectedRaw)
*GSSelected\loopStart=16
animationSetFrameSound(*GSSelected,1,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSSelected,6,#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM)
animationSetFrameSound(*GSSelected,9,#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY)
animationSetFrameSound(*GSSelected,11,#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT)
frameSetNoRecSound(*GSSelected\frames(9))
animationSetFrameLength(*GSSelected,0,2)
animationSetFrameLength(*GSSelected,1,2)
animationSetFrameLength(*GSSelected,2,3)
animationSetFrameLength(*GSSelected,3,4)
animationSetFrameLength(*GSSelected,5,9)
animationSetFrameLength(*GSSelected,6,3)
animationSetFrameLength(*GSSelected,7,2)
animationSetFrameLength(*GSSelected,8,3)
animationSetFrameLength(*GSSelected,10,8)
animationSetFrameLength(*GSSelected,12,3)
animationSetFrameLength(*GSSelected,13,3)
animationSetFrameLength(*GSSelected,14,3)
animationSetFrameLength(*GSSelected,15,4)
For i=16 To 24
	animationSetFrameLength(*GSSelected,i,10)
Next
animationSetFrameLength(*GSSelected,17,13)
animationSetFrameLength(*GSSelected,20,16)
animationSetFrameLength(*GSSelected,21,13)
animationSetFrameLength(*GSSelected,24,13)
animationSetFrameShadow(*GSSelected,0,-48)
animationSetFrameShadow(*GSSelected,1,-8)
animationSetFrameShadow(*GSSelected,3,12)
animationSetFrameShadow(*GSSelected,4,48)
animationSetFrameShadow(*GSSelected,5,80)
animationSetFrameShadow(*GSSelected,6,50)
animationSetFrameShadow(*GSSelected,7,32)
animationSetFrameShadow(*GSSelected,8,-32)
animationSetFrameShadow(*GSSelected,9,-64)
animationSetFrameShadow(*GSSelected,10,-72)
animationSetFrameShadow(*GSSelected,11,-40)
animationSetFrameShadow(*GSSelected,12,-20)
animationSetFrameShadow(*GSSelected,13,-8)
For i=14 To 24
	animationSetFrameShadow(*GSSelected,i,-12)
Next

*GSSelected_1WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected1WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 1 wind front",0,*GSSelected_1WindFrontRaw)
*GSSelected_2WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected2WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind front",0,*GSSelected_2WindFrontRaw)
*GSSelected_3WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected3WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind front",0,*GSSelected_3WindFrontRaw)
*GSSelected_4WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected4WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind front",0,*GSSelected_4WindFrontRaw)
*GSSelected_5WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected5WindFront",9,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind front",0,*GSSelected_5WindFrontRaw)
*GSSelected_6WindFront.animation=classGenerateAnimation(5,"image/hand_gluestick_selected6WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind front",0,*GSSelected_6WindFrontRaw)
animationSetFrameMovement(*GSSelected_6WindFront,1,60)
animationSetFrameLength(*GSSelected_6WindFront,1,4)
animationSetFrameLength(*GSSelected_6WindFront,2,5)
animationSetFrameLength(*GSSelected_6WindFront,3,6)
animationSetFrameLength(*GSSelected_6WindFront,4,7)
animationSetFrameLength(*GSSelected_6WindFront,5,8)
animationSetFrameOpacity(*GSSelected_6WindFront,3,192)
animationSetFrameOpacity(*GSSelected_6WindFront,4,128)
animationSetFrameOpacity(*GSSelected_6WindFront,5,64)
*GSSelected_7WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected7WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 7 wind front",0,*GSSelected_7WindFrontRaw)
*GSSelected_8WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected8WindFront",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind front",0,*GSSelected_8WindFrontRaw)
*GSSelected_9WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected9WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind front",0,*GSSelected_9WindFrontRaw)
*GSSelected_10WindFront1.animation=classGenerateAnimation(4,"image/hand_gluestick_selected10WindFront1_",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind front 1",0,*GSSelected_10WindFront1Raw)
animationSetFrameLength(*GSSelected_10WindFront1,1,4)
animationSetFrameLength(*GSSelected_10WindFront1,2,5)
animationSetFrameLength(*GSSelected_10WindFront1,3,6)
animationSetFrameLength(*GSSelected_10WindFront1,4,7)
animationSetFrameOpacity(*GSSelected_10WindFront1,2,192)
animationSetFrameOpacity(*GSSelected_10WindFront1,3,128)
animationSetFrameOpacity(*GSSelected_10WindFront1,4,64)
*GSSelected_10WindFront2.animation=classGenerateAnimation(4,"image/hand_gluestick_selected10WindFront2_",2,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind front 2",0,*GSSelected_10WindFront2Raw)
animationSetFrameSound(*GSSelected_10WindFront2,0,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameLength(*GSSelected_10WindFront2,1,4)
animationSetFrameLength(*GSSelected_10WindFront2,2,6)
animationSetFrameLength(*GSSelected_10WindFront2,3,8)
animationSetFrameLength(*GSSelected_10WindFront2,4,10)
animationSetFrameMovement(*GSSelected_10WindFront2,2,-32)
animationSetFrameMovement(*GSSelected_10WindFront2,3,-32)
animationSetFrameMovement(*GSSelected_10WindFront2,4,-8)
animationSetFrameOpacity(*GSSelected_10WindFront2,2,192)
animationSetFrameOpacity(*GSSelected_10WindFront2,3,128)
animationSetFrameOpacity(*GSSelected_10WindFront2,4,64)
*GSSelected_12WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected12WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind front",0,*GSSelected_12WindFrontRaw)
*GSSelected_13WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected13WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 13 wind front",0,*GSSelected_13WindFrontRaw)
*GSSelected_14WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_selected14WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 14 wind front",0,*GSSelected_14WindFrontRaw)
animationSetFrameLength(*GSSelected_14WindFront,1,4)
animationSetFrameLength(*GSSelected_14WindFront,2,5)
animationSetFrameLength(*GSSelected_14WindFront,3,7)
animationSetFrameOpacity(*GSSelected_14WindFront,1,192)
animationSetFrameOpacity(*GSSelected_14WindFront,2,128)
animationSetFrameOpacity(*GSSelected_14WindFront,3,64)
*GSSelected_15WindFront.animation=classGenerateAnimation(0,"image/hand_gluestick_selected15WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 15 wind front",0,*GSSelected_15WindFrontRaw)
*GSSelected_16WindFront.animation=classGenerateAnimation(3,"image/hand_gluestick_selected16WindFront",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 16 wind front",0,*GSSelected_16WindFrontRaw)
animationSetFrameLength(*GSSelected_16WindFront,1,4)
animationSetFrameLength(*GSSelected_16WindFront,2,5)
animationSetFrameLength(*GSSelected_16WindFront,3,7)
animationSetFrameOpacity(*GSSelected_16WindFront,1,192)
animationSetFrameOpacity(*GSSelected_16WindFront,2,128)
animationSetFrameOpacity(*GSSelected_16WindFront,3,64)

*GSSelected_2WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_selected2WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind back",0,*GSSelected_2WindBackRaw)
*GSSelected_3WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_selected3WindBack",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind back",0,*GSSelected_3WindBackRaw)
animationSetFrameLength(*GSSelected_3WindBack,1,5)
animationSetFrameOpacity(*GSSelected_3WindBack,1,192)
*GSSelected_5WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_selected5WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind back",0,*GSSelected_5WindBackRaw)
*GSSelected_6WindBack.animation=classGenerateAnimation(3,"image/hand_gluestick_selected6WindBack",3,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind back",0,*GSSelected_6WindBackRaw)
animationSetFrameLength(*GSSelected_6WindBack,1,4)
animationSetFrameLength(*GSSelected_6WindBack,2,5)
animationSetFrameLength(*GSSelected_6WindBack,3,7)
animationSetFrameOpacity(*GSSelected_6WindBack,1,192)
animationSetFrameOpacity(*GSSelected_6WindBack,2,128)
animationSetFrameOpacity(*GSSelected_6WindBack,3,64)
*GSSelected_7WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_selected7WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 7 wind back",0,*GSSelected_7WindBackRaw)
*GSSelected_8WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_selected8WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind back",0,*GSSelected_8WindBackRaw)
*GSSelected_9WindBack.animation=classGenerateAnimation(0,"image/hand_gluestick_selected9WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind back",0,*GSSelected_9WindBackRaw)
*GSSelected_12WindBack.animation=classGenerateAnimation(1,"image/hand_gluestick_selected12WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind back",0,*GSSelected_12WindBackRaw)
animationSetFrameLength(*GSSelected_12WindBack,1,6)
animationSetFrameOpacity(*GSSelected_12WindBack,1,192)

animationPrepareWind(*GSSelected,1)
*GSSelected\frontWind(0,0)=*GSSelected_1WindFront
*GSSelected\frontWind(1,0)=*GSSelected_2WindFront
*GSSelected\frontWind(2,0)=*GSSelected_3WindFront
*GSSelected\frontWind(3,0)=*GSSelected_4WindFront
*GSSelected\frontWind(4,0)=*GSSelected_5WindFront
*GSSelected\frontWind(5,0)=*GSSelected_6WindFront
*GSSelected\frontWind(6,0)=*GSSelected_7WindFront
*GSSelected\frontWind(7,0)=*GSSelected_8WindFront
*GSSelected\frontWind(8,0)=*GSSelected_9WindFront
*GSSelected\frontWind(9,0)=*GSSelected_10WindFront1
*GSSelected\frontWind(9,1)=*GSSelected_10WindFront2
*GSSelected\frontWind(11,0)=*GSSelected_12WindFront
*GSSelected\frontWind(12,0)=*GSSelected_13WindFront
*GSSelected\frontWind(13,0)=*GSSelected_14WindFront
*GSSelected\frontWind(14,0)=*GSSelected_15WindFront
*GSSelected\frontWind(15,0)=*GSSelected_16WindFront
*GSSelected\backWind(1,0)=*GSSelected_2WindBack
*GSSelected\backWind(2,0)=*GSSelected_3WindBack
*GSSelected\backWind(4,0)=*GSSelected_5WindBack
*GSSelected\backWind(5,0)=*GSSelected_6WindBack
*GSSelected\backWind(6,0)=*GSSelected_7WindBack
*GSSelected\backWind(7,0)=*GSSelected_8WindBack
*GSSelected\backWind(8,0)=*GSSelected_9WindBack
*GSSelected\backWind(11,0)=*GSSelected_12WindBack

;------- branching stuff
; *GSStat.statistic=statisticCreate(0,4,0,0,4,4,3,-1,-1,4,1,1)
  *GSStat.statistic=statisticCreate(0,6,0,0,6,4,4,-1,-1,5,4,1)

ReDim *tmpArray(2)
*tmpArray(0)=*gluestick_hitS
*tmpArray(1)=*finger_hit
*tmpArray(2)=*bullet_hitS;*metal_hit ; bullet impact

*GSStance_empty.stance=stanceCreate(*tmpArray(),0,"Empty")
; statisticCreate(*GSStance_empty\modificator,0,0,1,-1,0,0,0,0,0,0)
  statisticCreate(*GSStance_empty\modificator,0,1,2,-3,0,0,0,0,0,0)

*gluestick.class=classCreate(0,"Glue stick",*GSIdle1,*GSMoveFront,*GSMoveBack,*GSNeutral1,*GSSide1,*GSUp1,*GSBack1,*GSDown1,*GSHeavy1)
*gluestick\allStances(0)\name="Full (default)"
classAddStance(*gluestick,*GSStance_empty)
*gluestick\allStances(0)\specialcolor=#H2H_STANCE_COLOR_YELLOW
*gluestick\allStances(0)\alternatecolor=#H2H_STANCE_COLOR_GREEN
*gluestick\iconPath$="image\Gluestick.png"
*gluestick\stat=*GSStat
; *gluestick\desc$="Heavy fighter with brute strength. Brawls and shoots in short range\with its canon-like glue stick while being very hard to damage. However is\slow and rigid, compensated by an excellent blunt impact."
*gluestick\desc$="Heavy gunner with high brute strength and weight. Brawls and shoots in short range, bulldozing everything in its path."

ReDim *gluestick\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*gluestick\allStances(0)\materialClass(i)=*tmpArray(i)
Next

classGetSpawn(*gluestick)=*GSSpawn
classGetDeath(*gluestick)=*GSDeath
classGetJump(*gluestick)=*GSJump
classGetLand(*gluestick)=*GSLand
classGetHit(*gluestick)=*GShit
classGetDodge(*gluestick)=*GSDodge
classGetParry(*gluestick)=*GSParry
classGetSelection(*gluestick)=*GSSelection
classGetSelected(*gluestick)=*GSSelected

Dim *gluestick\otherIdle(1)
*gluestick\otherIdle(0)=*GSIdle2
*gluestick\otherIdle(1)=*GSIdle3
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 18
; EnableXP
; CPU = 1