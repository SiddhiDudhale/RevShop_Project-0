 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="com.shashi.service.impl.*, com.shashi.service.*, com.shashi.beans.*, java.util.*, jakarta.servlet.ServletOutputStream, java.io.*"%>
<!DOCTYPE html>
<html>
<head>

<style>







/* Custom class to make the carousel smaller */
.custom-carousel-img {
    width: 100%; /* Full width */
    max-height: 300px; /* Set maximum height to make carousel smaller */
    object-fit: cover; /* Cover the area while maintaining aspect ratio */
}

/* Optional: Adjusting the carousel height */
.carousel-inner > .item {
    height: 500px; /* Height of the carousel */
}

.carousel {
    
    margin: 0 auto; /* Center align carousel */
}
/* Custom color for Buy Now button */
.btn-buy-now {
    background-color: #ff9800; /* Orange color */
    border-color: #ff9800; /* Border color same as background */
    color: white; /* Text color */
}
:root {
  --card-height: 400px;
  --card-width: calc(var(--card-height) / 1.5);
}

.card {
  width: var(--card-width);
  height: var(--card-height);
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: center;
  perspective: 1000px;
  margin: 0 auto;
  background: #fff;
  border: 1px solid #ddd;
  box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  padding: 15px;
}

.cover-image {
  width: 100%;
  height: 180px;
  object-fit: cover;
}

.wrapper {
  transition: all 0.5s;
  position: relative;
  width: 100%;
  height: 100%;
}

.card:hover .wrapper {
  transform: perspective(1000px) rotateX(10deg);
  box-shadow: 0 20px 30px rgba(0, 0, 0, 0.2);
}

.title {
  transition: transform 0.5s;
  text-align: center;
}

.card:hover .title {
  transform: translateY(-10px);
}

.productinfo, .price {
  margin: 0;
  color: #333;
}

.btn-buy-now {
  background-color: #ff9800; /* Custom orange color */
  border-color: #ff9800;
  color: white;
  margin-top: 10px;
}



</style>
<title>Big Mart</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- Bootstrap 3.4.1 CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">

<!-- jQuery and Bootstrap 3.4.1 JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #9bd2fb;">

    <%
    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");
    String userType = (String) session.getAttribute("usertype");

    boolean isValidUser = true;

    if (userType == null || userName == null || password == null || !userType.equals("customer")) {
        isValidUser = false;
    }

    ProductServiceImpl prodDao = new ProductServiceImpl();
    List<ProductBean> products = new ArrayList<ProductBean>();

    String search = request.getParameter("search");
    String type = request.getParameter("type");
    String message = "All Products";
    if (search != null) {
        products = prodDao.searchAllProducts(search);
        message = "Showing Results for '" + search + "'";
    } else if (type != null) {
        products = prodDao.getAllProductsByType(type);
        message = "Showing Results for '" + type + "'";
    } else {
        products = prodDao.getAllProducts();
    }
    if (products.isEmpty()) {
        message = "No items found for the search '" + (search != null ? search : type) + "'";
        products = prodDao.getAllProducts();
    }
    %>

    <jsp:include page="header.jsp" />



<div class="text-center"
        style="color: black; font-size: 14px; font-weight: bold;"><%=message%></div>
    <div class="text-center" id="message"
        style="color: black; font-size: 14px; font-weight: bold;"></div>
    <!-- Start of Product Items List -->
   <div class="container">
    <div class="row">
        <% for (ProductBean product : products) { 
            int cartQty = new CartServiceImpl().getCartItemCount(userName, product.getProdId());
        %>
        <div class="col-sm-4 text-center" style="margin-bottom: 20px;">
            <div class="card">
                <div class="wrapper">
                    <img src="./ShowImage?pid=<%=product.getProdId()%>" alt="Product Image" class="cover-image">
                </div>
                <div class="title">
                    <h4 class="productname" style="color: #008080;"><%=product.getProdName()%></h4>
                    <p class="productinfo">
                        <%=product.getProdInfo().substring(0, Math.min(product.getProdInfo().length(), 100))%>...
                    </p>
                    <p class="price">Rs <%=product.getProdPrice()%></p>
                    <form method="post">
                        <% if (cartQty == 0) { %>
                        <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
        class="btn" 
        style="background-color: magenta; border-color: magenta; color: white;">Add to Cart</button>

                        <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=1"
                            class="btn btn-buy-now">Buy Now</button>
                        <% } else { %>
                        <button type="submit" formaction="./AddtoCart?uid=<%=userName%>&pid=<%=product.getProdId()%>&pqty=0"
                            class="btn btn-danger">Remove From Cart</button>
                        <button type="submit" formaction="cartDetails.jsp" class="btn btn-success">Checkout</button>
                        <% } %>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>



 








    

    <jsp:include page="footer.html" />

</body>
</html>
