<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MAIVIN &mdash; Colorlib e-Commerce Template</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">




<style>
.primary-font {
	font-weight: bold;
	color: blue;
}
.w20porder{
	padding : 0px , -3px;
	margin-right : -10px;
	font-size : xx-small;
	float : right;
	border: 0;
	outline: 0;
	background-color: white;
}

</style>


</head>



<body>

   <div class="site-wrap">


      <div class="site-navbar bg-white py-2">

         <div class="search-wrap">
            <div class="container">
               <a href="#" class="search-close js-search-close"><span
                  class="icon-close2"></span></a>
               <form action="#" method="post">
                  <input type="text" class="form-control"
                     placeholder="Search keyword and hit enter...">
               </form>
            </div>
         </div>

         <div class="container">
            <div class="d-flex align-items-center justify-content-between">
               <div class="logo">
                  <div class="site-logo">
                     <a href="/main.jsp" class="js-logo-clone">MAIVIN</a>
                  </div>
               </div>
               <div class="main-nav d-none d-lg-block">
                  <nav class="site-navigation text-right text-md-center"
                     role="navigation">
                     <ul class="site-menu js-clone-nav d-none d-lg-block">

                        <li><a href="/main.jsp">HOME</a></li>

                        <li class="has-children active"><a href="#">MENU</a>
                           <ul class="dropdown">
                              <li class="has-children"><a href="/product/top/top">TOP</a>
                                 <ul class="dropdown">
                                    <li><a href="/product/top/tee">TEE</a></li>
                                    <li><a href="/product/top/shirt">SHIRT</a></li>
                                    <li><a href="/product/top/knit">KNIT</a></li>
                                 </ul></li>
                              <li class="has-children"><a href="/product/bottom/bottom">BOTTOM</a>
                                 <ul class="dropdown">
                                    <li><a href="/product/bottom/denim">DENIM</a></li>
                                    <li><a href="/product/bottom/slacks">SLACKS</a></li>
                                 </ul></li>
                              <li><a href="/product/outer/outer">OUTER</a></li>
                              <li><a href="/product/shoes/shoes">SHOES</a></li>
                              <li class="has-children"><a href="/product/acc/acc">ACC</a>
                                 <ul class="dropdown">
                                    <li><a href="/product/acc/hat">HAT</a></li>
                                    <li><a href="/product/acc/ring">RING</a></li>
                                    <li><a href="/product/acc/neckLace">NECKLACE</a></li>
                                    <li><a href="/product/acc/bag">BAG</a></li>
                                    <li><a href="/product/acc/belt">BELT</a></li>
                                 </ul></li>
                              <li><a href="/product/sale/sale">SALE</a></li>
                           </ul></li>
                        <li><a href="/lookBook">LOOKBOOK</a></li>
                        <li><a href="/transAction">TRANSACTION</a></li>
                        <li class="has-children active"><a href="#">ASK</a>
                           <ul class="dropdown">
                              <li><a
                                 href="${pageContext.request.contextPath}/board/list">공지사항</a></li>
                              <li><a href="/ask/qna">Q&A</a></li>
                           </ul></li>
                        <li><a href="/event">EVENT</a></li>
                        <li class="has-children active"><a href="#">management</a>
                           <ul class="dropdown">
                              <li><a
                                 href="${pageContext.request.contextPath}/product/list">상품관리</a></li>
                              <li><a href="#">회원관리</a></li>
                           </ul></li>
                     </ul>
                  </nav>
               </div>
               <div class="icons">
                  <a href="/login.jsp"> <span class="icon-user"></span>
                  </a> <a style="margin-left: 12px;" href="register.jsp"> <span
                     class="icon-user-plus"></span>
                  </a> <a style="margin-left: 2px;" href="#"
                     class="icons-btn d-inline-block js-search-open"> <span
                     class="icon-search"></span>
                  </a> <a href="#" class="icons-btn d-inline-block"> <span
                     class="icon-heart-o"></span></a> <a href="cart.html"
                     class="icons-btn d-inline-block bag"> <span
                     class="icon-shopping-bag"></span> <span class="number">2</span>
                  </a> <a href="#"
                     class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none">
                     <span class="icon-menu"></span>
                  </a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <br>

	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
   	<script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>


</body>