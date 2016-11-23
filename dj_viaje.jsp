<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="4" align="left">Detalles del viaje</th>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="4">Fecha de la partida del país de residencia: <input type="text" class="datepicker"  name="pre_fecha_de_salida_origen" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_de_salida_origen") %>"></td>
	<tr>


<%
	if (session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").equals("Digitalizar Caso Cerrado")) {
%>
	<tr class="datatablerowaltv2">
		<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="text" class="datepicker"  name="pre_fecha_llegada_panama" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama") %>"></td>
	<tr>
<%
	} else {
%>	
	<tr class="datatablerowaltv2">
		<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="text" class="datepicker"  name="pre_fecha_llegada_panama" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama") %>" required="required"></td>
	<tr>	
<%
	}
%>
	<tr class="datatablerowv2">
		<td colspan="4">Medios de viaje para salir del país de residencia:</td>
	<tr>
	<tr class="datatablerowv2">
		<td>Países de tránsito:</td>
	    <td>Desde</td>
		<td>Hasta</td>
	    <td>Medio de viaje para llegar a tal país.</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje1_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje1_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje1_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje1_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje1_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje1_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje1_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje1_medio") %>" size="25" maxlength="40"></td>	    
	</tr>
	
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje2_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje2_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje2_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje2_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje2_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje2_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje2_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje2_medio") %>" size="25" maxlength="40"></td>	    
	</tr>
			<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje3_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje3_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje3_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje3_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje3_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje3_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje3_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje3_medio") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje4_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje4_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje4_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje4_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje4_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje4_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje4_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje4_medio") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje5_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje5_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje5_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje5_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje5_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje5_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje5_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje5_medio") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_viaje6_pais" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje6_pais") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje6_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje6_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_viaje6_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje6_hasta") %>"></td>
	    <td><input type="text"  name="pre_viaje6_medio" value="<%= session.getAttribute("temp_solicitante_v2_pre_viaje6_medio") %>" size="25" maxlength="40"></td>	    
	</tr>			

</table>
</fieldset>


