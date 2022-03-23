<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>addMyCourse</h1>

<div class="row text-center justify-content-center align-items-center">
	<div class="col-8">
		<div class="row">
			<div class="col-12">
				<div class="row">
					<div class="col-auto">
						<select name="contentType" id="contentTypeSel" class="form-select">
							<option value="">contentType 선택</option>
							<option value="12">관광지</option>
							<option value="32">숙박</option>
							<option value="39">음식점</option>
						</select>
					</div>
					<div class="col-auto">
						<select name="cat1" id="cat1" class="form-select"></select>
					</div>
					<div class="col-auto">
						<select name="cat2" id="cat2" class="form-select"></select>
					</div>
					<div class="col-auto">
						<select name="cat3" id="cat3" class="form-select"></select>
					</div>
					<div class="col-auto">
						<button type="button" class="btn btn-primary btn-block" onclick="submitFrm()" >확인하기</button>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div id="output" class="row">
					<!-- 이곳에 출력 -->
				</div>
			</div>
		</div>		
	</div>
	<div class="col-4">
		<div id="inputCourse">
			<!-- 이곳에 입력됨 -->
		</div>
	</div>
</div>

<script>
	// xmlToJson Function | xml 파일을 json 파일로 변환
	function xmlToJson(res) {
		const parser = new DOMParser();
		const xml = parser.parseFromString(res, "application/xml");
		console.log(xml);
		console.log(xml.body);

		let x2js = new X2JS();
		// 파싱된 json 데이터
		let jsonObj = x2js.xml_str2json(res);
		console.log(jsonObj)

		return jsonObj;
	}

	document.addEventListener('DOMContentLoaded', () => {
		// cat1 값 불러오기
		const f1 = () => {
			contentTypeSel.addEventListener('change', () => {
				// if (event.target.value == '12') {
				// 	// contentType 값 불러오는 ajax 필요
				// 	let options = ['선택', '자연', '인문(문화,예술,역사)'];
				// 	let optionsValue = ['', 'A01', 'A02']
				// 	for (let i = 0; i < options.length; i++) {
				// 		let option = document.createElement('option')
				// 		option.setAttribute('value', optionsValue[i]);
				// 		option.innerText = options[i];
				// 		cat1.append(option);
				// 	}
				// }
				fetch('http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?serviceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentTypeId=' + event.target.value, {
					method: 'get'
				})
				.then(res => res.text())
				.then(res => {
					let jsonObj = xmlToJson(res);

					for(let i of jsonObj.response.body.items.item) {
						let option = document.createElement('option');
						option.setAttribute('value', i.code);
						option.innerText = i.name;
						cat1.append(option);
					}
				})
			})
		}
		const f2 = () => {
			cat1.addEventListener('change', () => {
				if (cat1.value == 'A01') {
					let options = ['선택', '자연관광지', '관광자원'];
					let optionsValue = ['', 'A0101', 'A0102'];
					for (let i = 0; i < options.length; i++) {
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
				if (cat2.value == 'A0101') {
					let options = ['선택', '산', '해수욕장'];
					let optionsValue = ['', 'A01010400', 'A01011200'];
					for (let i = 0; i < options.length; i++) {
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
				console.log(jsonObj.response.body.items.item[0].title)

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
					let div = document.createElement('div');
					div.setAttribute('class', 'col-3 colImg');

					let h6 = document.createElement('h6');
					h6.innerText = item.title;
					let img = document.createElement('img');
					img.setAttribute('src', item.firstimage);

					div.append(img, h6);

					output.append(div);
				}
			})
	}
</script>