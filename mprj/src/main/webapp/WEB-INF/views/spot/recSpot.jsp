<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>recSpot.jsp</title>
</head>
<body>

<h1 align="center">오늘의 숙박</h1>
<form name="myForm" action="nextRecSpot.do" method="POST" id="myForm">
	<input type="hidden" value="" id="areaCode" name="areaCode">
</form>
<div id="nextArea" align="center">
	<button type="button" value="1">서울</button>
	<button type="button" value="2">인천</button>
	<button type="button" value="3">대전</button>
	<button type="button" value="4">대구</button>
	<button type="button" value="5">광주</button>
	<button type="button" value="6">부산</button>
	<button type="button" value="7">울산</button>
	<button type="button" value="39">제주</button>
	
</div>

<table class="table table-striped">

<thead>
 
<tr>
<th>상호명</th>
<th>주 소</th>
<th>썸네일</th>
</tr>
</thead>

	<tbody id="output">
	</tbody>

</table>

<!-- API를 불러와서 XML타입으로 구현을 시도 -->
<!-- 상단부 시 도별 구분 버튼부 구현 필요 -->

<script>
// yoon
nextArea.addEventListener('click', () => {
	console.log(event.target.value)
	let aV = event.target.value;
	areaCode.value = aV;
	
	myForm.submit();
})


//xmlToJson Function | xml 파일을 json 파일로 변환 ==> 안되는듯 그래서 XML로 계속 진행중
function xmlToJson(res) {
	const parser = new DOMParser();
	const xml = parser.parseFromString(res, "application/xml");
	console.log(xml);
	console.log(xml.body);

	let x2js = new X2JS();
	// 파싱된 json 데이터
	let jsonObj = x2js.xml_str2json(res);
	console.log(jsonObj)

	return jsonObj;
}

// url 자체적으로 1개의 페이지를 서치 하여 안의 내용만 가져와서 뿌려줄 상황
var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y";
var ma = 1+(Math.floor(Math.random()*10));
var rand = '&areaCode='+ma;
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url+rand);
xhtp.send();
xhtp.onload = function(){
	// console.log(xhtp.responseXML);
	// XML object
	var xml = xhtp.responseXML;
	
	var data = xml.getElementsByTagName('item');
	console.log(data);
	//console.log(data[0].querySelector('title').textContent);
	//console.log(data[0].querySelector('addr1').textContent);
	
	// div [#nextArea]
	//var areaName=['서울','부산','대구','인천','광주','대전','울산','제주도'];
/* 	for(let i=0;i<areaName.length;i++){
		// 각 시도 이름마다 detail view page 이동할 수 있는버튼을 구현중
		var span = document.createElement('span');
		span.innerHTML = '<button type="submit" class="nextAreaCode" value="'+areaName[i]+'">'+areaName[i]+'</button>'+'&nbsp;';
		nextArea.append(span);
		
	} */
	
	
	
	// tbody [#output]
	/*
	var contents = ['상호명' , '주소'];
	var list = ['item>title' , 'item>addr1']; 
	var div = document.createElement('div');
	*/
	var table = document.createElement('table');
	var tr = document.createElement('tr');
	// tag를 작성하여 상호명과 주소를 출력
	var tag = "";
	
	// print
	for(let i of data) {
		if(i.querySelector('firstimage2')){
		console.log(i);
		var tr = document.createElement('tr');
		// 상호명
		var td1 = document.createElement('td');
		td1.innerText = i.querySelector('title').textContent;
		// 주소
		var td2 = document.createElement('td');
		td2.innerText = i.querySelector('addr1').textContent; 
		console.log('td2:'+i.querySelector('addr1').textContent);
		// 썸네일 이미지
		var td3 = document.createElement('td');
		td3.innerHTML='<img src="'+i.querySelector('firstimage2').textContent+'" width="100px";height="70px;">';
		//console.log("====i.querySelectorAll('firstimage2')===");
		//console.log(i.querySelector('firstimage2').textContent);
		
		
		
		
		
		tr.append(td1, td2, td3);
		
		output.append(tr);
		}
	}
	}

</script>

</body>
</html>