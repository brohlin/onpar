<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="5" align="left">Educación (nivel más alto alcanzado)</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Nombre de la institución</td>
	    <td>Ciudad/País</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Titulo obtenido</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_edu_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_edu_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_edu_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_edu_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_hasta") %>"></td>
	    <td><input type="text"  name="pre_edu_titulo" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_titulo") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_edu_nombre2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_nombre2") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_edu_lugar2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_lugar2") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_edu_desde2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_desde2") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_edu_hasta2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_hasta2") %>"></td>
	    <td><input type="text"  name="pre_edu_titulo2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_titulo2") %>" size="25" maxlength="40"></td>	    
	</tr>		
</table>
</fieldset>