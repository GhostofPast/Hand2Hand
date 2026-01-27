Global classIndex=0
;--- statistic struct
Structure statistic
	value.b[11]
EndStructure

Enumeration 0
	#H2H_STAT_STRENGTH
	#H2H_STAT_AGILITY
	#H2H_STAT_SPEED
	#H2H_STAT_WEIGHT
	#H2H_STAT_ENDURANCE
	#H2H_STAT_LIFE
	#H2H_STAT_CUT
	#H2H_STAT_PIERCE
	#H2H_STAT_BLUNT
	#H2H_STAT_REACH
	#H2H_STAT_DIFFICULTY
EndEnumeration

Macro statGetSomething(s,what)
	s\value[what]
EndMacro

Macro statSetSomething(s,what,value)
	statGetSomething(s,what)=value
EndMacro

Macro statGetStrength(s)
	statGetSomething(s,#H2H_STAT_STRENGTH)
EndMacro
Macro statGetAgility(s)
	statGetSomething(s,#H2H_STAT_AGILITY)
EndMacro
Macro statGetSpeed(s)
	statGetSomething(s,#H2H_STAT_SPEED)
EndMacro
Macro statGetWeight(s)
	statGetSomething(s,#H2H_STAT_WEIGHT)
EndMacro
Macro statGetEndurance(s)
	statGetSomething(s,#H2H_STAT_ENDURANCE)
EndMacro
Macro statGetLife(s)
	statGetSomething(s,#H2H_STAT_LIFE)
EndMacro
Macro statGetCut(s)
	statGetSomething(s,#H2H_STAT_CUT)
EndMacro
Macro statGetPierce(s)
	statGetSomething(s,#H2H_STAT_PIERCE)
EndMacro
Macro statGetBlunt(s)
	statGetSomething(s,#H2H_STAT_BLUNT)
EndMacro
Macro statGetReach(s)
	statGetSomething(s,#H2H_STAT_REACH)
EndMacro
Macro statGetDifficulty(s)
	statGetSomething(s,#H2H_STAT_DIFFICULTY)
EndMacro

Macro statSetStrength(s,value)
	statSetSomething(s,#H2H_STAT_STRENGTH,value)
EndMacro
Macro statSetAgility(s,value)
	statSetSomething(s,#H2H_STAT_AGILITY,value)
EndMacro
Macro statSetSpeed(s,value)
	statSetSomething(s,#H2H_STAT_SPEED,value)
EndMacro
Macro statSetWeight(s,value)
	statSetSomething(s,#H2H_STAT_WEIGHT,value)
EndMacro
Macro statSetEndurance(s,value)
	statSetSomething(s,#H2H_STAT_ENDURANCE,value)
EndMacro
Macro statSetLife(s,value)
	statSetSomething(s,#H2H_STAT_LIFE,value)
EndMacro
Macro statSetCut(s,value)
	statSetSomething(s,#H2H_STAT_CUT,value)
EndMacro
Macro statSetPierce(s,value)
	statSetSomething(s,#H2H_STAT_PIERCE,value)
EndMacro
Macro statSetBlunt(s,value)
	statSetSomething(s,#H2H_STAT_BLUNT,value)
EndMacro
Macro statSetReach(s,value)
	statSetSomething(s,#H2H_STAT_REACH,value)
EndMacro
Macro statSetDifficulty(s,value)
	statSetSomething(s,#H2H_STAT_DIFFICULTY,value)
EndMacro

#H2H_DATA_STATISTIC_BASE=$100 ; increase if needed
Global DATA_STATISTIC_BASE=#H2H_DATA_STATISTIC_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_STATISTIC_BASE=loadJSONInteger(*parent,"statistic")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataStatisticSize.i=DATA_STATISTIC_BASE*SizeOf(statistic)
Global *dataStatistic=AllocateMemory(dataStatisticSize)
Global dataStatisticIndex=0
Procedure.i statisticDataGive()
	If dataStatisticIndex>=DATA_STATISTIC_BASE
		ProcedureReturn AllocateStructure(statistic)
	EndIf
	dataStatisticIndex+1
	ProcedureReturn *dataStatistic+(dataStatisticIndex-1)*SizeOf(statistic)
EndProcedure

Procedure statisticCreate(*s.statistic=0,newStrength.i=2,newAgility.i=2,newSpeed.i=2,newWeight.i=2,newEndurance.i=2,newLife.i=2,newCut.i=2,newPierce.i=2,newBlunt.i=2,newReach.i=2,newDifficulty.i=2)
	If Not *s
		*s=statisticDataGive()
	EndIf
	statSetStrength(*s,newStrength)
	statSetagility(*s,newAgility)
	statSetspeed(*s,newSpeed)
	statSetweight(*s,newWeight)
	statSetendurance(*s,newEndurance)
	statSetlife(*s,newLife)
	statSetcut(*s,newCut)
	statSetpierce(*s,newPierce)
	statSetblunt(*s,newBlunt)
	statSetreach(*s,newReach)
	statSetdifficulty(*s,newDifficulty)
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
#H2H_JSON_STATISTIC_ENDURANCE="endurance"
#H2H_JSON_STATISTIC_LIFE="life"
#H2H_JSON_STATISTIC_CUT="cut"
#H2H_JSON_STATISTIC_PIERCE="pierce"
#H2H_JSON_STATISTIC_BLUNT="blunt"
#H2H_JSON_STATISTIC_REACH="reach"
#H2H_JSON_STATISTIC_DIFFICULTY="difficulty"
Global Dim statJSONNames.s(10)
statJSONNames(#H2H_STAT_STRENGTH)=#H2H_JSON_STATISTIC_STRENGTH
statJSONNames(#H2H_STAT_AGILITY)=#H2H_JSON_STATISTIC_AGILITY
statJSONNames(#H2H_STAT_SPEED)=#H2H_JSON_STATISTIC_SPEED
statJSONNames(#H2H_STAT_WEIGHT)=#H2H_JSON_STATISTIC_WEIGHT
statJSONNames(#H2H_STAT_ENDURANCE)=#H2H_JSON_STATISTIC_ENDURANCE
statJSONNames(#H2H_STAT_LIFE)=#H2H_JSON_STATISTIC_LIFE
statJSONNames(#H2H_STAT_CUT)=#H2H_JSON_STATISTIC_CUT
statJSONNames(#H2H_STAT_PIERCE)=#H2H_JSON_STATISTIC_PIERCE
statJSONNames(#H2H_STAT_BLUNT)=#H2H_JSON_STATISTIC_BLUNT
statJSONNames(#H2H_STAT_REACH)=#H2H_JSON_STATISTIC_REACH
statJSONNames(#H2H_STAT_DIFFICULTY)=#H2H_JSON_STATISTIC_DIFFICULTY

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure statisticExportJSON(*parent,*s.statistic)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	For i=0 To 10
		addJSONInteger(*parent,statJSONNames(i),statGetSomething(*s,i),#True)
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf

CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure statisticJSONImport(*parent,*s.statistic=0)
	If Not *parent
		ProcedureReturn #Null
	EndIf
	If Not *s
		*s=statisticDataGive()
		ClearStructure(*s,statistic)
	EndIf
	For i=0 To 10
		s=loadJSONInteger(*parent,statJSONNames(i))
		If s<-10
			s=-10
		EndIf
		If s>127
			s=127
		EndIf
		statSetSomething(*s,i,s)
	Next
	ProcedureReturn *s
EndProcedure
CompilerEndIf

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

EnumerationBinary
	#H2H_STANCE_BADGE_SMART ; (Ballpen Black, Hexkey Steel, Ruler plastic)
	; + parry
	; + dodge
	; + guard
	; regain guard when hitting enemy
	#H2H_STANCE_BADGE_BULLDOZER	; (Ballpen Red, Gluestick full)
	; + push strength
	; + push resistance
	; + guard damage
	; + stun duration
	#H2H_STANCE_BADGE_NERVOUS ; (Ballpen green, unarmed speed And hyperactive)
	; + animation speed
	; worse recovery
	; - dodge duration
	; + dodge reload speed
	#H2H_STANCE_BADGE_RESILLIENT ; (Chopstick plastic, Ballpen blue)
	; + stamina bar on successful combo
	; faster HP regen from stamina bar
	; faster guard regen from stamina bar 
	#H2H_STANCE_BADGE_WALL ; (Unarmed Defense, Ruler Wood)
	; + damage resistance
	; + damage resistance on the extra HP
	; + guard damage resistance
	#H2H_STANCE_BADGE_EVADER ; (Chopstick wood, Unarmed dexterity)
	; + dodge regen speed
	; faster dodge in/out
	; can dodge during recovery
	#H2H_STANCE_BADGE_BRUISER ; (Chopstick metal, Unarmed Power, Hexkey Aluminum)
	; + damage against recovering target
	; - Push against enemy
	#H2H_STANCE_BADGE_BALANCED ; (Unarmed Balanced, Ruler metal)
	; + damage
	; + damage resistance
	#H2H_STANCE_BADGE_TECHNICIAN ; (Gluestick empty, criterium)
	; + projectile damage
	; + projectile guard damage
	; + projectile ammo
	; + projectile resistance
EndEnumeration

#H2H_STANCE_BADGE_SMART_PARRY_FACTOR=2 ; parry soaked damage multiplier ; DONE
#H2H_STANCE_BADGE_SMART_DODGE_DAMAGE_FACTOR=0.5 ; received damage when dodging factor ; DONE
#H2H_STANCE_BADGE_SMART_DODGE_GUARD_BONUS=2		; weight equivalent guard bonus ; DONE
#H2H_STANCE_BADGE_SMART_GUARD_FACTOR=0.5	; damage converted into guard factor ; DONE

#H2H_STANCE_BADGE_BULLDOZER_PUSH_FACTOR=1.25 ; push multiplier ; DONE
#H2H_STANCE_BADGE_BULLDOZER_RESISTANCE_FACTOR=0.75 ; push multiplier ; DONE
#H2H_STANCE_BADGE_BULLDOZER_GUARD_DAMAGE_FACTOR=1.25 ; multiplier ; DONE
#H2H_STANCE_BADGE_BULLDOZER_STUN_FACTOR=1.25 ; duration multiplier ; DONE

#H2H_STANCE_BADGE_NERVOUS_DELTA=1.15 ; delta multiplier for animation ; DONE
#H2H_STANCE_BADGE_NERVOUS_RECOVERY_FACTOR=1.15 ; recovery multiplier on miss ; DONE
#H2H_STANCE_BADGE_NERVOUS_DODGE_DURATION_FACTOR=1.15 ; Dodge delta multiplier ; DONE
#H2H_STANCE_BADGE_NERVOUS_DODGE_RELOAD_FACTOR=1.15 ; recovery reload factor speed ; DONE

#H2H_STANCE_BADGE_RESILLIENT_STAMINA_FACTOR=1.33 ; stamina bonus multiplier when finishing a combo sucessfuly ; DONE
#H2H_STANCE_BADGE_RESILLIENT_REGEN_FACTOR=1.33	 ; HP regen from stamina bar multiplier (as well as consumation rate) ; DONE
#H2H_STANCE_BADGE_RESILLIENT_GUARD_FACTOR=1.33	 ; same as above but for guard ; DONE

#H2H_STANCE_BADGE_WALL_ARMOR_FACTOR=0.9  ; Global damage on HP multiplier ; DONE
#H2H_STANCE_BADGE_WALL_OUTER_FACTOR=0.66 ; Damage on outer bar multiplier (stacks with previous) ; DONE
#H2H_STANCE_BADGE_WALL_GUARD_FACTOR=0.75 ; Guard damage resistance multiplier ; DONE

#H2H_STANCE_BADGE_EVADER_DODGE_RELOAD_FACTOR=1.5 ; reload delta multiplier ; DONE
#H2H_STANCE_BADGE_EVADER_DODGE_SPEED_FACTOR=2	 ; dodge in-out speed multiplier ; DONE

#H2H_STANCE_BADGE_BRUISER_DAMAGE_FACTOR=1.25 ; Damage multiplier against recovering target ; DONE
#H2H_STANCE_BADGE_BRUISER_PUSH_FACTOR=0.75	 ; Push against target multiplier ; DONE

#H2H_STANCE_BADGE_BALANCED_DAMAGE_FACTOR=1.05 ; Damage multiplier ; DONE
#H2H_STANCE_BADGE_BALANCED_ARMOR_FACTOR=0.95  ; Damage received multiplier ; DONE

#H2H_STANCE_BADGE_TECHNICIAN_DAMAGE_FACTOR=1.1 ; Global damage multiplier ; DONE
#H2H_STANCE_BADGE_TECHNICIAN_GUARD_FACTOR= 1.1 ; Guard damage multiplier (stacks with previous) ; DONE
#H2H_STANCE_BADGE_TECHNICIAN_AMMO_FACTOR=1.5   ; Projectile ammo bonus multiplier (rounded up) ; TODO

;--- stance struct
Structure stance
	id.i
	name.s
	*modificator.statistic
	Array *materialClass.hitSoundMaterial(0)
	specialcolor.i ; RGBA
	;specialTransparency.i
	alternatecolor.i ;RGBA
	badge.i ; see strategical notes
	;alternateTransparency.i
EndStructure

Macro stanceHasBadge(s,what)
	(s\badge&what)
EndMacro

#H2H_DATA_STANCE_BASE=$100 ; increase if needed
Global DATA_STANCE_BASE=#H2H_DATA_STANCE_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_STANCE_BASE=loadJSONInteger(*parent,"stance")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataStanceSize.i=DATA_STANCE_BASE*SizeOf(stance)
Global *dataStance=AllocateMemory(dataStanceSize)
Global dataStanceIndex=0
Procedure.i stanceDataGive()
	If dataStanceindex>=#H2H_DATA_STANCE_BASE
		Debug "Not enough stances !"
		ProcedureReturn AllocateStructure(stance)
	EndIf
	dataStanceIndex+1
	ProcedureReturn *dataStance+(dataStanceIndex-1)*SizeOf(stance)
EndProcedure

#H2H_JSON_STANCE_ID="id"
#H2H_JSON_STANCE_NAME="name"
#H2H_JSON_STANCE_COLOR="specialColor"
#H2H_JSON_STANCE_COLOR_TRANSPARENCY="specialTransparency"
#H2H_JSON_STANCE_ALTERNATE="alternateColor"
#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY="alternateTransparency"
#H2H_JSON_STANCE_MATERIAL="material"
#H2H_JSON_STANCE_STAT="modificator"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure stanceExportJSON(*parent,*s.stance)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONString(*parent,#H2H_JSON_STANCE_NAME,*s\name)
	addJSONInteger(*parent,#H2H_JSON_STANCE_ID,*s\id										,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_COLOR,*s\specialcolor							,#True)
; 	addJSONInteger(*parent,#H2H_JSON_STANCE_COLOR_TRANSPARENCY,*s\specialTransparency		,#True)
	addJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE,*s\alternatecolor						,#True)
; 	addJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY,*s\alternateTransparency	,#True)
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
CompilerEndIf

CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure stanceJSONImport(*parent,*s.stance=0)
	If Not *parent
		ProcedureReturn #Null
	EndIf
	If Not *s
		*s=stanceDataGive()
		ClearStructure(*s,stance)
	EndIf
	*s\name=loadJSONString(*parent,#H2H_JSON_STANCE_NAME)
	*s\id=loadJSONInteger(*parent,#H2H_JSON_STANCE_ID)
	*s\specialcolor=loadJSONInteger(*parent,#H2H_JSON_STANCE_COLOR)
	;*s\specialTransparency=loadJSONInteger(*parent,#H2H_JSON_STANCE_COLOR_TRANSPARENCY)
	*s\alternatecolor=loadJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE)
	;*s\alternateTransparency=loadJSONInteger(*parent,#H2H_JSON_STANCE_ALTERNATE_TRANSPARENCY)
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
CompilerEndIf

Procedure stanceCopy(*s1.stance,*s2.stance)
	If *s1 And *s2
		CopyStructure(*s2,*s1,stance)
	EndIf
EndProcedure

Procedure stanceCreate(Array *hitMaterialSides.hitSoundMaterial(1),*s.stance=0,newName$="", *newStats.statistic=0)
	If Not *s
		*s=stanceDataGive()
		ResetStructure(*s,stance)
	EndIf
	*s\specialcolor=0
	*s\id=nbStance
	nbStance+1
	*s\name=newName$
	;*s\specialTransparency=128
	;*s\alternateTransparency=128
	*s\modificator=statisticDataGive()
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

;--- class struct =====================================================
Structure class
	id.i
	name.s
	iconSprite.i
	iconPath$
	iconCroped.i
	desc$
	flag.i
	
	Array *otherIdle.animation(0)
	*stat.statistic
	Array *allStances.stance(0)
	;Array *hitFrames.frame(0)
	Array allCombo.i(0)
; 	*animations.animation[#H2H_CLASS_ANIMATION_COUNT+1]
	*animations.animation[#H2H_ANIMATIONTYPE_SELECTED] ; animation type is indexed at 1
	nbStances.i
	playerCount.i ; to check for multiple loading
EndStructure

EnumerationBinary
	#H2H_CLASS_FLAG_TOBEADDED
	#H2H_CLASS_FLAG_NOTSELECTABLE_PLAYER
	#H2H_CLASS_FLAG_NOTSELECTABLE_AI
	#H2H_CLASS_FLAG_ISLOADED
EndEnumeration

Macro classIsLoaded(c)
	(c\flag&#H2H_CLASS_FLAG_ISLOADED)
EndMacro
Macro classIsToBeAdded(c)
	(c\flag&#H2H_CLASS_FLAG_TOBEADDED)
EndMacro
Macro classIsNotSelectablePlayer(c)
	(c\flag&#H2H_CLASS_FLAG_NOTSELECTABLE_PLAYER)
EndMacro
Macro classIsNotSelectableAI(c)
	(c\flag&#H2H_CLASS_FLAG_NOTSELECTABLE_AI)
EndMacro
Macro classSetLoaded(c,v=1)
	If v:c\flag|#H2H_CLASS_FLAG_ISLOADED:Else:c\flag&(~#H2H_CLASS_FLAG_ISLOADED):EndIf
EndMacro
Macro classSetNotSelectablePlayer(c,v=1)
	If v:c\flag|#H2H_CLASS_FLAG_NOTSELECTABLE_PLAYER:Else:c\flag&(~#H2H_CLASS_FLAG_NOTSELECTABLE_PLAYER):EndIf
EndMacro
Macro classSetNotSelectableAI(c,v=1)
	If v:c\flag|#H2H_CLASS_FLAG_NOTSELECTABLE_AI:Else:c\flag&(~#H2H_CLASS_FLAG_NOTSELECTABLE_AI):EndIf
EndMacro
Macro classSetToBeAdded(c,v=1)
	If v:c\flag|#H2H_CLASS_FLAG_TOBEADDED:Else:c\flag&(~#H2H_CLASS_FLAG_TOBEADDED):EndIf
EndMacro

#H2H_DATA_CLASS_BASE=$20 ; increase if needed
Global DATA_CLASS_BASE=#H2H_DATA_CLASS_BASE
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
	LoadJSON(0,"data.json")
	*parent=GetJSONMember(JSONValue(0),#H2H_JSON_MEMORY_KEY)
	If *parent
		DATA_CLASS_BASE=loadJSONInteger(*parent,"class")
	EndIf
	FreeJSON(0)
CompilerEndIf
Global dataClassSize.i=#H2H_DATA_CLASS_BASE*SizeOf(class)
Global *dataClass=AllocateMemory(dataClassSize)
Global dataClassIndex=0
Procedure.i classDataGive()
	If dataClassindex>=DATA_CLASS_BASE
		Debug "Not enough classes !"
		ProcedureReturn AllocateStructure(class)
	EndIf
	dataClassIndex+1
	ProcedureReturn *dataClass+(dataClassIndex-1)*SizeOf(class)
EndProcedure

#H2H_JSON_CLASS_NAME="name"
#H2H_JSON_CLASS_ID="id"
#H2H_JSON_CLASS_ICONPATH="iconPath"
#H2H_JSON_CLASS_DESCRIPTION="description"
#H2H_JSON_CLASS_FLAG="flag"
#H2H_JSON_CLASS_IDLE="idle"
#H2H_JSON_CLASS_IDLE_OTHER="idleOther"
#H2H_JSON_CLASS_MOVE_FRONT="moveFront"
#H2H_JSON_CLASS_MOVE_BACK="moveBack"
#H2H_JSON_CLASS_STAT="stat"
#H2H_JSON_CLASS_STANCE="stance"

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
#H2H_JSON_CLASS_HIT="hit"
#H2H_JSON_CLASS_SELECTION="selection"
#H2H_JSON_CLASS_SELECTED="selected"
#H2H_JSON_CLASS_DODGE="dodge"
#H2H_JSON_CLASS_PARRY="parry"
; Animation type indexed at 1, because a animation type id of 0 is invalid
Global Dim classAnimationToName.s(#H2H_ANIMATIONTYPE_SELECTED-1)
classAnimationToName(#H2H_ANIMATIONTYPE_IDLE-1		)=#H2H_JSON_CLASS_IDLE
classAnimationToName(#H2H_ANIMATIONTYPE_FRONT-1		)=#H2H_JSON_CLASS_MOVE_FRONT
classAnimationToName(#H2H_ANIMATIONTYPE_BACK-1		)=#H2H_JSON_CLASS_MOVE_BACK
classAnimationToName(#H2H_ANIMATIONTYPE_NEUTRAL-1	)=#H2H_JSON_CLASS_NEUTRAL
classAnimationToName(#H2H_ANIMATIONTYPE_NSIDE-1		)=#H2H_JSON_CLASS_SIDE
classAnimationToName(#H2H_ANIMATIONTYPE_NUP-1		)=#H2H_JSON_CLASS_UP
classAnimationToName(#H2H_ANIMATIONTYPE_NBACK-1		)=#H2H_JSON_CLASS_BACK
classAnimationToName(#H2H_ANIMATIONTYPE_NDOWN-1		)=#H2H_JSON_CLASS_DOWN
classAnimationToName(#H2H_ANIMATIONTYPE_HEAVY-1		)=#H2H_JSON_CLASS_HEAVY
classAnimationToName(#H2H_ANIMATIONTYPE_DEATH-1		)=#H2H_JSON_CLASS_DEATH
classAnimationToName(#H2H_ANIMATIONTYPE_SPAWN-1		)=#H2H_JSON_CLASS_SPAWN
classAnimationToName(#H2H_ANIMATIONTYPE_JUMP-1		)=#H2H_JSON_CLASS_JUMP
classAnimationToName(#H2H_ANIMATIONTYPE_LAND-1		)=#H2H_JSON_CLASS_LAND
classAnimationToName(#H2H_ANIMATIONTYPE_HIT-1		)=#H2H_JSON_CLASS_HIT
classAnimationToName(#H2H_ANIMATIONTYPE_DODGE-1		)=#H2H_JSON_CLASS_DODGE
classAnimationToName(#H2H_ANIMATIONTYPE_PARRY-1		)=#H2H_JSON_CLASS_PARRY
classAnimationToName(#H2H_ANIMATIONTYPE_SELECTION-1	)=#H2H_JSON_CLASS_SELECTION
classAnimationToName(#H2H_ANIMATIONTYPE_SELECTED-1	)=#H2H_JSON_CLASS_SELECTED

Macro classGetSomething(c,what)
	c\animations[what-1]
EndMacro

Macro classGetIdle(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_IDLE)
EndMacro
Macro classGetMoveFront(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_FRONT)
EndMacro
Macro classGetMoveBack(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_BACK)
EndMacro
Macro classGetNeutral(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_NEUTRAL)
EndMacro
Macro classGetSide(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_NSIDE)
EndMacro
Macro classGetUp(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_NUP)
EndMacro
Macro classGetBack(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_NBACK)
EndMacro
Macro classGetDown(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_NDOWN)
EndMacro
Macro classGetHeavy(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_HEAVY)
EndMacro
Macro classGetDeath(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_DEATH)
EndMacro
Macro classGetSpawn(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_SPAWN)
EndMacro
Macro classGetJump(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_JUMP)
EndMacro
Macro classGetLand(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_LAND)
EndMacro
Macro classGetHit(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_HIT)
EndMacro
Macro classGetDodge(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_DODGE)
EndMacro
Macro classGetParry(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_PARRY)
EndMacro
Macro classGetSelection(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_SELECTION)
EndMacro
Macro classGetSelected(c)
	classGetSomething(c,#H2H_ANIMATIONTYPE_SELECTED)
EndMacro

Macro classGetStrength(c)
	statGetStrength(c\stat)
EndMacro
Macro classGetAgility(c)
	statGetAgility(c\stat)
EndMacro
Macro classGetSpeed(c)
	statGetSpeed(c\stat)
EndMacro
Macro classGetWeight(c)
	statGetWeight(c\stat)
EndMacro
Macro classGetEndurance(c)
	statGetEndurance(c\stat)
EndMacro
Macro classGetLife(c)
	statGetLife(c\stat)
EndMacro
Macro classGetCut(c)
	statGetCut(c\stat)
EndMacro
Macro classGetPierce(c)
	statGetPierce(c\stat)
EndMacro
Macro classGetBlunt(c)
	statGetBlunt(c\stat)
EndMacro
Macro classGetReach(c)
	statGetReach(c\stat)
EndMacro
Macro classGetDifficulty(c)
	statGetDifficulty(c\stat)
EndMacro

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure classJSONExport(*parent,*c.class,export.i=#False)
	current=0
	If Not *parent
		current=JSONindex
		*parent=CreateJSONObject()
	EndIf
	addJSONString(*parent,#H2H_JSON_CLASS_NAME,*c\name)
	addJSONString(*parent,#H2H_JSON_CLASS_DESCRIPTION,*c\desc$)
	addJSONString(*parent,#H2H_JSON_CLASS_ICONPATH,*c\iconPath$)
	
	addJSONInteger(*parent,#H2H_JSON_CLASS_ID,*c\id,#True)
	addJSONInteger(*parent,#H2H_JSON_CLASS_FLAG,*c\flag,#True)
	
	*child=AddJSONMember(*parent,#H2H_JSON_CLASS_STAT)
	SetJSONObject(*child)
	statisticExportJSON(*child,*c\stat)
	
	For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
		animationJSONAdd(*parent,classAnimationToName(i),*c\animations[i],#True)
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
			animationJSONExport(*c\otherIdle(i),*e)
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
		*c=classDataGive()
		ClearStructure(*c,class)
	EndIf
	*c\iconSprite=spriteIndexAdd()
	*c\iconCroped=spriteIndexAdd()
	*c\name=loadJSONString(*parent,#H2H_JSON_CLASS_NAME)
	*c\iconPath$=loadJSONString(*parent,#H2H_JSON_CLASS_ICONPATH)
	*c\desc$=loadJSONString(*parent,#H2H_JSON_CLASS_DESCRIPTION)
	
	*c\id=loadJSONInteger(*parent,#H2H_JSON_CLASS_ID)
	*c\flag=loadJSONInteger(*parent,#H2H_JSON_CLASS_FLAG)
	
	For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
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
	If *c2>0 And *c1>0
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
	If Not *allClasses(i) Or (onlyAvailable And classIsToBeAdded(*allClasses(i)))
		ProcedureReturn getRandomClassID(onlyAvailable)
	EndIf
	ProcedureReturn i
EndProcedure

Macro getRandomStanceID(c)
	Random(ArraySize(c\allStances()))
EndMacro

Declare getAllCombos(*c.class,recursively.i=0)
Procedure classCreate(*c.class,newName.s,*idle.animation,*moveFront.animation,*moveBack.animation,
                      *neutral.animation,*side.animation,*up.animation,*back.animation,*down.animation, *heavy.animation);,*hitSound.hitSoundMaterial=0)
	
	If Not *c
		*c=classDataGive()
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
	classSetLoaded(*c,0)
	ProcedureReturn *c
EndProcedure

Global Dim *availableClasses(0)
Procedure buildAvailableClassArrayId(enableRandom=#False)
	available=0
	ReDim *availableClasses(ArraySize(*allClasses()))
	For i=0 To ArraySize(*allClasses())
		*c.class=*allClasses(i)
; 		If Not classIsNotSelectablePlayer(*c) And Not classIsToBeAdded(*c)
		If Not classIsToBeAdded(*c)
			*availableClasses(available)=*c\id
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
	If classIsLoaded(*c)
		ProcedureReturn
	EndIf
	classSetLoaded(*c,1)
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
		Afftext(lsGet("LOADING")+"\"+s$,200,200)
		AfftextColor(lsGet("HINT")+" #"+Str(currentHint+1)+"\"+hint$(currentHint),100,550,#H2H_STANCE_COLOR_GRAY,128,0.75)
		currentFrames+frameLoadLoop()
	 	loadingLoop(deltaSet(stamp))
	 	FlipBuffers()
	Wend
	ProcedureReturn s$
EndProcedure

Procedure classLoadWind(*c.class)
	For i=0 To #H2H_ANIMATIONTYPE_PARRY-1
		If *c\animations[i]
			animationLoadWind(*c\animations[i],#True)
		EndIf
	Next
	For i=0 To ArraySize(*c\otherIdle())
		animationLoadWind(*c\otherIdle(i))
	Next
EndProcedure

Procedure classUnload(*c.class,silent.i=#False,exceptDeath.i=#False)
; 	If Not classIsLoaded(*c)
; 		ProcedureReturn
; 	EndIf
	classSetLoaded(*c,0)
	s$=""
	If silent
		For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
			If *c\animations[i]
				If exceptDeath
					If i<>#H2H_ANIMATIONTYPE_DEATH
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
		For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
			If *c\animations[i]
				clearScreenGray()
				Afftext("Unloading class "+*c\name+" "+*c\animations[i]\name+"\"+s$,200,200)
				If exceptDeath 
					If i<>#H2H_ANIMATIONTYPE_DEATH
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

; Procedure classSetIconPath(*c.class,path$)
; 	If *c
; 		*c\iconPath$=path$
; 	EndIf
; EndProcedure

Declare loadAndMir(whatSprite.i,path$)
Procedure classLoadIcon(*c.class)
	If *c 
		If *c\iconSprite And *c\iconPath$<>#Null$ And Not IsSprite(*c\iconSprite)
			LoadSprite(*c\iconSprite,*c\iconPath$,#PB_Sprite_AlphaBlending)
; 			Debug "loaded icon "+*c\iconSprite
			setSpriteSwaped(*c\iconSprite,#False)
		EndIf
	EndIf
EndProcedure

Procedure classLoadIconCroped(*c.class)
	If *c And *c\iconSprite And *c\iconPath$<>#Null$
		If IsSprite(*c\iconCroped)
			ProcedureReturn
		EndIf
		If Not LoadImage(0,*c\iconPath$)
			CompilerIf #PB_Compiler_Debugger
				MessageRequester("Error","cannot load image "+*c\iconPath$)
			CompilerEndIf
			CreateImage(1,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,32)
			StartDrawing(ImageOutput(1))
			DrawingMode(#PB_2DDrawing_AllChannels)
			Box(0,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,0)
			FrontColor(#Green)
			LineXY(#H2H_CLASS_ICON_SIZE*0.1,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE*1.1)
			LineXY(0,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE*0.9,#H2H_CLASS_ICON_SIZE)
			LineXY(#H2H_CLASS_ICON_SIZE*0.9,0,0,#H2H_CLASS_ICON_SIZE*0.9)
			LineXY(#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE)
			FillArea(0,0,#Green)
			FillArea(0,#H2H_CLASS_ICON_SIZE,#Green)
			FillArea(#H2H_CLASS_ICON_SIZE,0,#Green)
			FillArea(#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#Green)
			FillArea(#H2H_CLASS_ICON_SIZE/2,#H2H_CLASS_ICON_SIZE/2,#Green)
			StopDrawing()
		Else
			If Not GrabImage(0,1,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
				CompilerIf #PB_Compiler_Debugger
					MessageRequester("Error","cannot grab image")
				CompilerEndIf
				CreateImage(1,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,32)
				StartDrawing(ImageOutput(1))
				DrawingMode(#PB_2DDrawing_AllChannels)
				Box(0,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,0)
				FrontColor(#Green)
				LineXY(#H2H_CLASS_ICON_SIZE*0.1,0,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE*1.1)
				LineXY(0,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE*0.9,#H2H_CLASS_ICON_SIZE)
				LineXY(#H2H_CLASS_ICON_SIZE*0.9,0,0,#H2H_CLASS_ICON_SIZE*0.9)
				LineXY(#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE*0.1,#H2H_CLASS_ICON_SIZE)
				FillArea(0,0,#Green)
				FillArea(0,#H2H_CLASS_ICON_SIZE,#Green)
				FillArea(#H2H_CLASS_ICON_SIZE,0,#Green)
				FillArea(#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE,#Green)
				FillArea(#H2H_CLASS_ICON_SIZE/2,#H2H_CLASS_ICON_SIZE/2,#Green)
				StopDrawing()
			EndIf
		EndIf
		
		CreateSprite(*c\iconCroped,#H2H_CLASS_ICON_SIZE,#H2H_CLASS_ICON_SIZE)
		TransparentSpriteColor(*c\iconCroped,RGB(0,0,0))
		StartDrawing(SpriteOutput(*c\iconCroped))
		DrawingMode(#PB_2DDrawing_AlphaBlend)
		DrawImage(ImageID(1),0,0)
		StopDrawing()
		
		FreeImage(0)
		FreeImage(1)
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
	If Not IsSprite(iconAtlas)
		LoadSprite(iconAtlas,"image/icons.png",#PB_Sprite_AlphaBlending)
	EndIf
EndProcedure
; Procedure statInit() ;- init their sprite index
; 	If Not statIconMini(0)
; 		statIconMini(0)=spriteIndexAdd(#H2H_ICON_DIFFICULTY+1)
; 		For i=1 To #H2H_ICON_DIFFICULTY
; 			statIconMini(i)=statIconMini(#H2H_ICON_STRENGTH)+i
; 		Next
; 	EndIf
; 	classIsInit=1
; 	statLoad()
; 	ProcedureReturn 1
; EndProcedure
Procedure classDisplayIcon(*c.class,x.i,y.i,mirror.i=#False,color.i=-1,colorIntensity.i=128,opacity.i=255)
	If opacity>0
		s=*c\iconSprite
		If Not IsSprite(s)
			classLoadIcon(*c)
		EndIf
		If IsSprite(s)
			spriteFlip(s,mirror)
			DisplayTransparentSprite(s,x,y,opacity)
			If color>=0
				DisplayTransparentSprite(s,x,y,(colorIntensity*opacity)/255,color) ; TODO Manage class color intensity
			EndIf
		EndIf
	EndIf
EndProcedure

; Inside of a square
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

Procedure.d classLevelScale()
	If screenSizeX<1300 Or screenSizeY<=800
		ProcedureReturn 0.33 ; TODO constants
	EndIf
	If screenSizeX<=1920 Or screenSizeX<=1200
		ProcedureReturn 0.5
	EndIf
	ProcedureReturn 1
EndProcedure

Procedure classDisplayLevel(level.i,x.i,y.i,trueLevel.i=-1,fliped.i=#False,fixedScale.d=0,checkShift.i=#False)
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
		If checkShift And keyPushed(#VK_SHIFT)
			If scale*4<2
				AffTextBorder(Str(trueLevel),x-#CHAR_SIZE_X*scale*6,y,colorLerp(c,#Black),128,scale*4,colorLerp(c,#White),128,*font16,*font16BorderBig)
			Else
				AffTextBorder(Str(trueLevel),x-#CHAR_SIZE_X*scale*6,y,colorLerp(c,#Black),128,scale*2,colorLerp(c,#White),128,*font32,*font32Border)
			EndIf
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
		AfftextColor("?",x,y,0,128,6*scale)
	EndIf
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


Procedure.d classStatScale()
	If screenSizeX<=1920
		ProcedureReturn 0.75
	EndIf
	If screenSizeX<1300
		ProcedureReturn 0.5
	EndIf
	ProcedureReturn 1
EndProcedure

Procedure classDisplayStat(icon.i,x.i,y.i,fliped.i=#False)
	Protected scale.d=classStatScale()
	If fliped
		UIDisplay(icon,x-32*scale*0.5,y-32*scale*0.5,iconColor(icon),128,255,fliped,scale)
	Else
		UIDisplay(icon,x+32*scale*0.5,y-32*scale*0.5,iconColor(icon),128,255,fliped,scale)
	EndIf
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
	For i=#H2H_ANIMATIONTYPE_NEUTRAL-1 To #H2H_ANIMATIONTYPE_HEAVY-1
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
		Dim *c\allCombo(nbCombos-1)
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

Procedure.i classSelectIdle(*c.class,*different.animation=0)
	i=ArraySize(*c\otherIdle())
	If i>-1
		If Not Random(2)
			*a.animation=*c\otherIdle(Random(i))
			If *a=*different And Random(1)
				ProcedureReturn classSelectIdle(*c,*different)
			EndIf
			ProcedureReturn *a
		Else
			ProcedureReturn classGetIdle(*c)
		EndIf
	EndIf
	ProcedureReturn classGetIdle(*c)
EndProcedure
#H2H_CLASS_GALLERY_SHIFT_X=48
#H2H_CLASS_GALLERY_SHIFT_Y=140
;----- stat name
Global Dim statName.s(#H2H_STAT_DIFFICULTY)
statName(#H2H_STAT_STRENGTH)="STRENGTH"
statName(#H2H_STAT_AGILITY)="AGILITY"
statName(#H2H_STAT_SPEED)="SPEED"
statName(#H2H_STAT_WEIGHT)="WEIGHT"
statName(#H2H_STAT_ENDURANCE)="STAMINA"
statName(#H2H_STAT_LIFE)="LIFE"
statName(#H2H_STAT_CUT)="CUT"
statName(#H2H_STAT_PIERCE)="PIERCE"
statName(#H2H_STAT_BLUNT)="BLUNT"
statName(#H2H_STAT_REACH)="REACH"
statName(#H2H_STAT_DIFFICULTY)="DIFFICULTY"
; fliped is displayed in the right of the screen
; Felt cute, might standardize later
Procedure.i classDisplayStatAll(*c.class,x.i,y.i,stance.i=0,fliped.i=#False,checkShift.i=#False)
	Protected shiftX=x
	Protected otherFliped=Bool(Not fliped)
	Protected scale.d=classLevelScale()
	Protected classDisplayShiftY=8
	Protected iconShift=0
	If fliped
		x-64*classStatScale()
		shiftX-#H2H_CLASS_GALLERY_SHIFT_X*classStatScale()-64*scale
	Else
		shiftX+#H2H_CLASS_GALLERY_SHIFT_X*classStatScale()
	EndIf
	If *c<=0 Or stance<0
		classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale*#H2H_STAT_DIFFICULTY
	Else
		For i=0 To #H2H_STAT_DIFFICULTY
			If (i<>#H2H_STAT_CUT And i<>#H2H_STAT_PIERCE And i<>#H2H_STAT_BLUNT) Or (statGetSomething(*c\stat,i)+statGetSomething(*c\allStances(stance)\modificator,i)<>5 And statGetSomething(*c\stat,i)>=0)
				classDisplayStat(i,x,y+classDisplayShiftY,otherFliped)
				classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
			EndIf
		Next
	EndIf
	If *c>0 And stance>=0
		classDisplayShiftY=0
		For i=0 To #H2H_STAT_DIFFICULTY
			If i<>#H2H_STAT_CUT And i<>#H2H_STAT_PIERCE And i<>#H2H_STAT_BLUNT
				If fliped
					; If I put it directly in the function it returns a memory error... WHYYYY
					s=shiftX-(AfftextGetLength(lsGet(statName(i)))-1.75*#CHAR_SIZE_X)*scale*2
					AffTextBorder(lsGet(statName(i)),s,y+classDisplayShiftY,iconColor(i),128,scale*2,colorLerp(iconColor(i),#Black),192)
				Else
					AffTextBorder(lsGet(statName(i)),shiftX,y+classDisplayShiftY,iconColor(i),128,scale*2,colorLerp(iconColor(i),#Black),192)
				EndIf
				If i<>#H2H_STAT_DIFFICULTY
					classDisplayLevel(statGetSomething(*c\stat,i),shiftX,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,statGetSomething(*c\stat,i)+statGetSomething(*c\allStances(stance)\modificator,i),fliped,0,checkShift)
				Else
					classDisplayLevel(statGetSomething(*c\stat,i),shiftX,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,-1,fliped,0,checkShift)
				EndIf
				classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
			Else
				If statGetSomething(*c\stat,i)>=0
					If statGetSomething(*c\stat,i)+statGetSomething(*c\allStances(stance)\modificator,i)<>5		
						If fliped
							tmp=shiftX-(AfftextGetLength(lsGet(statName(i)))-1.75*#CHAR_SIZE_X)*scale*2
							AffTextBorder(lsGet(statName(i)),tmp,y+classDisplayShiftY,iconColor(i),128,scale*2,colorLerp(iconColor(i),#Black),192)
						Else
							AffTextBorder(lsGet(statName(i)),shiftX,y+classDisplayShiftY,iconColor(i),128,scale*2,colorLerp(iconColor(i),#Black),192)
						EndIf
					EndIf
					modificator$=""
					v=statGetSomething(*c\stat,i)+statGetSomething(*c\allStances(stance)\modificator,i)
					If v<5
						For m=0 To 5-v-1
							modificator$+"-"
						Next
						If flipped
							AfftextColor(modificator$,shiftX-AfftextGetLength(modificator$)*scale*4,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,colorLerp(iconColor(i),#Black),192,scale*4)
						Else
							AfftextColor(modificator$,shiftX,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*4,colorLerp(iconColor(i),#Black),192,scale*4)
						EndIf
						If checkShift And keyPushed(#VK_SHIFT)
							AffTextBorder("-"+Str(5-v),shiftX-#CHAR_SIZE_X*scale*8,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,colorLerp(c,#Black),128,scale*4,colorLerp(c,#White),128,*font16BorderBig)
						EndIf
						classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
					EndIf
					If v>5
						For m=0 To v-5-1
							modificator$+"+"
						Next
						If flipped
							AfftextColor(modificator$,shiftX-AfftextGetLength(modificator$)*scale*4,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,ColorLerp(iconColor(i),#White),classLevelShine,scale*4)
						Else
							AfftextColor(modificator$,shiftX,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,colorLerp(iconColor(i),#White),classLevelShine,scale*4)
						EndIf
						If checkShift And keyPushed(#VK_SHIFT)
							AffTextBorder("+"+Str(v-5),shiftX-#CHAR_SIZE_X*scale*8,y+classDisplayShiftY+#CHAR_SIZE_Y*scale*2,colorLerp(c,#Black),128,scale*4,colorLerp(c,#White),128,*font16BorderBig)
						EndIf
						classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
					EndIf
				EndIf
			EndIf
		Next
	Else
		classDisplayShiftY=0
		For i=0 To 10
			If *c<=0 Or (i>=6 And i<=8 And statGetSomething(*c\stat,i)>=0) Or i<6 Or i>8
				classDisplayLevel(-1,shiftX,y+classDisplayShiftY,0,fliped)
				classDisplayShiftY+#H2H_CLASS_GALLERY_SHIFT_Y*scale
			EndIf
		Next
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
		If Not classIsNotSelectablePlayer(*c) And Not (enabledOnly And classIsToBeAdded(*c))
			If jx>=screenSizeX-300*scale
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
				If classIsToBeAdded(*c)
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
		If classIsToBeAdded(*allClasses(currentSelection))
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
	For i=0 To #H2H_CLASS_GALLERY_GRID_SIZE_X/#H2H_CLASS_ICON_SIZE_MINI-1
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
				ZoomSprite(*c\iconCroped,#H2H_CLASS_ICON_SIZE_MINI,#H2H_CLASS_ICON_SIZE_MINI)
				ZoomSprite(classIconBack,#H2H_CLASS_ICON_SIZE_MINI,#H2H_CLASS_ICON_SIZE_MINI)
				If classIsToBeAdded(*c)
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
		jx+#H2H_CLASS_ICON_SIZE_MINI
		k+1
		If k>ArraySize(*availableClasses())
			k=0
		EndIf
	Next
	If randomSelector
		If randomX>0
			If currentSelection=-1
				AfftextColor("?",randomX+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_X*3,randomY+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_Y*3,0,128,6)
			Else
				AfftextColor("?",randomX+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_X*2,randomY+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_Y*2,#H2H_STANCE_COLOR_BLACK,128,4)
			EndIf
		EndIf
		If mirrorX>0
			If currentSelection=-2
				AfftextColor(lsGet("MIRROR_MINI"),mirrorX+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_X*3,mirrorY+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_Y*3,0,128,6)
			Else
				AfftextColor(lsGet("MIRROR_MINI"),mirrorX+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_X*2,mirrorY+#H2H_CLASS_ICON_SIZE_MINI/2-#CHAR_SIZE_Y*2,#H2H_STANCE_COLOR_BLACK,128,4)
			EndIf
		EndIf
	EndIf
	If currentSelection>-1
		If IsSprite(*allClasses(currentSelection)\iconCroped)
			ZoomSprite(*allClasses(currentSelection)\iconCroped,#PB_Default,#PB_Default)
			ZoomSprite(classIconBack,#PB_Default,#PB_Default)
		EndIf
		If classIsToBeAdded(*allClasses(currentSelection))
			classDisplayIconCroped(*allClasses(currentSelection),sx-(#H2H_CLASS_ICON_SIZE-#H2H_CLASS_ICON_SIZE_MINI)/2,sy-(#H2H_CLASS_ICON_SIZE-#H2H_CLASS_ICON_SIZE_MINI)/2,0,RGB(255,128,0))
		Else
			classDisplayIconCroped(*allClasses(currentSelection),sx-(#H2H_CLASS_ICON_SIZE-#H2H_CLASS_ICON_SIZE_MINI)/2,sy-(#H2H_CLASS_ICON_SIZE-#H2H_CLASS_ICON_SIZE_MINI)/2)
		EndIf
	EndIf
EndProcedure

;--- idle variations managed there
; returs true if there's animation
Procedure classIdleVariationCheck(*c.class,*gadget.animationGadget)
	If classGetIdle(*c)
		If Not *gadget\what Or *gadget\hasFinished
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

	If *gadget
		*gadget\color=*s\specialcolor
		If Not *gadget\color
			*gadget\color=#H2H_STANCE_COLOR_VERMILLON;#H2H_STANCE_COLOR_ORANGE
			;*gadget\colorIntensity=128
		;Else
			;*gadget\colorIntensity=*s\specialTransparency
		EndIf
		If classIdleVariationCheck(*c,*gadget)
			*gadget\display=1
		Else
			*gadget\display=0
  			classDisplayIcon(*c,x+250,y-100,0,*s\specialcolor,*s\specialcolor>>24)
		EndIf
	Else
		classDisplayIcon(*c,x+250,y-100,0,*s\specialcolor,*s\specialcolor>>24)
	EndIf
	classDisplayStatAll(*c,x,y-50,stance,#False,#True)
	If screenSizeY<800
		dx=(#H2H_CRESCENT_SPACE*10+32)*classLevelScale()+32*classStatScale()
		AfftextBloc(*c\desc$,x+dx,y+#H2H_CLASS_GALLERY_SHIFT_Y*8*classLevelScale(),screenSizeX-x-75-dx-200)
	Else
		AfftextBloc(*c\desc$,x,y+#H2H_CLASS_GALLERY_SHIFT_Y*11*classLevelScale(),screenSizeX-x-75)
	EndIf
	If classIsToBeAdded(*c)
		AfftextColor(lsGet("TOBEADDED"),x+400,y,#H2H_STANCE_COLOR_ORANGE,#H2H_STANCE_COLOR_ORANGE>>24,1.5)
	EndIf
	shiftX=38
	shiftY=31
	startX=xOrigin+800
	If screenSizeX<1500
		startX=xOrigin+700
	EndIf
	startY=yOrigin-75
	If Not classIsToBeAdded(*c)
		AfftextColor(lsGet("GALERY_COMBO_LIST"),startX,startY,textOrange)
	EndIf
	startY+shiftY
	For i=0 To ArraySize(*c\allCombo())
		combo=*c\allCombo(i)
		x=startX
		While combo
			selected.i=Mod(combo,10)
			displayComboSprite(selected,x,startY,*gadget\color&$FFFFFF,*gadget\color>>24,#True)
			x+shiftX
			combo/10
		Wend
		startY+shiftY
	Next
EndProcedure

Enumeration
	#H2H_CLASS_DISPLAY_MODE_IDLE
	#H2H_CLASS_DISPLAY_MODE_SELECTION
	#H2H_CLASS_DISPLAY_MODE_SELECTED
EndEnumeration

Procedure classDisplaySelection(*c.class,stance.i,x.i,y.i,*gadget.animationGadget,fliped.i=#False,displayMode=#H2H_CLASS_DISPLAY_MODE_IDLE)
	If *gadget And *c>0
		Select displayMode
			Case #H2H_CLASS_DISPLAY_MODE_IDLE
				*gadget\display=classIdleVariationCheck(*c,*gadget)
			Case #H2H_CLASS_DISPLAY_MODE_SELECTION
				If classGetSelection(*c)
					If *gadget\what<>classGetSelection(*c)
						gadgetAnimationSet(*gadget,classGetSelection(*c))
					EndIf
					*gadget\display=#True
				Else
					*gadget\display=classIdleVariationCheck(*c,*gadget)
				EndIf
			Case #H2H_CLASS_DISPLAY_MODE_SELECTED
				If classGetSelected(*c)
					If *gadget\what<>classGetSelected(*c)
						If *gadget\what=classGetSelection(*c)
							If (*gadget\what\loopStart>0 And *gadget\index>=*gadget\what\loopStart) Or (*gadget\index=ArraySize(*gadget\what\frames()) And *gadget\frameIndicator=*gadget\what\frames(*gadget\index)\length)
								gadgetAnimationSet(*gadget,classGetSelected(*c))
							EndIf
						Else
							gadgetAnimationSet(*gadget,classGetSelected(*c))
						EndIf
					EndIf
					*gadget\display=#True
				Else
					If classGetSelection(*c)
						If *gadget\what<>classGetSelection(*c)
							gadgetAnimationSet(*gadget,classGetSelection(*c))
						EndIf
						*gadget\display=#True
					Else
						*gadget\display=classIdleVariationCheck(*c,*gadget)
					EndIf
				EndIf
		EndSelect
	EndIf
	classDisplayStatAll(*c,x,y,stance,fliped)
EndProcedure

; Procedure classClearFrames(*c.class)
; 	For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
; 		animationClearFrames(*c\animations[i])
; 	Next
; EndProcedure

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
		For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
			count+animationCountFrames(*c\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
	Procedure classCountAnimations(*c.class)
		Protected count=0
		Debug "===== For class "+*c\name
		For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
			count+animationCountAnimations(*c\animations[i])
		Next
		ProcedureReturn count
	EndProcedure
	Procedure classLengthRec(*c.class)
		l=0
		Debug "===== For class "+*c\name
		For i=0 To #H2H_ANIMATIONTYPE_SELECTED-1
			If *c\animations[i] And i<>#H2H_ANIMATIONTYPE_HIT
				l+animationLengthRec(*c\animations[i])
			EndIf
		Next
		ProcedureReturn l
	EndProcedure
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 222
; FirstLine = 198
; Folding = ----------------------
; EnableXP
; CPU = 1