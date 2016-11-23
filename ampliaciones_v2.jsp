<details>
<summary>Ampliaciones a la entrevista legal</summary>
<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para insertar o editar ampliaciones a la entrevista legal de un solicitante.
		</td>
	</tr>

	<form name="add_ampliacion_v2" action="main.jsp?target=ampliacion_v2" method="post">

	<tr>
		<td align="right">
			<input type="submit" class="butnTxt" value="Añadir Ampliación" name="añadir">
		</td>
	</tr>
	</form>
</table>


<%@include file="sql_get_ampliaciones_v2.jsp" %>

</details>
