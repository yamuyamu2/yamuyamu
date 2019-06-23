<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Writer</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 게시판 -->
<form role="form" method="post">
<input type="hidden" name="bid" value="${boardVO.bid }"/>
</form>
	<div class="container">

		<div class="row">

			<form method="post" action="">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
							</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="text" class="form-control"
								value="${boardVO.subject }" name="subject" id="subject"
								maxlength="50" readonly="readonly" /></td>

						</tr>
						<tr>
							<td><input type="text" class="form-control"
								value="${boardVO.writer }" name="writer" id="writer"
								maxlength="50" readonly="readonly" /></td>

						</tr>

						<tr>

							<td><textarea class="form-control" name="content"
									id="content" maxlength="2048" style="height: 350px;"
									readonly="readonly">${boardVO.content}</textarea></td>

						</tr>


					</tbody>

				</table>

			</form>
			<div class="form-group">
				<div class="col-sm-12" align="center">
				<c:if test="${ boardVO.writer == logvo.name}">
					<button type="submit" id="btn_modify"class="btn btn-primary">수정하기</button>
					</c:if>
					<button type="submit" class="btn btn-info">목록</button>
					<c:if test="${ boardVO.writer == logvo.name}">
					<button type="submit" class="btn btn-danger">삭제하기</button>
			     </c:if>
					
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
			var frmObj=$("form[role='form']");
		 
		 $("#btn_modify").on("click",function(){
		frmObj.attr("action","rwriter")	
		frmObj.submit();
		 });
		 $(".btn-danger").on("click",function(){
			frmObj.attr("action","delete");
			frmObj.submit();
		 });
		 $(".btn-info").on("click",function(){
			 self.location="pagelist";
		 });
		 
		})
		</script>

		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
   
</body>
</html>