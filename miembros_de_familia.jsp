<!--- Start tab index --->
<!---% 
	int mCounter = 0;  
	mCounter++; 
%--->

<details>
<summary>Miembros de la familia</summary>
<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para insertar o editar miembros de familia de un solicitante.
		</td>
	</tr>

<!--- Start form and hidden inputs --->
	<form name="add_family_member" action="main.jsp?target=miembro_de_familia" method="post">
	<!--- Submit button --->
	<tr>
		<td align="right">
			<input type="submit" class="butnTxt" value="Añadir Miembro de Familia" name="añadir">
		</td>
	</tr>
	</form>
</table>


<%@include file="sql_get_miembros_de_familia.jsp" %>

</details>
