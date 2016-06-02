<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update prueba " + 
	                    "set dsc = ?,  " +
	                        "file = ?,  " +
							"last_user_id = ?, " +
							"last_mod_tmstmp = now()  " + 
					  "where id = ?";
					  
	String mId = session.getAttribute("temp_prueba_id").toString();
	String mDesc = request.getParameter("dsc");
	
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

			prest.setString(1,mDesc);

			File fileName = new File(request.getParameter("destination") + request.getParameter("file"));
			FileInputStream fs = new FileInputStream(fileName);
			prest.setBinaryStream(2,fs,fs.available());				
			
			prest.setInt(3,Integer.parseInt(session.getAttribute("id").toString()));
			prest.setInt(4,Integer.parseInt(mId));
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("/onpar/main.jsp?target=solicitante_upd");			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>