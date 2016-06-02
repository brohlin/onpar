<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "";
	String mQuery_ua = "";
	String mQuery_v2 = "";
	
	if (session.getAttribute("role_id") != null) {
			// mQuery = "select 'v1',replace(format(s.id,'0'),',',''),concat(s.pre_primer_nombre,\" \",s.pre_segundo_nombre,\" \",s.pre_apellido_paterno,\" \",s.pre_apellido_materno) nombre,s.pre_fecha_de_nacimiento,s.pre_pais_de_origen_lkup,s.pre_identificacion1,s.pre_typo_identificacion1_lkup,s.pre_direccion_actual, s.pre_telefono1, ifnull(s.adm_estatus_lkup,''), 'no' from solicitante s where s.id > 3000 ";
			// mQuery_ua = "union all "; 
			mQuery_v2 = "select 'v2',replace(format(v2.id,'0'),',',''),concat(v2.pre_primer_nombre,\" \",v2.pre_apellido_paterno,\" \",v2.pre_apellido_materno) nombre,v2.pre_fecha_de_nacimiento,v2.pre_nacionalidad_lkup,v2.pre_pasaporte,\"Pasaporte\",v2.pre_direccion_actual, v2.pre_telefono1, ifnull(v2.adm_estatus_lkup,''), if(v2.pre_copia_otro_documento is null,'no','yes') from declaracion_jurada v2 where v2.id > 3000 ";
	}
	
	if (!mLast_name.equals("")) {
		// mQuery = mQuery + " and (lower(s.pre_apellido_paterno) = ? or lower(s.pre_apellido_materno) = ?) ";
		mQuery_v2 = mQuery_v2  + " and (lower(v2.pre_apellido_paterno) = ? or lower(v2.pre_apellido_materno) = ?) "; 
	}
	
	if (!mCaso.equals("")) {
		// mQuery = mQuery + " and s.id = ? ";
		mQuery_v2 = mQuery_v2  + " and v2.id = ? "; 
	}
	
	mQuery = mQuery + mQuery_ua + mQuery_v2 + " order by 2 desc limit 50";
	
	String mVersion = "";
	String mId = "";
	String mNombre = "";
	String mPre_fecha_de_nacimiento = "";
	String mPre_pais_de_origen_lkup = "";
	String mPre_identificacion1 = "";
	String mPre_typo_de_identificacion1_lkup = "";
	String mPre_direccion_actual = "";
	String mPre_telefono1 = "";
	String mAdm_estatus_lkup = "";
	String mIsOtroDocumento = "";
	
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
			
			if (!mLast_name.equals("") && !mCaso.equals("")) {
				prest.setString(1,mLast_name);
				prest.setString(2,mLast_name);
				prest.setString(3,mCaso);
				// prest.setString(4,mLast_name);	
				// prest.setString(5,mLast_name);
				// prest.setString(6,mCaso);							
			} else if (!mLast_name.equals("") && mCaso.equals("")) {
				prest.setString(1,mLast_name);
				prest.setString(2,mLast_name);
				// prest.setString(3,mLast_name);
				// prest.setString(4,mLast_name);				
			} else if (mLast_name.equals("") && !mCaso.equals("")) {
				prest.setString(1,mCaso);
				// prest.setString(2,mCaso);	
			}	
			
			rs=prest.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4" width="600">
			<tr>
				<td nowrap class="grayCell">
				Numero de Caso/ID
				</td>
				<td nowrap class="grayCell">
				Nombre del Solicitante
				</td>
				<td nowrap class="grayCell">
				Fecha de Nacimiento
				</td>
				</td>
				<td nowrap class="grayCell">
				País de Origen
				</td>
				<td nowrap class="grayCell">
				Estatus del Caso
				</td>										
			</tr>		
				
<%
			while(rs.next())
			{
				size++;
				
				mVersion = rs.getString(1);
				mId = rs.getString(2);
				mNombre = rs.getString(3);
				mPre_fecha_de_nacimiento = rs.getString(4);
				mPre_pais_de_origen_lkup = rs.getString(5);
				mPre_identificacion1 = rs.getString(6);
				mPre_typo_de_identificacion1_lkup = rs.getString(7);
				mPre_direccion_actual = rs.getString(8);
				mPre_telefono1 = rs.getString(9);
				mAdm_estatus_lkup = rs.getString(10);
				mIsOtroDocumento = rs.getString(11);

%>
				<tr>
					<td nowrap>
						<%= mId %>
					</td>
					<td nowrap>
<%	
				if (mVersion.equals("v1")) {
%>							
						<a href="sql_get_solicitante.jsp?id=<%= mId %>"><%= mNombre %></a>
<%
				} else if (mVersion.equals("v2")) {		
%>
						<a href="sql_get_solicitante_v2.jsp?id=<%= mId %>"><%= mNombre %></a>
<%
				}
%>										
					</td>
					<td nowrap>
						<%= mPre_fecha_de_nacimiento %>
					</td>
					<td nowrap>
						<%= mPre_pais_de_origen_lkup %>
					</td>
<%
				if (mAdm_estatus_lkup.equals("Digitalizar Caso Cerrado") && mIsOtroDocumento.equals("yes")) {	
%>						
					<td class="boldGreenTxt">
<%
				} else if (mAdm_estatus_lkup.equals("Digitalizar Caso Cerrado") && mIsOtroDocumento.equals("no")) {
%>
					<td class="boldRedTxt">
<%
				} else {
%>
					<td nowrap>
<%
				}
%>
						<%= mAdm_estatus_lkup %>
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