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
    <button id="printforpdf">PDF출력</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="expTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" name="check"></strong></td>
    			<td class="text-center"><strong>출고번호</strong></td>
    			<td class="text-center"><strong>출고처</strong>
    			<td class="text-center"><strong>수취인</strong>
    			<td class="text-center"><strong>주소</strong>
    			<td class="text-center"><strong>전화번호</strong>
    			<td class="text-center"><strong>출고수단</strong>
    			<td class="text-center"><strong>출고일자</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${expdataprint}" var="ExpVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight=600;">
    			<td class="text-center">
    				<input type="checkbox" class="check" value="${ExpVO.expnum}">
    			<td>
    				<input type="text" name="d_expnum" value='<c:out value="${ExpVO.expnum}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expcomname" value='<c:out value="${ExpVO.expcomname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expcomperson" value='<c:out value="${ExpVO.expcomperson}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expaddr" value='<c:out value="${ExpVO.expaddr}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_telnumber" value='<c:out value="${ExpVO.telnumber}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expmethod" value='<c:out value="${ExpVO.expmethod}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="date" name="d_expdate" value='<fmt:formatDate value="${ExpVO.expdate}" pattern="yyyy-MM-dd" />' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
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
