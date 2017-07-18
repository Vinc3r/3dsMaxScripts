/*
		
	Description :
		This script reset pivot, transforms, scale and xform of an editpoly.	

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About : 
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you do.
		Thanks to Stephane George for some piece of code.
	
*/

macroScript geometryFix
	category:"Vinc3rz tools"
	toolTip:"Geometry fix"
	ButtonText:"Geometry fix"

(
	FixAll
	FixAllBut
	PivotZero
	Msg = stringStream "empty\n"
	try(destroyDialog ::FixRoll)catch()
	global DialogIniFile = getDir #plugcfg + "/geometryFix_Pos.ini"

	rollout FixRoll "Geometry Fix"
	(
		button btnReset "Reset Selection" pos:[2,2] width:120 height:30
		button btnReset2 "Reset * but pivot" pos:[2,34] width:120 height:30
		button btnPivot0 "Pivot [0,0,0]" pos:[2,64] width:120 height:20
		edittext edt1 "" pos:[0,87] width:120 height:20

		on btnReset pressed do
		(
			free Msg
			for o in selection do FixAll(o)
			format "% Objet(s) Normalisé(s)\n" selection.count to:Msg
			FixRoll.edt1.text = Msg as string
		)
		
		on btnReset2 pressed do
		(
			free Msg
			for o in selection do FixAllBut(o)
			format "% Objet(s) Normalisé(s)\n" selection.count to:Msg
			FixRoll.edt1.text = Msg as string
		)
		
		on btnPivot0 pressed do
		(
			free Msg
			for o in selection do PivotZero(o)
			format "Pivot(s) on [0,0,0]\n" to:Msg
			FixRoll.edt1.text = Msg as string
		)
		
		on FixRoll moved pos do
		(
			setIniSetting DialogIniFile "FixRoll" "Position" (pos as string)
		)
	)
	DialogPos = execute (getIniSetting DialogIniFile "FixRoll" "Position")
	if DialogPos == OK do DialogPos = [124,110]
	CreateDialog FixRoll 124 110 DialogPos.x DialogPos.y style:#(#style_titlebar, #style_toolwindow, #style_sysmenu)

	fn FixAll o =
	(
		o.pivot = o.center
		ResetTransform o
		ResetScale o
		ResetXForm o			
		convertToPoly(o)
	)
	
	fn FixAllBut o =
	(
		ResetTransform o
		ResetScale o
		ResetXForm o			
		convertToPoly(o)
	)
	
	fn PivotZero o =
	(
		o.pivot = [0,0,0]
	)
)