<details>
<summary>Entrevista de Elegibildad y Asesor�a Legal - <a href="/onpar/EntrevistaLegal" target="_blank">Para imprimir el informe</a></summary>
<form action="sql_upd_solicitante_leg.jsp" method="post" name="solicitante_upd_leg">

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

<tr><td align="left" valign="top">1.- �D�nde naci� usted? Y enuncie por favor zona de residencia en su pa�s de origen: Zona Rural o Zona Urbana.</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q1" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q1") %></textarea></td></tr>
<tr><td align="left" valign="top">2.- �Diga la entrevistada (a) a qu� se dedicaba en su pa�s de origen?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q2" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q2") %></textarea></td></tr>
<tr><td align="left" valign="top">3.- �Diga la entrevistada (a) quienes componen su n�cleo familiar?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q3" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q3") %></textarea></td></tr>
<tr><td align="left" valign="top">4.- �Diga la entrevistada (a) si tiene familiares en Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q4" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q4") %></textarea></td></tr>
<tr><td align="left" valign="top">5.- �Que miembros de su n�cleo familiar todav�a permanecen en su pa�s de origen y esperan reunirse con usted?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q5" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q5") %></textarea></td></tr>
<tr><td align="left" valign="top">6.- �Que miembros de su familia, y de los que permanecen en su pa�s de origen, dependen de usted econ�micamente?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q6" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q6") %></textarea></td></tr>
<tr><td align="left" valign="top">7.- �Con que frecuencia se comunica usted com sus familiares?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q7" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q7") %></textarea></td></tr>
<tr><td align="left" valign="top">8.- �Qu� v�a utiliz� para llegar hasta Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q8" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q8") %></textarea></td></tr>
<tr><td align="left" valign="top">9.- �Cual fue el recorrido o ruta de viaje que utiliz� hasta llegar a Panam�</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q9" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q9") %></textarea></td></tr>
<tr><td align="left" valign="top">10.- �Al ingresar al pa�s se anunci� como solicitante de refugio ante alguna autoridad?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q10" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q10") %></textarea></td></tr>
<tr><td align="left" valign="top">11.- �Qu� tipo de documentos de identidad personal posee?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q11" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q11") %></textarea></td></tr>
<tr><td align="left" valign="top">12.- �Ha hecho usted alg�n tr�mite para regularizar su estatus en Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q12" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q12") %></textarea></td></tr>
<tr><td align="left" valign="top">13.- �Diga usted si genera alg�n tipo de ingresos en Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q13" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q13") %></textarea></td></tr>
<tr><td align="left" valign="top">14.- �Alguna vez ha sido deportado (a)?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q14" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q14") %></textarea></td></tr>
<tr><td align="left" valign="top">15.- �Usted u otro miembro de su familia han sido detenidos?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q15" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q15") %></textarea></td></tr>
<tr><td align="left" valign="top">16.- �Recibi� en los primeros d�as de su llegada a Panam� alguna ayuda de emergencia?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q16" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q16") %></textarea></td></tr>
<tr><td align="left" valign="top">17.- �Que instituci�n, ONGs, u otras le han brindado ayuda y orientaci�n?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q17" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q17") %></textarea></td></tr>
<tr><td align="left" valign="top">18.- �Con qui�n viaj� hacia Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q18" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q18") %></textarea></td></tr>
<tr><td align="left" valign="top">19.- �Qui�n la trajo a Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q19" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q19") %></textarea></td></tr>
<tr><td align="left" valign="top">20.- �Diga la entrevistada, cuales son las causas o motivos por la cual sale de su pa�s de origen?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q20" cols="50" rows="20" maxlength="2000"><%= session.getAttribute("temp_solicitante_pre_leg_q20") %></textarea></td></tr>
<tr><td align="left" valign="top">21.- �Tiene usted conocimiento de quien o quienes la persiguen?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q21" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q21") %></textarea></td></tr>
<tr><td align="left" valign="top">22.- �Piensa usted regresar alg�n d�a a su pa�s?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q22" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q22") %></textarea></td></tr>
<tr><td align="left" valign="top">23.- �Qu� desea usted de Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q23" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q23") %></textarea></td></tr>
<tr><td align="left" valign="top">24.- �Ha visitado otros pa�ses adem�s de Panam�?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q24" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q24") %></textarea></td></tr>
<tr><td align="left" valign="top">25.- �Por qu� eligi� Panam� para solicitar refugio?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q25" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q25") %></textarea></td></tr>
<tr><td align="left" valign="top">26.- �Desea agregar algo m�s a esta entrevista?</td><td><textarea tabindex="<%= mCounter++ %>" name="pre_leg_q26" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_leg_q26") %></textarea></td></tr>

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
