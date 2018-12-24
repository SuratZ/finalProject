<%-- 
    Document   : History
    Created on : Nov 30, 2018, 12:41:43 AM
    Author     : Zeron
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>History</title>
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="include/Header.jsp?title=Authentication::" />
        <!-- Navbar -->
        <div style="width: 70%;margin: auto;padding-top: 100px">
            <h1>History</h1>
            <table id="dtBasicExample" class="table table-striped table-bordered table-sm " a cellspacing="0" width="100%" >
                <thead>
                    <tr>
                        <th class="th-sm" style="text-align: center;width: 5%">#
                        </th>
                        <th class="th-sm" style="text-align: center;">Time
                        </th>
                        <th class="th-sm" style="text-align: center;">Image
                        </th>
                        <th class="th-sm" style="text-align: center;">Product
                        </th>
                        <th class="th-sm" style="text-align: center;">Quantity
                        </th>
                        <th class="th-sm" style="text-align: center;">Price
                        </th>
                    </tr>
                </thead>
                
                <c:set var="items" value="${listHistory}"/>
                <c:set var="bgColorX" value="lightgray" />
                <c:set var="bgColorY" value="white" />


                <c:forEach items="${listHistory}" var="h" varStatus="vs">
                    <tr>
                        <td style="text-align: center;">${vs.count}</td>
                        <td style="text-align: center;">${h.getTimeStamp()}</td>
                        <td style="text-align: center;"><img width="120"src="model-images/${h.getProductId().getImage()}"></td>
                        <td style="text-align: center;">${h.getProductId().getProductName()}<br><br>
                                Detail: ${h.getProductId().getDetail()}</td>  
                        <td style="text-align: center;">${h.getQuantity()}</td> 
                        <td style="text-align: center;">${h.getTotalPrice()} บาท</td>

                    </tr>

                </c:forEach>

                <tfoot>
                    <tr>
                        <th class="th-sm" style="width: 5%">#
                        </th>
                        <th class="th-sm">Time
                        </th>
                        <th class="th-sm">Image
                        </th>
                        <th class="th-sm">Product
                        </th>
                        <th class="th-sm">Quantity
                        </th>
                        <th class="th-sm">Price
                        </th>
                    </tr>
                </tfoot> 

            </table>
            <a href="Index"><button mdbBtn color="info" block="true" class="btn btn-primary">Back</button></a>
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
