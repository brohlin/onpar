<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQueryElf = "select format(f.id,'0') id, ifnull(f.nombre,'') nombre, ifnull(elf.fecha_entrevista_legal,''), concat(u.first_nm,' ',u.last_nm) abogado  from familia f, user u, entrevista_legal_familia elf where f.last_user_id = u.id and f.id=elf.id and f.solicitante_id=?";
	
	String mIdElf = "";
	String mNombreElf = "";
	String mFecha_entrevista_legalElf = "";
	String mAbogadoElf = "";
	
	Connection conElf = null;
	PreparedStatement prestElf = null;
	ResultSet rsElf = null;

	DataSource OnparDBElf;
	javax.naming.Context initCtxElf = new javax.naming.InitialContext();
	javax.naming.Context envCtxElf = (javax.naming.Context) initCtxElf.lookup("java:comp/env");
	OnparDBElf = (DataSource) envCtxElf.lookup("jdbc/OnparDB");

	try{
		if(OnparDBElf == null) {
			javax.naming.Context initCtxElf2 = new javax.naming.InitialContext();
			javax.naming.Context envCtxElf2 = (javax.naming.Context) initCtxElf2.lookup("java:comp/env");
			OnparDBElf = (DataSource) envCtxElf2.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	conElf = OnparDBElf.getConnection();	
	
	try{
	
			prestElf=conElf.prepareStatement(mQueryElf);
			prestElf.setInt(1,Integer.parseInt(session.getAttribute("temp_solicitante_v2_id").toString()));			
			rsElf=prestElf.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">Nombre</td>
				<td nowrap class="grayCell">Fecha Entrevista Legal</td>	
				<td nowrap class="grayCell">Abogado/a</td>		
			</tr>			
<%
			while(rsElf.next())
			{
				size++;
				mIdElf = rsElf.getString(1);
				mNombreElf = rsElf.getString(2);
				mFecha_entrevista_legalElf = rsElf.getString(3);
				mAbogadoElf = rsElf.getString(4);
%>

				<tr>
					<td nowrap><a href="sql_get_entrevista_legal_familia.jsp?id=<%= mIdElf %>"><%= mNombreElf %></a></td>	
					<td nowrap><%= mFecha_entrevista_legalElf %></td>
					<td nowrap><%= mAbogadoElf %></td>
				</tr>
<%
			}
%>
			</table>
<%
	} catch(Exception e){
		throw e;
	} finally {
		if(prestElf != null) { prestElf.close(); }
		if(rsElf != null) { rsElf.close(); }
		if(conElf != null) { conElf.close(); }
	}
%>