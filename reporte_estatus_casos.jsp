<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<table border="0" cellspacing="0" cellpadding="4">
	<tr> 
		<td valign="top" colspan="3" class="hdrBlackTxt">
			Reporte: Estatus de los casos por mes en 2014
		</td>
	</tr>	
	<tr>
		<td colspan="3">&nbsp;</td>
	</tr>
</table>



<%	
	DynStringArray parameters = new DynStringArray();
	parameters.add("2014");
	DbResults db = Database.callProcResults("p_rpt_case_status_by_month", parameters);
	String myTable = db.generateHtmlTableCss();
	
	// String myObjectId = db.toString();
	// request.getSession().setAttribute(myObjectId, db);
	// request.setAttribute("myObjectId", myObjectId);
%>

<br>

<%= myTable %>