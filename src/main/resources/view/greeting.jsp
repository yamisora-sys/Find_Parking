<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head> 
    <title>Getting Started: Serving Web Content</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="css/fontawesome.all.min.css"/>
</head>
<body>
    <p th:text="|Hello, ${name}!|" />
    <!-- get current user -->
    <p th:text="|Hello, ${username}!|" />
    <p th:text="|Your role is ${role}!|" />
    <i class="fa-sharp fa-regular fa-star"></i>
    <i class="fa-solid fa-envelope"></i>
    <i class="fa-solid fa-grid-2"></i>
</body>
</html>