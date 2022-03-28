<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div>
	<form>
		<input type="hidden" name="contentId">
	</form>
</div>
<div>
	<table border="1">
		<tr>
			<th>1</th>
			<th>2</th>
			<th></th>
		</tr>
		<c:forEach items="${wishList }" var="w">
			<tr>
				<td>${w.contentTypeId }</td>
				<td>${w.contentId }</td>
				<td>
					<button type="submit" class="btn btn-primary mt20">다녀옴</button>
					<button type="submit" class="btn btn-primary mt20" formaction="wishDelete.do" formmethod="post">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<br />
<div></div>

