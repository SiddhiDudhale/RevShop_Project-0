<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Electricity Bill Payment</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <style>
        .bill-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .bill-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-bill {
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
   
<div class="container bill-container">
    <h2 class="bill-header">Electricity Bill Payment</h2>
    <form id="billPaymentForm">
        <div class="form-group">
            <label for="accountNumber">Account Number:</label>
            <input type="text" class="form-control" id="accountNumber" placeholder="Enter your 12-digit account number" required>
            <small id="accountError" class="text-danger" style="display: none;">Please enter a valid 12-digit account number.</small>
        </div>
        <div class="form-group">
            <label for="provider">Provider:</label>
            <select class="form-control" id="provider" required>
                <option value="">Select Provider</option>
                <option value="ABC Electricity">UP Electricity</option>
                <option value="XYZ Power">MP Power</option>
                <option value="DEF Energy">MH Energy</option>
            </select>
        </div>
        <div class="form-group">
            <label for="billAmount">Bill Amount:</label>
            <input type="number" class="form-control" id="billAmount" placeholder="Enter bill amount" required>
            <small id="amountError" class="text-danger" style="display: none;">Amount must be a positive number.</small>
        </div>
        <button type="button" class="btn btn-primary btn-bill" onclick="displayBillDetails()">Show Bill Details</button>
    </form>

    <!-- Result Section -->
    <div id="result" class="result-container" style="display: none;">
        <h3>Bill Details</h3>
        <p><strong>Account Number:</strong> <span id="displayAccountNumber"></span></p>
        <p><strong>Provider:</strong> <span id="displayProvider"></span></p>
        <p><strong>Bill Amount:</strong> ₹<span id="displayBillAmount"></span></p>
    </div>
</div>

   <jsp:include page="footer.html" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    function displayBillDetails() {
        // Get the values from the form
        var accountNumber = document.getElementById("accountNumber").value;
        var provider = document.getElementById("provider").value;
        var billAmount = document.getElementById("billAmount").value;
        var accountError = document.getElementById("accountError");
        var amountError = document.getElementById("amountError");

        // Validate the account number (should be 12 digits)
        if (!/^\d{12}$/.test(accountNumber)) {
            accountError.style.display = "block";
            return; // Stop the function if validation fails
        } else {
            accountError.style.display = "none";
        }

        // Validate the bill amount (should be positive and non-zero)
        if (billAmount <= 0) {
            amountError.style.display = "block";
            return; // Stop the function if validation fails
        } else {
            amountError.style.display = "none";
        }

        // Display the values in the result section
        document.getElementById("displayAccountNumber").innerText = accountNumber;
        document.getElementById("displayProvider").innerText = provider;
        document.getElementById("displayBillAmount").innerText = billAmount;

        // Show the result section
        document.getElementById("result").style.display = "block";
    }
</script>

</body>
</html>
