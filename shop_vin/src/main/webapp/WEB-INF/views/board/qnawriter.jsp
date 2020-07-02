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
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				
					<div class="form-group">
						<label>카테고리</label> <input class="form-control" name='bid' value="qna" placeholder="qna">
					</div>
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
	$(document)
			.ready(
					function(e) {
						var formObj = $("form[role='form']");
						$("button[type='submit']")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("submit clicked");
											// 글 등록 버튼을 누르면 첨부파일의 정보도 함께 전송 되도록 수정.
											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj);
																console
																		.dir(jobj);
																console
																		.log("-----------------");
																console
																		.log(jobj
																				.data("filename"));
																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename");
																str += "'>";
																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid");
																str += "'>";
																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path");
																str += "'>";
																str += "<input type='hidden' name='attachList[";
																str += i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type");
																str += "'>";
															});
											formObj.append(str).submit();
											// 첨부파일의 정보들을 li 의 data 값으로 가지고 있다가
											// hidden 으로 폼에 포함.
										});
						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

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
						$("input[type='file']")
								.change(
										function(e) {
											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);
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
													showUploadResult(result);
													// 첨부파일 업로드 결과를 json으로 받으면,
													// 그 내용을 화면에 표시.
												}
											});// end_ajax
										});// end_change
						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								// json 처리 결과가 없다면 함수 종료.
								return;
							}
							var uploadUL = $(".uploadResult ul");
							var str = "";
							// each 구문은 전달된 배열의 길이 만큼,
							// each 이후의 함수를 반복 처리.
							$(uploadResultArr)
									.each(
											function(i, obj) {
												var fileCallPath = encodeURIComponent(obj.uploadPath
														+ "/"
														+ obj.uuid
														+ "_"
														+ obj.fileName);
												// encodeURIComponent :
												// uri 로 전달되는 특수문자의 치환.
												// & ?
												var fileLink = fileCallPath
														.replace(new RegExp(
																/\\/g), "/");
												// 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.
												str += "<li data-path='";
												str+=obj.uploadPath+"' data-uuid='";
												str+=obj.uuid+"' data-filename='";
												str+=obj.fileName+"' data-type='";
												str+=obj.image+"'><div>";
												str += "<img src='/resources/img/attach.png'>";
												str += "<span>" + obj.fileName + "</span> ";
												str += "<b data-file='"+fileCallPath;
												str+="' data-type='file'>[x]</b>";
												str += "</div></li>";
											});
							uploadUL.append(str);
						}// end_showUploadResult
						$(".uploadResult").on("click", "b", function(e) {
							console.log("delete file");
							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							var targetLi = $(this).closest("li");
							$.ajax({
								url : '/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'text',
								type : 'POST',
								success : function(result) {
									alert(result);
									targetLi.remove();
								}
							})
						});
					});// end_ready
</script>


<%@ include file="../includes/footer.jsp"%>