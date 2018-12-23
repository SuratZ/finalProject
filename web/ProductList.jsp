<%-- 
    Document   : ProductList
    Created on : Nov 16, 2018, 5:16:58 AM
    Author     : Zeron
--%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <title>Product List Page</title>
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="include/Header.jsp?title=Authentication::" />

        <div style="width: 70%;margin: auto;padding-top: 100px">
            <h1>Menu</h1>
            
                <form action="SearchByPrice" method="get">
                    <input type="number" name="min" placeholder="min price"  required="" value="${requestScope.min}">
                    ~ 
                    <input type="number" name="max" placeholder="max price" required="" value="${requestScope.max}"><br>
                    <input class="btn btn-primary" type="submit" value="Search By Price">
                    <a href="ProductList" type="button" class="btn btn-outline-info" >Reset</a>
                </form>
            
            <table id="dtBasicExample" class="table table-striped table-bordered table-sm table-responsive-md btn-table" a cellspacing="0" width="100%" >
                

                <thead>
                    <tr>
                        <th class="th-sm " style="width: 1%; text-align: center;">#
                        </th>
                        <th class="th-sm" style="width: 120px; text-align: center;">Image
                        </th>
                        <th class="th-sm" hidden="">Product ID
                        </th>
                        <th class="th-sm" style="text-align: center;">Category
                        </th>
                        <th class="th-sm" style="text-align: center;">Product Name
                        </th>
                        <th class="th-sm"style="text-align: center;">Price
                        </th>
                        <th class="th-sm">
                        </th>
                    </tr>
                </thead>

                <c:set var="items" value="${sessionScope.cart.lineItems}"/>
                <c:set var="bgColorX" value="lightgray" />
                <c:set var="bgColorY" value="white" />


                <c:forEach items="${product}" var="p" varStatus="vs">

                    <tr>
                        <td style="text-align: center;">${vs.count}</td>
                        <td style="text-align: center;"><img src="model-images/${p.productId}.jpg" width="120"></td>
                        <td hidden="">${p.productId}</td>

                        <td style="text-align: center;">${p.categoryId.categoryName}</td>

                        <td style="text-align: center;">${p.productName}</td>  

                        <td style="text-align: center;">${p.price} บาท</td>
                        <td style="text-align: center;">
                            <form action="AddItemToCart" method="post">
                                <input type="hidden" value="${p.productId}" name="productCode"/>
                                <button type="submit" class="btn btn-primary btn-sm m-0 waves-effect">Add to Cart</button>
                            </form>
                        </td>
                    </tr>

                </c:forEach>

                <tfoot>
                    <tr>
                        <th class="th-sm " style="width: 1%; text-align: center;">#
                        </th>
                        <th class="th-sm" style="width: 120px; text-align: center;">Image
                        </th>
                        <th class="th-sm" hidden="">Product ID
                        </th>
                        <th class="th-sm" style="text-align: center;">Category
                        </th>
                        <th class="th-sm" style="text-align: center;">Product Name
                        </th>
                        <th class="th-sm"style="text-align: center;">Price
                        </th>

                        <th class="th-sm">
                        </th>
                    </tr>
                </tfoot> 

            </table>
            <a href="index.jsp"><button mdbBtn color="info" block="true" class="btn btn-primary">Back</button></a>
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
        <script>
            $(document).ready(function () {
                $('#dtBasicExample').DataTable();
                $('.dataTables_length').addClass('bs-select');
            });
        </script>


    </body>
</html>
