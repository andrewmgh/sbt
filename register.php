<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Study Better Together</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" href="img/sbt_favicon.ico">
</head>

<body>

	<div id="outer_header_wrapper">
		<header>
			<div id="main_header">
				<img src="img/SBT_logo.PNG" alt="logo">
				<span id="returnHome">
					<a href="index.php"><button>Back to Home Page</button></a>
				</span>
				<nav><p>.... collaborative learning through sharing resources, asking questions and discussing issues ....</p></nav>	
			</div>
			<div class="clearfloats"></div>
		</header>
	</div>
	<div id="outer_content_wrapper">
		<div id="inner_content_wrapperNoBorder">
		<div id="main_content">
		<div id ="registerForm">
		
					<div class="main_form">
					<h3>Registration Form</h3>
					<?php print isset($_GET['Error']) ? '<div class = "hiddenField">' . ($_GET['Error']) . '</div>': ""; ?>
					<form name="registerForm" action="includes/functionality/registerNewUser.php" method="POST">
						<fieldset>
						<p>
						<label for="firstname">First Name: </label> 
						<input type="text" id="firstname" name="firstname" autofocus/>
						</p>			
						<p>
						<label for="lastname">Last Name: </label> 
						<input type="text" id="lastname" name="lastname" />
						</p>
						<p>
						<label for="email">Email: </label> 
						<input type="text" id="email" name="email" />
						</p>	
						<p>
						<label for="username">Username: </label> 
						<input type="text" id="username" name="username" />
						</p>
						<p>
						<label for="password">Password: </label> 
						<input type="password" id="password" name="password" />
						</p>
						<p>
						<label for="password_confirm">Confirm Password: </label> 
						<input type="password" id="password_confirm" name="password_confirm" />
						</p>				
						<p>
						<label for="register_code">Registration Code: </label> 
						<input type="password" id="register_code" name="register_code" />
						</p>
						</fieldset>
						<p class = "submit">
						<input type="submit" name ="register" value="Register" />
						</p>
					</form>
			
				</div>	
		
			</div>
		</div>
	</div>
	</div>
	<div class="clearfloats"></div>
	<div id="outer_footer_wrapper">
		<footer id="main_footer">
			<p>StudyBetterTogether &copy; 2013  -  <a href ="mailto:admin@studybettertogether.com">Contact Us</a></p>
		</footer>


	</div>

</body>
</html>


