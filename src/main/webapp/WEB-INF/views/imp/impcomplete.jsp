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
	  
	  $("#checkAll").on("click", function(){
			$(".check").prop("checked", this.checked);
			
			isCheck = this.checked;
			
		});
		
		$(".check").on("click", function(){
			return;
			$("#checkAll").prop("checked",this.checked);
		
		
			$(".check").each(function(i,e){
				if(!$(e).is(":checked")){
					isCheck = false;
					if(isCheck) $("#checkAll").prop("checked", isCheck);
			}
				
				console.log("체크박스: " + isCheck);
				
			});
			
		});
  
  	$("#import").on("click", function(){
		if($(".check:checked").length ==0){
			alert("입고할 상품을 선택하세요")
			return;
		}
		
		let isAdd = confirm("선택한 상품을 입고하시겠습니까?");
		
		if(!isAdd) return;

		let impitemnameArr = []
		let itemnameArr = []
		let impdepotArr = []
		let implocationArr = []
		let quantityArr = []
		let impdateArr = []

		
		$(".check:checked").each(function(){
			let tr = $(this).parent().parent();
			//console.log(tr.find("#supply1").val());
			//console.log(tr.find("#impdate").val());
			//console.log(tr.find("#note").val());
			
			//let supply1 = tr.find("#supply1").val();
			//let impdate = tr.find("#impdate").val();
			//let note = tr.find("#note").val();
			
		
			
			//let tr = $(this).parent().parent();
			//console.log(tr.find("[name=supply1]").val());
			
			let impitemname = (tr.find("[name=d_impitemname]").val());
			let itemname = (tr.find("[name=d_itemname]").val());
			let impdepot = (tr.find("[name=d_impdepot]").val());
			let implocation = (tr.find("[name=d_implocation]").val());
			let quantity = (tr.find("[name=d_quantity]").val());
			let impdate = (tr.find("[name=d_impdate]").val());
			
  			
  		
  			impitemnameArr.push(impitemname);
  			itemnameArr.push(itemname);
  			impdepotArr.push(impdepot);
  			implocationArr.push(implocation);
  			quantityArr.push(quantity);
  			impdateArr.push(impdate);
  			
		
		});
		
		$.ajax({
			url : '/imp/impcomplete',
			type: 'post',
			dataType : 'text',
			data: {
				
				impitemnameArr : impitemnameArr,
	  			itemnameArr : itemnameArr,
	  			impdepotArr : impdepotArr,
	  			implocationArr : implocationArr,
	  			quantityArr : quantityArr,
	  			impdateArr : impdateArr
			},
			success: function(data){
				if(data == "success"){
					alert("선택된 상품이 입고되었습니다")
				}
			}
		
		})
		
	})
  })
  
  
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
    
    <button id="search">검색</button>
    <button id="import">입고</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="impTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="checkAll" name="checkAll" onclick='selectAll(this)'></strong></td>
    			<td class="text-center"><strong>입고번호</strong></td>
    			<td class="text-center"><strong>상품이름</strong></td>
    			<td class="text-center"><strong>판매이름</strong></td>
    			<td class="text-center"><strong>입고예정수량</strong></td>
    			<td class="text-center"><strong>입고수량</strong></td>
    			<td class="text-center"><strong>입고장소</strong></td>
    			<td class="text-center"><strong>입고위치</strong></td>
    			<td class="text-center"><strong>입고일자</strong></td>
    		</tr>
    	</thead>
    	<tbody>
		<c:forEach items="${impcomplete}" var="ImpSubVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" class="check" value="${ImpSubVO.impnum}">
    			</td>
    			<td>
    				<input type="text" name="d_impnum" value='<c:out value="${ImpSubVO.impnum}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td>
    				<input type="text" name="d_impitemname" value='<c:out value="${ImpSubVO.impitemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td>
    				<input type="text" name="d_itemname" value='<c:out value="${ImpSubVO.itemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
					<input type="text" name="d_itemquantity" value='<c:out value="${ImpSubVO.itemquantity}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center"> 
					<input type="text" name="d_quantity" style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_impdepot" style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_implocation" style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="date" name="d_impdate" style="width:100%; border:0; text-align:center;">
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
