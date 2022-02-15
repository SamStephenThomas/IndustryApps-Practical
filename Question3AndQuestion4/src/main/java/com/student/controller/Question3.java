package com.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Question3
 */
@WebServlet("/Question3")
public class Question3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Question3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//used to print output in browser
				PrintWriter out = response.getWriter();
				//setting the content type to html
				response.setContentType("text/html");
				
				try {
					//Connecting with database
					DbConnection db = new DbConnection();
					String qry1 ="SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))";
					db.Update(qry1);
					String qry = "Select concat(FirstName,' ',LastName) as Name1, EC1,EC2,EC3,EC4,EC5 , SUM((EC1)+(EC2)+(EC3)+(EC4)+(EC5)) AS TOTAL, CASE when EC1<30 then 'Fail' when EC2<30 then 'Fail' when EC3<30 then 'Fail' when EC4<30 then 'Fail' when EC5<30 then 'Fail' ELSE 'Pass' End Result From Student_Details join Mark_info on Student_Details.StudentId = Mark_info.StudentId GROUP BY Name1";
					ResultSet rs = db.Select(qry);
					out.println("<html><body>");
					out.println("<table border=1 style='border-collapse:collapse'>");
					out.println("<tr>"
							+"<th>Name</th>"
							+ "<th>EC1</th>"
							+ "<th>EC2</th>"
							+ "<th>EC3</th>"
							+ "<th>EC4</th>"
							+ "<th>EC5</th>"
							+ "<th>Total</th>"
							+ "<th>Result</th>"
							+ "</tr>");
					while(rs.next()) {
						String name = rs.getString(1);
						int ec1 = rs.getInt(2);
						int ec2 = rs.getInt(3);
						int ec3 = rs.getInt(4);
						int ec4 = rs.getInt(5);
						int ec5 = rs.getInt(6);
						int total= rs.getInt(7);
						String result = rs.getString(8);
						
						out.println("<tr><td>"+name+"</td>"
								+ "<td>"+ec1+"</td>"
								+ "<td>"+ec2+"</td>"
								+ "<td>"+ec3+"</td>"
								+ "<td>"+ec4+"</td>"
								+ "<td>"+ec5+"</td>"
								+ "<td>"+total+"</td>"
								+ "<td>"+result+"</td>"
								+ "</tr>");
					}
					out.println("</table>");
					out.println("</html></body>");
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
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
