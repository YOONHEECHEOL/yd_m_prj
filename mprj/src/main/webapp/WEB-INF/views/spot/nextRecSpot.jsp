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
	<input type="hidden" id="areaCode" name="areaCode" value="">
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
<nav aria-label="Pagination">
	<hr class="my-0" />
	<ul class="pagination justify-content-center my-4" id="paging"></ul>
</nav>
<!-- <span>${areaCode }</span> -->

<script>

alert("보고싶은 장소를 클릭해주세요.");
output.addEventListener('click',()=>{
	console.log(event.target.textContent);
	choiceSpot.value=event.target.textContent;
	areaCode.value = ${areaCode };
	myForm.submit();
});

// 리스트 함수
	/* function list(n){
		switch(n){
		case 1:
			break;
		case 2:
			return url+"&pageNo=13";
			break;
		case 3:
			return url+"&pageNo=26";
			break;
		}
	} */


var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y&areaCode="+ ${areaCode };
console.log(url)
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url);
xhtp.send();
xhtp.onload = function(){
var xml = xhtp.responseXML;
var data = xml.getElementsByTagName('item');
	console.log(data);

	/* var pageSize = 3; 	//﻿ 화면에 표시할 페이지 번호 수
	var totCnt = 151;	// ﻿전체 데이터 목록 수
	var listCnt = 12;	// ﻿페이지당 표시할 데이터 목록 수
	var pageNo = 1;		// ﻿현재 페이지 번호
	paging(pageSize, totCnt, listCnt, pageNo); */
	
	
	
	/* 페이징 함수 
	function paging(pageSize, totCnt, listCnt, pageNo) {
		//화면에 표시할 페이지 번호 수, 총 데이터 수, 페이지당 표시할 데이터 수, 현재 페이지 번호

		var pageCnt = Math.ceil(totCnt / listCnt);	//총 페이지 번호 개수
		var start = Math.floor((pageNo - 1) / pageSize) * pageSize + 1;	//시작 페이지 번호
		var end = (start + pageSize < pageCnt ? start + pageSize : pageCnt + 1); //끝 페이지 번호

		var html = '';
		if(start > 1) {		//시작점 페이지가 아닌 경우 왼쪽 이동 버튼 활성화
			html += '<li class="page-item"><button type="button" onclick="list(1)" class="page-link"><<</button></li>';
			html += '<li class="page-item"><button type="button" onclick="list('+ (start - pageSize) +')" class="page-link"><</button></li>';
		} else {	//disabled 처리
			html += '<li class="page-item disabled"><button type="button" class="page-link" tabindex="-1" aria-disabled="true"><</button></li>';
		}

		for(let i = start; i < end; i++) {
			html += '<li class="page-item ' + (i == pageNo ? 'active' : '') + '" aria-current="page"><button type="button" onclick="list('+ i +')" class="page-link">'+ i +'</button></li>';
		}

		if(end < pageCnt + 1) {	//마지막점 페이지가 아닌 경우 오른쪽 이동 버튼 활성화
			html += '<li class="page-item"><button type="button" onclick="list('+ (start + pageSize) +')" class="page-link">></button></li>';
			html += '<li class="page-item"><button type="button" onclick="list('+ pageCnt +')" class="page-link">>></button></li>';
		} else {	//disabled 처리
			html += '<li class="page-item disabled"><button type="button" class="page-link" tabindex="-1" aria-disabled="true">></button></li>';
		}

		document.getElementById('paging').innerHTML = html;
	}*/
	
	
	


	
	
var table = document.createElement('table');
	for(let i of data) {
		if(i.querySelector('firstimage2')){
	var tr = document.createElement('tr');
	
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