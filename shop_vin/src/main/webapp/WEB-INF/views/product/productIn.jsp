<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>

<style>
.grid_item {
   width: 500px;
   height: 500px;
   display: inline-block;
   vertical-align: top;
   vertical-align: bottom;
}
</style>

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
   <div class="block-4" style="text-align: center;">

      <div class="grid_item first;">
         <a href="${product.productImg}"
            class="product-item md-height bg-gray d-block"
            style="height: 500px;"> <img src="${product.productImg}"
            width="340" height="300" alt="Image" class="img-fluid">
         </a>

      </div>
      <div class="grid_item second;">
         <br>
         <h2 class="item-title ">${product.productName}</h2>
         <hr>
         <div style="width: 100%;">
            판매가: <strong class="item-price">${product.productPrice}</strong> <br>
            원산지: <strong class="item-price">${product.productOri}</strong>
            <hr>
         </div>
         <div>
            <label>색상</label><select class="form-control">
               <option style="font-weight: bold;">${product.productColor}</option>
            </select> <br> <label>사이즈</label><select class="form-control">
               <option style="font-weight: bold;">${product.productSize}</option>
            </select>
         </div>
         <br>
         <br>
         <button type="button">구매하기</button>
         <button type="button">장바구니</button>
      </div>
   </div>
</body>



<%@include file="/WEB-INF/views/includes/footer.jsp"%>