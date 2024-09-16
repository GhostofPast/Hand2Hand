Global soundIndex=0
Global soundPoolIndex=0
#H2H_SOUND_DEFAULT_VOLUME=50
#H2H_MUSIC_DEFAULT_VOLUME=20
Global musicLevel=#H2H_MUSIC_DEFAULT_VOLUME
#H2H_SOUND_STEREO_DEFAULT_WIDTH=60
#H2H_SOUND_STEREO_SMALL_WIDTH=30
#H2H_SOUND_STEREO_NONE_WIDTH=0
#H2H_SOUND_VARIATION_DEFAULT=1
Global stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH
Global soundlevel=#H2H_SOUND_DEFAULT_VOLUME
Global soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT

; by nemerod
Global *SND=AllocateMemory($10000)
Global SETTING_EFFECT_SOUND=100
#H2H_SOUND_FOLDER="sound"

Structure soundPool
	id.i ;sound id new system by nemerod
	name$
	*sameTimePlayed.soundPool ; the ID of the pool played at the same time
	sameTimePlayedVolume.f
	Array frequency.i(0)
	volume.i
EndStructure
Global Dim *allSoundPool.soundPool(soundPoolIndex)

#H2H_SOUND_SYSTEM_STOP=#False
CompilerIf #H2H_SOUND_SYSTEM_STOP
	; TODO
Global NewList stoppedSounds.i()

Procedure stoppedSoundsAdd(what.i)
	AddElement(stoppedSounds)
	stoppedSounds()=what
EndProcedure

Procedure StopSoundEx(what.i)
	StopSound(what)
	stoppedSoundsAdd(what)
EndProcedure

Procedure stopSoundAll()
	For p=0 To 255
		*where=*SND+p*$100
		For s=0 To $100-1
			If IsSound(*where+s)
				stopSoundEx(*where+s)
		Next
	Next
EndProcedure
CompilerEndIf

Procedure poolCreate(*pool.soundPool=0,soundDataId=0,volume.i=100)
	If Not *pool
		*pool=AllocateStructure(soundPool)
		ResetStructure(*pool,soundPool)
	EndIf
	*pool\name$="no name"
	*pool\id=soundDataId
	If soundDataId>ArraySize(*allSoundPool())
		ReDim *allSoundPool(soundDataId)
	EndIf
	*allSoundPool(soundDataId)=*pool
	*pool\sameTimePlayed=0
	*pool\sameTimePlayedVolume=1
	
	origin=$100+(soundDataId<<8)
	amount=PeekA(*SND+origin)
	
	ReDim *pool\frequency(amount)
	For i=0 To amount
		If IsSound(origin+i)
			*pool\frequency(i)=GetSoundFrequency(origin+i)
; 			Debug *pool\name$+" "+i+" Frequency "+*pool\frequency(i)
		Else
			Debug *pool\name$+Str(origin+i)+" is not sound"
		EndIf
	Next
	*pool\volume=volume
	ProcedureReturn *pool
EndProcedure
; the variation is both up and down
#H2H_SOUND_VARIATION_PERCENT=20
Procedure.s load_sound(t$,groupe.a)
	temp=0
	origin=$100+(groupe<<8)
	type.s=".wav"
	path$=#H2H_SOUND_FOLDER+"\"+t$+type
	DisableDebugger
	If FileSize(path$)>0
		If LoadSound(origin,path$)
			PlaySound(origin,0,0)
			PokeA(*SND+$100,$00)
			ProcedureReturn type
		EndIf
	EndIf
	
	path$=#H2H_SOUND_FOLDER+"\"+t$
	For a = 1 To 254
		
		If FileSize(path$+Str(a)+type)>0 And LoadSound(origin+temp,path$+Str(a)+type)
			Debug "found sound "+path$+Str(a)+type
			PlaySound(origin+temp,0,0)
			PokeA(*SND+origin,temp)
			temp+1
		Else
			If temp>0
				ProcedureReturn type
			EndIf
			Break
		EndIf
	Next
	type=".ogg"
	path$=#H2H_SOUND_FOLDER+"\"+t$+type
	If FileSize(path$)>0
		Debug "found"
		If LoadSound(origin,path$)
			PlaySound(origin,0,0)
			PokeA(*SND+$100,$00)
			ProcedureReturn type
		EndIf
	EndIf
	path$=#H2H_SOUND_FOLDER+"\"+t$
	For a = 1 To 254
		If FileSize(path$+Str(a)+type)>0 And LoadSound(origin+temp,path$+Str(a)+type)
			Debug "found sound "+path$+Str(a)+type
			PlaySound(origin+temp,0,0)
			PokeA(*SND+origin,temp)
			temp+1
		Else
			If temp>0
				ProcedureReturn type
			EndIf
			Break
		EndIf
	Next
	CatchSound(origin,?NULL_SOUND)
	PlaySound(origin,0,0)
	PokeA(*SND+$100,$00)
	EnableDebugger
	Debug "sound "+t$+" is null !"
	ProcedureReturn ""
EndProcedure

Procedure soundGetAmount(groupe.a)
	ProcedureReturn PeekA(*SND+$100+(groupe<<8))
EndProcedure

Procedure psound(groupe.a,position=-9999,volume.i=100)
	Protected threshold=0
	If volume<=0
		ProcedureReturn -1
	EndIf
	origin=$100+(groupe<<8)
	amount=PeekA(*SND+origin)
	selected=origin
	r=Random(amount)
	selected=origin+r
	; if the sound is already playing, we will pick an other non played sound if possible
	x=0
	threshold=0
	While x<amount And IsSound(selected) And (SoundStatus(selected)=#PB_Sound_Playing Or threshold>10)
		If r>=amount
			r=0
		Else
			r+1
		EndIf
		x+1
		selected=origin+r
		threshold+1
	Wend
	If IsSound(selected)
		SoundVolume(     selected,min((soundlevel*volume)/100,100))
		SetSoundPosition(selected,0,0) 
		If position<>-9999
			SoundPan(selected,(position*2*stereoWidth)/screenSizeX-stereoWidth,s)
		EndIf
		ResumeSound(    selected)
	Else
		Debug Str(selected)+" not sound"
		psound(a,position,volume)
	EndIf
	ProcedureReturn selected
EndProcedure

DataSection
  NULL_SOUND: :Data.b $52,$49,$46,$46,$28,$00,$00,$00,$57,$41,$56,$45,$66,$6D,$74,$20,$10,$00,$00,$00,$01,$00,$01,$00,$44,$AC,$00,$00,$44,$AC,$00,$00,$01,$00,$08,$00,$64,$61,$74,$61,$04,$00,$00,$00,$80,$80,$80,$80
EndDataSection

;--- sound enum
Enumeration 1; liste des groupe via ID de 0 a 255 constant
	;{
	#H2H_SOUND_ID_MENUCLIC
	#H2H_SOUND_ID_MENUACCEPT
	#H2H_SOUND_ID_MENUCANCEL
	
	#H2H_SOUND_ID_METALHEAVYWOOSH
	
	#H2H_SOUND_ID_METALCUTBLOCK
	#H2H_SOUND_ID_METALCUTLIGHT
	#H2H_SOUND_ID_METALCUTMEDIUM
	#H2H_SOUND_ID_METALCUTHEAVY
	
	#H2H_SOUND_ID_METALPIERCEBLOCK
	#H2H_SOUND_ID_METALPIERCELIGHT
	#H2H_SOUND_ID_METALPIERCEMEDIUM
	#H2H_SOUND_ID_METALPIERCEHEAVY
	
	#H2H_SOUND_ID_METALBLUNTBLOCK
	#H2H_SOUND_ID_METALBLUNTLIGHT
	#H2H_SOUND_ID_METALBLUNTMEDIUM
	#H2H_SOUND_ID_METALBLUNTHEAVY
	
	#H2H_SOUND_ID_WOODCUTBLOCK
	#H2H_SOUND_ID_WOODCUTLIGHT
	#H2H_SOUND_ID_WOODCUTMEDIUM
	#H2H_SOUND_ID_WOODCUTHEAVY
	
	#H2H_SOUND_ID_WOODPIERCEBLOCK
	#H2H_SOUND_ID_WOODPIERCELIGHT
	#H2H_SOUND_ID_WOODPIERCEMEDIUM
	#H2H_SOUND_ID_WOODPIERCEHEAVY
	
	#H2H_SOUND_ID_WOODBLUNTBLOCK
	#H2H_SOUND_ID_WOODBLUNTLIGHT
	#H2H_SOUND_ID_WOODBLUNTMEDIUM
	#H2H_SOUND_ID_WOODBLUNTHEAVY
	
	#H2H_SOUND_ID_PLASTICCUTBLOCK
	#H2H_SOUND_ID_PLASTICCUTLIGHT
	#H2H_SOUND_ID_PLASTICCUTMEDIUM
	#H2H_SOUND_ID_PLASTICCUTHEAVY
	
	#H2H_SOUND_ID_PLASTICPIERCEBLOCK
	#H2H_SOUND_ID_PLASTICPIERCELIGHT
	#H2H_SOUND_ID_PLASTICPIERCEMEDIUM
	#H2H_SOUND_ID_PLASTICPIERCEHEAVY
	
	#H2H_SOUND_ID_PLASTICBLUNTBLOCK
	#H2H_SOUND_ID_PLASTICBLUNTLIGHT
	#H2H_SOUND_ID_PLASTICBLUNTMEDIUM
	#H2H_SOUND_ID_PLASTICBLUNTHEAVY
	
	#H2H_SOUND_ID_FINGERBLOCK
	#H2H_SOUND_ID_FINGERLIGHT
	#H2H_SOUND_ID_FINGERMEDIUM
	#H2H_SOUND_ID_FINGERHEAVY
	
	#H2H_SOUND_ID_SWISHLIGHT
	#H2H_SOUND_ID_SWISHMEDIUM
	#H2H_SOUND_ID_PLASTICSWING
	
	#H2H_SOUND_ID_FINGER_SWISHLIGHT
	#H2H_SOUND_ID_FINGER_SWISHMEDIUM
	#H2H_SOUND_ID_FINGER_SWISHHEAVY
	
	#H2H_SOUND_ID_CHOPSTICK_NDOWN
	
	#H2H_SOUND_ID_BALLPEN_FALL_1
	#H2H_SOUND_ID_BALLPEN_FALL_2
	#H2H_SOUND_ID_BALLPEN_FALL_3
	
	#H2H_SOUND_ID_HAND_CREAK
	
	#H2H_SOUND_ID_HAND_FALL
	#H2H_SOUND_ID_HAND_LAND
	
	#H2H_SOUND_ID_HAND_JUMPLIGHT
	#H2H_SOUND_ID_HAND_JUMPHEAVY
	
	#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT
	#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM
	
	#H2H_SOUND_ID_GLUESTICK_BLUNTBLOCK
	#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT
	#H2H_SOUND_ID_GLUESTICK_BLUNTMEDIUM
	#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY
	
; 	#H2H_SOUND_ID_GLUESTICK_HITGROUND
	
	#H2H_SOUND_ID_GLUESTICK_GUNLIGHT
	#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM
	#H2H_SOUND_ID_GLUESTICK_GUNHEAVY
	
	#H2H_SOUND_ID_KILL_BLUNT
	#H2H_SOUND_ID_KILL_CUT
	
	#H2H_SOUND_COMBO_HIT
	;}
EndEnumeration

;--- sound enum end
Procedure poolInit(name$,index.i,volume.i=100)
	type.s=load_sound(name$,index)
	*p.soundPool=poolCreate(0,index,volume)
	*p\name$=name$
	ProcedureReturn *p
EndProcedure

#H2H_JSON_SOUND_ID="id"
#H2H_JSON_SOUND_NAME="name" ; pure file name
#H2H_JSON_SOUND_VOLUME="volume" ; by default 100
#H2H_JSON_SOUND_NEXT="next"
#H2H_JSON_SOUND_NEXTVOLUME="nextVolume"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure poolJSONExport(*p.soundpool,*parent)
	addJSONInteger(*parent,#H2H_JSON_SOUND_ID,*p\id)
	addJSONString(*parent,#H2H_JSON_SOUND_NAME,*p\name$)
	If *p\volume<>100
		addJSONInteger(*parent,#H2H_JSON_SOUND_VOLUME,*p\volume)
	EndIf
	If *p\sameTimePlayed
		addJSONInteger(*parent,#H2H_JSON_SOUND_NEXT,*p\sameTimePlayed\id)
		addJSONFloat(*parent,#H2H_JSON_SOUND_NEXTVOLUME,*p\sameTimePlayedVolume)
	EndIf
	ProcedureReturn *parent
EndProcedure

Procedure.i poolJSONExportAll(*parent=0)
	If Not *parent
		*parent=CreateJSONArray()
	EndIf
	For s=0 To ArraySize(*allSoundPool())
		If *allSoundPool(s)
			*child=AddJSONElement(*parent,*allSoundPool(s)\id)
			SetJSONObject(*child)
			poolJSONExport(*allSoundPool(s),*child)
		EndIf
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
Procedure poolJSONImport(*parent,*p.soundPool=0)
	If Not *p
		*p=AllocateStructure(soundPool)
		ResetStructure(*p,soundPool)
	EndIf
	Dim *p\frequency(0)
	*p\id=loadJSONInteger(*parent,#H2H_JSON_SOUND_ID)
	*p\volume=loadJSONInteger(*parent,#H2H_JSON_SOUND_VOLUME)
	If *p\volume=0
		*p\volume=100
	EndIf
	*p\sameTimePlayed=loadJSONInteger(*parent,#H2H_JSON_SOUND_NEXT)
	If *p\sameTimePlayed
		*p\sameTimePlayed=*allSoundPool(*p\sameTimePlayed)
		*p\sameTimePlayedVolume=loadJSONFloat(*parent,#H2H_JSON_SOUND_NEXTVOLUME)
		If *p\sameTimePlayedVolume=0
			*p\sameTimePlayedVolume=1
		EndIf
	EndIf
	*p\name$=loadJSONString(*parent,#H2H_JSON_SOUND_NAME)
	load_sound(*p\name$,*p\id)
	
	origin=$100+(*p\id<<8)
	amount=PeekA(*SND+origin)
	Dim *p\frequency(amount)
	For i=0 To amount
		If IsSound(origin+i)
			*p\frequency(i)=GetSoundFrequency(origin+i)
		EndIf
	Next
	ProcedureReturn *p
EndProcedure
Declare playPoolSoundNoRec(*pool.soundpool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
Procedure poolJSONImportAll(*parent)
	FreeArray(*allSoundPool())
	size=JSONArraySize(*parent)
	Dim *allSoundPool(size-1)
	For s=0 To size-1
		*child=GetJSONElement(*parent,s)
		If *child
			*allSoundPool(s)=poolJSONImport(*child)
		Else
			*allSoundPool(s)=#Null
		EndIf
	Next
	ProcedureReturn *parent
EndProcedure
;---- all imports
CompilerIf #H2H_MODE=#H2H_MODE_SAVE

Global *menuClic.soundPool=poolInit("clic",#H2H_SOUND_ID_MENUCLIC)
*menuAccept.soundPool=poolInit("menuaccept",#H2H_SOUND_ID_MENUACCEPT)
*menuCancel.soundPool=poolInit("menucancel",#H2H_SOUND_ID_MENUCANCEL)

*ballpen_HeavyS.soundPool=poolInit("metalheavywoosh",#H2H_SOUND_ID_METALHEAVYWOOSH)

*metal_hitCutBlocked.soundPool=poolInit("metalcutblock",#H2H_SOUND_ID_METALCUTBLOCK)
*metal_hitCutLight.soundPool=poolInit("metalcutlight",#H2H_SOUND_ID_METALCUTLIGHT)
*metal_hitCutMedium.soundPool=poolInit("metalcutmedium",#H2H_SOUND_ID_METALCUTMEDIUM)
*metal_hitCutHeavy.soundPool=poolInit("metalcutheavy",#H2H_SOUND_ID_METALCUTHEAVY)

*metal_hitPierceBlocked.soundPool=poolInit("metalpierceblock",#H2H_SOUND_ID_METALPIERCEBLOCK)
*metal_hitPierceLight.soundPool=poolInit("metalpiercelight",#H2H_SOUND_ID_METALPIERCELIGHT)
*metal_hitPierceMedium.soundPool=poolInit("metalpiercemedium",#H2H_SOUND_ID_METALPIERCEMEDIUM)
*metal_hitpierceHeavy.soundPool=poolInit("metalpierceheavy",#H2H_SOUND_ID_METALPIERCEHEAVY)

*metal_hitBluntBlocked.soundPool=poolInit("metalbluntblock",#H2H_SOUND_ID_METALBLUNTBLOCK)
*metal_hitBluntLight.soundPool=poolInit("metalbluntlight",#H2H_SOUND_ID_METALBLUNTLIGHT)
*metal_hitBluntMedium.soundPool=poolInit("metalbluntmedium",#H2H_SOUND_ID_METALBLUNTMEDIUM)
*metal_hitBluntHeavy.soundPool=poolInit("metalbluntheavy",#H2H_SOUND_ID_METALBLUNTHEAVY)

*wood_hitCutBlocked.soundPool=poolInit("woodcutblock",#H2H_SOUND_ID_WOODCUTBLOCK)
*wood_hitCutLight.soundPool=poolInit("woodcutlight",#H2H_SOUND_ID_WOODCUTLIGHT)
*wood_hitCutMedium.soundPool=poolInit("woodcutmedium",#H2H_SOUND_ID_WOODCUTMEDIUM)
*wood_hitCutHeavy.soundPool=poolInit("woodcutheavy",#H2H_SOUND_ID_WOODCUTHEAVY)

*wood_hitPierceBlocked.soundPool=poolInit("woodpierceblock",#H2H_SOUND_ID_WOODPIERCEBLOCK)
*wood_hitPierceLight.soundPool=poolInit("woodpiercelight",#H2H_SOUND_ID_WOODPIERCELIGHT)
*wood_hitPierceMedium.soundPool=poolInit("woodpiercemedium",#H2H_SOUND_ID_WOODPIERCEMEDIUM)
*wood_hitPierceHeavy.soundPool=poolInit("woodpierceheavy",#H2H_SOUND_ID_WOODPIERCEHEAVY)

*wood_hitBluntBlocked.soundPool=poolInit("woodbluntblock",#H2H_SOUND_ID_WOODBLUNTBLOCK)
*wood_hitBluntLight.soundPool=poolInit("woodbluntlight",#H2H_SOUND_ID_WOODBLUNTLIGHT)
*wood_hitBluntMedium.soundPool=poolInit("woodbluntmedium",#H2H_SOUND_ID_WOODBLUNTMEDIUM)
*wood_hitBluntHeavy.soundPool=poolInit("woodbluntheavy",#H2H_SOUND_ID_WOODBLUNTHEAVY)

*plastic_hitCutBlocked.soundPool=poolInit("plasticcutblock",#H2H_SOUND_ID_PLASTICCUTBLOCK)
*plastic_hitCutLight.soundPool=poolInit("plasticcutlight",#H2H_SOUND_ID_PLASTICCUTLIGHT)
*plastic_hitCutMedium.soundPool=poolInit("plasticcutmedium",#H2H_SOUND_ID_PLASTICCUTMEDIUM)
*plastic_hitCutHeavy.soundPool=poolInit("plasticcutheavy",#H2H_SOUND_ID_PLASTICCUTHEAVY)

*plastic_hitPierceBlocked.soundPool=poolInit("plasticpierceblock",#H2H_SOUND_ID_PLASTICPIERCEBLOCK)
*plastic_hitPierceLight.soundPool=poolInit("plasticpiercelight",#H2H_SOUND_ID_PLASTICPIERCELIGHT)
*plastic_hitPierceMedium.soundPool=poolInit("plasticpiercemedium",#H2H_SOUND_ID_PLASTICPIERCEMEDIUM)
*plastic_hitPierceHeavy.soundPool=poolInit("plasticpierceheavy",#H2H_SOUND_ID_PLASTICPIERCEHEAVY)

*plastic_hitBluntBlocked.soundPool=poolInit("plasticbluntblock",#H2H_SOUND_ID_PLASTICBLUNTBLOCK)
*plastic_hitBluntLight.soundPool=poolInit("plasticbluntlight",#H2H_SOUND_ID_PLASTICBLUNTLIGHT)
*plastic_hitBluntMedium.soundPool=poolInit("plasticbluntmedium",#H2H_SOUND_ID_PLASTICBLUNTMEDIUM)
*plastic_hitBluntHeavy.soundPool=poolInit("plasticbluntheavy",#H2H_SOUND_ID_PLASTICBLUNTHEAVY)

*finger_hitBluntBlocked.soundPool=poolInit("fingerblock",#H2H_SOUND_ID_FINGERBLOCK,150)
*finger_hitBluntLight.soundPool=poolInit("fingerlight",#H2H_SOUND_ID_FINGERLIGHT,150)
*finger_hitBluntMedium.soundPool=poolInit("fingermedium",#H2H_SOUND_ID_FINGERMEDIUM,150)
*finger_hitBluntHeavy.soundPool=poolInit("fingerheavy",#H2H_SOUND_ID_FINGERHEAVY,150)

*chineseStaff_AttackS.soundPool=poolInit("swishlight",#H2H_SOUND_ID_SWISHLIGHT)
*chineseStaff_HeavyS.soundPool=poolInit("swishmedium",#H2H_SOUND_ID_SWISHMEDIUM)
*plastic_swish.soundPool=poolInit("plasticswing",#H2H_SOUND_ID_PLASTICSWING,80)

*finger_swishlight.soundPool=poolInit("fingerswishlight",#H2H_SOUND_ID_FINGER_SWISHLIGHT)
*finger_swishmedium.soundPool=poolInit("fingerswishmedium",#H2H_SOUND_ID_FINGER_SWISHMEDIUM)
*finger_swishheavy.soundPool=poolInit("fingerswishheavy",#H2H_SOUND_ID_FINGER_SWISHHEAVY)

*chineseStaff_nDownS.soundPool=poolInit("chopstickndown",#H2H_SOUND_ID_CHOPSTICK_NDOWN)

*penfallSound1.soundPool=poolInit("penfall1",#H2H_SOUND_ID_BALLPEN_FALL_1)
*penfallSound2.soundPool=poolInit("penfall2",#H2H_SOUND_ID_BALLPEN_FALL_2)
*penfallSound3.soundPool=poolInit("penfall3",#H2H_SOUND_ID_BALLPEN_FALL_3)
*jointCrack.soundPool=poolInit("jointcrack",#H2H_SOUND_ID_HAND_CREAK)

*bodyFallSound.soundPool=poolInit("body_fall",#H2H_SOUND_ID_HAND_FALL)
*landSound.soundPool=poolInit("land",#H2H_SOUND_ID_HAND_LAND)

*jumpLightSound.soundPool=poolInit("jump_light",#H2H_SOUND_ID_HAND_JUMPLIGHT)
*jumpLightSound.soundPool=poolInit("jump_heavy",#H2H_SOUND_ID_HAND_JUMPHEAVY)

*gluestickSwingLight.soundPool=poolInit("gluestickswishlight",#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT,50)
*gluestickSwingMedium.soundPool=poolInit("gluestickswishheavy",#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM,50)

*gluestickBluntBlock.soundPool=poolInit("gluestickhitblock",#H2H_SOUND_ID_GLUESTICK_BLUNTBLOCK,100)
*gluestickBluntBlock\sameTimePlayed=*wood_hitBluntBlocked
*gluestickBluntBlock\sameTimePlayedVolume=0.75
*gluestickBluntLight.soundPool=poolInit("gluestickhitlight",#H2H_SOUND_ID_GLUESTICK_BLUNTLIGHT,100)
*gluestickBluntLight\sameTimePlayed=*plastic_hitBluntLight
*gluestickBluntLight\sameTimePlayedVolume=0.75
*gluestickBluntMedium.soundPool=poolInit("gluestickhitmedium",#H2H_SOUND_ID_GLUESTICK_BLUNTMEDIUM,100)
*gluestickBluntMedium\sameTimePlayed=*plastic_hitBluntMedium
*gluestickBluntMedium\sameTimePlayedVolume=0.75
*gluestickBluntHeavy.soundPool=poolInit("gluestickhitheavy",#H2H_SOUND_ID_GLUESTICK_BLUNTHEAVY,100)
*gluestickBluntHeavy\sameTimePlayed=*plastic_hitBluntHeavy
*gluestickBluntHeavy\sameTimePlayedVolume=0.75

; *gluestickHitGround.soundPool=poolInit("gluestickhitground",#H2H_SOUND_ID_GLUESTICK_HITGROUND)

*gluestickGunLight.soundPool=poolInit("minigun",#H2H_SOUND_ID_GLUESTICK_GUNLIGHT)
*gluestickGunMedium.soundPool=poolInit("gluestickgunmedium",#H2H_SOUND_ID_GLUESTICK_GUNMEDIUM)
*gluestickGunHeavy.soundPool=poolInit("gluestickgunheavy",#H2H_SOUND_ID_GLUESTICK_GUNHEAVY)

Global *killBlunt.soundPool=poolInit("killblunt",#H2H_SOUND_ID_KILL_BLUNT)
Global *killCut.soundPool=poolInit("killcut",#H2H_SOUND_ID_KILL_CUT)

Global *comboHitSound.soundPool=poolInit("combohit",#H2H_SOUND_COMBO_HIT)
CompilerEndIf
Procedure.i importSound(path.s)
	If Not LoadSound(soundIndex,path)
		MessageRequester("Can't find the sound",path)
	EndIf
	SoundVolume(soundIndex,soundlevel)
	before=soundIndex
	soundIndex+1
	ProcedureReturn before
EndProcedure

#H2H_SOUND_VARIATION_ITERATION=3 ; must be >=1, too high may not sensibly variate the sound

Procedure playPoolSoundNoRec(*pool.soundpool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
	If *pool And volume>0.05
		selected=psound(*pool\id,position,*pool\volume*volume)
		If selected>=0 And IsSound(selected)
			If variated Or pitchCoef<>1
				id=selected-($100+(*pool\id<<8))
				amount=soundGetAmount(*pool\id)
				If id>amount
					id=amount
				EndIf
				If id>ArraySize(*pool\frequency())
					id=ArraySize(*pool\frequency())
				EndIf
				; we take an average so we have high chances to have a not very altered sound
				frequency.f=0
				If variated
					For i=1 To #H2H_SOUND_VARIATION_ITERATION
						frequency+(100+Random(2*#H2H_SOUND_VARIATION_PERCENT)-#H2H_SOUND_VARIATION_PERCENT)
					Next
					frequency/#H2H_SOUND_VARIATION_ITERATION
				Else
					frequency=100
				EndIf
				frequency=(*pool\frequency(id)*frequency)/100
				frequency*pitchCoef
				CompilerIf #H2H_HALFMODE
					frequency/2
				CompilerEndIf
				SetSoundFrequency(selected,frequency)
			EndIf
		EndIf
	EndIf
EndProcedure

Procedure playPoolSound(*pool.soundPool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
	If volume<=0 Or volume**pool\volume<=1
		ProcedureReturn
	EndIf
	If *pool
		variated*soundVariationEnabled
		playPoolSoundNoRec(*pool,position,variated,pitchCoef,volume)
		If *pool\sameTimePlayed
			playPoolSound(*pool\sameTimePlayed,position,variated,pitchCoef,volume**pool\sameTimePlayedVolume)
		EndIf
	EndIf
EndProcedure

Procedure poolCopy(*p1.soundPool,*p2.soundPool)
	If *p2
		CopyStructure(*p2,*p1,soundPool)
	EndIf
EndProcedure

Structure hitSoundClass
	id.i
	*blocked.soundPool
	*light.soundPool
	*medium.soundPool
	*heavy.soundPool
	
	lightThreshold.i
	mediumThreshold.i
	heavyThreshold.i
EndStructure

Global hitSoundClassCount=0
Global Dim *allHitSoundClass.hitSoundClass(hitSoundClassCount)

#H2H_SOUND_CLASS_THRESHOLD_BLOCKED=0
#H2H_SOUND_CLASS_THRESHOLD_LIGHT=2
#H2H_SOUND_CLASS_THRESHOLD_MEDIUM=5
#H2H_SOUND_CLASS_THRESHOLD_HEAVY=10

#H2H_JSON_SOUND_CLASS_ID="id"
#H2H_JSON_SOUND_CLASS_ID_BLOCKED="blocked"
#H2H_JSON_SOUND_CLASS_ID_LIGHT="light"
#H2H_JSON_SOUND_CLASS_ID_MEDIUM="medium"
#H2H_JSON_SOUND_CLASS_ID_HEAVY="heavy"

#H2H_JSON_SOUND_CLASS_THRESHOLD_LIGHT="lightThreshold"
#H2H_JSON_SOUND_CLASS_THRESHOLD_MEDIUM="mediumThreshold"
#H2H_JSON_SOUND_CLASS_THRESHOLD_HEAVY="heavyThreshold"
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure hitSoundJSONExport(*hS.hitSoundClass,*parent)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID,*hS\id)
	If *hS\blocked
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_BLOCKED,*hS\blocked\id)
	EndIf
	If *hS\light
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_LIGHT,*hS\light\id,#True)
	EndIf
	If *hS\medium
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_MEDIUM,*hS\medium\id,#True)
	EndIf
	If *hS\heavy
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_HEAVY,*hS\heavy\id,#True)
	EndIf
	If *hs\lightThreshold<>#H2H_SOUND_CLASS_THRESHOLD_LIGHT
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_LIGHT,*hS\lightThreshold)
	EndIf
	If *hs\mediumThreshold<>#H2H_SOUND_CLASS_THRESHOLD_MEDIUM
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_MEDIUM,*hS\mediumThreshold)
	EndIf
	If *hs\heavyThreshold<>#H2H_SOUND_CLASS_THRESHOLD_HEAVY
		addJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_HEAVY,*hS\heavyThreshold)
	EndIf
	ProcedureReturn *parent
EndProcedure

Procedure hitSoundJSONExportAll(*parent=0)
	If Not *parent
		*parent=CreateJSONArray()
	EndIf
	For c=0 To ArraySize(*allHitSoundClass())
		If *allHitSoundClass(c)
			*child=AddJSONElement(*parent,*allHitSoundClass(c)\id)
			SetJSONObject(*child)
			hitSoundJSONExport(*allHitSoundClass(c),*child)
		EndIf
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
Procedure hitSoundJSONImport(*parent,*hS.hitSoundClass=0)
	If Not *hS
		*hS=AllocateStructure(hitSoundClass)
		ClearStructure(*hS,hitSoundClass)
	EndIf
	*hS\id=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID)
	*hS\blocked=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_BLOCKED)
	If *hS\blocked
		*hs\blocked=*allSoundPool(*hs\blocked)
	EndIf
	*hS\light=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_LIGHT)
	If *hS\light
		*hs\light=*allSoundPool(*hs\light)
	EndIf
	*hS\medium=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_MEDIUM)
	If *hS\medium
		*hs\medium=*allSoundPool(*hs\medium)
	EndIf
	*hS\heavy=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_HEAVY)
	If *hS\heavy
		*hs\heavy=*allSoundPool(*hs\heavy)
	EndIf
	*hS\lightThreshold=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_LIGHT)
	If *hS\lightThreshold=0
		*hS\lightThreshold=#H2H_SOUND_CLASS_THRESHOLD_LIGHT
	EndIf
	*hS\mediumThreshold=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_MEDIUM)
	If *hS\mediumThreshold=0
		*hS\mediumThreshold=#H2H_SOUND_CLASS_THRESHOLD_MEDIUM
	EndIf
	*hS\heavyThreshold=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_THRESHOLD_HEAVY)
	If *hS\heavyThreshold=0
		*hS\heavyThreshold=#H2H_SOUND_CLASS_THRESHOLD_HEAVY
	EndIf
	ProcedureReturn *hS
EndProcedure
Declare playHitSound(*hS.hitSoundClass,damage.i,position.i=-9999)
Procedure hitSoundJSONImportAll(*parent)
	FreeArray(*allHitSoundClass())
	size=JSONArraySize(*parent)
	Dim *allHitSoundClass(size-1)
	For c=0 To size-1
		*child=GetJSONElement(*parent,c)
		*allHitSoundClass(c)=hitSoundJSONImport(*child)
	Next
	ProcedureReturn *parent
EndProcedure
Procedure hitSoundCopy(*hS1.hitSoundClass,*hS2.hitSoundClass)
	If *hS1
		If *hS2
			CopyStructure(*hS2,*hS1,hitSoundClass)
		EndIf
	EndIf
EndProcedure

Procedure hitSoundCreate(*hS.hitSoundClass=0,*blocked=0,*light=0,*medium=0,*heavy=0)
	If Not *hS
		*hS=AllocateStructure(hitSoundClass)
		ResetStructure(*hS,hitSoundClass)
	EndIf
	*hS\id=hitSoundClassCount
	If *allHitSoundClass(0)
		hitSoundClassCount+1
		ReDim *allHitSoundClass(hitSoundClassCount)
	EndIf
	*allHitSoundClass(hitSoundClassCount)=*hS
	*hS\blocked=*blocked
	*hS\light=*light
	*hS\medium=*medium
	*hS\heavy=*heavy
	ProcedureReturn *hS
EndProcedure

Procedure hitSoundSet(*hS.hitSoundClass,lightT=#H2H_SOUND_CLASS_THRESHOLD_LIGHT,mediumT=#H2H_SOUND_CLASS_THRESHOLD_MEDIUM,heavyT=#H2H_SOUND_CLASS_THRESHOLD_HEAVY)
	If *hS
		*hS\lightThreshold=lightT
		*hS\mediumThreshold=mediumT
		*hS\heavyThreshold=heavyT
	EndIf
EndProcedure

Procedure playHitSound(*hS.hitSoundClass,damage.i,position.i=-9999)
	If *hS
		If damage<*hS\lightThreshold
			playPoolSound(*hS\blocked,position)
			ProcedureReturn
		EndIf
		If damage<*hS\mediumThreshold
			playPoolSound(*hS\light,position)
			ProcedureReturn
		EndIf
		If damage<*hS\heavyThreshold
			playPoolSound(*hS\medium,position)
			ProcedureReturn
		EndIf
		playPoolSound(*hS\heavy,position)
	EndIf
EndProcedure

Structure hitSoundMaterial
	id.i
	*cut.hitSoundClass
	*pierce.hitSoundClass
	*blunt.hitSoundClass
EndStructure

Global nbHitMaterial=0
Global Dim *allMaterials.hitSoundMaterial(nbHitMaterial)
#H2H_JSON_SOUND_MATERIAL_ID="id"
#H2H_JSON_SOUND_MATERIAL_CUT="cut"
#H2H_JSON_SOUND_MATERIAL_PIERCE="pierce"
#H2H_JSON_SOUND_MATERIAL_BLUNT="blunt"

Procedure materialJSONExport(*hsM.hitSoundMaterial,*parent)
	If Not *parent
		*parent=CreateJSONObject()
	EndIf
	addJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_ID,*hsM\id)
	addJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_CUT,*hsM\cut\id,#True)
	addJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_PIERCE,*hsM\pierce\id,#True)
	addJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_BLUNT,*hsM\blunt\id,#True)
	ProcedureReturn *parent
EndProcedure
CompilerIf #H2H_MODE=#H2H_MODE_SAVE
Procedure materialJSONExportAll(*parent)
	If Not *parent
		*parent=CreateJSONArray()
	EndIf
	For m=0 To ArraySize(*allMaterials())
		*child=AddJSONElement(*parent)
		SetJSONObject(*child)
		materialJSONExport(*allMaterials(m),*child)
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
Procedure materialJSONImport(*parent,*hSM.hitSoundMaterial=0)
	If Not *hSM
		*hSM=AllocateStructure(hitSoundMaterial)
		ClearStructure(*hSM,hitSoundMaterial)
	EndIf
	*hSM\id=loadJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_ID)
	*hSM\cut=loadJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_CUT)
	If *hSM\cut
		*hSM\cut=*allHitSoundClass(*hSM\cut)
	EndIf
	*hSM\pierce=loadJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_PIERCE)
	If *hSM\pierce
		*hSM\pierce=*allHitSoundClass(*hSM\pierce)
	EndIf
	*hSM\blunt=loadJSONInteger(*parent,#H2H_JSON_SOUND_MATERIAL_BLUNT)
	If *hSM\blunt
		*hSM\blunt=*allHitSoundClass(*hSM\blunt)
	EndIf
	ProcedureReturn *hSM
EndProcedure

Procedure materialJSONImportAll(*parent)
	FreeArray(*allMaterials())
	size=JSONArraySize(*parent)
	Dim *allMaterials(size-1)
	For m=0 To size-1
		*child=GetJSONElement(*parent,m)
		*allMaterials(m)=materialJSONImport(*child)
	Next
	ProcedureReturn *parent
EndProcedure

Procedure.i hitSoundMaterialCreate(*hSM.hitSoundMaterial=0,*cut.hitSoundClass=0,*pierce.hitSoundClass=0,*blunt.hitSoundClass=0)
	If Not *hSM
		*hSM=AllocateStructure(hitSoundMaterial)
		ResetStructure(*hSM,hitSoundMaterial)
	EndIf
	If *allMaterials(0)
		nbHitMaterial+1
		ReDim *allMaterials(nbHitMaterial)
	EndIf
	*hSM\id=nbHitMaterial
	*allMaterials(nbHitMaterial)=*hSM
	*hSM\cut=*cut
	*hSM\pierce=*pierce
	*hSM\blunt=*blunt
	ProcedureReturn *hSM
EndProcedure

Procedure hitSoundMaterialCopy(*hSM1.hitSoundMaterial,*hSM2.hitSoundMaterial)
	If *hSM1 And *hSM2
		CopyStructure(*hSM2,*hSM1,hitSoundMaterial)
	EndIf
EndProcedure

Procedure hitSoundMaterialPlay(*hSM.hitSoundMaterial,damage.i,damageType.i,position.i=-9999)
	If *hSM
		If damageType=#H2H_DAMAGETYPE_CUT
			playHitSound(*hSM\cut,damage,position)
			ProcedureReturn
		EndIf
		If damageType=#H2H_DAMAGETYPE_PIERCE
			playHitSound(*hSM\pierce,damage,position)
			ProcedureReturn
		EndIf
		playHitSound(*hSM\blunt,damage,position)
	EndIf
EndProcedure
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 466
; FirstLine = 321
; Folding = -b+ftC+
; Markers = 682
; EnableXP
; CPU = 1