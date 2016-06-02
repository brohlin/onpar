<details>
<summary>Decisión de la Dirección/Estatus: <strong><%= session.getAttribute("temp_solicitante_adm_estatus_lkup") %></strong></summary>

<%
	if (session.getAttribute("temp_solicitante_adm_estatus_lkup").equals("En proceso - original")) {
%>
		<form action="sql_upd_solicitante_dir_orig.jsp" method="post" name="solicitante_upd_dir">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>
		<tr>
			<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Decisión Original</strong>
			<br>	
			</td>
		</tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la decisión original: </td><td><input type="date" tabindex="<%= mCounter++ %>" name="adm_fecha_resol"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisión original del caso</td>
			<td>
				<select name="adm_dec_resol_lkup" size="1">
				<option value="En proceso - original">En proceso - original</option>
				<option value="Admitido/a a trámite - original">Admitido/a a trámite - original</option>
				<option value="No admitido/a a trámite - original">No admitido/a a trámite - original</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Razón por la decisión: </td><td><textarea tabindex="<%= mCounter++ %>" name="adm_dec_resol_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
		
		<!--- Submit/cancel. --->
		<tr>
			<td>&nbsp;</td>
			<td valign="middle">
		
			<!--- Save button --->
			<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
		
			<!--- Cancel button --->
			<input tabindex="<%= mCounter++ %>" type="reset" class="butnTxt" value="Reiniciar" name="reset">
			</td>
		</tr>
		</table>
		</form>		
<%
	} else if (session.getAttribute("temp_solicitante_adm_estatus_lkup").equals("En proceso - reconsideración")) {
%>		
		<form action="sql_upd_solicitante_dir_recon.jsp" method="post" name="solicitante_upd_dir">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>	
		
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la reconsideración: </td><td><input type="date" tabindex="<%= mCounter++ %>" name="adm_fecha_resol_recon"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisión de la reconsideración del caso: </td>
			<td>
				<select name="adm_dec_resol_recon_lkup" size="1">
				<option value="En proceso - reconsideración">En proceso - reconsideración</option>
				<option value="Admitido/a a trámite - reconsideración">Admitido/a a trámite - reconsideración</option>
				<option value="No admitido/a a trámite - reconsideración">No admitido/a a trámite - reconsideración</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Razón por la decisión de la reconsideración: </td><td><textarea tabindex="<%= mCounter++ %>" name="adm_dec_resol_recon_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
	
		<!--- Submit/cancel. --->
		<tr>
			<td>&nbsp;</td>
			<td valign="middle">
		
			<!--- Save button --->
			<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
		
			<!--- Cancel button --->
			<input tabindex="<%= mCounter++ %>" type="reset" class="butnTxt" value="Reiniciar" name="reset">
			</td>
		</tr>
		</table>
		</form>
<%
	}
%>
</details>
