<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" align="left">Para uso interno de la ONPAR	
		</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Nombre del funcionario de la ONPAR que recibió la declaración jurada: <input type="text" name="pre_ui_nombre_recibio" value="<%= session.getAttribute("temp_solicitante_v2_pre_ui_nombre_recibio") %>"  size="25" maxlength="40"></td>	    
	</tr>	
	<tr class="datatablerowaltv2">
		<td>Número de caso: <%= session.getAttribute("temp_solicitante_v2_id") %></td>	    
	</tr>	
	<tr class="datatablerowv2">
		<td>Fecha recibido: <input type="date" name="pre_ui_fecha_recibido" value="<%= session.getAttribute("temp_solicitante_v2_pre_ui_fecha_recibido") %>">		
		</td>
	</tr>

</table>
</fieldset>