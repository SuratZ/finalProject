
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Material Design Bootstrap</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">
        <style type="text/css">
            html,
            body,
            header,
            .carousel {
                height: 60vh;
            }

            @media (max-width: 740px) {
                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }

            @media (min-width: 800px) and (max-width: 850px) {
                html,
                body,
                header,
                .carousel {
                    height: 100vh;
                }
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <jsp:include page="include/Header.jsp?title=Authentication::" />
        <!-- Navbar -->


        <div id="carousel-example-1z" class="carousel slide carousel-fade pt-4" data-ride="carousel">

            <!--Indicators-->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
            </ol>
            <!--/.Indicators-->

            <!--Slides-->
            <div class="carousel-inner" role="listbox">

                <!--First slide-->
                <div class="carousel-item active">
                    <div class="view" style="background-image: url('model-images/index1.jpg'); background-repeat: no-repeat; background-size: cover;">

                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Thai Food Delivery</strong>
                                </h1>

                                <p>
                                    <strong>" I just don't want to look back
                                        and think ...
                                        I could've eaten that. "</strong>
                                </p>

                                <p class="mb-4 d-none d-md-block">
                                    <strong>Happy Eating</strong>
                                </p>


                            </div>
                            <!-- Content -->

                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/First slide-->

                <!--Second slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('model-images/index2.jpg'); background-repeat: no-repeat; background-size: cover;">

                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Thai Food Delivery</strong>
                                </h1>

                                <p>
                                    <strong>" I followed my heart and it led me into the Thai Food Delivery! "</strong>
                                </p>

                                <p class="mb-4 d-none d-md-block">
                                    <strong>Happy Eating</strong>
                                </p>


                            </div>
                            <!-- Content -->

                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Second slide-->

                <!--Third slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('model-images/index3.jpg'); background-repeat: no-repeat; background-size: cover;">

                        <!-- Mask & flexbox options-->
                        <div class="mask rgba-black-strong d-flex justify-content-center align-items-center">

                            <!-- Content -->
                            <div class="text-center white-text mx-5 wow fadeIn">
                                <h1 class="mb-4">
                                    <strong>Thai Food Delivery</strong>
                                </h1>

                                <p>
                                    <strong>" I'm on a seafood diet. I see food and I eat it. "</strong>
                                </p>

                                <p class="mb-4 d-none d-md-block">
                                    <strong>Test3 Slide</strong>
                                </p>


                            </div>
                            <!-- Content -->

                        </div>
                        <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Third slide-->

            </div>
            <!--/.Slides-->

            <!--Controls-->
            <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            <!--/.Controls-->

        </div>
        <!--/.Carousel Wrapper-->

        <!--Main layout-->
        <main>
            <div class="container" style="width: 70%;margin: auto;padding-top: 100px">


                
                        <!--Section: Products v.3-->
                        <section class="text-center mb-4">

        
                            
                            
                            <div class="container">
                            <!--Grid column-->
                            
                            
                            <div class="col-lg-auto mb-4 ">

                    <c:forEach items="${product}" var="p" varStatus="vs">
                    <c:if test="${p.categoryId.categoryId != 3}">
                                <div class="card-deck row">

                                    <!--Card-->
                                    <div class="card mb-4">

                                        <!--Card image-->
                                        <div class="view overlay">
                                            <img src="model-images/${p.image}" class="card-img-top" alt="Card img cap">
                                            <a>
                                                <div class="mask rgba-white-slight"></div>
                                            </a>
                                        </div>
                                        <!--Card image-->

                                        <!--Card content-->
                                        <div class="card-body text-center">
                                            <!--Category & Title-->

                                            <!--Title-->
                                            <h4 class="card-title">${p.productName}</h4>
                                            <!--Text-->
                                            <p class="card-text">${p.detail}</p>
                                            <h4 class="font-weight-bold blue-text">
                                                <strong>${p.price} BTH.</strong>
                                            </h4>
                                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                            <form action="IndexAddToCart" method="post">
                                                <input type="hidden" value="${p.productId}" name="productCode"/>
                                                <button type="submit" class="btn btn-primary btn-sm m-0 waves-effect">Add to Cart</button>
                                            </form>


                                        </div>
                                        <!--Card content-->

                                    </div>
                                    <!--Card-->
                                </div>
                            </c:if></c:forEach>
                    </div>
                    <!--Grid column-->
</div>
                    <!--Grid column-->




                </section>
                <!--Section: Products v.3-->

            </div>
        </main>
        <!--Main layout-->



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
    <a href="../../../../../C:/Users/Zeron/AppData/Local/Temp/Rar$DRa4680.38408/index.html"></a>
</html>