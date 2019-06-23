<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="/w3css/3/w3.css">

<title>Writer</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form role="form" method="post" action="modify">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판

								글쓰기 양식</th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td><input type="hidden" class="form-control" name="bid"
								id="bid" value="${boardVO.bid}"  /> 
								<input type ="text" class="form-control" name="subject" id="subject"
								value="${boardVO.subject }" maxlength="50" /></td>

						</tr>
						<tr>
							<td><input type="text" class="form-control"
								value="${boardVO.writer }" name="writer" id="writer"
								maxlength="50" readonly="readonly" /></td>

						</tr>

						<tr>

							<td><textarea class="form-control" name="content"
									id="content" maxlength="2048" style="height: 350px;">${boardVO.content}</textarea></td>
						</tr>


					</tbody>

				</table>
				<div class="form-group" style="text-align: center">
					<input type="submit" class="btn btn-primary pull-right"
						value="수정하기" />
				</div>
			</form>

		</div>

		<jsp:include page="../footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript"></script>



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>

</body>
</html>