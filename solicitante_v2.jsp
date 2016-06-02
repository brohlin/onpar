<jsp:include page="set_solicitante_v2.jsp" flush="true" />

<details>
<summary>Declaración Jurada</summary>
<form action="sql_ins_solicitante_v2.jsp" method="post" name="solicitante_ins_v2">

<jsp:include page="dj_datos_personales.jsp" flush="true" />
<br>
<jsp:include page="dj_educacion.jsp" flush="true" />
<br>
<jsp:include page="dj_ocupacion.jsp" flush="true" />
<br>	
<jsp:include page="dj_militar.jsp" flush="true" />
<br>	
<jsp:include page="dj_org.jsp" flush="true" />
<br>
<jsp:include page="dj_arrest.jsp" flush="true" />
<br>
<jsp:include page="dj_familia.jsp" flush="true" />
<br>
<jsp:include page="dj_viaje.jsp" flush="true" />
<br>
<jsp:include page="dj_escrita.jsp" flush="true" />
<br>
<jsp:include page="dj_pref.jsp" flush="true" />
<br>
<jsp:include page="dj_entrega.jsp" flush="true" />
<br>
<jsp:include page="dj_uso_interno.jsp" flush="true" />
<br>
<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">		
	<tr class="datatablerowv2">
	<td>
		<!-- input type="submit" value="Guardar" name="save" onclick="return confirm('¿Está seguro que quiere guardar este formulario?');" -->
		<input type="submit" value="Guardar" name="save">
	</td>
	<td>
		<input type="reset" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</fieldset>
<br>
</form>
</details>