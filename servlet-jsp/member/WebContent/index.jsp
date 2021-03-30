<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.member.dto.MemberDto"%>
<%
 String root = request.getContextPath(); //http://localhost:8080/member

 MemberDto memberDto = (MemberDto) request.getAttribute("userinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAFY</title>
</head>
<body>
<div align="center">
<%
if(memberDto == null){
%>
	<p><a href="<%=root%>/user/join.jsp">회원가입</a></p> 
	<p><a href="<%=root%>/user/login.jsp">로그인</a></p>
	
	<div>페이지 관리를 편리하게 하기 위해 ?를 이용</div>
	<p><a href="<%=root%>/main?act=mvregister">회원가입 서블릿</a></p> 
	<p><a href="<%=root%>/main?act=mvlogin">로그인 서블릿</a></p>
<% 
} else{
	%>
<%= memberDto.getUserName() %> 님 안녕하세요.
<a href = "<%=root %>/main?act=logout">로그아웃</a>
<a href = "<%=root %>/user/service.jsp">서비스</a>
<% 	
}
%>
</div>

</body>
</html>