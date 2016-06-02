<details>
<summary>Decisión de la Comisión/Estatus: <strong><%= session.getAttribute("temp_solicitante_v2_ref_estatus_lkup") %></strong></summary>

<%
if (session.getAttribute("role_id").equals("4")) {
	if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("Admitido/a a trámite - original - Dirección") 
			|| session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("Admitido/a a trámite - reconsideración - Dirección")
			|| session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - original - Comisión")) {
%>
		<form action="sql_upd_solicitante_com_orig_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>
		<tr>
			<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Decisión Original</strong>
			<br>	
			</td>
		</tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la decisión original: </td><td><input type="date"  name="ref_fecha_resol"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisión original del caso</td>
			<td>
				<select name="ref_dec_resol_lkup" size="1">
				<option value="En proceso - original - Comisión">En proceso - original - Comisión</option>
				<option value="Admitido/a a trámite - original - Comisión">Admitido/a a trámite - original - Comisión</option>
				<option value="No admitido/a a trámite - original - Comisión">No admitido/a a trámite - original - Comisión</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Razón por la decisión: </td><td><textarea  name="ref_dec_resol_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
		
		<!--- Submit/cancel. --->
		<tr>
			<td>&nbsp;</td>
			<td valign="middle">
		
			<!--- Save button --->
			<input  type="submit" class="butnTxt" value="Guardar" name="save">
		
			<!--- Cancel button --->
			<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
			</td>
		</tr>
		</table>
		</form>		
<%
	} else if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - reconsideración - Comisión")) {
%>		
		<form action="sql_upd_solicitante_com_recon_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>	
		
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la reconsideración: </td><td><input type="date"  name="ref_fecha_resol_recon"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisión de la reconsideración del caso: </td>
			<td>
				<select name="ref_dec_resol_recon_lkup" size="1">
				<option value="En proceso - reconsideración - Comisión">En proceso - reconsideración - Comisión</option>
				<option value="Admitido/a a trámite - reconsideración - Comisión">Admitido/a a trámite - reconsideración - Comisión</option>
				<option value="No admitido/a a trámite - reconsideración - Comisión">No admitido/a a trámite - reconsideración - Comisión</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Razón por la decisión de la reconsideración: </td><td><textarea  name="ref_dec_resol_recon_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
	
		<!--- Submit/cancel. --->
		<tr>
			<td>&nbsp;</td>
			<td valign="middle">
		
			<!--- Save button --->
			<input  type="submit" class="butnTxt" value="Guardar" name="save">
		
			<!--- Cancel button --->
			<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
			</td>
		</tr>
		</table>
		</form>
<%
	} else if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - apelación - Comisión")) {
%>
		<form action="sql_upd_solicitante_com_apel_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la apelación: </td><td><input type="date"  name="ref_fecha_resol_apel"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisión de la apelación del caso: </td>
			<td>
				<select name="ref_dec_resol_apel_lkup" size="1">
				<option value="En proceso - apelación - Comisión">En proceso - apelación - Comisión</option>
				<option value="Admitido/a a trámite - apelación - Comisión">Admitido/a a trámite - apelación - Comisión</option>
				<option value="No admitido/a a trámite - apelación - Comisión">No admitido/a a trámite - apelación - Comisión</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Razón por la decisión de la apelación: </td><td><textarea  name="ref_dec_resol_apel_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>

		<!--- Submit/cancel. --->
		<tr>
			<td>&nbsp;</td>
			<td valign="middle">
		
			<!--- Save button --->
			<input  type="submit" class="butnTxt" value="Guardar" name="save">
		
			<!--- Cancel button --->
			<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
			</td>
		</tr>
		</table>
		</form>
<%
	}
}
%>
</details>
