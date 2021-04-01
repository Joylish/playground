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
    <title>싸지방</title>
    
    <meta charset="utf-8">
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
      <div class="main-body">
        <div class="row gutters-sm">
          <div class="col-md-4 mb-3">
            <div class="card">
              <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                  <img src="https://i1.sndcdn.com/avatars-bS8E2DoPaKK09WZg-Xxecmg-t500x500.jpg" alt="Admin" class="rounded-circle"
                    width="150">
                  <div class="mt-3">
                    <h4>무야호아부지</h4>
                    <p class="text-muted font-size-sm">부자되세요, VIP 고객님</p>
                    <a href="./profile-editor.html"><button class="btn">수정하기</button></a>
                    <button class="btn" data-toggle="modal" data-target="#removeModal" aria-haspopup="true" aria-expanded="false">탈퇴하기</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="card mb-3">
              <div class="card-body">
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">Name</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    김야호
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">Email</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    yaho@mu.com
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">휴대폰번호</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    (010) 1555-3333
                  </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">주소</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    서울특별시 마포구 상암동 1616 상암동주민센터
                  </div>
                </div>
              </div>
            </div>
            <div class="row gutters-sm">
              <div class="col-sm-6 mb-3">
                <div class="card h-100">
                  <div class="card-body">
                    <h6 class="d-flex align-items-center mb-3"><i
                        class="material-icons text-info mr-2">관심</i>지역</h6>
                    <hr />
                    <small>서울시 중구 무교동</small>
                    <hr/>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 mb-3">
                <div class="card h-100">
                  <div class="card-body">
                    <h6 class="d-flex align-items-center mb-3"><i class="material-icons text-info mr-2">관심</i>매물</h6>
                    <hr />
                    <small>이매동 아름마을두산삼호</small>
                    <hr />
                    <small>우면 코오롱</small>
                    <hr />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal-container modal" id="removeModal">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">영구 탈퇴하기</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body">
            <form>
              <input type="password" id="inputPassword" class="form-control mb-3" placeholder="비밀번호를 입력하세요" required>
            
              <button class="w-100 btn btn-lg" type="submit">탈퇴하기</button>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>