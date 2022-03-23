<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form id="frm" method="post" action="noticeInsert.do">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>

						</tr>
					</thead>
					<tbody>
					<tr>
							<td><input type="date" class="form-control" placeholder="글 제목" id="nDate" name="nDate"required="required" maxlength="50"></td>
							</tr>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" id="nTitle" name="nTitle" required="required" maxlength="50"></td>
							</tr>	
							<tr>								
							<td><textarea  class="form-control" placeholder="글 내용" name="nContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<%-- <c:if test="${not empty id }"> --%>
					<input type="submit" class="btn btn-primary pull-right" onClick="location.href='noticeList.do'" value="등록">
			    <%-- </c:if> --%>
			</form>
		</div>
	</div>
</body>
</html>