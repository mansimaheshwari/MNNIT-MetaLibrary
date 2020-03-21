

import java.io.IOException;
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
 * Servlet implementation class addCourse
 */
@WebServlet("/addCourse")
public class insertCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
			
			System.out.println("session:java:id: " + session.getAttribute("id"));
			/*
			String id=(String)session.getAttribute("id");
			String aname=(String)session.getAttribute("name");
			String email=(String)session.getAttribute("email");
			String mobile=(String)session.getAttribute("mobile");
			*/
			String dept=request.getParameter("department");
		String name=request.getParameter("name");
		System.out.println(dept);
		System.out.println(name);

		AllMethods am=new AllMethods();
		int s;
		
			s = am.addCoure(dept,name);
		
		if(s>0)
		{
	    	String msg="added successfully";
			System.out.println(msg);
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
			System.out.println(msg);
	    	response.sendRedirect("insertCourse.jsp?msg="+msg);
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {

	    	String msg="error occured";
			System.out.println(msg);
	    	response.sendRedirect("insertCourse.jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			System.out.println(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		
	}

}
