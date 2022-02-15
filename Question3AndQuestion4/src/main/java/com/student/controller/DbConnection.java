package com.student.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConnection {
	Connection con;
	Statement stmt;
	public DbConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student","root","root");
		stmt = con.createStatement();
	}
	
	public void Update(String s) throws SQLException {
		stmt.executeUpdate(s);
	}

	public ResultSet Select(String s) throws SQLException {
		ResultSet rs = stmt.executeQuery(s);
		return rs;
	}
	
	public int prepare(String s) throws SQLException {
		PreparedStatement ps = con.prepareStatement(s,Statement.RETURN_GENERATED_KEYS);
		int id=0;
		ps.executeUpdate();
		ResultSet rs1 = ps.getGeneratedKeys();
		if(rs1.next()) {
			id = rs1.getInt(1);
		}
		return id;
	}
}
