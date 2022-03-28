<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="wishFrm" name="wishFrm">
	<!-- <input type="hidden" id="contentTypeId" name="contentTypeId"> -->
	
	<div id="output">
		<div id="title"></div>
		<div id="subOutput">
			<p id="image"></p>
			<div id="detailOutput">
				<ul id="detailOutput"></ul>
			</div>
		</div>
		<br/>
		<div id="overviewOutput"></div>

		<div id="imgs"></div>
		<br/>

		<div>
			<button type="button" onclick="location.href='deliciousList.do'">목록</button>
			<c:if test="${not empty id}">
				<button type="submit" formaction="wishInsert.do" formmethod="post">가보고싶어요!</button>
				<button type="button">가봤어요!</button>
			</c:if>
		</div>

	</div>
</form>

<script>
	let contentTypeId = ${DeliCtid}
	let contentId = ${DeliCid}
	
	// 공통정보
 	let commUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?'
 			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
 			+'&contentTypeId=' + contentTypeId + '&contentId=' + contentId +'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y';
			
	const f1 = () => {
			$.ajax({
			type : "GET",
			url : commUrl,
			dataType : 'json',
			success : function(commRes) {
				//console.log(commRes);
				//console.log(commRes.response.body.items.item);
				
				let commInfo = commRes.response.body.items.item;
				
				// 상호명
				let title = document.querySelector('#title');
				let h1 = document.createElement('h1');
				h1.innerText = commInfo.title;
				title.append(h1);
				
				// 대표이미지
				let subOutput = document.querySelector('#subOutput');
				let image = document.querySelector('#image');
				let img = document.createElement('img');
				img.setAttribute('src', commInfo.firstimage);
				image.append(img);
				subOutput.append(image);
				
				// 정보
				let ul = document.querySelector('#detailOutput');
				let li1 = document.createElement('li');
				li1.innerText = '주소 ' + commInfo.addr1;
				ul.append(li1);
				
				let li2 = document.createElement('li');
				li2.innerText = '전화번호 ' + commInfo.tel;
				ul.append(li2);
				
				// 소개
				let overviewDiv = document.querySelector('#overviewOutput');
				let p = document.createElement('p');
				p.innerText = commInfo.overview;
				overviewDiv.append(p);
				
				// input영역
				// contentTypeId
				let form = document.querySelector('#wishFrm');
				let input1 = document.createElement('input');
				input1.setAttribute('type', 'hidden');
				input1.setAttribute('name', 'contentTypeId');
				input1.setAttribute('value', commInfo.contenttypeid);
				form.prepend(input1);
				
				// contentId
				let input2 = document.createElement('input');
				input2.setAttribute('type', 'hidden');
				input2.setAttribute('name', 'contentId');
				input2.setAttribute('value', commInfo.contentid);
				input1.after(input2);
				
				// cat1
				let input3 = document.createElement('input');
				input3.setAttribute('type', 'hidden');
				input3.setAttribute('name', 'cat1');
				input3.setAttribute('value', commInfo.cat1);
				input2.after(input3);
				
				// cat2
				let input4 = document.createElement('input');
				input4.setAttribute('type', 'hidden');
				input4.setAttribute('name', 'cat2');
				input4.setAttribute('value', commInfo.cat2);
				input3.after(input4);
				
				// cat3
				let input5 = document.createElement('input');
				input5.setAttribute('type', 'hidden');
				input5.setAttribute('name', 'cat3');
				input5.setAttribute('value', commInfo.cat3);
				input4.after(input5);
				
				// areaCode
				let input6 = document.createElement('input');
				input6.setAttribute('type', 'hidden');
				input6.setAttribute('name', 'areaCode');
				input6.setAttribute('value', commInfo.areacode);
				input5.after(input6);
				
				// sigunguCode
				let input7 = document.createElement('input');
				input7.setAttribute('type', 'hidden');
				input7.setAttribute('name', 'sigunguCode');
				input7.setAttribute('value', commInfo.sigungucode);
				input6.after(input7);
	
			}
		})
	}	
	// 실행문
	f1();
	
	// 소개정보
	let introUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?'
			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
			+'&contentTypeId=' + contentTypeId + '&contentId=' + contentId + '&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y';
	
	const f2 = () => {
			$.ajax({
			type : "GET",
			url : introUrl,
			dataType : 'json',
			success : function(introRes) {
				//console.log(introRes);
				//console.log(introRes.response.body.items.item);
	
				let introInfo = introRes.response.body.items.item;
	
				// 정보
				let ul = document.querySelector('#detailOutput');
				
				let li1 = document.createElement('li');
				li1.innerText = '영업시간 ' + introInfo.opentimefood;
				ul.append(li1);
				
				let li2 = document.createElement('li');
				li2.innerText = '대표메뉴 ' + introInfo.firstmenu;
				ul.append(li2);
				
				let li3 = document.createElement('li');
				li3.innerText = '메뉴 ' + introInfo.treatmenu;
				ul.append(li3);
				
			}
		})
	}
	f2();
	
	// 추가이미지
	let imageUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?'
			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
			+'&contentTypeId=' + contentTypeId +'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=' + contentId + '&imageYN=Y';
	
	const f3 = () => {
			$.ajax({
			type : "GET",
			url : imageUrl,
			dataType : 'json',
			success : function(imageRes) {
				//console.log(imageRes);
				//console.log(imageRes.response.body.items.item[0].originimgurl); // Array
			
				let imgInfo = imageRes.response.body.items.item;
	
				// 추가이미지
				let imgDiv = document.querySelector('#imgs');
				for (let i = 0; i<imgInfo.length; i++){
					let img = document.createElement('img');
					img.setAttribute('src', imgInfo[i].originimgurl);
					//console.log(imgInfo[i].originimgurl);
					imgDiv.append(img);
				}
			}
		})
	}
	f3();	
</script>