<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
let result = confirm("${message}");

if(result){
	location.href = "wishList.do";
} else {
	location.href = "cateSpotList.do" // 관광지 목록으로 돌아가야함.
}

</script>