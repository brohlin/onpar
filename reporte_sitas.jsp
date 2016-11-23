<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<% 
	int mCounter = 0;  
	mCounter++; 
	String mDay_month = request.getParameter("day_month");
	String mDay = request.getParameter("day");
	
	if (mDay_month == null) {
		mDay_month = "day";
	}
	
	if (mDay == null) {
		mDay = "";
	}
	
	DynStringArray params_sitas = new DynStringArray();
	params_sitas.add(mDay);
	params_sitas.add(mDay_month);
	
	DbResults db_sitas = Database.callProcResults("p_get_sitas", params_sitas);
	
	int size = 0;
	String altrow = "datatablerowaltv2";
	
%>

<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr> 
		<td valign="top" width="600" colspan="2" class="hdrBlackTxt">
			Reporte: Sitas por día o mes
		</td>
	</tr>	
	<tr>
		<td colspan="2" width="600">&nbsp;</td>
	</tr>
	
	<form name="sitas" action="/onpar/main.jsp?target=reporte_sitas" method="post">
		
	<tr class="datatablerowv2">
		<td colspan="2">Sitas por día o mes
		<input type="radio" id="day_month" name="day_month" value="day" checked="checked">Día&nbsp;&nbsp;&nbsp;
		<input type="radio" id="day_month" name="day_month" value="month">Mes&nbsp;&nbsp;&nbsp;
		<td colspan="2"></td>
	</tr>
	
	<div id="sitas_day">
	<tr>
		<td>Día <input type="text" class="datepicker" id="day" name="day" value="" required>
	</tr>
	</div>
			

	
		<tr>
			<td>
				<input type="submit" class="butnTxt" value="Ver Sitas" name="ver_sitas" vspace="0" >
			</td>
		</tr>
	</form>
</table>



<br>
<br>
<strong>Sitas</strong>
<table border="0">
	<tr class="<%= altrow %>">
		<th><strong>ID</strong></th>
		<th><strong>Nombre</strong></th>
		<th><strong>Fecha de llegada a Panamá</strong></th>
		<th><strong>Fecha de solicitud de ONPAR</strong></th>
		<th><strong>Fecha de sita</strong></th>
	</tr>
<%		
	while(size<db_sitas.getRowCount())
	{			
		if (altrow.equals("datatablerowaltv2")) {
			altrow="datatablerowv2";
		} else {
			altrow="datatablerowaltv2";
		}

%>
	<tr class="<%= altrow %>">
		<td><%= db_sitas.getRow(size).get(0) %></td>
		<td><%= db_sitas.getRow(size).get(1) %></td>
		<td><%= db_sitas.getRow(size).get(2) %></td>
		<td><%= db_sitas.getRow(size).get(3) %></td>
		<td><%= db_sitas.getRow(size).get(4) %></td>
	</tr>
<%
		size++;
	}
%>	

</table>
