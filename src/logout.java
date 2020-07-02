

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class logout
 */
@WebServlet("/logout")
public class logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("logout.java");

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out=response.getWriter();
		
		response.setContentType("text/html");
			HttpSession session=request.getSession(false);
			
			if(session!=null)
			{
				log.info("logging out : "+session.getAttribute("id"));
				session.setAttribute("id",null);
			}
            session.invalidate();

			log.info("session invalidated" );
				
				String msg="logging out";
		    	response.sendRedirect("index.jsp?msg="+msg);
	}

}
