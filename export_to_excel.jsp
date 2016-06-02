<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<%
	if ((session.getAttribute("role_id") != null) && (session.getAttribute("role_id").equals("4"))) {
%>

<table border="0" cellspacing="0" cellpadding="4">
	<tr> 
		<td valign="top" colspan="3" class="hdrBlackTxt">
			Exportar todos los casos a Excel
		</td>
	</tr>	
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
</table>

<%
	}
%>

<%	
	DynStringArray parameters = new DynStringArray();
	DbResults db = Database.callProcResults("p_get_solicitantes", parameters);
	String myTable = db.generateHtmlTableCss();
	
	String myObjectId = db.toString();
	request.getSession().setAttribute(myObjectId, db);
	request.setAttribute("myObjectId", myObjectId);
%>

<br>
<%
	if ((session.getAttribute("role_id") != null) && (session.getAttribute("role_id").equals("4"))) {
%>

<form action="HSSFCreate" method="POST">
	<input type="hidden" name="myObjectId" value="<%= myObjectId %>">
	<input type="hidden" name="mysheetname" value="Solicitantes">
	<input type="hidden" name="myfilename" value="ONPAR base de datos">
	<input type="submit" class="butnTxt" value="Descargar Datos a Excel" name="export">  
</form>

<!-- details>
<summary>Ver datos de todos los solicitantes</summary>
<%= myTable %>
</details -->

<%
	}
%>