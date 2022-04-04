<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="mv">
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
          aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
          aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
          aria-label="Slide 3"></button>
      </div>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/mv0.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>First slide label</h5>
            <p>Some representative placeholder content for the first slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/mv1.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Second slide label</h5>
            <p>Some representative placeholder content for the second slide.</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/mv2.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>Third slide label</h5>
            <p>Some representative placeholder content for the third slide.</p>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <!-- 오늘의 추천 관광지 -->
    <div class="main__recomm">      
      <h5>관광지·숙박·음식점 통합검색</h3>
      <div class="row gx-1 mt20">
        <div class="col-auto">
          <select name="contentType" id="contentTypeSel" class="form-select wid140">
            <option value="">contentType 선택</option>
            <option value="12">관광지</option>								
            <option value="32">숙박</option>
            <option value="39">음식점</option>
          </select>
        </div>
        <div class="col-auto"><select name="cat1" id="cat1" class="form-select wid140"></select></div>
        <div class="col-auto"><select name="cat2" id="cat2" class="form-select wid140"></select></div>
        <div class="col-auto"><select name="cat3" id="cat3" class="form-select wid140"></select></div>
        <div class="col-auto"><input type="text" placeholder="검색어를 입력하세요..." id="keywordVal" class="form-control"></div>
        <div class="col-auto">
          <button type="button" class="btn btn-primary btn-block" onclick="searchSpots()">확인하기</button>
        </div>
      </div>
    </div>
  </div>    
    
  <script>
    function addEmptyOption(key) {
			let option = document.createElement('option');
			option.innerText = '선택';
      option.value = '';
			key.append(option);
		}

		// childNode 전부 삭제
		function childRm(input) {
			while (input.firstChild) {
				input.removeChild(input.firstChild)
			}
		}
    
    function searchSpots() {

      let contentTypeSelVal = document.querySelector('#contentTypeSel').value;
      let cat1 = document.querySelector('#cat1').value;
      let cat2 = document.querySelector('#cat2').value;
      let cat3 = document.querySelector('#cat3').value;
      let keyVal = document.querySelector('#keywordVal').value;

      let kwdUrl = 'keySearch.do?'	+'contentTypeId=' + contentTypeSelVal + '&cat1=' + cat1 + '&cat2=' + cat2 + '&cat3=' + cat3 + '&keyword=' + keyVal;   
      
      console.log(kwdUrl)

      location.href = kwdUrl;
    }

    document.addEventListener('DOMContentLoaded', () => {
			// cat1 값 불러오기
			const f1 = () => {
				contentTypeSel.addEventListener('change', () => {
						let eventVal = event.target.value;

						fetch('ajaxContentTypeList.do?req=cat1&contentTypeId=' + eventVal, {
							method: 'get',
							headers: {'Content-type': 'application/x-www-form-urlencoded'}
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
							for(let i of resultVal) {
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
							headers: {'Content-type': 'application/x-www-form-urlencoded'}
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
							for(let i of resultVal) {
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
							headers: {'Content-type': 'application/x-www-form-urlencoded'}
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
							for(let i of resultVal) {
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
		})
    
    
  </script>