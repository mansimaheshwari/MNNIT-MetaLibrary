

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

import org.apache.log4j.Logger;

import experiments.AllMethods;

/**
 * Servlet implementation class downloadrepository
 */
@WebServlet("/downloadrepository")
public class downloadrepository extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static Logger log = Logger.getLogger("downloadrepository.java");

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int rid=Integer.parseInt(request.getParameter("rid"));
		

		AllMethods am=new AllMethods();
		ResultSet rs;
		try {
			rs = am.downloadrepository(rid);
	        if (rs.next()) {
	            String fileName = rs.getString("rname");
	            Blob blob = rs.getBlob("repo");
	            InputStream inputStream = blob.getBinaryStream();
	            int fileLength = inputStream.available();
	             
	            log.info("fileLength = " + fileLength);

	            ServletContext context = getServletContext();

	            // sets MIME type for the file download
	            String mimeType = context.getMimeType(fileName);
	            if (mimeType == null) {        
	                mimeType = "application/octet-stream";
	            }              
	             
	            // set content properties and header attributes for the response
	            response.setContentType(mimeType);
	            response.setContentLength(fileLength);
	            String headerKey = "Content-Disposition";
	            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
	            response.setHeader(headerKey, headerValue);

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
	        	log.info("error");
	        }
		} catch (ClassNotFoundException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        	
        	
	}

}
