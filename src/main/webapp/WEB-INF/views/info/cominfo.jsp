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
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" id="check" name="check" class="check"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="comname" name="comname" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="comperson" name="comperson" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="comaddr" name="comaddr" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="telnumber" name="telnumber" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="note" name="note" style="width:100%; border:0;"/></td>';
  		
  		$('#cominfoTable').append(innerHtml);
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
  		
  		
  		
  		$("#save").on("click", function(){
  			if($(".check:checked").length ==0){
  				alert("등록할 라인을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 라인을 등록하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let comnameArr = []
  			let compersonArr = []
  			let comaddrArr = []
  			let telnumberArr = []
  			let noteArr = []
  	
  			
  			$(".check:checked").each(function(){
				let tr = $(this).parent().parent();
  				
  				let comname = (tr.find("[name=d_comname]").val());
  				let comperson = (tr.find("[name=d_comperson]").val());
  				let comaddr = (tr.find("[name=d_comaddr]").val());
  				let telnumber = (tr.find("[name=d_telnumber]").val());
  				let note = (tr.find("[name=d_note]").val());
  				
  	  			
  	  		
				if(note == ""){
					note = " ";
				}
  	  		
  	  			comnameArr.push(comname);
  	  			compersonArr.push(comperson);
  	  			comaddrArr.push(comaddr);
  	  			telnumberArr.push(telnumber);
  	  			noteArr.push(note);
  	  			
  			
  			});
  			
  			$.ajax({
  				url : '/info/checkAdd',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					comnameArr : comnameArr,
  	  	  			compersonArr : compersonArr,
  	  	  			comaddrArr : comaddrArr,
  	  	  			telnumberArr : telnumberArr,
  	  	  			noteArr : noteArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 라인이 등록되었습니다")
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
  			
  			let infonumArr = []
  	
  			
  			$(".check:checked").each(function(){
				let tr = $(this).parent().parent();

  				let infonum = (tr.find("[name=d_infonum]").val());
  				
  				console.log(infonum);
  				
  	  			infonumArr.push(infonum);
  			
  			});
  			
  			$.ajax({
  				url : '/info/checkdel',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					infonumArr : infonumArr
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
  			
  			let infonumArr = []
  			let comnameArr = []
  			let compersonArr = []
  			let comaddrArr = []
  			let telnumberArr = []
  			let noteArr = []
  	
  			
  			$(".check:checked").each(function(){
				let tr = $(this).parent().parent();
		
  				let infonum = (tr.find("[name=d_infonum]").val());
				let comname = (tr.find("[name=d_comname]").val());
  				let comperson = (tr.find("[name=d_comperson]").val());
  				let comaddr = (tr.find("[name=d_comaddr]").val());
  				let telnumber = (tr.find("[name=d_telnumber]").val());
  				let note = (tr.find("[name=d_note]").val());
  			
  	  			
  				if(note == ""){
					note = " ";
				}
  	  		
  				infonumArr.push(infonum);
  	  			comnameArr.push(comname);
  	  			compersonArr.push(comperson);
  	  			comaddrArr.push(comaddr);
  	  			telnumberArr.push(telnumber);
  	  			noteArr.push(note);
  	  			
  			});
  			
  			console.log(infonumArr);
  			
  			
  			$.ajax({
  				url : '/info/checkModify',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					infonumArr : infonumArr,
  					comnameArr : comnameArr,
  	  	  			compersonArr : compersonArr,
  	  	  			comaddrArr : comaddrArr,
  	  	  			telnumberArr : telnumberArr,
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
    
    <table id="cominfoTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="checkAll" name="checkAll"></strong></td>
    			<td class="text-center"><strong>회사명</strong></td>
    			<td class="text-center"><strong>수취인</strong></td>
    			<td class="text-center"><strong>주소</strong></td>
    			<td class="text-center"><strong>전화번호</strong></td>
    			<td class="text-center"><strong>비고</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${cominfo}" var="ComInfoVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" name="d_infonum" class="check" value="${ComInfoVO.infonum}">
    			</td>
    			<td>
    				<input type="text" name="d_comname"	value='<c:out value="${ComInfoVO.comname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    			<td>
    				<input type="text" name="d_comperson" value='<c:out value="${ComInfoVO.comperson}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" >
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_comaddr" value='<c:out value="${ComInfoVO.comaddr}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    			<td class="text-center"> 
    				<input type="text" name="d_telnumber" value='<c:out value="${ComInfoVO.telnumber}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    			<td class="text-center"> 
    				<input type="text" name="d_note" value='<c:out value="${ComInfoVO.note}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    </section>  
  </div>
  <!-- Main Footer (기타 footer태그밑에 소스포함)-->
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

</body>
</html>