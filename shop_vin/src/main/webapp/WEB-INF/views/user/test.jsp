<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 확인용</h1>
<sec:authorize access="isAnonymous()">
나는 익명이야
</sec:authorize>
<sec:authorize access="isAuthenticated()">
나는 로그인됐어
</sec:authorize>

<form action="/logout" method="post">

<!--보안토큰  --> <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>

<input type="submit"value="로그아윳"> 
</form>
</body>
</html>