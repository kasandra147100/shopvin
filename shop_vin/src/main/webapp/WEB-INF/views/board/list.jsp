<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"></h1>



<!-- DataTales Example -->

<div class="card shadow mb-4" style="margin: 0px 10%;">

	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>

	</div>



	<div style="margin: 0px 10%;" class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<!-- <th>Salary</th> -->
					</tr>
				</thead>

				<tbody>
					<c:forEach var="board" items="${list }">

						<tr>
							<td>
								<c:out value="${board.bno }" />
							</td>

							<td>
								<a style="color: black;" class="move" href='<c:out value="${board.bno }"/>'> <c:out value="${board.title }" />

									<c:if test="${board.replyCnt ne 0 }">
										<span style="color: red;">[<c:out value="${board.replyCnt }" />]
										</span>
									</c:if>

								</a>
							</td>


							<td>
								<c:out value="${board.writer }" />
							</td>

							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" />
							</td>

						</tr>

					</c:forEach>
				</tbody>

			</table>

			<div>
				<div class="col-lg-12">
					<form id="searchForm" action="/board/list" method="get">
						&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>제목+내용</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>제목</option>
							<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>내용</option>
							<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>작성자</option>


						</select> <input type="text" name="keyword" /> <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button class="btn btnwarning">Search</button>
					</form>
				</div>
			</div>

			<div>
				<ul class="pagination justify-content-center">

					<c:if test="${pageMaker.prev}">
						<li class="page-item previous"><a href="${pageMaker.startPage-1 }">Prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">

						<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'><a href="${num }" class="page-link">${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a href="${pageMaker.endPage+1 }">Next</a></li>
					</c:if>

				</ul>
			</div>

			<form id="actionForm" action="/board/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> <input type="hidden" name="amount"
					value="${pageMaker.cri.amount }">
			</form>


			<button id="regBtn" style="color: green;">글쓰기</button>

		</div>
	</div>
</div>




<!-- Logout Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body" align="center">처리 완료.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(
			function() {
				$("#regBtn").on("click", function() {
					self.location = "/board/writer";
					/* 아이디 regBtn 을 클릭한다면
					현재창의 위치를 쓰기로 변경 */
				});

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
							actionForm.attr("action", "/board/get");
							actionForm.submit();
						});

				var result = '<c:out value="${result}"/>';
				checkModal(result);

				var searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e) {
					if (!searchForm.find("option:selected").val()) {
						alert("검색 종류를 선택하세요.");
						return false;
					}
					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요.");
						return false;
					}
					searchForm.find("input[name='pageNum']").val(1);
					e.preventDefault();
					searchForm.submit();
				});

				function checkModal(result) {
					if (result === '') {
						// == 는 값만 비교, === 은 값과 형식도 비교.
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + "번이 등록");
					}
					$("#myModal").modal("show");
				}
			});
</script>



<%@ include file="../includes/footer.jsp"%>
