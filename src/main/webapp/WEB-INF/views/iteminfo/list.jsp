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

  <!-- Main Header -->
  <%@include file="/WEB-INF/views/include/header.jsp" %>
  
  <div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					제품상세정보
				</h1>
			</section>

			<!-- Main content -->
		    <section class="content container-fluid">
		    <div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">제품상세정보</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div id="example2_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div class="col-sm-6"></div>
										<div class="col-sm-6"></div>
									</div>
									<div class="row">
										<div class="col-sm-12">
											<table id="example2"
												class="table table-bordered table-hover dataTable"
												role="grid" aria-describedby="example2_info">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="example2" rowspan="1" colspan="1"
															aria-sort="ascending"
															aria-label="Rendering engine: activate to sort column descending">번호</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Browser: activate to sort column ascending">제목</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Platform(s): activate to sort column ascending">작성자</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="Engine version: activate to sort column ascending">작성일</th>
														<th class="sorting" tabindex="0" aria-controls="example2"
															rowspan="1" colspan="1"
															aria-label="CSS grade: activate to sort column ascending">수정일</th>
													</tr>
												</thead>
												<tbody>

													<c:forEach items="${list }" var="board" varStatus="status">
														<tr role="row"
															class="<c:if test="${status.count % 2 == 0 }">odd</c:if><c:if test="${status.count % 2 != 0 }">even</c:if>">
															<td class="sorting_1"><c:out value="${board.bno }"></c:out></td>
															<td><a class="move"
																href="<c:out value="${board.bno }"></c:out>"><c:out	value="${board.title }"></c:out>
																</a>
															</td>
															<td><c:out value="${board.writer }"></c:out></td>
															<td><fmt:formatDate value="${board.regdate }"
																	pattern="yyyy-MM-dd" /></td>
															<td><fmt:formatDate value="${board.updatedDate }"
																	pattern="yyyy-MM-dd" /></td>
														</tr>
													</c:forEach>
												</tbody>

											</table>
										</div>
									</div>
									<!--
									<div class="row">
										<div class="col-sm-12">
											<form id="searchForm" action="/board/list" method="get">
												<select name="type">
													<option value="">--</option>
													<option value="T">제목</option>
													<option value="C">내용</option>
													<option value="W">작성자</option>
													<option value="TC">제목 or 내용</option>
													<option value="TW">제목 or 작성자</option>
													<option value="TWC">제목 or 작성자 or 내용</option>
												</select>
												<input type="text" name="keyword">
												<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<button class="btn btn-primary">Search</button>
											</form>
										</div>
									</div>
									-->
									<div class="row">
										<div class="col-sm-5 dataTables_info">
											<form id="searchForm" action="/iteminfo/list" method="get">
												<select name="type">
													<option value=""
														<c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
													<option value="T"
														<c:out value="${pageMaker.cri.type eq 'T'? 'selected':'' }" />>제목</option>
													<option value="C"
														<c:out value="${pageMaker.cri.type eq 'C'? 'selected':'' }" />>내용</option>
													<option value="W"
														<c:out value="${pageMaker.cri.type eq 'W'? 'selected':'' }" />>작성자</option>
													<option value="TC"
														<c:out value="${pageMaker.cri.type eq 'TC'? 'selected':'' }" />>제목 or 내용</option>
													<option value="TW"
														<c:out value="${pageMaker.cri.type eq 'TW'? 'selected':'' }" />>제목 or 작성자</option>
													<option value="TWC"
														<c:out value="${pageMaker.cri.type eq 'TWC'? 'selected':'' }" />>제목 or 작성자 or 내용</option>
												</select>
												<input type="text" name="keyword" value="<c:out value="${ pageMaker.cri.keyword}" />">
												<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
												<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
												<button class="btn btn-primary">Search</button>
											</form>
											<!--
											<div class="dataTables_info" id="example2_info" role="status"
												aria-live="polite">Showing 1 to 10 of 57 entries</div>
												-->
										</div>
										<div class="col-sm-7">
											<div class="dataTables_paginate paging_simple_numbers"
												id="example2_paginate">
												<ul class="pagination">
												<c:if test="${pageMaker.prev }">
													<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }'
														id="example2_previous"><a href="${pageMaker.startPage - 1}"
														aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
												</c:if>
												<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">	
													<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'><a href="${num}"
														aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a></li>
												</c:forEach>
												<c:if test="${pageMaker.next }">	
													<li class="paginate_button next" id="example2_next"><a
														href="${pageMaker.endPage + 1}" aria-controls="example2" data-dt-idx="7"
														tabindex="0">Next</a></li>
												</c:if>
												</ul>
											</div>
										</div>
										<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
										<form id="actionForm" action="/iteminfo/list" method="get">
											<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
											<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
											<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
											<input type="hidden" name="type" value="${pageMaker.cri.type}">
											<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
											<!--글번호추가-->
										</form>


									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<!-- /.col -->
				</div>

			</section>
			<!-- /.content -->
		</div>

  <%@include file="/WEB-INF/views/include/left_menu.jsp" %>


<%@include file="/WEB-INF/views/include/plugin_js.jsp" %>

	<script>
	
		$(document).ready(function() {

			let actionForm = $("#actionForm");
			
			// 리스트에서 제목 클릭시 동작
			$(".move").on("click", function(e) {

				e.preventDefault(); // <a>태그의 기본적인 이벤트기능을 취소. 즉 링크기능취소.  

				let bno = $(this).attr("href");
				console.log("글번호" + bno);

				//location.href = "/board/get?bno=" + bno; // /board/get?bno=1

				actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
				actionForm.attr("action", "/iteminfo/get");

				actionForm.submit();


			});

			
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));

			console.log("click");

			actionForm.submit();
		});
	});
		
		
	</script>


</body>
</html>