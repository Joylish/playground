<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.member.dto.MemberDto" %>
<%
String root = request.getContextPath();
//request.getAttribute 리턴타입은 object
MemberDto memberDto = (MemberDto) request.getAttribute("userinfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(memberDto != null){ // 로그인 중
%>
로그인시 일반적인 서비스
<%	
}else{ // 로그인 안함
	response.sendRedirect(request.getContextPath()+"user/login.jsp");
}
%>

</body>
</html>