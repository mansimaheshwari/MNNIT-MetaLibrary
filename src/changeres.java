

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import experiments.AllMethods;

/**
 * Servlet implementation class resupload
 */
@WebServlet("/resupload")
@MultipartConfig
public class changeres extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

	        Part profile = request.getPart("profile");

	            InputStream is = null;
	            
	                is = profile.getInputStream();  // to get the body of the request as binary data
	     
	                byte[] bytes = is.readAllBytes();;
	                is.read(bytes);
	         

			AllMethods am=new AllMethods();
			int s=0;
			ResultSet rs=null;
			if(stype!=null){

				System.out.println("not null");
				if(stype.equals("teacher"))
				{
					rs=am.getTeacher(id);
					s=am.teachChange(id,bytes);
					System.out.println("teacher");
					path="tprofile";  				

				}
				else if(stype.equals("student"))
				{	
					rs=am.getStudent(id);
					s=am.stuChange(id,bytes);
					path="sprofile";
				}
			if(s>0)
			{
				if(rs.next())
				{
				String msg="uploaded";
				RequestDispatcher rd=request.getRequestDispatcher(path+".jsp?msg="+msg);
				rd.forward(request,response);
				}
				else
				{
					RequestDispatcher rd=request.getRequestDispatcher(path+".jsp?msg=empty");
					rd.forward(request,response);
				}
			}
			else
			{
				String msg="not changed";
				RequestDispatcher rd=request.getRequestDispatcher(path+".jsp?msg="+msg);
				rd.forward(request,response);
			}

		}
		else
		{
			String msg="signin first";
			response.sendRedirect("index.jsp?msg="+msg);
		}


		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	    	String msg="error occured";
				System.out.println(msg);
		    	response.sendRedirect(path+".jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			System.out.println(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		

		
	}

}
