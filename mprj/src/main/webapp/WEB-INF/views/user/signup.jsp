<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="row text-center justify-content-center align-items-center hDisplay">
	<div class="col-6">
		<div class="card">
			<div class="card-body">
				<h3>회원가입</h3>
				<hr>
				<form action="signUpCheck.do" id="frm" method="get">
					<!-- id -->
					<div class="form-group">
						<div class="row align-items-center">
							<div class="col-7">
								<div class="input-group">
									<input type="text" placeholder="id ..." name="uId" id="uId" class="form-control" required>
									<span class="input-group-text">@</span>
									<input type="text" value=""	name="mailVal" class="form-control" id="mailVal">
								</div>
							</div>							
							<div class="col-3 px-0">
								<select	name="mail" id="mail" class="form-select">
									<option value="" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.com">daum.com</option>
									<option value="google.com">google.com</option>
								</select>
							</div>
							<div class="col-2 px-0">
								<input type="button" class="btn btn-dark btn-sm" onclick="idCheck()" value="중복체크" id="checkBtn">
							</div>
						</div>				 
					</div>
					<div class="form-group mt8">
						<input type="password" name="uPwd" id="uPwd" placeholder="password ..." class="form-control" required>
					</div>
					<div class="form-group mt8">
						<input type="text" name="uName" id="uName" placeholder="your name ..." class="form-control">
					</div>
					
					<input type="hidden" value="0" id="validateVal">
					
					<!-- <button class="btn btn-secondary mt20">취소</button> -->
				</form>
					<button class="btn btn-primary mt20" onclick="submitFrm()">회원가입</button>
			</div>
		</div>
	</div>	
</div>

<script>
	// 아이디 주소값 입력
	// 주소 선택시 mailVal 값 수정 불가하게 attribute 속성 추가 or class 추가
	frm.mail.addEventListener('click', function() {
		if (frm.mail.value != '') {
			frm.mailVal.value = event.target.value;
		} else {
			frm.mailVal.value = '';
		}
	})
	
	// id 중복 체크
	function idCheck() {
		let id = document.querySelector('#uId').value;
		let mailVal = document.querySelector('#mailVal').value;
		let submitVal = id + '@' + mailVal;
		console.log(submitVal)
		
		if(id == '') {
			alert('값을 입력하세요!')
			return;
		} else if(id.toUpperCase() == 'ADMIN') {
			alert('admin은 사용할 수 없는 아이디 입니다.')
			return;
		}
		
		// **todo: ajax -> id check
		fetch('ajaxloginCheck.do?', {
			method: 'post',
			headers: {'Content-type': 'application/x-www-form-urlencoded'},
            body: 'rId=' + submitVal
		})
		.then(res => res.text())
		.then(res => {
			console.log(res)
			if(res == 'false') { // id 사용불가능
				checkBtn.classList.replace('btn-dark', 'btn-danger');
				checkBtn.classList.replace('btn-success', 'btn-danger');
				checkBtn.value = '다시 체크';
				window.alert('사용불가능한 아이디 입니다.');
			}
			if(res == 'true') { // id 사용가능
				checkBtn.classList.replace('btn-dark', 'btn-success')
				checkBtn.classList.replace('btn-danger', 'btn-success')
				checkBtn.value = '사용가능'
				window.alert('사용가능한 아이디 입니다.')
				validateVal.value = '1';
			}
		})
	} 
	// 제출 전 확인 func
	function submitFrm() {
		if (validateVal != '0') {
			frm.submit();
		} else {
			checkBtn.focus();
			alert('id 중복체크를 해주세요');			
		}
	}
</script>