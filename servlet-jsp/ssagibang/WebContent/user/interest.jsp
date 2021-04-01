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
    <link href="../css/layout/_preview.css" rel="stylesheet">
    <link href="../css/layout/_roomlist.css" rel="stylesheet">
    <link href="../css/layout/_watchlist.css" rel="stylesheet">

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
      <div>
        <div class="container--header">
          <h1 class="title">관심목록</h1>
        </div>
        <ul class="d-flex nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#qwe">찜한 단지</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#asd">찜한 방</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#zxc">관심 지역</a>
          </li>
        </ul>
        <div class="tab-content" style=" overflow: scroll;">
          <div class="tab-pane fade show active" id="qwe">
            <div class="row row-cols-1 row-cols-md-4 g-3">
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123" class="card-img-top"
                    alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">다솜오피스텔</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="asd">
            <div class="row row-cols-1 row-cols-md-4 g-3">
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/3f95e2dc-1538-485d-b05b-9074939be49d"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/3f95e2dc-1538-485d-b05b-9074939be49d"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>

            </div>
          </div>
          <div class="d-flex tab-pane fade" id="zxc">
            <div class="preview-map" id="map">
              <button class="btn" data-toggle="modal" data-target="#addWatchReginModal" aria-haspopup="true" >관심지역 추가</button>
              <img src="../images/map-sample.png" />
              <div class="row row-cols-1 row-cols-md-4 g-3">
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/3f95e2dc-1538-485d-b05b-9074939be49d"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/3f95e2dc-1538-485d-b05b-9074939be49d"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
              <div class="col">
                <div class="card h-70">
                  <img src="https://d2o59jgeq8ig2.cloudfront.net/complex/1024/5905c019-78bf-4f6c-a949-e52cfe4dc123"
                    class="card-img-top" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">광화문풍림스페이스본</h5>
                    <p class="card-text">성북구 석관동 21세대</p>
                    <p class="card-text"><small class="text-muted">2100만/3.3m²당</small></p>
                  </div>
                </div>
              </div>
            </div>
          
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal-container modal" id="addWatchReginModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">관심지역 등록하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <form action="${root}/user/interest.do" method="post">
            <input type="text" id="do" class="form-control mb-3" placeholder="도/광역시" required>
            <input type="text" id="si" class="form-control mb-3" placeholder="시/군/구" required>
            <input type="text" id="dong" class="form-control mb-3" placeholder="동" required>
            <button class="w-100 btn btn-lg" type="submit">등록하기</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  </body>
</html>
