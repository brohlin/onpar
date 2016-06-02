<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery1 = "select email, pwd from user where email = ? and pwd = ? and user_status_cd = 'A' ";
	String mEmail1 = request.getParameter("email");
	String mPwd1 = request.getParameter("pwd");
	Connection con1 = null;
	PreparedStatement prest1 = null;
	ResultSet rs1 = null;
	



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


	con1 = OnparDB.getConnection();
	
	
	
	try{


		prest1 = con1.prepareStatement(mQuery1);
		prest1.setString(1,mEmail1);
		prest1.setString(2,mPwd1);
		rs1 = prest1.executeQuery();
		
		int size = 0;

		while(rs1.next())
		{
			size++;
			String dbEmail = rs1.getString(1);
			String dbPwd = rs1.getString(2);

			if(mEmail1.equals(dbEmail) && mPwd1.equals(dbPwd)){
				session.setAttribute("email", dbEmail);
%>
				<%@include file="sql_get_user.jsp" %>
<%				
				response.sendRedirect("/onpar/main.jsp?target=solicitantes");
			}
		}
		
		if (size == 0) {
			response.sendRedirect("/onpar/main.jsp?target=acceder&msg=noacceso");
		}
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest1 != null) { prest1.close(); }
		if(rs1 != null) { rs1.close(); }
		if(con1 != null) { con1.close(); }
	}
%>

