

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;
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
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("delete.java");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AllMethods am=new AllMethods();
		HttpSession session=request.getSession(false);

		try {

			if(session.getAttribute("id")==null)
			{
				throw new Exception();
			}
			int rs=0;
			String desig=request.getParameter("desig");

        	String s=null,path=null;
        	
			if(desig.equals("teacher"))
			{
				String tid=request.getParameter("tid");
				rs=am.deleteTeacher(tid);
				log.info(tid);
				path="Teacher";
			}
			else if(desig.equals("student"))
			{
				String sid=request.getParameter("sid");
				rs=am.deleteStudent(sid);
				log.info(sid);
				path="Student";
			}
			else if(desig.equals("book"))
			{
				String isbn=request.getParameter("isbn");
				rs=am.deleteBook(isbn);
				log.info(isbn);
				path="Book";
			}
			else if(desig.equals("repo"))
			{
				String rid=request.getParameter("rid");
				rs=am.deleteRepo(rid);
				log.info(rid);
				
				String stype=(String)session.getAttribute("signintype");
				if(stype.equals("teacher"))
						{
					log.info(rid);
					RequestDispatcher rd=request.getRequestDispatcher("tdeleteRepo.jsp?msg=deleted");
			    	rd.forward(request, response);
					
						}
				else 
				{
					path="Repo";
				}
			}
			else if(desig.equals("review"))
			{
				String id=request.getParameter("id");
				rs=am.deleteReview(id);
				log.info(id);
				path="Review";
			}
			else if(desig.equals("dept"))
			{
				String dept=request.getParameter("dept");
				rs=am.deleteDept(dept);
				log.info(dept);
				path="Dept";
			}
			else if(desig.equals("domain"))
			{
				String domain=request.getParameter("domain");
				String dept=request.getParameter("department");
				rs=am.deleteDomain(dept,domain);
				log.info(domain);
				path="Domain";
			}
			
			if(rs>0)
			{
				s="deleted";
			}
			else 
			{
            	s="cannot be deleted";	
			}
				log.info(s);
		    	response.sendRedirect("delete"+path+".jsp?msg="+s);
			
	} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}catch(Exception e)
		{
	    	String msg="you have signed out";
			log.info(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
	}

}
