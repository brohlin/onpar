<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(id, '0'), user_status_cd, format(role_id,'0'), email, pwd, first_nm, last_nm, position_title, organization, ifnull(tel_nbr,''), ifnull(skype_handle,''), ifnull(alternate,''), DATE_FORMAT(last_mod_tmstmp,'%W, %M %e, %Y @ %h:%i %p')  from user where email = ?";
	
	String mId = "";
	String mUser_status_cd = "";
	String mRole_id = "";
	String mEmail = "";
	String mPwd = "";
	String mFirst_nm = "";
	String mLast_nm = "";
	String mPosition_title = "";
	String mOrganization = "";
	String mTel_nbr = "";
	String mSkype_handle = "";
	String mAlternate = "";
	String mLast_mod_tmstmp = "";
	
	
	Connection con = null;
	PreparedStatement prest = null;
	ResultSet rs = null;

	DataSource OnparDB3;
	javax.naming.Context initCtx3 = new javax.naming.InitialContext();
	javax.naming.Context envCtx3 = (javax.naming.Context) initCtx3.lookup("java:comp/env");
	OnparDB3 = (DataSource) envCtx3.lookup("jdbc/OnparDB");

	try{
		if(OnparDB3 == null) {
			javax.naming.Context initCtx4 = new javax.naming.InitialContext();
			javax.naming.Context envCtx4 = (javax.naming.Context) initCtx4.lookup("java:comp/env");
			OnparDB3 = (DataSource) envCtx4.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	con = OnparDB3.getConnection();	
	
	try{
		if (session.getAttribute("email") != null) {


			prest=con.prepareStatement(mQuery);
			prest.setString(1,session.getAttribute("email").toString());
			rs=prest.executeQuery();

			int size2 = 0;

			while(rs.next())
			{
				size2++;
				mId = rs.getString(1);
				mUser_status_cd = rs.getString(2);
				mRole_id = rs.getString(3);
				mEmail = rs.getString(4);
				mPwd = rs.getString(5);
				mFirst_nm = rs.getString(6);
				mLast_nm = rs.getString(7);
				mPosition_title = rs.getString(8);
				mOrganization = rs.getString(9);
				mTel_nbr = rs.getString(10);
				mSkype_handle = rs.getString(11);
				mAlternate = rs.getString(12);
				mLast_mod_tmstmp = rs.getString(13);
				
				session.setAttribute("id",mId);
				session.setAttribute("user_status_cd",mUser_status_cd);
				session.setAttribute("role_id",mRole_id);
				session.setAttribute("email",mEmail);
				session.setAttribute("pwd",mPwd);
				session.setAttribute("first_nm",mFirst_nm);
				session.setAttribute("last_nm",mLast_nm);
				session.setAttribute("position_title",mPosition_title);
				session.setAttribute("organization",mOrganization);
				session.setAttribute("tel_nbr",mTel_nbr);
				session.setAttribute("skype_handle",mSkype_handle);
				session.setAttribute("alternate",mAlternate);
				session.setAttribute("last_mod_tmstmp",mLast_mod_tmstmp);
				
			}

			if (size2 == 0) {
				response.sendRedirect("/onpar/salir.jsp");
			}
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