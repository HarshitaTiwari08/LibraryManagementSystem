<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error - Library Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        margin: 0;
        font-family: "Helvetica Neue", Arial, sans-serif;
        background-color: #f8f9fa;
        color: #212529;
    }

    .error-page {
        max-width: 480px;
        margin: 10vh auto;
        padding: 0 1.5rem;
    }

    .error-card {
        background-color: #ffffff;
        border-radius: 12px;
        padding: 2.5rem 2rem;
        border: 1px solid #dee2e6;
        box-shadow: 0 10px 24px rgba(0, 0, 0, 0.08);
        text-align: center;
    }

    .error-code {
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 0.75rem;
        color: #dc3545;
    }

    .error-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 0.75rem;
    }

    .error-message {
        font-size: 1rem;
        color: #6c757d;
        margin-bottom: 2rem;
        line-height: 1.6;
    }

    .action-buttons a {
        min-width: 160px;
    }
</style>
</head>
<body>
<div class="error-page">
    <div class="error-card">
        <div class="error-code">404</div>
        <h1 class="error-title">Page Not Found</h1>
        <p class="error-message">We can't find the page you're looking for. It may have moved or no longer exists. Choose one of the options below to continue.</p>
        <div class="action-buttons d-flex flex-column flex-sm-row justify-content-center gap-3">
            <a href="AuthenticationController?action=showLogin" class="btn btn-primary">Back to Login</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
