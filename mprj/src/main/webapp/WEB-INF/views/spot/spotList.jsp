<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <h2 class="myH text-center">Spots List</h2>
  <h5 class="text-center">관광지 리스트</h5>
  <p class="text-center mt20">관광지 리스트 입니다. 아래 선택 옵션을 클릭하셔서 확인해주세요.</p>

  <hr class="border-bottom border-primary">

    <div class="row text-center justify-content-center mt36">
      <div class="col-7">
        <div class="row">
          <div class="col-12">
            <div class="row g-1">
              <div class="col-12">
                <div class="row">
                  <div class="col-4">
                    <select name="areaValObj" id="areaValObj" class="form-select">
                      <option value="">지역선택</option>
                      <option value="1">서울</option>
                      <option value="2">인천</option>
                      <option value="3">대전</option>
                      <option value="4">대구</option>
                      <option value="5">광주</option>
                      <option value="6">부산</option>
                      <option value="7">울산</option>
                      <option value="39">제주</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="row mt20 g-1">
                <div class="col-auto">
                  <select name="contentType" id="contentTypeSel" class="form-select wid140">
                    <option value="">선택</option>
                    <option value="12">관광지</option>
<!--                     <option value="32">숙박</option> -->
<!--                      <option value="39">음식점</option>                             -->
                  </select>
                </div>
                <div class="col-auto">
                  <select name="cat1" id="cat1" class="form-select wid140"></select>
                </div>
                <div class="col-auto">
                  <select name="cat2" id="cat2" class="form-select wid140"></select>
                </div>
                <div class="col-auto">
                  <select name="cat3" id="cat3" class="form-select wid140"></select>
                </div>
                <div class="col-auto">
                  <button type="button" class="btn btn-primary btn-block" onclick="submitFrm()">확인하기</button>
                </div>
              </div>
            </div>
            <div class="col-12">
              <!-- 관광코스에 추가할 관광지 -->
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
        </div>
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
          // cat1 값 불러오기
          const f1 = () => {
            contentTypeSel.addEventListener('change', () => {
              let eventVal = event.target.value;

              fetch('ajaxContentTypeList.do?req=cat1&contentTypeId=' + eventVal, {
                method: 'get',
                headers: { 'Content-type': 'application/x-www-form-urlencoded' }
              })
                .then(res => res.text())
                .then(res => {
                  let resultVal = JSON.parse(res);

                  // 초기화 initialize
                  childRm(cat1);

                  // add empty option 
                  addEmptyOption(cat1);

                  let cat1Loc = document.querySelector('#cat1');
                  // print
                  for (let i of resultVal) {
                    let option = document.createElement('option');
                    option.innerText = i.cat1Name;
                    option.value = i.cat1;
                    cat1Loc.append(option);
                  }
                })
            })
          }

          const f2 = () => {
            cat1.addEventListener('change', (res) => {
              let contentTypeVal = document.querySelector('#contentTypeSel').value;
              let cat1Val = event.target.value;

              fetch('ajaxContentTypeList.do?req=cat2&contentTypeId=' + contentTypeVal + '&cat1=' + cat1Val, {
                method: 'get',
                headers: { 'Content-type': 'application/x-www-form-urlencoded' }
              })
                .then(res => res.text())
                .then(res => {
                  let resultVal = JSON.parse(res);

                  // 초기화 initialize
                  childRm(cat2);

                  // add empty option
                  addEmptyOption(cat2);

                  let cat2Loc = document.querySelector('#cat2');
                  // print
                  for (let i of resultVal) {
                    let option = document.createElement('option');
                    option.innerText = i.cat2Name;
                    option.value = i.cat2;
                    cat2Loc.append(option);
                  }
                })
            })
          }

          const f3 = () => {
            cat2.addEventListener('change', (res) => {
              let contentTypeVal = document.querySelector('#contentTypeSel').value;
              let cat1Val = document.querySelector('#cat1').value;
              let cat2Val = event.target.value;

              fetch('ajaxContentTypeList.do?req=cat3&contentTypeId=' + contentTypeVal + '&cat1=' + cat1Val + '&cat2=' + cat2Val, {
                method: 'get',
                headers: { 'Content-type': 'application/x-www-form-urlencoded' }
              })
                .then(res => res.text())
                .then(res => {
                  let resultVal = JSON.parse(res);

                  // 초기화 initialize
                  childRm(cat3);

                  // add empty option
                  addEmptyOption(cat3);

                  let cat3Loc = document.querySelector('#cat3');
                  // print
                  for (let i of resultVal) {
                    let option = document.createElement('option');
                    option.innerText = i.cat3Name;
                    option.value = i.cat3;
                    cat3Loc.append(option);
                  }
                })
            })
          }
          // 실행
          f1()
          f2()
          f3()

          // 이동 이벤트
          const f4 = () => {
            output.addEventListener('click', () => {
              console.log(event.target.parentNode.childNodes[3].childNodes[0]);
              location.href = 'viewSpot.do?contentId=' + event.target.parentNode.childNodes[3].childNodes[0].value;
            })
          }

          f4()
        })

        let contentIdListObj = document.querySelector('#contentIdList');

        function submitFrm() {
          // output 초기화
          // while(output.firstChild) {
          // 	output.removeChild(output.firstChild);
          // }

          // request값 받아오기
          let contentTypeSel = document.querySelector('#contentTypeSel').value;
          console.log(contentTypeSel)
          let cat1 = document.querySelector('#cat1').value;
          console.log(cat1)
          let cat2 = document.querySelector('#cat2').value;
          console.log(cat2)
          let cat3 = document.querySelector('#cat3').value;
          console.log(cat3)

          fetch(
            'http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&contentTypeId=' +
            contentTypeSel + '&areaCode=&sigunguCode=&cat1=' + cat1 + '&cat2=' + cat2 + '&cat3=' + cat3 +
            '&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1', {
            method: 'get'
          })
            .then(res => res.text())
            .then(res => {
              let jsonObj = xmlToJson(res);

              // 값 위치
              // console.log(jsonObj.response.body.items.item[0].title)

              // addr1: "강원도 고성군 죽왕면 심층수길 124-19"
              // addr2: "(죽왕면)"
              // areacode: "32"
              // cat1: "A02"
              // cat2: "A0204"
              // cat3: "A02040600"
              // contentid: "2360786"
              // contenttypeid: "12"
              // createdtime: "20160111104045"
              // firstimage: "http://tong.visitkorea.or.kr/cms/resource/75/2360775_image2_1.jpg"
              // firstimage2: "http://tong.visitkorea.or.kr/cms/resource/75/2360775_image2_1.jpg"
              // mapx: "128.5216381039"
              // mapy: "38.3343742648"
              // mlevel: "6"
              // modifiedtime: "20210916163917"
              // readcount: "3693"
              // sigungucode: "2"
              // title: "㈜강원심층수"
              // zipcode: "24747"

              let output = document.querySelector('#output');


              for (let item of jsonObj.response.body.items.item) {
                let tr = document.createElement('tr');
                tr.setAttribute('class', 'sm-img');

                let td1 = document.createElement('td');
                td1.innerText = item.title;

                let td2 = document.createElement('td');                
                if (item.firstimage != undefined) {
                  let img = document.createElement('img');
                  img.setAttribute('class', 'np');
                  img.setAttribute('src', item.firstimage);
                  td2.append(img);
                } else {
                  let img = document.createElement('img');
                  img.setAttribute('class', 'np');
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
        }        
      </script>