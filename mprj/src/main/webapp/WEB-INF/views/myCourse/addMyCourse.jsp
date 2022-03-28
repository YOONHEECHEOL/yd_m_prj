<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<h1>addMyCourse</h1>
	<div class="row text-center justify-content-center">
		<div class="col-7">
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-auto">
							<select name="contentType" id="contentTypeSel" class="form-select">
								<option value="">contentType 선택</option>
								<option value="12">관광지</option>
								<!-- 
									<option value="32">숙박</option>
									<option value="39">음식점</option>
								-->
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
							<button type="button" class="btn btn-primary btn-block" onclick="submitFrm()">확인하기</button>
						</div>
					</div>
				</div>
				<div class="col-12">				
					<div class="row">
						
					</div>
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
		<div class="col-5">
			<div class="card">
				<div class="card-body">
					<form action="insertCourse.do" id="courseFrm" method="post">
						<!-- 유저 id 값 -->
						<input type="hidden" value="${id}" name="uId">
						<input type="hidden" value="" name="contentIdList" id="contentIdList">
						<input type="hidden" value="" name="sumImg" id="sumImg">
						<h2>관광코스 리스트</h2>
						<!-- 관광코스 정보 입력 -->
						<div class="row">
							<div class="col-12">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">관광코스 이름</span>
									</div>
									<!-- 관광코스 명 : mcTitle -->
									<input type="text" class="form-control" placeholder="관광코스의 이름을 적어주세요" aria-describedby="basic-addon1" name="mcTitle" id="mcTitle" required>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon1">관광코스 요약</span>
									</div>
									<!-- 관광코스 요약 : mcDescription -->
									<input type="text" class="form-control" placeholder="관광코스의 내용을 한줄로 적어주세요" aria-describedby="basic-addon1" name="mcDescription" id="mcDescription" required>
								</div>
							</div>
						</div>
						<table class="reqTab table table-hover">
							<thead>
								<tr>
									<th scope="col" colspan="2">관광지</th>
									<th scope="col">주소</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody id="inputCourse">
								<!-- 이곳에 추가한 관광지 입력됨 -->
							</tbody>
						</table>
						<!-- 버튼 -->
						<div class="row">
							<div class="col-12">
								<button onclick="submitCourseFrm()" type="button" class="btn btn-primary">관광코스 만들기</button>
							</div>
						</div>
					</form>
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
						if(item.firstimage != undefined) {
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
						let inputBtn = document.createElement('input');
						inputBtn.value = '추가';
						inputBtn.setAttribute('class', 'btn btn-primary');
						inputBtn.setAttribute('onclick', 'moveToCourse()');
						
						// contentIdVal
						let input = document.createElement('input');
						input.setAttribute('type', 'hidden');
						input.setAttribute('name', 'contentid'+item.contentid);
						input.value = item.contentid;

						td4.append(inputBtn, input);

						tr.append(td2, td1, td3, td4);

						output.append(tr);
					}
				})
		}
		function moveToCourse() {
			// tr 선택
			let target = event.target;
			
			contentIdListObj.value += 'cId' + target.parentNode.parentNode.childNodes[3].childNodes[1].value + ' ';
			
			inputCourse.append(target.parentNode.parentNode);

			// sumImg 값 저장
			let sV = target.parentNode.parentNode.querySelector('img').getAttribute('src');
			sumImg.value = sV;

			target.value = '삭제';
			target.setAttribute('class', 'btn btn-danger');
			target.setAttribute('onclick', 'moveToList()');
						
		}
		function moveToList() {
			let target = event.target;
			let tVal = 'cId' + target.parentNode.parentNode.childNodes[3].childNodes[1].value + ' ';
			console.log(tVal);

			let ctVal = contentIdListObj.value;
			let ctAfterVal = ctVal.replace(tVal, '');
			contentIdListObj.value = ctAfterVal;

			output.prepend(target.parentNode.parentNode);

			// sumImg 값 빼기
			let sImgVal = sumImg.value;
			let tsV = target.parentNode.parentNode.querySelector('img').getAttribute('src');
			let sV = sImgVal.replace(tsV, '');
			sImgVal.replace(sV, '');
			sumImg.value = sV;

			target.value = '추가';
			target.setAttribute('class', 'btn btn-primary');
			target.setAttribute('onclick', 'moveToCourse()');
		}
		function submitCourseFrm() {
			if(mcTitle.value != '') {
				if(mcDescription.value != '') {
					courseFrm.submit();
				}
			} else {
				event.preventDefault();
				alert('값을 입력하세요!');
			}
		}
	</script>