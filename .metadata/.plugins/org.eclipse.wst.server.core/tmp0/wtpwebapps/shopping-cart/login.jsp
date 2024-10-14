 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="css/changes.css">
<style>
    body {
        background-color: #E6F9E6; /* Light green background color */
        background-image: url('images/3094352.jpg'); /* Path to your background image */
        background-size: cover; /* Ensure the image covers the entire background */
        background-repeat: no-repeat; /* Prevent the image from repeating */
        background-attachment: fixed; /* Keep the background image fixed during scrolling */
        background-position: center center; /* Center the background image */
        font-family: Arial, sans-serif; /* Default font */
        margin: 0;
        padding: 0;
    }
    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    .form-container {
        border: 2px solid #4CAF50; /* Green border */
        border-radius: 10px;
        background-color: #FFFFFF; /* Light peach background */
        padding: 20px;
        width: 100%;
        max-width: 400px;
        margin: 50px auto;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    }
    .form-container h2 {
        color: #4CAF50; /* Green color for the title */
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        color: #333; /* Dark gray for labels */
        display: block;
        margin-bottom: 5px;
    }
    .form-group input,
    .form-group select {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .text-center {
        text-align: center;
    }
    .btn-success {
        background-color: #FF1493; /* Magenta button */
        color: #fff;
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }
    .btn-success:hover {
        background-color: #E0148B; /* Slightly darker magenta on hover */
    }
    p {
        color: blue;
        text-align: center;
    }
</style>
</head>
<body>

    <%@ include file="header.jsp"%>

    <%
    String message = request.getParameter("message");
    %>
    <div class="container">
        <div class="form-container">
            <h2>Login Form</h2>
            <%
            if (message != null) {
            %>
            <p><%=message%></p>
            <%
            }
            %>
            <form action="./LoginSrv" method="post">
                <div class="form-group">
                    <label for="username">Username</label> 
                    <input type="email" placeholder="Enter Username" name="username" id="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label> 
                    <input type="password" placeholder="Enter Password" name="password" id="password" required>
                </div>
                <div class="form-group">
                    <label for="userrole">Login As</label> 
                    <select name="usertype" id="userrole" required>
                        <option value="customer" selected>CUSTOMER</option>
                        <option value="admin">ADMIN</option>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn-success">Login</button>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.html"%>

</body>
</html>
