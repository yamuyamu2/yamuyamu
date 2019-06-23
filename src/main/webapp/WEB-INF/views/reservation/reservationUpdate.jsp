<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/index.js"></script>
<script src="resources/js/style.css"></script>

<link rel="stylesheet" href="resources/css/bootstrap.css">
<title>Insert title here</title>
</head>
<div border="3" align="center" style="border-color: #3333FF">

	<form method="post" action="">

		<table class="table table-striped rs-table"
			style="text-align: center; border: 1px solid #dddddd">

			<thead>

				<tr>

	<td><input type="hidden" class="form-control" name="rid"
								id="rid" value="${room.id}"  /> </td>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;">실시간
						예약변경</th>

				</tr>

			</thead>

			<tbody>
		
				<tr>
				
				
					<td class="first-td">객실 선택</td>
				
					<td class="last-td"><select name="rnum" id="rnum">

							<c:forEach items="${roomList}" var="bb">

								
								<c:if test="${bb.rname==room.rname}">
									<option value="${bb.rnum}" selected="selected">${bb.rname}</option>
								</c:if>
								<c:if test="${bb.rname!=room.rname}">
									<option value="${bb.rnum}">${bb.rname}</option>
								</c:if>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td class="first-td">기간 선택</td>
					<td><input type="date" name="start_date" id="start_date"value="${room.start_date }">~<input
						type="date" name="end_date" id="end_date"value="${room.end_date }"></td>
				</tr>
				<tr>
					<td class="first-td">인원</td>

					<td class="last-td"><select id="p_count" name="p_count"><option
								value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
					</select></td>
				</tr>

			</tbody>
			<tr class="form-group" style="text-align: center">
				<td colspan="2"><input type="button"
					onclick="saveupdate()" class="btn btn-primary pull-right"
					value="저장" /></td>
			</tr>

		</table>


	</form>
</div>
<script language="javascript" type="text/javascript">
function saveupdate() {
	
			var _data = {
				rid:$('#rid').val(),
					rnum : $('#rnum').val(),
					start_date : $('#start_date').val() /* == '' ? null : moment($('#start_date').val()).format("YYYYMMDD") */,
					end_date : $('#end_date').val() /* == '' ? null : moment($('#end_date').val()).format("YYYYMMDD") */,
					p_count : $('#p_count').val()
			};
			$.ajax({
			   type: "POST" ,
		        url: "saveupdate",
		        dataType : "json",
		        data: JSON.stringify(_data),
		        contentType: "application/json",
		        
		        success:function(data){
		        	console.log("data ::: " , data);
		        
		    	  if(data.result == "success") {
		    		  location.href = 'home';
		    	  } 
                },
                error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다. 
                	
                	alert("저장에 실패했습니다.");  //
    	       	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           	    }
			});
		}
		</script>
		
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
</body>
</html>