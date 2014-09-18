package com.predict.entity;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.predict.context.RunServletContextClass;
public class UserAuthorPublisherRatingEntity {
		private Integer UserID,BookAuthorWeightedValue,PublisherWeightedValue;
		
		
		public Integer getUserID() {
			return UserID;
		}


		public void setUserID(Integer userID) {
			UserID = userID;
		}


		public Integer getBookAuthorWeightedValue() {
			return BookAuthorWeightedValue;
		}


		public void setBookAuthorWeightedValue(Integer bookAuthorWeightedValue) {
			BookAuthorWeightedValue = bookAuthorWeightedValue;
		}


		public Integer getPublisherWeightedValue() {
			return PublisherWeightedValue;
		}


		public void setPublisherWeightedValue(Integer publisherWeightedValue) {
			PublisherWeightedValue = publisherWeightedValue;
		}


		public ArrayList<UserAuthorPublisherRatingEntity> retriveRows() throws ClassNotFoundException, SQLException
		{
			Class.forName("com.mysql.jdbc.Driver");
			RunServletContextClass runServletContextClass= new RunServletContextClass(new RunServletContextClass().isLocal());
			Connection con = (Connection) DriverManager.getConnection(runServletContextClass.getConnectionString(), runServletContextClass.getUserName(), runServletContextClass.getPassword());
	        Statement st = (Statement) con.createStatement();
	        ResultSet rs = st.executeQuery("select * from userauthpubratings");
	        ArrayList<UserAuthorPublisherRatingEntity> userPublisherAuthors = new ArrayList<UserAuthorPublisherRatingEntity>();
	        while(rs.next())
	        {
	        	UserAuthorPublisherRatingEntity userPublisherAuthor= new UserAuthorPublisherRatingEntity();
	        	userPublisherAuthor.UserID = rs.getInt("userID");
	        	userPublisherAuthor.BookAuthorWeightedValue = rs.getInt("AuthorRating");
	        	userPublisherAuthor.PublisherWeightedValue = rs.getInt("PublisherRating");
	        	userPublisherAuthors.add(userPublisherAuthor);
	        }
	        return userPublisherAuthors;
		}
		
		

	}

