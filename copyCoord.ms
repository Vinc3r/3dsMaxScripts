/*

	Description :
		This script copy coordinates from an object to an other

	Installation :
		Copy the .ms file on 3dsmax_folder\scripts
		After running the script (MAXScript menu >> Run Script...), you'll find the category "Vinc3rz tools" in the customize menu (Customize >> Customize user interface).

	About : 
		http://nothing-is-3d.com/ - https://github.com/Vinc3r
		You're welcome to enhance my scripts, please share if you do.
	
*/

macroScript copyCoord
	category:"Vinc3rz tools"
	toolTip:"Copy coord"
	ButtonText:"Copy coord"
(
	global objMaster = undefined
	global objMasterClass = undefined
	global objMasterPos = undefined
	global objMasterRot = undefined
	global objMasterSca = undefined
	global checkedBtns =#()
	global objMasterWirecolor
	getMasterProperties
	setObjProperties

	/**** gui ****/

	try (destroyDialog copyCoord) catch()

	rollout copyCoord "Copy coord." width:71 height:96
	(
		checkbox chkPos "position" pos:[2,2] width:83 height:16 checked:true
		checkbox chkRot "rotation" pos:[2,20] width:83 height:16 checked:true
		checkbox chkSca "scale" pos:[2,38] width:83 height:16 checked:false
		pickButton pickMaster "pick master" pos:[2,56] width:67 height:18 autoDisplay:true
		button btnCopyCoord "copy coord." pos:[2,76] width:67 height:18
		
		on pickMaster picked objMasterSelect do
		(
			checkedBtns = #(chkPos.checked, chkRot.checked, chkSca.checked)
			getMasterProperties(objMasterSelect)
		)
		
		on btnCopyCoord pressed do
		(
			setObjProperties chkPos.checked chkRot.checked chkSca.checked
		)
	)

	/**** functions ****/

	function getMasterProperties objMasterSelect =
	(
		objMaster = objMasterSelect
		objMasterClass = classOf objMaster
		try(objMasterPos = objMaster.pos)catch()
		try(objMasterRot = objMaster.rotation)catch()
		try(objMasterSca = objMaster.scale)catch()
		objMasterWirecolor = objMaster.wirecolor
		objMaster.wirecolor = [255, 50,0] --temporary change color of the master
		print objMasterClass
	)

	function setObjProperties pos rot sca =
	(
		if sca then
		(
			$.scale = objMasterSca
		)
		if(objMasterClass == "Targetcamera")then(print "caca")else(print "pipi")
		if(rot == true and objMasterClass != "Targetcamera")then
		(
		--	$.rotation = objMasterRot
		)else
			(
				print "rotation problem : target camera"
			)
		if pos then
		(
			$.pos = objMasterPos
		)
		objMaster.wirecolor = objMasterWirecolor --reassign original color of master
	)
		
	/**** start ****/

	CreateDialog copyCoord pos:[0,500] style:#(#style_titlebar, #style_toolwindow, #style_sysmenu)
)
