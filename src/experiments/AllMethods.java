package experiments;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

import javax.servlet.http.Part;

public class AllMethods {

// to get all domain list
	public ResultSet getDomain() throws ClassNotFoundException, IOException, SQLException
	{
		Connection con=DBConn.getConn();
		
		String query="select * from domain";
	
		PreparedStatement pst = con.prepareStatement(query);
		
		ResultSet rs=pst.executeQuery();
		
		return rs;
	}



//to get all types list
	public ResultSet getType() throws ClassNotFoundException, IOException, SQLException
	{
		Connection con=DBConn.getConn();
		
		String query="select * from types";
	
		PreparedStatement pst = con.prepareStatement(query);
		
		ResultSet rs=pst.executeQuery();
		
		return rs;
	}
	

	
	// to get all teachers list
		public ResultSet getTeacher() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from teacher";
		
			PreparedStatement pst = con.prepareStatement(query);
			
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		
		



		
		 //to get domain teachers list
			public ResultSet getTeacher(String domain,String types) throws ClassNotFoundException, IOException, SQLException
			{
				Connection con=DBConn.getConn();
				
				String query="select * from teacher natural join repository where domain=? and types=?";
				//String query="select * from teacher";
			
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, domain);
				pst.setString(2, types);
				ResultSet rs=pst.executeQuery();
				
				return rs;
			}
			
			


			 //to get domain teachers list
				public ResultSet getTeacher(int tid) throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select * from teacher where tid=?";
					//String query="select * from teacher";
				
					PreparedStatement pst = con.prepareStatement(query);
					pst.setInt(1, tid);
					ResultSet rs=pst.executeQuery();
					
					return rs;
				}
				
				

				// to get all students list
					public ResultSet getStudent() throws ClassNotFoundException, IOException, SQLException
					{
						Connection con=DBConn.getConn();
						
						String query="select * from student";
					
						PreparedStatement pst = con.prepareStatement(query);
						
						ResultSet rs=pst.executeQuery();
						
						return rs;
					}


					 //to get domain teachers list
						public ResultSet getStudent(int tid) throws ClassNotFoundException, IOException, SQLException
						{
							Connection con=DBConn.getConn();
							
							String query="select * from student where sid=?";
							//String query="select * from teacher";
						
							PreparedStatement pst = con.prepareStatement(query);
							pst.setInt(1, tid);
							ResultSet rs=pst.executeQuery();
							
							return rs;
						}
						
			//to get books of that domain
				public ResultSet getBook(String domain) throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select * from book where domain=?";
					//String query="select * from type";
				
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1,domain);
					ResultSet rs=pst.executeQuery();
					
					return rs;
				}


		public ResultSet getVPN(String domain, int teacher, String types) throws ClassNotFoundException, IOException, SQLException 
		{
			Connection con=DBConn.getConn();

			String query="select * from repository where domain=? and types=? and tid=?";
			//String query="select * from teacher";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,domain);
			pst.setString(2,types);
			pst.setInt(3,teacher);
			
			ResultSet rs=pst.executeQuery();
			return rs;
		}
		

		public ResultSet signin(String email,String cpass,String designation) throws ClassNotFoundException, IOException, SQLException
		{
			ResultSet rs=null;
			Connection con=DBConn.getConn();
			String query=null;
			if(designation.equals("Student"))
			{
				query="select * from student where semail=? and spass=?";
			}
			else if(designation.equals("Admin"))
			{
				query="select * from admin where aemail=? and apass=?";
			}
			else if(designation.equals("Teacher"))
			{
				query="select * from teacher where temail=? and tpass=?";				
			}

			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,email);
			pst.setString(2,cpass);
			
			rs=pst.executeQuery();
			return rs;
		}


			
			
		public int signup(String name,String email,String cpass,String mob,String dept,InputStream pic,byte[] profile,String designation) throws ClassNotFoundException, IOException, SQLException
		{
			int cnt=0;
			Connection con=DBConn.getConn();
			String query=null;
			if(designation.equals("Student"))
			{
				query="insert into student(sname,semail,spass,smobile,dept,image,profile) values(?,?,?,?,?,?,?)";
			}
			else
			{
				query="insert into teacher(tname,temail,tpass,tmobile,dept,image,profile) values(?,?,?,?,?,?,?)";
			}
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,name);
			pst.setString(2,email);
			pst.setString(3,cpass);
			pst.setString(4,mob);
			pst.setString(5,dept);
			pst.setBlob(6, pic);
			pst.setBytes(7, profile);
			cnt=pst.executeUpdate();
			return cnt;
			
		}
		
		
		public String getImage(Blob blob) throws SQLException, IOException
		{
            
				InputStream inputStream = blob.getBinaryStream();
				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
            
				while ((bytesRead = inputStream.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);                  
				}
				byte[] imageBytes = outputStream.toByteArray();
				String img = Base64.getEncoder().encodeToString(imageBytes);
            
            
				inputStream.close();
				outputStream.close();
           
				System.out.println("returning string");
				return img;
			
		}
		
		
		
		
		public ResultSet allBooks() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from book";
			//String query="select * from type";
		
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}



		public int insertbook(String name, String isbn, String domain, byte[] bytes) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="insert into book values(?,?,?,?)";
			//String query="select * from type";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, isbn);
			pst.setString(2, name);
			pst.setString(3, domain);
            pst.setBytes(4,bytes);
			int rs=pst.executeUpdate();
			
			return rs;
		}



		public ResultSet downloadbook(int isbn) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="select * from book where isbn=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, isbn);
	        ResultSet rs = pst.executeQuery();
			return rs;
		}
		
		


		public int insertrepository(String name, String domain, String types, int tid, byte[] bytes) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="insert into repository(rname,domain,types,tid,link) values(?,?,?,?,?)";
			//String query="select * from type";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, domain);
			pst.setString(3, types);
            pst.setInt(4,tid);
            pst.setBytes(5,bytes);
			int rs=pst.executeUpdate();
			
			return rs;
		}



		public ResultSet downloadrepository(int rid) throws ClassNotFoundException, IOException, SQLException {
			
			Connection con=DBConn.getConn();
			
			String query="select * from repository r, teacher t where r.tid=t.tid and rid=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setInt(1, rid);
	        ResultSet rs = pst.executeQuery();
			return rs;
		}

		
		
}

