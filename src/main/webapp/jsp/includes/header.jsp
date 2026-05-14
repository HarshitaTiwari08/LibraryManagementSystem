<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - Library Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/libraryManagementSystem/assets/css/common.css">
<link rel="stylesheet" href="/libraryManagementSystem/assets/css/auth.css">
</head>
<body>
<header class="navbar navbar-dark sticky-top flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">
        <i class="bi bi-book-half me-2"></i>Library
    </a>
    <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-nav d-flex flex-row align-items-center me-3">
        <span class="text-white me-3">
            Welcome, ${user.firstName} ${user.lastName}
        </span>
        <div class="nav-item text-nowrap">
            <a class="nav-link px-3" href="AuthenticationController?action=signOut">Sign out</a>
        </div>
    </div>
</header>