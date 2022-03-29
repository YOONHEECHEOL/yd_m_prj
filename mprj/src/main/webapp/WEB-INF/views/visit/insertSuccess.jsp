<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
let result = confirm("${message}");

if(result){
	location.href = "visitList.do";
} else {
	location.href = "deliciousList.do" // 관광지 목록으로 돌아가야함.
}
</script>