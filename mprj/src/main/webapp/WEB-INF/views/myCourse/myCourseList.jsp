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

<div class="row mt20 gy-3" id="courseList">
	<c:forEach items="${courseList }" var="c">
		<div class="col-3">			
			<div class="card">
				<c:if test="${not empty c.sumImg}">
					<img src="${c.sumImg}" alt="" class="card-img-top np">
				</c:if>
				<c:if test="${empty c.sumImg}">
					<img src="images/noImage.jpg" alt="" class="card-img-top np">
				</c:if>
				<div class="card-body">
					<h5 class="card-title np">${c.mcTitle}</h5>
					<p class="card-text np">
						${c.mcDescription}<br>
						<span class="course__date">${c.mcDate}</span>
					</p>					
				</div>
				<div class="card-body">
					<button class="btn btn-primary" id="toViewBtn">자세히보기</button>
					<button class="btn btn-danger">삭제</button>
				</div>
				<form action="viewCourse.do" id="toView" method="get" class="np">
					<input type="hidden" value="${c.tsId}" name="tsId" id="tsId">
				</form>
			</div>			
		</div>
	</c:forEach>
	
</div>

<div id="input"></div>
<!-- push test -->

<script>
	document.addEventListener('DOMContentLoaded', () => {
		courseList.addEventListener('click', () => {
			let nT = event.target.parentNode.nextElementSibling;
			console.log(nT);
			nT.submit();
		})
	})
</script>
