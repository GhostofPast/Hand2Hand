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
		*rd\item[0]=x.i
		*rd\item[1]=y.i
		*rd\item[2]=fx.i
		*rd\item[3]=hx.i
		*rd\item[4]=hy.i
		*rd\item[5]=hfx.i
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

;----CSidle1 new
*CSidle1NewRaw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*CSidle1NewRaw,0,246,425,323)
createRawDataForArray(*CSidle1NewRaw,1,260,427,293)
createRawDataForArray(*CSidle1NewRaw,2,248,426,321)
createRawDataForArray(*CSidle1NewRaw,3,243,424,353)
createRawDataForArray(*CSidle1NewRaw,4,242,429,348)
createRawDataForArray(*CSidle1NewRaw,5,254,419,324)
createRawDataForArray(*CSidle1NewRaw,6,294,427,329)
createRawDataForArray(*CSidle1NewRaw,7,274,422,336)

*CSidle1_2WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle1_2WindBackRaw,0,239,442,300)
createRawDataForArray(*CSidle1_2WindBackRaw,1,262,541,298)

*CSidle1_3WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle1_3WindBackRaw,0,238,432,307)

*CSidle1_4WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle1_4WindBackRaw,0,232,477,308)
createRawDataForArray(*CSidle1_4WindBackRaw,1,221,449,328)

*CSidle1_7WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle1_7WindBackRaw,0,255,474,318)
createRawDataForArray(*CSidle1_7WindBackRaw,1,281,455,311)

*CSidle1_8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle1_8WindFrontRaw,0,402,478,543)
createRawDataForArray(*CSidle1_8WindFrontRaw,1,397,469,555)

;----CSidle2 new
*CSidle2NewRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSidle2NewRaw,0,226,422,321)
createRawDataForArray(*CSidle2NewRaw,1,245,422,341)
createRawDataForArray(*CSidle2NewRaw,2,274,420,337)
createRawDataForArray(*CSidle2NewRaw,3,299,423,339)
createRawDataForArray(*CSidle2NewRaw,4,261,423,332)
createRawDataForArray(*CSidle2NewRaw,5,240,422,338)

*CSidle2_1WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle2_1WindBackRaw,0,613,499,316)
createRawDataForArray(*CSidle2_1WindBackRaw,1,635,536,308)

*CSidle2_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle2_2WindBackRaw,0,577,495,321)

*CSidle2_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle2_3WindBackRaw,0,586,488,320)
createRawDataForArray(*CSidle2_3WindBackRaw,1,599,488,318)

*CSidle2_6WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle2_6WindBackRaw,0,629,500,331)
createRawDataForArray(*CSidle2_6WindBackRaw,1,656,495,325)

*CSidle2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle2_2WindFrontRaw,0,219,569,632)

*CSidle2_3WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle2_3WindFrontRaw,0,218,572,637)
createRawDataForArray(*CSidle2_3WindFrontRaw,1,235,606,652)

*CSidle2_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle2_5WindFrontRaw,0,253,589,690)
createRawDataForArray(*CSidle2_5WindFrontRaw,1,249,581,688)

;----CSidle3
*CSidle3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*CSidle3Raw,0,198,430,347)
createRawDataForArray(*CSidle3Raw,1,196,436,345)
createRawDataForArray(*CSidle3Raw,2,212,438,318)
createRawDataForArray(*CSidle3Raw,3,153,417,343)
createRawDataForArray(*CSidle3Raw,4,207,415,350)

*CSidle3_1WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_1WindBackRaw,0,253,490,333)

*CSidle3_2WindBackRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_2WindBackRaw,0,203,491,348)

*CSidle3_3WindBackRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle3_3WindBackRaw,0,395,553,392)
createRawDataForArray(*CSidle3_3WindBackRaw,1,390,571,419)

*CSidle3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_1WindFrontRaw,0,189,433,380)

*CSidle3_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_2WindFrontRaw,0,180,443,719)

*CSidle3_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_3WindFrontRaw,0,181,419,719)

*CSidle3_4WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*CSidle3_4WindFrontRaw,0,149,436,773)

*CSidle3_5WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*CSidle3_5WindFrontRaw,0,147,453,628)
createRawDataForArray(*CSidle3_5WindFrontRaw,1,141,451,713)

;----CSFrontNew
*CSFrontNewRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*CSFrontNewRaw,0,180,426,339)
createRawDataForArray(*CSFrontNewRaw,1,218,425,318)
createRawDataForArray(*CSFrontNewRaw,2,218,420,325)
createRawDataForArray(*CSFrontNewRaw,3,229,422,333)
createRawDataForArray(*CSFrontNewRaw,4,217,397,339)
createRawDataForArray(*CSFrontNewRaw,5,232,425,333)
createRawDataForArray(*CSFrontNewRaw,6,240,424,340)
createRawDataForArray(*CSFrontNewRaw,7,252,429,336)
createRawDataForArray(*CSFrontNewRaw,8,219,423,342)

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

;----CSnback3
; *CSnBack3Raw.rawdataArray=createRawDataArray(8)
; createRawDataForArray(*CSnBack3Raw,0,334,415,221)
; createRawDataForArray(*CSnBack3Raw,1,344,421,217,338,454,619)
; createRawDataForArray(*CSnBack3Raw,2,335,421,235,332,449,645)
; createRawDataForArray(*CSnBack3Raw,3,315,421,235,322,443,652)
; createRawDataForArray(*CSnBack3Raw,4,285,421,235)
; createRawDataForArray(*CSnBack3Raw,5,308,409,287)
; createRawDataForArray(*CSnBack3Raw,6,308,409,287)
; createRawDataForArray(*CSnBack3Raw,7,316,412,261)
; createRawDataForArray(*CSnBack3Raw,8,351,412,261)

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
; *CSBack4Raw.rawdataArray=createRawDataArray(8)
; createRawDataForArray(*CSBack4Raw,0,210,423,337)
; createRawDataForArray(*CSBack4Raw,1,282,428,294)
; createRawDataForArray(*CSBack4Raw,2,346,430,285,344,472,570)
; createRawDataForArray(*CSBack4Raw,3,328,431,297)
; createRawDataForArray(*CSBack4Raw,4,349,422,322,349,496,390)
; createRawDataForArray(*CSBack4Raw,5,233,416,348,232,452,626)
; createRawDataForArray(*CSBack4Raw,6,233,416,348)
; createRawDataForArray(*CSBack4Raw,7,233,416,348)
; createRawDataForArray(*CSBack4Raw,8,233,416,348)

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

;----CSnDown
*CSnDownRaw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*CSnDownRaw,0 ,318,371,173)
createRawDataForArray(*CSnDownRaw,1 ,403,339,258)
createRawDataForArray(*CSnDownRaw,2 ,436,354,301)
createRawDataForArray(*CSnDownRaw,3 ,413,394,322)
createRawDataForArray(*CSnDownRaw,4 ,420,392,304)
createRawDataForArray(*CSnDownRaw,5 ,430,422,326)
createRawDataForArray(*CSnDownRaw,6 ,154,402,341,152,662,487)
createRawDataForArray(*CSnDownRaw,7 ,147,419,339,149,582,726)
createRawDataForArray(*CSnDownRaw,8 ,145,429,313)
createRawDataForArray(*CSnDownRaw,9 ,251,428,307)

;----CSDown1 new
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

;----CSHeavyNew
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
; *CSHeavy4Raw.rawdataArray=createRawDataArray(10)
; createRawDataForArray(*CSHeavy4Raw,0 ,241,350,318,187,409,716)
; createRawDataForArray(*CSHeavy4Raw,1 ,393,411,361,261,562,585)
; createRawDataForArray(*CSHeavy4Raw,2 ,413,418,353,415,473,355)
; createRawDataForArray(*CSHeavy4Raw,3 ,418,319,182,637,316,178)
; createRawDataForArray(*CSHeavy4Raw,4 ,378,362,224)
; createRawDataForArray(*CSHeavy4Raw,5 ,401,302,358)
; createRawDataForArray(*CSHeavy4Raw,6 ,236,363,363)
; createRawDataForArray(*CSHeavy4Raw,7 ,268,304,345)
; createRawDataForArray(*CSHeavy4Raw,8 ,372,320,207,372,502,484)
; createRawDataForArray(*CSHeavy4Raw,9 ,410,343,169,395,342,549)
; createRawDataForArray(*CSHeavy4Raw,10,407,382,128)
; 
; *CSHeavy4_2BackWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_2BackWindRaw,0,167,413,544)
; 
; *CSHeavy4_3BackWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_3BackWindRaw,0,167,421,349)
; 
; *CSHeavy4_4BackWindRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*CSHeavy4_4BackWindRaw,0,457,314,170)
; createRawDataForArray(*CSHeavy4_4BackWindRaw,1,702,293,154)
; 
; *CSHeavy4_5BackWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_5BackWindRaw,0,371,323,175)
; 
; *CSHeavy4_6BackWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_6BackWindRaw,0,358,297,189)
; 
; *CSHeavy4_7BackWindRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*CSHeavy4_7BackWindRaw,0,230,299,194)
; createRawDataForArray(*CSHeavy4_7BackWindRaw,1,306,273,393)
; 
; *CSHeavy4_9BackWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_9BackWindRaw,0,364,302,365)
; 
; *CSHeavy4_10BackWindRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*CSHeavy4_10BackWindRaw,0,393,343,180)
; createRawDataForArray(*CSHeavy4_10BackWindRaw,1,380,314,405)
; 
; *CSHeavy4_1FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_1FrontWindRaw,0,189,338,375)
; 
; *CSHeavy4_2FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_2FrontWindRaw,0,449,338,373)
; 
; *CSHeavy4_3FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_3FrontWindRaw,0,394,333,399)
; 
; *CSHeavy4_4FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_4FrontWindRaw,0,370,391,589)
; 
; *CSHeavy4_8FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_8FrontWindRaw,0,193,299,529)
; 
; *CSHeavy4_9FrontWindRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*CSHeavy4_9FrontWindRaw,0,271,261,199)
; 
; *CSHeavy4_10FrontWindRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*CSHeavy4_10FrontWindRaw,0,354,265,48)
; createRawDataForArray(*CSHeavy4_10FrontWindRaw,1,340,204,17)

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

;----CSDeathNew
*CSDeathNewRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*CSDeathNewRaw,0,207,425,306)
createRawDataForArray(*CSDeathNewRaw,1,264,406,340)
createRawDataForArray(*CSDeathNewRaw,2,279,321,345)
createRawDataForArray(*CSDeathNewRaw,3,265,308,277)
createRawDataForArray(*CSDeathNewRaw,4,220,355,355)
createRawDataForArray(*CSDeathNewRaw,5,214,487,429)
createRawDataForArray(*CSDeathNewRaw,6,212,466,447)

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

;----CSSpawnNew
*CSSpawnNewRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*CSSpawnNewRaw,0 ,370,196,334)
createRawDataForArray(*CSSpawnNewRaw,1 ,378,207,363)
createRawDataForArray(*CSSpawnNewRaw,2 ,393,203,347)
createRawDataForArray(*CSSpawnNewRaw,3 ,360,199,363)
createRawDataForArray(*CSSpawnNewRaw,4 ,404,204,347)
createRawDataForArray(*CSSpawnNewRaw,5 ,429,220,354)
createRawDataForArray(*CSSpawnNewRaw,6 ,439,242,367)
createRawDataForArray(*CSSpawnNewRaw,7 ,428,238,334)
createRawDataForArray(*CSSpawnNewRaw,8 ,473,337,268)
createRawDataForArray(*CSSpawnNewRaw,9 ,442,231,293)
createRawDataForArray(*CSSpawnNewRaw,10,255,426,304)
createRawDataForArray(*CSSpawnNewRaw,11,264,372,336)
createRawDataForArray(*CSSpawnNewRaw,12,257,430,337)

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

;----CSJumpNew
*CSJumpNewRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*CSJumpNewRaw,0,267,430,306)
createRawDataForArray(*CSJumpNewRaw,1,333,428,334)
createRawDataForArray(*CSJumpNewRaw,2,375,390,330)
createRawDataForArray(*CSJumpNewRaw,3,242,368,334)
createRawDataForArray(*CSJumpNewRaw,4,272,348,348)
createRawDataForArray(*CSJumpNewRaw,5,292,328,346)

;----CSLandNew
*CSLandNewRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSLandNewRaw,0,256,469,327)
createRawDataForArray(*CSLandNewRaw,1,251,445,330)
createRawDataForArray(*CSLandNewRaw,2,242,437,332)

;----CSHitNew
*CSHitNewRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*CSHitNewRaw,0,307,314,328)
createRawDataForArray(*CSHitNewRaw,1,432,323,293)
createRawDataForArray(*CSHitNewRaw,2,454,339,225)

;----CSDodge
*CSDodgeRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*CSDodgeRaw,0,132,432,336)
createRawDataForArray(*CSDodgeRaw,1,98,442,345)
createRawDataForArray(*CSDodgeRaw,2,168,462,339)
createRawDataForArray(*CSDodgeRaw,3,228,494,354)

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

;----BPFrontNew
*BPFrontNewRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*BPFrontNewRaw,0,272,429,345)
createRawDataForArray(*BPFrontNewRaw,1,251,437,347)
createRawDataForArray(*BPFrontNewRaw,2,278,422,342)
createRawDataForArray(*BPFrontNewRaw,3,369,426,321)
createRawDataForArray(*BPFrontNewRaw,4,398,428,346)
createRawDataForArray(*BPFrontNewRaw,5,390,429,347)
createRawDataForArray(*BPFrontNewRaw,6,315,432,305)
createRawDataForArray(*BPFrontNewRaw,7,265,430,323)
createRawDataForArray(*BPFrontNewRaw,8,273,428,335)

;----BPMoveBack new
*BPMoveBackRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPMoveBackRaw,0,351,405,342)
createRawDataForArray(*BPMoveBackRaw,1,313,411,327)
createRawDataForArray(*BPMoveBackRaw,2,284,422,349)
createRawDataForArray(*BPMoveBackRaw,3,272,423,347)

;----BPNeutral1New
; *BPNeutral1NewRaw.rawdataArray=createRawDataArray(9)
; createRawDataForArray(*BPNeutral1NewRaw,0,360,288,316)
; createRawDataForArray(*BPNeutral1NewRaw,1,335,422,325)
; createRawDataForArray(*BPNeutral1NewRaw,2,171,428,347,168,517,622)
; createRawDataForArray(*BPNeutral1NewRaw,3,353,274,311,126,268,611)
; createRawDataForArray(*BPNeutral1NewRaw,4,401,356,243,359,248,238)
; createRawDataForArray(*BPNeutral1NewRaw,5,445,424,200)
; createRawDataForArray(*BPNeutral1NewRaw,6,437,440,241)
; createRawDataForArray(*BPNeutral1NewRaw,7,404,428,331)
; createRawDataForArray(*BPNeutral1NewRaw,8,241,395,314,213,387,456)
; createRawDataForArray(*BPNeutral1NewRaw,9,367,229,316,234,213,485)
; 
; *BPNeutral1_1WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_1WindBackRaw,0,354,280,449)
; 
; *BPNeutral1_2WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_2WindBackRaw,0,374,448,552)
; 
; *BPNeutral1_3WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_3WindBackRaw,0,164,431,558)
; 
; *BPNeutral1_4WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_4WindBackRaw,0,333,398,551)
; 
; *BPNeutral1_5WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_5WindBackRaw,0,131,206,235)
; 
; *BPNeutral1_6WindBackRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*BPNeutral1_6WindBackRaw,0,460,215,179)
; createRawDataForArray(*BPNeutral1_6WindBackRaw,1,768,293,159)
; 
; *BPNeutral1_10WindBackRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_10WindBackRaw,0,351,414,520)
; 
; ;front
; *BPNeutral1_1WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_1WindFrontRaw,0,304,268,440)
; 
; *BPNeutral1_2WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_2WindFrontRaw,0,321,262,391)
; 
; *BPNeutral1_3WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_3WindFrontRaw,0,166,274,397)
; 
; *BPNeutral1_4WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_4WindFrontRaw,0, 72,269,355)
; 
; *BPNeutral1_5WindFrontRaw.rawdataArray=createRawDataArray(1)
; createRawDataForArray(*BPNeutral1_5WindFrontRaw,0, 63,293,791)
; createRawDataForArray(*BPNeutral1_5WindFrontRaw,1, 39,313,894)
; 
; *BPNeutral1_7WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_7WindFrontRaw,0,430,316,204)
; 
; *BPNeutral1_8WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_8WindFrontRaw,0,392,332,175)
; 
; *BPNeutral1_9WindFrontRaw.rawdataArray=createRawDataArray(0)
; createRawDataForArray(*BPNeutral1_9WindFrontRaw,0,193,328,180)
; 
; *BPNeutral1_10WindFrontRaw.rawdataArray=createRawDataArray(2)
; createRawDataForArray(*BPNeutral1_10WindFrontRaw,0,171,207,279)
; createRawDataForArray(*BPNeutral1_10WindFrontRaw,1,120,186,452)
; createRawDataForArray(*BPNeutral1_10WindFrontRaw,2, 88,147,435)

;----BPNeutral1 newer
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
; *BPneutral2Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*BPneutral2Raw,0,236,358,327,231,357,561)
; createRawDataForArray(*BPneutral2Raw,1,246,359,345,230,467,593)
; createRawDataForArray(*BPneutral2Raw,2,244,263,324)
; createRawDataForArray(*BPneutral2Raw,3,203,256,328,200,252,422)
; createRawDataForArray(*BPneutral2Raw,4,187,254,295,181,385,684)
; createRawDataForArray(*BPneutral2Raw,5,185,256,295)
; createRawDataForArray(*BPneutral2Raw,6,184,292,295)
; createRawDataForArray(*BPneutral2Raw,7,196,426,295)

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
createRawDataForArray(*BPNeutral2_4WindFrontRaw,0,12,89,263)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,1,35,128,231)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,2,13,145,677)
createRawDataForArray(*BPNeutral2_4WindFrontRaw,3,1,443,768)

;----BPNeutral3
; *BPneutral3Raw.rawdataArray=createRawDataArray(6)
; createRawDataForArray(*BPneutral3Raw,0,199,430,313)
; createRawDataForArray(*BPneutral3Raw,1,202,378,335)
; createRawDataForArray(*BPneutral3Raw,2,248,378,338,257,396,623)
; createRawDataForArray(*BPneutral3Raw,3,212,389,314,212,419,662)
; createRawDataForArray(*BPneutral3Raw,4,202,403,314,203,469,767)
; createRawDataForArray(*BPneutral3Raw,5,186,404,314,187,481,781)
; createRawDataForArray(*BPneutral3Raw,6,212,417,314)
*BPNeutral3Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3Raw,0,212,390,397)
createRawDataForArray(*BPNeutral3Raw,1,335,380,365)
createRawDataForArray(*BPNeutral3Raw,2,194,424,370,192,375,483)

*BPNeutral3_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPNeutral3_1WindFrontRaw,0,69,380,398)

*BPNeutral3_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,0,52,360,343)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,1,219,317,290)
createRawDataForArray(*BPNeutral3_2WindFrontRaw,2,649,340,273)

*BPNeutral3_3WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,0,157,324,322)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,1,126,303,514)
createRawDataForArray(*BPNeutral3_3WindFrontRaw,2,87,398,571)


;----BPNeutral4
; *BPNeutral4Raw.rawdataArray=createRawDataArray(6)
; createRawDataForArray(*BPNeutral4Raw,0,198,415,339)
; createRawDataForArray(*BPNeutral4Raw,1,199,428,339)
; createRawDataForArray(*BPNeutral4Raw,2,304,234,316)
; createRawDataForArray(*BPNeutral4Raw,3,207,216,313,204,212,457)
; createRawDataForArray(*BPNeutral4Raw,4,207,217,340,201,446,615)
; createRawDataForArray(*BPNeutral4Raw,5,207,232,340)
; createRawDataForArray(*BPNeutral4Raw,6,297,433,340)
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
; *BPNeutral5Raw.rawdataArray=createRawDataArray(3)
; createRawDataForArray(*BPNeutral5Raw,0,358,265,282,356,472,463)
; createRawDataForArray(*BPNeutral5Raw,1,291,268,269,288,448,535)
; createRawDataForArray(*BPNeutral5Raw,2,307,268,252,306,465,620)
; createRawDataForArray(*BPNeutral5Raw,3,307,282,315)
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

;----BPSide1New
*BPSide1NewRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPSide1NewRaw,0,373,326,314)
createRawDataForArray(*BPSide1NewRaw,1,200,421,325,205,342,442)
createRawDataForArray(*BPSide1NewRaw,2,232,389,328,224,405,619)
createRawDataForArray(*BPSide1NewRaw,3,416,363,329,274,359,539)

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

;----BPSide2New
*BPSide2NewRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPSide2NewRaw,0,197,380,340,189,355,530)
createRawDataForArray(*BPSide2NewRaw,1,375,392,316,216,389,289)
createRawDataForArray(*BPSide2NewRaw,2,380,312,328)
createRawDataForArray(*BPSide2NewRaw,3,387,248,327,385,231,290)
createRawDataForArray(*BPSide2NewRaw,4,224,367,337,215,203,543)

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

;----BPSide3New
*BPSide3NewRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPSide3NewRaw,0,261,365,352)
createRawDataForArray(*BPSide3NewRaw,1,275,395,339)
createRawDataForArray(*BPSide3NewRaw,2,293,312,272)
createRawDataForArray(*BPSide3NewRaw,3,227,406,340,225,405,634)
createRawDataForArray(*BPSide3NewRaw,4,215,355,348,214,445,616)
createRawDataForArray(*BPSide3NewRaw,5,203,405,314,200,436,655)
createRawDataForArray(*BPSide3NewRaw,6,216,352,356,215,409,677)

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
; *BPSide4Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*BPSide4Raw,0,330,240,328)
; createRawDataForArray(*BPSide4Raw,1,345,240,340,343,240,392)
; createRawDataForArray(*BPSide4Raw,2,268,250,340,258,340,583)
; createRawDataForArray(*BPSide4Raw,3,264,257,324,267,491,561)
; createRawDataForArray(*BPSide4Raw,4,341,307,327,383,503,485)
; createRawDataForArray(*BPSide4Raw,5,341,365,327)
; createRawDataForArray(*BPSide4Raw,6,394,403,327)
; createRawDataForArray(*BPSide4Raw,7,461,403,327)
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


; *BPSide5Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*BPSide5Raw,0,334,422,309)
; createRawDataForArray(*BPSide5Raw,1,385,415,307,448,470,303)
; createRawDataForArray(*BPSide5Raw,2,297,382,310,293,450,553)
; createRawDataForArray(*BPSide5Raw,3,141,343,309,138,414,626)
; createRawDataForArray(*BPSide5Raw,4,142,331,347,140,347,623)
; createRawDataForArray(*BPSide5Raw,5,144,331,347)
; createRawDataForArray(*BPSide5Raw,6,153,331,347)
; createRawDataForArray(*BPSide5Raw,7,269,331,347)
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

;----BPUp1New
*BPUp1NewRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPUp1NewRaw,0,425,337,333)
createRawDataForArray(*BPUp1NewRaw,1,386,437,341,465,338,362)
createRawDataForArray(*BPUp1NewRaw,2,289,388,345,290,434,485)
createRawDataForArray(*BPUp1NewRaw,3,475,116,359,292,116,475)

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

*BPUp2_1FrontWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_1FrontWindRaw,0,326,189,477)

*BPUp2_2BackWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_2BackWindRaw,0,324,196,306)

*BPUp2_3BackWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_3BackWindRaw,0,336,197,280)

*BPUp2_4BackWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_4BackWindRaw,0,421,365,281)

*BPUp2_4FrontWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPUp2_4FrontWindRaw,0,274,325,288)

*BPUp2_5FrontWindRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPUp2_5FrontWindRaw,0,232,237,283)
createRawDataForArray(*BPUp2_5FrontWindRaw,1,262,234,561)
createRawDataForArray(*BPUp2_5FrontWindRaw,2,298,240,531)

;----UAUp3
*UAUp3Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAUp3Raw,0,366,382,340,365,428,449)
createRawDataForArray(*UAUp3Raw,1,365,348,364,344,349,529)
createRawDataForArray(*UAUp3Raw,2,415,295,377,374,293,438)
createRawDataForArray(*UAUp3Raw,3,408,254,357,459,247,366)
createRawDataForArray(*UAUp3Raw,4,398,307,390)

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

; *BPDown2Raw.rawdataArray=createRawDataArray(5)
; createRawDataForArray(*BPDown2Raw,0,372,225,318)
; createRawDataForArray(*BPDown2Raw,1,386,226,285)
; createRawDataForArray(*BPDown2Raw,2,346,288,280,350,423,570)
; createRawDataForArray(*BPDown2Raw,3,308,422,261,307,424,609)
; createRawDataForArray(*BPDown2Raw,4,308,422,258,306,454,648)
; createRawDataForArray(*BPDown2Raw,5,327,422,318)

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

;----BPBack2New
*BPBack2NewRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*BPBack2NewRaw,0,493,276,346)
createRawDataForArray(*BPBack2NewRaw,1,448,215,357)
createRawDataForArray(*BPBack2NewRaw,2,314,278,345,309,236,421)
createRawDataForArray(*BPBack2NewRaw,3,208,385,332,202,293,611)
createRawDataForArray(*BPBack2NewRaw,4,245,383,349,173,446,625)
createRawDataForArray(*BPBack2NewRaw,5,272,398,316,255,542,650)

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
; *BPBack3Raw.rawdataArray=createRawDataArray(7)
; createRawDataForArray(*BPBack3Raw,0,304,341,321)
; createRawDataForArray(*BPBack3Raw,1,332,247,329,422,242,416)
; createRawDataForArray(*BPBack3Raw,2,186,242,269,175,241,614)
; createRawDataForArray(*BPBack3Raw,3,140,238,325,131,451,680)
; createRawDataForArray(*BPBack3Raw,4,108,239,326,122,519,651)
; createRawDataForArray(*BPBack3Raw,5,108,252,326)
; createRawDataForArray(*BPBack3Raw,6,109,253,326)
; createRawDataForArray(*BPBack3Raw,7,237,431,326)
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

*BPBack4_2BackWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_2BackWindRaw,0,211,442,543)

*BPBack4_3BackWindRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPBack4_3BackWindRaw,0,194,419,369)
createRawDataForArray(*BPBack4_3BackWindRaw,1,178,381,588)

*BPBack4_4BackWindRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPBack4_4BackWindRaw,0,330,347,292)
createRawDataForArray(*BPBack4_4BackWindRaw,1,698,362,229)

*BPBack4_5BackWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_5BackWindRaw,0,394,480,467)

*BPBack4_5FrontWindRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPBack4_5FrontWindRaw,0,239,238,297)

*BPBack4_6FrontWindRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPBack4_6FrontWindRaw,0,210,233,337)
createRawDataForArray(*BPBack4_6FrontWindRaw,1,207,221,524)
createRawDataForArray(*BPBack4_6FrontWindRaw,2,239,307,608)

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

;----BPHitNew
*BPHitNewRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPHitNewRaw,0,480,348,278)
createRawDataForArray(*BPHitNewRaw,1,431,370,303)
createRawDataForArray(*BPHitNewRaw,2,387,378,346)

;----BPDeathNew
*BPDeathNewRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*BPDeathNewRaw,0,182,367,334)
createRawDataForArray(*BPDeathNewRaw,1,157,346,302)
createRawDataForArray(*BPDeathNewRaw,2,259,310,269)
createRawDataForArray(*BPDeathNewRaw,3,228,317,183)
createRawDataForArray(*BPDeathNewRaw,4,249,372,86 )
createRawDataForArray(*BPDeathNewRaw,5,242,495,37 )
createRawDataForArray(*BPDeathNewRaw,6,245,505,34 )
createRawDataForArray(*BPDeathNewRaw,7,254,484,51 )
createRawDataForArray(*BPDeathNewRaw,8,242,505,34 )

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
createRawDataForArray(*BPDeath5WindFrontRaw,0,216,291,66 )

*BPDeath6_1WindFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*BPDeath6_1WindFrontRaw,0,546,279,3  )
createRawDataForArray(*BPDeath6_1WindFrontRaw,1,570,268,60 )
createRawDataForArray(*BPDeath6_1WindFrontRaw,2,796,423,42 )
createRawDataForArray(*BPDeath6_1WindFrontRaw,3,923,523,12 )
createRawDataForArray(*BPDeath6_1WindFrontRaw,4,860,543,31 )

*BPDeath6_2WindFrontRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDeath6_2WindFrontRaw,0,678,559,48 )
createRawDataForArray(*BPDeath6_2WindFrontRaw,1,486,454,41 )
createRawDataForArray(*BPDeath6_2WindFrontRaw,2,466,431,14 )

*BPDeath6_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath6_3WindFrontRaw,0,201,372,698)

*BPDeath7WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*BPDeath7WindFrontRaw,0,239,519,693)

*BPDeath8WindFrontRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*BPDeath8WindFrontRaw,0,236,546,686)
createRawDataForArray(*BPDeath8WindFrontRaw,1,222,540,667)

;----BPSpawnNew
*BPSpawnNewRaw.rawdataArray=createRawDataArray(11)
createRawDataForArray(*BPSpawnNewRaw,0 ,409,418,336)
createRawDataForArray(*BPSpawnNewRaw,1 ,402,433,345)
createRawDataForArray(*BPSpawnNewRaw,2 ,412,434,288)
createRawDataForArray(*BPSpawnNewRaw,3 ,462,429,224)
createRawDataForArray(*BPSpawnNewRaw,4 ,527,394,191)
createRawDataForArray(*BPSpawnNewRaw,5 ,458,404,294)
createRawDataForArray(*BPSpawnNewRaw,6 ,422,367,306)
createRawDataForArray(*BPSpawnNewRaw,7 ,382,352,313)
createRawDataForArray(*BPSpawnNewRaw,8 ,349,287,316)
createRawDataForArray(*BPSpawnNewRaw,9 ,367,284,342)
createRawDataForArray(*BPSpawnNewRaw,10,301,310,343)
createRawDataForArray(*BPSpawnNewRaw,11,181,407,298)

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

;----BPJumpNew
*BPJumpNewRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*BPJumpNewRaw,0,377,341,341)
createRawDataForArray(*BPJumpNewRaw,1,367,322,325)
createRawDataForArray(*BPJumpNewRaw,2,406,289,344)
createRawDataForArray(*BPJumpNewRaw,3,362,244,271)
createRawDataForArray(*BPJumpNewRaw,4,431,210,345)
createRawDataForArray(*BPJumpNewRaw,5,401,169,353)
createRawDataForArray(*BPJumpNewRaw,6,377,229,345)

;----BPLandNew
*BPLandNewRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*BPLandNewRaw,0,387,258,329)
createRawDataForArray(*BPLandNewRaw,1,319,424,332)
createRawDataForArray(*BPLandNewRaw,2,346,428,327)
createRawDataForArray(*BPLandNewRaw,3,234,360,332)

;----BPDodge
*BPDodgeRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*BPDodgeRaw,0,196,427,334)
createRawDataForArray(*BPDodgeRaw,1,198,398,351)
createRawDataForArray(*BPDodgeRaw,2,223,333,338)

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

;----UASide1 new
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
*UASide5Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*UASide5Raw,0,382,406,314)
createRawDataForArray(*UASide5Raw,1,273,413,333,273,455,451)
createRawDataForArray(*UASide5Raw,2,291,439,358,273,474,627)

*UASide5_2WindFrontRaw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*UASide5_2WindFrontRaw,0,236,378,316)
createRawDataForArray(*UASide5_2WindFrontRaw,1,204,333,499)
createRawDataForArray(*UASide5_2WindFrontRaw,2,155,373,627)
createRawDataForArray(*UASide5_2WindFrontRaw,3,115,418,765)

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


;----UABack1New
*UABack1NewRaw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*UABack1NewRaw,0,425,393,339)
createRawDataForArray(*UABack1NewRaw,1,442,408,348)
createRawDataForArray(*UABack1NewRaw,2,456,376,366)
createRawDataForArray(*UABack1NewRaw,3,452,378,356)
createRawDataForArray(*UABack1NewRaw,4,438,391,292)
createRawDataForArray(*UABack1NewRaw,5,453,411,267)
createRawDataForArray(*UABack1NewRaw,6,442,372,370,441,370,237)
createRawDataForArray(*UABack1NewRaw,7,397,399,350,396,354,464)
createRawDataForArray(*UABack1NewRaw,8,351,449,349,349,364,516)
createRawDataForArray(*UABack1NewRaw,9,413,398,338)

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
*UAUp2Raw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*UAUp2Raw,0 ,410,331,284)
createRawDataForArray(*UAUp2Raw,1 ,405,335,319)
createRawDataForArray(*UAUp2Raw,2 ,413,460,329)
createRawDataForArray(*UAUp2Raw,3 ,399,410,344)
createRawDataForArray(*UAUp2Raw,4 ,385,431,343)
createRawDataForArray(*UAUp2Raw,5 ,391,438,339)
createRawDataForArray(*UAUp2Raw,6 ,408,424,327)
createRawDataForArray(*UAUp2Raw,7 ,397,361,330)
createRawDataForArray(*UAUp2Raw,8 ,389,378,344,403,456,528)
createRawDataForArray(*UAUp2Raw,9 ,339,413,357,345,480,552)
createRawDataForArray(*UAUp2Raw,10,301,413,321,314,485,561)
createRawDataForArray(*UAUp2Raw,11,288,415,321)
createRawDataForArray(*UAUp2Raw,12,317,427,321)

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
*UAHitNewRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*UAHitNewRaw,0,441,324,324)
createRawDataForArray(*UAHitNewRaw,1,354,437,343)
createRawDataForArray(*UAHitNewRaw,2,454,351,287)
createRawDataForArray(*UAHitNewRaw,3,415,404,325)
createRawDataForArray(*UAHitNewRaw,4,377,369,368)

;----UASpawnNew
*UASpawnNewRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*UASpawnNewRaw, 0,448,421,337)
createRawDataForArray(*UASpawnNewRaw, 2,443,410,339)
createRawDataForArray(*UASpawnNewRaw, 1,448,424,343)
createRawDataForArray(*UASpawnNewRaw, 3,443,367,327)
createRawDataForArray(*UASpawnNewRaw, 4,427,364,330)
createRawDataForArray(*UASpawnNewRaw, 5,419,309,325)
createRawDataForArray(*UASpawnNewRaw, 6,419,340,321)
createRawDataForArray(*UASpawnNewRaw, 7,364,353,309)
createRawDataForArray(*UASpawnNewRaw, 8,435,354,317)
createRawDataForArray(*UASpawnNewRaw, 9,439,377,310)
createRawDataForArray(*UASpawnNewRaw,10,437,385,327)
createRawDataForArray(*UASpawnNewRaw,11,434,381,321)
createRawDataForArray(*UASpawnNewRaw,12,433,384,339)

*UASpawn1_13WindFrontRaw.rawdataArray=createRawDataArray(12)
createRawDataForArray(*UASpawn1_13WindFrontRaw,0,436,413,324)
createRawDataForArray(*UASpawn1_13WindFrontRaw,1,409,443,492)

;----UADeath
; *UADeathRaw.rawdataArray=createRawDataArray(17)
; createRawDataForArray(*UADeathRaw,0 ,448,348,331)
; createRawDataForArray(*UADeathRaw,1 ,396,390,368)
; createRawDataForArray(*UADeathRaw,2 ,356,407,419)
; createRawDataForArray(*UADeathRaw,3 ,362,370,395)
; createRawDataForArray(*UADeathRaw,4 ,384,346,380)
; createRawDataForArray(*UADeathRaw,5 ,378,311,369)
; createRawDataForArray(*UADeathRaw,6 ,455,283,324)
; createRawDataForArray(*UADeathRaw,7 ,532,290,183)
; createRawDataForArray(*UADeathRaw,8 ,541,323,183)
; createRawDataForArray(*UADeathRaw,9 ,553,276,243)
; createRawDataForArray(*UADeathRaw,10,385,262,281)
; createRawDataForArray(*UADeathRaw,11,213,265,279)
; createRawDataForArray(*UADeathRaw,12,92,269,428)
; createRawDataForArray(*UADeathRaw,13,75,371,488)
; createRawDataForArray(*UADeathRaw,14,52,513,453)
; createRawDataForArray(*UADeathRaw,15,49,505,447)
; createRawDataForArray(*UADeathRaw,16,147,530,516)
; createRawDataForArray(*UADeathRaw,17,166,530,545)

;----UADeathNew
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


;----UAJump new
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

;----PSIdle
*PSIdleRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*PSIdleRaw,0,368,354,285)
createRawDataForArray(*PSIdleRaw,1,365,355,324)
createRawDataForArray(*PSIdleRaw,2,357,356,318)
createRawDataForArray(*PSIdleRaw,3,355,374,321)
createRawDataForArray(*PSIdleRaw,4,366,368,294)

;----PSFront
*PSFrontRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*PSFrontRaw,0,342,356,333)
createRawDataForArray(*PSFrontRaw,1,359,359,335)
createRawDataForArray(*PSFrontRaw,2,365,361,343)
createRawDataForArray(*PSFrontRaw,3,358,360,328)
createRawDataForArray(*PSFrontRaw,4,348,352,330)

;----PSBack
*PSBackRaw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*PSBackRaw,0,245,399,335)
createRawDataForArray(*PSBackRaw,1,247,411,321)
createRawDataForArray(*PSBackRaw,2,239,410,310)
createRawDataForArray(*PSBackRaw,3,250,397,334)
createRawDataForArray(*PSBackRaw,4,279,396,335)
createRawDataForArray(*PSBackRaw,5,252,408,332)

;----PSNeutral1
*PSNeutral1Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*PSNeutral1Raw,0,361,334,333)
createRawDataForArray(*PSNeutral1Raw,1,354,314,325,382,313,487)
createRawDataForArray(*PSNeutral1Raw,2,276,321,336,276,316,598)
createRawDataForArray(*PSNeutral1Raw,3,231,322,322,230,400,669)
createRawDataForArray(*PSNeutral1Raw,4,232,337,326)
createRawDataForArray(*PSNeutral1Raw,5,237,339,333)

;----PSSide1
*PSSide1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*PSSide1Raw,0,366,335,318)
createRawDataForArray(*PSSide1Raw,1,349,314,323)
createRawDataForArray(*PSSide1Raw,2,337,305,319)
createRawDataForArray(*PSSide1Raw,3,359,304,328,382,424,482)
createRawDataForArray(*PSSide1Raw,4,267,306,330,264,490,585)
createRawDataForArray(*PSSide1Raw,5,225,358,304,224,446,685)
createRawDataForArray(*PSSide1Raw,6,224,384,304)
createRawDataForArray(*PSSide1Raw,7,225,384,304)

;----PSJump
*PSJumpRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*PSJumpRaw,0,379,350,324)
createRawDataForArray(*PSJumpRaw,1,299,427,286)
createRawDataForArray(*PSJumpRaw,2,329,427,316)
createRawDataForArray(*PSJumpRaw,3,365,380,329)
createRawDataForArray(*PSJumpRaw,4,349,340,333)

;----PSDeath
*PSDeathRaw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*PSDeathRaw,0,363,321,312)
createRawDataForArray(*PSDeathRaw,1,321,321,322)
createRawDataForArray(*PSDeathRaw,2,213,362,333)
createRawDataForArray(*PSDeathRaw,3,207,425,361)
createRawDataForArray(*PSDeathRaw,4,185,472,381)
createRawDataForArray(*PSDeathRaw,5,174,483,357)
createRawDataForArray(*PSDeathRaw,6,229,513,356)
createRawDataForArray(*PSDeathRaw,7,295,513,356)

;----PSHit
*PSHitRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*PSHitRaw,0,355,368,340)
createRawDataForArray(*PSHitRaw,1,456,415,343)
createRawDataForArray(*PSHitRaw,2,346,365,322)
createRawDataForArray(*PSHitRaw,3,334,440,310)
createRawDataForArray(*PSHitRaw,4,438,400,302)

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

;----GSFront
*GSFrontRaw.rawdataArray=createRawDataArray(15)
createRawDataForArray(*GSFrontRaw,0,414,372,286)
createRawDataForArray(*GSFrontRaw,1,413,374,332)
createRawDataForArray(*GSFrontRaw,2,421,385,335)
createRawDataForArray(*GSFrontRaw,3,380,402,337)
createRawDataForArray(*GSFrontRaw,4,368,387,349)
createRawDataForArray(*GSFrontRaw,5,382,387,349)
createRawDataForArray(*GSFrontRaw,6,380,402,337)
createRawDataForArray(*GSFrontRaw,7,421,417,335)
createRawDataForArray(*GSFrontRaw,8,413,388,332)
createRawDataForArray(*GSFrontRaw,9,414,370,329)
createRawDataForArray(*GSFrontRaw,10,430,379,306)
createRawDataForArray(*GSFrontRaw,11,418,374,320)
createRawDataForArray(*GSFrontRaw,12,414,347,301)
createRawDataForArray(*GSFrontRaw,13,414,356,312)
createRawDataForArray(*GSFrontRaw,14,418,351,275)
createRawDataForArray(*GSFrontRaw,15,430,364,303)

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
; *GSBackRaw.rawdataArray=createRawDataArray(6)
; createRawDataForArray(*GSBackRaw,0,410,394,317)
; createRawDataForArray(*GSBackRaw,1,392,381,315)
; createRawDataForArray(*GSBackRaw,2,408,384,294)
; createRawDataForArray(*GSBackRaw,3,432,388,306)
; createRawDataForArray(*GSBackRaw,4,432,388,306)
; createRawDataForArray(*GSBackRaw,5,414,384,294)
; createRawDataForArray(*GSBackRaw,6,417,381,315)

;----truc
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
; *GSSpawnRaw.rawdataArray=createRawDataArray(15)
; createRawDataForArray(*GSSpawnRaw,0 ,348,402,349)
; createRawDataForArray(*GSSpawnRaw,1 ,339,397,352)
; createRawDataForArray(*GSSpawnRaw,2 ,345,411,352)
; createRawDataForArray(*GSSpawnRaw,3 ,348,420,351)
; createRawDataForArray(*GSSpawnRaw,4 ,333,429,351)
; createRawDataForArray(*GSSpawnRaw,5 ,356,429,351)
; createRawDataForArray(*GSSpawnRaw,6 ,247,432,347)
; createRawDataForArray(*GSSpawnRaw,7 ,247,404,347)
; createRawDataForArray(*GSSpawnRaw,8 ,201,399,335)
; createRawDataForArray(*GSSpawnRaw,9 ,201,381,360)
; createRawDataForArray(*GSSpawnRaw,10,200,388,332)
; createRawDataForArray(*GSSpawnRaw,11,217,389,332)
; createRawDataForArray(*GSSpawnRaw,12,285,393,373)
; createRawDataForArray(*GSSpawnRaw,13,328,383,365)
; createRawDataForArray(*GSSpawnRaw,14,398,386,354)
; createRawDataForArray(*GSSpawnRaw,15,425,393,315)

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
; *GSDeathRaw.rawdataArray=createRawDataArray(11)
; createRawDataForArray(*GSDeathRaw,0 ,403,372,345)
; createRawDataForArray(*GSDeathRaw,1 ,347,383,356)
; createRawDataForArray(*GSDeathRaw,2 ,348,392,332)
; createRawDataForArray(*GSDeathRaw,3 ,316,349,306)
; createRawDataForArray(*GSDeathRaw,4 ,232,340,222)
; createRawDataForArray(*GSDeathRaw,5 ,185,343,209)
; createRawDataForArray(*GSDeathRaw,6 ,146,356,194)
; createRawDataForArray(*GSDeathRaw,7 ,63 ,416,156)
; createRawDataForArray(*GSDeathRaw,8 ,29 ,430,131)
; createRawDataForArray(*GSDeathRaw,9 ,22 ,473,104)
; createRawDataForArray(*GSDeathRaw,10,53 ,469,94 )
; createRawDataForArray(*GSDeathRaw,11,215,509,179)

;----GSDeath new
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
; createRawDataForArray(*GSHitRaw,0,439,408,337)
; createRawDataForArray(*GSHitRaw,1,453,374,276)
; createRawDataForArray(*GSHitRaw,2,365,394,363)
; createRawDataForArray(*GSHitRaw,3,395,423,329)
; createRawDataForArray(*GSHitRaw,4,370,345,292)
; createRawDataForArray(*GSHitRaw,5,428,359,340)
; createRawDataForArray(*GSHitRaw,6,412,387,301)

createRawDataForArray(*GSHitRaw,0,439,409,337)
createRawDataForArray(*GSHitRaw,1,454,374,276)
createRawDataForArray(*GSHitRaw,2,365,394,371)
createRawDataForArray(*GSHitRaw,3,395,423,345)
createRawDataForArray(*GSHitRaw,4,372,344,291)
createRawDataForArray(*GSHitRaw,5,427,359,338)
createRawDataForArray(*GSHitRaw,6,412,388,301)

;----GSJump
*GSJumpRaw.rawdataArray=createRawDataArray(6)
; createRawDataForArray(*GSJumpRaw,0,436,394,312)
; createRawDataForArray(*GSJumpRaw,1,459,371,338)
; createRawDataForArray(*GSJumpRaw,2,437,380,347)
; createRawDataForArray(*GSJumpRaw,3,413,410,358)
; createRawDataForArray(*GSJumpRaw,4,428,374,332)
; createRawDataForArray(*GSJumpRaw,5,455,390,297)
; createRawDataForArray(*GSJumpRaw,6,433,340,355)
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

;----GSNeutral1New
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

;----GSNeutral2New
*GSNeutral2NewRaw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSNeutral2NewRaw,0,434,383,337)
createRawDataForArray(*GSNeutral2NewRaw,1,463,394,255)
createRawDataForArray(*GSNeutral2NewRaw,2,445,354,333,566,348,247)
createRawDataForArray(*GSNeutral2NewRaw,3,347,438,325,335,345,335)
createRawDataForArray(*GSNeutral2NewRaw,4,330,419,327)

*GSNeutral2NewBackWind2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSNeutral2NewBackWind2Raw,0,427,378,246)
createRawDataForArray(*GSNeutral2NewBackWind2Raw,1,635,392,214)
createRawDataForArray(*GSNeutral2NewBackWind2Raw,2,759,420,196)

*GSNeutral2NewFrontWind2Raw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSNeutral2NewFrontWind2Raw,0,421,376,311)
createRawDataForArray(*GSNeutral2NewFrontWind2Raw,1,426,363,296)

*GSNeutral2NewFrontWind3Raw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSNeutral2NewFrontWind3Raw,0,435,332,215)

*GSNeutral2NewFrontWind4Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSNeutral2NewFrontWind4Raw,0,328,325,172)
createRawDataForArray(*GSNeutral2NewFrontWind4Raw,1,301,292,230)
createRawDataForArray(*GSNeutral2NewFrontWind4Raw,2,256,280,226)
createRawDataForArray(*GSNeutral2NewFrontWind4Raw,3,231,434,616)

;----GSNeutral3
*GSNeutral3Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSNeutral3Raw,0,305,329,345)
createRawDataForArray(*GSNeutral3Raw,1,298,344,355)
createRawDataForArray(*GSNeutral3Raw,2,311,258,354,316,267,409)
createRawDataForArray(*GSNeutral3Raw,3,264,262,344,267,314,587)
createRawDataForArray(*GSNeutral3Raw,4,266,261,346,309,360,470)
createRawDataForArray(*GSNeutral3Raw,5,270,260,339,293,413,564)
createRawDataForArray(*GSNeutral3Raw,6,291,368,339)
createRawDataForArray(*GSNeutral3Raw,7,291,384,339)
createRawDataForArray(*GSNeutral3Raw,8,358,402,339)

;----GSNeutral4
*GSNeutral4Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSNeutral4Raw,0,292,414,342)
createRawDataForArray(*GSNeutral4Raw,1,308,403,276)
createRawDataForArray(*GSNeutral4Raw,2,383,347,344)
createRawDataForArray(*GSNeutral4Raw,3,212,148,349,211,149,506)
createRawDataForArray(*GSNeutral4Raw,4,187,104,356,201,259,603)
createRawDataForArray(*GSNeutral4Raw,5,172,267,334,284,328,399)
createRawDataForArray(*GSNeutral4Raw,6,313,380,329)

;----GSNeutral5
*GSNeutral5Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSNeutral5Raw,0,405,384,322)
createRawDataForArray(*GSNeutral5Raw,1,9,388,336,4,451,500)
createRawDataForArray(*GSNeutral5Raw,2,4,398,343,4,442,569)
createRawDataForArray(*GSNeutral5Raw,3,1,404,334,1,440,577)
createRawDataForArray(*GSNeutral5Raw,4,5,311,347,48,522,608)
createRawDataForArray(*GSNeutral5Raw,5,34,306,338)
createRawDataForArray(*GSNeutral5Raw,6,321,309,344)
createRawDataForArray(*GSNeutral5Raw,7,340,365,337)

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
*GSSide2Raw.rawdataArray=createRawDataArray(4)
createRawDataForArray(*GSSide2Raw,0,300,352,356)
createRawDataForArray(*GSSide2Raw,1,386,369,362)
createRawDataForArray(*GSSide2Raw,2,362,296,350)
createRawDataForArray(*GSSide2Raw,3,267,441,343,210,213,441)
createRawDataForArray(*GSSide2Raw,4,202,442,290)

*GSSide2_1WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_1WindFrontRaw,0,275,334,476)

*GSSide2_2WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_2WindFrontRaw,0,219,329,450)

*GSSide2_3WindFrontRaw.rawdataArray=createRawDataArray(0)
createRawDataForArray(*GSSide2_3WindFrontRaw,0,176,244,318)

*GSSide2_4WindFront1Raw.rawdataArray=createRawDataArray(3)
createRawDataForArray(*GSSide2_4WindFront1Raw,0,145,189,236)
createRawDataForArray(*GSSide2_4WindFront1Raw,1,108,148,196)
createRawDataForArray(*GSSide2_4WindFront1Raw,2,67,166,522)
createRawDataForArray(*GSSide2_4WindFront1Raw,3,63,342,779)

*GSSide2_4WindFront2Raw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*GSSide2_4WindFront2Raw,0,187,540,612)
createRawDataForArray(*GSSide2_4WindFront2Raw,1,110,461,633)
createRawDataForArray(*GSSide2_4WindFront2Raw,2,47,390,612)

;----GSSide3
*GSSide3Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSSide3Raw,0,265,429,313)
createRawDataForArray(*GSSide3Raw,1,269,264,329)
createRawDataForArray(*GSSide3Raw,2,249,301,308)
createRawDataForArray(*GSSide3Raw,3,333,306,280,389,415,280)
createRawDataForArray(*GSSide3Raw,4,265,335,228,276,460,556)
createRawDataForArray(*GSSide3Raw,5,312,336,214,332,414,530)
createRawDataForArray(*GSSide3Raw,6,281,378,232)
createRawDataForArray(*GSSide3Raw,7,276,378,326)
createRawDataForArray(*GSSide3Raw,8,388,378,326)

;----GSSide4
*GSSide4Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSSide4Raw,0,403,372,231)
createRawDataForArray(*GSSide4Raw,1,391,407,324)
createRawDataForArray(*GSSide4Raw,2,53 ,426,341,54 ,452,618)
createRawDataForArray(*GSSide4Raw,3,17 ,431,346,20,551,613)
createRawDataForArray(*GSSide4Raw,4,9  ,435,357,8  ,573,633)
createRawDataForArray(*GSSide4Raw,5,6  ,393,349,42 ,393,626)
createRawDataForArray(*GSSide4Raw,6,131,419,349)
createRawDataForArray(*GSSide4Raw,7,285,401,330)

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

;----GSBack1
; *GSBack1Raw.rawdataArray=createRawDataArray(10)
; createRawDataForArray(*GSBack1Raw,0 ,381,390,282)
; createRawDataForArray(*GSBack1Raw,1 ,336,388,291)
; createRawDataForArray(*GSBack1Raw,2 ,308,393,320)
; createRawDataForArray(*GSBack1Raw,3 ,136,419,320,159,561,644)
; createRawDataForArray(*GSBack1Raw,4 ,44 ,423,317,89 ,564,718)
; createRawDataForArray(*GSBack1Raw,5 ,12 ,433,320,45 ,573,814)
; createRawDataForArray(*GSBack1Raw,6 ,0  ,433,320)
; createRawDataForArray(*GSBack1Raw,7 ,320,358,313)
; createRawDataForArray(*GSBack1Raw,8 ,309,367,313)
; createRawDataForArray(*GSBack1Raw,9 ,398,367,313)
; createRawDataForArray(*GSBack1Raw,10,398,367,313)

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

*GSExplosion1Raw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*GSExplosion1Raw,0,126,554,644,148,569,646)
createRawDataForArray(*GSExplosion1Raw,1, 79,545,617,117,556,618)
createRawDataForArray(*GSExplosion1Raw,2, 85,428,473,130,563,674)
createRawDataForArray(*GSExplosion1Raw,3,111,486,551,122,518,677)
createRawDataForArray(*GSExplosion1Raw,4, 44,466,564)
createRawDataForArray(*GSExplosion1Raw,5, 19,450,611)
createRawDataForArray(*GSExplosion1Raw,6, 21,451,597)

;----GSBack2
*GSBack2Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSBack2Raw,0,310,428,326)
createRawDataForArray(*GSBack2Raw,1,223,426,326)
createRawDataForArray(*GSBack2Raw,2,113,398,348,181,433,662)
createRawDataForArray(*GSBack2Raw,3, 23,269,342,140,449,739)
createRawDataForArray(*GSBack2Raw,4, 54,325,320)
createRawDataForArray(*GSBack2Raw,5, 20,361,312)
createRawDataForArray(*GSBack2Raw,6,405,358,305)
createRawDataForArray(*GSBack2Raw,7,433,403,340)

;----GSDown1
*GSDown1Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*GSDown1Raw,0 ,442,314,308)
createRawDataForArray(*GSDown1Raw,1 ,297,342,264)
createRawDataForArray(*GSDown1Raw,2 ,295,307,292)
createRawDataForArray(*GSDown1Raw,3 ,279,295,276)
createRawDataForArray(*GSDown1Raw,4 ,279,363,336,323,570,593)
createRawDataForArray(*GSDown1Raw,5 ,249,301,325,331,673,588)
createRawDataForArray(*GSDown1Raw,6 ,213,312,336,262,646-40,521)
createRawDataForArray(*GSDown1Raw,7 ,188,312,336,227,647-40,470)
createRawDataForArray(*GSDown1Raw,8 ,115,314,313,106,641-40,315)
createRawDataForArray(*GSDown1Raw,9 ,89 ,448,287)
createRawDataForArray(*GSDown1Raw,10,325,448,336)

;----GSUp1
*GSUp1Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSUp1Raw,0,405,324,312)
createRawDataForArray(*GSUp1Raw,1,411,315,254)
createRawDataForArray(*GSUp1Raw,2,361,265,294,360,259,341)
createRawDataForArray(*GSUp1Raw,3,212,263,308,215,275,625)
createRawDataForArray(*GSUp1Raw,4,248,280,337,288,521,454)
createRawDataForArray(*GSUp1Raw,5,249,322,337)
createRawDataForArray(*GSUp1Raw,6,247,460,337)
createRawDataForArray(*GSUp1Raw,7,300,460,337)

;----GSUp2
*GSUp2Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSUp2Raw,0,359,424,324)
createRawDataForArray(*GSUp2Raw,1,394,350,325)
createRawDataForArray(*GSUp2Raw,2,349,327,294,356,333,311)
createRawDataForArray(*GSUp2Raw,3,253,307,263,256,305,582)
createRawDataForArray(*GSUp2Raw,4,238,309,292)
createRawDataForArray(*GSUp2Raw,5,266,313,351)

;----GSUp3
*GSUp3Raw.rawdataArray=createRawDataArray(9)
createRawDataForArray(*GSUp3Raw,0,324,377,318)
createRawDataForArray(*GSUp3Raw,1,350,378,326)
createRawDataForArray(*GSUp3Raw,2,380,318,342)
createRawDataForArray(*GSUp3Raw,3,16 ,167,353,14,166,584)
createRawDataForArray(*GSUp3Raw,4,23 ,248,337,24,265,584)
createRawDataForArray(*GSUp3Raw,5,34 ,255,347,37,254,587)
createRawDataForArray(*GSUp3Raw,6,19 ,271,348,20,274,578)
createRawDataForArray(*GSUp3Raw,7,194,314,348)
createRawDataForArray(*GSUp3Raw,8,361,321,348)
createRawDataForArray(*GSUp3Raw,9,411,348,348)

;----GSHeavy1
*GSHeavy1Raw.rawdataArray=createRawDataArray(13)
createRawDataForArray(*GSHeavy1Raw,0 ,433,385,315)
createRawDataForArray(*GSHeavy1Raw,1 ,423,386,325)
createRawDataForArray(*GSHeavy1Raw,2 ,311,386,316,319,417,490)
createRawDataForArray(*GSHeavy1Raw,3 ,183,390,337,194,453,615)
createRawDataForArray(*GSHeavy1Raw,4 ,209,374,296,217,517,744)
createRawDataForArray(*GSHeavy1Raw,5 ,207,424,318)
createRawDataForArray(*GSHeavy1Raw,6 ,190,424,318)
createRawDataForArray(*GSHeavy1Raw,7 ,220,424,318)
createRawDataForArray(*GSHeavy1Raw,8 ,48 ,404,296,68 ,464,714)
createRawDataForArray(*GSHeavy1Raw,9 ,28 ,410,345,27 ,481,676)
createRawDataForArray(*GSHeavy1Raw,10,55 ,411,345,133,492,681)
createRawDataForArray(*GSHeavy1Raw,11,28 ,375,311)
createRawDataForArray(*GSHeavy1Raw,12,315,413,318)
createRawDataForArray(*GSHeavy1Raw,13,344,413,318)

;----GSHeavy2
*GSHeavy2Raw.rawdataArray=createRawDataArray(10)
createRawDataForArray(*GSHeavy2Raw,0 ,348,409,326)
createRawDataForArray(*GSHeavy2Raw,1 ,377,395,328)
createRawDataForArray(*GSHeavy2Raw,2 ,366,397,303)
createRawDataForArray(*GSHeavy2Raw,3 ,329,411,282,328,444,588)
createRawDataForArray(*GSHeavy2Raw,4 ,170,407,324,179,454,590)
createRawDataForArray(*GSHeavy2Raw,5 ,233,355,261,238,363,620)
createRawDataForArray(*GSHeavy2Raw,6 ,271,302,331,356,295,354)
createRawDataForArray(*GSHeavy2Raw,7 ,269,284,213,604,334,211)
createRawDataForArray(*GSHeavy2Raw,8 ,448,307,219)
createRawDataForArray(*GSHeavy2Raw,9 ,448,380,221)
createRawDataForArray(*GSHeavy2Raw,10,448,429,221)

;----GSHeavy3
*GSHeavy3Raw.rawdataArray=createRawDataArray(5)
createRawDataForArray(*GSHeavy3Raw,0,436,441,211,473,521,213)
createRawDataForArray(*GSHeavy3Raw,1,282,350,214,279,358,515)
createRawDataForArray(*GSHeavy3Raw,2,258,142,196,292,137,204)
createRawDataForArray(*GSHeavy3Raw,3,298,134,179)
createRawDataForArray(*GSHeavy3Raw,4,418,132,161)
createRawDataForArray(*GSHeavy3Raw,5,418,216,205)

;----GSHeavy4
*GSHeavy4Raw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*GSHeavy4Raw,0,372,412,331)
createRawDataForArray(*GSHeavy4Raw,1,377,425,325)
createRawDataForArray(*GSHeavy4Raw,2,374,414,325,383,484,543)
createRawDataForArray(*GSHeavy4Raw,3,357,403,266)
createRawDataForArray(*GSHeavy4Raw,4,344,394,177)
createRawDataForArray(*GSHeavy4Raw,5,348,396,121)
createRawDataForArray(*GSHeavy4Raw,6,337,389,46)
createRawDataForArray(*GSHeavy4Raw,7,295,362,327)
createRawDataForArray(*GSHeavy4Raw,8,286,368,315)

;----GSHeavy5
*GSHeavy5Raw.rawdataArray=createRawDataArray(7)
createRawDataForArray(*GSHeavy5Raw,0,288,432,340)
createRawDataForArray(*GSHeavy5Raw,1,208,409,332,256,500,649)
createRawDataForArray(*GSHeavy5Raw,2,126,391,324,138,438,649)
createRawDataForArray(*GSHeavy5Raw,3,124,399,318,160,449,683)
createRawDataForArray(*GSHeavy5Raw,4, 42,319,308)
createRawDataForArray(*GSHeavy5Raw,5, 25,336,322)
createRawDataForArray(*GSHeavy5Raw,6,398,339,322)
createRawDataForArray(*GSHeavy5Raw,7,400,372,322)

;----GSDodge
*GSDodgeRaw.rawdataArray=createRawDataArray(1)
createRawDataForArray(*GSDodgeRaw,0,441,375,305)
createRawDataForArray(*GSDodgeRaw,1,472,394,226)

;----HKIdle
*HKIdleRaw.rawdataArray=createRawDataArray(6)
createRawDataForArray(*HKIdleRaw,0,316+20,309,353-20)
createRawDataForArray(*HKIdleRaw,1,320+15,316,353-15)
createRawDataForArray(*HKIdleRaw,2,327+10,324,347-10)
createRawDataForArray(*HKIdleRaw,3,327+5,318,352-5)
createRawDataForArray(*HKIdleRaw,4,322,312,345+10)
createRawDataForArray(*HKIdleRaw,5,307,302,334)
createRawDataForArray(*HKIdleRaw,6,317,309,336)

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

;----HKFront
*HKFrontRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKFrontRaw,0,374,283,341)
createRawDataForArray(*HKFrontRaw,1,367,290,337)
createRawDataForArray(*HKFrontRaw,2,363,290,298)
createRawDataForArray(*HKFrontRaw,3,327,283,339)
createRawDataForArray(*HKFrontRaw,4,322,285,339)
createRawDataForArray(*HKFrontRaw,5,358,293,326)
createRawDataForArray(*HKFrontRaw,6,400,307,323)
createRawDataForArray(*HKFrontRaw,7,354,302,341)
createRawDataForArray(*HKFrontRaw,8,350,307,328)

;----HKBack
*HKBackRaw.rawdataArray=createRawDataArray(8)
createRawDataForArray(*HKBackRaw,0,391,283,331)
createRawDataForArray(*HKBackRaw,1,406,299,357)
createRawDataForArray(*HKBackRaw,2,429,317,355)
createRawDataForArray(*HKBackRaw,3,429,324,356)
createRawDataForArray(*HKBackRaw,4,405,327,341)
createRawDataForArray(*HKBackRaw,5,350,319,344)
createRawDataForArray(*HKBackRaw,6,383,354,333)
createRawDataForArray(*HKBackRaw,7,406,342,346)
createRawDataForArray(*HKBackRaw,8,422,348,338)

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
createRawDataForArray(*HKSide1_5WindFrontRaw,2,  0,246,808)

*HKSide1_2WindBackRaw.rawdataArray=createRawDataArray(2)
createRawDataForArray(*HKSide1_2WindBackRaw,0,321,336,469)
createRawDataForArray(*HKSide1_2WindBackRaw,1,340,323,449)
createRawDataForArray(*HKSide1_2WindBackRaw,2,461,298,423)

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

Procedure destroyAllRawData(*whatRDAL.rawdataarraylist)
	ForEach *whatRDAL\rda()
		destroyRawDataArray(*whatRDAL\rda())
	Next
	ClearList(*whatRDAL\rda())
	FreeList(*whatRDAL\rda())
	FreeStructure(*whatRDAL)
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 2981
; FirstLine = 2961
; Folding = --
; EnableXP
; CPU = 1