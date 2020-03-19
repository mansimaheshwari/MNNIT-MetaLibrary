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


	// to get all department list
		public ResultSet getDept() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from departments order by dept";
		
			PreparedStatement pst = con.prepareStatement(query);
			
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}


// to get all domain according to department selected
	public ResultSet getDomain( String dept) throws ClassNotFoundException, IOException, SQLException
	{
		Connection con=DBConn.getConn();
		
		String query="select * from domain where dept=? order by dept,domain" ;
		
		
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, dept);
		ResultSet rs=pst.executeQuery();
		
		return rs;
	}



//to get all types list
	public ResultSet getType() throws ClassNotFoundException, IOException, SQLException
	{
		Connection con=DBConn.getConn();
		
		String query="select * from types order by types";
	
		PreparedStatement pst = con.prepareStatement(query);
		
		ResultSet rs=pst.executeQuery();
		
		return rs;
	}
	

	 //to get domain teachers list
		public ResultSet getTeacher(String dept,String domain,String types) throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from teacher natural join repository where domain=? and types=? and dept=? order by dept,domain,tname";
			//String query="select * from teacher";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, domain);
			pst.setString(2, types);
			pst.setString(3, dept);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		

	
	// to get all teachers list
		public ResultSet getTeacher() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from teacher order by dept,tname";
		
			PreparedStatement pst = con.prepareStatement(query);
			
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		
		


		 //to get total no of teachers
			public int totTeacher() throws ClassNotFoundException, IOException, SQLException
			{
				Connection con=DBConn.getConn();
				
				String query="select count(*) from teacher";
				int c=0;
				PreparedStatement pst = con.prepareStatement(query);
				ResultSet rs=pst.executeQuery();
				if(rs.next())
					c=rs.getInt(1);
				System.out.println("no of teachers" + c);
				return c;
			}
			
			

			 //to get total no of student
				public int totStudent() throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select count(*) from student";
					int c=0;
					PreparedStatement pst = con.prepareStatement(query);
					ResultSet rs=pst.executeQuery();
					if(rs.next())
						c=rs.getInt(1);
					System.out.println("no of student" + c);
					return c;
				}
						


				 //to get total no of book
					public int totBook() throws ClassNotFoundException, IOException, SQLException
					{
						Connection con=DBConn.getConn();
						
						String query="select count(*) from book";
						int c=0;
						PreparedStatement pst = con.prepareStatement(query);
						ResultSet rs=pst.executeQuery();
						if(rs.next())
							c=rs.getInt(1);
						System.out.println("no of book" + c);
						return c;
					}

					 //to get total no of repository
						public int totRepo() throws ClassNotFoundException, IOException, SQLException
						{
							Connection con=DBConn.getConn();
							
							String query="select count(*) from repository";
							int c=0;
							PreparedStatement pst = con.prepareStatement(query);
							ResultSet rs=pst.executeQuery();
							if(rs.next())
								c=rs.getInt(1);
							System.out.println("no of repository" + c);
							return c;
						}
				
			
			
			
		 //to get teachers list based on dept
			public ResultSet allTeacher(String dept) throws ClassNotFoundException, IOException, SQLException
			{
				Connection con=DBConn.getConn();
				
				String query="select * from teacher where dept=? order by dept,tname";
			
				PreparedStatement pst = con.prepareStatement(query);
				pst.setString(1, dept);
				ResultSet rs=pst.executeQuery();
				
				return rs;
			}

		
			
			


			 //to get teachers based on tid
				public ResultSet getTeacher(String tid) throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select * from teacher where tid=?";
					//String query="select * from teacher";
				
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1, tid);
					ResultSet rs=pst.executeQuery();
					
					return rs;
				}
				
				

				// to get all students list
					public ResultSet getStudent() throws ClassNotFoundException, IOException, SQLException
					{
						Connection con=DBConn.getConn();
						
						String query="select * from student order by sid";
					
						PreparedStatement pst = con.prepareStatement(query);
						
						ResultSet rs=pst.executeQuery();
						
						return rs;
					}


					 //to get domain teachers list
						public ResultSet getStudent(String tid) throws ClassNotFoundException, IOException, SQLException
						{
							Connection con=DBConn.getConn();
							
							String query="select * from student where sid=?";
							//String query="select * from teacher";
						
							PreparedStatement pst = con.prepareStatement(query);
							pst.setString(1, tid);
							ResultSet rs=pst.executeQuery();
							
							return rs;
						}
						
			//to get books of that domain
				public ResultSet getBook(String dept,String domain) throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select * from book where domain=? and dept=? order by dept,domain,isbn";
				
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1,domain);
					pst.setString(2,dept);
					ResultSet rs=pst.executeQuery();
					
					return rs;
				}
				
				

				public ResultSet getBook(String isbn) throws ClassNotFoundException, IOException, SQLException
				{
					Connection con=DBConn.getConn();
					
					String query="select * from book where isbn=?";
				
					PreparedStatement pst = con.prepareStatement(query);
					pst.setString(1,isbn);
					ResultSet rs=pst.executeQuery();
					
					return rs;
				}

//    getVPN --> getrepo
				
//    no need to specify department as a tid belongs to only one department
				
		public ResultSet getrepo(String domain, String teacher, String types) throws ClassNotFoundException, IOException, SQLException 
		{
			Connection con=DBConn.getConn();

			String query="select * from repository natural join teacher where domain=? and types=? and tid=? order by dept,domain,tname,bname";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,domain);
			pst.setString(2,types);
			pst.setString(3,teacher);
			
			ResultSet rs=pst.executeQuery();
			return rs;
		}
		
		
		public ResultSet getrepo(String rid) throws ClassNotFoundException, IOException, SQLException 
		{
			Connection con=DBConn.getConn();

			String query="select * from repository rid=?";
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setString(1,rid);
			
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


			
			
		public int signup(String reg,String name,String email,String cpass,String mob,String dept,InputStream pic,byte[] profile,String designation) throws ClassNotFoundException, IOException, SQLException
		{
			int cnt=0;
			Connection con=DBConn.getConn();
			String query=null;
			if(designation.equals("Student"))
			{
				query="insert into student(sid,sname,semail,spass,smobile,dept,image,profile) values(?,?,?,?,?,?,?,?)";
			}
			else
			{
				query="insert into teacher(tid,tname,temail,tpass,tmobile,dept,image,profile) values(?,?,?,?,?,?,?,?)";
			}
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,reg);
			pst.setString(2,name);
			pst.setString(3,email);
			pst.setString(4,cpass);
			pst.setString(5,mob);
			pst.setString(6,dept);
			pst.setBlob(7, pic);
			pst.setBytes(8, profile);
			cnt=pst.executeUpdate();
			return cnt;
			
		}
		

		public String forgotpass(String reg, String name, String email, String mob, String designation) throws SQLException, ClassNotFoundException, IOException {

			Connection con=DBConn.getConn();
			String query=null;
			if(designation.equals("Student"))
			{
				query="select spass from student where sid=? && sname=? && semail=? && smobile=?";
			}
			else
			{
				query="select tpass from teacher where tid=? && tname=? && temail=? && tmobile=?";
			}
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1,reg);
			pst.setString(2,name);
			pst.setString(3,email);
			pst.setString(4,mob);
			
			ResultSet rs=pst.executeQuery();
			String pass=null;
			if(rs.next()) 
			{
				pass="your password : " + rs.getString(1);
			}
			else
			{
				pass="no user registered with these details";
			}
			return pass;
			

		}


		public ResultSet allBooks() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from book order by dept,domain,isbn";
		
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		
		
		public ResultSet allrepository() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from repository natural join teacher  order by dept,domain,tname";
		
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		

		public ResultSet allrepository(String type) throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from repository natural join teacher where types=? order by dept,domain,tname";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, type);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		


		
		public ResultSet deptdomain() throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from domain order by dept,domain";
		
			PreparedStatement pst = con.prepareStatement(query);
			ResultSet rs=pst.executeQuery();
			
			return rs;
		}
		

		public ResultSet deptdomain(String dept) throws ClassNotFoundException, IOException, SQLException
		{
			Connection con=DBConn.getConn();
			
			String query="select * from domain where dept=? order by dept,domain";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, dept);
			ResultSet rs=pst.executeQuery();
			
			return rs;
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
		
		
		
		

		public int insertbook(String name, String isbn,String dept, String domain, byte[] bytes) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="insert into book values(?,?,?,?,?)";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, isbn);
			pst.setString(2, name);
			pst.setString(3, dept);
			pst.setString(4, domain);
            pst.setBytes(5,bytes);
			int rs=pst.executeUpdate();
			
			return rs;
		}



		public ResultSet downloadbook(String isbn) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="select * from book where isbn=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, isbn);
	        ResultSet rs = pst.executeQuery();
			return rs;
		}
		
		


		public int insertrepository(String name, String domain, String types, String tid, InputStream is) throws ClassNotFoundException, IOException, SQLException {

			Connection con=DBConn.getConn();
			
			String query="insert into repository(rname,domain,types,tid,repo) values(?,?,?,?,?)";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, domain);
			pst.setString(3, types);
            pst.setString(4,tid);
            pst.setBlob(5,is);
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


		public int review(String name, String email, String edu, String prof, String review) throws ClassNotFoundException, IOException, SQLException {
			
			Connection con=DBConn.getConn();
			
			String query="insert into review(name,email,education,profession,review) values(?,?,?,?,?)";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, edu);
            pst.setString(4,prof);
            pst.setString(5,review);
            
			int rs=pst.executeUpdate();
			
			return rs;
		}


		public int deleteTeacher(String tid) throws ClassNotFoundException, IOException, SQLException {
			Connection con=DBConn.getConn();
			
			String query="delete from teacher where tid=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, tid);
			
			int rs=pst.executeUpdate();
			
			return rs;
		}


		public int deleteStudent(String sid) throws ClassNotFoundException, IOException, SQLException {
			Connection con=DBConn.getConn();
			
			String query="delete from student where sid=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, sid);
			
			int rs=pst.executeUpdate();
			
			return rs;
		}


		public int deleteBook(String isbn) throws ClassNotFoundException, IOException, SQLException {
			Connection con=DBConn.getConn();
			
			String query="delete from book where isbn=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, isbn);
			
			int rs=pst.executeUpdate();
			
			return rs;
		}


		public int deleteRrpo(String rid) throws ClassNotFoundException, IOException, SQLException {
			Connection con=DBConn.getConn();
			
			String query="delete from repository where rid=?";
		
			PreparedStatement pst = con.prepareStatement(query);
			pst.setString(1, rid);
			
			int rs=pst.executeUpdate();
			
			return rs;
		}



		
		
}

