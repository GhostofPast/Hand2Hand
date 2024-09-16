;------ Ballpen

;------- Idle 1 new
*ballpen_Idle1.animation=classGenerateAnimation(9,"image/hand_ballpen_idle1_",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 new",1,*BPIdle1Raw)

animationPrepareWind(*ballpen_Idle1,0)

*ballpen_Idle1_1FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_1WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 front wind",0,*BPIdle1_1WindFrontRaw)
*ballpen_Idle1_2FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_2WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 2 front wind",0,*BPIdle1_2WindFrontRaw)
*ballpen_Idle1_4FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_4WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 front wind",0,*BPIdle1_4WindFrontRaw)
*ballpen_Idle1_5FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_5WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 front wind",0,*BPIdle1_5WindFrontRaw)
*ballpen_Idle1_6FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_6WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 6 front wind",0,*BPIdle1_6WindFrontRaw)
*ballpen_Idle1_7FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_7WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 7 front wind",0,*BPIdle1_7WindFrontRaw)
*ballpen_Idle1_8FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_8WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 front wind",0,*BPIdle1_8WindFrontRaw)
*ballpen_Idle1_10FrontWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_10WindFront",5,#H2H_ANIMATIONTYPE_IDLE,"idle 1 10 front wind",0,*BPIdle1_10WindFrontRaw)

*ballpen_Idle1\frontWind(0,0)=*ballpen_Idle1_1FrontWind
*ballpen_Idle1\frontWind(1,0)=*ballpen_Idle1_2FrontWind
*ballpen_Idle1\frontWind(3,0)=*ballpen_Idle1_4FrontWind
*ballpen_Idle1\frontWind(4,0)=*ballpen_Idle1_5FrontWind
*ballpen_Idle1\frontWind(5,0)=*ballpen_Idle1_6FrontWind
*ballpen_Idle1\frontWind(6,0)=*ballpen_Idle1_7FrontWind
*ballpen_Idle1\frontWind(7,0)=*ballpen_Idle1_8FrontWind
*ballpen_Idle1\frontWind(9,0)=*ballpen_Idle1_10FrontWind

*ballpen_Idle1_1BackWind.animation=classGenerateAnimation(1,"image/hand_ballpen_idle1_1WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 1 back wind",0,*BPIdle1_1WindBackRaw)
*ballpen_Idle1_4BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_4WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 4 back wind",0,*BPIdle1_4WindBackRaw)
*ballpen_Idle1_5BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_5WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 5 back wind",0,*BPIdle1_5WindBackRaw)
*ballpen_Idle1_8BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle1_8WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 1 8 back wind",0,*BPIdle1_8WindBackRaw)

*ballpen_Idle1\backWind(0,0)=*ballpen_Idle1_1BackWind
*ballpen_Idle1\backWind(3,0)=*ballpen_Idle1_4BackWind
*ballpen_Idle1\backWind(4,0)=*ballpen_Idle1_5BackWind
*ballpen_Idle1\backWind(7,0)=*ballpen_Idle1_8BackWind

Procedure animationShiftAll(*a.animation,Array shifterX(1), Array shifterY(1))
	For i=0 To ArraySize(*a\frames())
		frameShiftShift(*a,i,shifterX(i),shifterY(i))
		If *a\frontWind()
			For j=0 To ArraySize(*a\frontWind(),2)
				If *a\frontWind(i,j)
					For k=0 To ArraySize(*a\frontWind(i,j)\frames())
						frameShiftShift(*a\frontWind(i,j),k,shifterX(i),shifterY(i))
					Next
				EndIf
			Next
		EndIf
		If *a\backWind()
			For j=0 To ArraySize(*a\backWind(),2)
				If *a\backWind(i,j)
					For k=0 To ArraySize(*a\backWind(i,j)\frames())
						frameShiftShift(*a\backWind(i,j),k,shifterX(i),shifterY(i))
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
animationShiftAll(*ballpen_Idle1,tmpShiftX(),tmpShiftY())

FreeArray(tmpShiftX())
FreeArray(tmpShiftY())
setFrameShadow(*ballpen_Idle1,0,0)
setFrameShadow(*ballpen_Idle1,1,2)
setFrameShadow(*ballpen_Idle1,2,6)
setFrameShadow(*ballpen_Idle1,3,8)
setFrameShadow(*ballpen_Idle1,4,10)
setFrameShadow(*ballpen_Idle1,5,6)
setFrameShadow(*ballpen_Idle1,6,2)
setFrameShadow(*ballpen_Idle1,7,0)
setFrameShadow(*ballpen_Idle1,8,-2)
setFrameShadow(*ballpen_Idle1,9,-3)

;------- Idle 2
*ballpen_Idle2.animation=classGenerateAnimation(5,"image/hand_ballpen_idle2_",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2",1,*BPIdle2Raw)
animationPrepareWind(*ballpen_Idle2)

*ballpen_Idle2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_1WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 1 wind front",0,*BPIdle2_1WindFrontRaw)
*ballpen_Idle2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_2WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind front",0,*BPIdle2_2WindFrontRaw)
*ballpen_Idle2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_3WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind front",0,*BPIdle2_3WindFrontRaw)
*ballpen_Idle2_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_5WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind front",0,*BPIdle2_5WindFrontRaw)
*ballpen_Idle2_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_idle2_6WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 2 6 wind front",0,*BPIdle2_6WindFrontRaw)

*ballpen_Idle2_2FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_2WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 2 wind back",0,*BPIdle2_2WindBackRaw)
*ballpen_Idle2_3FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_3WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 3 wind back",0,*BPIdle2_3WindBackRaw)
*ballpen_Idle2_5FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_idle2_5WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 2 5 wind back",0,*BPIdle2_5WindBackRaw)

*ballpen_Idle2\frontWind(0,0)=*ballpen_Idle2_1WindFront
*ballpen_Idle2\frontWind(1,0)=*ballpen_Idle2_2WindFront
*ballpen_Idle2\frontWind(2,0)=*ballpen_Idle2_3WindFront
*ballpen_Idle2\frontWind(4,0)=*ballpen_Idle2_5WindFront
*ballpen_Idle2\frontWind(5,0)=*ballpen_Idle2_6WindFront

*ballpen_Idle2\backWind(1,0)=*ballpen_Idle2_2FrontWind
*ballpen_Idle2\backWind(2,0)=*ballpen_Idle2_3FrontWind
*ballpen_Idle2\backWind(5,0)=*ballpen_Idle2_5FrontWind

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
animationShiftAll(*ballpen_Idle2,tmpShiftX(),tmpShiftY())
FreeArray(tmpShiftX())
FreeArray(tmpShiftY())

setFrameShadow(*ballpen_Idle2,0,5)
setFrameShadow(*ballpen_Idle2,1,15,5)
setFrameShadow(*ballpen_Idle2,2,25,15)
setFrameShadow(*ballpen_Idle2,3,15,-5)
setFrameShadow(*ballpen_Idle2,4,5,5)

;------- Idle 3
*ballpen_Idle3.animation=classGenerateAnimation(7,"image/hand_ballpen_idle3_",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3",1,*BPIdle3Raw)
animationPrepareWind(*ballpen_Idle3)
setFrameLength(*ballpen_Idle3,4,25)
setFrameLength(*ballpen_Idle3,5,6)
setFrameLength(*ballpen_Idle3,6,9)
setFrameLength(*ballpen_Idle3,7,6)

*ballpen_Idle3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_2WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 2 wind front",0,*BPIdle3_2WindFrontRaw)
*ballpen_Idle3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_3WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 3 wind front",0,*BPIdle3_3WindFrontRaw)
*ballpen_Idle3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_4WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind front",0,*BPIdle3_4WindFrontRaw)
*ballpen_Idle3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_5WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind front",0,*BPIdle3_5WindFrontRaw)
*ballpen_Idle3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_6WindFront",9,#H2H_ANIMATIONTYPE_IDLE,"idle 3 6 wind front",0,*BPIdle3_6WindFrontRaw)
*ballpen_Idle3_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_7WindFront",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 7 wind front",0,*BPIdle3_7WindFrontRaw)
*ballpen_Idle3_8WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_idle3_8WindFront",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 8 wind front",0,*BPIdle3_8WindFrontRaw)

*ballpen_Idle3_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_4WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 4 wind back",0,*BPIdle3_4WindBackRaw)
*ballpen_Idle3_5WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_idle3_5WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 5 wind back",0,*BPIdle3_5WindBackRaw)
*ballpen_Idle3_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_6WindBack",9,#H2H_ANIMATIONTYPE_IDLE,"idle 3 6 wind back",0,*BPIdle3_6WindBackRaw)
*ballpen_Idle3_7WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_7WindBack",6,#H2H_ANIMATIONTYPE_IDLE,"idle 3 7 wind back",0,*BPIdle3_7WindBackRaw)
*ballpen_Idle3_8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_idle3_8WindBack",8,#H2H_ANIMATIONTYPE_IDLE,"idle 3 8 wind back",0,*BPIdle3_8WindBackRaw)

*ballpen_Idle3\frontWind(1,0)=*ballpen_Idle3_2WindFront
*ballpen_Idle3\frontWind(2,0)=*ballpen_Idle3_3WindFront
*ballpen_Idle3\frontWind(3,0)=*ballpen_Idle3_4WindFront
*ballpen_Idle3\frontWind(4,0)=*ballpen_Idle3_5WindFront
*ballpen_Idle3\frontWind(5,0)=*ballpen_Idle3_6WindFront
*ballpen_Idle3\frontWind(6,0)=*ballpen_Idle3_7WindFront
*ballpen_Idle3\frontWind(7,0)=*ballpen_Idle3_8WindFront

*ballpen_Idle3\backWind(3,0)=*ballpen_Idle3_4WindBack
*ballpen_Idle3\backWind(4,0)=*ballpen_Idle3_5WindBack
*ballpen_Idle3\backWind(5,0)=*ballpen_Idle3_6WindBack
*ballpen_Idle3\backWind(6,0)=*ballpen_Idle3_7WindBack
*ballpen_Idle3\backWind(7,0)=*ballpen_Idle3_8WindBack

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
animationShiftAll(*ballpen_Idle3,tmpShiftX(),tmpShiftY())
FreeArray(tmpShiftX())
FreeArray(tmpShiftY())

setFrameShadow(*ballpen_idle3,1,10,-10)
setFrameShadow(*ballpen_idle3,2,20,-20)
setFrameShadow(*ballpen_idle3,3,30,-30)
setFrameShadow(*ballpen_idle3,4,40,-40)
setFrameShadow(*ballpen_idle3,4,40,-40)
setFrameShadow(*ballpen_idle3,5,20,-20)
setFrameShadow(*ballpen_idle3,6,10,-10)

;------- Front new
*ballpen_MoveFront.animation=classGenerateAnimation(8,"image/hand_ballpen_move_front",4,#H2H_ANIMATIONTYPE_FRONT,"front new",1,*BPfrontNewRaw)
For i=0 To 4
	setFrameLength(*ballpen_Front,i,2)
Next

;------- move Back new
*ballpen_MoveBack.animation=classGenerateAnimation(3,"image/hand_ballpen_move_back",5,#H2H_ANIMATIONTYPE_BACK,"move back new",1,*BPMoveBackRaw)
ReDim *ballpen_MoveBack\frames(5)
*ballpen_MoveBack\frames(4)=*ballpen_MoveBack\frames(2)
*ballpen_MoveBack\frames(5)=*ballpen_MoveBack\frames(1)

;------- Neutral 1 NEW
; *ballpen_neutral1.animation=classGenerateAnimation(9,"image/hand_ballpen_neutral1_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1",0,*BPneutral1NewRaw,12,#H2H_DAMAGETYPE_CUT,3)
; setFrameSound(*ballpen_neutral1,0,#H2H_SOUND_ID_PLASTICSWING)
; setFrameSound(*ballpen_neutral1,6,#H2H_SOUND_ID_PLASTICSWING)
; enableFrameDamageCut(*ballpen_neutral1,7)
; setFrameLength(*ballpen_neutral1,2,3)
; setFrameLength(*ballpen_neutral1,3,3)
; setFrameLength(*ballpen_neutral1,4,3)
; setFrameLength(*ballpen_neutral1,7,3)
; setFrameLength(*ballpen_neutral1,8,3)
; setFrameLength(*ballpen_neutral1,9,8)
; setFrameCanDoNext(*ballpen_neutral1,9)
; 
; *ballpen_neutral1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 1 wind back",0,*BPNeutral1_1WindBackRaw)
; *ballpen_neutral1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 2 wind back",0,*BPNeutral1_2WindBackRaw)
; *ballpen_neutral1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 3 wind back",0,*BPNeutral1_3WindBackRaw)
; *ballpen_neutral1_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 4 wind back",0,*BPNeutral1_4WindBackRaw)
; *ballpen_neutral1_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_5WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 5 wind back",0,*BPNeutral1_5WindBackRaw)
; *ballpen_neutral1_6WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_6WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 6 wind back",0,*BPNeutral1_6WindBackRaw)
; *ballpen_neutral1_10WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_10WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 10 wind back",0,*BPNeutral1_10WindBackRaw)
; 
; *ballpen_neutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 1 wind front",0,*BPNeutral1_1WindFrontRaw)
; *ballpen_neutral1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 2 wind front",0,*BPNeutral1_2WindFrontRaw)
; *ballpen_neutral1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 3 wind front",0,*BPNeutral1_3WindFrontRaw)
; *ballpen_neutral1_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 4 wind front",0,*BPNeutral1_4WindFrontRaw)
; *ballpen_neutral1_5WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 5 wind front",0,*BPNeutral1_5WindFrontRaw)
; *ballpen_neutral1_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 7 wind front",0,*BPNeutral1_7WindFrontRaw)
; *ballpen_neutral1_8WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_8WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 8 wind front",0,*BPNeutral1_8WindFrontRaw)
; *ballpen_neutral1_9WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_9WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 9 wind front",0,*BPNeutral1_9WindFrontRaw)
; *ballpen_neutral1_10WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral1_10WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 1 10 wind front",0,*BPNeutral1_10WindFrontRaw)
; 
; animationPrepareWind(*ballpen_neutral1)
; *ballpen_neutral1\backWind(0,0)=*ballpen_neutral1_1WindBack
; *ballpen_neutral1\backWind(1,0)=*ballpen_neutral1_2WindBack
; *ballpen_neutral1\backWind(2,0)=*ballpen_neutral1_3WindBack
; *ballpen_neutral1\backWind(3,0)=*ballpen_neutral1_4WindBack
; *ballpen_neutral1\backWind(4,0)=*ballpen_neutral1_5WindBack
; *ballpen_neutral1\backWind(5,0)=*ballpen_neutral1_6WindBack
; *ballpen_neutral1\backWind(9,0)=*ballpen_neutral1_10WindBack
; 
; *ballpen_neutral1\frontWind(0,0)=*ballpen_neutral1_1WindFront
; *ballpen_neutral1\frontWind(1,0)=*ballpen_neutral1_2WindFront
; *ballpen_neutral1\frontWind(2,0)=*ballpen_neutral1_3WindFront
; *ballpen_neutral1\frontWind(3,0)=*ballpen_neutral1_4WindFront
; *ballpen_neutral1\frontWind(4,0)=*ballpen_neutral1_5WindFront
; *ballpen_neutral1\frontWind(6,0)=*ballpen_neutral1_7WindFront
; *ballpen_neutral1\frontWind(7,0)=*ballpen_neutral1_8WindFront
; *ballpen_neutral1\frontWind(8,0)=*ballpen_neutral1_9WindFront
; *ballpen_neutral1\frontWind(9,0)=*ballpen_neutral1_10WindFront

; animationFreeMovementWind(*ballpen_neutral1)

;------ Neutral 1 newer
*BPNeutral1.animation=classGenerateAnimation(9,"image/hand_ballpen_neutral1_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1",0,*BPNeutral1Raw,8,#H2H_DAMAGETYPE_CUT,3)
setFrameSound(*BPNeutral1,0,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*BPNeutral1,6,#H2H_SOUND_ID_PLASTICSWING)
enableFrameDamageCut(*BPNeutral1,7)
setFrameLength(*BPNeutral1,2,3)
setFrameLength(*BPNeutral1,3,3)
setFrameLength(*BPNeutral1,4,3)
setFrameLength(*BPNeutral1,7,3)
setFrameLength(*BPNeutral1,8,3)
setFrameLength(*BPNeutral1,9,8)
setFrameCanDoNext(*BPNeutral1,9)
setFrameMovement(*BPNeutral1,0,-5)
setFrameMovement(*BPNeutral1,1,-5)
setFrameMovement(*BPNeutral1,2,-5)
setFrameMovement(*BPNeutral1,4,5)
setFrameMovement(*BPNeutral1,5,5,-10)
setFrameMovement(*BPNeutral1,6,0,-50)
setFrameMovement(*BPNeutral1,7,-5,-75)
setFrameMovement(*BPNeutral1,8,-5,75)
setFrameMovement(*BPNeutral1,9,-5,50)
setFrameCanDoNext(*BPNeutral1,9,4)

*BPNeutral1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind front",0,*BPNeutral1_1WindFrontRaw)
*BPNeutral1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind front",0,*BPNeutral1_2WindFrontRaw)
*BPNeutral1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind front",0,*BPNeutral1_3WindFrontRaw)
*BPNeutral1_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind front",0,*BPNeutral1_4WindFrontRaw)
*BPNeutral1_7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 7 wind front",0,*BPNeutral1_7WindFrontRaw)
*BPNeutral1_8WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_8WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind front",0,*BPNeutral1_8WindFrontRaw)
*BPNeutral1_9WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_9WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind front",0,*BPNeutral1_9WindFrontRaw)
*BPNeutral1_10WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral1_10WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 10 wind front",0,*BPNeutral1_10WindFrontRaw)
setFrameLength(*BPNeutral1_10WindFront,1,5)
setFrameLength(*BPNeutral1_10WindFront,2,6)
setFrameLength(*BPNeutral1_10WindFront,3,7)

*BPNeutral1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_1WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 1 wind back",0,*BPNeutral1_1WindBackRaw)
*BPNeutral1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_2WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 2 wind back",0,*BPNeutral1_2WindBackRaw)
*BPNeutral1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_3WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 3 wind back",0,*BPNeutral1_3WindBackRaw)
*BPNeutral1_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_4WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 4 wind back",0,*BPNeutral1_4WindBackRaw)
*BPNeutral1_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_5WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 5 wind back",0,*BPNeutral1_5WindBackRaw)
*BPNeutral1_6WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_6WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 6 wind back",0,*BPNeutral1_6WindBackRaw)
setFrameLength(*BPNeutral1_6WindBack,1,5)
*BPNeutral1_8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_8WindBack",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 8 wind back",0,*BPNeutral1_8WindBackRaw)
*BPNeutral1_9WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral1_9WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 9 wind back",0,*BPNeutral1_9WindBackRaw)
*BPNeutral1_10WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral1_10WindBack",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 1 10 wind back",0,*BPNeutral1_10WindBackRaw)
setFrameLength(*BPNeutral1_10WindBack,1,7)

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
; *ballpen_neutral2.animation=classGenerateAnimation(7,"image/hand_ballpen_neutral2_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 2",0,*BPneutral2Raw,12,#H2H_DAMAGETYPE_CUT,4)
; 
; setFrameSound(*ballpen_neutral2,1,*chineseStaff_HeavyS\id)
; enableFrameDamageCut(*ballpen_neutral2,2)
; setFrameSound(*ballpen_neutral2,4,*chineseStaff_HeavyS\id)
; For i=5 To 7
; 	setFrameLength(*ballpen_neutral2,i,1)
; Next
; setFrameCanDoNext(*ballpen_neutral2,5)

*BPNeutral2.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral2_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2",0,*BPNeutral2Raw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameLength(*BPNeutral2,0,3)
setFrameLength(*BPNeutral2,2,3)
setFrameLength(*BPNeutral2,3,10)
setFrameCanDoNext(*BPNeutral2,3,5)
setFrameSound(*BPNeutral2,1,#H2H_SOUND_ID_PLASTICSWING)

*BPNeutral2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 1 wind front",0,*BPNeutral2_1WindFrontRaw)
*BPNeutral2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 2 wind front",0,*BPNeutral2_2WindFrontRaw)
*BPNeutral2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral2_3WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 3 wind front",0,*BPNeutral2_3WindFrontRaw)
*BPNeutral2_4WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral2_4WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 2 4 wind front",0,*BPNeutral2_4WindFrontRaw)
setFrameLength(*BPNeutral2_4WindFront,1,5)
setFrameLength(*BPNeutral2_4WindFront,2,6)
setFrameLength(*BPNeutral2_4WindFront,3,7)

animationPrepareWind(*BPNeutral2,0)
*BPNeutral2\frontWind(0,0)=*BPNeutral2_1WindFront
*BPNeutral2\frontWind(1,0)=*BPNeutral2_2WindFront
*BPNeutral2\frontWind(2,0)=*BPNeutral2_3WindFront
*BPNeutral2\frontWind(3,0)=*BPNeutral2_4WindFront

animationFreeMovementWind(*BPNeutral2)

;------- Neutral 3
; *ballpen_neutral3.animation=classGenerateAnimation(6,"image/hand_ballpen_neutral3_",3,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 3",0,*BPneutral3Raw,12,#H2H_DAMAGETYPE_PIERCE,4)
; 
; setFrameMovement(*ballpen_neutral3,0,10)
; setFrameSound(*ballpen_neutral3,1,*chineseStaff_AttackS\id)
; setFrameMovement(*ballpen_neutral3,1,10)
; setFrameMovement(*ballpen_neutral3,2,-10)
; setFrameSound(*ballpen_neutral3,3,#H2H_SOUND_ID_PLASTICSWING)
; setFrameMovement(*ballpen_neutral3,3,-10)
; setFrameLength(*ballpen_neutral3,4,2)
; setFrameLength(*ballpen_neutral3,5,2)
; setFrameDamage(*ballpen_neutral3,5,2)
; setFrameLength(*ballpen_neutral3,6,2)
; setFrameDamage(*ballpen_neutral3,6,1)
; setFrameCanDoNext(*ballpen_neutral3,4)
; 
; ; animationGetNeutral(*ballpen_neutral2)=*ballpen_neutral3
; animationGetNeutral(*BPNeutral2)=*ballpen_neutral3
*BPNeutral3.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3",0,*BPNeutral3Raw,12,#H2H_DAMAGETYPE_PIERCE,4)
setFrameCanDoNext(*BPNeutral3,2,4)
setFrameSound(*BPNeutral3,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*BPNeutral3,2,#H2H_SOUND_ID_SWISHLIGHT)
setFrameLength(*BPNeutral3,0,3)
setFrameLength(*BPNeutral3,2,12)
setFrameMovement(*BPNeutral3,0,25)
setFrameMovement(*BPNeutral3,1,25)
setFrameMovement(*BPNeutral3,2,-125)
*BPNeutral3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral3_1WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 1 wind front",0,*BPNeutral3_1WindFrontRaw)
*BPNeutral3_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 2 wind front",0,*BPNeutral3_2WindFrontRaw)
*BPNeutral3_3WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral3_3WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 3 3 wind front",0,*BPNeutral3_3WindFrontRaw)

animationPrepareWind(*BPNeutral3,0)
*BPNeutral3\frontWind(0,0)=*BPNeutral3_1WindFront
*BPNeutral3\frontWind(1,0)=*BPNeutral3_2WindFront
*BPNeutral3\frontWind(2,0)=*BPNeutral3_3WindFront
animationFreeMovementWind(*BPNeutral3)

animationGetNeutral(*BPNeutral2)=*BPNeutral3

;------- Neutral 4
; *ballpen_neutral4.animation=classGenerateAnimation(6,"image/hand_ballpen_neutral4_",5,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 4",0,*BPneutral4Raw,10,#H2H_DAMAGETYPE_CUT,5)
; 
; setFrameSound(*ballpen_neutral4,2,*chineseStaff_AttackS\id)
; ; animationGetNeutral(*ballpen_neutral3)=*ballpen_neutral4
; animationGetNeutral(*BPNeutral3)=*ballpen_neutral4
; For i=0 To 4
; 	setFrameMovement(*ballpen_neutral4,i,5)
; Next
; For i=5 To 6
; 	setFrameLength(*ballpen_neutral4,6,2)
; Next
; animationSetComboEnd(*ballpen_neutral4,1)
*BPNeutral4.animation=classGenerateAnimation(7,"image/hand_ballpen_neutral4_",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4",0,*BPNeutral4Raw,10,#H2H_DAMAGETYPE_CUT,5)
animationSetComboEnd(*BPNeutral4,#True)
setFrameSound(*BPNeutral4,3,#H2H_SOUND_ID_PLASTICSWING)
setFrameMovement(*BPNeutral4,0,15)
setFrameMovement(*BPNeutral4,1,15)
setFrameMovement(*BPNeutral4,2,15)
setFrameMovement(*BPNeutral4,3,-30)
setFrameMovement(*BPNeutral4,5,5,-40)
setFrameMovement(*BPNeutral4,6,6,-60)
setFrameMovement(*BPNeutral4,7,6,80)
setFrameLength(*BPNeutral4,0,2)
setFrameLength(*BPNeutral4,1,2)
setFrameLength(*BPNeutral4,2,3)
setFrameLength(*BPNeutral4,3,3)
setFrameLength(*BPNeutral4,6,10)

*BPNeutral4_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_4WindFront",3,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 4 wind front",0,*BPNeutral4_4WindFrontRaw)
*BPNeutral4_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_5WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 5 wind front",0,*BPNeutral4_5WindFrontRaw)
*BPNeutral4_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral4_6WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 6 wind front",0,*BPNeutral4_6WindFrontRaw)
*BPNeutral4_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral4_7WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 4 7 wind front",0,*BPNeutral4_7WindFrontRaw)
setFrameLength(*BPNeutral4_7WindFront,1,5)
setFrameLength(*BPNeutral4_7WindFront,2,6)
setFrameLength(*BPNeutral4_7WindFront,3,7)

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
; *ballpen_neutral5.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral5_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 5",0,*BPneutral5Raw,10,#H2H_DAMAGETYPE_BLUNT,3,1)
; 
; setFrameSound(*ballpen_neutral5,0,#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
; setFramePushD(*ballpen_neutral5,0,-20)
; setFramePushD(*ballpen_neutral5,1,-20)
; setFramePushD(*ballpen_neutral5,2,-20)
; setFrameStun(*ballpen_neutral5,0,15)
; setFrameStun(*ballpen_neutral5,1,15)
; setFrameStun(*ballpen_neutral5,2,10)
; setFrameLength(*ballpen_neutral5,0,3)
; setFrameLength(*ballpen_neutral5,1,6)
; setFrameMovement(*ballpen_neutral5,0,-40)
; setFrameMovement(*ballpen_neutral5,1,-30)
; setFrameMovement(*ballpen_neutral5,2,-20)
; setFrameMovement(*ballpen_neutral5,3,-10)
; 
; setFrameCanDoNext(*ballpen_neutral5,2)
*BPNeutral5.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral5_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5",0,*BPNeutral5Raw,10,#H2H_DAMAGETYPE_BLUNT,3,1)
setFrameCanDoNext(*BPNeutral5,1,6)
setFrameLength(*BPNeutral5,0,4)
setFrameLength(*BPNeutral5,2,10)
setFrameMovement(*BPNeutral5,0,-25)
setFrameMovement(*BPNeutral5,1,-125)
setFrameMovement(*BPNeutral5,2,25)
setFramePushD(*BPNeutral5,1,-25)
setFrameStun(*BPNeutral5,1,15)
setFrameSound(*BPNeutral5,1,#H2H_SOUND_ID_SWISHMEDIUM)

*BPNeutral5_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral5_1WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind front",0,*BPNeutral5_1WindFrontRaw)
*BPNeutral5_2WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_neutral5_2WindFront",4,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind front",0,*BPNeutral5_2WindFrontRaw)
setFrameLength(*BPNeutral5_2WindFront,1,5)
setFrameLength(*BPNeutral5_2WindFront,2,6)
setFrameLength(*BPNeutral5_2WindFront,3,7)

*BPNeutral5_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral5_1WindBack",7,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 1 wind back",0,*BPNeutral5_1WindBackRaw)
*BPNeutral5_2WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral5_2WindBack",5,#H2H_ANIMATIONTYPE_NEUTRAL,"Neutral 5 2 wind back",0,*BPNeutral5_2WindBackRaw)
setFrameLength(*BPNeutral5_2WindBack,1,6)
setFrameLength(*BPNeutral5_2WindBack,2,7)

animationPrepareWind(*BPNeutral5,0)
*BPNeutral5\frontWind(0,0)=*BPNeutral5_1WindFront
*BPNeutral5\frontWind(1,0)=*BPNeutral5_2WindFront
*BPNeutral5\backWind(0,0)=*BPNeutral5_1WindBack
*BPNeutral5\backWind(1,0)=*BPNeutral5_2WindBack
animationFreeMovementWind(*BPNeutral5)


;------- Neutral 6
*ballpen_neutral6.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral6_",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6",0,*BPneutral6Raw,10,#H2H_DAMAGETYPE_CUT,5)
setFrameSound(*ballpen_neutral6,0,#H2H_SOUND_ID_PLASTICSWING)

setFrameLength(*ballpen_neutral6,2,10)
setFrameMovement(*ballpen_neutral6,1,-75)

animationPrepareWind(*ballpen_neutral6)

*ballpen_neutral6_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral6_1WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 1 wind front",0,*BPNeutral6_1WindFrontRaw)
*ballpen_neutral6_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_neutral6_2WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 2 wind front",0,*BPNeutral6_2WindFrontRaw)
*ballpen_neutral6_3WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_neutral6_3WindFront",7,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind front",0,*BPNeutral6_3WindFrontRaw)
setFrameMovement(*ballpen_neutral6_3WindFront,1,-50)
animationFreeMovement(*ballpen_neutral6_3WindFront)
setFrameCanDoNext(*ballpen_neutral6,2,4)

*ballpen_neutral6_3WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_neutral6_3WindBack",6,#H2H_ANIMATIONTYPE_NEUTRAL,"neutral 6 3 wind bacl",0,*BPNeutral6_3WindBackRaw)
animationFreeMovement(*ballpen_neutral6_3WindBack)

*ballpen_neutral6\backWind(2,0)=*ballpen_neutral6_3WindBack

*ballpen_neutral6\frontWind(0,0)=*ballpen_neutral6_1WindFront
*ballpen_neutral6\frontWind(1,0)=*ballpen_neutral6_2WindFront
*ballpen_neutral6\frontWind(2,0)=*ballpen_neutral6_3WindFront

animationSetComboEnd(*ballpen_neutral6,1)

;------- Side 1 New
*ballpen_side1New.animation=classGenerateAnimation(3,"image/hand_ballpen_side1_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1 new",0,*BPside1NewRaw,30,#H2H_DAMAGETYPE_CUT,8)
For i=0 To 3
	setFrameMovement(*ballpen_side1New,i,-50+i*10)
Next
setFrameSound(*ballpen_side1New,0,#H2H_SOUND_ID_PLASTICSWING)
setFrameLength(*ballpen_side1New,1,3)
setFrameLength(*ballpen_side1New,2,3)
setFrameLength(*ballpen_side1New,3,8)

*ballpen_side1_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_1backwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 1 1 back wind",0,*BPside1_1WindBackRaw)
*ballpen_side1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_2backwind",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 back wind",0,*BPside1_2WindBackRaw)
*ballpen_side1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_3backwind",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 back wind",0,*BPside1_3WindBackRaw)
*ballpen_side1_4WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_side1_4backwind",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 back wind",0,*BPside1_4WindBackRaw)

*ballpen_side1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_2frontwind",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 2 front wind",0,*BPside1_2WindFrontRaw)
*ballpen_side1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side1_3frontwind",3,#H2H_ANIMATIONTYPE_NSIDE,"side 1 3 front wind",0,*BPside1_3WindFrontRaw)
*ballpen_side1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side1_4frontwind",4,#H2H_ANIMATIONTYPE_NSIDE,"side 1 4 front wind",0,*BPside1_4WindFrontRaw)
frameSetFreeMovement(*ballpen_side1_4WindFront\frames(0),#True)

FreeArray(*ballpen_side1New\backWind())
Dim *ballpen_side1New\backWind(3,0)
*ballpen_side1New\backWind(0,0)=*ballpen_side1_1WindBack
*ballpen_side1New\backWind(1,0)=*ballpen_side1_2WindBack
*ballpen_side1New\backWind(2,0)=*ballpen_side1_3WindBack
*ballpen_side1New\backWind(3,0)=*ballpen_side1_4WindBack

FreeArray(*ballpen_side1New\frontWind())
Dim *ballpen_side1New\frontWind(3,0)
*ballpen_side1New\frontWind(1,0)=*ballpen_side1_2WindFront
*ballpen_side1New\frontWind(2,0)=*ballpen_side1_3WindFront
*ballpen_side1New\frontWind(3,0)=*ballpen_side1_4WindFront
; animationGetNeutral(*ballpen_side1New)=*ballpen_neutral2
animationGetNeutral(*ballpen_side1New)=*BPNeutral2

;------- Side 2 new
*ballpen_side2New.animation=classGenerateAnimation(4,"image/hand_ballpen_side2_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 new",0,*BPside2NewRaw,30,#H2H_DAMAGETYPE_CUT,5)
For i=0 To 4
	setFrameMovement(*ballpen_side2New,i,-40-i*4)
Next
setFrameSound(*ballpen_side2New,0,#H2H_SOUND_ID_PLASTICSWING)
enableFrameDamageCut(*ballpen_side2New,2)
setFrameLength(*ballpen_side2New,2,3)
setFrameSound(*ballpen_side2New,3,#H2H_SOUND_ID_PLASTICSWING)
animationGetSide(*ballpen_side1New)=*ballpen_side2New

*ballpen_side2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_1frontwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 front wind",0,*BPside2_1WindFrontRaw)
*ballpen_side2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_2frontwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 front wind",0,*BPside2_2WindFrontRaw)
*ballpen_side2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_3frontwind",3,#H2H_ANIMATIONTYPE_NSIDE,"side 2 3 front wind",0,*BPside2_3WindFrontRaw)
*ballpen_side2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_4frontwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 front wind",0,*BPside2_4WindFrontRaw)
*ballpen_side2_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side2_5frontwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 5 front wind",0,*BPside2_5WindFrontRaw)
frameSetFreeMovement(*ballpen_side2_5WindFront\frames(0),#True)

*ballpen_side2_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_1backwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 1 back wind",0,*BPside2_1WindBackRaw)
*ballpen_side2_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_2backwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 2 back wind",0,*BPside2_2WindBackRaw)
*ballpen_side2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side2_4backwind",5,#H2H_ANIMATIONTYPE_NSIDE,"side 2 4 back wind",0,*BPside2_4WindBackRaw)

FreeArray(*ballpen_side2New\backWind())
Dim *ballpen_side2New\backWind(4,0)
*ballpen_side2New\backWind(0,0)=*ballpen_side2_1WindBack
*ballpen_side2New\backWind(1,0)=*ballpen_side2_2WindBack
*ballpen_side2New\backWind(3,0)=*ballpen_side2_4WindBack

FreeArray(*ballpen_side2New\frontWind())
Dim *ballpen_side2New\frontWind(4,0)
*ballpen_side2New\frontWind(0,0)=*ballpen_side2_1WindFront
*ballpen_side2New\frontWind(1,0)=*ballpen_side2_2WindFront
*ballpen_side2New\frontWind(2,0)=*ballpen_side2_3WindFront
*ballpen_side2New\frontWind(3,0)=*ballpen_side2_4WindFront
*ballpen_side2New\frontWind(4,0)=*ballpen_side2_5WindFront

;------- Side 3 new
*ballpen_side3.animation=classGenerateAnimation(6,"image/hand_ballpen_side3_",5,#H2H_ANIMATIONTYPE_NSIDE,"side 4 new",0,*BPside3NewRaw,30,#H2H_DAMAGETYPE_PIERCE,10)
animationSetComboEnd(*ballpen_side3,1)
setFrameSound(*ballpen_side3,1,*chineseStaff_AttackS\id)
setFrameSound(*ballpen_side3,3,*chineseStaff_AttackS\id)
setFrameMovement(*ballpen_side3,0,40,-30)
setFrameMovement(*ballpen_side3,1,20,-20)
setFrameMovement(*ballpen_side3,2,40,-20)
setFrameMovement(*ballpen_side3,3,-70,-20)
setFrameMovement(*ballpen_side3,4,-90,-20)
setFrameMovement(*ballpen_side3,5,-120,30)
setFrameMovement(*ballpen_side3,6,-130,40)
setFrameMovementDelta(*ballpen_side3,6,-20,6)
setFrameDamage(*ballpen_side3,3,5)
setFrameLength(*ballpen_side3,3,4)
setFrameLength(*ballpen_side3,4,4)
setFrameLength(*ballpen_side3,6,8)
animationPrepareWind(*ballpen_side3)

animationGetSide(*ballpen_side2New)=*ballpen_side3

*ballpen_side3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 1 wind front",0,*BPside3_1WindFrontRaw)
*ballpen_side3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 2 wind front",0,*BPside3_2WindFrontRaw)
*ballpen_side3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 3 wind front",0,*BPside3_3WindFrontRaw)
*ballpen_side3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 4 wind front",0,*BPside3_4WindFrontRaw)
*ballpen_side3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind front",0,*BPside3_5WindFrontRaw)
*ballpen_side3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 6 wind front",0,*BPside3_6WindFrontRaw)
*ballpen_side3_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_side3_7WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"side 3 7 wind front",0,*BPside3_7WindFrontRaw)
frameSetFreeMovement(*ballpen_side3_7WindFront\frames(2),#True)
*ballpen_side3_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_5WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 5 wind back",0,*BPside3_5WindBackRaw)
*ballpen_side3_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side3_6WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"side 3 6 wind back",0,*BPside3_6WindBackRaw)

*ballpen_side3\backWind(4,0)=*ballpen_side3_5WindBack
*ballpen_side3\backWind(5,0)=*ballpen_side3_6WindBack

*ballpen_side3\frontWind(0,0)=*ballpen_side3_1WindFront
*ballpen_side3\frontWind(1,0)=*ballpen_side3_2WindFront
*ballpen_side3\frontWind(2,0)=*ballpen_side3_3WindFront
*ballpen_side3\frontWind(3,0)=*ballpen_side3_4WindFront
*ballpen_side3\frontWind(4,0)=*ballpen_side3_5WindFront
*ballpen_side3\frontWind(5,0)=*ballpen_side3_6WindFront
*ballpen_side3\frontWind(6,0)=*ballpen_side3_7WindFront

;------- Side 4
; *ballpen_side4.animation=classGenerateAnimation(7,"image/hand_ballpen_side4_",4,#H2H_ANIMATIONTYPE_NSIDE,"side 4",0,*BPside4Raw,25,#H2H_DAMAGETYPE_CUT,9)
*BPSide4.animation=classGenerateAnimation(4,"image/hand_ballpen_side4_",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4",0,*BPSide4Raw,25,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPSide4,#True)
For i=0 To 4
	setFrameMovement(*BPSide4,i,-40)
Next
setFrameLength(*BPSide4,0,5)
setFrameLength(*BPSide4,4,8)
setFrameSound(*BPSide4,1,#H2H_SOUND_ID_PLASTICSWING)

*BPSide4_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side4_1WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 1 wind front",0,*BPSide4_1WindFrontRaw)
setFrameLength(*BPSide4_1WindFront,1,5)
*BPSide4_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_2WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 2 wind front",0,*BPSide4_2WindFrontRaw)
*BPSide4_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_3WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 3 wind front",0,*BPSide4_3WindFrontRaw)
*BPSide4_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side4_4WindFront",3,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 4 wind front",0,*BPSide4_4WindFrontRaw)
*BPSide4_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side4_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind front",0,*BPSide4_5WindFrontRaw)
setFrameLength(*BPSide4_5WindFront,1,6)
setFrameLength(*BPSide4_5WindFront,2,7)

*BPSide4_5WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_side4_5WindBack",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 4 5 wind back",0,*BPSide4_5WindBackRaw)
setFrameLength(*BPSide4_5WindBack,1,6)
setFrameLength(*BPSide4_5WindBack,2,7)

animationPrepareWind(*BPSide4,0)
*BPSide4\frontWind(0,0)=*BPSide4_1WindFront
*BPSide4\frontWind(1,0)=*BPSide4_2WindFront
*BPSide4\frontWind(2,0)=*BPSide4_3WindFront
*BPSide4\frontWind(3,0)=*BPSide4_4WindFront
*BPSide4\frontWind(4,0)=*BPSide4_5WindFront
*BPSide4\backWind(4,0)=*BPSide4_5WindBack
animationFreeMovementWind(*BPSide4)
animationGetSide(*BPNeutral5)=*BPSide4

; animationGetSide(*ballpen_neutral5)=*ballpen_side4
; animationGetSide(*BPNeutral5)=*ballpen_side4
; animationSetComboEnd(*ballpen_side4,1)
; setFrameMovement(*ballpen_side4,4,-100,0)
; setFrameSound(*ballpen_side4,1,*chineseStaff_AttackS\id)

;------- Side 5
; *ballpen_side5.animation=classGenerateAnimation(7,"image/hand_ballpen_side5_",3,#H2H_ANIMATIONTYPE_NSIDE,"side 5",0,*BPside5Raw,35,#H2H_DAMAGETYPE_CUT,9)
; 
; setFrameSound(*ballpen_side5,1,#H2H_SOUND_ID_SWISHLIGHT)
; setFrameDamage(*ballpen_side5,1,4)
; setFrameLength(*ballpen_side5,0,5)
; For i=5 To 7
; 	setFrameLength(*ballpen_side5,i,2)
; Next
; setFrameMovement(*ballpen_side5,0,20)
; setFrameMovement(*ballpen_side5,1,-20)
; setFrameMovement(*ballpen_side5,2,-40)
; setFrameMovement(*ballpen_side5,3,-60)
; setFrameMovement(*ballpen_side5,4,-40)
; setFrameMovement(*ballpen_side5,5,-20)
; animationSetComboEnd(*ballpen_side5,1)
*BPSide5.animation=classGenerateAnimation(4,"image/hand_ballpen_side5_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5",0,*BPSide5Raw,35,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPSide5,#True)
setFrameMovement(*BPSide5,0,30)
setFrameMovement(*BPSide5,1,-50,10)
setFrameMovement(*BPSide5,2,-70,10)
setFrameMovement(*BPSide5,3,-90,-10)
setFrameMovement(*BPSide5,4,-50,-10)
animationSetComboEnd(*BPSide5,1)
setFrameSound(*BPSide5,1,#H2H_SOUND_ID_PLASTICSWING)
setFrameLength(*BPSide5,0,5)
*BPSide5_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 1 wind front",0,*BPSide5_1WindFrontRaw)
*BPSide5_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 2 wind front",0,*BPSide5_2WindFrontRaw)
*BPSide5_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 3 wind front",0,*BPSide5_3WindFrontRaw)
*BPSide5_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side5_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 4 wind front",0,*BPSide5_4WindFrontRaw)
*BPSide5_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side5_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 5 5 wind front",0,*BPSide5_5WindFrontRaw)
setFrameLength(*BPSide5_5WindFront,1,5)
setFrameLength(*BPSide5_5WindFront,2,6)

animationPrepareWind(*BPSide5,0)
*BPSide5\frontWind(0,0)=*BPSide5_1WindFront
*BPSide5\frontWind(1,0)=*BPSide5_2WindFront
*BPSide5\frontWind(2,0)=*BPSide5_3WindFront
*BPSide5\frontWind(3,0)=*BPSide5_4WindFront
*BPSide5\frontWind(4,0)=*BPSide5_5WindFront
animationFreeMovementWind(*BPSide5)

;------- Side 6
*ballpen_side6.animation=classGenerateAnimation(5,"image/hand_ballpen_side6_",4,#H2H_ANIMATIONTYPE_NSIDE,"side 6",0,*BPside6Raw,15,#H2H_DAMAGETYPE_CUT,9)
setFrameLength(*ballpen_side6,0,6)
setFrameLength(*ballpen_side6,1,6)
setFrameLength(*ballpen_side6,4,10)
setFrameLength(*ballpen_side6,5,5)
setFrameDamage(*ballpen_side6,0,5)
setFrameDamage(*ballpen_side6,1,5)
setFrameDamage(*ballpen_side6,2,6)
setFrameDamageDuration(*ballpen_side6,4,5)
For i=0 To 3
	setFrameMovement(*ballpen_side6,i,-60+i*5)
Next
setFrameMovement(*ballpen_side6,4,-60)
setFrameMovement(*ballpen_side6,5,60)
enableFrameDamageCut(*ballpen_side6,3)
setFrameSound(*ballpen_side6,0,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*ballpen_side6,3,#H2H_SOUND_ID_PLASTICSWING)
animationSetComboEnd(*ballpen_side6,1)
animationPrepareWind(*ballpen_side6)

*ballpen_side6_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_1WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 1 wind front",0,*BPSide6_1WindFrontRaw)
*ballpen_side6_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_2WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 2 wind front",0,*BPSide6_2WindFrontRaw)
*ballpen_side6_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side6_3WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 3 wind front",0,*BPSide6_3WindFrontRaw)
*ballpen_side6_4WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side6_4WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 4 wind front",0,*BPSide6_4WindFrontRaw)
*ballpen_side6_5WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_side6_5WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"side 6 5 wind front",0,*BPSide6_5WindFrontRaw)
animationFreeMovement(*ballpen_side6_5WindFront)

*ballpen_side6\frontWind(0,0)=*ballpen_side6_1WindFront
*ballpen_side6\frontWind(1,0)=*ballpen_side6_2WindFront
*ballpen_side6\frontWind(2,0)=*ballpen_side6_3WindFront
*ballpen_side6\frontWind(3,0)=*ballpen_side6_4WindFront
*ballpen_side6\frontWind(4,0)=*ballpen_side6_5WindFront

;------- Side 7
*BPSide7.animation=classGenerateAnimation(6,"image/hand_ballpen_side7_",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7",0,*BPSide7Raw,10,#H2H_DAMAGETYPE_CUT,9)
setFrameMovement(*BPSide7,0,-10)
setFrameMovement(*BPSide7,1,-20)
setFrameMovement(*BPSide7,2,-30)
setFrameMovement(*BPSide7,3,-40)
setFrameMovement(*BPSide7,4,-40)
setFrameMovement(*BPSide7,5,-40)
setFrameMovement(*BPSide7,6,30)
setFrameSound(*BPSide7,0,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*BPSide7,4,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*BPSide7,5,#H2H_SOUND_ID_PLASTICBLUNTLIGHT)
setFrameLength(*BPSide7,5,9)
setFrameDamageDuration(*BPSide7,5,5)
*BPSide7_2WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_side7_2WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind front",0,*BPSide7_2WindFrontRaw)
*BPSide7_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_3WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind front",0,*BPSide7_3WindFrontRaw)
*BPSide7_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side7_4WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 4 wind front",0,*BPSide7_4WindFrontRaw)
*BPSide7_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_5WindFront",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 5 wind front",0,*BPSide7_5WindFrontRaw)
*BPSide7_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_side7_6WindFront",5,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 6 wind front",0,*BPSide7_6WindFrontRaw)
setFrameMovement(*BPSide7_6WindFront,2,-30)
setFrameLength(*BPSide7_6WindFront,1,6)
setFrameLength(*BPSide7_6WindFront,2,8)

*BPSide7_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_1WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 1 wind back",0,*BPSide7_1WindBackRaw)
*BPSide7_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_side7_2WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 2 wind back",0,*BPSide7_2WindBackRaw)
*BPSide7_3WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_side7_3WindBack",4,#H2H_ANIMATIONTYPE_NSIDE,"Side 7 3 wind back",0,*BPSide7_3WindBackRaw)

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

animationGetSide(*ballpen_neutral6)=*BPSide7


;------- Up 1 new
*ballpen_up1New.animation=classGenerateAnimation(3,"image/hand_ballpen_up1_",4,#H2H_ANIMATIONTYPE_NUP,"up 1 new",0,*BPup1NewRaw,20,#H2H_DAMAGETYPE_CUT,10)
setFrameSound(*ballpen_up1New,1,#H2H_SOUND_ID_PLASTICSWING)
setFrameDamage(*ballpen_up1New,1,5)
enableFrameDamageCut(*ballpen_up1New,2)
setFrameDamage(*ballpen_up1New,2,4)
For i=0 To 2
	setFrameMovement(*ballpen_up1New,i,-40)
Next
setFrameMovement(*ballpen_up1New,3,-20)
setFrameLength(*ballpen_up1New,3,7)
setFrameCanDoNext(*ballpen_up1New,3)

*ballpen_up1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_1frontwind",4,#H2H_ANIMATIONTYPE_NUP,"up 1 1 front wind",0,*BPUp1_1WindFrontRaw)
*ballpen_up1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_2frontwind",4,#H2H_ANIMATIONTYPE_NUP,"up 1 2 front wind",0,*BPUp1_2WindFrontRaw)
*ballpen_up1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_3frontwind",4,#H2H_ANIMATIONTYPE_NUP,"up 1 3 front wind",0,*BPUp1_3WindFrontRaw)
*ballpen_up1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_up1_4frontwind",3,#H2H_ANIMATIONTYPE_NUP,"up 1 4 front wind",0,*BPUp1_4WindFrontRaw)
frameSetFreeMovement(*ballpen_up1_4WindFront\frames(0),#True)

*ballpen_up1_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_2backwind",5,#H2H_ANIMATIONTYPE_NUP,"up 1 2 back wind",0,*BPUp1_2WindBackRaw)
*ballpen_up1_3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_up1_3backwind",5,#H2H_ANIMATIONTYPE_NUP,"up 1 3 back wind",0,*BPUp1_3WindBackRaw)

FreeArray(*ballpen_up1New\frontWind())
Dim *ballpen_up1New\frontWind(3,0)
*ballpen_up1New\frontWind(0,0)=*ballpen_up1_1WindFront
*ballpen_up1New\frontWind(1,0)=*ballpen_up1_2WindFront
*ballpen_up1New\frontWind(2,0)=*ballpen_up1_3WindFront
*ballpen_up1New\frontWind(3,0)=*ballpen_up1_4WindFront

FreeArray(*ballpen_up1New\backWind())
Dim *ballpen_up1New\backWind(3,0)
*ballpen_up1New\backWind(1,0)=*ballpen_up1_2WindBack
*ballpen_up1New\backWind(2,0)=*ballpen_up1_3WindBack

;------- Up 2
*ballpen_up2.animation=classGenerateAnimation(4,"image/hand_ballpen_up2_",5,#H2H_ANIMATIONTYPE_NUP,"up 2",0,*BPUp2Raw,20,#H2H_DAMAGETYPE_CUT,10)
setFrameSound(*ballpen_up2,0,*chineseStaff_AttackS\id)
setFrameSound(*ballpen_up2,2,*chineseStaff_HeavyS\id)
setFrameDamage(*ballpen_up2,2,5)
setFrameLength(*ballpen_up2,0,4)
setFrameLength(*ballpen_up2,1,4)
setFrameLength(*ballpen_up2,4,8)
For i=0 To 4
	setFrameMovement(*ballpen_up2,i,-25-i*5)
Next
animationPrepareWind(*ballpen_up2)
*ballpen_up2_2BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_2backwind",5,#H2H_ANIMATIONTYPE_NUP,"up 2 2 back wind",0,*BPUp2_2BackWindRaw)
*ballpen_up2_3BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_3backwind",5,#H2H_ANIMATIONTYPE_NUP,"up 2 3 back wind",0,*BPUp2_3BackWindRaw)
*ballpen_up2_4BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_4backwind",5,#H2H_ANIMATIONTYPE_NUP,"up 2 4 back wind",0,*BPUp2_4BackWindRaw)

*ballpen_up2_1FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_1frontwind",6,#H2H_ANIMATIONTYPE_NUP,"up 2 1 front wind",0,*BPUp2_1FrontWindRaw)
*ballpen_up2_4FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_up2_4frontwind",6,#H2H_ANIMATIONTYPE_NUP,"up 2 4 front wind",0,*BPUp2_4FrontWindRaw)
*ballpen_up2_5FrontWind.animation=classGenerateAnimation(2,"image/hand_ballpen_up2_5frontwind",6,#H2H_ANIMATIONTYPE_NUP,"up 2 5 front wind",0,*BPUp2_5FrontWindRaw)
setFrameMovement(*ballpen_up2_5FrontWind,0,-20)
setFrameMovement(*ballpen_up2_5FrontWind,1,-20)
setFrameMovement(*ballpen_up2_5FrontWind,2,-20)

*ballpen_up2\backWind(1,0)=*ballpen_up2_2BackWind
*ballpen_up2\backWind(2,0)=*ballpen_up2_3BackWind
*ballpen_up2\backWind(3,0)=*ballpen_up2_4BackWind

*ballpen_up2\frontWind(0,0)=*ballpen_up2_1FrontWind
*ballpen_up2\frontWind(3,0)=*ballpen_up2_4FrontWind
*ballpen_up2\frontWind(4,0)=*ballpen_up2_5FrontWind

animationGetNeutral(*ballpen_up2)=*ballpen_neutral6
animationGetSide(*ballpen_up2)=*ballpen_side6

;------- Down 1
*BPDown1.animation=classGenerateAnimation(3,"image/hand_ballpen_down1_",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1",0,*BPDown1Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
setFrameMovement(*BPDown1,0,25,-25)
setFrameMovement(*BPDown1,1,40)
setFrameMovement(*BPDown1,2,-50,50)
setFrameMovement(*BPDown1,3,0,-25)
setFrameCanDoNext(*BPDown1,3,5)
setframestun(*BPDown1,2,15)
setFrameLength(*BPDown1,3,10)
setFrameSound(*BPDown1,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*BPDown1,2,#H2H_SOUND_ID_SWISHMEDIUM)
; animationGetNeutral(*BPDown1)=*ballpen_neutral5
animationGetNeutral(*BPDown1)=*BPNeutral5

*BPDown1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_down1_1WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 1 wind front",0,*BPDown1_1WindFrontRaw)
*BPDown1_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_down1_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 2 wind front",0,*BPDown1_2WindFrontRaw)
*BPDown1_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down1_3WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 1 3 wind front",0,*BPDown1_3WindFrontRaw)

animationPrepareWind(*BPDown1)
*BPDown1\frontWind(0,0)=*BPDown1_1WindFront
*BPDown1\frontWind(1,0)=*BPDown1_2WindFront
*BPDown1\frontWind(2,0)=*BPDown1_3WindFront

animationFreeMovementWind(*BPDown1)

;------- Down 2
; *ballpen_down2.animation=classGenerateAnimation(5,"image/hand_ballpen_down2_",4,#H2H_ANIMATIONTYPE_NDOWN,"down 2",0,*BPdown2Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
; 
; setFrameSound(*ballpen_down2,1,*chineseStaff_AttackS\id)
; setFrameStun(*ballpen_down2,2,15)
; setFrameMovement(*ballpen_down2,2,-80)
; setFramePush(*ballpen_down2,2,-20)
; setFrameStun(*ballpen_down2,3,15)
; setFramePush(*ballpen_down2,3,-20)
; setFrameMovement(*ballpen_down2,3,-80)
; setFrameCanDoNext(*ballpen_down2,3)
; setFrameStun(*ballpen_down2,4,10)
; setFramePush(*ballpen_down2,4,-20)
; setFrameMovement(*ballpen_down2,4,-40)
; setFrameMovement(*ballpen_down2,5,-20)
; 
; ; animationGetDown(*ballpen_neutral1)=*ballpen_down2
; animationGetDown(*BPNeutral1)=*ballpen_down2
; animationGetSide(*ballpen_down2)=*ballpen_side5

*BPDown2.animation=classGenerateAnimation(3,"image/hand_ballpen_down2_",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2",0,*BPDown2Raw,30,#H2H_DAMAGETYPE_BLUNT,6)
setFrameCanDoNext(*BPDown2,3,4)
setFrameLength(*BPDown2,2,6)
setFrameLength(*BPDown2,3,12)
setFrameStun(*BPDown2,2,15)
setFrameMovement(*BPDown2,0,25)
setFrameMovement(*BPDown2,1,66,75)
setFrameMovement(*BPDown2,2,-100,-75)
setFrameMovement(*BPDown2,3,25,25)
setFrameSound(*BPDown2,0,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*BPDown2,2,#H2H_SOUND_ID_SWISHMEDIUM)

*BPDown2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_down2_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 1 wind front",0,*BPDown2_1WindFrontRaw)
*BPDown2_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_down2_2WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 2 wind front",0,*BPDown2_2WindFrontRaw)
setFrameLength(*BPDown2_2WindFront,1,5)
setFrameLength(*BPDown2_2WindFront,2,6)
*BPDown2_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down2_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 2 3 wind front",0,*BPDown2_3WindFrontRaw)
setFrameLength(*BPDown2_3WindFront,1,5)
setFrameLength(*BPDown2_3WindFront,2,6)

animationPrepareWind(*BPDown2,0)
*BPDown2\frontWind(0,0)=*BPDown2_1WindFront
*BPDown2\frontWind(1,0)=*BPDown2_2WindFront
*BPDown2\frontWind(2,0)=*BPDown2_3WindFront

animationFreeMovementWind(*BPDown2)
animationGetDown(*BPNeutral1)=*BPDown2
; animationGetSide(*BPDown2)=*ballpen_side5
animationGetSide(*BPDown2)=*BPSide5

;------- Down 3
*BPDown3.animation=classGenerateAnimation(2,"image/hand_ballpen_down3_",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 3",0,*BPDown3Raw,20,#H2H_DAMAGETYPE_BLUNT,6)
setFrameCanDoNext(*BPDown3,2,7)
setFrameSound(*BPDown3,1,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameSound(*BPDown3,2,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameLength(*BPDown3,0,5)
setFrameLength(*BPDown3,2,13)
animationGetDown(*BPDown1)=*BPDown3
setFrameMovement(*BPDown3,0,-60,-50)
setFrameMovement(*BPDown3,1,-100,-90)
setFrameMovement(*BPDown3,2,30,70)
setFrameStun(*BPDown3,2,18)
setFramePushI(*BPDown3,2,90)
*BPDown3_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_down3_1WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 1 wind front",0,*BPDown3_1WindFrontRaw)
*BPDown3_2WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_down3_2WindFront",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 2 wind front",0,*BPDown3_2WindFrontRaw)
*BPDown3_3WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_down3_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 3 wind front",0,*BPDown3_3WindFrontRaw)
setFrameLength(*BPDown3_3WindFront,1,5)
setFrameLength(*BPDown3_3WindFront,2,6)
setFrameLength(*BPDown3_3WindFront,3,7)
setFrameLength(*BPDown3_3WindFront,4,8)
*BPDown3_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_down3_1WindBack",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 3 1 wind back",0,*BPDown3_1WindBackRaw)

animationPrepareWind(*BPDown3,0)
*BPDown3\frontWind(0,0)=*BPDown3_1WindFront
*BPDown3\frontWind(1,0)=*BPDown3_2WindFront
*BPDown3\frontWind(2,0)=*BPDown3_3WindFront
*BPDown3\backWind(0,0)=*BPDown3_1WindBack
animationFreeMovementWind(*BPDown3)

;------- Down 4
*BPDown4.animation=classGenerateAnimation(4,"image/hand_ballpen_down4_",7,#H2H_ANIMATIONTYPE_NDOWN,"Down 4",0,*BPDown4Raw,12,#H2H_DAMAGETYPE_PIERCE,9)
animationUngrounded(*BPDown4)
animationSetComboEnd(*BPDown4,1)
setFrameSound(*BPDown4,0,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*BPDown4,2,#H2H_SOUND_ID_SWISHMEDIUM)
setFrameMovement(*BPDown4,0,120,-40)
setFrameMovement(*BPDown4,1,-35,-80)
setFrameMovement(*BPDown4,2,-93,88)
setFrameMovement(*BPDown4,3,20,51)
setFrameMovement(*BPDown4,4,20,51)
setFrameLength(*BPDown4,2,12)
setFrameLength(*BPDown4,3,5)
setFrameLength(*BPDown4,4,5)
setFrameDamageDuration(*BPDown4,2,4)
animationGetDown(*BPDown3)=*BPDown4

*BPDown4_3WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_down4_3WindFront",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 3 wind front",0,*BPDown4_3WindFrontRaw)
setFrameLength(*BPDown4_3WindFront,1,4)
setFrameLength(*BPDown4_3WindFront,2,5)
setFrameLength(*BPDown4_3WindFront,3,6)
*BPDown4_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_down4_1WindBack",5,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 1 wind back",0,*BPDown4_1WindBackRaw)
*BPDown4_2WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_down4_2WindBack",4,#H2H_ANIMATIONTYPE_NDOWN,"Down 4 2 wind back",0,*BPDown4_2WindBackRaw)
setFrameLength(*BPDown4_2WindBack,1,5)
setFrameLength(*BPDown4_2WindBack,2,6)
animationPrepareWind(*BPDown4,0)
*BPDown4\frontWind(2,0)=*BPDown4_3WindFront
*BPDown4\backWind(0,0)=*BPDown4_1WindBack
*BPDown4\backWind(1,0)=*BPDown4_2WindBack
animationFreeMovementWind(*BPDown4)

;------- Back 1
*ballpen_back1.animation=classGenerateAnimation(3,"image/hand_ballpen_back1_",5,#H2H_ANIMATIONTYPE_NBACK,"back 1",0,*BPback1Raw,20,#H2H_DAMAGETYPE_CUT,7)
setFrameMovement(*ballpen_back1,0,0,45)
setFrameMovement(*ballpen_back1,1,70,-60)
setFrameMovement(*ballpen_back1,2,90,-45)
setFrameMovement(*ballpen_back1,3,70,10)
setFrameLength(*ballpen_back1,0,4)
setFrameLength(*ballpen_back1,3,20)
setFrameCanDoNext(*ballpen_back1,3,5)
setFrameCanMove(*ballpen_back1,3,5)
setFrameSound(*ballpen_back1,0,#H2H_SOUND_ID_SWISHLIGHT)
*ballpen_back1\frames(3)\damageDuration=4
animationPrepareWind(*ballpen_back1)

*ballpen_back1_1WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_back1_1WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"back 1 1 wind front",0,*BPBack1_1WindFrontRaw)
*ballpen_back1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back1_2WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 2 wind front",0,*BPBack1_2WindFrontRaw)
*ballpen_back1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back1_3WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 3 wind front",0,*BPBack1_3WindFrontRaw)
*ballpen_back1_4WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back1_4WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"back 1 4 wind front",0,*BPBack1_4WindFrontRaw)

*ballpen_back1\frontWind(0,0)=*ballpen_back1_1WindFront
*ballpen_back1\frontWind(1,0)=*ballpen_back1_2WindFront
*ballpen_back1\frontWind(2,0)=*ballpen_back1_3WindFront
*ballpen_back1\frontWind(3,0)=*ballpen_back1_4WindFront
animationFreeMovementWind(*ballpen_back1)

;------- Back 2 new
*ballpen_back2New.animation=classGenerateAnimation(5,"image/hand_ballpen_back2_",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 new",0,*BPback2NewRaw,20,#H2H_DAMAGETYPE_CUT,4)
setFrameSound(*ballpen_back2New,1,#H2H_SOUND_ID_PLASTICSWING)
setFrameMovement(*ballpen_back2New,0,30)
For i=1 To 5
	setFrameMovement(*ballpen_back2New,i,60-i*10)
Next
setFrameLength(*ballpen_back2New,0,5)
setFrameLength(*ballpen_back2New,2,2)
setFrameLength(*ballpen_back2New,3,2)
animationSetComboEnd(*ballpen_back2New,1)
animationGetBack(*ballpen_up1New)=*ballpen_back2New

*ballpen_back2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_1frontwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 2 1 front wind new",0,*BPBack2_1WindFrontRaw)
*ballpen_back2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_2frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 2 front wind new",0,*BPBack2_2WindFrontRaw)
*ballpen_back2_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_3frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 2 3 front wind new",0,*BPBack2_3WindFrontRaw)
*ballpen_back2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_4frontwind",2,#H2H_ANIMATIONTYPE_NBACK,"back 2 4 front wind new",0,*BPBack2_4WindFrontRaw)
*ballpen_back2_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_5frontwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 5 front wind new",0,*BPBack2_5WindFrontRaw)
*ballpen_back2_6WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back2_6frontwind",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 6 front wind new",0,*BPBack2_6WindFrontRaw)

*ballpen_back2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_4backwind",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 4 front wind new",0,*BPBack2_4WindBackRaw)
*ballpen_back2_5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_5backwind",4,#H2H_ANIMATIONTYPE_NBACK,"back 2 5 front wind new",0,*BPBack2_5WindBackRaw)
*ballpen_back2_6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_back2_6backwind",3,#H2H_ANIMATIONTYPE_NBACK,"back 2 6 front wind new",0,*BPBack2_6WindBackRaw)

FreeArray(*ballpen_back2New\frontWind())
Dim *ballpen_back2New\frontWind(5,0)
*ballpen_back2New\frontWind(0,0)=*ballpen_back2_1WindFront
*ballpen_back2New\frontWind(1,0)=*ballpen_back2_2WindFront
*ballpen_back2New\frontWind(2,0)=*ballpen_back2_3WindFront
*ballpen_back2New\frontWind(3,0)=*ballpen_back2_4WindFront
*ballpen_back2New\frontWind(4,0)=*ballpen_back2_5WindFront
*ballpen_back2New\frontWind(5,0)=*ballpen_back2_6WindFront

FreeArray(*ballpen_back2New\backWind())
Dim *ballpen_back2New\backWind(5,0)
*ballpen_back2New\backWind(3,0)=*ballpen_back2_4WindBack
*ballpen_back2New\backWind(4,0)=*ballpen_back2_5WindBack
*ballpen_back2New\backWind(5,0)=*ballpen_back2_6WindBack

;------- Back 3
; *ballpen_back3.animation=classGenerateAnimation(7,"image/hand_ballpen_back3_",5,#H2H_ANIMATIONTYPE_NBACK,"back 3",0,*BPback3Raw,25,#H2H_DAMAGETYPE_CUT,9)
; 
; setFrameDamage(*ballpen_back3,1,5)
; setFrameSound(*ballpen_back3,2,#H2H_SOUND_ID_PLASTICSWING)
; For i=0 To 4
; 	setFrameMovement(*ballpen_back3,i,50)
; Next
; For i=5 To 7
; 	setFrameMovement(*ballpen_back3,i,10)
; Next
; setFrameDamage(*ballpen_back3,3,5)
; setFrameDamage(*ballpen_back3,4,5)
; ; animationGetBack(*ballpen_down2)=*ballpen_back3
; animationGetBack(*BPDown2)=*ballpen_back3
; animationSetComboEnd(*ballpen_back3,1)
*BPBack3.animation=classGenerateAnimation(4,"image/hand_ballpen_back3_",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3",0,*BPBack3Raw,25,#H2H_DAMAGETYPE_CUT,9)
animationSetComboEnd(*BPBack3,#True)
animationGetBack(*BPDown2)=*BPBack3
For i=0 To 4
	setFrameMovement(*BPBack3,i,70-i*5)
Next
setFrameSound(*BPBack3,1,#H2H_SOUND_ID_PLASTICSWING)
setFrameDamage(*BPBack3,3,5)
setFrameDamage(*BPBack3,4,5)
setFrameLength(*BPBack3,0,3)
setFrameLength(*BPBack3,4,10)

*BPBack3_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_1WindFront",3,#H2H_ANIMATIONTYPE_NBACK,"Back 3 1 wind front",0,*BPBack3_1WindFrontRaw)
*BPBack3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_2WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 2 wind front",0,*BPBack3_2WindFrontRaw)
*BPBack3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_3WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 3 wind front",0,*BPBack3_3WindFrontRaw)
*BPBack3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_back3_4WindFront",4,#H2H_ANIMATIONTYPE_NBACK,"Back 3 4 wind front",0,*BPBack3_4WindFrontRaw)
*BPBack3_5WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_back3_5WindFront",5,#H2H_ANIMATIONTYPE_NBACK,"Back 3 5 wind front",0,*BPBack3_5WindFrontRaw)
setFrameMovement(*BPBack3_5WindFront,0,-50)
setFrameMovement(*BPBack3_5WindFront,1,-20)
setFrameMovement(*BPBack3_5WindFront,2,-20)
setFrameLength(*BPBack3_5WindFront,1,6)
setFrameLength(*BPBack3_5WindFront,2,7)

animationPrepareWind(*BPBack3,0)
*BPBack3\frontWind(0,0)=*BPBack3_1WindFront
*BPBack3\frontWind(1,0)=*BPBack3_2WindFront
*BPBack3\frontWind(2,0)=*BPBack3_3WindFront
*BPBack3\frontWind(3,0)=*BPBack3_4WindFront
*BPBack3\frontWind(4,0)=*BPBack3_5WindFront
animationFreeMovementWind(*BPBack3)

;------- Back 4
*ballpen_back4.animation=classGenerateAnimation(6,"image/hand_ballpen_back4_",4,#H2H_ANIMATIONTYPE_NBACK,"back 4",0,*BPback4Raw,20,#H2H_DAMAGETYPE_CUT,5)
enableFrameDamageCut(*ballpen_back4,3)
setFrameLength(*ballpen_back4,6,8)
For i=0 To 6
	setFrameMovement(*ballpen_back4,i,50-i*2)
Next
setFrameSound(*ballpen_back4,1,*chineseStaff_AttackS\id)
setFrameSound(*ballpen_back4,4,*chineseStaff_AttackS\id)
animationGetBack(*ballpen_side1New)=*ballpen_back4
; *ballpen_side1\nBack=*ballpen_back4
animationGetUp(*ballpen_back4)=*ballpen_up2

*ballpen_back4_2BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_2backwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 2 back wind",0,*BPBack4_2BackWindRaw)
*ballpen_back4_3BackWind.animation=classGenerateAnimation(1,"image/hand_ballpen_back4_3backwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 3 back wind",0,*BPBack4_3BackWindRaw)
setFrameMovement(*ballpen_back4_3BackWind,1,-20)
*ballpen_back4_4BackWind.animation=classGenerateAnimation(1,"image/hand_ballpen_back4_4backwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 4 back wind",0,*BPBack4_4BackWindRaw)
setFrameMovement(*ballpen_back4_4BackWind,1,-20)
*ballpen_back4_5BackWind.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_5backwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 5 back wind",0,*BPBack4_5BackWindRaw)

*ballpen_back4_5FrontWind.animation=classGenerateAnimation(0,"image/hand_ballpen_back4_5frontwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 5 front wind",0,*BPBack4_5FrontWindRaw)
*ballpen_back4_6FrontWind.animation=classGenerateAnimation(2,"image/hand_ballpen_back4_6frontwind",5,#H2H_ANIMATIONTYPE_NBACK,"back 4 6 front wind",0,*BPBack4_6FrontWindRaw)
setFrameMovement(*ballpen_back4_6FrontWind,0,-40)
setFrameMovement(*ballpen_back4_6FrontWind,1,-30)
setFrameMovement(*ballpen_back4_6FrontWind,2,-20)

FreeArray(*ballpen_back4\backWind())
Dim *ballpen_back4\backWind(6,0)
*ballpen_back4\backWind(1,0)=*ballpen_back4_2BackWind
*ballpen_back4\backWind(2,0)=*ballpen_back4_3BackWind
*ballpen_back4\backWind(3,0)=*ballpen_back4_4BackWind
*ballpen_back4\backWind(4,0)=*ballpen_back4_5BackWind

FreeArray(*ballpen_back4\frontWind())
Dim *ballpen_back4\frontWind(6,0)
*ballpen_back4\frontWind(4,0)=*ballpen_back4_5FrontWind
*ballpen_back4\frontWind(5,0)=*ballpen_back4_6FrontWind

;------- Heavy 1
*BPHeavy1.animation=classGenerateAnimation(6,"image/hand_ballpen_heavy1_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1",0,*BPHeavy1Raw,40,#H2H_DAMAGETYPE_CUT,10)
setFrameCanDoNext(*BPHeavy1,6,7)
setFrameSound(*BPHeavy1,0,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*BPHeavy1,3,#H2H_SOUND_ID_PLASTICSWING)
setFrameMovement(*BPHeavy1,0,10,-10)
setFrameMovement(*BPHeavy1,1,75,-40)
setFrameMovement(*BPHeavy1,2,50,-30)
setFrameMovement(*BPHeavy1,3,-50,30)
setFrameMovement(*BPHeavy1,4,-75,40)
setFrameMovement(*BPHeavy1,5,-40,10)
setFrameMovement(*BPHeavy1,6,-30)
setFrameLength(*BPHeavy1,2,8)
setFrameLength(*BPHeavy1,3,4)
setFrameLength(*BPHeavy1,4,4)
setFrameLength(*BPHeavy1,5,4)
setFrameLength(*BPHeavy1,6,14)
setFrameDamageDuration(*BPHeavy1,6,4)

*BPHeavy1_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_1WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 1 wind front",0,*BPHeavy1_1WindFrontRaw)
*BPHeavy1_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_2WindFront",5,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 2 wind front",0,*BPHeavy1_2WindFrontRaw)
*BPHeavy1_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_3WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 3 wind front",0,*BPHeavy1_3WindFrontRaw)
*BPHeavy1_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 4 wind front",0,*BPHeavy1_4WindFrontRaw)
*BPHeavy1_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_5WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 5 wind front",0,*BPHeavy1_5WindFrontRaw)
*BPHeavy1_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy1_6WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 6 wind front",0,*BPHeavy1_6WindFrontRaw)
*BPHeavy1_7WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_heavy1_7WindFront",3,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 1 7 wind front",0,*BPHeavy1_7WindFrontRaw)
setFrameLength(*BPHeavy1_7WindFront,1,4)
setFrameLength(*BPHeavy1_7WindFront,2,5)
setFrameLength(*BPHeavy1_7WindFront,3,6)
setFrameLength(*BPHeavy1_7WindFront,4,7)
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
*BPHeavy2.animation=classGenerateAnimation(5,"image/hand_ballpen_heavy2_",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2",0,*BPHeavy2Raw,40,#H2H_DAMAGETYPE_PIERCE,12)
setFrameCanDoNext(*BPHeavy2,5,5)
animationUngrounded(*BPHeavy2)
setFrameMovement(*BPHeavy2,0,25,40)
setFrameMovement(*BPHeavy2,1,10,40)
setFrameMovement(*BPHeavy2,2,25,20)
setFrameMovement(*BPHeavy2,3,-100,-40)
setFrameMovement(*BPHeavy2,4,-50,-30)
setFrameMovement(*BPHeavy2,5,-50,-30)
setFrameLength(*BPHeavy2,2,9)
setFrameLength(*BPHeavy2,3,4)
setFrameLength(*BPHeavy2,5,12)
setFrameSound(*BPHeavy2,1,#H2H_SOUND_ID_SWISHLIGHT)
setFrameSound(*BPHeavy2,3,#H2H_SOUND_ID_SWISHMEDIUM)
animationGetHeavy(*ballpen_back1)=*BPHeavy2

*BPHeavy2_1WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_1WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 1 wind front",0,*BPHeavy2_1WindFrontRaw)
*BPHeavy2_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 2 wind front",0,*BPHeavy2_2WindFrontRaw)
*BPHeavy2_3WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_heavy2_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 3 wind front",0,*BPHeavy2_3WindFrontRaw)
*BPHeavy2_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_4WindFront",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind front",0,*BPHeavy2_4WindFrontRaw)
*BPHeavy2_5WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_heavy2_5WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind front",0,*BPHeavy2_5WindFrontRaw)

*BPHeavy2_4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy2_4WindBack",4,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 4 wind back",0,*BPHeavy2_4WindBackRaw)
*BPHeavy2_5WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_heavy2_5WindBack",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 2 5 wind back",0,*BPHeavy2_5WindBackRaw)

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
setFrameLength(*BPHeavy3,7,8)
setFrameSound(*BPHeavy3,1,#H2H_SOUND_ID_PLASTICSWING)
setFrameSound(*BPHeavy3,4,#H2H_SOUND_ID_PLASTICSWING)
enableFrameDamageCut(*BPHeavy3,4)
setFrameLength(*BPHeavy3,0,9)
setFrameLength(*BPHeavy3,3,9)
setFrameLength(*BPHeavy3,4,8)
setFrameLength(*BPHeavy3,5,7)
; setFrameLength(*BPHeavy3,7,20)
setFrameMovement(*BPHeavy3,0,-10)
setFrameMovement(*BPHeavy3,1,-20,-5)
setFrameMovement(*BPHeavy3,2,-20,-20)
setFrameMovement(*BPHeavy3,3,60,-10)
setFrameMovement(*BPHeavy3,4,-50,35)
setFrameMovement(*BPHeavy3,5,-20,-10)
setFrameMovement(*BPHeavy3,6,0,-30)
*BPHeavy3_2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_2WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 2 wind front",0,*BPHeavy3_2WindFrontRaw)
*BPHeavy3_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_3WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 3 wind front",0,*BPHeavy3_3WindFrontRaw)
*BPHeavy3_4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_4WindFront",9,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 4 wind front",0,*BPHeavy3_4WindFrontRaw)
*BPHeavy3_5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_5WindFront",8,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 5 wind front",0,*BPHeavy3_5WindFrontRaw)
*BPHeavy3_6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_heavy3_6WindFront",7,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 6 wind front",0,*BPHeavy3_6WindFrontRaw)
*BPHeavy3_7WindFront.animation=classGenerateAnimation(3,"image/hand_ballpen_heavy3_7WindFront",6,#H2H_ANIMATIONTYPE_HEAVY,"Heavy 3 7 wind front",0,*BPHeavy3_7WindFrontRaw)
setFrameLength(*BPHeavy3_7WindFront,1,7)
setFrameLength(*BPHeavy3_7WindFront,2,8)
setFrameLength(*BPHeavy3_7WindFront,3,9)
For i=0 To 3
	Debug *BPHeavy3_7WindFront\frames(i)\id
Next

animationPrepareWind(*BPHeavy3,0)
*BPHeavy3\frontWind(1,0)=*BPHeavy3_2WindFront
*BPHeavy3\frontWind(2,0)=*BPHeavy3_3WindFront
*BPHeavy3\frontWind(3,0)=*BPHeavy3_4WindFront
*BPHeavy3\frontWind(4,0)=*BPHeavy3_5WindFront
*BPHeavy3\frontWind(5,0)=*BPHeavy3_6WindFront
*BPHeavy3\frontWind(6,0)=*BPHeavy3_7WindFront
animationGetHeavy(*BPHeavy1)=*BPHeavy3
animationFreeMovementWind(*BPHeavy3)


;------- Hit new
*ballpen_hitnew.animation=classGenerateAnimation(2,"image/hand_ballpen_hit",6,#H2H_ANIMATIONTYPE_HIT,"hit",0,*BPHitNewRaw)

;------ death
*ballpen_DeathNew.animation=classGenerateAnimation(8,"image/hand_ballpen_death",6,#H2H_ANIMATIONTYPE_DEATH,"death new",0,*BPDeathNewRaw)
setFrameMovement(*ballpen_DeathNew,1,50)
setFrameMovement(*ballpen_DeathNew,5,75)
setFrameSound(*ballpen_DeathNew,3,*penfallSound1\id)
setFrameSound(*ballpen_DeathNew,5,*bodyFallSound\id)
setFrameSound(*ballpen_DeathNew,6,*penfallSound2\id)
setFrameSound(*ballpen_DeathNew,7,*bodyFallSound\id)
setFrameSound(*ballpen_DeathNew,8,*penfallSound3\id)
setFrameLength(*ballpen_DeathNew,3,10)
setFrameLength(*ballpen_DeathNew,4,10)

animationPrepareWind(*ballpen_DeathNew,2)

*ballpen_Death2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death2windback",6,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind back",0,*BPDeath2WindBackRaw)
*ballpen_Death3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death3windback",6,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind back",0,*BPDeath3WindBackRaw)
*ballpen_Death4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death4windback",10,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind back",0,*BPDeath4WindBackRaw)
*ballpen_Death5WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death5windback",10,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind back",0,*BPDeath5WindBackRaw)
*ballpen_Death6_1WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windback1_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind back 1",0,*BPDeath6_1WindBackRaw)
*ballpen_Death6_2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windback2_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind back 2",0,*BPDeath6_2WindBackRaw)

*ballpen_Death2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death2windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 2 wind front",0,*BPDeath2WindFrontRaw)
*ballpen_Death3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death3windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 3 wind front",0,*BPDeath3WindFrontRaw)
*ballpen_Death4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death4windfront",10,#H2H_ANIMATIONTYPE_DEATH,"death 4 wind front",0,*BPDeath4WindFrontRaw)
*ballpen_Death5WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death5windfront",10,#H2H_ANIMATIONTYPE_DEATH,"death 5 wind front",0,*BPDeath5WindFrontRaw)
*ballpen_Death6_1WindFront.animation=classGenerateAnimation(4,"image/hand_ballpen_death6windfront1_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 1",0,*BPDeath6_1WindFrontRaw)
setFrameMovement(*ballpen_Death6_1WindFront,0,75)
setFrameMovement(*ballpen_Death6_1WindFront,1,50)
setFrameMovement(*ballpen_Death6_1WindFront,2,40)
setFrameMovement(*ballpen_Death6_1WindFront,4,20)
*ballpen_Death6_2WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_death6windfront2_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 2",0,*BPDeath6_2WindFrontRaw)
setFrameMovement(*ballpen_Death6_2WindFront,1,100)
*ballpen_Death6_3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death6windfront3_",6,#H2H_ANIMATIONTYPE_DEATH,"death 6 wind front 3",0,*BPDeath6_3WindFrontRaw)
*ballpen_Death7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_death7windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 7 wind front",0,*BPDeath7WindFrontRaw)
*ballpen_Death8WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_death8windfront",6,#H2H_ANIMATIONTYPE_DEATH,"death 8 wind front",0,*BPDeath8WindFrontRaw)

*ballpen_DeathNew\backWind(1,0)=*ballpen_Death2WindBack
*ballpen_DeathNew\backWind(2,0)=*ballpen_Death3WindBack
*ballpen_DeathNew\backWind(3,0)=*ballpen_Death4WindBack
*ballpen_DeathNew\backWind(4,0)=*ballpen_Death5WindBack
*ballpen_DeathNew\backWind(5,0)=*ballpen_Death6_1WindBack
*ballpen_DeathNew\backWind(5,1)=*ballpen_Death6_2WindBack

*ballpen_DeathNew\frontWind(1,0)=*ballpen_Death2WindFront
*ballpen_DeathNew\frontWind(2,0)=*ballpen_Death3WindFront
*ballpen_DeathNew\frontWind(3,0)=*ballpen_Death4WindFront
*ballpen_DeathNew\frontWind(4,0)=*ballpen_Death5WindFront
*ballpen_DeathNew\frontWind(5,0)=*ballpen_Death6_1WindFront
*ballpen_DeathNew\frontWind(5,1)=*ballpen_Death6_2WindFront
*ballpen_DeathNew\frontWind(5,2)=*ballpen_Death6_3WindFront
*ballpen_DeathNew\frontWind(6,0)=*ballpen_Death7WindFront
*ballpen_DeathNew\frontWind(7,0)=*ballpen_Death8WindFront

animationFreeMovementWind(*ballpen_DeathNew)

setFrameShadow(*ballpen_DeathNew,0,10)
setFrameShadow(*ballpen_DeathNew,1,20,-20)
setFrameShadow(*ballpen_DeathNew,2,30,-50)
setFrameShadow(*ballpen_DeathNew,3,50,-40)
setFrameShadow(*ballpen_DeathNew,4,70,-30)
setFrameShadow(*ballpen_DeathNew,5,100,50)
setFrameShadow(*ballpen_DeathNew,6,125,75)
setFrameShadow(*ballpen_DeathNew,7,125,75)
setFrameShadow(*ballpen_DeathNew,8,125,75)

;------ spawn new
*ballpen_SpawnNew.animation=classGenerateAnimation(11,"image/hand_ballpen_spawn",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn new",0,*BPSpawnNewRaw)
animationPrepareWind(*ballpen_SpawnNew)
setFrameLength(*ballpen_SpawnNew,0,25)
setFrameLength(*ballpen_SpawnNew,4,25)
setFrameSound(*ballpen_SpawnNew,1,*chineseStaff_HeavyS\id)
setFrameSound(*ballpen_SpawnNew,7,#H2H_SOUND_ID_PLASTICSWING)

*ballpen_Spawn2WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn2WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 2 wind back",0,*BPSpawn2WindBackRaw)
*ballpen_Spawn3WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn3WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 3 wind back",0,*BPSpawn3WindBackRaw)
*ballpen_Spawn4WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn4WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind back",0,*BPSpawn4WindBackRaw)
*ballpen_Spawn5WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn5WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind back",0,*BPSpawn5WindBackRaw)
*ballpen_Spawn6WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn6WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind back",0,*BPSpawn6WindBackRaw)
*ballpen_Spawn7WindBack.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn7WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind back",0,*BPSpawn7WindBackRaw)
*ballpen_Spawn8WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn8WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind back",0,*BPSpawn8WindBackRaw)
*ballpen_Spawn9WindBack.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn9WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind back",0,*BPSpawn9WindBackRaw)
*ballpen_Spawn12WindBack.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn12WindBack",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind back",0,*BPSpawn12WindBackRaw)

*ballpen_Spawn2WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn2WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 2 wind front",0,*BPSpawn2WindFrontRaw)
*ballpen_Spawn3WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn3WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 3 wind front",0,*BPSpawn3WindFrontRaw)
*ballpen_Spawn4WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn4WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 4 wind front",0,*BPSpawn4WindFrontRaw)
*ballpen_Spawn5WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn5WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 5 wind front",0,*BPSpawn5WindFrontRaw)
*ballpen_Spawn6WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn6WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 6 wind front",0,*BPSpawn6WindFrontRaw)
*ballpen_Spawn7WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn7WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 7 wind front",0,*BPSpawn7WindFrontRaw)
*ballpen_Spawn8WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn8WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 8 wind front",0,*BPSpawn8WindFrontRaw)
*ballpen_Spawn9WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn9WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 9 wind front",0,*BPSpawn9WindFrontRaw)
*ballpen_Spawn10WindFront.animation=classGenerateAnimation(1,"image/hand_ballpen_spawn10WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 10 wind front",0,*BPSpawn10WindFrontRaw)
*ballpen_Spawn11WindFront.animation=classGenerateAnimation(0,"image/hand_ballpen_spawn11WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 11 wind front",0,*BPSpawn11WindFrontRaw)
*ballpen_Spawn12WindFront.animation=classGenerateAnimation(2,"image/hand_ballpen_spawn12WindFront",6,#H2H_ANIMATIONTYPE_SPAWN,"spawn 12 wind front",0,*BPSpawn12WindFrontRaw)

*ballpen_SpawnNew\backWind(1,0)=*ballpen_Spawn2WindBack
*ballpen_SpawnNew\backWind(2,0)=*ballpen_Spawn3WindBack
*ballpen_SpawnNew\backWind(3,0)=*ballpen_Spawn4WindBack
*ballpen_SpawnNew\backWind(4,0)=*ballpen_Spawn5WindBack
*ballpen_SpawnNew\backWind(5,0)=*ballpen_Spawn6WindBack
*ballpen_SpawnNew\backWind(6,0)=*ballpen_Spawn7WindBack
*ballpen_SpawnNew\backWind(7,0)=*ballpen_Spawn8WindBack
*ballpen_SpawnNew\backWind(8,0)=*ballpen_Spawn9WindBack
*ballpen_SpawnNew\backWind(11,0)=*ballpen_Spawn12WindBack

*ballpen_SpawnNew\frontWind(1,0)=*ballpen_Spawn2WindFront
*ballpen_SpawnNew\frontWind(2,0)=*ballpen_Spawn3WindFront
*ballpen_SpawnNew\frontWind(3,0)=*ballpen_Spawn4WindFront
*ballpen_SpawnNew\frontWind(4,0)=*ballpen_Spawn5WindFront
*ballpen_SpawnNew\frontWind(5,0)=*ballpen_Spawn6WindFront
*ballpen_SpawnNew\frontWind(6,0)=*ballpen_Spawn7WindFront
*ballpen_SpawnNew\frontWind(7,0)=*ballpen_Spawn8WindFront
*ballpen_SpawnNew\frontWind(8,0)=*ballpen_Spawn9WindFront
*ballpen_SpawnNew\frontWind(9,0)=*ballpen_Spawn10WindFront
*ballpen_SpawnNew\frontWind(10,0)=*ballpen_Spawn11WindFront
*ballpen_SpawnNew\frontWind(11,0)=*ballpen_Spawn12WindFront

For i=8 To 11
	setFrameLength(*ballpen_SpawnNew,i,4)
	If *ballpen_SpawnNew\frontWind(i,0)
		For j=0 To ArraySize(*ballpen_SpawnNew\frontWind(i,0)\frames())
			setFrameLength(*ballpen_SpawnNew\frontWind(i,0),j,4)
		Next
	EndIf
	If *ballpen_SpawnNew\backWind(i,0)
		For j=0 To ArraySize(*ballpen_SpawnNew\backWind(i,0)\frames())
			setFrameLength(*ballpen_SpawnNew\backWind(i,0),j,4)
		Next
	EndIf
Next

;------ jump new
*ballpen_JumpNew.animation=classGenerateAnimation(6,"image/hand_ballpen_jump",50,#H2H_ANIMATIONTYPE_JUMP,"jump",0,*BPJumpNewRaw)

;------ land new
*ballpen_LandNew.animation=classGenerateAnimation(3,"image/hand_ballpen_land",5,#H2H_ANIMATIONTYPE_LAND,"land new",0,*BPLandNewRaw)
setFrameLength(*ballpen_LandNew,0,2)
setFrameLength(*ballpen_LandNew,1,4)
frameShiftShift(*ballpen_LandNew,1,0,10)
frameShiftShift(*ballpen_LandNew,2,0,30)
frameShiftShift(*ballpen_LandNew,3,0,10)
setFrameShadow(*ballpen_LandNew,0,0,200)
setFrameShadow(*ballpen_LandNew,1,0,100)
setFrameShadow(*ballpen_LandNew,2,0,50)
setFrameShadow(*ballpen_LandNew,3,0,25)

;------ dodge
*BPDodge.animation=classGenerateAnimation(2,"image/hand_ballpen_dodge",10,#H2H_ANIMATIONTYPE_DODGE,"Dodge",0,*BPDodgeRaw,8,#H2H_DAMAGETYPE_CUT,5)
setFrameLength(*BPDodge,0,2)
setFrameLength(*BPDodge,1,2)

;------ branch
#H2H_BALLPEN_SIDE_BLADE=0
#H2H_BALLPEN_SIDE_UNHARMED=1
*ballpen_stat.statistic=statisticCreate(0,2,3,2,1,1,0,4,3,2,2,1)
ReDim *tmpArray(1)
*tmpArray(#H2H_BALLPEN_SIDE_BLADE)=*plastic_hit
*tmpArray(#H2H_BALLPEN_SIDE_UNHARMED)=*finger_hit
*ballpen_stance_blue.stance=stanceCreate(*tmpArray(),0,"Blue")
*ballpen_stance_blue\specialcolor=#H2H_STANCE_COLOR_BLUE
*ballpen_stance_blue\alternatecolor=#H2H_STANCE_COLOR_LIGHTBLUE
statisticCreate(*ballpen_stance_blue\modificator,0,1,0,-1,0,0,0,0,0,0)

*ballpen_stance_green.stance=stanceCreate(*tmpArray(),0,"Green")
*ballpen_stance_green\specialcolor=#H2H_STANCE_COLOR_GREEN
*ballpen_stance_green\alternatecolor=#H2H_STANCE_COLOR_LIGHTGREEN
statisticCreate(*ballpen_stance_green\modificator,-1,1,1,-1,0,0,0,0,0,0)

*ballpen_stance_red.stance=stanceCreate(*tmpArray(),0,"Red")
*ballpen_stance_red\specialcolor=#H2H_STANCE_COLOR_RED
*ballpen_stance_red\alternatecolor=#H2H_STANCE_COLOR_LIGHTRED
statisticCreate(*ballpen_stance_red\modificator,1,0,-1,0,0,0,0,0,0,0)

*ballpen.class=classCreate(0,"Ballpen",*ballpen_Idle1,*ballpen_MoveFront,*ballpen_MoveBack,*BPNeutral1,*ballpen_side1New,*ballpen_up1New,*ballpen_back1,*BPDown1,*BPHeavy1)
*ballpen\allStances(0)\name="Black (default)"
*ballpen\allStances(0)\specialcolor=#H2H_STANCE_COLOR_BLACK
*ballpen\allStances(0)\specialTransparency=160
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
*ballpen\desc$="All rounder swordsman. Good offense and pary but excells at nothing.\Intuitive use of combos for quick adaptations between attacking and dogding\dangerous attacks which can't be tanked well by the Ballpen weilder."

classGetDeath(*ballpen)=*ballpen_DeathNew
classGetSpawn(*ballpen)=*ballpen_SpawnNew
classGetJump(*ballpen)=*ballpen_JumpNew
classGetLand(*ballpen)=*ballpen_LandNew
classGetHit(*ballpen)=*ballpen_hitnew
classGetDodge(*ballpen)=*BPDodge

Dim *ballpen\otherIdle(1)
*ballpen\otherIdle(0)=*ballpen_Idle2
*ballpen\otherIdle(1)=*ballpen_Idle3
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 652
; FirstLine = 628
; Folding = -
; EnableXP
; CPU = 1