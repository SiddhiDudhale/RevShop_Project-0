 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #E6F9E6; /* Light green background color */
            background-image: url('images/signup.jpg'); /* Path to your background image */
            background-size: cover; /* Ensure the image covers the entire background */
            background-repeat: no-repeat; /* Prevent the image from repeating */
            background-attachment: fixed; /* Keep the background image fixed during scrolling */
            background-position: center center; /* Center the background image */
        }
        .form-container {
            border: 2px solid #4CAF50; /* Green border */
            border-radius: 10px;
            background-color: #FFF; /* White background */
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            color: #4CAF50; /* Green color for the title */
            font-weight: bold;
        }
        .form-group label {
            color: #333; /* Dark gray for labels */
        }
        .btn-success {
            background-color: #4CAF50; /* Green button */
            border-color: #4CAF50;
        }
        .btn-success:hover {
            background-color: #45a049; /* Slightly darker green on hover */
            border-color: #45a049;
        }
        .btn-danger {
            background-color: #f44336; /* Red button */
            border-color: #f44336;
        }
        .btn-danger:hover {
            background-color: #da190b; /* Slightly darker red on hover */
            border-color: #da190b;
        }
        .error-message {
            color: #f44336; /* Red color for error messages */
            font-size: 12px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

    <%@ include file="header.jsp"%>
    <%
    String message = request.getParameter("message");
    %>
    <div class="container">
        <div class="row" style="margin-top: 30px;">
            <form id="registerForm" action="./RegisterSrv" method="post" class="col-md-8 col-md-offset-2 form-container" onsubmit="return validateForm()">
                <div class="text-center">
                    <h2>Registration Form</h2>
                    <%
                    if (message != null) {
                    %>
                    <p style="color: #2196F3;"> <!-- Blue color for messages -->
                        <%=message%>
                    </p>
                    <%
                    }
                    %>
                </div>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="username">Name</label>
                        <input type="text" name="username" class="form-control" id="username" required>
                        <small id="usernameError" class="error-message" style="display: none;">Please enter your name.</small>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" id="email" required>
                        <small id="emailError" class="error-message" style="display: none;">Please enter a valid email address.</small>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea name="address" class="form-control" id="address" required></textarea>
                    <small id="addressError" class="error-message" style="display: none;">Please enter your address.</small>
                </div>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="mobile">Mobile</label>
                        <input type="text" name="mobile" class="form-control" id="mobile" required>
                        <small id="mobileError" class="error-message" style="display: none;">Mobile number must be 10 digits.</small>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="pincode">Pin Code</label>
                        <input type="number" name="pincode" class="form-control" id="pincode" required>
                        <small id="pincodeError" class="error-message" style="display: none;">Please enter a valid pin code.</small>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password" required>
                        <small id="passwordError" class="error-message" style="display: none;">Password must be at least 6 characters.</small>
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required>
                        <small id="confirmPasswordError" class="error-message" style="display: none;">Passwords do not match.</small>
                    </div>
                </div>
                <div class="row text-center">
                    <div class="col-md-6">
                        <button type="reset" class="btn btn-danger">Reset</button>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-success">Register</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.html"%>

    <script>
        function validateForm() {
            // Initialize variables
            var isValid = true;
            var username = document.getElementById("username").value.trim();
            var email = document.getElementById("email").value.trim();
            var address = document.getElementById("address").value.trim();
            var mobile = document.getElementById("mobile").value.trim();
            var pincode = document.getElementById("pincode").value.trim();
            var password = document.getElementById("password").value.trim();
            var confirmPassword = document.getElementById("confirmPassword").value.trim();

            // Validate username
            if (username === "") {
                document.getElementById("usernameError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("usernameError").style.display = "none";
            }

            // Validate email
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailPattern.test(email)) {
                document.getElementById("emailError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("emailError").style.display = "none";
            }

            // Validate address
            if (address === "") {
                document.getElementById("addressError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("addressError").style.display = "none";
            }

            // Validate mobile number
            if (!/^\d{10}$/.test(mobile)) {
                document.getElementById("mobileError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("mobileError").style.display = "none";
            }

            // Validate pincode
            if (pincode === "" || pincode.length < 6 || pincode.length > 6) {
                document.getElementById("pincodeError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("pincodeError").style.display = "none";
            }

            // Validate password
            if (password.length < 6) {
                document.getElementById("passwordError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("passwordError").style.display = "none";
            }

            // Validate confirm password
            if (password !== confirmPassword) {
                document.getElementById("confirmPasswordError").style.display = "block";
                isValid = false;
            } else {
                document.getElementById("confirmPasswordError").style.display = "none";
            }

            // Return the final validation result
            return isValid;
        }
    </script>

</body>
</html>
