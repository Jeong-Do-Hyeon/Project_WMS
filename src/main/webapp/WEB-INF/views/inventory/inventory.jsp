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
  
  <style>
  	table, th, td {
  	border: 0.5px solid black;
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
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
   	<table id="impTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong>상품이름</strong></td>
    			<td class="text-center"><strong>판매이름</strong></td>
    			<td class="text-center"><strong>공급처</strong></td>
    			<td class="text-center"><strong>세부공급처</strong></td>
    			<td class="text-center"><strong>입고장소</strong></td>
    			<td class="text-center"><strong>입고위치</strong></td>
    			<td class="text-center"><strong>재고수량</strong></td>
    			<td class="text-center"><strong>입고일자</strong></td>
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
