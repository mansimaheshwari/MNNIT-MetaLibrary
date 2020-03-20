

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import experiments.AllMethods;

/**
 * Servlet implementation class addCourse
 */
@WebServlet("/addCourse")
public class addCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
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
			request.setAttribute("msg", msg);
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request,response);
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
