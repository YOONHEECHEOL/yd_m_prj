<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
	<form id="nId" name="nId" action="noticeUpdate.do" method="post">
		<input type="hidden" id="nId" name="nId" value="${notice.NId }">
		

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${notice.NDate }</td>
					</tr>
					<tr>
						<td style="width: 20%; ">글 제목</td>
						<td colspan="2"><textarea name="nTitle" rows="1" cols="110" >${notice.NTitle }</textarea></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;"><textarea name="nContent" rows="6" cols="110">${notice.NContent }</textarea></td>
					</tr>
				</tbody>
			</table>
            <button type="button" onclick="location.href='noticeList.do'"  class="btn btn-primary">목록보기</button>
			<button type="submit" onclick="return confirm('정말로 수정하시겠습니까?')"  class="btn btn-primary">수정하기</button>
			<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')" formaction="noticeDelete.do?id=${notice.NId }" class="btn btn-primary">삭제</button>
				</form>
	</div>
	</div>