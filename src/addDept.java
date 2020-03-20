

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import experiments.AllMethods;

/**
 * Servlet implementation class addDept
 */
@WebServlet("/addDept")
public class addDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
		String dept=request.getParameter("dept");
		System.out.println(dept);

		AllMethods am=new AllMethods();
		int s;
		
			s = am.addDept(dept);
		
		if(s>0)
		{
	    	String msg="added successfully";
			request.setAttribute("msg", msg);
			RequestDispatcher rd=request.getRequestDispatcher("adddept.jsp");
			rd.forward(request,response);
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
