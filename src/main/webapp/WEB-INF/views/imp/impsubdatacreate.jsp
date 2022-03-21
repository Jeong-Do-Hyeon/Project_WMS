<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="main-footer">


    <section class="content container-fluid">
 
    <!-- Content Header (Page header) -->
    <!-- Main content -->
  <script>
  	function rowsubAdd(){
  		var trCnt = $('#subimpTable tr').length;
  		var innerHtml = "";
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;" id="'+trCnt+'">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" id="subcheck" name="subcheck" class="subcheck"></td>';
  		innerHtml += '	<td class="text-center" name="new">New</td>';
  		innerHtml += '	<td class="text-center"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="impitemname" name="impitemname" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="itemname" name="itemname" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="itemquantity" name="itemquantity" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="itemprice" name="itemprice" style="width:100%; border:0;"/></td>';
  		
  		$('#subimpTable').append(innerHtml);
  	}
  </script>			
  
    <script>
  
  	$(document).ready(function(){
  		
  		let isCheck = true;
  		
  		$("#subcheckAll").on("click", function(){
  			$(".subcheck").prop("checked", this.checked);
  			
  			isCheck = this.checked;
  			
  		});
  		
  		$(".subcheck").on("click", function(){
  			return;
  			$("#subcheckAll").prop("checked",this.checked);
  		
  		
	  		$(".subcheck").each(function(i,e){
	  			if(!$(e).is(":checked")){
	  				isCheck = false;
	  				if(isCheck) $("#subcheckAll").prop("checked", isCheck);
  			}
	  			
	  			console.log("체크박스: " + isCheck);
  				
  			});
  			
  		});
  		
  		$("#subsave").on("click", function(){
  			if($(".subcheck:checked").length ==0){
  				alert("등록할 상품을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 상품을 등록하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let impnumArr = []
  			let impitemnameArr = []
  			let itemnameArr = []
  			let itemquantityArr = []
			let itempriceArr = []
  			
  			
  			$(".subcheck:checked").each(function(){
				let tr = $(this).parent().parent();
				//console.log(tr.find("#supply1").val());
				//console.log(tr.find("#impdate").val());
				//console.log(tr.find("#note").val());
				
				//let supply1 = tr.find("#supply1").val();
				//let impdate = tr.find("#impdate").val();
				//let note = tr.find("#note").val();
  				
  			
  				
  				//let tr = $(this).parent().parent();
  				//console.log(tr.find("[name=supply1]").val());
  				
  				let impnum = ${impnum};
  				let impitemname = (tr.find("[name=impitemname]").val());
  				let itemname = (tr.find("[name=itemname]").val());
  				let itemquantity = (tr.find("[name=itemquantity]").val());
  				let itemprice = (tr.find("[name=itemprice]").val());
  				
  				
 				impnumArr.push(impnum);
  	  			impitemnameArr.push(impitemname);
  	  			itemnameArr.push(itemname);
  	  			itemquantityArr.push(itemquantity);
  	  			itempriceArr.push(itemprice);
  	  			
  				console.log(impnumArr);
  	  			
  			});
  			
  			$.ajax({
  				url : '/subdata/checkAdd',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					impnumArr : impnumArr,
  					impitemnameArr:impitemnameArr,
  	  	  			itemnameArr:itemnameArr,
  	  	  			itemquantityArr:itemquantityArr,
  	  	  			itempriceArr:itempriceArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 상품이 등록되었습니다")
  					}
  				}
  			
  			})
  		})
  		
  		$("#subdelete").on("click", function(){
  			if($(".subcheck:checked").length == 0){
  				alert("삭제할 상품을 선택하세요")
  				return;
  			}
  			
  			let isDel = confirm("선택한 상품을 삭제하시겠습니까?")
  			
  			if(!isDel) return;
  			
  			let impsubindexArr = []
  			
  			$(".subcheck:checked").each(function(){
  				
  				let tr = $(this).parent().parent();
  				
  				let impsubindex = (tr.find("[name=d_impsubindex]").val());
  				
  				console.log(impsubindex);
  				
  				impsubindexArr.push(impsubindex);
  					
  			});
  			
  			$.ajax({
  				url : "/subdata/checkDel",
  				type : 'post',
  				dataType : 'text',
  				data:{
  					impsubindexArr : impsubindexArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 상품이 삭제되었습니다")
  					}
  				}
  			
  		})
  		
  		
  		})
  		
  		$("#submodify").on("click",function(){
  			if($(".subcheck:checked").length == 0){
  				alert("수정할 상품을 선택하세요")
  				return;;
  			}
  			
  			let isModify = confirm("선택한 상품을 수정하시겠습니까?");
  			
  			if(!isModify) return;
  			let impsubindexArr = []
  			let impitemnameArr = []
	  		let itemnameArr = []
  			let itemquantityArr = []
	  		let itempriceArr = [] 
  			
  			$(".subcheck:checked").each(function(){
  				let tr = $(this).parent().parent();
  				
  				let impsubindex = (tr.find("[name=d_impsubindex]").val());
  				let impitemname = (tr.find("[name=d_impitemname]").val());
  				let itemname = (tr.find("[name=d_itemname]").val());
  				let itemquantity = (tr.find("[name=d_itemquantity]").val());
  				let itemprice = (tr.find("[name=d_itemprice]").val());
  				
  				impsubindexArr.push(impsubindex);
  				impitemnameArr.push(impitemname);
  				itemnameArr.push(itemname);
  				itemquantityArr.push(itemquantity);
  				itempriceArr.push(itemprice);
  			});
  			
  			$.ajax({
  				url : '/subdata/checkModify',
  				type : 'post',
  				dataType : 'text',
  				data : {
  					impsubindexArr : impsubindexArr,
  	  				impitemnameArr : impitemnameArr,
  	  				itemnameArr : itemnameArr,
  	  				itemquantityArr : itemquantityArr,
  	  				itempriceArr : itempriceArr	
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 상품이 수정되었습니다.")
  					}
  				}
  				
  			})
  			
  		})
  		
  		
  		
  	})
  		
  	</script>
    
    
    <button id="search">검색</button>
    <button id="add" onclick="rowsubAdd();">라인추가</button>
    <button id="subsave">신규등록</button>
    <button id="submodify">수정</button>
    <button id="subdelete">삭제</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="subimpTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="subcheckAll" name="subcheckAll"></strong></td>
    			<td class="text-center"><strong>No.</strong></td>
    			<td class="text-center"><strong>입고상태</strong></td>
    			<td class="text-center"><strong>상품이름</strong></td>
    			<td class="text-center"><strong>판매이름</strong></td>
    			<td class="text-center"><strong>입고예정수량</strong></td>
    			<td class="text-center"><strong>입고단가</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${impsubdatacreate}" var="ImpSubVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" class="subcheck" value="${ImpSubVO.impnum}">
    			</td>
    			<td>
    			</td>
    			<td>
    				<input type="text" name="d_status"	value='<c:out value="${ImpSubVO.status}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td>
    				<input type="text" name="d_impitemname" value='<c:out value="${ImpSubVO.impitemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_itemname" value='<c:out value="${ImpSubVO.itemname}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center"> 
    				<input type="text" name="d_itemquantity" value='<c:out value="${ImpSubVO.itemquantity}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_itemprice" value='<c:out value="${ImpSubVO.itemprice}"></c:out>' style="width:100%; border:0; text-align:center;">
    				<input type="hidden" name="d_impsubindex" value='<c:out value="${ImpSubVO.impsubindex}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			
    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
   </section>
 
  </footer>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  
    <div class="control-sidebar-bg"></div>