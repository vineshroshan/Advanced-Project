package com.predict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.predict.entity.LoginEntity;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ServletConfig cfg;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init(ServletConfig cfg) throws ServletException {
		// TODO Auto-generated method stub
		super.init(cfg);
		this.cfg=cfg;
		System.out.println("hello world!!");
		System.out.print(cfg.getInitParameter("LocalConnectionString"));
		System.out.println("printing conecxt string");
		System.out.println(getServletContext().getInitParameter("LocalConnectionString"));
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userName=request.getParameter("Login");
		String password=request.getParameter("Password");
		PrintWriter out= response.getWriter();
		out.print(userName);
	    out.print(password);
	    LoginEntity login = new LoginEntity();
	    System.out.println("Hello!!");
	    System.out.println(getServletContext().getInitParameter("LocalUserName"));
	    try {
			if(login.check(userName, password))
			{
				out.print("authentication successful");
				response.sendRedirect("BookSearch.jsp");
			}
			else
			{
				out.print("authentication failed");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.print(e.getMessage());
		}
	    
	}

}
