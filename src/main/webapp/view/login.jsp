<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
	<head>
		<title>Please Log In</title>
		<script src="js/jquery-3.7.1.min.js"></script>
		<link rel="stylesheet" href="css/toastr.min.css">
		<script src="js/toastr.min.js"></script>
	</head>
	<body>
		<h1>Please Log In</h1>
		<div th:if="${param.error}">
			Invalid username and password.</div>
		<div th:if="${param.logout}">
			You have been logged out.</div>
		<form th:action="@{/login}" th:object="${user}" method="post">
			<div>
			<input type="text" name="username" placeholder="Username" th:field="*{username}"/>
			<p th:if="${#fields.hasErrors('username')}" th:errors="*{username}">Username Error</p>
			</div>
			<div>
			<input type="password" name="password" placeholder="Password" th:field="*{password}"/>
			<p th:if="${#fields.hasErrors('password')}" th:errors="*{password}">Password Error</p>
			</div>
			<input type="submit" value="Log in" />
		</form>
	</body>
	<script type="text/javascript">
		var toastr = window.toastr;
		if($param.error == 'true') {
			toastr.error('Invalid username and password.', 'Error');
		}
	</script>
</html>