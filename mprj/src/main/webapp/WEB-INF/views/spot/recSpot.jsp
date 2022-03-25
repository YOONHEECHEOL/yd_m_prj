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
<h1>추천관광지</h1>
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
//xmlToJson Function | xml 파일을 json 파일로 변환
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
var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=12&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y";
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url);
xhtp.send();
xhtp.onload = function(){
	// console.log(xhtp.responseXML);
	// XML object
	var xml = xhtp.responseXML;
	
	var data = xml.getElementsByTagName('item');
	console.log(data);
	console.log(data[0].querySelector('title').textContent);
	console.log(data[0].querySelector('addr1').textContent);
	
	
	var contents = ['상호명' , '주소'];
	var list = ['item>title' , 'item>addr1']; 
	var div = document.createElement('div');
	var table = document.createElement('table');
	var tr = document.createElement('tr');
	// tag를 작성하여 상호명과 주소를 출력
	var tag = "";
	
	// print
	for(let i of data) {
		var tr = document.createElement('tr');
		
		var td1 = document.createElement('td');
		td1.innerText = i.querySelector('title').textContent;
		
		var td2 = document.createElement('td');
		td2.innerText = i.querySelector('addr1').textContent; 
		console.log('td2:'+td2);
		var td3 = document.createElement('td');
		td3.innerHTML='<img src='+'"'+i.querySelectorAll('firstimage2').childNodes()+'"'+'>';
		console.log(data.body.childNodes);
		
		tr.append(td1, td2, td3);
		
		output.append(tr);		
	}
	
	
	/* tag='<td>'+'상호명'+': '+xml.querySelector('item>title').textContent+'</td>';
				
		console.log('tag: '+tag);
		appendTag();
		
	tag='<td>'+'주소'+': '+xml.querySelector('item>addr1').textContent+'</td>';
		console.log('tag: '+tag);
		appendTag();
		
	
	function appendTag(){
		tr.append(tag);
		table.append(tr)
		div.append(table);
		document.body.append(div);
		} */
	
	}
</script>

</body>
</html>