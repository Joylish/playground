package com.ssagibang.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssagibang.model.dto.PageInfo;
import com.ssagibang.model.dto.User;
import com.ssagibang.model.service.UserService;

@WebServlet
public class UserController {
	private UserService userService = new UserService();

	public PageInfo process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		// /user/xxx.do
		String url = request.getServletPath().substring(5);
		if (url.equals("/login.do")) {
			return login(request, response);
		} else if (url.equals("/logout.do")) {
			return logout(request, response);
		} else if (url.equals("/mypage.do")) {
			return mypage(request, response);
		} else if (url.equals("/register.do")) {
			return register(request, response);
		}else if (url.equals("/list.do")) {
			return list(request, response);
		}
		return null;
	}

	private PageInfo list(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		System.out.println("userCtr_list");
		List<User> userList = userService.list();
		request.setAttribute("userList", userList);
		return new PageInfo("/list.jsp", true);
	}

	private PageInfo logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("name");
		return new PageInfo("/index.jsp", false);
	}

	//회원가입
	private PageInfo register(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String userName = request.getParameter("username");
		String userId = request.getParameter("userid");
		String userPwd = request.getParameter("userpwd");
		String email = request.getParameter("emailid");
		String address = request.getParameter("address");
		User user = new User(userId, userName, userPwd, email, address);
				
		if(userService.register(user)) {
			System.out.println("가입성공");
		}else {
			System.out.println("가입실패");
		}
		return new PageInfo("/index.jsp", false);
	}

	private PageInfo login(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		
		String name = userService.login(userId, password);
		if (name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("name", name);
			return new PageInfo("/index.jsp", false);
		}
		request.setAttribute("failMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
		return new PageInfo("/index.jsp", true);
	}

	private PageInfo mypage(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = userService.getUser(userId);

		request.setAttribute("user", user);
		return new PageInfo("/mypage.jsp", true);
	}

}
