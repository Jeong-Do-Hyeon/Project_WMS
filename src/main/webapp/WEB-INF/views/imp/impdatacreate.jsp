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
  
  <!-- 테이블 행 추가 기능 -->
  <script>
  	function rowAdd(){
  		var trCnt = $('#impTable tr').length;
  		var innerHtml = "";
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;" id="'+trCnt+'">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" id="check" name="check" class="check"></td>';
  		innerHtml += '	<td class="text-center" name="new">New</td>';
  		innerHtml += '	<td class="text-center"></td>';
  		innerHtml += '	<td class="text-center"><input type="hidden" id="impnum" name="impnum" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="supply1" name="supply1" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="date" pattern="\d{4}-\d{2}-\d{2}" id="impdate" name="impdate" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="note" name="note" style="width:100%; border:0;"/></td>';
  		
  		$('#impTable').append(innerHtml);
  	}
  </script>
  
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
  		
  		let impnum;
  		
  		// 클릭시 하위메뉴 보여주는 구문
  		$("#impTable tr").on("click","input[name=d_impnum]", function(){
  			
  			console.log($(this).val());
  			
  			impnum = $(this).val();
  			
  			$("#impsubdata").load("/subdata/subimp?impnum="+$(this).val());
  			
  		});
  		
  		
  		
  		$("#save").on("click", function(){
  			if($(".check:checked").length ==0){
  				alert("등록할 주문을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 주문을 등록하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let supply1Arr = []
  			let impdateArr = []
  			let noteArr = []
  	
  			
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
  				
  				let supply1 = (tr.find("[name=supply1]").val());
  				let impdate = (tr.find("[name=impdate]").val());
  				let note = (tr.find("[name=note]").val());
  				
  	  			
  	  		
				if(note == ""){
					note = " ";
				}
  	  		
  	  			supply1Arr.push(supply1);
  	  			impdateArr.push(impdate);
  	  			noteArr.push(note);
  	  			
  			
  			});
  			
  			$.ajax({
  				url : '/imp/checkAdd',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					supply1Arr : supply1Arr,
  					impdateArr : impdateArr,
  					noteArr : noteArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 주문이 등록되었습니다")
  					}
  				}
  			
  			})
  			
  			
  			
  			
  		})
  		
  		$("#delete").on("click", function(){
  			if($(".check:checked").length ==0){
  				alert("삭제할 주문을 선택하세요")
  				return;
  			}
  			
  			let isDel = confirm("선택한 주문을 삭제하시겠습니까?");
  			
  			if(!isDel) return;
  			
  			let impnumArr = []
  	
  			
  			$(".check:checked").each(function(){
				let tr = $(this).parent().parent();

  				let impnum  = (tr.find("[name=d_impnum]").val());
  				
  				console.log(impnum);
  				
  	  			impnumArr.push(impnum);
  			
  			});
  			
  			$.ajax({
  				url : '/imp/checkDel',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					impnumArr : impnumArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 주문이 삭제되었습니다")
  					}
  				}
  			
  			})
  			
  			
  			
  			
  		})
  		
  		$("#modify").on("click",function(){
  			if($(".check:checked").length == 0){
  				alert("수정할 주문을 선택하세요")
  				return;
  			}
  			
			let isModify = confirm("선택한 주문을 수정하시겠습니까?");
  			
  			if(!isModify) return;
  			let impnumArr = []
  			let supply1Arr = []
  			let impdateArr = []
  			let noteArr = []
  	
  			
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
  				
  				let impnum = (tr.find("[name=d_impnum]").val());
  				let supply1 = (tr.find("[name=d_supply1]").val());
  				let impdate = (tr.find("[name=d_impdate]").val());
  				let note = (tr.find("[name=d_note]").val());
  			
  	  			
  	  		
  			// $(".check:checked").each(function(){
  				
  			//	let tr = $(this).parent().parent();
  				
  				
  			//	let supply1 = $(this).val();
  	  		//	let impdate = $(this).next().val();
  	  		//	let note = $(this).next().next().val();

  	  			impnumArr.push(impnum);
  	  			supply1Arr.push(supply1);
  	  			impdateArr.push(impdate);
  	  			noteArr.push(note);
  	  			
  			});
  			
  			
  			$.ajax({
  				url : '/imp/checkModify',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					impnumArr : impnumArr,
  					supply1Arr : supply1Arr,
  					impdateArr : impdateArr,
  					noteArr : noteArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 주문이 수정되었습니다")
  					}
  				}
  			
  			})
  			
  			
  			
  		})
  		
  		
  		
  	});
 
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
    
    <table id="impTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="checkAll" name="checkAll"></strong></td>
    			<td class="text-center"><strong>No.</strong></td>
    			<td class="text-center"><strong>입고상태</strong></td>
    			<td class="text-center"><strong>입고번호</strong></td>
    			<td class="text-center"><strong>공급처</strong></td>
    			<td class="text-center"><strong>입고일자</strong></td>
    			<td class="text-center"><strong>비고</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${impdatacreate}" var="ImpVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" class="check" value="${ImpVO.impnum}">
    			</td>
    			<td>
    			</td>
    			<td>
    			</td>
    			<td>
    				<input type="text" name="d_impnum" value='<c:out value="${ImpVO.impnum}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_supply1" value='<c:out value="${ImpVO.supply1}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center"> 
    				<input type="date" name="d_impdate" value='<fmt:formatDate value="${ImpVO.impdate}" pattern="yyyy-MM-dd" />' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_note" value='<c:out value="${ImpVO.note}"></c:out>' style="width:100%; border:0; text-align:center;">
    				<input type="hidden" name="d_impnum" value='<c:out value="${ImpVO.impnum}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    </section>  
  </div>
  
  <div id="impsubdata">
  	
  </div>
  
  
  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

</body>
</html>
