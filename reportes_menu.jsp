<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
	String mReport_type = request.getParameter("report_type");
	
	if (mReport_type == null) {
		mReport_type = "";
	}
%>

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr> 
		<td valign="top" width="600" colspan="2" class="hdrBlackTxt">
			Reportes
		</td>
	</tr>	
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para ver reportes de ONPAR.
		</td>
	</tr>
	<tr>
		<td>
			<ul>
				<li><a href="/onpar/main.jsp?target=reporte_estatus_casos">Estatus de los casos por mes en 2014</a></li>
				<br>
				<li><a href="/onpar/main.jsp?target=reporte_estatus_casos_2015">Estatus de los casos por mes en 2015</a></li>
				<br>	
				<li><a href="/onpar/main.jsp?target=reporte_estatus_casos_2016">Estatus de los casos por mes en 2016</a></li>
				<br>			
				<li><a href="/onpar/main.jsp?target=reporte_pais_sexo_edad_ano">País por rango de edades y sexo, filtrado por estatus del caso, año y mes</a></li>
				<br>
				<li><a href="/onpar/main.jsp?target=reporte_pais_sexo_edad_ano_trimestre">País por rango de edades y sexo, filtrado por estatus del caso, año y trimestre</a></li>
				<br>				
				<li><a href="/onpar/main.jsp?target=reporte_edad_por_pais">Rango de Edades por Sexo por País de Origen (datos viejos de la hoja de cálculo de Ximara)</a></li>
<%
	if ((session.getAttribute("role_id") != null) && (session.getAttribute("role_id").equals("4"))) {
%>
				<br>				
				<li><a href="/onpar/main.jsp?target=export_to_excel">Exportar los datos a Excel</a></li>
<%
	}
%>
			</ul>
		</td>
	</tr>

</table>