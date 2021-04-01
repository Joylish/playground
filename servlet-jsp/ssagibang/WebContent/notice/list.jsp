<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="${sessionScope.userId}" />

<%
	String root = request.getContextPath();
%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>싸지방</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Gothic&display=swap"
      rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> 

	<link href="../css/common/_header.css" rel="stylesheet">
	<link href="../css/base/_reset.css" rel="stylesheet">
</head>
<body>
	<div class="header-container shadow">
      
		<header class="header fixed fixed-desktop clearfix">
		  <div class="container-fluid">
			<div class="row">
			  <div class="col-md-auto hidden-md-down">
				<div class="header-first clearfix">
	  
				<div id="logo" class="logo">
                  <a href="${root}/index.jsp">
                    <div class="title">싸지방</div>
                    <div class="subtitle">싸피 지각생이 추천하는 방</div>
                  </a>
                </div>
				</div>
			  </div>
			  <div class="col-lg-10 ml-auto">
				<div class="header-second clearfix">
				  <div class="main-navigation main-navigation--mega-menu  animated">
					<div class="header-top-dropdown text-right">
					  <!-- 로그인 되었을 경우 -->
	                  <c:if test="${userId eq null}">
	                    <div class="btn-group">
	                      <a href="${root}/user/join.jsp" class="btn btn-default btn-sm"><i class="fa fa-user"></i>회원가입</a>
	                    </div>
	                    <div class="btn-group">
	                      <button id="header-top-drop-2" type="button" class="btn btn-sm" data-toggle="modal"
							  data-target="#loginModal" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  <i class="fa fa-lock"></i>로그인
							</button>
	                    </div>
	                   </c:if>
	                   
	                   <!-- 로그인 안되었을 경우 -->
	                   <c:if test="${userId ne null}">
	                   	<div class="btn-group">
	                   		<a href="${root}/user/logout.do">
			                    <button id="header-top-drop-2" type="button" class="btn btn-sm mr-2">
			                      <i class="fa fa-lock"></i>로그아웃
			                    </button>
		                    </a>
	                    </div>
	                    <div class="btn-group">
		                    <a href="${root}/user/profile.do">
		                    	<button id="header-top-drop-2" type="button" class="btn btn-sm">
			                       <i class="fa fa-lock"></i>내정보
			                    </button>
		                    </a>
	                  	</div>
	                  </c:if>
					</div>
					<nav class="navbar navbar-expand-lg navbar-light p-0">
					  <div class="navbar-brand clearfix d-none d-sm-block d-md-none">
	  
						<div id="logo-mobile" class="logo">
						  <a href="${root}/index.jsp">
							<div class="title">싸지방</div>
							<div class="subtitle">싸피 지각생이 추천하는 방</div>
						  </a>
						</div>
					  </div>
	  
					  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse-1"
						aria-controls="navbar-collapse-1" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					  </button>
	  
					  <div class="collapse navbar-collapse" id="navbar-collapse-1">
						<ul class="navbar-nav ml-xl-auto">
							<li class="nav-item dropdown  mega-menu mega-menu--wide">
	                          <a href="${root}/notice/list.jsp" class="nav-link " id="first-dropdown" aria-haspopup="true"
	                            aria-expanded="false">공지사항</a>
	                        </li>
	                        <li class="nav-item dropdown mega-menu mega-menu--wide">
	                          <a href="${root}/news/list.jsp" class="nav-link" id="second-dropdown" aria-haspopup="true"
	                            aria-expanded="false">오늘의 뉴스</a>
	                        </li>
	                        <li class="nav-item dropdown mega-menu mega-menu--wide">
	                          <a href="${root}/user/interest.jsp" class="nav-link" id="second-dropdown" aria-haspopup="true"
	                            aria-expanded="false">관심 목록</a>
	                        </li>
	                        <li class="nav-item dropdown mega-menu mega-menu--wide">
	                          <a href="${root}/etc/sitemap.jsp" class="nav-link" id="second-dropdown" aria-haspopup="true"
	                            aria-expanded="false">사이트맵</a>
	                        </li>
						</ul>
					  </div>
					</nav>
					
				  </div>
				</div>
			  </div>
			</div>
		  </div>
		</header>
	  </div>

<div class="container">
	<div class="container-fluid text-center">
		<h2>공지사항</h2>
	</div>
	<div class="container">
		<button class="btn">
			<a href="="${root}/notice/editor.jsp">글쓰기</a>
		</button>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>글번호</th>
				<th class="text-center">제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>글번호</td>
				<td><a href="${root}/notice/detail.jsp">글제목</a></td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
		</tbody>
	</table>
	<div class="container text-center">
		<div class="btn-group btn-group-md">
		  <button type="button" class="btn ">최신</button>
		  <button type="button" class="btn ">이전</button>
		  <button type="button" class="btn ">1</button>
		  <button type="button" class="btn ">2</button>
		  <button type="button" class="btn ">3</button>
		  <button type="button" class="btn ">다음</button>
		  <button type="button" class="btn ">마지막</button>
		</div>
	</div>
</div>

<footer id="footer" class="clearfix shadow bg-gradient">
	<div class="footer">
	  <div class="container">
		<div class="footer-inner">
		  <div class="row">
			<div class="col-md-8">
			  <div class="footer-content">
				<h2 class="title">Find Us</h2>
				<div class="separator-2"></div>
				<ul class="list-icons">
				  <li><i class="fa fa-map-marker pr-2 text-default"></i>(SSAFY) 서울시 강남구 테헤란로 멀티스퀘어</li>
				  <li><i class="fa fa-phone pr-2 text-default"></i> 1544-9001</li>
				  <li><a href="#"><i class="fa fa-envelope-o pr-2"></i>admin@ssafy.com</a></li>
				</ul>
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</div>
  
	<div class="subfooter">
	  <div class="container">
		<div class="subfooter-inner">
		  <div class="row">
			<div class="col-md-12">
			  <p class="text-center">Copyright by SSAFY. All rights reserved.</p>
			</div>
		  </div>
		</div>
	  </div>
	</div>
</footer>

<div class="modal-container modal" id="loginModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">로그인하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form action="${root}/user/join.do" method="post">
						<input type="email" id="email_id" class="form-control mb-3" placeholder="이메일을 입력하세요" required autofocus>	
						<div class="inputbox">
							<div class="d-flex justify-content-between align-items-center">
								<span></span>
								<a href="${root}/user/search_password.jsp">비밀번호를 잊어버리셨습니까?</a>
							</div>
							<input type="password" id="inputPassword" class="form-control mb-3" placeholder="비밀번호를 입력하세요" required>
						</div>
						<div class="checkbox mb-3">
							<input type="checkbox" value="remember-me"> 나를 기억해주세요!
						</div>
						<button class="w-100 btn btn-lg" type="submit">로그인</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>