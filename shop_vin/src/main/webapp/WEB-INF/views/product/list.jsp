 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div style="margin: 0px 10%;" class="card-body">
	<div class="table-responsive">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>bno</th>
					<!-- <th>상품코드</th> -->
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품설명</th>
					<th>수량</th>
					<th>분류</th>
					<!-- <th>Salary</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${list }">
					<tr>
						<td><c:out value="${product.bno }" /></td>
<%-- 						<td><c:out value="${product.productCode }" /></td> --%>
						<td><a class='move' href='<c:out value="${product.bno }"/>'>
								<c:out value="${product.productName }" />
						</a></td>
						<td><c:out value="${product.productPrice }" /></td>
						<td><c:out value="${product.productDesc }" /></td>
						<td><c:out value="${product.productCount }" /></td>
						<td><c:out value="${product.productKate }" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="page-item previous"><a
						href="${pageMaker.startPage-1}">Prev</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class='page-item  ${pageMaker.cri.pageNum==num?"active":"" }'><a
						href="${num }" class="page-link">${num }</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="page-item next"><a href="${pageMaker.endPage+1 }">Next</a></li>
				</c:if>
			</ul>
		</div>

		<form id="actionForm" action="/product/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		</form>
		<div style="text-align: right;">
			<button id="regBtn" class="btn btn-default">등록</button>
		</div>
	</div>
</div>


<!-- Logout Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Model title</h4>
			</div>


			<div class="modal-body">처리 완료.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script>
	$(document).ready(
			function() {

				var actionForm = $("#actionForm");
				// 클래스 page-item 에 a 링크가 클릭 된다면,
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							// 기본 이벤트 동작을 막고,
							console.log("click");
							// 웹 브라우저 검사 창에 클릭을 표시
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							// 액션폼 인풋태그에 페이지넘 값을 찾아서,
							// href로 받은 값으로 대체함.
							actionForm.submit();
						});

				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='bno' "
											+ "value='" + $(this).attr("href")
											+ "'>");
							actionForm.attr("action", "/product/get");
							actionForm.submit();
						});
				var result = '<c:out value="${result}"/>';
				checkModal(result);

				function checkModal(result) {
					if (result === '' || history.state) {
						// == 는 값만 비교, === 은 값과 형식도 비교.
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + "번이 등록");
					}
					$("#myModal").modal("show");
				}

				$("#regBtn").on("click", function() {
					self.location = "/product/register";
					/* 아이디 regBtn 을 클릭한다면
					현재창의 위치를 쓰기로 변경 */
				});
			});
</script>
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
</script>


<%@ include file="../includes/footer.jsp"%>