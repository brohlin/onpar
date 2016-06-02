<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update declaracion_jurada set " + 
					"ref_fecha_resol_recon = ? , " + 
					"ref_dec_resol_recon_lkup = ? , " + 
					"ref_dec_resol_recon_memo = ? , " + 
					"ref_estatus_lkup = ? , " + 
					"last_user_id = ? , " + 
					"last_mod_tmstmp = now()  " + 
					  "where id = ?";
	
	Connection con = null;
	PreparedStatement prest = null;
	

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
		if (session.getAttribute("email") != null) {



			prest=con.prepareStatement(mQuery);
			prest.setString(1,request.getParameter("ref_fecha_resol_recon"));
			prest.setString(2,request.getParameter("ref_dec_resol_recon_lkup"));
			prest.setString(3,request.getParameter("ref_dec_resol_recon_memo"));
			prest.setString(4,request.getParameter("ref_dec_resol_recon_lkup"));
			prest.setString(5,session.getAttribute("id").toString());
			prest.setString(6,request.getParameter("id").toString());
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("/onpar/main.jsp?target=solicitantes");			
		} 
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>