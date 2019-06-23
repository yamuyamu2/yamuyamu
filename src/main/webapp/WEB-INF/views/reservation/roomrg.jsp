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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
<body>
	

	<jsp:include page="../header.jsp"></jsp:include>
	<div class="container mt-3" style="max-width: 560px;">

		<form  method="post" action="rinsert" enctype="multipart/form-data">
		<div class="form-group">

				<label> room name </label> <input type="text" id="rname" name="rname"
					placeholder="방이름 " class="form-control">
			</div>
			<div class="form-group">

				<label>가격  </label> <input type="text" name="rprice" id="rprice"
					placeholder="가격  " class="form-control">


			</div>

			<div class="form-group">

				<label>인원수 </label> <input type="text" name="rpersonnel" id="rpersonnel"
					placeholder="인원수 " class="form-control">


			</div>

			<div class="form-group">

				<label>평수 </label> <input type="text" id="rsize"
					 placeholder="평수 " name="rsize"
					class="form-control">

			</div>
		
			<div class="form-group">
			<label>비품 </label>
                <textarea class="form-control" placeholder="비품"
									name="rfixtures" id="rfixtures" maxlength="200" style="height: 200px;"></textarea>
         </div>
         <div class="form-group">

				<label>방이미지  </label> <input type="file" id="rimgf"
					  name="rimgf"
					class="form-control">

			</div>
			<button type="submit" class="btn btn-primary">방입력 </button>

		</form>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>