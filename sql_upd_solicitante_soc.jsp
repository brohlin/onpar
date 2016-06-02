<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update solicitante set " + 
					"pre_soc_qiii = ? , " +
					"pre_soc_qiv1 = ? , " +
					"pre_soc_qiv2 = ? , " +
					"pre_soc_qv11 = ? , " +
					"pre_soc_qv12 = ? , " +
					"pre_soc_qv13 = ? , " +
					"pre_soc_qv14 = ? , " +
					"pre_soc_qv21 = ? , " +
					"pre_soc_qv22 = ? , " +
					"pre_soc_qv23 = ? , " +
					"pre_soc_qv31 = ? , " +
					"pre_soc_qv32 = ? , " +
					"pre_soc_qv33 = ? , " +
					"pre_soc_qv41 = ? , " +
					"pre_soc_qv42 = ? , " +
					"pre_soc_qv43 = ? , " +
					"pre_soc_qvi1 = ? , " +
					"pre_soc_qvi2 = ? , " +
					"pre_soc_qvi3 = ? , " +
					"pre_soc_qvi4 = ? , " +
					"pre_soc_qvi5 = ? , " +
					"pre_soc_qvii = ? , " +
					"pre_soc_qviii = ? , " +
					"last_user_id = ? , " +
					"social_user_id = ? , " +  
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
			prest.setString(1,request.getParameter("pre_soc_qiii"));
			prest.setString(2,request.getParameter("pre_soc_qiv1"));
			prest.setString(3,request.getParameter("pre_soc_qiv2"));
			prest.setString(4,request.getParameter("pre_soc_qv11"));
			prest.setString(5,request.getParameter("pre_soc_qv12"));
			prest.setString(6,request.getParameter("pre_soc_qv13"));
			prest.setString(7,request.getParameter("pre_soc_qv14"));
			prest.setString(8,request.getParameter("pre_soc_qv21"));
			prest.setString(9,request.getParameter("pre_soc_qv22"));
			prest.setString(10,request.getParameter("pre_soc_qv23"));
			prest.setString(11,request.getParameter("pre_soc_qv31"));
			prest.setString(12,request.getParameter("pre_soc_qv32"));
			prest.setString(13,request.getParameter("pre_soc_qv33"));
			prest.setString(14,request.getParameter("pre_soc_qv41"));
			prest.setString(15,request.getParameter("pre_soc_qv42"));
			prest.setString(16,request.getParameter("pre_soc_qv43"));
			prest.setString(17,request.getParameter("pre_soc_qvi1"));
			prest.setString(18,request.getParameter("pre_soc_qvi2"));
			prest.setString(19,request.getParameter("pre_soc_qvi3"));
			prest.setString(20,request.getParameter("pre_soc_qvi4"));
			prest.setString(21,request.getParameter("pre_soc_qvi5"));
			prest.setString(22,request.getParameter("pre_soc_qvii"));
			prest.setString(23,request.getParameter("pre_soc_qviii"));
			prest.setString(24,session.getAttribute("id").toString());
			prest.setString(25,session.getAttribute("id").toString());
			prest.setString(26,request.getParameter("id").toString());
			
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