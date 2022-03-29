<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div align="center">
	<div>
		<h1>음식점</h1>
	</div>
	<br />
	
	<form id="DeliFrm" name="DeliFrm" action="deliciousSelect.do" method="post">
		<input type="hidden" id="contentTypeId" name="contentTypeId">
		<input type="hidden" id="contentId" name="contentId">
		<div>
			<span>ContentTypeId ( 관광지 | 숙박 | 음식점 )</span>
			<select name="contentTypeSel" id="contentTypeSel">
				<option value="">선택</option>
				<option value="12">관광지</option>
				<option value="32">숙박</option>
				<option value="39">음식점</option>
			</select> <br /> <br />
		</div>
	
		<div>
			<!-- <input type="text" placeholder="cat1=" id="cat1"> -->
			<select name="cat1" id="cat1"></select>
			<select name="cat2" id="cat2"></select>
			<select name="cat3" id="cat3"></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-primary mt20" onclick="submitFrm()">확인하기</button>

			<!-- 메뉴 다시 선택시 결과 값 그대로임... 수정 -->
		</div>	
		<br />
		<br />
	
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
	<br/><br/>
</div>

<script>
	document.querySelector('#DeliFrm').addEventListener("click", function(event){
		event.preventDefault();
	});

	document.addEventListener('DOMContentLoaded', () => {
      // cat 값 불러오기
      const f1 = () => {
         contentTypeSel.addEventListener('change', ()=>{
            if(contentTypeSel.value == '39'){
               // contentType 값 불러오는 ajax 필요
               let options = ['선택', '음식'];
               let optionsValue = ['', 'A05']
               for(let i=0; i<options.length; i++) {
                  let option = document.createElement('option')
                  option.setAttribute('value', optionsValue[i]);
                  option.innerText = options[i];
                  cat1.append(option);
               }
            }
         })
      }
      const f2 = () => {
         cat1.addEventListener('change', () => {
            if(cat1.value == 'A05') {
               let options = ['선택', '음식점'];
               let optionsValue = ['', 'A0502'];
               for(let i=0; i<options.length; i++){
                  let option = document.createElement('option');
                  option.setAttribute('value', optionsValue[i]);
                  option.innerText = options[i];
                  cat2.append(option);
               }
            }
         })
      }
      const f3 = () => {
         cat2.addEventListener('change', () => {
            if(cat2.value == 'A0502') {
               let options = ['선택', '한식', '서양식', '일식', '중식', '아시아식', '바/카페'];
               let optionsValue = ['', 'A05020100', 'A05020200', 'A05020300', 'A05020400', 'A05020500', 'A05020900'];
               for(let i=0; i<options.length; i++){
                  let option = document.createElement('option');
                  option.setAttribute('value', optionsValue[i]);
                  option.innerText = options[i];
                  cat3.append(option);
               }
            }
         })
      }
      // 실행
      f1();
      f2();
      f3();
   })

   // 확인하기 버튼 -> AJAX로 api호출
   function submitFrm(){
	   let contentTypeSel = document.querySelector('#contentTypeSel').value;
	   let cat1 = document.querySelector('#cat1').value;
	   let cat2 = document.querySelector('#cat2').value;
	   let cat3 = document.querySelector('#cat3').value;
	   let DeliUrl = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?'
 		  +'ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
		  +'&contentTypeId='+ contentTypeSel +'&areaCode=&sigunguCode='
		  +'&cat1=' + cat1 +'&cat2=' + cat2 + '&cat3=' + cat3 + '&listYN=Y&MobileOS=ETC'
		  +'&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1';
	  
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
   
      // yoon
     	output.addEventListener('click', () => {
     		let contentTypeIdVal = contentTypeSel.value;
     		let contentIdVal = event.target.childNodes[2].getAttribute('value');
     		
     		console.log(event.target);
     		
     		console.log(contentTypeIdVal + ' ' + contentIdVal);
     		
     		contentTypeId.value = contentTypeIdVal;
     		contentId.value = contentIdVal;
     		
     		DeliFrm.submit();
     	})
 
</script>