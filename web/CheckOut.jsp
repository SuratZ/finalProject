<%-- 
    Document   : CheckOut
    Created on : Dec 23, 2018, 3:13:37 AM
    Author     : Zeron
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>CheckOut Page</title>

    </head>

    <body>
        <!-- Navbar -->
        <jsp:include page="include/Header.jsp?title=Authentication::" />
        <!-- Navbar -->
        <!--Main layout-->
        <main class="mt-5 pt-4">
            <div class="container wow fadeIn">

                <!-- Heading -->
                <h2 class="my-5 h2 text-center">Checkout form</h2>

                <!--Grid row-->
                <div class="row">

                    <!--Grid column-->
                    <div class="col-md-8 mb-4">

                        <!--Card-->
                        <div class="card">

                            <!--Card content-->
                            <form class="card-body" action="CheckOutTest" method="post">


                                <!--Grid row-->
                                <div class="row">

                                    <!--Grid column-->
                                    <div class="col-md-6 mb-2">

                                        <!--firstName-->
                                        <div class="md-form ">
                                            <input type="text"id="firstName" class="form-control" placeholder="First name" value="${sessionScope.customer.name}">
                                            <label for="firstName" class="">First name</label>
                                        </div>

                                    </div>
                                    <!--Grid column-->

                                    <!--Grid column-->
                                    <div class="col-md-6 mb-2">

                                        <!--lastName-->
                                        <div class="md-form">
                                            <input type="text" id="lastName" class="form-control" placeholder="Last name"value="${sessionScope.customer.lastname}">
                                            <label for="lastName" class="">Last name</label>
                                        </div>

                                    </div>
                                    <!--Grid column-->

                                </div>
                                <!--Grid row-->


                                <!--email-->
                                <div class="md-form mb-5">
                                    <input type="text" id="email" class="form-control" placeholder="youremail@example.com" value="${sessionScope.customer.email.email}">
                                    <label for="email" class="">Email</label>
                                </div>

                                <!--address-->
                                <div class="md-form mb-2">
                                    <textarea type="text" id="address" class="form-control" name="address" placeholder="1234 Main St" >${sessionScope.customer.address}</textarea>
                                    <label for="address" class="">Address</label>
                                </div>

                                <hr>
                                <label for="address" class="">Shipping</label>
                             
                                    <select class="browser-default custom-select" >
                                        <option disabled selected name="ship">รูปแบบการส่ง</option>
                                        <option value="EMS">EMS</option>
                                        <option value="ลงทะเบียน">ลงทะเบียน</option>                                
                                    </select>
                                
                                <hr>

                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                        <label class="custom-control-label" for="credit">Credit card</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                        <label class="custom-control-label" for="debit">Debit card</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                        <label class="custom-control-label" for="paypal">Paypal</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="cc-name">Name on card</label>
                                        <input type="text" class="form-control" id="cc-name" name="cardName" placeholder="Ex. Surat" required>
                                        <small class="text-muted">Full name as displayed on card</small>
                                        <div class="invalid-feedback">
                                            Name on card is required
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="cc-number">Credit/Debit card number</label>
                                        <input type="text" class="form-control" id="cc-number" placeholder="Ex. 0000111122223333" name="cardNum" 
                                               pattern="[0-9]{16}" title="16 number" required>
                                        <div class="invalid-feedback">
                                            Credit card number is required
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 mb-3">
                                        <label for="cc-expiration">Expiration</label>
                                        <input type="text" class="form-control" id="cc-expiration" placeholder="DD/YY" required 
                                               pattern="[0-9]{2}/[0-9]{2}" title="DD/YY" >
                                        <div class="invalid-feedback">
                                            Expiration date required
                                        </div>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label for="cc-expiration">CVV</label>
                                        <input type="text" class="form-control" id="cc-cvv" placeholder="123" required
                                                pattern="[0-9]{3}" title="123">
                                        <div class="invalid-feedback">
                                            Security code required
                                        </div>
                                    </div> 
                                </div>
                                <hr class="mb-4">
                                <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>

                            </form>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-4 mb-4">

                        <!-- Heading -->
                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Your cart</span>
                            <span class="badge badge-secondary badge-pill">${sessionScope.cart.totalQuantity}</span>
                        </h4>

                        
                        <c:forEach items="${sessionScope.cart.lineItems}" var="line" varStatus="vs">
                        <!-- Cart -->
                        <ul class="list-group mb-3 ">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">${line.product.productName} x ${line.quantity}</h6>
                                    <small class="text-muted">${line.product.price}/หน่วย</small>
                                </div>
                                <span class="text-muted">${line.product.price*line.quantity}</span>
                            </li>
                        </c:forEach>
                              <c:set var="total" value="0" />
                <c:forEach items="${sessionScope.cart.lineItems}" var="line">
                    <c:set var="total" value="${total + (line.product.price*line.quantity)}" />
                   
                </c:forEach>
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (BTH)</span>
                                <strong>${total}</strong>
                            </li>
                        </ul>
                        <!-- Cart -->
 

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

            </div>
        </main>



        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>
    </body>
</html>
