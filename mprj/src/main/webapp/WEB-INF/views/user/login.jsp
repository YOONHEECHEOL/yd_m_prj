<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row text-center justify-content-center align-items-center hDisplay">
	<div class="col-6">
    <div class="card">
      <div class="row g-0">
        <div class="col-5">
          <img class="img-fluid round-start" src="images/login_img.jpg" alt="">
        </div>
        <div class="col-7">
          <div class="card-body">
            <c:if test="${not empty message }"><span>${message}</span></c:if>
            <h3>로그인</h3>
            <form action="loginCheck.do" id="frm" method="post">
              <div class="form-group">
                <input placeholder="id ..." class="form-control" type="email" name="uId" id="uId"
                       required><br>
              </div>
              <div class="form-group">
                <input placeholder="password ..." class="form-control" type="password" name="uPwd" id="uPwd"
                       required>
              </div>
              <!-- dfdsaf -->
              <!-- <button class="btn btn-secondary mt20">취소</button> -->
              <button class="btn btn-primary mt20">로그인</button>
            </form>
          </div>
        </div>
      </div>
    </div>
	</div>	
</div>

