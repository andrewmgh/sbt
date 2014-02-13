<?php

//If the update form has been posted then update the class details
if (isset($_POST ['updateClassDetails'])){
	require_once '../db/sql_functions.php';
	require_once 'common_functions.php';
	require_once 'sessionManagement.php';
	updateClassDetails($db_con, $_POST ['edit_id'], $_POST ['className'], $_POST ['classCode'], $_POST ['regCode']);
}

else {
	require_once 'protectfiles.php';
}


//Function to update class details
function updateClassDetails($db_con, $edit_id, $className, $classCode, $regCode)
{
	//Take inputs from form, clean with sanatiseInput function and store in variables
	$edit_id = sanatiseInput($db_con, $edit_id);
	$className = sanatiseInput($db_con, $className);
	$classCode = sanatiseInput($db_con, $classCode);
	$regCode = sanatiseInput($db_con, $regCode);

	//If any of the variables (apart from reg code) have not been entered then send an error message back to the user
	if(!($className && $classCode)){
		header("Location:../../editclasses.php?editClass=$edit_id&Msg=Please ensure you have filled in the required fields");
		exit();
	}
	//If the required variables have been entered and depending on whether the regCode was filled in or not - update the class and report a success message back to the user
	else {
		if($regCode){
			$newRegCode = encryptPwd($regCode);
			$updateClass = newQuery($db_con, "UPDATE `classes` SET `class_name` = '".$className."', `class_code` = '".$classCode."', `register_code` = '".$newRegCode."' WHERE  `class_id` = '$edit_id'");
		}
		else{
			$updateClass = newQuery($db_con, "UPDATE `classes` SET `class_name` = '".$className."', `class_code` = '".$classCode."' WHERE  `class_id` = '$edit_id'");
		}

		header("Location:../../manageclasses.php?UpdateClass=The class \"$className\" has been sucessfully updated");
		exit();
	}
}