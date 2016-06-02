<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 

<!--- Start HTML --->
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
	<!--- Photo --->
		<td width="300" valign="top" align="left">
			<table width="270" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td valign="top" width="270" align="left">
						<img src="/onpar/img/country_flags/panama-flag.gif" width="245" height="165" border="0" alt="">
					</td>
				</tr>
			</table>
		</td>
		<td width="300" valign="top" align="left">
			<p>La Oficina Nacional Para la Atención de Refugiados (ONPAR) mantiene una lista de solicitantes de la condición de refugiado y refugiados/as reconocidos/as en Panamá.</p>
			<p>Para crear y modificar una solicitud o para obtener informes sobre los solicitantes, usted tiene que <a href="/onpar/main.jsp?target=registrar">registrarse</a> primero. Si ya tiene cuenta, puede ingresar al sistema de ONPAR.
			</p>
			<form action="/onpar/sql_get_login.jsp" method="post">
				<table width="270" border="0" cellspacing="0" cellpadding="0" align="left">
					<tr>
						<td align="left" class="hdrBlackTxt">Inicio de sesión</td>
						<td align="left">
							<br><span class="smRedTxt">* Obligatorio</span>
						</td>
					</tr>

					<!--- Username --->
					<tr>
						<td class="subHdrBlackTxt"><span class="smRedTxt">*</span>&nbsp;<label for="Email">Correo Electrónico:</label></td>
						<td><input tabindex="<%= mCounter++ %>" type="email" name="email" id="email" size="20" maxlength="45" required="required" autofocus="autofocus"></td>
					</tr>

					<!--- Password function --->
					<tr>
						<td class="subHdrBlackTxt"><span class="smRedTxt">*</span>&nbsp;<label for="Password">Contraseña:</label></td>
						<td><input tabindex="<%= mCounter++ %>" type="password" name="pwd" id="pwd" size="20" maxlength="15" required="required"></td>
					</tr>

					<!--- Submit button --->
					<tr>
						<td colspan="2" valign="top" width="225" height="20" align="right">
							<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Entrar" name="Entrar">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>