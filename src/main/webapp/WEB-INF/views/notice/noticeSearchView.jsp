<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<style type="text/css">
.search {
  position: relative;
  width: 450px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

/*img {
  position : absolute;
  width: 17px;
  top: 14px;
  right: 130px;
  margin: 0;
}*/
.selectBox{
	margin: 10px auto;
	margin-left: 20px;
}
</style>
 <script>
  $("#btnSearch").on("click", function(e){
        e.preventDefault();

        if(!search.find("#keyword").val()){
            alert("키워드를 입력하세요");
            return;
        }
        search.submit();
    });
 </script>
</head>
<body>

    <jsp:include page="../common/menubar.jsp"/>
    <div id="app">
	<div id="main">
    <div class="content">
        <div class="innerOuter" style="padding:5% 10%;">
        	<c:choose>
				<c:when test="${not empty keyword }">
					<p>
						<strong>${keyword} </strong>키워드로 검색된
						<strong>${listCount}</strong>개의 글이 있습니다.
					</p>
				</c:when>
			</c:choose>
            <h2>공지사항</h2>
            <c:if test="${ session.loginUser.mManager == 'Y' }">
            	<a class="btn btn-secondary" style="float:right" href="enrollFormNotice.do">글쓰기</a>
            </c:if>
            <div class="search" style="display: flex;">
            	<form method="GET" name="search" action="searchNotice.do">
            		<table class="pull-right">
            			<tr>
            				<td>
            					<select name="condition" id="condition">
								  	<option value="title">제목</option>
								  	<option value="content">내용</option>
								  	<option value="titleAndContent">제목+내용</option>
								  </select>
            				</td>
            				<td><input type="text" name="keyword" id="keyword" placeholder="검색어 입력"</td>
	            			<td><button type="submit" class="btn btn-success" name="btnSearch" id="btnSearch">검색</button></td>			
					 		<!-- <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"> -->	
				  </tr>
				  </table>
				  <input type="hidden" name="pageNum" value="1">
				  <input type="hidden" name="amount" value="10">
			  </form>
			</div>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${ list }" var="n">
	                    <tr>
	                    	<td style="display: none;">${ n.no_Num }</td>
	                    	<td style="width:75%;" onclick="location.href='detailNotice.do?no_Num=${ n.no_Num }'">
	                    	<c:if test="${ n.no_Important == 'Y' }">
				            	<a class="badge bg-danger">중요</a>
				            </c:if>${ n.no_Title }</td>
				            <td>${ n.no_WirterName }</td>
	                        <td>${ n.no_Date }</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="listNotice.do?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="listNotice.do?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="listNotice.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="listNotice.do?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        </div>
    </div>
    </div>
    </div>
</body>
</html>