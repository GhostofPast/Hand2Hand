;- Notes for FlameofChange by FlameofChange
;{ 2022
; 			12/01/2022
; ☼=DONE=☼ make a rematch system
; --DROP-- bufferize the afftexts sprites (find a solution)
; ======== Display combo animation when hoovering them
; ☼=DONE=☼ Tutorial explains the stats (with + and -) and controls
; ☼=DONE=☼ controls options + save system
; ☼=DONE=☼ mouse
; ☼=DONE=☼ windowed system
; ☼=DONE=☼ gluestick hit sound damage variation
; ☼=DONE=☼ option for enabling/disabling dynamic frame loading
; ☼=DONE=☼ shaking screen when taking damage
; ☼=DONE=☼ shaking feedback screen when taking damage
; ☼=DONE=☼ get a working icon for the executable
; 			13/01/2022
; --DROP-- Double framerate but half all speed ?
;			24/02/2022
; ☼=DONE=☼ Seperate shadow display
; ☼=DONE=☼ Slowmo command
; ======== Interface elements sprites
; ☼=DONE=☼ Fix auto jump when hit
; ☼=DONE=☼ Disturbed movement system when attacked
; ☼=DONE=☼ Push system (with border check)
; ☼=DONE=☼ True afftext color
;			19/04/2022
; ☼=DONE=☼ Compress the images with 32x32 chunks
;			11/05/2022
; ☼=DONE=☼ Only store one version of a frame, delete on flip except for two occurences
; --DROP-- Bufferize to avoid frequent image flip
;			24/05/2022
; ☼=DONE=☼ Positive combo feedback
; ======== Negative combo feedback
; ☼=DONE=☼ recovery feedback
; 			24/07/2022
; ☼=DONE=☼ Juice up the animations !
;			11/09/2022
; ☼=DONE=☼ Controls options save
; ☼=DONE=☼ Two player selection screen
; 			02/10/2022
; ☼=DONE=☼ Screen options
;}
;{ 2023
;			27/01/2023
; ======== Layers of scrolling in arenas
; ☼=DONE=☼ Guard amount ?
;			18/02/2023
; ☼=DONE=☼ Auto check resolution
;			21/02/2023
; ======== Load sound when necessary
;			08/03/2023
; ☼=DONE=☼ Fade black when in/out of game
;			12/03/2023
; ☼=DONE=☼ Random class selection
; ☼=DONE=☼ Random stance selection
; ☼=DONE=☼ Random terrain selection
; ☼=DONE=☼ Random exclusive option
; ☼=DONE=☼ Mirror option
;			05/05/2023
; ☼=DONE=☼ Land wind effects
;			22/06/2023
; ☼=DONE=☼ 30, 50, 60, 120 and 144 fps options
;			24/06/2023
; ☼=DONE=☼ Rework player delta loop because of frameindicator overflow
;			26/06/2023
; ☼=DONE=☼ Rework player physics when delta>1
; --DROP-- Threaded player imputs
;			07/07/2023
; ☼=DONE=☼ Bot class selection
; ======== Rework interface sounds
; ☼=DONE=☼ Joystick options
; ☼=DONE=☼ Rework joystick detection & loop
;			08/07/2023
; ☼=DONE=☼ Index all structures into allocated arrays for easier access
;			[Done] location
;			[Done] frame
;			[Done] animation
;			[Done] gadget
;			[Done] class
;			[Done] statistics
;			[Done] stance
;			[Done] player
;			[Done] particle
;			[Done] damage gadget
;			[Done] damage data
; ======== Use interfaces to make the code lighter
; ☼=DONE=☼ Cleanup combo icons
;			17/07/2023
; ======== Fix the OpenGL x86 rotated color sprite display
; ======== Compress the images with pallet
; ======== Recode pixel collision
;			02/08/2023
; ☼=DONE=☼ Selection animation
; ======== Victory animation
;			04/08/2023
; ☼=DONE=☼ frame load buffer (load a certain amount per frame)
;			05/08/2023
; ☼=DONE=☼ frame unload buffer (load a certain amount per frame)
; --DROP-- load wind only at start phase
;			12/08/2023
; ☼=DONE=☼ enable player movement at CanDoNext
;			26/10/2023
; ☼=DONE=☼ Manual screenshot & clipboard
;			30/10/2023
; ☼=DONE=☼ Rework HP bar
;			31/10/2023
; ☼=DONE=☼ idle variant in menus
; ☼=DONE=☼ Mirror in selection menu shows the mirrored class
; ☼=DONE=☼ Random in selection menu shows something (to be decided)
; ☼=DONE=☼ Hex key Heavy 1 - Heavy 2
; ☼=DONE=☼ Hex key Side 1 - Back 1 - Up 2
;			01/11/2023
; ☼=DONE=☼ Standardize image names
; ☼=DONE=☼ Standardize animation names
; ☼=DONE=☼ Standardize rawdata names
; ☼=DONE=☼ Ballpen Side 1 - Back 4 - Up 2 - Neutral 6 - Side 7
; ☼=DONE=☼ Ballpen Side 1 - Back 4 - Up 2 - Side 6
; ☼=DONE=☼ Ballpen Back 1 - Heavy 2
;			02/11/2023
; ☼=DONE=☼ Gray out dead player HUD
; ======== Spawn one player then the other at start, shift camera from one to another with half black mask if needed
; ☼=DONE=☼ Custom cannon sound
; ☼=DONE=☼ Dodge
;			03/11/2023
; ☼=DONE=☼ More colored wind effects when background is too white
;			04/11/2023
; ======== Class selection icon fade & size dynamic transition
; ☼=DONE=☼ Clean keys in menus when switching to another while still pressed
;			21/11/2023
; ☼=DONE=☼ Export remaked Unarmed Heavy 1 - Neutral 4
; ======== Animation alternates for stances
; ☼=DONE=☼ Recalculate jump animation speed minimum and maximum
; 			01/12/2023
; ======== Pause system
;			[Done] Black screen transition
;			[Done] Quit when escaping only in pause
;			       Interrupt and resume sounds
;			[Done] Start game
;			[Done] End Game
;			[Done] During game
;			[Done] Pause quick fading
; 			03/12/2023
; ☼=DONE=☼ Move hit frames into an animation in struct
; --DROP-- Add Class selection idle
; ☼=DONE=☼ Add Class selection selected
; ☼=DONE=☼ Add Class selection selecting
; ☼=DONE=☼ Rename jump into special
; ☼=DONE=☼ Jump with special + up
; ☼=DONE=☼ Dodge with special
; ☼=DONE=☼ Parry with special + down
; ======== Parry only when coming from front
; ======== Countdown in rythm with the music
;}
;{ 2024
; 			13/02/2024
; ======== Migrate to spritesheet system & switch in code
;           01/05/2024
; ☼=DONE=☼ Flicker HP bar in red when low
; ======== VFX and SFX when the outer HP bar is broken
;           15/05/2024
; ======== Repeating attacks
;           16/05/2024
; ☼=DONE=☼	 Chopstick Up 1 - Side 7
; ☼=DONE=☼ Chopstick Back 1 - Heavy 2 - Back 2 - Side 8 
;           18/05/2024
; ☼=DONE=☼ Ballpen Down 1 - Down 3 - Down 4
; ☼=DONE=☼ Damage loop change
;           20/05/2024
; ======== ArePlayersEnemy
; ======== AreGroupsEnemy
;           23/05/2024
; ======== Joystick sensibility settings
;           27/05/2024
; ☼=DONE=☼ JSON flags
;		[Done]	Frames
;		[Done]	animations
;		[Done] classes
; ☼=DONE=☼ Seperate jump button option
; ☼=DONE=☼ Seperate parry button option
; ☼=DONE=☼ Seperate dash button option
;           11/06/2024
; ======== Joystick mode : classic, legacy and custom
; ======== Joystick settings explicit JSON button names
; ======== Save Joystick ID for player
; ======== Detect joystick entry and exit + notification
;           03/06/2024
; ☼=DONE=☼ Import/export game constants in the JSON
;           28/08/2024
; ======== Tutorial scaled for screen sizes
;           29/08/2024
; ☼=DONE=☼ Chopstick Down 1 - Down 2 - Back 5 - Side 9
;           13/09/2024
; ======== Text color code
; ======== Cyrilic font
; ☼=DONE=☼ Export strings to langage file
; ☼=DONE=☼ Read langage file
; ☼=DONE=☼ Langage option
; ======== Langage detection
; -=DROP=- Button structure to save string
;           08/10/2024
; ☼=DONE=☼ Gluestick idle 2
; ☼=DONE=☼ Gluestick idle 3
; ☼=DONE=☼ Gluestick Down 1 - Side 6
; ☼=DONE=☼ Gluestick Down 1 - Down 2
;           23/10/2024
; ☼=DONE=☼ Integrate the DSP made by nemerod
; ======== Integrate the controler system made by nemerod
; ☼=DONE=☼ AZZERTY/QWERTY true switch
;           30/10/2024
; ☼=DONE=☼ Hexkey Side 1 - Side 2 - Side 3 - Side 4 - Neutral 4
;           08/11/2024
; ☼=DONE=☼ Hexkey Down 1 - Down 4 - Heavy 3
;           10/11/2024
; ======== Seperate flesh impact sounds from plastic, metal and wood
;           11/11/2024
; ☼=DONE=☼ Put big numbers sprites in the icon.png
;           15/11/2024
; ======== player hitbox size constant not breaking everything
;           16/11/2024
; ☼=DONE=☼ Remove previousDelta from functions
; ☼=DONE=☼ Revamp AI to take dodge and parry in account
; ☼=DONE=☼ Confirmation for reset to default
; ☼=DONE=☼ Metal ground impact sound effect
;           17/11/2024
; ======== Sort expored localization file at runtime
; ☼=DONE=☼ Seperate special action and dodge action
; ☼=DONE=☼ Make control indexes coherent within constants
; ☼=DONE=☼ Control menu loop make it more compact
;           18/11/2024
; ☼=DONE=☼ Gray out unasigned in control menu
; ☼=DONE=☼ Round duration settings
;           19/11/2024
; ☼=DONE=☼ Unload player classes only at the end of a finished match
;           04/12/2024
; ======== Fancy effects / particles on heavy attack combo icon
; ======== Fancy effects / particles on heavy attack
; ======== Special sound when starting heavy attacks
; --DROP-- Seperate active & passive winds in concerned animations
; ======== Make a display difference between active & passive winds
; ======== Branch the revamped active & passive winds with the actual wind display modes
; ☼=DONE=☼ Sync landing wind effects with current wind display mode
; ☼=DONE=☼ Actually level the sounds when volume is changed, instead of when the sound is played
; ======== Apply high contrast settings on displayed stats in menus
; ======== Color effect on HP bar and stamina bar when a HP point is regenerated
; ======== AI parry hold command
; ☼=DONE=☼ Select hand side in VS AI
; ☼=DONE=☼ Select hand side settings
; ======== Debug command to freeze/unfreeze the game
; ======== Settings to change screen
; ======== First start pop up to pick resolution, screen and language
;           06/12/2024
; ======== Check for special char spacement in afftext and get afftext length
; ======== Rename afftext commands for better code readability
; ☼=DONE=☼ Main menu tooltips
;           08/12/2024
; ☼=DONE=☼ Random demo fight with hard AI when inactive for 1mn
;}
;{ 2025
;           07/01/2025
; ======== Export JSON in ascii to compress further
;           11/01/2025
; ☼=DONE=☼ Wood cut sound made with paper tearing
; ☼=DONE=☼ Plastic cut sound made with duct tape
;           03/02/2025
; --DROP-- Intelligent language json save : add what's new, change what's there and remove what's no longer there
; ☼=DONE=☼ Debug command to swap both players
; ☼=DONE=☼ Import/export debug commands
;           16/02/2025
; ☼=DONE=☼ Import/Export background (json)
;           24/02/2025
; ☼=DONE=☼ Constants ID for static sounds with json import/export (i.e. menu click, jump/land)
; ☼=DONE=☼ Constant import/export for sound variation
; ☼=DONE=☼ DSP - Check if sound is played
; ======== Dynamic sound position
; ☼=DONE=☼ Hex key Back 1 - Neutral 5 - Down 5 - Up 3
; ☼=DONE=☼ Hex key Up 1 - Down 4 - [Down 6]
;           28/02/2025
; ☼=DONE=☼ Constants ID for static music with json import/export (i.e. menu theme)
; ======== Load on demand / Load everything sound option
; ☼=DONE=☼ Import/Export controls as string (but integers works as well)
;			[Done] Keyboard
;			[Done] Joystick (beware it has different button names !)
; ☼=DONE=☼ Regain stamina when succesfuly finishing combos
; ☼=DONE=☼ Stamina is spend regaining guard faster
; ☼=DONE=☼ Tutorial pages build one image instead of redisplaying everything
;           05/03/2025
; --DROP-- Frame flag were the animation is counted as hit if hit at this point, no matter if the next frames hit or not
;           07/03/2025
; ======== Shake button when interacted/clicked
; ======== Display attack list on the side of the screen
; ======== Display successful hits and combos on the side of the screen
; ======== take Y in account for play sound (just reduce the volume if too far)
;           09/03/2025
; ======== More debug toggle to switch between none, just hitbox and additional text
;           10/03/2025
; ======== Data give soundpool
; ☼=DONE=☼ Hexkey Heavy 1 - [Neutral 6 - Neutral 7 - Neutral 8]
; ☼=DONE=☼ Hexkey Back 1 - [Side 5 - Neutral 9]
;           13/03/2025
; ☼=DONE=☼ Hexkey Side 1 - Back 2 - [Neutral 10 - Neutral 11 - Back 3]
;           15/03/2025
; ☼=DONE=☼ Rework Hexkey Movement Front
; ☼=DONE=☼ Rework Hexkey Movement Back
; ======== Enable pause/unpause during intro
; ======== Improve training terrain to better see borders, ground and height difference
;           16/03/2025
; ======== AI strategy to pick pushing attacks or not depending on the weight of the target
;           17/03/2025
; ☼=DONE=☼ Insert Unarmed Side 5 2 new before the Side 5 2
; ☼=DONE=☼ Unarmed Back 1 - [Down 4 - Down 5]
; ☼=DONE=☼ Unarmed Heavy - Neutral - Down - [Down 6]
; ☼=DONE=☼ Unarmed Up 1 - Down 2 - [Down 7]
; ☼=DONE=☼ Unarmed Up 1 - Down 2 - [Back 4]
;           20/03/2025
; ======== Block sounds between each material pair
; ☼=DONE=☼ Stats name in stat lists
; ☼=DONE=☼ Display KO on top of a KO hand icon
; ======== Player get HUD side
; ======== Store the class icons cleanly (crop and data)
;           27/03/2025
; ☼=DONE=☼ Move Global loop to main program instead of in a procedure
; ======== Confirm updating the resolution
; ======== Stretch resolution when fullscreen
; ======== Level of zoom
; ======== Grow/shrink stat bars when updated
; ======== Revamp combo icons display to avoid display bugs
;           03/04/2025
; ======== Allow multiple joystick buttons for one action
;           06/04/2025
; ☼=DONE=☼ Rename ia into ai in the code
;           21/04/2025
; ======== Bullet impact flesh sound
;					Blocked
;			[Done]	Light
;			[Done]	Medium
;					Heavy
;           22/04/2025
; ======== Store text elements and update them as necessary to avoid concatenning
;           24/04/2025
; ======== Play gadget sound when spawned
;           06/06/2025
; ☼=DONE=☼ Rework cut, pierce and blunt stats
;           08/06/2025
; ☼=DONE=☼ Gluestick Side 2 add a frame between 3 and 4
; ☼=DONE=☼ Gluestick Side 2 add a shockwave at the end
;           09/06/2025
; --Drop-- Hexkey Down 4 add ground impact sound with the metal impact
;			21/06/2025
; ======== Ammo system
;			24/06/2025
; ======== Control settings to lock attack direction
;           01/07/2025
; ======== Cannonball impact flesh sound
;					Blocked
;					Light
;					Medium
;					Heavy
; ======== Finger crack
;					Blocked
;					Light
;					Medium
;					Heavy
; ======== hurtshift is negative + display
;           27/08/2025
; ☼=DONE=☼ reindex #H2H_ANIMATIONTYPE with #H2H_CLASS_ANIMATION
;           02/09/2025
; ☼=DONE=☼ Import/export font
; ======== Font char indexation
; ☼=DONE=☼ Font size import/export
; ======== Auto zoom char size
; ☼=DONE=☼ 32x32 char redraw
; ======== Fuse animation gadget and damage gadget
; ======== Integrate animation gadget for player hand display
;           03/09/2025
; ======== Transform Dim in animation into allocate memory
;           14/09/2025
; ☼=DONE=☼ Investigate why keeping parry until no guard remaining is kept counted as parried
;           13/11/2025
; ======== Move class content from data to data_class
; ☼=DONE=☼ Move class string from language_XX to string_class_XX
; ☼=DONE=☼ Move hardcoded strings from code to just json
; ======== Compress and decompress json
;           14/11/2025
; ☼=DONE=☼ Class stance badge (= added passive)
; 					Smart : + parry, + dodge, + guard, regain guard when hitting enemy (Ballpen Black, Hexkey Steel and Aluminum, Ruler plastic)
;					Bulldozer : + push strength, + push resistance, + guard damage, + stun duration (Ballpen Red, Gluestick full and empty)
; 					Nervous : + animation speed, worse recovery (Ballpen green, unarmed speed and hyperactive), - dodge duration, + dodge reload speed, 
;					Resillient : + stamina bar on successful combo, faster HP regen from stamina bar, faster guard regen from stamina bar (Ballpen blue)
; 					Wall : + damage resistance, + damage resistance on the extra HP, + guard damage resistance (Unarmed Defense, Ruler Wood)
;					Evader : + dodge regen speed, faster dodge in/out, can dodge during recovery (Chopstick wood, Unarmed dexterity)
;					Bruiser : +damage against recovering target, - Push against enemy (Chopstick metal, Unarmed Power, Hexkey Aluminum)
;					Balanced : + damage, + damage resistance (Unarmed Balanced, Ruler metal)
;					Technician : + projectile damage, + projectile guard damage, + projectile ammo, + projectile resistance
; ☼=DONE=☼ Gadget delta factor
;           25/11/2025
; ☼=DONE=☼ Make combo count & effects dynamic in player struct
; ☼=DONE=☼ Fuse stance color and color intensity into a single RGBA value
;}
; 2026
;{
;           27/01/2026
; ======== Contrast checker
; ======== Preview option results in the UI
; IDE Options = PureBasic 6.01 LTS (Windows - x64)
; CursorPosition = 375
; FirstLine = 351
; Folding = -
; EnableXP
; DPIAware
; CPU = 4