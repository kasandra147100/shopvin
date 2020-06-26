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
         <form role="form" action="/product/register" method="post"
            enctype="multipart/form-data">

            <div class="form-group">
               <label>bno</label> <input class="form-control" name="bno"
                  readonly="readonly">
            </div>

            <div class="form-group">
               <label>상품코드</label> <input class="form-control" name="productCode">
            </div>

            <div class="form-group">
               <label>상품명</label> <input class="form-control" name="productName">
            </div>

            <div class="form-group">
               <label>상품가격</label> <input class="form-control" name="productPrice">
            </div>
            <div class="form-group">
               <label>상품설명</label>
               <textarea class="form-control" rows="3" name="productDesc"></textarea>
            </div>

            <div class="form-group">
               <label>수량</label> <input class="form-control" name="productCount">
            </div>

            <div class="form-group">
               <label>원산지</label> <input class="form-control" name="productOri">
            </div>

            <div class="form-group">
               <label>색상</label> <input class="form-control" name="productColor">
            </div>

            <div class="form-group">
               <label>사이즈</label> <input class="form-control" name="productSize">
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
            </select> <br> <label for="productImg">이미지</label> <br> <input
               type="file" id="productImg" name="file" />
            <div class="select_img">
               <img src="" class="oriImg" />
            </div>

            <button type="submit" class="btn btn-default">Submit</button>
            <button type="reset" class="btn btn-default">Reset</button>
         </form>
      </div>
   </div>
</div>
<script>
   $("#productImg").change(
         function() {
            if (this.files && this.files[0]) {
               var reader = new FileReader;
               reader.onload = function(data) {
                  $(".select_img img").attr("src", data.target.result)
                        .width(500);
               }
               reader.readAsDataURL(this.files[0]);
            }
         });
</script>

<%=request.getRealPath("/")%>

<%@ include file="../includes/footer.jsp"%>