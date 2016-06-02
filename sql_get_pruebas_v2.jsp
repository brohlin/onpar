<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery2 = "select format(id,'0'), format(solicitante_id,'0'), ifnull(dsc,'')  from prueba where solicitante_id = ?";
	
	String mId2 = "";
	String mSolicitante_id2 = "";
	String mDesc2 = "";
	
	Connection con2 = null;
	PreparedStatement prest2 = null;
	ResultSet rs2 = null;

	DataSource OnparDB2;
	javax.naming.Context initCtx2 = new javax.naming.InitialContext();
	javax.naming.Context envCtx2 = (javax.naming.Context) initCtx2.lookup("java:comp/env");
	OnparDB2 = (DataSource) envCtx2.lookup("jdbc/OnparDB");

	try{
		if(OnparDB2 == null) {
			javax.naming.Context initCtx3 = new javax.naming.InitialContext();
			javax.naming.Context envCtx3 = (javax.naming.Context) initCtx3.lookup("java:comp/env");
			OnparDB2 = (DataSource) envCtx3.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	con2 = OnparDB2.getConnection();	
	
	try{
	
			prest2=con2.prepareStatement(mQuery2);
			prest2.setInt(1,Integer.parseInt(session.getAttribute("temp_solicitante_v2_id").toString()));			
			rs2=prest2.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">
				Prueba
				</td>			
			</tr>			
<%
			while(rs2.next())
			{
				size++;
				mId2 = rs2.getString(1);
				mSolicitante_id2 = rs2.getString(2);
				mDesc2 = rs2.getString(3);
%>

				<tr>
					<td nowrap>
						<a href="sql_get_prueba_v2.jsp?id=<%= mId2 %>"><%= mDesc2 %></a>
					</td>					
				</tr>
<%
			}
%>
			</table>
<%
	} catch(Exception e){
		throw e;
	} finally {
		if(prest2 != null) { prest2.close(); }
		if(rs2 != null) { rs2.close(); }
		if(con2 != null) { con2.close(); }
	}
%>