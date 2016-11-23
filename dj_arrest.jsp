<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="4" align="left">Ud. ha sido arrestado o detenido alguna vez?
			<select name="pre_arrest_confirm" size="1">
			<option value=""></option>
			<option value="Si" <% if (session.getAttribute("temp_solicitante_v2_pre_arrest_confirm").equals("Si")) {%> selected <% } %>>Si</option>
			<option value="No" <% if (session.getAttribute("temp_solicitante_v2_pre_arrest_confirm").equals("No")) {%> selected <% } %>>No</option>
			</select>		
		</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Fecha de arresto o detención</td>
	    <td>Ciudad/País</td>
		<td>¿Ud. fue condenado por algún delito? Especificar el delito.</td>
	    <td>Indicar la sentencia condenatoria</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text" class="datepicker"  name="pre_arrest_fecha" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_fecha") %>"></td>
	    <td><input type="text"  name="pre_arrest_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_arrest_delito" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_delito") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_arrest_sentencia" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_sentencia") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text" class="datepicker"  name="pre_arrest_fecha2" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_fecha2") %>"></td>
	    <td><input type="text"  name="pre_arrest_lugar2" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_lugar2") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_arrest_delito2" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_delito2") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_arrest_sentencia2" value="<%= session.getAttribute("temp_solicitante_v2_pre_arrest_sentencia2") %>" size="25" maxlength="40"></td>	    
	</tr>
</table>
</fieldset>