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
  
  <script>
  	function rowAdd(){
  		var trCnt = $('#expTable tr').length;
  		var innerHtml = "";
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" name="check"></td>';
  		innerHtml += '	<td class="text-center">'+trCnt+'</td>';
  		innerHtml += '	<td class="text-center"></td>';
  		innerHtml += '	<td class="text-center"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="expcomname" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="expcomperson" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="expmethod" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="expaddr" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="telnumber" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="date" name="expdate" style="width:100%; border:0;"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" name="note" style="width:100%; border:0;"></td>';
  		innerHtml += '</tr>';
  		
  		$('#expTable').append(innerHtml);
  	}
  </script>
  <script>
  	function rowDelete(){
  		$('#expTable').remove();
  	}
  
  </script>

  <style>
  	
  	/* table style */
  
  	table, th, td {
  	border: 1px solid gray;
	}
	
	/* input text style */
	
	input:focus, textarea:focus{     
	outline: none; 
	}
	
  </style>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/include/left_menu.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content container-fluid">
    
    <button id="search">검색</button>
    <button id="add" onclick="rowAdd();">라인추가</button>
    <button id="save">신규등록</button>
    <button id="modify">수정</button>
    <button id="delete">삭제</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="expTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" name="check"></strong></td>
    			<td class="text-center"><strong>No.</strong></td>
    			<td class="text-center"><strong>출고상태</strong></td>
    			<td class="text-center"><strong>출고번호</strong></td>
    			<td class="text-center"><strong>출고처</strong></td>
    			<td class="text-center"><strong>수취인</strong></td>
    			<td class="text-center"><strong>출고수단</strong></td>
    			<td class="text-center"><strong>주소</strong></td>
				<td class="text-center"><strong>전화번호</strong></td>
    			<td class="text-center"><strong>입고일자</strong></td>
    			<td class="text-center"><strong>비고</strong></td>
    		</tr>
    	</thead>
    </table>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

</body>
</html>
