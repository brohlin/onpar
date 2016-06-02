<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 


<form action="sql_ins_user.jsp" method="post" name="ins_user">

	<input type="hidden" name="user_status_cd" value="P">

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Información del Usuario
	</td>
</tr>

<!--- Form instructions.  Vary based on user role --->
<tr>
	<td colspan="2">Utilice el siguiente formulario para pedir una cuenta de usuario. Pulse el botón "Guardar" si quiere guardar los cambios. Pulse el botón "Reiniciar" si quiere reiniciar el formulario.
	</td>
</tr>
<tr>
	<td align="left" valign="top" class="subHdrBlackTxt" nowrap>
	<br>
	</td>
	<td valign="bottom" width="350" align="center">
	<br><span class="smRedTxt">* Obligatorio</span>
	</td>
</tr>


<!--- First  class="subHdrBlackTxt"--->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="First Name"> Primer Nombre</label>
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="first_nm" value="" required="required" size="30" maxlength="45">
	</td>
</tr>

<!--- Last --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Last Name"> Apellido</label>
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="last_nm" value="" required="required" size="30" maxlength="45">
	</td>
</tr>

<!--- Position Title --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Position Title"> Título</label>
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="position_title" value="" required="required" size="30" maxlength="45">
	</td>
</tr>

<!--- Organization --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Organization"> Organización</label>
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="organization" value="" required="required" size="60" maxlength="100">
	</td>
</tr>

<!--- Role --->
<tr>
	<td align="right">
		<span class="smRedTxt">*</span><label for="Role"> <label for="Role"> Rol en el Sistema</label>
	</td>
	<td>
		<select name="role_id" tabindex="<%= mCounter++ %>" required="required">
			<option value="1">Recepción</option>
			<option value="2">Legal</option>
			<option value="3">Social</option>
			<option value="4">Dirección</option>
		</select>
	</td>
</tr>
<!--- Telephone --->
<tr>
	<td align="right">
	<label for="Phone">Teléfono</label>
	</td>
	<td>
		<input type="tel" tabindex="<%= mCounter++ %>" name="tel_nbr" value="" size="30" maxlength="45">
	</td>
</tr>

<!--- Skype handle --->
<tr>
	<td align="right">
	<label for="Skype">Nombre de Skype</label>
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="skype_handle" value="" size="30" maxlength="45">
	</td>
</tr>

<!--- Email --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Email"> Email</label>
	</td>

	<td>
		<input type="email" tabindex="<%= mCounter++ %>" name="email" value="" required="required" size="30" maxlength="45">
	</td>
</tr>

<!--- Alternate Person in Charge --->
<tr>
	<td align="right">Email de la Persona a Cargo Provisional</label>
	</td>
	<td>
		<input type="email" tabindex="<%= mCounter++ %>" name="alternate" value="" size="30" maxlength="45">
	</td>
</tr>

<!--- Password rules --->
<tr>
	<td align="right" valign= "top">
	Reglas de Contraseña:
	</td>
	<td>
		La contraseña debe tener una longitud mínima de 8 caracteres y tiene que contener dos de los siguientes: una letra mayúscula, una puntuacion, o un valor numérico.<br>
	</td>
</tr>

<!--- Password --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Password"> Contraseña</label>
	</td>
	<td>
 		<input type="password" tabindex="<%= mCounter++ %>" name="pwd" value="" required="required" size="30" maxlength="45">
 	</td>
</tr>

<!--- Re-Type Password --->
<tr>
	<td align="right">
	<span class="smRedTxt">*</span><label for="Password"> Confirme Contraseña</label>
	</td>
	<td>
 	<input type="password" tabindex="<%= mCounter++ %>" name="confPwd" value="" required="required" size="30" maxlength="45">
	</td>
</tr>

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