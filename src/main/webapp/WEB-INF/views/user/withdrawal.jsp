<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Simple Login Form</title>
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="resources/bootcss/login.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<style>
.main-div {
	background-color: lightgray;
}
.main-div {
	border: 30px solid #2B3946;
	background: #fafafa;
	padding: 50px;
	box-shadow: 5px 5px 10px silver;
	display: inline-block;
	font-family: 'Do Hyeon', sans-serif;
}
.container {
	margin-top: 30px;
	text-align: center;
}
.big-text {
	font-size: 25pt;
	font-weight: bold;
}
.style-one { /*hr*/
	height: 1px;
	background: #bbb;
	background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
	background-image: -moz-linear-gradient(left, #eee, #777, #eee);
	background-image: -ms-linear-gradient(left, #eee, #777, #eee);
	background-image: -o-linear-gradient(left, #eee, #777, #eee);
}
.update-text {
	font-family: 'Noto Sans KR', sans-serif;;
	font-size: 12pt;
	font-weight: bold;
}
.form-group>input {
	font-family: 'Noto Sans KR', sans-serif;;
	font-size: 15pt;
	height: 20px;
}
#submit {
	width: 100%;
	background: #2B3946;
	border: white;
	font-size: 15pt;
}
.small-text {
	font-size: 13pt;
}
</style>
</head>
<header>
	<jsp:include page="../header.jsp"></jsp:include>
</header>
<br>
<br>
<br>
<br>
<body >

	<div class="container">
		<div class="login-form">
			<div class="main-div">

				<h2 class="big-text">회원 탈퇴</h2>
				<p class="small-text">Please enter your Password</p>
				<hr class="style-one">
				<c:if test="${logvo != null }">
					<form action="uwithdrawal"  method="post">
						<div class="form-group">
							<input type="hidden" id="id" name="id" value="${logvo.id }">
						</div>

						<div class="form-group">
							<input type="password" class="form-control" id="password"
								placeholder="Password" name="password">
						</div>
						<c:if test="${msg==false}">

							<h4 class="update-text">입력한 비밀번호가 잘못되었습니다.</h4>

						</c:if>
						<button type="submit" class="btn btn-primary" id="submit">탈퇴</button>



					</form>
				</c:if>


			</div>
		</div>
	</div>
	<script>
		$('#submit').click(function() {
			var result = confirm("회원탈퇴 하시겠습니까?");
			if (result) {
			} else {
				return false;
			}
		});
	</script>

</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>