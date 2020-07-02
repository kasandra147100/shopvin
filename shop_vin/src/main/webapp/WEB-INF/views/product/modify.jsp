<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<style>
.inputArea {
	amrgin: 10px 0;
}

.select_img img {
	width: 400px;
	margin: 20px 0;
}
</style>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">상품 관리</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<br>



			<form role="form" action="/product/modify" method="post"
				enctype="multipart/form-data" onsubmit="return false;">

				<input type='hidden' name='pageNum'
					value='<c:out value="${cri.pageNum }"/>'> <input
					type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>


				<div class="form-group">
					<label>bno</label> <input class="form-control" name="bno"
						value='<c:out value="${product.bno }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>상품코드</label> <input class="form-control" name="productCode"
						value='<c:out value="${product.productCode }"/>'>
				</div>

				<div class="form-group">
					<label>상품명</label> <input class="form-control" name="productName"
						value='<c:out value="${product.productName }"/>'>
				</div>

				<div class="form-group">
					<label>상품가격</label> <input class="form-control" name="productPrice"
						value='<c:out value="${product.productPrice }"/>'>
				</div>

				<div class="form-group">
					<label>상품설명</label>
					<textarea class="form-control" rows="3" name="productDesc"><c:out
							value="${product.productDesc }" />
							</textarea>
				</div>

				<div class="form-group">
					<label>원산지</label> <input class="form-control" name="productOri"
						value='<c:out value="${product.productOri }"/>'>
				</div>

				<div class="form-group">
					<label>수량</label> <input class="form-control" name="productCount"
						value='<c:out value="${product.productCount }"/>'>
				</div>
				<div class="form-group">
					<label>색상</label> <input class="form-control" name="productColor"
						value='<c:out value="${product.productColor }"/>'>
				</div>
				<div class="form-group">
					<label>사이즈</label> <input class="form-control" name="productSize"
						value='<c:out value="${product.productSize }"/>'>
				</div>

				<label>분류</label> <br> <select id="kateList"
					class="form-control" name="productKate">
					<option style="font-weight: bold;" value="1">top</option>
					<option style="color: #5D5D5D;" value="2">tee</option>
					<option style="color: #5D5D5D;" value="3">shirt</option>
					<option style="color: #5D5D5D;" value="4">knit</option>
					<option style="font-weight: bold;" value="5">bottom</option>
					<option style="color: #5D5D5D;" value="6">denim</option>
					<option style="color: #5D5D5D;" value="7">slacks</option>
					<option style="font-weight: bold;" value="8">outer</option>
					<option style="font-weight: bold;" value="9">shoes</option>
					<option style="font-weight: bold;" value="10">acc</option>
					<option style="color: #5D5D5D;" value="11">hat</option>
					<option style="color: #5D5D5D;" value="12">ring</option>
					<option style="color: #5D5D5D;" value="13">neckLace</option>
					<option style="color: #5D5D5D;" value="14">bag</option>
					<option style="color: #5D5D5D;" value="15">belt</option>
					<option style="font-weight: bold;" value="16">sale</option>
				</select><br>
				<div class="inputArea">
					<label for="productImg"></label>
					<p>이미지</p>
					<input type="file" id="productImg" name="file" />
					<div class="select_img">
						<img src="${product.productImg}"> <input type="hidden"
							name="productImg" value='<c:out value="${product.productImg}" />'>
						<input type="hidden" name="productThumbImg"
							value='<c:out value="${product.productThumbImg}" />'>
					</div>
					<script>
						$("#productImg").change(
								function() {
									if (this.files && this.files[0]) {
										var reader = new FileReader;
										reader.onload = function(data) {
											$(".select_img img").attr("src",
													data.target.result).width(
													500);
										}
										reader.readAsDataURL(this.files[0]);
									}
								});
					</script>
				</div>

				<div class="inputArea">
					<input name="${_csrf.parameterName}" type="hidden"       value="${_csrf.token}" />
					<button type="submit" data-oper='modify' class="btn btn-default">수정완료</button>
					<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
					<button type="submit" data-oper='list' class="btn btn-info">목록</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {/* 문서가 준비 됐다면, 아래 함수 수행. */
		var formObj = $("form");/* 문서중 form 요소를 찾아서 변수에 할당. */
		$('button').on("click", function(e) { /* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를  전달하면서 */
			// e.preventDefault(); 기본이벤트 동작막기
			var operation = $(this).data("oper");
			console.log(operation);
			if (operation === 'remove') {
				formObj.attr("action", "/product/remove");
			} else if (operation === 'list') {
				self.location = "/product/list";
				return;
			}
			formObj.attr("onsubmit", "return true").submit();
		});
	});
</script>
<%=request.getRealPath("/")%>
<%@ include file="../includes/footer.jsp"%>