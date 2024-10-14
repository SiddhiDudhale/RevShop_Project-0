 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Recharge</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        .recharge-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .recharge-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-recharge {
            width: 100%;
        }
        .result-container {
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #e9ecef;
        }
    </style>
</head>
<body>


 <jsp:include page="header.jsp" />
<div class="container recharge-container">
    <h2 class="recharge-header">Mobile Recharge</h2>
    <form id="rechargeForm">
        <div class="form-group">
            <label for="mobileNumber">Mobile Number:</label>
            <input type="text" class="form-control" id="mobileNumber" placeholder="Enter your mobile number" required>
            <small id="mobileError" class="text-danger" style="display: none;">Please enter a valid 10-digit mobile number.</small>
        </div>
        <div class="form-group">
            <label for="operator">Operator:</label>
            <select class="form-control" id="operator" required>
                <option value="">Select Operator</option>
                <option value="Airtel">Airtel</option>
                <option value="Jio">Jio</option>
                <option value="Vodafone">Vodafone</option>
                <option value="BSNL">BSNL</option>
            </select>
        </div>
        <div class="form-group">
            <label for="amount">Amount:</label>
            <input type="number" class="form-control" id="amount" placeholder="Enter recharge amount" required>
            <small id="amountError" class="text-danger" style="display: none;">Amount must be a positive number.</small>
        </div>
        <button type="button" class="btn btn-primary btn-recharge" onclick="displayRechargeDetails()">Show Recharge Details</button>
    </form>

    <!-- Result Section -->
    <div id="result" class="result-container" style="display: none;">
        <h3>Recharge Details</h3>
        <p><strong>Mobile Number:</strong> <span id="displayMobileNumber"></span></p>
        <p><strong>Operator:</strong> <span id="displayOperator"></span></p>
        <p><strong>Amount:</strong> ₹<span id="displayAmount"></span></p>
    </div>
</div>

   <jsp:include page="footer.html" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    function displayRechargeDetails() {
        // Get the values from the form
        var mobileNumber = document.getElementById("mobileNumber").value;
        var operator = document.getElementById("operator").value;
        var amount = document.getElementById("amount").value;
        var mobileError = document.getElementById("mobileError");
        var amountError = document.getElementById("amountError");

        // Validate the mobile number (should be 10 digits)
        if (!/^\d{10}$/.test(mobileNumber)) {
            mobileError.style.display = "block";
            return; // Stop the function if validation fails
        } else {
            mobileError.style.display = "none";
        }

        // Validate the amount (should be positive and non-zero)
        if (amount <= 0) {
            amountError.style.display = "block";
            return; // Stop the function if validation fails
        } else {
            amountError.style.display = "none";
        }

        // Display the values in the result section
        document.getElementById("displayMobileNumber").innerText = mobileNumber;
        document.getElementById("displayOperator").innerText = operator;
        document.getElementById("displayAmount").innerText = amount;

        // Show the result section
        document.getElementById("result").style.display = "block";
    }
</script>

</body>
</html>
