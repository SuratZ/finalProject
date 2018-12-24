<%-- 
    Document   : Account
    Created on : Nov 30, 2018, 4:34:43 AM
    Author     : Zeron
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
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
        <title>Account</title>
    </head>
      <!-- Navbar -->
  <jsp:include page="include/Header.jsp?title=Authentication::" />
  <!-- Navbar -->   
  <body>
           
      <div class="container" style="padding-top: 100px">  
       
  <div>
      <h1>Account</h1>
  
<div class="row">

                                    <!--Grid column-->
                                    <div class="col-md-6 mb-2">

                                        <!--firstName-->
                                        <div class="md-form ">
                                            <input type="text"id="firstName" class="form-control" placeholder="First name" value="${sessionScope.customer.name}" required="" disabled="">
                                            <label for="firstName" class="">First name</label>
                                        </div>

                                    </div>
                                    <!--Grid column-->

                                    <!--Grid column-->
                                    <div class="col-md-6 mb-2">

                                        <!--lastName-->
                                        <div class="md-form">
                                            <input type="text" id="lastName" class="form-control" placeholder="Last name"value="${sessionScope.customer.lastname}" required="" disabled="">
                                            <label for="lastName" class="">Last name</label>
                                        </div>

                                    </div>
                                    <!--Grid column-->

                                </div>
                                <!--Grid row-->


                                <!--email-->
                                <div class="md-form mb-5">
                                    <input type="text" id="email" class="form-control" placeholder="youremail@example.com" value="${sessionScope.customer.email.email}" required="" disabled="">
                                    <label for="email" class="">Email</label>
                                </div>

                                <!--address-->
                                <div class="md-form mb-2">
                                    <textarea type="text" id="address" class="form-control" name="address" placeholder="1234 Main St" required="" disabled="">${sessionScope.customer.address}</textarea>
                                    <label for="address" class="">Address</label>
                                </div>
                                    
                                    <div class="md-form mb-5">
                                    <input type="text" id="email" class="form-control" placeholder="youremail@example.com" value="${sessionScope.customer.tel}" required="" disabled="">
                                    <label for="email" class="">Tel.</label>
                                </div>
      
  </div>
      
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
