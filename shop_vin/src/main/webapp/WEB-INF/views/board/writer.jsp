<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<div>
	<div>
		<h1 class="page-header">글쓰기 페이지</h1>
	</div>
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<div style="margin: 30px 10%;" class="panel-body">
			
				<form role="form" action="/board/writer" method="post">
					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'>
					
					</div>
					<button type="submit" class="btn btndefault">Submit Button</button>
					<button type="button" onclick="location.href='list'" class="btn btn-default">Reset Button</button>
				</form>
			</div>
		</div>
	</div>
</div>

<br />
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					파일 첨부: <input type="file" name="uploadFile" multiple>
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(e) {
		var formObj = $("form[role='form']");
		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();
			console.log("submit clicked");
		});
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		// 정규표현식. 일부 파일의 업로드 제한.
		//
		https: //developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8
		B % 9D
		// https://regexper.com/
		var maxSize = 5242880; // 5MB
		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 크기 초과");
				return false;
			}
			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드 불가.");
				return false;
			}
			return true;
		}
		$("input[type='file']").change(function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
				}
			});
		});
	});
</script>


<%@ include file="../includes/footer.jsp"%>