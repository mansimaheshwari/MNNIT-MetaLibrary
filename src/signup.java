

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

import experiments.AllMethods;

/**
 * Servlet implementation class signup
 */
@WebServlet("/signup")
@MultipartConfig   
public class signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String cpass=request.getParameter("cpass");
		String mob=request.getParameter("mob");
		System.out.println(request.getParameter("mob"));
		String dept=request.getParameter("dept");
        Part pic = request.getPart("pic");
        Part profile = request.getPart("profile");
		String designation=request.getParameter("designation");
		System.out.println(name);
		System.out.println(email);
		System.out.println(cpass);
		System.out.println(dept);
		System.out.println(designation);

		
		InputStream ispic=null;
		InputStream isprofile=null;
		Reader rprofile=null;
        if (pic != null) {
            // prints out some information for debugging
            System.out.println(pic.getName());
            System.out.println(pic.getSize());
            System.out.println(pic.getContentType());
             
            // obtains input stream of the upload file
            ispic = pic.getInputStream();
        }
        if (profile != null) 
        {
            InputStream is = null;
            
    		try {
             if (!profile.getContentType().equals("application/pdf"))
                {
 				request.setAttribute("msg", "alert('only pdf file allowed')");
           				RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
        				rd.forward(request,response);
                }
     
     
                is = profile.getInputStream();  // to get the body of the request as binary data
     
                byte[] bytes = is.readAllBytes();;
                is.read(bytes);

            
			AllMethods am=new AllMethods();
			int s=am.signup(name,email,cpass,mob,dept,ispic,bytes,designation);
			if(s>0)
			{
				request.setAttribute("msg", "alert('signed successfully')");
				RequestDispatcher rd=request.getRequestDispatcher("signin.jsp");
				rd.forward(request,response);
			}
			else
			{
				request.setAttribute("msg", "alert('enetr details again to signup')");
				RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
				rd.forward(request,response);
        	
			
		}

    }catch (ClassNotFoundException | IOException | SQLException e) {
		request.setAttribute("msg", "alert('enter details again to signup')");
		RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
		rd.forward(request,response);
		e.printStackTrace();
	}
   }
	}

}
