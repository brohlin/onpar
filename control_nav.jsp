<!--- TEMPLATE DESCRIPTION: Governs navigation display --->



<!--- Start display --->
<table width="170" border="0" cellpadding="0" cellspacing="0">

<!--- Login page links.  Visible if not logged in --->
<%

if (session.getAttribute("email") == null ){
%>
	<!--- Login --->
	<tr>
		<td><a href="/onpar/main.jsp?target=acceder"><img src="/onpar/img/nav_login_<%= mAcceder %>.gif" width="170" height="20" alt="Acceder a ONPAR" border="0" name="acceder"></a></td>
	</tr>

	<!--- Register --->
	<tr>
		<td><a href="/onpar/main.jsp?target=registrar"><img src="/onpar/img/nav_register_<%= mRegistrar %>.gif" width="170" height="20" alt="Registrarse como nuevo usuario" border="0" name="register"></a></td>
	</tr>
	

<%
} else {
%>
	<!--- Links for authenticated users --->
	<!--- Inicio --->
	<!---tr>
		<td><a href="/onpar/main.jsp?target=inicio"><img src="/onpar/img/nav_hme_<%= mInicio %>.gif" width="170" height="20" alt="Inicio de ONPAR" border="0" name="inicio"></a></td>
	</tr--->
	
	<!--- Solicitantes --->
	<tr>
		<td><a href="/onpar/main.jsp?target=solicitantes"><img src="/onpar/img/nav_solicitantes_<%= mSolicitudes %>.gif" width="170" height="20" alt="Solicitantes" border="0" name="solicitantes"></a></td>
	</tr>
	
	<!--- Editar Cuenta --->
	<tr>
		<td><a href="/onpar/main.jsp?target=cuenta"><img src="/onpar/img/nav_edit_acct_<%= mCuenta %>.gif" width="170" height="20" alt="Editar Cuenta" border="0" name="cuenta"></a></td>
	</tr>
	
		<!--- Usuarios --->		
<%
if ((session.getAttribute("role_id") != null) && (session.getAttribute("role_id").equals("4"))) {
%>
	<tr>
		<td><a href="/onpar/main.jsp?target=usuarios"><img src="/onpar/img/nav_mng_user_<%= mUsuarios %>.gif" width="170" height="20" alt="Usuarios" border="0" name="usuarios"></a></td>
	</tr>		
<%
	}
%>	
	<!--- Reportes --->
	<tr>
		<td><a href="/onpar/main.jsp?target=reportes"><img src="/onpar/img/nav_rpt_<%= mReportes %>.gif" width="170" height="20" alt="Reportes" border="0" name="reportes"></a></td>
	</tr>		
	

	<!--- Logout --->
	<tr>
		<td><a href="/onpar/salir.jsp"><img src="/onpar/img/nav_logout_<%= mSalir %>.gif" width="170" height="20" alt="Logout de ONPAR" border="0" name="logout"></a></td>
	</tr>


<%
} 
%>

</table>
<table width="170" border="0" cellpadding="0" cellspacing="0">

	<tr>
		<td align="center"><img src="/onpar/img/NRC_ESP_logo_center.png" width="125" height="125" alt="NRC" border="0" name="nrc_logo"></td>
	</tr>
</table>
	