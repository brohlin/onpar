<% 
	int mCounter = 0;  
	mCounter++; 
	String mReport_type = request.getParameter("report_type");
	String mYear = request.getParameter("year");
	String mQuarter = request.getParameter("quarter");
	
	if (mReport_type == null) {
		mReport_type = "";
	}
	
	if (mYear == null) {
		mYear = "2014";
	}
	
	if (mQuarter== null) {
		mQuarter = "All";
	}		
%>

<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr> 
		<td valign="top" width="600" colspan="2" class="hdrBlackTxt">
			Reporte: País por rango de edades y sexo, filtrado por estatus del caso, año y mes
		</td>
	</tr>	
	<tr>
		<td colspan="2" width="600">&nbsp;</td>
	</tr>
	
		<form name="solicitantes" action="/onpar/main.jsp?target=reporte_pais_sexo_edad_ano_trimestre" method="post">
		<tr>
			<td align="left">Estatus del caso
				<select name="report_type" size="1">
				<option value="" <% if (mReport_type.equals("")) { %> selected <% } %>>Todos los casos</option>
				<option value="Admitidos a Tramite" <% if (mReport_type.equals("Admitidos a Tramite")) { %> selected <% } %>>Admitidos a Tramite</option>
				<option value="Cesación" <% if (mReport_type.equals("Cesación")) { %> selected <% } %>>Cesación</option>
				<option value="Expulsión" <% if (mReport_type.equals("Expulsión")) { %> selected <% } %>>Expulsión</option>
				<option value="Fallecimiento" <% if (mReport_type.equals("Fallecimiento")) { %> selected <% } %>>Fallecimiento</option>
				<option value="Naturalización" <% if (mReport_type.equals("Naturalización")) { %> selected <% } %>>Naturalización</option>
				<option value="Negados por la Comisión" <% if (mReport_type.equals("Negados por la Comisión")) { %> selected <% } %>>Negados por la Comisión</option>		
				<option value="No Admitidos a Tramite" <% if (mReport_type.equals("No Admitidos a Tramite")) { %> selected <% } %>>No Admitidos a Tramite</option>
				<option value="Numero de Refugiados Reconocidos" <% if (mReport_type.equals("Numero de Refugiados Reconocidos")) { %> selected <% } %>>Numero de Refugiados Reconocidos</option>		
				<option value="Pendientes por la Comisión" <% if (mReport_type.equals("Pendientes por la Comisión")) { %> selected <% } %>>Pendientes por la Comisión</option>	
				<option value="Reasentamiento" <% if (mReport_type.equals("Reasentamiento")) { %> selected <% } %>>Reasentamiento</option>
				<option value="Renuncias al Tramite" <% if (mReport_type.equals("Renuncias al Tramite")) { %> selected <% } %>>Renuncias al Tramite</option>
				<option value="Repatriación" <% if (mReport_type.equals("Repatriación")) { %> selected <% } %>>Repatriación</option>
				<option value="Revocación" <% if (mReport_type.equals("Revocación")) { %> selected <% } %>>Revocación</option>
				<option value="Solicitantes de Admisión al Tramite" <% if (mReport_type.equals("Solicitantes de Admisión al Tramite")) { %> selected <% } %>>Solicitantes de Admisión al Tramite</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Año
				<select name="year" size="1">
				<option value="2014"  <% if (mYear.equals("2014")) { %> selected <% } %>>2014</option>
				<option value="2015"  <% if (mYear.equals("2015")) { %> selected <% } %>>2015</option>
				<option value="2016"  <% if (mYear.equals("2016")) { %> selected <% } %>>2016</option>
				</select>
				Trimestre
				<select name="quarter" size="1">
				<option value="All"<% if (mQuarter.equals("All")) { %> selected <% } %>>Todos trimestres</option>
				<option value="01" <% if (mQuarter.equals("01")) { %> selected <% } %>>Enero-Marzo</option>
				<option value="02" <% if (mQuarter.equals("02")) { %> selected <% } %>>Abril-Junio</option>
				<option value="03" <% if (mQuarter.equals("03")) { %> selected <% } %>>Julio-Septiembre</option>
				<option value="04" <% if (mQuarter.equals("04")) { %> selected <% } %>>Octubre-Diciembre</option>
				</select>				
			</td>
			<td>&nbsp;</td>	
		</tr>
		<tr>
			<td>
				<input type="submit" class="butnTxt" value="Ver Reporte" name="ver_reporte" vspace="0" >
			</td>
		</tr>
	</form>
</table>

<%@include file="sql_get_reporte_pais_sexo_edad_ano_trimestre.jsp"%>