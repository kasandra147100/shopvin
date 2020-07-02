
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>


<section id="content">

   <ul>
      <c:forEach items="${cartList}" var="cartList">
         <li>
            <div class="thumb">
               <img src="${cartList.gdsThumbImg}" />
            </div>
            <div class="gdsInfo">
               <p>
                  <span>상품명 : </span>${cartList.gdsName}<br /> <span>개당 가격 :
                  </span>
                  <fmt:formatNumber pattern="###,###,###"
                     value="${cartList.gdsPrice}" />
                  <br /> <span>구입 수량 : </span>${cartList.cartStock}<br /> <span>최종
                     가격 : </span>
                  <fmt:formatNumber pattern="###,###,###"
                     value="${cartList.gdsPrice * cartList.cartStock}" />
               </p>
            </div>


         </li>
      </c:forEach>
   </ul>
</section>

<form id="actionForm" action="/product/cartList" method="get">
   <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
   <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>
<div style="text-align: right;">
   <button id="regBtn" class="btn btn-default">구매하기</button>
</div>


<%@ include file="../includes/footer.jsp"%>