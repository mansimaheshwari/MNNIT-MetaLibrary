

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

import experiments.AllMethods;

/**
 * Servlet implementation class profileSetn
 */
@WebServlet("/profileSetn")
public class aprofile extends HttpServlet {
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
			
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String pass=request.getParameter("pass");
		System.out.println(phone);
		System.out.println(pass);

		AllMethods am=new AllMethods();
		
		int s=am.adminChange(id,phone,pass);
		if(s>0)
		{
	    	String msg="changed successfully";
			System.out.println(msg);
	    	session.setAttribute("mobile",phone);
	    	session.setAttribute("pass",pass);
			RequestDispatcher rd=request.getRequestDispatcher("aprofile.jsp?msg="+msg);
			rd.forward(request,response);
			
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    	String msg="error occured";
				System.out.println(msg);
		    	response.sendRedirect("aprofile.jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			System.out.println(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		

		
	}

}
