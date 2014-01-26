<?php 
require_once 'includes/html_template/header.php';
if ($account_type != 'Admin') {
	header ( "location: profile.php" );
}
?>

<h2 class = "mainPageHeading">Manage Classes</h2>

<h4>Add a New Class</h4>
	<div id ="newClass">
	<div class ="inline_form">
	<div class="main_form">
				<?php print isset($_GET['Msg']) ? '<div class = "hiddenField">' . ($_GET['Msg']) . '</div>': ""; ?>
				<form name="add_new_class" id="add_new_class" action="includes/functionality/addNewClass.php" method="POST">
					<p>
					<label for="className">Class Name: </label> 
					<input type="text" id="className" name="className" value ="<?php print isset($_GET['className']) ? ($_GET['className']) : "";?>" required />
					</p>						
					<p>
					<label for="classCode">Class Code: </label> 
					<input type="text" id="classCode" name="classCode" value ="<?php print isset($_GET['classCode']) ? ($_GET['classCode']) : "";?>" required/>
					</p>				
					<p>
					<label for="regCode">Registration Code: </label> 
					<input type="password" id="regCode" name="regCode" required/>
					</p>	
					<p>
					<input type="submit" name ="submitNewClass" value="Confirm" />
					</p>
				</form>
	</div>
	</div>					
	</div>



<div class = "classdetails">
<h4>Class Details</h4>				
				<table>
					<tr>
						<th>Class ID</th>
						<th>Class Name</th>
						<th>Class Code</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
					<?php				
					$classdetails =newQuery($db_con, "SELECT * FROM classes");
					while ( $row = mysqli_fetch_array ( $classdetails ) ) {
						echo "<tr><td>" . htmlentities ( $row ["class_id"] ) . "</td>";
						echo "<td>" . htmlentities ( $row ["class_name"] ) . "</td>";						
						echo "<td>" . htmlentities ( $row ["class_code"] ) . "</td>";
						echo "<td><form><input type = 'submit' name ='editUser'  value = 'Edit'/></form></td>";
						echo "<td><form><input type = 'submit' name ='deleteUser'  value = 'Delete' onClick=\"return confirm('Are you sure you want to Delete this user? This cannot be undone!');\"/></form></td></tr>\n";
					}
					closeMySql($db_con, $classdetails);
					?>
				</table>
</div>		
						
<?php require_once 'includes/html_template/footer.php';?>

