<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
	body{
	    background: #f5f5f5;
	    margin-top:20px;
	}
	
	.ui-w-80 {
	    width: 100px !important;
	    height: auto;
	}
	
	.btn-default {
	    border-color: rgba(24,28,33,0.1);
	    background: rgba(0,0,0,0);
	    color: #4E5155;
	}
	
	label.btn {
	    margin-bottom: 0;
	}
	
	.btn-outline-primary {
	    border-color: #26B4FF;
	    background: transparent;
	    color: #26B4FF;
	}
	
	.btn {
	    cursor: pointer;
	}
	
	.text-light {
	    color: #babbbc !important;
	}
	
	.btn-facebook {
	    border-color: rgba(0,0,0,0);
	    background: #3B5998;
	    color: #fff;
	}
	
	.btn-instagram {
	    border-color: rgba(0,0,0,0);
	    background: #000;
	    color: #fff;
	}
	
	.card {
	    background-clip: padding-box;
	    box-shadow: 0 1px 4px rgba(24,28,33,0.012);
	}
	
	.row-bordered {
	    overflow: hidden;
	}
	
	.account-settings-fileinput {
	    position: absolute;
	    visibility: hidden;
	    width: 1px;
	    height: 1px;
	    opacity: 0;
	}
	.account-settings-links .list-group-item.active {
	    font-weight: bold !important;
	}
	html:not(.dark-style) .account-settings-links .list-group-item.active {
	    background: transparent !important;
	}
	.account-settings-multiselect ~ .select2-container {
	    width: 100% !important;
	}
	.light-style .account-settings-links .list-group-item {
	    padding: 0.85rem 1.5rem;
	    border-color: rgba(24, 28, 33, 0.03) !important;
	}
	.light-style .account-settings-links .list-group-item.active {
	    color: #4e5155 !important;
	}
	.material-style .account-settings-links .list-group-item {
	    padding: 0.85rem 1.5rem;
	    border-color: rgba(24, 28, 33, 0.03) !important;
	}
	.material-style .account-settings-links .list-group-item.active {
	    color: #4e5155 !important;
	}
	.dark-style .account-settings-links .list-group-item {
	    padding: 0.85rem 1.5rem;
	    border-color: rgba(255, 255, 255, 0.03) !important;
	}
	.dark-style .account-settings-links .list-group-item.active {
	    color: #fff !important;
	}
	.light-style .account-settings-links .list-group-item.active {
	    color: #4E5155 !important;
	}
	.light-style .account-settings-links .list-group-item {
	    padding: 0.85rem 1.5rem;
	    border-color: rgba(24,28,33,0.03) !important;
	}
	#final, #postcodify_search_button {
		float: right;
	}
  </style>
</head>

<body style="background-color:#F0FFF0">

	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="app">        
        <div id="main">

            <div class="container light-style flex-grow-1 container-p-y">
		    <h2 class="font-weight-bold py-3 mb-4">
		      개인정보관리
		    </h2>

		    <div class="card overflow-hidden">
		      <div class="row no-gutters row-bordered row-border-light">
		        <div class="col-md-3 pt-0">
		          <div class="list-group list-group-flush account-settings-links">
		            <a class="list-group-item list-group-item-action active" data-toggle="list" href="mypageForm">개인정보수정</a>
		            <a class="list-group-item list-group-item-action" data-toggle="list" href="updatePwdForm">비밀번호변경</a>
		          </div>
		        </div>
		        <div class="col-md-9">
		          <div class="tab-content">
		            <div class="tab-pane fade active show" id="account-general">
		            <form id="updateForm" action="updateMypage" method="post">
		              <div class="d-flex align-items-center">
		                <div class="avatar avatar-xl mt-5"> &nbsp;  &nbsp; &nbsp;  &nbsp;
                            <label><img src="resources/assets/images/faces/1.jpg" alt="Face 1"><input type="file" class="account-settings-fileinput"></label> 
                        </div>    
		                <div class="ms-3 name mt-5">
                            <h5 class="font-bold">${ sessionScope.loginUser.MName } / ${ sessionScope.loginUser.JName }</h5>
                            <h6 class="text-muted mb-0">${ sessionScope.loginUser.DName }</h6>
                        	<input type="hidden" class="form-control" id="cNo" name="cNo" value="${ sessionScope.loginUser.CNo }" readonly>
                        </div>
		              </div>
		              <div class="card-body">
		                <div class="form-group">
		                  <label class="form-label">사번</label>
		                  <input type="text" class="form-control mb-1" name="mNo" value="${ sessionScope.loginUser.MNo }" readonly>
		                </div>
		                <div class="form-group">
		                  <label class="form-label">아이디</label>
		                  <input type="text" class="form-control" name="mId" value="${ sessionScope.loginUser.MId }" readonly>
		                </div>
		                <div class="form-group">
		                  <label class="form-label">이름</label>
		                  <input type="text" class="form-control mb-1" name="mName" value="${ sessionScope.loginUser.MName }">
		                </div>
		                <div class="form-group">
		                  <label class="form-label">이메일</label>
		                  <input type="text" class="form-control mb-1" name="mEmail" value="${ sessionScope.loginUser.MEmail }">
		                </div>
		                <div class="form-group">
		                  <label class="form-label">전화번호</label>
		                  <input type="text" class="form-control" name="mPhone" value="${ sessionScope.loginUser.MPhone }">
		                </div>
		                <c:forTokens var="addr" items="${ sessionScope.loginUser.MAddress }" delims="/" varStatus="status">
							<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
							<c:set var="post" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
							<c:set var="address1" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 1 }">
							<c:set var="address1" value="${ addr }"/>
							</c:if>
							<c:if test="${ status.index eq 2 }">
							<c:set var="address2" value="${ addr }"/>
							</c:if>
						</c:forTokens>
						<br>
		             	<div class="form-group has-icon-left"> 
                          <label>우편번호 :</label>
                          <button type="button" class="btn btn-primary" id="postcodify_search_button" >검색</button>
						  <input type="text" name="post" class="form-control mr-2 postcodify_postcode5" value="${ post }">
                          <label>도로명주소 : </label>
						  <input type="text" name="address1" class="form-control postcodify_address" value="${ address1 }">
                       	  <label>상세주소 : </label>
						  <input type="text" name="address2" class="form-control postcodify_extra_info"  value="${ address2 }">
		               </div>
		                <div class="mt-3 mb-3 float-right" id="final">
						<button type="submit" class="btn btn-outline-primary">수정</button>
						</div>
		              </div>
		            </form>
		            </div>
		      	</div>
		   	 </div>
		 	</div>
    		</div>
    		</div>
        </div>
    </div>
    
    <c:if test="${ !empty msg }">
		<script>
			alert("${msg}");
		</script>
		<c:remove var="msg" scope="session"/>
	</c:if>
    
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		// 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
		$(function(){
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>
</body>

</html>