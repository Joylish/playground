package com.ssagibang.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssagibang.model.dto.PageInfo;
import com.ssagibang.model.dto.User;

@WebServlet("*.do")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserController userController = new UserController();
	private BoardController boardController = new BoardController();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String url = request.getServletPath();
			PageInfo pageInfo = null;

			if (url.startsWith("/user")) {
				pageInfo = userController.process(request, response);
			} else if (url.startsWith("/board")) {
				pageInfo = boardController.process(request, response);
			}

			if (pageInfo.isForward()) {
				request.getRequestDispatcher(pageInfo.getUrl()).forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath()+pageInfo.getUrl());
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage",  e.getMessage());
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}

	}

}
