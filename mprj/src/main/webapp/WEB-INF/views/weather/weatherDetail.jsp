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




<!-- 지도 api를 뿌리는 부분 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=96d8362c4127f1303ff812329542ad1d"></script>
<div class="row border-top p-3" style="margin-left: 350px; margin-right:50px;">
	<div class="col-2">
	<h5><strong>주소 <span style="color:red;">*</span></strong></h5>
	</div>
	<div class="col-auto">
		<input type="hidden" name="place">
		<input type="text" size="40" name="address" id="address" class="essential">
		<input type="hidden" name="lat">
		<input type="hidden" name="lng">
	</div>
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
var geocoder = new kakao.maps.services.Geocoder();

$("#address").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("#address").val(data.address);
            $("#address").prop("readonly",true);
            $("input[name=place]").val(data.sido);
            console.log($("input[name=place]").val(data.sido));
            var juso =  $("#address").val();
        	geocoder.addressSearch(juso, callback);  
        }
    }).open();
});

var callback = function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		$("input[name=lng]").val(result[0].x);
		$("input[name=lat]").val(result[0].y);
	}
};




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
				var tr=document.createElement('tr');
				var td1=document.createElement('td');//지역이름
				var td2=document.createElement('td');// 코스이름
				var td3=document.createElement('td');//관광지명
				var td4=document.createElement('td');//테마
				var td5=document.createElement('td');//식중독
				var td6=document.createElement('td');//자외선
				var td7=document.createElement('td');//체감온도
				
				
				td1.innerText= i.querySelector('spotAreaName').textContent;
				td2.innerText = i.querySelector('courseName').textContent;
				td3.innerText = i.querySelector('spotName').textContent;
				td4.innerText = i.querySelector('thema').textContent;
				td5.innerText = i.querySelector('fdIndex').textContent;// 식중독
				td6.innerText = i.querySelector('uvIndex').textContent;// 자외선
				td7.innerText = i.querySelector('btIndex').textContent;// 체감온도
				
				tr.append(td1, td2 ,td3 ,td4 ,td5 ,td6 ,td7 );
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
		}	
		
	}
	</script>


</body>
</html>