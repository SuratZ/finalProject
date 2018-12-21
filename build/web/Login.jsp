<%-- 
    Document   : Login
    Created on : Nov 26, 2018, 3:43:34 PM
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
<div style="width: 70%;margin: auto;padding-top: 100px;">
    

    <form class="text-center border border-light p-5" action="Login" method="post">

  <p class="h4 mb-4">Login</p>

  <!-- Email -->
  <input type="email" name="email"id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail" required>

  <!-- Password -->
  <input type="password" name="password"id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password" required>
  <p style="color:red">${message}</p>


  <!-- Sign in button -->
  <button mdbBtn color="info" block="true" class="btn btn-primary" type="submit">Login</button>

  <!-- Register -->
  <p>Not a member?
    <a href="Register.jsp">Register</a>
  </p>
 <p>
    <a href="GoToJSP">Back</a>
  </p>
 
</form>
</div>
<!-- Default form login -->
   


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
