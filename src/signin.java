

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import experiments.AllMethods;

/**
 * Servlet implementation class signin
 */
@WebServlet("/signin")
public class signin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email=request.getParameter("email");
		String cpass=request.getParameter("cpass");
		String designation=request.getParameter("designation");
		
		try {
			
			AllMethods am=new AllMethods();
			ResultSet rs=am.signin(email,cpass,designation);
            if (rs.next()) 
            {
    			if(designation.equals("Admin"))
    			{
    	            request.setAttribute("details", rs);
    				RequestDispatcher rd=request.getRequestDispatcher("aprofile.jsp");
    				rd.forward(request,response);
    			}
    			else
    			{            	
    				Blob blob = rs.getBlob("image");
    				String image=am.getImage(blob);
    				request.setAttribute("image", image);    				

    	            System.out.println("AllMethods...");
    				
    	            request.setAttribute("details", rs);
    	            System.out.println("hiiii....");
    				if(designation.equals("Student"))
    				{
    					RequestDispatcher rd=request.getRequestDispatcher("sprofile.jsp");
    					rd.forward(request,response);
				
    				}
    				else
    				{
    					RequestDispatcher rd=request.getRequestDispatcher("tprofile.jsp");
    					rd.forward(request,response);
    				}
			
    			}
			}
            else
            {
            	String s="invalid username and password combinatio";
				request.setAttribute("msg", s);
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request,response);            	
            }
		}
		catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
        	String s="invalid username and password combinatio";
			request.setAttribute("msg", s);
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.forward(request,response);
		}
		
		
	}
	
	
	

}
