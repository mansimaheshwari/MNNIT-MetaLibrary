

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
 * Servlet implementation class forgotpass
 */
@WebServlet("/forgotpass")
public class forgotpass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String reg=request.getParameter("r");
		String name=request.getParameter("n");
		String email=request.getParameter("e");
		String mob=request.getParameter("m");
		String designation=request.getParameter("d");
		
		System.out.println(reg);
		System.out.println(name);
		System.out.println(email);
		System.out.println(mob);
		System.out.println(designation);

		try 
		{
			AllMethods am=new AllMethods();
			String s=am.forgotpass(reg,name,email,mob,designation);
			System.out.println(reg);
			System.out.println(name);
			System.out.println(email);
			System.out.println(mob);
			System.out.println(designation);
			
			if(s != null)
			{
				request.setAttribute("msg",s);
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request,response);
			}

    }catch (ClassNotFoundException | IOException | SQLException e) {
    	String s="exception occured";
		request.setAttribute("msg", s);
		RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		rd.forward(request,response);
		e.printStackTrace();
	}
   }
	

}
