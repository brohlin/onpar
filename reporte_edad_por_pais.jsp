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
			Reporte: Rango de Edades por Sexo por País de Origen (datos viejos de la hoja de cálculo de Ximara)
		</td>
	</tr>	
	<tr>
		<td colspan="2" width="600">&nbsp;</td>
	</tr>

<!--- Start form and hidden inputs --->

		<form name="solicitantes" action="/onpar/main.jsp?target=reporte_edad_por_pais" method="post">
		<tr>
			<td align="left">Estatus del caso:
				<select name="report_type" size="1">
				<option value=""></option>
				<option value="Admitidos a Tramite">Admitidos a Tramite</option>
				<option value="Negados por la Comisión">Negados por la Comisión</option>		
				<option value="No Admitidos a Tramite">No Admitidos a Tramite</option>
				<option value="Numero de Refugiados Reconocidos">Numero de Refugiados Reconocidos</option>		
				<option value="Pendientes por la Comisión">Pendientes por la Comisión</option>	
				<option value="Renuncias al Tramite">Renuncias al Tramite</option>
				<option value="Repatriaciones">Repatriaciones</option>
				<option value="Solicitantes de Admisión al Tramite">Solicitantes de Admisión al Tramite</option>
				</select>
				
				
			
				<input type="submit" class="butnTxt" value="Ver Reporte" name="ver_reporte" vspace="0" >
				
				
			</td>
		</tr>
	</form>
</table>

<%@include file="sql_get_reporte.jsp"%>
<!--- %@include file="sql_get_reporte_total.jsp"% --->