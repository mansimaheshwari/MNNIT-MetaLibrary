
//  show documents on browser


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Clob;

import experiments.AllMethods;

/**
 * Servlet implementation class cv
 */
@WebServlet("/cv")
public class showResume_cv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AllMethods am=new AllMethods();
		try {
			ResultSet rs=null;
			Blob blob=null;
			String val=null;
			String desig=request.getParameter("desig");
			if(desig.equals("teacher"))
			{
				String tid=request.getParameter("tid");
				rs=am.getTeacher(tid);
				System.out.println(tid);
				val="profile";
			}
			else if(desig.equals("student"))
			{
				String sid=request.getParameter("sid");
				rs=am.getStudent(sid);
				System.out.println(sid);
				val="profile";
			}
			/*
			else if(desig.equals("book"))
			{
				String isbn=request.getParameter("isbn");
				rs=am.getBook(isbn);
				System.out.println(isbn);
				val="book";
			}
			else if(desig.equals("repo"))
			{
				String rid=request.getParameter("rid");
				rs=am.getrepo(rid);
				System.out.println(rid);
				val="repo";
			}
			*/
			
			if(rs.next())
			{
				blob=rs.getBlob(val);
	            InputStream inputStream = blob.getBinaryStream();
	            int fileLength = inputStream.available();
	             
	            System.out.println("fileLength = " + fileLength);
	             
	            // set content properties and header attributes for the response
				response.setContentType("text/html");
	            response.setContentLength(fileLength);
	            // writes the file to the client
	            OutputStream outStream = response.getOutputStream();
	            byte[] buffer = new byte[1024];
	            int bytesRead = -1;
	             
	            while ((bytesRead = inputStream.read(buffer)) != -1) {
	                outStream.write(buffer, 0, bytesRead);
	            }
	            inputStream.close();
	            outStream.close();    
		}
        else
        {
        	String s="can't display";
        	response.sendRedirect("index.jsp?msg="+s);
        	
        }
	} catch (IOException | SQLException  | ClassNotFoundException e) {
		e.printStackTrace();
    	String s="error occured";
    	response.sendRedirect("index.jsp?msg="+s);
		}
	}

}
