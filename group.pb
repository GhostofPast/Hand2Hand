Structure group
	List *players.player()
	name$
	List *enemies.group()
EndStructure

Procedure.i groupCreate(*whatGroup.group,newName$)
	If Not *whatGroup
		*whatGroup=AllocateStructure(group)
	EndIf
	NewList *whatGroup\players()
	*whatGroup\name$=newName$
	NewList *whatGroup\enemies()
	ProcedureReturn *whatGroup
EndProcedure

Procedure.i groupAddPlayer(*what.group,*who.player)
	If Not *what Or Not *who
		Debug "No "+*what+" "+*who
		ProcedureReturn 2
	EndIf
	; return 1 if failed
	If ListSize(*what\players())
		ForEach *what\players()
			If *what\players()=*who
				Debug "already inside"
				ProcedureReturn 1
			EndIf
		Next
	EndIf
	AddElement(*what\players())
	*what\players()=*who
	ProcedureReturn 0
EndProcedure

Procedure groupAddPlayers(*what.group,*withWhat.group)
	If Not *what Or Not *withWhat
		ProcedureReturn
	EndIf
	NewList *copy.player()
	CopyList(*withWhat\players(),*copy())
	ForEach *what\players()
		ForEach *copy()
			If *what\players()=*copy()
				DeleteElement(*copy())
			EndIf
		Next
	Next
	ForEach *copy()
		AddElement(*what\players())
		*what\players()=*copy()
	Next
	FreeList(*copy())
EndProcedure

Procedure groupRemovePlayer(*what.group,*who.player)
	If Not *what Or Not *who
		ProcedureReturn 2
	EndIf
	; return 1 if failed
	ForEach *what\players()
		If *what\players()=*who
			DeleteElement(*what\players())
			ProcedureReturn 0
		EndIf
	Next
	ProcedureReturn 1
EndProcedure

Procedure groupRemovePlayers(*what.group,*withWhat.group)
	If Not *what Or Not *withWhat
		ProcedureReturn
	EndIf
	If *what=*withWhat
		ClearList(*what\players())
	EndIf
	NewList *copy.player()
	CopyList(*withWhat\players(),*copy())
	ForEach *what\players()
		ForEach *copy()
			If *what\players()=*copy()
				DeleteElement(*what\players())
				DeleteElement(*copy())
			EndIf
		Next
	Next
	FreeList(*copy())
EndProcedure

Procedure groupSetEnemy(*what.group,*enemy.group)
	If Not *what Or Not *enemy
		ProcedureReturn
	EndIf
	If *what=*enemy
		ProcedureReturn
	EndIf
	ForEach *what\enemies()
		If *what\enemies()=*enemy
			ProcedureReturn
		EndIf
	Next
	AddElement(*what\enemies())
	*what\enemies()=*enemy
EndProcedure

Procedure groupDestroy(*what.group)
	If Not *what
		ProcedureReturn
	EndIf
	FreeList(*what\players())
	FreeList(*what\enemies())
	FreeStructure(*what)
EndProcedure

Macro isPlayerAlive(p)
	Bool(p\life>0)
EndMacro

Declare playerAttack(*attacker.player,*defender.player,delta.d=1)
Procedure groupAttack(*what.group,*enemy.group)
	If Not *what Or Not *enemy
		ProcedureReturn
	EndIf
	If *what=*enemy
		ProcedureReturn
	EndIf
	NewList *defender.player()
	CopyList(*enemy\players(),*defender())
	ForEach *what\players()
		If Not isPlayerAlive(*what\players())
			Continue
		EndIf
		ForEach *defender()
			If Not isPlayerAlive(*defender())
				DeleteElement(*defender())
				Continue
			EndIf
			playerAttack(*what\players(),*defender())
			playerAttack(*defender(),*what\players())
		Next
	Next
	FreeList(*defender())
EndProcedure

Procedure groupAttackAll(*what.group)
	If Not *what
		ProcedureReturn
	EndIf
	ForEach *what\enemies()
		groupAttack(*what,*what\enemies())
	Next
EndProcedure

Procedure groupFFA(*what.group)
	If Not *what
		ProcedureReturn
	EndIf
	NewList *defender.player()
	CopyList(*what\players(),*defender())
	ForEach *what\players()
		If Not isPlayerAlive(*what\players())
			Continue
		EndIf
		ForEach *defender()
			If Not isPlayerAlive(*defender())
				DeleteElement(*defender())
				Continue
			EndIf
			If *what\players()<>*defender()
				playerAttack(*what\players(),*defender())
				playerAttack(*defender(),*what\players())
			EndIf
		Next
	Next
	FreeList(*defender())
EndProcedure
Declare createPlayer(*p.player,name.s,color.i,*control.control,*newClass.class,mirror=0)
Declare playerSetClass(*p.player,*newClass.class,stanceId.i)
Procedure groupSpawn(*whatClass.class,*whatStance.stance,number.i=1,*what.group=0)
	If Not *what
		*what=groupCreate(0,"Group of "+number+" "+*whatClass\name+" "+*whatStance\name)
	EndIf
	For i=1 To number
		AddElement(*what\players())
		*what\players()=createPlayer(0,"unnamed",0,0,*whatClass)
		playerSetClass(*what\players(),*whatClass,*whatStance\id)
	Next
	ProcedureReturn *what
EndProcedure

Procedure groupPurge(*what.group)
	ForEach *what\players()
		If Not isPlayerAlive(*what\players())
			DeleteElement(*what\players())
		EndIf
	Next
EndProcedure

Procedure groupFuse(*what.group,*withWhat.group)
	If *what And Not *withWhat
		ProcedureReturn *what
	EndIf
	If Not *what And *withWhat
		ProcedureReturn *withWhat
	EndIf
	groupAddPlayers(*what,*withWhat)
	ForEach *what\enemies()
		ForEach *withWhat\enemies()
			If *what\enemies()=*withWhat\enemies()
				DeleteElement(*what\enemies())
			EndIf
		Next
	Next
	ForEach *withWhat\enemies()
		AddElement(*what\enemies())
		*what\enemies()=*withWhat\enemies()
	Next
	groupDestroy(*withWhat)
	ProcedureReturn *what
EndProcedure

Procedure.i groupIsAlive(*what.group)
	ForEach *what\players()
		If isPlayerAlive(*what\players())
			ProcedureReturn 1
		EndIf
	Next
	ProcedureReturn 0
EndProcedure

Procedure.i groupIsDead(*what.group)
	ForEach *what\players()
		If isPlayerAlive(*what\players())
			ProcedureReturn 0
		EndIf
	Next
	ProcedureReturn 1
EndProcedure

Declare refreshPlayer(*p.player,*b.background,delta.d=1,previousDelta.d=1)
Procedure groupRefresh(*what.group,*b.background)
	ForEach *what\players()
		refreshPlayer(*what\players(),*b.background)
	Next
EndProcedure

Declare checkPlayerFacing(*player1.player=0,*player2.player=0)
Procedure groupFacePlayer(*what.group,*p.player)
	ForEach *what\players()
		checkPlayerFacing(*what\players(),*p)
	Next
EndProcedure

Procedure.f playerDistanceX(*p1.player,*p2.player)
	If Not *p1 Or Not *p2
		ProcedureReturn 0
	EndIf
	ProcedureReturn locationDistanceX(*p1\position,*p2\position)
EndProcedure

Procedure.f playerDistanceY(*p1.player,*p2.player)
	If Not *p1 Or Not *p2
		ProcedureReturn 0
	EndIf
	ProcedureReturn locationDistanceY(*p1\position,*p2\position)
EndProcedure

Procedure.f playerDistanceLoc(*p.player,*l.location)
	If Not *p Or Not *l
		ProcedureReturn 0
	EndIf
	ProcedureReturn locationDistance(*p\position,*l)
EndProcedure

Procedure.f playerDistance(*p1.player,*p2.player)
	ProcedureReturn playerDistanceLoc(*p1,*p2\position)
EndProcedure

#H2H_DISTANCE_MODE_ALL=0
#H2H_DISTANCE_MODE_X=1
#H2H_DISTANCE_MODE_Y=2
Procedure groupGetClosestPlayer(*p.player,*where.group,mode.i=#H2H_DISTANCE_MODE_ALL)
	If Not *p Or Not *where	
		ProcedureReturn 0
	EndIf
	*closest.player
	distance.f=99999
	Select mode
	Case #H2H_DISTANCE_MODE_ALL:
		ForEach *where\players()
			If *p<>*where\players()
				If Not *closest
					*closest=*where\players()
					Continue
				EndIf
				newDistance.f=playerDistance(*where\players(),*closest)
				If newDistance<distance
					distance=newDistance
					*closest=*where\players()
				EndIf
			EndIf
		Next
	Case #H2H_DISTANCE_MODE_X:
		ForEach *where\players()
			If *p<>*where\players()
				If Not *closest
					*closest=*where\players()
					Continue
				EndIf
				newDistance.f=playerDistanceX(*where\players(),*closest)
				If newDistance<distance
					distance=newDistance
					*closest=*where\players()
				EndIf
			EndIf
		Next
	Case #H2H_DISTANCE_MODE_Y:
		ForEach *where\players()
			If *p<>*where\players()
				If Not *closest
					*closest=*where\players()
					Continue
				EndIf
				newDistance.f=playerDistanceY(*where\players(),*closest)
				If newDistance<distance
					distance=newDistance
					*closest=*where\players()
				EndIf
			EndIf
		Next
	EndSelect
	ProcedureReturn *closest
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 117
; FirstLine = 97
; Folding = ----
; EnableXP
; DPIAware