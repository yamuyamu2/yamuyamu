<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="/w3css/3/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.cleditor.css" />
<title>Writer</title>
<script type="text/javascript">
	function writercheck() {
		
		var subject = $('#subject').val();
		var content= $("#content").val();
		
		if (subject.length== 0) {
			alert("제목을 입력하지 않았습니다.")
			$("#subject").focus();
			return false;
		}
		if (content.length == 0) {
			alert("내용을 입력하지 않았습니다.")
			$("#content").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="binsert">

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

							<td><input type="text" class="form-control"
								placeholder="글 제목" name="subject" id="subject" maxlength="50" /></td>

						</tr>
						<tr>
						<td><input type="hidden" class="form-control" value="${logid.name}"
								name="writer" id="writer" maxlength="50"  /></td>

						</tr>
						
						<tr>

							<td><textarea class="form-control" placeholder="글 내용"
									name="content" id="content" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
						

					</tbody>

				</table>
        <div class="form-group" style="text-align: center">
				<input type="submit" class="btn btn-primary pull-right" onclick="return writercheck()" value="글쓰기" />
           </div>
			</form>

		</div>

		<jsp:include page="../footer.jsp"></jsp:include>
	</div>


    <script type="text/javascript" src="resources/js/jquery-1.4.3.min.js"></script>
    <script type="text/javascript" src="resources/js/jquery.cleditor.js"></script>
    <script type="text/javascript" src="resources/js/jquery.cleditor.table.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
        $("#content").cleditor()[0].focus();
      });
    </script>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>

</body>
</html>