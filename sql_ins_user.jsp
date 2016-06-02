<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "insert into user (" + 
	                	"user_status_cd," + 
	                    "role_id," +
	                    "email," +
	                    "pwd," +
	                    "first_nm," + 
						"last_nm," +
						"position_title," + 
						"organization," +
						"tel_nbr," +
						"skype_handle," + 
						"alternate," +
						"last_mod_tmstmp) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,now())";
						
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
		if (session.getAttribute("email") == null) {

			prest=con.prepareStatement(mQuery);
			prest.setString(1,pUser_status_cd);
			prest.setString(2,pRole_id);
			prest.setString(3,pEmail);
			prest.setString(4,pPwd);
			prest.setString(5,pFirst_nm);
			prest.setString(6,pLast_nm);
			prest.setString(7,pPosition_title);
			prest.setString(8,pOrganization);
			prest.setString(9,pTel_nbr);
			prest.setString(10,pSkype_handle);
			prest.setString(11,pAlternate);
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("main.jsp?target=acceder");			
		} else {
		
			prest=con.prepareStatement(mQuery);
			prest.setString(1,pUser_status_cd);
			prest.setString(2,pRole_id);
			prest.setString(3,pEmail);
			prest.setString(4,pPwd);
			prest.setString(5,pFirst_nm);
			prest.setString(6,pLast_nm);
			prest.setString(7,pPosition_title);
			prest.setString(8,pOrganization);
			prest.setString(9,pTel_nbr);
			prest.setString(10,pSkype_handle);
			prest.setString(11,pAlternate);
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("main.jsp?target=usuarios");		
		}
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>