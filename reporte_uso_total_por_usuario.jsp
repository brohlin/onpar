<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<table border="0" cellspacing="0" cellpadding="4">
	<tr> 
		<td valign="top" colspan="3" class="hdrBlackTxt">
			Reporte: Uso total de la base de datos por usuario por formulario
		</td>
	</tr>	
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
</table>



<%	
	DynStringArray parameters = new DynStringArray();
	DbResults db = Database.callProcResults("p_rpt_uso_total_por_usuario", parameters);
	String myTable = db.generateHtmlTableCss();
	
	// String myObjectId = db.toString();
	// request.getSession().setAttribute(myObjectId, db);
	// request.setAttribute("myObjectId", myObjectId);
%>

<br>

<%= myTable %>