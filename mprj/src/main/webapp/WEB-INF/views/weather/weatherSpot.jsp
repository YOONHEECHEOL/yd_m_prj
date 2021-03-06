<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <h2 class="myH text-center">Weathers List</h2>
   <h5 class="text-center">날씨 리스트</h5>
   <p class="text-center mt20">날씨 리스트 입니다. 아래 선택 옵션을 클릭하셔서 확인해주세요.</p>

   <hr class="border-bottom border-primary">

   <form id="myForm" class="myForm" action="weatherDetail.do" method="post">
      <input type="hidden" id="spotAreaId" name="spotAreaId" value="">
      <input type="hidden" id="spotName" name="spotName" value="">
      <input type="hidden" id="courseId" name="courseId" value="">
   </form>
   <!-- 테이블에 목록을 클릭시 데이터를 추가적으로 뿌려줄수 있도록 구현(안되면 제외) -->
   <!-- tt -->

   <div class="row text-center justify-content-center mt36">
      <div class="col-7">
         <table id="weather" class="table table-hover">
            <thead>
               <tr>
                  <th>코드번호</th>
                  <th>관광지명</th>
                  <th>코스명</th>
                  <th>테 마</th>
                  <th>날 씨</th>
               </tr>
            </thead>
            <tbody id="output">
               <!-- 이곳 출력 -->
            </tbody>      
         </table>
      </div>
   </div>


   <script>      
      output.addEventListener('click', () => {
         //console.log(event.target.textContent)
         //console.log(event.currentTarget.querySelectorAll('td').outerText);
         console.log(event.currentTarget.querySelectorAll('td'));

         var ect = event.currentTarget.querySelectorAll('td');
         for (let i = 0; i < ect.length; i++) {
            if (ect[i].outerText == event.target.textContent) {
               spotAreaId.value = event.target.textContent; // 클릭한 코스 아이디

               spotName.value = ect[i + 1].outerText.substr(4); // 클릭한 td의 다음 td의 내용을 담아 넣는다

            }
         }
         let cId = str; // 세션 코스 아이디 저장
         courseId.value = cId;

         console.log('spotAId:' + spotAreaId.value);
         console.log('spotName:' + spotName.value);
         console.log('courseId:' + courseId.value);

         //console.log(event.target.next('td'));

         //let sN = i.queruSelector('spotName').textContent;
         //console.log('sN:'+sN);

         myForm.submit();

      });

      var ran = 1 + (Math.floor(Math.random() * 10));
      var str = ran
      var url = 'https://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst?serviceKey=4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D&pageNo=1&numOfRows=20&dataType=XML&CURRENT_DATE=2019122010&HOUR=24&COURSE_ID=';
      var xhtp = new XMLHttpRequest();
      xhtp.open('GET', url + str);
      xhtp.send();
      xhtp.onload = function () {
         var xml = xhtp.responseXML;
         var data = xml.getElementsByTagName('item');
         console.log(data);

         for (let i = 0; i < data.length; i++) {

            if (data[i].querySelector('sky').textContent) {
               switch (data[i].querySelector('sky').textContent) {
                  case '1':
                     var sky = "맑음";
                     break;
                  case '2':
                     var sky = "구름";
                     break;
                  case '3':
                     var sky = "흐림";
                     break;
                  case '4':
                     var sky = "비";
                     break;
                  case '5':
                     var sky = "소나기";
                     break;
                  case '6':
                     var sky = "비눈";
                     break;
                  case '7':
                     var sky = "눈비";
                     break;
                  case '8':
                     var sky = "눈";
                     break;
               }

            }
            var tr = document.createElement('tr');
            var td1 = document.createElement('td');
            var td2 = document.createElement('td');
            var td3 = document.createElement('td');
            var td4 = document.createElement('td');
            var td5 = document.createElement('td');
            td2.setAttribute("id", i);


            td1.innerText = data[i].querySelector('spotAreaId').textContent;
            td2.innerText = data[i].querySelector('spotName').textContent;
            td3.innerText = data[i].querySelector('courseName').textContent;
            td4.innerText = data[i].querySelector('thema').textContent;
            td5.innerText = sky;

            tr.append(td1, td2, td3, td4, td5);
            output.append(tr);


         }


         /* for(let i of data){
            // 하늘 상태 switch
            
            if(i.querySelector('sky').textContent){
            switch(i.querySelector('sky').textContent){
            case '1':
               var sky = "맑음";
               break;
            case '2':
               var sky = "구름";
               break;
            case '3':
               var sky = "흐림";
               break;
            case '4':
               var sky = "비";
               break;
            case '5':
               var sky = "소나기";
               break;
            case '6':
               var sky = "비눈";
               break;
            case '7':
               var sky = "눈비";
               break;
            case '8':
               var sky = "눈";
               break;
            }
            
            }
            var tr = document.createElement('tr');
            var td = document.createElement('td');
            var td2 = document.createElement('td');
            var td3 = document.createElement('td');
            var td4 = document.createElement('td');
            
            td.innerText = i.querySelector('spotName').textContent;
            td2.innerText = i.querySelector('courseName').textContent;
            td3.innerText = i.querySelector('courseName').textContent;
            td4.innerText = sky;
            
            tr.append(td, td2, td3, td4);
            output.append(tr);
            
            
         } */

      }




   </script>