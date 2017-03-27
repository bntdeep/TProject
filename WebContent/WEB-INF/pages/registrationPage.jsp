<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Registration</title>

    <script src="bootstrap-3.3.7-dist/jquery/jquery-3.1.1.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/myStyle.css">
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/validationStyles.css">
  </head>

  <body>

    <nav class="navbar navbar-default">
	  	<div class="container-fluid">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="redirectToIndexPage">Totalizator</a>
		    </div>
		</div>
	</nav>

	<div class="container-fluid text-center">
	  <div class="row content">
	      <div class="col-sm-2 sidenav">
			<h3>Left Side</h3>
	  	 </div>
	    <div class="col-sm-10 text-left">
			<div class="container">
			  <h2>Registration</h2>
			  <form class="form-horizontal" <%--   onsubmit="return validateForm();"--%> id="registrationForm" name="registrationForm">
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="login">Login:</label>
			      <div class="col-sm-10">
		      		  <input type="text" name="login" class="form-control" id="login" placeholder="Enter Login" pattern="^[a-zA-Z][a-z0-9_]{5,15}$" title="More than 6 symbols (Letters, numbers or _)" required>
		      		  <span class="validation-error-span"></span>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="email">Email:</label>
			      <div class="col-sm-9">
			        <input type="email" name="email" class="form-control" id="email" placeholder="Enter Email" pattern="^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$" required>
			        <span id="myForm" ></span>
			      </div>
			      <div class="col-sm-1">
			      	<button type="button"class="button signinbutton" onclick="addEmailFunction();"><span class="glyphicon glyphicon-plus"></span></button>
			      </div>
			    </div>

			    <div class="form-group">
			      <label class="control-label col-sm-2" for="pwd">Password:</label>
			      <div class="col-sm-10">
			        <input type="password" name="password" class="form-control" id="pwd" placeholder="Password" pattern="((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})" title="More tham 6 symbols" required>
			        <span></span>
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="control-label col-sm-2" for="confirmpwd">Confirm Password:</label>
			      <div class="col-sm-10">
			        <input type="password" name="confirmPassword" class="form-control" id="confirmpwd" placeholder="Confirm password" pattern="((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20})" title="Confirm title" required>
			        <span class="validation-error-span" id="passwordError"></span>
			      </div>
			    </div>

			    <div class="form-group">
			      <label class="control-label col-sm-2" for="age">Age:</label>
			      <div class="col-sm-5">
			        <input type="number" name="age" class="form-control" id="age" placeholder="Age" min="7" max="120" required>
			        <span></span>
			      </div>
			    </div>

			    <div class="form-group">
			      <div class="col-sm-offset-2 col-sm-8">
			        <button type="submit" class="btn btn-default">Submit</button>
			      </div>
			    </div>
			  </form>
			</div>
	    </div>

	  </div>
	</div>

	<footer class="container-fluid text-center">
	  <p>Footer Text</p>
	</footer>

	<script type="text/javascript" src="bootstrap-3.3.7-dist/js/validation.js"></script>
	<script>
		$("#registrationForm").submit(function(event){
			if(validateForm() === true){
				var registrationData = event.currentTarget;

				var login = registrationData["login"].value;
				var email = registrationData["email"].value;
				var password = registrationData["pwd"].value;
				debugger;
				$.ajax({
					type:"POST",
					data:{
						command:"REGISTRATION_USER_AJAX_COMMAND",
						login:login,
						email:email,
						password:password
					},
					url:"AJAXController",
					success:function(data){
			               var json = JSON.parse(data);
			            	debugger;
			               var errorType = json["errorType"];
			               var errorMessage = json["errorMessage"];
			               
			               if(errorType === "registrationerror"){
			            	   alert(errorMessage);
			               }
			               else if (errorType === "success"){
				            	setTimeout(function() {
				            		  window.location.replace("redirectToIndexPage");
				            		}, 3000);		
			               }
					}				
				});
			}
			event.preventDefault(); 	
		});			
	</script>
  </body>
</html>
