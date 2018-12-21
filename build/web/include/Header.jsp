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
      <a class="navbar-brand waves-effect" href="index.jsp" >
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
            <li class="nav-item" >
            <a class="nav-link waves-effect" href="index.jsp">Menu
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link waves-effect" href="Optional.jsp" >Menu Up2U</a>
          </li>
          <li class="nav-item"hidden="">
            <a class="nav-link waves-effect" href="" >Daily</a>
          </li>
          <li class="nav-item">
            <a class="nav-link waves-effect" href="ProductList" >List</a>
          </li>
         
        </ul>

        <!-- Right -->
        <a href="Account.jsp">${sessionScope.account.email}</a> 
        <ul class="navbar-nav nav-flex-icons" >
          <li class="nav-item" >
              <a class="nav-link waves-effect" href="Cart.jsp">
           
              <i class="fa fa-shopping-cart"></i>
              <span class="clearfix d-none d-sm-inline-block"> Cart </span>
            </a>
          </li>
         
          <li class="nav-item">
            <a href="Logout" class="nav-link border border-light rounded waves-effect"
              >
              <i class="fa fa-github mr-2"></i>Logout           
            </a>       
          </li>
          
          
        </ul>
           
      </div>

    </div>
  </nav>