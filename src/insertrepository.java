

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
		//int tid=Integer.parseInt(request.getParameter("tid"));
		int tid=1;
        Part filePart = request.getPart("file");
        
        InputStream is = null;
        
		try {
         if (!filePart.getContentType().equals("application/pdf"))
            {
           			request.setAttribute("msg", "alert('only pdf file allowed')");
               				RequestDispatcher rd=request.getRequestDispatcher("insertrepository.jsp");
            				rd.forward(request,response);
            }
 
            is = filePart.getInputStream();  // to get the body of the request as binary data
 
            byte[] bytes = is.readAllBytes();;
            is.read(bytes);

			AllMethods am=new AllMethods();
			int s=am.insertrepository(name,domain,types,tid,bytes);

			if(s>0)
			{
       			request.setAttribute("msg", "alert('successfully added')");
				RequestDispatcher rd=request.getRequestDispatcher("insertrepository.jsp");
				rd.forward(request,response);
			}
		}catch(Exception e)
		{
			request.setAttribute("msg", "alert('this book already existed')");
			RequestDispatcher rd=request.getRequestDispatcher("insertrepository.jsp");
			rd.forward(request,response);
		}
        
        
	}

}
