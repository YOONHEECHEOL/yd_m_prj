<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="output">
	<div id="title"></div>
	<div id="subOutput">
		<p id="image"></p>
		<div id="detailOutput">
			<ul id="detailOutput"></ul>
		</div>
	</div>
	
	<div class="col-3 colImg"></div>
	
	<div>
		<button type="button" onclick="location.href='deliciousList.do'">목록</button>
		<button type="button" >가보고싶어요!</button>
		<button type="button" >가봤어요!</button>
	</div>

</div>

<script type="text/javascript">
	//let contentTypeId = ${DeliCtid}
	//let contentId = ${DeliCid}
	
	// 공통정보
 	let commUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?'
 			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
 			+'&contentTypeId=39&contentId=2598695&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&transGuideYN=Y';
			
	$.ajax({
		type : "GET",
		url : commUrl,
		dataType : 'json',
		success : function(commRes) {
			//console.log(commRes);
			//console.log(commRes.response.body.items.item);
			
			let commInfo = commRes.response.body.items.item;
			
			let output = document.querySelector('#output');
			
			let title = document.querySelector('#title');
			let h1 = document.createElement('h1');
			h1.innerText = commInfo.title;
			title.append(h1);
			
			let subOutput = document.querySelector('#subOutput');
			let image = document.querySelector('#image');
			let img = document.createElement('img');
			img.setAttribute('src', commInfo.firstimage);
			image.append(img);
			subOutput.append(image);
			
			let ul = document.querySelector('#detailOutput');
			for(let i = 1; i<=2; i++){
				let li = document.createElement('li');
				li.innerText = '주소 ' + commInfo.addr1;
				li.innerText = '전화번호 ' + commInfo.tel;
				ul.append(li); // 실패!
			}
		}
	})
			
	// 소개정보
	let introUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro?'
			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
			+'&contentTypeId=39&contentId=2598695&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y';
	
	$.ajax({
		type : "GET",
		url : introUrl,
		dataType : 'json',
		success : function(introRes) {
			//console.log(introRes);
			//console.log(introRes.response.body.items.item);

			let introInfo = introRes.response.body.items.item;

			let ul = document.querySelector('#detailOutput');
			for(let i = 1; i<=3; i++){
				let li = document.createElement('li');
				li.innerText = '영업시간 ' + introInfo.opentimefood;
				li.innerText = '대표메뉴 ' + introInfo.firstmenu;
				li.innerText = '메뉴 ' + introInfo.treatmenu;
				ul.append(li); // 실패!
			}
		}
	})
	// 추가이미지
	let imageUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?'
			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
			+'&contentTypeId=39&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&contentId=2598695&imageYN=Y';
	
	$.ajax({
		type : "GET",
		url : imageUrl,
		dataType : 'json',
		success : function(imageRes) {
			console.log(imageRes);
			console.log(imageRes.response.body.items.item); // Array
		
			let imgInfo = imageRes.response.body.items.item;

			let imgDiv = document.querySelector('.col-3 colImg');
			for (let i = 0; i<imgInfo.length; i++){
				let img = document.createElement('img');
				img.setAttribute('src', imgInfo[i].originimgurl);
				console.log(imgInfo.originimgurl);
				imgDiv.append(img);
			}
		}
	})
</script>