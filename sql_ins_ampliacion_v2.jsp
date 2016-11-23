<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<%
	int rec = 0;
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("Insertó ampliacion a la entrevista legal asociada con solicitante.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
	
%>

<%
	String fieldName;
	String mQuery = "insert into ampliacion (" +
						"solicitante_id," + 
						"dsc," + 
						"ftext," + 
						"fecha_ampliacion," +
						"last_user_id," +
						"last_mod_tmstmp) " +
					"values (?,?,?,?,?,now())";
					
	
	String mSolicitante_id = request.getParameter("solicitante_id");
	String mDesc = request.getParameter("dsc");
	String mFtext = request.getParameter("ftext");
	String mFecha_ampliacion = request.getParameter("fecha_ampliacion");
	String mLast_user_id = session.getAttribute("id").toString();
	Connection con = null;
	PreparedStatement prest = null;
	DataSource OnparDB;

%>



<%

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
		
		prest.setInt(1,Integer.parseInt(mSolicitante_id));
		prest.setString(2,mDesc);		
		prest.setString(3,mFtext);
		prest.setString(4,mFecha_ampliacion);

		prest.setInt(5,Integer.parseInt(mLast_user_id));
		
		int mCount = prest.executeUpdate();

		response.sendRedirect("main.jsp?target=solicitante_upd_v2");			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>