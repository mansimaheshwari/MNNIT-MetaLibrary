

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
import javax.servlet.http.HttpSession;

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


	    //response.setHeader("Cache-Control", "no-store");
	    //response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	    //response.setDateHeader("Expires", 0);
	    
		String email=request.getParameter("email");
		String cpass=request.getParameter("cpass");
		String designation=request.getParameter("designation");
		
		try {
			
			AllMethods am=new AllMethods();
			ResultSet rs=am.signin(email,cpass,designation);
			
			HttpSession session=request.getSession();
            if (rs.next()) 
            {
    			if(designation.equals("Admin"))
    			{
    				session.setAttribute("id", rs.getString("aid"));
    				session.setAttribute("name", rs.getString("aname"));
    				session.setAttribute("email", rs.getString("aemail"));
    				session.setAttribute("mobile", rs.getString("amobile"));
    				session.setAttribute("pass", rs.getString("apass"));
    				session.setAttribute("signintype", "admin");
    				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
    				rd.forward(request,response);
    			}
    			else
    			{            	
    				Blob blob = rs.getBlob("image");
    				String image=am.getImage(blob);
    				session.setAttribute("image", image);    				

    	            System.out.println("AllMethods...");
    				
    	            session.setAttribute("details", rs);
    	            System.out.println("hiiii....");
    				if(designation.equals("Student"))
    				{
        				session.setAttribute("id", rs.getString("sid"));
        				session.setAttribute("name", rs.getString("sname"));
        				session.setAttribute("email", rs.getString("semail"));
        				session.setAttribute("mobile", rs.getString("smobile"));
        				session.setAttribute("pass", rs.getString("spass"));
        				session.setAttribute("dept", rs.getString("dept"));
        				session.setAttribute("signintype", "student");
    					RequestDispatcher rd=request.getRequestDispatcher("student.jsp");
    					rd.forward(request,response);
				
    				}
    				else
    				{
        				session.setAttribute("id", rs.getString("tid"));
        				session.setAttribute("name", rs.getString("tname"));
        				session.setAttribute("email", rs.getString("temail"));
        				session.setAttribute("mobile", rs.getString("tmobile"));
        				session.setAttribute("pass", rs.getString("tpass"));
        				session.setAttribute("dept", rs.getString("dept"));
        				session.setAttribute("signintype", "teacher");
    					RequestDispatcher rd=request.getRequestDispatcher("teacher.jsp");
    					rd.forward(request,response);
    				}
			
    			}
			}
            else
            {
            	String s="invalid username and password combinatio";
            	response.sendRedirect("index.jsp?msg="+s);       	
            }
		}
		catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
        	String s="error occured";
        	response.sendRedirect("index.jsp?msg="+s);
		}
		
		
	}
	
	
	

}
