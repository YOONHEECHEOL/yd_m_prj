<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>weatherDetail</title>
</head>
<body>


<!-- 지도 api를 뿌리는 부분 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d&libraries=services"></script>
<div id="map" style="width:900px;height:400px;"></div>



<!-- 화면 전환 버튼 -->
<div align="right">
<input type="button" onclick="location.href='home.do'" value="홈가기" />
&nbsp;&nbsp;
<input type="button" onclick="location.href='weatherSpot.do'" value="뒤로가기"/>

</div>
<table id="dataList" class="table table-hover">
<thead>
	<tr>
	<th>지 역</th>
	<th>코스이름</th>
	<th>관광지명</th>
	<th>테 마</th>
	<th>식중독지수</th>
	<th>자외선지수</th>
	<th>체감온도</th>
	</tr>
	
</thead>
<tbody id="output">
	
</tbody>
</table>

<script>
	console.log('${spotName}');

	var str = '&COURSE_ID='+"${courseId}";
	var url = 'https://apis.data.go.kr/1360000/TourStnInfoService/getTourStnWthrIdx?serviceKey=4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D&pageNo=1&numOfRows=10&dataType=XML&CURRENT_DATE=2019122010&HOUR=24';
	var xhtp = new XMLHttpRequest(); 
	xhtp.open('GET', url+str);
	xhtp.send();
	xhtp.onload = function(){
		var xml = xhtp.responseXML;
		var data = xml.getElementsByTagName('item');
		console.log(data);
		
		for(i of data){
			if(i.querySelector('spotAreaId').textContent==="${spotAreaId}"){
				var tr = document.createElement('tr');
				var td1 = document.createElement('td');//지역이름
				var td2 = document.createElement('td');// 코스이름
				var td3 = document.createElement('td');//관광지명
				var td4 = document.createElement('td');//테마
				var td5 = document.createElement('td');//식중독
				var td6 = document.createElement('td');//자외선
				var td7 = document.createElement('td');//체감온도
				
				
				td1.innerText= i.querySelector('spotAreaName').textContent;
				td2.innerText = i.querySelector('courseName').textContent;
				td3.innerText = i.querySelector('spotName').textContent;
				td4.innerText = i.querySelector('thema').textContent;
				td5.innerText = i.querySelector('fdIndex').textContent;// 식중독
				td6.innerText = i.querySelector('uvIndex').textContent;// 자외선
				td7.innerText = i.querySelector('btIndex').textContent;// 체감온도
				
				tr.append(td1, td2 ,td3 ,td4 ,td5 ,td6 ,td7 );
				output.append(tr);
			
				
			}
		}
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 

		
		if('${spotName}' != '계서당(성이성 생가)'){
		// 키워드로 장소를 검색합니다
		ps.keywordSearch('${spotName}', placesSearchCB); 
		}else if ('${spotName}' == '계서당(성이성 생가)'){
			ps.keywordSearch('경상북도 봉화군 물야면 가평리 301', placesSearchCB); 
			
		}
		if('${spotName}' == '화양동계곡 트레킹'){
			ps.keywordSearch('충청북도 괴산군 청천면 화양리', placesSearchCB);
		}else if('${spotName}' =='장항 솔숲'){
			ps.keywordSearch('경상남도 남해군 서면 서상리 1174-8', placesSearchCB);
			
		}else if ('${spotName}' == '괴목정'){
			ps.keywordSearch('충청남도 계룡시 신도안면 용동리 11번지', placesSearchCB);
			
		}
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {
		    
		    // 마커를 생성하고 지도에 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    // 마커에 클릭이벤트를 등록합니다
		    kakao.maps.event.addListener(marker, 'click', function() {
		        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		        infowindow.open(map, marker);
		    });
		}
		
			
			
		
	}
	
	
	
	
	</script>


</body>
</html>