<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24f95848773ee0928c720fe1e8af86eb"></script>

<!-- 지도가 띄워질 div -->
<div id="map" style="width:900px;height:400px;">
</div>
<!-- 화면을 전환할 div -->
<div align="right">
	<a href="javascript:history.go(-1);" class="btn btn-primary">목록</a>
	<c:if test="${not empty id }">
		<button onclick="wishBtn()" class="btn btn-primary">가보고싶어요!</button>
		<button onclick="visitBtn()" class="btn btn-primary">가봤어요!</button>
	</c:if>
</div>



<!-- 위시로 가져가는 폼 -->	
<form id="myForm" name="myForm" action="wishInsert.do" method="post">
<input type="hidden" name="id" id="id" value="${id }">
<input type="hidden" name="contentTypeId" id="contentTypeid" value="32">
<input type="hidden" name="contentId" id="contentid" value="${contentId }">
<input type="hidden" name="firstImage" id="firstimage" value="${firstImage} ">
<input type="hidden" name="title" id="title" value="${title}">
<input type="hidden" name="addr1" id="addr1" value="${addr1}">
<input type="hidden" name="mapx" id="mapx" value="">
<input type="hidden" name="mapy" id="mapy" value="">
</form>

<!-- 데이터를 뿌려줄 table -->
<table class="table table-striped">

<thead>
 
<tr>
<th>상호명</th>
<th>주 소</th>
<th>전화번호</th>
<th>썸네일</th>
<th>구 분</th>

</tr>
</thead>
	<tbody id="output">
	</tbody>
</table>

<span>${contentid }</span>
<span>"${firstimage }"</span>
<span>"${title }"</span>
<span>"${addr1 }"</span>




<script>
	function wishBtn() {
		let conf = confirm('WISH 목록에 추가하시겠습니까?');
		if(conf) {
			// 확인
			myForm.action = 'wishInsert.do';
			myForm.method = 'post';
			myForm.submit();
		}
	}

	function visitBtn() {
		let conf = confirm('VISIT 목록에 추가하시겠습니까?');
		if(conf){
			myForm.action = 'visitInsert.do';
			myForm.method = 'post';
			myForm.submit();
		}
	}


	var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode="+${areaCode };
	console.log(url);
	var xhtp = new XMLHttpRequest();
	xhtp.open('GET' , url);
	xhtp.send();
	xhtp.onload = function(){
		var xml = xhtp.responseXML;
		var data = xml.getElementsByTagName('item');
		//console.log(data);
		var table = document.createElement('table');
	
	for(let i of data) {
		if(i.querySelector('tel')){
		var title = i.querySelector('title').textContent.replaceAll(" ", "");
		var addr1 = i.querySelector('addr1').textContent.replaceAll(" ", "");
		var tel = i.querySelector('tel').textContent;
		//console.log(tel);
		console.log("==========");
		console.log(mapx, mapy);
		var str = "${choiceSpot.replaceAll(" ", "")}";
		var mapx = i.querySelector('mapx').textContent;
		var mapy = i.querySelector('mapy').textContent;

		let xV = document.querySelector('#mapx');
		let yV = document.querySelector('#mapy');
		xV.value = mapx;
		yV.value = mapy;
		
		// mapx , mapy
		if(title==str){// 클릭한것이 상호명이면
					// 내용부분
					
					if(i.querySelector('benika') && i.querySelector('benika').textContent.equals(1)){
						var struc = "베니카";
						
					}else if(i.querySelector('hanOk') && i.querySelector('hanOk').textContent.equals(1)){
						var struc = "한옥";
						
					}else if(i.querySelector('goodStay') && i.querySelector('goodStay').textContent.equals(1)){
						var struc = "굿스테이";
						
					}else{
						var struc = "구분<br/>없음";
						
					}
					console.log(struc);
					var tr = document.createElement('tr');
					var td1 = document.createElement('td');
					var td2 = document.createElement('td');
					var td3 = document.createElement('td');
					var td4 = document.createElement('td');
					var td5 = document.createElement('td');
					td1.innerText = i.querySelector('title').textContent;
					td2.innerText = i.querySelector('addr1').textContent;
					td3.innerText = i.querySelector('tel').textContent;
					td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="30px;">';
					td5.innerHTML = '<b>'+struc+'<b>';
					tr.append(td1, td2, td3, td4, td5);
					output.append(tr);
					// 로드맵
					
					if(i.querySelector('mapx').textContent && i.querySelector('mapy').textContent){
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = { 
				        center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					var iwContent = '<div style="padding:5px;font-size:xx-small;">'+i.querySelector('title').textContent+'<br><a href="https://map.kakao.com/link/map/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">길찾기</a></div>' 
				    iwPosition = new kakao.maps.LatLng(mapy, mapx), //인포윈도우 표시 위치입니다
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
			if(i.querySelector('benika') && i.querySelector('benika').textContent.equals(1)){
				var struc = "베니카";
				
			}else if(i.querySelector('hanOk') && i.querySelector('hanOk').textContent.equals(1)){
				var struc = "한옥";
				
			}else if(i.querySelector('goodStay') && i.querySelector('goodStay').textContent.equals(1)){
				var struc = "굿스테이";
				
			}else{
				var struc = "구분<br/>없음";
				
			}
			
			
			// 내용부분
			var tr = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			var td5 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
			td5 = '<b>'+struc+'</b>';
			tr.append(td1, td2, td3, td4, td5);
			output.append(tr);
			// 로드맵
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwContent = '<div style="padding:5px;">'+i.querySelector('title').textContent+'<br><a href="https://map.kakao.com/link/map/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">길찾기</a></div>'
		    iwPosition = new kakao.maps.LatLng(mapy, mapx), //인포윈도우 표시 위치입니다
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
			
			if(i.querySelector('benika') && i.querySelector('benika').textContent.equals(1)){
				var struc = "베니카";
				
			}else if(i.querySelector('hanOk') && i.querySelector('hanOk').textContent.equals(1)){
				var struc = "한옥";
				
			}else if(i.querySelector('goodStay') && i.querySelector('goodStay').textContent.equals(1)){
				var struc = "굿스테이";
				
			}else{
				var struc = "구분<br/>없음";
				
			}
		
			// 내용부분
			var tr = document.createElement('tr');
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			var td5 = document.createElement('td');
			td1.innerText = i.querySelector('title').textContent;
			td2.innerText = i.querySelector('addr1').textContent;
			td3.innerText = i.querySelector('tel').textContent;
			td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
			td5.innerHTML = '<b>'+struc+'</b>';
			tr.append(td1, td2, td3, td4, td5);
			output.append(tr);
			// 로드맵
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var iwContent = '<div style="padding:5px;">'+i.querySelector('title').textContent+'<br><a href="https://map.kakao.com/link/map/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">길찾기</a></div>'
		    iwPosition = new kakao.maps.LatLng(mapy, mapx), //인포윈도우 표시 위치입니다
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
	function addTr(){
		if(i.querySelector('benika') && i.querySelector('benika').textContent.equals(1)){
			var struc = "베니카";
			
		}else if(i.querySelector('hanOk') && i.querySelector('hanOk').textContent.equals(1)){
			var struc = "한옥";
			
		}else if(i.querySelector('goodStay') && i.querySelector('goodStay').textContent.equals(1)){
			var struc = "굿스테이";
			
		}else{
			var struc = "구분<br/>없음";
			
		}
		console.log(struc);
		var tr = document.createElement('tr');
		var td1 = document.createElement('td');
		var td2 = document.createElement('td');
		var td3 = document.createElement('td');
		var td4 = document.createElement('td');
		var td5 = document.createElement('td');
		td1.innerText = i.querySelector('title').textContent;
		td2.innerText = i.querySelector('addr1').textContent;
		td3.innerText = i.querySelector('tel').textContent;
		td4.innerHTML = '<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="30px;">';
		td5.innerHTML = '<b>'+struc+'<b>';
		tr.append(td1, td2, td3, td4, td5);
		output.append(tr);
		// 로드맵
		
		if(i.querySelector('mapx').textContent && i.querySelector('mapy').textContent){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(mapy, mapx), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var iwContent = '<div style="padding:5px;font-size:xx-small;">'+i.querySelector('title').textContent+'<br><a href="https://map.kakao.com/link/map/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+i.querySelector('title').textContent+','+mapy+','+mapx+'" style="color:blue" target="_blank">길찾기</a></div>' 
	    iwPosition = new kakao.maps.LatLng(mapy, mapx), //인포윈도우 표시 위치입니다
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
	}
	
	
</script>
