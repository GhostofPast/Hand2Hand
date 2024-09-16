;******************************************************************************
;*
;* Image Rotation routines for 24/32 bit with optional AA
;* by Luis, http://luis.no-ip.net
;* v1.10 for PB 5.30
;*
;* Tested under Windows 32/64 bit and Linux 32 bit with PB 4.40 B2
;*
;* These routines can deal with both 24/32 bit images and with the alpha channel.
;* The output of the routines will be an image with the same number of BPP
;* as the one passed in input to them. The source image is not freed.
;*
;* Inspired by a simpler Visual Basic code from Robert Rayment. Thank you.
;* http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=23476&lngWId=1
;*
;* ----------------------------------------------------------------------------
;*
;* RotateImageFree (nSrcImage, fDegRot.f, flgAntiAliasing, FillColor)
;*
;*  nSrcImage           The 24/32 bit PureBasic's image to rotate
;*  fDegRot             Float angle in degrees (+/-) 0.0 -> 360.0
;*  flgAntiAliasing     0 for simpler rotation, 1 for antialiased rotation
;*  FillColor           Used to fill the new areas of the resulting image
;*
;*  Return              a 24/32 bit image rotated by fDegRot
;*
;* NOTES :
;*  FillColor is not used with 32 bit images, the new areas are always transparent.
;*
;*  FillColor can be set to a unique color with 24 bit images if you want to
;*  draw the resulting image with masking using GDI functions under Windows,
;*  for example. Or maybe to simply match a certain background color.
;*
;*  The anti aliasing use 4 pixels to do the AA, this is useful especially
;*  when text is present on the image to be rotated to obtain a good quality
;*  at the expense of speed. A free-angle rotation really need AA !
;*
;* ----------------------------------------------------------------------------
;*
;* RotateImage (nSrcImage, DegRot)
;*
;*  nSrcImage           The 24/32 bit PureBasic's image to rotate
;*  DegRot              Integer angle in degrees (+/-) 90/180/270
;*
;*  Return              a 24/32 bit image rotated by DegRot
;*
;* NOTES :
;*   Use this procedure to rotate by multiples of 90 degrees instead of RotateImageFree().
;*   It's faster and it's not subject to rounding errors.
;*
;* ----------------------------------------------------------------------------
;*
;* FlipImage (nSrcImage)
;*
;*  nSrcImage           The 24/32 bit PureBasic's image to flip
;*
;*  Return              a 24/32 bit image flipped vertically
;*
;* ----------------------------------------------------------------------------
;*
;* MirrorImage (nSrcImage)
;*
;*  nSrcImage           The 24/32 bit PureBasic's image to mirror
;*
;*  Return              a 24/32 bit image mirrored horizontally
;*
;******************************************************************************

#EXC_ALLOC_ERR = 1

CompilerIf Defined(Macro_TRY, #PB_Constant) = 0
#Macro_TRY = 1

Global EXCEPTION

Macro TRY (exp, exc = 0)
; [DESC]
; Evaluate the expression and jump to the corresponding CATCH if it's false.
;
; [INPUT]
; exp : The expression to test.
; exc : An optional numeric code to identify the exception type for the CATCH.
;
; [NOTES]
; This is inspired to real exception handling but it isn't.
; The purpose of this TRY/CATCH pair is to avoid messy, deep error checking in structured code
; and to wrap the use of GOTO inside something more convenient to read/follow.
; You can write the main body of the code under the assumption nothing is going wrong,
; and concentrate the cleanup / recovery in a single place, keeping single entry and exit points.
;
; Example:
;
; Procedure.i MyProc()
;
;  TRY (ProcA(), 1)
;  ...
;  TRY (ProcB(), 2)
;  ...
;  TRY (ProcC(), 3)
;  ...
;
;  ProcedureReturn 1 ; success
; 
;  CATCH
; 
;  Select EXCEPTION
;   Case 1 : ; specific cleanup
;   Case 2 : ; specific cleanup
;   Case 3 : ; specific cleanup
;   Default : ; fallback
;  EndSelect
;
;  ProcedureReturn 0 ; failure
; EndProcedure
;
 
 If Not (exp)
    EXCEPTION = exc
    Goto label_catch_exception
 Else
    EXCEPTION = 0
 EndIf
EndMacro

Macro RAISE (exc = 0)
; [DESC]
; Unconditionally jump to the corresponding CATCH.
;
; [INPUT]
; exc : An optional numeric code to identify the exception type for the CATCH.
 
 EXCEPTION = exc
 Goto label_catch_exception
 EndMacro

Macro CATCH()
; [DESC]
; Receive the control from the program when the TRY expression is false.
;
; [NOTES]
; See the command TRY

 label_catch_exception:
EndMacro

CompilerEndIf

Structure T_RGBA
 B.a
 G.a
 R.a
 A.a
EndStructure

Macro RGB_B(color)
 ((color & $FF0000) >> 16)
EndMacro

Macro RGB_G(color)
 ((color & $FF00) >> 8)
EndMacro

Macro RGB_R(color)
 (color & $FF)
EndMacro

Macro RGB_Mix (r, g, b)
 ((((b) << 8 + (g)) << 8) + (r))
EndMacro

Macro CopyPixel32 (Xs, Ys, Xd, Yd, BufferPitchSrc, BufferPitchDest, ptRGBAs, ptRGBAd, pMemSrc, pMemDest)
 ptRGBAs = pMemSrc  + (Ys) * BufferPitchSrc + (Xs) << 2
 ptRGBAd = pMemDest + (Yd) * BufferPitchDest + (Xd) << 2       
 ptRGBAd\R = ptRGBAs\R
 ptRGBAd\G = ptRGBAs\G
 ptRGBAd\B = ptRGBAs\B       
 ptRGBAd\A = ptRGBAs\A
EndMacro

Macro CopyPixel24 (Xs, Ys, Xd, Yd, BufferPitchSrc, BufferPitchDest, ptRGBAs, ptRGBAd, pMemSrc, pMemDest)
 ptRGBAs = pMemSrc  + (Ys) * BufferPitchSrc + (Xs) * 3
 ptRGBAd = pMemDest + (Yd) * BufferPitchDest + (Xd) * 3
 ptRGBAd\R = ptRGBAs\R
 ptRGBAd\G = ptRGBAs\G
 ptRGBAd\B = ptRGBAs\B       
EndMacro

Macro ReadPixel32 (X, Y, BufferPitchSrc, ptRGBA, pMemSrc)
 ptRGBA = pMemSrc + (Y) * BufferPitchSrc + (X) << 2
EndMacro

Macro ReadPixel24 (X, Y, BufferPitchSrc, ptRGBA, pMemSrc)
 ptRGBA = pMemSrc + (Y) * BufferPitchSrc + (X) * 3
EndMacro

Macro WritePixel32 (tPixel, X, Y, BufferPitchDest, ptRGBA, pMemDest)
 ptRGBA = pMemDest + (Y) * BufferPitchDest + (X) << 2                       
 ptRGBA\R = tPixel\R
 ptRGBA\G = tPixel\G
 ptRGBA\B = tPixel\B
 ptRGBA\A = tPixel\A
EndMacro

Macro WritePixel24 (tPixel, X, Y, BufferPitchDest, ptRGBA, pMemDest)
 ptRGBA = pMemDest + (Y) * BufferPitchDest + (X) * 3
 ptRGBA\R = tPixel\R
 ptRGBA\G = tPixel\G
 ptRGBA\B = tPixel\B
EndMacro

Procedure.i AllocateImageData (nImage, *BufferPitch.Integer, FillColor = -1)
 Protected *ImageMem, *AllocMem, BufferPitch
 StartDrawing(ImageOutput(nImage))
   
  *ImageMem = DrawingBuffer()
  BufferPitch = DrawingBufferPitch()
   If FillColor <> -1
    Select ImageDepth(nImage)
        Case 24
            Box(0, 0, ImageWidth(nImage), ImageHeight(nImage), FillColor)
        Case 32
            DrawingMode(#PB_2DDrawing_AlphaChannel)   
            Box(0, 0, ImageWidth(nImage), ImageHeight(nImage), $00) ; full transparent
    EndSelect
  EndIf

  *AllocMem = AllocateMemory(BufferPitch * ImageHeight(nImage))

  If *AllocMem
    CopyMemory(*ImageMem, *AllocMem, MemorySize(*AllocMem))
    *BufferPitch\i = BufferPitch
  Else
    *BufferPitch\i = 0
  EndIf

 StopDrawing()

 ProcedureReturn *AllocMem
EndProcedure

Procedure CopyImageData (nImage, *DestMem)
 StartDrawing(ImageOutput(nImage))
  CopyMemory(*DestMem, DrawingBuffer(), MemorySize(*DestMem))
 StopDrawing()
EndProcedure

Procedure.i FlipImage (nSrcImage)
; Flip vertically a 24/32 bit image preserving the alpha-channel
 Protected *tRGBAs.T_RGBA, *tRGBAd.T_RGBA, tPixel.T_RGBA, RotType
 Protected *SrcMem, *DestMem, BufferPitchSrc, BufferPitchDest
 Protected SrcWidth, SrcHeight, DestWidth, DestHeight, nDestImage
 Protected X, Y
 Protected BitPlanes
 ; sanity checks
 If IsImage(nSrcImage) = 0
    ProcedureReturn 0
 EndIf
 BitPlanes = ImageDepth(nSrcImage)
 If BitPlanes <> 24 And BitPlanes <> 32
    ProcedureReturn 0
 EndIf
 SrcWidth = ImageWidth(nSrcImage)
 SrcHeight = ImageHeight(nSrcImage)
 DestWidth = SrcWidth
 DestHeight = SrcHeight
 ; create 24/32 bit destination image
 nDestImage = CreateImage(#PB_Any, DestWidth, DestHeight, BitPlanes)
 TRY (nDestImage)
 ; copy src image to allocated memory
 *SrcMem = AllocateImageData(nSrcImage, @BufferPitchSrc)
 TRY (*SrcMem, #EXC_ALLOC_ERR)
 ; copy dest image to allocated memory
 *DestMem = AllocateImageData(nDestImage, @BufferPitchDest)
 TRY (*DestMem, #EXC_ALLOC_ERR)
 Select BitPlanes
    Case 24
        For Y = 0 To DestHeight - 1
            For X = 0 To DestWidth - 1           
                CopyPixel24 (X, SrcHeight - Y - 1, X, Y, BufferPitchSrc, BufferPitchDest, *tRGBAs, *tRGBAd, *SrcMem, *DestMem)
            Next
         Next       
    Case 32
        For Y = 0 To DestHeight - 1
            For X = 0 To DestWidth - 1           
                CopyPixel32 (X, SrcHeight - Y - 1, X, Y, BufferPitchSrc, BufferPitchDest, *tRGBAs, *tRGBAd, *SrcMem, *DestMem)
            Next
         Next   
 EndSelect
 CopyImageData(nDestImage, *DestMem)
 FreeMemory(*SrcMem)
 FreeMemory(*DestMem)
 ProcedureReturn nDestImage
 CATCH()
 If EXCEPTION = #EXC_ALLOC_ERR
    If *SrcMem <> 0 : FreeMemory(*SrcMem) : EndIf
    If *DestMem <> 0 : FreeMemory(*DestMem) : EndIf   
    FreeImage(nDestImage)
 EndIf
 ProcedureReturn 0
EndProcedure

Procedure.i MirrorImage (nSrcImage)

; Mirror horizontally a 24/32 bit image preserving the alpha-channel
 Protected *tRGBAs.T_RGBA, *tRGBAd.T_RGBA, tPixel.T_RGBA, RotType
 Protected *SrcMem, *DestMem, BufferPitchSrc, BufferPitchDest, BitPlanes
 Protected SrcWidth, SrcHeight, DestWidth, DestHeight, nDestImage
 Protected X, Y

 ; sanity checks
 If IsImage(nSrcImage) = 0
 	Debug "error : not image"
    ProcedureReturn 0
 EndIf

 BitPlanes = ImageDepth(nSrcImage)

 If BitPlanes <> 24 And BitPlanes <> 32
    ProcedureReturn 0
 EndIf

 SrcWidth = ImageWidth(nSrcImage)
 SrcHeight = ImageHeight(nSrcImage)

 DestWidth = SrcWidth
 DestHeight = SrcHeight

 ; create 24/32 bit destination image
 nDestImage = CreateImage(#PB_Any, DestWidth, DestHeight, BitPlanes)
 TRY (nDestImage)

 ; copy src image to allocated memory
 *SrcMem = AllocateImageData(nSrcImage, @BufferPitchSrc)
 TRY (*SrcMem, #EXC_ALLOC_ERR)

 ; copy dest image to allocated memory
 *DestMem = AllocateImageData(nDestImage, @BufferPitchDest) ; THIS !
 TRY (*DestMem, #EXC_ALLOC_ERR)
 Select BitPlanes
    Case 24
        For Y = 0 To DestHeight - 1
            For X = 0 To DestWidth - 1
                CopyPixel24 (SrcWidth - X - 1, Y, X, Y, BufferPitchSrc, BufferPitchDest, *tRGBAs, *tRGBAd, *SrcMem, *DestMem)     
            Next
        Next  
    Case 32
        For Y = 0 To DestHeight - 1
            For X = 0 To DestWidth - 1
                CopyPixel32 (SrcWidth - X - 1, Y, X, Y, BufferPitchSrc, BufferPitchDest, *tRGBAs, *tRGBAd, *SrcMem, *DestMem)     
            Next
        Next   
 EndSelect
 CopyImageData(nDestImage, *DestMem)
 FreeMemory(*SrcMem)
 FreeMemory(*DestMem)
 ProcedureReturn nDestImage
 CATCH()
 If EXCEPTION = #EXC_ALLOC_ERR   
    If *SrcMem <> 0 : FreeMemory(*SrcMem) : EndIf
    If *DestMem <> 0 : FreeMemory(*DestMem) : EndIf       
    FreeImage(nDestImage)
 EndIf
 ProcedureReturn 0
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 303
; FirstLine = 108
; Folding = AAk-
; EnableXP
; CPU = 1