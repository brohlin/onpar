<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="5" align="left">Indique cualquier tipo de servicio militar</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Nombre de la institución</td>
	    <td>Ciudad/País</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Titulo obtenido</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_mil_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_mil_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_mil_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_mil_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_mil_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_mil_desde") %>"></td>
	    <td><input type="date"  name="pre_mil_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_mil_hasta") %>"></td>
	    <td><input type="text"  name="pre_mil_puesto" value="<%= session.getAttribute("temp_solicitante_v2_pre_mil_puesto") %>" size="25" maxlength="40"></td>	    
	</tr>
</table>
</fieldset>

