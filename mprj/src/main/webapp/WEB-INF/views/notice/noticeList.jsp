<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<div>
			<h1>게시글 목록</h1>
		</div>
		<div>
			<form id="frm" method="post">
				<div>
					<select id="searchKey" name="searchKey">
						<option value="전체">전체</option>
						<option value="제목">제목</option>
						<option value="내용">내용</option>
					</select> 
					<span>
					<input type="text" id="searchVal">&nbsp; 
					<input type="button" onclick="searchList()" value="검색"> 
					</span>
				</div>
				<div>
					<table border="1" id="content">
						<thead>
							<tr>
								<th width="150"><span style="color:red" onclick="sortBorder('A')">A </span>글번호
												<span style="color:red" onclick="sortBorder('D')"> D</span></th>
								<th width="300">제 목</th>
								<th width="150">작성일자</th>
								<th width="70">조회수</th>
							</tr>
						</thead>
						<tbody id="noticeBody">
							<c:if test="${empty notices }">
								<tr>
									<td colspan="5">게시글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${not empty notices }">
								<c:forEach items="${notices }" var="n">
									<tr onmouseover='this.style.background="#fcecae";'
									    onmouseleave='this.style.background="#FFFFFF";'
									    onclick='nContent("${n.nId }")'>
										<td>${n.nId }</td>
										<td>${n.nTitle }</td>
										<td>${n.nDate }</td>
										<td>${n.nHit }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<br>
				<div>
					<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
				</div>
				<input type="hidden" id="nId" name="nId">
			</form>
		</div>
	</div>
	<script type="text/javascript">
	function nContent(n) {
		frm.nId.value = n;
		frm.action = "noticeView.do";
		frm.submit();
	}
	
	function searchList() {
		$.ajax({
			url : "ajaxNoticeSearch.do",
			type : "post",
			data : {"key" : $("#searchKey").val(), "val" : $("#searchVal").val()},
			dataType : "json",
			success : function(result){
				if(result.length > 0){
					searchResult(result); // json data를 html로 변환해서 화면에 뿌려주는 메소드 
				}else {
					alert("검색한 결과 존재하지 않습니다.");
				}
			}
		});
	}
	
	function searchResult(data){ //json 객체를 html로 변환 후 화면에 적용함
		var tb = $("#noticeBody");
	$("#noticeBody").empty();
	
	$.each(data,function(index, item){
		var html = $("<tr />").attr({
			   'onmouseover' :'this.style.background="#fcecae";',
			   'onmouseleave' : 'this.style.background="#FFFFFF";',
			   'onclick' : 'nContent('+ item.nId +')'
		}).append(
				$("<td align='center'/>").text(item.nId),
				$("<td />").text(item.nTitle),
				$("<td align='center'/>").text(item.nDate),
				$("<td align='center'/>").text(item.nHit)
				);
		tb.append(html);
	});
		$("#content").append(tb);
	}
	
	function sortBorder(key) {
		$.ajax({
			url : "ajaxSortNotice.do",
			type : "post",
			data : {"key" : key},
			dataType : "json",
			success : function(result){
				searchResult(result);
					
				}
			
		});
	}
	
	</script>
</body>
</html>