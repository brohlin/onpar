<details>
<summary>Resoluciones</summary>
<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para insertar o editar resoluciones de un solicitante.
		</td>
	</tr>

	<form name="add_resolucion_v2" action="main.jsp?target=resolution_v2" method="post">

	<tr>
		<td align="right">
			<input type="submit" class="butnTxt" value="Añadir Resulución" name="añadir">
		</td>
	</tr>
	</form>
</table>


<%@include file="sql_get_resoluciones_v2.jsp" %>

</details>
