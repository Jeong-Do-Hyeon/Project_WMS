<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
  
  	$(document).ready(function(){
  	
		$("#expTable tr").on("click","input[name=d_expnum]", function(){
  			
  			console.log($(this).val());
  			
  			impnum = $(this).val();
  			
  			$("#expsubdata").load("/expsubdata/subexp?expnum="+$(this).val());
  			
  		});
  
  
  		
		$("#assignment").on("click", function(){
			if($(".check:checked").length ==0){
  				alert("할당할 주문을 선택하세요")
  				return;
			}
			
			let isAssignment = confirm("선택한 주문을 할당하시겠습니까?");	

  			let expitemnameArr = []
  			let itemnameArr = []
  			let expquantityArr = []
			
				
				let tr = $(this).parent().parent();
				let expnum = (tr.find("[name=d_expnum]").val());
			
			
			$(".subcheck").each(function(){
				
				let tr = $(this).parent().parent();
					
				let expitemname = (tr.find("[name=d_expitemname]").val());
				let itemname = (tr.find("[name=d_itemname]").val());
				let expquantity = (tr.find("[name=d_expquantity]").val());
			
				expitemnameArr.push(expitemname);
				itemnameArr.push(itemname);
				expquantityArr.push(expquantity);
			
			});
			
			console.log(expitemnameArr);
			console.log(itemnameArr);
			console.log(expquantityArr);
			console.log(expnum);
			
			$.ajax({
  				url : '/exp/exppickchoice',
  				type : 'post',
  				dataType : 'text',
  				data : {
  					expnum:expnum,
  					expitemnameArr:expitemnameArr,
  	  	  			itemnameArr:itemnameArr,
  	  	  			expquantityArr:expquantityArr,
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 주문이 할당되었습니다.")
  					}
  				}
  				
  			})
			
			
  	});
  	});
 
  </script>
  
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
    
    <button id="assignment">할당</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="expTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" name="check"></strong></td>
    			<td class="text-center"><strong>출고번호</strong></td>
    			<td class="text-center"><strong>출고처</strong>
    			<td class="text-center"><strong>출고일자</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${exppickchoice}" var="ExpVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight=600;">
    			<td class="text-center">
    				<input type="checkbox" class="check" value="${ExpVO.expnum}">
    			</td>
				<td>
    				<input type="text" name="d_expnum" value='<c:out value="${ExpVO.expnum}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center; " readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expcomname" value='<c:out value="${ExpVO.expcomname}"></c:out>' style="width:100%; border:0; text-align:center;" readonly>
    			</td>
    			<td>
    				<input type="date" name="d_expdate" value='<fmt:formatDate value="${ExpVO.expdate}" pattern="yyyy-MM-dd" />' style="width:100%; border:0; text-align:center;" readonly>
    			</td>
    			</tr>
    		</c:forEach>
    	</tbody>
    </table>

    </section>
    <!-- /.content -->
  </div>

  <div id="expsubdata">
  	
  </div>
  
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
