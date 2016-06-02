<details>
<summary>Decisi�n de la Comisi�n/Estatus: <strong><%= session.getAttribute("temp_solicitante_v2_ref_estatus_lkup") %></strong></summary>

<%
if (session.getAttribute("role_id").equals("4")) {
	if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("Admitido/a a tr�mite - original - Direcci�n") 
			|| session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("Admitido/a a tr�mite - reconsideraci�n - Direcci�n")
			|| session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - original - Comisi�n")) {
%>
		<form action="sql_upd_solicitante_com_orig_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>
		<tr>
			<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Decisi�n Original</strong>
			<br>	
			</td>
		</tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la decisi�n original: </td><td><input type="date"  name="ref_fecha_resol"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisi�n original del caso</td>
			<td>
				<select name="ref_dec_resol_lkup" size="1">
				<option value="En proceso - original - Comisi�n">En proceso - original - Comisi�n</option>
				<option value="Admitido/a a tr�mite - original - Comisi�n">Admitido/a a tr�mite - original - Comisi�n</option>
				<option value="No admitido/a a tr�mite - original - Comisi�n">No admitido/a a tr�mite - original - Comisi�n</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Raz�n por la decisi�n: </td><td><textarea  name="ref_dec_resol_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
		
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
	} else if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - reconsideraci�n - Comisi�n")) {
%>		
		<form action="sql_upd_solicitante_com_recon_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>	
		
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la reconsideraci�n: </td><td><input type="date"  name="ref_fecha_resol_recon"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisi�n de la reconsideraci�n del caso: </td>
			<td>
				<select name="ref_dec_resol_recon_lkup" size="1">
				<option value="En proceso - reconsideraci�n - Comisi�n">En proceso - reconsideraci�n - Comisi�n</option>
				<option value="Admitido/a a tr�mite - reconsideraci�n - Comisi�n">Admitido/a a tr�mite - reconsideraci�n - Comisi�n</option>
				<option value="No admitido/a a tr�mite - reconsideraci�n - Comisi�n">No admitido/a a tr�mite - reconsideraci�n - Comisi�n</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Raz�n por la decisi�n de la reconsideraci�n: </td><td><textarea  name="ref_dec_resol_recon_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>
	
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
	} else if (session.getAttribute("temp_solicitante_v2_ref_estatus_lkup").equals("En proceso - apelaci�n - Comisi�n")) {
%>
		<form action="sql_upd_solicitante_com_apel_v2.jsp" method="post" name="solicitante_upd_com_v2">
		
			<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
		
		<!--- Start display. --->
		<table border="0" cellspacing="0" cellpadding="4" width="600">
		<br>
		<br>
		<tr><td align="right"><span class="smRedTxt">*</span> Fecha de la apelaci�n: </td><td><input type="date"  name="ref_fecha_resol_apel"  value="" required="required" autofocus="autofocus"></td></tr>
		<tr><td align="right"><span class="smRedTxt">*</span> Decisi�n de la apelaci�n del caso: </td>
			<td>
				<select name="ref_dec_resol_apel_lkup" size="1">
				<option value="En proceso - apelaci�n - Comisi�n">En proceso - apelaci�n - Comisi�n</option>
				<option value="Admitido/a a tr�mite - apelaci�n - Comisi�n">Admitido/a a tr�mite - apelaci�n - Comisi�n</option>
				<option value="No admitido/a a tr�mite - apelaci�n - Comisi�n">No admitido/a a tr�mite - apelaci�n - Comisi�n</option>
				</select>
			</td>
		</tr>
		<tr><td align="left" valign="top"><span class="smRedTxt">*</span>Raz�n por la decisi�n de la apelaci�n: </td><td><textarea  name="ref_dec_resol_apel_memo" required="required" cols="50" rows="4" maxlength="200"></textarea></td></tr>

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
