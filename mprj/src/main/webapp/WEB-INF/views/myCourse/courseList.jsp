<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2 class="myH text-center">Course List</h2>
<h5 class="text-center">관광코스 리스트</h5>
<p class="text-center mt20">관광지를 모아 코스를 만들어서 공유해보세요!</p>

<hr class="border-bottom border-primary">

<div class="row mt36 gy-3" id="courseList">
  <c:forEach items="${clist }" var="c">
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
            <input type="hidden" value="${c.mcId}" name="mcId">
            <c:if	test="${not empty c.mcDate}">
              <input type="hidden" value="${c.mcDate}" name="mcDate">
            </c:if>
            <input type="hidden" value="${c.uId}" name="uId">
            <input type="hidden" value="${c.tsId}" name="tsId">
            <c:if test="${not empty c.mcTitle}">
              <input type="hidden" value="${c.mcTitle}" name="mcTitle">
            </c:if>
            <c:if test="${not empty c.mcDescription }">
              <input type="hidden" value="${c.mcDescription }" name="mcDescription">
            </c:if>
          </form>
        </div>			
      </div>
    </c:forEach>
</div>

<script>
	document.addEventListener('DOMContentLoaded', () => {
		courseList.addEventListener('click', () => {
			let nT = event.target.parentNode.nextElementSibling;
			console.log(nT);
			nT.submit();
		})
	})
</script>
