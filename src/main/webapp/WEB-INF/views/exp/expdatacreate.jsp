<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  		var trCnt = $('#expTable tr').length;
  		var innerHtml = "";
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;" id="'+trCnt+'">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" id="check" name="check" class="check"></td>';
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
  		
  		$("#save").on("click", function(){
  			if($(".check:checked").length ==0){
  				alert("등록할 주문을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 주문을 등록하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let expcomnameArr = []
			let expcompersonArr = []
			let expaddrArr = []
			let telnumberArr = []
			let expmethodArr = []
			let expdateArr = []
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
  				
  				let expcomname = (tr.find("[name=expcomname]").val());
  				let expcomperson = (tr.find("[name=expcomperson]").val());
  				let expaddr = (tr.find("[name=expaddr]").val());
  				let telnumber = (tr.find("[name=telnumber]").val());
  				let expmethod = (tr.find("[name=expmethod]").val());
  				let expdate = (tr.find("[name=expdate]").val());
  				let note = (tr.find("[name=note]").val());
  				
  	  			
  	  		
  			// $(".check:checked").each(function(){
  				
  			//	let tr = $(this).parent().parent();
  				
  				
  			//	let supply1 = $(this).val();
  	  		//	let impdate = $(this).next().val();
  	  		//	let note = $(this).next().next().val();
  	  		
  	  			expcomnameArr.push(expcomname);
  				expcompersonArr.push(expcomperson);
  				expaddrArr.push(expaddr);
  				telnumberArr.push(telnumber);
  				expmethodArr.push(expmethod);
  				expdateArr.push(expdate);
  				noteArr.push(note);

  	  			
  	  			return;
  			
  			});
  			
  			$.ajax({
  				url : '/exp/checkAdd',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					expcomnameArr : expcomnameArr,
  					expcompersonArr : expcompersonArr,
  					expaddrArr : expaddrArr,
  					telnumberArr : telnumberArr,
  					expmethodArr : expmethodArr,
  					expdateArr : expdateArr,
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
  			
  			let expcomnameArr = []
			let expcompersonArr = []
			let expaddrArr = []
			let telnumberArr = []
			let expmethodArr = []
			let expdateArr = []
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
  				
  				let expcomname = (tr.find("[name=expcomname]").val());
  				let expcomperson = (tr.find("[name=expcomperson]").val());
  				let expaddr = (tr.find("[name=expaddr]").val());
  				let telnumber = (tr.find("[name=telnumber]").val());
  				let expmethod = (tr.find("[name=expmethod]").val());
  				let expdate = (tr.find("[name=expdate]").val());
  				let note = (tr.find("[name=note]").val());
  				
  	  			
  	  		
  			// $(".check:checked").each(function(){
  				
  			//	let tr = $(this).parent().parent();
  				
  				
  			//	let supply1 = $(this).val();
  	  		//	let impdate = $(this).next().val();
  	  		//	let note = $(this).next().next().val();
  	  		
  	  			expcomnameArr.push(expcomname);
  				expcompersonArr.push(expcomperson);
  				expaddrArr.push(expaddr);
  				telnumberArr.push(telnumber);
  				expmethodArr.push(expmethod);
  				expdateArr.push(expdate);
  				noteArr.push(note);
  	  			
  	  			return;
  			
  			});
  			
  			$.ajax({
  				url : '/exp/checkDel',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					expcomnameArr : expcomnameArr,
  					expcompersonArr : expcompersonArr,
  					expaddrArr : expaddrArr,
  					telnumberArr : telnumberArr,
  					expmethodArr : expmethodArr,
  					expdateArr : expdateArr,
  					noteArr : noteArr				
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
  			
  			let expcomnameArr = []
			let expcompersonArr = []
			let expaddrArr = []
			let telnumberArr = []
			let expmethodArr = []
			let expdateArr = []
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
  				
  				
  				let expcomname = (tr.find("[name=expcomname]").val());
  				let expcomperson = (tr.find("[name=expcomperson]").val());
  				let expaddr = (tr.find("[name=expaddr]").val());
  				let telnumber = (tr.find("[name=telnumber]").val());
  				let expmethod = (tr.find("[name=expmethod]").val());
  				let expdate = (tr.find("[name=expdate]").val());
  				let note = (tr.find("[name=note]").val());
  	  			
  	  		
  			// $(".check:checked").each(function(){
  				
  			//	let tr = $(this).parent().parent();
  				
  				
  			//	let supply1 = $(this).val();
  	  		//	let impdate = $(this).next().val();
  	  		//	let note = $(this).next().next().val();
  	  		
  	  			expcomnameArr.push(expcomname);
  				expcompersonArr.push(expcomperson);
  				expaddrArr.push(expaddr);
  				telnumberArr.push(telnumber);
  				expmethodArr.push(expmethod);
  				expdateArr.push(expdate);
  				noteArr.push(note);
  	  			
  	  			return;
  			
  			});
  			
  			
  			$.ajax({
  				url : '/exp/checkModify',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					expcomnameArr : expcomnameArr,
  					expcompersonArr : expcompersonArr,
  					expaddrArr : expaddrArr,
  					telnumberArr : telnumberArr,
  					expmethodArr : expmethodArr,
  					expdateArr : expdateArr,
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
    
    <table id="expTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="checkAll" name="checkAll" onclick='selectAll(this)'></strong></td>
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
    	<tbody>
    		<c:forEach items="${expdatacreate}" var="ExpVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight=600;">
    			<td class="text-center">
    				<input type="checkbox" class="check" value="${ExpVO.expnum}">
    			</td>
    			<td>
    			</td>
    			<td>
    			</td>
    			<td>
    				<input type="text" name="d_expnum" value='<c:out value="${ExpVO.expnum}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_expcomname" value='<c:out value="${ExpVO.expcomname}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_expcomperson" value='<c:out value="${ExpVO.expcomperson}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_expmethod" value='<c:out value="${ExpVO.expmethod}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_expaddr" value='<c:out value="${ExpVO.expaddr}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_telnumber" value='<c:out value="${ExpVO.telnumber}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_expdate" value='<c:out value="${ExpVO.expdate}"></c:out>' style="width:100%; border:0;">
    			</td>
    			<td>
    				<input type="text" name="d_note" value='<c:out value="${ExpVO.note}"></c:out>' style="width:100%; border:0;">
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
