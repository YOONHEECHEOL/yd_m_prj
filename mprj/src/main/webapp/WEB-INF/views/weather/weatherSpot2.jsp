<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">관광지 날씨정보 알아보기</h1>
${weather }
<div>
					<select id="searchKey" name="searchKey" >
						<option value="">관광지</option>
						<option value="">전체</option>
					</select> 
					<span>
					<input type="text" id="searchVal" name="searchVal">&nbsp; 
					<input type="button" onclick="searchList()" value="검색"> 
					</span>
				</div>
</body>
</html>