<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update familia " + 
	                    "set nombre = ?,  " +
	                        "edad = ?,  " +
	                        "parentesco_lkup = ?,  " +
	                        "ubicacion = ?,  " + 
							"pais_lkup = ?,  " +
							"ocupacion = ?,  " + 
							"last_user_id = ?, " +
							"last_mod_tmstmp = now()  " + 
					  "where id = ?";
					  
	String mId = session.getAttribute("temp_familia_id").toString();
	String mSolicitante_id = request.getParameter("solicitante_id");
	String mNombre = request.getParameter("nombre");
	String mEdad = request.getParameter("edad");
	String mParentesco_lkup = request.getParameter("parentesco_lkup");
	String mUbicacion = request.getParameter("ubicacion");
	String mPais_lkup = request.getParameter("pais_lkup");
	String mOcupacion = request.getParameter("ocupacion");	
	
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

			prest.setString(1,mNombre);
			prest.setInt(2,Integer.parseInt(mEdad));
			prest.setString(3,mParentesco_lkup);
			prest.setString(4,mUbicacion);
			prest.setString(5,mPais_lkup);
			prest.setString(6,mOcupacion);
			prest.setInt(7,Integer.parseInt(session.getAttribute("id").toString()));
			prest.setInt(8,Integer.parseInt(mId));
			
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