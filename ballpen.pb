;------ Ballpen

;------- Idle 1
*BPIdle1.animation=classGenerateAnimation(9,"image/hand_ballpen_idle1_",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1",1,*BPIdle1Raw)

animationPrepareWind(*BPIdle1,0)

*BPIdle1_1FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_1WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 wind front",0,*BPIdle1_1WindFrontRaw)
animationSetFrameLength(*BPIdle1_1FrontWind,1,6)
animationSetFrameOpacity(*BPIdle1_1FrontWind,0,128)
animationSetFrameOpacity(*BPIdle1_1FrontWind,1,64)
*BPIdle1_2FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_2WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 wind front",0,*BPIdle1_2WindFrontRaw)
animationSetFrameLength(*BPIdle1_2FrontWind,1,6)
animationSetFrameOpacity(*BPIdle1_2FrontWind,0,128)
animationSetFrameOpacity(*BPIdle1_2FrontWind,1,64)
*BPIdle1_4FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_4WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 wind front",0,*BPIdle1_4WindFrontRaw)
animationSetFrameOpacity(*BPIdle1_4FrontWind,0,128)
*BPIdle1_5FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_5WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 wind front",0,*BPIdle1_5WindFrontRaw)
animationSetFrameOpacity(*BPIdle1_5FrontWind,0,128)
*BPIdle1_6FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 6 wind front",0,*BPIdle1_6WindFrontRaw)
animationSetFrameLength(*BPIdle1_6FrontWind,1,6)
animationSetFrameOpacity(*BPIdle1_6FrontWind,0,128)
animationSetFrameOpacity(*BPIdle1_6FrontWind,1,64)
*BPIdle1_7FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_7WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 7 wind front",0,*BPIdle1_7WindFrontRaw)
animationSetFrameOpacity(*BPIdle1_7FrontWind,0,128)
*BPIdle1_8FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_8WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 wind front",0,*BPIdle1_8WindFrontRaw)
animationSetFrameLength(*BPIdle1_8FrontWind,1,6)
animationSetFrameOpacity(*BPIdle1_8FrontWind,0,128)
animationSetFrameOpacity(*BPIdle1_8FrontWind,1,64)
*BPIdle1_10FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_10WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 10 wind front",0,*BPIdle1_10WindFrontRaw)
animationSetFrameLength(*BPIdle1_10FrontWind,1,6)
animationSetFrameOpacity(*BPIdle1_10FrontWind,0,128)
animationSetFrameOpacity(*BPIdle1_10FrontWind,1,64)

*BPIdle1\frontWind(0,0)=*BPIdle1_1FrontWind
*BPIdle1\frontWind(1,0)=*BPIdle1_2FrontWind
*BPIdle1\frontWind(3,0)=*BPIdle1_4FrontWind
*BPIdle1\frontWind(4,0)=*BPIdle1_5FrontWind
*BPIdle1\frontWind(5,0)=*BPIdle1_6FrontWind
*BPIdle1\frontWind(6,0)=*BPIdle1_7FrontWind
*BPIdle1\frontWind(7,0)=*BPIdle1_8FrontWind
*BPIdle1\frontWind(9,0)=*BPIdle1_10FrontWind

*BPIdle1_1BackWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_1WindBack",7,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 wind back",0,*BPIdle1_1WindBackRaw)
animationSetFrameLength(*BPIdle1_1BackWind,1,8)
animationSetFrameOpacity(*BPIdle1_1BackWind,0,128)
animationSetFrameOpacity(*BPIdle1_1BackWind,1,64)
*BPIdle1_4BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_4WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 wind back",0,*BPIdle1_4WindBackRaw)
animationSetFrameOpacity(*BPIdle1_4BackWind,0,128)
*BPIdle1_5BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_5WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 wind back",0,*BPIdle1_5WindBackRaw)
animationSetFrameOpacity(*BPIdle1_5BackWind,0,128)
*BPIdle1_8BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_8WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 wind back",0,*BPIdle1_8WindBackRaw)
animationSetFrameOpacity(*BPIdle1_8BackWind,0,128)

*BPIdle1\backWind(0,0)=*BPIdle1_1BackWind
*BPIdle1\backWind(3,0)=*BPIdle1_4BackWind
*BPIdle1\backWind(4,0)=*BPIdle1_5BackWind
*BPIdle1\backWind(7,0)=*BPIdle1_8BackWind

Procedure animationShiftAll(*a.animation,Array shifterX(1), Array shifterY(1))
	For i=0 To ArraySize(*a\frames())
		animationShiftShift(*a,i,shifterX(i),shifterY(i))
		If *a\frontWind()
			For j=0 To ArraySize(*a\frontWind(),2)
				If *a\frontWind(i,j)
					For k=0 To ArraySize(*a\frontWind(i,j)\frames())
						animationShiftShift(*a\frontWind(i,j),k,shifterX(i),shifterY(i))
					Next
				EndIf
			Next
		EndIf
		If *a\backWind()
			For j=0 To ArraySize(*a\backWind(),2)
				If *a\backWind(i,j)
					For k=0 To ArraySize(*a\backWind(i,j)\frames())
						animationShiftShift(*a\backWind(i,j),k,shifterX(i),shifterY(i))
					Next
				EndIf
			Next
		EndIf
	Next
EndProcedure

Dim tmpShiftY(9)
tmpShiftY(0)=0
tmpShiftY(1)=2
tmpShiftY(2)=6
tmpShiftY(3)=8
tmpShiftY(4)=10
tmpShiftY(5)=6
tmpShiftY(6)=2
tmpShiftY(7)=0
tmpShiftY(8)=-2
tmpShiftY(9)=-3

Dim tmpShiftX(9)
For i=0 To 9
	tmpShiftX(i)=i
Next
animationShiftAll(*BPIdle1,tmpShiftX(),tmpShiftY())

FreeArray(tmpShiftX())
FreeArray(tmpShiftY())
animationSetFrameShadow(*BPIdle1,0,0)
animationSetFrameShadow(*BPIdle1,1,2)
animationSetFrameShadow(*BPIdle1,2,6)
animationSetFrameShadow(*BPIdle1,3,8)
animationSetFrameShadow(*BPIdle1,4,10)
animationSetFrameShadow(*BPIdle1,5,6)
animationSetFrameShadow(*BPIdle1,6,2)
animationSetFrameShadow(*BPIdle1,7,0)
animationSetFrameShadow(*BPIdle1,8,-2)
animationSetFrameShadow(*BPIdle1,9,-3)
animationFreeMovementWind(*BPIdle1)

;------- Idle 2
*BPIdle2.animation=classGenerateAnimation(5,"image/hand_ballpen_idle2_",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*BPIdle2Raw)
animationPrepareWind(*BPIdle2)

*BPIdle2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_1WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 1 wind front",0,*BPIdle2_1WindFrontRaw)
animationSetFrameOpacity(*BPIdle2_1WindFront,0,128)
*BPIdle2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_2WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind front",0,*BPIdle2_2WindFrontRaw)
animationSetFrameOpacity(*BPIdle2_2WindFront,0,128)
*BPIdle2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_3WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind front",0,*BPIdle2_3WindFrontRaw)
animationSetFrameOpacity(*BPIdle2_3WindFront,0,128)
*BPIdle2_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_5WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*BPIdle2_5WindFrontRaw)
animationSetFrameOpacity(*BPIdle2_5WindFront,0,128)
*BPIdle2_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_idle2_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind front",0,*BPIdle2_6WindFrontRaw)
animationSetFrameLength(*BPIdle2_6WindFront,1,6)
animationSetFrameLength(*BPIdle2_6WindFront,2,7)
animationSetFrameOpacity(*BPIdle2_6WindFront,0,192)
animationSetFrameOpacity(*BPIdle2_6WindFront,1,128)
animationSetFrameOpacity(*BPIdle2_6WindFront,2,64)

*BPIdle2_2FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_2WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind back",0,*BPIdle2_2WindBackRaw)
animationSetFrameOpacity(*BPIdle2_2FrontWind,0,128)
*BPIdle2_3FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_3WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind back",0,*BPIdle2_3WindBackRaw)
animationSetFrameOpacity(*BPIdle2_3FrontWind,0,128)
*BPIdle2_5FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_5WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind back",0,*BPIdle2_5WindBackRaw)
animationSetFrameOpacity(*BPIdle2_5FrontWind,0,128)

*BPIdle2\frontWind(0,0)=*BPIdle2_1WindFront
*BPIdle2\frontWind(1,0)=*BPIdle2_2WindFront
*BPIdle2\frontWind(2,0)=*BPIdle2_3WindFront
*BPIdle2\frontWind(4,0)=*BPIdle2_5WindFront
*BPIdle2\frontWind(5,0)=*BPIdle2_6WindFront

*BPIdle2\backWind(1,0)=*BPIdle2_2FrontWind
*BPIdle2\backWind(2,0)=*BPIdle2_3FrontWind
*BPIdle2\backWind(5,0)=*BPIdle2_5FrontWind

Dim tmpShiftX(5)
tmpShiftX(0)=5
tmpShiftX(1)=15
tmpShiftX(2)=25
tmpShiftX(3)=15
tmpShiftX(4)=5
Dim tmpShiftY(5)
tmpShiftY(1)=-5
tmpShiftY(2)=-15
tmpShiftY(3)=-5
tmpShiftY(4)=5
animationShiftAll(*BPIdle2,tmpShiftX(),tmpShiftY())
FreeArray(tmpShiftX())
FreeArray(tmpShiftY())

animationSetFrameShadow(*BPIdle2,0,5)
animationSetFrameShadow(*BPIdle2,1,15,5)
animationSetFrameShadow(*BPIdle2,2,25,15)
animationSetFrameShadow(*BPIdle2,3,15,-5)
animationSetFrameShadow(*BPIdle2,4,5,5)

animationFreeMovementWind(*BPIdle2)

;------- Idle 3
*BPIdle3.animation=classGenerateAnimation(7,"image/hand_ballpen_idle3_",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3",1,*BPIdle3Raw)
animationPrepareWind(*BPIdle3)
animationSetFrameLength(*BPIdle3,4,25)
animationSetFrameLength(*BPIdle3,5,6)
animationSetFrameLength(*BPIdle3,6,9)
animationSetFrameLength(*BPIdle3,7,6)

*BPIdle3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_2WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind front",0,*BPIdle3_2WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_2WindFront,0,128)
*BPIdle3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_3WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind front",0,*BPIdle3_3WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_3WindFront,0,128)
*BPIdle3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_4WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind front",0,*BPIdle3_4WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_4WindFront,0,128)
*BPIdle3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_5WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind front",0,*BPIdle3_5WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_5WindFront,0,128)
*BPIdle3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_6WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 3 6 wind front",0,*BPIdle3_6WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_6WindFront,0,128)
*BPIdle3_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_7WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 7 wind front",0,*BPIdle3_7WindFrontRaw)
animationSetFrameOpacity(*BPIdle3_7WindFront,0,128)
*BPIdle3_8WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_idle3_8WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 8 wind front",0,*BPIdle3_8WindFrontRaw)
animationSetFrameLength(*BPIdle3_8WindFront,1,6)
animationSetFrameOpacity(*BPIdle3_8WindFront,0,128)
animationSetFrameOpacity(*BPIdle3_8WindFront,1,64)

*BPIdle3_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_4WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind back",0,*BPIdle3_4WindBackRaw)
*BPIdle3_5WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_idle3_5WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind back",0,*BPIdle3_5WindBackRaw)
animationSetFrameLength(*BPIdle3_5WindBack,1,7)
animationSetFrameOpacity(*BPIdle3_5WindBack,0,128)
animationSetFrameOpacity(*BPIdle3_5WindBack,1,64)
*BPIdle3_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_6WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 3 6 wind back",0,*BPIdle3_6WindBackRaw)
animationSetFrameOpacity(*BPIdle3_6WindBack,0,128)
*BPIdle3_7WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_7WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 7 wind back",0,*BPIdle3_7WindBackRaw)
animationSetFrameOpacity(*BPIdle3_7WindBack,0,128)
*BPIdle3_8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_8WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 8 wind back",0,*BPIdle3_8WindBackRaw)
animationSetFrameOpacity(*BPIdle3_8WindBack,0,128)

*BPIdle3\frontWind(1,0)=*BPIdle3_2WindFront
*BPIdle3\frontWind(2,0)=*BPIdle3_3WindFront
*BPIdle3\frontWind(3,0)=*BPIdle3_4WindFront
*BPIdle3\frontWind(4,0)=*BPIdle3_5WindFront
*BPIdle3\frontWind(5,0)=*BPIdle3_6WindFront
*BPIdle3\frontWind(6,0)=*BPIdle3_7WindFront
*BPIdle3\frontWind(7,0)=*BPIdle3_8WindFront

*BPIdle3\backWind(3,0)=*BPIdle3_4WindBack
*BPIdle3\backWind(4,0)=*BPIdle3_5WindBack
*BPIdle3\backWind(5,0)=*BPIdle3_6WindBack
*BPIdle3\backWind(6,0)=*BPIdle3_7WindBack
*BPIdle3\backWind(7,0)=*BPIdle3_8WindBack

Dim tmpShiftX(7)
tmpShiftX(0)=5
tmpShiftX(1)=10
tmpShiftX(2)=15
tmpShiftX(3)=20
tmpShiftX(4)=25
tmpShiftX(5)=30
tmpShiftX(6)=10
tmpShiftX(7)=-10
Dim tmpShiftY(7)
tmpShiftY(1)=-5
tmpShiftY(2)=-15
tmpShiftY(3)=-25
tmpShiftY(4)=-35
tmpShiftY(5)=-45
tmpShiftY(6)=-22
animationShiftAll(*BPIdle3,tmpShiftX(),tmpShiftY())
FreeArray(tmpShiftX())
FreeArray(tmpShiftY())

animationSetFrameShadow(*BPIdle3,1,10,-10)
animationSetFrameShadow(*BPIdle3,2,20,-20)
animationSetFrameShadow(*BPIdle3,3,30,-30)
animationSetFrameShadow(*BPIdle3,4,40,-40)
animationSetFrameShadow(*BPIdle3,4,40,-40)
animationSetFrameShadow(*BPIdle3,5,20,-20)
animationSetFrameShadow(*BPIdle3,6,10,-10)

animationFreeMovementWind(*BPIdle3)

;------- Move Front
*BPMoveFront.animation=classGenerateAnimation(8,"image/hand_ballpen_move_front",4,#H2H_ANIMATIONTYPE_FRONT,"move front",1,*BPMoveFrontRaw)
For i=0 To 4
	animationSetFrameLength(*BPMoveFront,i,2)
Next

;------- Move Back
*BPMoveBack.animation=classGenerateAnimation(3,"image/hand_ballpen_move_back",5,#H2H_ANIMATIONTYPE_BACK,"move back",1,*BPMoveBackRaw)
ReDim *BPMoveBack\frames(5)
*BPMoveBack\frames(4)=*BPMoveBack\frames(2)
*BPMoveBack\frames(5)=*BPMoveBack\frames(1)

;------- Neutral 1
*BPNeutral1.animation=classGenerateAnimation(9,"image/hand_ballpen_neutral1_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*BPNeutral1Raw,8,#H2H_DAMAGETYPE_CUT,4)
animationSetFrameSound(*BPNeutral1,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPNeutral1,6,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameDamageCut(*BPNeutral1,7)
animationSetFrameLength(*BPNeutral1,2,2) ;3
animationSetFrameLength(*BPNeutral1,3,2)
; setFrameLength(*BPNeutral1,4,3)
; setFrameLength(*BPNeutral1,5,3)
; setFrameLength(*BPNeutral1,7,3)
; setFrameLength(*BPNeutral1,8,3)
animationSetFrameLength(*BPNeutral1,9,8)
animationSetFrameDamageDuration(*BPNeutral1,9,4)
animationSetFrameMovement(*BPNeutral1,0,-5)
animationSetFrameMovement(*BPNeutral1,1,-5)
animationSetFrameMovement(*BPNeutral1,2,-5)
animationSetFrameMovement(*BPNeutral1,4,5)
animationSetFrameMovement(*BPNeutral1,5,5,-10)
animationSetFrameMovement(*BPNeutral1,6,0,-50)
animationSetFrameMovement(*BPNeutral1,7,-5,-75)
animationSetFrameMovement(*BPNeutral1,8,-5,75)
animationSetFrameMovement(*BPNeutral1,9,-5,50)
animationSetFrameCDN(*BPNeutral1,9,4)

*BPNeutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind front",0,*BPNeutral1_1WindFrontRaw)
*BPNeutral1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*BPNeutral1_2WindFrontRaw)
*BPNeutral1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind front",0,*BPNeutral1_3WindFrontRaw)
*BPNeutral1_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*BPNeutral1_4WindFrontRaw)
*BPNeutral1_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 7 wind front",0,*BPNeutral1_7WindFrontRaw)
*BPNeutral1_8WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_8WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind front",0,*BPNeutral1_8WindFrontRaw)
*BPNeutral1_9WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_9WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind front",0,*BPNeutral1_9WindFrontRaw)
*BPNeutral1_10WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral1_10WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 10 wind front",0,*BPNeutral1_10WindFrontRaw)
animationSetFrameLength(*BPNeutral1_10WindFront,1,5)
animationSetFrameLength(*BPNeutral1_10WindFront,2,6)
animationSetFrameLength(*BPNeutral1_10WindFront,3,7)
animationSetFrameOpacity(*BPNeutral1_10WindFront,1,192)
animationSetFrameOpacity(*BPNeutral1_10WindFront,2,128)
animationSetFrameOpacity(*BPNeutral1_10WindFront,3,64)

*BPNeutral1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind back",0,*BPNeutral1_1WindBackRaw)
*BPNeutral1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind back",0,*BPNeutral1_2WindBackRaw)
*BPNeutral1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind back",0,*BPNeutral1_3WindBackRaw)
*BPNeutral1_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind back",0,*BPNeutral1_4WindBackRaw)
*BPNeutral1_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_5WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 5 wind back",0,*BPNeutral1_5WindBackRaw)
*BPNeutral1_6WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_6WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind back",0,*BPNeutral1_6WindBackRaw)
animationSetFrameLength(*BPNeutral1_6WindBack,1,5)
animationSetFrameOpacity(*BPNeutral1_6WindBack,1,192)
*BPNeutral1_8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_8WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind back",0,*BPNeutral1_8WindBackRaw)
*BPNeutral1_9WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_9WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind back",0,*BPNeutral1_9WindBackRaw)
*BPNeutral1_10WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_10WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 10 wind back",0,*BPNeutral1_10WindBackRaw)
animationSetFrameLength(*BPNeutral1_10WindBack,1,7)
animationSetFrameOpacity(*BPNeutral1_10WindBack,1,192)

animationPrepareWind(*BPNeutral1,0)
*BPNeutral1\frontWind(0,0)=*BPNeutral1_1WindFront
*BPNeutral1\frontWind(1,0)=*BPNeutral1_2WindFront
*BPNeutral1\frontWind(2,0)=*BPNeutral1_3WindFront
*BPNeutral1\frontWind(3,0)=*BPNeutral1_4WindFront
*BPNeutral1\frontWind(6,0)=*BPNeutral1_7WindFront
*BPNeutral1\frontWind(7,0)=*BPNeutral1_8WindFront
*BPNeutral1\frontWind(8,0)=*BPNeutral1_9WindFront
*BPNeutral1\frontWind(9,0)=*BPNeutral1_10WindFront
*BPNeutral1\backWind(0,0)=*BPNeutral1_1WindBack
*BPNeutral1\backWind(1,0)=*BPNeutral1_2WindBack
*BPNeutral1\backWind(2,0)=*BPNeutral1_3WindBack
*BPNeutral1\backWind(3,0)=*BPNeutral1_4WindBack
*BPNeutral1\backWind(4,0)=*BPNeutral1_5WindBack
*BPNeutral1\backWind(5,0)=*BPNeutral1_6WindBack
*BPNeutral1\backWind(7,0)=*BPNeutral1_8WindBack
*BPNeutral1\backWind(8,0)=*BPNeutral1_9WindBack
*BPNeutral1\backWind(9,0)=*BPNeutral1_10WindBack

animationFreeMovementWind(*BPNeutral1)

;------- Neutral 2
*BPNeutral2.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral2_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2",0,*BPNeutral2Raw,8,#H2H_DAMAGETYPE_CUT,5)
animationSetFrameLength(*BPNeutral2,0,3)
animationSetFrameLength(*BPNeutral2,2,3)
animationSetFrameLength(*BPNeutral2,3,10)
animationSetFrameCDN(*BPNeutral2,3,5)
animationSetFrameSound(*BPNeutral2,1,#H2H_SOUND_ID_PLASTICSWING)

*BPNeutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 1 wind front",0,*BPNeutral2_1WindFrontRaw)
*BPNeutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 2 wind front",0,*BPNeutral2_2WindFrontRaw)
*BPNeutral2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind front",0,*BPNeutral2_3WindFrontRaw)
*BPNeutral2_4WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral2_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 4 wind front",0,*BPNeutral2_4WindFrontRaw)
animationSetFrameLength(*BPNeutral2_4WindFront,1,5)
animationSetFrameLength(*BPNeutral2_4WindFront,2,6)
animationSetFrameLength(*BPNeutral2_4WindFront,3,7)
animationSetFrameOpacity(*BPNeutral2_4WindFront,1,192)
animationSetFrameOpacity(*BPNeutral2_4WindFront,2,128)
animationSetFrameOpacity(*BPNeutral2_4WindFront,3,64)

animationPrepareWind(*BPNeutral2,0)
*BPNeutral2\frontWind(0,0)=*BPNeutral2_1WindFront
*BPNeutral2\frontWind(1,0)=*BPNeutral2_2WindFront
*BPNeutral2\frontWind(2,0)=*BPNeutral2_3WindFront
*BPNeutral2\frontWind(3,0)=*BPNeutral2_4WindFront

animationFreeMovementWind(*BPNeutral2)

;------- Neutral 3
*BPNeutral3.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*BPNeutral3Raw,12,#H2H_DAMAGETYPE_PIERCE,4)
animationSetFrameCDN(*BPNeutral3,2,4)
animationSetFrameSound(*BPNeutral3,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPNeutral3,2,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameLength(*BPNeutral3,0,3)
animationSetFrameLength(*BPNeutral3,2,12)
animationSetFrameMovement(*BPNeutral3,0,25)
animationSetFrameMovement(*BPNeutral3,1,25)
animationSetFrameMovement(*BPNeutral3,2,-125)
*BPNeutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral3_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind front",0,*BPNeutral3_1WindFrontRaw)
*BPNeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*BPNeutral3_2WindFrontRaw)
animationSetFrameLength(*BPNeutral3_2WindFront,1,5)
animationSetFrameLength(*BPNeutral3_2WindFront,2,6)
animationSetFrameOpacity(*BPNeutral3_2WindFront,1,192)
animationSetFrameOpacity(*BPNeutral3_2WindFront,2,128)
*BPNeutral3_3WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 3 wind front",0,*BPNeutral3_3WindFrontRaw)
animationSetFrameLength(*BPNeutral3_3WindFront,1,5)
animationSetFrameLength(*BPNeutral3_3WindFront,2,6)
animationSetFrameOpacity(*BPNeutral3_3WindFront,1,192)
animationSetFrameOpacity(*BPNeutral3_3WindFront,2,128)

animationPrepareWind(*BPNeutral3,0)
*BPNeutral3\frontWind(0,0)=*BPNeutral3_1WindFront
*BPNeutral3\frontWind(1,0)=*BPNeutral3_2WindFront
*BPNeutral3\frontWind(2,0)=*BPNeutral3_3WindFront
animationFreeMovementWind(*BPNeutral3)

animationGetNeutral(*BPNeutral2)=*BPNeutral3

;------- Neutral 4
*BPNeutral4.animation=classGenerateAnimation(7,"image/hand_ballpen_neutral4_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4",0,*BPNeutral4Raw,10,#H2H_DAMAGETYPE_CUT,5)
animationSetComboEnd(*BPNeutral4,#True)
animationSetFrameSound(*BPNeutral4,3,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameMovement(*BPNeutral4,0,15)
animationSetFrameMovement(*BPNeutral4,1,15)
animationSetFrameMovement(*BPNeutral4,2,15)
animationSetFrameMovement(*BPNeutral4,3,-30)
animationSetFrameMovement(*BPNeutral4,5,5,-40)
animationSetFrameMovement(*BPNeutral4,6,6,-60)
animationSetFrameMovement(*BPNeutral4,7,6,80)
animationSetFrameLength(*BPNeutral4,0,2)
animationSetFrameLength(*BPNeutral4,1,2)
animationSetFrameLength(*BPNeutral4,2,3)
animationSetFrameLength(*BPNeutral4,3,3)
animationSetFrameLength(*BPNeutral4,6,9)
animationSetFrameCDN(*BPNeutral4,6,7)
animationSetFrameDamageDuration(*BPNeutral4,6,4)

*BPNeutral4_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 4 wind front",0,*BPNeutral4_4WindFrontRaw)
*BPNeutral4_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 5 wind front",0,*BPNeutral4_5WindFrontRaw)
*BPNeutral4_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 6 wind front",0,*BPNeutral4_6WindFrontRaw)
*BPNeutral4_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral4_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 7 wind front",0,*BPNeutral4_7WindFrontRaw)
animationSetFrameLength(*BPNeutral4_7WindFront,1,5)
animationSetFrameLength(*BPNeutral4_7WindFront,2,6)
animationSetFrameLength(*BPNeutral4_7WindFront,3,7)
animationSetFrameOpacity(*BPNeutral4_7WindFront,1,192)
animationSetFrameOpacity(*BPNeutral4_7WindFront,2,128)
animationSetFrameOpacity(*BPNeutral4_7WindFront,3,64)

*BPNeutral4_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_2WindBack",2,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 2 wind back",0,*BPNeutral4_2WindBackRaw)
*BPNeutral4_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_3WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 3 wind back",0,*BPNeutral4_3WindBackRaw)

animationPrepareWind(*BPNeutral4,0)
*BPNeutral4\frontWind(3,0)=*BPNeutral4_4WindFront
*BPNeutral4\frontWind(4,0)=*BPNeutral4_5WindFront
*BPNeutral4\frontWind(5,0)=*BPNeutral4_6WindFront
*BPNeutral4\frontWind(6,0)=*BPNeutral4_7WindFront
*BPNeutral4\backWind(1,0)=*BPNeutral4_2WindBack
*BPNeutral4\backWind(2,0)=*BPNeutral4_3WindBack

animationFreeMovementWind(*BPNeutral4)
animationGetNeutral(*BPNeutral3)=*BPNeutral4

;------- Neutral 5
*BPNeutral5.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral5_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5",0,*BPNeutral5Raw,10,#H2H_DAMAGETYPE_BLUNT,3,1)
animationSetFrameCDN(*BPNeutral5,1,6)
animationSetFrameLength(*BPNeutral5,0,4)
animationSetFrameLength(*BPNeutral5,2,10)
animationSetFrameMovement(*BPNeutral5,0,-25)
animationSetFrameMovement(*BPNeutral5,1,-125)
animationSetFrameMovement(*BPNeutral5,2,25)
animationSetFramePushD(*BPNeutral5,1,-25)
animationSetFrameStun(*BPNeutral5,1,5)
animationSetFrameSound(*BPNeutral5,1,#H2H_SOUND_ID_SWISHMEDIUM)

*BPNeutral5_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral5_1WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind front",0,*BPNeutral5_1WindFrontRaw)
*BPNeutral5_2WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral5_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind front",0,*BPNeutral5_2WindFrontRaw)
animationSetFrameLength(*BPNeutral5_2WindFront,1,5)
animationSetFrameLength(*BPNeutral5_2WindFront,2,6)
animationSetFrameLength(*BPNeutral5_2WindFront,3,7)
animationSetFrameOpacity(*BPNeutral5_2WindFront,1,192)
animationSetFrameOpacity(*BPNeutral5_2WindFront,2,128)
animationSetFrameOpacity(*BPNeutral5_2WindFront,3,64)

*BPNeutral5_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral5_1WindBack",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind back",0,*BPNeutral5_1WindBackRaw)
*BPNeutral5_2WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral5_2WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind back",0,*BPNeutral5_2WindBackRaw)
animationSetFrameLength(*BPNeutral5_2WindBack,1,6)
animationSetFrameLength(*BPNeutral5_2WindBack,2,7)
animationSetFrameOpacity(*BPNeutral5_2WindBack,1,192)
animationSetFrameOpacity(*BPNeutral5_2WindBack,2,128)

animationPrepareWind(*BPNeutral5,0)
*BPNeutral5\frontWind(0,0)=*BPNeutral5_1WindFront
*BPNeutral5\frontWind(1,0)=*BPNeutral5_2WindFront
*BPNeutral5\backWind(0,0)=*BPNeutral5_1WindBack
*BPNeutral5\backWind(1,0)=*BPNeutral5_2WindBack
animationFreeMovementWind(*BPNeutral5)

;------- Neutral 6
*BPNeutral6.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral6_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*BPNeutral6Raw,10,#H2H_DAMAGETYPE_CUT,5)
animationSetFrameSound(*BPNeutral6,0,#H2H_SOUND_ID_PLASTICSWING)

animationSetFrameLength(*BPNeutral6,2,10)
animationSetFrameMovement(*BPNeutral6,1,-75)

animationPrepareWind(*BPNeutral6)

*BPNeutral6_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral6_1WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 1 wind front",0,*BPNeutral6_1WindFrontRaw)
*BPNeutral6_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral6_2WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 2 wind front",0,*BPNeutral6_2WindFrontRaw)
*BPNeutral6_3WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral6_3WindFront",5,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind front",0,*BPNeutral6_3WindFrontRaw)
animationSetFrameLength(*BPNeutral6_3WindFront,1,6)
animationSetFrameOpacity(*BPNeutral6_3WindFront,1,192)
animationSetFrameMovement(*BPNeutral6_3WindFront,1,-50)
animationFreeMovement(*BPNeutral6_3WindFront)
animationSetFrameCDN(*BPNeutral6,2,4)

*BPNeutral6_3WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral6_3WindBack",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind back",0,*BPNeutral6_3WindBackRaw)
animationFreeMovement(*BPNeutral6_3WindBack)

*BPNeutral6\backWind(2,0)=*BPNeutral6_3WindBack

*BPNeutral6\frontWind(0,0)=*BPNeutral6_1WindFront
*BPNeutral6\frontWind(1,0)=*BPNeutral6_2WindFront
*BPNeutral6\frontWind(2,0)=*BPNeutral6_3WindFront

animationSetComboEnd(*BPNeutral6,1)

;------- Side 1
*BPSide1.animation=classGenerateAnimation(3,"image/hand_ballpen_side1_",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1",0,*BPSide1Raw,20,#H2H_DAMAGETYPE_CUT,8)
For i=0 To 3
	animationSetFrameMovement(*BPSide1,i,-50+i*10)
Next
animationSetFrameSound(*BPSide1,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameLength(*BPSide1,1,3)
animationSetFrameLength(*BPSide1,2,2)
animationSetFrameLength(*BPSide1,3,8)
animationSetFrameCDN(*BPSide1,3,4)

*BPSide1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 wind back",0,*BPSide1_1WindBackRaw)
*BPSide1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_2WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind back",0,*BPSide1_2WindBackRaw)
*BPSide1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_3WindBack",2,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind back",0,*BPSide1_3WindBackRaw)
*BPSide1_4WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_side1_4WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind back",0,*BPSide1_4WindBackRaw)
animationSetFrameLength(*BPSide1_4WindBack,1,6)
animationSetFrameOpacity(*BPSide1_4WindBack,1,192)

*BPSide1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 wind front",0,*BPSide1_2WindFrontRaw)
*BPSide1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_3WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 wind front",0,*BPSide1_3WindFrontRaw)
*BPSide1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side1_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 wind front",0,*BPSide1_4WindFrontRaw)
animationSetFrameLength(*BPSide1_4WindFront,1,5)
animationSetFrameLength(*BPSide1_4WindFront,2,7)
animationSetFrameOpacity(*BPSide1_4WindFront,1,192)
animationSetFrameOpacity(*BPSide1_4WindFront,2,128)
frameSetFreeMovement(*BPSide1_4WindFront\frames(0),#True)

animationPrepareWind(*BPSide1)

*BPSide1\backWind(0,0)=*BPSide1_1WindBack
*BPSide1\backWind(1,0)=*BPSide1_2WindBack
*BPSide1\backWind(2,0)=*BPSide1_3WindBack
*BPSide1\backWind(3,0)=*BPSide1_4WindBack

*BPSide1\frontWind(1,0)=*BPSide1_2WindFront
*BPSide1\frontWind(2,0)=*BPSide1_3WindFront
*BPSide1\frontWind(3,0)=*BPSide1_4WindFront
animationGetNeutral(*BPSide1)=*BPNeutral2

;------- Side 2
*BPSide2.animation=classGenerateAnimation(4,"image/hand_ballpen_side2_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2",0,*BPside2Raw,20,#H2H_DAMAGETYPE_CUT,5)
For i=0 To 4
	animationSetFrameMovement(*BPSide2,i,-40-i*4)
Next
animationSetFrameSound(*BPSide2,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameDamageCut(*BPSide2,2)
animationSetFrameLength(*BPSide2,1,6)
animationSetFrameLength(*BPSide2,2,3)
animationSetFrameLength(*BPSide2,4,8)
animationSetFrameCDN(*BPSide2,4,4)
animationSetFrameSound(*BPSide2,3,#H2H_SOUND_ID_PLASTICSWING)
animationGetSide(*BPSide1)=*BPSide2

*BPSide2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind front",0,*BPside2_1WindFrontRaw)
*BPSide2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 wind front",0,*BPside2_2WindFrontRaw)
*BPSide2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 2 3 wind front",0,*BPside2_3WindFrontRaw)
*BPSide2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 wind front",0,*BPside2_4WindFrontRaw)
*BPSide2_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side2_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 2 5 wind front",0,*BPside2_5WindFrontRaw)
animationSetFrameLength(*BPSide2_5WindFront,1,5)
animationSetFrameLength(*BPSide2_5WindFront,2,7)
animationSetFrameOpacity(*BPSide2_5WindFront,1,192)
animationSetFrameOpacity(*BPSide2_5WindFront,2,128)
frameSetFreeMovement(*BPSide2_5WindFront\frames(0),#True)

*BPSide2_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_1WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 wind back",0,*BPside2_1WindBackRaw)
*BPSide2_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_2WindBack",6,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 wind back",0,*BPside2_2WindBackRaw)
*BPSide2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_4WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 wind back",0,*BPside2_4WindBackRaw)

animationPrepareWind(*BPSide2)

*BPSide2\backWind(0,0)=*BPSide2_1WindBack
*BPSide2\backWind(1,0)=*BPSide2_2WindBack
*BPSide2\backWind(3,0)=*BPSide2_4WindBack

*BPSide2\frontWind(0,0)=*BPSide2_1WindFront
*BPSide2\frontWind(1,0)=*BPSide2_2WindFront
*BPSide2\frontWind(2,0)=*BPSide2_3WindFront
*BPSide2\frontWind(3,0)=*BPSide2_4WindFront
*BPSide2\frontWind(4,0)=*BPSide2_5WindFront

;------- Side 3
*BPSide3.animation=classGenerateAnimation(6,"image/hand_ballpen_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 4",0,*BPside3Raw,20,#H2H_DAMAGETYPE_PIERCE,10)
animationSetComboEnd(*BPSide3,1)
animationSetFrameSound(*BPSide3,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPSide3,3,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameMovement(*BPSide3,0,40,-30)
animationSetFrameMovement(*BPSide3,1,20,-20)
animationSetFrameMovement(*BPSide3,2,40,-20)
animationSetFrameMovement(*BPSide3,3,-70,-20)
animationSetFrameMovement(*BPSide3,4,-90,-20)
animationSetFrameMovement(*BPSide3,5,-120,30)
animationSetFrameMovement(*BPSide3,6,-130,40)
animationSetFrameMovementDelta(*BPSide3,6,-20,6)
animationSetFrameDamage(*BPSide3,3,5)

animationSetFrameLength(*BPSide3,0,2)
animationSetFrameLength(*BPSide3,1,3)
animationSetFrameLength(*BPSide3,3,3)
animationSetFrameLength(*BPSide3,4,3)
animationSetFrameLength(*BPSide3,6,8)

animationPrepareWind(*BPSide3)
animationSetFrameCDN(*BPSide3,6,4)

animationGetSide(*BPSide2)=*BPSide3

*BPSide3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_1WindFront",2,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind front",0,*BPside3_1WindFrontRaw)
*BPSide3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind front",0,*BPside3_2WindFrontRaw)
*BPSide3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind front",0,*BPside3_3WindFrontRaw)
*BPSide3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind front",0,*BPside3_4WindFrontRaw)
*BPSide3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_5WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind front",0,*BPside3_5WindFrontRaw)
*BPSide3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 6 wind front",0,*BPside3_6WindFrontRaw)
*BPSide3_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_side3_7WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 7 wind front",0,*BPside3_7WindFrontRaw)
animationSetFrameLength(*BPSide3_7WindFront,1,4)
animationSetFrameLength(*BPSide3_7WindFront,2,5)
animationSetFrameLength(*BPSide3_7WindFront,3,6)
animationSetFrameOpacity(*BPSide3_7WindFront,1,192)
animationSetFrameOpacity(*BPSide3_7WindFront,2,128)
animationSetFrameOpacity(*BPSide3_7WindFront,3,64)
frameSetFreeMovement(*BPSide3_7WindFront\frames(2),#True)
*BPSide3_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_5WindBack",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind back",0,*BPside3_5WindBackRaw)
*BPSide3_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_6WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 6 wind back",0,*BPside3_6WindBackRaw)

*BPSide3\backWind(4,0)=*BPSide3_5WindBack
*BPSide3\backWind(5,0)=*BPSide3_6WindBack

*BPSide3\frontWind(0,0)=*BPSide3_1WindFront
*BPSide3\frontWind(1,0)=*BPSide3_2WindFront
*BPSide3\frontWind(2,0)=*BPSide3_3WindFront
*BPSide3\frontWind(3,0)=*BPSide3_4WindFront
*BPSide3\frontWind(4,0)=*BPSide3_5WindFront
*BPSide3\frontWind(5,0)=*BPSide3_6WindFront
*BPSide3\frontWind(6,0)=*BPSide3_7WindFront

;------- Side 4
*BPSide4.animation=classGenerateAnimation(4,"image/hand_ballpen_side4_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*BPSide4Raw,25,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPSide4,#True)
For i=0 To 4
	animationSetFrameMovement(*BPSide4,i,-40)
Next
animationSetFrameLength(*BPSide4,0,5)
animationSetFrameLength(*BPSide4,4,8)
animationSetFrameSound(*BPSide4,1,#H2H_SOUND_ID_PLASTICSWING)

*BPSide4_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side4_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind front",0,*BPSide4_1WindFrontRaw)
animationSetFrameLength(*BPSide4_1WindFront,1,5)
*BPSide4_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 2 wind front",0,*BPSide4_2WindFrontRaw)
*BPSide4_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 3 wind front",0,*BPSide4_3WindFrontRaw)
*BPSide4_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 4 wind front",0,*BPSide4_4WindFrontRaw)
*BPSide4_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side4_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind front",0,*BPSide4_5WindFrontRaw)
animationSetFrameLength(*BPSide4_5WindFront,1,6)
animationSetFrameLength(*BPSide4_5WindFront,2,7)
animationSetFrameOpacity(*BPSide4_5WindFront,1,192)
animationSetFrameOpacity(*BPSide4_5WindFront,2,128)

*BPSide4_5WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_side4_5WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind back",0,*BPSide4_5WindBackRaw)
animationSetFrameLength(*BPSide4_5WindBack,1,6)
animationSetFrameLength(*BPSide4_5WindBack,2,7)
animationSetFrameOpacity(*BPSide4_5WindBack,1,192)
animationSetFrameOpacity(*BPSide4_5WindBack,2,128)

animationPrepareWind(*BPSide4,0)
*BPSide4\frontWind(0,0)=*BPSide4_1WindFront
*BPSide4\frontWind(1,0)=*BPSide4_2WindFront
*BPSide4\frontWind(2,0)=*BPSide4_3WindFront
*BPSide4\frontWind(3,0)=*BPSide4_4WindFront
*BPSide4\frontWind(4,0)=*BPSide4_5WindFront
*BPSide4\backWind(4,0)=*BPSide4_5WindBack
animationFreeMovementWind(*BPSide4)
animationGetSide(*BPNeutral5)=*BPSide4

;------- Side 5
*BPSide5.animation=classGenerateAnimation(4,"image/hand_ballpen_side5_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*BPSide5Raw,35,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPSide5,#True)
animationSetFrameMovement(*BPSide5,0,30)
animationSetFrameMovement(*BPSide5,1,-50,10)
animationSetFrameMovement(*BPSide5,2,-70,10)
animationSetFrameMovement(*BPSide5,3,-90,-10)
animationSetFrameMovement(*BPSide5,4,-50,-10)
animationSetComboEnd(*BPSide5,1)
animationSetFrameSound(*BPSide5,1,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameLength(*BPSide5,0,5)
*BPSide5_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 1 wind front",0,*BPSide5_1WindFrontRaw)
*BPSide5_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*BPSide5_2WindFrontRaw)
*BPSide5_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 3 wind front",0,*BPSide5_3WindFrontRaw)
*BPSide5_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind front",0,*BPSide5_4WindFrontRaw)
*BPSide5_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side5_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind front",0,*BPSide5_5WindFrontRaw)
animationSetFrameLength(*BPSide5_5WindFront,1,5)
animationSetFrameLength(*BPSide5_5WindFront,2,6)
animationSetFrameOpacity(*BPSide5_5WindFront,1,192)
animationSetFrameOpacity(*BPSide5_5WindFront,2,128)

animationPrepareWind(*BPSide5,0)
*BPSide5\frontWind(0,0)=*BPSide5_1WindFront
*BPSide5\frontWind(1,0)=*BPSide5_2WindFront
*BPSide5\frontWind(2,0)=*BPSide5_3WindFront
*BPSide5\frontWind(3,0)=*BPSide5_4WindFront
*BPSide5\frontWind(4,0)=*BPSide5_5WindFront
animationFreeMovementWind(*BPSide5)

;------- Side 6
*BPSide6.animation=classGenerateAnimation(5,"image/hand_ballpen_side6_",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6",0,*BPside6Raw,15,#H2H_DAMAGETYPE_CUT,9)
animationSetFrameLength(*BPSide6,0,6)
animationSetFrameLength(*BPSide6,1,6)
animationSetFrameLength(*BPSide6,4,10)
animationSetFrameLength(*BPSide6,5,5)
animationSetFrameDamage(*BPSide6,0,5)
animationSetFrameDamage(*BPSide6,1,5)
animationSetFrameDamage(*BPSide6,2,6)
animationSetFrameDamageDuration(*BPSide6,4,5)
For i=0 To 3
	animationSetFrameMovement(*BPSide6,i,-60+i*5)
Next
animationSetFrameMovement(*BPSide6,4,-60)
animationSetFrameMovement(*BPSide6,5,60)
animationSetFrameDamageCut(*BPSide6,3)
animationSetFrameSound(*BPSide6,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPSide6,3,#H2H_SOUND_ID_PLASTICSWING)
animationSetComboEnd(*BPSide6,1)
animationPrepareWind(*BPSide6)

*BPSide6_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_1WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 1 wind front",0,*BPSide6_1WindFrontRaw)
*BPSide6_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_2WindFront",6,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind front",0,*BPSide6_2WindFrontRaw)
*BPSide6_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6 3 wind front",0,*BPSide6_3WindFrontRaw)
*BPSide6_4WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side6_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 4 wind front",0,*BPSide6_4WindFrontRaw)
animationSetFrameLength(*BPSide6_4WindFront,1,6)
animationSetFrameOpacity(*BPSide6_4WindFront,1,192)
*BPSide6_5WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_side6_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind front",0,*BPSide6_5WindFrontRaw)
animationSetFrameLength(*BPSide6_5WindFront,1,6)
animationSetFrameLength(*BPSide6_5WindFront,2,7)
animationSetFrameLength(*BPSide6_5WindFront,3,8)
animationSetFrameOpacity(*BPSide6_5WindFront,1,192)
animationSetFrameOpacity(*BPSide6_5WindFront,2,128)
animationSetFrameOpacity(*BPSide6_5WindFront,2,64)
animationFreeMovement(*BPSide6_5WindFront)

*BPSide6\frontWind(0,0)=*BPSide6_1WindFront
*BPSide6\frontWind(1,0)=*BPSide6_2WindFront
*BPSide6\frontWind(2,0)=*BPSide6_3WindFront
*BPSide6\frontWind(3,0)=*BPSide6_4WindFront
*BPSide6\frontWind(4,0)=*BPSide6_5WindFront

;------- Side 7
*BPSide7.animation=classGenerateAnimation(6,"image/hand_ballpen_side7_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7",0,*BPSide7Raw,10,#H2H_DAMAGETYPE_CUT,9)
animationSetFrameMovement(*BPSide7,0,-10)
animationSetFrameMovement(*BPSide7,1,-20)
animationSetFrameMovement(*BPSide7,2,-30)
animationSetFrameMovement(*BPSide7,3,-40)
animationSetFrameMovement(*BPSide7,4,-40)
animationSetFrameMovement(*BPSide7,5,-40)
animationSetFrameMovement(*BPSide7,6,30)
animationSetFrameSound(*BPSide7,0,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*BPSide7,4,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPSide7,5,#H2H_SOUND_ID_PLASTICBLUNTLIGHT)
animationSetFrameLength(*BPSide7,5,9)
animationSetFrameDamageDuration(*BPSide7,5,5)
*BPSide7_2WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side7_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind front",0,*BPSide7_2WindFrontRaw)
animationSetFrameLength(*BPSide7_2WindFront,1,6)
animationSetFrameOpacity(*BPSide7_2WindFront,1,192)
*BPSide7_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind front",0,*BPSide7_3WindFrontRaw)
*BPSide7_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side7_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 4 wind front",0,*BPSide7_4WindFrontRaw)
animationSetFrameLength(*BPSide7_4WindFront,1,5)
animationSetFrameLength(*BPSide7_4WindFront,2,6)
animationSetFrameOpacity(*BPSide7_4WindFront,1,192)
animationSetFrameOpacity(*BPSide7_4WindFront,2,128)
*BPSide7_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 5 wind front",0,*BPSide7_5WindFrontRaw)
*BPSide7_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side7_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 6 wind front",0,*BPSide7_6WindFrontRaw)
animationSetFrameMovement(*BPSide7_6WindFront,2,-30)
animationSetFrameLength(*BPSide7_6WindFront,1,6)
animationSetFrameLength(*BPSide7_6WindFront,2,8)
animationSetFrameOpacity(*BPSide7_6WindFront,1,192)
animationSetFrameOpacity(*BPSide7_6WindFront,2,128)

*BPSide7_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 1 wind back",0,*BPSide7_1WindBackRaw)
*BPSide7_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind back",0,*BPSide7_2WindBackRaw)
*BPSide7_3WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_side7_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind back",0,*BPSide7_3WindBackRaw)
animationSetFrameLength(*BPSide7_3WindBack,1,6)
animationSetFrameOpacity(*BPSide7_3WindBack,1,192)

animationPrepareWind(*BPSide7,0)
*BPSide7\frontWind(1,0)=*BPSide7_2WindFront
*BPSide7\frontWind(2,0)=*BPSide7_3WindFront
*BPSide7\frontWind(3,0)=*BPSide7_4WindFront
*BPSide7\frontWind(4,0)=*BPSide7_5WindFront
*BPSide7\frontWind(5,0)=*BPSide7_6WindFront
*BPSide7\backWind(0,0)=*BPSide7_1WindBack
*BPSide7\backWind(1,0)=*BPSide7_2WindBack
*BPSide7\backWind(2,0)=*BPSide7_3WindBack
animationFreeMovementWind(*BPSide7)

animationGetSide(*BPNeutral6)=*BPSide7

;------- Up 1
*BPUp1.animation=classGenerateAnimation(3,"image/hand_ballpen_up1_",4,#H2H_ANIMATIONTYPE_NUP,"up 1",0,*BPUp1Raw,20,#H2H_DAMAGETYPE_CUT,10)
animationSetFrameSound(*BPUp1,1,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameDamage(*BPUp1,1,5)
animationSetFrameDamageCut(*BPUp1,2)
animationSetFrameDamage(*BPUp1,2,4)
For i=0 To 2
	animationSetFrameMovement(*BPUp1,i,-40)
Next
animationSetFrameMovement(*BPUp1,3,-20)
animationSetFrameLength(*BPUp1,3,7)
animationSetFrameCDN(*BPUp1,3)
animationSetFrameDamageDuration(*BPUp1,3,4)

*BPUp1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_1WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 1 wind front",0,*BPUp1_1WindFrontRaw)
*BPUp1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_2WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind front",0,*BPUp1_2WindFrontRaw)
*BPUp1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_3WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind front",0,*BPUp1_3WindFrontRaw)
*BPUp1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_up1_4WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 1 4 wind front",0,*BPUp1_4WindFrontRaw)
frameSetFreeMovement(*BPUp1_4WindFront\frames(0),#True)
animationSetFrameLength(*BPUp1_4WindFront,1,5)
animationSetFrameLength(*BPUp1_4WindFront,2,6)
animationSetFrameOpacity(*BPUp1_4WindFront,1,192)
animationSetFrameOpacity(*BPUp1_4WindFront,2,128)

*BPUp1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_2WindBack",5,#H2H_ANIMATIONTYPE_NUP,"up 1 2 wind back",0,*BPUp1_2WindBackRaw)
*BPUp1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_3WindBack",5,#H2H_ANIMATIONTYPE_NUP,"up 1 3 wind back",0,*BPUp1_3WindBackRaw)

animationPrepareWind(*BPUp1)

*BPUp1\frontWind(0,0)=*BPUp1_1WindFront
*BPUp1\frontWind(1,0)=*BPUp1_2WindFront
*BPUp1\frontWind(2,0)=*BPUp1_3WindFront
*BPUp1\frontWind(3,0)=*BPUp1_4WindFront

*BPUp1\backWind(1,0)=*BPUp1_2WindBack
*BPUp1\backWind(2,0)=*BPUp1_3WindBack

;------- Up 2
*BPUp2.animation=classGenerateAnimation(4,"image/hand_ballpen_up2_",5,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*BPUp2Raw,20,#H2H_DAMAGETYPE_CUT,10)
animationSetFrameSound(*BPUp2,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPUp2,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameDamage(*BPUp2,2,5)
animationSetFrameLength(*BPUp2,0,4)
animationSetFrameLength(*BPUp2,1,4)
animationSetFrameLength(*BPUp2,4,8)
animationSetFrameDamageDuration(*BPUp2,4,4)
animationSetFrameCDN(*BPUp2,4,4)
For i=0 To 4
	animationSetFrameMovement(*BPUp2,i,-25-i*5)
Next
animationPrepareWind(*BPUp2)
*BPUp2_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_2WindBack",4,#H2H_ANIMATIONTYPE_NUP,"up 2 2 wind back",0,*BPUp2_2WindBackRaw)
*BPUp2_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_3WindBack",5,#H2H_ANIMATIONTYPE_NUP,"up 2 3 wind back",0,*BPUp2_3WindBackRaw)
*BPUp2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_4WindBack",5,#H2H_ANIMATIONTYPE_NUP,"up 2 4 wind back",0,*BPUp2_4WindBackRaw)

*BPUp2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_1WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 2 1 wind front",0,*BPUp2_1WindFrontRaw)
*BPUp2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_4WindFront",5,#H2H_ANIMATIONTYPE_NUP,"up 2 4 wind front",0,*BPUp2_4WindFrontRaw)
*BPUp2_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_up2_5WindFront",4,#H2H_ANIMATIONTYPE_NUP,"up 2 5 wind front",0,*BPUp2_5WindFrontRaw)
animationSetFrameMovement(*BPUp2_5WindFront,0,-20)
animationSetFrameMovement(*BPUp2_5WindFront,1,-20)
animationSetFrameMovement(*BPUp2_5WindFront,2,-20)
animationSetFrameLength(*BPUp2_5WindFront,1,5)
animationSetFrameLength(*BPUp2_5WindFront,2,6)
animationSetFrameOpacity(*BPUp2_5WindFront,1,192)
animationSetFrameOpacity(*BPUp2_5WindFront,2,128)

*BPUp2\backWind(1,0)=*BPUp2_2WindBack
*BPUp2\backWind(2,0)=*BPUp2_3WindBack
*BPUp2\backWind(3,0)=*BPUp2_4WindBack

*BPUp2\frontWind(0,0)=*BPUp2_1WindFront
*BPUp2\frontWind(3,0)=*BPUp2_4WindFront
*BPUp2\frontWind(4,0)=*BPUp2_5WindFront

animationGetNeutral(*BPUp2)=*BPNeutral6
animationGetSide(*BPUp2)=*BPSide6

;------- Down 1
*BPDown1.animation=classGenerateAnimation(3,"image/hand_ballpen_down1_",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*BPDown1Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameMovement(*BPDown1,0,25,-25)
animationSetFrameMovement(*BPDown1,1,40)
animationSetFrameMovement(*BPDown1,2,-80,50) ; was -50 50
animationSetFrameMovement(*BPDown1,3,15,-25)
animationSetFrameCDN(*BPDown1,3,5)
animationSetFrameStun(*BPDown1,2,15)
animationSetFrameLength(*BPDown1,3,10)
animationSetFrameSound(*BPDown1,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPDown1,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFramePush(*BPDown1,2,-30)
animationGetNeutral(*BPDown1)=*BPNeutral5

*BPDown1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_down1_1WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind front",0,*BPDown1_1WindFrontRaw)
*BPDown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_down1_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*BPDown1_2WindFrontRaw)
animationSetFrameLength(*BPDown1_2WindFront,1,6)
animationSetFrameLength(*BPDown1_2WindFront,2,7)
animationSetFrameOpacity(*BPDown1_2WindFront,1,192)
animationSetFrameOpacity(*BPDown1_2WindFront,2,128)
*BPDown1_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down1_3WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*BPDown1_3WindFrontRaw)
animationSetFrameLength(*BPDown1_3WindFront,1,6)
animationSetFrameLength(*BPDown1_3WindFront,2,6)
animationSetFrameLength(*BPDown1_3WindFront,3,4)
animationSetFrameOpacity(*BPDown1_3WindFront,1,192)
animationSetFrameOpacity(*BPDown1_3WindFront,2,128)
animationSetFrameOpacity(*BPDown1_3WindFront,3,64)

animationPrepareWind(*BPDown1)
*BPDown1\frontWind(0,0)=*BPDown1_1WindFront
*BPDown1\frontWind(1,0)=*BPDown1_2WindFront
*BPDown1\frontWind(2,0)=*BPDown1_3WindFront

animationFreeMovementWind(*BPDown1)

;------- Down 2
*BPDown2.animation=classGenerateAnimation(3,"image/hand_ballpen_down2_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*BPDown2Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*BPDown2,3,4)
animationSetFrameLength(*BPDown2,2,6)
animationSetFrameLength(*BPDown2,3,12)
animationSetFrameStun(*BPDown2,2,15)
animationSetFramePush(*BPDown2,2,-30)
animationSetFrameMovement(*BPDown2,0,25)
animationSetFrameMovement(*BPDown2,1,66,75)
animationSetFrameMovement(*BPDown2,2,-100,-75)
animationSetFrameMovement(*BPDown2,3,25,25)
animationSetFrameSound(*BPDown2,0,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPDown2,2,#H2H_SOUND_ID_SWISHMEDIUM)

*BPDown2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*BPDown2_1WindFrontRaw)
*BPDown2_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_down2_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*BPDown2_2WindFrontRaw)
animationSetFrameLength(*BPDown2_2WindFront,1,5)
animationSetFrameLength(*BPDown2_2WindFront,2,6)
animationSetFrameOpacity(*BPDown2_2WindFront,1,192)
animationSetFrameOpacity(*BPDown2_2WindFront,2,128)
*BPDown2_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down2_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind front",0,*BPDown2_3WindFrontRaw)
animationSetFrameLength(*BPDown2_3WindFront,1,5)
animationSetFrameLength(*BPDown2_3WindFront,2,6)
animationSetFrameLength(*BPDown2_3WindFront,3,7)
animationSetFrameOpacity(*BPDown2_3WindFront,1,192)
animationSetFrameOpacity(*BPDown2_3WindFront,2,128)
animationSetFrameOpacity(*BPDown2_3WindFront,3,64)

animationPrepareWind(*BPDown2,0)
*BPDown2\frontWind(0,0)=*BPDown2_1WindFront
*BPDown2\frontWind(1,0)=*BPDown2_2WindFront
*BPDown2\frontWind(2,0)=*BPDown2_3WindFront

animationFreeMovementWind(*BPDown2)
animationGetDown(*BPNeutral1)=*BPDown2
animationGetSide(*BPDown2)=*BPSide5

;------- Down 3
*BPDown3.animation=classGenerateAnimation(2,"image/hand_ballpen_down3_",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 3",0,*BPDown3Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
animationSetFrameCDN(*BPDown3,2,7)
animationSetFrameSound(*BPDown3,1,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*BPDown3,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameLength(*BPDown3,0,5)
animationSetFrameLength(*BPDown3,2,13)
animationSetFrameDamageDuration(*BPDown3,2,4)
animationGetDown(*BPDown1)=*BPDown3
animationSetFrameMovement(*BPDown3,0,-60,-50)
animationSetFrameMovement(*BPDown3,1,-100,-90)
animationSetFrameMovement(*BPDown3,2,30,70)
animationSetFrameStun(*BPDown3,2,18)
animationSetFramePushI(*BPDown3,2,90)
*BPDown3_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_down3_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 1 wind front",0,*BPDown3_1WindFrontRaw)
animationSetFrameLength(*BPDown3_1WindFront,1,5)
animationSetFrameOpacity(*BPDown3_1WindFront,1,192)
*BPDown3_2WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_down3_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 2 wind front",0,*BPDown3_2WindFrontRaw)
animationSetFrameLength(*BPDown3_2WindFront,1,5)
animationSetFrameOpacity(*BPDown3_2WindFront,1,192)
*BPDown3_3WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_down3_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind front",0,*BPDown3_3WindFrontRaw)
animationSetFrameLength(*BPDown3_3WindFront,1,5)
animationSetFrameLength(*BPDown3_3WindFront,2,6)
animationSetFrameLength(*BPDown3_3WindFront,3,7)
animationSetFrameLength(*BPDown3_3WindFront,4,8)
animationSetFrameOpacity(*BPDown3_3WindFront,2,192)
animationSetFrameOpacity(*BPDown3_3WindFront,3,128)
animationSetFrameOpacity(*BPDown3_3WindFront,4,64)
*BPDown3_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_down3_1WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 1 wind back",0,*BPDown3_1WindBackRaw)

animationPrepareWind(*BPDown3,0)
*BPDown3\frontWind(0,0)=*BPDown3_1WindFront
*BPDown3\frontWind(1,0)=*BPDown3_2WindFront
*BPDown3\frontWind(2,0)=*BPDown3_3WindFront
*BPDown3\backWind(0,0)=*BPDown3_1WindBack
animationFreeMovementWind(*BPDown3)

;------- Down 4
*BPDown4.animation=classGenerateAnimation(4,"image/hand_ballpen_down4_",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 4",0,*BPDown4Raw,12,#H2H_DAMAGETYPE_PIERCE,9)
animationSetUngrounded(*BPDown4)
animationSetComboEnd(*BPDown4,1)
animationSetFrameSound(*BPDown4,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPDown4,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameMovement(*BPDown4,0,120,-40)
animationSetFrameMovement(*BPDown4,1,-35,-80)
animationSetFrameMovement(*BPDown4,2,-93,88)
animationSetFrameMovement(*BPDown4,3,20,51)
animationSetFrameMovement(*BPDown4,4,20,51)
animationSetFrameLength(*BPDown4,2,12)
animationSetFrameLength(*BPDown4,3,5)
animationSetFrameLength(*BPDown4,4,5)
animationSetFrameDamageDuration(*BPDown4,2,4)
animationGetDown(*BPDown3)=*BPDown4

*BPDown4_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down4_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 3 wind front",0,*BPDown4_3WindFrontRaw)
animationSetFrameLength(*BPDown4_3WindFront,1,4)
animationSetFrameLength(*BPDown4_3WindFront,2,5)
animationSetFrameLength(*BPDown4_3WindFront,3,6)
animationSetFrameOpacity(*BPDown4_3WindFront,1,192)
animationSetFrameOpacity(*BPDown4_3WindFront,2,128)
animationSetFrameOpacity(*BPDown4_3WindFront,3,64)
*BPDown4_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_down4_1WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 1 wind back",0,*BPDown4_1WindBackRaw)
*BPDown4_2WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_down4_2WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 2 wind back",0,*BPDown4_2WindBackRaw)
animationSetFrameLength(*BPDown4_2WindBack,1,5)
animationSetFrameLength(*BPDown4_2WindBack,2,6)
animationSetFrameOpacity(*BPDown4_2WindBack,1,192)
animationSetFrameOpacity(*BPDown4_2WindBack,2,128)

animationPrepareWind(*BPDown4,0)
*BPDown4\frontWind(2,0)=*BPDown4_3WindFront
*BPDown4\backWind(0,0)=*BPDown4_1WindBack
*BPDown4\backWind(1,0)=*BPDown4_2WindBack
animationFreeMovementWind(*BPDown4)

;------- Back 1
*BPBack1.animation=classGenerateAnimation(3,"image/hand_ballpen_back1_",5,#H2H_ANIMATIONTYPE_NBACK,"back 1",0,*BPback1Raw,20,#H2H_DAMAGETYPE_CUT,7)
animationSetFrameMovement(*BPBack1,0,0,45)
animationSetFrameMovement(*BPBack1,1,70,-60)
animationSetFrameMovement(*BPBack1,2,90,-45)
animationSetFrameMovement(*BPBack1,3,70,10)
animationSetFrameLength(*BPBack1,0,4)
animationSetFrameLength(*BPBack1,3,20)
animationSetFrameCDN(*BPBack1,3,5)
animationSetFrameCanMove(*BPBack1,3,5)
animationSetFrameSound(*BPBack1,0,#H2H_SOUND_ID_SWISHLIGHT)
*BPBack1\frames(3)\damageDuration=4
animationPrepareWind(*BPBack1)

*BPBack1_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_back1_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 1 wind front",0,*BPBack1_1WindFrontRaw)
animationSetFrameLength(*BPBack1_1WindFront,1,5)
animationSetFrameOpacity(*BPBack1_1WindFront,1,192)
*BPBack1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back1_2WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*BPBack1_2WindFrontRaw)
*BPBack1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back1_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*BPBack1_3WindFrontRaw)
*BPBack1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back1_4WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*BPBack1_4WindFrontRaw)
animationSetFrameLength(*BPBack1_4WindFront,1,5)
animationSetFrameLength(*BPBack1_4WindFront,2,6)
animationSetFrameOpacity(*BPBack1_4WindFront,1,192)
animationSetFrameOpacity(*BPBack1_4WindFront,2,128)

*BPBack1\frontWind(0,0)=*BPBack1_1WindFront
*BPBack1\frontWind(1,0)=*BPBack1_2WindFront
*BPBack1\frontWind(2,0)=*BPBack1_3WindFront
*BPBack1\frontWind(3,0)=*BPBack1_4WindFront
animationFreeMovementWind(*BPBack1)

;------- Back 2
*BPBack2.animation=classGenerateAnimation(5,"image/hand_ballpen_back2_",4,#H2H_ANIMATIONTYPE_NBACK,"back 2",0,*BPBack2Raw,20,#H2H_DAMAGETYPE_CUT,4)
animationSetFrameSound(*BPBack2,1,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameMovement(*BPBack2,0,30)
For i=1 To 5
	animationSetFrameMovement(*BPBack2,i,60-i*10)
Next
animationSetFrameLength(*BPBack2,0,5)
animationSetFrameLength(*BPBack2,2,2)
animationSetFrameLength(*BPBack2,3,2)
animationSetFrameLength(*BPBack2,5,8)
animationSetFrameCDN(*BPBack2,5,4)
animationSetFrameDamageDuration(*BPBack2,5,4)
animationSetComboEnd(*BPBack2,1)
animationGetBack(*BPUp1)=*BPBack2

*BPBack2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_1WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 2 1 wind back",0,*BPBack2_1WindFrontRaw)
*BPBack2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 2 wind back",0,*BPBack2_2WindFrontRaw)
*BPBack2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_3WindFront",2,#H2H_ANIMATIONTYPE_NBACK,"back 2 3 wind back",0,*BPBack2_3WindFrontRaw)
*BPBack2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_4WindFront",2,#H2H_ANIMATIONTYPE_NBACK,"back 2 4 wind back",0,*BPBack2_4WindFrontRaw)
*BPBack2_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_5WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 5 wind back",0,*BPBack2_5WindFrontRaw)
*BPBack2_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back2_6WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 6 wind back",0,*BPBack2_6WindFrontRaw)
animationSetFrameLength(*BPBack2_6WindFront,1,5)
animationSetFrameLength(*BPBack2_6WindFront,2,7)
animationSetFrameOpacity(*BPBack2_6WindFront,1,192)
animationSetFrameOpacity(*BPBack2_6WindFront,2,128)

*BPBack2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_4WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 4 wind front",0,*BPBack2_4WindBackRaw)
*BPBack2_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_5WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 5 wind front",0,*BPBack2_5WindBackRaw)
*BPBack2_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_6WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 6 wind front",0,*BPBack2_6WindBackRaw)

animationPrepareWind(*BPBack2)
*BPBack2\frontWind(0,0)=*BPBack2_1WindFront
*BPBack2\frontWind(1,0)=*BPBack2_2WindFront
*BPBack2\frontWind(2,0)=*BPBack2_3WindFront
*BPBack2\frontWind(3,0)=*BPBack2_4WindFront
*BPBack2\frontWind(4,0)=*BPBack2_5WindFront
*BPBack2\frontWind(5,0)=*BPBack2_6WindFront

*BPBack2\backWind(3,0)=*BPBack2_4WindBack
*BPBack2\backWind(4,0)=*BPBack2_5WindBack
*BPBack2\backWind(5,0)=*BPBack2_6WindBack

;------- Back 3
*BPBack3.animation=classGenerateAnimation(4,"image/hand_ballpen_back3_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*BPBack3Raw,25,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPBack3,#True)
animationGetBack(*BPDown2)=*BPBack3
For i=0 To 4
	animationSetFrameMovement(*BPBack3,i,70-i*5)
Next
animationSetFrameSound(*BPBack3,1,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameDamage(*BPBack3,3,5)
animationSetFrameDamage(*BPBack3,4,5)
animationSetFrameLength(*BPBack3,0,3)
animationSetFrameLength(*BPBack3,4,10)

*BPBack3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind front",0,*BPBack3_1WindFrontRaw)
*BPBack3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind front",0,*BPBack3_2WindFrontRaw)
*BPBack3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*BPBack3_3WindFrontRaw)
*BPBack3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_4WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 4 wind front",0,*BPBack3_4WindFrontRaw)
*BPBack3_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back3_5WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 5 wind front",0,*BPBack3_5WindFrontRaw)
animationSetFrameMovement(*BPBack3_5WindFront,0,-50)
animationSetFrameMovement(*BPBack3_5WindFront,1,-20)
animationSetFrameMovement(*BPBack3_5WindFront,2,-20)
animationSetFrameLength(*BPBack3_5WindFront,1,6)
animationSetFrameLength(*BPBack3_5WindFront,2,7)
animationSetFrameOpacity(*BPBack3_5WindFront,1,192)
animationSetFrameOpacity(*BPBack3_5WindFront,2,128)

animationPrepareWind(*BPBack3,0)
*BPBack3\frontWind(0,0)=*BPBack3_1WindFront
*BPBack3\frontWind(1,0)=*BPBack3_2WindFront
*BPBack3\frontWind(2,0)=*BPBack3_3WindFront
*BPBack3\frontWind(3,0)=*BPBack3_4WindFront
*BPBack3\frontWind(4,0)=*BPBack3_5WindFront
animationFreeMovementWind(*BPBack3)

;------- Back 4
*BPBack4.animation=classGenerateAnimation(6,"image/hand_ballpen_back4_",4,#H2H_ANIMATIONTYPE_NBACK,"back 4",0,*BPback4Raw,20,#H2H_DAMAGETYPE_CUT,5)
animationSetFrameDamageCut(*BPBack4,3)
animationSetFrameLength(*BPBack4,0,3)
animationSetFrameLength(*BPBack4,6,8)
animationSetFrameDamageDuration(*BPBack4,6,4)
For i=0 To 6
	animationSetFrameMovement(*BPBack4,i,50-i*2)
Next
animationSetFrameSound(*BPBack4,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPBack4,4,#H2H_SOUND_ID_SWISHLIGHT)
animationGetBack(*BPSide1)=*BPBack4
animationGetUp(*BPBack4)=*BPUp2
animationSetFrameCDN(*BPBack4,6,4)

*BPBack4_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_2WindBack",3,#H2H_ANIMATIONTYPE_NBACK,"back 4 2 wind back",0,*BPBack4_2WindBackRaw)
*BPBack4_3WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_back4_3WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"back 4 3 wind back",0,*BPBack4_3WindBackRaw)
animationSetFrameMovement(*BPBack4_3WindBack,1,-20)
animationSetFrameOpacity(*BPBack3_5WindFront,1,192)
animationSetFrameLength(*BPBack4_3WindBack,1,5)
*BPBack4_4WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_back4_4WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"back 4 4 wind back",0,*BPBack4_4WindBackRaw)
animationSetFrameMovement(*BPBack4_4WindBack,1,-20)
animationSetFrameOpacity(*BPBack4_4WindBack,1,192)
*BPBack4_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_5WindBack",4,#H2H_ANIMATIONTYPE_NBACK,"back 4 5 wind back",0,*BPBack4_5WindBackRaw)

*BPBack4_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_5WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 4 5 wind front",0,*BPBack4_5WindFrontRaw)
*BPBack4_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back4_6WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 4 6 wind front",0,*BPBack4_6WindFrontRaw)
animationSetFrameMovement(*BPBack4_6WindFront,0,-40)
animationSetFrameMovement(*BPBack4_6WindFront,1,-30)
animationSetFrameMovement(*BPBack4_6WindFront,2,-20)
animationSetFrameLength(*BPBack4_6WindFront,1,5)
animationSetFrameLength(*BPBack4_6WindFront,2,6)
animationSetFrameOpacity(*BPBack3_5WindFront,1,192)
animationSetFrameOpacity(*BPBack4_6WindFront,2,128)

animationPrepareWind(*BPBack4)

*BPBack4\backWind(1,0)=*BPBack4_2WindBack
*BPBack4\backWind(2,0)=*BPBack4_3WindBack
*BPBack4\backWind(3,0)=*BPBack4_4WindBack
*BPBack4\backWind(4,0)=*BPBack4_5WindBack

*BPBack4\frontWind(4,0)=*BPBack4_5WindFront
*BPBack4\frontWind(5,0)=*BPBack4_6WindFront

;------- Heavy 1
*BPHeavy1.animation=classGenerateAnimation(6,"image/hand_ballpen_heavy1_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1",0,*BPHeavy1Raw,40,#H2H_DAMAGETYPE_CUT,10)
animationSetFrameCDN(*BPHeavy1,6,7)
animationSetFrameSound(*BPHeavy1,0,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPHeavy1,3,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameMovement(*BPHeavy1,0,10,-10)
animationSetFrameMovement(*BPHeavy1,1,75,-40)
animationSetFrameMovement(*BPHeavy1,2,50,-30)
animationSetFrameMovement(*BPHeavy1,3,-50,30)
animationSetFrameMovement(*BPHeavy1,4,-75,40)
animationSetFrameMovement(*BPHeavy1,5,-40,10)
animationSetFrameMovement(*BPHeavy1,6,-30)
animationSetFrameLength(*BPHeavy1,2,8)
animationSetFrameLength(*BPHeavy1,3,4)
animationSetFrameLength(*BPHeavy1,4,4)
animationSetFrameLength(*BPHeavy1,5,4)
animationSetFrameLength(*BPHeavy1,6,14)
animationSetFrameDamageDuration(*BPHeavy1,6,4)

*BPHeavy1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_1WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 1 wind front",0,*BPHeavy1_1WindFrontRaw)
*BPHeavy1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_2WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 2 wind front",0,*BPHeavy1_2WindFrontRaw)
*BPHeavy1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_3WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 3 wind front",0,*BPHeavy1_3WindFrontRaw)
*BPHeavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 4 wind front",0,*BPHeavy1_4WindFrontRaw)
*BPHeavy1_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 5 wind front",0,*BPHeavy1_5WindFrontRaw)
*BPHeavy1_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_6WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 6 wind front",0,*BPHeavy1_6WindFrontRaw)
*BPHeavy1_7WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_heavy1_7WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 7 wind front",0,*BPHeavy1_7WindFrontRaw)
animationSetFrameLength(*BPHeavy1_7WindFront,1,4)
animationSetFrameLength(*BPHeavy1_7WindFront,2,5)
animationSetFrameLength(*BPHeavy1_7WindFront,3,6)
animationSetFrameLength(*BPHeavy1_7WindFront,4,7)
animationSetFrameOpacity(*BPHeavy1_7WindFront,2,192)
animationSetFrameOpacity(*BPHeavy1_7WindFront,3,128)
animationSetFrameOpacity(*BPHeavy1_7WindFront,4,64)
animationFreeMovement(*BPHeavy1_7WindFront)
*BPHeavy1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_1WindBack",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 1 wind back",0,*BPHeavy1_1WindBackRaw)

animationPrepareWind(*BPHeavy1,0)
*BPHeavy1\frontWind(0,0)=*BPHeavy1_1WindFront
*BPHeavy1\frontWind(1,0)=*BPHeavy1_2WindFront
*BPHeavy1\frontWind(2,0)=*BPHeavy1_3WindFront
*BPHeavy1\frontWind(3,0)=*BPHeavy1_4WindFront
*BPHeavy1\frontWind(4,0)=*BPHeavy1_5WindFront
*BPHeavy1\frontWind(5,0)=*BPHeavy1_6WindFront
*BPHeavy1\frontWind(6,0)=*BPHeavy1_7WindFront
*BPHeavy1\backWind(0,0)=*BPHeavy1_1WindBack

;------- Heavy 2
*BPHeavy2.animation=classGenerateAnimation(5,"image/hand_ballpen_heavy2_",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*BPHeavy2Raw,40,#H2H_DAMAGETYPE_PIERCE,12)
animationSetFrameCDN(*BPHeavy2,5,5)
animationSetUngrounded(*BPHeavy2)
animationSetFrameMovement(*BPHeavy2,0,25,40)
animationSetFrameMovement(*BPHeavy2,1,10,40)
animationSetFrameMovement(*BPHeavy2,2,25,20)
animationSetFrameMovement(*BPHeavy2,3,-100,-40)
animationSetFrameMovement(*BPHeavy2,4,-50,-30)
animationSetFrameMovement(*BPHeavy2,5,-50,-30)
animationSetFrameLength(*BPHeavy2,2,9)
animationSetFrameLength(*BPHeavy2,3,4)
animationSetFrameLength(*BPHeavy2,5,10)
animationSetFrameSound(*BPHeavy2,1,#H2H_SOUND_ID_SWISHLIGHT)
animationSetFrameSound(*BPHeavy2,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameCDN(*BPHeavy2,5,6)
animationGetHeavy(*BPBack1)=*BPHeavy2
animationSetComboEnd(*BPHeavy2,#True)

*BPHeavy2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_1WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 1 wind front",0,*BPHeavy2_1WindFrontRaw)
*BPHeavy2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_2WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind front",0,*BPHeavy2_2WindFrontRaw)
*BPHeavy2_3WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_heavy2_3WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind front",0,*BPHeavy2_3WindFrontRaw)
animationSetFrameLength(*BPHeavy2_3WindFront,1,6)
animationSetFrameOpacity(*BPHeavy2_3WindFront,1,192)
*BPHeavy2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_4WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*BPHeavy2_4WindFrontRaw)
*BPHeavy2_5WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_heavy2_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind front",0,*BPHeavy2_5WindFrontRaw)
animationSetFrameLength(*BPHeavy2_5WindFront,1,5)
animationSetFrameLength(*BPHeavy2_5WindFront,2,6)
animationSetFrameLength(*BPHeavy2_5WindFront,3,7)
animationSetFrameOpacity(*BPHeavy2_5WindFront,1,192)
animationSetFrameOpacity(*BPHeavy2_5WindFront,2,128)
animationSetFrameOpacity(*BPHeavy2_5WindFront,3,64)

*BPHeavy2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_4WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind back",0,*BPHeavy2_4WindBackRaw)
*BPHeavy2_5WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_heavy2_5WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind back",0,*BPHeavy2_5WindBackRaw)
animationSetFrameLength(*BPHeavy2_5WindBack,1,6)
animationSetFrameOpacity(*BPHeavy2_5WindBack,1,192)

animationPrepareWind(*BPHeavy2,0)
*BPHeavy2\frontWind(0,0)=*BPHeavy2_1WindFront
*BPHeavy2\frontWind(1,0)=*BPHeavy2_2WindFront
*BPHeavy2\frontWind(2,0)=*BPHeavy2_3WindFront
*BPHeavy2\frontWind(3,0)=*BPHeavy2_4WindFront
*BPHeavy2\frontWind(4,0)=*BPHeavy2_5WindFront
*BPHeavy2\backWind(3,0)=*BPHeavy2_4WindBack
*BPHeavy2\backWind(4,0)=*BPHeavy2_5WindBack

animationFreeMovementWind(*BPHeavy2)

;------- Heavy 3
*BPHeavy3.animation=classGenerateAnimation(7,"image/hand_ballpen_heavy3_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3",0,*BPHeavy3Raw,40,#H2H_DAMAGETYPE_CUT,9)
animationSetFrameLength(*BPHeavy3,7,8)
animationSetFrameSound(*BPHeavy3,1,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameSound(*BPHeavy3,4,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameDamageCut(*BPHeavy3,4)
animationSetFrameLength(*BPHeavy3,0,9)
animationSetFrameLength(*BPHeavy3,3,9)
animationSetFrameLength(*BPHeavy3,4,8)
animationSetFrameLength(*BPHeavy3,5,7)
animationSetFrameMovement(*BPHeavy3,0,-10)
animationSetFrameMovement(*BPHeavy3,1,-20,-5)
animationSetFrameMovement(*BPHeavy3,2,-20,-20)
animationSetFrameMovement(*BPHeavy3,3,60,-10)
animationSetFrameMovement(*BPHeavy3,4,-50,35)
animationSetFrameMovement(*BPHeavy3,5,-20,-10)
animationSetFrameMovement(*BPHeavy3,6,0,-30)
animationSetComboEnd(*BPHeavy3,#True)
*BPHeavy3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 2 wind front",0,*BPHeavy3_2WindFrontRaw)
*BPHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 3 wind front",0,*BPHeavy3_3WindFrontRaw)
*BPHeavy3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_4WindFront",9,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 4 wind front",0,*BPHeavy3_4WindFrontRaw)
*BPHeavy3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_5WindFront",8,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 5 wind front",0,*BPHeavy3_5WindFrontRaw)
*BPHeavy3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_6WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 6 wind front",0,*BPHeavy3_6WindFrontRaw)
*BPHeavy3_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_heavy3_7WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 7 wind front",0,*BPHeavy3_7WindFrontRaw)
animationSetFrameLength(*BPHeavy3_7WindFront,1,7)
animationSetFrameLength(*BPHeavy3_7WindFront,2,8)
animationSetFrameLength(*BPHeavy3_7WindFront,3,9)
animationSetFrameOpacity(*BPHeavy3_7WindFront,1,192)
animationSetFrameOpacity(*BPHeavy3_7WindFront,2,128)
animationSetFrameOpacity(*BPHeavy3_7WindFront,3,64)

animationPrepareWind(*BPHeavy3,0)
*BPHeavy3\frontWind(1,0)=*BPHeavy3_2WindFront
*BPHeavy3\frontWind(2,0)=*BPHeavy3_3WindFront
*BPHeavy3\frontWind(3,0)=*BPHeavy3_4WindFront
*BPHeavy3\frontWind(4,0)=*BPHeavy3_5WindFront
*BPHeavy3\frontWind(5,0)=*BPHeavy3_6WindFront
*BPHeavy3\frontWind(6,0)=*BPHeavy3_7WindFront
animationGetHeavy(*BPHeavy1)=*BPHeavy3
animationFreeMovementWind(*BPHeavy3)

;------- Hit
*BPHit.animation=classGenerateAnimation(2,"image/hand_ballpen_hit",6,#H2H_ANIMATIONTYPE_HIT,"hit",0,*BPHitRaw)

;------ Death
*BPDeath.animation=classGenerateAnimation(8,"image/hand_ballpen_death",6,#H2H_ANIMATIONTYPE_DEATH,"death",0,*BPDeathRaw)
animationSetFrameMovement(*BPDeath,1,50)
animationSetFrameMovement(*BPDeath,5,75)
animationSetFrameSound(*BPDeath,3,#H2H_SOUND_ID_BALLPEN_FALL_1)
animationSetFrameSound(*BPDeath,5,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*BPDeath,6,#H2H_SOUND_ID_BALLPEN_FALL_2)
animationSetFrameSound(*BPDeath,7,#H2H_SOUND_ID_HAND_FALL)
animationSetFrameSound(*BPDeath,8,#H2H_SOUND_ID_BALLPEN_FALL_3)
animationSetFrameLength(*BPDeath,3,10)
animationSetFrameLength(*BPDeath,4,10)
animationPrepareWind(*BPDeath,2)

animationSetFrameShadow(*BPDeath,0,50)
animationSetFrameShadow(*BPDeath,1,70,-20) ; 20
animationSetFrameShadow(*BPDeath,2,80,-50) ; 30
animationSetFrameShadow(*BPDeath,3,150,-40) ; 50
animationSetFrameShadow(*BPDeath,4,170,-30) ; 70
animationSetFrameShadow(*BPDeath,5,200,50) ; 100
animationSetFrameShadow(*BPDeath,6,260,75) ; 125
animationSetFrameShadow(*BPDeath,7,255,75) ; 125
animationSetFrameShadow(*BPDeath,8,260,75) ; 125

*BPDeath2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death2windback",6,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind back",0,*BPDeath2WindBackRaw)
*BPDeath3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death3windback",6,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind back",0,*BPDeath3WindBackRaw)
*BPDeath4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death4windback",10,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind back",0,*BPDeath4WindBackRaw)
*BPDeath5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death5windback",10,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind back",0,*BPDeath5WindBackRaw)
*BPDeath6_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windback1_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind back 1",0,*BPDeath6_1WindBackRaw)
*BPDeath6_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windback2_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind back 2",0,*BPDeath6_2WindBackRaw)

*BPDeath2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death2windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind front",0,*BPDeath2WindFrontRaw)
*BPDeath3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death3windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind front",0,*BPDeath3WindFrontRaw)
*BPDeath4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death4windfront",10,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind front",0,*BPDeath4WindFrontRaw)
*BPDeath5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death5windfront",10,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind front",0,*BPDeath5WindFrontRaw)
*BPDeath6_1WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_death6windfront1_",4,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 1",0,*BPDeath6_1WindFrontRaw)
animationSetFrameMovement(*BPDeath6_1WindFront,0,75)
animationSetFrameMovement(*BPDeath6_1WindFront,1,50)
animationSetFrameMovement(*BPDeath6_1WindFront,2,40)
animationSetFrameMovement(*BPDeath6_1WindFront,4,20)
animationSetFrameLength(*BPDeath6_1WindFront,1,5)
animationSetFrameLength(*BPDeath6_1WindFront,2,6)
animationSetFrameLength(*BPDeath6_1WindFront,3,7)
animationSetFrameLength(*BPDeath6_1WindFront,4,8)
animationSetFrameOpacity(*BPDeath6_1WindFront,2,192)
animationSetFrameOpacity(*BPDeath6_1WindFront,3,128)
animationSetFrameOpacity(*BPDeath6_1WindFront,4,64)
*BPDeath6_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_death6windfront2_",5,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 2",0,*BPDeath6_2WindFrontRaw)
animationSetFrameLength(*BPDeath6_2WindFront,1,6)
animationSetFrameLength(*BPDeath6_2WindFront,2,7)
animationSetFrameOpacity(*BPDeath6_2WindFront,1,192)
animationSetFrameOpacity(*BPDeath6_2WindFront,2,128)
animationSetFrameMovement(*BPDeath6_2WindFront,1,100)
*BPDeath6_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windfront3_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 3",0,*BPDeath6_3WindFrontRaw)
*BPDeath7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death7windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 7 wind front",0,*BPDeath7WindFrontRaw)
*BPDeath8WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_death8windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 8 wind front",0,*BPDeath8WindFrontRaw)
animationSetFrameLength(*BPDeath8WindFront,1,7)
animationSetFrameOpacity(*BPDeath8WindFront,1,192)

*BPDeath\backWind(1,0)=*BPDeath2WindBack
*BPDeath\backWind(2,0)=*BPDeath3WindBack
*BPDeath\backWind(3,0)=*BPDeath4WindBack
*BPDeath\backWind(4,0)=*BPDeath5WindBack
*BPDeath\backWind(5,0)=*BPDeath6_1WindBack
*BPDeath\backWind(5,1)=*BPDeath6_2WindBack

*BPDeath\frontWind(1,0)=*BPDeath2WindFront
*BPDeath\frontWind(2,0)=*BPDeath3WindFront
*BPDeath\frontWind(3,0)=*BPDeath4WindFront
*BPDeath\frontWind(4,0)=*BPDeath5WindFront
*BPDeath\frontWind(5,0)=*BPDeath6_1WindFront
*BPDeath\frontWind(5,1)=*BPDeath6_2WindFront
*BPDeath\frontWind(5,2)=*BPDeath6_3WindFront
*BPDeath\frontWind(6,0)=*BPDeath7WindFront
*BPDeath\frontWind(7,0)=*BPDeath8WindFront

animationFreeMovementWind(*BPDeath)

;------ Spawn
*BPSpawn.animation=classGenerateAnimation(11,"image/hand_ballpen_spawn",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn",0,*BPSpawnRaw)
animationPrepareWind(*BPSpawn)
animationSetFrameLength(*BPSpawn,0,25)
animationSetFrameLength(*BPSpawn,4,25)
animationSetFrameSound(*BPSpawn,1,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameSound(*BPSpawn,7,#H2H_SOUND_ID_PLASTICSWING)
animationSetFrameShadow(*BPSpawn,2,30)
animationSetFrameShadow(*BPSpawn,3,70)
animationSetFrameShadow(*BPSpawn,4,110)
animationSetFrameShadow(*BPSpawn,5,50)
animationSetFrameShadow(*BPSpawn,6,50,-32)
animationSetFrameShadow(*BPSpawn,7,30)
animationSetFrameShadow(*BPSpawn,8,30)
animationSetFrameShadow(*BPSpawn,9,10)
animationSetFrameShadow(*BPSpawn,10,-10)

*BPSpawn2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn2WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 2 wind back",0,*BPSpawn2WindBackRaw)
*BPSpawn3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn3WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 3 wind back",0,*BPSpawn3WindBackRaw)
*BPSpawn4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn4WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind back",0,*BPSpawn4WindBackRaw)
*BPSpawn5WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn5WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind back",0,*BPSpawn5WindBackRaw)
animationSetFrameLength(*BPSpawn5WindBack,1,7)
animationSetFrameLength(*BPSpawn5WindBack,2,8)
animationSetFrameOpacity(*BPSpawn5WindBack,1,192)
animationSetFrameOpacity(*BPSpawn5WindBack,2,128)
*BPSpawn6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn6WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind back",0,*BPSpawn6WindBackRaw)
*BPSpawn7WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn7WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind back",0,*BPSpawn7WindBackRaw)
animationSetFrameLength(*BPSpawn7WindBack,1,7)
animationSetFrameLength(*BPSpawn7WindBack,2,8)
animationSetFrameOpacity(*BPSpawn7WindBack,1,192)
animationSetFrameOpacity(*BPSpawn7WindBack,2,128)
*BPSpawn8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn8WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind back",0,*BPSpawn8WindBackRaw)
*BPSpawn9WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn9WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind back",0,*BPSpawn9WindBackRaw)
animationSetFrameLength(*BPSpawn9WindBack,1,7)
animationSetFrameOpacity(*BPSpawn9WindBack,1,192)
*BPSpawn12WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn12WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind back",0,*BPSpawn12WindBackRaw)

*BPSpawn2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn2WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 2 wind front",0,*BPSpawn2WindFrontRaw)
*BPSpawn3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn3WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 3 wind front",0,*BPSpawn3WindFrontRaw)
*BPSpawn4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn4WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind front",0,*BPSpawn4WindFrontRaw)
*BPSpawn5WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn5WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind front",0,*BPSpawn5WindFrontRaw)
animationSetFrameLength(*BPSpawn5WindFront,1,7)
animationSetFrameOpacity(*BPSpawn5WindFront,1,192)
*BPSpawn6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn6WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind front",0,*BPSpawn6WindFrontRaw)
*BPSpawn7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn7WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind front",0,*BPSpawn7WindFrontRaw)
*BPSpawn8WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn8WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind front",0,*BPSpawn8WindFrontRaw)
*BPSpawn9WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn9WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind front",0,*BPSpawn9WindFrontRaw)
*BPSpawn10WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn10WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind front",0,*BPSpawn10WindFrontRaw)
animationSetFrameLength(*BPSpawn10WindFront,1,7)
animationSetFrameOpacity(*BPSpawn10WindFront,1,192)
*BPSpawn11WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn11WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind front",0,*BPSpawn11WindFrontRaw)
*BPSpawn12WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn12WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind front",0,*BPSpawn12WindFrontRaw)
animationSetFrameLength(*BPSpawn12WindFront,1,7)
animationSetFrameLength(*BPSpawn12WindFront,2,8)
animationSetFrameOpacity(*BPSpawn12WindFront,1,192)
animationSetFrameOpacity(*BPSpawn12WindFront,2,128)

*BPSpawn\backWind(1,0)=*BPSpawn2WindBack
*BPSpawn\backWind(2,0)=*BPSpawn3WindBack
*BPSpawn\backWind(3,0)=*BPSpawn4WindBack
*BPSpawn\backWind(4,0)=*BPSpawn5WindBack
*BPSpawn\backWind(5,0)=*BPSpawn6WindBack
*BPSpawn\backWind(6,0)=*BPSpawn7WindBack
*BPSpawn\backWind(7,0)=*BPSpawn8WindBack
*BPSpawn\backWind(8,0)=*BPSpawn9WindBack
*BPSpawn\backWind(11,0)=*BPSpawn12WindBack

*BPSpawn\frontWind(1,0)=*BPSpawn2WindFront
*BPSpawn\frontWind(2,0)=*BPSpawn3WindFront
*BPSpawn\frontWind(3,0)=*BPSpawn4WindFront
*BPSpawn\frontWind(4,0)=*BPSpawn5WindFront
*BPSpawn\frontWind(5,0)=*BPSpawn6WindFront
*BPSpawn\frontWind(6,0)=*BPSpawn7WindFront
*BPSpawn\frontWind(7,0)=*BPSpawn8WindFront
*BPSpawn\frontWind(8,0)=*BPSpawn9WindFront
*BPSpawn\frontWind(9,0)=*BPSpawn10WindFront
*BPSpawn\frontWind(10,0)=*BPSpawn11WindFront
*BPSpawn\frontWind(11,0)=*BPSpawn12WindFront

;------ Jump
*BPJump.animation=classGenerateAnimation(6,"image/hand_ballpen_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*BPJumpRaw)

;------ Land
*BPLand.animation=classGenerateAnimation(3,"image/hand_ballpen_land",5,#H2H_ANIMATIONTYPE_LAND,"land",0,*BPLandRaw)
animationSetFrameLength(*BPLand,0,2)
animationSetFrameLength(*BPLand,1,4)
animationShiftShift(*BPLand,1,0,10)
animationShiftShift(*BPLand,2,0,30)
animationShiftShift(*BPLand,3,0,10)
animationSetFrameShadow(*BPLand,0,0,200)
animationSetFrameShadow(*BPLand,1,0,100)
animationSetFrameShadow(*BPLand,2,0,50)
animationSetFrameShadow(*BPLand,3,0,25)

;------ Dodge
*BPDodge.animation=classGenerateAnimation(2,"image/hand_ballpen_dodge",10,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*BPDodgeRaw)
animationSetFrameLength(*BPDodge,0,2)
animationSetFrameLength(*BPDodge,1,2)

;------ Parry
*BPParry.animation=classGenerateAnimation(5,"image/hand_ballpen_parry",5,#H2H_ANIMATIONTYPE_PARRY,"Parry",0,*BPParryRaw,8,#H2H_DAMAGETYPE_CUT,5)

;------ Selection
balancer=-1
*BPSelection.animation=classGenerateAnimation(15,"image/hand_ballpen_selection",10+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection",1,*BPSelectionRaw)
*BPSelection\loopStart=8
animationSetFrameSound(*BPSelection,4,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameLength(*BPSelection,0,25+balancer)
animationSetFrameLength(*BPSelection,1,8+balancer)
animationSetFrameLength(*BPSelection,2,6+balancer)
animationSetFrameLength(*BPSelection,3,3+balancer)
animationSetFrameLength(*BPSelection,4,3+balancer)
animationSetFrameLength(*BPSelection,5,6+balancer)
animationSetFrameLength(*BPSelection,6,5+balancer)
animationSetFrameLength(*BPSelection,7,6+balancer)
animationSetFrameLength(*BPSelection,10,11+balancer)
animationSetFrameLength(*BPSelection,11,12+balancer)
animationSetFrameLength(*BPSelection,12,12+balancer)
animationSetFrameLength(*BPSelection,13,13+balancer)
animationSetFrameLength(*BPSelection,14,14+balancer)
animationSetFrameLength(*BPSelection,15,15+balancer)
animationSetFrameShadow(*BPSelection,0,-16)
animationSetFrameShadow(*BPSelection,1,-16)
animationSetFrameShadow(*BPSelection,2,-40)
animationSetFrameShadow(*BPSelection,3,-48)
animationSetFrameShadow(*BPSelection,4,-20)
animationSetFrameShadow(*BPSelection,5,-8)
*BPSelection_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection2WindFront",8+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 2 wind front",0,*BPSelection_2WindFrontRaw)
*BPSelection_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection3WindFront",6+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 3 wind front",0,*BPSelection_3WindFrontRaw)
*BPSelection_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection4WindFront",3+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 4 wind front",0,*BPSelection_4WindFrontRaw)
*BPSelection_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection5WindFront",3+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 5 wind front",0,*BPSelection_5WindFrontRaw)
*BPSelection_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection6WindFront",6+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 6 wind front",0,*BPSelection_6WindFrontRaw)
*BPSelection_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selection7WindFront",5+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 7 wind front",0,*BPSelection_7WindFrontRaw)
*BPSelection_8WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_selection8WindFront",4+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 8 wind front",0,*BPSelection_8WindFrontRaw)
animationSetFrameLength(*BPSelection_8WindFront,1,5+balancer)
animationSetFrameLength(*BPSelection_8WindFront,2,6+balancer)
animationSetFrameLength(*BPSelection_8WindFront,3,7+balancer)
animationSetFrameOpacity(*BPSelection_8WindFront,1,192)
animationSetFrameOpacity(*BPSelection_8WindFront,2,128)
animationSetFrameOpacity(*BPSelection_8WindFront,3,64)
*BPSelection_10WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_selection10WindFront",5+balancer,#H2H_ANIMATIONTYPE_SELECTION,"Selection 10 wind front",0,*BPSelection_10WindFrontRaw)
animationSetFrameLength(*BPSelection_10WindFront,1,6+balancer)
animationSetFrameOpacity(*BPSelection_10WindFront,1,192)

animationPrepareWind(*BPSelection,0)
*BPSelection\frontWind(1,0)=*BPSelection_2WindFront
*BPSelection\frontWind(2,0)=*BPSelection_3WindFront
*BPSelection\frontWind(3,0)=*BPSelection_4WindFront
*BPSelection\frontWind(4,0)=*BPSelection_5WindFront
*BPSelection\frontWind(5,0)=*BPSelection_6WindFront
*BPSelection\frontWind(6,0)=*BPSelection_7WindFront
*BPSelection\frontWind(7,0)=*BPSelection_8WindFront
*BPSelection\frontWind(9,0)=*BPSelection_10WindFront

;------- Selected
*BPSelected.animation=classGenerateAnimation(13,"image/hand_ballpen_selected",5+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected",0,*BPSelectedRaw,8,#H2H_DAMAGETYPE_CUT,5)
*BPSelected\loopStart=7
animationSetFrameSound(*BPSelected,2,#H2H_SOUND_ID_SWISHMEDIUM)
animationSetFrameLength(*BPSelected,0,12+balancer)
animationSetFrameLength(*BPSelected,3,6+balancer)
animationSetFrameLength(*BPSelected,4,8+balancer)
animationSetFrameLength(*BPSelected,5,10+balancer)
animationSetFrameLength(*BPSelected,6,12+balancer)

animationSetFrameLength(*BPSelected,7,8+balancer)
animationSetFrameLength(*BPSelected,8,7+balancer)
animationSetFrameLength(*BPSelected,9,6+balancer)
animationSetFrameLength(*BPSelected,10,8+balancer)
animationSetFrameLength(*BPSelected,11,10+balancer)
animationSetFrameLength(*BPSelected,12,12+balancer)
animationSetFrameLength(*BPSelected,13,10+balancer)
animationSetFrameShadow(*BPSelected,0,16)
animationSetFrameShadow(*BPSelected,1,-8)
animationSetFrameShadow(*BPSelected,2,-40)
animationSetFrameShadow(*BPSelected,3,-48)
animationSetFrameShadow(*BPSelected,4,-48)
animationSetFrameShadow(*BPSelected,5,-32)
For i=6 To 13
	animationSetFrameShadow(*BPSelected,i,-24)
Next
animationSetFrameShadow(*BPSelected,7,-16)
animationSetFrameShadow(*BPSelected,9,-28)
animationSetFrameShadow(*BPSelected,10,-30)
animationSetFrameShadow(*BPSelected,11,-28)

*BPSelected_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selected2WindFront",5+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind front",0,*BPSelected_2WindFrontRaw)
*BPSelected_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selected3WindFront",5+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind front",0,*BPSelected_3WindFrontRaw)
*BPSelected_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_selected4WindFront",6+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind front",0,*BPSelected_4WindFrontRaw)
*BPSelected_5WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_selected5WindFront",4+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind front",0,*BPSelected_5WindFrontRaw)
animationSetFrameLength(*BPSelected_5WindFront,1,5+balancer)
animationSetFrameLength(*BPSelected_5WindFront,2,6+balancer)
animationSetFrameLength(*BPSelected_5WindFront,3,7+balancer)
animationSetFrameOpacity(*BPSelected_5WindFront,1,192)
animationSetFrameOpacity(*BPSelected_5WindFront,2,128)
animationSetFrameOpacity(*BPSelected_5WindFront,3,64)

*BPSelected_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_selected2WindBack",5+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 2 wind back",0,*BPSelected_2WindBackRaw)
*BPSelected_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_selected3WindBack",5+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 3 wind back",0,*BPSelected_3WindBackRaw)
*BPSelected_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_selected4WindBack",6+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 4 wind back",0,*BPSelected_4WindBackRaw)
*BPSelected_5WindBack.animation=classGenerateAnimation(4,"image/hand_ballpen_selected5WindBack",3+balancer,#H2H_ANIMATIONTYPE_SELECTED,"Selected 5 wind back",0,*BPSelected_5WindBackRaw)
animationSetFrameLength(*BPSelected_5WindBack,1,5+balancer)
animationSetFrameLength(*BPSelected_5WindBack,2,6+balancer)
animationSetFrameLength(*BPSelected_5WindBack,3,7+balancer)
animationSetFrameLength(*BPSelected_5WindBack,4,8+balancer)
animationSetFrameOpacity(*BPSelected_5WindBack,2,192)
animationSetFrameOpacity(*BPSelected_5WindBack,3,128)
animationSetFrameOpacity(*BPSelected_5WindBack,4,64)

animationPrepareWind(*BPSelected,0)
*BPSelected\frontWind(1,0)=*BPSelected_2WindFront
*BPSelected\frontWind(2,0)=*BPSelected_3WindFront
*BPSelected\frontWind(3,0)=*BPSelected_4WindFront
*BPSelected\frontWind(4,0)=*BPSelected_5WindFront
*BPSelected\backWind(1,0)=*BPSelected_2WindBack
*BPSelected\backWind(2,0)=*BPSelected_3WindBack
*BPSelected\backWind(3,0)=*BPSelected_4WindBack
*BPSelected\backWind(4,0)=*BPSelected_5WindBack

;------ branch
#H2H_BALLPEN_SIDE_BLADE=0
#H2H_BALLPEN_SIDE_UNHARMED=1
; *ballpen_stat.statistic=statisticCreate(0,2,3,2,1,1,0,4,3,2,2,1)
*ballpen_stat.statistic=statisticCreate(0,3,5,5,2,2,3,5,5,5,5,1)
ReDim *tmpArray(1)
*tmpArray(#H2H_BALLPEN_SIDE_BLADE)=*plastic_hit
*tmpArray(#H2H_BALLPEN_SIDE_UNHARMED)=*finger_hit
*ballpen_stance_blue.stance=stanceCreate(*tmpArray(),0,"Blue")
*ballpen_stance_blue\specialcolor=#H2H_STANCE_COLOR_BLUE
*ballpen_stance_blue\alternatecolor=#H2H_STANCE_COLOR_LIGHTBLUE
; statisticCreate(*ballpen_stance_blue\modificator,0,1,0,-1,0,0,0,0,0,0)
statisticCreate(*ballpen_stance_blue\modificator,-1,2,0,-1,0,0,0,0,0,0)

*ballpen_stance_green.stance=stanceCreate(*tmpArray(),0,"Green")
*ballpen_stance_green\specialcolor=#H2H_STANCE_COLOR_GREEN
*ballpen_stance_green\alternatecolor=#H2H_STANCE_COLOR_LIGHTGREEN
; statisticCreate(*ballpen_stance_green\modificator,-1,1,1,-1,0,0,0,0,0,0)
statisticCreate(*ballpen_stance_green\modificator,-1,2,2,-1,-1,-1,0,0,0,0)

*ballpen_stance_red.stance=stanceCreate(*tmpArray(),0,"Red")
*ballpen_stance_red\specialcolor=#H2H_STANCE_COLOR_RED
*ballpen_stance_red\alternatecolor=#H2H_STANCE_COLOR_LIGHTRED
; statisticCreate(*ballpen_stance_red\modificator,1,0,-1,0,0,0,0,0,0,0)
statisticCreate(*ballpen_stance_red\modificator,2,-1,-2,0,0,1,0,0,0,0)

*ballpen.class=classCreate(0,"Ballpen",*BPIdle1,*BPMoveFront,*BPMoveBack,*BPNeutral1,*BPSide1,*BPUp1,*BPBack1,*BPDown1,*BPHeavy1)
*ballpen\allStances(0)\name="Black (default)"
*ballpen\allStances(0)\specialcolor=(#H2H_STANCE_COLOR_BLACK&$ffffff)+$A0000000
; *ballpen\allStances(0)\specialTransparency=160
*ballpen\allStances(0)\alternatecolor=#H2H_STANCE_COLOR_LIGHTGRAY
ReDim *ballpen\allStances(0)\materialClass(ArraySize(*tmpArray()))
For i=0 To ArraySize(*tmpArray())
	*ballpen\allStances(0)\materialClass(i)=*tmpArray(i)
Next
classAddStance(*ballpen,*ballpen_stance_blue)
classAddStance(*ballpen,*ballpen_stance_green)
classAddStance(*ballpen,*ballpen_stance_red)

*ballpen\iconPath$="image\Ballpen.png"

*ballpen\stat=*ballpen_stat
; *ballpen\desc$="All rounder swordsman. Good offense and pary but excells at nothing.\Intuitive use of combos for quick adaptations between attacking and dogding\dangerous attacks which can't be tanked well by the Ballpen weilder."
*ballpen\desc$="All rounder sword fighter. Has a lot of medium ranged threat but excels at nothing.\Can quickly adapt with its large array of follows and counters."

classGetDeath(*ballpen)=*BPDeath
classGetSpawn(*ballpen)=*BPSpawn
classGetJump(*ballpen)=*BPJump
classGetLand(*ballpen)=*BPLand
classGetHit(*ballpen)=*BPHit
classGetDodge(*ballpen)=*BPDodge
classGetParry(*ballpen)=*BPParry
classGetSelection(*ballpen)=*BPSelection
classGetSelected(*ballpen)=*BPSelected

Dim *ballpen\otherIdle(1)
*ballpen\otherIdle(0)=*BPIdle2
*ballpen\otherIdle(1)=*BPIdle3
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1637
; FirstLine = 1615
; Folding = -
; EnableXP
; CPU = 1