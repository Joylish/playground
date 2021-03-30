package com.ssafy.member.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.member.dto.MemberDto;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
		super.init();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		
		if("mvregister".equals(act)) {
			response.sendRedirect(root + "/user/join.jsp");
		}else if("mvlogin".equals(act)) {
			response.sendRedirect(root + "/user/login.jsp");
		}else if("login".equals(act)) {
			login(request, response);
		}
	
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userid");
		String pass =request.getParameter("userpwd");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto memberDto = null;
		try {
			conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ssafyweb?serverTimezone=UTC&useUniCode=yes&characterEncoding=UTF-8", "ssafy", "ssafy");
			StringBuilder getMemberSql = new StringBuilder();
			getMemberSql.append("select username, email \n");
			getMemberSql.append("from ssafy_member \n");
			getMemberSql.append("where userid = ? and userpwd = ?");

			pstmt = conn.prepareStatement(getMemberSql.toString());
			pstmt.setString(1, id);
			pstmt.setString(1, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDto = new MemberDto();
				memberDto.setUserName(rs.getString("username"));
				memberDto.setUserName(rs.getString("email"));
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}// 나중에 AutoCloseable로
		
		
		// servlet 안에서는 절대 html을 직접 만들지않는다
		// jsp로 만든다
		String path = "/index.jsp";
		
		if(memberDto != null) {
			request.setAttribute("userinfo", memberDto);
//			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}else { //실패
			path = "/user/login.jsp";
			HttpSession session = request.getSession();
			session.setAttribute("userInfo", memberDto);
			// request로 데이터를 전달하면 다음페이지 밖에 쓰지못한다.
			// session을 false하기 전까지 session에 저장한 값을 모든 페이지에서 사용할 수 있음
			
			// 4개의 바구니
			request.setAttribute("msg", "가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
//			response.sendRedirect(request.getContextPath()+"/login.jsp");
			// sendrequest에 데이터를 넘기지 못한다 
		}
		
		RequestDispatcher disp = request.getRequestDispatcher(path);
		disp.forward(request, response);
	}

	
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		
		// 세션엔 여러 정보를 저장할 수 있다.
		// 하나씩 지우기 너무 귀찮다;
		// 로그아웃하면서 세션에 저장된 모든 정보 다 지우기
		session.invalidate();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		// 한글이 깨지기 때문에
		// get에서 getPost() 호출하면 post에서 utf-8 지정해주기 때문에 
		// 오히려 한글이 깨지는 경우가 있다.
		doGet(request, response); // post로 와도 get에서 처리
	}

}
