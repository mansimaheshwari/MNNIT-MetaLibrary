
<html>
<body>

<%@ page language= "java" import="java.sql.*" %>

<%
String a=request.getParameter("user");
String b=request.getParameter("pass");
int flag=1;
//out.print(a+" "+b);
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:testora");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from login where name='"+a+"'");

while(rs.next())
{
//out.println(a+" "+b+" "+rs.getString(1)+" "+rs.getString(2));
//if(a.equals("atish") && b.equals("kumar"))
if(a.equals(rs.getString(1)) && b.equals(rs.getString(2)))
{
flag=0;
//out.println("YOU ARE A VALID USER");
}

else
{
out.println("INCORRECT USER NAME OR PASSWORD");
}
}
}

catch(Exception e)
{
out.println(e.getMessage());
}


if(flag==0)
{ 
session.setAttribute("user",a);
if(a.equals("admin"))
{
%>
 <jsp:forward page="startadmin.html"/>
<%
}
else
{
%>
<jsp:forward page="welcome.jsp"/>
<%
}

}
else
{ 
%>

<jsp:forward page="index.html"/>
<%
out.println("Please enter username & password");
}



%>



</body>
</html>

