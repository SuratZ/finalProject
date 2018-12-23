<%-- 
    Document   : Register
    Created on : Nov 26, 2018, 8:25:23 PM
    Author     : Krittaporn
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.css" rel="stylesheet">
        <!-- MDBootstrap Datatables  -->
        <link href="css/addons/datatables.min.css" rel="stylesheet">
        <title>Login Page</title>
</head>

<body>
    
<!-- Default form login -->
<div style="width: 70%;margin: auto; padding-top: 100px;">
    
<!-- Default form register -->
<form class="text-center border border-light p-5" action="Register" method="post">

    <p class="h4 mb-4">Register</p>
    <p style="color:red">${message}</p>

    <div class="form-row mb-4">
        <div class="col">
            <!-- First name -->
            <input type="text" name="fname" id="defaultRegisterFormFirstName" class="form-control" placeholder="First name" required>
        </div>
        <div class="col">
            <!-- Last name -->
            <input type="text" name="lname"id="defaultRegisterFormLastName" class="form-control" placeholder="Last name" required>
        </div>
        
            
       
    </div>
<div class=" col md-form">
    <textarea name="address" id="textarea-char-counter" class="form-control md-textarea" length="120" rows="3" required></textarea>
  <label for="textarea-char-counter">Address</label>
</div>
    <!-- E-mail -->
    <input type="email" name="email"id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail"required>

    <!-- Password -->
    <input type="password" name="password"id="defaultRegisterFormPassword" class="form-control" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" required>
    <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
        At least 8 characters
    </small>
    <input type="number" name="tel"id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="tel"required>
 


    <!-- Sign up button -->
    <button class="btn btn-info my-4 btn-block" type="submit">Register</button>

    <hr>
<p>
    <a href="GoToJSP">Back</a>
  </p>

</form>
<!-- Default form register -->

</div>
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- MDBootstrap Datatables  -->
<script type="text/javascript" src="js/addons/datatables.min.js"></script>

</body>

</html>
