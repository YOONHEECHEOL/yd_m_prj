<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상 세 보 기</title>
</head>
<body>
<form action="choiceSpotView.do" method="POST" name="myForm" id="myForm">
	<input type="hidden" id="choiceSpot" name="choiceSpot" value="">
</form>
<div>
<input type="button" onclick="location.href='home.do'" value="홈가기" />
<input type="button" onclick="location.href='recSpot.do'" value="뒤로가기" />
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

<tbody id="output"></tbody>

</table>
<span>${areaCode }</span>

<script>
output.addEventListener('click',()=>{
	console.log(event.target.textContent);
	choiceSpot.value=event.target.textContent;
	myForm.submit();
});


var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode="+ ${areaCode };
console.log(url)
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url);
xhtp.send();
xhtp.onload = function(){
var xml = xhtp.responseXML;
var data = xml.getElementsByTagName('item');
	console.log(data);

var table = document.createElement('table');
	for(let i of data) {
		if(i.querySelector('firstimage2')){
	var tr = document.createElement('tr');
	//$('tbody>tr').attr({ // onclick 이벤트로 새로운 뷰를 보여준다
		//'onclick':'location.href="choiceSpotView.do"'
	//});
	var td1 = document.createElement('td');
		td1.innerText =  i.querySelector('title').textContent;
		
	var td2 = document.createElement('td');
		td2.innerText =  i.querySelector('addr1').textContent;
		
	var td3 = document.createElement('td');
		td3.innerText =  i.querySelector('tel').textContent;
		
		
		var td4 = document.createElement('td');
		td4.innerHTML='<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
		
	
		
		
		tr.append(td1, td2 ,td3, td4);
		output.append(tr);
		}
	}
}




</script>
</body>
</html>