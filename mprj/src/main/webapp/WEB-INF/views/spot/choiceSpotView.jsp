<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>상 세 보 기</title>
</head>
<body>
    
<div id="choiceSpot">
</div>

<table class="table table-striped">

<thead>
 
<tr>
<th>상호명</th>
<th>주 소</th>
<th>전화번호</th>
<th>예 약</th>
</tr>
</thead>

	<tbody id="output">
	</tbody>
</table>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d"></script>
<script>
var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y";
console.log(url);
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url);
xhtp.send();
xhtp.onload = function(){
var xml = xhtp.responseXML;
var data = xml.getElementsByTagName('item');
	console.log(data);
	var table = document.createElement('table');
	for(let i of data){
		if(i.querySelector('title').textContent equals( ${choiceSpot})){
					// 내용부분
					var tr1 = document.createElement('tr');
					var td1 = document.createElement('td');
					var td2 = document.createElement('td');
					var td3 = document.createElement('td');
					var td4 = document.createElement('td');
					td1.innerText = i.querySelector('title').textContent;
					td2.innerText = i.querySelector('addr1').textContent;
					td3.innerText = i.querySelector('tel').textContent;
					td4.innerHTML = i.querySelector('reservationurl').textContent;
					tr1.append(td1, td2, td3, td4);
					
					// 로드맵
					var roadviewContainer = document.getElementById('choiceSpot'); //로드뷰를 표시할 div
					var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
					var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

					var position = new kakao.maps.LatLng(i.querySelector('mapx').textContent, i.querySelector('mapy').textContent);

					// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
					roadviewClient.getNearestPanoId(position, 50, function(panoId) {
					    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
					});
					
		}else if(i.querySelector('addr1').textContent == ${choiceSpot}){
			// 내용부분
			var tr1 = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = i.querySelector('reservationurl').textContent;
			tr1.append(td1, td2, td3, td4);
			// 로드맵
			var roadviewContainer = document.getElementById('choiceSpot'); //로드뷰를 표시할 div
			var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

			var position = new kakao.maps.LatLng(i.querySelector('mapx').textContent, i.querySelector('mapy').textContent);

			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			roadviewClient.getNearestPanoId(position, 50, function(panoId) {
			    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
			});
			
		}else if(i.querySelector('tel').textContent == ${choiceSpot}){
			// 내용부분
			var tr1 = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = i.querySelector('reservationurl').textContent;
			tr1.append(td1, td2, td3, td4);
			// 로드맵
			var roadviewContainer = document.getElementById('choiceSpot'); //로드뷰를 표시할 div
			var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
			var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

			var position = new kakao.maps.LatLng(i.querySelector('mapx').textContent, i.querySelector('mapy').textContent);

			// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
			roadviewClient.getNearestPanoId(position, 50, function(panoId) {
			    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
			});
			
		}
		
	
	
	}
	
	
	
	
	}
	
	
	
</script>


<span>${choiceSpot}</span>



</body>
</html>
    