<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" value="${loginId}" id="loginId">
<input type="hidden" value="${mcId}" id="mcId">
<input type="hidden" value="${uId}" id="uId">
<h1 class="text-center mt36">${mcTitle}</h1>
<div class="text-center">작성자 : ${uId}</div>
<div class="text-center">작성일 : ${mcDate}</div>
<div class="text-center">${mcDesc}</div>

<div class="row justify-content-center">
	<div id="view" class="col-8">
		<!-- view -->
	</div>
</div>

<div class="row justify-content-center">
	<div class="col-8">
		<table class="table">
			<thead>
				<tr>
					<th>내용</th>
					<th style="text-align: right;">작성일</th>
				</tr>
			</thead>
			<tbody id="mcComments">
				<!-- 댓글 -->
				<c:forEach items="${commList }" var="c">
					<tr>
						<td>
							<input type="hidden" value="${c.mcId }">${c.commComment }<span>${c.uId }</span>
						</td>
						<td style="text-align: right;">${c.comRegDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="row">
			<div class="col-8">
				<input type="text" class="form-control" id="commentVal" placeholder="로그인이 필요합니다...">
			</div>
			<div class="col-4">
				<button class="btn btn-primary" onclick="frmCheck()">입력</button>
			</div>
		</div>
	</div>
</div>

	<script>
		function frmCheck() {		
			let lVal = loginId.value;
			if(lVal != '') {
				let m = mcId.value;
				let u = uId.value;
				let cVal = commentVal.value;
				console.log(m, u)
	
				if(commentVal.value != '') {
					fetch('ajaxAddComment.do?&uId=' + u + '&cVal=' + cVal + '&mcId=' + m, {
						method: 'post',
						headers: {'Content-type': 'application/x-www-form-urlencoded'}
					})
					.then(res => res.text())
					.then(res => {
						console.log(res)
						location.reload();
					})
				} else {
					alert('빈 댓글은 입력할 수 없습니다.');
				}
			} else {
				let c = confirm('로그인이 필요합니다!');
				if(c) {
					location.href = 'login.do';
				}
			}
		}

		let resultJsonVal = ${ contentList };
		console.log(resultJsonVal);

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
			let lVal = loginId;
			if(lVal.value != '') {
				lVal.setAttribute('placeholder', '로그인이 필요합니다...');
			} else {
				lVal.setAttribute('placeholder', '댓글을 입력해주세요...');
			}

			console.log(resultJsonVal.length)
			for (let i = 0; i < resultJsonVal.length; i++) {
				console.log(resultJsonVal[i])
				let div = document.createElement('div');

				let url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?serviceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=' + resultJsonVal[i] + '&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';

				fetch(url, {
					method: 'get',
					headers: { 'Content-type': 'application/x-www-form-urlencoded' }
				})
					.then(res => res.text())
					.then(res => {
						let item = xmlToJson(res).response.body.items.item;
						console.log(item)

						// 출력
						
						let card = document.createElement('div');
						card.setAttribute('class', 'card mt20 mb100');
						
						let out = document.createElement('div');
						out.setAttribute('class', 'row g-0');

						let divL = document.createElement('div');
						divL.setAttribute('class', 'col-md-4');

						let img = document.createElement('img');
						img.setAttribute('class', 'img-fluid rounded-start');
						if (item.firstimage != undefined) {
							img.setAttribute('src', item.firstimage);
							img.setAttribute('style', 'width:100%;');
						} else {
							img.setAttribute('src', 'images/noImage.jpg');
							img.setAttribute('style', 'width:100%;');
						}
						divL.append(img);

						let divR = document.createElement('div');
						divR.setAttribute('class', 'col-md-8 course__row');

						let cardBody = document.createElement('div');
						cardBody.setAttribute('class', 'card-body');

						let h4 = document.createElement('h4');
						h4.setAttribute('class', 'card-title');
						h4.innerText = item.title;

						let span = document.createElement('span');
						span.setAttribute('class', 'card-title');
						span.innerText = '주소 : ' + item.addr1;

						let p = document.createElement('p');
						p.setAttribute('class', 'card-title');
						p.innerHTML = item.overview;
						if(p.innerHTML.length >= 200) {
							p.innerHTML = p.innerHTML.substring(0, 200) + '...';
						}

						if (item.homepage != '') {
							let div = document.createElement('p');
							p.setAttribute('class', 'card-title');
							div.innerHTML = item.homepage;
						}

						let form = document.createElement('form');
						form.setAttribute('id', 'frm');
						form.setAttribute('action', 'viewSpot.do');

						let contentIdInput = document.createElement('input');
						contentIdInput.setAttribute('type', 'hidden');
						contentIdInput.setAttribute('name', 'contentId');
						contentIdInput.value = item.contentid;

						let btn = document.createElement('button');
						btn.setAttribute('class', 'btn btn-primary');
						btn.innerText = '자세히보기';

						form.append(contentIdInput, btn);

						let icon = document.createElement('i');
						icon.innerText = 'expand_more';
						icon.setAttribute('class', 'material-icons course__arrow md-48');


						cardBody.append(h4, span, p, div, form, icon);

						divR.append(cardBody);

						out.append(divL, divR);

						card.append(out);

						view.append(card);

						// title: "경복궁"
						// addr1: "서울특별시 종로구 사직로 161"
						// firstimage: "http://tong.visitkorea.or.kr/cms/resource/23/2678623_image2_1.jpg"
						// homepage: "경복궁 <a href=\"http://www.royalpalace.go.kr/\" target=\"_blank\" title=\"새창 : 경복궁 홈페이지로 이동\">http://www.royalpalace.go.kr</a><br />궁궐길라잡이 <a href=\"http://www.palaceguide.or.kr/\" target=\"_blank\" title=\"새창 : 궁궐길라잡이 홈페이지로 이동\">http://www.palaceguide.or.kr</a><br />한국의재발견 <a href=\"http://www.rekor.or.kr/\" target=\"_blank\" title=\"새창 : 한국의재발견 홈페이지로 이동\">http://www.rekor.or.kr</a><br />야간관람 예매<a href=\"https://ticket.11st.co.kr/Product/Detail?id=266194&prdNo=4239172482\"title=\"새창: 경복궁 야간관람 예매\"target=\"_blank\">https://ticket.11st.co.kr/</a>"

						// mapx: "126.9769930325"
						// mapy: "37.5788222356"						
						// mlevel: "6"


						// overview: "경복궁은 1395년 태조 이성계에 의해서 새로운 조선왕조의 법궁으로 지어졌다. 경복궁은 동궐(창덕궁)이나 서궐(경희궁)에 비해 위치가 북쪽에 있어 '북궐'이라 불리기도 했다. 경복궁은 5대 궁궐 가운데 으뜸의 규모와 건축미를 자랑한다. 경복궁 근정전에서 즉위식을 가진 왕들을 보면 제2대 정종, 제4대 세종, 제6대 단종, 제7대 세조, 제9대 성종, 제11대 중종, 제13대 명종 등이다. 경복궁은 임진왜란 때 상당수의 건물이 불타 없어진 아픔을 갖고 있으며, 고종 때에 흥선대원군의 주도 아래 7,700여칸에 이르는 건물들을 다시 세웠다. 그러나 또 다시 명성황후 시해사건이 일어나면서 왕조의 몰락과 함께 경복궁도 왕궁으로서의 기능을 상실하고 말았다. 경복궁에는 조선시대의 대표적인 건축물인 경회루와 향원정의 연못이 원형대로 남아 있으며, 근정전의 월대와 조각상들은 당시의 조각미술을 대표한다. 현재 흥례문 밖 서편에는 국립고궁 박물관이 위치하고 있고, 경복궁 내 향원정의 동편에는 국립민속 박물관이 위치하고 있다.<br /><br />* 주요문화재 <br />1) 사적 경복궁<br>2) 국보 경복궁 근정전<br>3) 국보 경복궁 경회루<br>4) 보물 경복궁 자경전<br>5) 보물 경복궁 자경전 십장생 굴뚝<br>6) 보물 경복궁 아미산굴뚝<br>7) 보물 경복궁 근정문 및 행각<br>8) 보물 경복궁 풍기대<br>"

						selLastArrow();
					})
			}
		})

		function selLastArrow() {
			let aList = document.querySelectorAll('.course__arrow');			
			for(let i=0; i<aList.length; i++) {
				aList[i].setAttribute('class', 'material-icons course__arrow md-48');
				if(i == (aList.length - 1)){
					aList[i].setAttribute('class', 'material-icons course__arrow md-48 dp_none');
				}
			}		
		}

	</script>