path$="background3_"
UsePNGImageEncoder()
UsePNGImageDecoder()
LoadImage(0,path$+".png")
width=1
Repeat
	width*2
Until width*2>ImageWidth(0)
Debug "width "+width+" / "+ImageWidth(0)
remainder=ImageWidth(0)
i=1
While remainder>0
	GrabImage(0,1,ImageWidth(0)-remainder,0,width,ImageHeight(0))
	SaveImage(1,path$+Str(i)+".png",#PB_ImagePlugin_PNG)
	remainder-width
	While width>remainder
		width/2
	Wend
	Debug "i : "+i
	Debug "remainder : "+remainder
	i+1
	FreeImage(1)
Wend
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; EnableXP
; DPIAware