<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(id,'0'), format(solicitante_id,'0'), ifnull(nombre,''), ifnull(format(edad,'0'),''), ifnull(parentesco_lkup,''), ifnull(ubicacion,''), ifnull(pais_lkup,''), ifnull(ocupacion,'') from familia where id = ?";
	
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

			session.setAttribute("temp_familia_id",rs.getString(1));
			session.setAttribute("temp_familia_solicitante_id",rs.getString(2));
			session.setAttribute("temp_familia_nombre", rs.getString(3));
			session.setAttribute("temp_familia_edad", rs.getString(4));				
			session.setAttribute("temp_familia_parentesco_lkup", rs.getString(5));
			session.setAttribute("temp_familia_ubicacion", rs.getString(6));
			session.setAttribute("temp_familia_pais_lkup", rs.getString(7));
			session.setAttribute("temp_familia_ocupacion", rs.getString(8));

		}

		response.sendRedirect("main.jsp?target=miembro_de_familia_upd");			
			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>