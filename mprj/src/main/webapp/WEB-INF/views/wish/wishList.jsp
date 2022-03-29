<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form id="wishFrm" name="wishFrm">
		
			<input type="hidden" name="contentId" value=${w.contentTypeId }>
			<input type="hidden" name="contentId" value=${w.contentId }>
		

		<div>
			<table border="1">
				<tr>
					<th>이미지</th>
					<th>제 목</th>
					<th>주 소</th>
					<th></th>
				</tr>
				<c:forEach items="${wishList }" var="w">
					<tr>
						<td>${w.contentTypeId }</td>
						<td>${w.contentId }</td>
						<td>
							<button type="submit" class="btn btn-primary mt20">다녀옴</button>
							<button type="submit" class="btn btn-primary mt20"
								formaction="wishDelete.do" formmethod="post">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br />
		<div></div>
	</form>
</div>
<br />
<div>
	<button type="button" class="btn btn-primary mt20"
		onclick="location.href='deliciousList.do'">돌아가기</button>
</div>

<script type="text/javascript">

// let contentTypeId = document.;
// let contentId = ;
// let infoUrl = ;



</script>
