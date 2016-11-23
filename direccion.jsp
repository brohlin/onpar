<details>
<summary>Decisi�n de la Direcci�n/Estatus: <strong><%= session.getAttribute("temp_solicitante_adm_estatus_lkup") %></strong></summary>

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
			<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Decisi�n Original</strong>
			<br>	
			</td>
		</tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la decisi�n original: </td><td><input type="text" class="datepicker" tabindex="<%= mCounter++ %>" name="adm_fecha_resol"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisi�n original del caso</td>
			<td>
				<select name="adm_dec_resol_lkup" size="1">
				<option value="En proceso - original">En proceso - original</option>
				<option value="Admitido/a a tr�mite - original">Admitido/a a tr�mite - original</option>
				<option value="No admitido/a a tr�mite - original">No admitido/a a tr�mite - original</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Raz�n por la decisi�n: </td><td><textarea tabindex="<%= mCounter++ %>" name="adm_dec_resol_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
		
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
	} else if (session.getAttribute("temp_solicitante_adm_estatus_lkup").equals("En proceso - reconsideraci�n")) {
%>		
		<form action="sql_upd_solicitante_dir_recon.jsp" method="post" name="solicitante_upd_dir">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>	
		
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la reconsideraci�n: </td><td><input type="text" class="datepicker" tabindex="<%= mCounter++ %>" name="adm_fecha_resol_recon"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisi�n de la reconsideraci�n del caso: </td>
			<td>
				<select name="adm_dec_resol_recon_lkup" size="1">
				<option value="En proceso - reconsideraci�n">En proceso - reconsideraci�n</option>
				<option value="Admitido/a a tr�mite - reconsideraci�n">Admitido/a a tr�mite - reconsideraci�n</option>
				<option value="No admitido/a a tr�mite - reconsideraci�n">No admitido/a a tr�mite - reconsideraci�n</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Raz�n por la decisi�n de la reconsideraci�n: </td><td><textarea tabindex="<%= mCounter++ %>" name="adm_dec_resol_recon_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
	
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
