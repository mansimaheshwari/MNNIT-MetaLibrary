

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
 * Servlet implementation class tprofile
 */
@WebServlet("/changeprofile")
public class changeprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("changeprofile.java");

  
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession(false);
		String path=null;

		try {

			if(session.getAttribute("id")==null)
			{
				throw new Exception();
			}

			String id=(String)session.getAttribute("id");

			String stype=(String)session.getAttribute("signintype");

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String pass=request.getParameter("pass");
		log.info(phone);
		log.info(pass);

		AllMethods am=new AllMethods();
		int s=0;
		if(stype.equals("teacher"))
		{
			s=am.teachChange(id,phone,pass);
			
			log.info("teacher");
			path="tprofile";  				

		}
		else if(stype.equals("student"))
		{	
			s=am.stuChange(id,phone,pass);
			log.info("student");
			path="sprofile";
		}
		else if(stype.equals("admin"))
		{	
			s=am.adminChange(id,phone,pass);
			log.info("admin");
			path="aprofile";
		}
		if(s>0)
		{
	    	String msg="changed successfully";
			log.info(msg);
	    	session.setAttribute("mobile",phone);
	    	session.setAttribute("pass",pass);
			RequestDispatcher rd=request.getRequestDispatcher(path+".jsp?msg="+msg);
			rd.forward(request,response);
			
		}
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    	String msg="error occured";
				log.info(msg);
		    	response.sendRedirect(path+".jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			log.info(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		

		
	}

}
