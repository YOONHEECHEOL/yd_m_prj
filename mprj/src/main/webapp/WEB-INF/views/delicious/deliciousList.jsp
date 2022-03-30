<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div align="center">
	<div>
		<h1>음식점</h1>
	</div>
	<br />

	<form id="DeliFrm" name="DeliFrm">
		<input type="hidden" id="contentTypeId" name="contentTypeId" value="39"> 
		<input type="hidden" id="contentId" name="contentId">
		<div>
			<select name="cat3" id="cat3">
				<option value="">선택</option>
				<option value="A05020100">한식</option>
				<option value="A05020200">서양식</option>
				<option value="A05020300">일식</option>
				<option value="A05020400">중식</option>
				<option value="A05020500">아시아식</option>
				<option value="A05020900">바/카페</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<input type="text" id="keyword" name="keyword" size="50" placeholder="검색하고 싶은 키워드를 입력하세요.">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary mt20" onclick="submitFrm()">확인하기</button>
		</div>
		<!-- 메뉴 다시 선택시 결과 값 오류... 수정 -->
		<br /> <br />

		<div id="output" class="row">
			<!-- 이곳에 출력 -->
		</div>
		<br />
	</form>

	<div>
		<!-- <input type="hidden" value="listYN=Y" id="listYN">
   			<input type="hidden" value="MobileOS=ETC&MobileApp=TourAPI3.0_Guide">
   			<input type="hidden" value="arrange=A"> -->
		<input type="text" placeholder="numOfRows=12">
		<input type="text" placeholder="pageNo=1">
	</div>
	<br /> <br />
</div>

<script>
	document.querySelector('#DeliFrm').addEventListener("click", function(event){
		event.preventDefault();
	});
      
	// 확인하기 버튼 -> AJAX로 api호출
	function submitFrm(){
		let cat3 = document.querySelector('#cat3').value;
		console.log(cat3);

		let DeliUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?'
			+'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
			+'&contentTypeId=39' +'&areaCode=&sigunguCode='
			+'&cat1=A05'+'&cat2=A0502' + '&cat3=' + cat3 + '&listYN=Y&MobileOS=ETC'
			+'&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1';
		
		let n = document.querySelector('#keyword').value;
		console.log(n);
		
		let keywordVal = encodeURI(n);
		
		if(keywordVal != ''){
			// 키워드가 있는경우
			let kwdUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?'
				+'serviceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
				+'&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=10&listYN=Y&arrange=A'
				+'&contentTypeId=39&cat1=A05&cat2=A0502&cat3=' + cat3 + '&keyword=' + keywordVal;
			
			console.log(kwdUrl);
			
			$.ajax({
				type : "GET",
				url : kwdUrl,
				dataType : 'json',
				success : function(DeliResponse){
					console.log(DeliResponse);
					//console.log(kwdResponse.response.body.items.item[0]);
					
					let output = document.querySelector('#output');
					for(let item of DeliResponse.response.body.items.item){
						let div = document.createElement('div');
						div.setAttribute('class', 'col-3 colImg');
						
						let img = document.createElement('img');
						if(item.firstimage != null){
							img.setAttribute('src', item.firstimage);
						} else {
							img.setAttribute('src', 'images/noImage.jpg');
						}
						
						let h6 = document.createElement('h6');
						h6.innerText = item.title;
							
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.setAttribute('value', item.contentid);
							
						div.append(img, h6, input);

						output.append(div);
					}
				}
			});   
		} else {
			// 키워드가 없다면
			$.ajax({
				type : 'GET',
				url : DeliUrl,
				dataType : 'json',
				success : function(DeliResponse){
					console.log(DeliResponse);
					console.log(DeliResponse.response.body.items.item[0]);
				   
				let output = document.querySelector('#output');
				for(let item of DeliResponse.response.body.items.item){
					let div = document.createElement('div');
					div.setAttribute('class', 'col-3 colImg');
					
					let img = document.createElement('img');
					if(item.firstimage != null){
						img.setAttribute('src', item.firstimage);
					} else {
						img.setAttribute('src', 'images/noImage.jpg');
					}
					
					let h6 = document.createElement('h6');
					h6.innerText = item.title;
						
					let input = document.createElement('input');
					input.setAttribute('type', 'hidden');
					input.setAttribute('value', item.contentid);
						
					div.append(img, h6, input);

					output.append(div);
				}
			}
		});
	}
}
	// yoon
	output.addEventListener('click', () => {
		let contentIdVal = event.target.childNodes[2].getAttribute('value');
		
		console.log(event.target);
		
		contentId.value = contentIdVal;
		
		DeliFrm.action="deliciousSelect.do";
		DeliFrm.method="post";
		DeliFrm.submit();
	});
 
</script>