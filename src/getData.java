
//   for search



import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import experiments.AllMethods;

/**
 * Servlet implementation class getData
 */
@WebServlet("/getData")
public class getData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String dept=request.getParameter("department");
		String domain=request.getParameter("domain");
		String types=request.getParameter("types");
		String teacher=request.getParameter("teacher");
		System.out.println(domain);
		System.out.println("type..." + types);
		ResultSet rs=null;
		try
		{
			if(types.equals("books"))
			{
				AllMethods am=new AllMethods();
				rs=am.getBook(dept,domain);
				
				request.setAttribute("books", rs);
				RequestDispatcher rd=request.getRequestDispatcher("showdatabooks.jsp");
				rd.forward(request,response);
			}
			else
			{
				System.out.println(teacher);
				AllMethods am=new AllMethods();
				rs=am.getrepo(dept,domain,teacher,types);
				
				request.setAttribute("repo", rs);
				RequestDispatcher rd=request.getRequestDispatcher("showdatarepo.jsp");
				rd.forward(request,response);
				
			}
			
			 
		}catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
