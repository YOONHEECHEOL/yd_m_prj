<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨정보페이지</title>
</head>
<body>


<table id="weahter" class="table table-hover">
<thead>
<tr>
<th>관광지명</th>
<th>코스명</th>
<th>테 마</th>
<th>날 씨</th>
</tr>
</thead>
<tbody id="output">
</tbody>
</table>

<script>
		var url = 'https://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst?serviceKey=4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D&pageNo=1&numOfRows=20&dataType=XML&CURRENT_DATE=2019122010&HOUR=24';
		var ran = 1+(Math.floor(Math.random()*10));
		var str = '&COURSE_ID='+ran
		var xhtp = new XMLHttpRequest(); 
		xhtp.open('GET', url+str);
		xhtp.send();
		xhtp.onload = function(){
			var xml = xhtp.responseXML;
			var data = xml.getElementsByTagName('item');
			console.log(data);
			// 중복되는 값을 줄이기 위해서 짝수행 출력
			for(let i=0;i<data.length;i++){
				
				if(data[i*2].querySelector('sky').textContent){
					switch(data[i*2].querySelector('sky').textContent){
					case '1':
						var sky = "맑음";
						break;
					case '2':
						var sky = "구름";
						break;
					case '3':
						var sky = "흐림";
						break;
					case '4':
						var sky = "비";
						break;
					case '5':
						var sky = "소나기";
						break;
					case '6':
						var sky = "비눈";
						break;
					case '7':
						var sky = "눈비";
						break;
					case '8':
						var sky = "눈";
						break;
					}
					
					}
					var tr = document.createElement('tr');
					var td = document.createElement('td');
					var td2 = document.createElement('td');
					var td3 = document.createElement('td');
					var td4 = document.createElement('td');
					
					td.innerText = data[i*2].querySelector('spotName').textContent;
					td2.innerText = data[i*2].querySelector('courseName').textContent;
					td3.innerText = data[i*2].querySelector('thema').textContent;
					td4.innerText = sky;
					
					tr.append(td, td2, td3, td4);
					output.append(tr);
					
				
				}
			
			
			/* for(let i of data){
				// 하늘 상태 switch
				
				if(i.querySelector('sky').textContent){
				switch(i.querySelector('sky').textContent){
				case '1':
					var sky = "맑음";
					break;
				case '2':
					var sky = "구름";
					break;
				case '3':
					var sky = "흐림";
					break;
				case '4':
					var sky = "비";
					break;
				case '5':
					var sky = "소나기";
					break;
				case '6':
					var sky = "비눈";
					break;
				case '7':
					var sky = "눈비";
					break;
				case '8':
					var sky = "눈";
					break;
				}
				
				}
				var tr = document.createElement('tr');
				var td = document.createElement('td');
				var td2 = document.createElement('td');
				var td3 = document.createElement('td');
				var td4 = document.createElement('td');
				
				td.innerText = i.querySelector('spotName').textContent;
				td2.innerText = i.querySelector('courseName').textContent;
				td3.innerText = i.querySelector('courseName').textContent;
				td4.innerText = sky;
				
				tr.append(td, td2, td3, td4);
				output.append(tr);
				
				
			} */
			
		} 

</script>

</body>
</html>