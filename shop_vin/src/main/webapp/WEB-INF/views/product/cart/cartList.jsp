<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<script>
	$(document).ready(function() {
		$("#btnList").click(function() {
			location.href = "${path}/shop/product/list.do";
		});
	});
</script>
</head>
<body>
	<c:choose>
		<c:when test="${map.count == 0}">
	장바구니가 비어있습니다.
	</c:when>
		<c:otherwise>
			<form name="form1" id="form1" method="post"
				action="${path}/product/cart/update.do">
				<table border="1">
					<tr>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>총금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="row" items="${map.list}" varStatus="i">
						<tr>
							<td>${row.productName}</td>
							<td style="width: 80px" align="right"><fmt:formatNumber
									pattern="###,###,###" value="${row.productPrice}" /></td>
							<td><input type="number" style="width: 40px" name="amount"
								value="${row.amount}" min="1"> <input type="hidden"
								name="bno" value="${row.productId}"></td>
							<td style="width: 100px" align="right"><fmt:formatNumber
									pattern="###,###,###" value="${row.money}" /></td>
							<td><a
								href="${path}/product/cart/delete.do?cartId=${row.cartId}">삭제</a>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">장바구니 금액 합계 : <fmt:formatNumber
								pattern="###,###,###" value="${map.sumMoney}" /><br> 배송료 :
							${map.fee}<br> 전체 주문금액 :<fmt:formatNumber
								pattern="###,###,###" value="${map.allSum}" />
						</td>
					</tr>
				</table>
				<input type="hidden" name="count" value="${map.count}">
				<button type="submit" id="btnUpdate">수정</button>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>