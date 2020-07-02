

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
@MultipartConfig   
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("signup.java");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String reg=request.getParameter("reg");
		String name=request.getParameter("name");
		String email=request.getParameter("eml");
		String cpass=request.getParameter("cp");
		String mob=request.getParameter("mob");
		String dept=request.getParameter("dept");
        Part pic = request.getPart("pic");
        Part profile = request.getPart("profile");
		String designation=request.getParameter("desn");
		log.info(reg);
		log.info(name);
		log.info(email);
		log.info(cpass);
		log.info(dept);
		log.info(designation);

		
		InputStream ispic=null;

        if (pic != null) {
            // prints out some information for debugging
            log.info(pic.getName());
            log.info(pic.getSize());
            log.info(pic.getContentType());
             
            // obtains input stream of the upload file
            ispic = pic.getInputStream();
        }
        if (profile != null) 
        {
            InputStream is = null;
            
    		try {
     
     
                is = profile.getInputStream();  // to get the body of the request as binary data
     
                byte[] bytes = is.readAllBytes();;
                is.read(bytes);

            
			AllMethods am=new AllMethods();
			int s=am.signup(reg,name,email,cpass,mob,dept,ispic,bytes,designation);
			if(s>0)
			{
		    	String msg="registered successfully";
	        	response.sendRedirect("index.jsp?msg="+msg);
			}
			else
			{
		    	String msg="registration no. already registered";
	        	response.sendRedirect("index.jsp?msg="+msg);
		}

    }catch (ClassNotFoundException | IOException | SQLException e) {
    	String msg="error occured";
    	response.sendRedirect("index.jsp?msg="+msg);
		e.printStackTrace();
	}
   }
	}

}
