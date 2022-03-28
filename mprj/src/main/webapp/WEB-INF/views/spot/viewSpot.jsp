<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<h1>viewSpot</h1>
	<div class="row justify-content-center">
		<div id="view" class="col-8">
			<!-- view -->
		</div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b83f8deda041161d89092eddc90e91aa"></script>
	<script>
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
			let url = 'http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?serviceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=' + ut + '&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';

			fetch(url, {
				method: 'get',
				headers: { 'Content-type': 'application/x-www-form-urlencoded' }
			})
				.then(res => res.text())
				.then(res => {
					let item = xmlToJson(res).response.body.items.item;

					let img = document.createElement('img');
					img.setAttribute('src', item.firstimage);
					img.setAttribute('style', 'width:100%;');

					let h4 = document.createElement('h4');
					h4.innerText = item.title;

					let span = document.createElement('span');
					span.innerText = '주소 : ' + item.addr1;

					let p = document.createElement('p');
					p.setAttribute('class', 'mt20')
					p.innerText = item.overview;

					if (item.homepage != '') {
						let div = document.createElement('div');
						div.innerHTML = item.homepage;
						view.prepend(div);
					}

					let mx = item.mapx.replace(item.mapx.slice(-4), '');
					let my = item.mapy.replace(item.mapy.slice(-4), '');
					let mlevel = item.mlevel;

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
					view.prepend(img, h4, p, span);

				})
		})
	</script>