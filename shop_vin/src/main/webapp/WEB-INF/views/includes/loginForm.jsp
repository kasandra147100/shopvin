<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>free login form -bootstrap</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
  
  </head>


   <body>
   
   
     <div  class="container">
      <div style="margin-top: 10px"   class="row">
      
        
        
        <div style="margin: auto; right: 120px" class="col-md-3">
          <div style="width: 500px;" class="login-box well">
   
   <h1>로그인 페이지</h1>
   <form class="px-4 py-3" action="/login" method="post">
      <input type="text" class="form-control" name="loginId"
         placeholder="아이디"><br> <input type="password"
         class="form-control" name="password" placeholder="비밀번호"><br>
      <input name="${_csrf.parameterName}" type="hidden"
         value="${_csrf.token}" />
      <button type="submit" class="btn btn-primary">로그인</button>
      <br>
             <div class="form-group">
                <a href="/register" class="btn btn-default btn-block m-t-md"> 회원가입</a></div>
      
   </form>
   <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}"> <!--  SPRING_SECURITY_LAST_EXCEPTION 에 값이 있다면 작동-->
      <font color="red">
         <p>
            Your login attempt was not successful due to          
           
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
         	  
         	   <br>
             	 로그인이 차단돼었습니다
             <br /> 
         </p> <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
      </font>
   </c:if>

</div>
</div>
</div>
</div>

</body>
  
  </html>