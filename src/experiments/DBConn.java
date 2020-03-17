package experiments;

//import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//import java.util.Properties;

//import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;

public class DBConn {
	
	public static Connection getConn() throws IOException, ClassNotFoundException, SQLException
	{
		/*
		Properties p=new Properties();
		FileInputStream fis=new FileInputStream("connection.properties");
		p.load(fis);
		//String driver=p.getProperty("driver");
		String url=p.getProperty("url");
		String uname=p.getProperty("uname");
		String pass=p.getProperty("pass");
	
		MysqlConnectionPoolDataSource ds=new MysqlConnectionPoolDataSource();
		ds.setUrl(url);
		ds.setUser(uname);
		ds.setPassword(pass);	
		
		Connection con=ds.getConnection();
		*/

		Class.forName("com.mysql.jdbc.Driver");

		System.out.println("load");

	    Connection con=DriverManager.getConnection("jdbc:mysql:///mnnitmetalibrary","root","root");

		System.out.println("connection created");
		return con;
	}

}
