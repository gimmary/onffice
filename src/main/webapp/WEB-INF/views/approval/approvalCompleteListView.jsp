<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>결재완료</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<style type="text/css">
		#pagingArea {
			width:fit-content;
			margin:auto;
		}
	</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="app">
		<div id="main">
			<section class="section">
	            <div class="row" id="basic-table">
	                <div class="col-12 col-md-12">
	                    <div class="card">
	                        <div class="card-header">
	                            <h4 class="card-title">결재완료</h4>
	                        </div>
	                        <div class="card-content">
	                            <div class="card-body">
	                                <!-- Table with outer spacing -->
	                                <div class="table-responsive">
	                                    <table id="OngoingListView" class="table table-lg">
	                                        <thead>
	                                            <tr>
	                                            	<th>글번호</th>
	                                                <th>결재양식</th>
	                                                <th>제목</th>
	                                                <th>작성일</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody> 
	                                        	<c:forEach items="${ list }" var="ap">
		                                            <tr>
		                                            	<td>${ ap.apNo }</td>
		                                                <td id="foNo">${ ap.foNo }</td>
		                                                <td>${ ap.doTitle }</td>
		                                                <td>${ ap.doDate }</td>
		                                            </tr>
	                                            </c:forEach>
	                                            
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </div>
                
                <div id="pagingArea">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage ne 1 }">
	                			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                	
	                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	                    	<c:choose>
		                		<c:when test="${ pi.currentPage ne p }">
	                    			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ p }">${ p }</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
		                		</c:otherwise>
		                	</c:choose>
	                    </c:forEach>
	                    
	                    <c:choose>
	                		<c:when test="${ pi.currentPage ne pi.maxPage }">
	                			<li class="page-item"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="listBoard.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                </ul>
	            </div>
        	</section>
		</div>
	</div> 
	
	<script>
	
		// 
		$(document).ready(function(){

			let form = document.getElementById("foNo");
			console.log(foNo)
			
			if(foNo == 10){
				$(this).innerTest("휴가신청서");
			}
	    });
		
		// 페이지 이동 
    	$(function(){
    		$("#OngoingListView tbody tr").click(function(){
    			location.href="approvalOngoingDetailView.do?apNo=" + $(this).children().eq(0).text() + "&foNo=" + $(this).children().eq(1).text();
    		});
    	});
    </script>
	
</body>
</html>