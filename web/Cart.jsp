<%-- 
    Document   : Cart
    Created on : Nov 30, 2018, 12:41:19 AM
    Author     : Krittaporn
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
        <title>Cart List Page</title>

    </head>

    <!-- Navbar -->
    <jsp:include page="include/Header.jsp?title=Authentication::" />
    <!-- Navbar -->
    <body>
        <div style="width: 70%;margin: auto;padding-top: 100px">
            <h1>My Cart</h1>

            <div style="margin-left: 30px;">
                <table id="dtBasicExample" class="table table-striped table-bordered table-sm " a cellspacing="0" width="100%" >
                    <tr>
                        <th class="th-sm" style="width: 120px; text-align: center;">ภาพตัวอย่าง</th>
                        <th class="th-sm" style="text-align: center;">ชื่ออาหาร</th>
                        <th class="th-sm" style="text-align: center;">Category
                        </th>
                        <th class="th-sm" style="text-align: center;width: 1%">จำนวน</th>
                        <th class="th-sm" style="text-align: center;">ราคา / หน่วย</th>
                        <th class="th-sm" style="text-align: center;">ราคารวม</th>
                        <th class="th-sm" style="text-align: center;"></td>
                    </tr>
                    <c:forEach items="${sessionScope.cart.lineItems}" var="line" varStatus="vs">

                        <tr>
                            <td style="text-align: center;"><img class="th-sm" width="120" src="model-images/${line.product.productId}.jpg" alt="" /></td>
                            <td style="text-align: center;">${line.product.productName}
                                ${line.category.category_name}
                            </td>
                            <td style="text-align: center;">${line.product.categoryId.categoryName}</td>
                            <td style="text-align: center;">
                                <form action="CartAddFood" method="post">
                                    <input type="number" class="form-control mr-sm-2 disabled" name="productQty" value="${line.quantity}" >
                                    <input type="hidden" value="${line.product.price}" id="myProductPrice">
                                    <input type="hidden" value="${line.product.productId}" name="productCode"/>
                                    <button class="btn btn-info" type="submit">+</button>

                                </form>
                                <form action="CartLower" method="post">
                                    <input type="hidden" value="${line.product.productId}" name="productCode"/>
                                    <input type="hidden" class="form-control mr-sm-2 disabled" name="productQty" value="${line.quantity}">
                                    <button class="btn btn-info" type="submit">-</button>
                                </form>

                            </td>

                            <td style="text-align: center;">${line.product.price}

                            </td>
                            <td style="text-align: center;">${line.product.price * line.quantity}</td>

                            <td style="text-align: center;"><form action="CartRemoveFood" method="post">
                                    <input type="hidden" value="${line.product.productId}" name="productCode"/>

                                    <input class="btn btn-danger" type="submit" value="X"/>
                                </form>
                            </td>

                        </tr>
                    </c:forEach>
                </table>

            </div>
            <div class="row" style="text-align: center;">
                <c:set var="total" value="0" />
                <c:forEach items="${sessionScope.cart.lineItems}" var="line">
                    <c:set var="total" value="${total + (line.product.price*line.quantity)}" />
                   
                </c:forEach>
                
                
                <input type="hidden" value="${total}">
                <div class="col-3"></div>
                <div class="col-4"></div>
                <div class="col-5">
                    <div class="row">
                        <div class="col-6">ราคาสุทธิ</div>
                        <div class="col-6">
                            <c:out value="${total}" /> บาท</div>
                            
                    </div>
                    <div class="row" style="margin-top: 25px;">
                        <div class="col-6"></div>

                        <form action="CheckOutCart" method="post">
                            <input type="submit"class="btn btn-success" value="ชำระเงินค่าสินค้า">
                        <!--<div class="col-6"><a href="CheckOut.jsp"><input class="btn btn-success">ชำระเงินค่าสินค้า</button></a></div>-->
                        </form>
                    </div>
                </div>  
            </div><a href="index.jsp"><button mdbBtn color="info" block="true" class="btn btn-primary">Back</button></a>
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

