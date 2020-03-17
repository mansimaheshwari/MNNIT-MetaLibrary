

import java.io.IOException;
import java.io.InputStream;

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
 * Servlet implementation class insertrepository
 */
@WebServlet("/insertrepository")

@MultipartConfig   
public class insertrepository extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
		String name=request.getParameter("name");
		String domain=request.getParameter("domain");
		String types=request.getParameter("types");
		String tid=request.getParameter("tid");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println("");
		System.out.println(name);
		System.out.println(domain);
		System.out.println(types);
		System.out.println(tid);

        Part filePart = request.getPart("file");
        
        InputStream is = null;
        
		try {
	        if (filePart != null) {
	            // prints out some information for debugging
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            is = filePart.getInputStream();
	        }
	        
			AllMethods am=new AllMethods();
			int s=am.insertrepository(name,domain,types,tid,is);

			if(s>0)
			{
		    	String msg="successfully added";
				request.setAttribute("msg", msg);
				RequestDispatcher rd=request.getRequestDispatcher("showallrepository.jsp");
				rd.forward(request,response);
			}
		}catch(Exception e)
		{
			System.out.println(e);
	    	String msg="this file already existed";
			request.setAttribute("msg", msg);
			RequestDispatcher rd=request.getRequestDispatcher("insertrepository.jsp");
			rd.forward(request,response);
		}
        
        
	}

}
