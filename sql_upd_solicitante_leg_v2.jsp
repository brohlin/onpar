<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
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
	params.add("Actualizó entrevista legal de solicitante.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
	
%>

<%
	String _legal_version = request.getParameter("legal_version");
	String mQuery = ""; 
	DynStringArray parameters = new DynStringArray();
	int i = 0;
	parameters.add(session.getAttribute("id").toString());
	parameters.add(request.getParameter("id").toString());

	if (_legal_version.equals("larga")) {
		mQuery = "update entrevista_legal set " + 
					"q1 = ? , " + 
					"q2 = ? , " + 
					"q3 = ? , " + 
					"q4 = ? , " + 
					"q5 = ? , " + 
					"q6 = ? , " + 
					"q7 = ? , " + 
					"q8 = ? , " + 
					"q9 = ? , " + 
					"q10 = ? , " + 
					"q11 = ? , " + 
					"q12 = ? , " + 
					"q13 = ? , " + 
					"q14 = ? , " + 
					"q15 = ? , " + 
					"q16 = ? , " + 
					"q17 = ? , " + 
					"q18 = ? , " + 
					"q19 = ? , " + 
					"q20 = ? , " + 
					"q21 = ? , " + 
					"q22 = ? , " + 
					"q23 = ? , " + 
					"q24 = ? , " + 
					"q25 = ? , " + 
					"q26 = ? , " +
					"q27 = ? , " + 
					"q28 = ? , " + 
					"q29 = ? , " + 
					"q30 = ? , " + 
					"q31 = ? , " + 
					"legal_user_id = ? , " +  
					"fecha_entrevista_legal = ? , " +
					"otra_pregunta = ? , " +
					"last_mod_tmstmp = now()  " + 
					  "where id = ?";
	} else if (_legal_version.equals("mediana")) {
		mQuery = "update entrevista_legal set " + 
				"q1 = ? , " + 
				"q14 = ? , " + 
				"q15 = ? , " + 
				"q21 = ? , " + 
				"q24 = ? , " + 
				"q25 = ? , " + 
				"q26 = ? , " +
				"q27 = ? , " + 
				"q28 = ? , " + 
				"q29 = ? , " + 
				"q30 = ? , " + 
				"q31 = ? , " + 
				"legal_user_id = ? , " +  
				"fecha_entrevista_legal = ? , " +
				"otra_pregunta = ? , " +
				"last_mod_tmstmp = now()  " + 
				  "where id = ?";		
	} else if (_legal_version.equals("corta")) {
		mQuery = "update entrevista_legal set " + 
				"q21 = ? , " + 
				"q30 = ? , " + 
				"legal_user_id = ? , " +  
				"fecha_entrevista_legal = ? , " +
				"otra_pregunta = ? , " +
				"last_mod_tmstmp = now()  " + 
				  "where id = ?";		
	}
	
	
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

			if (_legal_version.equals("larga")) {
				prest=con.prepareStatement(mQuery);
				prest.setString(1,request.getParameter("q1"));
				prest.setString(2,request.getParameter("q2"));
				prest.setString(3,request.getParameter("q3"));
				prest.setString(4,request.getParameter("q4"));
				prest.setString(5,request.getParameter("q5"));
				prest.setString(6,request.getParameter("q6"));
				prest.setString(7,request.getParameter("q7"));
				prest.setString(8,request.getParameter("q8"));
				prest.setString(9,request.getParameter("q9"));
				prest.setString(10,request.getParameter("q10"));
				prest.setString(11,request.getParameter("q11"));
				prest.setString(12,request.getParameter("q12"));
				prest.setString(13,request.getParameter("q13"));
				prest.setString(14,request.getParameter("q14"));
				prest.setString(15,request.getParameter("q15"));
				prest.setString(16,request.getParameter("q16"));
				prest.setString(17,request.getParameter("q17"));
				prest.setString(18,request.getParameter("q18"));
				prest.setString(19,request.getParameter("q19"));
				prest.setString(20,request.getParameter("q20"));
				prest.setString(21,request.getParameter("q21"));
				prest.setString(22,request.getParameter("q22"));
				prest.setString(23,request.getParameter("q23"));
				prest.setString(24,request.getParameter("q24"));
				prest.setString(25,request.getParameter("q25"));
				prest.setString(26,request.getParameter("q26"));
				prest.setString(27,request.getParameter("q27"));
				prest.setString(28,request.getParameter("q28"));
				prest.setString(29,request.getParameter("q29"));
				prest.setString(30,request.getParameter("q30"));
				prest.setString(31,request.getParameter("q31"));
				prest.setString(32,request.getParameter("legal_user_id"));
				prest.setString(33,request.getParameter("fecha_entrevista_legal").toString());
				prest.setString(34,request.getParameter("legal_otra_pregunta").toString());
				prest.setString(35,request.getParameter("id").toString());
			} else if (_legal_version.equals("mediana")) {
				prest=con.prepareStatement(mQuery);
				prest.setString(1,request.getParameter("q1"));
				prest.setString(2,request.getParameter("q14"));
				prest.setString(3,request.getParameter("q15"));
				prest.setString(4,request.getParameter("q21"));
				prest.setString(5,request.getParameter("q24"));
				prest.setString(6,request.getParameter("q25"));
				prest.setString(7,request.getParameter("q26"));
				prest.setString(8,request.getParameter("q27"));
				prest.setString(9,request.getParameter("q28"));
				prest.setString(10,request.getParameter("q29"));
				prest.setString(11,request.getParameter("q30"));
				prest.setString(12,request.getParameter("q31"));
				prest.setString(13,request.getParameter("legal_user_id"));
				prest.setString(14,request.getParameter("fecha_entrevista_legal").toString());
				prest.setString(15,request.getParameter("legal_otra_pregunta").toString());
				prest.setString(16,request.getParameter("id").toString());				
			} else if (_legal_version.equals("corta")) {
				prest=con.prepareStatement(mQuery);
				prest.setString(1,request.getParameter("q21"));
				prest.setString(2,request.getParameter("q30"));			
				prest.setString(3,request.getParameter("legal_user_id"));
				prest.setString(4,request.getParameter("fecha_entrevista_legal").toString());
				prest.setString(5,request.getParameter("legal_otra_pregunta").toString());
				prest.setString(6,request.getParameter("id").toString());
			}
			
			i = Database.callProc("p_upd_dj_el_ok", parameters);
			
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