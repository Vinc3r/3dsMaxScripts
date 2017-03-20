/*

USELESS since 3dsMax 2013

	Description : 
		Show the Isolate Selection dialog on the top-left rather than smack-dab in the middle of the viewport. Replace original Isolate Selection in menus and shortcuts.

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About : 
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you do.

*/

macroScript isolateSelection
	category:"Vinc3rz tools"
	toolTip:"Isolate selection"
	ButtonText:"Isolate Selection"
(
	macros.run "Tools" "Isolate_Selection"
	SetDialogPos Iso2Roll [0,215]
)
