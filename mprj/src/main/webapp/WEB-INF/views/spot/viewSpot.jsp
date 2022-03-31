<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="row justify-content-center">
		<div class="col-4">
			<div class="card mt36" id="view">
				<!-- view -->
			</div>
			<form action="wishInsert.do" method="get" id="frm">
				<input type="hidden" value="" name="contentId" id="contentId">
				<input type="hidden" value="12" name="contentTypeId" id="contentTypeId">
				<input type="hidden" value="" name="firstImage" id="firstImage">
				<input type="hidden" value="" name="title" id="title">
				<input type="hidden" value="" name="addr1" id="addr1">
				<input type="hidden" value="" name="mapx" id="mapx">
				<input type="hidden" value="" name="mapy" id="mapy">
			</form>
			<a href="javascript:history.go(-1);" class="btn btn-primary">목록</a>
			<c:if test="${not empty id }">
				<button onclick="wishBtn()" class="btn btn-primary">가보고싶어요!</button>
				<button onclick="" class="btn btn-primary">가봤어요!</button>
			</c:if>
		</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b83f8deda041161d89092eddc90e91aa"></script>
	<script>
		function wishBtn() {
			let conf = confirm('WISH 목록에 추가하시겠습니까?');
			if(conf) {
				// 확인
				frm.action = 'wishInsert.do';
				frm.method = 'post';
				frm.submit();
			}
		}

		function visitBtn() {
			let conf = confirm('VISIT 목록에 추가하시겠습니까?');
			if(conf){
				frm.action = 'visitInsert.do';
				frm.method = 'post';
				frm.submit();
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
			let ut = ${ contentId };
			contentId.value = ut;
			let url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?serviceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=' + ut + '&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';

			fetch(url, {
				method: 'get',
				headers: { 'Content-type': 'application/x-www-form-urlencoded' }
			})
				.then(res => res.text())
				.then(res => {
					let item = xmlToJson(res).response.body.items.item;

					let img = document.createElement('img');
					if(item.firstimage != undefined) {
						img.setAttribute('src', item.firstimage);
						firstImage.value = item.firstimage;
					} else {
						img.setAttribute('src', 'images/noImage.jpg');
						firstImage.value = 'undefined';
					}
					img.setAttribute('class', 'card-img-top');

					let cardBody = document.createElement('div');
					cardBody.setAttribute('class', 'card-body');

					let h4 = document.createElement('h4');
					h4.setAttribute('class', 'mt20');
					title.value = item.title;
					h4.innerText = item.title;

					let span = document.createElement('span');
					addr1.value = item.addr1;
					span.innerText = '주소 : ' + item.addr1;

					let p = document.createElement('p');
					p.setAttribute('class', 'mt20')
					p.innerText = item.overview;

					if (item.homepage != undefined) {
						let div = document.createElement('div');
						div.innerHTML = item.homepage;
						cardBody.prepend(div);
					}

					let mx = item.mapx.replace(item.mapx.slice(-4), '');
					let my = item.mapy.replace(item.mapy.slice(-4), '');
					let mlevel = item.mlevel;

					mapx.value = mx;
					mapy.value = my;
					
					// kakao map
					let mapDiv = document.createElement('div');
					mapDiv.setAttribute('id', 'map');
					mapDiv.setAttribute('style', 'width:100%;height:350px;');

					view.append(mapDiv);

					var mapContainer = document.querySelector('#map'), // 지도를 표시할 div 
						mapOption = {
							center: new kakao.maps.LatLng(my, mx), // 지도의 중심좌표
							level: mlevel // 지도의 확대 레벨
						};

					var map = new kakao.maps.Map(mapDiv, mapOption); // 지도를 생성합니다

					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(my, mx);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);


					// 최종 출력
					cardBody.append(h4, p, span);
					view.prepend(img, cardBody);
				})
		})


	</script>