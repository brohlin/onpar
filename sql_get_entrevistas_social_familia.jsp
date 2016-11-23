<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQueryEsf = "select format(f.id,'0') id, ifnull(f.nombre,'') nombre, ifnull(esf.fecha_entrevista_social,''), concat(u.first_nm,' ',u.last_nm) usuario  from familia f, user u, social_familia esf where f.last_user_id = u.id and f.id=esf.id and f.solicitante_id=?";
	
	String mIdEsf = "";
	String mNombreEsf = "";
	String mFecha_entrevista_socialEsf = "";
	String mTrabajadorEsf = "";
	
	Connection conEsf = null;
	PreparedStatement prestEsf = null;
	ResultSet rsEsf = null;

	DataSource OnparDBEsf;
	javax.naming.Context initCtxEsf = new javax.naming.InitialContext();
	javax.naming.Context envCtxEsf = (javax.naming.Context) initCtxEsf.lookup("java:comp/env");
	OnparDBEsf = (DataSource) envCtxEsf.lookup("jdbc/OnparDB");

	try{
		if(OnparDBEsf == null) {
			javax.naming.Context initCtxEsf2 = new javax.naming.InitialContext();
			javax.naming.Context envCtxEsf2 = (javax.naming.Context) initCtxEsf2.lookup("java:comp/env");
			OnparDBEsf = (DataSource) envCtxEsf2.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	conEsf = OnparDBEsf.getConnection();	
	
	try{
	
			prestEsf=conEsf.prepareStatement(mQueryEsf);
			prestEsf.setInt(1,Integer.parseInt(session.getAttribute("temp_solicitante_v2_id").toString()));			
			rsEsf=prestEsf.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">Nombre</td>
				<td nowrap class="grayCell">Fecha Entrevista Social</td>	
				<td nowrap class="grayCell">Trabajador/a Social</td>		
			</tr>			
<%
			while(rsEsf.next())
			{
				size++;
				mIdEsf = rsEsf.getString(1);
				mNombreEsf = rsEsf.getString(2);
				mFecha_entrevista_socialEsf = rsEsf.getString(3);
				mTrabajadorEsf = rsEsf.getString(4);
%>

				<tr>
					<td nowrap><a href="sql_get_entrevista_social_familia.jsp?id=<%= mIdEsf %>"><%= mNombreEsf %></a></td>	
					<td nowrap><%= mFecha_entrevista_socialEsf %></td>
					<td nowrap><%= mTrabajadorEsf %></td>
				</tr>
<%
			}
%>
			</table>
<%
	} catch(Exception e){
		throw e;
	} finally {
		if(prestEsf != null) { prestEsf.close(); }
		if(rsEsf != null) { rsEsf.close(); }
		if(conEsf != null) { conEsf.close(); }
	}
%>