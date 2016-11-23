<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="5" align="left">Indique su afiliación, o inscrito en, cualquier tipo de organización:</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Nombre de la institución</td>
	    <td>Ciudad/País</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Su rol el la organización</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_org_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_org_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_org_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_org_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_hasta") %>"></td>
	    <td><input type="text"  name="pre_org_rol" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_rol") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_org_nombre2" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_nombre2") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_org_lugar2" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_lugar2") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_org_desde2" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_desde2") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_org_hasta2" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_hasta2") %>"></td>
	    <td><input type="text"  name="pre_org_rol2" value="<%= session.getAttribute("temp_solicitante_v2_pre_org_rol2") %>" size="25" maxlength="40"></td>	    
	</tr>
</table>
</fieldset>


