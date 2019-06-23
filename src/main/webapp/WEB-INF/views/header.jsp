
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hedder</title>

<script src="resources/js/moment.js"></script>

</head>
<body>
<body>
	<nav class="navbar navbar-default">
		<!--부트스트랩에서 기본적으로 제공해주는 nav bar -->
		<div class="container-fluid">
			<!--내비게이션 바를 만들땐 이런 container-fluid를 만들어준다 -->
			<div class="navbar-header">
				<!--내비게이션의 헤더부분 -->
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				</button>
				<a class="navbar-brand" href="home">LOGIC</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="intro">펜션소개 <span class="sr-only"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">room<span class="caret"></span></a> <!-- aria-haspopup은 눌렀을때 리스트가 나오게끔  span class=caret는 밑에 화살표표시-->
						<ul class="dropdown-menu">
						<c:forEach items="${roomLis}"
									var="bb">
							<li><a href="rread?rnum=${bb.rnum }">${bb.rname }</a></li>
							
						</c:forEach>
						</ul></li>
						
						<li><a href="javascript:reservation();">실시간예약 <span class="sr-only"></span></a></li>
					
						<li><a href="pagelist">게시판</a></li>
						<c:if test="${logvo.id == 'admin' }">
						<li><a href="roomrg">방등록</a></li>
					   </c:if>
				</ul>
				<c:if test="${logvo.id == null}">

					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">메뉴접속<span class="caret"></span></a> <!-- aria-haspopup은 눌렀을때 리스트가 나오게끔  span class=caret는 밑에 화살표표시-->
							<ul class="dropdown-menu">
								<li><a href="loginf">로그인</a></li>
								<li><a href="joinf">회원가입</a></li>


							</ul></li>
					</ul>
				</c:if>
				<c:if test="${logvo.id != null}">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">${logvo.name} <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="reservationinfo" >예약정보 </a></li>
								<li><a href="withdrawal">회원 탈퇴</a></li>

								<li><a href="logout">로그아웃</a></li>
							</ul></li>
					</ul>
				</c:if>
			</div>
		</div>
	</nav>
<script language="javascript" type="text/javascript">
function reservation(){
	var id='${logvo.id}'

	if(id==''){
	alert('로그인을 해주세요!');
	}
	else
		location.href = 'cal';
	
} 
</script>
</body>
</html>