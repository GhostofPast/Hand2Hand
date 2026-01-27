;-------- Idle 1
*RUIdle1.animation=classGenerateAnimation(9,"image/hand_ruler_idle1_",10,#H2H_ANIMATIONTYPE_IDLE,"Idle 1",1,*RUIdle1Raw)
animationSetFrameLength(*RUIdle1,0,14)
animationSetFrameLength(*RUIdle1,2,9)
animationSetFrameLength(*RUIdle1,3,6)
animationSetFrameLength(*RUIdle1,4,16)
animationSetFrameLength(*RUIdle1,5,12)
animationSetFrameLength(*RUIdle1,6,9)
animationSetFrameLength(*RUIdle1,7,8)
animationSetFrameLength(*RUIdle1,8,8)
animationSetFrameLength(*RUIdle1,9,14)
*RUIdle1_2WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_2WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 2 wind front",0,*RUIdle1_2WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_2WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_2WindFront,1,64)
*RUIdle1_3WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_3WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 3 wind front",0,*RUIdle1_3WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_3WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_3WindFront,1,64)
*RUIdle1_4WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_4WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 4 wind front",0,*RUIdle1_4WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_4WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_4WindFront,1,64)
*RUIdle1_5WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_idle1_5WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 5 wind front",0,*RUIdle1_5WindFrontRaw)
animationSetFrameLength(*RUIdle1_5WindFront,1,7)
animationSetFrameLength(*RUIdle1_5WindFront,2,6)
animationSetFrameOpacity(*RUIdle1_5WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_5WindFront,1,64)
*RUIdle1_7WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_7WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 7 wind front",0,*RUIdle1_7WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_7WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_7WindFront,1,64)
*RUIdle1_8WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_idle1_8WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 8 wind front",0,*RUIdle1_8WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_8WindFront,0,128)
*RUIdle1_9WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_idle1_9WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 9 wind front",0,*RUIdle1_9WindFrontRaw)
animationSetFrameOpacity(*RUIdle1_9WindFront,0,128)
*RUIdle1_10WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_idle1_10WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 10 wind front",0,*RUIdle1_10WindFrontRaw)
animationSetFrameLength(*RUIdle1_10WindFront,1,7)
animationSetFrameLength(*RUIdle1_10WindFront,2,6)
animationSetFrameOpacity(*RUIdle1_10WindFront,0,128)
animationSetFrameOpacity(*RUIdle1_10WindFront,1,64)
animationSetFrameOpacity(*RUIdle1_10WindFront,2,128)

*RUIdle1_2WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_2WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 2 wind back",0,*RUIdle1_2WindBackRaw)
animationSetFrameOpacity(*RUIdle1_2WindBack,0,128)
animationSetFrameOpacity(*RUIdle1_2WindBack,1,64)
*RUIdle1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_idle1_3WindBack",10,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 3 wind back",0,*RUIdle1_3WindBackRaw)
animationSetFrameOpacity(*RUIdle1_3WindBack,0,128)
*RUIdle1_5WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_idle1_5WindBack",10,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 5 wind back",0,*RUIdle1_5WindBackRaw)
animationSetFrameOpacity(*RUIdle1_5WindBack,0,128)
*RUIdle1_6WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_6WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 6 wind back",0,*RUIdle1_6WindBackRaw)
animationSetFrameOpacity(*RUIdle1_6WindBack,0,128)
animationSetFrameOpacity(*RUIdle1_6WindBack,1,64)
*RUIdle1_9WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_idle1_9WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"Idle 1 9 wind back",0,*RUIdle1_9WindBackRaw)
animationSetFrameOpacity(*RUIdle1_9WindBack,0,128)
animationSetFrameOpacity(*RUIdle1_9WindBack,1,64)

animationPrepareWind(*RUIdle1,0)
*RUIdle1\frontWind(1,0)=*RUIdle1_2WindFront
*RUIdle1\frontWind(2,0)=*RUIdle1_3WindFront
*RUIdle1\frontWind(3,0)=*RUIdle1_4WindFront
*RUIdle1\frontWind(4,0)=*RUIdle1_5WindFront
*RUIdle1\frontWind(6,0)=*RUIdle1_7WindFront
*RUIdle1\frontWind(7,0)=*RUIdle1_8WindFront
*RUIdle1\frontWind(8,0)=*RUIdle1_9WindFront
*RUIdle1\frontWind(9,0)=*RUIdle1_10WindFront
*RUIdle1\backWind(1,0)=*RUIdle1_2WindBack
*RUIdle1\backWind(2,0)=*RUIdle1_3WindBack
*RUIdle1\backWind(4,0)=*RUIdle1_5WindBack
*RUIdle1\backWind(5,0)=*RUIdle1_6WindBack
*RUIdle1\backWind(8,0)=*RUIdle1_9WindBack
animationFreeMovementWind(*RUIdle1)

animationShiftShift(*RUIdle1,0,-15)
animationShiftShift(*RUIdle1,1,-10)
animationShiftShift(*RUIdle1,2,-5)
animationShiftShift(*RUIdle1,4,5)
animationShiftShift(*RUIdle1,5,10)
animationShiftShift(*RUIdle1,6,15)
animationShiftShift(*RUIdle1,7,10)
animationShiftShift(*RUIdle1,8,5)
animationShiftShift(*RUIdle1,9,-7)
animationSetFrameShadow(*RUIdle1,0,-20)
animationSetFrameShadow(*RUIdle1,1,-15)
animationSetFrameShadow(*RUIdle1,2,-10)
animationSetFrameShadow(*RUIdle1,3,-5)
animationSetFrameShadow(*RUIdle1,5,5)
animationSetFrameShadow(*RUIdle1,6,10)
animationSetFrameShadow(*RUIdle1,7,5)
animationSetFrameShadow(*RUIdle1,8,-5)
animationSetFrameShadow(*RUIdle1,9,-12)

;-------- Move Front
*RUMoveFront.animation=classGenerateAnimation(9,"image/hand_ruler_move_front",3,#H2H_ANIMATIONTYPE_FRONT,"Move Front",1,*RUMoveFrontRaw)
; setFrameLength(*RUMoveFront,1,4)
; setFrameLength(*RUMoveFront,2,5)
; setFrameLength(*RUMoveFront,3,6)
; setFrameLength(*RUMoveFront,4,7)
; setFrameLength(*RUMoveFront,5,5)
; setFrameLength(*RUMoveFront,6,4)
; *ruler_stat.statistic=statisticCreate(0,2,1,1,2,2,1,4,-1,2,5,4)
; *ruler_stat.statistic=statisticCreate(0,4,2,1,6,4,3,5,-1,5,9,7)
animationShiftShift(*RUMoveFront,0,5,-10)
animationShiftShift(*RUMoveFront,1,2)
animationShiftShift(*RUMoveFront,2,-1)
animationShiftShift(*RUMoveFront,3,-4)
animationShiftShift(*RUMoveFront,4,-1)
animationShiftShift(*RUMoveFront,5,2)
animationShiftShift(*RUMoveFront,6,5)
animationShiftShift(*RUMoveFront,7,8)
animationShiftShift(*RUMoveFront,8,11)
animationShiftShift(*RUMoveFront,9,8)
animationSetFrameShadow(*RUMoveFront,1,-3)
animationSetFrameShadow(*RUMoveFront,2,-6)
animationSetFrameShadow(*RUMoveFront,3,-9)
animationSetFrameShadow(*RUMoveFront,4,-6)
animationSetFrameShadow(*RUMoveFront,5,-3)
animationSetFrameShadow(*RUMoveFront,7,3)
animationSetFrameShadow(*RUMoveFront,8,6)
animationSetFrameShadow(*RUMoveFront,9,3)

;-------- Move Back
*RUMoveBack.animation=classGenerateAnimation(8,"image/hand_ruler_move_back",3,#H2H_ANIMATIONTYPE_BACK,"Move Back",1,*RUMoveBackRaw)
Swap *RUMoveBack\frames(5),*RUMoveBack\frames(6)
animationSetFrameLength(*RUMoveBack,6,5)
animationSetFrameLength(*RUMoveBack,7,5)

;-------- Neutral 1
*RUNeutral1.animation=classGenerateAnimation(10,"image/hand_ruler_neutral1_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*RUNeutral1Raw,14,#H2H_DAMAGETYPE_CUT,4)
animationSetFrameCDN(*RUNeutral1,10,5)
animationSetUngrounded(*RUNeutral1)
animationSetFrameMovement(*RUNeutral1,0,19,0)
animationSetFrameMovement(*RUNeutral1,1,15,5)
animationSetFrameMovement(*RUNeutral1,2,-50,-8)
animationSetFrameMovement(*RUNeutral1,4,38,-3)
animationSetFrameMovement(*RUNeutral1,5,-55,3)
animationSetFrameMovement(*RUNeutral1,7,47,5)
animationSetFrameMovement(*RUNeutral1,8,-45,5)
animationSetFrameMovement(*RUNeutral1,9,15,-15)
animationSetFrameMovement(*RUNeutral1,10,5,5)
animationSetFrameLength(*RUNeutral1,0,4)
animationSetFrameLength(*RUNeutral1,1,3)
animationSetFrameLength(*RUNeutral1,2,4)
animationSetFrameLength(*RUNeutral1,3,3)
animationSetFrameLength(*RUNeutral1,5,4)
animationSetFrameLength(*RUNeutral1,6,3)
animationSetFrameLength(*RUNeutral1,8,4)
animationSetFrameLength(*RUNeutral1,9,3)
animationSetFrameLength(*RUNeutral1,10,14)
animationSetFrameDamageCut(*RUNeutral1,3)
animationSetFrameDamageCut(*RUNeutral1,6)
animationSetFrameSound(*RUNeutral1,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*RUNeutral1,4,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*RUNeutral1,8,#H2H_SOUND_ID_SWISHMEDIUM)
*RUNeutral1_1WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind front",0,*RUNeutral1_1WindFrontRaw)
animationSetFrameLength(*RUNeutral1_1WindFront,1,5)
animationSetFrameLength(*RUNeutral1_1WindFront,2,6)
animationSetFrameOpacity(*RUNeutral1_1WindFront,2,192)
*RUNeutral1_2WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral1_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*RUNeutral1_2WindFrontRaw)
animationSetFrameLength(*RUNeutral1_2WindFront,1,4)
animationSetFrameLength(*RUNeutral1_2WindFront,2,5)
animationSetFrameLength(*RUNeutral1_2WindFront,3,6)
animationSetFrameOpacity(*RUNeutral1_2WindFront,2,192)
animationSetFrameOpacity(*RUNeutral1_2WindFront,3,128)
*RUNeutral1_3WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral1_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind front",0,*RUNeutral1_3WindFrontRaw)
animationSetFrameLength(*RUNeutral1_3WindFront,1,5)
animationSetFrameLength(*RUNeutral1_3WindFront,2,6)
animationSetFrameLength(*RUNeutral1_3WindFront,3,7)
animationSetFrameOpacity(*RUNeutral1_3WindFront,2,192)
animationSetFrameOpacity(*RUNeutral1_3WindFront,3,128)
*RUNeutral1_5WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_5WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 5 wind front",0,*RUNeutral1_5WindFrontRaw)
animationSetFrameLength(*RUNeutral1_5WindFront,1,4)
animationSetFrameLength(*RUNeutral1_5WindFront,2,5)
*RUNeutral1_6WindFront.animation=classGenerateAnimation(4,"image/hand_ruler_neutral1_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind front",0,*RUNeutral1_6WindFrontRaw)
animationSetFrameLength(*RUNeutral1_6WindFront,1,5)
animationSetFrameLength(*RUNeutral1_6WindFront,2,6)
animationSetFrameLength(*RUNeutral1_6WindFront,3,6)
animationSetFrameLength(*RUNeutral1_6WindFront,4,7)
animationSetFrameOpacity(*RUNeutral1_6WindFront,3,192)
animationSetFrameOpacity(*RUNeutral1_6WindFront,4,128)
*RUNeutral1_8WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_8WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind front",0,*RUNeutral1_8WindFrontRaw)
animationSetFrameLength(*RUNeutral1_8WindFront,1,5)
animationSetFrameLength(*RUNeutral1_8WindFront,2,6)
animationSetFrameOpacity(*RUNeutral1_8WindFront,2,192)
*RUNeutral1_9WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral1_9WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind front",0,*RUNeutral1_9WindFrontRaw)
animationSetFrameLength(*RUNeutral1_9WindFront,1,5)
animationSetFrameLength(*RUNeutral1_9WindFront,2,5)
animationSetFrameLength(*RUNeutral1_9WindFront,3,6)
animationSetFrameOpacity(*RUNeutral1_9WindFront,2,192)
animationSetFrameOpacity(*RUNeutral1_9WindFront,3,128)
*RUNeutral1_10WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_10WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 10 wind front",0,*RUNeutral1_10WindFrontRaw)
animationSetFrameLength(*RUNeutral1_10WindFront,1,5)
animationSetFrameLength(*RUNeutral1_10WindFront,2,6)
animationSetFrameOpacity(*RUNeutral1_10WindFront,2,192)

*RUNeutral1_3WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind back",0,*RUNeutral1_3WindBackRaw)
animationSetFrameLength(*RUNeutral1_3WindBack,1,5)
animationSetFrameLength(*RUNeutral1_3WindBack,2,6)
animationSetFrameOpacity(*RUNeutral1_3WindBack,2,192)
*RUNeutral1_5WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_neutral1_5WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 5 wind back",0,*RUNeutral1_5WindBackRaw)
animationSetFrameLength(*RUNeutral1_5WindBack,1,6)
animationSetFrameOpacity(*RUNeutral1_5WindBack,1,192)
*RUNeutral1_6WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_6WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind back",0,*RUNeutral1_6WindBackRaw)
animationSetFrameLength(*RUNeutral1_6WindBack,1,5)
animationSetFrameLength(*RUNeutral1_6WindBack,2,6)
animationSetFrameOpacity(*RUNeutral1_6WindBack,2,192)
*RUNeutral1_8WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_neutral1_8WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind back",0,*RUNeutral1_8WindBackRaw)
animationSetFrameLength(*RUNeutral1_8WindBack,1,6)
animationSetFrameOpacity(*RUNeutral1_8WindBack,1,192)
*RUNeutral1_9WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral1_9WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind back",0,*RUNeutral1_9WindBackRaw)
animationSetFrameLength(*RUNeutral1_9WindBack,1,5)
animationSetFrameLength(*RUNeutral1_9WindBack,2,6)
animationSetFrameOpacity(*RUNeutral1_9WindBack,2,192)

animationPrepareWind(*RUNeutral1,0)
*RUNeutral1\frontWind(0,0)=*RUNeutral1_1WindFront
*RUNeutral1\frontWind(1,0)=*RUNeutral1_2WindFront
*RUNeutral1\frontWind(2,0)=*RUNeutral1_3WindFront
*RUNeutral1\frontWind(4,0)=*RUNeutral1_5WindFront
*RUNeutral1\frontWind(5,0)=*RUNeutral1_6WindFront
*RUNeutral1\frontWind(7,0)=*RUNeutral1_8WindFront
*RUNeutral1\frontWind(8,0)=*RUNeutral1_9WindFront
*RUNeutral1\frontWind(9,0)=*RUNeutral1_10WindFront
*RUNeutral1\backWind(2,0)=*RUNeutral1_3WindBack
*RUNeutral1\backWind(4,0)=*RUNeutral1_5WindBack
*RUNeutral1\backWind(5,0)=*RUNeutral1_6WindBack
*RUNeutral1\backWind(7,0)=*RUNeutral1_8WindBack
*RUNeutral1\backWind(8,0)=*RUNeutral1_9WindBack
animationFreeMovementWind(*RUNeutral1)
animationSetExtended(*RUNeutral1)

;-------- Neutral 1 alt
*RUNeutral1Alt.animation=animationDataGive()
animationCopy(*RUNeutral1Alt,*RUNeutral1)
*RUNeutral1Alt\name+" alt"
*RUNeutral1alt_1WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_neutral1_1AltWindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 alt 1 wind front",0,*RUNeutral1_1AltWindFrontRaw)
frameSetExtended(*RUNeutral1alt_1WindFront,1)
*RUNeutral1alt\frontWind(0,0)=*RUNeutral1alt_1WindFront

;-------- Neutral 2
*RUNeutral2.animation=classGenerateAnimation(9,"image/hand_ruler_neutral2_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2",0,*RUNeutral2Raw,12,#H2H_DAMAGETYPE_CUT,4)
animationSetFrameCDN(*RUNeutral2,9,5)
animationSetUngrounded(*RUNeutral2)
animationSetFrameMovement(*RUNeutral2,0,5,-5)
animationSetFrameMovement(*RUNeutral2,1,5,-5)
animationSetFrameMovement(*RUNeutral2,2,-64,10)
animationSetFrameMovement(*RUNeutral2,4,64,-10)
animationSetFrameMovement(*RUNeutral2,5,-64,10)
animationSetFrameMovement(*RUNeutral2,6,-16,-15)
animationSetFrameMovement(*RUNeutral2,7,80,-15)
animationSetFrameMovement(*RUNeutral2,8,-64,15)
animationSetFrameDamageCut(*RUNeutral2,3)
animationSetFrameDamageCut(*RUNeutral2,6)
animationSetFrameLength(*RUNeutral2,0,3)
animationSetFrameLength(*RUNeutral2,1,3)
animationSetFrameLength(*RUNeutral2,2,4)
animationSetFrameLength(*RUNeutral2,3,4)
animationSetFrameLength(*RUNeutral2,5,4)
animationSetFrameLength(*RUNeutral2,6,4)
animationSetFrameSound(*RUNeutral2,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*RUNeutral2,4,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*RUNeutral2,5,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*RUNeutral2,7,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*RUNeutral2,8,#H2H_SOUND_ID_SWISHMEDIUM)
*RUNeutral2_1WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_neutral2_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 1 wind front",0,*RUNeutral2_1WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_1WindFront,1,192)
animationSetFrameLength(*RUNeutral2_1WindFront,1,5)
*RUNeutral2_3WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind front",0,*RUNeutral2_3WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_3WindFront,1,192)
animationSetFrameOpacity(*RUNeutral2_3WindFront,2,128)
animationSetFrameOpacity(*RUNeutral2_3WindFront,3,64)
animationSetFrameLength(*RUNeutral2_3WindFront,1,5)
animationSetFrameLength(*RUNeutral2_3WindFront,2,6)
animationSetFrameLength(*RUNeutral2_3WindFront,3,7)
*RUNeutral2_5WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 5 wind front",0,*RUNeutral2_5WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_5WindFront,1,192)
animationSetFrameOpacity(*RUNeutral2_5WindFront,2,128)
animationSetFrameOpacity(*RUNeutral2_5WindFront,3,64)
animationSetFrameLength(*RUNeutral2_5WindFront,1,5)
animationSetFrameLength(*RUNeutral2_5WindFront,2,6)
animationSetFrameLength(*RUNeutral2_5WindFront,3,7)
*RUNeutral2_6WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 6 wind front",0,*RUNeutral2_6WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_6WindFront,1,192)
animationSetFrameOpacity(*RUNeutral2_6WindFront,2,128)
animationSetFrameOpacity(*RUNeutral2_6WindFront,3,64)
animationSetFrameLength(*RUNeutral2_6WindFront,1,5)
animationSetFrameLength(*RUNeutral2_6WindFront,2,6)
animationSetFrameLength(*RUNeutral2_6WindFront,3,7)
*RUNeutral2_8WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_neutral2_8WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 8 wind front",0,*RUNeutral2_8WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_8WindFront,1,192)
animationSetFrameOpacity(*RUNeutral2_8WindFront,2,128)
animationSetFrameLength(*RUNeutral2_8WindFront,1,6)
animationSetFrameLength(*RUNeutral2_8WindFront,2,7)
*RUNeutral2_9WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_9WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 9 wind front",0,*RUNeutral2_9WindFrontRaw)
animationSetFrameOpacity(*RUNeutral2_9WindFront,1,192)
animationSetFrameOpacity(*RUNeutral2_9WindFront,2,128)
animationSetFrameOpacity(*RUNeutral2_9WindFront,3,64)
animationSetFrameLength(*RUNeutral2_9WindFront,1,5)
animationSetFrameLength(*RUNeutral2_9WindFront,2,6)
animationSetFrameLength(*RUNeutral2_9WindFront,3,7)

*RUNeutral2_3WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_3WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind back",0,*RUNeutral2_3WindBackRaw)
animationSetFrameOpacity(*RUNeutral2_3WindBack,1,192)
animationSetFrameOpacity(*RUNeutral2_3WindBack,2,128)
animationSetFrameOpacity(*RUNeutral2_3WindBack,3,64)
animationSetFrameLength(*RUNeutral2_3WindBack,1,4)
animationSetFrameLength(*RUNeutral2_3WindBack,2,5)
animationSetFrameLength(*RUNeutral2_3WindBack,3,7)
*RUNeutral2_5WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral2_5WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 5 wind back",0,*RUNeutral2_5WindBackRaw)
animationSetFrameOpacity(*RUNeutral2_5WindBack,1,192)
animationSetFrameOpacity(*RUNeutral2_5WindBack,2,128)
animationSetFrameLength(*RUNeutral2_5WindBack,1,4)
animationSetFrameLength(*RUNeutral2_5WindBack,2,5)
*RUNeutral2_6WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral2_6WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 6 wind back",0,*RUNeutral2_6WindBackRaw)
animationSetFrameOpacity(*RUNeutral2_6WindBack,1,192)
animationSetFrameOpacity(*RUNeutral2_6WindBack,2,128)
animationSetFrameLength(*RUNeutral2_6WindBack,1,4)
animationSetFrameLength(*RUNeutral2_6WindBack,2,5)
*RUNeutral2_8WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_neutral2_8WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 8 wind back",0,*RUNeutral2_8WindBackRaw)
animationSetFrameOpacity(*RUNeutral2_8WindBack,1,192)
animationSetFrameOpacity(*RUNeutral2_8WindBack,2,128)
animationSetFrameLength(*RUNeutral2_8WindBack,1,4)
animationSetFrameLength(*RUNeutral2_8WindBack,2,5)
*RUNeutral2_9WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_neutral2_9WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 9 wind back",0,*RUNeutral2_9WindBackRaw)
animationSetFrameOpacity(*RUNeutral2_9WindBack,1,192)
animationSetFrameOpacity(*RUNeutral2_9WindBack,2,128)
animationSetFrameOpacity(*RUNeutral2_9WindBack,3,64)
animationSetFrameLength(*RUNeutral2_9WindBack,1,5)
animationSetFrameLength(*RUNeutral2_9WindBack,2,7)
animationSetFrameLength(*RUNeutral2_9WindBack,3,8)

animationPrepareWind(*RUNeutral2,0)
*RUNeutral2\frontWind(0,0)=*RUNeutral2_1WindFront
*RUNeutral2\frontWind(2,0)=*RUNeutral2_3WindFront
*RUNeutral2\frontWind(4,0)=*RUNeutral2_5WindFront
*RUNeutral2\frontWind(5,0)=*RUNeutral2_6WindFront
*RUNeutral2\frontWind(7,0)=*RUNeutral2_8WindFront
*RUNeutral2\frontWind(8,0)=*RUNeutral2_9WindFront
*RUNeutral2\backWind(2,0)=*RUNeutral2_3WindBack
*RUNeutral2\backWind(4,0)=*RUNeutral2_5WindBack
*RUNeutral2\backWind(5,0)=*RUNeutral2_6WindBack
*RUNeutral2\backWind(7,0)=*RUNeutral2_8WindBack
*RUNeutral2\backWind(8,0)=*RUNeutral2_9WindBack
animationSetExtended(*RUNeutral2)

;-------- Side 1
*RUSide1.animation=classGenerateAnimation(3,"image/hand_ruler_side1_",7,#H2H_ANIMATIONTYPE_NSIDE,"Side 1",0,*RUSide1Raw,18,#H2H_DAMAGETYPE_CUT,7)
animationSetFrameCDN(*RUSide1,3,8)
animationSetUngrounded(*RUSide1)
For i=0 To 3
	animationSetFrameLength(*RUSide1,i,6-i)
Next
animationSetFrameSound(*RUSide1,0,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSide1,0,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSide1,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*RUSide1,2,-1,1)
animationSetFrameMovement(*RUSide1,0,-60)
animationSetFrameMovement(*RUSide1,1,-45,30)
animationSetFrameMovement(*RUSide1,2,-30)
animationSetFrameMovement(*RUSide1,3,-15)
animationSetFrameLength(*RUSide1,3,12)
animationSetFrameDamageDuration(*RUSide1,3,4)
*RUSide1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side1_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 1 wind front",0,*RUSide1_1WindFrontRaw)
*RUSide1_2WindFront.animation=classGenerateAnimation(4,"image/hand_ruler_side1_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 2 wind front",0,*RUSide1_2WindFrontRaw)
animationSetFrameLength(*RUSide1_2WindFront,1,4)
animationSetFrameLength(*RUSide1_2WindFront,2,5)
animationSetFrameLength(*RUSide1_2WindFront,3,5)
animationSetFrameLength(*RUSide1_2WindFront,4,6)
animationSetFrameOpacity(*RUSide1_2WindFront,3,192)
animationSetFrameOpacity(*RUSide1_2WindFront,4,128)
*RUSide1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side1_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 3 wind front",0,*RUSide1_3WindFrontRaw)
*RUSide1_4WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_side1_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 4 wind front",0,*RUSide1_4WindFrontRaw)
animationSetFrameLength(*RUSide1_4WindFront,1,5)
animationSetFrameLength(*RUSide1_4WindFront,2,6)
animationSetFrameLength(*RUSide1_4WindFront,3,6)
animationSetFrameOpacity(*RUSide1_4WindFront,3,192)

*RUSide1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side1_1WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 1 wind back",0,*RUSide1_1WindBackRaw)
*RUSide1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side1_2WindBack",7,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 2 wind back",0,*RUSide1_2WindBackRaw)
*RUSide1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side1_3WindBack",8,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 3 wind back",0,*RUSide1_3WindBackRaw)
*RUSide1_4WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_side1_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 1 4 wind back",0,*RUSide1_4WindBackRaw)
animationSetFrameLength(*RUSide1_4WindBack,1,4)
animationSetFrameLength(*RUSide1_4WindBack,2,5)
animationSetFrameLength(*RUSide1_4WindBack,3,6)
animationSetFrameOpacity(*RUSide1_4WindBack,3,192)

animationPrepareWind(*RUSide1,0)
*RUSide1\frontWind(0,0)=*RUSide1_1WindFront
*RUSide1\frontWind(1,0)=*RUSide1_2WindFront
*RUSide1\frontWind(2,0)=*RUSide1_3WindFront
*RUSide1\frontWind(3,0)=*RUSide1_4WindFront
*RUSide1\backWind(0,0)=*RUSide1_1WindBack
*RUSide1\backWind(1,0)=*RUSide1_2WindBack
*RUSide1\backWind(2,0)=*RUSide1_3WindBack
*RUSide1\backWind(3,0)=*RUSide1_4WindBack
animationFreeMovementWind(*RUSide1)
animationSetExtended(*RUSide1)
animationGetNeutral(*RUSide1)=*RUNeutral2

;-------- Side 2
*RUSide2.animation=classGenerateAnimation(5,"image/hand_ruler_side2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2",0,*RUSide2Raw,15,#H2H_DAMAGETYPE_CUT,7)
animationSetFrameCDN(*RUSide2,5,9)
animationSetUngrounded(*RUSide2)
animationGetSide(*RUSide1)=*RUSide2
animationSetFrameLength(*RUSide2,0,6)
animationSetFrameLength(*RUSide2,5,12)
animationSetFrameDamageDuration(*RUSide2,5,4)
animationSetFrameDamage(*RUSide2,3,6)
animationSetFrameDamage(*RUSide2,5,5)
animationSetFrameMovement(*RUSide2,0,-10,5) ; 10
animationSetFrameMovement(*RUSide2,1,-20,5) ; 10
animationSetFrameMovement(*RUSide2,2,-30,2)  ; 5
animationSetFrameMovement(*RUSide2,3,-40,2)  ; 5
animationSetFrameMovement(*RUSide2,4,-10)
animationSetFrameMovement(*RUSide2,5,-10)
animationSetFrameSound(*RUSide2,0,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSide2,0,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSide2,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*RUSide2,3,-1,1)

*RUSide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side2_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind front",0,*RUSide2_1WindFrontRaw)
*RUSide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side2_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind front",0,*RUSide2_2WindFrontRaw)
*RUSide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side2_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind front",0,*RUSide2_3WindFrontRaw)
*RUSide2_4WindFront.animation=classGenerateAnimation(4,"image/hand_ruler_side2_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind front",0,*RUSide2_4WindFrontRaw)
animationSetFrameLength(*RUSide2_4WindFront,1,5)
animationSetFrameLength(*RUSide2_4WindFront,2,5)
animationSetFrameLength(*RUSide2_4WindFront,3,6)
animationSetFrameLength(*RUSide2_4WindFront,4,7)
animationSetFrameOpacity(*RUSide2_4WindFront,3,192)
animationSetFrameOpacity(*RUSide2_4WindFront,4,128)
*RUSide2_5WindFront.animation=classGenerateAnimation(4,"image/hand_ruler_side2_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 5 wind front",0,*RUSide2_5WindFrontRaw)
animationSetFrameLength(*RUSide2_5WindFront,1,5)
animationSetFrameLength(*RUSide2_5WindFront,2,6)
animationSetFrameLength(*RUSide2_5WindFront,3,7)
animationSetFrameLength(*RUSide2_5WindFront,4,8)
animationSetFrameOpacity(*RUSide2_5WindFront,3,192)
animationSetFrameOpacity(*RUSide2_5WindFront,4,128)

*RUSide2_1WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side2_1WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 1 wind back",0,*RUSide2_1WindBackRaw)
*RUSide2_2WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side2_2WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 2 wind back",0,*RUSide2_2WindBackRaw)
*RUSide2_3WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side2_3WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 3 wind back",0,*RUSide2_3WindBackRaw)
*RUSide2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_side2_4WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 2 4 wind back",0,*RUSide2_4WindBackRaw)

animationPrepareWind(*RUSide2,0)
*RUSide2\frontWind(0,0)=*RUSide2_1WindFront
*RUSide2\frontWind(1,0)=*RUSide2_2WindFront
*RUSide2\frontWind(2,0)=*RUSide2_3WindFront
*RUSide2\frontWind(3,0)=*RUSide2_4WindFront
*RUSide2\frontWind(4,0)=*RUSide2_5WindFront
*RUSide2\backWind(0,0)=*RUSide2_1WindBack
*RUSide2\backWind(1,0)=*RUSide2_2WindBack
*RUSide2\backWind(2,0)=*RUSide2_3WindBack
*RUSide2\backWind(3,0)=*RUSide2_4WindBack
animationFreeMovementWind(*RUSide2)
animationSetExtended(*RUSide2)
animationGetNeutral(*RUSide2)=*RUNeutral1Alt
animationGetSide(*RUNeutral2)=*RUSide2

;-------- Side 3
*RUSide3.animation=classGenerateAnimation(5,"image/hand_ruler_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3",0,*RUSide3Raw,24,#H2H_DAMAGETYPE_CUT,9)
animationSetFrameCDN(*RUSide3,5,12)
animationSetUngrounded(*RUSide3)
animationSetComboEnd(*RUSide3,#True)
animationSetFrameDamage(*RUSide3,3,7)
animationSetFrameSound(*RUSide3,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*RUSide3,0,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSide3,2,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSide3,2,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSide3,5,#H2H_SOUND_ID_HAND_LAND)
animationSetFrameSound(*RUSide3,5,#H2H_SOUND_ID_METALIMPACTGROUNDMEDIUM,1)
animationSetFrameLength(*RUSide3,3,4)
animationSetFrameLength(*RUSide3,4,3)
animationSetFrameLength(*RUSide3,5,15)
animationSetFrameDamageDuration(*RUSide3,5,4)
; animationSetFrameMovement(*RUSide3,0,0,-24)
animationSetFrameMovement(*RUSide3,1,0,-48) ; -32
animationSetFrameMovement(*RUSide3,2,0,-32) ; -16
animationSetFrameMovement(*RUSide3,3,-48,-16) ; 0
animationSetFrameMovement(*RUSide3,4,-16) ; 32
animationSetFrameMovement(*RUSide3,5,-64) ; 40

*RUSide3_1WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_side3_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 1 wind front",0,*RUSide3_1WindFrontRaw)
*RUSide3_2WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_side3_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 2 wind front",0,*RUSide3_2WindFrontRaw)
*RUSide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side3_3WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 3 wind front",0,*RUSide3_3WindFrontRaw)
*RUSide3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side3_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 4 wind front",0,*RUSide3_4WindFrontRaw)
*RUSide3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_side3_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 5 wind front",0,*RUSide3_5WindFrontRaw)
*RUSide3_6WindFront1.animation=classGenerateAnimation(5,"image/hand_ruler_side3_6WindFront1_",2,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 6 wind front 1",0,*RUSide3_6WindFront1Raw)
animationSetFrameLength(*RUSide3_6WindFront1,1,4)
animationSetFrameLength(*RUSide3_6WindFront1,2,5)
animationSetFrameLength(*RUSide3_6WindFront1,3,5)
animationSetFrameLength(*RUSide3_6WindFront1,4,6)
animationSetFrameLength(*RUSide3_6WindFront1,5,7)
animationSetFrameOpacity(*RUSide3_6WindFront1,3,192)
animationSetFrameOpacity(*RUSide3_6WindFront1,4,128)
animationSetFrameOpacity(*RUSide3_6WindFront1,5,64)
*RUSide3_6WindFront2.animation=classGenerateAnimation(3,"image/hand_ruler_side3_6WindFront2_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 6 wind front 2",0,*RUSide3_6WindFront2Raw)
animationSetFrameLength(*RUSide3_6WindFront2,1,3)
animationSetFrameLength(*RUSide3_6WindFront2,2,4)
animationSetFrameLength(*RUSide3_6WindFront2,3,4)
animationSetFrameOpacity(*RUSide3_6WindFront2,3,192)

*RUSide3_4WindBack.animation=classGenerateAnimation(5,"image/hand_ruler_side3_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 3 4 wind back",0,*RUSide3_4WindBackRaw)
animationSetFrameLength(*RUSide3_4WindBack,1,4)
animationSetFrameLength(*RUSide3_4WindBack,2,5)
animationSetFrameLength(*RUSide3_4WindBack,3,5)
animationSetFrameLength(*RUSide3_4WindBack,4,6)
animationSetFrameLength(*RUSide3_4WindBack,5,7)
animationSetFrameOpacity(*RUSide3_4WindBack,3,192)
animationSetFrameOpacity(*RUSide3_4WindBack,4,128)
animationSetFrameOpacity(*RUSide3_4WindBack,5,64)

animationPrepareWind(*RUSide3,1)
*RUSide3\frontWind(0,0)=*RUSide3_1WindFront
*RUSide3\frontWind(1,0)=*RUSide3_2WindFront
*RUSide3\frontWind(2,0)=*RUSide3_3WindFront
*RUSide3\frontWind(3,0)=*RUSide3_4WindFront
*RUSide3\frontWind(4,0)=*RUSide3_5WindFront
*RUSide3\frontWind(5,0)=*RUSide3_6WindFront1
*RUSide3\frontWind(5,1)=*RUSide3_6WindFront2
*RUSide3\backWind(3,0)=*RUSide3_4WindBack
animationFreeMovementWind(*RUSide3)
animationSetExtended(*RUSide3)
animationGetSide(*RUSide2)=*RUSide3
animationGetSide(*RUNeutral1)=*RUSide3

;-------- Side 3 alt
*RUSide3Alt.animation=animationDataGive()
animationCopy(*RUSide3Alt,*RUSide3)
*RUSide3Alt\name+" alt"
animationGetSide(*RUNeutral1Alt)=*RUSide3Alt
animationSetFrameMovement(*RUSide3Alt,3,-48,16)
animationSetFrameMovement(*RUSide3Alt,4,-16,32)
animationSetFrameMovement(*RUSide3Alt,5,-64,40)

;-------- Jump
*RUJump.animation=classGenerateAnimation(10,"image/hand_ruler_jump",5,#H2H_ANIMATIONTYPE_JUMP,"Jump",0,*RUJumpRaw)

;-------- Land
*RULand.animation=classGenerateAnimation(5,"image/hand_ruler_land",5,#H2H_ANIMATIONTYPE_LAND,"Land",0,*RULandRaw)
animationSetFrameLength(*RULand,1,3)
animationSetFrameLength(*RULand,2,4)
animationSetFrameLength(*RULand,3,7)
animationSetFrameLength(*RULand,4,8)
animationSetFrameLength(*RULand,5,6)
animationShiftShift(*RULand,1,0,20)
animationShiftShift(*RULand,2,0,40)
animationShiftShift(*RULand,3,0,75)
animationShiftShift(*RULand,4,0,40)
animationShiftShift(*RULand,5,0,20)
animationSetFrameShadow(*RULand,1,0,20)
animationSetFrameShadow(*RULand,2,0,50)
animationSetFrameShadow(*RULand,3,0,100)
animationSetFrameShadow(*RULand,4,0,75)
animationSetFrameShadow(*RULand,5,0,25)

;-------- Spawn
*RUSpawn.animation=classGenerateAnimation(10,"image/hand_ruler_spawn",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn",0,*RUSpawnRaw)
*RUSpawn_2WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn2WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 2 wind front",0,*RUSpawn_2WindFrontRaw)
*RUSpawn_3WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_spawn3WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 3 wind front",0,*RUSpawn_3WindFrontRaw)
*RUSpawn_4WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn4WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 4 wind front",0,*RUSpawn_4WindFrontRaw)
*RUSpawn_5WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn5WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 5 wind front",0,*RUSpawn_5WindFrontRaw)
*RUSpawn_6WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn6WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 6 wind front",0,*RUSpawn_6WindFrontRaw)
*RUSpawn_7WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn7WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 7 wind front",0,*RUSpawn_7WindFrontRaw)
*RUSpawn_8WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn8WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 8 wind front",0,*RUSpawn_8WindFrontRaw)
*RUSpawn_9WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_spawn9WindFront",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 9 wind front",0,*RUSpawn_9WindFrontRaw)
*RUSpawn_10WindFront1.animation=classGenerateAnimation(2,"image/hand_ruler_spawn10WindFront1_",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 10 wind front 1",0,*RUSpawn_10WindFront1Raw)
*RUSpawn_10WindFront2.animation=classGenerateAnimation(2,"image/hand_ruler_spawn10WindFront2_",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 10 wind front 2",0,*RUSpawn_10WindFront2Raw)

*RUSpawn_4WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_spawn4WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 4 wind back",0,*RUSpawn_4WindBackRaw)
*RUSpawn_5WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_spawn5WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 5 wind back",0,*RUSpawn_5WindBackRaw)
*RUSpawn_6WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_spawn6WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 6 wind back",0,*RUSpawn_6WindBackRaw)
*RUSpawn_7WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_spawn7WindBack",9,#H2H_ANIMATIONTYPE_SPAWN,"Spawn 7 wind back",0,*RUSpawn_7WindBackRaw)

animationPrepareWind(*RUSpawn,1)
c=*RUSpawn_2WindFront
*RUSpawn\frontWind(2,0)=*RUSpawn_3WindFront
*RUSpawn\frontWind(3,0)=*RUSpawn_4WindFront
*RUSpawn\frontWind(4,0)=*RUSpawn_5WindFront
*RUSpawn\frontWind(5,0)=*RUSpawn_6WindFront
*RUSpawn\frontWind(6,0)=*RUSpawn_7WindFront
*RUSpawn\frontWind(7,0)=*RUSpawn_8WindFront
*RUSpawn\frontWind(8,0)=*RUSpawn_9WindFront
*RUSpawn\frontWind(9,0)=*RUSpawn_10WindFront1
*RUSpawn\frontWind(9,1)=*RUSpawn_10WindFront2
*RUSpawn\backWind(3,0)=*RUSpawn_4WindBack
*RUSpawn\backWind(4,0)=*RUSpawn_5WindBack
*RUSpawn\backWind(5,0)=*RUSpawn_6WindBack
*RUSpawn\backWind(6,0)=*RUSpawn_7WindBack

For i=0 To 4
	animationShiftShift(*RUSpawn,i,0,-325)
	If *RUSpawn\frontWind()
		For w=0 To ArraySize(*RUSpawn\frontWind(),2)
			If *RUSpawn\frontWind(i,w)
				For f=0 To ArraySize(*RUSpawn\frontWind(i,w)\frames())
					animationShiftShift(*RUSpawn\frontWind(i,w),f,0,-325)
 					Debug "shift "+i+" "+w+" "+f+" "+Str(shiftN(*RUSpawn\frontWind(i,w)\frames(0)\shift))
				Next
			EndIf
		Next
	EndIf
	If *RUSpawn\backWind()
		For w=0 To ArraySize(*RUSpawn\backWind(),2)
			If *RUSpawn\backWind(i,w)
				For f=0 To ArraySize(*RUSpawn\backWind(i,w)\frames())
					animationShiftShift(*RUSpawn\backWind(i,w),f,0,-325)
				Next
			EndIf
		Next
	EndIf		
Next

;-------- Death
*RUDeath.animation=classGenerateAnimation(11,"image/hand_ruler_death",10,#H2H_ANIMATIONTYPE_DEATH,"Death",0,*RUDeathRaw)
animationSetFrameLength(*RUDeath,0,20)
animationSetFrameLength(*RUDeath,2,8)
animationSetFrameLength(*RUDeath,3,7)
animationSetFrameLength(*RUDeath,4,20)
animationSetFrameLength(*RUDeath,7,20)
animationSetFrameLength(*RUDeath,8,20)
animationSetFrameLength(*RUDeath,9,5)
animationSetFrameLength(*RUDeath,10,5)
animationSetFrameLength(*RUDeath,11,5)
animationSetFrameSound(*RUDeath,3,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetFrameSound(*RUDeath,3,#H2H_SOUND_ID_METALBLUNTBLOCK,1)
animationSetFrameSound(*RUDeath,6,#H2H_SOUND_ID_BALLPEN_FALL_1)
animationSetFrameSound(*RUDeath,6,#H2H_SOUND_ID_METALBLUNTBLOCK,1)
animationSetFrameSound(*RUDeath,9,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUDeath,10,#H2H_SOUND_ID_HAND_FALL)
ReDim *RUDeath\frames(12)
For i=6 To 11
	animationShiftShift(*RUDeath,i,-60)
	If *RUDeath\frontWind()
		For w=0 To ArraySize(*RUDeath\frontWind(),2)
			If *RUDeath\frontWind(i,w)
				For f=0 To ArraySize(*RUDeath\frontWind(i,w)\frames())
					animationShiftShift(*RUDeath\frontWind(i,w),f,0,-60)
				Next
			EndIf
		Next
	EndIf
	If *RUDeath\backWind()
		For w=0 To ArraySize(*RUDeath\backWind(),2)
			If *RUDeath\backWind(i,w)
				For f=0 To ArraySize(*RUDeath\backWind(i,w)\frames())
					animationShiftShift(*RUDeath\backWind(i,w),f,0,-60)
				Next
			EndIf
		Next
	EndIf		
Next
*RUDeath\frames(12)=frameDataGive()
frameCopy(*RUDeath\frames(12),*RUDeath\frames(10),#True)
; animationShiftShift(*RUDeath,11,-90)
animationSetFrameLength(*RUDeath,12,50)

*RUDeath_2WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death2WindFront",10,#H2H_ANIMATIONTYPE_DEATH,"Death 2 wind front",0,*RUDeath_2WindFrontRaw)
*RUDeath_3WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death3WindFront",10,#H2H_ANIMATIONTYPE_DEATH,"Death 3 wind front",0,*RUDeath_3WindFrontRaw)
*RUDeath_4WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death4WindFront",8,#H2H_ANIMATIONTYPE_DEATH,"Death 4 wind front",0,*RUDeath_4WindFrontRaw)
*RUDeath_5WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death5WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"Death 5 wind front",0,*RUDeath_5WindFrontRaw)
*RUDeath_6WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death6WindFront",10,#H2H_ANIMATIONTYPE_DEATH,"Death 6 wind front",0,*RUDeath_6WindFrontRaw)
*RUDeath_7WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_death7WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind front",0,*RUDeath_7WindFrontRaw)
animationSetFrameLength(*RUDeath_7WindFront,1,8)
animationSetFrameLength(*RUDeath_7WindFront,2,9)
*RUDeath_10WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_death10WindFront",10,#H2H_ANIMATIONTYPE_DEATH,"Death 10 wind front",0,*RUDeath_10WindFrontRaw)
*RUDeath_11WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_death11WindFront",4,#H2H_ANIMATIONTYPE_DEATH,"Death 11 wind front",0,*RUDeath_11WindFrontRaw)
animationSetFrameLength(*RUDeath_11WindFront,1,6)
animationSetFrameLength(*RUDeath_11WindFront,2,8)
animationSetFrameLength(*RUDeath_11WindFront,3,10)
animationSetFrameOpacity(*RUDeath_11WindFront,3,192)

*RUDeath_2WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_death2WindBack",10,#H2H_ANIMATIONTYPE_DEATH,"Death 2 wind back",0,*RUDeath_2WindBackRaw)
*RUDeath_3WindBack.animation=classGenerateAnimation(1,"image/hand_ruler_death3WindBack",7,#H2H_ANIMATIONTYPE_DEATH,"Death 3 wind back",0,*RUDeath_3WindBackRaw)
animationSetFrameLength(*RUDeath_3WindBack,1,9)
*RUDeath_4WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_death4WindBack",5,#H2H_ANIMATIONTYPE_DEATH,"Death 4 wind back",0,*RUDeath_4WindBackRaw)
animationSetFrameLength(*RUDeath_4WindBack,1,7)
animationSetFrameLength(*RUDeath_4WindBack,2,9)
*RUDeath_5WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_death5WindBack",10,#H2H_ANIMATIONTYPE_DEATH,"Death 5 wind back",0,*RUDeath_5WindBackRaw)
*RUDeath_7WindBack.animation=classGenerateAnimation(2,"image/hand_ruler_death7WindBack",6,#H2H_ANIMATIONTYPE_DEATH,"Death 7 wind back",0,*RUDeath_7WindBackRaw)
animationSetFrameLength(*RUDeath_7WindBack,1,7)
animationSetFrameLength(*RUDeath_7WindBack,2,8)

animationPrepareWind(*RUDeath,0)
*RUDeath\frontWind(1,0)=*RUDeath_2WindFront
*RUDeath\frontWind(2,0)=*RUDeath_3WindFront
*RUDeath\frontWind(3,0)=*RUDeath_4WindFront
*RUDeath\frontWind(4,0)=*RUDeath_5WindFront
*RUDeath\frontWind(5,0)=*RUDeath_6WindFront
*RUDeath\frontWind(6,0)=*RUDeath_7WindFront
*RUDeath\frontWind(9,0)=*RUDeath_10WindFront
*RUDeath\frontWind(10,0)=*RUDeath_11WindFront
*RUDeath\backWind(1,0)=*RUDeath_2WindBack
*RUDeath\backWind(2,0)=*RUDeath_3WindBack
*RUDeath\backWind(3,0)=*RUDeath_4WindBack
*RUDeath\backWind(4,0)=*RUDeath_5WindBack
*RUDeath\backWind(6,0)=*RUDeath_7WindBack

;-------- Hit
*RUHit.animation=classGenerateAnimation(6,"image/hand_ruler_hit",5,#H2H_ANIMATIONTYPE_HIT,"Hit",0,*RUHitRaw)

;-------- Dodge
*RUDodge.animation=classGenerateAnimation(4,"image/hand_ruler_dodge",50,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*RUDodgeRaw)

;-------- Parry
*RUParry.animation=classGenerateAnimation(6,"image/hand_ruler_parry",5,#H2H_ANIMATIONTYPE_PARRY,"Parry",0,*RUParryRaw)

;-------- Selection
*RUSelection.animation=classGenerateAnimation(12,"image/hand_ruler_selection",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection",0,*RUSelectionRaw)
animationSetLooped(*RUSelection,1)
*RUSelection\loopStart=7
For i=7 To 12
	animationSetFrameLength(*RUSelection,i,12)
Next
animationSetFrameLength(*RUSelection,0,25)
*RUSelection_2WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selection2WindFront",5,#H2H_ANIMATIONTYPE_SELECTION,"Selection 2 wind front",0,*RUSelection2WindFrontRaw)
animationSetFrameLength(*RUSelection2WindFront,1,6)
*RUSelection3WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selection3WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 3 wind front",0,*RUSelection3WindFrontRaw)
*RUSelection4WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selection4WindFront",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 4 wind front",0,*RUSelection4WindFrontRaw)
*RUSelection5WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_selection5WindFront",4,#H2H_ANIMATIONTYPE_SELECTION,"Selection 5 wind front",0,*RUSelection5WindFrontRaw)
animationSetFrameLength(*RUSelection_5WindFront,1,5)
animationSetFrameLength(*RUSelection_5WindFront,2,6)
*RUSelection6WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selection6WindFront",4,#H2H_ANIMATIONTYPE_SELECTION,"Selection 6 wind front",0,*RUSelection6WindFrontRaw)
animationSetFrameLength(*RUSelection_6WindFront,1,6)

*RUSelection6WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selection6WindBack",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 6 wind back",0,*RUSelection6WindBackRaw)
*RUSelection7WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_selection7WindBack",7,#H2H_ANIMATIONTYPE_SELECTION,"Selection 7 wind back",0,*RUSelection7WindBackRaw)
animationSetFrameLength(*RUSelection7WindBack,1,5)
animationSetFrameLength(*RUSelection7WindBack,2,6)
animationSetFrameOpacity(*RUSelection7WindBack,3,192)

animationPrepareWind(*RUSelection,0)
*RUSelection\frontWind(1,0)=*RUSelection2WindFront
*RUSelection\frontWind(2,0)=*RUSelection3WindFront
*RUSelection\frontWind(3,0)=*RUSelection4WindFront
*RUSelection\frontWind(4,0)=*RUSelection5WindFront
*RUSelection\frontWind(5,0)=*RUSelection6WindFront
*RUSelection\backWind(5,0)=*RUSelection6WindBack
*RUSelection\backWind(6,0)=*RUSelection7WindBack

;-------- Selected
*RUSelected.animation=classGenerateAnimation(21,"image/hand_ruler_selected",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected",0,*RUSelectedRaw)
*RUSelected\loopStart=12
animationSetFrameLength(*RUSelected,0,5)
animationSetFrameLength(*RUSelected,4,5)
animationSetFrameLength(*RUSelected,10,7)
animationSetFrameLength(*RUSelected,11,8)
animationSetFrameSound(*RUSelected,1,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSelected,1,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSelected,4,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSelected,4,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
animationSetFrameSound(*RUSelected,8,#H2H_SOUND_ID_FINGER_SWISHHEAVY)
animationSetFrameSound(*RUSelected,8,#H2H_SOUND_ID_METALHEAVYWOOSH,1)
Swap *RUSelected\frames(20), *RUSelected\frames(21)
ReDim *RUSelected\frames(29)
For i=12 To 21
	animationSetFrameLength(*RUSelected,i,6+i/2)
Next
For i=22 To 29
	*RUSelected\frames(i)=frameDataGive()
Next
For i=1 To 8
	frameCopy(*RUSelected\frames(21+i),*RUSelected\frames(21-i),#True)
Next

*RUSelected1WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected1WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 1 wind front",0,*RUSelected1WindFrontRaw)
*RUSelected2WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected2WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind front",0,*RUSelected2WindFrontRaw)
*RUSelected3WindFront.animation=classGenerateAnimation(2,"image/hand_ruler_selected3WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind front",0,*RUSelected3WindFrontRaw)
animationSetFrameLength(*RUSelected3WindFront,1,6)
animationSetFrameLength(*RUSelected3WindFront,2,7)
*RUSelected4WindFront.animation=classGenerateAnimation(4,"image/hand_ruler_selected4WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind front",0,*RUSelected4WindFrontRaw)
animationSetFrameLength(*RUSelected4WindFront,1,5)
animationSetFrameLength(*RUSelected4WindFront,2,6)
animationSetFrameLength(*RUSelected4WindFront,3,7)
animationSetFrameLength(*RUSelected4WindFront,4,8)
animationSetFrameOpacity(*RUSelected4WindFront,3,192)
animationSetFrameOpacity(*RUSelected4WindFront,4,128)
animationSetFrameMovement(*RUSelected4WindFront,0,0,-70)
*RUSelected5WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selected5WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind front",0,*RUSelected5WindFrontRaw)
animationSetFrameLength(*RUSelected5WindFront,1,6)
*RUSelected6WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected6WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind front",0,*RUSelected6WindFrontRaw)
*RUSelected7WindFront.animation=classGenerateAnimation(3,"image/hand_ruler_selected7WindFront",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 7 wind front",0,*RUSelected7WindFrontRaw)
animationSetFrameLength(*RUSelected7WindFront,1,5)
animationSetFrameLength(*RUSelected7WindFront,2,6)
animationSetFrameLength(*RUSelected7WindFront,3,7)
animationSetFrameOpacity(*RUSelected7WindFront,3,192)
*RUSelected8WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected8WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind front",0,*RUSelected8WindFrontRaw)
*RUSelected9WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected9WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind front",0,*RUSelected9WindFrontRaw)
*RUSelected10WindFront.animation=classGenerateAnimation(0,"image/hand_ruler_selected10WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind front",0,*RUSelected10WindFrontRaw)
*RUSelected11WindFront.animation=classGenerateAnimation(5,"image/hand_ruler_selected11WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 11 wind front",0,*RUSelected11WindFrontRaw)
animationSetFrameLength(*RUSelected11WindFront,1,6)
animationSetFrameLength(*RUSelected11WindFront,2,7)
animationSetFrameLength(*RUSelected11WindFront,3,7)
animationSetFrameLength(*RUSelected11WindFront,4,8)
animationSetFrameLength(*RUSelected11WindFront,5,9)
animationSetFrameOpacity(*RUSelected11WindFront,3,192)
animationSetFrameOpacity(*RUSelected11WindFront,4,128)
animationSetFrameOpacity(*RUSelected11WindFront,5,64)
For i=1 To 5
	animationSetFrameMovement(*RUSelected11WindFront,i,-66+i*i*2)
Next
*RUSelected12WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selected12WindFront",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind front",0,*RUSelected12WindFrontRaw)
animationSetFrameLength(*RUSelected12WindFront,1,7)
*RUSelected18WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selected18WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 18 wind front",0,*RUSelected18WindFrontRaw)
animationSetFrameLength(*RUSelected18WindFront,1,6)
*RUSelected19WindFront.animation=classGenerateAnimation(1,"image/hand_ruler_selected19WindFront",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 19 wind front",0,*RUSelected19WindFrontRaw)
animationSetFrameLength(*RUSelected19WindFront,1,6)

*RUSelected1WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected1WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 1 wind back",0,*RUSelected1WindBackRaw)
*RUSelected2WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_selected2WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind back",0,*RUSelected2WindBackRaw)
animationSetFrameLength(*RUSelected2WindBack,1,5)
animationSetFrameLength(*RUSelected2WindBack,2,6)
animationSetFrameLength(*RUSelected2WindBack,3,7)
*RUSelected3WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected3WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind back",0,*RUSelected3WindBackRaw)
*RUSelected4WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected4WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind back",0,*RUSelected4WindBackRaw)
*RUSelected5WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected5WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind back",0,*RUSelected5WindBackRaw)
*RUSelected6WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected6WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 6 wind back",0,*RUSelected6WindBackRaw)
*RUSelected7WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_selected7WindBack",5,#H2H_ANIMATIONTYPE_SELECTED,"Selected 7 wind back",0,*RUSelected7WindBackRaw)
animationSetFrameLength(*RUSelected7WindBack,1,6)
animationSetFrameLength(*RUSelected7WindBack,2,7)
animationSetFrameLength(*RUSelected7WindBack,3,8)
*RUSelected8WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected8WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 8 wind back",0,*RUSelected8WindBackRaw)
*RUSelected9WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected9WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 9 wind back",0,*RUSelected9WindBackRaw)
*RUSelected10WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected10WindBack",6,#H2H_ANIMATIONTYPE_SELECTED,"Selected 10 wind back",0,*RUSelected10WindBackRaw)
*RUSelected11WindBack.animation=classGenerateAnimation(0,"image/hand_ruler_selected11WindBack",7,#H2H_ANIMATIONTYPE_SELECTED,"Selected 11 wind back",0,*RUSelected11WindBackRaw)
*RUSelected12WindBack.animation=classGenerateAnimation(3,"image/hand_ruler_selected12WindBack",4,#H2H_ANIMATIONTYPE_SELECTED,"Selected 12 wind back",0,*RUSelected12WindBackRaw)
animationSetFrameLength(*RUSelected12WindBack,1,5)
animationSetFrameLength(*RUSelected12WindBack,2,6)
animationSetFrameLength(*RUSelected12WindBack,3,7)

animationPrepareWind(*RUSelected)
*RUSelected\frontWind(0,0)=*RUSelected1WindFront
*RUSelected\frontWind(1,0)=*RUSelected2WindFront
*RUSelected\frontWind(2,0)=*RUSelected3WindFront
*RUSelected\frontWind(3,0)=*RUSelected4WindFront
*RUSelected\frontWind(4,0)=*RUSelected5WindFront
*RUSelected\frontWind(5,0)=*RUSelected6WindFront
*RUSelected\frontWind(6,0)=*RUSelected7WindFront
*RUSelected\frontWind(7,0)=*RUSelected8WindFront
*RUSelected\frontWind(8,0)=*RUSelected9WindFront
*RUSelected\frontWind(9,0)=*RUSelected10WindFront
*RUSelected\frontWind(10,0)=*RUSelected11WindFront
*RUSelected\frontWind(11,0)=*RUSelected12WindFront
*RUSelected\frontWind(25,0)=*RUSelected18WindFront
*RUSelected\frontWind(18,0)=*RUSelected19WindFront
*RUSelected\backWind(0,0)=*RUSelected1WindBack
*RUSelected\backWind(1,0)=*RUSelected2WindBack
*RUSelected\backWind(2,0)=*RUSelected3WindBack
*RUSelected\backWind(3,0)=*RUSelected4WindBack
*RUSelected\backWind(4,0)=*RUSelected5WindBack
*RUSelected\backWind(5,0)=*RUSelected6WindBack
*RUSelected\backWind(6,0)=*RUSelected7WindBack
*RUSelected\backWind(7,0)=*RUSelected8WindBack
*RUSelected\backWind(8,0)=*RUSelected9WindBack
*RUSelected\backWind(9,0)=*RUSelected10WindBack
*RUSelected\backWind(10,0)=*RUSelected11WindBack
*RUSelected\backWind(11,0)=*RUSelected12WindBack

*ruler_stat.statistic=statisticCreate(0,5,2,2,4,3,4,5,-1,5,9,7)

ReDim *tmpArray(1)
*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*ruler_stance_metal.stance=stanceCreate(*tmpArray(),0,"Metal")
*ruler_stance_metal\specialcolor=#H2H_STANCE_COLOR_METAL
*ruler_stance_metal\alternatecolor=#H2H_STANCE_COLOR_LIGHTMETAL
; statisticCreate(*ruler_stance_metal\modificator,0,0,-1,1,0,0,0,0,0,0)
statisticCreate(*ruler_stance_metal\modificator,0,-2,-1,3,-1,0,1,0,0,0)
*tmpArray(0)=*wood_hit
*ruler_stance_wood.stance=stanceCreate(*tmpArray(),0,"Wood")
*ruler_stance_wood\specialcolor=#H2H_STANCE_COLOR_WOOD
*ruler_stance_wood\alternatecolor=#H2H_STANCE_COLOR_LIGHTWOOD
; statisticCreate(*ruler_stance_wood\modificator,0,0,0,0,1,0,-2,0,1,0)
statisticCreate(*ruler_stance_wood\modificator,-2,0,0,0,2,1,-2,0,1,0)

*ruler.class=classCreate(0,"Ruler",*RUIdle1,*RUMoveFront,*RUMoveBack,*RUNeutral1,*RUSide1,#Null,#Null,#Null,#Null)
;classSetToBeAdded(*ruler,1)
classSetNotSelectableAI(*ruler)
*ruler\allStances(0)\name="Plastic (default)"
*ruler\allStances(0)\specialcolor=#H2H_STANCE_COLOR_PLASTIC
classAddStance(*ruler,*ruler_stance_metal)
classAddStance(*ruler,*ruler_stance_wood)

*ruler\iconSprite=spriteIndex
*ruler\iconPath$="image\Ruler.png"
spriteIndex+1
*ruler\stat=*ruler_stat
; *ruler\desc$="Heavy long ranged fighter with excellent statistics but cumbersome attacks.\Have hard time against close ranged ennemies while it focuses on dealing damage\than controlling. Straightforward although not stupid, as it's difficult to handle for the player."
*ruler\desc$="Heavy long ranged fighter with excellent statistics but cumbersome attacks.\Has hard time against close ranged enemies. Hard to master but can put a lot of threat from afar."

*tmpArray(0)=*plastic_hit
ReDim *ruler\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*ruler\allStances(0)\materialClass(i)=*tmpArray(i)
Next
classGetSpawn(*ruler)=*RUSpawn
classGetDeath(*ruler)=*RUDeath
classGetJump(*ruler)=*RUJump
classGetLand(*ruler)=*RULand
classGetHit(*ruler)=*RUHit
classGetDodge(*ruler)=*RUDodge
classGetParry(*ruler)=*RUParry
classGetSelection(*ruler)=*RUSelection
classGetSelected(*ruler)=*RUSelected
;--- BOTTOM
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 291
; FirstLine = 258
; EnableXP
; CPU = 1