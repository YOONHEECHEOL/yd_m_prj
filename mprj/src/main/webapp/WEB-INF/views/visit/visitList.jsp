<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th {
	width: 300px;
}
</style>

<div>
	<form id="visitFrm" name="visitFrm" action="deliciousSelect.do"
		method="post">
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
					<c:if test="${empty visitList }">
						<tr>
							<td colspan="4">VISIT 목록이 존재하지 않습니다. 지금 찜하러 가보세요!</td>

						</tr>
					</c:if>
					<c:if test="${not empty visitList }">
						<c:forEach items="${visitList }" var="v">
							<tr>
								<td id="img"><c:if test="${v.firstImage ne 'undefined' }">
										<img src="${v.firstImage }">
									</c:if> <c:if test="${v.firstImage eq 'undefined' }">
										<img src="images/noImage.jpg">
									</c:if></td>
								<td id="title">${v.title }</td>
								<td id="addr">${v.addr1 }</td>
								<td>
									<input type="hidden" id="contentTypeId" name="contentTypeId" value="${v.contentTypeId }">
									<input type="hidden" id="contentId" name="contentId" value="${v.contentId }">
									<button type="submit" class="btn btn-primary mt20" onclick="delBtnCheck()">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<br />
		<div></div>
	</form>
</div>
<br />
<div>
	<button type="button" class="btn btn-primary mt20" onclick="location.href='deliciousList.do'">관광지 목록으로 가기</button>
</div>

<script type="text/javascript">
// 클릭시 view page 이동
tab.addEventListener('click', () => {
	let contentTypeIdVal = event.path[1].childNodes[7].childNodes[1].getAttribute('value');
	let contentIdVal = event.path[1].childNodes[7].childNodes[3].getAttribute('value');
	
	console.log(contentTypeIdVal + ' ' + contentIdVal);
	
	visitFrm.submit();
})

// 삭제버튼 처리
function delBtnCheck(){
	let conf = confirm('삭제하시겠습니까?');
	if(conf){
		wishFrm.action="visitDelete.do";
		wishFrm.method="post";
		wishFrm.submit();
	}
}
</script>