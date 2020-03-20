

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
			HttpSession session=request.getSession(false);
			
			if(session!=null)
			{
				System.out.println("session");
				session.setAttribute("details",null);
			}
            session.invalidate();

			System.out.println("session");

				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request,response);




	}

}
