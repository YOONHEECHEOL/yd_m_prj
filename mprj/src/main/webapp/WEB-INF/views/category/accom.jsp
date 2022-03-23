<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accomm.html</title>
</head>
<body>
    <script>
var xhtp = new XMLHttpRequest();
var url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=3&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y'; /*URL*/
xhtp.open('GET', url);
xhtp.send();
xhtp.onload = function(){
	var result = JSON.parse(xhtp.responseText);
	console.log(result);
	var contents = ['주소 : ', '상세주소 : ', '상호명 : ','좋아요 : '];
	var table = document.createElement('table');
	tab.setAttribute('id','acommTable');
	
	
	var tbody = document.createElement('tbody');
	contents.forEach(function(field , ind , arr){
		var tr = document.createElement('tr');	
		var td = document.createElement('td');
		td.innerText = field;
		//tr.append(td);
	
		
		result.data.forEach(function(title , ind , ary){
			// title : 주소 / 상세주소 / 상호명 / 좋아요
		 tr = document.createElement('tr');
		for(let field of contents){
		 td = document.createElement('td');
		 td.innerText = title[field];
		}
	}
	
	});
	thead.append(tr);
	
	
		
}


</script>
</body>
</html>