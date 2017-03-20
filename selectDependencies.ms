/*
		
	Description :
		This script apply a box mapping with the same value on lenght, width and height.

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About :
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you do.
		thanks to iamyog for his help http://www.ayoglife.net/
	
*/

macroScript selectDependencies
	category:"Vinc3rz tools"
	toolTip:"Select dependencies"
	ButtonText:"Select dependencies"
(
	toSelect =
	(
		for o in objects where
		(
			refhierarchy.isRefTargetInstanced o.modifiers[1] 
		)
			collect o
	)
	select toSelect
)
