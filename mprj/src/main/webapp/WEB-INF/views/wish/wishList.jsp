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
							<td id="img"><c:choose>
									<c:when test="${not empty w.firstImage }">
										<img src="${w.firstImage }">
									</c:when>
									<c:when test="${w.firstImage eq 'undefined' }">
										<!-- 사진안뜸 수정 필요 -->
										<img src="images/noImage.jpg">
									</c:when>
								</c:choose></td>
							<td id="title">${w.title }</td>
							<td id="addr">${w.addr1 }</td>
							<td>
								<input type="hidden" id="contentTypeId" name="contentTypeId" value="${w.contentTypeId }">
								<input type="hidden" id="contentId" name="contentId" value="${w.contentId }">
								<button type="submit" class="btn btn-primary mt20">다녀옴</button>
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
		let contentTypeIdVal = event;
		//let contentIdVal = ;
		
		
		console.log(contentTypeIdVal);
		//console.log(contentTypeIdVal + ' ' + contentIdVal);
		
		wishFrm.submit();
	})
</script>
