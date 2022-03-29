<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="home.do">HOME</a>
          <!-- active 클래스 부여하면 활성화됨 -->
        </li>   
        <li class="nav-item">
          <a class="nav-link" href="myCourseList.do">나만의 관광코스(yoon)</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="courseList.do">관광코스(yoon)</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="visitedList.do">도장찍기(been)</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="cateSpotList.do">카테고리별 관광지(woong)</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="noticeList.do">공지사항(domin)</a>
        </li>       
        <li class="nav-item">
          <a class="nav-link" href="recSpot.do">오늘의 추천 관광지(woong)</a>
        </li>     
        <li class="nav-item">
          <a href="weatherSpot.do" class="nav-link">관광지 날씨 보기</a>
        </li>
      </ul>
      
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>