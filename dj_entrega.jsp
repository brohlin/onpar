<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" align="left">Entrega de la solicitud	
		</th>
	</tr>
	
<%
	if (session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").equals("Digitalizar Caso Cerrado")) {
%>
	<tr class="datatablerowv2">
		<td class="boldRedTxt">Fecha de entrega de la solicitud: <input type="date" name="pre_fecha_solicitud_onpar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar") %>" >		
		</td>
	</tr>
<%
	} else {
%>	
	<tr class="datatablerowv2">
		<td class="boldRedTxt">Fecha de entrega de la solicitud: <input type="date" name="pre_fecha_solicitud_onpar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar") %>" required="required" >		
		</td>
	</tr>	
<%
	}
%>

	<tr class="datatablerowaltv2">
		<td>Preparado por (solicitante o nombre de su representante legal u otro): <input type="text" name="pre_solicitud_preparado_por" value="<%= session.getAttribute("temp_solicitante_v2_pre_solicitud_preparado_por") %>" size="25" maxlength="40">	
		</td>	    
	</tr>
</table>
</fieldset>