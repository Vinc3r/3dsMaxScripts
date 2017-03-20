/*

	Description :
		When you want lock an object like a camera, you must check each box on the hierarchy > link info Same thing when you want to unlock. This script automatically do it for all entries.

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About :
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you 

*/

macroScript lockUnlock
	category:"Vinc3rz tools"
	toolTip:"Lock/Unlock"
	ButtonText:"Lock/Unlock"
(
	rollout lockUnlock "lockUnlock" width:84 height:63
	(
		label lbl1 "Links info :" pos:[2,2] width:80 height:15
		button btn1 "Lock All !!§" pos:[2,19] width:80 height:20
		button btn2 "Unlock" pos:[2,41] width:80 height:20
		on btn1 pressed  do
			setTransformLockFlags selection #all
		on btn2 pressed  do
			setTransformLockFlags selection #none
	)
	createDialog lockUnlock style:#(#style_titlebar, #style_toolwindow, #style_sysmenu)
)
