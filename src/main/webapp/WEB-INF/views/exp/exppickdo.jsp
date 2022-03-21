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
  
   <!-- 체크박스 선택 시 삭제 기능 -->
  <script>
  
  	$(document).ready(function(){
  		
  		
  		let isCheck = true;
  		
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
  		
  		$("#picking").on("click", function(){
  			if($(".check:checked").length ==0){
  				alert("피킹할 상품을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 상품을 피킹하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let expnumArr = []
			let expitemnameArr = []
			let itemnameArr = []
			let expquantityArr = []
  			
  			$(".check:checked").each(function(){
  				
  				let tr = $(this).parent().parent();
  				
  				let expnum = (tr.find("[name=d_expnum]").val());
  				let expitemname = (tr.find("[name=d_expitemname]").val());
  				let itemname = (tr.find("[name=d_itemname]").val());
  				let expquantity = (tr.find("[name=d_expquantity]").val());
  				
  				console.log(expnum);
  				console.log(expitemname);
  				console.log(itemname);
  				console.log(expquantity);
  				
  				expnumArr.push(expnum);
  				expitemnameArr.push(expitemname);
  				itemnameArr.push(itemname);
  				expquantityArr.push(expquantity);
  				
  				
  			})
  			
  			
  			$.ajax({
  				url : '/exp/exppickdo',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					expnumArr : expnumArr,
  					expitemnameArr : expitemnameArr,
  					itemnameArr : itemnameArr,
  					expquantityArr : expquantityArr,
  					
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 상품이 피킹되었습니다")
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
    <button id="picking">피킹</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="expTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="checkAll" name="checkAll" onclick='selectAll(this)'></strong></td>
    			<td class="text-center"><strong>출고번호</strong></td>
    			<td class="text-center"><strong>상품이름</strong></td>
    			<td class="text-center"><strong>판매이름</strong></td>
    			<td class="text-center"><strong>출고수량</strong>
    			<!-- <td class="text-center"><strong>출고일자</strong></td>-->
    		</tr>
    	</thead>
    	<tbody>
    	<c:forEach items="${exppickdoList}" var="ExpSubVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" class="check">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_expnum" value='<c:out value="${ExpSubVO.expnum}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_expitemname" value='<c:out value="${ExpSubVO.expitemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_itemname" value='<c:out value="${ExpSubVO.itemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_expquantity" value='<c:out value="${ExpSubVO.expquantity}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<!-- <td class="text-center"> 
    				<input type="date" name="d_impdate" value='<fmt:formatDate value="${ImpVO.impdate}" pattern="yyyy-MM-dd" />' style="width:100%; border:0; text-align:center;">
    			</td> -->
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
