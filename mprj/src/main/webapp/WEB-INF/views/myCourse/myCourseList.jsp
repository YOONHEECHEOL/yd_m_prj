<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js" integrity="sha512-HX+/SvM7094YZEKOCtG9EyjRYvK8dKlFhdYAnVCGNxMkA59BZNSZTZrqdDlLXp0O6/NjDb1uKnmutUeuzHb3iQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<h1>myCourse</h1>
<div id="input"></div>
<!-- push test -->
<script>
  fetch('http://api.visitkorea.or.kr/openapi/service/rest/KorService/categoryCode?serviceKey=YEoy%2B93A%2Fp1nbyehg%2F0UcWMYX5ZjT73RId2NuFd3L0M6%2FEMlAYbTyjfB7gJzZvC5t2qVeHOrFCaviPGo%2BWx5rA%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentTypeId=12&cat1=A01&cat2=A0101&cat3=A01010100', {
      method: 'get'
  })
  .then(res => res.text())
  .then(res => {
      const parser = new DOMParser();
      const xml = parser.parseFromString(res, "application/xml");
      console.log(xml);
      console.log(xml.body)

      let x2js = new X2JS();
      let jsonObj = x2js.xml_str2json( res );
      console.log(jsonObj)
      console.log(jsonObj.response.body.items.item.name)
  })
</script>