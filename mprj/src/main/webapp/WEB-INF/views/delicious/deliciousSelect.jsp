<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"
	integrity="sha512-HX+/SvM7094YZEKOCtG9EyjRYvK8dKlFhdYAnVCGNxMkA59BZNSZTZrqdDlLXp0O6/NjDb1uKnmutUeuzHb3iQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<div>
	<div>
		<h1>Delicious Select</h1>
	</div><br/>
	<div id="output">
	<table>
		<tr>
			<th>이미지</th>
			<td><img src="${deli.firstimage }"></td>
		</tr>
		<tr>
			<th>상호명</th>
			<td>${deli.title }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${deli.addr1 }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${deli.tel }</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>상세</th> -->
<%-- 			<td>${deli.overview }</td> --%>
<!-- 		</tr> -->
	</table>
	</div>
</div>

<script type="text/javascript">

</script>