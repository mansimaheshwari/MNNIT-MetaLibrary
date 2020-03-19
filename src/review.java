

import java.io.IOException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import experiments.AllMethods;

/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class review extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("nm");
		String email=request.getParameter("el");
		String edu=request.getParameter("edu");
		String prof=request.getParameter("prof");
		String review=request.getParameter("review");
	
	
		
		try {
			
			AllMethods am=new AllMethods();
			int c=am.review(name,email,edu,prof,review);
			String s=null;
            if (c>0) 
            {
            	s="review submitted";	

			}
            else
            {
            	s="review not submitted";
            }
			request.setAttribute("msg", s);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request,response);            
		}
		catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
        	String s="review not submitted";
			request.setAttribute("msg", s);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request,response);
		}
		
		
	}
	
	
	

}
