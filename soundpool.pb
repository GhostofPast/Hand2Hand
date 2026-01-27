Global soundIndex=0
Global soundPoolIndex=0

#H2H_SOUND_DEFAULT_VOLUME=50
Global soundlevel=#H2H_SOUND_DEFAULT_VOLUME
#H2H_MUSIC_DEFAULT_VOLUME=20
Global musicLevel=#H2H_MUSIC_DEFAULT_VOLUME

#H2H_SOUND_STEREO_DEFAULT_WIDTH=60
Global SOUND_STEREO_DEFAULT_WIDTH=#H2H_SOUND_STEREO_DEFAULT_WIDTH
#H2H_SOUND_STEREO_SMALL_WIDTH=30
Global SOUND_STEREO_SMALL_WIDTH=#H2H_SOUND_STEREO_SMALL_WIDTH
#H2H_SOUND_STEREO_NONE_WIDTH=0
Global SOUND_STEREO_NONE_WIDTH=#H2H_SOUND_STEREO_NONE_WIDTH
Global stereoWidth=#H2H_SOUND_STEREO_DEFAULT_WIDTH

; the variation is both up and down
#H2H_SOUND_VARIATION_PERCENT=20
Global SOUND_VARIATION_PERCENT=#H2H_SOUND_VARIATION_PERCENT
#H2H_SOUND_VARIATION_DEFAULT=1
#H2H_SOUND_VARIATION_ITERATION=3 ; must be >=1, too high may not sensibly variate the sound
Global SOUND_VARIATION_ITERATION=#H2H_SOUND_VARIATION_ITERATION ; must be >=1, too high may not sensibly variate the sound
Global soundVariationEnabled=#H2H_SOUND_VARIATION_DEFAULT

IncludeFile "dsp.pb"
DSP_INIT()

Global SETTING_EFFECT_SOUND=100
#H2H_SOUND_FOLDER="sound"

Structure soundPool
	id.i ; static sound pool ID defined at loading (sound id new system by nemerod)
	name$
	*sameTimePlayed.soundPool ; the ID of the pool played at the same time
	sameTimePlayedVolume.f
; 	Array frequency.i(0)
	Array subSoundId.q(0) ; ID gaven by the DSP
	volume.i
EndStructure
Global NewMap *allSoundPool.soundPool()

Procedure poolCreate(*pool.soundPool=0,soundDataId=0,volume.i=100)
	If Not *pool
		*pool=AllocateStructure(soundPool)
		ResetStructure(*pool,soundPool)
	EndIf
	*pool\name$="no name"
	*pool\id=soundDataId
; 	Debug "created "+soundDataId
	AddMapElement(*allSoundPool(),Str(soundDataId))
	*allSoundPool()=*pool
	*pool\sameTimePlayed=0
	*pool\sameTimePlayedVolume=1
	*pool\volume=volume
	ProcedureReturn *pool
EndProcedure

Procedure soundGetAmount(groupe.a)
	ProcedureReturn PeekA(*SND+$100+(groupe<<8))
EndProcedure
Declare playPoolSound(*pool.soundPool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
Procedure psound(poolId.i,position=-9999,volume.f=100)
	playPoolSound(*allSoundPool(Str(poolId)),position,1,1,volume/100.0)
; 	ProcedureReturn
; 	Protected threshold=0
; 	If volume<=0
; 		ProcedureReturn -1
; 	EndIf
; 	origin=$100+(groupe<<8)
; 	amount=PeekA(*SND+origin)
; 	selected=origin
; 	r=Random(amount)
; 	selected=origin+r
; 	; if the sound is already playing, we will pick an other non played sound if possible
; 	x=0
; 	threshold=0
; 	While x<amount And IsSound(selected) And (SoundStatus(selected)=#PB_Sound_Playing Or threshold>10)
; 		If r>=amount
; 			r=0
; 		Else
; 			r+1
; 		EndIf
; 		x+1
; 		selected=origin+r
; 		threshold+1
; 	Wend
; 	If IsSound(selected)
; 		SoundVolume(     selected,min((soundlevel*volume)/100,100))
; 		SetSoundPosition(selected,0,0) 
; 		If position<>-9999
; 			SoundPan(selected,(position*2*stereoWidth)/screenSizeX-stereoWidth,s)
; 		Else
; 			SoundPan(selected,0,s)
; 		EndIf
; 		ResumeSound(    selected)
; 	Else
; 		Debug Str(selected)+" not sound"
; 		psound(a,position,volume)
; 	EndIf
; 	ProcedureReturn selected
EndProcedure

;--- sound enum
Enumeration 1; liste des groupe via ID de 0 a 255 constant
	;{
	#H2H_SOUND_ID_MENUCLIC
	#H2H_SOUND_ID_MENUACCEPT
	#H2H_SOUND_ID_MENUCANCEL
	#H2H_SOUND_ID_MENUCHANGE
	
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
	
	#H2H_SOUND_ID_COMBO_HIT
	#H2H_SOUND_ID_BLOCK
	
	#H2H_SOUND_ID_METALIMPACTGROUNDMEDIUM
	#H2H_SOUND_ID_METALIMPACTGROUNDHEAVY
	
	#H2H_SOUND_ID_CUTLIGHT
	#H2H_SOUND_ID_CUTMEDIUM
	
	#H2H_SOUND_ID_GUARD_BREAK
	
	#H2H_SOUND_ID_BULLETLIGHT
	#H2H_SOUND_ID_BULLETMEDIUM
	;}
EndEnumeration

Enumeration
	#H2H_SOUND_UI_MENU_CLICK
	#H2H_SOUND_UI_MENU_ACCEPT
	#H2H_SOUND_UI_MENU_CANCEL
	#H2H_SOUND_UI_MENU_CHANGE ; clutch
	
	#H2H_SOUND_UI_BATTLE_KILL_CUT
	#H2H_SOUND_UI_BATTLE_KILL_PIERCE
	#H2H_SOUND_UI_BATTLE_KILL_BLUNT
	#H2H_SOUND_UI_BATTLE_COMBO
	#H2H_SOUND_UI_BATTLE_BLOCK
	#H2H_SOUND_UI_BATTLE_JUMP_LIGHT
	#H2H_SOUND_UI_BATTLE_JUMP_HEAVY
	#H2H_SOUND_UI_BATTLE_LAND_LIGHT
	#H2H_SOUND_UI_BATTLE_LAND_HEAVY
	#H2H_SOUND_UI_BATTLE_GUARD_BREAK
	
	#H2H_SOUND_UI_BATTLE_LAST_PLUS
EndEnumeration
#H2H_SOUND_UI_BATTLE_LAST=#H2H_SOUND_UI_BATTLE_LAST_PLUS-1

Global Dim *soundUI.soundPool(#H2H_SOUND_UI_BATTLE_LAST)

;--- sound enum end

Global NewMap path2DSP.q()
Procedure poolInit(name$,index.i,volume.i=100)
; 	type.s=load_sound(name$,index)
	*p.soundPool=poolCreate(0,index,volume)
	*p\name$=name$
	root$="sound/"+name$
	If fileExist(root$+".wav")
		Dim *p\subSoundId(0)
		If FindMapElement(path2DSP(),root$+".wav")
			*p\subSoundId(0)=path2DSP()
		Else
			AddMapElement(path2DSP(),root$+".wav")
			path2DSP()=DSP_loadWaveFile(root$+".wav")
			*p\subSoundId(0)=path2DSP()
		EndIf
	Else
		k=1
		While fileExist(root$+Str(k)+".wav")
			ReDim *p\subSoundId(k-1)
			If FindMapElement(path2DSP(),root$+Str(k)+".wav")
				*p\subSoundId(k-1)=path2DSP()
			Else
				AddMapElement(path2DSP(),root$+Str(k)+".wav")
				path2DSP()=DSP_loadWaveFile(root$+Str(k)+".wav")
				*p\subSoundId(k-1)=path2DSP()
			EndIf
			k+1
		Wend
	EndIf
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
		addJSONDouble(*parent,#H2H_JSON_SOUND_NEXTVOLUME,*p\sameTimePlayedVolume)
	EndIf
	ProcedureReturn *parent
EndProcedure

Procedure.i poolJSONExportAll(*parent)
	ForEach *allSoundPool()
		*child=AddJSONElement(*parent,*allSoundPool()\id)
		SetJSONObject(*child)
		poolJSONExport(*allSoundPool(),*child)
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
CompilerIf #H2H_MODE=#H2H_MODE_LOAD
Procedure poolJSONImport(*parent)
	*p.soundPool=poolInit(loadJSONString(*parent,#H2H_JSON_SOUND_NAME),loadJSONInteger(*parent,#H2H_JSON_SOUND_ID))
	*p\volume=loadJSONInteger(*parent,#H2H_JSON_SOUND_VOLUME)
	If *p\volume=0
		*p\volume=100
	EndIf
	*p\sameTimePlayed=loadJSONInteger(*parent,#H2H_JSON_SOUND_NEXT)
	If *p\sameTimePlayed
		*p\sameTimePlayed=*allSoundPool(Str(*p\sameTimePlayed))
		*p\sameTimePlayedVolume=LoadJSONDouble(*parent,#H2H_JSON_SOUND_NEXTVOLUME)
		If *p\sameTimePlayedVolume=0
			*p\sameTimePlayedVolume=1
		EndIf
	EndIf
	ProcedureReturn *p
EndProcedure
Procedure poolJSONImportAll(*parent)
	FreeMap(*allSoundPool())
	NewMap *allSoundPool()
	size=JSONArraySize(*parent)
	For s=0 To size-1
		*child=GetJSONElement(*parent,s)
		If *child
			poolJSONImport(*child)
		EndIf
	Next
	ProcedureReturn *parent
EndProcedure
CompilerEndIf
;---- all imports
CompilerIf #H2H_MODE=#H2H_MODE_SAVE

Global *menuClic.soundPool=poolInit("clic",#H2H_SOUND_ID_MENUCLIC)
*menuAccept.soundPool=poolInit("menuaccept",#H2H_SOUND_ID_MENUACCEPT)
*menuCancel.soundPool=poolInit("menucancel",#H2H_SOUND_ID_MENUCANCEL)
*menuChange.soundPool=poolInit("clutch",#H2H_SOUND_ID_MENUCHANGE)

*ballpen_HeavyS.soundPool=poolInit("metalheavywoosh",#H2H_SOUND_ID_METALHEAVYWOOSH,75)

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

*chineseStaff_AttackS.soundPool=poolInit("swishlight",#H2H_SOUND_ID_SWISHLIGHT,75)
*chineseStaff_HeavyS.soundPool=poolInit("swishmedium",#H2H_SOUND_ID_SWISHMEDIUM,75)
*plastic_swish.soundPool=poolInit("plasticswing",#H2H_SOUND_ID_PLASTICSWING,60)

*finger_swishlight.soundPool=poolInit("fingerswishlight",#H2H_SOUND_ID_FINGER_SWISHLIGHT,75)
*finger_swishmedium.soundPool=poolInit("fingerswishmedium",#H2H_SOUND_ID_FINGER_SWISHMEDIUM,75)
*finger_swishheavy.soundPool=poolInit("fingerswishheavy",#H2H_SOUND_ID_FINGER_SWISHHEAVY,75)

*chineseStaff_nDownS.soundPool=poolInit("chopstickndown",#H2H_SOUND_ID_CHOPSTICK_NDOWN)

*penfallSound1.soundPool=poolInit("penfall1",#H2H_SOUND_ID_BALLPEN_FALL_1)
*penfallSound2.soundPool=poolInit("penfall2",#H2H_SOUND_ID_BALLPEN_FALL_2)
*penfallSound3.soundPool=poolInit("penfall3",#H2H_SOUND_ID_BALLPEN_FALL_3)
*jointCrack.soundPool=poolInit("jointcrack",#H2H_SOUND_ID_HAND_CREAK)

*bodyFallSound.soundPool=poolInit("body_fall",#H2H_SOUND_ID_HAND_FALL)
*landSound.soundPool=poolInit("land",#H2H_SOUND_ID_HAND_LAND)

*jumpLightSound.soundPool=poolInit("jump_light",#H2H_SOUND_ID_HAND_JUMPLIGHT)
*jumpHeavySound.soundPool=poolInit("jump_heavy",#H2H_SOUND_ID_HAND_JUMPHEAVY)

*gluestickSwingLight.soundPool=poolInit("gluestickswishlight",#H2H_SOUND_ID_GLUESTICK_SWINGLIGHT,38)
*gluestickSwingMedium.soundPool=poolInit("gluestickswishheavy",#H2H_SOUND_ID_GLUESTICK_SWINGMEDIUM,38)

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

*cutLight.soundPool=poolInit("cutlight",#H2H_SOUND_ID_CUTLIGHT)
*wood_hitCutLight\sameTimePlayed=*cutLight
*plastic_hitCutLight\sameTimePlayed=*cutLight
*cutMedium.soundPool=poolInit("cutlight",#H2H_SOUND_ID_CUTMEDIUM)
*wood_hitCutMedium\sameTimePlayed=*cutMedium
*plastic_hitCutMedium\sameTimePlayed=*cutMedium

*guardBreak.soundPool=poolInit("guardbreak",#H2H_SOUND_ID_GUARD_BREAK,150)

*bulletHitLight.soundpool=poolInit("bulletlight",#H2H_SOUND_ID_BULLETLIGHT)
*bulletHitMedium.soundpool=poolInit("bulletmedium",#H2H_SOUND_ID_BULLETMEDIUM)

Global *killBlunt.soundPool=poolInit("killblunt",#H2H_SOUND_ID_KILL_BLUNT)
Global *killCut.soundPool=poolInit("killcut",#H2H_SOUND_ID_KILL_CUT)
Global *blockSound.soundPool=poolInit("block",#H2H_SOUND_ID_BLOCK)

Global *comboHitSound.soundPool=poolInit("combohit",#H2H_SOUND_ID_COMBO_HIT)

*metalImpactGroundHeavySound.soundpool=poolInit("metalimpactgroundheavy",#H2H_SOUND_ID_METALIMPACTGROUNDHEAVY,125)
*metalImpactGroundHeavySound\sameTimePlayed=*landSound
*metalImpactGroundHeavySound\sameTimePlayedVolume=1.5
*metalImpactGroundMediumSound.soundpool=poolInit("metalimpactgroundmedium",#H2H_SOUND_ID_METALIMPACTGROUNDMEDIUM,125)
*metalImpactGroundMediumSound\sameTimePlayed=*landSound
*metalImpactGroundMediumSound\sameTimePlayedVolume=1.5

*soundUI(#H2H_SOUND_UI_MENU_CLICK)=*menuClic
*soundUI(#H2H_SOUND_UI_MENU_ACCEPT)=*menuAccept
*soundUI(#H2H_SOUND_UI_MENU_CANCEL)=*menuCancel
*soundUI(#H2H_SOUND_UI_MENU_CHANGE)=*menuChange

*soundUI(#H2H_SOUND_UI_BATTLE_KILL_CUT)=*killCut
*soundUI(#H2H_SOUND_UI_BATTLE_KILL_PIERCE)=*killCut
*soundUI(#H2H_SOUND_UI_BATTLE_KILL_BLUNT)=*killBlunt
*soundUI(#H2H_SOUND_UI_BATTLE_COMBO)=*comboHitSound
*soundUI(#H2H_SOUND_UI_BATTLE_BLOCK)=*blockSound
*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_LIGHT)=*jumpLightSound
*soundUI(#H2H_SOUND_UI_BATTLE_JUMP_HEAVY)=*jumpHeavySound
*soundUI(#H2H_SOUND_UI_BATTLE_LAND_LIGHT)=*bodyFallSound
*soundUI(#H2H_SOUND_UI_BATTLE_LAND_HEAVY)=*landSound
*soundUI(#H2H_SOUND_UI_BATTLE_GUARD_BREAK)=*guardBreak
CompilerEndIf

#H2H_SOUND_DYNAMIC_ENABLE=#False
CompilerIf #H2H_SOUND_DYNAMIC_ENABLE
Structure dynamicSound
	*where.location ; game position
	volume.q ; base volume value
	id.q	 ; what channel
EndStructure

Global NewList *allDynamicSounds.dynamicSound()

Procedure dynamicSoundAdd(what.q,x.i,y.i)
	*ds.dynamicSound=AllocateStructure(dynamicSound)
	*ds\id=what
	*ds\where=locationCreate(x,y)
	*ds\volume=DSP_GetPan(what,0)+DSP_GetPan(what,1)<<16
	AddElement(*allDynamicSounds())
	*allDynamicSounds()=*ds
; 	Debug "added"
EndProcedure

; returns true if finished
Procedure.i dynamicSoundLoop(*ds.dynamicSound,whereX.f,whereY.f)
	If DSP_StateEx(*ds\id)<>#DSP_STATUT_PLAYING
		ProcedureReturn #True
	EndIf
; 	Debug "where "+whereX+" "+whereY
	sX.f=screenSizeX
	sY.f=screenSizeY
	lVolume=*ds\volume&$ffff
	rVolume=*ds\volume>>16
	If whereX<*ds\where\x
; 		Debug "diff r "+Str(*ds\where\x-whereX)
		; sound is right to position
		lVolume*(1-((*ds\where\x-whereX)/sX))
		If lVolume<0
			rVolume+lVolume
			If rVolume<0
				rvolume=0
			EndIf
			lVolume=0
		EndIf
	Else
; 		Debug "diff l "+Str(whereX-*ds\where\x)
		; sound is left to position
		rVolume*(1.0-((whereX-*ds\where\x)/sX))
		If rVolume<0
			lVolume+rVolume
			If lVolume<0
				lvolume=0
			EndIf
			rVolume=0
		EndIf
	EndIf
	diff.f=(Abs(*ds\where\y-whereY)-sY)/sY
	If diff>0
		lVolume*(1-diff)
		rVolume*(1-diff)
	EndIf
	DSP_SetPan(*ds\id,Int(lVolume),Int(rVolume))
; 	Debug "Pan "+Hex(DSP_GetPan(*ds\id,0))+" "+Hex(DSP_GetPan(*ds\id,1))
	ProcedureReturn #False
EndProcedure

Procedure dynamicSoundLoopAll(whereX,whereY)
	ForEach *allDynamicSounds()
		If dynamicSoundLoop(*allDynamicSounds(),whereX,whereY)
; 			Debug "killed"
			locationDestroy(*allDynamicSounds()\where)
			FreeStructure(*allDynamicSounds())
			DeleteElement(*allDynamicSounds())
		EndIf
	Next
EndProcedure

Procedure dynamicSoundStopAll()
	ForEach *allDynamicSounds()
		locationDestroy(*allDynamicSounds()\where)
		FreeStructure(*allDynamicSounds())
		DeleteElement(*allDynamicSounds())
	Next
EndProcedure
CompilerEndIf
                  
; Returns the channel where it's played
Procedure.q playPoolSoundNoRec(*pool.soundpool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
	If *pool And volume>0.05
; 		Debug "played "+*pool\name$
		leftRight.f=0.5
		If stereoWidth>0
			If position=-9999
				position=0
			Else
				position=(position*2*stereoWidth)/screenSizeX-stereoWidth
			EndIf
			If position>stereoWidth
				position=stereoWidth
			EndIf
			If position<-stereoWidth
				position=-stereoWidth
			EndIf
			;leftRight.f=(position+stereoWidth)/(stereoWidth*2); from 0 to 1
			leftRight=(position/stereoWidth)*(stereoWidth/100) ; from -0.6 to 0.6
			leftRight=leftRight/2+0.5							 ; from 0.2 to 0.8
		EndIf
		p.f=100
		If variated And SOUND_VARIATION_PERCENT>0 And SOUND_VARIATION_ITERATION>0
			; we take an average so we have high chances to have a not very altered sound
			p=0
			For i=1 To SOUND_VARIATION_ITERATION
				p+(100+Random(2*SOUND_VARIATION_PERCENT)-SOUND_VARIATION_PERCENT)
			Next
			p/SOUND_VARIATION_ITERATION
		EndIf
		If slomo
			If TIME_SLOMO>=0.5
				If TIME_SLOMO<=2.0
					p*TIME_SLOMO
				Else
					p*2.0
				EndIf
			Else
				p*0.5
			EndIf
		EndIf
; 		Debug "pitch "+StrD(p)
		p=DSP_PITCH_MAP_FtU((p*pitchCoef))
		volume=volume*$ffff*(*pool\volume/100.0)
		volume=(volume*soundlevel)/100; apply the global sound volume
		If volume>0
			If volume>$ffff
				volume=$ffff
			EndIf
			CompilerIf #H2H_SOUND_DYNAMIC_ENABLE
			id.q=DSP_PlaySoundEx(*pool\subSoundId(Random(ArraySize(*pool\subSoundId()))),0,volume*(1-leftRight),volume*leftRight,p)
; 			Debug currentMenuIndex
			If currentMenuIndex=#H2H_MENU_BATTLE And stereoWidth>0
				dynamicSoundAdd(id,position,screenFocusHeight)
			EndIf
			ProcedureReturn id
			CompilerElse
			ProcedureReturn DSP_PlaySoundEx(*pool\subSoundId(Random(ArraySize(*pool\subSoundId()))),0,volume*(1-leftRight),volume*leftRight,p)
			CompilerEndIf
		EndIf
	EndIf
	ProcedureReturn 0
EndProcedure

Procedure playPoolSound(*pool.soundPool,position.i=-9999,variated=1,pitchCoef.f=1,volume.f=1)
	If volume<=0 Or volume**pool\volume<=1
		ProcedureReturn
	EndIf
	If *pool
		variated*soundVariationEnabled
		playPoolSoundNoRec(*pool,position,variated,pitchCoef,volume)
		If *pool\sameTimePlayed
; 			Debug "recursive"
			playPoolSound(*pool\sameTimePlayed,position,variated,pitchCoef,volume**pool\sameTimePlayedVolume)
		EndIf
	EndIf
EndProcedure

Procedure poolCopy(*p1.soundPool,*p2.soundPool)
	If *p2
		CopyStructure(*p2,*p1,soundPool)
	EndIf
EndProcedure

Global currentMusicChannel.q=-1 ; from the DSP

Macro musicLevelRefresh()
	If currentMusicChannel>=0:DSP_SetPan(currentMusicChannel,$ffff*musicLevel/100,$ffff*musicLevel/100):EndIf
EndMacro

Macro musicStop()
	If currentMusicChannel>=0:DSP_StopSoundEx(currentMusicChannel):EndIf
EndMacro
	
Procedure musicPlay(what.q,looped.i=#True)
	Debug "played "+Str(what)+" looped "+Str(looped)
	If looped
		If currentMusicChannel>=0
			If DSP_GetSoundId(currentMusicChannel)=what And DSP_StateEx(currentMusicChannel)<>#DSP_STATUT_PAUSE
				; Do not replay the same music id
				Debug "already playing"
				ProcedureReturn
			EndIf
			musicStop()
		EndIf
		currentMusicChannel=DSP_PlaySoundEx(what,0,0,0,0,$ff,0,looped)
		musicLevelRefresh()
	Else
		DSP_SetPan(DSP_PlaySoundEx(what,0,0,0,0,$ff,0,looped),$ffff*musicLevel/100,$ffff*musicLevel/100)
	EndIf
EndProcedure

Structure musicEx
	id.i
	path$
	idDSP.q
	volume.i ; in %, 100% is $8000 in DSP volume, capped at ~200% at $ffff
	looped.b ; by default true
EndStructure

Global NewMap *allMusic.musicEx()

Procedure.i musicExCreate(newId.i,newPath$,isLooped.b=#True)
; 	Debug "created music "+Str(newId)+" from "+newPath$
	*m.musicEx=AllocateStructure(musicEx)
	*m\path$=newPath$
	*m\id=newId
	*allMusic(Str(newId))=*m
	*m\volume=100
	*m\looped=isLooped
	ProcedureReturn *m
EndProcedure

Procedure musicExPlay(*m.musicEx)
	If *m
		Debug "playing "+*m\path$
		If Not *m\idDSP
			*m\idDSP=DSP_loadWaveFile("music\"+*m\path$+".wav")
		EndIf
		musicPlay(*m\idDSP,*m\looped)
	Else
		Debug "music structure null"
	EndIf
EndProcedure

#H2H_MUSIC_MENU=1
#H2H_MUSIC_MENU_PATH="Menu"
; #H2H_MUSIC_MENU_PATH="music/Menu.ogg"

#H2H_MUSIC_THEME01=2
#H2H_MUSIC_THEME01_PATH="Main"
; #H2H_MUSIC_THEME01_PATH="music/Main.ogg"

#H2H_MUSIC_STARTUP=3
#H2H_MUSIC_STARTUP_PATH="counter"
; #H2H_MUSIC_STARTUP_PATH="music/counter.ogg"
#H2H_MUSIC_VICTORY=4
#H2H_MUSIC_VICTORY_PATH="victory"
; #H2H_MUSIC_VICTORY_PATH="music/victory.ogg"
#H2H_MUSIC_DEFEAT=5
#H2H_MUSIC_DEFEAT_PATH="defeat"
; #H2H_MUSIC_DEFEAT_PATH="music/defeat.ogg"

#H2H_MUSIC_THEME02=6
#H2H_MUSIC_THEME02_PATH="Stick_da_being"
; #H2H_MUSIC_THEME02_PATH="music/Stick_da_being.ogg"

#H2H_MUSIC_THEME03=7
#H2H_MUSIC_THEME03_PATH="Pouwap"
; #H2H_MUSIC_THEME03_PATH="music/Pouwap.ogg"

#H2H_MUSIC_STARTUP03=8
#H2H_MUSIC_STARTUP03_PATH="Pouwap_intro"
; #H2H_MUSIC_STARTUP03_PATH="music/Pouwap_intro.ogg"

CompilerIf #H2H_MODE=#H2H_MODE_SAVE
musicExCreate(#H2H_MUSIC_MENU,#H2H_MUSIC_MENU_PATH)
musicExCreate(#H2H_MUSIC_THEME01,#H2H_MUSIC_THEME01_PATH)
musicExCreate(#H2H_MUSIC_STARTUP,#H2H_MUSIC_STARTUP_PATH,#False)
musicExCreate(#H2H_MUSIC_VICTORY,#H2H_MUSIC_VICTORY_PATH,#False)
musicExCreate(#H2H_MUSIC_DEFEAT,#H2H_MUSIC_DEFEAT_PATH,#False)
musicExCreate(#H2H_MUSIC_THEME02,#H2H_MUSIC_THEME02_PATH)
musicExCreate(#H2H_MUSIC_THEME03,#H2H_MUSIC_THEME03_PATH)
musicExCreate(#H2H_MUSIC_STARTUP03,#H2H_MUSIC_STARTUP03_PATH,#False)
	
Procedure musicJSONExport(*parent,*m.musicEx)
	addJSONInteger(*parent,"id",*m\id)
	addJSONString(*parent,"path",*m\path$)
	If *m\volume<100
		addJSONInteger(*parent,"volume",*m\volume)
	EndIf
	addJSONInteger(*parent,"looped",*m\looped)
EndProcedure

Procedure.i musicJSONExportAll(*parent) ; parent must be a valid json array
	ForEach *allMusic()
		*e=AddJSONElement(*parent)
		SetJSONObject(*e)
		musicJSONExport(*e,*allMusic())
	Next
	ProcedureReturn *child
EndProcedure
	
CompilerElse
	
Procedure.i musicJSONImport(*parent)
	*m.musicEx=musicExCreate(loadJSONInteger(*parent,"id"),loadJSONString(*parent,"path"))
; 	Debug "imported "+*m\path$
	*child=GetJSONMember(*parent,"volume")
	If *child
		*m\volume=loadJSONInteger(*parent,"volume")
	Else
		*m\volume=100 ; TODO constant
	EndIf
	*m\looped=loadJSONInteger(*parent,"looped")
; 	Debug "is looped "+*m\looped
	If *m\volume<0
		*m\volume=0 ; a 0 volume sound is a bit dumb but why not
	EndIf
	ProcedureReturn *m
EndProcedure

Procedure musicJSONImportAll(*parent)
	size=JSONArraySize(*parent)-1
	For i=0 To size
		musicJSONImport(GetJSONElement(*parent,i))
	Next
EndProcedure
CompilerEndIf

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
		*hs\blocked=*allSoundPool(Str(*hs\blocked))
	EndIf
	*hS\light=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_LIGHT)
	If *hS\light
		*hs\light=*allSoundPool(Str(*hs\light))
	EndIf
	*hS\medium=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_MEDIUM)
	If *hS\medium
		*hs\medium=*allSoundPool(Str(*hs\medium))
	EndIf
	*hS\heavy=loadJSONInteger(*parent,#H2H_JSON_SOUND_CLASS_ID_HEAVY)
	If *hS\heavy
		*hs\heavy=*allSoundPool(Str(*hs\heavy))
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
; 		Debug Str(damage)+" threshold "+*hS\lightThreshold+" "+*hS\mediumThreshold+" "+*hS\heavyThreshold
		If damage<*hS\lightThreshold
			playPoolSound(*hS\blocked,position)
; 			Debug "played block"
			ProcedureReturn
		EndIf
		If damage<*hS\mediumThreshold
			playPoolSound(*hS\light,position)
; 			Debug "played light"
			ProcedureReturn
		EndIf
		If damage<*hS\heavyThreshold
			playPoolSound(*hS\medium,position)
; 			Debug "played medium"
			ProcedureReturn
		EndIf
		playPoolSound(*hS\heavy,position)
; 			Debug "played heavy"
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
	If *hSM And Not demoFight
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
; CursorPosition = 599
; FirstLine = 573
; Folding = -----X-0-
; Markers = 919
; EnableXP
; CPU = 1