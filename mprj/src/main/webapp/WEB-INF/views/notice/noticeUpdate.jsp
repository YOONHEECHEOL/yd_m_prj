<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="container">
	<div class="row">
		<form id="id" name="id" action="noticeUpdateConfirm.do" method="post">
			<input type="hidden" id="nid" name="nid" value="${notice.NId }">



			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${notice.NDate }</td>
					</tr>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><input value="${notice.NTitle }"
							name="nTitle"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;"><input
							value="${notice.NContent }" name="nContent"></td>
					</tr>
				</tbody>
			</table>

			<a href="noticeList.do" class="btn btn-primary">목록보기</a>
			<button onclick="return confirm('정말로 수정하시겠습니까?')"
				class="btn btn-primary">수정</button>

		</form>
	</div>
</div>