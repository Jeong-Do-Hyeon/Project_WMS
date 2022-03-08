<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    			<td class="text-center"><strong>입고장소</strong></td>
    			<td class="text-center"><strong>입고위치</strong></td>
    			<td class="text-center"><strong>재고수량</strong></td>
    			<td class="text-center"><strong>입고일자</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${inventory}" var="InventoryVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="text" name="d_impitemname" value='<c:out value="${InventoryVO.impitemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_itemname" value='<c:out value="${InventoryVO.itemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_impdepot" value='<c:out value="${InventoryVO.impdepot}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center"> 
    				<input type="text" name="d_implocation" value='<c:out value="${InventoryVO.implocation}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_quantity" value='<c:out value="${InventoryVO.quantity}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_impdate" value='<fmt:formatDate value="${InventoryVO.impdate}" pattern="yyyy-MM-dd" />' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    		</tr>
    	</c:forEach>
    	</tbody>
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
