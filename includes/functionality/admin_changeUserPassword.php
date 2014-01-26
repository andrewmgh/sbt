<?php
	
//Create new user password
if (isset ($_POST ['changeStudentPassword'])){  //only runs the below php code if the login form was submitted

	//Declare and initialise variables to solve any posible undefined variable errors
	$studentID = $newPassword = $confirmPassword = "";
	$PasswordValid = false;
	$studentIDValid = false;
	$PwdMsg = "";

	//Take inputs from new password form, clean with sanatiseInput function and store in variables
	$studentID = sanatiseInput($db_con, $_POST['studentID']);
	$newPassword = sanatiseInput($db_con, $_POST['newPassword']);
	$confirmPassword = sanatiseInput($db_con, $_POST['confirmPassword']);


	//Ensure that user ID entered is a valid user ID
	if(mysqli_num_rows($result = newQuery($db_con, "Select * from users where user_id = '".$studentID."'")) != 1){
		$PwdMsg = "<p>Please enter a valid User ID</p> <br />";
		mysqli_free_result($result);
	}
	elseif($studentID ==1){
		$PwdMsg = "<p>You cannot change the admin password here</p> <br />";
	}
	else {
		$studentIDValid = true;
	}

	// Validate Password
	if($newPassword == "" || $confirmPassword == ""){
		$PwdMsg .= "<p>Please enter a new password.</p>";
	}
	elseif ($newPassword != $confirmPassword){
		$PwdMsg .= "<p>The passwords do not match.</p>";
	}
	else {
		$PasswordValid = true;
	}

	//if the password and the user ID are valid insert the new password into the database using the newQuery function.
	if($PasswordValid && $studentIDValid)
	{
		//encrypt password using encryptPwd function
		$newPassword = encryptPwd($newPassword);
		$InsertNewPwd = newQuery($db_con, "UPDATE `users` SET `password` = '".$newPassword."' WHERE  `user_id` = '$studentID'");
		$PwdMsg = '<p>This Users password has been successfully changed.</p>';
		//mysqli_free_result($InsertNewPwd);
	}
}

<!--
<h2>&nbsp;</h2>

<h4>Change Student Password</h4>
<div class ="inline_form">
<div class="main_form">
				<?php print isset($PwdMsg) ? '<div class = "hiddenField">' . $PwdMsg . '</div>': ""; ?>
				<form name="changeStudentPassword" id="changeStudentPassword" action="admin.php" method="POST">
					<p>
					<label for="studentID">User Id: </label> 
					<input type="text" id="studentID" name="studentID" value ="<?php print isset($studentID) ? $studentID : ""; ?>" />
					</p>						<p>
					<label for="newPassword">New Password: </label> 
					<input type="password" id="newPassword" name="newPassword" />
					</p>				
					<p>
					<label for="confirmPassword">Confirm Password: </label> 
					<input type="password" id="confirmPassword" name="confirmPassword" />
					</p>	
					
					<div class = "submit">
						<input type="submit" name ="changeStudentPassword" value="Confirm" />
					</div>
					</form>
	</div>				
</div>	
-->	
?>