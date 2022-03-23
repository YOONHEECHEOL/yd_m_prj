<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha512-HX+/SvM7094YZEKOCtG9EyjRYvK8dKlFhdYAnVCGNxMkA59BZNSZTZrqdDlLXp0O6/NjDb1uKnmutUeuzHb3iQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<div align="center">
	<h1>Delicious List</h1>
	<div id="input"></div>
	<!-- push test -->

	<div>
		<span>ContentTypeId (관광지 | 숙박 | 음식점)</span> <select name="contentType"
			id="contentTypeSel">
			<option value="">선택</option>
			<option value="12">관광지</option>
			<option value="32">숙박</option>
			<option value="39">음식점</option>
		</select><br> <span></span>
		<!-- <input type="hidden" id="areaCode" value="areaCode=">
   <input type="hidden" id="sigunguCode" value="sigunguCode="> -->
		<!-- <input type="text" placeholder="cat1=" id="cat1"> -->
		<select name="cat1" id="cat1">
		</select> <select name="cat2" id="cat2">
		</select> <select name="cat3" id="cat3">
		</select>

		<!-- <input type="hidden" value="listYN=Y" id="listYN">
   <input type="hidden" value="MobileOS=ETC&MobileApp=TourAPI3.0_Guide">
   <input type="hidden" value="arrange=A"> -->
		<input type="text" placeholder="numOfRows=12"> <input
			type="text" placeholder="pageNo=1">
		<button onclick="submitFrm()">확인하기</button>
	</div>

	<div id="output" class="row">
		<!-- 이곳에 출력 -->
	</div>
</div>


<script>
   document.addEventListener('DOMContentLoaded', () => {
      // cat1 값 불러오기
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
      f1()
      f2()
      f3();
   })

   function submitFrm() {
      let contentTypeSel = document.querySelector('#contentTypeSel').value;
      console.log(contentTypeSel)
      let cat1 = document.querySelector('#cat1').value;
      console.log(cat1)
      let cat2 = document.querySelector('#cat2').value;
      console.log(cat2)
      let cat3 = document.querySelector('#cat3').value;
      console.log(cat3)

      fetch('http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D&contentTypeId='+ contentTypeSel +'&areaCode=&sigunguCode=&cat1=' + cat1 +'&cat2=' + cat2 + '&cat3=' + cat3 + '&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1', {
      method: 'get'
  })
  .then(res => res.text())
  .then(res => {
      const parser = new DOMParser();
      const xml = parser.parseFromString(res, "application/xml");
      console.log(xml);
      console.log(xml.body)

      let x2js = new X2JS();
         // 파싱된 json 데이터
      let jsonObj = x2js.xml_str2json( res );
      console.log(jsonObj)

         // 값 위치
      console.log(jsonObj.response.body.items.item[0])
         
// 			addr1: "경기도 남양주시 강변북로632번길 57-28"
// 			areacode: "31"
// 			cat1: "A05"
// 			cat2: "A0502"
// 			cat3: "A05020200"
// 			contentid: "798518"
// 			contenttypeid: "39"
// 			createdtime: "20090907101546"
// 			firstimage: "http://tong.visitkorea.or.kr/cms/resource/52/1788152_image2_1.jpg"
// 			firstimage2: "http://tong.visitkorea.or.kr/cms/resource/52/1788152_image3_1.jpg"
// 			mapx: "127.1740748223"
// 			mapy: "37.5878830684"
// 			mlevel: "6"
// 			modifiedtime: "20210125134611"
// 			readcount: "19813"
// 			sigungucode: "9"
// 			tel: "031-566-7777"
// 			title: "가든갤러리"
// 			zipcode: "12268"

         let output = document.querySelector('#output');
         for(let item of jsonObj.response.body.items.item){
            let div = document.createElement('div');
            div.setAttribute('class', 'col-3 colImg');
			
            let img = document.createElement('img');
            img.setAttribute('src', item.firstimage);
            
            let h6 = document.createElement('h6');
            h6.innerText = item.title;
			
            div.append(img, h6);

            output.append(div);
         }

         let imgs = document.getElementsByTagName("img");
         for(let i=0; i<imgs.length; i++){
            imgs[i].onclick = function(){
               alert('test');
            }
         }
  })
   }
 
</script>