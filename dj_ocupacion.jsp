<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="5" align="left">Ocupación (más reciente en el país de origen)</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Nombre del empleador</td>
	    <td>Ciudad/País</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Nombre del puesto</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_ocu_empleador" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_empleador") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_ocu_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_ocu_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_ocu_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_hasta") %>"></td>
	    <td><input type="text"  name="pre_ocu_puesto" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_puesto") %>" size="25" maxlength="40"></td>	    
	</tr>
</table>
</fieldset>
