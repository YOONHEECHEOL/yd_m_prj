<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<h2 class="myH text-center">Keyword Search</h2>
<h5 class="text-center">검색결과</h5>

<hr class="border-bottom border-primary">

<div class="row text-center justify-content-center mt36">
  <div class="col-7">
    <table class="table table-hover">
      <thead>
      <tr>
        <th scope="col" colspan="2">관광지</th>
        <th scope="col">주소</th>
        <th scope="col">&nbsp;</th>
      </tr>
      </thead>
      <tbody id="output">
      <!-- 이곳에 출력 -->
      </tbody>
    </table>
  </div>
</div>

  <script>
    function addEmptyOption(key) {
      let option = document.createElement('option');
      option.innerText = '선택';
      key.append(option);
    }

    // childNode 전부 삭제
    function childRm(input) {
      while (input.firstChild) {
        input.removeChild(input.firstChild)
      }
    }

    // xmlToJson Function | xml 파일을 json 파일로 변환
    function xmlToJson(res) {
      const parser = new DOMParser();
      const xml = parser.parseFromString(res, "application/xml");

      let x2js = new X2JS();
      // 파싱된 json 데이터
      let jsonObj = x2js.xml_str2json(res);

      return jsonObj;
    }

    document.addEventListener('DOMContentLoaded', () => {
      let $cat1 = '${cat1}';
      let $cat2 = '${cat2}';
      let $cat3 = '${cat3}';
      let kvv = '${keyword}';
      let $keywordVal = encodeURI(kvv);
      let $contentTypeId = '${contentTypeId}';

      let ku = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?'
				+'serviceKey=6VD6FZMkQZA%2FMpsor0GA4p5HGALEVJf9ztzYbdHlBbm13%2BTeIVqjuD4ybrO2mOcFixFwaPZB8Eb%2FZZ6Qw8knIw%3D%3D'
				+'&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=10&listYN=Y&arrange=A'
				+'&contentTypeId=' + $contentTypeId + '&cat1=' + $cat1 + '&cat2=' + $cat2 + '&cat3=' + $cat3 + '&keyword=' + $keywordVal;

      console.log(ku)

      fetch(ku, {
        method: 'get'
      })
        .then(res => res.text())
        .then(res => {
          console.log(res)
          let jsonObj = xmlToJson(res);
          console.log(jsonObj)

          let output = document.querySelector('#output');

          for (let item of jsonObj.response.body.items.item) {
            let tr = document.createElement('tr');
            tr.setAttribute('class', 'sm-img');

            let td1 = document.createElement('td');
            td1.innerText = item.title;

            let td2 = document.createElement('td');
            if (item.firstimage != undefined) {
              let img = document.createElement('img');
              img.setAttribute('src', item.firstimage);
              td2.append(img);
            } else {
              let img = document.createElement('img');
              img.setAttribute('src', 'images/noImage.jpg');
              td2.append(img);
            }

            let td3 = document.createElement('td');
            td3.innerText = item.addr1;

            let td4 = document.createElement('td');

            // contentIdVal
            let input = document.createElement('input');
            input.setAttribute('type', 'hidden');
            input.setAttribute('name', 'contentid' + item.contentid);
            input.value = item.contentid;

            td4.append(input);

            tr.append(td2, td1, td3, td4);

            output.append(tr);
          }
        })

      // 이동 이벤트
      const f4 = () => {
        output.addEventListener('click', () => {
          console.log(event.target.parentNode.childNodes[3].childNodes[0]);
          location.href = 'viewSpot.do?contentId=' + event.target.parentNode.childNodes[3].childNodes[0].value;
        })
      }

      f4()
    })
  </script>