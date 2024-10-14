 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
    import="com.shashi.service.impl.*, com.shashi.service.*, com.shashi.beans.*, java.util.*, jakarta.servlet.ServletOutputStream, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Payments</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #f4f7f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #333;">

    <%
    /* Checking the user credentials */
    String userName = (String) session.getAttribute("username");
    String password = (String) session.getAttribute("password");

    if (userName == null || password == null) {
        response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
    }

    String sAmount = request.getParameter("amount");
    double amount = 0;

    if (sAmount != null) {
        amount = Double.parseDouble(sAmount);
    }
    %>

    <jsp:include page="header.jsp" />

    <div class="container">
        <div class="row" style="margin-top: 30px;">
            <form action="./OrderServlet" method="post"
                class="col-md-6 col-md-offset-3"
                style="border: 2px solid #e0e0e0; border-radius: 12px; background-color: #ffffff; padding: 20px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <div class="text-center">
                    <div class="form-group">
                        <img src="images/profile.jpg" alt="Payment Proceed" height="100px" style="border-radius: 50%; margin-bottom: 20px;" />
                        <h2 style="color: #2d7d46; font-weight: bold; margin-bottom: 20px;">Credit Card Payment</h2>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cardholder">Name of Card Holder</label> 
                    <input type="text" placeholder="Enter Card Holder Name" name="cardholder" class="form-control" id="cardholder" required style="margin-bottom: 15px;">
                </div>
                <div class="form-group">
                    <label for="cardnumber">Enter Credit Card Number</label> 
                    <input type="number" placeholder="4242-4242-4242-4242" name="cardnumber" class="form-control" id="cardnumber" required style="margin-bottom: 15px;">
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="expmonth">Expiry Month</label> 
                            <input type="number" placeholder="MM" name="expmonth" class="form-control" max="12" min="00" id="expmonth" required style="margin-bottom: 15px;">
                        </div>
                        <div class="col-md-6">
                            <label for="expyear">Expiry Year</label> 
                            <input type="number" placeholder="YYYY" class="form-control" id="expyear" name="expyear" required style="margin-bottom: 15px;">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="cvv">Enter CVV</label> 
                            <input type="number" placeholder="123" class="form-control" id="cvv" name="cvv" required style="margin-bottom: 15px;"> 
                            <input type="hidden" name="amount" value="<%=amount%>">
                        </div>
                        <div class="col-md-6">
                            <label>&nbsp;</label>
                            <button type="submit" class="form-control btn btn-success" style="background-color: #2d7d46; border-color: #2d7d46; margin-top: 5px;">
                                Pay: Rs <%=amount%>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="footer.html" />

</body>
</html>
