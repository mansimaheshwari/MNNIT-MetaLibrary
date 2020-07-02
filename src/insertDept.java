

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class addDept
 */
@WebServlet("/addDept")
public class insertDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("insertDept.java");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session=request.getSession(false);

		try {

			if(session.getAttribute("id")==null)
			{
				throw new Exception();
			}
			
		String dept=request.getParameter("dept");
		log.info(dept);

		AllMethods am=new AllMethods();
		int s;
		
			s = am.addDept(dept);
		
		if(s>0)
		{
	    	String msg="added successfully";
			request.setAttribute("msg", msg);
			response.sendRedirect("insertdept.jsp?msg="+msg);
		}
		else
		{
	    	String msg="already existed";
			log.info(msg);
	    	response.sendRedirect("insertdept.jsp?msg="+msg);
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {

	    	String msg="error occured";
			log.info(msg);
	    	response.sendRedirect("insertdept.jsp?msg="+msg);
	    	
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			log.info(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		
	}

}
