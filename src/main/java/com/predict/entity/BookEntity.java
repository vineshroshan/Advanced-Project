package com.predict.entity;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.predict.context.RunServletContextClass;

public class BookEntity {
	private String ISBN,BookTitle,BookAuthor,Publisher;
	private int YearOfPublication;
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getBookTitle() {
		return BookTitle;
	}
	public void setBookTitle(String bookTitle) {
		BookTitle = bookTitle;
	}
	public String getBookAuthor() {
		return BookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		BookAuthor = bookAuthor;
	}
	public String getPublisher() {
		return Publisher;
	}
	public void setPublisher(String publisher) {
		Publisher = publisher;
	}
	public int getYearOfPublication() {
		return YearOfPublication;
	}
	public void setYearOfPublication(int yearOfPublication) {
		YearOfPublication = yearOfPublication;
	}
	
	public ArrayList<BookEntity> retriveBooks(String bookString) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		RunServletContextClass runServletContextClass= new RunServletContextClass(new RunServletContextClass().isLocal());
		Connection con = (Connection) DriverManager.getConnection(runServletContextClass.getConnectionString(), runServletContextClass.getUserName(), runServletContextClass.getPassword());
        Statement st = (Statement) con.createStatement();
        ResultSet rs = st.executeQuery("select * from books where `book-title` like '"+bookString+"'");
        ArrayList<BookEntity> Books = new ArrayList<BookEntity>();
        while(rs.next())
        {
        	BookEntity book= new BookEntity();
        	book.ISBN = rs.getString("ISBN");
        	book.BookTitle = rs.getString("Book-Title");
        	book.BookAuthor = rs.getString("Book-Author");
        	book.Publisher = rs.getString("Publisher");
        	book.YearOfPublication = rs.getInt("Year-Of-Publication");
        	Books.add(book);
        }
        return Books;
	}
	
	

}
