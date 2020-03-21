

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

import experiments.AllMethods;

/**
 * Servlet implementation class delete
 */
@WebServlet("/delete")
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
				System.out.println(tid);
				path="Teacher";
			}
			else if(desig.equals("student"))
			{
				String sid=request.getParameter("sid");
				rs=am.deleteStudent(sid);
				System.out.println(sid);
				path="Student";
			}
			else if(desig.equals("book"))
			{
				String isbn=request.getParameter("isbn");
				rs=am.deleteBook(isbn);
				System.out.println(isbn);
				path="Book";
			}
			else if(desig.equals("repo"))
			{
				String rid=request.getParameter("rid");
				rs=am.deleteRepo(rid);
				System.out.println(rid);
				path="Repo";
			}
			
			if(rs>0)
			{
				s="deleted";
			}
			else 
			{
            	s="cannot be deleted";	
			}
				System.out.println(s);
		    	response.sendRedirect("delete"+path+".jsp?msg="+s);
			
	} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			System.out.println(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
	}

}
