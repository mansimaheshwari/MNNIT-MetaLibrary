

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
public class cv extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		AllMethods am=new AllMethods();
		String tid=request.getParameter("tid");
		try {
			ResultSet rs;
			String desig=request.getParameter("desig");
			if(desig.equals("teacher"))
				rs=am.getTeacher(tid);
			else
				rs=am.getStudent(tid);
			System.out.println(tid);
			if(rs.next())
			{
				Blob blob=rs.getBlob("profile");
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
        	System.out.println("error");
        }
	} catch (IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
