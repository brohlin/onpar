<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(id,'0'), " +
	                "format(solicitante_id,'0'), " +
	                "ifnull(dsc,''), " +
	                "ifnull(ftext,''), " +
	                "f_format_date(fecha_ampliacion) " +
	                "from ampliacion where id = ?";
	
	session.setAttribute("temp_ampliacion_id", null);
	session.setAttribute("temp_ampliacion_solicitante_id", null);
	session.setAttribute("temp_ampliacion_dsc", null);
	session.setAttribute("temp_ampliacion_ftext", null);
	session.setAttribute("temp_ampliacion_fecha_ampliacion", null);
	
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
				
				session.setAttribute("temp_ampliacion_id",rs.getString(1));
				session.setAttribute("temp_ampliacion_solicitante_id",rs.getString(2));
				session.setAttribute("temp_ampliacion_dsc", rs.getString(3));
				session.setAttribute("temp_ampliacion_ftext", rs.getString(4));
				session.setAttribute("temp_ampliacion_fecha_ampliacion", rs.getString(5));


			}
		
			response.sendRedirect("main.jsp?target=ampliacion_upd_v2");			
			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>