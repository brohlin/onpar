<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "insert into familia (" +
						"solicitante_id," + 
						"nombre," + 
						"edad," + 
						"parentesco_lkup," + 
						"ubicacion," + 
						"pais_lkup," + 
						"ocupacion," + 
						"last_user_id," +
						"last_mod_tmstmp) " +
					"values (?,?,?,?,?,?,?,?,now())";
					
	String mSolicitante_id = request.getParameter("solicitante_id");
	String mNombre = request.getParameter("nombre");
	String mEdad = request.getParameter("edad");
	String mParentesco_lkup = request.getParameter("parentesco_lkup");
	String mUbicacion = request.getParameter("ubicacion");
	String mPais_lkup = request.getParameter("pais_lkup");
	String mOcupacion = request.getParameter("ocupacion");
	String mLast_user_id = session.getAttribute("id").toString();
	
	
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
		
		prest.setInt(1,Integer.parseInt(mSolicitante_id));
		prest.setString(2,mNombre);
		prest.setInt(3,Integer.parseInt(mEdad));
		prest.setString(4,mParentesco_lkup);
		prest.setString(5,mUbicacion);
		prest.setString(6,mPais_lkup);
		prest.setString(7,mOcupacion);
		prest.setInt(8,Integer.parseInt(mLast_user_id));
		
		int mCount = prest.executeUpdate();

		response.sendRedirect("main.jsp?target=solicitante_upd");			
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>