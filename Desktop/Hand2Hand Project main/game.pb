Enumeration 0
	#H2H_GAME_1V1
	#H2H_GAME_1VBOT
	#H2H_GAME_1VBOTS
EndEnumeration

#H2H_GAME_1VBOTS_AMOUNT=10

Structure game
	List *allGroups.group()
	name$
	*terrain.background
	type.i
EndStructure

Global *mainGame.game

Declare gameCreate1v1(*game.game,*where.background,versusBot.i)
Procedure gameCreate(*newGame.game,newName$,*newTerrain.background,newType.i=#H2H_GAME_1V1)
	If Not *newTerrain
		ProcedureReturn *newGame
	EndIf
	If Not *newGame
		*newGame=AllocateStructure(game)
	Else
		FreeList(*newGame\allGroups())
	EndIf
	NewList *newGame\allGroups()
	Debug "game created "+ListSize(*newGame\allGroups())
	*newGame\name$=newName$
	*newGame\terrain=*newTerrain
	*newGame\type=newType
; 	If newType=#H2H_GAME_1V1
; 		gameCreate1v1(*newGame,*newTerrain,0)
; 	EndIf
; 	If newType=#H2H_GAME_1VBOT
; 		gameCreate1v1(*newGame,*newTerrain,1)
; 	EndIf
; 	If newType=#H2H_GAME_1VBOTS
; 		;gameCreate1vMany(*newGame,*newTerrain,#H2H_GAME_1VBOTS_AMOUNT)
; 	EndIf
	ProcedureReturn *newGame
EndProcedure

Procedure gameAddGroup(*what.game,*group.group=0,name$="no name")
	If Not *group
		*group=groupCreate(*group,name$)
	EndIf
	AddElement(*what\allGroups())
	*what\allGroups()=*group
	Debug "grouped the "+*what\allGroups()
	ProcedureReturn *group
EndProcedure

Procedure gameGetGroup(*what.game,index.i)
	If ListSize(*what\allGroups())
		SelectElement(*what\allGroups(),index)
		ProcedureReturn *what\allGroups()
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure gameAddPlayer(*what.game,index.i,*p.player)
	groupAddPlayer(gameGetGroup(*what,index),*p)
EndProcedure

Procedure gameUnload(*what.game)
	ForEach *what\allGroups()
		ForEach *what\allGroups()\players()
			Debug "UNLOADING "+*what\allGroups()\players()
			classUnload(*what\allGroups()\players()\class,#True)
			clearPlayerFrames(*what\allGroups()\players())
		Next
	Next
EndProcedure

Procedure gameDestroy(*what.game)
	If Not *what
		ProcedureReturn
	EndIf
	ForEach *what\allGroups()
		groupDestroy(*what\allGroups())
	Next
	FreeList(*what\allGroups())
	FreeStructure(*what)
EndProcedure

; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 17
; FirstLine = 15
; Folding = --
; EnableXP
; DPIAware