

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class picupload
 */
@WebServlet("/picupload")
@MultipartConfig   
public class changepic extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("changepic.java");


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
			
			String id=(String)session.getAttribute("id");

			String stype=(String)session.getAttribute("signintype");

			Part pic = request.getPart("pic");

			InputStream ispic=null;

			if (pic != null) {
    // prints out some information for debugging
				log.info(pic.getName());
				log.info(pic.getSize());
				log.info(pic.getContentType());
     
    // obtains input stream of the upload file
				ispic = pic.getInputStream();
			}
			AllMethods am=new AllMethods();
			int s=0;
			String path=null,image=null;
			ResultSet rs=null;
			if(stype!=null){

				log.info("not null");
				if(stype.equals("teacher"))
				{
					rs=am.getTeacher(id);
					s=am.teachChange(id,ispic);
					log.info("teacher");
					path="tprofile";  				

				}
				else if(stype.equals("student"))
				{	
					rs=am.getStudent(id);
					s=am.stuChange(id,ispic);
					path="sprofile";
				}
			if(s>0)
			{
				if(rs.next())
				{
				Blob blob = rs.getBlob("image");
				image=am.getImage(blob);
				session.setAttribute("image", image);    				

				String msg="refresh the page to see changes";
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
				log.info(msg);
		    	response.sendRedirect("tprofile.jsp?msg="+msg);
		}
		catch(Exception e)
		{
	    	String msg="you have signed out";
			log.info(msg);
			response.sendRedirect("index.jsp?msg="+msg);
		}
		

		
	}

}
