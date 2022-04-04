<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th {
	width: 300px;
}
</style>

<div>
	<div>
		<h1>WISH LIST</h1>
	</div>
	<br/>
	
	<form id="wishFrm" name="wishFrm">
		<input type="hidden" id="contentTypeId" name="contentTypeId">
		<input type="hidden" id="contentId" name="contentId">
		<input type="hidden" id="firstImage" name="firstImage">
		<input type="hidden" id="title" name="title">
		<input type="hidden" id="addr1" name="addr1">
		<input type="hidden" id="mapx" name="mapx">
		<input type="hidden" id="mapy" name="mapy">
		
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
					<c:if test="${empty wishList }">
						<tr>
							<td colspan="4">WISH 목록이 존재하지 않습니다. 지금 찜하러 가보세요!</td>
						</tr>
					</c:if>
					<c:if test="${not empty wishList }">
						<c:forEach items="${wishList }" var="w">
							<tr>
								<td>
									<c:if test="${w.firstImage ne 'undefined' }">
										<img style="pointer-events:none;" src="${w.firstImage }">
									</c:if>
									<c:if test="${w.firstImage eq 'undefined' }">
										<img style="pointer-events:none;" src="images/noImage.jpg">
									</c:if>
								</td>
								<td>${w.title }</td>
								<td>${w.addr1 }</td>
								<td id="map">
									<input type="hidden" id="hContentTypeId" name="hContentTypeId" value="${w.contentTypeId }">
									<input type="hidden" id="hContentId" name="hContentId" value="${w.contentId }">
									<input type="hidden" id="hFirstImage" name="hFirstImage" value="${w.firstImage }">
									<input type="hidden" id="hTitle" name="hTitle" value="${w.title }">
									<input type="hidden" id="hAddr1" name="hAddr1" value="${w.addr1 }">
									<input type="hidden" id="hMapx" name="hMapx" value="${w.mapx }">
									<input type="hidden" id="hMapy" name="hMapy" value="${w.mapy }">
									<button type="submit" class="btn btn-primary mt20" onclick="visitBtnFun()">다녀옴</button>
									<button type="submit" class="btn btn-primary mt20" onclick="deleteBtnFun()">삭제</button>
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
	<a href="deliciousList.do" class="btn btn-primary mt20">찜하러가기</a>
</div>

<script type="text/javascript">
document.querySelector('#tab').addEventListener("click", function(event){
	event.preventDefault();
});

// 클릭시 view page 이동
tab.addEventListener('click', () => {
	let contentTypeIdVal = event.path[1].childNodes[7].childNodes[1].getAttribute('value');
	let contentIdVal = event.path[1].childNodes[7].childNodes[3].getAttribute('value');
	let mapxVal = event.path[1].childNodes[7].childNodes[11].getAttribute('value');
	let mapyVal = event.path[1].childNodes[7].childNodes[13].getAttribute('value');
	
 	contentTypeId.value = contentTypeIdVal;
 	contentId.value = contentIdVal;
 	mapx.value = mapxVal;
	mapy.value = mapyVal;
	
	console.log(contentTypeIdVal + ' ' + contentIdVal + ' ' + mapxVal + ' ' + mapyVal);
	
	wishFrm.action="deliciousSelect.do";
	wishFrm.method="post";
	wishFrm.submit();
});

// 다녀옴 버튼 처리
function visitBtnFun(){
	let contentTypeIdVal = document.querySelector('#hContentTypeId').value;
	let contentIdVal = document.querySelector('#hContentId').value;
	let firstImageVal = document.querySelector('#hFirstImage').value;
	let titleVal = document.querySelector('#hTitle').value;
	let addr1Val = document.querySelector('#hAddr1').value;
	let mapxVal = document.querySelector('#hMapx').value;
	let mapyVal = document.querySelector('#hMapy').value;
	
	contentTypeId.value = contentTypeIdVal;
	contentId.value = contentIdVal;
	firstImage.value = firstImageVal;
	title.value = titleVal;
	addr1.value = addr1Val;
	mapx.value = mapxVal;
	mapy.value = mapyVal;

	console.log(contentTypeIdVal + ' ' + contentIdVal + ' ' + firstImageVal + ' ' + titleVal + ' ' + addr1Val);
	
	let conf = confirm('VISIT 목록에 추가하시겠습니까?');
	if(conf){
		wishFrm.action="inDel.do"
		wishFrm.method="post"
		wishFrm.submit();		
	}
}

// 삭제 버튼 처리
function deleteBtnFun(){
	let contentIdVal = document.querySelector('#hContentId').value;
	contentId.value = contentIdVal;
	
	let conf = confirm('삭제하시겠습니까?');
	if(conf){
		wishFrm.action="wishDelete.do"
		wishFrm.method="post"
		wishFrm.submit();		
	}
}
</script>
