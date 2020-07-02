<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">


<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/style.css">
</head>
<body>
	<div class="block-4"
		style="text-align: center; margin-top: 5%; margin-bottom: 5%;">
		<h2>
			<a style="color: black">Bottom</a>
		</h2>
		<a style="color: red; font-weight: bold;" href="/product/bottom/denim">Denim
			<span class="count "> (9)</span>
		</a> <a style="color: #5D5D5D;" href="/product/bottom/slacks">&nbsp;&nbsp;&nbsp;&nbsp;Slacks
			<span class="count "> (8)</span>
		</a>
	</div>
	<hr>
	<div style="text-align: right">
		<a style="color: #5D5D5D;" href="#">신상품</a> <a>｜</a> <a
			style="color: #5D5D5D;" href="#">&nbsp;낮은가격</a> <a>｜</a> <a
			style="color: #5D5D5D;" href="#">&nbsp;높은가격</a> <a>｜</a> <a
			style="color: #5D5D5D;" href="#">&nbsp;인기상품&nbsp;</a>
	</div>
	<div style="text-align: center;" class="row">
		<c:forEach var="product" items="${list }">
			<div class="col-lg-4 col-md-6 item-entry mb-4">
				<a href="/product/productIn?bno=${product.bno }"
					class="product-item md-height bg-gray d-block"> <img
					src="${product.productImg}" alt="Image" class="img-fluid">
				</a>
				<hr>
				<h2 class="item-title ">
					<a href="#">${product.productName}</a>
				</h2>
				<strong class="item-price">${product.productPrice}</strong>
			</div>
		</c:forEach>
	</div>
	<div>
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item previous"><a
					href="${pageMaker.startPage-1}">Prev</a></li>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }">
				<li class='page-item  ${pageMaker.cri2.pageNum==num?"active":"" }'><a
					href="${num }" class="page-link">${num }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next }">
				<li class="page-item next"><a href="${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id="actionForm" action="/product/bottom/denim" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri2.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri2.amount }">
	</form>
	<script>
		$(document).ready(function() {
			$('#dataTable').DataTable({
				"order" : [ [ 0, "desc" ] ], //정렬 0컬럼의 내림차순으로
				"paging" : false, // 페이징 표시 안함.
				"bFilter" : false, // 검색창 표시 안함.
				"info" : false
			// 안내창 표시 안함(쪽번호 위쪽에 showing 1 to 10).
			})
		});

		var actionForm = $("#actionForm");
		// 클래스 page-item 에 a 링크가 클릭 된다면,
		$(".page-item a").on("click", function(e) {
			e.preventDefault();
			// 기본 이벤트 동작을 막고,
			console.log("click");
			// 웹 브라우저 검사 창에 클릭을 표시
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			// 액션폼 인풋태그에 페이지넘 값을 찾아서,
			// href로 받은 값으로 대체함.
			actionForm.submit();
		});
	</script>
</body>
</html>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>