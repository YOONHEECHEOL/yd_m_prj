<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상 세 보 기</title>
</head>
<body>
<div id="map" style="width:100%;height:350px;"></div>

<form action="choiceSpotView.do" method="POST" name="myForm" id="myForm">
	<input type="hidden" id="choiceSpot" name="choiceSpot" value="">
	<input type="hidden" id="areaCode" name="areaCode" value="${areaCode }">
	<input type="hidden" id="contentid" name="contentId" value="">
	<input type="hidden" id="title" name="title" value="">
	<input type="hidden" id="addr1" name="addr1" value="">
	<input type="hidden" id="firstimage" name="firstImage" value="">
	
</form>
<div>
<input type="button" onclick="location.href='home.do'" value="홈가기" />
<input type="button" onclick="location.href='recSpot.do'" value="뒤로가기" />
</div>
<table class="table table-striped">



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d"></script>

<thead>
 
<tr id="firstTr">
<th>코드</th>
<th>상호명</th>
<th>주 소</th>
<th>전화번호</th>
<th>썸네일</th>
</tr>
</thead>

<tbody id="output">

</tbody>

</table>

<!-- <span>${areaCode }</span> -->


<script>

var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y";
var ma = 1+(Math.floor(Math.random()*10));
var rand = '&areaCode='+ma;


alert("보고싶은 장소를 클릭해주세요.");



var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode="+ ${areaCode };
console.log(url)

var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url+rand);
xhtp.send();
xhtp.onload = function(){
	// console.log(xhtp.responseXML);
	// XML object
	var xml = xhtp.responseXML;
	
	var data = xml.getElementsByTagName('item');





var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
    },
    {
        title: '텃밭', 
        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
    },
    {
        title: '근린공원',
        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });

document.getElementById('firstTr').querySelector('th').hidden=true;

// 대전 부분 출력 오류
var table = document.createElement('table');
	for(let i of data) {
		//if(i.querySelector('contentid')) 속성값이 없는 부분이 곳곳마다 있어서 contentid 고유값이 있다는 공통점으로 출력 강제
		if(i.querySelector('firstimage')){ // 썸네일이 있는거만 출력
			console.log(data);

			
			var tr = document.createElement('tr');
			
			/* console.log('i:'+i);
			console.log(i.querySelector('title').textContent);
			console.log(i.querySelector('addr1').textContent);
			console.log(i.querySelector('tel').textContent);
			console.log(i.querySelector('firstimage').textContent); */
			var td1 = document.createElement('td');
			var td2 = document.createElement('td');
			var td3 = document.createElement('td');
			var td4 = document.createElement('td');
			var td5 = document.createElement('td');
			
			td1.setAttribute("id","hideTd");
			td1.setAttribute("hidden" ,true); // 숨기기
			
			td1.innerText = i.querySelector('contentid').textContent;
			td2.innerText = i.querySelector('title').textContent;
			td3.innerText = i.querySelector('addr1').textContent;
			td4.innerText = i.querySelector('tel').textContent;
			td5.innerHTML='<img class="np" src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
			
			tr.append(td1, td2 ,td3, td4, td5);
			output.append(tr);
			
			
			}
			
		
// 			output.addEventListener('click',()=>{
// // 				console.log(event.currentTarget.querySelectorAll('td'));
// // 				var ect = event.currentTarget.querySelectorAll('td');
// // 				//console.log(event.target.textContent);
// // 				choiceSpot.value=event.target.textContent;
// // 				areaCode.value = ${areaCode };
				
// // 				title.value = ect[1].outerText.replaceAll(" ","");
// // 				addr1.value = ect[2].outerText;
				
// // 				if(title.value == i.querySelector('title').content){
					
// // 					firstimage.value = ect[4].querySelector('img').currentSrc;
					
// // 				}
				
// // 				contentid.value = td1.innerText;
					
				
				
				
// // 				console.log('t:'+title.value);
// // 				console.log('add:'+addr1.value);
// // 				console.log('fir:'+firstimage.value);
// // 				console.log('con:'+contentid.value);				
			
// 			//myForm.submit();
// 			});
		
		
		
	
		}

}


	
	output.addEventListener('click', () => {
		console.log(event.target.parentNode);
		let row = event.target.parentNode;
				
		choiceSpot.value = row.childNodes[1].innerText.replaceAll(" ","");		
		contentid.value = row.childNodes[0].innerText;
		title.value = row.childNodes[1].innerText.replaceAll(" ","");
		addr1.value = row.childNodes[2].innerText;
		firstimage.value = row.childNodes[4].querySelector('img').getAttribute('src');
		
		console.log(choiceSpot.value, contentid.value ,title.value, addr1.value, firstimage.value)
		
		myForm.submit()
	})
	

</script>
</body>
</html>