<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(u.id, '0'), us.nm, r.nm, u.email, u.first_nm, u.last_nm, ifnull(u.tel_nbr,'') from user u, user_status us, role r where u.user_status_cd=us.cd and u.role_id=r.id order by last_nm, first_nm";
	
	String mId = "";
	String mUser_status_nm = "";
	String mRole_nm = "";
	String mEmail = "";
	String mFirst_nm = "";
	String mLast_nm = "";
	String mTel_nbr = "";
	
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
		if ((session.getAttribute("role_id") != null) && (session.getAttribute("role_id").equals("4"))) {

			prest=con.prepareStatement(mQuery);
			rs=prest.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">
				Nombre del Usuario
				</td>
				<td nowrap class="grayCell">
				Apellido, Primer Nombre
				</td>
				</td>
				<td nowrap class="grayCell">
				Teléfono
				</td>
				<td nowrap class="grayCell">
				Rol
				</td>
				<td nowrap class="grayCell">
				Estado
				</td>
			</tr>			
<%
			while(rs.next())
			{
				size++;
				mId = rs.getString(1);
				mUser_status_nm = rs.getString(2);
				mRole_nm = rs.getString(3);
				mEmail = rs.getString(4);
				mFirst_nm = rs.getString(5);
				mLast_nm = rs.getString(6);
				mTel_nbr = rs.getString(7);
%>

				<tr>
					<td nowrap>
						<a href="sql_get_user_adm.jsp?id=<%= mId %>"><%= mEmail %></a>
					</td>
					<td nowrap>
					<%= mLast_nm %>, <%= mFirst_nm %>
					</td>
					<td nowrap>
					<%= mTel_nbr %>
					</td>
					<td nowrap>
					<%= mRole_nm %>
					</td>
					<td nowrap>
					<%= mUser_status_nm %>
					</td>
				</tr>
<%
			}
%>
			</table>
<%
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