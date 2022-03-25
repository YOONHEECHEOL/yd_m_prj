<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
function goUp(){
	
console.log($("#nid").val());
 
 $frm =  $("#id");
 $frm.attr("action","noticeUpdate.do");
 $frm.attr("target","_self");
 $frm.submit(); 
 
 }
</script> 
<div class="container">
	<div class="row">
	<form id="id" name="id" method="post">
		<input type="hidden" id="nid" name="nid" value="${notice.NId }">
		

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${notice.NDate }</td>
					</tr>
					<tr>
						<td style="width: 20%; ">글 제목</td>
						<td colspan="2">${notice.NTitle }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;">${notice.NContent }</td>
					</tr>
				</tbody>
			</table>
			<a href="noticeList.do" class="btn btn-primary">목록보기</a>
			<c:if test="${author eq 'admin'}">				
				<!-- <a href="noticeUpdate.do" class="btn btn-primary">수정</a>
				<a href="noticeDelete.do" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')"  class="btn btn-primary">삭제</a>  -->
				<button type="button" class="btn btn-primary" onclick="goUp()">수정</button>
				<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')" formaction="noticeDelete.do?id=${notice.NId }" class="btn btn-primary">삭제</button>
			</c:if>
	</form>
	</div>
	</div>