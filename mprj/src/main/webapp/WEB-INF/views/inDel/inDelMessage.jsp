<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<input type="hidden" value="${indelSuccess}" id="iVal">
<input type="hidden" value="${indelFail}" id="xVal">

<script>
	//삭제 후 insert 성공 메시지
	let i = iVal.value;
	if (i != '') {
		let indelSuccess = confirm("${indelSuccess}"); //"VISIT 목록을 확인하시겠습니까?"
		if (indelSuccess) {
			location.href = "visitList.do";
		} else {
			location.href = "wishList.do"
		}
	}

	// 삭제 후 insert 실패
	let x = xVal.value;
	if (x != '') {
		let indelFail = confirm("${indelFail}"); //"잠시 후 다시 시도해 주세요."
		if (indelFail) {
			location.href = "wishList.do";
		}
	}
</script>