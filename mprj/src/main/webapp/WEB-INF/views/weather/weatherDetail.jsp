<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>weatherDetail</title>
</head>
<body>
<!--tt-->



<span>${spotName}</span>
<span>${spotAreaId}</span>
<span>${courseId}</span>
<!-- 지도 api를 뿌리는 부분 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d&libraries=services"></script>

<div id="map" class="map" style="width:900px;height:400px;">
</div>


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

	var str = '&COURSE_ID='+${courseId};
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
			
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
			    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 

			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(i.querySelector('courseAreaName').textContent+" "+i.querySelector('spotAreaName').textContent+" "+'${spotName}', function(result, status) {
				console.log(i.querySelector('courseAreaName').textContent+" "+"${spotName}");
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${spotName}</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			}); 

			
		  }
		
	   
		
		
	}
	</script>


</body>
</html>