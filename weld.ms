/*

	Description :
		This script weld easily at a default value of 0.001

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About :
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you 
	
*/

macroScript Weld
	category:"Vinc3rz tools"
	toolTip:"Weld"
	ButtonText:"Weld"

(
	global weldDialog
	global weldTreshold = 0.001
	global arrTresh = #(.0001,.001,.01,.1,1,10,100)
	weldMyFuckingsVertex
	try(destroyDialog ::weldDialog)catch()
	global DialogIniFile = getDir #plugcfg + "/weld_Pos.ini"
	
	rollout weldDialog "Weld" width:78 height:48
	(
		button btnWeld "Weld" pos:[2,24] width:74 height:20
		spinner spnValue "" pos:[2,4] width:60 height:16 range:[0.0001,100,0.001] scale:0.001
		dropdownList ddlPresets "" pos:[60,2] width:16 height:21 items:#("0.0001","0.001", "0.01", "0.1","1","10","100")
		--label lblInfo "nothing to say" pos:[4,47] width:74 height:15
		on btnWeld pressed do
		(
			for o in selection do weldMyFuckingsVertex o spnValue.value
		)
		on ddlPresets selected itm do
		(
			spnValue.range = [.0001,100,arrTresh[itm]]
			print spnValue.value
		)
		on weldDialog moved pos do
		(
			setIniSetting DialogIniFile "weldDialog" "Position" (pos as string)
		)
	)
	DialogPos = execute (getIniSetting DialogIniFile "weldDialog" "Position")
	if DialogPos == OK do DialogPos = [85,385]
	CreateDialog weldDialog 78 48 DialogPos.x DialogPos.y style:#(#style_titlebar, #style_toolwindow, #style_sysmenu)

	function weldMyFuckingsVertex o weldTreshold =
	(
		if(classOf o==Editable_Poly) then
		(
			o.EditablePoly.SetSelection #Vertex #{1..(o.verts.count)}
			o.weldThreshold = weldTreshold
			o.EditablePoly.weldFlaggedVertices ()
			o.EditablePoly.SetSelection #Vertex #{1..1}
		)else
			(
				--lblInfo "not editpoly !"
			)
	)
)
