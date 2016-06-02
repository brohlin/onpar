<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery6 = "update user " + 
	                    "set user_status_cd = ?,  " + 
	                        "role_id = ?,  " +
	                        "email = ?,  " +
	                        "pwd = ?,  " +
	                        "first_nm = ?,  " + 
							"last_nm = ?,  " +
							"position_title = ?,  " + 
							"organization = ?,  " +
							"tel_nbr = ?,  " +
							"skype_handle = ?,  " + 
							"alternate = ?,  " +
							"last_mod_tmstmp = now()  " + 
					  "where id = ?";
	
	String pId = request.getParameter("id");
	String pUser_status_cd = request.getParameter("user_status_cd");
	String pRole_id = request.getParameter("role_id");
	String pEmail = request.getParameter("email");
	String pPwd = request.getParameter("pwd");
	String pFirst_nm = request.getParameter("first_nm");
	String pLast_nm = request.getParameter("last_nm");
	String pPosition_title = request.getParameter("position_title");
	String pOrganization = request.getParameter("organization");
	String pTel_nbr = request.getParameter("tel_nbr");
	String pSkype_handle = request.getParameter("skype_handle");
	String pAlternate = request.getParameter("alternate");
	
	Connection con6 = null;
	PreparedStatement prest6 = null;
	

	DataSource OnparDB6;
	javax.naming.Context initCtx = new javax.naming.InitialContext();
	javax.naming.Context envCtx = (javax.naming.Context) initCtx.lookup("java:comp/env");
	OnparDB6 = (DataSource) envCtx.lookup("jdbc/OnparDB");

	try{
		if(OnparDB6 == null) {
			javax.naming.Context initCtx1 = new javax.naming.InitialContext();
			javax.naming.Context envCtx1 = (javax.naming.Context) initCtx1.lookup("java:comp/env");
			OnparDB6 = (DataSource) envCtx1.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	con6 = OnparDB6.getConnection();	
	
	try{
		if (session.getAttribute("email") != null) {

			prest6=con6.prepareStatement(mQuery6);
			prest6.setString(1,pUser_status_cd);
			prest6.setString(2,pRole_id);
			prest6.setString(3,pEmail);
			prest6.setString(4,pPwd);
			prest6.setString(5,pFirst_nm);
			prest6.setString(6,pLast_nm);
			prest6.setString(7,pPosition_title);
			prest6.setString(8,pOrganization);
			prest6.setString(9,pTel_nbr);
			prest6.setString(10,pSkype_handle);
			prest6.setString(11,pAlternate);
			prest6.setString(12,pId);
			
			int mCount = prest6.executeUpdate();
%>
			<%@include file="sql_get_user.jsp" %>	
<%	
			response.sendRedirect("/onpar/main.jsp?target=solicitantes");
		} 
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest6 != null) { prest6.close(); }
		if(con6 != null) { con6.close(); }
	}
%>