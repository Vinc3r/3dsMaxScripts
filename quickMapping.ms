/*
		
	Description :
		This script apply a box mapping with the same value on lenght, width and height.

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About : 
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you do.
	
*/

macroScript quickMapping
category:"Vinc3rz tools"
toolTip:"Quick mapping"
ButtonText:"Quick mapping"
(
	try(destroyDialog ::quickMappingRoll)catch()
	global DialogIniFile = getDir #plugcfg + "/quickMapping_Pos.ini"
	
	rollout quickMappingRoll "Quick Mapping"
	(
		spinner valeur "" pos:[2,2] width:55 height:16 range:[0,1000,1] scale:0.5
		button btnBoxIt "Boxmap !" pos:[2,20] width:55 height:15
		button btnDec ".1" pos:[2,36] width:27 height:15
		button btnHalf ".5" pos:[30,36] width:27 height:15
		button btn1 "1" pos:[2,52] width:27 height:15
		button btn2 "2" pos:[30,52] width:27 height:15
		function mapMe mapSize =
		(
			if selection != undefined then
			(
				local i = 0
				local uvMap = Uvwmap mapType:4 length:mapSize width:mapSize height:mapSize name:"quickMapping"
				for obj in selection do
				(
					if validModifier obj uvMap then
					(
						if (obj.modifiers[1] as String == "Uvwmap:quickMapping") then (deleteModifier obj 1)
						addModifier obj uvMap
						i = i + 1						
					)
				)
			)
		)
		on btnBoxIt pressed do (mapMe valeur.value)
		on btnDec pressed do (mapMe 0.1)
		on btnHalf pressed do (mapMe 0.5)
		on btn1 pressed do (mapMe 1)
		on btn2 pressed do (mapMe 2)
		on quickMappingRoll moved pos do
		(
			setIniSetting DialogIniFile "quickMappingRoll" "Position" (pos as string)
		)
	)
	DialogPos = execute (getIniSetting DialogIniFile "quickMappingRoll" "Position")
	if DialogPos == OK do DialogPos = [59,68]
	createDialog quickMappingRoll 59 68 DialogPos.x DialogPos.y style:#(#style_titlebar, #style_toolwindow, #style_sysmenu) 
)
