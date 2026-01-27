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

Procedure.q LoadJSONQuad(*parent,key$)
	If *parent
		*child=GetJSONMember(*parent, key$)
		If *child
			ProcedureReturn GetJSONQuad(*child)
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure.f LoadJSONDouble(*parent,key$)
	If *parent
		*child=GetJSONMember(*parent, key$)
		If *child
			ProcedureReturn GetJSONDouble(*child)
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

#H2H_INT_COMPRESS_LOW=46 ; char .
#H2H_INT_COMPRESS_HIGH=126 ; char ~
#H2H_INT_WIDTH=#H2H_INT_COMPRESS_HIGH-#H2H_INT_COMPRESS_LOW
Procedure.s intCompress(what.q)
	If what>=-9 And what<=9
		ProcedureReturn Str(what)
	EndIf
	origin=what
	result.s=""
	negative=Bool(what<0)
	If negative
		what=-what
	EndIf
	While what>0
		result+Chr(Mod(what,#H2H_INT_WIDTH)+#H2H_INT_COMPRESS_LOW)
		what/#H2H_INT_WIDTH
	Wend
	If negative
		result+"-"
	EndIf
	ReverseString(result)
;  	Debug "Compressed "+origin+" into "+result
	ProcedureReturn result
EndProcedure

Procedure.q intDecompress(what.s)
	l=Len(what)
	factor=1
	result=0
	ReverseString(what)
	For i=1 To l
		result+(Asc(Mid(what,i,1))-#H2H_INT_COMPRESS_LOW)*factor
		factor*#H2H_INT_WIDTH
	Next
	ProcedureReturn result
EndProcedure

; aaaa=123456789
; aaaa$=intCompress(aaaa)
; Debug "aaaa is decompressed into "+intDecompress(aaaa$)
; End
Procedure loadJSONCoord(*parent,key$,nullWhenAbsent.i=#True)
	*child=GetJSONMember(*parent, key$)
	If *child
		ProcedureReturn locationCreate(LoadJSONDouble(*child,"x"),LoadJSONDouble(*child,"y"))
	EndIf
	If nullWhenAbsent
		ProcedureReturn #Null
	EndIf
	ProcedureReturn locationCreate()
EndProcedure
Procedure loadJSONCoordI(*parent,key$,nullWhenAbsent.i=#True)
	*child=GetJSONMember(*parent, key$)
	If *child
		If JSONType(*child)=#PB_JSON_Object
			ProcedureReturn locationCreateI(loadJSONInteger(*child,"x"),loadJSONInteger(*child,"y"))
		EndIf
		val=intDecompress(GetJSONString(*child))
; 		Debug "decompressed "+GetJSONString(*child)+" into "+val
		ProcedureReturn locationCreateI(Mod(val,#H2H_LOCATION_SHIFT*#H2H_LOCATION_SHIFT),val/(#H2H_LOCATION_SHIFT*#H2H_LOCATION_SHIFT))
	EndIf
	If nullWhenAbsent
		ProcedureReturn #Null
	EndIf
	ProcedureReturn locationCreateI()
EndProcedure

; Procedure.i GetJSONIntegerSimple(*parent,key$)
; 	ProcedureReturn GetJSONInteger(GetJSONMember(*parent, key$))
; EndProcedure

; Procedure SetJSONCoord(jsonObjectID.i,key$,*l.location)
; 	tmpjson=AddJSONMember(JSONValue(jsonObjectID),key$)
; 	SetJSONObject(tmpjson)
; ; 	SetJSONInteger(AddJSONMember(tmpjson,"x"),*l\x)
; ; 	SetJSONInteger(AddJSONMember(tmpjson,"y"),*l\y)
; 	SetJSONString(AddJSONMember(tmpjson,"x"),intCompress(*l\x))
; 	SetJSONString(AddJSONMember(tmpjson,"y"),intCompress(*l\y))
; EndProcedure

; Procedure.i GetJSONCoord(jsonObjectID.i,key$,*l.location=0)
; 	tmpjson=JSONValue(jsonObjectID)
; 	If JSONType(tmpjson)=#PB_JSON_Null
; 		ProcedureReturn 0
; 	EndIf
; 	If *l
; 		set(*l,intDecompress(loadJSONString(tmpjson,"x")),intDecompress(loadJSONString(tmpjson,"y")))
; 		ProcedureReturn 0
; 	EndIf
; 	ProcedureReturn locationCreate(intDecompress(GetJSONString(tmpjson,"x")),intDecompress(GetJSONString(tmpjson,"y")))
; EndProcedure

Procedure addJSONInteger(*parent,key$,what.i,optional.i=#False)
	If Not optional Or what
		*child=AddJSONMember(*parent,key$)
		SetJSONInteger(*child,what)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONQuad(*parent,key$,what.l,optional.i=#False)
	If Not optional Or what
		*child=AddJSONMember(*parent,key$)
		SetJSONQuad(*child,what)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONDouble(*parent,key$,what.f,optional.i=#False)
	If Not optional Or what
		*child=AddJSONMember(*parent,key$)
		SetJSONDouble(*child,what)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONString(*parent,key$,what$,optional.i=#False)
	If Not optional Or what$<>""
		*child=AddJSONMember(*parent,key$)
		SetJSONString(*child,what$)
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure

Procedure addJSONObject(*parent,key$)
	ProcedureReturn SetJSONObject(AddJSONMember(*parent,key$))
EndProcedure

; Returns a formated string with one digit
Macro realRound(what)
	ProcedureReturn Str(Int(Round(what*10,#PB_Round_Nearest)/10)+"."+Str(Mod(what*10),10))
EndMacro

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure addJSONCoord(*parent,key$,*where.location,compact.q=#False)
	If *where And (*where\x<>0 Or *where\y<>0)
		If compact
			*child=addJSONString(*parent,key$,intCompress(*where\x+*where\y*#H2H_LOCATION_SHIFT*#H2H_LOCATION_SHIFT))
		Else
			*child=addJSONObject(*parent,key$)
			If Round(*where\x,#PB_Round_Nearest)=Int(*where\x)
				addJSONInteger(*child,"x",*where\x,#True)
			Else
				addJSONDouble(*child,"x",*where\x,#True) ; TODO change float to double
			EndIf
			If Round(*where\y,#PB_Round_Nearest)=Int(*where\y)
				addJSONInteger(*child,"y",*where\y,#True)
			Else
				addJSONDouble(*child,"y",*where\y,#True) ; TODO change float to double
			EndIf
		EndIf
		ProcedureReturn *child
	EndIf
	ProcedureReturn #Null
EndProcedure
Procedure addJSONCoordI(*parent,key$,*where.locationI,compact.q=#False)
	If *where And (*where\x<>0 Or *where\y<>0)
		If compact
			*child=addJSONString(*parent,key$,intCompress(*where\x+*where\y*#H2H_LOCATION_SHIFT*#H2H_LOCATION_SHIFT))
		Else
			*child=addJSONObject(*parent,key$)
			addJSONInteger(*child,"x",*where\x,#True)
			addJSONInteger(*child,"y",*where\y,#True)
		EndIf
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
; CursorPosition = 185
; FirstLine = 174
; Folding = ----
; EnableXP
; DPIAware
; CPU = 4