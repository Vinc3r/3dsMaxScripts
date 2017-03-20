/*

USELESS since 3dsMax 2013

	Description :
		Allow to easily remove a background image assigned to the viewport (alt +b key) (by default in 3dsMax, you can only check/unchek "display background").

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About :
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you 

*/

macroScript rmvBgdImg
	category:"Vinc3rz tools"
	toolTip:"Remove Bgd Image"
	ButtonText:"Remove Bgd Image"
(
	backgroundimagefilename = ""
)
