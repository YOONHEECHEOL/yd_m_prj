<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header container-fluid">
	<div class="row header__cont">
		<div class="col-2 text-start align-self-center">			
			<h1><a href="home.do" class="logo"><img src="images/logo.svg" alt=""></a></h1>
		</div>

		<div class="col-8 align-self-center">
			<ul class="nav__ul">
				<li>
					<a  aria-current="page" href="home.do">HOME</a>
					<!-- active 클래스 부여하면 활성화됨 -->
				</li>   
				<!-- <li>
					<a  href="myCourseList.do">나만의 관광코스</a>
				</li>        -->
				<li>
					<a  href="courseList.do">관광코스</a>
				</li>       
				<!-- <li>
					<a  href="visitedList.do">도장찍기</a>
				</li>        -->
				<!-- 미구현 -->
				<!-- <li>
					<a  href="cateSpotList.do">카테고리별 관광지</a>
				</li>        -->
				<li>
					<a  href="noticeList.do">공지사항</a>
				</li>       
				<li>
					<a  href="recSpot.do">오늘의 추천 숙박</a>
				</li>     
				<li>
					<a href="weatherSpot.do" >관광지 날씨 보기</a>
				</li>
			</ul>
		</div>

		<div class="col-2 text-end align-self-center">
			<c:if test="${empty id}">
				<a class="mr20" href="login.do"><i class="material-icons md-36">login</i></a>
				<a class="mr20" href="signUp.do"><i class="material-icons md-36">assignment_ind</i></a>
			</c:if>
			<c:if test="${not empty id}">
				<a class="mr20" href="logout.do"><i class="material-icons md-36">logout</i></a>
				<a class="mr20" href="mypage.do"><i class="material-icons md-36">assignment_ind</i></a>
			</c:if>			
		</div>
	</div>
</header>
<script>
	let logoT = document.querySelector('.logo > img');

	logoT.addEventListener('mouseover', () => {
		event.target.setAttribute('src', 'images/logo_hover.svg');
	})
	logoT.addEventListener('mouseout', () => {
		event.target.setAttribute('src', 'images/logo.svg');
	})

</script>