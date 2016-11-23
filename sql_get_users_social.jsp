<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select u.id, concat(u.first_nm,' ',u.last_nm) from user u where u.role_id=3 order by concat(u.first_nm,' ',u.last_nm)";
	
	String _userid = "";
	String _username = "";

	
	Connection con = null;
	PreparedStatement prest = null;
	ResultSet rs = null;

	DataSource OnparDB;
	javax.naming.Context initCtx = new javax.naming.InitialContext();
	javax.naming.Context envCtx = (javax.naming.Context) initCtx.lookup("java:comp/env");
	OnparDB = (DataSource) envCtx.lookup("jdbc/OnparDB");

	try{
		if(OnparDB == null) {
			javax.naming.Context initCtx1 = new javax.naming.InitialContext();
			javax.naming.Context envCtx1 = (javax.naming.Context) initCtx1.lookup("java:comp/env");
			OnparDB = (DataSource) envCtx1.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	con = OnparDB.getConnection();
	
	try{

		prest=con.prepareStatement(mQuery);
		rs=prest.executeQuery();

		int size = 0;

%>
			<option value=""></option>
<%
		while(rs.next())
		{
			size++;
			_userid = rs.getString(1);
			_username = rs.getString(2);

%>
			<option value="<%= _userid %>"<% if ( _userid.equals(session.getAttribute("temp_solicitante_v2_social_user_id2")) ) {%> selected <% } %>><%= _username %></option>
<%
		}

	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>