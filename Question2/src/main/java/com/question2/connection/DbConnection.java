package com.question2.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
	String url = "jdbc:mysql://localhost:3306/STUDENT";
	String user = "root";
	String password = "root";
	Connection con;
	Statement stmt;
	public DbConnection() throws ClassNotFoundException, SQLException {
		//loading and register driver.
		Class.forName("com.mysql.jdbc.Driver");
		//connecting to database.
		con = DriverManager.getConnection(url,user,password);
		//creating statement object (Statement object is used to pass query to database).
		stmt = con.createStatement();
	}
	//used for selecting the query.
	public ResultSet select(String qry) throws SQLException {
		//we use ResultSet to read data from database.
		ResultSet rs = stmt.executeQuery(qry);
		return rs;	
	}
	//used for updating the query.
	public void update(String qry) throws SQLException {
		stmt.executeUpdate(qry);
	}

}
