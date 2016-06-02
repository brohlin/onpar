<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(id,'0'), " +
	                "format(solicitante_id,'0'), " +
	                "ifnull(dsc,''), " +
	                "file " +
	                "from prueba where id = ?";
	
	session.setAttribute("temp_prueba_id", null);
	session.setAttribute("temp_prueba_solicitante_id", null);
	session.setAttribute("temp_prueba_dsc", null);
	session.setAttribute("temp_prueba_file", null);		
	
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
			prest.setInt(1,Integer.parseInt(request.getParameter("id")));
			
			rs=prest.executeQuery();

			while(rs.next())
			{
				
				session.setAttribute("temp_prueba_id",rs.getString(1));
				session.setAttribute("temp_prueba_solicitante_id",rs.getString(2));
				session.setAttribute("temp_prueba_dsc", rs.getString(3));
				session.setAttribute("temp_prueba_file", rs.getBlob(4));				


			}
		
			response.sendRedirect("main.jsp?target=prueba_upd");			
			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>