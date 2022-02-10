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
    <!-- Main content -->
    <section class="content container-fluid">

      <h3>사용자추가</h3>
      <form id="adduserform" action="/usertable/adduser" method="post">
	      <table>
	      	<tr>
	      		<th>아이디(최대 15자)</th>
	      		<td><input type="text" id="id" name="id" maxlength="15"></td>
	      	</tr>
	      	<tr>
	      		<th>비밀번호(최대 20자)</th>
	      		<th><input type="password" id="passwd" name="passwd" maxlength="20"></th>
	      	</tr>
	      	<tr>
	      		<th>비밀번호확인</th>
	      		<th><input type="password" id="passwdcheck" name="passwdcheck" maxlength="20"></th>
	      	</tr>
	      	<tr>
	      		<th><button type="button" id="btnadduser" name="btnadduser">사용자추가</button></th>
	      		<th><button type="reset">취소</button></th>
	      	</tr>
	      </table>
      </form>
      

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

  $(document).ready(function(){

    //아이디중복체크
    $("#btnadduser").on("click", function(){

      let id = $("#id");
      let passwd = $("#passwd");
      let passwdcheck = $("#passwdcheck")

      if(id.val() == "" || id.val() == null){
        alert("아이디를 입력하세요");
        id.focus();
        return false;
      }

      $.ajax({
        url: '/usertable/checkID',
        type: 'get',
        dataType: 'text',
        data: { id : id.val() },
        success: function(data){
          
          if(data == "N"){
        	alert("아이디 사용불가");
            id.val("");
            return false;
          }
          
          if (passwd.val() != passwdcheck.val()){
           	alert("비밀번호 불일치");
           	passwd.val("");
           	passwdcheck.val("");
           	$("#passwd").focus();
           	return false; 
          }
          
          $("#adduserform").submit();
          
          }
        
        });
      
      
      
      });
    });  
  
</script>  

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

</body>
</html>
