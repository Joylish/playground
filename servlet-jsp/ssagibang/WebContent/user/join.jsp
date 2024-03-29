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
    <title>싸지방</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="images/favicon.html">
    
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
    <script src="../js/join.js"></script>
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
                        <a href="index.html">
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
      <div class="registerform row justify-content-center">
        <div class="col-md-8">
          <div class="card">
            <div class="registerform-header card-header">
              <h4 class="registerform-header__title">회원가입하기</h4>
            </div>
            <div class="card-body">
              <form class="form-horizontal" action="${root}/user/interest.do" method="post">
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                      <input type="email" class="form-control" name="email" id="email" placeholder="이메일 입력(50자 이내)" required maxLength=50 autofocus/>
                    </div>
                  </div>
                </div>
                
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                      <input type="password" class="password form-control" name="password" id="password"
                        placeholder="비밀번호 입력(20자 이내)" required maxLength=20/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                      <input type="password" class="confirm_password form-control" name="confirm" id="confirm"
                        placeholder="비밀번호 재입력(20자 이내)" required maxLength=20/>
                    </div>
                    <span class="check-message"></span>
                  </div>
                </div>
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                      <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력(20자 이내)" required maxLength=20/>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group">
                      <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                      <input type="text" class="form-control" name="phonenumber" id="phonenumber" placeholder="휴대폰 번호 입력(010XXXXYYYY)" required/>
                    </div>
                  </div>
                </div>
                <span class="space"></span>
                <div class="form-group">
                  <div class="cols-sm-10">
                    <div class="input-group mb-2">
                      <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                      <input type="text" id="postcode" class="postcode form-control" placeholder="우편번호" required>
                      <input type="button" class="address-search--button btn ml-2" value="우편번호 찾기">
                    </div>
                    <div class="input-group mb-2">
                      <input type="text" id="address" class="address form-control" placeholder="주소" value="" required/>
                    </div>
                    <div class="input-group mb-2">
                      <input type="text" class="detailAddres form-control mr-2" placeholder="상세주소" value=""/>
                      <input type="text" class="extraAddress form-control" placeholder="참고항목" value="" />
                    </div>
                  </div>
                </div>
                <div class="form-group ">
                  <button type="submit" class="register--button btn btn-lg btn-block">가입하기</button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </body>
</html>