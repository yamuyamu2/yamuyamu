<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Full page scroll</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/full-page-scroll.css" />
<script src="resources/js/full-page-scroll.js"></script>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">
.section1 {
	background-image: url('resources/img/theview1.jpg');
	background-size: cover;
}

.section2 {
	background-image: url('resources/img/theview2.jpg');
	background-size: cover;
}

.section3 {
	background-image: url('resources/img/theview5.jpg');
	background-size: cover;
}

.section4 {
	
}

.section5 {
	
}

.pv_ttls {
	width: 80%;
	min-width: 1200px;
	margin: 0 auto;
}
.metro {
	margin-bottom: 50px;
	float: left;
	width: 50%;
}



</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div id="main" class="scroll-container">
		<section class="section1">
			<div>
				<span></span>
			</div>
		</section>
		<section class="section2">
			<div>
				<span></span>
			</div>
		</section>
		<section class="section3">
			<div>
				<span>Page #3</span>
			</div>
		</section>

		<section class="section4">
			<div class="pv_ttls">
				<h2>오시는길</h2>
				<p>[주소] 경남 남해군 서면 남서대로 1475</p>
			</div>
			<div id="map" style="width: 100%; height: 80%;">
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fdad7d0a185418de2f6e5e0a5eb07993"></script>
				<script>
					var mapContainer = document.getElementById('map'), mapOption = {
						center : new daum.maps.LatLng(34.7961914, 127.8347893),
						level : 5
					};
					var map = new daum.maps.Map(mapContainer, mapOption);
					var markerPosition = new daum.maps.LatLng(34.7961914,
							127.8347893);
					var marker = new daum.maps.Marker({
						position : markerPosition
					});
					marker.setMap(map);
					map.setZoomable(false);
					var mapTypeControl = new daum.maps.MapTypeControl();
					map.addControl(mapTypeControl,
							daum.maps.ControlPosition.TOPLEFT);
					var zoomControl = new daum.maps.ZoomControl();
					map.addControl(zoomControl, daum.maps.ControlPosition.LEFT);
				</script>
			</div>
		</section>
		<section class="section5">
			<div class="car">
			<h5>[자가용 이용]</h5>
				<span>하동 TG 진출 시 </span>
			<p>	남해고속도로를 따라 약 350m 이동 → 계천사거리에서 ‘상주, 남해’ 방면으로 좌회전 →
					섬진강대로를 따라 약 9km 이동 → 남해대교삼거리에서 ‘미조, 남해’ 방면으로 우회전 → 섬진강대로를 따라 약 4km
					이동 → 터널 진입 후 남해대로를 따라 약 10km 이동 → 심천삼거리에서 ‘미조, 상주’ 방면으로 좌회전 → 남해대로를
					따라 약 1km 이동 → 남해지하차도 진입 후 남해대로를 따라 약 500m 이동 후 1시 방향 → 스포츠로를 따라 약
					3.5km 이동 후 1시 방향 → 스포츠로를 따라 약 3km 이동 → 서상삼거리에서 ‘남면, 두곡, 사촌’ 방면으로
					좌회전 → 남서대로를 따라 약 2km 이동 → The view 1151</p>
					<span> 진교 TG 진출 시</span>
					<p> 남해고속도로를 따라 약 1km
					이동 → 상편사거리에서 ‘남해, 서포’ 방면으로 좌회전 → 경충로를 따라 약 14.5km 이동 → 터널 진입 후
					남해대로를 따라 약 10km 이동 → 심천삼거리에서 ‘미조, 상주’ 방면으로 좌회전 → 남해대로를 따라 약 1.3km
					이동 → 남해지하차도 진입 후 남해대로를 따라 약 500m 이동 후 1시 방향 → 스포츠로를 따라 약 3km 이동 후
					1시 방향 → 스포츠로를 따라 약 3km 이동 후 1시 방향 → 스포츠로를 따라 약 3km 이동 → 서상삼거리에서
					‘남면, 두곡, 사촌’ 방면으로 좌회전 → 남서대로를 따라 약 2km 이동 → The view 1151</p>
			</div>
			<div class="metro">
			<img src="../../resources/img/bus.png"><br>|<br>
				<h5>[대중교통 이용]</h5>
				<p>남해시외버스터미널 출발 시 [버스 이용] 농어촌 남해-가천(서상.장항.남면.평산.항촌)(남해공용터미널) 농어촌
					남해-상가(연죽.서상.장항.구미.덕월)(남해공용터미널) 장항 정류장 하차 (모두 동일) → 약 600m 이동 → The
					view 1151 [택시 이용] 남해시외버스터미널 → 약 20분 소요 → The view 1151 (택시비 약
					16,000원)</p>
			</div>
		</section>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

	<script src="resources/js/full-page-scroll.js"></script>

	<script type="text/javascript">
		new fullScroll({
			displayDots : true,
			dotsPosition : 'left',
			animateTime : 0.7,
			animateFunction : 'ease'
		});
	</script>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>