
	<%
	
	ResultSet rs=(ResultSet)session.getAttribute("details");
	String c=rs.getString("sid");
	%>
	Registration no. : <%=rs.getString("sid") %><br>
	Name : <%=rs.getString("sname") %><br>
	Email : <%=rs.getString("semail") %><br>
	Pass : <%=rs.getString("spass") %><br>
	Mob. : <%=rs.getString("smobile") %><br>
	Department : <%=rs.getString("dept") %><br>
    <img src="data:image/jpg;base64,${image}" width="100" height="100"/>
	<%
	%>

