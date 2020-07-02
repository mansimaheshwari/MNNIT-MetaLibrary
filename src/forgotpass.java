

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class forgotpass
 */
@WebServlet("/forgotpass")
public class forgotpass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("forgotpass.java");
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String reg=request.getParameter("r");
		String name=request.getParameter("n");
		String email=request.getParameter("e");
		String mob=request.getParameter("m");
		String designation=request.getParameter("d");
		
		log.info(reg);
		log.info(name);
		log.info(email);
		log.info(mob);
		log.info(designation);

		try 
		{
			AllMethods am=new AllMethods();
			String s=am.forgotpass(reg,name,email,mob,designation);
			log.info(reg);
			log.info(name);
			log.info(email);
			log.info(mob);
			log.info(designation);
			
			if(s != null)
			{
	        	response.sendRedirect("index.jsp?msg="+s);
			}
			else
			{
		    	s="enter valid details";
		    	response.sendRedirect("index.jsp?msg="+s);
			}

    }catch (ClassNotFoundException | IOException | SQLException e) {
    	String s="error occured";
    	response.sendRedirect("index.jsp?msg="+s);
		e.printStackTrace();
	}
   }
	

}
