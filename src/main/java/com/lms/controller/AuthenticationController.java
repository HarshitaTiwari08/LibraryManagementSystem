package com.lms.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lms.pojo.User;
import com.lms.service.UserService;
import com.lms.serviceImpl.UserServiceImpl;

/**
 * Servlet implementation class AuthenticationController
 */
@WebServlet("/AuthenticationController")
public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if("checkLogin".equalsIgnoreCase(action)) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			UserService userService = new UserServiceImpl();
			User user = userService.checkLogin(username, password);
			if(user != null) {
				HttpSession session =  request.getSession();
				session.setAttribute("user", user);
				response.sendRedirect("DashboardController?action=viewDashboard");
			}
			else {
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
				dispatcher.forward(request, response);
			}
		}
		else if("showLogin".equalsIgnoreCase(action)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		else if("signOut".equalsIgnoreCase(action)) {
			HttpSession session = request.getSession();
			if(session != null) {
				session.invalidate();
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
