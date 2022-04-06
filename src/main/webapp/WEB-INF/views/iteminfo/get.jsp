<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<!-- css, js 파일포함 -->
<!-- 절대경로  /WEB-INF/views/include/header_info.jsp -->
<%@include file="/WEB-INF/views/include/header_info.jsp" %>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@include file="/WEB-INF/views/include/header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/include/left_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        	제품상세정보
      </h1>
      
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | 글쓰기 폼 | BoardVO클래스의 필드명을 참고.
        -------------------------->
     <div class="row">
      <div class="col-md-12">   
       <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">제품상세정보</h3>
            </div>
            <!-- /.box-header -->
            
              <div class="box-body">
                <div class="form-group">
                  <label for="bno">Bno</label>
                  <input type="text" class="form-control" id="bno" name="bno" value="${board.bno }" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="title">Title</label>
                  <input type="text" class="form-control" id="title" name="title" value="${board.title }" readonly="readonly">
                </div>
                <div class="form-group">
                  <label for="content">Text area</label>
                  <%--<textarea class="form-control" rows="3" id="content" name="content" readonly="readonly">${board.content }</textarea> --%>
                  <div>${ board.content}</div>
                </div>
                <div class="form-group">
                  <label for="writer">Writer</label>
                  <input type="text" class="form-control" id="writer" name="writer" value="${board.writer }" readonly="readonly">
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button id="btnModify" type="button" data-bno="${board.bno }" class="btn btn-primary">Modify</button>
                <button id="btnList" type="button" class="btn btn-info">List</button>


                <form id="operForm" action="/iteminfo/modify" method="get">
                  <input type="hidden" id="bno" name="bno" value='<c:out value="${ board.bno}" />'>
                  <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }" />'>
                  <input type="hidden" name="amount" value='<c:out value="${cri.amount }" />'>
                  <input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
                  <input type="hidden" name="keyword" value='<c:out value="${cri.keyword }" />'>
                  
                </form>

              </div>
          
          </div>
        </div>
       
        
	</div>
	
  <!--원본이미지 출력-->
  <div class='bigPictureWrapper'>
    <div class='bigPicture'>
    </div>
  </div>


<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>
	
 <!-- 첨부파일목록 출력부분-->
	<div class="row">
		<div class="col-md-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Files</h3>
				</div>
				<div class="box-body">
					<div class="uploadResult">
            			<ul></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS(with jquery) -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>



<script>

  $(document).ready(function(){

    let operForm = $("#operForm");

    //수정 버튼 클릭시 동작
    $("#btnModify").on("click", function(){
      operForm.submit();
    });

    //목록 버튼 클릭시 동작
    $("#btnList").on("click", function(){
    	operForm.find("#bno").remove();
        operForm.attr("action", "/iteminfo/list");
        operForm.submit();
    });
  });



//첨부파일 목록 가져오기
$(document).ready(function(){

  let bno = '${ board.bno}'; //현재 게시물 번호

  $.getJSON("/iteminfo/getAttachList", {bno: bno}, function(arr){

	//1) 
	console.log(arr); // BoardAttachVO클래스
    
    showUploadResult(arr);
  });
  
  
//첨부된 파일정보를 이용하여, 화면에 파일목록을 출력하는 작업
  function showUploadResult(uploadResultArr){

    if(!uploadResultArr || uploadResultArr.length == 0){return;}

    let uploadUL = $(".uploadResult ul");

    let str = "";

    $(uploadResultArr).each(function(i, obj) {

      if(obj.fileType){
        //이미지파일출력
        let fileCalPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
        str += "<li data-path='" + obj.uploadPath + "'";
        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.fileType + "'>";
        str += "<div>";
        str += "<span>" + obj.fileName + "</span>";
        str += "<img src='/display?fileName=" + fileCalPath + "'>";
        str += "</div>";
        str += "</li>";



      }else{
        //일반파일출력
        let fileCalPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
        let fileLink = fileCalPath.replace(new RegExp(/\\/g), "/");
        
        str += "<li data-path='" + obj.uploadPath + "'";
        str += " data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName +"' data-type='" + obj.fileType + "'>";
        str += "<div>";
        str += "<span>" + obj.fileName + "</span>";
        str += "<img src='/resources/img/attach.png'>";
        str += "</div>";
        str += "</li>";
      }
    });
	//2)
    console.log(str);

    uploadUL.append(str);

  }
  

  // 게시물조회페이지(get.jsp)에서 첨부파일목록의 클릭시 1)이미지 : 원본이미지 출력 2)일반파일 : 다운로드
  $(".uploadResult").on("click", "li", function(e){

    console.log("veiw image");

    let liObj = $(this);

    let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

    if(liObj.data("type")){
      //원본이미지 보여주기
      showImage(path.replace(new RegExp(/\\/g), "/"));
    }else{
      //일반파일 : 다운로드
      self.location = "/download?fileName="+path;
    }

  });

  function showImage(fileCalPath){
    alert(fileCalPath);

    $(".bigPictureWrapper").css("display", "flex").show();
    $(".bigPicture")
      .html("<img src='/display?fileName=" + fileCalPath + "'>")
      .animate({width: '100%', height: '100%'}, 1000);

  }

  $(".bigPictureWrapper").on("click", function(){
    $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);

    setTimeout(function(){
      $(".bigPictureWrapper").hide();
    }, 1000);
  });

});

</script>

<!-- Modal Dialog-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Reply Add</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="replyer" class="col-form-label">replyer:</label>
            <input type="text" class="form-control" id="replyer" name="replyer">
            <input type="hidden" class="form-control" id="replybno" name="replyerbno">
          </div>
          <div class="form-group">
            <label for="reply" class="col-form-label">reply:</label>
            <textarea class="form-control" id="reply" name="reply"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnReplyWrite">write</button>
        <button type="button" class="btn btn-primary" id="btnReplyModify">modify</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal Dialog-->
</body>
</html>
