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
						<label>카테고리</label> <input class="form-control" name='bid' value='notice'>
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
		
			<div class="panel-heading">File Attach</div>
			<!--/.panel-heading  -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>								
				<div class="uploadResult">
					<ul></ul>
				</div>
				
			</div> <!--end panel body  -->
		</div><!--end panel body  -->
	</div><!--end panel  -->
</div>

<script>
   $(document).ready(function(e) {
      var formObj = $("form[role='form']");
      console.log(formObj);
      
      $("button[type='submit']").on("click",function(e){
         e.preventDefault();
         console.log("submit clicked");
     
       //글 등록 버튼을 누르면 첨부파일의 정보도 함께 전송 되도록 수정.
			var str="";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj=$(obj);
				console.dir(jobj);
				console.log("------------------");
				console.log(jobj.data("filename"));
				
				str+="<input type='hidden' name='attachList[";
				str+=i+"].fileName' value='"+jobj.data("filename");
				str+="'>";
			
				str+="<input type='hidden' name='attachList[";
				str+=i+"].uuid' value='" +jobj.data("uuid");
				str+="'>";
				
				str+="<input type='hidden' name='attachList[";
				str+=i+"].uploadPath' value='"+jobj.data("path");
				str+="'>";
				
				str+="<input type='hidden' name='attachList[";
				str+=i+"].fileType' value='"+jobj.data("type");
				str+="'>";
		});
			formObj.append(str).submit();
			//첨부파일의 정보들을 li의 data값으로 가지고 있다가
			//hidden으로 폼에 포함.
		});
      
      
      var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      // 정규표현식. 일부 파일의 업로드 제한.

      var maxSize = 5242880; // 5MB
      
      function checkExtension(fileName, fileSize){
         if(fileSize >=maxSize){
            alert("파일 크기 초과");
            return false;
         }
         
         if(regex.test(fileName)){
            alert("해당 종류의 파일은 업로드 불가.");
            return false;
         }
         return true;
      }
      
      $("input[type='file']").change(function(e){
         // 파일 입력창의 값이 변화 한다면,
         var formData = new FormData();
         // form 데이터를 저장할 수 있는 객체를 생성하고,
         var inputFile=$("input[name='uploadFile']");
         // 파일 입력창의 요소를 변수로 할당.
         var files=inputFile[0].files;
         // 파일 요소에 추가된 첨부파일의 값들을 배열로 전환.
         for(var i=0;i<files.length;i++){
            if(!checkExtension(files[i].name
                  ,files[i].size)){
               // 각각의 첨부파일이 등록에 알맞는 크기와 확장자 인지 체크.
               return false;
               // 유효성이 맞지 않다면 처리 중단.
            }
            formData.append("uploadFile",files[i]);
            // 유효성에 합당하다면, 폼 데이터로 각 요소를 추가.
            
         }
         
         $.ajax({
            url:'/uploadAjaxAction',
            // 위 url로 접근한다면 아래 방식으로 처리.
            processData:false,
            contentType:false,
            data:formData, // 첨부파일의 값들.
            type:'POST',
            dataType:'json',// 전송 결과 타입.
            success:function(result){// 콜백.
               console.log(result);
               showUploadResult(result);
            }
         });// end_ajax
      });// end_change
      
      function showUploadResult(uploadResultArr){
         if(!uploadResultArr 
               || uploadResultArr.length==0){
            // json 처리 결과가 없다면 함수 종료.
            return;
         }
         
         var uploadUL=$(".uploadResult ul");
         var str="";
         
         // each 구문은 전달된 배열의 길이 만큼, 
         // each 이후의 함수를 반복 처리.
         $(uploadResultArr).each(function(i,obj){
            var fileCallPath
            = encodeURIComponent(obj.uploadPath
                  +"/"+obj.uuid+"_"+obj.fileName);
            // encodeURIComponent : 
            // uri 로 전달되는 특수문자의 치환.
            // & ?
            var fileLink
            =fileCallPath.replace(new RegExp(/\\/g),"/");
            // 전달되는 값들 중에서 역슬러시를 찾아서 슬러시로 변경.
            
            str+="<li data-path='";
            str+=obj.uploadPath+"' data-uuid='";
            str+=obj.uuid+"' data-filename='";
            str+=obj.fileName+"' data-type='";
            str+=obj.image+"'><div>";
            str += "<img src='../../../classes/imges/attach.png' width='20' height='20'>";
            str+="<span>"+obj.fileName+"</span> ";
            str+="<b data-file='"+fileCallPath;
            str+="' data-type='file'>[x]</b>";
            str+="</div></li>";
         });
         uploadUL.append(str);
      
      } // end_showUploadResult

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
		})// end_delete_file
	})

</script>



<%@ include file="../includes/footer.jsp"%>