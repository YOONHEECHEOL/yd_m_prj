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
            <h5>관광지 조회</h5>
            <p>봄에 떠날 여행지를 찾아보세요!</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/mv1.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>음식점 조회</h5>
            <p>전국에 유명한 맛집들을 찾아보세요!</p>
          </div>
        </div>
        <div class="carousel-item">
          <img src="images/mv2.png" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h5>숙박 정보 조회</h5>
            <p>숙박 업소들의 정보를 조회할 수 있습니다!</p>
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
      <!--<h5>관광지·숙박·음식점 통합검색</h3> -->
      <div class="row gx-0">
        <div class="col-auto">
          <select name="contentType" id="contentTypeSel" class="form-select wid140 h60">
            <option value="">contentType 선택</option>
            <option value="12">관광지</option>								
            <option value="32">숙박</option>
            <option value="39">음식점</option>
          </select>
        </div>
        <!--
        <div class="col-auto"><select name="cat1" id="cat1" class="form-select wid140 h60"></select></div>
        <div class="col-auto"><select name="cat2" id="cat2" class="form-select wid140 h60"></select></div>
        <div class="col-auto"><select name="cat3" id="cat3" class="form-select wid140 h60"></select></div>
        -->
        <div class="col-auto"><input type="text" placeholder="검색어를 입력하세요..." id="keywordVal" class="form-control h60" size="90"></div>
        <div class="col-auto">
          <button type="button" class="btn-main h60" onclick="searchSpots()">
            <i class="material-icons">
              search
            </i>
          </button>
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
      // let cat1 = document.querySelector('#cat1').value;
      // let cat2 = document.querySelector('#cat2').value;
      // let cat3 = document.querySelector('#cat3').value;
      let keyVal = document.querySelector('#keywordVal').value;

      let kwdUrl = 'keySearch.do?'	+'contentTypeId=' + contentTypeSelVal + '&cat1=' + '&cat2=' + '&cat3=' + '&keyword=' + keyVal;
      
      console.log(kwdUrl)

      location.href = kwdUrl;
    }

    
  </script>