<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th {
	width: 300px;
}
</style>

<div>
	<form id="wishFrm" name="wishFrm" action="deliciousSelect.do" method="post">
		<div id="output">
			<table>
				<thead>
					<tr>
						<th>이미지</th>
						<th>제 목</th>
						<th>주 소</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="tab">
					<c:forEach items="${wishList }" var="w">
						<tr>
							<td id="img">
								<c:if test="${w.firstImage ne 'undefined' }">
									<img src="${w.firstImage }">
								</c:if>
								<c:if test="${w.firstImage eq 'undefined' }">
									<img src="images/noImage.jpg">
								</c:if>
							</td>
							<td id="title">${w.title }</td>
							<td id="addr">${w.addr1 }</td>
							<td>
								<input type="hidden" id="contentTypeId" name="contentTypeId" value="${w.contentTypeId }">
								<input type="hidden" id="contentId" name="contentId" value="${w.contentId }">
								<input type="hidden" id="firstImage" name="firstImage" value="${w.firstImage }">
								<input type="hidden" id="title" name="title" value="${w.title }">
								<input type="hidden" id="addr1" name="addr1" value="${w.addr1 }">
								<button type="submit" class="btn btn-primary mt20" formaction="visitInsert.do" formmethod="post">다녀옴</button>
								<button type="submit" class="btn btn-primary mt20" formaction="wishDelete.do" formmethod="post">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br />
		<div></div>
	</form>
</div>
<br />
<div>
	<button type="button" class="btn btn-primary mt20"
		onclick="location.href='deliciousList.do'">찜하러가기</button>
</div>

<script type="text/javascript">
	// 클릭시 view page 이동
	tab.addEventListener('click', () => {
		let contentTypeIdVal = event.path[1].childNodes[7].childNodes[1].getAttribute('value');
		let contentIdVal = event.path[1].childNodes[7].childNodes[3].getAttribute('value');
		
		console.log(contentTypeIdVal + ' ' + contentIdVal);
		
		wishFrm.submit();
	})
</script>
