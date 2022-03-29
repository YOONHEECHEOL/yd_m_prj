<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
th {
	width:300px;
}
</style>

<div>
	<form id="wishFrm" name="wishFrm">
		<div id="output">
			<table>
				<thead>
					<tr>
						<th>이미지</th>
						<th>제  목</th>
						<th>주  소</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="init">
					<c:forEach items="${wishList }" var="w">
						<tr>
							<td id="img">
								<c:choose>
									<c:when test="${not empty w.firstImage }">									
										<img src="${w.firstImage }">
									</c:when>
									<c:otherwise>
										<!-- 사진안뜸 수정 필요 -->
										<img src="images/noImage.jpg">
									</c:otherwise>
								</c:choose>
							</td>
							<td id="title">${w.title }</td>
							<td id="addr">${w.addr1 }</td>
							<td>
								<input type="hidden" id="contentId" name="contentId" value="${w.contentId }">							
								<button type="submit" class="btn btn-primary mt20">다녀옴</button>
								<button type="submit" class="btn btn-primary mt20">삭제</button>
							</td>
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
	<button type="button" class="btn btn-primary mt20" onclick="location.href='deliciousList.do'">돌아가기</button>
</div>

<script type="text/javascript">
// document.addEventListener('DOMContentLoaded', () => {
// 	let tmpList = [];
// 	init.querySelectorAll('tr').forEach(r => {
// 		let img = r.querySelector('#img');
// 		fetch('', {
			
// 		})
		
// 	});
// 	console.log(tdList);
// 	console.log(tmpList);
	
// 	for(let td of init[0]){
		
// 		let contentId = document.querySelector('#contentId').value;
// 		let infoUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?'
// 				+'serviceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
// 				+'&MobileOS=ETC&MobileApp=AppTest&contentId=' + contentId + '&defaultYN=Y&firstImageYN=Y&areacodeYN=Y'
// 				+'&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';
// 		$.ajax({
// 			type : "GET",
// 			url : infoUrl,
// 			dataType : 'json',
// 			success : function(infoRes){
// 				console.log(infoRes);
// 				console.log(infoRes.response.body.items.item);
				
// 				let info = infoRes.response.body.items.item;
				
// 					// 이미지
// 					let tdImg = document.querySelector('#img');
// 					let img = document.createElement('img');
// 					if(info.firstimage != null){
// 						img.setAttribute('src', info.firstimage);
// 					} else {
// 						img.setAttribute('src', 'images/noImage.jpg');
// 					}
// 					tdImg.append(img);
					
// 					// 제목
// 					let tdTitle = document.querySelector('#title');
// 					tdTitle.innerText = info.title;
					
// 					//주소
// 					let tdAddr = document.querySelector('#addr');
// 					tdAddr.innerText = info.addr1;
// 				}
// 		});
// 	//}




</script>
