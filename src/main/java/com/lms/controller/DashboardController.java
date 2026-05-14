package com.lms.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lms.pojo.Book;
import com.lms.pojo.BookIssued;
import com.lms.pojo.DashboardStats;
import com.lms.service.BookService;
import com.lms.service.DashboardService;
import com.lms.serviceImpl.BookServiceImpl;
import com.lms.serviceImpl.DashboardServiceImpl;

/**
 * Servlet implementation class DashboardController
 */
@WebServlet("/DashboardController")
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DashboardService dashboardService = new DashboardServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("viewDashboard".equalsIgnoreCase(action)) {
			DashboardService dashboardService = new DashboardServiceImpl();
			DashboardStats dashboardStats = dashboardService.getDashboardStats();
			
			BookService bookService = new BookServiceImpl();
			List<BookIssued> issuedList = bookService.getIssuedBookListForDashboard();
			
			if(issuedList != null && issuedList.size() > 0) {
				LocalDate today = LocalDate.now();
				
				for (BookIssued bookIssued : issuedList) {
					LocalDate dueDate = bookIssued.getDueDate();
					
					if(dueDate.isBefore(today)) {
						bookIssued.setDueDayStatus("Overdue");
					}
					else if(dueDate.isEqual(today)) { 
						bookIssued.setDueDayStatus("Due Today");
					}
					else {
						bookIssued.setDueDayStatus("Active");
					}
				}
			}	
			request.setAttribute("issuedList", issuedList);
			request.setAttribute("dashboardStats", dashboardStats);
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/dashboard.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/error.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
