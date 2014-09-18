package com.predict.dto;

public class Book {

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
	
}
