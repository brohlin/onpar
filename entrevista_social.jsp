<details>
<summary>Entrevista Social - <a href="/onpar/EntrevistaSocial" target="_blank">Para imprimir el informe</a></summary>
<form action="sql_upd_solicitante_soc.jsp" method="post" name="solicitante_upd_soc">

	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
<br>
<br>
<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Preguntas/Repuestas</strong>
	<br>
	</td>
</tr>

<tr><td align="left" valign="top">Relato de la situación que motivó la salida de su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qiii" cols="50" rows="20" maxlength="2000"><%= session.getAttribute("temp_solicitante_pre_soc_qiii") %></textarea></td></tr>
<tr><td align="left" valign="top">Cómo era su situación económica en su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv11" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv11") %></textarea></td></tr>
<tr><td align="left" valign="top">Ingreso laboral en su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv12" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv12") %></textarea></td></tr>
<tr><td align="left" valign="top">Ingreso laboral en Panamá y a que se dedica actualmente:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv13" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv13") %></textarea></td></tr>
<tr><td align="left" valign="top">Aspectos económicos relevantes del caso:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv14" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv14") %></textarea></td></tr>
<tr><td align="left" valign="top">Condiciones de las vivienda familiar en su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv21" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv21") %></textarea></td></tr>
<tr><td align="left" valign="top">Condiciones habitacionales actuales:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv22" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv22") %></textarea></td></tr>
<tr><td align="left" valign="top">Aspectos habitacionales relevantes en el caso:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv23" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv23") %></textarea></td></tr>
<tr><td align="left" valign="top">Condición educativa de los miembros menores en su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv31" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv31") %></textarea></td></tr>
<tr><td align="left" valign="top">Condición educativa de los miembros menores en Panamá:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv32" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv32") %></textarea></td></tr>
<tr><td align="left" valign="top">Aspectos educativos relevantes en el caso:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv33" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv33") %></textarea></td></tr>
<tr><td align="left" valign="top">Algún miembro de su familia presenta discapacidad:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv41" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv41") %></textarea></td></tr>
<tr><td align="left" valign="top">Antecedentes de salud de los solicitantes:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv42" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv42") %></textarea></td></tr>
<tr><td align="left" valign="top">Condición de salud actual:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qv43" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qv43") %></textarea></td></tr>
<tr><td align="left" valign="top">Causas que lo motivaron a buscar refugio:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvi1" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvi1") %></textarea></td></tr>
<tr><td align="left" valign="top">Acciones de busqueda de protección realizadas en su país de origen:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvi2" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvi2") %></textarea></td></tr>
<tr><td align="left" valign="top">Reubicación en su país de origen o de reidencia (desplazamientos):</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvi3" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvi3") %></textarea></td></tr>
<tr><td align="left" valign="top">Tiene usted planes de permanecer en Panamá o viajar a otro país:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvi4" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvi4") %></textarea></td></tr>
<tr><td align="left" valign="top">Documentos que presenta:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvi5" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvi5") %></textarea></td></tr>
<tr><td align="left" valign="top">Analisis de trabajador social:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qvii" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qvii") %></textarea></td></tr>
<tr><td align="left" valign="top">Recomendaciones del departamento:</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_soc_qviii" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_soc_qviii") %></textarea></td></tr>

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
<br>
<br>
<br>
</details>
