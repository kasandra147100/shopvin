<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<body>
	<article class="container">
		<div class="page-header">

			<div class="col-md-6 col-md-offset-3">
				<h3>회원가입</h3>
			</div>
		</div>


		<div style="margin: 0 auto;" class="col-sm-6 col-md-offset-3">

			<form role="form" action="user/register" method="post">


				<div class="form-group">
					<label for="userId">아이디</label> <input type="text"
						class="form-control" id="userId" name="userId"
						placeholder="아이디를 입력해 주세요" onkeyup="register1()"><br>
					<div id="id_check"></div>
				</div>
				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password"
						class="form-control" id="userPw" name="userPw"
						placeholder="비밀번호를 입력해주세요" onkeyup="chkPW()"><br>
					<div id="pw_check"></div>

				</div>
				<div class="form-group">
					<label for="inputPasswordCheck">비밀번호 확인</label> <input
						type="password" class="form-control" id="userPwChk"
						placeholder="비밀번호 확인을 위해 다시한번 입력 해 주세요"><br>
					<div id="chkNotice"></div>
				</div>
				<div class="form-group">
					<label for="inputName">성명</label> <input type="text"
						class="form-control" id="userName" name="userName"
						placeholder="이름을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="inputName">생일</label> <input type="date"
						class="form-control" id="Birth" name="Birth"
						placeholder="이름을 입력해 주세요">

				</div>

				<div class="form-group">
				<label for="inputName">주소</label><br>
					<input type="text" class="form-control" id="sample4_postcode" name="zipCode" placeholder="우편번호">
					<input type="button" class="form-control"  onclick="sample4_execDaumPostcode()"
						value="우편번호 찾기"><br> 
						<input type="text"
						id="sample4_roadAddress" name="userAddr" class="form-control"  placeholder="도로명주소"> <input
						type="text" id="sample4_jibunAddress" name="userAddr2" class="form-control"  placeholder="지번주소">
					<span id="guide" style="color: #999; display: none"></span> <input
						type="text" id="sample4_detailAddress" name="detailAddr" class="form-control"  placeholder="상세주소">
					<input type="text" id="sample4_extraAddress" name="extraAddr" class="form-control"  placeholder="참고항목">
				</div>


				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="email"
						class="form-control" id="userMail" name="userMail"
						placeholder="이메일 주소를 입력해주세요">
			

				</div>

				<div class="form-group">
					<label for="inputMobile">휴대폰 번호</label> <input type="tel"
						class="form-control" id="userPhone" name="userPhone"
						placeholder="휴대폰번호를 입력해 주세요">
				</div>


				<div class="form-group">
					<label>약관 동의</label>
					<div data-toggle="buttons">
						<label class="btn btn-primary active"> <span
							class="fa fa-check"></span> <input id="agree" type="checkbox"
							autocomplete="off" checked>
						</label> <a href="#">이용약관</a>에 동의합니다.
					</div>
				</div>

				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary">
						회원가입 <i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" class="btn btn-warning"
						onclick="location.href='main.jsp'">
						가입취소 <i class="fa fa-times spaceLeft"></i>

					</button>
				</div>





			</form>










		</div>

	</article>

	<script type="text/javascript">
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	function register1() {
		var userId = $('#userId').val();
		console.log("gjlt");
		var allData = { "userId" : userId};
		var idJ = /^[a-z0-9][a-z0-9_\-]{4,12}$/;

		$.ajax({
			url : '/user/idCheck',
			type : 'post',
			data : allData,
			dataType : 'json',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("이미 사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						
					} else {
						
						if(idJ.test(userId)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("사용가능한 아이디 입니다.");
							$("#id_check").css('color', '#0000FF')
							
				
						} else if(userId == ""){
							
							$('#id_check').text('아이디를 입력해주세요.');
							$('#id_check').css('color', 'red');
											
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#id_check').css('color', 'red');
						
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		};
		// id = "id_reg" / name = "userId"
		
	
		
		//비밀번호 유효성 검사.
		
		function chkPW(){

 var pw = $("#userPw").val();
 var num = pw.search(/[0-9]/g);
 var eng = pw.search(/[a-z]/ig);
 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

 if(pw.length < 8 || pw.length > 20){

	 $("#pw_check").text("8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
		$("#pw_check").css("color", "red");
  return false;
 }else if(pw.search(/\s/) != -1){
	 $("#pw_check").text("비밀번호는 공백 없이 입력해주세요.");
  return false;
 }else if(num < 0 || eng < 0 || spe < 0 ){
	 $("#pw_check").text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	 $("#pw_check").css("color", "red");
  return false;
 }else {
	 $("#pw_check").text("");
    return true;
 }

}
		
		
		//비밀번호 확인
		
		
		$(function(){
    $('#userPw').keyup(function(){
      $('#chkNotice').html('');
    });

    $('#userPwChk').keyup(function(){

        if($('#userPw').val() != $('#userPwChk').val()){
          $('#chkNotice').text('비밀번호가 일치하지 않습니다.');
          $('#chkNotice').attr('color', 'red');
          $("#chkNotice").css("color", "red");
        } else{
          $('#chkNotice').text('비밀번호가 일치합니다.');
          $('#chkNotice').attr('color', 'blue');
          $("#chkNotice").css("color", "blue");
        }

    });
});
		
		

		
		
		// 비어있을시 회원가입 불가.
		
		
		$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {

			location.href = "/login";

		})

		$("#join-submit").on("click", function() {
			if ($("#userId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if ($("#userPw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPw").focus();
				return false;
			}

			if ($("#userName").val() == "") {
				alert("성명을 입력해주세요.");
				$("#userName").focus();
				return false;
			}
			if ($("#zipCode").val() == "") {
				alert("우편번호를 입력해주세요.");
				$("#userPhone").focus();
				return false;
			}
			if ($("#userAddr").val() == "") {
				alert("주소를 입력해주세요.");
				$("#userPhone").focus();
				return false;
			}
			if ($("#userAddr2").val() == "") {
				alert("나머지주소를 입력해주세요.");
				$("#userPhone").focus();
				return false;
			}

			if ($("#usermail").val() == "") {
				alert("이메일 주소를 입력해주세요.");
				$("#usermail").focus();
				return false;
			}

			if ($("#userPhone").val() == "") {
				alert("휴대폰번호를 입력해주세요.");
				$("#userPhone").focus();
				return false;
			}

		});

	})
		
</script>

	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>





</body>

