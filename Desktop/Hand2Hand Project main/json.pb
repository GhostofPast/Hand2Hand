Procedure SetJSONIntegerSimple(jsonObjectID.i,key$,value.i)
	tmpjson=JSONValue(jsonObjectID)
	SetJSONInteger(AddJSONMember(tmpjson,key$),value)
EndProcedure

Procedure.i loadJSONInteger(*parent,key$)
	If *parent
		*child=GetJSONMember(*parent, key$)
		If *child
			ProcedureReturn GetJSONInteger(*child)
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.f LoadJSONFloat(*parent,key$)
	If *parent
		*child=GetJSONMember(*parent, key$)
		If *child
			ProcedureReturn GetJSONFloat(*child)
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.s loadJSONString(*parent,key$)
	If *parent
		*child=GetJSONMember(*parent, key$)
		If *child
			ProcedureReturn GetJSONString(*child)
		EndIf
	EndIf
	ProcedureReturn ""
EndProcedure

Procedure loadJSONCoord(*parent,key$,nullWhenAbsent.i=#True)
	*child=GetJSONMember(*parent, key$)
	If *child
		ProcedureReturn locationCreate(loadJSONInteger(*child,"x"),loadJSONInteger(*child,"y"))
	EndIf
	If nullWhenAbsent
		ProcedureReturn 0
	EndIf
	ProcedureReturn locationCreate()
EndProcedure

Procedure.i GetJSONIntegerSimple(*parent,key$)
	ProcedureReturn GetJSONInteger(GetJSONMember(*parent, key$))
EndProcedure

Procedure SetJSONCoord(jsonObjectID.i,key$,*l.location)
	tmpjson=AddJSONMember(JSONValue(jsonObjectID),key$)
	SetJSONObject(tmpjson)
	SetJSONInteger(AddJSONMember(tmpjson,"x"),*l\x)
	SetJSONInteger(AddJSONMember(tmpjson,"y"),*l\y)
EndProcedure

Procedure.i GetJSONCoord(jsonObjectID.i,key$,*l.location=0)
	tmpjson=JSONValue(jsonObjectID)
	If JSONType(tmpjson)=#PB_JSON_Null
		ProcedureReturn 0
	EndIf
	If *l
		set(*l,GetJSONIntegerSimple(tmpjson,"x"),GetJSONIntegerSimple(tmpjson,"y"))
		ProcedureReturn 0
	EndIf
	ProcedureReturn locationCreate(GetJSONIntegerSimple(tmpjson,"x"),GetJSONIntegerSimple(tmpjson,"y"))
EndProcedure

Procedure addJSONInteger(*parent,key$,what.i,optional.i=#False)
	If Not optional Or what
		*child=AddJSONMember(*parent,key$)
		SetJSONInteger(*child,what)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONFloat(*parent,key$,what.i,optional.i=#False)
	If Not optional Or what
		*child=AddJSONMember(*parent,key$)
		SetJSONFloat(*child,what)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONString(*parent,key$,what$)
	ProcedureReturn SetJSONString(AddJSONMember(*parent,key$),what$)
EndProcedure

Procedure addJSONObject(*parent,key$)
	ProcedureReturn SetJSONObject(AddJSONMember(*parent,key$))
EndProcedure
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure addJSONCoord(*parent,key$,*where.location)
	If *where And (*where\x<>0 Or *where\y<>0)
		*child=addJSONObject(*parent,key$)
		addJSONInteger(*child,"x",*where\x)
		addJSONInteger(*child,"y",*where\y)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure
CompilerEndIf
Procedure.i CreateJSONObject(JSON.i=-1)
	If JSON=-1
		JSON=JSONindex
		JSONindex+1
	EndIf
	Protected Result.i=CreateJSON(JSON)
	If Result
		Result = JSONValue(JSON)
		SetJSONObject(JSONValue(JSON))
	EndIf
	ProcedureReturn Result
EndProcedure
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure.i CreateJSONArray(JSON.i=-1)
	If JSON=-1
		JSON=JSONindex
		JSONindex+1
	EndIf
	Protected Result.i=CreateJSON(JSON)
	If Result
		Result = JSONValue(JSON)
		SetJSONArray(JSONValue(JSON))
	EndIf
	ProcedureReturn Result
EndProcedure
CompilerEndIf
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 130
; FirstLine = 80
; Folding = ---
; EnableXP
; DPIAware