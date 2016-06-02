<details>
<summary>Pruebas</summary>
<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para insertar o editar pruebas de un solicitante.
		</td>
	</tr>

	<form name="add_prueba" action="main.jsp?target=prueba" method="post">

	<tr>
		<td align="right">
			<input type="submit" class="butnTxt" value="Añadir Prueba" name="añadir">
		</td>
	</tr>
	</form>
</table>


<%@include file="sql_get_pruebas.jsp" %>

</details>
