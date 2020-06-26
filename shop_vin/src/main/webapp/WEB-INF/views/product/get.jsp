<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<style>
.oriImg {
   width: 400px;
   height: auto;
}

.thumbImg {
   
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

         <div class="form-group">
            <label>bno</label> <input class="form-control" name="bno" readonly
               value='<c:out value="${product.bno }"/>' readonly="readonly">
         </div>

         <div class="form-group">
            <label>상품코드</label> <input class="form-control" name='productCode'
               readonly value='<c:out value="${product.productCode }"/>'>
         </div>

         <div class="form-group">
            <label>상품명</label> <input class="form-control" name='productName'
               readonly value='<c:out value="${product.productName }"/>'>
         </div>

         <div class="form-group">
            <label>상품가격</label> <input class="form-control" name='productPrice'
               readonly value='<c:out value="${product.productPrice }"/>'>
         </div>

         <div class="form-group">
            <label>상품설명</label>
            <textarea class="form-control" rows="3" name='productDesc' readonly><c:out
                  value="${product.productDesc }" />
                     </textarea>
         </div>

         <div class="form-group">
            <label>원산지</label> <input class="form-control" name='productOri'
               readonly value='<c:out value="${product.productOri }"/>'>
         </div>

         <div class="form-group">
            <label>수량</label> <input class="form-control" name='productCount'
               readonly value='<c:out value="${product.productCount }"/>'>
         </div>

         <div class="form-group">
            <label>분류</label> <input class="form-control" name='productKate'
               readonly value='<c:out value="${product.productKate }"/>'>
         </div>
                  <div class="form-group">
            <label>색상</label> <input class="form-control" name='productColor'
               readonly value='<c:out value="${product.productColor }"/>'>
         </div>
                  <div class="form-group">
            <label>사이즈</label> <input class="form-control" name='productSize'
               readonly value='<c:out value="${product.productSize }"/>'>
         </div>

         <div class="inputArea">
            <label for="productImg"></label>
            <p>이미지</p>
            <img src="${product.productImg}" class="oriImg" />
         </div>
         <br>
         <button data-oper="modify" class="btn btn-default"
            onclick="location.href='/product/modify?bno=<c:out value="${product.bno }"/>'">수정하기</button>
         <button data-oper="list" class="btn btn-info"
            onclick="location.href='/product/list'">목록</button>
         <form id='operForm' action="/product/modify" method="get">
            <input type='hidden' id='bno' name='bno'
               value='<c:out value="${product.bno}"/>'> <input
               type='hidden' name='pageNum'
               value='<c:out value="${cri.pageNum}"/>'> <input
               type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
         </form>
      </div>
   </div>
</div>
<script type="text/javascript">
   $(document).ready(function() {
      var operForm = $("#operForm");
      $('button[data-oper="modify"]').on("click", function(e) {
         operForm.attr("action", "/product/modify").submit();
      });
      $('button[data-oper="list"]').on("click", function(e) {
         operForm.find("#bno").remove(); // bno값 전달
         operForm.attr("action", "/product/list").submit();
         // 리스트로 이동시 bno태그를 지우고 submit을 통해 리스트로 이동
      });
      
   });
</script>

<%=request.getRealPath("/")%>
<%@ include file="../includes/footer.jsp"%>