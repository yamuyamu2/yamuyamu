<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title></title>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	
	<div class="container mt-3" >


		<div class="form-group">


			<label> room name </label> <input type="text" id="rname" name="rname"
				value="${roomVO.rname}" readonly="readonly" class="form-control">
		</div>
		<div class="form-group">

			<label>가격 </label> <input type="text" name="rprice" id="rprice"
				value="${roomVO.rprice }" readonly="readonly"class="form-control">


		</div>

		<div class="form-group">

			<label>인원수 </label> <input type="text" name="rpersonnel"
				id="rpersonnel" value="${roomVO.rpersonnel}"readonly="readonly" class="form-control">


		</div>

		<div class="form-group">

			<label>평수 </label> <input type="text" id="rsize"
				value="${roomVO.rsize}" name="rsize"readonly="readonly" class="form-control">

		</div>

		<div class="form-group">
			<label>비품 </label>
			<textarea class="form-control" 
				name="rfixtures" id="rfixtures" maxlength="200"
				style="height: 200px;"readonly="readonly">${roomVO.rfixtures}</textarea>
		</div>
		<div class="inputArea">
			<label>이미지</label>
			<p>원본 이미지</p>
			<img src="${roomVO.rimg}"/>

			
		</div>

</div>
		<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>