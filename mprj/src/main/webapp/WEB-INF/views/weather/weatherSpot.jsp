<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data.html</title>
</head>
<body>

<div id="centerList">
</div>
<script>
var url = 'https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D';
		var xhtp = new XMLHttpRequest(); // url의 처리정보를 읽어오기 위한 object;
		xhtp.open('GET', url);
		xhtp.send();
		xhtp.onload = getCenterList;// 
		
		
		var contents = ['id', 'centerName', 'phoneNumber', 'sido', 'sigungu'];
		
		
		function getCenterList() {
			var result = JSON.parse(xhtp.responseText); // JSON => object.
			console.log(result);
			
			// sidoAry : ['서울특별시','경상남도','대구광역시'.....]
			var sidoAry = ['전체'];
			result.data.forEach(function (center, ind, ary) {
				if(sidoAry.indexOf(center.sido) == -1) {
					sidoAry.push(center.sido);
					}
				}); // sido: -> 새로운배열.
			    console.log(sidoAry);
				sidoAry.forEach(function(sido){
					var button = document.createElement('button');
					button.innerText = sido;
					button.addEventListener('click', function(){
						console.log(this.innerText)
						var searchSido = this.innerText; // '서울특별시'
						var filteredData = result.data.filter(function(center){
							// if(searchSido == '전체' ? true : false){
							//	return true;
							// };
							return searchSido == '전체' ? true : (center.sido == searchSido);
							
						})
						console.log(filteredData);
						document.getElementById('sidoTable').remove(); // 원래 있던 테이블 삭제.
						createTable(filteredData);
						
					});
					document.getElementById('centerList').append(button); // centerList하위 위치.
				});
			
				createTable(result.data);  // (A) -> (B) : 매개값.
			
		} // getCenterList()
		
	        function createTable(data) {	
			// table - thead - tbody
			var table = document.createElement('table');
			table.setAttribute('border', '1');
			table.setAttribute('id', 'sidoTable')
			// thead생성.
			var thead = document.createElement('thead');
			var tr = document.createElement('tr');
			contents.forEach(function(val, ind, ary){
				console.log(val, ind, ary);
				var th = document.createElement('th');
				th.innerText = val.toUpperCase();
				tr.append(th);
			});
			thead.append(tr); // <thead><tr><th>ID..CENTERNAME..PHONENUMBER..</th></tr></thead>
			// tbody생성.
			var tbody = document.createElement('tbody');
			data.forEach(function(center, ind, ary) {
				tr = document.createElement('tr');
				for (let field of contents) {
					var td = document.createElement('td');
					td.innerText = center[field];
					tr.append(td);
				}
				tbody.append(tr);
			}); //반복문..
			
			table.append(thead, tbody);
			
			
		    console.log(table);	
		    document.body.append(table);
		}
</script>

</body>
</html>
