<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<div><h1>게시글 상세보기</h1></div>
<div>
<table border="1">
						<tr>
							<th width="100">작성일자</th>
							<td width="150">${notice.nDate }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${notice.nTitle }</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea rows="10" cols="80">${notice.nContent }</textarea></td>
						</tr>
					</table>
</div><br>
<div>
<button type="button" onclick="location.href='noticeList.do'">목록가기</button>&nbsp;&nbsp;
<button type="button" onclick="">수정</button>&nbsp;&nbsp;
<button type="button" onclick="">삭제</button>&nbsp;&nbsp;
</div>
</div>
</body>
</html>