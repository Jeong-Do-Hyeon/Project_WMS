<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<footer class="main-footer">


    <section class="content container-fluid">
 
    <!-- Content Header (Page header) -->
    <!-- Main content -->
  <script>
  	function rowsubAdd(){
  		var trCnt = $('#subexpTable tr').length;
  		var innerHtml = "";
  		innerHtml += '<tr style="font-size: 12px; font-weight= 600;" id="'+trCnt+'">';
  		innerHtml += '	<td class="text-center"><input type="checkbox" id="subcheck" name="subcheck" class="subcheck"></td>';
  		innerHtml += '	<td class="text-center" name="new">New</td>';
  		innerHtml += '	<td class="text-center"></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="expitemname" name="expitemname" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="itemname" name="itemname" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="expquantity" name="expquantity" style="width:100%; border:0;"/></td>';
  		innerHtml += '	<td class="text-center"><input type="text" id="expprice" name="expprice" style="width:100%; border:0;"/></td>';
  		
  		$('#subexpTable').append(innerHtml);
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
  				alert("등록할 주문을 선택하세요")
  				return;
  			}
  			
  			let isAdd = confirm("선택한 주문을 등록하시겠습니까?");
  			
  			if(!isAdd) return;
  			
  			let expnumArr = []
  			let expitemnameArr = []
  			let itemnameArr = []
  			let expquantityArr = []
			let exppriceArr = []
  			
  			
  			$(".subcheck:checked").each(function(){
				let tr = $(this).parent().parent();
  				
  				let expnum = ${expnum};
  				let expitemname = tr.find("[name=expitemname]").val();
  				let itemname = tr.find("[name=itemname]").val();
  				let expquantity = tr.find("[name=expquantity]").val();
  				let expprice = tr.find("[name=expprice]").val();
  				
  				
 				expnumArr.push(expnum);
  	  			expitemnameArr.push(expitemname);
  	  			itemnameArr.push(itemname);
  	  			expquantityArr.push(expquantity);
  	  			exppriceArr.push(expprice);
  	  			
  				console.log(expnumArr);
  	  			
  			});
  			
  			$.ajax({
  				url : '/expsubdata/checkAdd',
  				type: 'post',
  				dataType : 'text',
  				data: {
  					expnumArr : expnumArr,
  					expitemnameArr:expitemnameArr,
  	  	  			itemnameArr:itemnameArr,
  	  	  			expquantityArr:expquantityArr,
  	  	  			exppriceArr:exppriceArr
  				},
  				success: function(data){
  					if(data == "success"){
  						alert("선택된 주문이 등록되었습니다")
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
  			
  			let expsubindexArr = []
  			
  			$(".subcheck:checked").each(function(){
  				
  				let tr = $(this).parent().parent();
  				
  				let expsubindex = (tr.find("[name=d_expsubindex]").val());
  				
  				console.log(expsubindex);
  				
  				expsubindexArr.push(expsubindex);
  					
  			});
  			
  			$.ajax({
  				url : "/expsubdata/checkDel",
  				type : 'post',
  				dataType : 'text',
  				data:{
  					expsubindexArr : expsubindexArr
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
  			let expsubindexArr = []
  			let expitemnameArr = []
  			let itemnameArr = []
  			let expquantityArr = []
			let exppriceArr = []
  			
  			$(".subcheck:checked").each(function(){
  				let tr = $(this).parent().parent();
  				
  				let expsubindex = (tr.find("[name=d_expsubindex]").val());
  				let expitemname = (tr.find("[name=d_expitemname]").val());
  				let itemname = (tr.find("[name=d_itemname]").val());
  				let expquantity = (tr.find("[name=d_expquantity]").val());
  				let expprice = (tr.find("[name=d_expprice]").val());
  				
  				expsubindexArr.push(expsubindex);
  				expitemnameArr.push(expitemname);
  				itemnameArr.push(itemname);
  				expquantityArr.push(expquantity);
  				exppriceArr.push(expprice);
  			});
  			
  			$.ajax({
  				url : '/expsubdata/checkModify',
  				type : 'post',
  				dataType : 'text',
  				data : {
  					expsubindexArr : expsubindexArr,
  					expitemnameArr:expitemnameArr,
  	  	  			itemnameArr:itemnameArr,
  	  	  			expquantityArr:expquantityArr,
  	  	  			exppriceArr:exppriceArr
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
    
    
    <button id="add" onclick="rowsubAdd();">라인추가</button>
    <button id="subsave">신규등록</button>
    <button id="submodify">수정</button>
    <button id="subdelete">삭제</button>
    <button id="refresh" onclick="window.location.reload()">새로고침</button>
    
    <table id="subexpTable" class="table">
    	<thead>
    		<tr class="menu">
    			<td class="text-center"><strong><input type="checkbox" id="subcheckAll" name="subcheckAll"></strong></td>
    			<td class="text-center"><strong>No.</strong></td>
    			<td class="text-center"><strong>출고상태</strong></td>
    			<td class="text-center"><strong>상품이름</strong></td>
    			<td class="text-center"><strong>판매이름</strong></td>
    			<td class="text-center"><strong>출고수량</strong></td>
    			<td class="text-center"><strong>출고단가</strong></td>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${expsubdatacreate}" var="ExpSubVO" varStatus="status">
    		<tr class="data" style="font-size: 12px; font-weight= 600;">
    			<td class="text-center">
    				<input type="checkbox" class="subcheck" value="${ExpSubVO.expnum}">
    			</td>
    			<td>
    			</td>
    			<td>
    				<input type="text" name="d_status"	value='<c:out value="${ExpSubVO.status}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;" readonly>
    			</td>
    			<td>
    				<input type="text" name="d_expitemname" value='<c:out value="${ExpSubVO.expitemname}"></c:out>' style="width:100%; border:none; background-color:transparent; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_itemname" value='<c:out value="${ExpSubVO.itemname}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center"> 
    				<input type="text" name="d_expquantity" value='<c:out value="${ExpSubVO.expquantity}"></c:out>' style="width:100%; border:0; text-align:center;">
    			</td>
    			<td class="text-center">
    				<input type="text" name="d_expprice" value='<c:out value="${ExpSubVO.expprice}"></c:out>' style="width:100%; border:0; text-align:center;">
    				<input type="hidden" name="d_expsubindex" value='<c:out value="${ExpSubVO.expsubindex}"></c:out>' style="width:100%; border:0; text-align:center;">
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