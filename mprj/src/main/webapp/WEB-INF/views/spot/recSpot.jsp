<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- API를 불러와서 json타입으로 구현을 시도 -->
<head>
<title></title>
</head>
<body>
<script>
var url = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchStay?serviceKey=vExVsx1FJkY9Uma%2BjJadUHgr%2BPmrFWpSYvG64oal%2FQDNkwHqVRw%2B68%2Bl3hmjmyB7SNjoN%2BtUI9j%2FljKQObjoFg%3D%3D&numOfRows=1&pageNo=1&MobileOS=ETC&MobileApp=AppTest&arrange=A&listYN=Y"
var xhtp = new XMLHttpRequest();
xhtp.open('GET' , url);
xhtp.send();
xhtp.onload = function(){
	// JSON object 로 파싱
	var result = JSON.parse(xhtp.responseText);
	// 화면에 출력할 내용들
	var contents = ['상호명','주소','상세주소'];
	var table = document.createElement('table');
	//table.setAtrribute('background-color','gray');
	table.setAttribute('id' , 'myRecAccomTable');
	var a= ['title','addr1','addr2'];
	result.data.forEach(function(center , ind , arr){
		// center => 상호명 , 주소 , 상세주소
		
		console.log('a[field]');
		tr = document.createElement('tr');
		//td = document.createElement('td');
		var tag = "";
		tag +='<td>'+center[field]+':'+document.getElementsByTagName(a[field])+'</td>';
		tr.append(tag);
		
	});
		table.append(tr);
		document.body.append(table);

}
</script>

</body>