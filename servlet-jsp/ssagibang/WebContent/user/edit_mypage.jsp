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
      <div class="row flex-lg-nowrap">
    
        <div class="col">
          <div class="row">
            <div class="col mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="e-profile">
                    <div class="row">
                      <div class="col-12 col-sm-auto mb-3">
                        <div class="mx-auto" style="width: 140px;">
                          <div class="d-flex justify-content-center align-items-center rounded"
                            style="height: 140px; background-color: rgb(233, 236, 239);">
                            <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                          </div>
                        </div>
                      </div>
                      <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                          <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">무야호아저씨</h4>
                          <p class="mb-0">@muyaho</p>
                          <div class="text-muted"><small>54일 전 수정</small></div>
                          <div class="mt-2">
                            <button class="btn" type="button">
                              <i class="fa fa-fw fa-camera"></i>
                              <span>사진 바꾸기</span>
                            </button>
                          </div>
                        </div>
                        <div class="text-center text-sm-right">
                          <span class="badge badge-secondary">VIP 고객님</span>
                          <div class="text-muted"><small>가입일 09 Dec 2017</small></div>
                        </div>
                      </div>
                    </div>
                    <ul class="nav nav-tabs">
                      <li class="nav-item"><a href="" class="active nav-link">설정</a></li>
                    </ul>
                    <div class="tab-content pt-3">
                      <div class="tab-pane active">
                        <form class="form" novalidate="">
                          <div class="row">
                            <div class="col">
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label>이름</label>
                                    <input class="form-control" type="text" name="name" placeholder="이름을 입력해주세요"
                                      value="김야호">
                                  </div>
                                </div>
                                <div class="col">
                                  <div class="form-group">
                                    <label>사용자이름</label>
                                    <input class="form-control" type="text" name="username" placeholder="원하시는 닉네임을 입력해주세요"
                                      value="무야호아저씨">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <label>이메일</label>
                                    <input class="form-control" type="text" placeholder="user@example.com">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col mb-3">
                                  <div class="form-group">
                                    <label>소개</label>
                                    <textarea class="form-control" rows="5" placeholder="상세정보"></textarea>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-12 col-sm-6 mb-3">
                              <div class="mb-2"><b>비밀번호 변경</b></div>
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <input class="form-control" type="password" placeholder="기존 비밀번호를 입력해주세요">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <input class="form-control" type="password" placeholder="새로운 비밀번호를 입력해주세요">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <div class="form-group">
                                    <input class="form-control" type="비밀번호 확인" placeholder="비밀번호를 한번 더 입력해주세요">
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                              <div class="mb-2"><b>소식 알림이 설정</b></div>
                              <div class="row">
                                <div class="col">
                                  <label>이메일 알림</label>
                                  <div class="custom-controls-stacked px-2">
                                    <div class="custom-control custom-checkbox">
                                      <input type="checkbox" class="custom-control-input" id="notifications-news"
                                        checked="">
                                      <label class="custom-control-label" for="notifications-news">추천 매물 가격 변동</label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                      <input type="checkbox" class="custom-control-input" id="notifications-offers"
                                        checked="">
                                      <label class="custom-control-label" for="notifications-offers">관심 지역 추천 매물</label>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col d-flex justify-content-end">
                              <button class="btn" type="submit">저장하기</button>
                            </div>
                          </div>
                        </form>
    
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
    
            <div class="col-12 col-md-3 mb-3">
              <div class="card">
                <div class="card-body">
                  <h6 class="card-title font-weight-bold">무엇이든 도와드립니다</h6>
                  <p class="card-text">빠르게 고민을 들어드리겠습니다</p>
                  <button type="button" class="btn">지금 물어보기</button>
                </div>
              </div>
            </div>
          </div>
    
        </div>
      </div>
    </div>
  </body>
</html>
