<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="../includes/header.jsp"%>


<div class="row">
   <div class="col-lg-12">
      <h1 class="page-header">글 읽기</h1>
   </div>
</div>


<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">

         <div class="panel-heading"></div>

         <div class="panel-body" style="margin: 0px 20%;">
         	
         	<div class="form-group">
               카테고리 <input class="form-control" name="bno"
                  value='<c:out value="${board.bid }"/>' readonly="readonly">
            </div>

            <div class="form-group">
               게시물 번호 <input class="form-control" name="bno"
                  value='<c:out value="${board.bno }"/>' readonly="readonly">
            </div>

            <div class="form-group">
               제목 <input class="form-control" name="title"
                  value='<c:out value="${board.title }"/>' readonly="readonly">
            </div>

            <div class="form-group">
               내용
               <textarea rows="3" class="form-control" name="content"
                  readonly="readonly"><c:out value="${board.content }" /></textarea>
            </div>

            <div class="form-group">
               작성자<input class="form-control" name="writer"
                  value='<c:out value="${board.writer }"/>' readonly="readonly">
            </div>

            <button data-oper="modify" class="btn btn-warning">Modify</button>
            <button data-oper="list" class="btn btn-info">List</button>
            <button onClick="history.go(-1)" class="btn btn-info">돌아가기</button>
            


            <form id="operForm" action="/board/modify" method="get">
               <input type="hidden" id="bno" name="bno" value="${board.bno }" />
               <input type="hidden" name="pageNum" value="${cri.pageNum }" /> <input
                  type="hidden" name="amount" value="${cri.amount }" /> <input
                  type="hidden" name="type" value="${cri.type }"> <input
                  type="hidden" name="keyword" value="${cri.keyword }">
            </form>

         </div>
      </div>
   </div>
</div>

<br/>
<div class="row">
<div class="col-lg-12">
<div class="panel panel-default">
<div class="panel-heading">첨부파일</div>
<div class="panel-body">
<div class="uploadResult">
<ul></ul>
</div>
</div>
</div>
</div>
</div>


<!-- 덧글 시작 -->
<br />
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">

            <i class="fa fa-comments fa-fw"></i>Reply
            <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">
               new reply</button>
         </div>

         <br />
         <div class="panel-body">
         	

            <ul style="list-style: none;" class="chat">
               <!-- start reply -->
               <li class="left clearfix" data-rno='8'>
                  <div class="header">
                     <strong class="primary-font">  </strong> 
                     <small  class="pull-right text-muted">  </small>
                  </div>
                  <p> </p>
                   
                  
               </li>
               <!-- end reply  -->
             
            </ul>
            <!-- /end ul -->
            
         </div>
         <div class="panel-footer">
         	
         
         
         </div>
      </div>


      <!-- 덧글 끝 -->


      <!-- Modal 추가 -->
      <div  class="modal fade" id="modal" tabindex="-1" role="dialog" 
         aria-labelledby="myModalLabel" aria-hidden="true">
         <div class="modal-dialog" style="margin-top: 30%;">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">덧글 창</h4>
               </div>
               
               <div class="modal-body" >
               
                  <div class="form-group">
                     <label>덧글</label>
                     <input type="textarea" class="form-control" name="reply" value="새 덧글 ">
                  </div>
                  
                  <div  class="form-group" >
                     <label >작성자</label>
                     <input class="form-control" name="replyer" value="replyer">
                  </div>
                  
                  <div class="form-group" id=rDate>
                     <label>덧글 작성일</label>
                     <input class="form-control" name="replyDate" value="">
                  </div>
               </div>
               <div class="modal-footer">
                  <button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
                  <button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
                  <button id="modalRegisterBtn" type="button" class="btn btn-primary">등록</button>
                  <button id="modalCloseBtn" type="button" class="btn btn-default"
                  data-dismiss='modal'>닫기</button>
               </div>
            </div>
         </div>
      </div>


      <script type="text/javascript" src="/resources/js/reply.js"></script>

      <script>
         $(document).ready(function() {
            var bnoValue = '<c:out value="${board.bno}"/>';
            var replyUL = $(".chat");

               showList(1);
               

               function showList(page) {
            	   console.log("show list " + page);
            	   replyService.getList({ bno : bnoValue, page : page || 1},
                   function(replyCnt,list) { 
            	   console.log("replyCnt : "+replyCnt);
            	   console.log(list);
            	   
            	   
            	   if(page== -1){
            		// 페이지 번호가 음수 값이라면,
            		pageNum=Math.ceil(replyCnt/10.0);
            		// 덧글의 마지막 페이지구하기.
            		showList(pageNum);
            		// 덧글 목록	새로고침(갱신)
            		return;
            		}           	   
            	   
            	   
            	   var str = "";
                   if (list == null || list.length == 0) {
                	  //replyUL.html("");
                      return;
                             }
                   for (var i = 0, len = list.length || 0; i < len; i++) {
                                             //console.log(list[i]);
                     str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                     str += " <div><div class='header'><strong  class='primary-font'>"+ list[i].replyer + "</strong>";
                     str += " <small class='pull-right text-mute'>"
                        + replyService.displayTime(list[i].replyDate)  + "</small></div>";
                     str += " <p>" + list[i].reply   + "</p></div></li>";
                       }
                                          replyUL.html(str);
                                          showReplyPage(replyCnt);

                                       });//end funtion
                                       
                        }//end showList
                        
               var pageNum=1;
               var replyPageFooter = $(".panel-footer");
               //.panel-footer
               function showReplyPage(replyCnt){
              		  var endNum = Math.ceil(pageNum/10.0)*10;
             		  var startNum = endNum-9;
               		  var prev=startNum != 1;
               		  var next=false;
               
               if(endNum *10 >= replyCnt){
              	  endNum = Math.ceil(replyCnt/10.0);
               }
               
               if(endNum * 10 < replyCnt){
             	  next=true;
               }
               
               var str ="<ul class='pagination pull-right>";               
               str+=" justify-content-center'>";
               
               if(prev){
           	    str+="<li class='page-item'><a class='page-link' href='";
               str+= (startNum-1);
               str+="'>이전</a></li>";
               }
               
               for(var i = startNum; i <= endNum; i++){
            	   
               var active = pageNum == i? "active":"";
               
               str += "<li class='page-item "+ active+"'><a class='page-link' "; 
               // 줄바꿈 주의 Uncaught SyntaxError
               str+="href='"+i+"'>"+i+"</a></li>";
               }
               
               if(next){
               str+="<li class='page-item'>";
               str+="<a class='page-link' href='";
               str+=(endNum+1)+"'>다음</a></li>";
               }
               
               str+="</ul></div>";
               console.log(str);
               
               replyPageFooter.html(str);
               }
               
               replyPageFooter.on("click","li a"
               ,function(e){
               e.preventDefault();
               var targetPageNum=$(this).attr("href");
               pageNum=targetPageNum;
               showList(pageNum);
               });
                        

                        var modal = $(".modal"); // 덧글 용 모달.
                        var modalInputReply = modal.find("input[name='reply']");
                        var modalInputReplyer = modal.find("input[name='replyer']");
                        var modalInputReplyDate = modal.find("input[name='replyDate']");
                        
                        var modalModBtn = $("#modalModBtn");
                        var modalRemoveBtn = $("#modalRemoveBtn");
                        var modalRegisterBtn = $("#modalRegisterBtn");
                        // 모달창 각 버튼도 변수 선언 및 할당.
                        
                                             
                        $("#addReplyBtn").on("click",function(e) {
                                       
                           modal.find("input").val("");
                           modal.find("input[id != 'replyer']").attr("readonly",false);
						   	
                           modalInputReplyDate.closest("div").hide();
                           
                           modal.find("button[id != 'modalCloseBtn']").hide(); 
                           
                           modalRegisterBtn.show(); // 등록 버튼은 보여라.
                           $(".modal").modal("show");// 모달 표시.
                     });
                        
                        modalRegisterBtn.on("click", function(e) {
							// 덧글 등록 버튼을 눌렀다면,
							var reply = {
								reply : modalInputReply.val(),
								replyer : modalInputReplyer.val(),
								bno : bnoValue
							}; // ajax로 전달할 reply 객체 선언 및 할당.
							replyService.add(reply, function(result) {
								alert(result);
								// ajax 처리후 결과 리턴.
								modal.find("input").val("");
								// 모달창 초기화
								modal.modal("hide");// 모달창 숨기기
								//showList(1); // 덧글 목록 갱신.
								showList(-1);
							});
						});   
                                              
                        
                        $(".chat").on("click","li",	function(e) {
							//클래스 chat 을 클릭하는데, 하위 요소가 li라면,
							console.log(rno);
						var rno = $(this).data("rno");
						replyService.get(rno, function(reply){
						modalInputReply.val(reply.reply);
						modalInputReplyer.val(reply.replyer).attr("readonly","readonly");
						modalInputReplyDate.closest("div").show();
						modalInputReplyDate.val(replyService.displayTime( reply.replyDate)).attr("readonly","readonly");
						modal.data("rno",reply.rno);
								
						modal.find(	"button[id !='modalCloseBtn']").hide();
						modalModBtn.show();
						modalRemoveBtn.show();
								// 버튼 보이기 설정.
								$(".modal").modal("show");
										
									});									
                        }); // end_reply_view
                        
                        modalModBtn.on("click", function(e) {
							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val()
							};
							replyService.update(reply, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});

						modalRemoveBtn.on("click", function(e) {
							var rno = modal.data("rno");
							
							replyService.remove(rno, function(result) {
								alert(result);
								modal.modal("hide");
								showList(1);
							});
						});
                        

            });// end_ready            
            
      </script>
      
      
      
      


      <script>
         $(document).ready(function() {
            /* 문서가 준비 됐다면, 아래 함수 수행. */
            var operForm = $("#operForm");/* 문서중 form 요소를 찾아서 변수에
                                                                                                                                                            할당. */
            $('button[data-oper="modify"]').on("click", function(e) {
               /* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를
                전달하면서 */
               operForm.attr("action", "/board/modify").submit();
            });
            $('button[data-oper="list"]').on("click", function(e) {
               /* 버튼이 클릭된다면 아래 함수 수행, e라는 이벤트 객체를
                전달하면서 */
               operForm.find("#bno").remove();
               operForm.attr("action", "/board/list").submit();
            });
         });
      </script>
      
<script>
	$(document).ready(function() {

					 (function() {var bno = '<c:out value="${board.bno}" />';
					 //화면상에 공유된 bno값 가져와 사용 준비.

						$.getJSON("/board/getAttachList",
											{bno : bno},
											function(arr) {console.log(arr);
												var str = "";

												$(arr).each(function(i, attach) 
														  {str += "<li data-path='";
	    	                                               str+=attach.uploadPath+"' data-uuid='";
	                                                       str+=attach.uuid+"' data-filename='";
	    	                                               str+=attach.fileName+"' data-type='";
	    	                                               str+=attach.fileType+"'><div>";
													       str+= "<img src='/resources/imges/attach.png'>";
														   str += "<span>" + attach.fileName + "</span><br/> ";
                                                           str += "</div></li>";
                                                           });
												$(".uploadResult ul").html(str);

											});
						})();// 즉시 실행 함수, 호출시 실행.
						
						
					 $(".uploadResult").on("click","li",function(e) {
							console.log("download file");
							var liObj = $(this);
							var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
							self.location="/download?fileName="+path;
						});
						
						
					});
	
	
	
</script>
      
      
      

      <%@include file="/WEB-INF/views/includes/footer.jsp"%>