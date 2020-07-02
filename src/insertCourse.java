

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class addCourse
 */
@WebServlet("/addCourse")
public class insertCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("insertCourse.java");

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
			
			log.info("session:java:id: " + session.getAttribute("id"));
			/*
			String id=(String)session.getAttribute("id");
			String aname=(String)session.getAttribute("name");
			String email=(String)session.getAttribute("email");
			String mobile=(String)session.getAttribute("mobile");
			*/
			String dept=request.getParameter("department");
		String doamin=request.getParameter("doamin");
		log.info(dept);
		log.info(doamin);

		AllMethods am=new AllMethods();
		int s;
		
			s = am.addCourse(dept,doamin);
		
		if(s>0)
		{
	    	String msg="added successfully";
			log.info(msg);
			/*
			session.setAttribute("id", id);
			session.setAttribute("name", aname);
			session.setAttribute("email", email);
			session.setAttribute("mobile", mobile);
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request,response);
			*/
	    	response.sendRedirect("insertCourse.jsp?msg="+msg);
		}
		else
		{
	    	String msg="already existed";
			log.info(msg);
	    	response.sendRedirect("insertCourse.jsp?msg="+msg);
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {

	    	String msg="error occured";
			log.info(msg);
	    	response.sendRedirect("insertCourse.jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			log.info(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		
	}

}
