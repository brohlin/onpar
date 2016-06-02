<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(id, '0'), user_status_cd, format(role_id,'0'), email, pwd, first_nm, last_nm, position_title, organization, ifnull(tel_nbr,''), ifnull(skype_handle,''), ifnull(alternate,''), DATE_FORMAT(last_mod_tmstmp,'%W, %M %e, %Y @ %h:%i %p')  from user where id = ?";
	
	String mId = request.getParameter("id");
	
	session.setAttribute("temp_id", null);
	session.setAttribute("temp_user_status_cd",null);
	session.setAttribute("temp_role_id",null);
	session.setAttribute("temp_email",null);
	session.setAttribute("temp_pwd",null);
	session.setAttribute("temp_first_nm",null);
	session.setAttribute("temp_last_nm",null);
	session.setAttribute("temp_position_title",null);
	session.setAttribute("temp_organization",null);
	session.setAttribute("temp_tel_nbr",null);
	session.setAttribute("temp_skype_handle",null);
	session.setAttribute("temp_alternate",null);
	session.setAttribute("temp_last_mod_tmstmp",null);	
	
	Connection con = null;
	PreparedStatement prest = null;
	ResultSet rs = null;

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
			prest.setString(1,mId);
			rs=prest.executeQuery();

			int size = 0;

			while(rs.next())
			{
				size++;
				session.setAttribute("temp_id", rs.getString(1));
				session.setAttribute("temp_user_status_cd",rs.getString(2));
				session.setAttribute("temp_role_id",rs.getString(3));
				session.setAttribute("temp_email",rs.getString(4));
				session.setAttribute("temp_pwd",rs.getString(5));
				session.setAttribute("temp_first_nm",rs.getString(6));
				session.setAttribute("temp_last_nm",rs.getString(7));
				session.setAttribute("temp_position_title",rs.getString(8));
				session.setAttribute("temp_organization",rs.getString(9));
				session.setAttribute("temp_tel_nbr",rs.getString(10));
				session.setAttribute("temp_skype_handle",rs.getString(11));
				session.setAttribute("temp_alternate",rs.getString(12));
				session.setAttribute("temp_last_mod_tmstmp",rs.getString(13));			
			}

			if (size == 0) {
				response.sendRedirect("/onpar/salir.jsp");
			}
			
			response.sendRedirect("/onpar/main.jsp?target=cuenta_adm");			
			
		} else {
			response.sendRedirect("/onpar/salir.jsp");
		}
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>