<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>

<%
	int rec = 0;
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("Actualiz� ampliaci�n a la entrevista legal asociada con solicitante.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
	
%>

<%
	String mQuery = "update ampliacion set dsc=?, ftext=?, fecha_ampliacion=?, last_user_id=?, last_mod_tmstmp=now() where id = ?";			  
	String mId = request.getParameter("id");
	String mDsc = request.getParameter("dsc");
	String mFtext = request.getParameter("ftext");
	String mFecha_ampliacion = request.getParameter("fecha_ampliacion");
	String mLast_user_id = session.getAttribute("temp_solicitante_v2_id").toString();
	
	
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

			prest=con.prepareStatement(mQuery);
			prest.setString(1,mDsc);
			prest.setString(2,mFtext);
			prest.setString(3,mFecha_ampliacion);
			prest.setInt(4,Integer.parseInt(mLast_user_id));
			prest.setInt(5,Integer.parseInt(mId));
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("/onpar/main.jsp?target=solicitante_upd_v2");			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>