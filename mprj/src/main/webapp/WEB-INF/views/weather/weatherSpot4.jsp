<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
   <h1 align="center">관광지 날씨 정보</h1>

<div>
   <br />
</div>

<div>
   <br />
</div>

<div align="center">
					<select id="searchKey" name="searchKey">
						<option value="">관광지 명</option>
						<option value="">전체</option>
					</select> 
					<span>
					<input type="text" id="searchVal" name="searchVal">&nbsp; 
					<input type="button" onclick="searchList()" value="검색"> 
					</span>
				</div>

<div>
   <br />
</div>

<form id="frm" method="post">

   <table class="table table-striped">



      <thead>

         <tr>
            <th>관광지 명</th>
            <th>오늘의 날씨</th>
            <th>풍향</th>
            <th>풍속</th>
            <th>강수확률</th>

         </tr>
      </thead>

      <tbody id="output">

         <tr>


         </tr>


      </tbody>

   </table>
</form>
   <script>	
   
   function weather() {
		frm.Spotname.value = w;
		frm.action = "WeatherView.do";
		frm.submit();
	}
   
   var data = [
      <c:forEach items="${weather}" var="w" varStatus="status">
      {
         spotname : '<c:out value="${w.spotname}" />',
         sky : '<c:out value="${w.sky}" />',
         wd : '<c:out value="${w.wd}" />',
         ws : '<c:out value="${w.ws}" />',
         pop : '<c:out value="${w.pop}" />'
      }
      <c:if test="${!status.last}">,</c:if>
      </c:forEach>
   ]
   
   var table = document.createElement('table');
   var tr = document.createElement('tr');
   // tag를 작성하여 상호명과 주소를 출력
   var tag = "";
   
   // print
   for(let i of data) {
      var tr = document.createElement('tr');
      // 상호명
      
      var td1 = document.createElement('td');
      td1.innerText = i.spotname;
      // 주소
      var td2 = document.createElement('td');
      
      var img = document.createElement('img');
      img.src=i.sky;
      
      td2.append(img);
      
      var td3 = document.createElement('td');
      td3.innerText = i.wd;
      
      var td4 = document.createElement('td');
      td4.innerText = i.ws;
      
      var td5 = document.createElement('td');
      td5.innerText = i.pop;
      //console.log('td2:'+i.querySelector('addr1').textContent);
      
       tr.append(td1, td2, td3, td4, td5);
      
      output.append(tr);
   
   
   }
   
</script>

</body>

</html>