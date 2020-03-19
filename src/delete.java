

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
		try {
			int rs=0;
			String desig=request.getParameter("desig");

        	String s;
        	
			if(desig.equals("teacher"))
			{
				String tid=request.getParameter("tid");
				rs=am.deleteTeacher(tid);
				System.out.println(tid);
			}
			else if(desig.equals("student"))
			{
				String sid=request.getParameter("sid");
				rs=am.deleteStudent(sid);
				System.out.println(sid);
			}
			else if(desig.equals("book"))
			{
				String isbn=request.getParameter("isbn");
				rs=am.deleteBook(isbn);
				System.out.println(isbn);
			}
			else if(desig.equals("repo"))
			{
				String rid=request.getParameter("rid");
				rs=am.deleteRrpo(rid);
				System.out.println(rid);
			}
			
			if(rs>0)
			{
				s="deleted";
			}
			else 
			{
            	s="cannot be deleted";				
			}

			request.setAttribute("msg", s);
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request,response);     
	} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
