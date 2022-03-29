<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="header container-fluid">
	<div class="row header__cont">
		<div class="col text-start align-self-center">			
			<h1><a href="home.do" class="logo"><img src="images/logo.svg" alt=""></a></h1>
		</div>
		<div class="col text-end align-self-center">
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
