<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.outer {
  text-align: center;
}

.inner {
  display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>상 세 보 기</title>
</head>
<body>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d"></script>


<div id="choiceSpot" style="width:1000px;height:400px;">
</div>

<table class="table table-striped">

<thead>
 
<tr>
<th>상호명</th>
<th>주 소</th>
<th>전화번호</th>
<th>썸네일</th>
</tr>
</thead>
	<tbody id="output">
	</tbody>
</table>



<script>
	var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode="+${areaCode };
	console.log(url);
	var xhtp = new XMLHttpRequest();
	xhtp.open('GET' , url);
	xhtp.send();
	xhtp.onload = function(){
		var xml = xhtp.responseXML;
		var data = xml.getElementsByTagName('item');
		console.log(data);
		var table = document.createElement('table');

	for(let i of data) {
		if(i.querySelector('tel')){
		var title = i.querySelector('title').textContent.replaceAll(" ", "");
		var addr1 = i.querySelector('addr1').textContent.replaceAll(" ", "");
		var tel = i.querySelector('tel').textContent;
		console.log(tel);
		console.log("==========");
		console.log(mapx, mapy);
		var str = "${choiceSpot.replaceAll(" ", "")}";
		var mapx = i.querySelector('mapx').textContent;
		var mapy = i.querySelector('mapy').textContent;
		
		if(title==str){// 클릭한것이 상호명이면
					// 내용부분
					var tr = document.createElement('tr');
					var td1 = document.createElement('td');
					var td2 = document.createElement('td');
					var td3 = document.createElement('td');
					var td4 = document.createElement('td');
					td1.innerText = i.querySelector('title').textContent;
					td2.innerText = i.querySelector('addr1').textContent;
					td3.innerText = i.querySelector('tel').textContent;
					td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
					tr.append(td1, td2, td3, td4);
					output.append(tr);
					// 로드맵
					
					if(i.querySelector('mapx').textContent && i.querySelector('mapy').textContent){
					var mapContainer = document.getElementById('choiceSpot'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(mapx, mapy), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
				// 127.0301236613, 37.5034291706 << 강남스테이힐 좌표
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
					var iwContent = '<div style="padding:5px;font-size:small;">'+i.querySelector('title').textContent.replaceAll(" ", "")+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(mapx, mapy), //인포윈도우 표시 위치입니다
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
					// 인포윈도우를 생성하고 지도에 표시합니다
					var infowindow = new kakao.maps.InfoWindow({
					    map: map, // 인포윈도우가 표시될 지도
					    position : iwPosition, 
					    content : iwContent,
					    removable : iwRemoveable
					});
					mapContainer.append(map);
					// 아래 코드는 인포윈도우를 지도에서 제거합니다
					// infowindow.close();  
					}
		}else if(addr1==str){// 클릭한것이 주소라면
			// 내용부분
			var tr = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
			tr.append(td1, td2, td3, td4);
			output.append(tr);
			// 로드맵
			var mapContainer = document.getElementById('choiceSpot'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(mapx, mapy), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var iwContent = '<div style="padding:5px;font-size:small;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(mapx, mapy), //인포윈도우 표시 위치입니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    map: map, // 인포윈도우가 표시될 지도
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
			      
			// 아래 코드는 인포윈도우를 지도에서 제거합니다
			// infowindow.close();  
			
		}else if(tel==str){// 클릭한것이 전화번호라면
			// 내용부분
			var tr = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
			tr.append(td1, td2, td3, td4);
			output.append(tr);
			// 로드맵
			var mapContainer = document.getElementById('choiceSpot'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(mapx, mapy), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			var iwContent = '<div style="padding:5px;font-size:small;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(mapx, mapy), //인포윈도우 표시 위치입니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성하고 지도에 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
			    map: map, // 인포윈도우가 표시될 지도
			    position : iwPosition, 
			    content : iwContent,
			    removable : iwRemoveable
			});
			      
			// 아래 코드는 인포윈도우를 지도에서 제거합니다
			// infowindow.close();  
		}
		
		}
	
	}
	
	}
	
	
	
</script>


<span>${choiceSpot.replaceAll(" ", "")}</span>
<span>${areaCode}</span>


</body>
</html>
    