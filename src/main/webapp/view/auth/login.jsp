<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
	<head>
		<title>Please Log In</title>
		<script src="js/jquery-3.7.1.min.js"></script>
		<link rel="stylesheet" href="css/toastr.min.css">
		<script src="js/toastr.min.js"></script>
		<link rel="stylesheet" href="css/auth/login.css">
	</head>
	<body>
		<div th:if="${param.error}">
			Invalid username and password.</div>
		<div th:if="${param.logout}">
			You have been logged out.</div>
			<div class="wrapper">
				<div class="logo">
					<img src="https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-bird-symbols-png-logo-0.png" alt="">
				</div>
				<div class="text-center mt-4 name">
					Twitter
				</div>
				<form th:action="@{/login}" th:object="${user}" method="post" enctype="utf8" class="p-3 mt-3">
					<div class="form-field d-flex align-items-center">
						<span class="far fa-user"></span>
						<input type="text" name="username" placeholder="Username" th:field="*{username}">
				<p th:if="${#fields.hasErrors('username')}" th:errors="*{username}">Username Error</p>
					</div>
					<div class="form-field d-flex align-items-center">
						<span class="fas fa-key"></span>
						<input type="password" name="password" placeholder="Password" th:field="*{password}">
				<p th:if="${#fields.hasErrors('password')}" th:errors="*{password}">Password Error</p>
					</div>
					<button class="btn mt-3">Login</button>
				</form>
				<div class="text-center fs-6">
					<a href="#">Forget password?</a> or <a href="#">Sign up</a>
				</div>
			</div>
	</body>
	<script type="text/javascript">
		var toastr = window.toastr;
		if($param.error == 'true') {
			toastr.error('Invalid username and password.', 'Error');
		}
	</script>
</html>