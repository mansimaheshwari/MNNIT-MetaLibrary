

import java.io.IOException;
import java.sql.ResultSet;
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
 * Servlet implementation class getdeptdomain
 */
@WebServlet("/getdeptdomain")
public class getdeptdomain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("getdeptdomain.java");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String dept=request.getParameter("deptmt");
		if(dept=="")
		{
			log.info("invalid department selected");
			response.sendRedirect("index.jsp?msg=Select a valid department");
		}
		else 
		{
		log.info(dept);
		ResultSet rs=null;
		try
		{
				AllMethods am=new AllMethods();
				rs=am.deptdomain(dept);
				
				request.setAttribute("deptdomain", rs);
				RequestDispatcher rd=request.getRequestDispatcher("showspecificdomain.jsp");
				rd.forward(request,response);
			 
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
