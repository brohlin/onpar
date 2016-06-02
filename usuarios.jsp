<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%>

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr>
		<td valign="top" width="600" colspan="2" class="hdrBlackTxt">
			Administrar Usuarios
		</td>
	</tr>	
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para administrar cuentas de usuario dentro de ONPAR. Para crear un usuario en el ONPAR, pulse el botón "Añadir Nuevo Usuario". Para editar o eliminar una cuenta, pulse el enlace en la primera columna y siga con las instrucciones en la página siguiente.
		</td>
	</tr>

<!--- Start form and hidden inputs --->
	<form name="admin_add_new_user" action="main.jsp?target=registrar" method="post">
	<!--- Submit button --->
	<tr>
		<td align="right">
			<input type="submit" class="butnTxt" value="Añadir Nuevo Usuario" name="añadir" vspace="0">
		</td>
	</tr>
	</form>
</table>

<%@include file="sql_get_users_adm.jsp"%>