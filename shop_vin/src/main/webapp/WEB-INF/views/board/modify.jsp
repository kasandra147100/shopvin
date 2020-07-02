<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>

<script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-body">

				<form role="form" action="/board/modify" method="post"
				onsubmit="return false;">
					<input type="hidden" name="pageNum" 
					value="${cri.pageNum }" /> 
					<input type="hidden" name="amount" 
					value="${cri.amount }" />
					<input
					type="hidden" name="type" value="${cri.type }"> 
					<input
					type="hidden" name="keyword" 
					value="${cri.keyword }">
					
					<div class="form-group">
						<label>카테고리</label> <input class="form-control" name="bno"
							value="${board.bid }" readonly="readonly">
					</div>
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name="bno"
							value="${board.bno }" readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value="${board.title }">
					</div>

					<div class="form-group">
						<label>Text area</label>
						
						<textarea id='editor4' rows="3" class="form-control" name="content"><c:out value="${board.content }" /></textarea>
						<script>
  							  CKEDITOR.replace("editor4");
  						  </script>
						
						
					</div>
					
					
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>RegDate</label> <input class="form-control" name="regDate"
							value='<fmt:formatDate 
					pattern = "yyyy/MM/dd" value = "${board.regdate}" />'
							readonly="readonly">
					</div>

					<div class="form-group">
						<label>Update Date</label> <input class="form-control"
							name="updateDate"
							value='<fmt:formatDate 
					pattern = "yyyy/MM/dd" value = "${board.updateDate}" />'
							readonly="readonly">
					</div>
					
					<button type="submit" data-oper='modify' class="btn btn-success">Modify</button>
					
					
					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
					<button type="submit" data-oper='list' class="btn btn-info">List</button>
					<button onClick="history.go(-3)" class="btn btn-info">돌아가기</button>
					<input name="${_csrf.parameterName}" type="hidden"  value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		/* 문서가 준비 됐다면, 아래 함수 수행. */
		var formObj = $("form");/* 문서중 form 요소를 찾아서 변수에 할당. */
		$('button').on("click", function(e) {
			/* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를 전달하면서 */
			//e.preventDefault();/* 기본 이벤트 동작 막기. */
			var operation = $(this).data("oper");
			/* 버튼에서 oper 속성 읽어서 변수에 할당. */
			console.log(operation);
			/* 브라우저 로그로 oper값 출력. */

			if (operation === 'remove') {
				formObj.attr("action", "/board/remove");
				/* form에 액션 속성을 변경. */
			} else if (operation === 'list') {
				/* self.location = "/board/list";
				return; */
				formObj.attr("action","/board/list").attr("method","get");
				
				var pageNumTag
				=$("input[name='pageNum']").clone();
				var amountTag
				=$("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				formObj.empty();//폼의 내용들 비우기.
				/* 페이지를 이동하고 진행 중지. */
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				// 수정시 필요했던 여러가지 정보들 중에서,
				// 페이지번호와 페이지당 게시물수 값만 남기고 지우기.
				// 그 다음에 목록으로 이동.
				formObj.append(keywordTag);
				formObj.append(typeTag);


			}
			formObj.attr("onsubmit","return true").submit();
			/* 위의 조건이 아니라면 수정 처리. */
		});
	});
</script>





<%@ include file="../includes/footer.jsp"%>