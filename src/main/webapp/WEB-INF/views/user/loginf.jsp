<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" ,inital-scale="1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Login</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script type="text/javascript">
 
	</script>

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
<div class="jumbotron" style="padding-top:20px">
           
 <form name="frm1" method="post" action="login">
  <h3 style="text-align: center;">LOGIN</h3>
  <div class="form-group">
  <input type="text" class="form-control" placeholder="아이디입력" name="id" id="id" maxlength="50">
  </div>
    <div class="form-group">
  <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password" maxlength="20">
  </div>
  <c:if test ="${msg}">
  
<div style="color:red">아이디 또는 비밀번호가틀립니다.</div>
</c:if >
  <input type="submit"  onclick="return idcheck()"class="btn btn-primary form-control" value= "로그인">
 </form>
          
</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>
	<script language="javascript" type="text/javascript">
		

		function idcheck() { 
			if(window.document.frm1.password.value==""){
				alert("비밀번호를 입력하세요 ");
				window.document.frm1.password.focus(); // 포커스를 줌
				return false;
			}
			if(window.document.frm1.id.value==""){
				alert("아이디 를 입력하세요 ");
				window.document.frm1.id.focus(); // 포커스를 줌
				return false;
			}

			

		}
	</script>
</body>
</html>