<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때
태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<%@include file="/WEB-INF/views/includes/header.jsp"%>


<div class="row" style="width: 40%; margin: auto;" >
	<div class="col-lg-12">
		<div class="panel panel-default">
			<h1 >로그인</h1>			
			<h2>${logout }</h2>
			
			<form method="post" action="/login">
			
				<div class="form-group">
					<input type="text" name="username" value="admin"
					placeholder="userid" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" name="password" value="admin"
					placeholder="password" class="form-control">
				</div>
				<div class="form-group">
					<input type="checkbox" name="remember-me"> 자동 로그인
				</div>
				<p style="color: red;">${error}</p>
				<div class="form-group">
					<input type="submit" value="login">
				</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
				
			</form>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp"%>
