<%-- 
    Document   : header
    Created on : Nov 30, 2018, 4:01:39 AM
    Author     : Zeron
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
    <div class="container">

        <!-- Brand -->
        <a class="navbar-brand waves-effect" href="Index" >
            <strong class="blue-text">ThaiFoodDelivery</strong>
        </a>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Left -->
            <ul class="navbar-nav mr-auto">
                
                <li class="nav-item" hidden="">
                    <a class="nav-link waves-effect" href="CustomOrder.jsp" onclick="class: activate">Custom-Menu</a>
                </li>
                <li class="nav-item"hidden="">
                    <a class="nav-link waves-effect" href="" onclick="class: activate">Daily</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link waves-effect" href="ProductList" onclick="class: activate">Menu</a>
                </li>

            </ul>

            <!-- Right -->
            <c:if test="${empty sessionScope.account.email}">
                <a type="button" class="btn btn-primary" href="Login.jsp">Login</a>          
            </c:if>
            <c:if test="${not empty sessionScope.account.email}">
            <div class="btn-group">
                <button type="button" class="btn btn-outline-primary disable">${sessionScope.account.email}</button>
                <button type="button" class="btn btn-primary dropdown-toggle px-3" data-toggle="dropdown" aria-haspopup="true"
                        aria-expanded="false">
                    <span class="sr-only">Toggle Dropdown</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="Account.jsp" >Account</a>
                    <a class="dropdown-item" href="History">History</a>
                    
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="Logout">Logout</a>
                </div>
            </div>
             &nbsp;&nbsp;
             </c:if>
            <ul class="navbar-nav nav-flex-icons" >
                <li class="nav-item" >
                    
                    <a class="nav-link waves-effect" href="Cart.jsp">
                        <c:if test="${not empty sessionScope.cart.lineItems}">
                            <span class="badge red z-depth-1 mr-1">${sessionScope.cart.totalQuantity}</span>
             </c:if>
                        <i class="fa fa-shopping-cart"></i>
                        <span class="clearfix d-none d-sm-inline-block"> Cart </span>
                    </a>
                </li>




            </ul>

        </div>

    </div>
</nav>