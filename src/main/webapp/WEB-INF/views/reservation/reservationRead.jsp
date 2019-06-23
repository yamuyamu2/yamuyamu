<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="rarea" class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #ddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center">예약번호
						</th>
						<th style="background-color: #eeeeee; text-align: center">예약날짜</th>
						<th style="background-color: #eeeeee; text-align: center">예약방</th>
						<th style="background-color: #eeeeee; text-align: center">이름</th>
						<th style="background-color: #eeeeee; text-align: center">인원수</th>
						<th style="background-color: #eeeeee; text-align: center">가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach items="${roomR}" var="bb">
							<tr>

								<td>${bb.id}</td>
								<td>${bb.start_date}~${bb.end_date}</td>
								<td>${bb.rname}</td>
								<td>${bb.name}</td>
								<td>${bb.p_count}</td>
								<td>${bb.rprice }</td>

							</tr>
							<tr class="form-group" style="text-align: center">
								<td colspan="6">
								<input type="button"
									onclick="Reservationdelete('${bb.id}')"
									class="btn btn-primary pull-right" value="예약취소" />
								<input type="button"
									onclick="detailReservation('${bb.id}')"
									class="btn btn-primary pull-right" value="예약변경" />
									</td>
									
							</tr>
						</c:forEach>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
	<script language="javascript" type="text/javascript">
		function detailReservation(rid) {
			location.href = 'roomdetail?srid=' + rid;
			
			/* $.ajax({
				type : "POST",
				url : "roomdetail",

				data : {
					srid : rid
				},
				success : function(data) {
					console.log("data :: ", data);
					/* $('#rarea').html(data)*/
					
		/*		}//success
		/*	});//ajax */
		}
function Reservationdelete(rid) {

			

			$.ajax({
				type : "POST",
				url : "deleteReservation",

				data : {
					rid : rid
				},
				success : function(data) {
					location.href = 'reservationinfo';
					alert("예약취소하였습니다.")

					
				}//success
			});//ajax
		}
	</script>
</body>
</html>