

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class review
 */
@WebServlet("/review")
public class insertReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("insertReview.java");

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
			int c=am.insertReview(name,email,edu,prof,review);
			String s=null;
            if (c>0) 
            {
            	s="review submitted";	
            	log.info(s);

			}
            else
            {
            	s="review not submitted";
            }
			response.sendRedirect("index.jsp?msg="+s);            
		}
		catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
        	String s="review not submitted";
			response.sendRedirect("index.jsp?msg="+s); 
		}
	}
}
