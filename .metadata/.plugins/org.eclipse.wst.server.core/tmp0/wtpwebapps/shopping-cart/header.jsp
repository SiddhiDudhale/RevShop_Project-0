 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.shashi.service.impl.*, com.shashi.service.*"%>
 
<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body style="background-color: #E6F9E6;">
    <!--Company Header Starting-->
    <div class="container-fluid text-center"
        style="margin-top: 55px; background-color: #12151e; color: white; padding: 5px; background-image: url('C:\Users\shash\Downloads\shopping-cart\WebContent\images\header.jpg'); background-size: cover; background-position: center;">
        <h2>Big Mart</h2>
        <h6>We specialize in Electronics of top Notch Quality</h6>
        <p align="center" style="color: blue; font-weight: bold; margin-top: 5px; margin-bottom: 5px;" id="message"></p>
    </div>
    <!--Company Header Ending-->

    <%
    /* Checking the user credentials */
    String userType = (String) session.getAttribute("usertype");
    %>

    <!--Starting Navigation Bar-->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><span class="glyphicon glyphicon-home" style="color:e9d7d2;">&nbsp;</span>Biggy Techs</a>
            </div>

            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <!-- Search Form -->
                    <li>
                        <form class="navbar-form navbar-left" action="Product.jsp" method="get">
                            <div class="form-group">
                                <input type="text" class="form-control" name="search" placeholder="Search Products">
                            </div>
                            <button type="submit" class="btn btn-default">Search</button>
                        </form>
                    </li>

                    <% if (userType == null) { %>
                        <!-- Navigation links for non-logged-in users -->
                        <li><a href="login.jsp">Login</a></li>
                        <li><a href="register.jsp">Sign Up</a></li>
                        <li><a href="Product.jsp">Products</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Services <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Recharge.jsp">Recharge</a></li>
                                <li><a href="Electric.jsp">Electricity Bill Payment</a></li>
                            </ul>
                        </li>
                    <% } else if ("customer".equalsIgnoreCase(userType)) { %>
                        <!-- Navigation links for customers -->
                        <%
                        int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
                        %>
                        <li><a href="Product.jsp"><span class="glyphicon glyphicon-home">Products</span></a></li>
                        <%
                        if (notf == 0) {
                        %>
                            <li><a href="cartDetails.jsp"> <span class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
                        <% } else { %>
                            <li><a href="cartDetails.jsp" style="margin: 0px; padding: 0px;" id="mycart"><i data-count="<%=notf%>" class="fa fa-shopping-cart fa-3x icon-white badge" style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;"></i></a></li>
                        <% } %>
                        <li><a href="orderDetails.jsp">Orders</a></li>
                        <li><a href="userProfile.jsp">Profile</a></li>
                        <li><a href="cartDetails.jsp">Cart</a></li>
                        <li><a href="./LogoutSrv">Logout</a></li>
                    <% } else { %>
                        <!-- Navigation links for admins -->
                        <li><a href="adminViewProduct.jsp">Products</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="adminViewProduct.jsp?type=mobile">Mobiles</a></li>
                                <li><a href="adminViewProduct.jsp?type=tv">Tvs</a></li>
                                <li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
                                <li><a href="adminViewProduct.jsp?type=camera">Camera</a></li>
                                <li><a href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
                                <li><a href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
                            </ul>
                        </li>
                        <li><a href="adminStock.jsp">Stock</a></li>
                        <li><a href="shippedItems.jsp">Shipped</a></li>
                        <li><a href="unshippedItems.jsp">Orders</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Update Items <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="addProduct.jsp">Add Product</a></li>
                                <li><a href="removeProduct.jsp">Remove Product</a></li>
                                <li><a href="updateProductById.jsp">Update Product</a></li>
                            </ul>
                        </li>
                        <li><a href="./LogoutSrv">Logout</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <!--End of Navigation Bar-->
</body>
</html>
