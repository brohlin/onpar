<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update solicitante set " + 
					"pre_leg_q1 = ? , " + 
					"pre_leg_q2 = ? , " + 
					"pre_leg_q3 = ? , " + 
					"pre_leg_q4 = ? , " + 
					"pre_leg_q5 = ? , " + 
					"pre_leg_q6 = ? , " + 
					"pre_leg_q7 = ? , " + 
					"pre_leg_q8 = ? , " + 
					"pre_leg_q9 = ? , " + 
					"pre_leg_q10 = ? , " + 
					"pre_leg_q11 = ? , " + 
					"pre_leg_q12 = ? , " + 
					"pre_leg_q13 = ? , " + 
					"pre_leg_q14 = ? , " + 
					"pre_leg_q15 = ? , " + 
					"pre_leg_q16 = ? , " + 
					"pre_leg_q17 = ? , " + 
					"pre_leg_q18 = ? , " + 
					"pre_leg_q19 = ? , " + 
					"pre_leg_q20 = ? , " + 
					"pre_leg_q21 = ? , " + 
					"pre_leg_q22 = ? , " + 
					"pre_leg_q23 = ? , " + 
					"pre_leg_q24 = ? , " + 
					"pre_leg_q25 = ? , " + 
					"pre_leg_q26 = ? , " + 
					"last_user_id = ? , " +
					"legal_user_id = ? , " +  
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
			prest.setString(1,request.getParameter("pre_leg_q1"));
			prest.setString(2,request.getParameter("pre_leg_q2"));
			prest.setString(3,request.getParameter("pre_leg_q3"));
			prest.setString(4,request.getParameter("pre_leg_q4"));
			prest.setString(5,request.getParameter("pre_leg_q5"));
			prest.setString(6,request.getParameter("pre_leg_q6"));
			prest.setString(7,request.getParameter("pre_leg_q7"));
			prest.setString(8,request.getParameter("pre_leg_q8"));
			prest.setString(9,request.getParameter("pre_leg_q9"));
			prest.setString(10,request.getParameter("pre_leg_q10"));
			prest.setString(11,request.getParameter("pre_leg_q11"));
			prest.setString(12,request.getParameter("pre_leg_q12"));
			prest.setString(13,request.getParameter("pre_leg_q13"));
			prest.setString(14,request.getParameter("pre_leg_q14"));
			prest.setString(15,request.getParameter("pre_leg_q15"));
			prest.setString(16,request.getParameter("pre_leg_q16"));
			prest.setString(17,request.getParameter("pre_leg_q17"));
			prest.setString(18,request.getParameter("pre_leg_q18"));
			prest.setString(19,request.getParameter("pre_leg_q19"));
			prest.setString(20,request.getParameter("pre_leg_q20"));
			prest.setString(21,request.getParameter("pre_leg_q21"));
			prest.setString(22,request.getParameter("pre_leg_q22"));
			prest.setString(23,request.getParameter("pre_leg_q23"));
			prest.setString(24,request.getParameter("pre_leg_q24"));
			prest.setString(25,request.getParameter("pre_leg_q25"));
			prest.setString(26,request.getParameter("pre_leg_q26"));
			prest.setString(27,session.getAttribute("id").toString());
			prest.setString(28,session.getAttribute("id").toString());
			prest.setString(29,request.getParameter("id").toString());
			
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