<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<input type="hidden" value="${inSuccess}" id="iVal">
<input type="hidden" value="${inFail }" id="xVal">

<script>
	// 관광지목록에서 insert 성공 메시지
	let i = iVal.value;
	if (i != '') {
		let inSuccess = confirm("${inSuccess}"); //"이미 WISH 목록에 있습니다." + "WISH 목록을 확인하시겠습니까?"
		if (inSuccess) {
			location.href = "wishList.do";
		} else {
			location.href = "deliciousList.do" // 관광지 목록으로 돌아가야함.
		}
	}

	// 관광지목록에서 insert 실패 메시지
	let x = xVal.value;
	if (x != '') {
		let inFail = confirm("${inFail}"); //"잠시 후 다시 시도해 주세요."
		if (inFail) {
			location.href = "deliciousList.do"; // 관광지 목록으로 돌아가야함.
		}
	}
</script>