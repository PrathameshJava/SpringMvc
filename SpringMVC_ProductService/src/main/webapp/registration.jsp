<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<form action="login" method="post">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

  <label for="phone"><b>Phone Number</b></label>
    <input type="number" placeholder="Enter Phone Number" name="uPhone" id="uPhone" required>
    
    <label for="name"><b>Your Name</b></label>
    <input type="text" placeholder="Enter Your Name" name="uName" id="uName" required>
    
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="uEmail" id="uEmail" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="uPwd" id="uPwd" required>

    
    
    <button type="submit" class="registerbtn">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
</form>

</body>
</html>