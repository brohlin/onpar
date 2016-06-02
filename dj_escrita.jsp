<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" align="left">Declaraci�n escrita:</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Al responder a las siguientes preguntas, usted debe contarnos todo sobre por qu� cree usted que necesita protecci�n como refugiado. Debe darnos <strong>todos</strong> los detalles posibles, incluyendo la fecha en que ocurrieron los acontecimientos pertinentes. Es importante que usted brinde respuestas verdaderas y completas a estas preguntas. <strong>Si necesita m�s espacio para describir todos los detalles relevantes, favor a�ada m�s p�ginas.</strong>
			<br>
			<br>�Porque sali� de su pa�s de origen, nacionalidad, o residencia habitual?
		</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><textarea  name="pre_fundado_temor" cols="100" rows="20" maxlength="2000" ><%= session.getAttribute("temp_solicitante_v2_pre_fundado_temor") %></textarea></td>
	</tr>
	<tr class="datatablerowv2">
		<td>�Qu� cree que le pasar�a a usted, o a miembros de su familia, si volviera a su pa�s de nacionalidad o de residencia habitual? Por favor, explique con el mayor detalle posible.</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><textarea  name="pre_fundado_temor_partb" cols="100" rows="20" maxlength="2000" ><%= session.getAttribute("temp_solicitante_v2_pre_fundado_temor_partb") %></textarea></td>
	</tr>
</table>
</fieldset>