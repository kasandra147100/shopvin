<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>회원 검색</h1>
	<hr>
	<form action="#" method="post" id="search_form" onsubmit="return false">
		검색할 아이디 :<input type="text" name="id" onkeyup="search()"> <input
			name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}" />

	</form>



	<form action="admin/Member_modify" method="post"
		onsubmit="return false" id="modify">



		<div id="member"></div>


	</form>







	<script type="text/javascript">
		var testform = $("#search_form");
		var str = "";
		var id_value = "";
		var data1 = "";
		function search() {
			$
					.ajax({
						type : "post",
						url : "Admin_page_Id_search",
						data : $("#search_form").serialize(),
						success : function(data) {
							console.log(data.id);
							console.log(data);
							str = "<br>"
									+ "<br>"
									+ "<br>"
									+

									'아이디:<input type="text" value="'+data.userId+'" name="id" readonly="readonly">'
									+ "<br>"
									+ '비밀번호:<input type="text" value="'+data.userPw+'" name="password">'
									+ "<br>"
									+ '이름:<input type="text" value="'+data.userName+'" name="name">'
									+ "<br>"
									+ '이메일:<input type="text" value="'+data.userMail+'" name="email">'
									+ "<br>"
									+ '주소:<input type="text" value="'+data.userAddr+'" name="Addr">'
									+ "<br>"
									+ '권한:<input type="text" value="'+data.authority+'" name="authority">'
									+ "<br>"
									+ '사용여부:<input type="text" value="'+data.enabled+'" name="enabled"> 1사용 가능 2정지'
									+ "<br>"
									+ '<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>'
									+ "<hr>"
									+ "<button onclick='Member_modify()'>수정</button> <button onclick='Member_delete()'>삭제</button>";

							if (data.id == null) {
								str = "해당 아이디가 존재하지 않습니다";

							}

							$('#member').html(str);

						},
						error : function(data) {
							alert("serialize err");
						}
					});
		};

		//form 값 제출하기 
		function Member_modify() {

			var formObj = $("#modify");

			formObj[0].submit();

		}

		//링크로 제출하기
		function Member_delete() {

			var inputId = $("#modify").find("input[name='id']");
			console.log(inputId.val());
			location.href = "admin/Member_delete?id=" + inputId.val();

		}
	</script>




</body>
</html>