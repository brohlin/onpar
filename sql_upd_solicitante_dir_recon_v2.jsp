<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%
	int rec = 0;
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("Actualiz� decisi�n reconsideraci�n del case por la direcci�n.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
%>

<%
	String mQuery = "update declaracion_jurada set " + 
					"adm_fecha_resol_recon = ? , " + 
					"adm_dec_resol_recon_lkup = ? , " + 
					"adm_dec_resol_recon_memo = ? , " + 
					"adm_estatus_lkup = ? , " + 
					"ref_estatus_lkup = concat(?,' - Direcci�n')  , " +
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
			prest.setString(1,request.getParameter("adm_fecha_resol_recon"));
			prest.setString(2,request.getParameter("adm_dec_resol_recon_lkup"));
			prest.setString(3,request.getParameter("adm_dec_resol_recon_memo"));
			prest.setString(4,request.getParameter("adm_dec_resol_recon_lkup"));
			prest.setString(5,request.getParameter("adm_dec_resol_recon_lkup"));
			prest.setString(6,session.getAttribute("id").toString());
			prest.setString(7,request.getParameter("id").toString());
			
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