<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select replace(format(id,'0'),',',''), " + 
	                "        replace(format(solicitante_id,'0'),',',''), " + 
	                "        ifnull(nombre,''),  " +
	                "        ifnull(format(edad,'0'),''), " + 
	                "        ifnull(parentesco_lkup,''),  " +
	                "        ifnull(ubicacion,''),  " +
	                "        ifnull(pais_lkup,''),  " +
	                "        ifnull(ocupacion,'')  " +
	                "   from familia  " +
	                "  where solicitante_id = ?";
	
	String mId = "";
	String mSolicitante_id = "";
	String mNombre = "";
	String mEdad = "";
	String mParentesco_lkup = "";
	String mUbicacion = "";
	String mPais_lkup = "";
	String mOcupacion = "";
	
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

			prest=con.prepareStatement(mQuery);
			prest.setString(1,session.getAttribute("temp_solicitante_id").toString());			
			rs=prest.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">
				Nombre
				</td>
				<td nowrap class="grayCell">
				Edad
				</td>
				</td>
				<td nowrap class="grayCell">
				Parentesco
				</td>
				<td nowrap class="grayCell">
				Ubicación
				</td>
				<td nowrap class="grayCell">
				País
				</td>
				<td nowrap class="grayCell">
				Ocupación
				</td>				
			</tr>			
<%
			while(rs.next())
			{
				size++;
				mId = rs.getString(1);
				mSolicitante_id = rs.getString(2);
				mNombre = rs.getString(3);
				mEdad = rs.getString(4);
				mParentesco_lkup = rs.getString(5);
				mUbicacion = rs.getString(6);
				mPais_lkup = rs.getString(7);
				mOcupacion = rs.getString(8);
%>

				<tr>
					<td nowrap>
						<a href="sql_get_miembro_de_familia.jsp?id=<%= mId %>"><%= mNombre %></a>
					</td>
					<td nowrap>
					<%= mEdad %>
					</td>
					<td nowrap>
					<%= mParentesco_lkup %>
					</td>
					<td nowrap>
					<%= mUbicacion %>
					</td>
					<td nowrap>
					<%= mPais_lkup %>
					</td>
					<td nowrap>
					<%= mOcupacion %>
					</td>					
				</tr>
<%
			}
%>
			</table>
<%
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>