<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>달력</title>
<style type="text/css">
.rs-table {
	width: 750px;
}

.first-tb {
	width: 15px
}

.last-tb {
	
}

.td {
	padding: 30px;
}

.color-red {
	color: red !important;
}
</style>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var today = new Date(); // 오늘 날짜 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
	var date = new Date(); // today의 Date를 세어주는 역할
	var present = new Date(); //현재 날짜 추출 하기 
	var reservationList = JSON.stringify("${reservationList}");
	

	function buildCalendar(reservationStatus) { // 현재 달 달력 만들기
		// 2019-05-31 형식으로 현재 날짜 출력
		/*
		 * var date_format = today.getFullYear().toString()+"-"+
		 * ((today.getMonth()+1).toString().length==2?(today.getMonth()+1).toString():"0"+(today.getMonth()+1).toString())+"-"+
		 * (today.getDate().toString().length==2?today.getDate().toString():"0"+today.getDate().toString() );
		 * 
		 * alert(date_format );
		 */
		 
		 //현재 달의 예약 현황 조회 
		 console.log(reservationStatus);
		 

		var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		var tbCalendar = document.getElementById("calendar");
		var tbCalendarYM = document.getElementById("tbCalendarYM");

		tbCalendarYM.innerHTML = today.getFullYear() + "년 "
				+ (today.getMonth() + 1) + "월";

		while (tbCalendar.rows.length > 2) {
			tbCalendar.deleteRow(tbCalendar.rows.length - 1);
		}

		var row = tbCalendar.insertRow();
		var cnt = 0;// count, 셀의 갯수를 세어주는 역할

		for (var i = 0; i < doMonth.getDay(); i++) {
			cell = row.insertCell();// 열 한칸한칸 계속 만들어주는 역할
			cnt = cnt + 1;// 열의 갯수를 계속 다음으로 위치하게 해주는 역할
		}

		/* 달력 출력 */
		var today_format;

		for (var i = 1; i <= lastDate.getDate(); i++) {

			// 현 보여지는 달력의 yyyy-MM-dd 형식으로 출력
			today_format = today.getFullYear().toString()
					+ "-"
					+ ((today.getMonth() + 1).toString().length == 2 ? (today
							.getMonth() + 1).toString() : "0"
							+ (today.getMonth() + 1).toString()) + "-"
					+ (i.toString() < 10 ? "0" + i.toString() : i.toString());

			//		console.log(today_format); // 일자 확인

			cell = row.insertCell(); // 열 한칸한칸 계속 만들어주는 역할
			cell.innerHTML += '<br>';
			cnt = cnt + 1;// 열의 갯수를 계속 다음으로 위치하게 해주는 역할

			if (cnt % 7 == 1) { //일요일만 처리 다른(색상)
				cell.innerHTML += '<div class="dayd">' + i + '<br></div>';

			} else if (cnt % 7 == 0) { //토요일만 처리 다른(색상)
				cell.innerHTML += '<div class="dayt">' + i + '<br></div>';
				row = calendar.insertRow();

			} else { //평일만 처리 다른(색상)
				cell.innerHTML += '<div class="days">' + i + '<br></div>';
			}

			var date_length = $('.cl_date').length; // input box(DB에 저장된 개수 저장)
			//		 오늘의 날짜에 노란색 칠하기 
			if (today.getFullYear() == date.getFullYear()
					&& today.getMonth() == date.getMonth()
					&& i == date.getDate()) {
				// 달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
				cell.bgColor = "#FAF58C";// 셀의 배경색을 노랑으로
			}
			// DB에 있는 방의 데이터 개수 만큼 반복
			var rmList_length = $("input[name=rml_name]").length;
			var room_print = null; //완료 되면 참 T 안되면 else로 걸러 내는 필터 방식

			/*	현재 날짜만추출  yyyy-MM-dd 형식으로 출력*/
			var npresent = present.getFullYear().toString()
					+ "-"
					+ ((present.getMonth() + 1).toString().length == 2 ? (present
							.getMonth() + 1).toString()
							: "0" + (present.getMonth() + 1).toString())
					+ "-"
					+ (present.getDate().toString().length == 2 ? present
							.getDate().toString() : "0"
							+ present.getDate().toString());

			/*현재(오늘)날짜 이상의 날만 데이터가 나오게 표시 하게 되고 그 전에는 안나온다.*/
			if (npresent <= today_format) {

				for (var r = 0; r < rmList_length; r++) {
					var rool_name = $('#rmList_name' + r).val(); // input box(객실 이름)의 값.
					var rnum = $('#rmList_rnum' + r).val(); // input box(객실번호)의 값.
					room_print = "f"; //초기값은 T로 설정해준다. 
			
					for (var j = 0; j < date_length; j++) {
						var room_name = $('#rm_name' + j).val(); // 예약 테이블의 방이름
						var book_days = $('#bk_days' + j).val(); // 종료 숙박 날짜 불러오기
						var book_date = $('#bk_date' + j).val(); // 시작 숙박 날짜 불러오기 

						if ((room_name == rool_name)
								&& (book_date <= today_format)
								&& (today_format <= book_days)) {

							room_print = "t";
							break;
						} // if ( 예약완료이면  room_print= "t" (참) )
					} // 예약 완료 확인 되면 for 종료

					// 방이름과 예약 가능/불가능 출력
					if (room_print == "t") {
						cell.innerHTML += rool_name + '<br>';
					} else {
						//			  cell.innerHTML += rool_name + '<br>';
						var zz = "'" + rool_name + "'";
						var xx = "'" + today_format + "'";

						// 예약 가능 여부
						var _isReserved = false;
						
						for(var idx = 0; idx < reservationStatus.length ; idx++) {
							//예약 마지막날 = 예약 가능 
							var _endDateSubtract = moment(reservationStatus[idx].end_date).subtract(1, 'days').format('YYYY[-]MM[-]DD');
							
							if(rnum==reservationStatus[idx].room_num && today_format >= reservationStatus[idx].start_date && today_format <= _endDateSubtract) 
							_isReserved = true;
						}
						
						if(!_isReserved) {
							cell.innerHTML += '<a style="text-decoration:none" href="javascript:room('
								+ zz
								+ ','
								+ xx
								+ ');">'
								+ rool_name
								+ '</a><br>';
						} else {
							cell.innerHTML += '<a class="color-red" style="text-decoration:none" href="javascript:room('
								+ zz
								+ ','
								+ xx
								+ ');">'
								+ '예약완료'
								+ '</a><br>';
						}

					} //cell.innerHTML += 가 출력 부분
				}// r < rmList_length
			}// npresent<today_format
			else {
				cell.innerHTML += '예약 종료';
			}
		}// 1 달완료  lastDate.getDate()
	}// 현재 달 달력 만들기
	
</script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div style="display: none;">


		<c:forEach var="rmList" items="${roomList}" varStatus="vs">
			<input type="hidden" id="rmList_rnum${vs.index}" value="${rmList.rnum}" />
			<input type="text" id="rmList_name${vs.index}" name="rml_name"
				value="${rmList.rname}">
		</c:forEach>
	</div>

	<h3 align="center">예약달력</h3>
	<table id="calendar" border="3" align="center">
		<tr>
			<!-- label은 마우스로 클릭을 편하게 해줌 -->
			<td><label onclick="prevCalendar()"><</label></td>
			<td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
			<td><label onclick="nextCalendar()">> </label></td>
		</tr>

		<TR bgcolor="#CECECE">

			<TD width='100px'>

				<DIV align="center">
					<font color="red">일</font>
				</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">월</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">화</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">수</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">목</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">금</DIV>

			</TD>

			<TD width='100px'>

				<DIV align="center">
					<font color="#529dbc">토</font>
				</DIV>

			</TD>

		</TR>

	</table>

	<div border="3" align="center" style="border-color: #3333FF">

		<form method="post" action="resertvationinsert">

			<table class="table table-striped rs-table"
				style="text-align: center; border: 1px solid #dddddd">

				<thead>

					<tr>

						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">실시간
							예약</th>

					</tr>

				</thead>

				<tbody>

					<tr>
						<td class="first-td">객실 선택</td>
						<td class="last-td"><select name="rnum" id="rnum">
								<c:forEach items="${roomList}" var="bb">
									<option value="${bb.rnum}">${bb.rname}</option>
								</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="first-td">기간 선택</td>
						<td><input type="date" name="start_date" id="start_date">~<input
							type="date" name="end_date" id="end_date"></td>
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
					<td colspan="2"><input type="button" onclick="saveReservation()"
						class="btn btn-primary pull-right" value="저장" /></td>
				</tr>

			</table>


		</form>
	</div>






	<script language="javascript" type="text/javascript">
		$( document ).ready(function() {
			var _month = new Date();
			_month = _month.getMonth() + 1;
			
			getReservationStatus(_month);
		});
		

		function prevCalendar() { // 이전 달
			var _selectedMonth = today.getMonth() - 1;
			
			today = new Date(today.getFullYear(), _selectedMonth, today
					.getDate());
			
			getReservationStatus(_selectedMonth);
		}

		function nextCalendar() { // 다음 달
			var _selectedMonth = today.getMonth() + 1;
		
			today = new Date(today.getFullYear(), _selectedMonth, today
					.getDate());
			
			getReservationStatus(_selectedMonth);
		}
		
		function getReservationStatus(month) {
			
			$.ajax({
			   type: "GET" ,
		        url: "reservation/load-status?month=" + month,
		        dataType : "json",
		        data: {},
		        contentType: "application/json",
		        success:function(data){
	        		console.log("data ::: " , data);
	        		buildCalendar(data.data);
		    	},
                error : function(request, status, error ) {  
               	  console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           	    }
			});
		}
		
		function saveReservation() {
			var _data = {
					rnum : $('#rnum').val(),
					start_date : $('#start_date').val() /* == '' ? null : moment($('#start_date').val()).format("YYYYMMDD") */,
					end_date : $('#end_date').val() /* == '' ? null : moment($('#end_date').val()).format("YYYYMMDD") */,
					p_count : $('#p_count').val()
			};
			
			if(!validationCheck(_data)) return;
			
			$.ajax({
			   type: "POST" ,
		        url: "resertvationinsert",
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
		
		function validationCheck(data) {
		   if(!data.rnum || data.rnum == '') {
				alert('방을 선택하세요.');
				return false;
			}
			if(!data.start_date){
				alert('시작날짜를 선택하세요.');
				return false;
			}
			if(!data.end_date) {
				alert('종료날짜를 선택하세요.');
				return false;
			}
			if(data.start_date > data.end_date){
				alert('종료날짜가 시작날짜보다 빠릅니다.');
				return false;
			}
			
			return true;
		}
	</script>

</body>

<jsp:include page="../footer.jsp"></jsp:include>
</html>
