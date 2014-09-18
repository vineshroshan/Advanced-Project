package com.predict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.predict.entity.BookEntity;

/**
 * Servlet implementation class BookSearch
 */
public class BookSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearch() {
        super();
        // TODO Auto-generated constructor stub
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
		String bookString=request.getParameter("bookname");
		PrintWriter out= response.getWriter();
		BookEntity bookEntity= new BookEntity();
		ArrayList<BookEntity> Books= new ArrayList<BookEntity>();
 		try {
			Books=bookEntity.retriveBooks(bookString);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 			for(BookEntity bookEntity1: Books)
 			{
 				out.print(bookEntity1.getBookAuthor());
 				out.print(bookEntity1.getBookTitle());
 				out.print(bookEntity1.getPublisher());
 			}
	}

}
