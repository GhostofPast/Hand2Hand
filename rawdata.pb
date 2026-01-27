Structure rawdata
	item.i[6]
EndStructure

Structure rawdataArray
	Array *rd.rawdata(1)
EndStructure

Structure rawdataArrayList
	List *rda.rawdataArray()
EndStructure

Declare createRawData(x.i=0,y.i=0,fx.i=0,hx.i=0,hy.i=0,hfx.i=0)
Declare createRawDataArrayList()
Global *rdal.rawdataArrayList=createRawDataArrayList()
Procedure createRawDataArray(size.i)
	*what.rawdataArray=AllocateStructure(rawdataArray)
	ResetStructure(*what,rawdataArray)
	ReDim *what\rd(size)
	For i=0 To size
		*what\rd(i)=createRawData()
	Next
	AddElement(*rdal\rda())
	*rdal\rda()=*what
	ProcedureReturn *what
EndProcedure

Procedure createRawDataArrayList()
	*what.rawdataArrayList=AllocateStructure(rawdataArrayList)
	ResetStructure(*what,rawdataArrayList)
	NewList	*what\rda()
	ProcedureReturn *what
EndProcedure

Procedure setRawData(*rd.rawdata,x.i=0,y.i=0,fx.i=0,hx.i=0,hy.i=0,hfx.i=0)
	If *rd
		*rd\item[0]=x
		*rd\item[1]=y
		*rd\item[2]=fx
		*rd\item[3]=hx
		*rd\item[4]=hy
		*rd\item[5]=hfx
	EndIf
EndProcedure

Procedure createRawData(x.i=0,y.i=0,fx.i=0,hx.i=0,hy.i=0,hfx.i=0)
	*rd.rawdata=AllocateStructure(rawdata)
	ResetStructure(*rd,rawdata)
	setRawData(*rd,x,y,fx,hx,hy,hfx)
	ProcedureReturn *rd
EndProcedure

Procedure createRawDataForArray(*rda.rawdataArray,index.i,x.i=0,y.i=0,fx.i=0,hx.i=0,hy.i=0,hfx.i=0)
	If *rda
		setRawData(*rda\rd(index),x,y,fx,hx,hy,hfx)
	Else
		Debug "Null value ! "+x+" "+y+" "+fx+" "+fy+" "+hx+" "+hy+" "+hfx
	EndIf
EndProcedure

Procedure destroyRawData(*rd.rawdata)
	FreeStructure(*rd)
EndProcedure

Procedure destroyRawDataArray(*rd.rawdataArray)
	If *rd=#Null
		ProcedureReturn
	EndIf
	For i=0 To ArraySize(*rd\rd())
		destroyRawData(*rd\rd(i))
	Next
	FreeArray(*rd\rd())
	FreeStructure(*rd)
EndProcedure

;----CSIdle1
*CSIdle1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*CSIdle1Raw,0,246,425,323)
createRawDataForArray(*CSIdle1Raw,1,260,427,293)
createRawDataForArray(*CSIdle1Raw,2,248,426,321)
createRawDataForArray(*CSIdle1Raw,3,243,424,353)
createRawDataForArray(*CSIdle1Raw,4,242,429,348)
createRawDataForArray(*CSIdle1Raw,5,254,419,324)
createRawDataForArray(*CSIdle1Raw,6,294,427,329)
createRawDataForArray(*CSIdle1Raw,7,274,422,336)

*CSIdle1_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle1_2WindBackRaw,0,239,442,300)
createRawDataForArray(*CSIdle1_2WindBackRaw,1,262,541,298)

*CSIdle1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle1_3WindBackRaw,0,238,432,307)

*CSIdle1_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle1_4WindBackRaw,0,232,477,308)
createRawDataForArray(*CSIdle1_4WindBackRaw,1,221,449,328)

*CSIdle1_7WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle1_7WindBackRaw,0,255,474,318)
createRawDataForArray(*CSIdle1_7WindBackRaw,1,281,455,311)

*CSIdle1_8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle1_8WindFrontRaw,0,402,478,543)
createRawDataForArray(*CSIdle1_8WindFrontRaw,1,397,469,555)

;----CSIdle2
*CSIdle2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSIdle2Raw,0,226,422,321)
createRawDataForArray(*CSIdle2Raw,1,245,422,341)
createRawDataForArray(*CSIdle2Raw,2,274,420,337)
createRawDataForArray(*CSIdle2Raw,3,299,423,339)
createRawDataForArray(*CSIdle2Raw,4,261,423,332)
createRawDataForArray(*CSIdle2Raw,5,240,422,338)

*CSIdle2_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle2_1WindBackRaw,0,613,499,316)
createRawDataForArray(*CSIdle2_1WindBackRaw,1,635,536,308)

*CSIdle2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle2_2WindBackRaw,0,577,495,321)

*CSIdle2_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle2_3WindBackRaw,0,586,488,320)
createRawDataForArray(*CSIdle2_3WindBackRaw,1,599,488,318)

*CSIdle2_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle2_6WindBackRaw,0,629,500,331)
createRawDataForArray(*CSIdle2_6WindBackRaw,1,656,495,325)

*CSIdle2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle2_2WindFrontRaw,0,219,569,632)

*CSIdle2_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle2_3WindFrontRaw,0,218,572,637)
createRawDataForArray(*CSIdle2_3WindFrontRaw,1,235,606,652)

*CSIdle2_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle2_5WindFrontRaw,0,253,589,690)
createRawDataForArray(*CSIdle2_5WindFrontRaw,1,249,581,688)

;----CSIdle3
*CSIdle3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSIdle3Raw,0,198,430,347)
createRawDataForArray(*CSIdle3Raw,1,196,436,345)
createRawDataForArray(*CSIdle3Raw,2,212,438,318)
createRawDataForArray(*CSIdle3Raw,3,153,417,343)
createRawDataForArray(*CSIdle3Raw,4,207,415,350)

*CSIdle3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_1WindBackRaw,0,253,490,333)

*CSIdle3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_2WindBackRaw,0,203,491,348)

*CSIdle3_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle3_3WindBackRaw,0,395,553,392)
createRawDataForArray(*CSIdle3_3WindBackRaw,1,390,571,419)

*CSIdle3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_1WindFrontRaw,0,189,433,380)

*CSIdle3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_2WindFrontRaw,0,180,443,719)

*CSIdle3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_3WindFrontRaw,0,181,419,719)

*CSIdle3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSIdle3_4WindFrontRaw,0,149,436,773)

*CSIdle3_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSIdle3_5WindFrontRaw,0,147,453,628)
createRawDataForArray(*CSIdle3_5WindFrontRaw,1,141,451,713)

;----CSMoveFront
*CSMoveFrontRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*CSMoveFrontRaw,0,180,426,339)
createRawDataForArray(*CSMoveFrontRaw,1,218,425,318)
createRawDataForArray(*CSMoveFrontRaw,2,218,420,325)
createRawDataForArray(*CSMoveFrontRaw,3,229,422,333)
createRawDataForArray(*CSMoveFrontRaw,4,217,397,339)
createRawDataForArray(*CSMoveFrontRaw,5,232,425,333)
createRawDataForArray(*CSMoveFrontRaw,6,240,424,340)
createRawDataForArray(*CSMoveFrontRaw,7,252,429,336)
createRawDataForArray(*CSMoveFrontRaw,8,219,423,342)

;----CSMoveBack
*CSMoveBackRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSMoveBackRaw,0,260,422,320)
createRawDataForArray(*CSMoveBackRaw,1,254,427,321)
createRawDataForArray(*CSMoveBackRaw,2,276,425,338)
createRawDataForArray(*CSMoveBackRaw,3,270,427,346)
createRawDataForArray(*CSMoveBackRaw,4,253,424,341)
createRawDataForArray(*CSMoveBackRaw,5,229,424,332)
createRawDataForArray(*CSMoveBackRaw,6,269,424,347)

;----CSSide1
*CSSide1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSSide1Raw,0,236,350,311,191,350,690)
createRawDataForArray(*CSSide1Raw,1,439,211,304,218,205,445)
createRawDataForArray(*CSSide1Raw,2,402,244,298,401,198,297)
createRawDataForArray(*CSSide1Raw,3,310,378,241,335,247,241)
createRawDataForArray(*CSSide1Raw,4,456,228,366,352,228,220)
createRawDataForArray(*CSSide1Raw,5,295,302,344,290,209,397)
createRawDataForArray(*CSSide1Raw,6,186,426,339,182,313,587)

*CSSide1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_1WindFrontRaw,0,184,342,598)

*CSSide1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_2WindFrontRaw,0,125,164,449)

*CSSide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_3WindFrontRaw,0,112, 98,256)

*CSSide1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide1_4WindFrontRaw,0,103, 74,152)
createRawDataForArray(*CSSide1_4WindFrontRaw,1,196, 84,122)
createRawDataForArray(*CSSide1_4WindFrontRaw,2,660,109,106)

*CSSide1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_5WindFrontRaw,0,384,201,215)

*CSSide1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_6WindFrontRaw,0,268,150,186)

*CSSide1_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide1_7WindFrontRaw,0, 88,126,189)
createRawDataForArray(*CSSide1_7WindFrontRaw,1, 52,107,179)
createRawDataForArray(*CSSide1_7WindFrontRaw,2, 32,169,729)
createRawDataForArray(*CSSide1_7WindFrontRaw,3, 40,453,767)

*CSSide1_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_1WindBackRaw,0,568,463,324)

*CSSide1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_2WindBackRaw,0,422,484,333)

*CSSide1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_3WindBackRaw,0,374,428,351)

*CSSide1_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSide1_4WindBackRaw,0,302,392,410)
createRawDataForArray(*CSSide1_4WindBackRaw,1,284,382,508)

*CSSide1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_5WindBackRaw,0,353,487,508)

*CSSide1_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide1_6WindBackRaw,0,348,524,375)

*CSSide1_7WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSide1_7WindBackRaw,0,404,510,308)
createRawDataForArray(*CSSide1_7WindBackRaw,1,602,499,299)

;----CSSide2
*CSSide2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide2Raw,0,269,436,305,613,523,303)
createRawDataForArray(*CSSide2Raw,1,297,438,256,648,501,255)
createRawDataForArray(*CSSide2Raw,2,263,426,315,260,478,525)
createRawDataForArray(*CSSide2Raw,3,265,426,346,263,442,568)
createRawDataForArray(*CSSide2Raw,4,246,426,333,196,414,715)

*CSSide2_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide2_1WindBackRaw,0,147,469,298)

*CSSide2_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide2_2WindBackRaw,0,100,431,241)
createRawDataForArray(*CSSide2_2WindBackRaw,1,200,434,193)
createRawDataForArray(*CSSide2_2WindBackRaw,2,342,484,167)

*CSSide2_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSide2_3WindBackRaw,0,241,465,216)
createRawDataForArray(*CSSide2_3WindBackRaw,1,538,495,225)

*CSSide2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide2_4WindBackRaw,0,225,404,271)

*CSSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide2_1WindFrontRaw,0,374,529,564)

*CSSide2_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide2_5WindFrontRaw,0,178,382,372)
createRawDataForArray(*CSSide2_5WindFrontRaw,1,154,355,460)
createRawDataForArray(*CSSide2_5WindFrontRaw,2,109,336,671)
createRawDataForArray(*CSSide2_5WindFrontRaw,3, 87,313,752)

;----CSSide3
*CSSide3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide3Raw,0,317,356,338,192,354,352)
createRawDataForArray(*CSSide3Raw,1,346,404,284,315,365,281)
createRawDataForArray(*CSSide3Raw,2,312,327,297,310,326,264)
createRawDataForArray(*CSSide3Raw,3,168,390,342,168,220,308)
createRawDataForArray(*CSSide3Raw,4,125,458,346,118,397,688)

*CSSide3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_1WindFrontRaw,0,208,388,563)

*CSSide3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_2WindFrontRaw,0,179,465,242)

*CSSide3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_3WindFrontRaw,0,184,285,139)

*CSSide3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_4WindFrontRaw,0,131, 92, 73)

*CSSide3_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide3_5WindFrontRaw,0, 47, 51, 24)
createRawDataForArray(*CSSide3_5WindFrontRaw,1, 28, 92,106)
createRawDataForArray(*CSSide3_5WindFrontRaw,2, 53, 90,448)
createRawDataForArray(*CSSide3_5WindFrontRaw,3, 64, 93,479)

*CSSide3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_1WindBackRaw,0,461,345,358)

*CSSide3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_2WindBackRaw,0,323,318,346)

*CSSide3_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_3WindBackRaw,0,258,307,368)

*CSSide3_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide3_4WindBackRaw,0,187,283,350)

*CSSide3_5WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSide3_5WindBackRaw,0,191,352,430)
createRawDataForArray(*CSSide3_5WindBackRaw,1,161,423,549)

;----CSSide4
*CSSide4Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide4Raw,0,371,277,341)
createRawDataForArray(*CSSide4Raw,1,328,358,205)
createRawDataForArray(*CSSide4Raw,2,451,221,349)
createRawDataForArray(*CSSide4Raw,3,310,341,329,308,211,358)
createRawDataForArray(*CSSide4Raw,4,291,428,311,276,340,568)

*CSSide4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide4_1WindFrontRaw,0,265,269,428)

*CSSide4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide4_2WindFrontRaw,0,267,255,185)

*CSSide4_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide4_3WindFrontRaw,0,235,174, 95)

*CSSide4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide4_4WindFrontRaw,0,282,110, 93)

*CSSide4_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide4_5WindFrontRaw,0,169,160,135)
createRawDataForArray(*CSSide4_5WindFrontRaw,1,123,192,139)
createRawDataForArray(*CSSide4_5WindFrontRaw,2,164,266,600)
createRawDataForArray(*CSSide4_5WindFrontRaw,3,101,456,748)

*CSSide4_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide4_4WindBackRaw,0,265,303,342)

*CSSide4_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide4_5WindBackRaw,0,293,303,269)
createRawDataForArray(*CSSide4_5WindBackRaw,1,302,450,246)
createRawDataForArray(*CSSide4_5WindBackRaw,2,566,402,248)

;----CSSide5
*CSSide5Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide5Raw,0,412,283,345)
createRawDataForArray(*CSSide5Raw,1,329,358,198,329,282,532)
createRawDataForArray(*CSSide5Raw,2,425,157,370,318,412,541)
createRawDataForArray(*CSSide5Raw,3,191,247,363,191,93,387)
createRawDataForArray(*CSSide5Raw,4,227,431,337,137,248,623)

*CSSide5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide5_1WindFrontRaw,0,66,276,346)

*CSSide5_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide5_2WindFrontRaw,0,50,248,116)

*CSSide5_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide5_3WindFrontRaw,0,192,90,41)

*CSSide5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide5_4WindFrontRaw,0,137,53,107)

*CSSide5_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide5_5WindFrontRaw,0,86,41,79)
createRawDataForArray(*CSSide5_5WindFrontRaw,1,66,49,73)
createRawDataForArray(*CSSide5_5WindFrontRaw,2,54,39,396)
createRawDataForArray(*CSSide5_5WindFrontRaw,3,71,533,656)

*CSSide5_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide5_4WindBackRaw,0,158,285,402)

*CSSide5_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide5_5WindBackRaw,0,226,413,286)
createRawDataForArray(*CSSide5_5WindBackRaw,1,459,379,199)
createRawDataForArray(*CSSide5_5WindBackRaw,2,519,349,187)

;----CSSide6
*CSSide6Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*CSSide6Raw,0 ,404,357,369)
createRawDataForArray(*CSSide6Raw,1 ,374,412,335)
createRawDataForArray(*CSSide6Raw,2 ,338,431,332)
createRawDataForArray(*CSSide6Raw,3 ,394,430,243,622,494,232)
createRawDataForArray(*CSSide6Raw,4 ,433,425,179,696,494,177)
createRawDataForArray(*CSSide6Raw,5 ,403,434,210)
createRawDataForArray(*CSSide6Raw,6 ,382,400,359)
createRawDataForArray(*CSSide6Raw,7 ,347,342,384,340,347,469)
createRawDataForArray(*CSSide6Raw,8 ,378,339,321,366,337,273)
createRawDataForArray(*CSSide6Raw,9 ,286,358,355,281,266,312)
createRawDataForArray(*CSSide6Raw,10,278,428,337,246,372,667)

*CSSide6_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide6_2WindFrontRaw,0,363,335,314)
createRawDataForArray(*CSSide6_2WindFrontRaw,1,345,314,314)
createRawDataForArray(*CSSide6_2WindFrontRaw,2,308,350,552)

*CSSide6_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSide6_3WindFrontRaw,0,310,464,591)
createRawDataForArray(*CSSide6_3WindFrontRaw,1,289,454,674)

*CSSide6_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_4WindFrontRaw,0,306,461,227)

*CSSide6_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide6_5WindFrontRaw,0,332,466,166)
createRawDataForArray(*CSSide6_5WindFrontRaw,1,710,463,100)
createRawDataForArray(*CSSide6_5WindFrontRaw,2,745,445,129)

*CSSide6_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide6_6WindFrontRaw,0,385,412,332)
createRawDataForArray(*CSSide6_6WindFrontRaw,1,343,406,470)
createRawDataForArray(*CSSide6_6WindFrontRaw,2,312,394,620)
createRawDataForArray(*CSSide6_6WindFrontRaw,3,299,409,668)

*CSSide6_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_8WindFrontRaw,0,403,350,455)

*CSSide6_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_9WindFrontRaw,0,331,332,277)

*CSSide6_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_10WindFrontRaw,0,279,280,271)

*CSSide6_11WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide6_11WindFrontRaw,0,224,245,236)
createRawDataForArray(*CSSide6_11WindFrontRaw,1,218,223,312)
createRawDataForArray(*CSSide6_11WindFrontRaw,2,186,223,646)

*CSSide6_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_1WindBackRaw,0,356,350,338)

*CSSide6_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide6_2WindBackRaw,0,414,369,321)
createRawDataForArray(*CSSide6_2WindBackRaw,1,530,434,311)
createRawDataForArray(*CSSide6_2WindBackRaw,2,668,411,300)

*CSSide6_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_5WindBackRaw,0,421,490,494)

*CSSide6_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_4WindBackRaw,0,357,467,514)

*CSSide6_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_7WindBackRaw,0,493,394,178)

*CSSide6_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_9WindBackRaw,0,373,338,385)

*CSSide6_10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide6_10WindBackRaw,0,389,418,351)

;----CSSide7
*CSSide7Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide7Raw,0,435,145,355)
createRawDataForArray(*CSSide7Raw,1,314,126,351,310,119,311)
createRawDataForArray(*CSSide7Raw,2,155,399,346,153,132,503)
createRawDataForArray(*CSSide7Raw,3,196,415,327,191,416,496)

*CSSide7_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide7_1WindFrontRaw,0,364,125,328)
createRawDataForArray(*CSSide7_1WindFrontRaw,1,582,112,290)
createRawDataForArray(*CSSide7_1WindFrontRaw,2,632,181,278)

*CSSide7_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide7_2WindFrontRaw,0,282,105,262)

*CSSide7_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide7_3WindFrontRaw,0,99,69,194)

*CSSide7_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide7_4WindFrontRaw,0,52,35,161)
createRawDataForArray(*CSSide7_4WindFrontRaw,1,63,69,162)
createRawDataForArray(*CSSide7_4WindFrontRaw,2,61,97,679)
createRawDataForArray(*CSSide7_4WindFrontRaw,3,98,612,695)

;----CSSide8
*CSSide8Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSSide8Raw,0,429,145,357)
createRawDataForArray(*CSSide8Raw,1,276,292,311)
createRawDataForArray(*CSSide8Raw,2,280,337,250)
createRawDataForArray(*CSSide8Raw,3,462,215,382,483,77,262)
createRawDataForArray(*CSSide8Raw,4,247,413,296,248,220,504)
createRawDataForArray(*CSSide8Raw,5,302,346,347,246,361,568)
createRawDataForArray(*CSSide8Raw,6,204,418,336)

*CSSide8_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_1WindFrontRaw,0,401,110,196)

*CSSide8_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_2WindFrontRaw,0,253,61,194)

*CSSide8_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_3WindFrontRaw,0,146,54,185)

*CSSide8_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_4WindFrontRaw,0,187,170,210)

*CSSide8_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_5WindFrontRaw,0,213,122,204)

*CSSide8_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide8_6WindFrontRaw,0,128,131,149)
createRawDataForArray(*CSSide8_6WindFrontRaw,1,86,107,290)
createRawDataForArray(*CSSide8_6WindFrontRaw,2,67,257,442)
createRawDataForArray(*CSSide8_6WindFrontRaw,3,94,614,376)

*CSSide8_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide8_5WindBackRaw,0,186,221,260)

*CSSide8_6WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide8_6WindBackRaw,0,207,296,110)
createRawDataForArray(*CSSide8_6WindBackRaw,1,202,253,113)
createRawDataForArray(*CSSide8_6WindBackRaw,2,530,264,128)
createRawDataForArray(*CSSide8_6WindBackRaw,3,786,296,111)

;----CSSide9
*CSSide9Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSide9Raw,0,303,380,235)
createRawDataForArray(*CSSide9Raw,1,405,244,364,313,238,179)
createRawDataForArray(*CSSide9Raw,2,332,308,381,331,261,399)
createRawDataForArray(*CSSide9Raw,3,303,365,360,236,298,564)
createRawDataForArray(*CSSide9Raw,4,202,419,341)

*CSSide9_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide9_1WindFrontRaw,0,536,357,203)
createRawDataForArray(*CSSide9_1WindFrontRaw,1,660,297,171)
createRawDataForArray(*CSSide9_1WindFrontRaw,2,744,286,147)

*CSSide9_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide9_2WindFrontRaw,0,284,180,162)

*CSSide9_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSide9_3WindFrontRaw,0,270,51,155)

*CSSide9_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSSide9_4WindFrontRaw,0,148,87,217)
createRawDataForArray(*CSSide9_4WindFrontRaw,1,61,170,471)
createRawDataForArray(*CSSide9_4WindFrontRaw,2,56,141,504)
createRawDataForArray(*CSSide9_4WindFrontRaw,3,50,532,715)

*CSSide9_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide9_1WindBackRaw,0,235,371,470)
createRawDataForArray(*CSSide9_1WindBackRaw,1,263,337,526)
createRawDataForArray(*CSSide9_1WindBackRaw,2,330,312,515)

*CSSide9_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSide9_4WindBackRaw,0,358,323,283)
createRawDataForArray(*CSSide9_4WindBackRaw,1,342,267,286)
createRawDataForArray(*CSSide9_4WindBackRaw,2,414,277,282)

;----CSNeutral1
*CSNeutral1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSNeutral1Raw,0,261,416,276)
createRawDataForArray(*CSNeutral1Raw,1,160,421,337,159,448,612)
createRawDataForArray(*CSNeutral1Raw,2,188,373,333,189,539,731)
createRawDataForArray(*CSNeutral1Raw,3,261,310,322,252,611,669)

*CSNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral1_1WindFrontRaw,0,230,446,516)

*CSNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral1_2WindFrontRaw,0,150,412,526)
createRawDataForArray(*CSNeutral1_2WindFrontRaw,1,139,498,559)

*CSNeutral1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral1_3WindFrontRaw,0,237,347,301)

*CSNeutral1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral1_4WindFrontRaw,0,335,266,290)
createRawDataForArray(*CSNeutral1_4WindFrontRaw,1,327,242,339)
createRawDataForArray(*CSNeutral1_4WindFrontRaw,2,316,230,457)

*CSNeutral1_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral1_2WindBackRaw,0,588,415,279)
createRawDataForArray(*CSNeutral1_2WindBackRaw,1,598,472,295)

;----CSNeutral2
*CSNeutral2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral2Raw,0,358,263,333,604,257,252)
createRawDataForArray(*CSNeutral2Raw,1,381,208,353,500,207,346)
createRawDataForArray(*CSNeutral2Raw,2,222,342,328,216,192,450)

*CSNeutral2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral2_1WindFrontRaw,0,319,257,255)

*CSNeutral2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral2_2WindFrontRaw,0,310,207,263)

*CSNeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral2_3WindFrontRaw,0,203,163,264)
createRawDataForArray(*CSNeutral2_3WindFrontRaw,1,178,149,262)
createRawDataForArray(*CSNeutral2_3WindFrontRaw,2,161,235,654)

;----CSNeutral3
*CSNeutral3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral3Raw,0,227,416,301)
createRawDataForArray(*CSNeutral3Raw,1,84,414,357,79,528,684)
createRawDataForArray(*CSNeutral3Raw,2,177,383,348)

*CSNeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral3_2WindFrontRaw,0,28,371,501)
createRawDataForArray(*CSNeutral3_2WindFrontRaw,1,34,352,547)
createRawDataForArray(*CSNeutral3_2WindFrontRaw,2,46,414,796)

*CSNeutral3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral3_3WindFrontRaw,0,375,365,321)
createRawDataForArray(*CSNeutral3_3WindFrontRaw,1,336,351,290)
createRawDataForArray(*CSNeutral3_3WindFrontRaw,2,706,426,274)

*CSNeutral3_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral3_1WindBackRaw,0,235,254,264)
createRawDataForArray(*CSNeutral3_1WindBackRaw,1,571,303,260)
createRawDataForArray(*CSNeutral3_1WindBackRaw,2,613,483,243)

*CSNeutral3_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral3_2WindBackRaw,0,396,416,323)
createRawDataForArray(*CSNeutral3_2WindBackRaw,1,473,424,341)

;----CSNeutral4
*CSNeutral4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSNeutral4Raw,0,231,383,323)
createRawDataForArray(*CSNeutral4Raw,1,170,425,349,171,467,720)
createRawDataForArray(*CSNeutral4Raw,2,91,421,362,89,510,744)
createRawDataForArray(*CSNeutral4Raw,3,150,405,359)

*CSNeutral4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral4_2WindFrontRaw,0,143,460,588)

*CSNeutral4_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral4_3WindFrontRaw,0,35,432,512)
createRawDataForArray(*CSNeutral4_3WindFrontRaw,1,16,420,625)
createRawDataForArray(*CSNeutral4_3WindFrontRaw,2,33,448,703)

*CSNeutral4_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral4_1WindBackRaw,0,180,411,292)
createRawDataForArray(*CSNeutral4_1WindBackRaw,1,558,417,273)
createRawDataForArray(*CSNeutral4_1WindBackRaw,2,610,443,266)

*CSNeutral4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral4_2WindBackRaw,0,409,424,307)

*CSNeutral4_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral4_3WindBackRaw,0,435,471,295)
createRawDataForArray(*CSNeutral4_3WindBackRaw,1,409,557,278)

*CSNeutral4_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral4_4WindBackRaw,0,114,389,311)
createRawDataForArray(*CSNeutral4_4WindBackRaw,1,361,368,295)

;----CSNeutral5
*CSNeutral5Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSNeutral5Raw,0,291,397,302)
createRawDataForArray(*CSNeutral5Raw,1,137,413,367,136,439,626)
createRawDataForArray(*CSNeutral5Raw,2,213,373,361)
createRawDataForArray(*CSNeutral5Raw,3,248,428,353)

*CSNeutral5_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral5_1WindFrontRaw,0,384,395,521)
createRawDataForArray(*CSNeutral5_1WindFrontRaw,1,403,372,500)

*CSNeutral5_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral5_2WindFrontRaw,0,86,393,479)
createRawDataForArray(*CSNeutral5_2WindFrontRaw,1,73,381,559)
createRawDataForArray(*CSNeutral5_2WindFrontRaw,2,45,387,875)

*CSNeutral5_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral5_1WindBackRaw,0,153,417,264)
createRawDataForArray(*CSNeutral5_1WindBackRaw,1,275,383,222)
createRawDataForArray(*CSNeutral5_1WindBackRaw,2,520,383,223)

*CSNeutral5_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral5_2WindBackRaw,0,366,415,296)
createRawDataForArray(*CSNeutral5_2WindBackRaw,1,368,456,314)

*CSNeutral5_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSNeutral5_3WindBackRaw,0,149,346,315)
createRawDataForArray(*CSNeutral5_3WindBackRaw,1,410,347,320)

*CSNeutral5_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral5_4WindBackRaw,0,208,372,349)

;----CSNeutral6
*CSNeutral6Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSNeutral6Raw,0,340,203,322)
createRawDataForArray(*CSNeutral6Raw,1,324,355,318,465,202,285)
createRawDataForArray(*CSNeutral6Raw,2,353,314,333,350,547,328)
createRawDataForArray(*CSNeutral6Raw,3,238,386,340,239,412,587)

*CSNeutral6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral6_1WindFrontRaw,0,263,188,516)

*CSNeutral6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral6_2WindFrontRaw,0,265,169,219)

*CSNeutral6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSNeutral6_3WindFrontRaw,0,252,193,231)

*CSNeutral6_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSNeutral6_4WindFrontRaw,0,166,181,174)
createRawDataForArray(*CSNeutral6_4WindFrontRaw,1,165,238,258)
createRawDataForArray(*CSNeutral6_4WindFrontRaw,2,215,217,298)

;----CSnUp1
*CSnUpRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSnUpRaw,0,208,426,305,205,463,724)
createRawDataForArray(*CSnUpRaw,1,202,303,316,201,301,717)
createRawDataForArray(*CSnUpRaw,2,200,235,294,221,230,705)
createRawDataForArray(*CSnUpRaw,3,179,190,294,181,190,765)
createRawDataForArray(*CSnUpRaw,4,226,235,294)

;----CSUp1 new
*CSUp1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSUp1Raw,0,299,434,331)
createRawDataForArray(*CSUp1Raw,1,210,430,335,206,458,690)
createRawDataForArray(*CSUp1Raw,2,225,319,314,205,315,714)
createRawDataForArray(*CSUp1Raw,3,340,150,320,224,144,629)
createRawDataForArray(*CSUp1Raw,4,257,282,327)

*CSUp1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSUp1_1WindFrontRaw,0,250,464,539)
createRawDataForArray(*CSUp1_1WindFrontRaw,1,261,629,597)

*CSUp1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp1_2WindFrontRaw,0,198,452,578)

*CSUp1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp1_3WindFrontRaw,0,193,292,644)

*CSUp1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSUp1_4WindFrontRaw,0,163,107,329)
createRawDataForArray(*CSUp1_4WindFrontRaw,1,145, 73,305)
createRawDataForArray(*CSUp1_4WindFrontRaw,2,158, 69,628)

*CSUp1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp1_2WindBackRaw,0,634,441,330)

*CSUp1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp1_3WindBackRaw,0,443,445,313)

*CSUp1_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSUp1_4WindBackRaw,0,395,493,305)
createRawDataForArray(*CSUp1_4WindBackRaw,1,380,489,336)

;----CSUp2 new
*CSUp2Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSUp2Raw,0,287,379,347)
createRawDataForArray(*CSUp2Raw,1,297,317,339)
createRawDataForArray(*CSUp2Raw,2,411,158,326)
createRawDataForArray(*CSUp2Raw,3,346,344,290)
createRawDataForArray(*CSUp2Raw,4,355,389,341,347,355,278)
createRawDataForArray(*CSUp2Raw,5,212,420,343,208,453,599)
createRawDataForArray(*CSUp2Raw,6,356,324,343,215,317,564)

*CSUp2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_1WindFrontRaw,0,221,338,328)

*CSUp2_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSUp2_2WindFrontRaw,0,226,310,333)
createRawDataForArray(*CSUp2_2WindFrontRaw,1,351,487,490)

*CSUp2_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSUp2_3WindFrontRaw,0,270,150,368)
createRawDataForArray(*CSUp2_3WindFrontRaw,1,463,360,466)

*CSUp2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_4WindFrontRaw,0,284,119,280)

*CSUp2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_5WindFrontRaw,0,258,126,215)

*CSUp2_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_6WindFrontRaw,0,200,139,208)

*CSUp2_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSUp2_7WindFrontRaw,0,181,308,192)
createRawDataForArray(*CSUp2_7WindFrontRaw,1,153,301,396)
createRawDataForArray(*CSUp2_7WindFrontRaw,2,156,280,494)

*CSUp2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_5WindBackRaw,0,323,383,506)

*CSUp2_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSUp2_6WindBackRaw,0,302,342,389)

*CSUp2_7WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSUp2_7WindBackRaw,0,290,339,308)
createRawDataForArray(*CSUp2_7WindBackRaw,1,481,332,305)

;----CSBack1
*CSBack1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSBack1Raw,0,207,426,339)
createRawDataForArray(*CSBack1Raw,1,143,431,354,140,530,740)
createRawDataForArray(*CSBack1Raw,2,108,445,336,149,577,726)
createRawDataForArray(*CSBack1Raw,3,263,436,332)
createRawDataForArray(*CSBack1Raw,4,354,427,308)

*CSBack1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack1_2WindFrontRaw,0,130,525,606)

*CSBack1_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack1_3WindFrontRaw,0,85,518,692)
createRawDataForArray(*CSBack1_3WindFrontRaw,1,76,527,724)
createRawDataForArray(*CSBack1_3WindFrontRaw,2,66,592,734)

*CSBack1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack1_4WindFrontRaw,0,216,448,306)
createRawDataForArray(*CSBack1_4WindFrontRaw,1,328,406,304)
createRawDataForArray(*CSBack1_4WindFrontRaw,2,397,414,324)

*CSBack1_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack1_5WindBackRaw,0,269,410,282)
createRawDataForArray(*CSBack1_5WindBackRaw,1,279,405,280)
createRawDataForArray(*CSBack1_5WindBackRaw,2,630,399,275)

;----CSBack2
*CSBack2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSBack2Raw,0,349,422,329)
createRawDataForArray(*CSBack2Raw,1,243,246,359,180,245,595)
createRawDataForArray(*CSBack2Raw,2,430,191,308,233,169,307)
createRawDataForArray(*CSBack2Raw,3,413,281,200,542,208,198)

*CSBack2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack2_2WindFrontRaw,0,150,204,564)

*CSBack2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack2_3WindFrontRaw,0,106,63,206)

*CSBack2_4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSBack2_4WindFrontRaw,0,102,54,96)
createRawDataForArray(*CSBack2_4WindFrontRaw,1,94,93,52)
createRawDataForArray(*CSBack2_4WindFrontRaw,2,536,79,24)
createRawDataForArray(*CSBack2_4WindFrontRaw,3,764,120,55)
createRawDataForArray(*CSBack2_4WindFrontRaw,4,903,238,44)

*CSBack2_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack2_1WindBackRaw,0,173,420,451)
createRawDataForArray(*CSBack2_1WindBackRaw,1,220,408,452)
createRawDataForArray(*CSBack2_1WindBackRaw,2,338,403,422)

*CSBack2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack2_2WindBackRaw,0,261,443,540)

;----CSBack3
*CSBack3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSBack3Raw,0,343,397,145)
createRawDataForArray(*CSBack3Raw,1,393,406,115)
createRawDataForArray(*CSBack3Raw,2,323,399,178,321,439,515)
createRawDataForArray(*CSBack3Raw,3,283,366,234)
createRawDataForArray(*CSBack3Raw,4,333,346,155)

*CSBack3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack3_3WindFrontRaw,0,296,351,373)
createRawDataForArray(*CSBack3_3WindFrontRaw,1,251,348,463)
createRawDataForArray(*CSBack3_3WindFrontRaw,2,195,359,577)

*CSBack3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack3_1WindBackRaw,0,280,460,524)

*CSBack3_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSBack3_2WindBackRaw,0,232,387,96)
createRawDataForArray(*CSBack3_2WindBackRaw,1,286,374,72)

*CSBack3_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSBack3_3WindBackRaw,0,644,444,77)
createRawDataForArray(*CSBack3_3WindBackRaw,1,645,424,114)

;----CSBack4
*CSBack4Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSBack4Raw,0,223,410,367)
createRawDataForArray(*CSBack4Raw,1,371,420,252)
createRawDataForArray(*CSBack4Raw,2,328,417,238,327,464,585)
createRawDataForArray(*CSBack4Raw,3,355,414,375)
createRawDataForArray(*CSBack4Raw,4,271,397,367,271,483,410)
createRawDataForArray(*CSBack4Raw,5,85,380,358,84,420,605)

*CSBack4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_1WindFrontRaw,0,191,412,588)

*CSBack4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_4WindFrontRaw,0,224,395,561)

*CSBack4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_5WindFrontRaw,0,251,366,371)

*CSBack4_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack4_6WindFrontRaw,0,68,340,285)
createRawDataForArray(*CSBack4_6WindFrontRaw,1,22,295,226)
createRawDataForArray(*CSBack4_6WindFrontRaw,2,6,264,210)

*CSBack4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_2WindBackRaw,0,175,404,219)

*CSBack4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_3WindBackRaw,0,135,370,174)

*CSBack4_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_4WindBackRaw,0,304,449,99)

*CSBack4_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSBack4_5WindBackRaw,0,237,430,111)

*CSBack4_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSBack4_6WindBackRaw,0,80,414,162)
createRawDataForArray(*CSBack4_6WindBackRaw,1,87,424,194)

;----CSBack5
*CSBack5Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack5Raw,0,184,384,371)
createRawDataForArray(*CSBack5Raw,1,199,433,364,199,473,638)
createRawDataForArray(*CSBack5Raw,2,265,408,318)

*CSBack5_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSBack5_2WindFrontRaw,0,167,381,479)
createRawDataForArray(*CSBack5_2WindFrontRaw,1,141,513,600)
createRawDataForArray(*CSBack5_2WindFrontRaw,2,120,570,662)

*CSBack5_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSBack5_1WindBackRaw,0,145,473,625)
createRawDataForArray(*CSBack5_1WindBackRaw,1,147,467,559)

*CSBack5_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSBack5_2WindBackRaw,0,472,375,268)
createRawDataForArray(*CSBack5_2WindBackRaw,1,588,382,277)

;----CSDown1
*CSDown1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSDown1Raw,0,205,397,337)
createRawDataForArray(*CSDown1Raw,1,199,411,354,198,676,548)
createRawDataForArray(*CSDown1Raw,2,451,431,362)
createRawDataForArray(*CSDown1Raw,3,182,460,384,180,730,461)
createRawDataForArray(*CSDown1Raw,4,196,377,368,157,376,367)
createRawDataForArray(*CSDown1Raw,5,212,307,339,199,255,388)
createRawDataForArray(*CSDown1Raw,6,224,344,315,187,341,623)

*CSDown1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSDown1_2WindFrontRaw,0,150,366,156)
createRawDataForArray(*CSDown1_2WindFrontRaw,1,111,717,804)
createRawDataForArray(*CSDown1_2WindFrontRaw,2,77,708,842)

*CSDown1_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSDown1_3WindFrontRaw,0, 77, 41,160)
createRawDataForArray(*CSDown1_3WindFrontRaw,1, 73, 54, 67)
createRawDataForArray(*CSDown1_3WindFrontRaw,2, 33, 25,340)
createRawDataForArray(*CSDown1_3WindFrontRaw,3,  6, 16,365)

*CSDown1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_5WindFrontRaw,0,23,265,394)

*CSDown1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_6WindFrontRaw,0,22,124,278)

*CSDown1_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSDown1_7WindFrontRaw,0,2,64,181)
createRawDataForArray(*CSDown1_7WindFrontRaw,1,42,83,99)
createRawDataForArray(*CSDown1_7WindFrontRaw,2,76,33,71)
createRawDataForArray(*CSDown1_7WindFrontRaw,3,738,404,17)

*CSDown1_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSDown1_1WindBackRaw,0,224,373,282)
createRawDataForArray(*CSDown1_1WindBackRaw,1,662,362,247)

*CSDown1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_2WindBackRaw,0,232,514,391)

*CSDown1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_3WindBackRaw,0,518,549,67)

*CSDown1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_4WindBackRaw,0,146,573,7)

*CSDown1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_5WindBackRaw,0,177,473,112)

*CSDown1_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDown1_6WindBackRaw,0,183,492,272)

*CSDown1_7WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSDown1_7WindBackRaw,0,137,283,336)
createRawDataForArray(*CSDown1_7WindBackRaw,1,91,244,445)
createRawDataForArray(*CSDown1_7WindBackRaw,2,77,184,394)
createRawDataForArray(*CSDown1_7WindBackRaw,3,208,166,383)

;----CSDown2
*CSDown2Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSDown2Raw,0,181,394,340,182,440,589)
createRawDataForArray(*CSDown2Raw,1,193,392,338)

*CSDown2_1WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSDown2_1WindFrontRaw,0,171,450,325)
createRawDataForArray(*CSDown2_1WindFrontRaw,1,166,385,330)
createRawDataForArray(*CSDown2_1WindFrontRaw,2,160,249,293)
createRawDataForArray(*CSDown2_1WindFrontRaw,3,125,193,303)
createRawDataForArray(*CSDown2_1WindFrontRaw,4,102,78,290)

*CSDown2_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSDown2_2WindFrontRaw,0,77,275,252)
createRawDataForArray(*CSDown2_2WindFrontRaw,1,32,390,169)
createRawDataForArray(*CSDown2_2WindFrontRaw,2,32,480,99)

*CSDown2_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSDown2_1WindBackRaw,0,165,359,338)
createRawDataForArray(*CSDown2_1WindBackRaw,1,194,397,352)
createRawDataForArray(*CSDown2_1WindBackRaw,2,178,413,315)

;----CSHeavy
*CSHeavy1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSHeavy1Raw,0,277,426,292)
createRawDataForArray(*CSHeavy1Raw,1,314,432,266)
createRawDataForArray(*CSHeavy1Raw,2,233,437,334,518,496,314)
createRawDataForArray(*CSHeavy1Raw,3,405,416,339,413,483,449)
createRawDataForArray(*CSHeavy1Raw,4,321,408,273,315,419,493)
createRawDataForArray(*CSHeavy1Raw,5,354,411,233)

*CSHeavy1_1WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSHeavy1_1WindBackRaw,0,191,454,273)
createRawDataForArray(*CSHeavy1_1WindBackRaw,1,239,474,244)
createRawDataForArray(*CSHeavy1_1WindBackRaw,2,235,474,225)
createRawDataForArray(*CSHeavy1_1WindBackRaw,3,719,539,222)

*CSHeavy1_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSHeavy1_3WindBackRaw,0,226,430,239)
createRawDataForArray(*CSHeavy1_3WindBackRaw,1,396,446,181)

*CSHeavy1_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy1_5WindBackRaw,0,295,397,118)
createRawDataForArray(*CSHeavy1_5WindBackRaw,1,286,380,214)
createRawDataForArray(*CSHeavy1_5WindBackRaw,2,265,351,544)

*CSHeavy1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy1_4WindFrontRaw,0,241,367,482)

*CSHeavy1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy1_5WindFrontRaw,0,338,394,249)
createRawDataForArray(*CSHeavy1_5WindFrontRaw,1,312,366,232)
createRawDataForArray(*CSHeavy1_5WindFrontRaw,2,692,439,222)

;----CSHeavy2
*CSHeavy2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSHeavy2Raw,0,314,314,329)
createRawDataForArray(*CSHeavy2Raw,1,463,306,354)
createRawDataForArray(*CSHeavy2Raw,2,230,291,356,232,191,340)
createRawDataForArray(*CSHeavy2Raw,3,188,420,347,179,310,619)
createRawDataForArray(*CSHeavy2Raw,4,163,448,339)

*CSHeavy2_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSHeavy2_4WindFrontRaw,0,129,565,723)
createRawDataForArray(*CSHeavy2_4WindFrontRaw,1,83,554,705)
createRawDataForArray(*CSHeavy2_4WindFrontRaw,2,58,521,697)
createRawDataForArray(*CSHeavy2_4WindFrontRaw,3,40,510,738)

*CSHeavy2_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy2_1WindBackRaw,0,367,294,270)

*CSHeavy2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy2_2WindBackRaw,0,437,251,124)

*CSHeavy2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy2_3WindBackRaw,0,195,92,38)

*CSHeavy2_4WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSHeavy2_4WindBackRaw,0,77,79,1)
createRawDataForArray(*CSHeavy2_4WindBackRaw,1,8,62,31)
createRawDataForArray(*CSHeavy2_4WindBackRaw,2,17,150,687)
createRawDataForArray(*CSHeavy2_4WindBackRaw,3,20,385,686)
createRawDataForArray(*CSHeavy2_4WindBackRaw,4,96,540,807)

;----CSHeavy3
*CSHeavy3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSHeavy3Raw,0,366,424,162)
createRawDataForArray(*CSHeavy3Raw,1,429,424,244,366,479,546)
createRawDataForArray(*CSHeavy3Raw,2,266,441,360,448,466,344)
createRawDataForArray(*CSHeavy3Raw,3,287,424,337,610,462,336)
createRawDataForArray(*CSHeavy3Raw,4,319,417,353)

*CSHeavy3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy3_2WindBackRaw,0,337,411,217)

*CSHeavy3_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy3_3WindBackRaw,0,340,465,349)

*CSHeavy3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy3_2WindFrontRaw,0,507,445,450)

*CSHeavy3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy3_3WindFrontRaw,0,259,409,215)

*CSHeavy3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy3_4WindFrontRaw,0,236,386,305)

*CSHeavy3_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSHeavy3_5WindFrontRaw,0,228,369,282)
createRawDataForArray(*CSHeavy3_5WindFrontRaw,1,215,387,262)

;----CSHeavy4
*CSHeavy4Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*CSHeavy4Raw, 0,241,352,321,187,409,716)
createRawDataForArray(*CSHeavy4Raw, 1,393,410,368,261,562,585)
createRawDataForArray(*CSHeavy4Raw, 2,413,418,353,415,473,355)
createRawDataForArray(*CSHeavy4Raw, 3,418,319,182,637,316,178)
createRawDataForArray(*CSHeavy4Raw, 4,378,362,224)
createRawDataForArray(*CSHeavy4Raw, 5,401,302,358)
createRawDataForArray(*CSHeavy4Raw, 6,236,363,364)
createRawDataForArray(*CSHeavy4Raw, 8,372,320,207,307,255,217)
createRawDataForArray(*CSHeavy4Raw, 7,268,304,345,184,300,657)
createRawDataForArray(*CSHeavy4Raw, 9,410,343,169)
createRawDataForArray(*CSHeavy4Raw,10,407,382,128)

*CSHeavy4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_1WindFrontRaw,0,189,338,375)

*CSHeavy4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_2WindFrontRaw,0,449,338,373)

*CSHeavy4_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSHeavy4_3WindFrontRaw,0,394,333,399)
createRawDataForArray(*CSHeavy4_3WindFrontRaw,1,360,351,547)

*CSHeavy4_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_8WindFrontRaw,0,161,257,192)

*CSHeavy4_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_9WindFrontRaw,0,176,185,160)

*CSHeavy4_10WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy4_10WindFrontRaw,0,331,259,  6)
createRawDataForArray(*CSHeavy4_10WindFrontRaw,1,322,260,  7)
createRawDataForArray(*CSHeavy4_10WindFrontRaw,2,853,315, 30)

*CSHeavy4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_2WindBackRaw,0,167,413,542)

*CSHeavy4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_3WindBackRaw,0,162,412,348)

*CSHeavy4_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy4_4WindBackRaw,0,150,296,153)
createRawDataForArray(*CSHeavy4_4WindBackRaw,1,374,282,130)
createRawDataForArray(*CSHeavy4_4WindBackRaw,2,727,235, 86)

*CSHeavy4_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_5WindBackRaw,0,371,323,175)

*CSHeavy4_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_6WindBackRaw,0,358,279,180)

*CSHeavy4_7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy4_7WindBackRaw,0,211,272,194)
createRawDataForArray(*CSHeavy4_7WindBackRaw,1,179,273,335)
createRawDataForArray(*CSHeavy4_7WindBackRaw,2,293,226,338)

*CSHeavy4_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSHeavy4_9WindBackRaw,0,349,481,396)

*CSHeavy4_10WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHeavy4_10WindBackRaw,0,354,309,142)
createRawDataForArray(*CSHeavy4_10WindBackRaw,1,345,278,458)
createRawDataForArray(*CSHeavy4_10WindBackRaw,2,314,277,522)

;----CSDeath
*CSDeathRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSDeathRaw,0,207,425,306)
createRawDataForArray(*CSDeathRaw,1,264,406,340)
createRawDataForArray(*CSDeathRaw,2,279,321,345)
createRawDataForArray(*CSDeathRaw,3,265,308,277)
createRawDataForArray(*CSDeathRaw,4,220,355,355)
createRawDataForArray(*CSDeathRaw,5,214,487,429)
createRawDataForArray(*CSDeathRaw,6,212,466,447)

*CSDeath2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDeath2WindFrontRaw,0,208,436,468)

*CSDeath3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSDeath3WindFrontRaw,0,209,361,419)
createRawDataForArray(*CSDeath3WindFrontRaw,1,319,364,445)

*CSDeath4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSDeath4WindFrontRaw,0,268,261,266)
createRawDataForArray(*CSDeath4WindFrontRaw,1,608,238,219)
createRawDataForArray(*CSDeath4WindFrontRaw,2,689,237,198)

*CSDeath6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSDeath6WindFrontRaw,0,201,334,395)
createRawDataForArray(*CSDeath6WindFrontRaw,1,200,374,367)
createRawDataForArray(*CSDeath6WindFrontRaw,2,185,528,352)

*CSDeath5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSDeath5WindBackRaw,0,214,283,318)

;----CSSpawn
*CSSpawnRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*CSSpawnRaw,0 ,370,196,334)
createRawDataForArray(*CSSpawnRaw,1 ,378,207,363)
createRawDataForArray(*CSSpawnRaw,2 ,393,203,347)
createRawDataForArray(*CSSpawnRaw,3 ,360,199,363)
createRawDataForArray(*CSSpawnRaw,4 ,404,204,347)
createRawDataForArray(*CSSpawnRaw,5 ,429,220,354)
createRawDataForArray(*CSSpawnRaw,6 ,439,242,367)
createRawDataForArray(*CSSpawnRaw,7 ,428,238,334)
createRawDataForArray(*CSSpawnRaw,8 ,473,337,268)
createRawDataForArray(*CSSpawnRaw,9 ,442,231,293)
createRawDataForArray(*CSSpawnRaw,10,255,426,304)
createRawDataForArray(*CSSpawnRaw,11,264,372,336)
createRawDataForArray(*CSSpawnRaw,12,257,430,337)

*CSSpawn4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSpawn4WindFrontRaw,0,351,212,515)
createRawDataForArray(*CSSpawn4WindFrontRaw,1,341,294,604)

*CSSpawn5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSpawn5WindFrontRaw,0,369,381,460)

*CSSpawn6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSpawn6WindFrontRaw,0,366,203,358)

*CSSpawn7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSpawn7WindFrontRaw,0,408,230,332)

*CSSpawn8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSpawn8WindFrontRaw,0,394,299,322)
createRawDataForArray(*CSSpawn8WindFrontRaw,1,370,559,422)

*CSSpawn9WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSpawn9WindFrontRaw,0,457,224,247)
createRawDataForArray(*CSSpawn9WindFrontRaw,1,512,223,231)
createRawDataForArray(*CSSpawn9WindFrontRaw,2,545,364,204)

*CSSpawn10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSpawn10WindFrontRaw,0,439,232,297)

*CSSpawn11WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSpawn11WindFrontRaw,0,217,234,302)
createRawDataForArray(*CSSpawn11WindFrontRaw,1,209,227,304)
createRawDataForArray(*CSSpawn11WindFrontRaw,2,172,321,564)

*CSSpawn10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSpawn10WindBackRaw,0,440,236,345)

*CSSpawn11WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSpawn11WindBackRaw,0,433,372,392)
createRawDataForArray(*CSSpawn11WindBackRaw,1,409,377,438)

*CSSpawn12WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSpawn12WindBackRaw,0,250,445,336)
createRawDataForArray(*CSSpawn12WindBackRaw,1,272,438,344)

;----CSJump
*CSJumpRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSJumpRaw,0,267,430,306)
createRawDataForArray(*CSJumpRaw,1,333,428,334)
createRawDataForArray(*CSJumpRaw,2,375,390,330)
createRawDataForArray(*CSJumpRaw,3,242,368,334)
createRawDataForArray(*CSJumpRaw,4,272,348,348)
createRawDataForArray(*CSJumpRaw,5,292,328,346)

;----CSLand
*CSLandRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSLandRaw,0,256,469,327)
createRawDataForArray(*CSLandRaw,1,251,445,330)
createRawDataForArray(*CSLandRaw,2,242,437,332)

;----CSHit
*CSHitRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHitRaw,0,307,314,328)
createRawDataForArray(*CSHitRaw,1,432,323,293)
createRawDataForArray(*CSHitRaw,2,454,339,225)

;----CSDodge
*CSDodgeRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSDodgeRaw,0,132,432,336)
createRawDataForArray(*CSDodgeRaw,1,98,442,345)
createRawDataForArray(*CSDodgeRaw,2,168,462,339)
createRawDataForArray(*CSDodgeRaw,3,228,494,354)

;----CSParry
*CSParryRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSParryRaw,0,230,359,341)
createRawDataForArray(*CSParryRaw,1,283,274,344)
createRawDataForArray(*CSParryRaw,2,216,359,387)
createRawDataForArray(*CSParryRaw,3,426,350,377)
createRawDataForArray(*CSParryRaw,4,446,393,334)
createRawDataForArray(*CSParryRaw,5,291,343,256)
createRawDataForArray(*CSParryRaw,6,305,368,237)

;----CSSelection
*CSSelectionRaw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*CSSelectionRaw,0,466,131,356)
createRawDataForArray(*CSSelectionRaw,1,443,121,359)
createRawDataForArray(*CSSelectionRaw,2,389,100,360)
createRawDataForArray(*CSSelectionRaw,3,380,104,355)
createRawDataForArray(*CSSelectionRaw,4,355,134,356)
createRawDataForArray(*CSSelectionRaw,5,332,160,336)
createRawDataForArray(*CSSelectionRaw,6,335,174,338)
createRawDataForArray(*CSSelectionRaw,7,339,179,336)
createRawDataForArray(*CSSelectionRaw,8,338,173,334)
createRawDataForArray(*CSSelectionRaw,9,347,170,332)
createRawDataForArray(*CSSelectionRaw,10,338,166,338)

*CSSelection_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelection_2WindFrontRaw,0,427,111,442)

*CSSelection_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelection_3WindFrontRaw,0,380,94,429)

*CSSelection_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelection_4WindFrontRaw,0,359,93,466)

*CSSelection_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSelection_5WindFrontRaw,0,334,111,538)
createRawDataForArray(*CSSelection_5WindFrontRaw,1,317,117,450)
createRawDataForArray(*CSSelection_5WindFrontRaw,2,308,140,591)

*CSSelection_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelection_10WindFrontRaw,0,342,166,575)

*CSSelection_11WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSelection_11WindFrontRaw,0,362,154,589)
createRawDataForArray(*CSSelection_11WindFrontRaw,1,346,149,560)
createRawDataForArray(*CSSelection_11WindFrontRaw,2,338,148,553)

;----CSSelected
*CSSelectedRaw.rawdataArray=createRawDataArray(21)
createRawDataForArray(*CSSelectedRaw,0,272,270,351)
createRawDataForArray(*CSSelectedRaw,1,282,336,243)
createRawDataForArray(*CSSelectedRaw,2,430,216,328)
createRawDataForArray(*CSSelectedRaw,3,371,349,207)
createRawDataForArray(*CSSelectedRaw,4,398,280,237)
createRawDataForArray(*CSSelectedRaw,5,460,175,315)
createRawDataForArray(*CSSelectedRaw,6,461,175,312)
createRawDataForArray(*CSSelectedRaw,7,442,216,303)
createRawDataForArray(*CSSelectedRaw,8,323,342,235)
createRawDataForArray(*CSSelectedRaw,9,451,312,293)
createRawDataForArray(*CSSelectedRaw,10,316,259,359)
createRawDataForArray(*CSSelectedRaw,11,262,322,358)
createRawDataForArray(*CSSelectedRaw,12,245,419,284)
createRawDataForArray(*CSSelectedRaw,13,366,269,345)
createRawDataForArray(*CSSelectedRaw,14,329,304,346)
createRawDataForArray(*CSSelectedRaw,15,340,309,347)
createRawDataForArray(*CSSelectedRaw,16,316,333,351)
createRawDataForArray(*CSSelectedRaw,17,314,325,348)
createRawDataForArray(*CSSelectedRaw,18,328,336,343)
createRawDataForArray(*CSSelectedRaw,19,295,383,343)
createRawDataForArray(*CSSelectedRaw,20,296,349,353)
createRawDataForArray(*CSSelectedRaw,21,324,343,350)

*CSSelected_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_1WindFrontRaw,0,257,136,366)

*CSSelected_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_2WindFrontRaw,0,212,119,147)

*CSSelected_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_3WindFrontRaw,0,183,99,111)

*CSSelected_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_4WindFrontRaw,0,188,75,135)

*CSSelected_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_5WindFrontRaw,0,187,64,118)

*CSSelected_6WindFrontRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSSelected_6WindFrontRaw,0,191,93,107)
createRawDataForArray(*CSSelected_6WindFrontRaw,1,251,83,130)
createRawDataForArray(*CSSelected_6WindFrontRaw,2,241,71,113)
createRawDataForArray(*CSSelected_6WindFrontRaw,3,245,103,107)
createRawDataForArray(*CSSelected_6WindFrontRaw,4,514,123,105)
createRawDataForArray(*CSSelected_6WindFrontRaw,5,529,224,244)

*CSSelected_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_8WindFrontRaw,0,432,162,295)

*CSSelected_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_9WindFrontRaw,0,272,161,184)

*CSSelected_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_10WindFrontRaw,0,258,153,251)

*CSSelected_11WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_11WindFrontRaw,0,255,148,157)

*CSSelected_12WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_12WindFrontRaw,0,233,83,185)

*CSSelected_13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_13WindFrontRaw,0,130,86,167)

*CSSelected_14WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSelected_14WindFrontRaw,0,93,91,159)
createRawDataForArray(*CSSelected_14WindFrontRaw,1,152,88,239)
createRawDataForArray(*CSSelected_14WindFrontRaw,2,125,82,305)
createRawDataForArray(*CSSelected_14WindFrontRaw,3,118,447,402)
createRawDataForArray(*CSSelected_14WindFrontRaw,4,116,494,389)

*CSSelected_17WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSelected_17WindFrontRaw,0,309,305,387)
createRawDataForArray(*CSSelected_17WindFrontRaw,1,300,323,379)

*CSSelected_19WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_19WindFrontRaw,0,375,478,556)

*CSSelected_20WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSelected_20WindFrontRaw,0,291,332,362)
createRawDataForArray(*CSSelected_20WindFrontRaw,1,284,356,353)

*CSSelected_21WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_21WindFrontRaw,0,362,341,368)

*CSSelected_22WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSSelected_22WindFrontRaw,0,294,332,362)
createRawDataForArray(*CSSelected_22WindFrontRaw,1,319,302,364)
createRawDataForArray(*CSSelected_22WindFrontRaw,2,318,297,406)

*CSSelected_8WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSSelected_8WindBackRaw,0,461,325,400)
createRawDataForArray(*CSSelected_8WindBackRaw,1,446,336,509)

*CSSelected_10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_10WindBackRaw,0,421,182,185)

*CSSelected_11WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_11WindBackRaw,0,188,180,176)

*CSSelected_12WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_12WindBackRaw,0,176,175,188)

*CSSelected_13WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSSelected_13WindBackRaw,0,192,172,181)

*CSSelected_14WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSSelected_14WindBackRaw,0,188,187,175)
createRawDataForArray(*CSSelected_14WindBackRaw,1,184,203,196)
createRawDataForArray(*CSSelected_14WindBackRaw,2,433,219,173)
createRawDataForArray(*CSSelected_14WindBackRaw,3,429,214,201)
createRawDataForArray(*CSSelected_14WindBackRaw,4,457,205,334)
;----BPIdle1
*BPIdle1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*BPIdle1Raw,0,310,333,321)
createRawDataForArray(*BPIdle1Raw,1,326,334,344)
createRawDataForArray(*BPIdle1Raw,2,327,337,331)
createRawDataForArray(*BPIdle1Raw,3,314,349,303)
createRawDataForArray(*BPIdle1Raw,4,281,352,330)
createRawDataForArray(*BPIdle1Raw,5,256,370,344)
createRawDataForArray(*BPIdle1Raw,6,276,344,342)
createRawDataForArray(*BPIdle1Raw,7,315,316,334)
createRawDataForArray(*BPIdle1Raw,8,303,324,342)
createRawDataForArray(*BPIdle1Raw,9,270,341,342)

*BPIdle1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_1WindFrontRaw,0,265,326,645)
createRawDataForArray(*BPIdle1_1WindFrontRaw,1,336,324,637)

*BPIdle1_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_2WindFrontRaw,0,311,328,635)
createRawDataForArray(*BPIdle1_2WindFrontRaw,1,355,339,628)

*BPIdle1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_4WindFrontRaw,0,308,336,659)

*BPIdle1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_5WindFrontRaw,0,276,335,665)

*BPIdle1_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_6WindFrontRaw,0,248,346,703)
createRawDataForArray(*BPIdle1_6WindFrontRaw,1,241,376,736)

*BPIdle1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_7WindFrontRaw,0,257,341,601)

*BPIdle1_8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_8WindFrontRaw,0,258,310,625)
createRawDataForArray(*BPIdle1_8WindFrontRaw,1,256,303,634)

*BPIdle1_10WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_10WindFrontRaw,0,262,314,640)
createRawDataForArray(*BPIdle1_10WindFrontRaw,1,250,338,715)

*BPIdle1_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle1_1WindBackRaw,0,428,575,538)
createRawDataForArray(*BPIdle1_1WindBackRaw,1,430,603,537)

*BPIdle1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_4WindBackRaw,0,437,583,537)

*BPIdle1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_5WindBackRaw,0,449,572,535)

*BPIdle1_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle1_8WindBackRaw,0,416,572,538)

;----BPIdle2
*BPIdle2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPIdle2Raw,0,248,370,346)
createRawDataForArray(*BPIdle2Raw,1,217,426,335)
createRawDataForArray(*BPIdle2Raw,2,209,425,338)
createRawDataForArray(*BPIdle2Raw,3,221,419,343)
createRawDataForArray(*BPIdle2Raw,4,231,416,339)
createRawDataForArray(*BPIdle2Raw,5,253,354,343)

*BPIdle2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_1WindFrontRaw,0,242,331,674)

*BPIdle2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_2WindFrontRaw,0,208,343,715)

*BPIdle2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_3WindFrontRaw,0,195,368,737)

*BPIdle2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_5WindFrontRaw,0,207,411,740)

*BPIdle2_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPIdle2_6WindFrontRaw,0,213,350,696)
createRawDataForArray(*BPIdle2_6WindFrontRaw,1,223,322,620)
createRawDataForArray(*BPIdle2_6WindFrontRaw,2,367,320,604)

*BPIdle2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_2WindBackRaw,0,591,448,329)

*BPIdle2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_3WindBackRaw,0,599,429,334)

*BPIdle2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle2_5WindBackRaw,0,399,571,508)

;----BPIdle3
*BPIdle3Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*BPIdle3Raw,0,279,343,343)
createRawDataForArray(*BPIdle3Raw,1,246,367,337)
createRawDataForArray(*BPIdle3Raw,2,180,411,342)
createRawDataForArray(*BPIdle3Raw,3,194,372,342)
createRawDataForArray(*BPIdle3Raw,4,211,362,343)
createRawDataForArray(*BPIdle3Raw,5,200,367,345)
createRawDataForArray(*BPIdle3Raw,6,338,261,347)
createRawDataForArray(*BPIdle3Raw,7,268,311,345)

*BPIdle3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_2WindFrontRaw,0,241,343,711)

*BPIdle3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_3WindFrontRaw,0,178,350,601)

*BPIdle3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_4WindFrontRaw,0,180,372,586)

*BPIdle3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_5WindFrontRaw,0,181,376,764)

*BPIdle3_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_6WindFrontRaw,0,189,370,783)

*BPIdle3_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_7WindFrontRaw,0,192,260,617)

*BPIdle3_8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle3_8WindFrontRaw,0,258,254,544)
createRawDataForArray(*BPIdle3_8WindFrontRaw,1,248,246,576)

*BPIdle3_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_4WindBackRaw,0,388,360,355)

*BPIdle3_5WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPIdle3_5WindBackRaw,0,372,341,350)
createRawDataForArray(*BPIdle3_5WindBackRaw,1,459,335,358)

*BPIdle3_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_6WindBackRaw,0,379,362,430)

*BPIdle3_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_7WindBackRaw,0,354,507,478)

*BPIdle3_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPIdle3_8WindBackRaw,0,346,554,539)

;----BPFront
*BPMoveFrontRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*BPMoveFrontRaw,0,272,429,345)
createRawDataForArray(*BPMoveFrontRaw,1,251,437,347)
createRawDataForArray(*BPMoveFrontRaw,2,278,422,342)
createRawDataForArray(*BPMoveFrontRaw,3,369,426,321)
createRawDataForArray(*BPMoveFrontRaw,4,398,428,346)
createRawDataForArray(*BPMoveFrontRaw,5,390,429,347)
createRawDataForArray(*BPMoveFrontRaw,6,315,432,305)
createRawDataForArray(*BPMoveFrontRaw,7,265,430,323)
createRawDataForArray(*BPMoveFrontRaw,8,273,428,335)

;----BPMoveBack
*BPMoveBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPMoveBackRaw,0,351,405,342)
createRawDataForArray(*BPMoveBackRaw,1,313,411,327)
createRawDataForArray(*BPMoveBackRaw,2,284,422,349)
createRawDataForArray(*BPMoveBackRaw,3,272,423,347)

;----BPNeutral1
*BPNeutral1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*BPNeutral1Raw,0,360,288,330)
createRawDataForArray(*BPNeutral1Raw,1,316,417,353)
createRawDataForArray(*BPNeutral1Raw,2,157,423,364,156,494,636)
createRawDataForArray(*BPNeutral1Raw,3,352,274,334,126,276,597)
createRawDataForArray(*BPNeutral1Raw,4,413,354,231,371,246,230)
createRawDataForArray(*BPNeutral1Raw,5,454,433,192)
createRawDataForArray(*BPNeutral1Raw,6,420,457,257)
createRawDataForArray(*BPNeutral1Raw,7,397,451,360)
createRawDataForArray(*BPNeutral1Raw,8,222,396,332,202,396,462)
createRawDataForArray(*BPNeutral1Raw,9,335,233,378,214,222,517)

*BPNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_1WindFrontRaw,0,301,268,431)

*BPNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_2WindFrontRaw,0,284,254,392)

*BPNeutral1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_3WindFrontRaw,0,140,269,368)

*BPNeutral1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_4WindFrontRaw,0,69,235,355)

*BPNeutral1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_7WindFrontRaw,0,151,214,168)

*BPNeutral1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_8WindFrontRaw,0,150,269,191)

*BPNeutral1_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_9WindFrontRaw,0,153,275,189)

*BPNeutral1_10WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPNeutral1_10WindFrontRaw,0,91,164,213)
createRawDataForArray(*BPNeutral1_10WindFrontRaw,1,25,96,381)
createRawDataForArray(*BPNeutral1_10WindFrontRaw,2,23,56,351)
createRawDataForArray(*BPNeutral1_10WindFrontRaw,3,123,112,327)

*BPNeutral1_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_1WindBackRaw,0,383,311,452)

*BPNeutral1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_2WindBackRaw,0,354,434,538)

*BPNeutral1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_3WindBackRaw,0,361,412,571)

*BPNeutral1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_4WindBackRaw,0,353,415,536)

*BPNeutral1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_5WindBackRaw,0,112,167,184)

*BPNeutral1_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPNeutral1_6WindBackRaw,0,134,155,107)
createRawDataForArray(*BPNeutral1_6WindBackRaw,1,777,180,66)

*BPNeutral1_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_8WindBackRaw,0,367,447,434)

*BPNeutral1_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral1_9WindBackRaw,0,336,365,439)

*BPNeutral1_10WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPNeutral1_10WindBackRaw,0,273,332,403)
createRawDataForArray(*BPNeutral1_10WindBackRaw,1,293,321,370)

;----BPNeutral2
*BPNeutral2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPNeutral2Raw,0,386,388,369)
createRawDataForArray(*BPNeutral2Raw,1,365,381,347)
createRawDataForArray(*BPNeutral2Raw,2,351,209,363)
createRawDataForArray(*BPNeutral2Raw,3,117,419,371,110,183,518)

*BPNeutral2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral2_1WindFrontRaw,0,161,346,554)

*BPNeutral2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral2_2WindFrontRaw,0,155,341,269)

*BPNeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral2_3WindFrontRaw,0,197,155,212)

*BPNeutral2_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,0, 12,89,263)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,1, 35,128,231)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,2, 13,145,677)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,3, 1,443,768)

;----BPNeutral3
*BPNeutral3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3Raw,0,212,390,397)
createRawDataForArray(*BPNeutral3Raw,1,335,380,365)
createRawDataForArray(*BPNeutral3Raw,2,194,424,370,192,375,483)

*BPNeutral3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral3_1WindFrontRaw,0, 69,380,398)

*BPNeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,0, 52,360,343)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,1,219,317,290)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,2,649,340,273)

*BPNeutral3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,0,157,324,322)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,1,126,303,514)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,2, 87,398,571)

;----BPNeutral4
*BPNeutral4Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*BPNeutral4Raw,0,168,429,383)
createRawDataForArray(*BPNeutral4Raw,1,208,423,370)
createRawDataForArray(*BPNeutral4Raw,2,218,389,353)
createRawDataForArray(*BPNeutral4Raw,3,337,415,369)
createRawDataForArray(*BPNeutral4Raw,4,339,319,349)
createRawDataForArray(*BPNeutral4Raw,5,336,326,353,337,288,345)
createRawDataForArray(*BPNeutral4Raw,6,271,434,363,263,375,569)
createRawDataForArray(*BPNeutral4Raw,7,219,452,356)

*BPNeutral4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral4_4WindFrontRaw,0,195,357,344)

*BPNeutral4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral4_5WindFrontRaw,0,196,292,255)

*BPNeutral4_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral4_6WindFrontRaw,0,201,230,229)

*BPNeutral4_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPNeutral4_7WindFrontRaw,0,149,245,271)
createRawDataForArray(*BPNeutral4_7WindFrontRaw,1,112,288,256)
createRawDataForArray(*BPNeutral4_7WindFrontRaw,2,114,271,358)
createRawDataForArray(*BPNeutral4_7WindFrontRaw,3,117,281,583)

*BPNeutral4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral4_2WindBackRaw,0,150,462,559)

*BPNeutral4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral4_3WindBackRaw,0,146,368,375)

;----BPNeutral5
*BPNeutral5Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral5Raw,0,403,280,345)
createRawDataForArray(*BPNeutral5Raw,1,308,276,348,307,445,490)
createRawDataForArray(*BPNeutral5Raw,2,332,257,327)

*BPNeutral5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral5_1WindFrontRaw,0,387,370,398)

*BPNeutral5_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPNeutral5_2WindFrontRaw,0,267,362,425)
createRawDataForArray(*BPNeutral5_2WindFrontRaw,1,195,336,487)
createRawDataForArray(*BPNeutral5_2WindFrontRaw,2,128,365,645)
createRawDataForArray(*BPNeutral5_2WindFrontRaw,3,96,387,815)

*BPNeutral5_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral5_1WindBackRaw,0,455,269,399)

*BPNeutral5_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral5_2WindBackRaw,0,305,239,260)
createRawDataForArray(*BPNeutral5_2WindBackRaw,1,269,234,457)
createRawDataForArray(*BPNeutral5_2WindBackRaw,2,249,228,596)

;----BPNeutral6
*BPNeutral6Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral6Raw,0,433,244,317)
createRawDataForArray(*BPNeutral6Raw,1,280,391,343,279,238,496)
createRawDataForArray(*BPNeutral6Raw,2,402,325,326,279,295,358)

*BPNeutral6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral6_1WindFrontRaw,0,406,222,305)

*BPNeutral6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral6_2WindFrontRaw,0,278,219,291)

*BPNeutral6_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPNeutral6_3WindFrontRaw,0,249,224,502)
createRawDataForArray(*BPNeutral6_3WindFrontRaw,1,223,228,678)

*BPNeutral6_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral6_3WindBackRaw,0,368,293,348)
createRawDataForArray(*BPNeutral6_3WindBackRaw,1,376,284,349)
createRawDataForArray(*BPNeutral6_3WindBackRaw,2,401,267,330)

;----BPSide1
*BPSide1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSide1Raw,0,373,326,314)
createRawDataForArray(*BPSide1Raw,1,200,421,325,205,342,442)
createRawDataForArray(*BPSide1Raw,2,232,389,328,224,405,619)
createRawDataForArray(*BPSide1Raw,3,416,363,329,274,359,539)

*BPSide1_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide1_1WindBackRaw,0,290,321,548)

*BPSide1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide1_2WindBackRaw,0,408,486,524)

*BPSide1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide1_3WindBackRaw,0,423,425,523)

*BPSide1_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSide1_4WindBackRaw,0,416,361,539)
createRawDataForArray(*BPSide1_4WindBackRaw,1,426,347,511)

*BPSide1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide1_2WindFrontRaw,0,198,326,423)

*BPSide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide1_3WindFrontRaw,0,208,392,398)

*BPSide1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide1_4WindFrontRaw,0,221,350,380)
createRawDataForArray(*BPSide1_4WindFrontRaw,1,218,342,547)
createRawDataForArray(*BPSide1_4WindFrontRaw,2,189,345,691)

;----BPSide2
*BPSide2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPSide2Raw,0,197,380,340,189,355,530)
createRawDataForArray(*BPSide2Raw,1,375,392,316,216,389,289)
createRawDataForArray(*BPSide2Raw,2,380,312,328)
createRawDataForArray(*BPSide2Raw,3,387,248,327,385,231,290)
createRawDataForArray(*BPSide2Raw,4,224,367,337,215,203,543)

*BPSide2_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_1WindBackRaw,0,194,358,490)

*BPSide2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_2WindBackRaw,0,387,418,484)

*BPSide2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_4WindBackRaw,0,401,383,409)

*BPSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_1WindFrontRaw,0,450,369,425)

*BPSide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_2WindFrontRaw,0,178,357,275)

*BPSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_3WindFrontRaw,0,245,288,220)

*BPSide2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide2_4WindFrontRaw,0,327,211,188)

*BPSide2_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide2_5WindFrontRaw,0,196,160,145)
createRawDataForArray(*BPSide2_5WindFrontRaw,1,186,154,202)
createRawDataForArray(*BPSide2_5WindFrontRaw,2,145,170,605)

;----BPSide3
*BPSide3Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPSide3Raw,0,261,365,352)
createRawDataForArray(*BPSide3Raw,1,275,395,339)
createRawDataForArray(*BPSide3Raw,2,293,312,272)
createRawDataForArray(*BPSide3Raw,3,227,406,340,225,405,634)
createRawDataForArray(*BPSide3Raw,4,215,355,348,214,445,616)
createRawDataForArray(*BPSide3Raw,5,203,405,314,200,436,655)
createRawDataForArray(*BPSide3Raw,6,216,352,356,215,409,677)

*BPSide3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_1WindFrontRaw,0,205,402,588)

*BPSide3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_2WindFrontRaw,0,206,363,452)

*BPSide3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_3WindFrontRaw,0,259,398,500)

*BPSide3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_4WindFrontRaw,0,221,396,434)

*BPSide3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_5WindFrontRaw,0,196,419,400)

*BPSide3_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_6WindFrontRaw,0,181,351,399)

*BPSide3_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSide3_7WindFrontRaw,0,190,323,360)
createRawDataForArray(*BPSide3_7WindFrontRaw,1,181,307,400)
createRawDataForArray(*BPSide3_7WindFrontRaw,2,166,285,528)
createRawDataForArray(*BPSide3_7WindFrontRaw,3,173,359,532)

*BPSide3_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_5WindBackRaw,0,388,339,381)

*BPSide3_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide3_6WindBackRaw,0,229,403,555)

;----BPSide4
*BPSide4Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPSide4Raw,0,393,226,369)
createRawDataForArray(*BPSide4Raw,1,326,313,371,325,217,418)
createRawDataForArray(*BPSide4Raw,2,268,424,351,267,325,536)
createRawDataForArray(*BPSide4Raw,3,344,400,334,287,472,511)
createRawDataForArray(*BPSide4Raw,4,452,389,349,374,492,505)

*BPSide4_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSide4_1WindFrontRaw,0,412,212,350)
createRawDataForArray(*BPSide4_1WindFrontRaw,1,544,187,318)

*BPSide4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide4_2WindFrontRaw,0,288,163,378)

*BPSide4_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide4_3WindFrontRaw,0,214,185,371)

*BPSide4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide4_4WindFrontRaw,0,185,193,333)

*BPSide4_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide4_5WindFrontRaw,0,148,189,384)
createRawDataForArray(*BPSide4_5WindFrontRaw,1,176,226,534)
createRawDataForArray(*BPSide4_5WindFrontRaw,2,138,497,528)

*BPSide4_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide4_5WindBackRaw,0,260,473,471)
createRawDataForArray(*BPSide4_5WindBackRaw,1,345,456,377)
createRawDataForArray(*BPSide4_5WindBackRaw,2,489,446,325)

;----BPSide5
*BPSide5Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPSide5Raw,0,340,419,346)
createRawDataForArray(*BPSide5Raw,1,368,405,366,413,455,315)
createRawDataForArray(*BPSide5Raw,2,278,378,366,279,442,505)
createRawDataForArray(*BPSide5Raw,3,123,341,352,122,416,636)
createRawDataForArray(*BPSide5Raw,4,261,339,356,141,360,628)

*BPSide5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide5_1WindFrontRaw,0,308,403,303)

*BPSide5_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide5_2WindFrontRaw,0,337,387,288)

*BPSide5_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide5_3WindFrontRaw,0,240,353,260)

*BPSide5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide5_4WindFrontRaw,0,77,314,182)

*BPSide5_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide5_5WindFrontRaw,0,45,321,221)
createRawDataForArray(*BPSide5_5WindFrontRaw,1,25,304,404)
createRawDataForArray(*BPSide5_5WindFrontRaw,2,85,320,579)

;----BPSide6
*BPSide6Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPSide6Raw,0,362,384,306,359,253,563)
createRawDataForArray(*BPSide6Raw,1,395,367,352,383,417,413)
createRawDataForArray(*BPSide6Raw,2,351,406,320,544,405,301)
createRawDataForArray(*BPSide6Raw,3,361,253,343,390,243,282)
createRawDataForArray(*BPSide6Raw,4,231,421,367,223,236,575)
createRawDataForArray(*BPSide6Raw,5,198,440,345)

*BPSide6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide6_1WindFrontRaw,0,347,235,300)

*BPSide6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide6_2WindFrontRaw,0,341,238,317)

*BPSide6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide6_3WindFrontRaw,0,317,247,215)

*BPSide6_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSide6_4WindFrontRaw,0,315,164,210)
createRawDataForArray(*BPSide6_4WindFrontRaw,1,305,373,565)

*BPSide6_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSide6_5WindFrontRaw,0,183,131,232)
createRawDataForArray(*BPSide6_5WindFrontRaw,1,142,120,236)
createRawDataForArray(*BPSide6_5WindFrontRaw,2,139,156,434)
createRawDataForArray(*BPSide6_5WindFrontRaw,3,132,269,683)

;----BPSide7
*BPSide7Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPSide7Raw,0,384,424,366)
createRawDataForArray(*BPSide7Raw,1,339,308,359)
createRawDataForArray(*BPSide7Raw,2,310,402,361)
createRawDataForArray(*BPSide7Raw,3,378,250,367)
createRawDataForArray(*BPSide7Raw,4,225,346,353,224,201,391)
createRawDataForArray(*BPSide7Raw,5,191,455,333,161,355,628)
createRawDataForArray(*BPSide7Raw,6,203,426,333)

*BPSide7_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSide7_2WindFrontRaw,0,341,285,476)
createRawDataForArray(*BPSide7_2WindFrontRaw,1,344,249,450)

*BPSide7_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide7_3WindFrontRaw,0,267,410,488)

*BPSide7_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide7_4WindFrontRaw,0,289,156,341)
createRawDataForArray(*BPSide7_4WindFrontRaw,1,223,126,285)
createRawDataForArray(*BPSide7_4WindFrontRaw,2,250,116,304)

*BPSide7_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide7_5WindFrontRaw,0,187,136,384)

*BPSide7_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSide7_6WindFrontRaw,0,52,130,407)
createRawDataForArray(*BPSide7_6WindFrontRaw,1,41,149,511)
createRawDataForArray(*BPSide7_6WindFrontRaw,2,21,170,710)

*BPSide7_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide7_1WindBackRaw,0,378,325,314)

*BPSide7_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSide7_2WindBackRaw,0,310,326,294)

*BPSide7_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSide7_3WindBackRaw,0,301,332,337)
createRawDataForArray(*BPSide7_3WindBackRaw,1,483,465,328)

;----BPUp1
*BPUp1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPUp1Raw,0,425,337,333)
createRawDataForArray(*BPUp1Raw,1,386,437,341,465,338,362)
createRawDataForArray(*BPUp1Raw,2,289,388,345,290,434,485)
createRawDataForArray(*BPUp1Raw,3,475,116,359,292,116,475)

*BPUp1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp1_1WindFrontRaw,0,323,310,481)

*BPUp1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp1_2WindFrontRaw,0,381,442,436)

*BPUp1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp1_3WindFrontRaw,0,390,381,368)

*BPUp1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPUp1_4WindFrontRaw,0,208,105,374)
createRawDataForArray(*BPUp1_4WindFrontRaw,1,255,86,364)
createRawDataForArray(*BPUp1_4WindFrontRaw,2,322,90,369)

*BPUp1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp1_2WindBackRaw,0,362,290,298)

*BPUp1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp1_3WindBackRaw,0,282,311,285)

;----BPUp2
*BPUp2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPUp2Raw,0,419,197,329)
createRawDataForArray(*BPUp2Raw,1,439,354,305)
createRawDataForArray(*BPUp2Raw,2,355,391,342,425,468,309)
createRawDataForArray(*BPUp2Raw,3,277,330,300,273,325,538)
createRawDataForArray(*BPUp2Raw,4,408,249,293,273,239,519)

*BPUp2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_1WindFrontRaw,0,326,189,477)

*BPUp2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_2WindBackRaw,0,324,196,306)

*BPUp2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_3WindBackRaw,0,336,197,280)

*BPUp2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_4WindBackRaw,0,421,365,281)

*BPUp2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_4WindFrontRaw,0,274,325,288)

*BPUp2_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPUp2_5WindFrontRaw,0,232,237,283)
createRawDataForArray(*BPUp2_5WindFrontRaw,1,262,234,561)
createRawDataForArray(*BPUp2_5WindFrontRaw,2,298,240,531)

*UAUp3_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAUp3_1WindFrontRaw,0,343,392,317)
createRawDataForArray(*UAUp3_1WindFrontRaw,1,655,370,288)

*UAUp3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp3_2WindFrontRaw,0,273,291,390)

*UAUp3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp3_3WindFrontRaw,0,266,229,383)

*UAUp3_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp3_4WindFrontRaw,0,243,162,304)
createRawDataForArray(*UAUp3_4WindFrontRaw,1,231,116,251)
createRawDataForArray(*UAUp3_4WindFrontRaw,2,396,130,255)

;----BPDown1
*BPDown1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPDown1Raw,0,421,241,344)
createRawDataForArray(*BPDown1Raw,1,434,371,292)
createRawDataForArray(*BPDown1Raw,2,305,429,354,304,431,442)
createRawDataForArray(*BPDown1Raw,3,335,344,348)

*BPDown1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDown1_1WindFrontRaw,0,298,227,367)

*BPDown1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDown1_2WindFrontRaw,0,279,217,218)
createRawDataForArray(*BPDown1_2WindFrontRaw,1,270,196,180)
createRawDataForArray(*BPDown1_2WindFrontRaw,2,484,264,164)

*BPDown1_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPDown1_3WindFrontRaw,0,249,373,240)
createRawDataForArray(*BPDown1_3WindFrontRaw,1,232,354,254)
createRawDataForArray(*BPDown1_3WindFrontRaw,2,194,389,579)
createRawDataForArray(*BPDown1_3WindFrontRaw,3,197,505,720)

;----BPDown2
*BPDown2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPDown2Raw,0,352,287,385)
createRawDataForArray(*BPDown2Raw,1,449,350,196)
createRawDataForArray(*BPDown2Raw,2,274,437,379,272,404,420)
createRawDataForArray(*BPDown2Raw,3,366,391,323)

*BPDown2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDown2_1WindFrontRaw,0,468,222,366)

*BPDown2_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDown2_2WindFrontRaw,0,325,199,137)
createRawDataForArray(*BPDown2_2WindFrontRaw,1,451,246,95)
createRawDataForArray(*BPDown2_2WindFrontRaw,2,721,302,114)

*BPDown2_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPDown2_3WindFrontRaw,0,197,355,108)
createRawDataForArray(*BPDown2_3WindFrontRaw,1,196,399,521)
createRawDataForArray(*BPDown2_3WindFrontRaw,2,156,443,729)
createRawDataForArray(*BPDown2_3WindFrontRaw,3,124,458,812)

;----BPDown3
*BPDown3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDown3Raw,0,386,226,373)
createRawDataForArray(*BPDown3Raw,1,442,245,344)
createRawDataForArray(*BPDown3Raw,2,343,368,369,404,448,542)

*BPDown3_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPDown3_1WindFrontRaw,0,375,357,452)
createRawDataForArray(*BPDown3_1WindFrontRaw,1,452,324,424)

*BPDown3_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPDown3_2WindFrontRaw,0,380,182,340)
createRawDataForArray(*BPDown3_2WindFrontRaw,1,450,177,350)

*BPDown3_3WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPDown3_3WindFrontRaw,0,314,168,500)
createRawDataForArray(*BPDown3_3WindFrontRaw,1,298,308,423)
createRawDataForArray(*BPDown3_3WindFrontRaw,2,246,451,380)
createRawDataForArray(*BPDown3_3WindFrontRaw,3,213,476,334)
createRawDataForArray(*BPDown3_3WindFrontRaw,4,236,578,333)

*BPDown3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDown3_1WindBackRaw,0,309,197,361)

;----BPDown4
*BPDown4Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPDown4Raw,0,252,372,326)
createRawDataForArray(*BPDown4Raw,1,263,368,355)
createRawDataForArray(*BPDown4Raw,2,280,433,347,280,498,632)
createRawDataForArray(*BPDown4Raw,3,244,434,342)
createRawDataForArray(*BPDown4Raw,4,162,428,359)

*BPDown4_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPDown4_3WindFrontRaw,0,233,317,421)
createRawDataForArray(*BPDown4_3WindFrontRaw,1,193,471,467)
createRawDataForArray(*BPDown4_3WindFrontRaw,2,156,624,507)
createRawDataForArray(*BPDown4_3WindFrontRaw,3,137,721,494)

*BPDown4_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDown4_1WindBackRaw,0,359,492,488)

*BPDown4_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDown4_2WindBackRaw,0,213,335,378)
createRawDataForArray(*BPDown4_2WindBackRaw,1,219,292,380)
createRawDataForArray(*BPDown4_2WindBackRaw,2,284,291,462)

;----BPBack1
*BPBack1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPBack1Raw,0,348,317,355)
createRawDataForArray(*BPBack1Raw,1,261,425,348,257,369,618)
createRawDataForArray(*BPBack1Raw,2,338,417,340,180,578,621)
createRawDataForArray(*BPBack1Raw,3,355,401,334,272,607,609)

*BPBack1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPBack1_1WindFrontRaw,0,299,301,379)
createRawDataForArray(*BPBack1_1WindFrontRaw,1,321,299,559)

*BPBack1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack1_2WindFrontRaw,0,215,329,604)

*BPBack1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack1_3WindFrontRaw,0,130,414,318)

*BPBack1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPBack1_4WindFrontRaw,0, 82,430,318)
createRawDataForArray(*BPBack1_4WindFrontRaw,1,111,453,293)
createRawDataForArray(*BPBack1_4WindFrontRaw,2,207,461,275)

;----BPBack2
*BPBack2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPBack2Raw,0,493,276,346)
createRawDataForArray(*BPBack2Raw,1,448,215,357)
createRawDataForArray(*BPBack2Raw,2,314,278,345,309,236,421)
createRawDataForArray(*BPBack2Raw,3,208,385,332,202,293,611)
createRawDataForArray(*BPBack2Raw,4,245,383,349,173,446,625)
createRawDataForArray(*BPBack2Raw,5,272,398,316,255,542,650)

*BPBack2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_1WindFrontRaw,0,508,119,356)

*BPBack2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_2WindFrontRaw,0,444,140,349)

*BPBack2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_3WindFrontRaw,0,305,149,409)

*BPBack2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_4WindFrontRaw,0,195,196,453)

*BPBack2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_5WindFrontRaw,0,146,237,588)

*BPBack2_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPBack2_6WindFrontRaw,0,126,238,563)
createRawDataForArray(*BPBack2_6WindFrontRaw,1,131,225,625)
createRawDataForArray(*BPBack2_6WindFrontRaw,2,133,462,625)

*BPBack2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_4WindBackRaw,0,458,403,506)

*BPBack2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_5WindBackRaw,0,431,374,500)

*BPBack2_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack2_6WindBackRaw,0,435,370,500)

;----BPBack3
*BPBack3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPBack3Raw,0,307,328,366)
createRawDataForArray(*BPBack3Raw,1,361,244,376,393,243,436)
createRawDataForArray(*BPBack3Raw,2,153,396,303,153,223,626)
createRawDataForArray(*BPBack3Raw,3,113,430,365,107,417,728)
createRawDataForArray(*BPBack3Raw,4,223,431,356,95,507,639)

*BPBack3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack3_1WindFrontRaw,0,317,321,350)

*BPBack3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack3_2WindFrontRaw,0,295,179,378)

*BPBack3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack3_3WindFrontRaw,0,63,134,419)

*BPBack3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack3_4WindFrontRaw,0,26,129,477)

*BPBack3_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPBack3_5WindFrontRaw,0,6,237,476)
createRawDataForArray(*BPBack3_5WindFrontRaw,1,12,287,531)
createRawDataForArray(*BPBack3_5WindFrontRaw,2,53,383,635)

;----BPBack4
*BPBack4Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPBack4Raw,0,220,409,336)
createRawDataForArray(*BPBack4Raw,1,337,429,337,210,439,578)
createRawDataForArray(*BPBack4Raw,2,393,424,327,333,572,373)
createRawDataForArray(*BPBack4Raw,3,395,356,333,527,357,301)
createRawDataForArray(*BPBack4Raw,4,249,372,338,243,262,408)
createRawDataForArray(*BPBack4Raw,5,329,400,316,223,393,588)
createRawDataForArray(*BPBack4Raw,6,351,376,346)

*BPBack4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_2WindBackRaw,0,211,442,543)

*BPBack4_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPBack4_3WindBackRaw,0,194,419,369)
createRawDataForArray(*BPBack4_3WindBackRaw,1,178,381,588)

*BPBack4_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPBack4_4WindBackRaw,0,330,347,292)
createRawDataForArray(*BPBack4_4WindBackRaw,1,698,362,229)

*BPBack4_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_5WindBackRaw,0,394,480,467)

*BPBack4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_5WindFrontRaw,0,239,238,297)

*BPBack4_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPBack4_6WindFrontRaw,0,210,233,337)
createRawDataForArray(*BPBack4_6WindFrontRaw,1,207,221,524)
createRawDataForArray(*BPBack4_6WindFrontRaw,2,239,307,608)

;----BPHeavy1
*BPHeavy1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPHeavy1Raw,0,324,416,303)
createRawDataForArray(*BPHeavy1Raw,1,409,398,288)
createRawDataForArray(*BPHeavy1Raw,2,422,353,321,580,354,252)
createRawDataForArray(*BPHeavy1Raw,3,336,272,359,329,248,302)
createRawDataForArray(*BPHeavy1Raw,4,155,399,351,148,264,626)
createRawDataForArray(*BPHeavy1Raw,5,254,432,287,224,418,557)
createRawDataForArray(*BPHeavy1Raw,6,426,433,332,222,508,365)

*BPHeavy1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_1WindFrontRaw,0,292,332,565)

*BPHeavy1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_2WindFrontRaw,0,281,354,253)

*BPHeavy1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_3WindFrontRaw,0,276,321,162)

*BPHeavy1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_4WindFrontRaw,0,277,160,117)

*BPHeavy1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_5WindFrontRaw,0,115,145,147)

*BPHeavy1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_6WindFrontRaw,0,137,131,88)

*BPHeavy1_7WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPHeavy1_7WindFrontRaw,0,107,73,70)
createRawDataForArray(*BPHeavy1_7WindFrontRaw,1,58,59,223)
createRawDataForArray(*BPHeavy1_7WindFrontRaw,2,52,146,164)
createRawDataForArray(*BPHeavy1_7WindFrontRaw,3,109,161,120)
createRawDataForArray(*BPHeavy1_7WindFrontRaw,4,835,542,90)

*BPHeavy1_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy1_1WindBackRaw,0,429,519,553)

;----BPHeavy2
*BPHeavy2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPHeavy2Raw,0,307,410,332)
createRawDataForArray(*BPHeavy2Raw,1,250,416,321)
createRawDataForArray(*BPHeavy2Raw,2,311,421,330)
createRawDataForArray(*BPHeavy2Raw,3,197,423,339,196,436,552)
createRawDataForArray(*BPHeavy2Raw,4,145,414,369,144,413,738)
createRawDataForArray(*BPHeavy2Raw,5,160,433,348)

*BPHeavy2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy2_1WindFrontRaw,0,292,376,443)

*BPHeavy2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy2_2WindFrontRaw,0,194,414,541)

*BPHeavy2_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPHeavy2_3WindFrontRaw,0,176,369,548)
createRawDataForArray(*BPHeavy2_3WindFrontRaw,1,174,347,565)

*BPHeavy2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy2_4WindFrontRaw,0,156,389,295)

*BPHeavy2_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPHeavy2_5WindFrontRaw,0,100,353,325)
createRawDataForArray(*BPHeavy2_5WindFrontRaw,1,65,338,527)
createRawDataForArray(*BPHeavy2_5WindFrontRaw,2,38,315,730)
createRawDataForArray(*BPHeavy2_5WindFrontRaw,3,26,317,869)

*BPHeavy2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy2_4WindBackRaw,0,189,428,547)

*BPHeavy2_5WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPHeavy2_5WindBackRaw,0,142,409,433)
createRawDataForArray(*BPHeavy2_5WindBackRaw,1,151,417,439)

;----BPHeavy3
*BPHeavy3Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*BPHeavy3Raw,0,415,426,292)
createRawDataForArray(*BPHeavy3Raw,1,387,435,352)
createRawDataForArray(*BPHeavy3Raw,2,124,399,366,118,399,522)
createRawDataForArray(*BPHeavy3Raw,3,404,265,330,129,206,359)
createRawDataForArray(*BPHeavy3Raw,4,365,422,363,411,264,245)
createRawDataForArray(*BPHeavy3Raw,5,178,367,377,177,437,555)
createRawDataForArray(*BPHeavy3Raw,6,386,243,343,176,234,536)
createRawDataForArray(*BPHeavy3Raw,7,388,301,348)

*BPHeavy3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy3_2WindFrontRaw,0,375,527,278)

*BPHeavy3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy3_3WindFrontRaw,0,80,364,289)

*BPHeavy3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy3_4WindFrontRaw,0,30,136,313)

*BPHeavy3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy3_5WindFrontRaw,0,9,98,122)

*BPHeavy3_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPHeavy3_6WindFrontRaw,0,58,102,89)

*BPHeavy3_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPHeavy3_7WindFrontRaw,0,38,127,73)
createRawDataForArray(*BPHeavy3_7WindFrontRaw,1,36,67,24)
createRawDataForArray(*BPHeavy3_7WindFrontRaw,2,50,38,25)
createRawDataForArray(*BPHeavy3_7WindFrontRaw,3,41,24,320)

;----BPHit
*BPHitRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPHitRaw,0,480,348,278)
createRawDataForArray(*BPHitRaw,1,431,370,303)
createRawDataForArray(*BPHitRaw,2,387,378,346)

;----BPDeath
*BPDeathRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*BPDeathRaw,0,182,367,334)
createRawDataForArray(*BPDeathRaw,1,157,346,302)
createRawDataForArray(*BPDeathRaw,2,259,310,269)
createRawDataForArray(*BPDeathRaw,3,228,317,183)
createRawDataForArray(*BPDeathRaw,4,249,372,86 )
createRawDataForArray(*BPDeathRaw,5,242,495,37 )
createRawDataForArray(*BPDeathRaw,6,245,505,34 )
createRawDataForArray(*BPDeathRaw,7,254,484,51 )
createRawDataForArray(*BPDeathRaw,8,242,505,34 )

*BPDeath2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath2WindBackRaw,0,398,365,550)

*BPDeath3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath3WindBackRaw,0,457,307,280)

*BPDeath4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath4WindBackRaw,0,463,290,171)

*BPDeath5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath5WindBackRaw,0,594,342,113)

*BPDeath6_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath6_1WindBackRaw,0,519,374,52)

*BPDeath6_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath6_2WindBackRaw,0,295,527,683)

*BPDeath2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath2WindFrontRaw,0,141,352,295)

*BPDeath3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath3WindFrontRaw,0,151,301,319)

*BPDeath4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath4WindFrontRaw,0,154,298,190)

*BPDeath5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath5WindFrontRaw,0,216,291, 66)

*BPDeath6_1WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPDeath6_1WindFrontRaw,0,546,279,  3)
createRawDataForArray(*BPDeath6_1WindFrontRaw,1,570,268, 60)
createRawDataForArray(*BPDeath6_1WindFrontRaw,2,796,423, 42)
createRawDataForArray(*BPDeath6_1WindFrontRaw,3,923,523, 12)
createRawDataForArray(*BPDeath6_1WindFrontRaw,4,860,543, 31)

*BPDeath6_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDeath6_2WindFrontRaw,0,678,559, 48)
createRawDataForArray(*BPDeath6_2WindFrontRaw,1,486,454, 41)
createRawDataForArray(*BPDeath6_2WindFrontRaw,2,466,431, 14)

*BPDeath6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath6_3WindFrontRaw,0,201,372,698)

*BPDeath7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath7WindFrontRaw,0,239,519,693)

*BPDeath8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPDeath8WindFrontRaw,0,236,546,686)
createRawDataForArray(*BPDeath8WindFrontRaw,1,222,540,667)

;----BPSpawn
*BPSpawnRaw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*BPSpawnRaw,0 ,409,418,336)
createRawDataForArray(*BPSpawnRaw,1 ,402,433,345)
createRawDataForArray(*BPSpawnRaw,2 ,412,434,288)
createRawDataForArray(*BPSpawnRaw,3 ,462,429,224)
createRawDataForArray(*BPSpawnRaw,4 ,527,394,191)
createRawDataForArray(*BPSpawnRaw,5 ,458,404,294)
createRawDataForArray(*BPSpawnRaw,6 ,422,367,306)
createRawDataForArray(*BPSpawnRaw,7 ,382,352,313)
createRawDataForArray(*BPSpawnRaw,8 ,349,287,316)
createRawDataForArray(*BPSpawnRaw,9 ,367,284,342)
createRawDataForArray(*BPSpawnRaw,10,301,310,343)
createRawDataForArray(*BPSpawnRaw,11,181,407,298)

*BPSpawn2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn2WindBackRaw,0,482,580,436)

*BPSpawn3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn3WindBackRaw,0,583,491,287)

*BPSpawn4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn4WindBackRaw,0,580,463,222)

*BPSpawn5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSpawn5WindBackRaw,0,645,391,187)
createRawDataForArray(*BPSpawn5WindBackRaw,1,691,383,184)
createRawDataForArray(*BPSpawn5WindBackRaw,2,731,374,169)

*BPSpawn6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn6WindBackRaw,0,552,400,189)

*BPSpawn7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSpawn7WindBackRaw,0,383,341,201)
createRawDataForArray(*BPSpawn7WindBackRaw,1,380,331,405)
createRawDataForArray(*BPSpawn7WindBackRaw,2,366,328,514)

*BPSpawn8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn8WindBackRaw,0,440,475,196)

*BPSpawn9WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSpawn9WindBackRaw,0,345,515,307)
createRawDataForArray(*BPSpawn9WindBackRaw,1,321,484,517)

*BPSpawn12WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn12WindBackRaw,0,428,553,531)

*BPSpawn2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn2WindFrontRaw,0,392,431,338)

*BPSpawn3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn3WindFrontRaw,0,377,448,487)

*BPSpawn4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn4WindFrontRaw,0,366,445,480)

*BPSpawn5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSpawn5WindFrontRaw,0,435,559,448)
createRawDataForArray(*BPSpawn5WindFrontRaw,1,470,563,457)

*BPSpawn6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn6WindFrontRaw,0,440,408,314)

*BPSpawn7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn7WindFrontRaw,0,436,362,281)

*BPSpawn8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn8WindFrontRaw,0,398,343,259)

*BPSpawn9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn9WindFrontRaw,0,357,264,403)

*BPSpawn10WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSpawn10WindFrontRaw,0,373,232,376)
createRawDataForArray(*BPSpawn10WindFrontRaw,1,533,646,435)

*BPSpawn11WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSpawn11WindFrontRaw,0,277,188,358)

*BPSpawn12WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPSpawn12WindFrontRaw,0,160,189,428)
createRawDataForArray(*BPSpawn12WindFrontRaw,1,125,183,463)
createRawDataForArray(*BPSpawn12WindFrontRaw,2,105,163,670)

;----BPJump
*BPJumpRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPJumpRaw,0,377,341,341)
createRawDataForArray(*BPJumpRaw,1,367,322,325)
createRawDataForArray(*BPJumpRaw,2,406,289,344)
createRawDataForArray(*BPJumpRaw,3,362,244,271)
createRawDataForArray(*BPJumpRaw,4,431,210,345)
createRawDataForArray(*BPJumpRaw,5,401,169,353)
createRawDataForArray(*BPJumpRaw,6,377,229,345)

;----BPLand
*BPLandRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPLandRaw,0,387,258,329)
createRawDataForArray(*BPLandRaw,1,319,424,332)
createRawDataForArray(*BPLandRaw,2,346,428,327)
createRawDataForArray(*BPLandRaw,3,234,360,332)

;----BPDodge
*BPDodgeRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDodgeRaw,0,196,427,334)
createRawDataForArray(*BPDodgeRaw,1,198,398,351)
createRawDataForArray(*BPDodgeRaw,2,223,333,338)

;----BPParry
*BPParryRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPParryRaw,0,199,405,356)
createRawDataForArray(*BPParryRaw,1,301,316,387)
createRawDataForArray(*BPParryRaw,2,334,350,370)
createRawDataForArray(*BPParryRaw,3,410,371,354)
createRawDataForArray(*BPParryRaw,4,419,355,331)
createRawDataForArray(*BPParryRaw,5,447,361,345)

;----BPSelection
*BPSelectionRaw.rawdataArray=createRawDataArray(15)
createRawDataForArray(*BPSelectionRaw,0,367,338,371)
createRawDataForArray(*BPSelectionRaw,1,360,336,369)
createRawDataForArray(*BPSelectionRaw,2,327,374,369)
createRawDataForArray(*BPSelectionRaw,3,314,370,359)
createRawDataForArray(*BPSelectionRaw,4,338,350,365)
createRawDataForArray(*BPSelectionRaw,5,384,310,342)
createRawDataForArray(*BPSelectionRaw,6,413,340,337)
createRawDataForArray(*BPSelectionRaw,7,393,373,323)
createRawDataForArray(*BPSelectionRaw,8,387,377,323)
createRawDataForArray(*BPSelectionRaw,9,383,381,322)
createRawDataForArray(*BPSelectionRaw,10,383,379,328)
createRawDataForArray(*BPSelectionRaw,11,390,381,330)
createRawDataForArray(*BPSelectionRaw,12,392,383,333)
createRawDataForArray(*BPSelectionRaw,13,400,381,334)
createRawDataForArray(*BPSelectionRaw,14,394,383,332)
createRawDataForArray(*BPSelectionRaw,15,397,382,332)

*BPSelection_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_2WindFrontRaw,0,378,335,390)

*BPSelection_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_3WindFrontRaw,0,317,339,364)

*BPSelection_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_4WindFrontRaw,0,305,356,356)

*BPSelection_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_5WindFrontRaw,0,304,339,356)

*BPSelection_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_6WindFrontRaw,0,306,300,330)

*BPSelection_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelection_7WindFrontRaw,0,322,292,316)

*BPSelection_8WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSelection_8WindFrontRaw,0,344,280,385)
createRawDataForArray(*BPSelection_8WindFrontRaw,1,356,274,392)
createRawDataForArray(*BPSelection_8WindFrontRaw,2,355,402,398)
createRawDataForArray(*BPSelection_8WindFrontRaw,3,543,460,399)

*BPSelection_10WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPSelection_10WindFrontRaw,0,540,402,394)
createRawDataForArray(*BPSelection_10WindFrontRaw,1,553,440,391)

;----BPSelected
*BPSelectedRaw.rawdataArray=createRawDataArray(13)
createRawDataForArray(*BPSelectedRaw,0,359,363,313)
createRawDataForArray(*BPSelectedRaw,1,395,381,337)
createRawDataForArray(*BPSelectedRaw,2,348,389,368)
createRawDataForArray(*BPSelectedRaw,3,335,422,299)
createRawDataForArray(*BPSelectedRaw,4,354,366,350)
createRawDataForArray(*BPSelectedRaw,5,384,362,343)
createRawDataForArray(*BPSelectedRaw,6,407,361,346)
createRawDataForArray(*BPSelectedRaw,7,415,364,341)
createRawDataForArray(*BPSelectedRaw,8,410,386,328)
createRawDataForArray(*BPSelectedRaw,9,401,396,325)
createRawDataForArray(*BPSelectedRaw,10,400,396,324)
createRawDataForArray(*BPSelectedRaw,11,398,389,328)
createRawDataForArray(*BPSelectedRaw,12,399,391,330)
createRawDataForArray(*BPSelectedRaw,13,404,388,330)

*BPSelected_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_2WindFrontRaw,0,378,369,321)

*BPSelected_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_3WindFrontRaw,0,318,366,326)

*BPSelected_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_4WindFrontRaw,0,300,363,379)

*BPSelected_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSelected_5WindFrontRaw,0,284,357,439)
createRawDataForArray(*BPSelected_5WindFrontRaw,1,283,362,470)
createRawDataForArray(*BPSelected_5WindFrontRaw,2,282,401,478)
createRawDataForArray(*BPSelected_5WindFrontRaw,3,282,524,604)

*BPSelected_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_2WindBackRaw,0,360,521,534)

*BPSelected_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_3WindBackRaw,0,362,560,380)

*BPSelected_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPSelected_4WindBackRaw,0,285,383,264)

*BPSelected_5WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPSelected_5WindBackRaw,0,293,341,250)
createRawDataForArray(*BPSelected_5WindBackRaw,1,304,311,255)
createRawDataForArray(*BPSelected_5WindBackRaw,2,490,307,255)
createRawDataForArray(*BPSelected_5WindBackRaw,3,496,318,252)
createRawDataForArray(*BPSelected_5WindBackRaw,4,508,316,352)

;----UAIdle 1
*UAIdle1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*UAIdle1Raw,0,412,415,327)
createRawDataForArray(*UAIdle1Raw,1,413,412,327)
createRawDataForArray(*UAIdle1Raw,2,426,406,307)
createRawDataForArray(*UAIdle1Raw,3,423,404,302)
createRawDataForArray(*UAIdle1Raw,4,417,408,325)
createRawDataForArray(*UAIdle1Raw,5,424,411,339)
createRawDataForArray(*UAIdle1Raw,6,425,416,336)
createRawDataForArray(*UAIdle1Raw,7,428,413,332)
createRawDataForArray(*UAIdle1Raw,8,424,424,334)
createRawDataForArray(*UAIdle1Raw,9,420,418,326)

*UAIdle1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAIdle1_1WindFrontRaw,0,406,495,468)
createRawDataForArray(*UAIdle1_1WindFrontRaw,1,398,491,494)

*UAIdle1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle1_2WindFrontRaw,0,467,483,326)

*UAIdle1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle1_3WindFrontRaw,0,412,432,285)

*UAIdle1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle1_5WindFrontRaw,0,445,501,319)

*UAIdle1_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAIdle1_6WindFrontRaw,0,421,506,521)
createRawDataForArray(*UAIdle1_6WindFrontRaw,1,406,501,565)

;----UAIdle2
*UAIdle2Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*UAIdle2Raw,0,429,409,343)
createRawDataForArray(*UAIdle2Raw,1,438,410,340)
createRawDataForArray(*UAIdle2Raw,2,439,410,327)
createRawDataForArray(*UAIdle2Raw,3,447,411,320)
createRawDataForArray(*UAIdle2Raw,4,453,412,307)
createRawDataForArray(*UAIdle2Raw,5,450,405,324)
createRawDataForArray(*UAIdle2Raw,6,433,408,338)
createRawDataForArray(*UAIdle2Raw,7,423,413,348)

*UAIdle2_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAIdle2_5WindFrontRaw,0,533,470,300)
createRawDataForArray(*UAIdle2_5WindFrontRaw,1,684,466,287)

*UAIdle2_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle2_6WindFrontRaw,0,473,475,419)

*UAIdle2_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle2_7WindFrontRaw,0,435,501,453)

*UAIdle2_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAIdle2_8WindFrontRaw,0,406,530,561)


;----UAFront1
*UAMoveFront1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*UAMoveFront1Raw,0,426,400,329)
createRawDataForArray(*UAMoveFront1Raw,1,413,391,315)
createRawDataForArray(*UAMoveFront1Raw,2,417,396,317)
createRawDataForArray(*UAMoveFront1Raw,3,407,412,346)
createRawDataForArray(*UAMoveFront1Raw,4,366,412,343)
createRawDataForArray(*UAMoveFront1Raw,5,385,396,333)
createRawDataForArray(*UAMoveFront1Raw,6,401,391,316)

*UAMoveFront1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_1WindFrontRaw,0,429,496,454)

*UAMoveFront1_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAMoveFront1_2WindFrontRaw,0,408,459,307)
createRawDataForArray(*UAMoveFront1_2WindFrontRaw,1,585,454,292)

*UAMoveFront1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_5WindFrontRaw,0,453,473,319)

*UAMoveFront1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_6WindFrontRaw,0,398,393,317)

*UAMoveFront1_7WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAMoveFront1_7WindFrontRaw,0,354,410,391)
createRawDataForArray(*UAMoveFront1_7WindFrontRaw,1,343,498,561)

*UAMoveFront1_12WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_12WindFrontRaw,0,383,526,515)

*UAMoveFront1_11WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_11WindBackRaw,0,476,406,377)

*UAMoveFront1_12WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveFront1_12WindBackRaw,0,445,435,434)

;----UAMoveBack1
*UAMoveBack1Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*UAMoveBack1Raw, 0,425,403,317)
createRawDataForArray(*UAMoveBack1Raw, 1,412,407,311)
createRawDataForArray(*UAMoveBack1Raw, 2,410,407,279)
createRawDataForArray(*UAMoveBack1Raw, 3,398,393,290)
createRawDataForArray(*UAMoveBack1Raw, 4,407,389,298)
createRawDataForArray(*UAMoveBack1Raw, 5,414,390,317)
createRawDataForArray(*UAMoveBack1Raw, 6,380,407,320)
createRawDataForArray(*UAMoveBack1Raw, 7,372,412,318)
createRawDataForArray(*UAMoveBack1Raw, 8,420,414,328)
createRawDataForArray(*UAMoveBack1Raw, 9,433,416,317)
createRawDataForArray(*UAMoveBack1Raw,10,433,413,334)

*UAMoveBack1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_1WindFrontRaw,0,454,498,467)

*UAMoveBack1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_2WindFrontRaw,0,470,518,302)

*UAMoveBack1_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAMoveBack1_3WindFrontRaw,0,504,484,259)
createRawDataForArray(*UAMoveBack1_3WindFrontRaw,1,689,484,243)

*UAMoveBack1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_4WindFrontRaw,0,387,484,573)

*UAMoveBack1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_7WindFrontRaw,0,371,490,313)

*UAMoveBack1_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_9WindFrontRaw,0,365,515,316)

*UAMoveBack1_11WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAMoveBack1_11WindFrontRaw,0,459,485,459)

;----UANeutral1
*UANeutral1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UANeutral1Raw,0,407,367,345)
createRawDataForArray(*UANeutral1Raw,1,310,401,363,309,410,517)
createRawDataForArray(*UANeutral1Raw,2,373,381,355)
createRawDataForArray(*UANeutral1Raw,3,338,398,345,338,456,557)
createRawDataForArray(*UANeutral1Raw,4,393,395,345)
createRawDataForArray(*UANeutral1Raw,5,355,398,331,353,492,567)

*UANeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral1_2WindFrontRaw,0,271,356,364)
createRawDataForArray(*UANeutral1_2WindFrontRaw,1,239,393,514)
createRawDataForArray(*UANeutral1_2WindFrontRaw,2,204,433,680)

*UANeutral1_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UANeutral1_4WindFrontRaw,0,473,419,315)
createRawDataForArray(*UANeutral1_4WindFrontRaw,1,597,393,302)

*UANeutral1_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UANeutral1_6WindFrontRaw,0,527,400,305)
createRawDataForArray(*UANeutral1_6WindFrontRaw,1,595,383,296)

*UANeutral1_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral1_4WindBackRaw,0,312,414,518)
createRawDataForArray(*UANeutral1_4WindBackRaw,1,283,466,588)
createRawDataForArray(*UANeutral1_4WindBackRaw,2,244,541,678)

*UANeutral1_6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral1_6WindBackRaw,0,318,461,471)
createRawDataForArray(*UANeutral1_6WindBackRaw,1,280,499,562)
createRawDataForArray(*UANeutral1_6WindBackRaw,2,247,518,690)

;----UANeutral2
*UANeutral2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral2Raw,0,432,360,325)
createRawDataForArray(*UANeutral2Raw,1,332,429,381,333,376,488)
createRawDataForArray(*UANeutral2Raw,2,330,430,363,328,484,588)

*UANeutral2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral2_1WindFrontRaw,0,370,341,309)

*UANeutral2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral2_2WindFrontRaw,0,313,308,345)

*UANeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UANeutral2_3WindFrontRaw,0,274,455,519)
createRawDataForArray(*UANeutral2_3WindFrontRaw,1,239,542,687)

;----UANeutral3
*UANeutral3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral3Raw,0,386,371,344)
createRawDataForArray(*UANeutral3Raw,1,382,380,319,381,379,558)
createRawDataForArray(*UANeutral3Raw,2,392,383,321)

*UANeutral3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral3_1WindFrontRaw,0,408,429,307)

*UANeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral3_2WindFrontRaw,0,360,367,256)
createRawDataForArray(*UANeutral3_2WindFrontRaw,1,330,334,248)
createRawDataForArray(*UANeutral3_2WindFrontRaw,2,323,308,248)

*UANeutral3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral3_1WindBackRaw,0,366,365,458)

;----UANeutral4
*UANeutral4Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UANeutral4Raw,0,438,357,363)
createRawDataForArray(*UANeutral4Raw,1,444,348,282)
createRawDataForArray(*UANeutral4Raw,2,492,319,385,491,421,254)
createRawDataForArray(*UANeutral4Raw,3,320,364,321,319,361,410)
createRawDataForArray(*UANeutral4Raw,4,324,336,327)

*UANeutral4_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral4_2WindFrontRaw,0,528,289,231)
createRawDataForArray(*UANeutral4_2WindFrontRaw,1,691,303,207)
createRawDataForArray(*UANeutral4_2WindFrontRaw,2,723,403,189)

*UANeutral4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral4_5WindFrontRaw,0,305,349,455)

*UANeutral4_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral4_1WindBackRaw,0,434,350,347)

*UANeutral4_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral4_2WindBackRaw,0,494,310,270)
createRawDataForArray(*UANeutral4_2WindBackRaw,1,511,302,253)
createRawDataForArray(*UANeutral4_2WindBackRaw,2,551,293,238)

*UANeutral4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UANeutral4_3WindBackRaw,0,466,372,247)

*UANeutral4_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UANeutral4_4WindBackRaw,0,279,321,215)
createRawDataForArray(*UANeutral4_4WindBackRaw,1,258,322,319)
createRawDataForArray(*UANeutral4_4WindBackRaw,2,231,282,451)

;----UASide1
*UASide1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*UASide1Raw,0,389,385,303)
createRawDataForArray(*UASide1Raw,1,335,369,302)
createRawDataForArray(*UASide1Raw,2,420,394,330,446,388,331)
createRawDataForArray(*UASide1Raw,3,339,422,355,338,488,555)
createRawDataForArray(*UASide1Raw,4,364,397,351,364,496,573)
createRawDataForArray(*UASide1Raw,5,432,388,330,376,459,529)
createRawDataForArray(*UASide1Raw,6,421,360,351)
createRawDataForArray(*UASide1Raw,7,419,397,337)
createRawDataForArray(*UASide1Raw,8,309,406,349,307,414,541)
createRawDataForArray(*UASide1Raw,9,413,407,360,335,473,457)

*UASide1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_1WindFrontRaw,0,465,395,281)

*UASide1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide1_2WindFrontRaw,0,472,332,243)
createRawDataForArray(*UASide1_2WindFrontRaw,1,464,320,188)
createRawDataForArray(*UASide1_2WindFrontRaw,2,629,300,177)

*UASide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_3WindFrontRaw,0,420,365,314)

*UASide1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_4WindFrontRaw,0,311,416,314)

*UASide1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_5WindFrontRaw,0,291,428,332)

*UASide1_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide1_6WindFrontRaw,0,243,432,367)
createRawDataForArray(*UASide1_6WindFrontRaw,1,208,442,479)
createRawDataForArray(*UASide1_6WindFrontRaw,2,246,453,616)

*UASide1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_8WindFrontRaw,0,425,452,380)

*UASide1_9WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASide1_9WindFrontRaw,0,582,420,314)
createRawDataForArray(*UASide1_9WindFrontRaw,1,655,412,299)

*UASide1_10WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide1_10WindFrontRaw,0,274,379,424)
createRawDataForArray(*UASide1_10WindFrontRaw,1,279,385,419)
createRawDataForArray(*UASide1_10WindFrontRaw,2,329,507,381)
createRawDataForArray(*UASide1_10WindFrontRaw,3,593,502,363)

*UASide1_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_8WindBackRaw,0,436,354,373)

*UASide1_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide1_9WindBackRaw,0,292,392,401)

*UASide1_10WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASide1_10WindBackRaw,0,367,429,490)
createRawDataForArray(*UASide1_10WindBackRaw,1,338,573,522)

;----UASide2
*UASide2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UASide2Raw,0,420,378,363)
createRawDataForArray(*UASide2Raw,1,421,407,359,421,378,413)
createRawDataForArray(*UASide2Raw,2,345,440,354,345,426,528)
createRawDataForArray(*UASide2Raw,3,375,428,318,309,517,500)
createRawDataForArray(*UASide2Raw,4,383,407,382)

*UASide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide2_1WindFrontRaw,0,378,350,304)

*UASide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide2_2WindFrontRaw,0,385,334,311)

*UASide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide2_3WindFrontRaw,0,307,278,360)

*UASide2_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide2_4WindFrontRaw,0,302,519,504)
createRawDataForArray(*UASide2_4WindFrontRaw,1,256,485,516)
createRawDataForArray(*UASide2_4WindFrontRaw,2,221,479,493)

*UASide2_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide2_4WindBackRaw,0,269,242,291)
createRawDataForArray(*UASide2_4WindBackRaw,1,250,249,327)
createRawDataForArray(*UASide2_4WindBackRaw,2,233,394,563)

;----UASide3
*UASide3Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide3Raw,0,454,382,315)
createRawDataForArray(*UASide3Raw,1,387,370,375)
createRawDataForArray(*UASide3Raw,2,292,426,350,292,376,458)
createRawDataForArray(*UASide3Raw,3,322,450,372,322,511,483)

*UASide3_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASide3_1WindFrontRaw,0,224,298,255)
createRawDataForArray(*UASide3_1WindFrontRaw,1,516,325,241)

*UASide3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide3_2WindFrontRaw,0,363,302,269)

*UASide3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide3_3WindFrontRaw,0,224,298,255)

*UASide3_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide3_4WindFrontRaw,0,211,313,203)
createRawDataForArray(*UASide3_4WindFrontRaw,1,183,281,429)
createRawDataForArray(*UASide3_4WindFrontRaw,2,165,311,564)
createRawDataForArray(*UASide3_4WindFrontRaw,3,197,527,629)

;----UASide4
*UASide4Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UASide4Raw,0,385,359,316)
createRawDataForArray(*UASide4Raw,1,395,384,316)
createRawDataForArray(*UASide4Raw,2,402,379,323)
createRawDataForArray(*UASide4Raw,3,414,411,351,468,418,358)
createRawDataForArray(*UASide4Raw,4,327,417,368,326,461,479)
createRawDataForArray(*UASide4Raw,5,363,351,320,360,456,569)

*UASide4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide4_1WindFrontRaw,0,346,276,295)

*UASide4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide4_2WindFrontRaw,0,332,358,267)

*UASide4_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASide4_3WindFrontRaw,0,370,344,235)
createRawDataForArray(*UASide4_3WindFrontRaw,1,537,507,307)

*UASide4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide4_4WindFrontRaw,0,445,382,224)

*UASide4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide4_5WindFrontRaw,0,283,414,288)

*UASide4_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide4_6WindFrontRaw,0,270,419,228)
createRawDataForArray(*UASide4_6WindFrontRaw,1,235,391,410)
createRawDataForArray(*UASide4_6WindFrontRaw,2,217,411,507)

;----UASide5
; *UASide5Raw.rawdataArray=createRawDataArray(2)
; createRawDataForArray(*UASide5Raw,0,382,406,314)
; createRawDataForArray(*UASide5Raw,1,273,413,333,273,455,451)
; createRawDataForArray(*UASide5Raw,2,291,439,358,273,474,627)
; 
; *UASide5_2WindFrontRaw.rawdataArray=createRawDataArray(3)
; createRawDataForArray(*UASide5_2WindFrontRaw,0,236,378,316)
; createRawDataForArray(*UASide5_2WindFrontRaw,1,204,333,499)
; createRawDataForArray(*UASide5_2WindFrontRaw,2,155,373,627)
; createRawDataForArray(*UASide5_2WindFrontRaw,3,115,418,765)
*UASide5Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide5Raw,0,382,406,314)
createRawDataForArray(*UASide5Raw,1,480,396,373)
createRawDataForArray(*UASide5Raw,2,273,413,336,274,424,449)
createRawDataForArray(*UASide5Raw,3,291,439,358,273,474,627)

*UASide5_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide5_2WindFrontRaw,0,400,374,349)
createRawDataForArray(*UASide5_2WindFrontRaw,1,606,378,312)
createRawDataForArray(*UASide5_2WindFrontRaw,2,636,493,309)

*UASide5_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide5_3WindFrontRaw,0,236,378,316)
createRawDataForArray(*UASide5_3WindFrontRaw,1,204,333,499)
createRawDataForArray(*UASide5_3WindFrontRaw,2,155,373,627)
createRawDataForArray(*UASide5_3WindFrontRaw,3,115,418,765)

*UASide5_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide5_2WindBackRaw,0,389,461,486)

;----UASide6
*UASide6Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UASide6Raw,0,423,379,295)
createRawDataForArray(*UASide6Raw,1,371,354,379,465,349,311)
createRawDataForArray(*UASide6Raw,2,458,364,368,456,358,413)
createRawDataForArray(*UASide6Raw,3,410,349,317,410,350,461)
createRawDataForArray(*UASide6Raw,4,390,364,360,391,358,512)

*UASide6_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide6_1WindFrontRaw,0,311,318,278)
createRawDataForArray(*UASide6_1WindFrontRaw,1,344,316,235)
createRawDataForArray(*UASide6_1WindFrontRaw,2,463,351,225)

*UASide6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide6_2WindFrontRaw,0,352,331,282)

*UASide6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide6_3WindFrontRaw,0,419,335,222)

*UASide6_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide6_4WindFrontRaw,0,363,309,157)

*UASide6_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide6_5WindFrontRaw,0,352,297,104)
createRawDataForArray(*UASide6_5WindFrontRaw,1,314,325,173)
createRawDataForArray(*UASide6_5WindFrontRaw,2,328,288,472)
createRawDataForArray(*UASide6_5WindFrontRaw,3,288,355,553)

*UASide6_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide6_3WindBackRaw,0,497,352,245)

*UASide6_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASide6_4WindBackRaw,0,480,336,158)

*UASide6_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide6_5WindBackRaw,0,436,323,251)
createRawDataForArray(*UASide6_5WindBackRaw,1,402,340,455)
createRawDataForArray(*UASide6_5WindBackRaw,2,379,386,524)

;----UABack1
*UABack1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*UABack1Raw,0,425,393,339)
createRawDataForArray(*UABack1Raw,1,442,408,348)
createRawDataForArray(*UABack1Raw,2,456,376,366)
createRawDataForArray(*UABack1Raw,3,452,378,356)
createRawDataForArray(*UABack1Raw,4,438,391,292)
createRawDataForArray(*UABack1Raw,5,453,411,267)
createRawDataForArray(*UABack1Raw,6,442,372,370,441,370,237)
createRawDataForArray(*UABack1Raw,7,397,399,350,396,354,464)
createRawDataForArray(*UABack1Raw,8,351,449,349,349,364,516)
createRawDataForArray(*UABack1Raw,9,413,398,338)

*UABack1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_2WindBackRaw,0,563,413,336)

*UABack1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_2WindFrontRaw,0,467,459,390)

*UABack1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_3WindBackRaw,0,452,370,350)

*UABack1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_3WindFrontRaw,0,438,421,408)

*UABack1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_4WindBackRaw,0,417,359,331)

*UABack1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_4WindFrontRaw,0,430,426,380)

*UABack1_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UABack1_5WindBackRaw,0,367,357,259)
createRawDataForArray(*UABack1_5WindBackRaw,1,397,362,226)
createRawDataForArray(*UABack1_5WindBackRaw,2,430,358,210)

*UABack1_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UABack1_5WindFrontRaw,0,373,427,422)
createRawDataForArray(*UABack1_5WindFrontRaw,1,370,424,412)

*UABack1_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UABack1_6WindFrontRaw,0,439,463,385)
createRawDataForArray(*UABack1_6WindFrontRaw,1,412,506,495)

*UABack1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_7WindFrontRaw,0,420,341,147)

*UABack1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack1_8WindFrontRaw,0,378,335,170)

*UABack1_9WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UABack1_9WindFrontRaw,0,330,322,248)
createRawDataForArray(*UABack1_9WindFrontRaw,1,322,287,394)
createRawDataForArray(*UABack1_9WindFrontRaw,2,290,381,474)
createRawDataForArray(*UABack1_9WindFrontRaw,3,272,446,639)

;----UABack2
*UABack2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UABack2Raw,0,374,450,357)
createRawDataForArray(*UABack2Raw,1,398,415,351)
createRawDataForArray(*UABack2Raw,2,422,425,350)
createRawDataForArray(*UABack2Raw,3,335,376,361,334,477,477)
createRawDataForArray(*UABack2Raw,4,389,449,374,330,494,463)
createRawDataForArray(*UABack2Raw,5,384,352,354,467,348,271)

*UABack2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack2_1WindFrontRaw,0,348,438,397)

*UABack2_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UABack2_2WindFrontRaw,0,334,434,463)
createRawDataForArray(*UABack2_2WindFrontRaw,1,306,410,560)

*UABack2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack2_5WindFrontRaw,0,288,352,380)

*UABack2_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UABack2_6WindFrontRaw,0,213,333,188)
createRawDataForArray(*UABack2_6WindFrontRaw,1,210,263,194)
createRawDataForArray(*UABack2_6WindFrontRaw,2,238,288,186)
createRawDataForArray(*UABack2_6WindFrontRaw,3,532,282,225)

*UABack2_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack2_1WindBackRaw,0,296,466,436)

*UABack2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack2_4WindBackRaw,0,319,356,387)


;----UABack3
*UABack3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UABack3Raw,0,334,361,347,291,369,576)
createRawDataForArray(*UABack3Raw,1,454,329,361,281,373,426)
createRawDataForArray(*UABack3Raw,2,460,382,354,535,462,361)

*UABack3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack3_1WindFrontRaw,0,285,333,412)

*UABack3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack3_2WindFrontRaw,0,263,341,324)

*UABack3_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UABack3_3WindFrontRaw,0,190,267,295)
createRawDataForArray(*UABack3_3WindFrontRaw,1,306,260,245)
createRawDataForArray(*UABack3_3WindFrontRaw,2,486,374,235)
createRawDataForArray(*UABack3_3WindFrontRaw,3,668,446,215)

;----UABack4
*UABack4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UABack4Raw,0,377,397,358)
createRawDataForArray(*UABack4Raw,1,393,438,352,396,602,393)
createRawDataForArray(*UABack4Raw,2,406,426,243,509,511,242)
createRawDataForArray(*UABack4Raw,3,417,436,299)

*UABack4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack4_1WindFrontRaw,0,345,371,325)

*UABack4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack4_2WindFrontRaw,0,285,369,343)

*UABack4_3WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UABack4_3WindFrontRaw,0,249,461,193)
createRawDataForArray(*UABack4_3WindFrontRaw,1,239,406,150)
createRawDataForArray(*UABack4_3WindFrontRaw,2,358,405,142)
createRawDataForArray(*UABack4_3WindFrontRaw,3,615,427,153)
createRawDataForArray(*UABack4_3WindFrontRaw,4,773,447,153)

*UABack4_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UABack4_1WindBackRaw,0,304,452,422)

;----UADown1
*UADown1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown1Raw,0,424,407,359)
createRawDataForArray(*UADown1Raw,1,357,425,326)
createRawDataForArray(*UADown1Raw,2,329,405,323,326,467,334)
createRawDataForArray(*UADown1Raw,3,371,414,325,328,518,581)
createRawDataForArray(*UADown1Raw,4,405,421,340,361,528,504)

*UADown1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown1_1WindFrontRaw,0,403,492,472)

*UADown1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown1_2WindFrontRaw,0,322,414,490)
createRawDataForArray(*UADown1_2WindFrontRaw,1,295,411,493)
createRawDataForArray(*UADown1_2WindFrontRaw,2,284,404,574)

*UADown1_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown1_3WindFrontRaw,0,394,395,279)
createRawDataForArray(*UADown1_3WindFrontRaw,1,414,366,228)
createRawDataForArray(*UADown1_3WindFrontRaw,2,718,390,225)

*UADown1_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown1_2WindBackRaw,0,501,439,298)
createRawDataForArray(*UADown1_2WindBackRaw,1,639,429,273)
createRawDataForArray(*UADown1_2WindBackRaw,2,710,434,266)

*UADown1_3WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UADown1_3WindBackRaw,0,289,418,302)
createRawDataForArray(*UADown1_3WindBackRaw,1,284,390,351)
createRawDataForArray(*UADown1_3WindBackRaw,2,273,379,611)
createRawDataForArray(*UADown1_3WindBackRaw,3,281,513,638)

;----UADown2
; *UADown2Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*UADown2Raw,0,355,417,334)
; createRawDataForArray(*UADown2Raw,1,418,344,324)
; createRawDataForArray(*UADown2Raw,2,355,339,329,363,359,528)
; createRawDataForArray(*UADown2Raw,3,340,341,331,341,435,560)
; createRawDataForArray(*UADown2Raw,4,336,344,317,339,505,449)
; createRawDataForArray(*UADown2Raw,5,348,362,325)
; createRawDataForArray(*UADown2Raw,6,356,409,325)
; createRawDataForArray(*UADown2Raw,7,391,409,325)
*UADown2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UADown2Raw,0,386,401,359)
createRawDataForArray(*UADown2Raw,1,433,357,324)
createRawDataForArray(*UADown2Raw,2,374,416,357,370,362,507)
createRawDataForArray(*UADown2Raw,3,345,390,348,341,430,564)
createRawDataForArray(*UADown2Raw,4,393,373,325,331,508,455)
createRawDataForArray(*UADown2Raw,5,372,413,345)

*UADown2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown2_1WindFrontRaw,0,300,396,492)

*UADown2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown2_2WindFrontRaw,0,329,339,405)

*UADown2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown2_3WindFrontRaw,0,347,329,415)

*UADown2_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown2_4WindFrontRaw,0,347,329,415)
createRawDataForArray(*UADown2_4WindFrontRaw,1,281,309,430)

*UADown2_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown2_5WindFrontRaw,0,289,323,316)
createRawDataForArray(*UADown2_5WindFrontRaw,1,245,353,305)
createRawDataForArray(*UADown2_5WindFrontRaw,2,290,500,256)

*UADown2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown2_3WindBackRaw,0,388,505,348)

*UADown2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown2_4WindBackRaw,0,514,483,317)

*UADown2_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown2_6WindBackRaw,0,362,333,341)
createRawDataForArray(*UADown2_6WindBackRaw,1,338,330,417)

;----UADown3
*UADown3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown3Raw,0,337,344,346,336,378,486)
createRawDataForArray(*UADown3Raw,1,281,443,355,280,475,354)
createRawDataForArray(*UADown3Raw,2,346,445,354,345,446,357)

*UADown3_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown3_2WindFrontRaw,0,241,224,327)
createRawDataForArray(*UADown3_2WindFrontRaw,1,222,334,320)

*UADown3_3WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown3_3WindFrontRaw,0,266,295,272)
createRawDataForArray(*UADown3_3WindFrontRaw,1,248,218,240)
createRawDataForArray(*UADown3_3WindFrontRaw,2,225,237,244)
createRawDataForArray(*UADown3_3WindFrontRaw,3,152,311,187)
createRawDataForArray(*UADown3_3WindFrontRaw,4,130,461,136)

*UADown3_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown3_4WindFrontRaw,0,301,416,291)
createRawDataForArray(*UADown3_4WindFrontRaw,1,270,398,252)
createRawDataForArray(*UADown3_4WindFrontRaw,2,229,380,194)

*UADown3_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown3_3WindBackRaw,0,340,298,348)
createRawDataForArray(*UADown3_3WindBackRaw,1,332,340,323)
createRawDataForArray(*UADown3_3WindBackRaw,2,328,444,313)

*UADown3_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown3_4WindBackRaw,0,388,396,289)
createRawDataForArray(*UADown3_4WindBackRaw,1,343,365,263)
createRawDataForArray(*UADown3_4WindBackRaw,2,325,350,251)

;----UADown4
*UADown4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UADown4Raw,0,403,340,383)
createRawDataForArray(*UADown4Raw,1,325,423,359,325,388,501)
createRawDataForArray(*UADown4Raw,2,315,369,347,314,387,585)
createRawDataForArray(*UADown4Raw,3,288,409,358)

*UADown4_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UADown4_1WindFrontRaw,0,387,327,362)
createRawDataForArray(*UADown4_1WindFrontRaw,1,542,304,333)
createRawDataForArray(*UADown4_1WindFrontRaw,2,643,413,330)

*UADown4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown4_2WindFrontRaw,0,303,323,404)

*UADown4_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UADown4_3WindFrontRaw,0,265,256,346)
createRawDataForArray(*UADown4_3WindFrontRaw,1,219,282,397)
createRawDataForArray(*UADown4_3WindFrontRaw,2,250,326,500)
createRawDataForArray(*UADown4_3WindFrontRaw,3,251,330,655)

;----UADown5
*UADown5Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UADown5Raw,0,398,379,366)
createRawDataForArray(*UADown5Raw,1,434,384,379)
createRawDataForArray(*UADown5Raw,2,369,348,352)
createRawDataForArray(*UADown5Raw,3,373,419,362,372,391,428)
createRawDataForArray(*UADown5Raw,4,420,449,302,392,504,512)
createRawDataForArray(*UADown5Raw,5,369,442,342)

*UADown5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown5_1WindFrontRaw,0,383,356,358)

*UADown5_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown5_2WindFrontRaw,0,417,358,337)
createRawDataForArray(*UADown5_2WindFrontRaw,1,628,404,329)

*UADown5_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown5_3WindFrontRaw,0,346,263,267)

*UADown5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown5_4WindFrontRaw,0,331,267,251)

*UADown5_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown5_5WindFrontRaw,0,269,270,265)
createRawDataForArray(*UADown5_5WindFrontRaw,1,247,332,255)
createRawDataForArray(*UADown5_5WindFrontRaw,2,284,333,381)
createRawDataForArray(*UADown5_5WindFrontRaw,3,272,571,367)
createRawDataForArray(*UADown5_5WindFrontRaw,4,264,655,339)

;----UADown6
*UADown6Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown6Raw,0,354,427,368)
createRawDataForArray(*UADown6Raw,1,405,393,352)
createRawDataForArray(*UADown6Raw,2,402,397,360,402,505,289)
createRawDataForArray(*UADown6Raw,3,406,386,351,406,499,335)
createRawDataForArray(*UADown6Raw,4,439,435,362,406,541,323)

*UADown6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown6_1WindFrontRaw,0,356,407,351)

*UADown6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown6_2WindFrontRaw,0,395,363,311)

*UADown6_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown6_3WindFrontRaw,0,367,347,368)
createRawDataForArray(*UADown6_3WindFrontRaw,1,353,346,407)

*UADown6_4WindFrontRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UADown6_4WindFrontRaw,0,383,368,328)
createRawDataForArray(*UADown6_4WindFrontRaw,1,376,196,314)
createRawDataForArray(*UADown6_4WindFrontRaw,2,334,304,272)
createRawDataForArray(*UADown6_4WindFrontRaw,3,288,364,247)
createRawDataForArray(*UADown6_4WindFrontRaw,4,277,396,237)
createRawDataForArray(*UADown6_4WindFrontRaw,5,260,567,230)

*UADown6_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown6_5WindFrontRaw,0,372,474,263)
createRawDataForArray(*UADown6_5WindFrontRaw,1,271,383,157)
createRawDataForArray(*UADown6_5WindFrontRaw,2,260,372,141)
createRawDataForArray(*UADown6_5WindFrontRaw,3,268,362,137)
createRawDataForArray(*UADown6_5WindFrontRaw,4,249,527,124)

;----UADown7
*UADown7Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UADown7Raw,0,380,433,390)
createRawDataForArray(*UADown7Raw,1,388,352,335)
createRawDataForArray(*UADown7Raw,2,356,461,377,354,359,413)
createRawDataForArray(*UADown7Raw,3,348,428,355,348,523,481)

*UADown7_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown7_1WindFrontRaw,0,396,415,375)

*UADown7_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UADown7_2WindFrontRaw,0,370,326,300)
createRawDataForArray(*UADown7_2WindFrontRaw,1,362,293,292)
createRawDataForArray(*UADown7_2WindFrontRaw,2,514,274,282)
createRawDataForArray(*UADown7_2WindFrontRaw,3,632,306,284)

*UADown7_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown7_3WindFrontRaw,0,331,322,284)

*UADown7_4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADown7_4WindFrontRaw,0,306,300,318)
createRawDataForArray(*UADown7_4WindFrontRaw,1,240,287,342)
createRawDataForArray(*UADown7_4WindFrontRaw,2,235,446,423)
createRawDataForArray(*UADown7_4WindFrontRaw,3,203,559,599)
createRawDataForArray(*UADown7_4WindFrontRaw,4,189,647,693)

*UADown7_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADown7_1WindBackRaw,0,359,453,455)

*UADown7_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADown7_2WindBackRaw,0,340,451,433)
createRawDataForArray(*UADown7_2WindBackRaw,1,338,541,492)

;----UAUp1
*UAUp1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UAUp1Raw,0,327,355,359,327,351,466)
createRawDataForArray(*UAUp1Raw,1,403,352,347,375,350,558)
createRawDataForArray(*UAUp1Raw,2,377,356,356)
createRawDataForArray(*UAUp1Raw,3,387,343,352,386,343,530)
createRawDataForArray(*UAUp1Raw,4,396,367,370)
createRawDataForArray(*UAUp1Raw,5,328,398,357,327,398,572)

*UAUp1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp1_1WindFrontRaw,0,307,332,425)

*UAUp1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp1_2WindFrontRaw,0,329,322,445)
createRawDataForArray(*UAUp1_2WindFrontRaw,1,296,299,474)
createRawDataForArray(*UAUp1_2WindFrontRaw,2,292,285,486)

*UAUp1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp1_4WindFrontRaw,0,359,312,396)
createRawDataForArray(*UAUp1_4WindFrontRaw,1,327,282,528)
createRawDataForArray(*UAUp1_4WindFrontRaw,2,304,264,614)

*UAUp1_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp1_6WindFrontRaw,0,301,379,551)
createRawDataForArray(*UAUp1_6WindFrontRaw,1,258,330,583)
createRawDataForArray(*UAUp1_6WindFrontRaw,2,247,324,690)

;----UAUp2
*UAUp2Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*UAUp2Raw,0,414,421,352)
createRawDataForArray(*UAUp2Raw,1,411,453,358)
createRawDataForArray(*UAUp2Raw,2,397,444,363)
createRawDataForArray(*UAUp2Raw,3,402,454,385)
createRawDataForArray(*UAUp2Raw,4,400,446,367)
createRawDataForArray(*UAUp2Raw,5,406,396,370)
createRawDataForArray(*UAUp2Raw,6,370,421,395,370,439,557)
createRawDataForArray(*UAUp2Raw,7,304,417,357,303,465,549)
createRawDataForArray(*UAUp2Raw,8,339,430,365)

*UAUp2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_2WindFrontRaw,0,293,409,244)

*UAUp2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_3WindFrontRaw,0,325,379,291)

*UAUp2_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp2_4WindFrontRaw,0,315,361,281)
createRawDataForArray(*UAUp2_4WindFrontRaw,1,308,340,265)
createRawDataForArray(*UAUp2_4WindFrontRaw,2,399,301,363)

*UAUp2_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_7WindFrontRaw,0,350,413,559)

*UAUp2_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp2_8WindFrontRaw,0,241,403,325)
createRawDataForArray(*UAUp2_8WindFrontRaw,1,189,404,307)
createRawDataForArray(*UAUp2_8WindFrontRaw,2,176,433,721)

*UAUp2_1WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UAUp2_1WindBackRaw,0,415,317,413)
createRawDataForArray(*UAUp2_1WindBackRaw,1,396,434,395)
createRawDataForArray(*UAUp2_1WindBackRaw,2,367,482,350)
createRawDataForArray(*UAUp2_1WindBackRaw,3,411,530,360)

*UAUp2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_4WindBackRaw,0,421,554,493)

*UAUp2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_5WindBackRaw,0,408,419,458)

*UAUp2_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAUp2_6WindBackRaw,0,363,365,446)

*UAUp2_7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAUp2_7WindBackRaw,0,350,382,432)
createRawDataForArray(*UAUp2_7WindBackRaw,1,345,387,436)
createRawDataForArray(*UAUp2_7WindBackRaw,2,335,372,437)

;----UAUp3
*UAUp3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAUp3Raw,0,366,382,340,365,428,449)
createRawDataForArray(*UAUp3Raw,1,365,348,364,344,349,529)
createRawDataForArray(*UAUp3Raw,2,415,295,377,374,293,438)
createRawDataForArray(*UAUp3Raw,3,408,254,357,459,247,366)
createRawDataForArray(*UAUp3Raw,4,398,307,390)

;----UAHeavy1
*UAHeavy1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UAHeavy1Raw,0,401,413,312)
createRawDataForArray(*UAHeavy1Raw,1,410,398,333)
createRawDataForArray(*UAHeavy1Raw,2,430,446,341,473,408,372)
createRawDataForArray(*UAHeavy1Raw,3,390,400,368,390,515,490)
createRawDataForArray(*UAHeavy1Raw,4,451,323,277,385,317,477)
createRawDataForArray(*UAHeavy1Raw,5,426,350,303)

*UAHeavy1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy1_1WindFrontRaw,0,483,442,294)

*UAHeavy1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAHeavy1_2WindFrontRaw,0,400,382,300)
createRawDataForArray(*UAHeavy1_2WindFrontRaw,1,484,349,282)
createRawDataForArray(*UAHeavy1_2WindFrontRaw,2,512,333,271)

*UAHeavy1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy1_3WindFrontRaw,0,467,407,310)

*UAHeavy1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy1_4WindFrontRaw,0,363,419,361)

*UAHeavy1_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UAHeavy1_5WindFrontRaw,0,295,240,352)
createRawDataForArray(*UAHeavy1_5WindFrontRaw,1,287,222,420)
createRawDataForArray(*UAHeavy1_5WindFrontRaw,2,299,206,392)
createRawDataForArray(*UAHeavy1_5WindFrontRaw,3,405,197,392)

;----UAHeavy2
*UAHeavy2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAHeavy2Raw,0,401,418,332)
createRawDataForArray(*UAHeavy2Raw,1,416,370,297)
createRawDataForArray(*UAHeavy2Raw,2,363,406,390,362,452,224)
createRawDataForArray(*UAHeavy2Raw,3,327,413,338,327,461,476)
createRawDataForArray(*UAHeavy2Raw,4,404,374,368)

*UAHeavy2_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAHeavy2_2WindFrontRaw,0,347,349,256)
createRawDataForArray(*UAHeavy2_2WindFrontRaw,1,461,314,231)
createRawDataForArray(*UAHeavy2_2WindFrontRaw,2,650,418,216)

*UAHeavy2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy2_3WindFrontRaw,0,334,394,158)

*UAHeavy2_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAHeavy2_4WindFrontRaw,0,275,370,189)
createRawDataForArray(*UAHeavy2_4WindFrontRaw,1,247,338,360)

*UAHeavy2_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAHeavy2_5WindFrontRaw,0,211,345,603)
createRawDataForArray(*UAHeavy2_5WindFrontRaw,1,227,349,622)

;----UAHeavy3
*UAHeavy3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAHeavy3Raw,0,405,404,334)
createRawDataForArray(*UAHeavy3Raw,1,424,427,350)
createRawDataForArray(*UAHeavy3Raw,2,399,429,342,399,426,466)
createRawDataForArray(*UAHeavy3Raw,3,384,433,347,383,431,464)
createRawDataForArray(*UAHeavy3Raw,4,382,410,381)

*UAHeavy3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy3_1WindFrontRaw,0,506,336,401)

*UAHeavy3_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAHeavy3_2WindFrontRaw,0,385,337,451)
createRawDataForArray(*UAHeavy3_2WindFrontRaw,1,419,439,449)

*UAHeavy3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UAHeavy3_3WindFrontRaw,0,362,386,241)

*UAHeavy3_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UAHeavy3_4WindFrontRaw,0,327,378,159)
createRawDataForArray(*UAHeavy3_4WindFrontRaw,1,302,320,76)

*UAHeavy3_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UAHeavy3_5WindFrontRaw,0,265,297,286)
createRawDataForArray(*UAHeavy3_5WindFrontRaw,1,210,293,522)
createRawDataForArray(*UAHeavy3_5WindFrontRaw,2,152,282,565)

;----UAHitNew
*UAHitRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAHitRaw,0,441,324,324)
createRawDataForArray(*UAHitRaw,1,354,437,343)
createRawDataForArray(*UAHitRaw,2,454,351,287)
createRawDataForArray(*UAHitRaw,3,415,404,325)
createRawDataForArray(*UAHitRaw,4,377,369,368)

;----UASpawn
*UASpawnRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*UASpawnRaw, 0,448,421,337)
createRawDataForArray(*UASpawnRaw, 2,443,410,339)
createRawDataForArray(*UASpawnRaw, 1,448,424,343)
createRawDataForArray(*UASpawnRaw, 3,443,367,327)
createRawDataForArray(*UASpawnRaw, 4,427,364,330)
createRawDataForArray(*UASpawnRaw, 5,419,309,325)
createRawDataForArray(*UASpawnRaw, 6,419,340,321)
createRawDataForArray(*UASpawnRaw, 7,364,353,309)
createRawDataForArray(*UASpawnRaw, 8,435,354,317)
createRawDataForArray(*UASpawnRaw, 9,439,377,310)
createRawDataForArray(*UASpawnRaw,10,437,385,327)
createRawDataForArray(*UASpawnRaw,11,434,381,321)
createRawDataForArray(*UASpawnRaw,12,433,384,339)

*UASpawn1_13WindFrontRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*UASpawn1_13WindFrontRaw,0,436,413,324)
createRawDataForArray(*UASpawn1_13WindFrontRaw,1,409,443,492)

;----UADeath
*UADeathRaw.rawdataArray=createRawDataArray(13)
createRawDataForArray(*UADeathRaw, 0,448,349,355)
createRawDataForArray(*UADeathRaw, 1,396,390,386)
createRawDataForArray(*UADeathRaw, 2,356,407,423)
createRawDataForArray(*UADeathRaw, 3,392,372,412)
createRawDataForArray(*UADeathRaw, 4,435,355,380)
createRawDataForArray(*UADeathRaw, 5,448,314,369)
createRawDataForArray(*UADeathRaw, 6,511,283,324)
createRawDataForArray(*UADeathRaw, 7,575,353,183)
createRawDataForArray(*UADeathRaw, 8,554,287,301)
createRawDataForArray(*UADeathRaw, 9,393,290,402)
createRawDataForArray(*UADeathRaw,10,221,465,493)
createRawDataForArray(*UADeathRaw,11,146,568,572)
createRawDataForArray(*UADeathRaw,12,108,517,562)
createRawDataForArray(*UADeathRaw,13,166,530,564)

*UADeath9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADeath9WindFrontRaw,0,622,281,181)

*UADeath12WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADeath12WindFrontRaw,0,136,585,534)
createRawDataForArray(*UADeath12WindFrontRaw,1,103,530,504)
createRawDataForArray(*UADeath12WindFrontRaw,2, 82,496,470)
createRawDataForArray(*UADeath12WindFrontRaw,3, 20,468,422)

*UADeath10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADeath10WindBackRaw,0,392,229,186)

*UADeath11WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UADeath11WindBackRaw,0,205,200,189)

*UADeath12WindBack1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADeath12WindBack1Raw,0, 86,219,203)
createRawDataForArray(*UADeath12WindBack1Raw,1, 51,215,597)
createRawDataForArray(*UADeath12WindBack1Raw,2, 29,390,741)
createRawDataForArray(*UADeath12WindBack1Raw,3,  1,403,860)

*UADeath12WindBack2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UADeath12WindBack2Raw,0,134,558,515)
createRawDataForArray(*UADeath12WindBack2Raw,1,105,503,474)
createRawDataForArray(*UADeath12WindBack2Raw,2, 90,494,433)
createRawDataForArray(*UADeath12WindBack2Raw,3, 69,484,412)

;----UAJump
*UAJumpRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*UAJumpRaw,0,421,419,328)
createRawDataForArray(*UAJumpRaw,1,426,401,316)
createRawDataForArray(*UAJumpRaw,2,439,377,357)
createRawDataForArray(*UAJumpRaw,3,416,381,360)
createRawDataForArray(*UAJumpRaw,4,412,406,353)
createRawDataForArray(*UAJumpRaw,5,418,415,350)
createRawDataForArray(*UAJumpRaw,6,390,412,349)
createRawDataForArray(*UAJumpRaw,7,389,442,341)
createRawDataForArray(*UAJumpRaw,8,367,434,344)

;----UALand
*UALandRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UALandRaw,0,336,491,334)
createRawDataForArray(*UALandRaw,1,284,545,357)
createRawDataForArray(*UALandRaw,2,347,494,370)
createRawDataForArray(*UALandRaw,3,383,438,347)

;----UADodge
*UADodgeRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UADodgeRaw,0,438,374,321)
createRawDataForArray(*UADodgeRaw,1,444,388,288)

;----UAParry
*UAParryRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*UAParryRaw,0,417,356,352)
createRawDataForArray(*UAParryRaw,1,422,427,377)
createRawDataForArray(*UAParryRaw,2,437,418,375)
createRawDataForArray(*UAParryRaw,3,446,419,362)
createRawDataForArray(*UAParryRaw,4,445,392,352)
createRawDataForArray(*UAParryRaw,5,451,343,363)

;----UASelection
*UASelectionRaw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*UASelectionRaw,0,426,389,376)
createRawDataForArray(*UASelectionRaw,1,391,414,381)
createRawDataForArray(*UASelectionRaw,2,383,416,382)
createRawDataForArray(*UASelectionRaw,3,413,411,365)
createRawDataForArray(*UASelectionRaw,4,416,382,346)
createRawDataForArray(*UASelectionRaw,5,422,382,346)
createRawDataForArray(*UASelectionRaw,6,425,384,346)
createRawDataForArray(*UASelectionRaw,7,432,400,343)
createRawDataForArray(*UASelectionRaw,8,442,406,353)
createRawDataForArray(*UASelectionRaw,9,430,390,341)

*UASelection_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelection_2WindFrontRaw,0,399,385,543)

*UASelection_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelection_3WindFrontRaw,0,368,410,555)

*UASelection_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelection_4WindFrontRaw,0,366,536,556)

*UASelection_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelection_5WindBackRaw,0,409,531,539)

;----UASelected
*UASelectedRaw.rawdataArray=createRawDataArray(21)
createRawDataForArray(*UASelectedRaw,0,431,414,347)
createRawDataForArray(*UASelectedRaw,1,408,385,358)
createRawDataForArray(*UASelectedRaw,2,452,363,363)
createRawDataForArray(*UASelectedRaw,3,465,345,363)
createRawDataForArray(*UASelectedRaw,4,440,327,368)
createRawDataForArray(*UASelectedRaw,5,367,300,341)
createRawDataForArray(*UASelectedRaw,6,368,316,344)
createRawDataForArray(*UASelectedRaw,7,387,317,346)
createRawDataForArray(*UASelectedRaw,8,406,318,340)
createRawDataForArray(*UASelectedRaw,9,437,317,329)
createRawDataForArray(*UASelectedRaw,10,469,364,343)
createRawDataForArray(*UASelectedRaw,11,487,365,280)
createRawDataForArray(*UASelectedRaw,12,472,400,329)
createRawDataForArray(*UASelectedRaw,13,463,388,334)
createRawDataForArray(*UASelectedRaw,14,455,415,370)
createRawDataForArray(*UASelectedRaw,15,416,398,364)
createRawDataForArray(*UASelectedRaw,16,413,397,360)
createRawDataForArray(*UASelectedRaw,17,416,397,362)
createRawDataForArray(*UASelectedRaw,18,413,393,364)
createRawDataForArray(*UASelectedRaw,19,418,395,364)
createRawDataForArray(*UASelectedRaw,20,418,392,365)
createRawDataForArray(*UASelectedRaw,21,414,402,361)

*UASelected_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASelected_3WindFrontRaw,0,408,429,415)
createRawDataForArray(*UASelected_3WindFrontRaw,1,497,421,401)

*UASelected_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_5WindFrontRaw,0,450,316,359)

*UASelected_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASelected_6WindFrontRaw,0,479,279,319)
createRawDataForArray(*UASelected_6WindFrontRaw,1,659,310,303)

*UASelected_7WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UASelected_7WindFrontRaw,0,460,402,333)
createRawDataForArray(*UASelected_7WindFrontRaw,1,445,393,337)
createRawDataForArray(*UASelected_7WindFrontRaw,2,446,391,337)
createRawDataForArray(*UASelected_7WindFrontRaw,3,440,363,332)
createRawDataForArray(*UASelected_7WindFrontRaw,4,439,362,333)

*UASelected_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_9WindFrontRaw,0,410,500,445)

*UASelected_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_10WindFrontRaw,0,407,336,415)

*UASelected_11WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASelected_11WindFrontRaw,0,425,303,350)
createRawDataForArray(*UASelected_11WindFrontRaw,1,467,347,335)

*UASelected_12WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASelected_12WindFrontRaw,0,472,336,265)
createRawDataForArray(*UASelected_12WindFrontRaw,1,516,321,246)
createRawDataForArray(*UASelected_12WindFrontRaw,2,706,361,244)

*UASelected_13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_13WindFrontRaw,0,449,339,287)

*UASelected_14WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASelected_14WindFrontRaw,0,392,351,301)
createRawDataForArray(*UASelected_14WindFrontRaw,1,399,338,388)
createRawDataForArray(*UASelected_14WindFrontRaw,2,385,406,542)
createRawDataForArray(*UASelected_14WindFrontRaw,3,384,483,594)

*UASelected_15WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASelected_15WindFrontRaw,0,445,405,411)
createRawDataForArray(*UASelected_15WindFrontRaw,1,436,389,340)
createRawDataForArray(*UASelected_15WindFrontRaw,2,480,378,331)
createRawDataForArray(*UASelected_15WindFrontRaw,3,603,381,325)

*UASelected_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_5WindBackRaw,0,436,384,496)

*UASelected_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*UASelected_6WindBackRaw,0,358,374,519)
createRawDataForArray(*UASelected_6WindBackRaw,1,343,374,596)

*UASelected_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_8WindBackRaw,0,360,317,480)

*UASelected_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*UASelected_9WindBackRaw,0,380,314,370)

*UASelected_14WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASelected_14WindBackRaw,0,485,376,328)
createRawDataForArray(*UASelected_14WindBackRaw,1,573,369,308)
createRawDataForArray(*UASelected_14WindBackRaw,2,614,365,305)
createRawDataForArray(*UASelected_14WindBackRaw,3,668,380,306)

*UASelected_15WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UASelected_15WindBackRaw,0,509,405,379)
createRawDataForArray(*UASelected_15WindBackRaw,1,395,420,380)
createRawDataForArray(*UASelected_15WindBackRaw,2,391,395,445)
createRawDataForArray(*UASelected_15WindBackRaw,3,375,398,546)
createRawDataForArray(*UASelected_15WindBackRaw,4,373,404,577)

; ;----PSIdle
; *PSIdleRaw.rawdataArray=createRawDataArray(4)
; createRawDataForArray(*PSIdleRaw,0,368,354,285)
; createRawDataForArray(*PSIdleRaw,1,365,355,324)
; createRawDataForArray(*PSIdleRaw,2,357,356,318)
; createRawDataForArray(*PSIdleRaw,3,355,374,321)
; createRawDataForArray(*PSIdleRaw,4,366,368,294)
; 
; ;----PSFront
; *PSFrontRaw.rawdataArray=createRawDataArray(4)
; createRawDataForArray(*PSFrontRaw,0,342,356,333)
; createRawDataForArray(*PSFrontRaw,1,359,359,335)
; createRawDataForArray(*PSFrontRaw,2,365,361,343)
; createRawDataForArray(*PSFrontRaw,3,358,360,328)
; createRawDataForArray(*PSFrontRaw,4,348,352,330)
; 
; ;----PSBack
; *PSBackRaw.rawdataArray=createRawDataArray(5)
; createRawDataForArray(*PSBackRaw,0,245,399,335)
; createRawDataForArray(*PSBackRaw,1,247,411,321)
; createRawDataForArray(*PSBackRaw,2,239,410,310)
; createRawDataForArray(*PSBackRaw,3,250,397,334)
; createRawDataForArray(*PSBackRaw,4,279,396,335)
; createRawDataForArray(*PSBackRaw,5,252,408,332)
; 
; ;----PSNeutral1
; *PSNeutral1Raw.rawdataArray=createRawDataArray(5)
; createRawDataForArray(*PSNeutral1Raw,0,361,334,333)
; createRawDataForArray(*PSNeutral1Raw,1,354,314,325,382,313,487)
; createRawDataForArray(*PSNeutral1Raw,2,276,321,336,276,316,598)
; createRawDataForArray(*PSNeutral1Raw,3,231,322,322,230,400,669)
; createRawDataForArray(*PSNeutral1Raw,4,232,337,326)
; createRawDataForArray(*PSNeutral1Raw,5,237,339,333)
; 
; ;----PSSide1
; *PSSide1Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*PSSide1Raw,0,366,335,318)
; createRawDataForArray(*PSSide1Raw,1,349,314,323)
; createRawDataForArray(*PSSide1Raw,2,337,305,319)
; createRawDataForArray(*PSSide1Raw,3,359,304,328,382,424,482)
; createRawDataForArray(*PSSide1Raw,4,267,306,330,264,490,585)
; createRawDataForArray(*PSSide1Raw,5,225,358,304,224,446,685)
; createRawDataForArray(*PSSide1Raw,6,224,384,304)
; createRawDataForArray(*PSSide1Raw,7,225,384,304)
; 
; ;----PSJump
; *PSJumpRaw.rawdataArray=createRawDataArray(4)
; createRawDataForArray(*PSJumpRaw,0,379,350,324)
; createRawDataForArray(*PSJumpRaw,1,299,427,286)
; createRawDataForArray(*PSJumpRaw,2,329,427,316)
; createRawDataForArray(*PSJumpRaw,3,365,380,329)
; createRawDataForArray(*PSJumpRaw,4,349,340,333)
; 
; ;----PSDeath
; *PSDeathRaw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*PSDeathRaw,0,363,321,312)
; createRawDataForArray(*PSDeathRaw,1,321,321,322)
; createRawDataForArray(*PSDeathRaw,2,213,362,333)
; createRawDataForArray(*PSDeathRaw,3,207,425,361)
; createRawDataForArray(*PSDeathRaw,4,185,472,381)
; createRawDataForArray(*PSDeathRaw,5,174,483,357)
; createRawDataForArray(*PSDeathRaw,6,229,513,356)
; createRawDataForArray(*PSDeathRaw,7,295,513,356)
; 
; ;----PSHit
; *PSHitRaw.rawdataArray=createRawDataArray(4)
; createRawDataForArray(*PSHitRaw,0,355,368,340)
; createRawDataForArray(*PSHitRaw,1,456,415,343)
; createRawDataForArray(*PSHitRaw,2,346,365,322)
; createRawDataForArray(*PSHitRaw,3,334,440,310)
; createRawDataForArray(*PSHitRaw,4,438,400,302)

;----GSIdle1
*GSIdle1Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSIdle1Raw,0,437,401,306)
createRawDataForArray(*GSIdle1Raw,1,435,405,305)
createRawDataForArray(*GSIdle1Raw,2,432,397,315)
createRawDataForArray(*GSIdle1Raw,3,427,404,319)
createRawDataForArray(*GSIdle1Raw,4,425,386,318)
createRawDataForArray(*GSIdle1Raw,5,430,383,319)
createRawDataForArray(*GSIdle1Raw,6,425,399,320)
createRawDataForArray(*GSIdle1Raw,7,421,395,333)
createRawDataForArray(*GSIdle1Raw,8,435,403,307)

*GSIdle1_8WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSIdle1_8WindBackRaw,0,581,398,317)
createRawDataForArray(*GSIdle1_8WindBackRaw,1,571,387,341)

*GSIdle1_9WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSIdle1_9WindBackRaw,0,628,398,301)
createRawDataForArray(*GSIdle1_9WindBackRaw,1,612,443,294)

;----GSIdle2
*GSIdle2Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSIdle2Raw,0,432,398,310)
createRawDataForArray(*GSIdle2Raw,1,429,384,301)
createRawDataForArray(*GSIdle2Raw,2,443,379,297)
createRawDataForArray(*GSIdle2Raw,3,452,382,292)
createRawDataForArray(*GSIdle2Raw,4,432,381,301)
createRawDataForArray(*GSIdle2Raw,5,415,379,312)
createRawDataForArray(*GSIdle2Raw,6,417,378,310)
createRawDataForArray(*GSIdle2Raw,7,425,380,296)

*GSIdle2_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSIdle2_1WindFrontRaw,0,417,401,303)
createRawDataForArray(*GSIdle2_1WindFrontRaw,1,411,393,300)

*GSIdle2_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSIdle2_6WindFrontRaw,0,461,496,436)
createRawDataForArray(*GSIdle2_6WindFrontRaw,1,490,510,440)

;----GSIdle3
*GSIdle3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSIdle3Raw,0,407,373,321)
createRawDataForArray(*GSIdle3Raw,1,413,367,327)
createRawDataForArray(*GSIdle3Raw,2,418,378,308)
createRawDataForArray(*GSIdle3Raw,3,427,355,289)
createRawDataForArray(*GSIdle3Raw,4,431,357,287)
createRawDataForArray(*GSIdle3Raw,5,420,362,290)

*GSIdle3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSIdle3_1WindFrontRaw,0,393,355,307)

*GSIdle3_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSIdle3_2WindFrontRaw,0,386,347,299)
createRawDataForArray(*GSIdle3_2WindFrontRaw,1,382,344,452)

*GSIdle3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSIdle3_3WindFrontRaw,0,417,407,297)

*GSIdle3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSIdle3_4WindFrontRaw,0,414,377,269)

*GSIdle3_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSIdle3_5WindFrontRaw,0,507,355,265)
createRawDataForArray(*GSIdle3_5WindFrontRaw,1,614,384,257)
createRawDataForArray(*GSIdle3_5WindFrontRaw,2,651,422,312)

*GSIdle3_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSIdle3_6WindFrontRaw,0,412,350,277)
createRawDataForArray(*GSIdle3_6WindFrontRaw,1,408,358,400)
createRawDataForArray(*GSIdle3_6WindFrontRaw,2,434,481,442)

;----GSMoveFront
*GSMoveFrontRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSMoveFrontRaw,0,433,406,306)
createRawDataForArray(*GSMoveFrontRaw,1,418,402,332)
createRawDataForArray(*GSMoveFrontRaw,2,426,427,346)
createRawDataForArray(*GSMoveFrontRaw,3,368,398,354)
createRawDataForArray(*GSMoveFrontRaw,4,383,389,349)
createRawDataForArray(*GSMoveFrontRaw,5,408,375,331)
createRawDataForArray(*GSMoveFrontRaw,6,431,375,295)

*GSMoveFront2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSMoveFront2WindFrontRaw,0,566,401,344)
createRawDataForArray(*GSMoveFront2WindFrontRaw,1,569,404,347)

*GSMoveFront3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSMoveFront3WindFrontRaw,0,450,398,377)
createRawDataForArray(*GSMoveFront3WindFrontRaw,1,500,441,472)

*GSMoveFront4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSMoveFront4WindFrontRaw,0,357,436,421)

*GSMoveFront5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSMoveFront5WindFrontRaw,0,348,419,393)
createRawDataForArray(*GSMoveFront5WindFrontRaw,1,337,424,575)

*GSMoveFront12WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSMoveFront12WindFrontRaw,0,572,366,265)

*GSMoveFront13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSMoveFront13WindFrontRaw,0,646,393,322)

*GSMoveFront1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSMoveFront1WindBackRaw,0,654,412,307)
createRawDataForArray(*GSMoveFront1WindBackRaw,1,659,418,331)

;----GSBack
*GSMoveBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSMoveBackRaw,0,396,407,335)
createRawDataForArray(*GSMoveBackRaw,1,410,399,339)
createRawDataForArray(*GSMoveBackRaw,2,423,392,288)
createRawDataForArray(*GSMoveBackRaw,3,432,390,308)

*GSMoveBack4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSMoveBack4WindFrontRaw,0,494,416,305)
createRawDataForArray(*GSMoveBack4WindFrontRaw,1,573,402,261)

*GSMoveBack5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSMoveBack5WindFrontRaw,0,474,414,356)

;----GSSpawn
*GSSpawnRaw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*GSSpawnRaw,0,348,402,350)
createRawDataForArray(*GSSpawnRaw,1,337,422,369)
createRawDataForArray(*GSSpawnRaw,2,341,444,373)
createRawDataForArray(*GSSpawnRaw,3,243,450,387)
createRawDataForArray(*GSSpawnRaw,4,263,405,372)
createRawDataForArray(*GSSpawnRaw,5,243,404,362)
createRawDataForArray(*GSSpawnRaw,6,348,382,366)
createRawDataForArray(*GSSpawnRaw,7,279,424,376)
createRawDataForArray(*GSSpawnRaw,8,368,392,369)
createRawDataForArray(*GSSpawnRaw,9,405,377,346)
createRawDataForArray(*GSSpawnRaw,10,466,378,304)
createRawDataForArray(*GSSpawnRaw,11,438,385,310)

*GSSpawn2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSpawn2WindFrontRaw,0,324,415,339)
createRawDataForArray(*GSSpawn2WindFrontRaw,1,310,419,344)

*GSSpawn3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSpawn3WindFrontRaw,0,348,422,421)
createRawDataForArray(*GSSpawn3WindFrontRaw,1,378,514,374)
createRawDataForArray(*GSSpawn3WindFrontRaw,2,468,512,361)

*GSSpawn4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn4WindFrontRaw,0,230,443,374)

*GSSpawn5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn5WindFrontRaw,0,209,375,349)

*GSSpawn6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn6WindFrontRaw,0,190,365,322)

*GSSpawn7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn7WindFrontRaw,0,174,382,560)

*GSSpawn8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSpawn8WindFrontRaw,0,215,388,475)
createRawDataForArray(*GSSpawn8WindFrontRaw,1,217,436,445)
createRawDataForArray(*GSSpawn8WindFrontRaw,2,373,586,426)

*GSSpawn9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn9WindFrontRaw,0,267,379,380)

*GSSpawn10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSpawn10WindFrontRaw,0,287,345,313)

*GSSpawn11WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSpawn11WindFrontRaw,0,346,328,261)
createRawDataForArray(*GSSpawn11WindFrontRaw,1,419,303,229)

*GSSpawn12WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSpawn12WindFrontRaw,0,433,410,399)
createRawDataForArray(*GSSpawn12WindFrontRaw,1,420,406,498)
createRawDataForArray(*GSSpawn12WindFrontRaw,2,397,419,522)

;----GSDeath
*GSDeathRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSDeathRaw,0,404,372,371)
createRawDataForArray(*GSDeathRaw,1,347,412,382)
createRawDataForArray(*GSDeathRaw,2,356,397,332)
createRawDataForArray(*GSDeathRaw,3,317,355,312)
createRawDataForArray(*GSDeathRaw,4,241,351,222)
createRawDataForArray(*GSDeathRaw,5,216,372,212)
createRawDataForArray(*GSDeathRaw,6,208,509,182)
createRawDataForArray(*GSDeathRaw,7,215,448,196)
createRawDataForArray(*GSDeathRaw,8,215,509,182)

*GSDeath2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDeath2WindFrontRaw,0,326,375,439)
createRawDataForArray(*GSDeath2WindFrontRaw,1,306,370,450)
createRawDataForArray(*GSDeath2WindFrontRaw,2,387,580,420)

*GSDeath3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDeath3WindFrontRaw,0,310,404,524)
createRawDataForArray(*GSDeath3WindFrontRaw,1,297,485,623)

*GSDeath4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDeath4WindFrontRaw,0,331,307,303)

*GSDeath5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDeath5WindFrontRaw,0,224,254,186)

*GSDeath6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDeath6WindFrontRaw,0,137,257,159)
createRawDataForArray(*GSDeath6WindFrontRaw,1,104,554,725)
createRawDataForArray(*GSDeath6WindFrontRaw,2,80,541,837)

*GSDeath7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSDeath7WindFrontRaw,0,430,273,116)
createRawDataForArray(*GSDeath7WindFrontRaw,1,383,512,103)
createRawDataForArray(*GSDeath7WindFrontRaw,2,344,497,34)
createRawDataForArray(*GSDeath7WindFrontRaw,3,322,469,14)

*GSDeath8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDeath8WindFrontRaw,0,331,570,523)
createRawDataForArray(*GSDeath8WindFrontRaw,1,357,600,503)

*GSDeath7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDeath7WindBackRaw,0,449,434,125)
createRawDataForArray(*GSDeath7WindBackRaw,1,425,403,124)
createRawDataForArray(*GSDeath7WindBackRaw,2,400,412,97)

*GSDeath8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDeath8WindBackRaw,0,457,465,222)


;----GSHit
*GSHitRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSHitRaw,0,439,409,337)
createRawDataForArray(*GSHitRaw,1,454,374,276)
createRawDataForArray(*GSHitRaw,2,365,394,371)
createRawDataForArray(*GSHitRaw,3,395,423,345)
createRawDataForArray(*GSHitRaw,4,372,344,291)
createRawDataForArray(*GSHitRaw,5,427,359,338)
createRawDataForArray(*GSHitRaw,6,412,388,301)

;----GSJump
*GSJumpRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSJumpRaw,0,436,396,312)
createRawDataForArray(*GSJumpRaw,1,460,386,339)
createRawDataForArray(*GSJumpRaw,2,453,389,349)
createRawDataForArray(*GSJumpRaw,3,414,410,360)
createRawDataForArray(*GSJumpRaw,4,431,385,330)
createRawDataForArray(*GSJumpRaw,5,449,400,306)
createRawDataForArray(*GSJumpRaw,6,439,347,365)

;----GSLand
*GSLandRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSLandRaw,0,444,349,341)
createRawDataForArray(*GSLandRaw,1,404,419,345)
createRawDataForArray(*GSLandRaw,2,406,388,348)

;----GSNeutral1
*GSNeutral1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSNeutral1Raw,0,413,417,341,494,409,361)
createRawDataForArray(*GSNeutral1Raw,1,362,433,335,358,416,505)
createRawDataForArray(*GSNeutral1Raw,2,389,394,328)
createRawDataForArray(*GSNeutral1Raw,3,357,368,318,357,364,401)
createRawDataForArray(*GSNeutral1Raw,4,341,400,325)
createRawDataForArray(*GSNeutral1Raw,5,412,399,348)

*GSNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral1_1WindFrontRaw,0,397,393,329)

*GSNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral1_2WindFrontRaw,0,348,399,436)
createRawDataForArray(*GSNeutral1_2WindFrontRaw,1,318,434,527)
createRawDataForArray(*GSNeutral1_2WindFrontRaw,2,304,439,568)

*GSNeutral1_4WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSNeutral1_4WindBackRaw,0,334,345,323)
createRawDataForArray(*GSNeutral1_4WindBackRaw,1,317,292,294)
createRawDataForArray(*GSNeutral1_4WindBackRaw,2,271,263,281)
createRawDataForArray(*GSNeutral1_4WindBackRaw,3,244,249,482)

*GSNeutral1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral1_4WindFrontRaw,0,430,396,305)

*GSNeutral1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral1_5WindFrontRaw,0,465,366,300)
createRawDataForArray(*GSNeutral1_5WindFrontRaw,1,425,374,300)
createRawDataForArray(*GSNeutral1_5WindFrontRaw,2,367,393,338)

;----GSNeutral2
*GSNeutral2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSNeutral2Raw,0,434,383,337)
createRawDataForArray(*GSNeutral2Raw,1,463,394,255)
createRawDataForArray(*GSNeutral2Raw,2,445,354,333,566,348,247)
createRawDataForArray(*GSNeutral2Raw,3,347,438,325,335,345,335)
createRawDataForArray(*GSNeutral2Raw,4,330,419,327)

*GSNeutral2_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral2_2WindBackRaw,0,427,378,246)
createRawDataForArray(*GSNeutral2_2WindBackRaw,1,635,392,214)
createRawDataForArray(*GSNeutral2_2WindBackRaw,2,759,420,196)

*GSNeutral2_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSNeutral2_2WindFrontRaw,0,421,376,311)
createRawDataForArray(*GSNeutral2_2WindFrontRaw,1,426,363,296)

*GSNeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral2_3WindFrontRaw,0,435,332,215)

*GSNeutral2_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSNeutral2_4WindFrontRaw,0,328,325,172)
createRawDataForArray(*GSNeutral2_4WindFrontRaw,1,301,292,230)
createRawDataForArray(*GSNeutral2_4WindFrontRaw,2,256,280,226)
createRawDataForArray(*GSNeutral2_4WindFrontRaw,3,231,434,616)

;----GSNeutral3
*GSNeutral3Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSNeutral3Raw,0,303,319,369)
createRawDataForArray(*GSNeutral3Raw,1,357,373,375)
createRawDataForArray(*GSNeutral3Raw,2,352,285,380)
createRawDataForArray(*GSNeutral3Raw,3,270,279,389,270,249,454)
createRawDataForArray(*GSNeutral3Raw,4,300,326,382,233,313,609)
createRawDataForArray(*GSNeutral3Raw,5,312,372,373,303,324,483)
createRawDataForArray(*GSNeutral3Raw,6,341,384,358,289,409,573)

*GSNeutral3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_1WindFrontRaw,0,251,297,474)

*GSNeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_2WindFrontRaw,0,243,374,346)

*GSNeutral3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_3WindFrontRaw,0,239,240,281)

*GSNeutral3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_4WindFrontRaw,0,232,172,265)

*GSNeutral3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_5WindFrontRaw,0,141,151,350)

*GSNeutral3_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral3_6WindFrontRaw,0,132,198,353)

*GSNeutral3_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral3_7WindFrontRaw,0,212,293,520)
createRawDataForArray(*GSNeutral3_7WindFrontRaw,1,189,279,477)
createRawDataForArray(*GSNeutral3_7WindFrontRaw,2,224,353,474)

*GSNeutral3_7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral3_7WindBackRaw,0,116,198,351)
createRawDataForArray(*GSNeutral3_7WindBackRaw,1,185,315,425)
createRawDataForArray(*GSNeutral3_7WindBackRaw,2,329,319,408)

;----GSNeutral4
*GSNeutral4Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSNeutral4Raw,0,304,430,357)
createRawDataForArray(*GSNeutral4Raw,1,339,420,348)
createRawDataForArray(*GSNeutral4Raw,2,422,317,359)
createRawDataForArray(*GSNeutral4Raw,3,354,382,355)
createRawDataForArray(*GSNeutral4Raw,4,337,394,362)
createRawDataForArray(*GSNeutral4Raw,5,402,421,350)
createRawDataForArray(*GSNeutral4Raw,6,402,360,335)

*GSNeutral4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral4_1WindFrontRaw,0,293,404,425)

*GSNeutral4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral4_2WindFrontRaw,0,293,359,381)

*GSNeutral4_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral4_3WindFrontRaw,0,296,291,342)
createRawDataForArray(*GSNeutral4_3WindFrontRaw,1,283,249,318)
createRawDataForArray(*GSNeutral4_3WindFrontRaw,2,465,213,291)

*GSNeutral4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral4_4WindFrontRaw,0,337,304,383)

*GSNeutral4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral4_5WindFrontRaw,0,319,350,484)

*GSNeutral4_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral4_6WindFrontRaw,0,287,351,392)

*GSNeutral4_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral4_7WindFrontRaw,0,323,353,287)
createRawDataForArray(*GSNeutral4_7WindFrontRaw,1,618,327,255)
createRawDataForArray(*GSNeutral4_7WindFrontRaw,2,643,320,248)

;----GSGatling1
*GSGatling1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling1Raw,0,323, 25,459,301,  5,457)
createRawDataForArray(*GSGatling1Raw,1,108,  0,458,108, 40,578)
createRawDataForArray(*GSGatling1Raw,2, 30, 16,471)
createRawDataForArray(*GSGatling1Raw,3,327,330,586)

;----GSGatling2
*GSGatling2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling2Raw,0, 21,171,506, 20,173,519)
createRawDataForArray(*GSGatling2Raw,1,  7,204,497,  7,364,514)
createRawDataForArray(*GSGatling2Raw,2,124,397,526)
createRawDataForArray(*GSGatling2Raw,3,435,429,540)

;----GSGatling3
*GSGatling3Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling3Raw,0,10,450,521,  2,441,508)
createRawDataForArray(*GSGatling3Raw,1,14,447, 96,469,443, 87)
createRawDataForArray(*GSGatling3Raw,2,272,433, 11)
createRawDataForArray(*GSGatling3Raw,3,470,473,384)

;----GSNeutral5
*GSNeutral5Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSNeutral5Raw,0,419,386,343)
createRawDataForArray(*GSNeutral5Raw,1,400,372,363)
createRawDataForArray(*GSNeutral5Raw,2,363,379,377)
createRawDataForArray(*GSNeutral5Raw,3,322,400,356)
createRawDataForArray(*GSNeutral5Raw,4,342,310,369)
createRawDataForArray(*GSNeutral5Raw,5,346,270,371)
createRawDataForArray(*GSNeutral5Raw,6,412,370,346)

;----GSGatling4
*GSGatling4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling4Raw,0,66,473,298,67,475,380)
createRawDataForArray(*GSGatling4Raw,1,38,453,389,39,454,402)
createRawDataForArray(*GSGatling4Raw,2,3,451,405)
createRawDataForArray(*GSGatling4Raw,3,557,451,426)

;----GSGatling5
*GSGatling5Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling5Raw,0,19,440,504,18,439,503)
createRawDataForArray(*GSGatling5Raw,1,0,421,518,32,416,534)
createRawDataForArray(*GSGatling5Raw,2,15,419,534)
createRawDataForArray(*GSGatling5Raw,3,417,424,566)

;----GSGatling6
*GSGatling6Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSGatling6Raw,0,0,397,502,5,391,508)
createRawDataForArray(*GSGatling6Raw,1,0,395,511,1,471,558)
createRawDataForArray(*GSGatling6Raw,2,0,408,550)
createRawDataForArray(*GSGatling6Raw,3,379,466,586)

*GSNeutral5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral5_1WindFrontRaw,0,404,369,365)

*GSNeutral5_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral5_2WindFrontRaw,0,352,368,401)
createRawDataForArray(*GSNeutral5_2WindFrontRaw,1,341,365,492)
createRawDataForArray(*GSNeutral5_2WindFrontRaw,2,339,433,567)

*GSNeutral5_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral5_5WindFrontRaw,0,364,289,384)

*GSNeutral5_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral5_6WindFrontRaw,0,327,236,372)

*GSNeutral5_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral5_7WindFrontRaw,0,266,236,320)
createRawDataForArray(*GSNeutral5_7WindFrontRaw,1,220,344,301)
createRawDataForArray(*GSNeutral5_7WindFrontRaw,2,354,369,293)

;----GSNeutral6
*GSNeutral6Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSNeutral6Raw,0,393,363,333)
createRawDataForArray(*GSNeutral6Raw,1,392,370,343)
createRawDataForArray(*GSNeutral6Raw,2,375,377,306,406,367,460)
createRawDataForArray(*GSNeutral6Raw,3,354,371,319,349,366,524)

*GSNeutral6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral6_2WindFrontRaw,0,376,356,312)

*GSNeutral6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral6_3WindFrontRaw,0,359,314,276)

*GSNeutral6_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral6_4WindFrontRaw,0,328,309,219)
createRawDataForArray(*GSNeutral6_4WindFrontRaw,1,311,281,297)
createRawDataForArray(*GSNeutral6_4WindFrontRaw,2,292,288,315)

;----GSSide1
*GSSide1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSSide1Raw,0,435,362,331)
createRawDataForArray(*GSSide1Raw,1,426,273,335)
createRawDataForArray(*GSSide1Raw,2,458,276,248)
createRawDataForArray(*GSSide1Raw,3,342,418,359,397,292,250)
createRawDataForArray(*GSSide1Raw,4,240,345,359,239,376,475)
createRawDataForArray(*GSSide1Raw,5,342,341,350,300,352,556)

*GSSide1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide1_1WindFrontRaw,0,594,344,304)

*GSSide1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide1_2WindFrontRaw,0,439,246,273)
createRawDataForArray(*GSSide1_2WindFrontRaw,1,406,240,287)
createRawDataForArray(*GSSide1_2WindFrontRaw,2,370,215,379)

*GSSide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide1_3WindFrontRaw,0,523,257,223)

*GSSide1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide1_4WindFrontRaw,0,334,266,201)

*GSSide1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide1_5WindFrontRaw,0,203,276,221)

*GSSide1_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide1_6WindFrontRaw,0,264,300,186)
createRawDataForArray(*GSSide1_6WindFrontRaw,1,227,266,288)
createRawDataForArray(*GSSide1_6WindFrontRaw,2,210,270,537)

;----GSSide2
; *GSSide2Raw.rawdataArray=createRawDataArray(4)
; createRawDataForArray(*GSSide2Raw,0,300,352,356)
; createRawDataForArray(*GSSide2Raw,1,386,369,362)
; createRawDataForArray(*GSSide2Raw,2,362,296,350)
; createRawDataForArray(*GSSide2Raw,3,267,441,343,210,213,441)
; createRawDataForArray(*GSSide2Raw,4,202,442,290)
; 
; *GSSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*GSSide2_1WindFrontRaw,0,275,334,476)
; 
; *GSSide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*GSSide2_2WindFrontRaw,0,219,329,450)
; 
; *GSSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*GSSide2_3WindFrontRaw,0,176,244,318)
; 
; *GSSide2_4WindFront1Raw.rawdataArray=createRawDataArray(3)
; createRawDataForArray(*GSSide2_4WindFront1Raw,0,145,189,236)
; createRawDataForArray(*GSSide2_4WindFront1Raw,1,108,148,196)
; createRawDataForArray(*GSSide2_4WindFront1Raw,2,67,166,522)
; createRawDataForArray(*GSSide2_4WindFront1Raw,3,63,342,779)
; 
; *GSSide2_4WindFront2Raw.rawdataArray=createRawDataArray(2)
; createRawDataForArray(*GSSide2_4WindFront2Raw,0,187,540,612)
; createRawDataForArray(*GSSide2_4WindFront2Raw,1,110,461,633)
; createRawDataForArray(*GSSide2_4WindFront2Raw,2,47,390,612)
;----GSSide2
*GSSide2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSSide2Raw,0,285,343,367)
createRawDataForArray(*GSSide2Raw,1,362,360,386)
createRawDataForArray(*GSSide2Raw,2,348,287,373)
createRawDataForArray(*GSSide2Raw,3,227,352,340,225,235,477)
createRawDataForArray(*GSSide2Raw,4,251,438,339,222,401,600)
createRawDataForArray(*GSSide2Raw,5,192,442,300)

*GSSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_1WindFrontRaw,0,232,325,491)

*GSSide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_2WindFrontRaw,0,195,320,474)

*GSSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_3WindFrontRaw,0,162,232,311)

*GSSide2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_4WindFrontRaw,0,139,105,300)

*GSSide2_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSSide2_5WindFrontRaw,0,79,119,303)
createRawDataForArray(*GSSide2_5WindFrontRaw,1,33,116,246)
createRawDataForArray(*GSSide2_5WindFrontRaw,2,23,144,227)
createRawDataForArray(*GSSide2_5WindFrontRaw,3,77,136,624)
createRawDataForArray(*GSSide2_5WindFrontRaw,4,80,155,686)

*GSSide2_5WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide2_5WindBackRaw,0,232,575,656)
createRawDataForArray(*GSSide2_5WindBackRaw,1,203,534,629)
createRawDataForArray(*GSSide2_5WindBackRaw,2,184,490,615)
createRawDataForArray(*GSSide2_5WindBackRaw,3,156,418,727)

;----GSSide3
*GSSide3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSSide3Raw,0,250,422,355)
createRawDataForArray(*GSSide3Raw,1,386,272,348)
createRawDataForArray(*GSSide3Raw,2,407,349,336)
createRawDataForArray(*GSSide3Raw,3,345,408,378,357,395,299)
createRawDataForArray(*GSSide3Raw,4,250,383,373,245,446,528)
createRawDataForArray(*GSSide3Raw,5,368,357,338,312,403,497)

*GSSide3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide3_1WindFrontRaw,0,216,428,533)

*GSSide3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide3_2WindFrontRaw,0,187,196,370)

*GSSide3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide3_3WindFrontRaw,0,139,129,296)

*GSSide3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide3_4WindFrontRaw,0,206,179,223)

*GSSide3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide3_5WindFrontRaw,0,211,191,188)

*GSSide3_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide3_6WindFrontRaw,0,217,226,173)
createRawDataForArray(*GSSide3_6WindFrontRaw,1,193,352,148)
createRawDataForArray(*GSSide3_6WindFrontRaw,2,181,373,391)
createRawDataForArray(*GSSide3_6WindFrontRaw,3,193,361,516)

;----GSSide4
*GSSide4Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSSide4Raw,0,386,358,338)
createRawDataForArray(*GSSide4Raw,1,359,421,359)
createRawDataForArray(*GSSide4Raw,2,316,419,395)
createRawDataForArray(*GSSide4Raw,3,339,423,383)
createRawDataForArray(*GSSide4Raw,4,317,404,383)
createRawDataForArray(*GSSide4Raw,5,319,378,371)
createRawDataForArray(*GSSide4Raw,6,437,383,344)

*GSSide4_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide4_1WindFrontRaw,0,359,338,455)
createRawDataForArray(*GSSide4_1WindFrontRaw,1,337,348,530)
createRawDataForArray(*GSSide4_1WindFrontRaw,2,316,443,577)

*GSSide4_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide4_7WindFrontRaw,0,305,363,321)
createRawDataForArray(*GSSide4_7WindFrontRaw,1,345,332,282)
createRawDataForArray(*GSSide4_7WindFrontRaw,2,651,395,275)

*GSSide4_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSide4_1WindBackRaw,0,474,380,217)
createRawDataForArray(*GSSide4_1WindBackRaw,1,452,383,236)

;----GSShot5
*GSShot5Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSShot5Raw,0,100,433,472,99,433,476)
createRawDataForArray(*GSShot5Raw,1,166,441,473)
createRawDataForArray(*GSShot5Raw,2,439,466,475)
createRawDataForArray(*GSShot5Raw,3,474,465,473)

;----GSShot6
*GSShot6Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSShot6Raw,0,5,501,478,32-23,551-13,451+23) ; dumb me forgot some shifts in the drawing file
createRawDataForArray(*GSShot6Raw,1,97,526,451)
createRawDataForArray(*GSShot6Raw,2,410,519,451)
createRawDataForArray(*GSShot6Raw,3,468,513,446)

;----GSShot7
*GSShot7Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSShot7Raw,0,1,524,524,11-3,573-23,525+3) ; again
createRawDataForArray(*GSShot7Raw,1,117,549,512)
createRawDataForArray(*GSShot7Raw,2,378,548,512)
createRawDataForArray(*GSShot7Raw,3,420,545,506)

;----GSShot8
*GSShot8Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSShot8Raw,0,4,331,554,3,331,556)
createRawDataForArray(*GSShot8Raw,1,214,405,547)
createRawDataForArray(*GSShot8Raw,2,332,428,539)
createRawDataForArray(*GSShot8Raw,3,362,428,538)

;----GSSide5
*GSSide5Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSSide5Raw,0,332,382,332)
createRawDataForArray(*GSSide5Raw,1,314,387,330)
createRawDataForArray(*GSSide5Raw,2,336,384,324)
createRawDataForArray(*GSSide5Raw,3,275,442,343,275,455,543)
createRawDataForArray(*GSSide5Raw,4,221,416,335,221,453,641)
createRawDataForArray(*GSSide5Raw,5,400,396,349)

*GSSide5_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSide5_1WindFrontRaw,0,323,392,456)

*GSSide5_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSide5_2WindFrontRaw,0,291,368,321)
createRawDataForArray(*GSSide5_2WindFrontRaw,1,276,461,651)

*GSSide5_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide5_3WindFrontRaw,0,360,355,278)
createRawDataForArray(*GSSide5_3WindFrontRaw,1,434,346,273)
createRawDataForArray(*GSSide5_3WindFrontRaw,2,522,339,404)

*GSSide5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide5_4WindFrontRaw,0,262,397,304)

*GSSide5_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide5_5WindFrontRaw,0,195,417,269)
createRawDataForArray(*GSSide5_5WindFrontRaw,1,180,423,326)
createRawDataForArray(*GSSide5_5WindFrontRaw,2,116,409,396)
createRawDataForArray(*GSSide5_5WindFrontRaw,3,96 ,413,794)

*GSSide5_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSide5_6WindBackRaw,0,227,419,467)
createRawDataForArray(*GSSide5_6WindBackRaw,1,266,405,443)

;----GSSide6
*GSSide6Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSSide6Raw,0,315,374,369)
createRawDataForArray(*GSSide6Raw,1,223,367,317)
createRawDataForArray(*GSSide6Raw,2,295,397,373,355,371,286)
createRawDataForArray(*GSSide6Raw,3,195,400,313,194,394,641)
createRawDataForArray(*GSSide6Raw,4,227,409,356)
createRawDataForArray(*GSSide6Raw,5,210,387,361)
createRawDataForArray(*GSSide6Raw,6,391,409,343,365,531,399)
createRawDataForArray(*GSSide6Raw,7,268,418,379)
createRawDataForArray(*GSSide6Raw,8,408,369,344)

*GSSide6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide6_1WindFrontRaw,0,518,344,346)

*GSSide6_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide6_2WindFrontRaw,0,349,317,250)
createRawDataForArray(*GSSide6_2WindFrontRaw,1,421,309,245)
createRawDataForArray(*GSSide6_2WindFrontRaw,2,638,343,201)
createRawDataForArray(*GSSide6_2WindFrontRaw,3,695,442,186)

*GSSide6_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide6_3WindFrontRaw,0,287,349,191)
createRawDataForArray(*GSSide6_3WindFrontRaw,1,289,331,625)
createRawDataForArray(*GSSide6_3WindFrontRaw,2,254,297,632)
createRawDataForArray(*GSSide6_3WindFrontRaw,3,245,290,623)

*GSSide6_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide6_4WindFrontRaw,0,172,345,322)
createRawDataForArray(*GSSide6_4WindFrontRaw,1,274,343,517)
createRawDataForArray(*GSSide6_4WindFrontRaw,2,258,356,639)

*GSSide6_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide6_5WindFrontRaw,0,174,378,530)
createRawDataForArray(*GSSide6_5WindFrontRaw,1,150,407,678)
createRawDataForArray(*GSSide6_5WindFrontRaw,2,150,576,663)

*GSSide6_8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSide6_8WindFrontRaw,0,232,397,462)
createRawDataForArray(*GSSide6_8WindFrontRaw,1,227,499,631)

*GSSide6_9WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide6_9WindFrontRaw,0,256,339,347)
createRawDataForArray(*GSSide6_9WindFrontRaw,1,339,306,286)
createRawDataForArray(*GSSide6_9WindFrontRaw,2,680,361,279)

*GSSide6_7WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSSide6_7WindBackRaw,0,195,463,348)
createRawDataForArray(*GSSide6_7WindBackRaw,1,260,363,290)
createRawDataForArray(*GSSide6_7WindBackRaw,2,493,365,257)
createRawDataForArray(*GSSide6_7WindBackRaw,3,571,418,251)
createRawDataForArray(*GSSide6_7WindBackRaw,4,621,555,246)

*GSSide6_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide6_8WindBackRaw,0,251,443,615)

*GSSide6_9WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide6_9WindBackRaw,0,271,369,310)
createRawDataForArray(*GSSide6_9WindBackRaw,1,288,350,276)
createRawDataForArray(*GSSide6_9WindBackRaw,2,608,360,271)
createRawDataForArray(*GSSide6_9WindBackRaw,3,683,383,288)

;----GSBack1
*GSBack1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSBack1Raw,0,390,399,282)
createRawDataForArray(*GSBack1Raw,1,350,432,339)
createRawDataForArray(*GSBack1Raw,2,318,434,320)
createRawDataForArray(*GSBack1Raw,3,412,417,355); index 5 - 6.png
createRawDataForArray(*GSBack1Raw,4,399,370,320); index 7 - 8.png
createRawDataForArray(*GSBack1Raw,5,395,367,308); index 8 - 9.png

*GSBack1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_1WindFrontRaw,0,359,398,298)

*GSBack1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_2WindFrontRaw,0,298,392,266)

*GSBack1_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack1_3WindFrontRaw,0,268,406,278)
createRawDataForArray(*GSBack1_3WindFrontRaw,1,197,418,450)
createRawDataForArray(*GSBack1_3WindFrontRaw,2,232,571,639)

*GSBack1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_4WindFrontRaw,0,239,413,292)

*GSBack1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_5WindFrontRaw,0,208,394,284)

*GSBack1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_6WindFrontRaw,0,273,403,302)

*GSBack1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_7WindFrontRaw,0,284,391,299)

*GSBack1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack1_8WindFrontRaw,0,276,336,259)

*GSBack1_9WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSBack1_9WindFrontRaw,0,459,303,211)
createRawDataForArray(*GSBack1_9WindFrontRaw,1,438,314,190)
createRawDataForArray(*GSBack1_9WindFrontRaw,2,538,457,236)
createRawDataForArray(*GSBack1_9WindFrontRaw,3,650,510,224)

*GSBack1_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack1_4WindBackRaw,0,261,614,654)
createRawDataForArray(*GSBack1_4WindBackRaw,1,237,585,613)
createRawDataForArray(*GSBack1_4WindBackRaw,2,226,596,621)

*GSBack1_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSBack1_6WindBackRaw,0,339,604,561)
createRawDataForArray(*GSBack1_6WindBackRaw,1,338,589,564)

;----GSExplosion1
*GSExplosion1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSExplosion1Raw,0,126,554,644,148,569,646)
createRawDataForArray(*GSExplosion1Raw,1, 79,545,617,117,556,618)
createRawDataForArray(*GSExplosion1Raw,2, 85,428,473,130,563,674)
createRawDataForArray(*GSExplosion1Raw,3,111,486,551,122,518,677)
createRawDataForArray(*GSExplosion1Raw,4, 44,466,564)
createRawDataForArray(*GSExplosion1Raw,5, 19,450,611)
createRawDataForArray(*GSExplosion1Raw,6, 21,451,597)

;----GSExplosion2
*GSExplosion2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSExplosion2Raw,0,583,378,197,581,384,204)
createRawDataForArray(*GSExplosion2Raw,1,491,292,122,519,374,190)
createRawDataForArray(*GSExplosion2Raw,2,462,336,135,551,352,176)
createRawDataForArray(*GSExplosion2Raw,3,439,289,106)
createRawDataForArray(*GSExplosion2Raw,4,472,326,98)
createRawDataForArray(*GSExplosion2Raw,5,465,329,93)

;----GSExplosion3
*GSExplosion3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSExplosion3Raw,0,219,578,655)
createRawDataForArray(*GSExplosion3Raw,1,119,465,559,159,502,606)
createRawDataForArray(*GSExplosion3Raw,2, 37,526,479,215,554,608)
createRawDataForArray(*GSExplosion3Raw,3,144,513,546,238,587,653)
createRawDataForArray(*GSExplosion3Raw,4,138,491,536)
createRawDataForArray(*GSExplosion3Raw,5,159,516,530)

;----GSExplosion4
*GSExplosion4Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSExplosion4Raw,0,125,411,716,176,475,734)
createRawDataForArray(*GSExplosion4Raw,1,129,373,582,142,420,644)
createRawDataForArray(*GSExplosion4Raw,2,106,375,609,160,449,683)
createRawDataForArray(*GSExplosion4Raw,3,140,355,557,215,449,651)
createRawDataForArray(*GSExplosion4Raw,4,125,346,589)
createRawDataForArray(*GSExplosion4Raw,5,122,345,589)

;----GSExplosion5
*GSExplosion5Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSExplosion5Raw,0,92,513,778,130,531,782)
createRawDataForArray(*GSExplosion5Raw,1,0,432,725,45,502,722)
createRawDataForArray(*GSExplosion5Raw,2,0,444,672,1,465,685)
createRawDataForArray(*GSExplosion5Raw,3,9,388,468,11,438,528)
createRawDataForArray(*GSExplosion5Raw,4,23,351,235,54,483,329)
createRawDataForArray(*GSExplosion5Raw,5,56,349,41,54,460,770)
createRawDataForArray(*GSExplosion5Raw,6,18,341,4,1,364,893)

;----GSBack2
*GSBack2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSBack2Raw,0,316,430,352)
createRawDataForArray(*GSBack2Raw,1,309,397,382)
createRawDataForArray(*GSBack2Raw,2,432,338,370)
createRawDataForArray(*GSBack2Raw,3,387,351,314)
createRawDataForArray(*GSBack2Raw,4,373,349,313)
createRawDataForArray(*GSBack2Raw,5,410,381,349)

*GSBack2_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSBack2_1WindFrontRaw,0,295,392,487)
createRawDataForArray(*GSBack2_1WindFrontRaw,1,326,422,339)

*GSBack2_2WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack2_2WindFront1Raw,0,227,385,347)

*GSBack2_2WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack2_2WindFront2Raw,0,184,447,668)
createRawDataForArray(*GSBack2_2WindFront2Raw,1,165,441,694)
createRawDataForArray(*GSBack2_2WindFront2Raw,2,161,444,716)

*GSBack2_3WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack2_3WindFront1Raw,0,173,324,346)

*GSBack2_3WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack2_3WindFront2Raw,0,206,331,528)
createRawDataForArray(*GSBack2_3WindFront2Raw,1,207,332,575)
createRawDataForArray(*GSBack2_3WindFront2Raw,2,208,334,589)

*GSBack2_4WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSBack2_4WindFront1Raw,0,157,316,252)

*GSBack2_4WindFront2Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSBack2_4WindFront2Raw,0,320,362,470)
createRawDataForArray(*GSBack2_4WindFront2Raw,1,351,356,482)

*GSBack2_5WindFront1Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack2_5WindFront1Raw,0,291,261,249)
createRawDataForArray(*GSBack2_5WindFront1Raw,1,510,274,274)
createRawDataForArray(*GSBack2_5WindFront1Raw,2,658,296,246)

*GSBack2_5WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSBack2_5WindFront2Raw,0,477,537,255)
createRawDataForArray(*GSBack2_5WindFront2Raw,1,468,517,213)
createRawDataForArray(*GSBack2_5WindFront2Raw,2,603,488,190)

*GSBack2_6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSBack2_6WindFrontRaw,0,413,365,390)
createRawDataForArray(*GSBack2_6WindFrontRaw,1,388,400,495)

;----GSDown1
*GSDown1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSDown1Raw,0,434,294,350)
createRawDataForArray(*GSDown1Raw,1,356,334,379)
createRawDataForArray(*GSDown1Raw,2,446,313,377)
createRawDataForArray(*GSDown1Raw,3,364,300,357,384,472,559)
createRawDataForArray(*GSDown1Raw,4,298,433,374,300,478,625)
createRawDataForArray(*GSDown1Raw,5,401,403,365)
createRawDataForArray(*GSDown1Raw,6,358,416,362)
createRawDataForArray(*GSDown1Raw,7,360,374,390)

*GSDown1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown1_1WindFrontRaw,0,474,269,290)

*GSDown1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown1_2WindFrontRaw,0,281,240,270)

*GSDown1_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSDown1_3WindFrontRaw,0,278,248,332)
createRawDataForArray(*GSDown1_3WindFrontRaw,1,276,284,484)
createRawDataForArray(*GSDown1_3WindFrontRaw,2,271,493,488)
createRawDataForArray(*GSDown1_3WindFrontRaw,3,406,543,486)

*GSDown1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown1_4WindFrontRaw,0,325,437,511)

*GSDown1_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSDown1_5WindFrontRaw,0,185,384,356)
createRawDataForArray(*GSDown1_5WindFrontRaw,1,179,410,397)
createRawDataForArray(*GSDown1_5WindFrontRaw,2,120,529,442)
createRawDataForArray(*GSDown1_5WindFrontRaw,3,83,528,400)

*GSDown1_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSDown1_6WindFrontRaw,0,384,381,285)
createRawDataForArray(*GSDown1_6WindFrontRaw,1,367,364,281)
createRawDataForArray(*GSDown1_6WindFrontRaw,2,363,336,287)
createRawDataForArray(*GSDown1_6WindFrontRaw,3,402,308,329)

*GSDown1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown1_7WindFrontRaw,0,429,335,347)

*GSDown1_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDown1_8WindFrontRaw,0,429,310,335)
createRawDataForArray(*GSDown1_8WindFrontRaw,1,414,447,302)
createRawDataForArray(*GSDown1_8WindFrontRaw,2,392,507,283)

*GSDown1_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDown1_3WindBackRaw,0,468,304,402)
createRawDataForArray(*GSDown1_3WindBackRaw,1,450,295,423)

*GSDown1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown1_4WindBackRaw,0,378,172,565)

*GSDown1_5WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSDown1_5WindBackRaw,0,285,223,625)
createRawDataForArray(*GSDown1_5WindBackRaw,1,245,266,558)
createRawDataForArray(*GSDown1_5WindBackRaw,2,134,401,462)
createRawDataForArray(*GSDown1_5WindBackRaw,3,108,580,428)
createRawDataForArray(*GSDown1_5WindBackRaw,4,167,624,436)

*GSDown1_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDown1_6WindBackRaw,0,468,613,313)
createRawDataForArray(*GSDown1_6WindBackRaw,1,478,443,375)

;----GSShockwave1
*GSShockwave1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSShockwave1Raw,0,293,651,612)
createRawDataForArray(*GSShockwave1Raw,1,228,600,546,239,605-15,553)
createRawDataForArray(*GSShockwave1Raw,2,139,564,462,146,583-15,461)
createRawDataForArray(*GSShockwave1Raw,3, 74,547,394, 76,642-15,390)
createRawDataForArray(*GSShockwave1Raw,4, 12,537,385, 11,658-15,384)
createRawDataForArray(*GSShockwave1Raw,5, 35,647,264, 34,660-15,260)
createRawDataForArray(*GSShockwave1Raw,6, 28,678,138)

;----GSDown2
*GSDown2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSDown2Raw,0,320,372,385)
createRawDataForArray(*GSDown2Raw,1,265,355,323)
createRawDataForArray(*GSDown2Raw,2,278,371,387)
createRawDataForArray(*GSDown2Raw,3,371,437,365)
createRawDataForArray(*GSDown2Raw,4,349,288,378)
createRawDataForArray(*GSDown2Raw,5,407,243,375)

*GSDown2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown2_1WindFrontRaw,0,356,344,347)

*GSDown2_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDown2_2WindFrontRaw,0,335,324,279)
createRawDataForArray(*GSDown2_2WindFrontRaw,1,508,312,255)
createRawDataForArray(*GSDown2_2WindFrontRaw,2,680,374,245)

*GSDown2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown2_3WindFrontRaw,0,344,329,368)

*GSDown2_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDown2_4WindFrontRaw,0,318,367,413)
createRawDataForArray(*GSDown2_4WindFrontRaw,1,293,403,377)
createRawDataForArray(*GSDown2_4WindFrontRaw,2,278,543,598)

*GSDown2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown2_5WindFrontRaw,0,294,240,399)

*GSDown2_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDown2_6WindFrontRaw,0,304,145,343)
createRawDataForArray(*GSDown2_6WindFrontRaw,1,413,166,304)
createRawDataForArray(*GSDown2_6WindFrontRaw,2,600,201,321)

*GSDown2_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSDown2_2WindBackRaw,0,33,587,474)
createRawDataForArray(*GSDown2_2WindBackRaw,1,72,603,527)
createRawDataForArray(*GSDown2_2WindBackRaw,2,141,609,536)

*GSDown2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSDown2_5WindBackRaw,0,286,409,554)

*GSDown2_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDown2_6WindBackRaw,0,323,391,529)
createRawDataForArray(*GSDown2_6WindBackRaw,1,353,386,538)

;----GSCrack1
*GSCrack1Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSCrack1Raw,0,68,549,462)
createRawDataForArray(*GSCrack1Raw,1,61,527,451)
createRawDataForArray(*GSCrack1Raw,2,57,523,448)

;----GSCrack2
*GSCrack2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSCrack2Raw,0,306,576,534)
createRawDataForArray(*GSCrack2Raw,1,275,554,502)
createRawDataForArray(*GSCrack2Raw,2,310,539,525)

;----GSShockwave2
*GSShockwave2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSShockwave2Raw,0,35,543,506,29,546,480)
createRawDataForArray(*GSShockwave2Raw,1,36,532,509,162,543,533)
createRawDataForArray(*GSShockwave2Raw,2,41,529,416,52,577,451)
createRawDataForArray(*GSShockwave2Raw,3,1,559,271,36,607,313)
createRawDataForArray(*GSShockwave2Raw,4,11,589,173)

;----GSShockwave3
*GSShockwave3Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSShockwave3Raw,0,170,537,629,171,539,638)
createRawDataForArray(*GSShockwave3Raw,1,93,447,650,99,449,681)
createRawDataForArray(*GSShockwave3Raw,2,30,387,579)
createRawDataForArray(*GSShockwave3Raw,3,21,345,586)

;----GSExplosion6
*GSExplosion6Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSExplosion6Raw,0,278,283,571,309,307,600)
createRawDataForArray(*GSExplosion6Raw,1,183,250,508,276,260,583)
createRawDataForArray(*GSExplosion6Raw,2,243,162,557,240,169,558)
createRawDataForArray(*GSExplosion6Raw,3,205,13,528,256,2,576)
createRawDataForArray(*GSExplosion6Raw,4,200,215,516)
createRawDataForArray(*GSExplosion6Raw,5,193,271,517)
createRawDataForArray(*GSExplosion6Raw,6,191,280,521)

;----GSExplosion7
*GSExplosion7Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSExplosion7Raw,0,130,529,771,137,534,780)
createRawDataForArray(*GSExplosion7Raw,1,104,489,598,114,492,598)
createRawDataForArray(*GSExplosion7Raw,2,109,476,595,136,501,594)
createRawDataForArray(*GSExplosion7Raw,3,83,464,564)
createRawDataForArray(*GSExplosion7Raw,4,78,450,575)
createRawDataForArray(*GSExplosion7Raw,5,72,444,571)

;----GSUp1
*GSUp1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSUp1Raw,0,417,307,322)
createRawDataForArray(*GSUp1Raw,1,462,277,306)
createRawDataForArray(*GSUp1Raw,2,397,244,371,396,242,282)
createRawDataForArray(*GSUp1Raw,3,257,331,372,258,234,428)
createRawDataForArray(*GSUp1Raw,4,200,421,351,176,339,584)
createRawDataForArray(*GSUp1Raw,5,356,427,371,265,585,554)
createRawDataForArray(*GSUp1Raw,6,300,447,366,418,522,460)
createRawDataForArray(*GSUp1Raw,7,400,432,345,353,516,344)

*GSUp1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_1WindFrontRaw,0,387,285,295)

*GSUp1_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSUp1_2WindFrontRaw,0,371,262,269)
createRawDataForArray(*GSUp1_2WindFrontRaw,1,348,220,243)
createRawDataForArray(*GSUp1_2WindFrontRaw,2,560,233,208)
createRawDataForArray(*GSUp1_2WindFrontRaw,3,709,401,199)

*GSUp1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_3WindFrontRaw,0,407,215,283)

*GSUp1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_4WindFrontRaw,0,235,139,243)

*GSUp1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_5WindFrontRaw,0,74,127,185)

*GSUp1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_6WindFrontRaw,0,68,167,264)

*GSUp1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_7WindFrontRaw,0,112,188,433)

*GSUp1_8WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSUp1_8WindFrontRaw,0,356,525,324)
createRawDataForArray(*GSUp1_8WindFrontRaw,1,330,504,301)
createRawDataForArray(*GSUp1_8WindFrontRaw,2,309,479,270)
createRawDataForArray(*GSUp1_8WindFrontRaw,3,310,480,267)

*GSUp1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_3WindBackRaw,0,355,287,449)

*GSUp1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp1_4WindBackRaw,0,338,313,422)

*GSUp1_8WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSUp1_8WindBackRaw,0,114,231,252)
createRawDataForArray(*GSUp1_8WindBackRaw,1,102,432,201)
createRawDataForArray(*GSUp1_8WindBackRaw,2,144,490,193)

;----GSUp2
*GSUp2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSUp2Raw,0,362,426,367)
createRawDataForArray(*GSUp2Raw,1,459,405,275)
createRawDataForArray(*GSUp2Raw,2,388,332,350,497,408,227)
createRawDataForArray(*GSUp2Raw,3,336,312,384,334,306,396)
createRawDataForArray(*GSUp2Raw,4,246,290,381,244,282,581)
createRawDataForArray(*GSUp2Raw,5,291,291,355)

*GSUp2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp2_1WindFrontRaw,0,325,360,412)

*GSUp2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp2_4WindFrontRaw,0,404,303,363)

*GSUp2_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSUp2_2WindBackRaw,0,296,425,239)
createRawDataForArray(*GSUp2_2WindBackRaw,1,320,444,216)
createRawDataForArray(*GSUp2_2WindBackRaw,2,642,446,205)

*GSUp2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp2_3WindBackRaw,0,365,309,245)

*GSUp2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp2_4WindBackRaw,0,306,286,226)

*GSUp2_5WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSUp2_5WindBackRaw,0,202,248,276)
createRawDataForArray(*GSUp2_5WindBackRaw,1,123,214,338)
createRawDataForArray(*GSUp2_5WindBackRaw,2,130,226,568)
createRawDataForArray(*GSUp2_5WindBackRaw,3,124,227,733)

;----GSUp3
*GSUp3Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSUp3Raw,0,391,356,341)
createRawDataForArray(*GSUp3Raw,1,400,370,361,401,382,500)
createRawDataForArray(*GSUp3Raw,2,366,316,379,365,317,554)
createRawDataForArray(*GSUp3Raw,3,379,324,378)
createRawDataForArray(*GSUp3Raw,4,372,340,370)
createRawDataForArray(*GSUp3Raw,5,402,338,367)
createRawDataForArray(*GSUp3Raw,6,413,349,364)

*GSUp3_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSUp3_1WindFrontRaw,0,437,335,323)
createRawDataForArray(*GSUp3_1WindFrontRaw,1,465,327,298)

*GSUp3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSUp3_2WindFrontRaw,0,369,332,335)

*GSUp3_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSUp3_3WindFrontRaw,0,336,285,379)
createRawDataForArray(*GSUp3_3WindFrontRaw,1,318,267,433)

;----GSHeavy1
*GSHeavy1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSHeavy1Raw,0,446,347,322)
createRawDataForArray(*GSHeavy1Raw,1,426,358,349)
createRawDataForArray(*GSHeavy1Raw,2,299,374,377,299,378,499)
createRawDataForArray(*GSHeavy1Raw,3,183,408,373,181,434,619)
createRawDataForArray(*GSHeavy1Raw,4,203,421,372,203,498,658)
createRawDataForArray(*GSHeavy1Raw,5,252,388,364)
createRawDataForArray(*GSHeavy1Raw,6,320,421,374)
createRawDataForArray(*GSHeavy1Raw,7,351,394,330)

*GSHeavy1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSHeavy1_1WindFrontRaw,0,470,347,289)
createRawDataForArray(*GSHeavy1_1WindFrontRaw,1,541,364,272)

*GSHeavy1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_2WindFrontRaw,0,406,363,408)

*GSHeavy1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_3WindFrontRaw,0,280,362,288)

*GSHeavy1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_4WindFrontRaw,0,150,361,257)

*GSHeavy1_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSHeavy1_5WindFrontRaw,0,147,327,358)
createRawDataForArray(*GSHeavy1_5WindFrontRaw,1,124,352,482)
createRawDataForArray(*GSHeavy1_5WindFrontRaw,2,89,373,567)
createRawDataForArray(*GSHeavy1_5WindFrontRaw,3,103,541,730)

*GSHeavy1_6WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_6WindFront1Raw,0,289,364,318)

*GSHeavy1_6WindFront2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSHeavy1_6WindFront2Raw,0,153,516,728)
createRawDataForArray(*GSHeavy1_6WindFront2Raw,1,133,492,671)
createRawDataForArray(*GSHeavy1_6WindFront2Raw,2,122,473,677)
createRawDataForArray(*GSHeavy1_6WindFront2Raw,3,115,464,675)

*GSHeavy1_7WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_7WindFront1Raw,0,290,365,324)

*GSHeavy1_7WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy1_7WindFront2Raw,0,218,511,660)
createRawDataForArray(*GSHeavy1_7WindFront2Raw,1,206,502,634)
createRawDataForArray(*GSHeavy1_7WindFront2Raw,2,213,503,645)

*GSHeavy1_8WindFront1Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy1_8WindFront1Raw,0,207,337,286)
createRawDataForArray(*GSHeavy1_8WindFront1Raw,1,285,341,264)
createRawDataForArray(*GSHeavy1_8WindFront1Raw,2,462,345,249)

*GSHeavy1_8WindFront2Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSHeavy1_8WindFront2Raw,0,235,391,620)
createRawDataForArray(*GSHeavy1_8WindFront2Raw,1,237,389,637)

*GSHeavy1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy1_2WindBackRaw,0,570,362,302)

;----GSHeavy2
*GSHeavy2Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSHeavy2Raw,0,357,389,348)
createRawDataForArray(*GSHeavy2Raw,1,339,364,338)
createRawDataForArray(*GSHeavy2Raw,2,336,384,325)
createRawDataForArray(*GSHeavy2Raw,3,310,390,362,309,429,559)
createRawDataForArray(*GSHeavy2Raw,4,160,400,385,159,453,577)
createRawDataForArray(*GSHeavy2Raw,5,249,343,373,192,342,654)
createRawDataForArray(*GSHeavy2Raw,6,395,303,356,254,275,387)
createRawDataForArray(*GSHeavy2Raw,7,433,419,215,542,310,213)

*GSHeavy2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_1WindFrontRaw,0,321,414,321)

*GSHeavy2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_2WindFrontRaw,0,309,316,383)

*GSHeavy2_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy2_3WindFrontRaw,0,277,304,301)
createRawDataForArray(*GSHeavy2_3WindFrontRaw,1,265,344,284)
createRawDataForArray(*GSHeavy2_3WindFrontRaw,2,327,341,348)

*GSHeavy2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_4WindFrontRaw,0,270,401,334)

*GSHeavy2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_5WindFrontRaw,0,109,368,153)

*GSHeavy2_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_6WindFrontRaw,0,121,313,358)

*GSHeavy2_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy2_7WindFrontRaw,0,111,178,339)

*GSHeavy2_8WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSHeavy2_8WindFrontRaw,0,113,163,133)
createRawDataForArray(*GSHeavy2_8WindFrontRaw,1,89,192,152)
createRawDataForArray(*GSHeavy2_8WindFrontRaw,2,325,218,109)
createRawDataForArray(*GSHeavy2_8WindFrontRaw,3,674,349,94)
createRawDataForArray(*GSHeavy2_8WindFrontRaw,4,758,481,79)

;----GSHeavy3
*GSHeavy3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSHeavy3Raw,0,456,424,218)
createRawDataForArray(*GSHeavy3Raw,1,393,410,345,398,569,234)
createRawDataForArray(*GSHeavy3Raw,2,305,367,355,283,367,506)
createRawDataForArray(*GSHeavy3Raw,3,406,135,349,271,135,385)
createRawDataForArray(*GSHeavy3Raw,4,422,314,97,577,120,97)

*GSHeavy3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy3_1WindFrontRaw,0,439,476,196)

*GSHeavy3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy3_2WindFrontRaw,0,353,378,177)

*GSHeavy3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy3_3WindFrontRaw,0,230,305,226)

*GSHeavy3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy3_4WindFrontRaw,0,189,100,290)

*GSHeavy3_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSHeavy3_5WindFrontRaw,0,136,33,37)
createRawDataForArray(*GSHeavy3_5WindFrontRaw,1,70,23,26)
createRawDataForArray(*GSHeavy3_5WindFrontRaw,2,620,75,19)
createRawDataForArray(*GSHeavy3_5WindFrontRaw,3,728,228,35)
createRawDataForArray(*GSHeavy3_5WindFrontRaw,4,847,433,26)

;----GSHeavy4
*GSHeavy4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSHeavy4Raw,0,359,397,347)
createRawDataForArray(*GSHeavy4Raw,1,363,418,344,362,480,566)
createRawDataForArray(*GSHeavy4Raw,2,415,422,363)
createRawDataForArray(*GSHeavy4Raw,3,398,373,337)

*GSHeavy4_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy4_2WindFrontRaw,0,328,374,375)
createRawDataForArray(*GSHeavy4_2WindFrontRaw,1,324,372,299)
createRawDataForArray(*GSHeavy4_2WindFrontRaw,2,303,350,234)

*GSHeavy4_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy4_3WindFrontRaw,0,240,338,193)
createRawDataForArray(*GSHeavy4_3WindFrontRaw,1,244,319,216)
createRawDataForArray(*GSHeavy4_3WindFrontRaw,2,250,438,552)

*GSHeavy4_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy4_4WindFrontRaw,0,382,354,315)
createRawDataForArray(*GSHeavy4_4WindFrontRaw,1,493,331,287)
createRawDataForArray(*GSHeavy4_4WindFrontRaw,2,618,318,272)

*GSHeavy4_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSHeavy4_1WindBackRaw,0,329,385,354)
createRawDataForArray(*GSHeavy4_1WindBackRaw,1,330,373,347)

;----GSHeavy5
*GSHeavy5Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSHeavy5Raw,0,304,429,371,305,508,540)
createRawDataForArray(*GSHeavy5Raw,1,263,415,357,263,471,667)
createRawDataForArray(*GSHeavy5Raw,2,317,410,328)
createRawDataForArray(*GSHeavy5Raw,3,379,387,379)
createRawDataForArray(*GSHeavy5Raw,4,384,322,364)
createRawDataForArray(*GSHeavy5Raw,5,380,351,328)

*GSHeavy5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy5_1WindFrontRaw,0,272,401,352)

*GSHeavy5_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy5_2WindFrontRaw,0,236,382,346)
createRawDataForArray(*GSHeavy5_2WindFrontRaw,1,194,430,632)
createRawDataForArray(*GSHeavy5_2WindFrontRaw,2,180,428,685)

*GSHeavy5_3WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy5_3WindFront1Raw,0,295,322,247)

*GSHeavy5_3WindFront2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSHeavy5_3WindFront2Raw,0,175,440,673)
createRawDataForArray(*GSHeavy5_3WindFront2Raw,1,176,430,610)
createRawDataForArray(*GSHeavy5_3WindFront2Raw,2,160,417,600)
createRawDataForArray(*GSHeavy5_3WindFront2Raw,3,163,417,596)

*GSHeavy5_4WindFront1Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy5_4WindFront1Raw,0,264,327,279)

*GSHeavy5_4WindFront2Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSHeavy5_4WindFront2Raw,0,227,355,580)
createRawDataForArray(*GSHeavy5_4WindFront2Raw,1,215,355,600)

*GSHeavy5_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy5_5WindFrontRaw,0,222,295,277)

*GSHeavy5_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSHeavy5_6WindFrontRaw,0,298,266,255)
createRawDataForArray(*GSHeavy5_6WindFrontRaw,1,509,232,225)
createRawDataForArray(*GSHeavy5_6WindFrontRaw,2,647,258,265)

*GSHeavy5_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSHeavy5_3WindBackRaw,0,262,363,316)

;----GSDodge
*GSDodgeRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDodgeRaw,0,441,375,305)
createRawDataForArray(*GSDodgeRaw,1,472,394,226)

;----GSParry
*GSParryRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSParryRaw,0,415,357,371)
createRawDataForArray(*GSParryRaw,1,384,359,371)
createRawDataForArray(*GSParryRaw,2,437,351,371)
createRawDataForArray(*GSParryRaw,3,447,344,372)
createRawDataForArray(*GSParryRaw,4,438,358,365)
createRawDataForArray(*GSParryRaw,5,422,362,344)
createRawDataForArray(*GSParryRaw,6,420,373,343)

;----GSShot1
*GSShot1Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSShot1Raw,0,1,148,594,0,147,599)
createRawDataForArray(*GSShot1Raw,1,177,227,597)
createRawDataForArray(*GSShot1Raw,2,311,272,601)

;----GSShot2
*GSShot2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSShot2Raw,0,0,286,592,0,288,599)
createRawDataForArray(*GSShot2Raw,1,17,278,576)
createRawDataForArray(*GSShot2Raw,2,324,319,592)

;----GSShot3
*GSShot3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSShot3Raw,0,52,215,573,52,215,581)
createRawDataForArray(*GSShot3Raw,1,123,237,576)
createRawDataForArray(*GSShot3Raw,2,347,299,580)

;----GSShot4
*GSShot4Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSShot4Raw,0,19,274,568,20,274,578)
createRawDataForArray(*GSShot4Raw,1,194,314,567)
createRawDataForArray(*GSShot4Raw,2,361,321,566)

;----GSSelection
*GSSelectionRaw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*GSSelectionRaw,0,346,391,269)
createRawDataForArray(*GSSelectionRaw,1,346,386,311)
createRawDataForArray(*GSSelectionRaw,2,346,405,347)
createRawDataForArray(*GSSelectionRaw,3,346,419,364)
createRawDataForArray(*GSSelectionRaw,4,339,419,377)
createRawDataForArray(*GSSelectionRaw,5,339,419,376)
createRawDataForArray(*GSSelectionRaw,6,338,417,382)
createRawDataForArray(*GSSelectionRaw,7,337,414,386)
createRawDataForArray(*GSSelectionRaw,8,337,419,381)
createRawDataForArray(*GSSelectionRaw,9,341,419,374)
createRawDataForArray(*GSSelectionRaw,10,346,419,384)
createRawDataForArray(*GSSelectionRaw,11,340,419,376)

*GSSelection_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelection_2WindFrontRaw,0,468,396,307)

*GSSelection_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelection_3WindFrontRaw,0,371,377,313)

*GSSelection_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSelection_4WindFrontRaw,0,332,378,440)
createRawDataForArray(*GSSelection_4WindFrontRaw,1,316,385,481)
createRawDataForArray(*GSSelection_4WindFrontRaw,2,311,409,666)

;----GSSelected
*GSSelectedRaw.rawdataArray=createRawDataArray(24)
createRawDataForArray(*GSSelectedRaw,0,249,388,385)
createRawDataForArray(*GSSelectedRaw,1,286,315,366)
createRawDataForArray(*GSSelectedRaw,2,466,154,355)
createRawDataForArray(*GSSelectedRaw,3,480,217,326)
createRawDataForArray(*GSSelectedRaw,4,493,323,162)
createRawDataForArray(*GSSelectedRaw,5,529,352,181)
createRawDataForArray(*GSSelectedRaw,6,508,317,135)
createRawDataForArray(*GSSelectedRaw,7,501,194,305)
createRawDataForArray(*GSSelectedRaw,8,296,285,357)
createRawDataForArray(*GSSelectedRaw,9,175,433,403)
createRawDataForArray(*GSSelectedRaw,10,181,421,442)
createRawDataForArray(*GSSelectedRaw,11,222,407,376)
createRawDataForArray(*GSSelectedRaw,12,382,306,376)
createRawDataForArray(*GSSelectedRaw,13,435,313,373)
createRawDataForArray(*GSSelectedRaw,14,397,335,353)
createRawDataForArray(*GSSelectedRaw,15,358,356,337)
createRawDataForArray(*GSSelectedRaw,16,351,360,328)
createRawDataForArray(*GSSelectedRaw,17,369,361,327)
createRawDataForArray(*GSSelectedRaw,18,373,369,328)
createRawDataForArray(*GSSelectedRaw,19,375,373,338)
createRawDataForArray(*GSSelectedRaw,20,365,374,340)
createRawDataForArray(*GSSelectedRaw,21,361,378,343)
createRawDataForArray(*GSSelectedRaw,22,371,367,329)
createRawDataForArray(*GSSelectedRaw,23,354,374,331)
createRawDataForArray(*GSSelectedRaw,24,367,367,326)

*GSSelected_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_1WindFrontRaw,0,236,400,527)

*GSSelected_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_2WindFrontRaw,0,186,293,430)

*GSSelected_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_3WindFrontRaw,0,164,96,363)

*GSSelected_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_4WindFrontRaw,0,163,75,293)

*GSSelected_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_5WindFrontRaw,0,161,71,71)

*GSSelected_6WindFrontRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSSelected_6WindFrontRaw,0,201,71,15)
createRawDataForArray(*GSSelected_6WindFrontRaw,1,161,62,20)
createRawDataForArray(*GSSelected_6WindFrontRaw,2,350,58,16)
createRawDataForArray(*GSSelected_6WindFrontRaw,3,582,180,33)
createRawDataForArray(*GSSelected_6WindFrontRaw,4,598,611,52)
createRawDataForArray(*GSSelected_6WindFrontRaw,5,686,742,140)

*GSSelected_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_7WindFrontRaw,0,610,291,59)

*GSSelected_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_8WindFrontRaw,0,524,118,60)

*GSSelected_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_9WindFrontRaw,0,276,67,60)

*GSSelected_10WindFront1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSSelected_10WindFront1Raw,0,87,55,48)
createRawDataForArray(*GSSelected_10WindFront1Raw,1,64,58,196)
createRawDataForArray(*GSSelected_10WindFront1Raw,2,78,52,228)
createRawDataForArray(*GSSelected_10WindFront1Raw,3,58,261,548)
createRawDataForArray(*GSSelected_10WindFront1Raw,4,53,516,553)

*GSSelected_10WindFront2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSSelected_10WindFront2Raw,0,107,545,691)
createRawDataForArray(*GSSelected_10WindFront2Raw,1,37,507,716)
createRawDataForArray(*GSSelected_10WindFront2Raw,2,25,439,688)
createRawDataForArray(*GSSelected_10WindFront2Raw,3,26,434,644)
createRawDataForArray(*GSSelected_10WindFront2Raw,4,39,432,757)

*GSSelected_12WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_12WindFrontRaw,0,171,401,556)

*GSSelected_13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_13WindFrontRaw,0,167,238,472)

*GSSelected_14WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSelected_14WindFrontRaw,0,168,225,349)
createRawDataForArray(*GSSelected_14WindFrontRaw,1,166,236,332)
createRawDataForArray(*GSSelected_14WindFrontRaw,2,500,236,324)
createRawDataForArray(*GSSelected_14WindFrontRaw,3,636,293,324)

*GSSelected_15WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_15WindFrontRaw,0,378,368,339)

*GSSelected_16WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSelected_16WindFrontRaw,0,339,348,310)
createRawDataForArray(*GSSelected_16WindFrontRaw,1,335,397,304)
createRawDataForArray(*GSSelected_16WindFrontRaw,2,590,403,355)
createRawDataForArray(*GSSelected_16WindFrontRaw,3,629,409,352)

*GSSelected_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_2WindBackRaw,0,529,345,348)

*GSSelected_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSelected_3WindBackRaw,0,583,328,336)
createRawDataForArray(*GSSelected_3WindBackRaw,1,622,334,324)

*GSSelected_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_5WindBackRaw,0,509,296,284)

*GSSelected_6WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSelected_6WindBackRaw,0,523,272,161)
createRawDataForArray(*GSSelected_6WindBackRaw,1,589,259,155)
createRawDataForArray(*GSSelected_6WindBackRaw,2,634,255,135)
createRawDataForArray(*GSSelected_6WindBackRaw,3,734,341,127)

*GSSelected_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_7WindBackRaw,0,512,405,281)

*GSSelected_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_8WindBackRaw,0,508,391,299)

*GSSelected_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSelected_9WindBackRaw,0,471,384,343)

*GSSelected_12WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSSelected_12WindBackRaw,0,487,414,353)
createRawDataForArray(*GSSelected_12WindBackRaw,1,517,407,332)

;----HKIdle1
*HKIdle1Raw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*HKIdle1Raw,0,306,288,377)
createRawDataForArray(*HKIdle1Raw,1,314,295,374)
createRawDataForArray(*HKIdle1Raw,2,316,306,373)
createRawDataForArray(*HKIdle1Raw,3,316,298,373)
createRawDataForArray(*HKIdle1Raw,4,310,294,380)
createRawDataForArray(*HKIdle1Raw,5,299,295,343)
createRawDataForArray(*HKIdle1Raw,6,292,301,360)
createRawDataForArray(*HKIdle1Raw,7,330,281,386)
createRawDataForArray(*HKIdle1Raw,8,323,270,379)
createRawDataForArray(*HKIdle1Raw,9,313,288,387)
createRawDataForArray(*HKIdle1Raw,10,316,289,376)
createRawDataForArray(*HKIdle1Raw,11,293,297,370)
createRawDataForArray(*HKIdle1Raw,12,302,280,378)

*HKIdle1_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKIdle1_8WindFrontRaw,0,284,273,448)
createRawDataForArray(*HKIdle1_8WindFrontRaw,1,318,268,473)
createRawDataForArray(*HKIdle1_8WindFrontRaw,2,368,263,519)

*HKIdle1_12WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKIdle1_12WindFrontRaw,0,287,283,439)
createRawDataForArray(*HKIdle1_12WindFrontRaw,1,281,313,429)

*HKIdle1_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKIdle1_8WindBackRaw,0,292,431,594)

;----HKIdle2
*HKIdle2Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKIdle2Raw,0,345,277,363)
createRawDataForArray(*HKIdle2Raw,1,371,319,354)
createRawDataForArray(*HKIdle2Raw,2,382,314,349)
createRawDataForArray(*HKIdle2Raw,3,359,300,366)
createRawDataForArray(*HKIdle2Raw,4,340,291,366)
createRawDataForArray(*HKIdle2Raw,5,338,266,352)
createRawDataForArray(*HKIdle2Raw,6,337,282,347)
createRawDataForArray(*HKIdle2Raw,7,352,291,351)
createRawDataForArray(*HKIdle2Raw,8,333,279,357)

;----HKMoveFront
*HKMoveFrontRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKMoveFrontRaw,0,374,280,360)
createRawDataForArray(*HKMoveFrontRaw,1,365,300,356)
createRawDataForArray(*HKMoveFrontRaw,2,364,304,369)
createRawDataForArray(*HKMoveFrontRaw,3,334,298,381)
createRawDataForArray(*HKMoveFrontRaw,4,350,319,372)
createRawDataForArray(*HKMoveFrontRaw,5,376,313,358)
createRawDataForArray(*HKMoveFrontRaw,6,374,291,360)
createRawDataForArray(*HKMoveFrontRaw,7,339,306,361)
createRawDataForArray(*HKMoveFrontRaw,8,352,315,352)

;----HKMoveBack
*HKMoveBackRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKMoveBackRaw,0,386,281,369)
createRawDataForArray(*HKMoveBackRaw,1,400,289,371)
createRawDataForArray(*HKMoveBackRaw,2,425,304,375)
createRawDataForArray(*HKMoveBackRaw,3,432,315,359)
createRawDataForArray(*HKMoveBackRaw,4,409,318,339)
createRawDataForArray(*HKMoveBackRaw,5,345,309,360)
createRawDataForArray(*HKMoveBackRaw,6,373,337,345)
createRawDataForArray(*HKMoveBackRaw,7,396,328,369)
createRawDataForArray(*HKMoveBackRaw,8,412,336,360)

;----HKNeutral1
*HKNeutral1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral1Raw,0,440,301,358)
createRawDataForArray(*HKNeutral1Raw,1,346,327,349,345,520,503)
createRawDataForArray(*HKNeutral1Raw,2,278,355,349,276,497,594)
createRawDataForArray(*HKNeutral1Raw,3,330,322,343)

*HKNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKNeutral1_1WindFrontRaw,0,311,293,437)
createRawDataForArray(*HKNeutral1_1WindFrontRaw,1,408,297,441)

*HKNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral1_2WindFrontRaw,0,329,335,449)

*HKNeutral1_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKNeutral1_3WindFrontRaw,0,267,416,454)
createRawDataForArray(*HKNeutral1_3WindFrontRaw,1,240,465,666)

*HKNeutral1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral1_2WindBackRaw,0,377,454,459)

*HKNeutral1_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral1_3WindBackRaw,0,328,403,499)
createRawDataForArray(*HKNeutral1_3WindBackRaw,1,299,411,567)
createRawDataForArray(*HKNeutral1_3WindBackRaw,2,271,430,667)

;----HKNeutral2
*HKNeutral2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral2Raw,0,333,345,362)
createRawDataForArray(*HKNeutral2Raw,1,347,425,359,349,359,499)
createRawDataForArray(*HKNeutral2Raw,2,310,351,363,308,469,658)
createRawDataForArray(*HKNeutral2Raw,3,331,326,351,308,460,643)

*HKNeutral2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral2_1WindFrontRaw,0,292,326,466)

*HKNeutral2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral2_2WindFrontRaw,0,331,344,458)

*HKNeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral2_3WindFrontRaw,0,279,337,373)

*HKNeutral2_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral2_4WindFrontRaw,0,252,326,364)
createRawDataForArray(*HKNeutral2_4WindFrontRaw,1,241,335,374)
createRawDataForArray(*HKNeutral2_4WindFrontRaw,2,239,494,716)

*HKNeutral2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral2_2WindBackRaw,0,344,501,589)

*HKNeutral2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral2_3WindBackRaw,0,336,341,454)

*HKNeutral2_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral2_4WindBackRaw,0,327,463,646)
createRawDataForArray(*HKNeutral2_4WindBackRaw,1,317,445,625)
createRawDataForArray(*HKNeutral2_4WindBackRaw,2,345,453,633)

;----HKNeutral3
*HKNeutral3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral3Raw,0,357,386,349)
createRawDataForArray(*HKNeutral3Raw,1,347,378,343)
createRawDataForArray(*HKNeutral3Raw,2,304,375,342,304,408,591)

*HKNeutral3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral3_1WindFrontRaw,0,313,406,359)

*HKNeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral3_2WindFrontRaw,0,323,377,341)

*HKNeutral3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral3_3WindFrontRaw,0,324,382,238)
createRawDataForArray(*HKNeutral3_3WindFrontRaw,1,372,376,349)
createRawDataForArray(*HKNeutral3_3WindFrontRaw,2,566,366,371)

*HKNeutral3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral3_1WindBackRaw,0,396,329,439)

*HKNeutral3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral3_2WindBackRaw,0,370,341,453)

*HKNeutral3_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral3_3WindBackRaw,0,297,350,434)
createRawDataForArray(*HKNeutral3_3WindBackRaw,1,269,352,442)
createRawDataForArray(*HKNeutral3_3WindBackRaw,2,257,385,600)

;----HKNeutral4
*HKNeutral4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral4Raw,0,207,429,373,212,464,384)
createRawDataForArray(*HKNeutral4Raw,1,330,260,373,189,253,576)
createRawDataForArray(*HKNeutral4Raw,2,388,299,325,396,256,325)
createRawDataForArray(*HKNeutral4Raw,3,383,241,363)

*HKNeutral4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral4_1WindFrontRaw,0,168,431,337)

*HKNeutral4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral4_2WindFrontRaw,0,68,220,499)

*HKNeutral4_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral4_3WindFrontRaw,0,53,155,235)
createRawDataForArray(*HKNeutral4_3WindFrontRaw,1,89,144,194)
createRawDataForArray(*HKNeutral4_3WindFrontRaw,2,86,190,190)
createRawDataForArray(*HKNeutral4_3WindFrontRaw,3,688,242,225)

;----HKNeutral5
*HKNeutral5Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKNeutral5Raw,0,388,425,315)
createRawDataForArray(*HKNeutral5Raw,1,434,425,355)
createRawDataForArray(*HKNeutral5Raw,2,349,423,385,331,406,338)
createRawDataForArray(*HKNeutral5Raw,3,441,299,380,344,282,393)
createRawDataForArray(*HKNeutral5Raw,4,430,386,276,411,300,264)

*HKNeutral5_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral5_3WindFrontRaw,0,259,380,493)

*HKNeutral5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral5_4WindFrontRaw,0,218,131,306)

*HKNeutral5_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKNeutral5_5WindFrontRaw,0,175,129,147)
createRawDataForArray(*HKNeutral5_5WindFrontRaw,1,181,179,108)
createRawDataForArray(*HKNeutral5_5WindFrontRaw,2,423,165,91)
createRawDataForArray(*HKNeutral5_5WindFrontRaw,3,498,415,101)
createRawDataForArray(*HKNeutral5_5WindFrontRaw,4,776,550,140)

*HKNeutral5_1WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral5_1WindBackRaw,0,375,432,301)
createRawDataForArray(*HKNeutral5_1WindBackRaw,1,612,436,283)
createRawDataForArray(*HKNeutral5_1WindBackRaw,2,654,474,272)

*HKNeutral5_2WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral5_2WindBackRaw,0,363,406,298)
createRawDataForArray(*HKNeutral5_2WindBackRaw,1,351,391,288)
createRawDataForArray(*HKNeutral5_2WindBackRaw,2,344,377,288)
createRawDataForArray(*HKNeutral5_2WindBackRaw,3,585,601,345)

*HKNeutral5_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral5_3WindBackRaw,0,484,418,308)

*HKNeutral5_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral5_4WindBackRaw,0,399,446,313)

*HKNeutral5_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral5_5WindBackRaw,0,350,355,309)
createRawDataForArray(*HKNeutral5_5WindBackRaw,1,342,334,339)
createRawDataForArray(*HKNeutral5_5WindBackRaw,2,349,309,333)

;----HKNeutral6
*HKNeutral6Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKNeutral6Raw,0,325,433,360)
createRawDataForArray(*HKNeutral6Raw,1,318,418,378)
createRawDataForArray(*HKNeutral6Raw,2,340,378,366)
createRawDataForArray(*HKNeutral6Raw,3,346,342,361)
createRawDataForArray(*HKNeutral6Raw,4,270,405,384,270,341,518)
createRawDataForArray(*HKNeutral6Raw,5,238,420,378,239,424,589)

*HKNeutral6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_1WindFrontRaw,0,432,441,469)

*HKNeutral6_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_2WindFrontRaw,0,423,434,470)

*HKNeutral6_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKNeutral6_3WindFrontRaw,0,407,422,445)
createRawDataForArray(*HKNeutral6_3WindFrontRaw,1,393,410,519)

*HKNeutral6_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral6_4WindFrontRaw,0,307,319,392)
createRawDataForArray(*HKNeutral6_4WindFrontRaw,1,372,286,386)
createRawDataForArray(*HKNeutral6_4WindFrontRaw,2,450,286,413)

*HKNeutral6_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_5WindFrontRaw,0,243,277,468)

*HKNeutral6_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral6_6WindFrontRaw,0,201,276,447)
createRawDataForArray(*HKNeutral6_6WindFrontRaw,1,174,299,437)
createRawDataForArray(*HKNeutral6_6WindFrontRaw,2,183,292,490)
createRawDataForArray(*HKNeutral6_6WindFrontRaw,3,203,538,620)

*HKNeutral6_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_1WindBackRaw,0,319,455,535)

*HKNeutral6_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_2WindBackRaw,0,305,392,419)

*HKNeutral6_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_3WindBackRaw,0,294,368,407)

*HKNeutral6_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_4WindBackRaw,0,368,353,540)

*HKNeutral6_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral6_5WindBackRaw,0,382,361,391)

*HKNeutral6_6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral6_6WindBackRaw,0,326,379,375)
createRawDataForArray(*HKNeutral6_6WindBackRaw,1,302,438,458)
createRawDataForArray(*HKNeutral6_6WindBackRaw,2,288,467,642)

;----HKNeutral7
*HKNeutral7Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral7Raw,0,351,414,335,284,472,621)
createRawDataForArray(*HKNeutral7Raw,1,392,371,350,392,569,572)
createRawDataForArray(*HKNeutral7Raw,2,428,369,347,429,540,513)

*HKNeutral7_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral7_1WindFrontRaw,0,403,405,408)

*HKNeutral7_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral7_2WindFrontRaw,0,384,349,355)

*HKNeutral7_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral7_3WindFrontRaw,0,361,353,441)
createRawDataForArray(*HKNeutral7_3WindFrontRaw,1,356,340,510)
createRawDataForArray(*HKNeutral7_3WindFrontRaw,2,357,340,544)

*HKNeutral7_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral7_2WindBackRaw,0,533,429,349)

*HKNeutral7_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKNeutral7_3WindBackRaw,0,508,385,309)
createRawDataForArray(*HKNeutral7_3WindBackRaw,1,498,378,308)
createRawDataForArray(*HKNeutral7_3WindBackRaw,2,513,365,341)

;----HKNeutral8
*HKNeutral8Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral8Raw,0,384,419,358)
createRawDataForArray(*HKNeutral8Raw,1,366,426,390)
createRawDataForArray(*HKNeutral8Raw,2,461,407,379,469,554,453)
createRawDataForArray(*HKNeutral8Raw,3,404,401,300,404,422,300)

*HKNeutral8_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral8_1WindFrontRaw,0,367,452,540)

*HKNeutral8_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral8_2WindFrontRaw,0,335,418,494)

*HKNeutral8_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral8_3WindFrontRaw,0,345,361,359)

*HKNeutral8_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral8_4WindFrontRaw,0,347,334,277)
createRawDataForArray(*HKNeutral8_4WindFrontRaw,1,343,322,251)
createRawDataForArray(*HKNeutral8_4WindFrontRaw,2,353,333,230)
createRawDataForArray(*HKNeutral8_4WindFrontRaw,3,647,443,225)

*HKNeutral8_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral8_1WindBackRaw,0,415,370,359)

*HKNeutral8_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral8_2WindBackRaw,0,415,388,344)

*HKNeutral8_4WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral8_4WindBackRaw,0,395,372,285)
createRawDataForArray(*HKNeutral8_4WindBackRaw,1,399,368,286)
createRawDataForArray(*HKNeutral8_4WindBackRaw,2,629,365,265)
createRawDataForArray(*HKNeutral8_4WindBackRaw,3,711,425,254)

;----HKNeutral9
*HKNeutral9Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral9Raw,0,364,395,369,364,455,303)
createRawDataForArray(*HKNeutral9Raw,1,202,390,366,201,390,561)
createRawDataForArray(*HKNeutral9Raw,2,341,276,364,173,276,563)
createRawDataForArray(*HKNeutral9Raw,3,338,271,375,303,260,522)

*HKNeutral9_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral9_1WindFrontRaw,0,341,461,292)

*HKNeutral9_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral9_2WindFrontRaw,0,145,364,286)

*HKNeutral9_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral9_3WindFrontRaw,0,122,227,336)

*HKNeutral9_4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKNeutral9_4WindFrontRaw,0,106,192,473)
createRawDataForArray(*HKNeutral9_4WindFrontRaw,1,91,170,421)
createRawDataForArray(*HKNeutral9_4WindFrontRaw,2,92,185,429)
createRawDataForArray(*HKNeutral9_4WindFrontRaw,3,91,178,420)
createRawDataForArray(*HKNeutral9_4WindFrontRaw,4,480,197,416)

;----HKNeutral10
*HKNeutral10Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*HKNeutral10Raw,0,362,414,342)
createRawDataForArray(*HKNeutral10Raw,1,348,369,359)
createRawDataForArray(*HKNeutral10Raw,2,442,385,361,482,363,383)
createRawDataForArray(*HKNeutral10Raw,3,391,422,353,391,389,514)
createRawDataForArray(*HKNeutral10Raw,4,382,418,358,380,475,532)
createRawDataForArray(*HKNeutral10Raw,5,413,393,313,400,523,506)
createRawDataForArray(*HKNeutral10Raw,6,440,370,326,443,582,454)

*HKNeutral10_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_1WindFrontRaw,0,347,409,562)

*HKNeutral10_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_2WindFrontRaw,0,331,358,341)

*HKNeutral10_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_3WindFrontRaw,0,458,331,330)

*HKNeutral10_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_4WindFrontRaw,0,352,317,320)

*HKNeutral10_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_5WindFrontRaw,0,313,324,319)

*HKNeutral10_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_6WindFrontRaw,0,297,309,320)

*HKNeutral10_7WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKNeutral10_7WindFrontRaw,0,291,307,361)
createRawDataForArray(*HKNeutral10_7WindFrontRaw,1,293,301,360)
createRawDataForArray(*HKNeutral10_7WindFrontRaw,2,294,366,315)
createRawDataForArray(*HKNeutral10_7WindFrontRaw,3,283,438,300)
createRawDataForArray(*HKNeutral10_7WindFrontRaw,4,280,519,291)

*HKNeutral10_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_3WindBackRaw,0,322,408,414)

*HKNeutral10_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_4WindBackRaw,0,319,448,389)

*HKNeutral10_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_5WindBackRaw,0,433,420,338)

*HKNeutral10_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral10_6WindBackRaw,0,425,406,278)

*HKNeutral10_7WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral10_7WindBackRaw,0,532,343,254)
createRawDataForArray(*HKNeutral10_7WindBackRaw,1,532,345,266)
createRawDataForArray(*HKNeutral10_7WindBackRaw,2,527,341,261)
createRawDataForArray(*HKNeutral10_7WindBackRaw,3,533,341,336)

;----HKNeutral11
*HKNeutral11Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKNeutral11Raw,0,421,408,344)
createRawDataForArray(*HKNeutral11Raw,1,385,382,338,385,379,490)
createRawDataForArray(*HKNeutral11Raw,2,280,427,341,278,385,540)
createRawDataForArray(*HKNeutral11Raw,3,308,431,355,297,490,576)
createRawDataForArray(*HKNeutral11Raw,4,421,416,344,319,561,514)

*HKNeutral11_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_1WindFrontRaw,0,411,580,528)

*HKNeutral11_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_2WindFrontRaw,0,369,337,381)

*HKNeutral11_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_3WindFrontRaw,0,255,305,360)

*HKNeutral11_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_4WindFrontRaw,0,244,335,347)

*HKNeutral11_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKNeutral11_5WindFrontRaw,0,236,388,353)
createRawDataForArray(*HKNeutral11_5WindFrontRaw,1,240,379,364)
createRawDataForArray(*HKNeutral11_5WindFrontRaw,2,243,456,409)
createRawDataForArray(*HKNeutral11_5WindFrontRaw,3,243,489,401)

*HKNeutral11_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_1WindBackRaw,0,458,371,361)

*HKNeutral11_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKNeutral11_2WindBackRaw,0,404,514,499)

*HKNeutral11_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKNeutral11_3WindBackRaw,0,408,509,461)
createRawDataForArray(*HKNeutral11_3WindBackRaw,1,425,500,463)

;----HKSide1
*HKSide1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKSide1Raw,0,355,282,367)
createRawDataForArray(*HKSide1Raw,1,433,330,248)
createRawDataForArray(*HKSide1Raw,2,359,200,348,565,199,253)
createRawDataForArray(*HKSide1Raw,3,196,355,328,192,175,376)
createRawDataForArray(*HKSide1Raw,4,138,435,317,135,381,701)

*HKSide1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide1_1WindFrontRaw,0,315,275,370)

*HKSide1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide1_2WindFrontRaw,0,391,262,226)
createRawDataForArray(*HKSide1_2WindFrontRaw,1,407,240,198)
createRawDataForArray(*HKSide1_2WindFrontRaw,2,708,221,184)

*HKSide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide1_3WindFrontRaw,0,341,175,238)

*HKSide1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide1_4WindFrontRaw,0,158,127,192)

*HKSide1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide1_5WindFrontRaw,0, 67,109,176)
createRawDataForArray(*HKSide1_5WindFrontRaw,1, 20,155,576)
createRawDataForArray(*HKSide1_5WindFrontRaw,2, 75,246+56,808) ; artifact fix

*HKSide1_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide1_2WindBackRaw,0,321,336,469)
createRawDataForArray(*HKSide1_2WindBackRaw,1,340,323,449)
createRawDataForArray(*HKSide1_2WindBackRaw,2,461,298,423)

;----HKSide2
*HKSide2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSide2Raw,0,293,403,352)
createRawDataForArray(*HKSide2Raw,1,321,358,354)
createRawDataForArray(*HKSide2Raw,2,221,402,362,221,387,580)
createRawDataForArray(*HKSide2Raw,3,200,422,361,199,492,699)

*HKSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide2_1WindFrontRaw,0,174,445,502)

*HKSide2_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide2_2WindFrontRaw,0,217,329,339)
createRawDataForArray(*HKSide2_2WindFrontRaw,1,296,328,330)
createRawDataForArray(*HKSide2_2WindFrontRaw,2,335,349,530)

*HKSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide2_3WindFrontRaw,0,192,357,347)

*HKSide2_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSide2_4WindFrontRaw,0,156,370,397)
createRawDataForArray(*HKSide2_4WindFrontRaw,1,112,366,517)
createRawDataForArray(*HKSide2_4WindFrontRaw,2,103,410,625)
createRawDataForArray(*HKSide2_4WindFrontRaw,3,103,497,674)

;----HKSide3
*HKSide3Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSide3Raw,0,278,344,358,278,459,665)
createRawDataForArray(*HKSide3Raw,1,219,406,369,219,493,729)

*HKSide3_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide3_1WindFrontRaw,0,262,311,338)
createRawDataForArray(*HKSide3_1WindFrontRaw,1,257,300,384)
createRawDataForArray(*HKSide3_1WindFrontRaw,2,354,302,502)

*HKSide3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide3_2WindFrontRaw,0,258,308,462)

*HKSide3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide3_4WindFrontRaw,0,255,312,330)

*HKSide3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide3_5WindFrontRaw,0,180,346,279)

*HKSide3_6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide3_6WindFrontRaw,0,163,338,321)
createRawDataForArray(*HKSide3_6WindFrontRaw,1,146,357,408)
createRawDataForArray(*HKSide3_6WindFrontRaw,2,162,447,536)

;----HKSide4
*HKSide4Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*HKSide4Raw,0,287,369,370)
createRawDataForArray(*HKSide4Raw,1,323,395,378)
createRawDataForArray(*HKSide4Raw,2,376,337,319)
createRawDataForArray(*HKSide4Raw,3,380,201,372,528,200,315)
createRawDataForArray(*HKSide4Raw,4,308,275,361,307,179,441)
createRawDataForArray(*HKSide4Raw,5,295,415,350,257,264,589)
createRawDataForArray(*HKSide4Raw,6,361,426,326,343,477,324)

*HKSide4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_1WindFrontRaw,0,198,373,483)

*HKSide4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_2WindFrontRaw,0,226,372,391)

*HKSide4_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_3WindFrontRaw,0,249,313,284)

*HKSide4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_4WindFrontRaw,0,287,139,223)

*HKSide4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_5WindFrontRaw,0,254,110,216)

*HKSide4_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_6WindFrontRaw,0,176,61,155)

*HKSide4_7WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKSide4_7WindFrontRaw,0,125,95,201)
createRawDataForArray(*HKSide4_7WindFrontRaw,1,118,94,189)
createRawDataForArray(*HKSide4_7WindFrontRaw,2,137,95,209)
createRawDataForArray(*HKSide4_7WindFrontRaw,3,156,259,191)
createRawDataForArray(*HKSide4_7WindFrontRaw,4,161,427,187)

*HKSide4_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_1WindBackRaw,0,380,364,486)

*HKSide4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_2WindBackRaw,0,291,353,481)

*HKSide4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_3WindBackRaw,0,261,341,491)

*HKSide4_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide4_4WindBackRaw,0,237,352,546)

*HKSide4_5WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSide4_5WindBackRaw,0,270,344,543)
createRawDataForArray(*HKSide4_5WindBackRaw,1,343,406,549)

;----HKSide5
*HKSide5Raw.rawdataArray=createRawDataArray(14)
createRawDataForArray(*HKSide5Raw,0,449,425,324)
createRawDataForArray(*HKSide5Raw,1,388,393,355,388,428,529)
createRawDataForArray(*HKSide5Raw,2,413,295,365,381,294,503)
createRawDataForArray(*HKSide5Raw,3,399,318,369)
createRawDataForArray(*HKSide5Raw,4,346,372,369)
createRawDataForArray(*HKSide5Raw,5,381,339,386)
createRawDataForArray(*HKSide5Raw,6,414,328,370,387,279,371)
createRawDataForArray(*HKSide5Raw,7,425,329,357,407,356,370)
createRawDataForArray(*HKSide5Raw,8,336,296,369,335,309,369)
createRawDataForArray(*HKSide5Raw,9,386,310,365,368,310,381)
createRawDataForArray(*HKSide5Raw,10,438,258,343,447,389,394)
createRawDataForArray(*HKSide5Raw,11,385,284,372,384,232,435)
createRawDataForArray(*HKSide5Raw,12,272,376,382,271,272,513)
createRawDataForArray(*HKSide5Raw,13,432,423,355,251,424,427)
createRawDataForArray(*HKSide5Raw,14,418,418,304,496,475,303)

*HKSide5_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSide5_1WindFrontRaw,0,433,417,310)
createRawDataForArray(*HKSide5_1WindFrontRaw,1,417,431,305)

*HKSide5_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_2WindFrontRaw,0,378,418,505)

*HKSide5_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide5_3WindFrontRaw,0,330,271,360)
createRawDataForArray(*HKSide5_3WindFrontRaw,1,479,353,339)
createRawDataForArray(*HKSide5_3WindFrontRaw,2,614,379,334)

*HKSide5_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_4WindFrontRaw,0,319,239,397)

*HKSide5_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSide5_5WindFrontRaw,0,310,241,323)
createRawDataForArray(*HKSide5_5WindFrontRaw,1,380,500,527)

*HKSide5_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_6WindFrontRaw,0,310,317,372)

*HKSide5_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_7WindFrontRaw,0,290,250,346)

*HKSide5_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide5_8WindFrontRaw,0,372,347,327)
createRawDataForArray(*HKSide5_8WindFrontRaw,1,530,344,323)
createRawDataForArray(*HKSide5_8WindFrontRaw,2,642,359,319)

*HKSide5_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_9WindFrontRaw,0,400,289,354)

*HKSide5_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_10WindFrontRaw,0,322,281,360)

*HKSide5_11WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_11WindFrontRaw,0,362,249,325)

*HKSide5_12WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide5_12WindFrontRaw,0,362,178,293)
createRawDataForArray(*HKSide5_12WindFrontRaw,1,497,428,281)
createRawDataForArray(*HKSide5_12WindFrontRaw,2,615,437,269)

*HKSide5_13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_13WindFrontRaw,0,229,171,229)

*HKSide5_14WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_14WindFrontRaw,0,197,157,308)

*HKSide5_15WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSide5_15WindFrontRaw,0,93,198,274)
createRawDataForArray(*HKSide5_15WindFrontRaw,1,152,196,234)
createRawDataForArray(*HKSide5_15WindFrontRaw,2,596,445,225)
createRawDataForArray(*HKSide5_15WindFrontRaw,3,673,444,217)

*HKSide5_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSide5_1WindBackRaw,0,420,555,515)
createRawDataForArray(*HKSide5_1WindBackRaw,1,424,561,529)

*HKSide5_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_2WindBackRaw,0,583,477,323)

*HKSide5_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_3WindBackRaw,0,406,412,318)

*HKSide5_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_4WindBackRaw,0,374,428,333)

*HKSide5_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_5WindBackRaw,0,321,401,353)

*HKSide5_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_6WindBackRaw,0,325,226,285)

*HKSide5_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_7WindBackRaw,0,335,221,272)

*HKSide5_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSide5_8WindBackRaw,0,295,236,294)

*HKSide5_9WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSide5_9WindBackRaw,0,320,236,281)
createRawDataForArray(*HKSide5_9WindBackRaw,1,283,232,307)
createRawDataForArray(*HKSide5_9WindBackRaw,2,275,326,328)
createRawDataForArray(*HKSide5_9WindBackRaw,3,287,359,356)

;----HKBack1
*HKBack1Raw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*HKBack1Raw, 0,340,369,353,337,311,461)
createRawDataForArray(*HKBack1Raw, 1,315,424,337,312,374,393)
createRawDataForArray(*HKBack1Raw, 2,301,310,350,301,308,419)
createRawDataForArray(*HKBack1Raw, 3,381,336,338,296,309,461)
createRawDataForArray(*HKBack1Raw, 4,334,343,371,379,374,466)
createRawDataForArray(*HKBack1Raw, 5,318,301,361,317,300,496)
createRawDataForArray(*HKBack1Raw, 6,333,367,352,337,297,465)
createRawDataForArray(*HKBack1Raw, 7,298,414,350,296,372,430)
createRawDataForArray(*HKBack1Raw, 8,385,299,361,305,299,432)
createRawDataForArray(*HKBack1Raw, 9,299,392,370,295,296,471)
createRawDataForArray(*HKBack1Raw,10,390,426,350,318,412,572)
createRawDataForArray(*HKBack1Raw,11,419,426,337,409,500,487)

*HKBack1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKBack1_1WindFrontRaw,0,328,291,403)
createRawDataForArray(*HKBack1_1WindFrontRaw,1,536,380,371)

*HKBack1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack1_2WindFrontRaw,0,273,296,382)
createRawDataForArray(*HKBack1_2WindFrontRaw,1,239,309,343)
createRawDataForArray(*HKBack1_2WindFrontRaw,2,267,460,332)

*HKBack1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_3WindFrontRaw,0,280,284,401)

*HKBack1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_4WindFrontRaw,0,269,253,408)

*HKBack1_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_5WindFrontRaw,0,265,250,392)

*HKBack1_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_6WindFrontRaw,0,268,235,419)

*HKBack1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_7WindFrontRaw,0,265,262,400)

*HKBack1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_8WindFrontRaw,0,269,277,456)

*HKBack1_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_9WindFrontRaw,0,227,343,503)

*HKBack1_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_10WindFrontRaw,0,234,228,361)

*HKBack1_11WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_11WindFrontRaw,0,218,231,337)

*HKBack1_12WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack1_12WindFrontRaw,0,223,231,321)
createRawDataForArray(*HKBack1_12WindFrontRaw,1,226,240,508)
createRawDataForArray(*HKBack1_12WindFrontRaw,2,212,289,566)

*HKBack1_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_7WindBackRaw,0,323,503,452)

*HKBack1_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_8WindBackRaw,0,326,409,407)

*HKBack1_9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_9WindBackRaw,0,419,265,397)

*HKBack1_10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_10WindBackRaw,0,241,277,325)

*HKBack1_11WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack1_11WindBackRaw,0,206,335,358)

*HKBack1_12WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack1_12WindBackRaw,0,182,416,300)
createRawDataForArray(*HKBack1_12WindBackRaw,1,207,370,297)
createRawDataForArray(*HKBack1_12WindBackRaw,2,553,355,278)

;----HKBack2
*HKBack2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack2Raw,0,252,379,370,61 ,435,724)
createRawDataForArray(*HKBack2Raw,1,367,383,337,222,430,601)
createRawDataForArray(*HKBack2Raw,2,418,423,338,352,445,552)

*HKBack2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack2_1WindFrontRaw,0,90 ,380,352)

*HKBack2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack2_2WindFrontRaw,0,212,350,297)

*HKBack2_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack2_3WindFrontRaw,0,341,362,283)
createRawDataForArray(*HKBack2_3WindFrontRaw,1,596,368,246)
createRawDataForArray(*HKBack2_3WindFrontRaw,2,727,416,225)

;----HKBack3
*HKBack3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKBack3Raw,0,308,389,384,311,508,513)
createRawDataForArray(*HKBack3Raw,1,255,384,366,256,512,636)
createRawDataForArray(*HKBack3Raw,2,345,342,355,219,376,396)
createRawDataForArray(*HKBack3Raw,3,424,385,325,325,385,324)
createRawDataForArray(*HKBack3Raw,4,460,386,289,416,417,288)
createRawDataForArray(*HKBack3Raw,5,451,344,364,474,470,411)

*HKBack3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_1WindFrontRaw,0,296,377,489)

*HKBack3_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKBack3_2WindFrontRaw,0,236,354,441)
createRawDataForArray(*HKBack3_2WindFrontRaw,1,228,359,522)
createRawDataForArray(*HKBack3_2WindFrontRaw,2,225,406,668)

*HKBack3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_3WindFrontRaw,0,219,330,341)

*HKBack3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_4WindFrontRaw,0,206,329,332)

*HKBack3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_5WindFrontRaw,0,196,339,258)

*HKBack3_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKBack3_6WindFrontRaw,0,533,317,270)
createRawDataForArray(*HKBack3_6WindFrontRaw,1,657,339,246)
createRawDataForArray(*HKBack3_6WindFrontRaw,2,722,387,240)
createRawDataForArray(*HKBack3_6WindFrontRaw,3,744,420,240)

*HKBack3_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_3WindBackRaw,0,453,357,382)

*HKBack3_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_4WindBackRaw,0,408,359,299)

*HKBack3_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKBack3_5WindBackRaw,0,367,379,276)

*HKBack3_6WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKBack3_6WindBackRaw,0,288,334,281)
createRawDataForArray(*HKBack3_6WindBackRaw,1,449,319,277)
createRawDataForArray(*HKBack3_6WindBackRaw,2,601,311,256)
createRawDataForArray(*HKBack3_6WindBackRaw,3,654,362,252)

;----HKUp1
*HKUp1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKUp1Raw,0,351,259,348)
createRawDataForArray(*HKUp1Raw,1,407,307,293)
createRawDataForArray(*HKUp1Raw,2,385,199,363,466,182,297)
createRawDataForArray(*HKUp1Raw,3,316,260,369,316,198,486)

*HKUp1_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKUp1_1WindFrontRaw,0,326,239,372)
createRawDataForArray(*HKUp1_1WindFrontRaw,1,335,378,533)

*HKUp1_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKUp1_2WindFrontRaw,0,291,241,256)
createRawDataForArray(*HKUp1_2WindFrontRaw,1,272,228,215)
createRawDataForArray(*HKUp1_2WindFrontRaw,2,647,238,193)

*HKUp1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp1_3WindFrontRaw,0,434,155,279)

*HKUp1_4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKUp1_4WindFrontRaw,0,284,118,272)
createRawDataForArray(*HKUp1_4WindFrontRaw,1,241,121,285)
createRawDataForArray(*HKUp1_4WindFrontRaw,2,227,116,469)

;----HKUp2
*HKUp2Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*HKUp2Raw,0,250,378,366)
createRawDataForArray(*HKUp2Raw,1,386,196,356)
createRawDataForArray(*HKUp2Raw,2,405,257,354)
createRawDataForArray(*HKUp2Raw,3,376,390,363)
createRawDataForArray(*HKUp2Raw,4,295,369,366,298,412,315)
createRawDataForArray(*HKUp2Raw,5,218,371,378,204,418,627)
createRawDataForArray(*HKUp2Raw,6,382,222,367,211,216,564)

*HKUp2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_1WindFrontRaw,0,239,357,595)

*HKUp2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_2WindFrontRaw,0,217,179,513)

*HKUp2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_3WindFrontRaw,0,209,119,321)

*HKUp2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_4WindFrontRaw,0,206,90,248)

*HKUp2_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_5WindFrontRaw,0,230,113,170)

*HKUp2_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_6WindFrontRaw,0,85,112,125)

*HKUp2_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKUp2_7WindFrontRaw,0,90,114,155)
createRawDataForArray(*HKUp2_7WindFrontRaw,1,51,74,252)
createRawDataForArray(*HKUp2_7WindFrontRaw,2,63,56,372)
createRawDataForArray(*HKUp2_7WindFrontRaw,3,68,71,361)

*HKUp2_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_5WindBackRaw,0,368,361,581)

*HKUp2_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp2_6WindBackRaw,0,373,322,439)

*HKUp2_7WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKUp2_7WindBackRaw,0,414,338,408)
createRawDataForArray(*HKUp2_7WindBackRaw,1,486,358,423)

;----HKUp3
*HKUp3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKUp3Raw,0,307,428,357,306,536,405)
createRawDataForArray(*HKUp3Raw,1,282,444,377,273,472,407)
createRawDataForArray(*HKUp3Raw,2,226,368,366,214,334,482)
createRawDataForArray(*HKUp3Raw,3,447,165,314,243,143,313)
createRawDataForArray(*HKUp3Raw,4,398,279,308)
createRawDataForArray(*HKUp3Raw,5,322,275,377)

*HKUp3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_1WindFrontRaw,0,285,497,317)

*HKUp3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_2WindFrontRaw,0,218,445,405)

*HKUp3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_3WindFrontRaw,0,186,313,368)

*HKUp3_4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKUp3_4WindFrontRaw,0,165,92,328)
createRawDataForArray(*HKUp3_4WindFrontRaw,1,140,69,258)
createRawDataForArray(*HKUp3_4WindFrontRaw,2,178,77,197)
createRawDataForArray(*HKUp3_4WindFrontRaw,3,174,58,182)
createRawDataForArray(*HKUp3_4WindFrontRaw,4,485,57,224)

*HKUp3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_1WindBackRaw,0,339,367,349)

*HKUp3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_2WindBackRaw,0,314,419,317)

*HKUp3_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKUp3_3WindBackRaw,0,255,350,311)

*HKUp3_4WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKUp3_4WindBackRaw,0,228,190,281)
createRawDataForArray(*HKUp3_4WindBackRaw,1,221,183,245)
createRawDataForArray(*HKUp3_4WindBackRaw,2,241,207,228)
createRawDataForArray(*HKUp3_4WindBackRaw,3,681,385,253)

;----HKDown1
*HKDown1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKDown1Raw,0,388,303,331)
createRawDataForArray(*HKDown1Raw,1,353,354,367,498,322,290)
createRawDataForArray(*HKDown1Raw,2,378,361,353,408,446,394)
createRawDataForArray(*HKDown1Raw,3,208,397,351,208,504,495)
createRawDataForArray(*HKDown1Raw,4,274,309,349,241,308,627)

*HKDown1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_1WindFrontRaw,0,324,285,318)

*HKDown1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_2WindFrontRaw,0,511,283,294)

*HKDown1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_3WindFrontRaw,0,377,278,246)

*HKDown1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_4WindFrontRaw,0,172,320,215)

*HKDown1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown1_5WindFrontRaw,0,179,262,197)
createRawDataForArray(*HKDown1_5WindFrontRaw,1,145,231,197)
createRawDataForArray(*HKDown1_5WindFrontRaw,2,159,218,568)

*HKDown1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_4WindBackRaw,0,426,371,517)

*HKDown1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown1_5WindBackRaw,0,498,368,467)

;----HKDown2
*HKDown2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKDown2Raw,0,345,333,351)
createRawDataForArray(*HKDown2Raw,1,333,348,362)
createRawDataForArray(*HKDown2Raw,2,418,296,324)
createRawDataForArray(*HKDown2Raw,3,338,398,348,333,253,308)
createRawDataForArray(*HKDown2Raw,4,335,434,346,327,418,542)

*HKDown2_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKDown2_1WindFrontRaw,0,289,320,466)
createRawDataForArray(*HKDown2_1WindFrontRaw,1,283,307,448)

*HKDown2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown2_2WindFrontRaw,0,317,329,354)

*HKDown2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown2_3WindFrontRaw,0,314,274,305)

*HKDown2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown2_4WindFrontRaw,0,308,257,265)

*HKDown2_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown2_5WindFrontRaw,0,196,252,241)
createRawDataForArray(*HKDown2_5WindFrontRaw,1,146,271,532)
createRawDataForArray(*HKDown2_5WindFrontRaw,2,134,281,563)

*HKDown2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown2_4WindBackRaw,0,358,345,436)

;----HKDown3
*HKDown3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown3Raw,0,326,321,351,288,231,603)
createRawDataForArray(*HKDown3Raw,1,307,439,330,224,344,631)
createRawDataForArray(*HKDown3Raw,2,335,397,341,304,446,599)

*HKDown3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown3_1WindFrontRaw,0,291,236,517)

*HKDown3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown3_2WindFrontRaw,0,195,233,498)

*HKDown3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown3_3WindFrontRaw,0,157,236,556)
createRawDataForArray(*HKDown3_3WindFrontRaw,1,197,384,536)
createRawDataForArray(*HKDown3_3WindFrontRaw,2,170,471,682)

;----HKDown4
*HKDown4Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*HKDown4Raw,0,364,236,357)
createRawDataForArray(*HKDown4Raw,1,375,296,355)
createRawDataForArray(*HKDown4Raw,2,390,364,353)
createRawDataForArray(*HKDown4Raw,3,417,364,372,480,470,350)
createRawDataForArray(*HKDown4Raw,4,335,339,368,333,522,499)
createRawDataForArray(*HKDown4Raw,5,343,373,341,316,392,542)
createRawDataForArray(*HKDown4Raw,6,453,244,308,342,237,450)
createRawDataForArray(*HKDown4Raw,7,431,256,334)

*HKDown4_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_1WindFrontRaw,0,264,221,515)

*HKDown4_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_2WindFrontRaw,0,265,205,432)

*HKDown4_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_3WindFrontRaw,0,266,192,321)

*HKDown4_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_4WindFrontRaw,0,308,324,484)

*HKDown4_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_5WindFrontRaw,0,294,259,338)

*HKDown4_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_6WindFrontRaw,0,316,221,284)

*HKDown4_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown4_7WindFrontRaw,0,313,224,255)
createRawDataForArray(*HKDown4_7WindFrontRaw,1,664,270,239)
createRawDataForArray(*HKDown4_7WindFrontRaw,2,716,399,235)

*HKDown4_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_2WindBackRaw,0,363,468,421)

*HKDown4_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_3WindBackRaw,0,318,397,413)

*HKDown4_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_4WindBackRaw,0,262,202,243)

*HKDown4_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_5WindBackRaw,0,283,204,235)

*HKDown4_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown4_6WindBackRaw,0,275,350,245)

*HKDown4_7WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKDown4_7WindBackRaw,0,240,173,224)
createRawDataForArray(*HKDown4_7WindBackRaw,1,214,148,346)
createRawDataForArray(*HKDown4_7WindBackRaw,2,229,136,328)
createRawDataForArray(*HKDown4_7WindBackRaw,3,208,132,312)
createRawDataForArray(*HKDown4_7WindBackRaw,4,450,116,339)

;----HKDown5
*HKDown5Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKDown5Raw,0,435,289,320)
createRawDataForArray(*HKDown5Raw,1,368,376,390,369,282,351)
createRawDataForArray(*HKDown5Raw,2,396,425,352,365,409,498)
createRawDataForArray(*HKDown5Raw,3,426,391,347,425,572,400)

*HKDown5_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown5_1WindFrontRaw,0,415,261,239)

*HKDown5_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown5_2WindFrontRaw,0,337,207,231)

*HKDown5_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown5_3WindFrontRaw,0,347,356,376)

*HKDown5_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKDown5_4WindFrontRaw,0,361,369,433)
createRawDataForArray(*HKDown5_4WindFrontRaw,1,345,530,458)

*HKDown5_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown5_3WindBackRaw,0,305,200,237)

*HKDown5_4WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKDown5_4WindBackRaw,0,273,197,266)
createRawDataForArray(*HKDown5_4WindBackRaw,1,260,194,272)
createRawDataForArray(*HKDown5_4WindBackRaw,2,300,308,244)
createRawDataForArray(*HKDown5_4WindBackRaw,3,289,416,251)
createRawDataForArray(*HKDown5_4WindBackRaw,4,651,556,242)

;----HKDown6
*HKDown6Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKDown6Raw,0,321,305,377)
createRawDataForArray(*HKDown6Raw,1,336,407,378)
createRawDataForArray(*HKDown6Raw,2,348,353,360)
createRawDataForArray(*HKDown6Raw,3,350,204,382)
createRawDataForArray(*HKDown6Raw,4,196,312,390,194,143,469)
createRawDataForArray(*HKDown6Raw,5,194,434,370,175,347,619)
createRawDataForArray(*HKDown6Raw,6,236,449,355)
createRawDataForArray(*HKDown6Raw,7,291,455,364)
createRawDataForArray(*HKDown6Raw,8,323,301,374)

*HKDown6_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_1WindFrontRaw,0,383,284,357)

*HKDown6_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown6_2WindFrontRaw,0,297,318,353)
createRawDataForArray(*HKDown6_2WindFrontRaw,1,285,290,455)
createRawDataForArray(*HKDown6_2WindFrontRaw,2,257,285,607)

*HKDown6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_3WindFrontRaw,0,299,303,226)

*HKDown6_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_4WindFrontRaw,0,279,135,143)

*HKDown6_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_5WindFrontRaw,0,123,69,211)

*HKDown6_6WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKDown6_6WindFrontRaw,0,48,77,177)
createRawDataForArray(*HKDown6_6WindFrontRaw,1,42,69,175)
createRawDataForArray(*HKDown6_6WindFrontRaw,2,61,54,333)
createRawDataForArray(*HKDown6_6WindFrontRaw,3,75,60,348)
createRawDataForArray(*HKDown6_6WindFrontRaw,4,128,602,580)

*HKDown6_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_8WindFrontRaw,0,217,476,585)

*HKDown6_9WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDown6_9WindFrontRaw,0,190,265,512)
createRawDataForArray(*HKDown6_9WindFrontRaw,1,183,235,407)
createRawDataForArray(*HKDown6_9WindFrontRaw,2,288,243,396)

*HKDown6_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDown6_1WindBackRaw,0,413,294,325)

*HKDown6_2WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKDown6_2WindBackRaw,0,343,285,332)
createRawDataForArray(*HKDown6_2WindBackRaw,1,290,297,323)
createRawDataForArray(*HKDown6_2WindBackRaw,2,282,311,386)
createRawDataForArray(*HKDown6_2WindBackRaw,3,279,439,645)

;----HKHeavy1
*HKHeavy1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKHeavy1Raw,0,384,306,358)
createRawDataForArray(*HKHeavy1Raw,1,329,416,345)
createRawDataForArray(*HKHeavy1Raw,2,404,427,331)
createRawDataForArray(*HKHeavy1Raw,3,305,425,356,303,467,492)
createRawDataForArray(*HKHeavy1Raw,4,256,432,346,255,456,623)
createRawDataForArray(*HKHeavy1Raw,5,284,432,341)

*HKHeavy1_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKHeavy1_1WindBackRaw,0,378,507,482)
createRawDataForArray(*HKHeavy1_1WindBackRaw,1,361,501,565)

*HKHeavy1_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKHeavy1_3WindBackRaw,0,310,464,309)
createRawDataForArray(*HKHeavy1_3WindBackRaw,1,398,441,275)
createRawDataForArray(*HKHeavy1_3WindBackRaw,2,567,438,268)

*HKHeavy1_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy1_4WindBackRaw,0,282,443,468)

*HKHeavy1_5WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKHeavy1_5WindBackRaw,0,220,407,446)
createRawDataForArray(*HKHeavy1_5WindBackRaw,1,188,371,598)
createRawDataForArray(*HKHeavy1_5WindBackRaw,2,164,378,671)
createRawDataForArray(*HKHeavy1_5WindBackRaw,3,176,409,725)

*HKHeavy1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy1_1WindFrontRaw,0,306,258,409)

*HKHeavy1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy1_2WindFrontRaw,0,280,264,419)

*HKHeavy1_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKHeavy1_3WindFrontRaw,0,242,272,559)
createRawDataForArray(*HKHeavy1_3WindFrontRaw,1,229,362,561)

*HKHeavy1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy1_4WindFrontRaw,0,291,411,381)

*HKHeavy1_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKHeavy1_5WindFrontRaw,0,236,406,534)
createRawDataForArray(*HKHeavy1_5WindFrontRaw,1,213,403,620)

;----HKHeavy2
*HKHeavy2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKHeavy2Raw,0,292,380,346)
createRawDataForArray(*HKHeavy2Raw,1,423,274,359)
createRawDataForArray(*HKHeavy2Raw,2,463,383,210)
createRawDataForArray(*HKHeavy2Raw,3,417,260,370,416,259,197)
createRawDataForArray(*HKHeavy2Raw,4,366,422,345,311,297,465)
createRawDataForArray(*HKHeavy2Raw,5,328,424,342)

*HKHeavy2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy2_1WindFrontRaw,0,263,359,386)

*HKHeavy2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy2_2WindFrontRaw,0,242,197,321)

*HKHeavy2_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKHeavy2_3WindFrontRaw,0,244,181,121)
createRawDataForArray(*HKHeavy2_3WindFrontRaw,1,254,220, 95)
createRawDataForArray(*HKHeavy2_3WindFrontRaw,2,665,230,120)
createRawDataForArray(*HKHeavy2_3WindFrontRaw,3,686,480, 92)

*HKHeavy2_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy2_4WindFrontRaw,0,387,176,176)

*HKHeavy2_5WindFront1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKHeavy2_5WindFront1Raw,0,223,175,109)
createRawDataForArray(*HKHeavy2_5WindFront1Raw,1,182,238,315)
createRawDataForArray(*HKHeavy2_5WindFront1Raw,2,192,285,428)
createRawDataForArray(*HKHeavy2_5WindFront1Raw,3,178,402,399)

*HKHeavy2_5WindFront2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKHeavy2_5WindFront2Raw,0,329,654,575)
createRawDataForArray(*HKHeavy2_5WindFront2Raw,1,277,602,545)
createRawDataForArray(*HKHeavy2_5WindFront2Raw,2,173,548,516)
createRawDataForArray(*HKHeavy2_5WindFront2Raw,3,145,537,729)

;----HKHeavy3
*HKHeavy3Raw.rawdataArray=createRawDataArray(18)
createRawDataForArray(*HKHeavy3Raw,0,371,380,331)
createRawDataForArray(*HKHeavy3Raw,1,446,359,374,462,344,338)
createRawDataForArray(*HKHeavy3Raw,2,361,394,339,332,366,525)
createRawDataForArray(*HKHeavy3Raw,3,430,327,347)
createRawDataForArray(*HKHeavy3Raw,4,397,321,345,396,322,400)
createRawDataForArray(*HKHeavy3Raw,5,282,347,341,275,318,359)
createRawDataForArray(*HKHeavy3Raw,6,401,358,343)
createRawDataForArray(*HKHeavy3Raw,7,378,417,357,377,375,374)
createRawDataForArray(*HKHeavy3Raw,8,411,365,362,576,364,363)
createRawDataForArray(*HKHeavy3Raw,9,372,323,401,384,309,369)
createRawDataForArray(*HKHeavy3Raw,10,302,337,361,301,317,521)
createRawDataForArray(*HKHeavy3Raw,11,439,341,361,297,389,481)
createRawDataForArray(*HKHeavy3Raw,12,439,361,319,469,436,318)
createRawDataForArray(*HKHeavy3Raw,13,431,284,357,565,282,259)
createRawDataForArray(*HKHeavy3Raw,14,305,403,353,303,245,329)
createRawDataForArray(*HKHeavy3Raw,15,328,438,347,302,426,521)
createRawDataForArray(*HKHeavy3Raw,16,332,376,371)
createRawDataForArray(*HKHeavy3Raw,17,373,278,381)
createRawDataForArray(*HKHeavy3Raw,18,317,276,381)

*HKHeavy3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_1WindFrontRaw,0,339,236,310)

*HKHeavy3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_2WindFrontRaw,0,315,229,302)

*HKHeavy3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_3WindFrontRaw,0,294,281,291)

*HKHeavy3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_4WindFrontRaw,0,261,304,314)

*HKHeavy3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_5WindFrontRaw,0,255,285,306)

*HKHeavy3_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_6WindFrontRaw,0,203,213,288)

*HKHeavy3_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_7WindFrontRaw,0,192,216,282)

*HKHeavy3_8WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKHeavy3_8WindFrontRaw,0,171,212,341)
createRawDataForArray(*HKHeavy3_8WindFrontRaw,1,224,209,392)
createRawDataForArray(*HKHeavy3_8WindFrontRaw,2,212,313,470)
createRawDataForArray(*HKHeavy3_8WindFrontRaw,3,219,497,553)
createRawDataForArray(*HKHeavy3_8WindFrontRaw,4,218,539,635)

*HKHeavy3_11WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKHeavy3_11WindFrontRaw,0,235,239,226)
createRawDataForArray(*HKHeavy3_11WindFrontRaw,1,507,364,335)
createRawDataForArray(*HKHeavy3_11WindFrontRaw,2,633,403,335)

*HKHeavy3_12WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_12WindFrontRaw,0,223,281,294)

*HKHeavy3_13WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_13WindFrontRaw,0,185,269,242)

*HKHeavy3_14WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_14WindFrontRaw,0,258,247,145)

*HKHeavy3_15WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_15WindFrontRaw,0,270,155,133)

*HKHeavy3_16WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKHeavy3_16WindFrontRaw,0,179,172,118)
createRawDataForArray(*HKHeavy3_16WindFrontRaw,1,137,174,108)
createRawDataForArray(*HKHeavy3_16WindFrontRaw,2,132,158,374)
createRawDataForArray(*HKHeavy3_16WindFrontRaw,3,166,151,433)
createRawDataForArray(*HKHeavy3_16WindFrontRaw,4,162,162,437)

*HKHeavy3_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_3WindBackRaw,0,238,261,338)

*HKHeavy3_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_4WindBackRaw,0,254,260,290)

*HKHeavy3_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_5WindBackRaw,0,248,243,262)

*HKHeavy3_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_6WindBackRaw,0,217,282,215)

*HKHeavy3_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_7WindBackRaw,0,243,303,250)

*HKHeavy3_8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_8WindBackRaw,0,214,237,255)

*HKHeavy3_9WindBackRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKHeavy3_9WindBackRaw,0,274,284,250)
createRawDataForArray(*HKHeavy3_9WindBackRaw,1,252,262,278)
createRawDataForArray(*HKHeavy3_9WindBackRaw,2,261,259,307)
createRawDataForArray(*HKHeavy3_9WindBackRaw,3,285,387,466)
createRawDataForArray(*HKHeavy3_9WindBackRaw,4,278,532,514)

*HKHeavy3_10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_10WindBackRaw,0,352,250,315)

*HKHeavy3_13WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_13WindBackRaw,0,428,337,492)

*HKHeavy3_14WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_14WindBackRaw,0,390,343,464)

*HKHeavy3_15WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKHeavy3_15WindBackRaw,0,429,356,387)

*HKHeavy3_16WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKHeavy3_16WindBackRaw,0,446,379,302)
createRawDataForArray(*HKHeavy3_16WindBackRaw,1,447,507,292)
createRawDataForArray(*HKHeavy3_16WindBackRaw,2,552,482,281)

;----HKShockwave1
*HKShockwave1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKShockwave1Raw,0,265,576,637,268,579,638)
createRawDataForArray(*HKShockwave1Raw,1,205,569,624,241,588,626)
createRawDataForArray(*HKShockwave1Raw,2,167,534,605,165,528,607)
createRawDataForArray(*HKShockwave1Raw,3,206,551,584)

;----HKJump
*HKJumpRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKJumpRaw,0,368,383,319)
createRawDataForArray(*HKJumpRaw,1,376,445,336)
createRawDataForArray(*HKJumpRaw,2,378,319,351)
createRawDataForArray(*HKJumpRaw,3,431,278,360)
createRawDataForArray(*HKJumpRaw,4,356,286,355)
createRawDataForArray(*HKJumpRaw,5,340,312,343)

;----HKLand
*HKLandRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKLandRaw,0,390,337,348)
createRawDataForArray(*HKLandRaw,1,390,390,340)
createRawDataForArray(*HKLandRaw,2,233,432,343)
createRawDataForArray(*HKLandRaw,3,341,287,349)

;----HKHit
*HKHitRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*HKHitRaw,0,471,277,306)
createRawDataForArray(*HKHitRaw,1,430,366,331)
createRawDataForArray(*HKHitRaw,2,423,362,304)
createRawDataForArray(*HKHitRaw,3,366,357,365)
createRawDataForArray(*HKHitRaw,4,257,452,368)

;----HKSpawn
*HKSpawnRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKSpawnRaw,0,346,440,394)
createRawDataForArray(*HKSpawnRaw,1,358,431,398)
createRawDataForArray(*HKSpawnRaw,2,263,400,381)
createRawDataForArray(*HKSpawnRaw,3,322,380,390)
createRawDataForArray(*HKSpawnRaw,4,276,366,374)
createRawDataForArray(*HKSpawnRaw,5,362,302,333)
createRawDataForArray(*HKSpawnRaw,6,344,293,352)
createRawDataForArray(*HKSpawnRaw,7,397,254,340)
createRawDataForArray(*HKSpawnRaw,8,355,272,357)

*HKSpawn4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSpawn4WindFrontRaw,0,265,360,407)
createRawDataForArray(*HKSpawn4WindFrontRaw,1,291,341,648)

*HKSpawn5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSpawn5WindFrontRaw,0,293,331,356)

*HKSpawn6WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSpawn6WindFrontRaw,0,293,252,246)
createRawDataForArray(*HKSpawn6WindFrontRaw,1,535,234,233)
createRawDataForArray(*HKSpawn6WindFrontRaw,2,560,207,234)

*HKSpawn3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSpawn3WindBackRaw,0,253,391,464)
createRawDataForArray(*HKSpawn3WindBackRaw,1,230,371,536)
createRawDataForArray(*HKSpawn3WindBackRaw,2,192,434,732)

*HKSpawn5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSpawn5WindBackRaw,0,256,386,595)

*HKSpawn6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSpawn6WindBackRaw,0,238,337,528)
createRawDataForArray(*HKSpawn6WindBackRaw,1,222,320,524)
createRawDataForArray(*HKSpawn6WindBackRaw,2,230,309,564)

;----HKDeath
*HKDeathRaw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*HKDeathRaw,0,337,278,371)
createRawDataForArray(*HKDeathRaw,1,333,368,420)
createRawDataForArray(*HKDeathRaw,2,240,349,494)
createRawDataForArray(*HKDeathRaw,3, 79,390,561)
createRawDataForArray(*HKDeathRaw,4,104,399,577)
createRawDataForArray(*HKDeathRaw,5, 83,443,488)
createRawDataForArray(*HKDeathRaw,6,114,429,461)
createRawDataForArray(*HKDeathRaw,7, 79,498,394)

*HKDeath2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDeath2WindFrontRaw,0,305,615,613)
createRawDataForArray(*HKDeath2WindFrontRaw,1,287,595,590)
createRawDataForArray(*HKDeath2WindFrontRaw,2,278,583,579)

*HKDeath3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDeath3WindFrontRaw,0,226,329,571)

*HKDeath4WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDeath4WindFrontRaw,0, 50,292,590)
createRawDataForArray(*HKDeath4WindFrontRaw,1, 41,282,708)
createRawDataForArray(*HKDeath4WindFrontRaw,2, 24,342,792)

*HKDeath6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDeath6WindFrontRaw,0, 75,403,739)

*HKDeath7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKDeath7WindFrontRaw,0,105,409,440)

*HKDeath8WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKDeath8WindFrontRaw,0, 41,370,357)
createRawDataForArray(*HKDeath8WindFrontRaw,1, 42,505,331)
createRawDataForArray(*HKDeath8WindFrontRaw,2, 17,487,275)
createRawDataForArray(*HKDeath8WindFrontRaw,3,  5,474,246)

*HKDeath8WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKDeath8WindBackRaw,0,127,473,343)
createRawDataForArray(*HKDeath8WindBackRaw,1, 88,435,334)
createRawDataForArray(*HKDeath8WindBackRaw,2, 75,472,328)

;----HKDodge
*HKDodgeRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKDodgeRaw,0,443,246,371)
createRawDataForArray(*HKDodgeRaw,1,482,322,273)

;----HKParry
*HKParryRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*HKParryRaw,0,359,381,383)
createRawDataForArray(*HKParryRaw,1,377,324,374)
createRawDataForArray(*HKParryRaw,2,354,345,385)
createRawDataForArray(*HKParryRaw,3,393,338,384)
createRawDataForArray(*HKParryRaw,4,391,385,334)
createRawDataForArray(*HKParryRaw,5,405,387,320)

;----HKSelection
*HKSelectionRaw.rawdataArray=createRawDataArray(13)
createRawDataForArray(*HKSelectionRaw,0,375,411,336)
createRawDataForArray(*HKSelectionRaw,1,359,403,344)
createRawDataForArray(*HKSelectionRaw,2,343,356,357)
createRawDataForArray(*HKSelectionRaw,3,401,297,386)
createRawDataForArray(*HKSelectionRaw,4,370,284,376)
createRawDataForArray(*HKSelectionRaw,5,362,286,379)
createRawDataForArray(*HKSelectionRaw,6,320,282,377)
createRawDataForArray(*HKSelectionRaw,7,319,273,370)
createRawDataForArray(*HKSelectionRaw,8,321,310,367)
createRawDataForArray(*HKSelectionRaw,9,328,306,375)
createRawDataForArray(*HKSelectionRaw,10,337,306,366)
createRawDataForArray(*HKSelectionRaw,11,331,308,365)
createRawDataForArray(*HKSelectionRaw,12,328,306,362)
createRawDataForArray(*HKSelectionRaw,13,323,301,371)

*HKSelection_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_2WindFrontRaw,0,340,445,584)

*HKSelection_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_3WindFrontRaw,0,319,357,547)

*HKSelection_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_4WindFrontRaw,0,311,275,492)

*HKSelection_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSelection_5WindFrontRaw,0,306,245,466)
createRawDataForArray(*HKSelection_5WindFrontRaw,1,391,244,459)
createRawDataForArray(*HKSelection_5WindFrontRaw,2,523,285,455)

*HKSelection_7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSelection_7WindFrontRaw,0,299,243,428)
createRawDataForArray(*HKSelection_7WindFrontRaw,1,280,257,445)
createRawDataForArray(*HKSelection_7WindFrontRaw,2,276,260,504)
createRawDataForArray(*HKSelection_7WindFrontRaw,3,274,371,498)

*HKSelection_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_2WindBackRaw,0,590,439,320)

*HKSelection_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_3WindBackRaw,0,403,348,317)

*HKSelection_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelection_4WindBackRaw,0,387,300,324)

*HKSelection_5WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSelection_5WindBackRaw,0,347,268,377)
createRawDataForArray(*HKSelection_5WindBackRaw,1,338,254,365)
createRawDataForArray(*HKSelection_5WindBackRaw,2,337,289,360)
createRawDataForArray(*HKSelection_5WindBackRaw,3,332,423,554)

;----HKSelected
*HKSelectedRaw.rawdataArray=createRawDataArray(13)
createRawDataForArray(*HKSelectedRaw,0,331,307,378)
createRawDataForArray(*HKSelectedRaw,1,362,334,381)
createRawDataForArray(*HKSelectedRaw,2,347,353,383)
createRawDataForArray(*HKSelectedRaw,3,362,340,381)
createRawDataForArray(*HKSelectedRaw,4,367,350,343)
createRawDataForArray(*HKSelectedRaw,5,363,354,352)
createRawDataForArray(*HKSelectedRaw,6,335,319,346)
createRawDataForArray(*HKSelectedRaw,7,324,301,346)
createRawDataForArray(*HKSelectedRaw,8,330,297,345)
createRawDataForArray(*HKSelectedRaw,9,330,299,342)
createRawDataForArray(*HKSelectedRaw,10,323,304,345)
createRawDataForArray(*HKSelectedRaw,11,328,316,346)
createRawDataForArray(*HKSelectedRaw,12,328,316,348)
createRawDataForArray(*HKSelectedRaw,13,317,300,355)

*HKSelected_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_2WindFrontRaw,0,384,458,495)

*HKSelected_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_3WindFrontRaw,0,338,333,450)

*HKSelected_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSelected_4WindFrontRaw,0,343,349,461)
createRawDataForArray(*HKSelected_4WindFrontRaw,1,444,409,454)

*HKSelected_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_5WindFrontRaw,0,342,369,574)

*HKSelected_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_6WindFrontRaw,0,344,344,529)

*HKSelected_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSelected_7WindFrontRaw,0,315,375,548)
createRawDataForArray(*HKSelected_7WindFrontRaw,1,302,437,539)
createRawDataForArray(*HKSelected_7WindFrontRaw,2,300,478,677)

*HKSelected_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_2WindBackRaw,0,329,307,516)

*HKSelected_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*HKSelected_3WindBackRaw,0,322,325,534)
createRawDataForArray(*HKSelected_3WindBackRaw,1,314,394,564)

*HKSelected_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_4WindBackRaw,0,394,436,489)

*HKSelected_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_5WindBackRaw,0,396,446,413)

*HKSelected_6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*HKSelected_6WindBackRaw,0,485,337,354)

*HKSelected_7WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*HKSelected_7WindBackRaw,0,439,302,354)
createRawDataForArray(*HKSelected_7WindBackRaw,1,421,298,369)
createRawDataForArray(*HKSelected_7WindBackRaw,2,419,283,381)
createRawDataForArray(*HKSelected_7WindBackRaw,3,426,277,448)

;----RUIdle1
*RUIdle1Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*RUIdle1Raw,0,219,357,193)
createRawDataForArray(*RUIdle1Raw,1,226,363,195)
createRawDataForArray(*RUIdle1Raw,2,225,366,169)
createRawDataForArray(*RUIdle1Raw,3,210,358,161)
createRawDataForArray(*RUIdle1Raw,4,190,349,153)
createRawDataForArray(*RUIdle1Raw,5,184,351,167)
createRawDataForArray(*RUIdle1Raw,6,187,347,169)
createRawDataForArray(*RUIdle1Raw,7,195,353,156)
createRawDataForArray(*RUIdle1Raw,8,227,362,175)
createRawDataForArray(*RUIdle1Raw,9,232,360,203)

*RUIdle1_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_2WindFrontRaw,0,428,485,467)
createRawDataForArray(*RUIdle1_2WindFrontRaw,1,427,503,479)

*RUIdle1_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_3WindFrontRaw,0,473,357,157)
createRawDataForArray(*RUIdle1_3WindFrontRaw,1,530,407,158)

*RUIdle1_4WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_4WindFrontRaw,0,619,358,152)
createRawDataForArray(*RUIdle1_4WindFrontRaw,1,724,350,150)

*RUIdle1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUIdle1_5WindFrontRaw,0,623,357,142)
createRawDataForArray(*RUIdle1_5WindFrontRaw,1,641,402,133)
createRawDataForArray(*RUIdle1_5WindFrontRaw,2,659,430,191)

*RUIdle1_7WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_7WindFrontRaw,0,536,344,168)
createRawDataForArray(*RUIdle1_7WindFrontRaw,1,657,343,207)

*RUIdle1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUIdle1_8WindFrontRaw,0,435,357,150)

*RUIdle1_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUIdle1_9WindFrontRaw,0,444,372,156)

*RUIdle1_10WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUIdle1_10WindFrontRaw,0,602,356,177)
createRawDataForArray(*RUIdle1_10WindFrontRaw,1,531,361,239)
createRawDataForArray(*RUIdle1_10WindFrontRaw,2,519,376,277)

*RUIdle1_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_2WindBackRaw,0,217,435,606)
createRawDataForArray(*RUIdle1_2WindBackRaw,1,213,519,664)

*RUIdle1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUIdle1_3WindBackRaw,0,218,495,717)

*RUIdle1_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUIdle1_5WindBackRaw,0,183,459,621)

*RUIdle1_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_6WindBackRaw,0,170,483,625)
createRawDataForArray(*RUIdle1_6WindBackRaw,1,166,517,645)

*RUIdle1_9WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUIdle1_9WindBackRaw,0,191,504,706)
createRawDataForArray(*RUIdle1_9WindBackRaw,1,219,508,699)

;----RUMoveFront
*RUMoveFrontRaw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*RUMoveFrontRaw,0,87,352,182)
createRawDataForArray(*RUMoveFrontRaw,1,94,349,173)
createRawDataForArray(*RUMoveFrontRaw,2,112,348,158)
createRawDataForArray(*RUMoveFrontRaw,3,105,347,170)
createRawDataForArray(*RUMoveFrontRaw,4,110,356,190)
createRawDataForArray(*RUMoveFrontRaw,5,112,359,160)
createRawDataForArray(*RUMoveFrontRaw,6,111,362,161)
createRawDataForArray(*RUMoveFrontRaw,7,119,367,187)
createRawDataForArray(*RUMoveFrontRaw,8,121,381,177)
createRawDataForArray(*RUMoveFrontRaw,9,112,367,174)

;----RUMoveBack
*RUMoveBackRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*RUMoveBackRaw,0,226,381,295)
createRawDataForArray(*RUMoveBackRaw,1,257,377,326)
createRawDataForArray(*RUMoveBackRaw,2,230,375,279)
createRawDataForArray(*RUMoveBackRaw,3,190,368,228)
createRawDataForArray(*RUMoveBackRaw,4,172,366,207)
createRawDataForArray(*RUMoveBackRaw,5,196,370,252)
createRawDataForArray(*RUMoveBackRaw,6,192,371,247)
createRawDataForArray(*RUMoveBackRaw,7,258,385,316)
createRawDataForArray(*RUMoveBackRaw,8,276,392,338)

;----RUNeutral1
*RUNeutral1Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*RUNeutral1Raw,0,643,863,701)
createRawDataForArray(*RUNeutral1Raw,1,645,876,742)
createRawDataForArray(*RUNeutral1Raw,2,572,903,784,571,905,1242)
createRawDataForArray(*RUNeutral1Raw,3,587,878,762)
createRawDataForArray(*RUNeutral1Raw,4,669,862,725)
createRawDataForArray(*RUNeutral1Raw,5,571,852,789,572,874,1096)
createRawDataForArray(*RUNeutral1Raw,6,579,843,777)
createRawDataForArray(*RUNeutral1Raw,7,681,842,717)
createRawDataForArray(*RUNeutral1Raw,8,569,900,766,570,936,1120)
createRawDataForArray(*RUNeutral1Raw,9,707,897,772,611,975,1129)
createRawDataForArray(*RUNeutral1Raw,10,713,904,800)

*RUNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_1WindFrontRaw,0,635,873,681)
createRawDataForArray(*RUNeutral1_1WindFrontRaw,1,615,889,671)
createRawDataForArray(*RUNeutral1_1WindFrontRaw,2,620,889,677)

*RUNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral1_2WindFrontRaw,0,937,926,853)
createRawDataForArray(*RUNeutral1_2WindFrontRaw,1,1019,913,837)
createRawDataForArray(*RUNeutral1_2WindFrontRaw,2,1138,916,822)
createRawDataForArray(*RUNeutral1_2WindFrontRaw,3,1200,953,819)

*RUNeutral1_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral1_3WindFrontRaw,0,561,900,691)
createRawDataForArray(*RUNeutral1_3WindFrontRaw,1,521,897,874)
createRawDataForArray(*RUNeutral1_3WindFrontRaw,2,495,917,934)
createRawDataForArray(*RUNeutral1_3WindFrontRaw,3,487,935,1184)

*RUNeutral1_5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_5WindFrontRaw,0,555,842,714)
createRawDataForArray(*RUNeutral1_5WindFrontRaw,1,649,833,695)
createRawDataForArray(*RUNeutral1_5WindFrontRaw,2,1024,845,692)

*RUNeutral1_6WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUNeutral1_6WindFrontRaw,0,558,841,675)
createRawDataForArray(*RUNeutral1_6WindFrontRaw,1,539,874,899)
createRawDataForArray(*RUNeutral1_6WindFrontRaw,2,523,904,1066)
createRawDataForArray(*RUNeutral1_6WindFrontRaw,3,815,928,1147)
createRawDataForArray(*RUNeutral1_6WindFrontRaw,4,804,942,1203)

*RUNeutral1_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_8WindFrontRaw,0,532,830,706)
createRawDataForArray(*RUNeutral1_8WindFrontRaw,1,611,818,688)
createRawDataForArray(*RUNeutral1_8WindFrontRaw,2,1081,832,685)

*RUNeutral1_9WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral1_9WindFrontRaw,0,560,831,659)
createRawDataForArray(*RUNeutral1_9WindFrontRaw,1,529,917,991)
createRawDataForArray(*RUNeutral1_9WindFrontRaw,2,519,952,1052)
createRawDataForArray(*RUNeutral1_9WindFrontRaw,3,516,962,1175)

*RUNeutral1_10WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_10WindFrontRaw,0,1023,844,645)
createRawDataForArray(*RUNeutral1_10WindFrontRaw,1,1006,942,661)
createRawDataForArray(*RUNeutral1_10WindFrontRaw,2,1061,1036,773)

*RUNeutral1_3WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_3WindBackRaw,0,871,861,901)
createRawDataForArray(*RUNeutral1_3WindBackRaw,1,853,857,953)
createRawDataForArray(*RUNeutral1_3WindBackRaw,2,843,875,1052)

*RUNeutral1_5WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUNeutral1_5WindBackRaw,0,849,880,1072)
createRawDataForArray(*RUNeutral1_5WindBackRaw,1,883,863,1057)

*RUNeutral1_6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_6WindBackRaw,0,864,889,1060)
createRawDataForArray(*RUNeutral1_6WindBackRaw,1,852,909,1074)
createRawDataForArray(*RUNeutral1_6WindBackRaw,2,853,951,1113)

*RUNeutral1_8WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUNeutral1_8WindBackRaw,0,820,891,1076)
createRawDataForArray(*RUNeutral1_8WindBackRaw,1,857,879,1067)

*RUNeutral1_9WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral1_9WindBackRaw,0,866,922,1045)
createRawDataForArray(*RUNeutral1_9WindBackRaw,1,852,938,1087)
createRawDataForArray(*RUNeutral1_9WindBackRaw,2,839,966,1163)

; From Side 2
*RUNeutral1_1AltWindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUNeutral1_1AltWindFrontRaw,0,556,882,680)
createRawDataForArray(*RUNeutral1_1AltWindFrontRaw,1,600,868,661)

;----RUNeutral2
*RUNeutral2Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*RUNeutral2Raw,0,764,857,653)
createRawDataForArray(*RUNeutral2Raw,1,766,862,645)
createRawDataForArray(*RUNeutral2Raw,2,668,868,743,668,931,1058)
createRawDataForArray(*RUNeutral2Raw,3,697,869,725)
createRawDataForArray(*RUNeutral2Raw,4,760,876,656)
createRawDataForArray(*RUNeutral2Raw,5,644,870,762,646,923,1031)
createRawDataForArray(*RUNeutral2Raw,6,708,886,755)
createRawDataForArray(*RUNeutral2Raw,7,776,906,644)
createRawDataForArray(*RUNeutral2Raw,8,635,938,785,632,969,994)
createRawDataForArray(*RUNeutral2Raw,9,658,929,760)

*RUNeutral2_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUNeutral2_1WindFrontRaw,0,939,862,636)
createRawDataForArray(*RUNeutral2_1WindFrontRaw,1,964,852,625)

*RUNeutral2_3WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_3WindFrontRaw,0,661,851,811)
createRawDataForArray(*RUNeutral2_3WindFrontRaw,1,609,856,842)
createRawDataForArray(*RUNeutral2_3WindFrontRaw,2,584,863,885)
createRawDataForArray(*RUNeutral2_3WindFrontRaw,3,568,969,1417)

*RUNeutral2_5WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_5WindFrontRaw,0,896,865,637)
createRawDataForArray(*RUNeutral2_5WindFrontRaw,1,1022,844,611)
createRawDataForArray(*RUNeutral2_5WindFrontRaw,2,1183,858,599)
createRawDataForArray(*RUNeutral2_5WindFrontRaw,3,1227,937,604)

*RUNeutral2_6WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_6WindFrontRaw,0,638,850,890)
createRawDataForArray(*RUNeutral2_6WindFrontRaw,1,593,852,935)
createRawDataForArray(*RUNeutral2_6WindFrontRaw,2,570,864,1065)
createRawDataForArray(*RUNeutral2_6WindFrontRaw,3,567,873,1131)

*RUNeutral2_8WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral2_8WindFrontRaw,0,911,877,604)
createRawDataForArray(*RUNeutral2_8WindFrontRaw,1,947,864,582)
createRawDataForArray(*RUNeutral2_8WindFrontRaw,2,1160,885,576)

*RUNeutral2_9WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_9WindFrontRaw,0,615,918,1019)
createRawDataForArray(*RUNeutral2_9WindFrontRaw,1,584,907,1017)
createRawDataForArray(*RUNeutral2_9WindFrontRaw,2,575,939,1037)
createRawDataForArray(*RUNeutral2_9WindFrontRaw,3,575,1106,1304)

*RUNeutral2_3WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_3WindBackRaw,0,989,921,560)
createRawDataForArray(*RUNeutral2_3WindBackRaw,1,979,919,556)
createRawDataForArray(*RUNeutral2_3WindBackRaw,2,994,922,572)
createRawDataForArray(*RUNeutral2_3WindBackRaw,3,998,925,695)

*RUNeutral2_5WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral2_5WindBackRaw,0,622,916,1074)
createRawDataForArray(*RUNeutral2_5WindBackRaw,1,622,902,1045)
createRawDataForArray(*RUNeutral2_5WindBackRaw,2,668,905,1033)

*RUNeutral2_6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral2_6WindBackRaw,0,1013,918,642)
createRawDataForArray(*RUNeutral2_6WindBackRaw,1,987,922,640)
createRawDataForArray(*RUNeutral2_6WindBackRaw,2,993,917,670)

*RUNeutral2_8WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUNeutral2_8WindBackRaw,0,648,954,1045)
createRawDataForArray(*RUNeutral2_8WindBackRaw,1,655,933,1019)
createRawDataForArray(*RUNeutral2_8WindBackRaw,2,726,933,1021)

*RUNeutral2_9WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUNeutral2_9WindBackRaw,0,1024,908,589)
createRawDataForArray(*RUNeutral2_9WindBackRaw,1,923,927,596)
createRawDataForArray(*RUNeutral2_9WindBackRaw,2,871,1073,628)
createRawDataForArray(*RUNeutral2_9WindBackRaw,3,852,1118,688)

;----RUSide1
*RUSide1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSide1Raw,0,790,935,895,790,878,686)
createRawDataForArray(*RUSide1Raw,1,609,877,890,609,933,1097)
createRawDataForArray(*RUSide1Raw,2,655,865,743,639,935,745)
createRawDataForArray(*RUSide1Raw,3,808,871,652,657,941,1060)

*RUSide1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide1_1WindFrontRaw,0,776,806,693)

*RUSide1_2WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUSide1_2WindFrontRaw,0,582,754,612)
createRawDataForArray(*RUSide1_2WindFrontRaw,1,529,731,618)
createRawDataForArray(*RUSide1_2WindFrontRaw,2,513,771,797)
createRawDataForArray(*RUSide1_2WindFrontRaw,3,491,765,871)
createRawDataForArray(*RUSide1_2WindFrontRaw,4,479,849,1476)

*RUSide1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide1_3WindFrontRaw,0,1144,926,729)

*RUSide1_4WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSide1_4WindFrontRaw,0,1135,890,634)
createRawDataForArray(*RUSide1_4WindFrontRaw,1,1158,887,614)
createRawDataForArray(*RUSide1_4WindFrontRaw,2,1219,954,607)
createRawDataForArray(*RUSide1_4WindFrontRaw,3,1226,980,632)

*RUSide1_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide1_1WindBackRaw,0,815,997,1085)

*RUSide1_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide1_2WindBackRaw,0,844,934,871)

*RUSide1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide1_3WindBackRaw,0,876,920,717)

*RUSide1_4WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSide1_4WindBackRaw,0,904,909,614)
createRawDataForArray(*RUSide1_4WindBackRaw,1,908,908,583)
createRawDataForArray(*RUSide1_4WindBackRaw,2,1148,908,576)
createRawDataForArray(*RUSide1_4WindBackRaw,3,1365,897,596)

;----RUSide2
*RUSide2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RUSide2Raw,0,656,878,776)
createRawDataForArray(*RUSide2Raw,1,661,899,907)
createRawDataForArray(*RUSide2Raw,2,818,852,889)
createRawDataForArray(*RUSide2Raw,3,654,878,746,656,852,746)
createRawDataForArray(*RUSide2Raw,4,603,887,745,604,902,744)
createRawDataForArray(*RUSide2Raw,5,585,887,800,605,938,747)

*RUSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_1WindFrontRaw,0,648,904,1089)

*RUSide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_2WindFrontRaw,0,628,904,1070)

*RUSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_3WindFrontRaw,0,643,834,877)

*RUSide2_4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUSide2_4WindFrontRaw,0,648,823,721)
createRawDataForArray(*RUSide2_4WindFrontRaw,1,748,815,678)
createRawDataForArray(*RUSide2_4WindFrontRaw,2,1237,826,650)
createRawDataForArray(*RUSide2_4WindFrontRaw,3,1352,838,648)
createRawDataForArray(*RUSide2_4WindFrontRaw,4,1385,866,644)

*RUSide2_5WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUSide2_5WindFrontRaw,0,581,883,1035)
createRawDataForArray(*RUSide2_5WindFrontRaw,1,575,874,1041)
createRawDataForArray(*RUSide2_5WindFrontRaw,2,567,862,1001)
createRawDataForArray(*RUSide2_5WindFrontRaw,3,574,944,914)
createRawDataForArray(*RUSide2_5WindFrontRaw,4,645,974,1047)

*RUSide2_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_1WindBackRaw,0,1052,878,643)

*RUSide2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_2WindBackRaw,0,933,879,645)

*RUSide2_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_3WindBackRaw,0,798,941,667)

*RUSide2_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide2_4WindBackRaw,0,650,915,671)

;----RUSide3
*RUSide3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RUSide3Raw,0,662,861,706)
createRawDataForArray(*RUSide3Raw,1,735,669,726)
createRawDataForArray(*RUSide3Raw,2,872,591,906,918,568,758)
createRawDataForArray(*RUSide3Raw,3,737,686,858,738,578,859)
createRawDataForArray(*RUSide3Raw,4,650,909,776,643,661,776)
createRawDataForArray(*RUSide3Raw,5,676,947,724,665,921,872)

*RUSide3_1WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSide3_1WindFrontRaw,0,582,853,694)
createRawDataForArray(*RUSide3_1WindFrontRaw,1,585,875,1252)

*RUSide3_2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSide3_2WindFrontRaw,0,660,645,598)
createRawDataForArray(*RUSide3_2WindFrontRaw,1,984,861,956)

*RUSide3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide3_3WindFrontRaw,0,659,429,550)

*RUSide3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide3_4WindFrontRaw,0,661,277,497)

*RUSide3_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSide3_5WindFrontRaw,0,583,262,514)

*RUSide3_6WindFront1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RUSide3_6WindFront1Raw,0,503,276,474)
createRawDataForArray(*RUSide3_6WindFront1Raw,1,463,344,760)
createRawDataForArray(*RUSide3_6WindFront1Raw,2,435,323,825)
createRawDataForArray(*RUSide3_6WindFront1Raw,3,456,305,921)
createRawDataForArray(*RUSide3_6WindFront1Raw,4,439,845,1141)
createRawDataForArray(*RUSide3_6WindFront1Raw,5,459,1053,1261)

*RUSide3_6WindFront2Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSide3_6WindFront2Raw,0,649,1077,1047)
createRawDataForArray(*RUSide3_6WindFront2Raw,1,581,1014,1068)
createRawDataForArray(*RUSide3_6WindFront2Raw,2,568,999,1088)
createRawDataForArray(*RUSide3_6WindFront2Raw,3,585,1019,1086)

*RUSide3_4WindBackRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RUSide3_4WindBackRaw,0,692,1000,828)
createRawDataForArray(*RUSide3_4WindBackRaw,1,755,920,758)
createRawDataForArray(*RUSide3_4WindBackRaw,2,740,905,711)
createRawDataForArray(*RUSide3_4WindBackRaw,3,1150,915,686)
createRawDataForArray(*RUSide3_4WindBackRaw,4,1199,913,676)
createRawDataForArray(*RUSide3_4WindBackRaw,5,1295,1100,698)

;----RUSpawn
*RUSpawnRaw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*RUSpawnRaw,0,458,30,362)
createRawDataForArray(*RUSpawnRaw,1,400,74,361)
createRawDataForArray(*RUSpawnRaw,2,286,165,355)
createRawDataForArray(*RUSpawnRaw,3,314,237,319)
createRawDataForArray(*RUSpawnRaw,4,379,320,284)
createRawDataForArray(*RUSpawnRaw,5,243,81,177)
createRawDataForArray(*RUSpawnRaw,6,168,134,206)
createRawDataForArray(*RUSpawnRaw,7,166,216,215)
createRawDataForArray(*RUSpawnRaw,8,87,359,231)
createRawDataForArray(*RUSpawnRaw,9,102,339,236)
createRawDataForArray(*RUSpawnRaw,10,199,356,209)

*RUSpawn_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_2WindFrontRaw,0,393,28,449)

*RUSpawn_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSpawn_3WindFrontRaw,0,275,38,349)
createRawDataForArray(*RUSpawn_3WindFrontRaw,1,260,137,611)

*RUSpawn_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_4WindFrontRaw,0,292,191,387)

*RUSpawn_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_5WindFrontRaw,0,324,250,361)

*RUSpawn_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_6WindFrontRaw,0,230,12,351)

*RUSpawn_7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_7WindFrontRaw,0,143,71,369)

*RUSpawn_8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_8WindFrontRaw,0,147,138,198)

*RUSpawn_9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_9WindFrontRaw,0,53,221,222)

*RUSpawn_10WindFront1Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUSpawn_10WindFront1Raw,0,27,228,185)
createRawDataForArray(*RUSpawn_10WindFront1Raw,1,8,289,166)
createRawDataForArray(*RUSpawn_10WindFront1Raw,2,54,273,177)

*RUSpawn_10WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUSpawn_10WindFront2Raw,0,359,349,447)
createRawDataForArray(*RUSpawn_10WindFront2Raw,1,331,388,507)
createRawDataForArray(*RUSpawn_10WindFront2Raw,2,311,434,619)

*RUSpawn_4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_4WindBackRaw,0,605,694,309)

*RUSpawn_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_5WindBackRaw,0,625,715,267)

*RUSpawn_6WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUSpawn_6WindBackRaw,0,638,363,156)
createRawDataForArray(*RUSpawn_6WindBackRaw,1,745,410,142)
createRawDataForArray(*RUSpawn_6WindBackRaw,2,817,504,136)

*RUSpawn_7WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSpawn_7WindBackRaw,0,751,444,185)

;----RUDeath
*RUDeathRaw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*RUDeathRaw,0,234,338,126)
createRawDataForArray(*RUDeathRaw,1,151,355,268)
createRawDataForArray(*RUDeathRaw,2,82,373,361)
createRawDataForArray(*RUDeathRaw,3,59,369,333)
createRawDataForArray(*RUDeathRaw,4,10,342,328)
createRawDataForArray(*RUDeathRaw,5,17,363,324)
createRawDataForArray(*RUDeathRaw,6,18,347,284)
createRawDataForArray(*RUDeathRaw,7,18,390,318)
createRawDataForArray(*RUDeathRaw,8,18,390,333)
createRawDataForArray(*RUDeathRaw,9,18,417,366)
createRawDataForArray(*RUDeathRaw,10,18,452,387)
createRawDataForArray(*RUDeathRaw,11,18,431,365)

*RUDeath_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_2WindFrontRaw,0,149,345,152)

*RUDeath_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_3WindFrontRaw,0,78,372,286)

*RUDeath_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_4WindFrontRaw,0,436,396,387)

*RUDeath_5WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_5WindFrontRaw,0,429,347,311)

*RUDeath_6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_6WindFrontRaw,0,259,458,400)

*RUDeath_7WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUDeath_7WindFrontRaw,0,203,523,432)
createRawDataForArray(*RUDeath_7WindFrontRaw,1,189,485,401)
createRawDataForArray(*RUDeath_7WindFrontRaw,2,205,458,394)

*RUDeath_10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_10WindFrontRaw,0,392,373,441)

*RUDeath_11WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUDeath_11WindFrontRaw,0,324,385,356)
createRawDataForArray(*RUDeath_11WindFrontRaw,1,308,447,331)
createRawDataForArray(*RUDeath_11WindFrontRaw,2,297,514,325)
createRawDataForArray(*RUDeath_11WindFrontRaw,3,336,513,320)

*RUDeath_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_2WindBackRaw,0,141,342,440)

*RUDeath_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUDeath_3WindBackRaw,0,78,343,550)
createRawDataForArray(*RUDeath_3WindBackRaw,1,356,418,605)

*RUDeath_4WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUDeath_4WindBackRaw,0,32,414,809)
createRawDataForArray(*RUDeath_4WindBackRaw,1,25,407,888)
createRawDataForArray(*RUDeath_4WindBackRaw,2,21,403,901)

*RUDeath_5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUDeath_5WindBackRaw,0,0,430,905)

*RUDeath_7WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUDeath_7WindBackRaw,0,238,478,448)
createRawDataForArray(*RUDeath_7WindBackRaw,1,235,468,429)
createRawDataForArray(*RUDeath_7WindBackRaw,2,325,471,426)

;----RUJump
*RUJumpRaw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*RUJumpRaw,0,212,360,242)
createRawDataForArray(*RUJumpRaw,1,232,397,354)
createRawDataForArray(*RUJumpRaw,2,260,325,317)
createRawDataForArray(*RUJumpRaw,3,156,376,373)
createRawDataForArray(*RUJumpRaw,4,205,279,324)
createRawDataForArray(*RUJumpRaw,5,379,138,305)
createRawDataForArray(*RUJumpRaw,6,234,143,282)
createRawDataForArray(*RUJumpRaw,7,270,201,159)
createRawDataForArray(*RUJumpRaw,8,209,234,187)
createRawDataForArray(*RUJumpRaw,9,220,186,183)
createRawDataForArray(*RUJumpRaw,10,224,252,140)

;----RULand
*RULandRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RULandRaw,0,72,281,249)
createRawDataForArray(*RULandRaw,1,71,350,287)
createRawDataForArray(*RULandRaw,2,336,378,290)
createRawDataForArray(*RULandRaw,3,294,264,375)
createRawDataForArray(*RULandRaw,4,267,318,357)
createRawDataForArray(*RULandRaw,5,222,343,212)

;----RUHit
*RUHitRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*RUHitRaw,0,196,393,139)
createRawDataForArray(*RUHitRaw,1,176,345,163)
createRawDataForArray(*RUHitRaw,2,206,411,374)
createRawDataForArray(*RUHitRaw,3,140,425,218)
createRawDataForArray(*RUHitRaw,4,198,387,146)
createRawDataForArray(*RUHitRaw,5,407,248,308)
createRawDataForArray(*RUHitRaw,6,395,335,338)

;----RUDodge
*RUDodgeRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUDodgeRaw,0,147,296,241)
createRawDataForArray(*RUDodgeRaw,1,166,338,234)
createRawDataForArray(*RUDodgeRaw,2,182,414,228)
createRawDataForArray(*RUDodgeRaw,3,212,462,212)
createRawDataForArray(*RUDodgeRaw,4,211,482,191)

;----RUParry
*RUParryRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*RUParryRaw,0,84,233,299)
createRawDataForArray(*RUParryRaw,1,126,186,321)
createRawDataForArray(*RUParryRaw,2,142,197,310)
createRawDataForArray(*RUParryRaw,3,202,208,275)
createRawDataForArray(*RUParryRaw,4,243,256,234)
createRawDataForArray(*RUParryRaw,5,261,283,214)
createRawDataForArray(*RUParryRaw,6,264,321,224)

;----RUSelection
*RUSelectionRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*RUSelectionRaw,0,427,453,351)
createRawDataForArray(*RUSelectionRaw,1,389,431,365)
createRawDataForArray(*RUSelectionRaw,2,358,419,366)
createRawDataForArray(*RUSelectionRaw,3,246,404,379)
createRawDataForArray(*RUSelectionRaw,4,210,401,383)
createRawDataForArray(*RUSelectionRaw,5,210,399,371)
createRawDataForArray(*RUSelectionRaw,6,176,394,366)
createRawDataForArray(*RUSelectionRaw,7,182,398,367)
createRawDataForArray(*RUSelectionRaw,8,191,404,372)
createRawDataForArray(*RUSelectionRaw,9,192,404,371)
createRawDataForArray(*RUSelectionRaw,10,186,400,366)
createRawDataForArray(*RUSelectionRaw,11,189,402,373)
createRawDataForArray(*RUSelectionRaw,12,197,406,378)

*RUSelection2WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelection2WindFrontRaw,0,408,421,402)
createRawDataForArray(*RUSelection2WindFrontRaw,1,414,497,515)

*RUSelection3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelection3WindFrontRaw,0,347,409,420)

*RUSelection4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelection4WindFrontRaw,0,235,380,396)

*RUSelection5WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUSelection5WindFrontRaw,0,198,380,457)
createRawDataForArray(*RUSelection5WindFrontRaw,1,167,366,463)
createRawDataForArray(*RUSelection5WindFrontRaw,2,165,367,688)

*RUSelection6WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelection6WindFrontRaw,0,369,447,475)
createRawDataForArray(*RUSelection6WindFrontRaw,1,362,444,554)

*RUSelection6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelection6WindBackRaw,0,340,428,499)

*RUSelection7WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSelection7WindBackRaw,0,337,387,504)
createRawDataForArray(*RUSelection7WindBackRaw,1,315,376,496)
createRawDataForArray(*RUSelection7WindBackRaw,2,332,375,495)
createRawDataForArray(*RUSelection7WindBackRaw,3,399,372,513)

;----RUSelected
*RUSelectedRaw.rawdataArray=createRawDataArray(21)
createRawDataForArray(*RUSelectedRaw,0,160,335,382)
createRawDataForArray(*RUSelectedRaw,1,371,118,390)
createRawDataForArray(*RUSelectedRaw,2,264,74,278)
createRawDataForArray(*RUSelectedRaw,3,142,224,227)
createRawDataForArray(*RUSelectedRaw,4,259,225,308)
createRawDataForArray(*RUSelectedRaw,5,345,259,281)
createRawDataForArray(*RUSelectedRaw,6,138,254,192)
createRawDataForArray(*RUSelectedRaw,7,222,216,201)
createRawDataForArray(*RUSelectedRaw,8,370,324,390)
createRawDataForArray(*RUSelectedRaw,9,186,310,400)
createRawDataForArray(*RUSelectedRaw,10,165,325,292)
createRawDataForArray(*RUSelectedRaw,11,192,352,237)
createRawDataForArray(*RUSelectedRaw,12,200,342,241)
createRawDataForArray(*RUSelectedRaw,13,196,346,239)
createRawDataForArray(*RUSelectedRaw,14,194,350,239)
createRawDataForArray(*RUSelectedRaw,15,196,349,244)
createRawDataForArray(*RUSelectedRaw,16,184,347,240)
createRawDataForArray(*RUSelectedRaw,17,187,349,244)
createRawDataForArray(*RUSelectedRaw,18,190,357,245)
createRawDataForArray(*RUSelectedRaw,19,184,354,252)
createRawDataForArray(*RUSelectedRaw,20,198,361,259)
createRawDataForArray(*RUSelectedRaw,21,184,362,252)

*RUSelected1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected1WindFrontRaw,0,145,314,720)

*RUSelected2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected2WindFrontRaw,0,123,76,382)

*RUSelected3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*RUSelected3WindFrontRaw,0,109,4,233)
createRawDataForArray(*RUSelected3WindFrontRaw,1,584,341,282)
createRawDataForArray(*RUSelected3WindFrontRaw,2,699,406,275)

*RUSelected4WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*RUSelected4WindFrontRaw,0,127,37,122)
createRawDataForArray(*RUSelected4WindFrontRaw,1,460,7,103)
createRawDataForArray(*RUSelected4WindFrontRaw,2,660,26,97)
createRawDataForArray(*RUSelected4WindFrontRaw,3,706,73,58)
createRawDataForArray(*RUSelected4WindFrontRaw,4,832,174,53)

*RUSelected5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelected5WindFrontRaw,0,105,163,169)
createRawDataForArray(*RUSelected5WindFrontRaw,1,82,226,176)

*RUSelected6WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected6WindFrontRaw,0,69,231,237)

*RUSelected7WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSelected7WindFrontRaw,0,98,220,107)
createRawDataForArray(*RUSelected7WindFrontRaw,1,60,217,104)
createRawDataForArray(*RUSelected7WindFrontRaw,2,58,241,105)
createRawDataForArray(*RUSelected7WindFrontRaw,3,91,339,98)

*RUSelected8WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected8WindFrontRaw,0,345,201,156)

*RUSelected9WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected9WindFrontRaw,0,321,106,154)

*RUSelected10WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected10WindFrontRaw,0,68,76,191)

*RUSelected11WindFrontRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*RUSelected11WindFrontRaw,0,2,47,209)
createRawDataForArray(*RUSelected11WindFrontRaw,1,7,71,370)
createRawDataForArray(*RUSelected11WindFrontRaw,2,45,73,462)
createRawDataForArray(*RUSelected11WindFrontRaw,3,34,225,502)
createRawDataForArray(*RUSelected11WindFrontRaw,4,34,361,549)
createRawDataForArray(*RUSelected11WindFrontRaw,5,35,486,692)

*RUSelected12WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelected12WindFrontRaw,0,305,394,568)
createRawDataForArray(*RUSelected12WindFrontRaw,1,299,487,567)

*RUSelected18WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelected18WindFrontRaw,0,179,520,575)
createRawDataForArray(*RUSelected18WindFrontRaw,1,172,511,686)

*RUSelected19WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*RUSelected19WindFrontRaw,0,183,521,591)
createRawDataForArray(*RUSelected19WindFrontRaw,1,206,617,590)

*RUSelected1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected1WindBackRaw,0,177,404,515)

*RUSelected2WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSelected2WindBackRaw,0,238,168,378)
createRawDataForArray(*RUSelected2WindBackRaw,1,406,248,349)
createRawDataForArray(*RUSelected2WindBackRaw,2,506,271,341)
createRawDataForArray(*RUSelected2WindBackRaw,3,652,401,338)

*RUSelected3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected3WindBackRaw,0,259,415,525)

*RUSelected4WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected4WindBackRaw,0,140,319,558)

*RUSelected5WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected5WindBackRaw,0,178,217,250)

*RUSelected6WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected6WindBackRaw,0,323,191,197)

*RUSelected7WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSelected7WindBackRaw,0,132,201,378)
createRawDataForArray(*RUSelected7WindBackRaw,1,98,192,529)
createRawDataForArray(*RUSelected7WindBackRaw,2,80,205,626)
createRawDataForArray(*RUSelected7WindBackRaw,3,78,208,676)

*RUSelected8WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected8WindBackRaw,0,133,385,599)

*RUSelected9WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected9WindBackRaw,0,140,398,443)

*RUSelected10WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected10WindBackRaw,0,317,363,362)

*RUSelected11WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*RUSelected11WindBackRaw,0,476,350,244)

*RUSelected12WindBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*RUSelected12WindBackRaw,0,568,366,173)
createRawDataForArray(*RUSelected12WindBackRaw,1,685,363,174)
createRawDataForArray(*RUSelected12WindBackRaw,2,743,405,166)
createRawDataForArray(*RUSelected12WindBackRaw,3,790,461,160)

;----land light front
*landLightFront1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*landLightFront1Raw,0,455,622,367)
createRawDataForArray(*landLightFront1Raw,1,417,574,332)
createRawDataForArray(*landLightFront1Raw,2,334,516,253)
createRawDataForArray(*landLightFront1Raw,3,290,504,228)

;----land light back
*landLightBack1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*landLightBack1Raw,0,432,579,379)
createRawDataForArray(*landLightBack1Raw,1,385,525,329)
createRawDataForArray(*landLightBack1Raw,2,371,490,325)
createRawDataForArray(*landLightBack1Raw,3,334,422,290)

;----land heavy front
*landHeavyFront1Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*landHeavyFront1Raw,0,383,559,306)
createRawDataForArray(*landHeavyFront1Raw,1,281,475,238)
createRawDataForArray(*landHeavyFront1Raw,2,196,426,133)
createRawDataForArray(*landHeavyFront1Raw,3,148,410,103)
createRawDataForArray(*landHeavyFront1Raw,4,157,352,96 )

;----land heavy back
*landHeavyBack1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*landHeavyBack1Raw,0,422,584,359)
createRawDataForArray(*landHeavyBack1Raw,1,306,527,277)
createRawDataForArray(*landHeavyBack1Raw,2,217,402,174)
createRawDataForArray(*landHeavyBack1Raw,3,193,380,123)

;----loading1
Global *loading1Raw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*loading1Raw, 0,  7, 11,  3)
createRawDataForArray(*loading1Raw, 1,  4,  3,  5)
createRawDataForArray(*loading1Raw, 2,  3,  6, 41)
createRawDataForArray(*loading1Raw, 3,  7, 66, 11)
createRawDataForArray(*loading1Raw, 4, 48, 56,  8)
createRawDataForArray(*loading1Raw, 5, 45, 53, 17)
createRawDataForArray(*loading1Raw, 6, 27,100, 17)
createRawDataForArray(*loading1Raw, 7, 53, 72, 35)
createRawDataForArray(*loading1Raw, 8, 43, 42, 14)
createRawDataForArray(*loading1Raw, 9, 53, 32, 18)
createRawDataForArray(*loading1Raw,10, 24, 14,  5)
createRawDataForArray(*loading1Raw,11,  7,  8,  3)

;----loading2
Global *loading2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*loading2Raw,0, 57, 87, 90)
createRawDataForArray(*loading2Raw,1, 77, 77, 91)
createRawDataForArray(*loading2Raw,2, 85, 92, 89)
createRawDataForArray(*loading2Raw,3, 80, 86, 88)
createRawDataForArray(*loading2Raw,4, 62, 87, 91)

Macro destroyAllRawData(what)
	ForEach what\rda()
		destroyRawDataArray(what\rda())
	Next
	ClearList(what\rda())
	FreeList(what\rda())
	FreeStructure(what)
EndMacro
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 7300
; FirstLine = 7210
; Folding = --
; EnableXP
; CPU = 1