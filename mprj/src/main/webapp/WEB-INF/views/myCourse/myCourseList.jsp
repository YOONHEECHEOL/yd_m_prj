<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1>myCourse</h1>

<div class="row text-center justify-content-center align-items-center">
	<div class="col-4">
		<a href="myCourseList.do" class="btn btn-primary">나의 관광코스 리스트</a>
		<a href="addMyCourse.do" class="btn btn-primary">관광코스 추가하기</a>
	</div>
</div>

<div>
	<c:forEach items="${courseList }" var="c">
		${c.mcId}<br>
		${c.uId}<br>
		${c.tsId}<br>
		${c.mcDate}<br>
		${c.mcTitle}<br>
		${c.mcDescription}<br>
	</c:forEach>
	
</div>

<div id="input"></div>
<!-- push test -->
