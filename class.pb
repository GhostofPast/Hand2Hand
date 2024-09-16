Global classIndex=0
; #H2H_STAT_NBLEVEL=8
; Global Dim statLevel(#H2H_STAT_NBLEVEL)

Global Dim statIconMini(#H2H_ICON_DIFFICULTY)
Global Dim statIcon(#H2H_ICON_DIFFICULTY)
;--- statistic struct
Structure statistic
	strength.i
	agility.i
	speed.i
	weight.i
	endurence.i
	life.i
	cut.i
	pierce.i
	blunt.i
	reach.i
	difficulty.i
EndStructure

Procedure statisticCreate(*s.statistic=0,newStrength.i=2,newAgility.i=2,newSpeed.i=2,newWeight.i=2,newEndurence.i=2,newLife.i=2,newCut.i=2,newPierce.i=2,newBlunt.i=2,newReach.i=2,newDifficulty.i=2)
	If Not *s
		*s=AllocateStructure(statistic)
		;ResetStructure(*s,statistic)
	EndIf
	*s\strength=newStrength
	*s\agility=newAgility
	*s\speed=newSpeed
	*s\weight=newWeight
	*s\endurence=newEndurence
	*s\life=newLife
	*s\cut=newCut
	*s\pierce=newPierce
	*s\blunt=newBlunt
	*s\reach=newReach
	*s\difficulty=newDifficulty
	ProcedureReturn *s
EndProcedure

Procedure statisticCopy(*s1.statistic,*s2.statistic)
	If *s1 And *s2
		CopyStructure(*s2,*s1,statistic)
	EndIf
EndProcedure

#H2H_JSON_STATISTIC_STRENGTH="strength"
#H2H_JSON_STATISTIC_AGILITY="agility"
#H2H_JSON_STATISTIC_SPEED="speed"
#H2H_JSON_STATISTIC_WEIGHT="weight"
#H2H_JSON_STATISTIC_ENDURENCE="endurence"
#H2H_JSON_STATISTIC_LIFE="life"
#H2H_JSON_STATISTIC_CUT="cut"
#H2H_JSON_STATISTIC_PIERCE="pierce"
#H2H_JSON_STATISTIC_BLUNT="blunt"
#H2H_JSON_STATISTIC_REACH="reach"
#H2H_JSON_STATISTIC_DIFFICULTY="difficulty"

Procedure statisticExportJSON(*parent,*s.statistic)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_STRENGTH,*s\strength		,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_AGILITY,*s\agility		,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_SPEED,*s\speed			,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_WEIGHT,*s\weight			,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_ENDURENCE,*s\endurence	,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_LIFE,*s\life				,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_CUT,*s\cut				,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_PIERCE,*s\pierce			,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_BLUNT,*s\blunt			,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_REACH,*s\reach			,#True)
	addJSONInteger(*parent,#H2H_JSON_STATISTIC_DIFFICULTY,*s\difficulty ,#True)
	ProcedureReturn *parent
EndProcedure

Procedure statisticJSONImport(*parent,*s.statistic=0)
	If Not *parent
		ProcedureReturn #Null
	EndIf
	If Not *s
		*s=AllocateStructure(statistic)
		ClearStructure(*s,statistic)
	EndIf
	*s\strength=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_STRENGTH)
	*s\agility=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_AGILITY)
	*s\speed=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_SPEED)
	*s\weight=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_WEIGHT)
	*s\endurence=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_ENDURENCE)
	*s\life=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_LIFE)
	*s\cut=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_CUT)
	*s\pierce=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_PIERCE)
	*s\blunt=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_BLUNT)
	*s\reach=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_REACH)
	*s\difficulty=loadJSONInteger(*parent,#H2H_JSON_STATISTIC_DIFFICULTY)
	ProcedureReturn *s
EndProcedure

Global nbStance=0
;--- material enum
Enumeration 1
	#H2H_MATERIAL_WOOD
	#H2H_MATERIAL_PLASTIC
	#H2H_MATERIAL_METAL
	#H2H_MATERIAL_FLESH
	#H2H_MATERIAL_GUM
	#H2H_MATERIAL_STRING
EndEnumeration

;--- stance struct
Structure stance
	id.i
	name.s
	*modificator.statistic
	Array *materialClass.hitSoundMaterial(0)
	specialcolor.i
	specialTransparency.i
	alternatecolor.i
	alternateTransparency.i
EndStructure
#H2H_JSON_STANCE_ID="id"
#H2H_JSON_STANCE_NAME="name"
#H2H_JSON_STANCE_COLOR="specialColor"
#H2H_JSON_STANCE_COLOR_TRANSPARENCY="specialTransparency"
#H2H_JSON_STANCE_ALTERNATE="alternateColor"
#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY="alternateTransparency"
#H2H_JSON_STANCE_MATERIAL="material"
#H2H_JSON_STANCE_STAT="modificator"
Procedure stanceExportJSON(*parent,*s.stance)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONString(*parent,#H2H_JSON_STANCE_NAME,*s\name)
	addJSONInteger(*parent,#H2H_JSON_STANCE_ID,*s\id										,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_COLOR,*s\specialcolor							,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_COLOR_TRANSPARENCY,*s\specialTransparency		,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE,*s\alternatecolor						,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY,*s\alternateTransparency	,#True)
	statisticExportJSON(*parent,*s\modificator)
	statisticExportJSON(addJSONObject(*parent,#H2H_JSON_STANCE_STAT),*s\modificator)
	*array=AddJSONMember(*parent,#H2H_JSON_STANCE_MATERIAL)
	SetJSONArray(*array)
	For s=0 To ArraySize(*s\materialClass())
		*e=AddJSONElement(*array)
		SetJSONInteger(*e,*s\materialClass(s)\id)
	Next
	ProcedureReturn *parent
EndProcedure

Procedure stanceJSONImport(*parent,*s.stance=0)
	If Not *parent
		ProcedureReturn #Null
	EndIf
	If Not *s
		*s=AllocateStructure(stance)
		ClearStructure(*s,stance)
	EndIf
	*s\name=loadJSONString(*parent,#H2H_JSON_STANCE_NAME)
	*s\id=loadJSONInteger(*parent,#H2H_JSON_STANCE_ID)
	*s\specialcolor=loadJSONInteger(*parent,#H2H_JSON_STANCE_COLOR)
	*s\specialTransparency=loadJSONInteger(*parent,#H2H_JSON_STANCE_COLOR_TRANSPARENCY)
	*s\alternatecolor=loadJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE)
	*s\alternateTransparency=loadJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY)
	*s\modificator=statisticJSONImport(GetJSONMember(*parent,#H2H_JSON_STANCE_STAT))
	*array=GetJSONMember(*parent,#H2H_JSON_STANCE_MATERIAL)
	If *array
		size=JSONArraySize(*array)
		Dim *s\materialClass(size-1)
		For m=0 To size-1
			*s\materialClass(m)=*allMaterials(GetJSONInteger(GetJSONElement(*array,m)))
		Next
	EndIf
	ProcedureReturn *s
EndProcedure

Procedure stanceCopy(*s1.stance,*s2.stance)
	If *s1 And *s2
		CopyStructure(*s2,*s1,stance)
	EndIf
EndProcedure

Procedure stanceCreate(Array *hitMaterialSides.hitSoundMaterial(1),*s.stance=0,newName$="", *newStats.statistic=0)
	If Not *s
		*s=AllocateStructure(stance)
		ResetStructure(*s,stance)
	EndIf
	*s\specialcolor=0
	*s\id=nbStance
	nbStance+1
	*s\name=newName$
	*s\specialTransparency=128
	*s\alternateTransparency=128
	*s\modificator=AllocateStructure(statistic)
	If *newStats=0
		statisticCreate(*s\modificator,0,0,0,0,0,0,0,0,0,0)
	Else
		statisticCopy(*s\modificator,*newStats)
	EndIf
	ReDim *s\materialClass(ArraySize(*hitMaterialSides()))
	For i=0 To ArraySize(*hitMaterialSides())
		*s\materialClass(i)=*hitMaterialSides(i)
	Next
	ProcedureReturn *s
EndProcedure

Procedure stanceAddSoundMaterial(*s.stance,*newHit.hitSoundMaterial)
	If *s And *newHit
		ReDim *s\materialClass((ArraySize(*s\materialClass())+1))
		*s\materialClass((ArraySize(*s\materialClass())))=*newHit
	EndIf
EndProcedure

Enumeration 0
	#H2H_CLASS_ANIMATION_IDLE
	#H2H_CLASS_ANIMATION_MOVE_FRONT
	#H2H_CLASS_ANIMATION_MOVE_BACK
	#H2H_CLASS_ANIMATION_NEUTRAL
	#H2H_CLASS_ANIMATION_SIDE
	#H2H_CLASS_ANIMATION_UP
	#H2H_CLASS_ANIMATION_BACK
	#H2H_CLASS_ANIMATION_DOWN
	#H2H_CLASS_ANIMATION_HEAVY
	#H2H_CLASS_ANIMATION_DEATH
	#H2H_CLASS_ANIMATION_SPAWN
	#H2H_CLASS_ANIMATION_JUMP
	#H2H_CLASS_ANIMATION_LAND
	#H2H_CLASS_ANIMATION_HIT
	#H2H_CLASS_ANIMATION_DODGE
	#H2H_CLASS_ANIMATION_PARRY
	; non combat
	#H2H_CLASS_ANIMATION_SELECTION
	#H2H_CLASS_ANIMATION_SELECTED
EndEnumeration
#H2H_CLASS_ANIMATION_COUNT=#H2H_CLASS_ANIMATION_SELECTED
#H2H_CLASS_ANIMATION_COUNT_COMBAT=#H2H_CLASS_ANIMATION_PARRY

;--- class struct
Structure class
	id.i
	name.s
	iconSprite.i
	iconPath$
	iconCroped.i
	desc$
	toBeAdded.i
	notSelectable.i
	
	Array *otherIdle.animation(0)
	*stat.statistic
	Array *allStances.stance(0)
	;Array *hitFrames.frame(0)
	Array allCombo.i(0)
	*animations.animation[#H2H_CLASS_ANIMATION_COUNT+1]
	; 	0  idle
	; 	1  front
	; 	2  back
	; 	3  neutral
	; 	4  nSide
	; 	5  nUp
	; 	6  nBack
	; 	7  nDown
	; 	8  heavy
	; 	9  death
	; 	10 spawn
	; 	11 jump
	; 	12 land
	; 	13 selection
	; 	14 selected
	; 	15 dodge
	; 	16 parry
	; 	17 hit
	nbStances.i
	isLoaded.i
	playerCount.i ; to check for multiple loading
EndStructure


#H2H_JSON_CLASS_NAME="name"
#H2H_JSON_CLASS_ID="id"
#H2H_JSON_CLASS_ICONPATH="iconPath"
#H2H_JSON_CLASS_DESCRIPTION="description"
#H2H_JSON_CLASS_TOBEADDED="toBeAdded"
#H2H_JSON_CLASS_NOTSELECTABLE="notSelectable"
#H2H_JSON_CLASS_IDLE="idle"
#H2H_JSON_CLASS_IDLE_OTHER="idleOther"
#H2H_JSON_CLASS_MOVE_FRONT="moveFront"
#H2H_JSON_CLASS_MOVE_BACK="moveBack"
#H2H_JSON_CLASS_NEUTRAL="neutral"
#H2H_JSON_CLASS_SIDE="side"
#H2H_JSON_CLASS_BACK="back"
#H2H_JSON_CLASS_UP="up"
#H2H_JSON_CLASS_DOWN="down"
#H2H_JSON_CLASS_HEAVY="heavy"
#H2H_JSON_CLASS_DEATH="death"
#H2H_JSON_CLASS_SPAWN="spawn"
#H2H_JSON_CLASS_JUMP="jump"
#H2H_JSON_CLASS_LAND="land"
#H2H_JSON_CLASS_STAT="stat"
#H2H_JSON_CLASS_STANCE="stance"
#H2H_JSON_CLASS_HIT="hit"
#H2H_JSON_CLASS_SELECTION="selection"
#H2H_JSON_CLASS_SELECTED="selected"
#H2H_JSON_CLASS_DODGE="dodge"
#H2H_JSON_CLASS_PARRY="parry"

Global Dim classAnimationToName.s(#H2H_CLASS_ANIMATION_COUNT)
classAnimationToName(#H2H_CLASS_ANIMATION_IDLE		)=#H2H_JSON_CLASS_IDLE
classAnimationToName(#H2H_CLASS_ANIMATION_MOVE_FRONT)=#H2H_JSON_CLASS_MOVE_FRONT
classAnimationToName(#H2H_CLASS_ANIMATION_MOVE_BACK	)=#H2H_JSON_CLASS_MOVE_BACK
classAnimationToName(#H2H_CLASS_ANIMATION_NEUTRAL	)=#H2H_JSON_CLASS_NEUTRAL
classAnimationToName(#H2H_CLASS_ANIMATION_SIDE		)=#H2H_JSON_CLASS_SIDE
classAnimationToName(#H2H_CLASS_ANIMATION_UP		)=#H2H_JSON_CLASS_UP
classAnimationToName(#H2H_CLASS_ANIMATION_BACK		)=#H2H_JSON_CLASS_BACK
classAnimationToName(#H2H_CLASS_ANIMATION_DOWN		)=#H2H_JSON_CLASS_DOWN
classAnimationToName(#H2H_CLASS_ANIMATION_HEAVY		)=#H2H_JSON_CLASS_HEAVY
classAnimationToName(#H2H_CLASS_ANIMATION_DEATH		)=#H2H_JSON_CLASS_DEATH
classAnimationToName(#H2H_CLASS_ANIMATION_SPAWN		)=#H2H_JSON_CLASS_SPAWN
classAnimationToName(#H2H_CLASS_ANIMATION_JUMP		)=#H2H_JSON_CLASS_JUMP
classAnimationToName(#H2H_CLASS_ANIMATION_LAND		)=#H2H_JSON_CLASS_LAND
classAnimationToName(#H2H_CLASS_ANIMATION_HIT		)=#H2H_JSON_CLASS_HIT
classAnimationToName(#H2H_CLASS_ANIMATION_DODGE		)=#H2H_JSON_CLASS_DODGE
classAnimationToName(#H2H_CLASS_ANIMATION_PARRY		)=#H2H_JSON_CLASS_PARRY
classAnimationToName(#H2H_CLASS_ANIMATION_SELECTION	)=#H2H_JSON_CLASS_SELECTION
classAnimationToName(#H2H_CLASS_ANIMATION_SELECTED	)=#H2H_JSON_CLASS_SELECTED

Macro classGetSomething(c,what)
	c\animations[what]
EndMacro

Macro classGetIdle(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_IDLE)
EndMacro
Macro classGetMoveFront(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_MOVE_FRONT)
EndMacro
Macro classGetMoveBack(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_MOVE_BACK)
EndMacro
Macro classGetNeutral(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_NEUTRAL)
EndMacro
Macro classGetSide(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_SIDE)
EndMacro
Macro classGetUp(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_UP)
EndMacro
Macro classGetBack(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_BACK)
EndMacro
Macro classGetDown(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_DOWN)
EndMacro
Macro classGetHeavy(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_HEAVY)
EndMacro
Macro classGetDeath(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_DEATH)
EndMacro
Macro classGetSpawn(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_SPAWN)
EndMacro
Macro classGetJump(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_JUMP)
EndMacro
Macro classGetLand(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_LAND)
EndMacro
Macro classGetHit(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_HIT)
EndMacro
Macro classGetDodge(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_DODGE)
EndMacro
Macro classGetParry(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_PARRY)
EndMacro
Macro classGetSelection(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_SELECTION)
EndMacro
Macro classGetSelected(c)
	classGetSomething(c,#H2H_CLASS_ANIMATION_SELECTED)
EndMacro

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure classJSONExport(*parent,*c.class,export.i=0)
	current=0
	If Not *parent
		current=JSONindex
		*parent=CreateJSONObject()
	EndIf
	addJSONString(*parent,#H2H_JSON_CLASS_NAME,*c\name)
	addJSONString(*parent,#H2H_JSON_CLASS_DESCRIPTION,*c\desc$)
	addJSONString(*parent,#H2H_JSON_CLASS_ICONPATH,*c\iconPath$)
	
	addJSONInteger(*parent,#H2H_JSON_CLASS_ID,*c\id,#True)
	addJSONInteger(*parent,#H2H_JSON_CLASS_TOBEADDED,*c\toBeAdded,#True)
	addJSONInteger(*parent,#H2H_JSON_CLASS_NOTSELECTABLE,*c\notSelectable,#True)
	
	*child=AddJSONMember(*parent,#H2H_JSON_CLASS_STAT)
	SetJSONObject(*child)
	statisticExportJSON(*child,*c\stat)
	
	For i=0 To #H2H_CLASS_ANIMATION_COUNT
		addJSONAnimation(*parent,classAnimationToName(i),*c\animations[i],#True)
	Next
	*array=AddJSONMember(*parent,#H2H_JSON_CLASS_STANCE)
	SetJSONArray(*array)
	For f=0 To ArraySize(*c\allStances())
		*e=AddJSONElement(*array)
		SetJSONObject(*e)
		stanceExportJSON(*e,*c\allStances(f))
	Next
	If *c\otherIdle()
		*array=AddJSONMember(*parent,#H2H_JSON_CLASS_IDLE_OTHER)
		SetJSONArray(*array)
		For i=0 To ArraySize(*c\otherIdle())
			*e=AddJSONElement(*array)
			SetJSONObject(*e)
			animationExportJSON(*c\otherIdle(i),*e)
		Next
	EndIf
	If export
		SaveJSON(current,"test.txt",#PB_JSON_PrettyPrint)
	EndIf
	ProcedureReturn *parent
EndProcedure

CompilerEndIf

Declare refreshClassCombo(*c.class)
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure classJSONImport(*parent,*c.class=0)
	If Not *c
		*c=AllocateStructure(class)
		ClearStructure(*c,class)
	EndIf
	*c\iconSprite=spriteIndexAdd()
	*c\iconCroped=spriteIndexAdd()
	*c\name=loadJSONString(*parent,#H2H_JSON_CLASS_NAME)
	*c\iconPath$=loadJSONString(*parent,#H2H_JSON_CLASS_ICONPATH)
	*c\desc$=loadJSONString(*parent,#H2H_JSON_CLASS_DESCRIPTION)
	
	*c\id=loadJSONInteger(*parent,#H2H_JSON_CLASS_ID)
	*c\toBeAdded=loadJSONInteger(*parent,#H2H_JSON_CLASS_TOBEADDED)
	*c\notSelectable=loadJSONInteger(*parent,#H2H_JSON_CLASS_NOTSELECTABLE)
	
	For i=0 To #H2H_CLASS_ANIMATION_COUNT
		*c\animations[i]=animationJSONImport(GetJSONMember(*parent,classAnimationToName(i)))
	Next
	
	*array=GetJSONMember(*parent,#H2H_JSON_CLASS_IDLE_OTHER)
	If *array
		size=JSONArraySize(*array)
		Dim *c\otherIdle(size-1)
		For a=0 To size-1
			*c\otherIdle(a)=animationJSONImport(GetJSONElement(*array,a))
		Next
	EndIf
	*c\stat=statisticJSONImport(GetJSONMember(*parent,#H2H_JSON_CLASS_STAT))
	
	*array=GetJSONMember(*parent,#H2H_JSON_CLASS_STANCE)
	If *array
		size=JSONArraySize(*array)
		Dim *c\allStances(size-1)
		For s=0 To size-1
			*c\allStances(s)=stanceJSONImport(GetJSONElement(*array,s))
		Next
	EndIf
	
	Dim *c\allCombo(0)
	refreshClassCombo(*c)
	ProcedureReturn *c
EndProcedure
CompilerEndIf
Procedure classCopy(*c1.class,*c2.class)
	If *c2<>0 And *c1<>0
		CopyStructure(*c2,*c1,class)
	EndIf
EndProcedure

Procedure classAddStance(*c.class,*s.stance)
	If *c\allStances(ArraySize(*c\allStances()))
		ReDim *c\allStances(ArraySize(*c\allStances())+1)
	EndIf
	*c\allStances(ArraySize(*c\allStances()))=*s
	*c\nbStances+1
EndProcedure

Global Dim *allClasses.class(0)

Procedure classAdd(*c.class)
	If *allClasses(0)
		ReDim *allClasses(ArraySize(*allClasses())+1)
	EndIf
	*allClasses(ArraySize(*allClasses()))=*c
EndProcedure

Procedure getRandomClassID(onlyAvailable.i=1)
	i=Random(ArraySize(*allClasses()))
	If Not *allClasses(i) Or (onlyAvailable And *allClasses(i)\toBeAdded)
		ProcedureReturn getRandomClassID(onlyAvailable)
	EndIf
	ProcedureReturn i
EndProcedure

Procedure getRandomStanceID(*c.class)
	k=Random(ArraySize(*c\allStances()))
	ProcedureReturn k
EndProcedure

Declare getAllCombos(*c.class,recursively.i=0)
Procedure classCreate(*c.class,newName.s,*idle.animation,*moveFront.animation,*moveBack.animation,
                      *neutral.animation,*side.animation,*up.animation,*back.animation,*down.animation, *heavy.animation);,*hitSound.hitSoundMaterial=0)
	
	If Not *c
		*c=AllocateStructure(class)
	EndIf
	*c\name=newName
	*c\id=classIndex
	classGetIdle(*c)		=*idle
	classGetMoveFront(*c)	=*moveFront
	classGetMoveBack(*c)	=*moveBack
	classGetNeutral(*c)		=*neutral
	classGetSide(*c)		=*side
	classGetBack(*c)		=*back
	classGetUp(*c)			=*up
	classGetDown(*c)		=*down
	classGetHeavy(*c)		=*heavy
	; The other ones are by default 0 anyway
	*c\nbStances=0
	*c\desc$="No desc"
	If *c\allStances()
		ReDim *c\allStances(0)
	Else
		Dim *c\allStances(0)
	EndIf
	Dim *tmpTab.hitSoundMaterial(0)
 	*c\allStances(0)=stanceCreate(*tmpTab(),0,"default")
	classAdd(*c)
	*c\iconSprite=spriteIndexAdd()
	*c\iconCroped=spriteIndexAdd()
	classIndex=classIndex+1
	refreshClassCombo(*c)
	FreeArray(*c\otherIdle())
	*c\isLoaded=0
	ProcedureReturn *c
EndProcedure

Global Dim *availableClasses(0)
Procedure buildAvailableClassArrayId(enableRandom=#False)
	available=0
	ReDim *availableClasses(ArraySize(*allClasses()))
	For i=0 To ArraySize(*allClasses())
		*c.class=*allClasses(i)
		If Not *c\notSelectable And Not *c\toBeAdded
			*availableClasses(available)=*c\id
; 			Debug "added "+*c\name
			available+1
		EndIf
	Next
	If enableRandom
		ReDim *availableClasses(available+1) ; because -2 for mirror
		*availableClasses(available)=-1
		*availableClasses(available+1)=-2
	Else
		ReDim *availableClasses(available-1)
	EndIf
EndProcedure

#H2H_ANIMATION_WIND_LOAD_DURING_GAME=0
Declare loadingStart()
Procedure$ classLoad(*c.class,basic.i=#False,half.i=#False,parallel.i=#False,s$="")
	If *c\isLoaded
		ProcedureReturn
	EndIf
	Debug "Loading "+*c\name
	*c\isLoaded=1
	For i=0 To 13 ; only combat animations
		If basic 
			animationLoad(*c\animations[i],#False,half,parallel,Bool(windEnabled And Not #H2H_ANIMATION_WIND_LOAD_DURING_GAME))
		Else
			animationLoad(*c\animations[i],#True,half,parallel,Bool(windEnabled And Not #H2H_ANIMATION_WIND_LOAD_DURING_GAME))
		EndIf
	Next
	For i=0 To ArraySize(*c\otherIdle())
		animationLoad(*c\otherIdle(i),#False)
	Next
	totalFrames.i=ListSize(*frameToLoad())
	currentFrames.i=0
	totalCrank.i=(screenSizeX/4)/#CHAR_SIZE_X
	currentCrank.i=0
	While ListSize(*frameToLoad())>0
		Repeat
			Event = WindowEvent()
			Select Event
				Case #PB_Event_Gadget
					If EventGadget()=0
						End
					EndIf
				Case #PB_Event_CloseWindow
					End
			EndSelect
		Until Not Event
 		stamp.d=ElapsedMillisecondsPrecise()
 		; 		clearScreenGray()
 		ClearScreen(#Black)
		While currentCrank<(currentFrames*totalCrank)/totalFrames
			currentCrank+1
			s$+"O"
		Wend
		Afftext("Loading...\"+s$,200,200)
		AfftextColor("Hint #"+Str(currentHint+1)+"\"+hint$(currentHint),100,550,#H2H_STANCE_COLOR_GRAY,128,0.75)
		currentFrames+frameLoadLoop()
	 	loadingLoop(deltaSet(stamp))
	 	FlipBuffers()
	Wend
	ProcedureReturn s$
EndProcedure

Procedure classLoadWind(*c.class)
	For i=0 To #H2H_CLASS_ANIMATION_COUNT_COMBAT
		If *c\animations[i]
			animationLoadWind(*c\animations[i],#True)
		EndIf
	Next
	For i=0 To ArraySize(*c\otherIdle())
		animationLoadWind(*c\otherIdle(i))
	Next
EndProcedure

Procedure classUnload(*c.class,silent.i=#False,exceptDeath.i=#False)
; 	If Not *c\isLoaded
; 		ProcedureReturn
; 	EndIf
	*c\isLoaded=0
	s$=""
	If silent
		For i=0 To #H2H_CLASS_ANIMATION_COUNT
			If *c\animations[i]
				If exceptDeath
					If i<>#H2H_CLASS_ANIMATION_DEATH
						animationUnload(*c\animations[i],#True)
					EndIf
				Else
					animationUnload(*c\animations[i],#True)
				EndIf
			EndIf
		Next
		For i=0 To ArraySize(*c\otherIdle())
			animationUnload(*c\otherIdle(i))
		Next
	Else
		For i=0 To #H2H_CLASS_ANIMATION_COUNT
			If *c\animations[i]
				clearScreenGray()
				Afftext("Unloading class "+*c\name+" "+*c\animations[i]\name+"\"+s$,200,200)
				If exceptDeath 
					If i<>#H2H_CLASS_ANIMATION_DEATH
						animationUnload(*c\animations[i],#True)
					EndIf
				Else
					animationUnload(*c\animations[i],#True)
				EndIf
				FlipBuffers()
				s$+"O"
			EndIf
		Next
		clearScreenGray()
		For i=0 To ArraySize(*c\otherIdle())
			Afftext("Unloading class "+*c\name+" "+*c\otherIdle(i)\name+"\"+s$,200,200)
			s$+"O"
			animationUnload(*c\otherIdle(i))
			FlipBuffers()
		Next
		clearScreenGray()
		Afftext("Unloading class "+*c\name+" hit\"+s$,200,200)
		FlipBuffers()
	EndIf
EndProcedure

Procedure classSetIconPath(*c.class,path$)
	If *c
		*c\iconPath$=path$
	EndIf
EndProcedure

Declare loadAndMir(whatSprite.i,path$)
Procedure classLoadIcon(*c.class)
	If *c 
		If *c\iconSprite And *c\iconPath$<>#Null$ And Not IsSprite(*c\iconSprite)
			LoadSprite(*c\iconSprite,*c\iconPath$,#PB_Sprite_AlphaBlending)
			Debug "loaded icon "+*c\iconSprite
			isSpriteSwaped(*c\iconSprite)=#False
		EndIf
	EndIf
EndProcedure

Procedure classLoadIconCroped(*c.class)
	If *c And *c\iconSprite And *c\iconPath$<>#Null$
		If IsSprite(*c\iconCroped)
			ProcedureReturn
		EndIf
		If Not LoadImage(0,*c\iconPath$)
			MessageRequester("Error","cannot load image")
			End
		EndIf
		
		If Not GrabImage(0,1,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
			MessageRequester("Error","cannot grab image")
			End
		EndIf
		
		CreateSprite(*c\iconCroped,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
		TransparentSpriteColor(*c\iconCroped,RGB(0,0,0))
		StartDrawing(SpriteOutput(*c\iconCroped))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
; 		Box(0,0,170,170,RGBA(32,32,32,255))
		DrawImage(ImageID(1),0,0)
		StopDrawing()
		
; 		swaped=MirrorImage(1)
; 		CreateSprite(*c\iconCropedFlip,150,150)
; 		TransparentSpriteColor(*c\iconCropedFlip,RGB(0,0,0))
; 		StartDrawing(SpriteOutput(*c\iconCropedFlip))
; 		DrawingMode(#PB_2DDrawing_AlphaBlend)
; 		Box(0,0,150,150,RGBA(255,255,255,255))
; 		DrawImage(ImageID(swaped),0,0)
; 		StopDrawing()
		
		FreeImage(0)
; 		FreeImage(1)
; 		FreeImage(swaped)
	EndIf
EndProcedure

Procedure classFreeIcon(*c.class)
	If *c And *c\iconSprite And *c\iconPath$<>#Null$
		If IsSprite(*c\iconSprite)
			FreeSprite(*c\iconSprite)
		EndIf
	EndIf
EndProcedure

Procedure classFreeIconCroped(*c.class)
	If *c And *c\iconCroped And *c\iconPath$<>#Null$
		If IsSprite(*c\iconCroped)
			FreeSprite(*c\iconCroped)
		EndIf
	EndIf
EndProcedure

Procedure classFreeIconAll()
	For i=0 To ArraySize(*allClasses())
		classFreeIcon(*allClasses(i))
	Next
EndProcedure

Global classIsInit=0
Procedure statLoad()
	If classIsInit
		CompilerIf Not #H2H_ICON_ATLAS_ENABLED
			LoadSprite(statIconMini(#H2H_ICON_STRENGTH),	"image/icon_strength_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_AGILITY),		"image/icon_agility_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_SPEED),		"image/icon_speed_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_WEIGHT),		"image/icon_weight_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_ENDURENCE),	"image/icon_stamina_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_LIFE),		"image/icon_life_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_CUT),			"image/icon_cut_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_PIERCE),		"image/icon_pierce_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_BLUNT),		"image/icon_blunt_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_REACH),		"image/icon_range_mini.png",#PB_Sprite_AlphaBlending)
			LoadSprite(statIconMini(#H2H_ICON_DIFFICULTY),	"image/icon_difficulty_mini.png",#PB_Sprite_AlphaBlending)
	; 		LoadSprite(statIconMini(#H2H_ICON_SOON),		"image/tobeadded.png",#PB_Sprite_AlphaBlending)
			LoadSprite(dot,"image/dot.png",#PB_Sprite_AlphaBlending)
			LoadSprite(crescent,"image/crescent.png",#PB_Sprite_AlphaBlending)
		CompilerEndIf
			
		LoadSprite(statIcon(#H2H_ICON_STRENGTH),	"image/icon_strength.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_AGILITY),		"image/icon_agility.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_SPEED),		"image/icon_speed.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_WEIGHT),		"image/icon_weight.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_ENDURENCE),	"image/icon_stamina.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_LIFE),		"image/icon_life.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_CUT),			"image/icon_cut.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_PIERCE),		"image/icon_pierce.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_BLUNT),		"image/icon_blunt.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_REACH),		"image/icon_range.png",#PB_Sprite_AlphaBlending)
		LoadSprite(statIcon(#H2H_ICON_DIFFICULTY),	"image/icon_difficulty.png",#PB_Sprite_AlphaBlending)
	EndIf
	CompilerIf #H2H_ICON_ATLAS_ENABLED
		If Not IsSprite(iconAtlas)
			LoadSprite(iconAtlas,"image/icons.png",#PB_Sprite_AlphaBlending)
		EndIf
	CompilerEndIf
EndProcedure
CompilerIf #H2H_ICON_ATLAS_ENABLED
Macro statFree()
	Debug "Looks like you forgot to delete it hurr durr derp herp"
EndMacro
CompilerElse

Procedure statFree()
	For i=statIconMini(0) To statIconMini(11)
		If IsSprite(i)
			FreeSprite(i)
		EndIf
	Next
	If IsSprite(dot)
		FreeSprite(dot)
	EndIf
	If IsSprite(crescent)
		FreeSprite(crescent)
	EndIf
	If IsSprite(dotFlip)
		FreeSprite(dotFlip)
	EndIf
	If IsSprite(crescentFlip)
		FreeSprite(crescentFlip)
	EndIf
EndProcedure
CompilerEndIf
Procedure statInit() ;- init their sprite index
	CompilerIf Not #H2H_ICON_ATLAS_ENABLED
	If Not statIconMini(0)
		statIconMini(0)=spriteIndexAdd(#H2H_ICON_DIFFICULTY+1)
		For i=1 To #H2H_ICON_DIFFICULTY
			statIconMini(i)=statIconMini(#H2H_ICON_STRENGTH)+i
		Next
	EndIf
	CompilerEndIf
	If Not statIcon(0)
		statIcon(0)=spriteIndexAdd(#H2H_ICON_DIFFICULTY+1)
		For i=1 To #H2H_ICON_DIFFICULTY
			statIcon(i)=statIcon(#H2H_ICON_STRENGTH)+i
		Next
	EndIf 
	classIsInit=1
	statLoad()
	ProcedureReturn 1
EndProcedure
Procedure classDisplayIcon(*c.class,x.i,y.i,color.i=-1,opacity.i=255,fliped.i=#False)
	If opacity>0
		s=*c\iconSprite
		If Not IsSprite(s)
			classLoadIcon(*c)
		EndIf
		If IsSprite(s)
			spriteFlip(s,fliped)
			DisplayTransparentSprite(s,x,y,opacity)
			If color>=0
				DisplayTransparentSprite(s,x,y,128*opacity/255,color) ; TODO Manage class color intensity
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure classDisplayIconCroped(*c.class,x.i,y.i,mirror.i=0,color.i=0,colorIntensity.i=128,opacity.i=255,backgroundColor.i=#White)
	If *c
		If IsSprite(*c\iconCroped)
			spriteFlip(*c\iconCroped,mirror)
			DisplayTransparentSprite(classIconBack,x,y,opacity,backgroundColor)
			If color And colorIntensity
				DisplayTransparentSprite(classIconBack,x,y,colorIntensity,color)
			EndIf
			DisplayTransparentSprite(*c\iconCroped,x,y,opacity)
			If color And colorIntensity
				DisplayTransparentSprite(*c\iconCroped,x,y,colorIntensity,color)
			EndIf
		EndIf
	EndIf
EndProcedure
#H2H_BAR_SHINE_MAX=192
#H2H_BAR_SHINE_MIN=-64
#H2H_BAR_SHINE_SPEED=6
Global classLevelShine.d=#H2H_BAR_SHINE_MIN
Global classLevelShineDelta.d=#H2H_BAR_SHINE_SPEED

Procedure shineLoop(delta.d=1)
	Static sub.d=0
	sub+delta
	If sub>=1.0
		difference=Int(sub)
		sub-difference
		classLevelShine+difference*classLevelShineDelta
		If classLevelShine>#H2H_BAR_SHINE_MAX
			classLevelShineDelta*-1
			classLevelShine+(#H2H_BAR_SHINE_MAX-classLevelShine)
		EndIf
		If classLevelShine<#H2H_BAR_SHINE_MIN
			classLevelShineDelta*-1
			classLevelShine+(#H2H_BAR_SHINE_MIN-classLevelShine)
		EndIf
	EndIf
EndProcedure

CompilerIf #H2H_ICON_ATLAS_ENABLED
Procedure.d classLevelScale()
	If screenSizeX<=1920
		ProcedureReturn 0.5
	EndIf
	If screenSizeX<1300
		ProcedureReturn 0.25
	EndIf
	ProcedureReturn 1
EndProcedure
CompilerEndIf

Procedure classDisplayLevel(level.i,x.i,y.i,trueLevel.i=-1,fliped.i=#False,fixedScale.d=0,checkShift.i=#False)
	CompilerIf #H2H_ICON_ATLAS_ENABLED
		Protected scale.d=classLevelScale()
		If fixedScale>0
			scale=fixedScale
		EndIf
		If level>=0
			If trueLevel=-1
				trueLevel=level
			EndIf
			c=crescentColor(10)
			If trueLevel<=10
				c=crescentColor(trueLevel)
			EndIf
			If checkShift And keyPushedPB(#PB_Key_LeftShift)
				AfftextColor(Str(trueLevel),x-#CHAR_SIZE_X*scale*4,y,colorLerp(c,#Black),128,scale*4)
			EndIf
			direction=1
			If fliped
				direction=-1
			EndIf
			UIDisplay(#H2H_ICON_DOT,x,y,c,128,255,fliped,scale)
			If trueLevel>=level
				For i=1 To level
					x+#H2H_CRESCENT_SPACE*direction*scale
					UIDisplay(#H2H_ICON_CRESCENT,x,y,c,128,255,fliped,scale)
				Next
				For i=level+1 To trueLevel
					x+#H2H_CRESCENT_SPACE*direction*scale
					UIDisplay(#H2H_ICON_CRESCENT,x,y,c,128,255,fliped,scale)
					If classLevelShine>0
						UIDisplay(#H2H_ICON_CRESCENT,x,y,#White,128,classLevelShine,fliped,scale)
					Else
						UIDisplay(#H2H_ICON_CRESCENT,x,y,#Black,128,Abs(classLevelShine),fliped,scale)
					EndIf
				Next
			Else
				For i=1 To trueLevel
					x+#H2H_CRESCENT_SPACE*direction*scale
					UIDisplay(#H2H_ICON_CRESCENT,x,y,c,128,255,fliped,scale)
				Next
				For i=trueLevel+1 To level
					x+#H2H_CRESCENT_SPACE*direction*scale
					UIDisplay(#H2H_ICON_CRESCENT,x,y,c,128,64,fliped,scale)
				Next
			EndIf
		Else
			AfftextColor("?",x,y,0,128,2*scale)
		EndIf
	CompilerElse
	y+20
	If level>=0
		If trueLevel=-1
			trueLevel=level
		EndIf
		c=crescentColor(10)
		If trueLevel<=10
			c=crescentColor(trueLevel)
		EndIf
		spriteFlip(crescent,fliped)
		If fliped
			fliped=-1
		Else
			fliped=1
		EndIf
		If trueLevel>=level
			DisplayTransparentSprite(dot,x,y)
			DisplayTransparentSprite(dot,x,y,192,c)
			If fliped=1
				x+5
			EndIf
			For i=1 To level
				x+#H2H_CRESCENT_SPACE*fliped
				DisplayTransparentSprite(crescent,x,y)
				DisplayTransparentSprite(crescent,x,y,192,c)
			Next
			For i=level+1 To trueLevel
				x+#H2H_CRESCENT_SPACE*fliped
				DisplayTransparentSprite(crescent,x,y)
				DisplayTransparentSprite(crescent,x,y,192,c)
				If classLevelShine>0
					DisplayTransparentSprite(crescent,x,y,classLevelShine,#White)
				Else
					DisplayTransparentSprite(crescent,x,y,-classLevelShine,#Black)
				EndIf
			Next
		Else
			DisplayTransparentSprite(dot,x,y)
			DisplayTransparentSprite(dot,x,y,192,c)
			If fliped=1
				x+5
			EndIf
			For i=1 To trueLevel
				x+#H2H_CRESCENT_SPACE*fliped
				DisplayTransparentSprite(crescent,x,y)
				DisplayTransparentSprite(crescent,x,y,192,c)
			Next
			For i=trueLevel+1 To level
				x+#H2H_CRESCENT_SPACE*fliped
				DisplayTransparentSprite(crescent,x,y,64)
				DisplayTransparentSprite(crescent,x,y,32,c)
			Next
		EndIf
	Else
		AfftextColor("?",x,y,0,128,2)
	EndIf
	CompilerEndIf
EndProcedure
Global Dim iconColor(#H2H_ICON_DIFFICULTY+1)
iconColor(#H2H_ICON_STRENGTH)=#Red
iconColor(#H2H_ICON_AGILITY)=#Blue
iconColor(#H2H_ICON_SPEED)=#Yellow
iconColor(#H2H_ICON_WEIGHT)=RGB(128,64,0)
iconColor(#H2H_ICON_ENDURENCE)=#Orange
iconColor(#H2H_ICON_LIFE)=RGB(255,0,255)
iconColor(#H2H_ICON_CUT)=RGB(192,192,192)
iconColor(#H2H_ICON_PIERCE)=RGB(128,128,128)
iconColor(#H2H_ICON_BLUNT)=RGB(64,64,64)
iconColor(#H2H_ICON_REACH)=RGB(128,128,0)
iconColor(#H2H_ICON_DIFFICULTY)=RGB(64,128,0)

CompilerIf #H2H_ICON_ATLAS_ENABLED
Procedure.d classStatScale()
	If screenSizeX<=1920
		ProcedureReturn 0.75
	EndIf
	If screenSizeX<1300
		ProcedureReturn 0.5
	EndIf
	ProcedureReturn 1
EndProcedure
CompilerEndIf

Procedure classDisplayStat(icon.i,x.i,y.i,fliped.i=#False)
	CompilerIf #H2H_ICON_ATLAS_ENABLED
	Protected scale.d=classStatScale()
	If fliped
		UIDisplay(icon,x-32*scale*0.5,y-32*scale*0.5,iconColor(icon),128,255,fliped,scale)
	Else
		UIDisplay(icon,x+32*scale*0.5,y-32*scale*0.5,iconColor(icon),128,255,fliped,scale)
	EndIf
	CompilerElse
	If icon<=#H2H_ICON_DIFFICULTY And icon>=#H2H_ICON_STRENGTH
		DisplayTransparentSprite(statIconMini(icon),x-SpriteWidth(statIconMini(icon))/2,y)
	EndIf
	CompilerEndIf
EndProcedure

Procedure selectMove(*a.animation,movement.i)
	Select movement
		Case #H2H_COMBO_NEUTRAL
			ProcedureReturn animationGetNeutral(*a)
		Case #H2H_COMBO_NSIDE
			ProcedureReturn animationGetSide(*a)
		Case #H2H_COMBO_NBACK
			ProcedureReturn animationGetBack(*a)
		Case #H2H_COMBO_NUP
			ProcedureReturn animationGetUp(*a)
		Case #H2H_COMBO_NDOWN
			ProcedureReturn animationGetDown(*a)
		Case #H2H_COMBO_HEAVY
			ProcedureReturn animationGetHeavy(*a)
	EndSelect
	ProcedureReturn 0
EndProcedure

Procedure selectMoveClass(*c.class,movement.i)
	Select movement
		Case #H2H_COMBO_NEUTRAL
			ProcedureReturn classGetNeutral(*c)
		Case #H2H_COMBO_NSIDE
			ProcedureReturn classGetSide(*c)
		Case #H2H_COMBO_NBACK
			ProcedureReturn classGetBack(*c)
		Case #H2H_COMBO_NUP
			ProcedureReturn classGetUp(*c)
		Case #H2H_COMBO_NDOWN
			ProcedureReturn classGetDown(*c)
		Case #H2H_COMBO_HEAVY
			ProcedureReturn classGetHeavy(*c)
	EndSelect
	ProcedureReturn 0
EndProcedure

Structure comboList
	combo.i
	*next.comboList
EndStructure

Structure comboTreeNode
	*a.animation
	*parent.comboTreeNode
	*childs.comboTreeNode[6]
EndStructure

; returns the combo code from that node
Procedure.i comboTreeNodePuke(*c.comboTreeNode,current.i=0,index.i=1)
	If Not *c
		ProcedureReturn current
	EndIf
	id=*c\a\animationType
	If id=#H2H_ANIMATIONTYPE_NBACK
		id=#H2H_ANIMATIONTYPE_NUP
	Else
		If id=#H2H_ANIMATIONTYPE_NUP
			id=#H2H_ANIMATIONTYPE_NBACK
		EndIf
	EndIf
	id-#H2H_ANIMATIONTYPE_NEUTRAL+1
 	If Not *c\parent
 		ProcedureReturn current+id
 	EndIf
	ProcedureReturn comboTreeNodePuke(*c\parent,(current+id)*10,index*10)
EndProcedure

Global NewList *allComboTreeNodes.comboTreeNode()

Procedure.i comboTreeNodeCreate(*what.animation)
	If Not *what
		ProcedureReturn 0
	EndIf
	*c.comboTreeNode=AllocateStructure(comboTreeNode)
	*c\a=*what
	AddElement(*allComboTreeNodes())
	*allComboTreeNodes()=*c
	For i=0 To 5
		*c\childs[i]=comboTreeNodeCreate(*what\animations[i])
		If *c\childs[i]
			*c\childs[i]\parent=*c
		EndIf
	Next
	ProcedureReturn *c
EndProcedure

; Returns a comboList head
Procedure.i getAllCombosEx(*c.class)
	For i=#H2H_CLASS_ANIMATION_NEUTRAL To #H2H_CLASS_ANIMATION_HEAVY
		comboTreeNodeCreate(*c\animations[i])
	Next
	*head.comboList=0
	*tail.comboList=0
	ForEach *allComboTreeNodes()
		*current.comboTreeNode=*allComboTreeNodes()
		If *current\parent And Not (*current\childs[0] Or *current\childs[1] Or *current\childs[2] Or *current\childs[3] Or *current\childs[4] Or *current\childs[5])
			If Not *head
				*head=AllocateStructure(comboList)
				*head\combo=comboTreeNodePuke(*current)
			Else
				If Not *tail
					*tail=AllocateStructure(comboList)
					*head\next=*tail
				Else
					*tail\next=AllocateStructure(comboList)
					*tail=*tail\next
				EndIf
				*tail\combo=comboTreeNodePuke(*current)
			EndIf
		EndIf
	Next
	
	ForEach *allComboTreeNodes()
		FreeStructure(*allComboTreeNodes())
	Next
	FreeList(*allComboTreeNodes())
	NewList *allComboTreeNodes()
	ProcedureReturn *head
EndProcedure

#H2H_COMBO_MAX=5

Procedure destroyComboList(*cb.comboList)
	If Not *cb
		ProcedureReturn
	EndIf
	If *cb\next
		destroyComboList(*cb\next)
	EndIf
	FreeStructure(*cb)
	*cb=0
EndProcedure

Procedure refreshClassCombo(*c.class)
	If Not *c
		ProcedureReturn
	EndIf
	nbCombos=0
	*first.comboList=getAllCombosEx(*c)
	*current.comboList=*first
	While *current
		nbCombos+1
		*current=*current\next
	Wend
	If nbCombos
		ReDim *c\allCombo(nbCombos-1)
	EndIf
	*current=*first
	nbCombos=0
	While *current
		*c\allCombo(nbCombos)=*current\combo
		nbCombos+1
		*current=*current\next
	Wend
	destroyComboList(*first)
EndProcedure

Procedure.i classSelectIdle(*c.class)
	i=ArraySize(*c\otherIdle())
	If i>-1
		If Not Random(2)
			ProcedureReturn *c\otherIdle(Random(i))
		Else
			ProcedureReturn classGetIdle(*c)
		EndIf
	EndIf
	ProcedureReturn classGetIdle(*c)
EndProcedure
#H2H_CLASS_GALLERY_SHIFT_X=96
#H2H_CLASS_GALLERY_SHIFT_Y=96

; fliped is displayed in the right of the screen
; Felt cute, might standardize later
Procedure.i classDisplayStatAll(*c.class,x.i,y.i,stance.i=0,fliped.i=#False,checkShift.i=#False)
	Protected shiftX=x
	Protected otherFliped=Bool(Not fliped)
	Protected scale.d=classLevelScale()
	Protected classDisplayShiftY=0
	Protected iconShift=0
	If fliped
		x-64*classStatScale()
		shiftX-#H2H_CLASS_GALLERY_SHIFT_X*classStatScale()-64*scale
	Else
		shiftX+#H2H_CLASS_GALLERY_SHIFT_X*classStatScale()
	EndIf
	For i=0 To 5
		classDisplayStat(i,x,y+classDisplayShiftY,otherFliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
	Next
	If stance<0
		stance=0
	EndIf
	If *c>0
		classDisplayShiftY=0
		classDisplayLevel(*c\stat\strength,shiftX,y+classDisplayShiftY,*c\stat\strength+*c\allStances(stance)\modificator\strength,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(*c\stat\agility,shiftX,y+classDisplayShiftY,*c\stat\agility+*c\allStances(stance)\modificator\agility,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(*c\stat\speed,shiftX,y+classDisplayShiftY,*c\stat\speed+*c\allStances(stance)\modificator\speed,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(*c\stat\weight,shiftX,y+classDisplayShiftY,*c\stat\weight+*c\allStances(stance)\modificator\weight,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(*c\stat\endurence,shiftX,y+classDisplayShiftY,*c\stat\endurence+*c\allStances(stance)\modificator\endurence,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(*c\stat\life,shiftX,y+classDisplayShiftY,*c\stat\life+*c\allStances(stance)\modificator\life,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		If *c\stat\cut>=0
			classDisplayStat(#H2H_ICON_CUT,x,y+classDisplayShiftY,otherFliped)
			classDisplayLevel(*c\stat\cut,shiftX,y+classDisplayShiftY,*c\stat\cut+*c\allStances(stance)\modificator\cut,fliped,0,checkShift)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		EndIf
		If *c\stat\pierce>=0
			classDisplayStat(#H2H_ICON_PIERCE,x,y+classDisplayShiftY,otherFliped)
			classDisplayLevel(*c\stat\pierce,shiftX,y+classDisplayShiftY,*c\stat\pierce+*c\allStances(stance)\modificator\pierce,fliped,0,checkShift)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		EndIf
		If *c\stat\blunt>=0
			classDisplayStat(#H2H_ICON_BLUNT,x,y+classDisplayShiftY,otherFliped)
			classDisplayLevel(*c\stat\blunt,shiftX,y+classDisplayShiftY,*c\stat\blunt+*c\allStances(stance)\modificator\blunt,fliped,0,checkShift)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		EndIf
		classDisplayStat(#H2H_ICON_REACH,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(*c\stat\reach,shiftX,y+classDisplayShiftY,-1,fliped,0,checkShift)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_DIFFICULTY,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(*c\stat\difficulty,shiftX,y+classDisplayShiftY,-1,fliped,0,checkShift)
	Else
		classDisplayShiftY=0
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_CUT,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_PIERCE,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_BLUNT,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_REACH,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,-1,fliped)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
		classDisplayStat(#H2H_ICON_DIFFICULTY,x,y+classDisplayShiftY,otherFliped)
		classDisplayLevel(-1,shiftX,y+classDisplayShiftY,-1,fliped)
	EndIf
	ProcedureReturn classDisplayShiftY
EndProcedure

#H2H_CLASS_GALLERY_GRID_SIZE_X=500
Procedure classGridDisplay(currentSelection.i,x.i,y.i,enabledOnly.i=#False,randomSelector=#False)
	jx=x
	jy=y
	sx=jx
	sy=jy
	Protected scale.d=1
	If screenSizeX<1920
		scale=0.5
	EndIf
	If screenSizeX<=1200
		scale=0.25
	EndIf
	For i=0 To ArraySize(*allClasses())
		*c.class=*allClasses(i)
		If Not *c\notSelectable And Not (enabledOnly And *c\toBeAdded)
			If jx>=screenSizeX-300*scale; Or jx-x>=#H2H_CLASS_GALLERY_GRID_SIZE_X*scale
				jx=x
				jy+y
			EndIf
			jx+100*scale
			classLoadIcon(*c)
			classLoadIconCroped(*c)
			If i=currentSelection
				sx=jx
				sy=jy
			Else
				ZoomSprite(*c\iconCroped,100*scale,100*scale)
				ZoomSprite(classIconBack,100*scale,100*scale)
				If *c\toBeAdded
					classDisplayIconCroped(*c,jx,jy,0,RGB(64,32,0),128,128)
				Else
					classDisplayIconCroped(*c,jx,jy,0,RGB(32,32,32))
				EndIf
				ZoomSprite(*c\iconCroped,#PB_Default,#PB_Default)
				ZoomSprite(classIconBack,#PB_Default,#PB_Default)
			EndIf
		EndIf
	Next
	If randomSelector
		If jx>=screenSizeX-300*scale Or jx-x>=#H2H_CLASS_GALLERY_GRID_SIZE_X*scale
			jx=x
			jy+y
		EndIf
		jx+100*scale
		If currentSelection=-1
			ZoomSprite(randomClassIcon,144*scale,144*scale)
			DisplayTransparentSprite(randomClassIcon,jx-23,jy-23)
		Else
			ZoomSprite(randomClassIcon,96*scale,96*scale)
			DisplayTransparentSprite(randomClassIcon,jx+2,jy+2,128)
		EndIf
	EndIf
	If currentSelection>=0
		ZoomSprite(*allClasses(currentSelection)\iconCroped,#PB_Default,#PB_Default)
		If *allClasses(currentSelection)\toBeAdded
			classDisplayIconCroped(*allClasses(currentSelection),sx-25,sy-25,0,RGB(255,128,0))
		Else
			classDisplayIconCroped(*allClasses(currentSelection),sx-25,sy-25)
		EndIf
	EndIf
EndProcedure

Procedure classLineDisplay(currentSelection.i,x.i,y.i,enabledOnly.i=#False,randomSelector=#False,startI=0)
	jx=x
	jy=y
	sx=jx
	sy=jy
	randomX=0
	randomY=0
	mirrorX=0
	mirrorY=0
	k=startI
	For i=0 To #H2H_CLASS_GALLERY_GRID_SIZE_X/100-1
		classId=*availableClasses(k)
		If classId=currentSelection
			sx=jx
			sy=jy
		EndIf
		If classId>-1
			*c.class=*allClasses(classId)
			classLoadIcon(*c)
			classLoadIconCroped(*c)
			If classId<>currentSelection
				ZoomSprite(*c\iconCroped,100,100)
				ZoomSprite(classIconBack,100,100)
				If *c\toBeAdded
					classDisplayIconCroped(*c,jx,jy,0,RGB(64,32,0),128,128)
				Else
					classDisplayIconCroped(*c,jx,jy,0,RGB(32,32,32))
				EndIf
				ZoomSprite(*c\iconCroped,#PB_Default,#PB_Default)
			EndIf
		EndIf
		If classId=-1
			randomX=jx
			randomY=jy
		EndIf
		If classId=-2
			mirrorX=jx
			mirrorY=jy
		EndIf
		jx+100
		k+1
		If k>ArraySize(*availableClasses())
			k=0
		EndIf
	Next
	If randomSelector
		If randomX>0
			If currentSelection=-1
; 				ZoomSprite(randomClassIcon,144,144)
; 				DisplayTransparentSprite(randomClassIcon,randomX-23,randomY-23)
				AfftextColor("?",randomX-23,randomY-23,0,128,4)
			Else
; 				ZoomSprite(randomClassIcon,96,96)
; 				DisplayTransparentSprite(randomClassIcon,randomX+2,randomY+2,128)
				AfftextColor("?",randomX+2,randomY+2,#H2H_STANCE_COLOR_BLACK,128,4)
			EndIf
		EndIf
		If mirrorX>0
			If currentSelection=-2
; 				ZoomSprite(mirrorClassIcon,144,144)
; 				DisplayTransparentSprite(mirrorClassIcon,mirrorX-23,mirrorY-23)
				AfftextColor("M",mirrorX-23,mirrorY-23,0,128,4)
			Else
; 				ZoomSprite(mirrorClassIcon,96,96)
; 				DisplayTransparentSprite(mirrorClassIcon,mirrorX+2,mirrorY+2,128)
				AfftextColor("M",mirrorX+2,mirrorY+2,#H2H_STANCE_COLOR_BLACK,128,4)
			EndIf
		EndIf
	EndIf
	If currentSelection>-1
		If IsSprite(*allClasses(currentSelection)\iconCroped)
			ZoomSprite(*allClasses(currentSelection)\iconCroped,#PB_Default,#PB_Default)
			ZoomSprite(classIconBack,#PB_Default,#PB_Default)
		EndIf
		If *allClasses(currentSelection)\toBeAdded
			classDisplayIconCroped(*allClasses(currentSelection),sx-35,sy-35,0,RGB(255,128,0))
		Else
			classDisplayIconCroped(*allClasses(currentSelection),sx-35,sy-35)
		EndIf
	EndIf
EndProcedure

;--- idle variations managed there
; returs true if there's animation
Procedure classIdleVariationCheck(*c.class,*gadget.animationGadget)
	If classGetIdle(*c)
		If Not *gadget\what Or *gadget\hasFinished; Or *gadget\what\animationType<>#H2H_ANIMATIONTYPE_IDLE
			gadgetAnimationSet(*gadget,classSelectIdle(*c))
			*gadget\hasFinished=0
		Else
			If *gadget\what<>classGetIdle(*c)
				found=0
				For i=0 To ArraySize(*c\otherIdle())
					If *c\otherIdle(i)=*gadget\what
						found=1
						Break
					EndIf
				Next
				If Not found
					gadgetAnimationSet(*gadget,classSelectIdle(*c))
				EndIf
			EndIf
		EndIf
		*gadget\display=1
		ProcedureReturn #True
	EndIf
	ProcedureReturn #False
EndProcedure

Procedure classDisplay(*c.class,x.i,y.i,stance.i=0,*gadget.animationGadget=0)
	xOrigin=x
	yOrigin=y
	Protected *s.stance=*c\allStances(stance)
	Protected *stat.statistic=*c\stat
	classDisplayStatAll(*c,x,y,stance,#False,#True)
	If *gadget
		*gadget\color=*s\specialcolor
		If Not *gadget\color
			*gadget\color=#H2H_STANCE_COLOR_ORANGE
			*gadget\colorIntensity=128
		Else
			*gadget\colorIntensity=*s\specialTransparency
		EndIf
		If classIdleVariationCheck(*c,*gadget)
			*gadget\display=1
		Else
			*gadget\display=0
  			classDisplayIcon(*c,x+250,y-100,*s\specialcolor,*s\specialTransparency)
		EndIf
	Else
		classDisplayIcon(*c,x+250,y-100,*s\specialcolor,*s\specialTransparency)
	EndIf
	CompilerIf Not #H2H_ICON_ATLAS_ENABLED
	If keyPushedPB(#PB_Key_LeftShift)
		;{
		classDisplayShiftY=0
		Afftext("Strength",	x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\strength+*s\modificator\strength),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Agility",	x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\agility+*s\modificator\agility),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Speed",	x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\speed+*s\modificator\speed),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Weight",	x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\weight+*s\modificator\weight),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Endurence",x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\endurence+*s\modificator\endurence),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Life"		,x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\life+*s\modificator\life),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		If *stat\cut>=0
			Afftext("Cut"	,x-150,y+classDisplayShiftY)
			Afftext(Str(*stat\cut+*s\modificator\cut),x+60,y+classDisplayShiftY)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		EndIf
		If *stat\pierce>=0
			Afftext("Pierce",x-150,y+classDisplayShiftY)
			Afftext(Str(*stat\pierce+*s\modificator\pierce),x+60,y+classDisplayShiftY)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		EndIf
		If *stat\blunt>=0
			Afftext("Blunt"	,x-150,y+classDisplayShiftY)
			Afftext(Str(*stat\blunt+*s\modificator\blunt),x+60,y+classDisplayShiftY)
			classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		EndIf
		Afftext("Reach"		,x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\reach),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		Afftext("Difficulty",x-150,y+classDisplayShiftY)
		Afftext(Str(*stat\difficulty),x+60,y+classDisplayShiftY)
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y
		;}
	EndIf
	CompilerEndIf
	If screenSizeY<800
		; AfftextBloc(*c\desc$,x+300,y+325,1000)
		dx=(#H2H_CRESCENT_SPACE*10+32)*classLevelScale()+32*classStatScale()
		AfftextBloc(*c\desc$,x+dx,y+#H2H_CLASS_GALLERY_SHIFT_Y*8*classLevelScale(),screenSizeX-x-75-dx-200)
	Else
		AfftextBloc(*c\desc$,x,y+#H2H_CLASS_GALLERY_SHIFT_Y*11*classLevelScale(),screenSizeX-x-75)
	EndIf
	If *c\toBeAdded
		AfftextColor("To be added...",x+400,y,#Orange,192,1.5)
; 		classDisplayStat(#H2H_ICON_SOON,x+400,y)
	EndIf
	shiftX=38
	shiftY=31
	startX=xOrigin+800
	If screenSizeX<1500
		startX=xOrigin+700
	EndIf
	startY=yOrigin-75
	If Not *c\toBeAdded
		AfftextColor("Combo list",startX,startY,textOrange)
	EndIf
	startY+shiftY
	For i=0 To ArraySize(*c\allCombo())
		combo=*c\allCombo(i)
		x=startX
		While combo
			selected.i=Mod(combo,10)
			displayComboSprite(selected,x,startY,*gadget\color,*gadget\colorIntensity,#True)
			x+shiftX
			combo/10
		Wend
		startY+shiftY
	Next
EndProcedure

Enumeration 1
	#H2H_STAT_MODE_ORIGIN
	#H2H_STAT_MODE_TOTAL
	#H2H_STAT_MODE_BONUS
EndEnumeration

Procedure getStat(*c.class,whatStance.i,whatStat.i,whatMode.i=#H2H_STAT_MODE_TOTAL)
	If Not *c Or Not *c\stat Or whatStance>ArraySize(*c\allStances())
		ProcedureReturn 0
	EndIf
	Select whatMode
		Case #H2H_STAT_MODE_ORIGIN
			Select whatStat
				Case #H2H_ICON_STRENGTH
					ProcedureReturn *c\stat\strength
				Case #H2H_ICON_AGILITY
					ProcedureReturn *c\stat\agility
				Case #H2H_ICON_SPEED
					ProcedureReturn *c\stat\speed
				Case #H2H_ICON_WEIGHT
					ProcedureReturn *c\stat\weight
				Case #H2H_ICON_ENDURENCE
					ProcedureReturn *c\stat\endurence
				Case #H2H_ICON_LIFE
					ProcedureReturn *c\stat\life
				Case #H2H_ICON_CUT
					ProcedureReturn *c\stat\cut
				Case #H2H_ICON_PIERCE
					ProcedureReturn *c\stat\pierce
				Case #H2H_ICON_BLUNT
					ProcedureReturn *c\stat\blunt
				Case #H2H_ICON_REACH
					ProcedureReturn *c\stat\reach
				Case #H2H_ICON_DIFFICULTY
					ProcedureReturn *c\stat\difficulty
			EndSelect
		Case #H2H_STAT_MODE_TOTAL
			Select whatStat
				Case #H2H_ICON_STRENGTH
					ProcedureReturn *c\stat\strength+*c\allStances(whatStance)\modificator\strength
				Case #H2H_ICON_AGILITY
					ProcedureReturn *c\stat\agility+*c\allStances(whatStance)\modificator\agility
				Case #H2H_ICON_SPEED
					ProcedureReturn *c\stat\speed+*c\allStances(whatStance)\modificator\speed
				Case #H2H_ICON_WEIGHT
					ProcedureReturn *c\stat\weight+*c\allStances(whatStance)\modificator\weight
				Case #H2H_ICON_ENDURENCE
					ProcedureReturn *c\stat\endurence+*c\allStances(whatStance)\modificator\endurence
				Case #H2H_ICON_LIFE
					ProcedureReturn *c\stat\life+*c\allStances(whatStance)\modificator\life
				Case #H2H_ICON_CUT
					ProcedureReturn *c\stat\cut+*c\allStances(whatStance)\modificator\cut
				Case #H2H_ICON_PIERCE
					ProcedureReturn *c\stat\pierce+*c\allStances(whatStance)\modificator\pierce
				Case #H2H_ICON_BLUNT
					ProcedureReturn *c\stat\blunt+*c\allStances(whatStance)\modificator\blunt
				Case #H2H_ICON_REACH
					ProcedureReturn *c\stat\reach+*c\allStances(whatStance)\modificator\reach
				Case #H2H_ICON_DIFFICULTY
					ProcedureReturn *c\stat\reach+*c\allStances(whatStance)\modificator\difficulty
			EndSelect
		Case #H2H_STAT_MODE_BONUS
			Select whatStat
				Case #H2H_ICON_STRENGTH
					ProcedureReturn *c\allStances(whatStance)\modificator\strength
				Case #H2H_ICON_AGILITY
					ProcedureReturn *c\allStances(whatStance)\modificator\agility
				Case #H2H_ICON_SPEED
					ProcedureReturn *c\allStances(whatStance)\modificator\speed
				Case #H2H_ICON_WEIGHT
					ProcedureReturn *c\allStances(whatStance)\modificator\weight
				Case #H2H_ICON_ENDURENCE
					ProcedureReturn *c\allStances(whatStance)\modificator\endurence
				Case #H2H_ICON_LIFE
					ProcedureReturn *c\allStances(whatStance)\modificator\life
				Case #H2H_ICON_CUT
					ProcedureReturn *c\allStances(whatStance)\modificator\cut
				Case #H2H_ICON_PIERCE
					ProcedureReturn *c\allStances(whatStance)\modificator\pierce
				Case #H2H_ICON_BLUNT
					ProcedureReturn *c\allStances(whatStance)\modificator\blunt
				Case #H2H_ICON_REACH
					ProcedureReturn *c\allStances(whatStance)\modificator\reach
				Case #H2H_ICON_DIFFICULTY
					ProcedureReturn *c\allStances(whatStance)\modificator\difficulty
			EndSelect
	EndSelect
	ProcedureReturn 0
EndProcedure

Procedure classDisplayStatAlternate(*c.class,x.i,y.i,whatStance.i,whatStat.i,shiftX.i=40)
	origin=getstat(*c,whatStance,whatStat,#H2H_STAT_MODE_ORIGIN)
	If origin=-1
		ProcedureReturn x
	EndIf
	bonus=getStat(*c,whatStance,whatStat,#H2H_STAT_MODE_BONUS)
	For j=0 To min(origin,origin+bonus)
		DisplayTransparentSprite(statIconMini(whatStat),x,y)
		x+shiftX
	Next
	For j=origin+bonus To origin-1
		DisplayTransparentSprite(statIconMini(whatStat),x,y,64)
		x+shiftX
	Next
	For j=origin+1 To getStat(*c,whatStance,whatStat)
		DisplayTransparentSprite(statIconMini(whatStat),x,y)
		DisplayTransparentSprite(statIconMini(whatStat),x,y,192,#White)
		x+shiftX
	Next
	ProcedureReturn x
EndProcedure


Procedure classDisplaySelection(*c.class,stance.i,x.i,y.i,*gadget.animationGadget,fliped.i=#False)
	If *gadget And *c>0
		*gadget\display=classIdleVariationCheck(*c,*gadget)
	EndIf
	classDisplayStatAll(*c,x,y,stance,fliped)
EndProcedure

Procedure classClearFrames(*c.class)
	For i=0 To #H2H_CLASS_ANIMATION_COUNT
		animationClearFrames(*c\animations[i])
	Next
EndProcedure

Procedure classSelectRandomAttack(*c.class)
	If Not *c
		ProcedureReturn 0
	EndIf
	Dim *tmpArray.animation(0)
	For i=3 To 8
		If *c\animations[i]
			If *tmpArray(ArraySize(*tmpArray()))
				ReDim *tmpArray(ArraySize(*tmpArray())+1)
			EndIf
			*tmpArray(ArraySize(*tmpArray()))=*c\animations[i]
		EndIf
	Next
	*a.animation=*tmpArray(Random(ArraySize(*tmpArray())))
	FreeArray(*tmpArray())
	ProcedureReturn *a
EndProcedure

CompilerIf	#H2H_MODE=#H2H_MODE_SAVE
	Procedure classCountFrames(*c.class)
		Protected count=0
		Debug "===== For class "+*c\name
		For i=0 To #H2H_CLASS_ANIMATION_COUNT
			count+animationCountFrames(*c\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
	Procedure classCountAnimations(*c.class)
		Protected count=0
		Debug "===== For class "+*c\name
		For i=0 To #H2H_CLASS_ANIMATION_COUNT
			count+animationCountAnimations(*c\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
	Procedure classLengthRec(*c.class)
		l=0
		Debug "===== For class "+*c\name
		For i=0 To #H2H_CLASS_ANIMATION_COUNT
			If *c\animations[i] And i<>#H2H_CLASS_ANIMATION_HIT
				l+animationLengthRec(*c\animations[i])
			EndIf
		Next
		ProcedureReturn l
	EndProcedure
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 1299
; FirstLine = 1122
; Folding = ------08---f5---
; EnableXP
; CPU = 1