<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" ,inital-scale="1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	//비밀번호 정규식
	
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	//휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	function pwcheck1() {
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		if (pwJ.test($('#password').val())) {
			
			$('#checkpw1').text('');
		}
		else{
			
			$('#checkpw1').text('숫자or문자로만 입력해주세요.ᕙ( ︡’︡益’︠)ง');
			$('#checkpw1').css('color', 'red');
		}
	}
	function pwcheck2() {
		var password = $('#password').val();
		var pw2 = $('#pw2').val();
		if (password != pw2) {
			$('#checkpw2').text('비밀번호가 일치하지않습니다. ᕙ( ︡’︡益’︠)ง');
			$('#checkpw2').css('color', 'red');
		}

		else
			$('#checkpw2').text('');
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-3" style="max-width: 560px;">

		<form id="joinform" method="post" action="join">
		<div class="form-group">

				<label>이름</label> <input type="text" id="name" name="name"
					placeholder="이름" class="form-control">
			</div>

			<div class="form-group">

				<label>아이디</label> <input type="text" name="id" id="id"
					placeholder="id" class="form-control">


			</div>

			<div class="form-group">

				<label>비밀번호</label> <input type="password" id="password"
					onkeyup="pwcheck1();" placeholder="비밀번호" name="password"
					class="form-control">

			</div>
			<div class="check_font" id="checkpw1"></div>
			<div class="form-group">
				<label>비밀번호확인</label> <input type="password" class="form-control"
					placeholder="비밀번호 체크" id="pw2" name="pw2" onkeyup="pwcheck2();"
					maxlength="20">
			</div>
			<div class="check_font" id="checkpw2"></div>
			<div class="form-group">

				<label>핸드폰번호</label> <input type="text" id="phonNum" name="phonNum"
					placeholder="-를빼고입력해주세요!" class="form-control">
			</div>

			<button type="submit" class="btn btn-primary">회원가입</button>

		</form>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>