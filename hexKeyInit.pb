;------ 10mm key
;------- Idle
*hexKey_Idle.animation=classGenerateAnimation(6,"image/hand_hexkey_idle1_",10,#H2H_ANIMATIONTYPE_IDLE,"idle",1,*HKIdleRaw)
setFrameLength(*hexKey_Idle,1,12)
setFrameLength(*hexKey_Idle,2,12)
setFrameLength(*hexKey_Idle,5,12)
setFrameLength(*hexKey_Idle,6,12)

;------- Idle 2
*hexKey_Idle2.animation=classGenerateAnimation(8,"image/hand_hexkey_idle2_",10,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*HKIdle2Raw)
setFrameLength(*hexKey_Idle2,3,15)
setFrameLength(*hexKey_Idle2,7,15)

;------- Movement Front
*hexKey_Front.animation=classGenerateAnimation(8,"image/hand_hexkey_front",5,#H2H_ANIMATIONTYPE_FRONT,"front",1,*HKFrontRaw)
*hexKey_Front\loopStart=2

;------- Movement Back
*hexKey_Back.animation=classGenerateAnimation(8,"image/hand_hexkey_back",5,#H2H_ANIMATIONTYPE_BACK,"back",1,*HKBackRaw)
*hexKey_Back\loopStart=2

;------- Neutral 1
*hexKey_neutral1.animation=classGenerateAnimation(3,"image/hand_hexkey_neutral1_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1",0,*HKNeutral1Raw,10,#H2H_DAMAGETYPE_BLUNT,5)
animationPrepareWind(*hexKey_neutral1)
setFrameSound(*hexKey_neutral1,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameMovement(*hexKey_neutral1,0,-20)
setFrameMovement(*hexKey_neutral1,1,-35)
setFrameMovement(*hexKey_neutral1,2,-45)
setFrameMovement(*hexKey_neutral1,3,15)
setFrameLength(*hexKey_neutral1,0,6)
setFrameLength(*hexKey_neutral1,3,8)
setFrameDamageDuration(*hexKey_neutral1,3,5)
setFrameCanDoNext(*hexKey_neutral1,3,4)

*hexKey_neutral1_1WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 1 wind front",0,*HKNeutral1_1WindFrontRaw)
*hexKey_neutral1_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral1_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 2 wind front",0,*HKNeutral1_2WindFrontRaw)
*hexKey_neutral1_3WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_neutral1_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 3 wind front",0,*HKNeutral1_3WindFrontRaw)

*hexKey_neutral1_2WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral1_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 2 wind back",0,*HKNeutral1_2WindBackRaw)
*hexKey_neutral1_3WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_neutral1_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 3 wind back",0,*HKNeutral1_3WindBackRaw)

*hexKey_neutral1\frontWind(0,0)=*hexKey_neutral1_1WindFront
*hexKey_neutral1\frontWind(1,0)=*hexKey_neutral1_2WindFront
*hexKey_neutral1\frontWind(2,0)=*hexKey_neutral1_3WindFront

*hexKey_neutral1\backWind(1,0)=*hexKey_neutral1_2WindBack
*hexKey_neutral1\backWind(2,0)=*hexKey_neutral1_3WindBack

animationFreeMovement(*hexKey_neutral1)

;------- Neutral 2
*hexKey_neutral2.animation=classGenerateAnimation(3,"image/hand_hexkey_neutral2_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*HKNeutral2Raw,20,#H2H_DAMAGETYPE_BLUNT,7)
animationPrepareWind(*hexKey_neutral2)

*hexKey_neutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral2_1WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 1 wind front",0,*HKNeutral2_1WindFrontRaw)
*hexKey_neutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral2_2WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 2 wind front",0,*HKNeutral2_2WindFrontRaw)
*hexKey_neutral2_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral2_3WindFront",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 3 wind front",0,*HKNeutral2_3WindFrontRaw)
*hexKey_neutral2_4WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_neutral2_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 4 wind front",0,*HKNeutral2_4WindFrontRaw)

*hexKey_neutral2_2WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral2_2WindBack",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 2 wind back",0,*HKNeutral2_2WindBackRaw)
*hexKey_neutral2_3WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral2_3WindBack",2,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 3 wind back",0,*HKNeutral2_3WindBackRaw)
*hexKey_neutral2_4WindBack.animation=classGenerateAnimation(1,"image/hand_hexkey_neutral2_4WindBack",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2 4 wind back",0,*HKNeutral2_4WindBackRaw)

*hexKey_neutral2\frontWind(0,0)=*hexKey_neutral2_1WindFront
*hexKey_neutral2\frontWind(1,0)=*hexKey_neutral2_2WindFront
*hexKey_neutral2\frontWind(2,0)=*hexKey_neutral2_3WindFront
*hexKey_neutral2\frontWind(3,0)=*hexKey_neutral2_4WindFront

*hexKey_neutral2\backWind(1,0)=*hexKey_neutral2_2WindBack
*hexKey_neutral2\backWind(2,0)=*hexKey_neutral2_3WindBack
*hexKey_neutral2\backWind(3,0)=*hexKey_neutral2_4WindBack

setFrameSound(*hexKey_neutral2,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameMovement(*hexKey_neutral2,0,-40)
setFrameMovement(*hexKey_neutral2,1,-100)
setFrameMovement(*hexKey_neutral2,2,25)
setFrameDamage(*hexKey_neutral2,0,4)
setFrameDamage(*hexKey_neutral2,3,5)
setFrameLength(*hexKey_neutral2,0,6)
setFrameLength(*hexKey_neutral2,1,2)
setFrameLength(*hexKey_neutral2,2,2)
setFrameLength(*hexKey_neutral2,3,12)
setFrameCanDoNext(*hexKey_neutral2,3,5)
setFrameDamageDuration(*hexKey_neutral2,3,5)

animationFreeMovement(*hexKey_neutral2)

animationGetNeutral(*hexKey_neutral1)=*hexKey_neutral2

;------- Neutral 3
*hexKey_neutral3.animation=classGenerateAnimation(2,"image/hand_hexkey_neutral3_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3",0,*HKNeutral3Raw,10,#H2H_DAMAGETYPE_BLUNT,6)
animationPrepareWind(*hexKey_neutral3)
setFrameSound(*hexKey_neutral3,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameMovement(*hexKey_neutral3,2,-100)
setFrameLength(*hexKey_neutral3,1,3)
setFrameLength(*hexKey_neutral3,2,12)
setFrameDamageDuration(*hexKey_neutral3,2,6)
setFrameCanDoNext(*hexKey_neutral3,2,6)

*hexKey_neutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral3_1WindFront",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 1 wind front",0,*HKNeutral3_1WindFrontRaw)
*hexKey_neutral3_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral3_2WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 2 wind front",0,*HKNeutral3_2WindFrontRaw)
*hexKey_neutral3_3WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_neutral3_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 3 wind front",0,*HKNeutral3_3WindFrontRaw)

*hexKey_neutral3_1WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral3_1WindBack",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 1 wind back",0,*HKNeutral3_1WindBackRaw)
*hexKey_neutral3_2WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_neutral3_2WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 2 wind back",0,*HKNeutral3_2WindBackRaw)
*hexKey_neutral3_3WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_neutral3_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3 3 wind back",0,*HKNeutral3_3WindBackRaw)

animationGetNeutral(*hexKey_neutral2)=*hexKey_neutral3
*hexKey_neutral3\frontWind(0,0)=*hexKey_neutral3_1WindFront
*hexKey_neutral3\frontWind(1,0)=*hexKey_neutral3_2WindFront
*hexKey_neutral3\frontWind(2,0)=*hexKey_neutral3_3WindFront

*hexKey_neutral3\backWind(0,0)=*hexKey_neutral3_1WindBack
*hexKey_neutral3\backWind(1,0)=*hexKey_neutral3_2WindBack
*hexKey_neutral3\backWind(2,0)=*hexKey_neutral3_3WindBack

animationFreeMovement(*hexKey_neutral3)

;------- Side 1
*hexKey_side1.animation=classGenerateAnimation(4,"image/hand_hexkey_side1_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*HKSide1Raw,30,#H2H_DAMAGETYPE_BLUNT,8)
animationPrepareWind(*hexKey_side1)
setFrameSound(*hexKey_side1,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*hexKey_side1,2,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameLength(*hexKey_side1,1,6)
setFrameLength(*hexKey_side1,2,3)
setFrameLength(*hexKey_side1,3,3)
setFrameLength(*hexKey_side1,4,12)
setFrameMovement(*hexKey_side1,1,33)
setFrameMovement(*hexKey_side1,2,-10)
setFrameMovement(*hexKey_side1,3,-55)
setFrameMovement(*hexKey_side1,4,-10)
setFrameCanDoNext(*hexKey_side1,4,4)
setFrameGrab(*hexKey_side1,4)
setFrameDamageDuration(*hexKey_side1,4,4)

*hexKey_side1_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_side1_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1 wind front",0,*HKSide1_1WindFrontRaw)
*hexKey_side1_2WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_side1_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 2 wind front",0,*HKSide1_2WindFrontRaw)
*hexKey_side1_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_side1_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 wind front",0,*HKSide1_3WindFrontRaw)
*hexKey_side1_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_side1_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 4 wind front",0,*HKSide1_4WindFrontRaw)
*hexKey_side1_5WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_side1_5WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 5 wind front",0,*HKSide1_5WindFrontRaw)
setFrameLength(*hexKey_side1_5WindFront,1,6)
setFrameLength(*hexKey_side1_5WindFront,2,7)
setFrameMovement(*hexKey_side1_5WindFront,1,-20)
setFrameMovement(*hexKey_side1_5WindFront,2,-40)

*hexKey_side1_2WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_side1_2WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 2 wind back",0,*HKSide1_2WindBackRaw)
animationFreeMovement(*hexKey_side1_2WindBack)

*hexKey_side1\frontWind(0,0)=*hexKey_side1_1WindFront
*hexKey_side1\frontWind(1,0)=*hexKey_side1_2WindFront
*hexKey_side1\frontWind(2,0)=*hexKey_side1_3WindFront
*hexKey_side1\frontWind(3,0)=*hexKey_side1_4WindFront
*hexKey_side1\frontWind(4,0)=*hexKey_side1_5WindFront
*hexKey_side1\backWind(1,0)=*hexKey_side1_2WindBack

animationFreeMovement(*hexKey_side1)

;------- Back 1
*hexKey_back1.animation=classGenerateAnimation(11,"image/hand_hexkey_back1_",4,#H2H_ANIMATIONTYPE_NBACK,"back 1",0,*HKBack1Raw,30,#H2H_DAMAGETYPE_BLUNT,4)
setFrameMovement(*hexKey_back1,0,30)
setFrameMovement(*hexKey_back1,1,10)
setFrameMovement(*hexKey_back1,2,-10)
setFrameMovement(*hexKey_back1,3,-10)
setFrameMovement(*hexKey_back1,4,-10)
setFrameMovement(*hexKey_back1,5,-10)
setFrameMovement(*hexKey_back1,6,10)
setFrameMovement(*hexKey_back1,7,10)
setFrameMovement(*hexKey_back1,8,10)
setFrameMovement(*hexKey_back1,9,10)
setFrameMovement(*hexKey_back1,10,10)
enableFrameDamageCut(*hexKey_back1,2)
enableFrameDamageCut(*hexKey_back1,4)
enableFrameDamageCut(*hexKey_back1,6)
enableFrameDamageCut(*hexKey_back1,8)
enableFrameDamageCut(*hexKey_back1,10)
setFrameLength(*hexKey_back1,1,8)
setFrameLength(*hexKey_back1,11,20)
setFrameCanDoNext(*hexKey_back1,11,6)
setFrameSound(*hexKey_back1,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameSound(*hexKey_back1,2,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*hexKey_back1,4,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*hexKey_back1,6,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*hexKey_back1,8,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*hexKey_back1,10,#H2H_SOUND_ID_METALHEAVYWOOSH)
animationPrepareWind(*hexKey_back1)

*hexKey_back1_1WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_back1_1WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 1 wind front",0,*HKBack1_1WindFrontRaw)
*hexKey_back1_2WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_back1_2WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*HKBack1_2WindFrontRaw)
*hexKey_back1_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*HKBack1_3WindFrontRaw)
*hexKey_back1_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_4WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*HKBack1_4WindFrontRaw)
*hexKey_back1_5WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_5WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 5 wind front",0,*HKBack1_5WindFrontRaw)
*hexKey_back1_6WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_6WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 6 wind front",0,*HKBack1_6WindFrontRaw)
*hexKey_back1_7WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_7WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 wind front",0,*HKBack1_7WindFrontRaw)
*hexKey_back1_8WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_8WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 wind front",0,*HKBack1_8WindFrontRaw)
*hexKey_back1_9WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_9WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 wind front",0,*HKBack1_9WindFrontRaw)
*hexKey_back1_10WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_10WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 10 wind front",0,*HKBack1_10WindFrontRaw)
*hexKey_back1_11WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_11WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 11 wind front",0,*HKBack1_11WindFrontRaw)
*hexKey_back1_12WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_back1_12WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 12 wind front",0,*HKBack1_12WindFrontRaw)

*hexKey_back1_7WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_7WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 7 wind back",0,*HKBack1_7WindBackRaw)
*hexKey_back1_8WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_8WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 8 wind back",0,*HKBack1_8WindBackRaw)
*hexKey_back1_9WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_9WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 9 wind back",0,*HKBack1_9WindBackRaw)
*hexKey_back1_10WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_10WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 10 wind back",0,*HKBack1_10WindBackRaw)
*hexKey_back1_11WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_back1_11WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 11 wind back",0,*HKBack1_11WindBackRaw)
*hexKey_back1_12WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_back1_12WindBack",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 12 wind back",0,*HKBack1_12WindBackRaw)


*hexKey_back1\frontWind( 0,0)=*hexKey_back1_1WindFront
*hexKey_back1\frontWind( 1,0)=*hexKey_back1_2WindFront
*hexKey_back1\frontWind( 2,0)=*hexKey_back1_3WindFront
*hexKey_back1\frontWind( 3,0)=*hexKey_back1_4WindFront
*hexKey_back1\frontWind( 4,0)=*hexKey_back1_5WindFront
*hexKey_back1\frontWind( 5,0)=*hexKey_back1_6WindFront
*hexKey_back1\frontWind( 6,0)=*hexKey_back1_7WindFront
*hexKey_back1\frontWind( 7,0)=*hexKey_back1_8WindFront
*hexKey_back1\frontWind( 8,0)=*hexKey_back1_9WindFront
*hexKey_back1\frontWind( 9,0)=*hexKey_back1_10WindFront
*hexKey_back1\frontWind(10,0)=*hexKey_back1_11WindFront
*hexKey_back1\frontWind(11,0)=*hexKey_back1_12WindFront

*hexKey_back1\backWind( 6,0)=*hexKey_back1_7WindBack
*hexKey_back1\backWind( 7,0)=*hexKey_back1_8WindBack
*hexKey_back1\backWind( 8,0)=*hexKey_back1_9WindBack
*hexKey_back1\backWind( 9,0)=*hexKey_back1_10WindBack
*hexKey_back1\backWind(10,0)=*hexKey_back1_11WindBack
*hexKey_back1\backWind(11,0)=*hexKey_back1_12WindBack

;------- Back 2
*hexKey_back2.animation=classGenerateAnimation(2,"image/hand_hexkey_back2_",6,#H2H_ANIMATIONTYPE_NBACK,"back 2",0,*HKBack2Raw,20,#H2H_DAMAGETYPE_BLUNT,1,1)
setFrameLength(*hexKey_back2,2,20)
setFrameSound(*hexKey_back2,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameCanDoNext(*hexKey_back2,2,6)
*hexKey_back2\frames(2)\damageDuration=6
setFrameMovement(*hexKey_back2,0,50)
setFrameMovement(*hexKey_back2,1,50)
setFrameMovement(*hexKey_back2,2,25)
setFramePush(*hexKey_back2,0,25)
setFramePush(*hexKey_back2,1,20)
setFramePush(*hexKey_back2,2,15)
enableFrameDamageCut(*hexKey_back2,1)
enableFrameDamageCut(*hexKey_back2,2)
animationGetBack(*hexKey_side1)=*hexKey_back2
animationPrepareWind(*hexKey_back2)

*hexKey_back2_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back2_1WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"back 2 1 wind front",0,*HKBack2_1WindFrontRaw)
*hexKey_back2_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_back2_2WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"back 2 2 wind front",0,*HKBack2_2WindFrontRaw)
*hexKey_back2_3WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_back2_3WindFront",6,#H2H_ANIMATIONTYPE_NBACK,"back 2 3 wind front",0,*HKBack2_3WindFrontRaw)

*hexKey_back2\frontWind(0,0)=*hexKey_back2_1WindFront
*hexKey_back2\frontWind(1,0)=*hexKey_back2_2WindFront
*hexKey_back2\frontWind(2,0)=*hexKey_back2_3WindFront

;------- Up 1
*hexKey_up1.animation=classGenerateAnimation(3,"image/hand_hexkey_up1_",5,#H2H_ANIMATIONTYPE_NUP,"up 1",0,*HKUp1Raw,25,#H2H_DAMAGETYPE_BLUNT,8)
setFrameLength(*hexKey_up1,2,4)
setFrameLength(*hexKey_up1,3,12)
setFrameCanDoNext(*hexKey_up1,3,6)
setFrameMovement(*hexKey_up1,0,10,-10)
setFrameMovement(*hexKey_up1,1,20,-10)
setFrameMovement(*hexKey_up1,2,-60,-20)
setFrameMovement(*hexKey_up1,3,-80,-20)
setFrameDamage(*hexKey_up1,2,6)
setFrameStun(*hexKey_up1,2,5)
setFrameStun(*hexKey_up1,3,25)
setFramePush(*hexKey_up1,2,-40)
setFramePush(*hexKey_up1,3,-20)
setFrameGrab(*hexKey_up1,3)
; *hexKey_up1\frames(3)\catch=1
setFrameSound(*hexKey_up1,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*hexKey_up1,1,#H2H_SOUND_ID_METALHEAVYWOOSH)
*hexKey_up1\frames(3)\damageDuration=5
animationPrepareWind(*hexKey_up1)

*hexKey_up1_1WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_up1_1WindFront",5,#H2H_ANIMATIONTYPE_NUP,"up 1 1 wind front",0,*HKUp1_1WindFrontRaw)
*hexKey_up1_2WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_up1_2WindFront",5,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind front",0,*HKUp1_2WindFrontRaw)
*hexKey_up1_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up1_3WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind front",0,*HKUp1_3WindFrontRaw)
*hexKey_up1_4WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_up1_4WindFront",5,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind front",0,*HKUp1_4WindFrontRaw)

*hexKey_up1\frontWind(0,0)=*hexKey_up1_1WindFront
*hexKey_up1\frontWind(1,0)=*hexKey_up1_2WindFront
*hexKey_up1\frontWind(2,0)=*hexKey_up1_3WindFront
*hexKey_up1\frontWind(3,0)=*hexKey_up1_4WindFront
animationFreeMovementWind(*hexKey_up1)

;------- Up 2
*HKUp2.animation=classGenerateAnimation(6,"image/hand_hexkey_up2_",4,#H2H_ANIMATIONTYPE_NUP,"Up 2",0,*HKUp2Raw,30,#H2H_DAMAGETYPE_BLUNT,9)
setFrameLength(*HKUp2,0,6)
setFrameLength(*HKUp2,1,5)
setFrameLength(*HKUp2,6,12)
setFrameSound(*HKUp2,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*HKUp2,2,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFramePush(*HKUp2,4,-20)
setFramePush(*HKUp2,5,-20,-30)
setFramePush(*HKUp2,6,0,-60)
setFrameCanDoNext(*HKUp2,6,6)
setFrameMovement(*HKUp2,0,20)
setFrameMovement(*HKUp2,2,-20)
setFrameMovement(*HKUp2,3,-20)
setFrameDamageDuration(*HKUp2,5,5)

*HKUp2_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_1WindFront",6,#H2H_ANIMATIONTYPE_NUP,"Up 2 1 wind front",0,*HKUp2_1WindFrontRaw)
*HKUp2_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_2WindFront",5,#H2H_ANIMATIONTYPE_NUP,"Up 2 2 wind front",0,*HKUp2_2WindFrontRaw)
*HKUp2_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_3WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 3 wind front",0,*HKUp2_3WindFrontRaw)
*HKUp2_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 4 wind front",0,*HKUp2_4WindFrontRaw)
*HKUp2_5WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_5WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 5 wind front",0,*HKUp2_5WindFrontRaw)
*HKUp2_6WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_6WindFront",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 6 wind front",0,*HKUp2_6WindFrontRaw)
*HKUp2_7WindFront.animation=classGenerateAnimation(3,"image/hand_hexkey_up2_7WindFront",3,#H2H_ANIMATIONTYPE_NUP,"Up 2 7 wind front",0,*HKUp2_7WindFrontRaw)
For i=1 To 3
	setFrameLength(*HKUp2_7WindFront,i,3+i)
Next

*HKUp2_5WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_5WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 5 wind back",0,*HKUp2_5WindBackRaw)
*HKUp2_6WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_up2_6WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 6 wind back",0,*HKUp2_6WindBackRaw)
*HKUp2_7WindBack.animation=classGenerateAnimation(1,"image/hand_hexkey_up2_7WindBack",4,#H2H_ANIMATIONTYPE_NUP,"Up 2 7 wind back",0,*HKUp2_7WindBackRaw)

animationPrepareWind(*HKUp2,0)
*HKUp2\frontWind(0,0)=*HKUp2_1WindFront
*HKUp2\frontWind(1,0)=*HKUp2_2WindFront
*HKUp2\frontWind(2,0)=*HKUp2_3WindFront
*HKUp2\frontWind(3,0)=*HKUp2_4WindFront
*HKUp2\frontWind(4,0)=*HKUp2_5WindFront
*HKUp2\frontWind(5,0)=*HKUp2_6WindFront
*HKUp2\frontWind(6,0)=*HKUp2_7WindFront
*HKUp2\backWind(4,0)=*HKUp2_5WindBack
*HKUp2\backWind(5,0)=*HKUp2_6WindBack
*HKUp2\backWind(6,0)=*HKUp2_7WindBack
animationFreeMovementWind(*HKUp2)
animationGetUp(*hexKey_back2)=*HKUp2

;------- Down 1
*hexKey_down1.animation=classGenerateAnimation(4,"image/hand_hexkey_down1_",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1",0,*HKDown1Raw,30,#H2H_DAMAGETYPE_BLUNT,7)
setFrameSound(*hexKey_down1,1,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameMovement(*hexKey_down1,0,15)
setFrameMovement(*hexKey_down1,1,-30,5)
setFrameMovement(*hexKey_down1,2,-40,30)
setFrameMovement(*hexKey_down1,3,-80,-20)
setFrameMovement(*hexKey_down1,4,-40,-15)
animationPrepareWind(*hexKey_down1)

*hexKey_down1_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_1WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 1 wind front",0,*HKDown1_1WindFrontRaw)
*hexKey_down1_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 2 wind front",0,*HKDown1_2WindFrontRaw)
*hexKey_down1_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_3WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 3 wind front",0,*HKDown1_3WindFrontRaw)
*hexKey_down1_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_4WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 4 wind front",0,*HKDown1_4WindFrontRaw)
*hexKey_down1_5WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_down1_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 5 wind front",0,*HKDown1_5WindFrontRaw)

*hexKey_down1_4WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_4WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 4 wind back",0,*HKDown1_4WindBackRaw)
*hexKey_down1_5WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_down1_5WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"down 1 5 wind back",0,*HKDown1_5WindBackRaw)

*hexKey_down1\frontWind(0,0)=*hexKey_down1_1WindFront
*hexKey_down1\frontWind(1,0)=*hexKey_down1_2WindFront
*hexKey_down1\frontWind(2,0)=*hexKey_down1_3WindFront
*hexKey_down1\frontWind(3,0)=*hexKey_down1_4WindFront
*hexKey_down1\frontWind(4,0)=*hexKey_down1_5WindFront

*hexKey_down1\backWind(3,0)=*hexKey_down1_4WindBack
*hexKey_down1\backWind(4,0)=*hexKey_down1_5WindBack

;------- Down 2
*hexKey_down2.animation=classGenerateAnimation(4,"image/hand_hexkey_down2_",4,#H2H_ANIMATIONTYPE_NDOWN,"down 3",0,*HKDown2Raw,25,#H2H_DAMAGETYPE_BLUNT,8)
setFrameSound(*hexKey_down2,1,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameLength(*hexKey_down2,4,15)
setFrameDamage(*hexKey_down2,3,10)
setFrameMovement(*hexKey_down2,0,10)
setFrameMovement(*hexKey_down2,2,-50)
setFrameMovement(*hexKey_down2,3,-50)
setFrameMovement(*hexKey_down2,4,-50)
setFrameDamageDuration(*hexKey_down2,4,5)
setFrameCanDoNext(*hexKey_down2,4,5)
animationSetComboEnd(*hexKey_down2,#True)
animationGetDown(*hexKey_neutral3)=*hexKey_down2
setFrameSound(*hexKey_down2,4,#H2H_SOUND_ID_HAND_LAND)
setFrameShake(*hexKey_down2,4,15)

animationPrepareWind(*hexKey_down2)
*hexKey_down2_1WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"down 2 1 wind front",0,*HKDown2_1WindFrontRaw)
*hexKey_down2_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down2_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"down 2 2 wind front",0,*HKDown2_2WindFrontRaw)
*hexKey_down2_3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down2_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"down 2 3 wind front",0,*HKDown2_3WindFrontRaw)
*hexKey_down2_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down2_4WindFront",7,#H2H_ANIMATIONTYPE_NDOWN,"down 2 4 wind front",0,*HKDown2_4WindFrontRaw)
animationFreeMovement(*hexKey_down2_4WindFront)
*hexKey_down2_5WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_down2_5WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 2 5 wind front",0,*HKDown2_5WindFrontRaw)
animationFreeMovement(*hexKey_down2_5WindFront)

*hexKey_down2_4WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_down2_4WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"down 2 4 wind back",0,*HKDown2_4WindBackRaw)
animationFreeMovement(*hexKey_down2_4WindBack)

*hexKey_down2\frontWind(0,0)=*hexKey_down2_1WindFront
*hexKey_down2\frontWind(1,0)=*hexKey_down2_2WindFront
*hexKey_down2\frontWind(2,0)=*hexKey_down2_3WindFront
*hexKey_down2\frontWind(3,0)=*hexKey_down2_4WindFront
*hexKey_down2\frontWind(4,0)=*hexKey_down2_5WindFront

;------- Down 3
*hexKey_down3.animation=classGenerateAnimation(2,"image/hand_hexkey_down3_",5,#H2H_ANIMATIONTYPE_NDOWN,"down 3",0,*HKDown3Raw,30,#H2H_DAMAGETYPE_BLUNT,0)
setFrameMovement(*hexKey_down3,0,30,40)
setFrameMovement(*hexKey_down3,1,60,15)
setFrameMovement(*hexKey_down3,2,10,15)
setFrameGrab(*hexKey_down3,0)
setFrameGrab(*hexKey_down3,1)
setFrameGrab(*hexKey_down3,2)
setFramePush(*hexKey_down3,0,5,40)
setFramePush(*hexKey_down3,1,5,40)
setFramePush(*hexKey_down3,2,5,20)
setFrameStun(*hexKey_down3,0,8)
setFrameStun(*hexKey_down3,1,8)
setFrameStun(*hexKey_down3,2,10)
setFrameShake(*hexKey_down3,2,8)
setFrameSound(*hexKey_down3,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameSound(*hexKey_down3,2,#H2H_SOUND_ID_METALBLUNTBLOCK)
enableFrameDamageCut(*hexKey_down3,0)
enableFrameDamageCut(*hexKey_down3,1)
enableFrameDamageCut(*hexKey_down3,2)
setFrameLength(*hexKey_down3,2,10)
*hexKey_down3\frames(2)\damageDuration=5
setFrameCanDoNext(*hexKey_down3,2,6)

animationGetDown(*hexkey_up1)=*hexKey_down3
animationPrepareWind(*hexKey_down3)
*hexKey_down3_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down3_1WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 3 1 wind front",0,*HKDown3_1WindFrontRaw)
*hexKey_down3_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_down3_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 3 2 wind front",0,*HKDown3_2WindFrontRaw)
*hexKey_down3_3WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_down3_3WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"down 3 3 wind front",0,*HKDown3_3WindFrontRaw)
animationFreeMovementWind(*hexKey_down3)

*hexKey_down3\frontWind(0,0)=*hexKey_down3_1WindFront
*hexKey_down3\frontWind(1,0)=*hexKey_down3_2WindFront
*hexKey_down3\frontWind(2,0)=*hexKey_down3_3WindFront

;------- Heavy 1
*hexKey_heavy1.animation=classGenerateAnimation(5,"image/hand_hexkey_heavy1_",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1",0,*HKHeavy1Raw,30,#H2H_DAMAGETYPE_BLUNT,10)
setFrameMovement(*hexKey_heavy1,0,40,20)
setFrameMovement(*hexKey_heavy1,1,40,20)
setFrameMovement(*hexKey_heavy1,2,40,40)
setFrameMovement(*hexKey_heavy1,3,-80,-60)
setFrameMovement(*hexKey_heavy1,4,-100,-20)
setFrameMovement(*hexKey_heavy1,5,-20)
setFrameLength(*hexKey_heavy1,5,12)
setFrameCanDoNext(*hexKey_heavy1,5,6)
setFrameStun(*hexKey_heavy1,3,10)
setFrameStun(*hexKey_heavy1,4,10)
setFrameSound(*hexKey_heavy1,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*hexKey_heavy1,3,#H2H_SOUND_ID_METALHEAVYWOOSH)
animationPrepareWind(*hexKey_heavy1)

*hexKey_heavy1_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy1_1WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind front",0,*HKHeavy1_1WindFrontRaw)
*hexKey_heavy1_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy1_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 2 wind front",0,*HKHeavy1_2WindFrontRaw)
*hexKey_heavy1_3WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_heavy1_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind front",0,*HKHeavy1_3WindFrontRaw)
*hexKey_heavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy1_4WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind front",0,*HKHeavy1_4WindFrontRaw)
*hexKey_heavy1_5WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_heavy1_5WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind front",0,*HKHeavy1_5WindFrontRaw)

*hexKey_heavy1_1WindBack.animation=classGenerateAnimation(1,"image/hand_hexkey_heavy1_1WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 1 wind back",0,*HKHeavy1_1WindBackRaw)
*hexKey_heavy1_3WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_heavy1_3WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 3 wind back",0,*HKHeavy1_3WindBackRaw)
*hexKey_heavy1_4WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy1_4WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 4 wind back",0,*HKHeavy1_4WindBackRaw)
*hexKey_heavy1_5WindBack.animation=classGenerateAnimation(3,"image/hand_hexkey_heavy1_5WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 1 5 wind back",0,*HKHeavy1_5WindBackRaw)

*hexKey_heavy1\frontWind(0,0)=*hexKey_heavy1_1WindFront
*hexKey_heavy1\frontWind(1,0)=*hexKey_heavy1_2WindFront
*hexKey_heavy1\frontWind(2,0)=*hexKey_heavy1_3WindFront
*hexKey_heavy1\frontWind(3,0)=*hexKey_heavy1_4WindFront
*hexKey_heavy1\frontWind(4,0)=*hexKey_heavy1_5WindFront

*hexKey_heavy1\backWind(0,0)=*hexKey_heavy1_1WindBack
*hexKey_heavy1\backWind(2,0)=*hexKey_heavy1_3WindBack
*hexKey_heavy1\backWind(3,0)=*hexKey_heavy1_4WindBack
*hexKey_heavy1\backWind(4,0)=*hexKey_heavy1_5WindBack

;------- Heavy 2
*hexKey_heavy2.animation=classGenerateAnimation(5,"image/hand_hexkey_heavy2_",5,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2",0,*HKHeavy2Raw,30,#H2H_DAMAGETYPE_BLUNT,12)
setFrameSound(*hexKey_heavy2,0,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameSound(*hexKey_heavy2,2,#H2H_SOUND_ID_METALHEAVYWOOSH)
setFrameSound(*hexKey_heavy2,4,#H2H_SOUND_ID_HAND_LAND)
setFrameShake(*hexKey_heavy2,4,15)
setFrameLength(*hexKey_heavy2,0,5)
setFrameLength(*hexKey_heavy2,2,6)
setFrameLength(*hexKey_heavy2,2,10)
setFrameLength(*hexKey_heavy2,4,15)
setFrameLength(*hexKey_heavy2,5,8)
setFrameMovement(*hexKey_heavy2,0,20,-20)
setFrameMovement(*hexKey_heavy2,1,70)
setFrameMovement(*hexKey_heavy2,2,20,20)
setFrameMovement(*hexKey_heavy2,3,-55,-29)
setFrameMovement(*hexKey_heavy2,4,-100,-30)
setFrameMovement(*hexKey_heavy2,5,20,59)
setFramePush(*hexKey_heavy2,3,-20,-5)
setFramePush(*hexKey_heavy2,4,-50,5)
setFramePush(*hexKey_heavy2,5,1,25)
; setFrameStun(*hexKey_heavy2,5,15)
setFrameDamageDuration(*hexKey_heavy2,4,7)
animationPrepareWind(*hexKey_heavy2,1)

*hexKey_heavy2_1WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy2_1WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 1 wind front",0,*HKHeavy2_1WindFrontRaw)
*hexKey_heavy2_2WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy2_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 2 wind front",0,*HKHeavy2_2WindFrontRaw)
*hexKey_heavy2_3WindFront.animation=classGenerateAnimation(3,"image/hand_hexkey_heavy2_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 3 wind front",0,*HKHeavy2_3WindFrontRaw)
*hexKey_heavy2_4WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_heavy2_4WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 4 wind front",0,*HKHeavy2_4WindFrontRaw)
*hexKey_heavy2_5WindFront1.animation=classGenerateAnimation(3,"image/hand_hexkey_heavy2_5WindFront1_",6,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 5 1 wind front",0,*HKHeavy2_5WindFront1Raw)
*hexKey_heavy2_5WindFront2.animation=classGenerateAnimation(3,"image/hand_hexkey_heavy2_5WindFront2_",4,#H2H_ANIMATIONTYPE_HEAVY,"heavy 2 5 2 wind front",0,*HKHeavy2_5WindFront2Raw)
For i=0 To 3
	setFrameLength(*hexKey_heavy2_5WindFront2,i,4+i)
Next
animationFreeMovement(*hexKey_heavy2_5WindFront1)
animationFreeMovement(*hexKey_heavy2_5WindFront2)

*hexKey_heavy2\frontWind(0,0)=*hexKey_heavy2_1WindFront
*hexKey_heavy2\frontWind(1,0)=*hexKey_heavy2_2WindFront
*hexKey_heavy2\frontWind(2,0)=*hexKey_heavy2_3WindFront
*hexKey_heavy2\frontWind(3,0)=*hexKey_heavy2_4WindFront
*hexKey_heavy2\frontWind(4,0)=*hexKey_heavy2_5WindFront1
*hexKey_heavy2\frontWind(4,1)=*hexKey_heavy2_5WindFront2

animationGetHeavy(*hexKey_heavy1)=*hexKey_heavy2

;------- jump
*hexKey_jump.animation=classGenerateAnimation(5,"image/hand_hexkey_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*HKJumpRaw)

;------- spawn
*hexKey_spawn.animation=classGenerateAnimation(8,"image/hand_hexkey_spawn",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*HKSpawnRaw)
setFrameLength(*hexKey_spawn,0,20)
setFrameLength(*hexKey_spawn,1,15)
setFrameLength(*hexKey_spawn,2,10)
setFrameLength(*hexKey_spawn,6,10)
setFrameLength(*hexKey_spawn,7,12)
setFrameLength(*hexKey_spawn,8,15)
animationPrepareWind(*hexKey_spawn)
setFrameSound(*hexKey_spawn,3,#H2H_SOUND_ID_METALHEAVYWOOSH)
*hexKey_spawn4WindFront.animation=classGenerateAnimation(1,"image/hand_hexkey_spawn4WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind front",0,*HKSPawn4WindFrontRaw)
*hexKey_spawn5WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_spawn5WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind front",0,*HKSPawn5WindFrontRaw)
*hexKey_spawn6WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_spawn6WindFront",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind front",0,*HKSPawn6WindFrontRaw)

*hexKey_spawn3WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_spawn3WindBack",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 3 wind back",0,*HKSPawn3WindBackRaw)
*hexKey_spawn5WindBack.animation=classGenerateAnimation(0,"image/hand_hexkey_spawn5WindBack",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind back",0,*HKSPawn5WindBackRaw)
*hexKey_spawn6WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_spawn6WindBack",7,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind back",0,*HKSPawn6WindBackRaw)

*hexKey_spawn\frontWind(3,0)=*hexKey_spawn4WindFront
*hexKey_spawn\frontWind(4,0)=*hexKey_spawn5WindFront
*hexKey_spawn\frontWind(5,0)=*hexKey_spawn6WindFront

*hexKey_spawn\backWind(2,0)=*hexKey_spawn3WindBack
*hexKey_spawn\backWind(4,0)=*hexKey_spawn5WindBack
*hexKey_spawn\backWind(5,0)=*hexKey_spawn6WindBack

;------- land
*hexKey_land.animation=classGenerateAnimation(3,"image/hand_hexkey_land",5,#H2H_ANIMATIONTYPE_LAND,"jump",0,*HKLandRaw)
setFrameLength(*hexKey_land,1,10)
frameShiftShift(*hexKey_land,0,0,20)
frameShiftShift(*hexKey_land,1,0,40)
frameShiftShift(*hexKey_land,2,0,60)
frameShiftShift(*hexKey_land,3,0,20)

setFrameShadow(*hexKey_land,0,0,50)
setFrameShadow(*hexKey_land,1,1,200)
setFrameShadow(*hexKey_land,2,2,100)
setFrameShadow(*hexKey_land,3,3,50)

;------- spawn
*hexKey_death.animation=classGenerateAnimation(7,"image/hand_hexkey_death",7,#H2H_ANIMATIONTYPE_DEATH,"death",0,*HKDeathRaw)
setFrameLength(*hexKey_death,2,21)
setFrameLength(*hexKey_death,4,21)
setFrameLength(*hexKey_death,7,21)
setFrameSound(*hexKey_death,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*hexKey_death,2,#H2H_SOUND_ID_METALBLUNTMEDIUM)
setFrameSound(*hexKey_death,3,#H2H_SOUND_ID_SWISHMEDIUM)	
setFrameSound(*hexKey_death,4,#H2H_SOUND_ID_HAND_JUMPHEAVY)	
setFrameSound(*hexKey_death,5,#H2H_SOUND_ID_SWISHMEDIUM)	
setFrameSound(*hexKey_death,6,#H2H_SOUND_ID_HAND_FALL)	
setFrameSound(*hexKey_death,7,#H2H_SOUND_ID_METALBLUNTHEAVY)
setFrameMovement(*hexKey_death,5,50)
setFrameShadow(*hexKey_death,0,-50)
setFrameShadow(*hexKey_death,1,-50,10)
setFrameShadow(*hexKey_death,2,-100)
setFrameShadow(*hexKey_death,3,-150,20)
setFrameShadow(*hexKey_death,4,-100,50)
setFrameShadow(*hexKey_death,5,-100,100)
setFrameShadow(*hexKey_death,6,-125,150)
setFrameShadow(*hexKey_death,7,-125,150)
setFrameShake(*hexKey_death,2,10)
setFrameShake(*hexKey_death,6,20)
animationPrepareWind(*hexKey_death)

*hexKey_death2WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_death2WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind front",0,*HKDeath2WindFrontRaw)
*hexKey_death3WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_death3WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind front",0,*HKDeath3WindFrontRaw)
*hexKey_death4WindFront.animation=classGenerateAnimation(2,"image/hand_hexkey_death4WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind front",0,*HKDeath4WindFrontRaw)
*hexKey_death6WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_death6WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front",0,*HKDeath6WindFrontRaw)
*hexKey_death7WindFront.animation=classGenerateAnimation(0,"image/hand_hexkey_death7WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 7 wind front",0,*HKDeath7WindFrontRaw)
*hexKey_death8WindFront.animation=classGenerateAnimation(3,"image/hand_hexkey_death8WindFront",7,#H2H_ANIMATIONTYPE_DEATH,"death 8 wind front",0,*HKDeath8WindFrontRaw)

*hexKey_death8WindBack.animation=classGenerateAnimation(2,"image/hand_hexkey_death8WindBack",7,#H2H_ANIMATIONTYPE_DEATH,"death 8 wind back",0,*HKDeath8WindBackRaw)

*hexKey_death\frontWind(1,0)=*hexKey_death2WindFront
*hexKey_death\frontWind(2,0)=*hexKey_death3WindFront
*hexKey_death\frontWind(3,0)=*hexKey_death4WindFront
*hexKey_death\frontWind(5,0)=*hexKey_death6WindFront
*hexKey_death\frontWind(6,0)=*hexKey_death7WindFront
*hexKey_death\frontWind(7,0)=*hexKey_death8WindFront

*hexKey_death\backWind(7,0)=*hexKey_death8WindBack
animationFreeMovementWind(*hexKey_death)

;------- Hit
*hexKey_hit.animation=classGenerateAnimation(4,"image/hand_hexkey_hit",6,#H2H_ANIMATIONTYPE_HIT,"hit",0,*HKHitRaw)

;------- Dodge
*HKDodge.animation=classGenerateAnimation(1,"image/hand_hexkey_dodge",5,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*HKDodgeRaw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameLength(*HKDodge,1,18)

*hexKey_stat.statistic=statisticCreate(0,4,3,0,4,2,2,-1,-1,4,1,3)
ReDim *tmpArray(1)
*tmpArray(0)=*metal_hit
*tmpArray(1)=*finger_hit
*hexKey_stance_aluminium.stance=stanceCreate(*tmpArray(),0,"Aluminum")
statisticCreate(*hexKey_stance_aluminium\modificator,0,0,2,-2,0,0,0,0,0,0)
*hexKey_stance_aluminium\specialcolor=#H2H_STANCE_COLOR_WHITE
*hexKey_stance_aluminium\alternatecolor=#H2H_STANCE_COLOR_YELLOW

*hexKey.class=classCreate(0,"Hex key",*hexKey_Idle,*hexKey_Front,*hexKey_Back,*hexKey_neutral1,*hexKey_side1,*hexKey_up1,*hexKey_back1,*hexKey_down1,*hexKey_heavy1)
*hexKey\allStances(0)\specialcolor=#H2H_STANCE_COLOR_GRAY
*hexKey\allStances(0)\alternatecolor=#H2H_STANCE_COLOR_BLACK
*hexKey\allStances(0)\alternateTransparency=160

*hexKey\allStances(0)\name="Steel (Default)"
classAddStance(*hexKey,*hexKey_stance_aluminium)
*hexKey\iconPath$="image\Hex key.png"
*hexKey\stat=*hexKey_stat
*hexKey\desc$="Heavy hammer with precise & hard hits, specialist at pulling the ennemy in range.\Solid fight, slow movement but agile attacks."

classGetJump(*hexKey)=*hexKey_jump
classGetSpawn(*hexKey)=*hexKey_spawn
classGetLand(*hexKey)=*hexKey_land
classGetHit(*hexKey)=*hexKey_hit
classGetDeath(*hexKey)=*hexKey_death
classGetDodge(*hexKey)=*HKDodge

ReDim *hexKey\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*hexKey\allStances(0)\materialClass(i)=*tmpArray(i)
Next

Dim *hexKey\otherIdle(0)
*hexKey\otherIdle(0)=*hexKey_Idle2
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 369
; FirstLine = 351
; EnableXP
; CPU = 1