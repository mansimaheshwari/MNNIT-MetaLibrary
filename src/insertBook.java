

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

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
 * Servlet implementation class insertBook
 */
@WebServlet("/insertBook")
@MultipartConfig   
public class insertBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
		String name=request.getParameter("name");
		String dept=request.getParameter("department");
		String domain=request.getParameter("domain");
		String isbn=request.getParameter("isbn");
        Part filePart = request.getPart("file");
        
        InputStream is = null;
        
		try {
         if (!filePart.getContentType().equals("application/pdf"))
            {
		    	String msg="only pdf file allowed";
				request.setAttribute("msg", msg);
               				RequestDispatcher rd=request.getRequestDispatcher("insertbook.jsp");
            				rd.forward(request,response);
            }
 
            is = filePart.getInputStream();  // to get the body of the request as binary data
 
            byte[] bytes = is.readAllBytes();;
            is.read(bytes);

			AllMethods am=new AllMethods();
			int s=am.insertbook(name,isbn,dept,domain,bytes);

			if(s>0)
			{
		    	String msg="inserted successfully";
				request.setAttribute("msg", msg);
				RequestDispatcher rd=request.getRequestDispatcher("showallbooks.jsp");
				rd.forward(request,response);
			}
		}catch(Exception e)
		{
	    	String msg="this book already existed";
			request.setAttribute("msg", msg);
			RequestDispatcher rd=request.getRequestDispatcher("insertbook.jsp");
			rd.forward(request,response);
		}
        
        
	}

}
