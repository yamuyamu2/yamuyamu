<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	
	<script src="resources/js/bootstrap.js"></script>
	
</head>
<body>

<script >
var succes='${succes}';
if(succes =='succes'){
	alert("삭제 완료")
}
</script>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #ddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center">번호</th>
						<th style="background-color: #eeeeee; text-align: center">제목</th>
						<th style="background-color: #eeeeee; text-align: center">글쓴이</th>
						<th style="background-color: #eeeeee; text-align: center">작성일</th>
						<th style="background-color: #eeeeee; text-align: center">조회</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${blist}" var="bb">
					<tr>
						<td>${bb.bid}</td>
						<td><a href="read?bid=${bb.bid}">${bb.subject}</a></td>
						<td>${bb.writer} </td>
						<td><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${bb.regdate}"/></td>
						<td class="numeric">${bb.hit}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="writeA" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>


</html>