<fieldset>
<div style="background-color:yellow;">
</div>
</fieldset>
<br>

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td class="hdrBlackTxt">
	Solicitante: 
	<%= session.getAttribute("elf_solicitante_id").toString() %>&nbsp;-&nbsp;<%= session.getAttribute("elf_pre_primer_nombre") %>&nbsp;<%= session.getAttribute("elf_pre_apellido_paterno") %>&nbsp;<%= session.getAttribute("elf_pre_apellido_materno") %>
	</td>
</tr>
</table>

<fieldset>
<form action="sql_upd_entrevista_legal_familia.jsp" method="post" name="upd_entrevista_legal_familia">

<details>
<summary>Entrevista de Elegibildad y Asesoría Legal (Miembro de Familia)<br><br>
<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td class="hdrBlackTxt">Miembro de Familia: <%= session.getAttribute("elf_nombre") %>&nbsp;-&nbsp;<%= session.getAttribute("elf_parentesco_lkup") %></td>
</tr>
</table>
</summary>
<br>
Por favor, introduzca la fecha de la entrevista legal para indicar que se tuvo lugar: <input type="text" class="datepicker" id="fecha_entrevista_legal" name="fecha_entrevista_legal" value="<%= session.getAttribute("elf_fecha_entrevista_legal") %>" required="required">
<br>
<br>
Abogado/a: <select name="legal_user_id" size="1" required="required"><jsp:include page="/sql_get_users_entrevista_legal_familia.jsp" /></select>
<br>
<br>
<table border="0" cellspacing="2" cellpadding="3" width="600">
	<tr> 
		<td colspan="3" valign="top" width="600" class="subHdrBlackTxt">Versión del Formulario</td>	
	</tr>	

	<tr class="datatablerowv2">
		<td colspan="2">
		<input type="radio" id="legal_version" name="legal_version" value="larga" checked="checked">Larga&nbsp;&nbsp;&nbsp;
		<input type="radio" id="legal_version" name="legal_version" value="mediana">Mediana&nbsp;&nbsp;&nbsp;
		<input type="radio" id="legal_version" name="legal_version" value="corta">Corta
		<td colspan="2"></td>
	</tr>	
</table>
<br>


	<input type="hidden" name="id" value="<%= session.getAttribute("elf_id") %>">
<div id="legal_datos_generales">


<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr>
		<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>Datos Generales de Solicitante</td>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="4">Número de caso:  <%= session.getAttribute("elf_solicitante_id") %> </td>
	</tr>	
	<tr class="datatablerowv2">
		<td colspan="4">Nombre:  <%= session.getAttribute("elf_pre_primer_nombre") + " " + session.getAttribute("elf_pre_apellido_paterno") + " " + session.getAttribute("elf_pre_apellido_materno") %> </td>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="4">Pasaporte: <%= session.getAttribute("elf_pre_pasaporte") %></td>
	</tr>
	<tr>
	    <td colspan="4">Otro documento de identidad:  <%= session.getAttribute("elf_pre_otros_documentos") %></td>
	</tr>
	
	<tr class="datatablerowv2">
	    <td colspan="4">Nacionalidad: <%= session.getAttribute("elf_pre_nacionalidad_lkup") %> </td>
	</tr>	
	<tr class="datatablerowv2">
	    <td colspan="4">Fecha de nacimiento: <%= session.getAttribute("elf_pre_fecha_de_nacimiento") %> </td>
	</tr>	
	<tr class="datatablerowv2">
		<td colspan="4">Dirección actual:  <%= session.getAttribute("elf_pre_direccion_actual") %></td>
	</tr>
	<tr>
	    <td colspan="4">Número de teléfono:  <%= session.getAttribute("elf_pre_telefono1") %></td>
	</tr>

	<tr><td  align="left">Fecha de entrada a Panamá:  <%= session.getAttribute("elf_pre_fecha_llegada_panama") %></td></tr>

	<tr>
	    <td colspan="4">Fecha de llegada a ONPAR:  <%= session.getAttribute("elf_pre_fecha_solicitud_onpar") %></td>
	</tr>	

</table>
</div>

<div id="legal_form_larga">

<table id="legal_form_larga_table" border="0" cellspacing="0" cellpadding="4" width="600">
<br>
<br>
<tr>
	<td align="left" valign="bottom" colspan="2" nowrap><span class="subHdrBlackTxt"><strong>Preguntas/Repuestas</strong></span></td>
</tr>

<br>

<tr><td align="left" valign="top">1.- ¿Dónde nació usted? Y enuncie por favor zona de residencia en su país de origen: Zona Rural o Zona Urbana.</td><td><textarea  name="q1" cols="50" rows="4" ><%= session.getAttribute("elf_q1") %></textarea></td></tr>
<tr><td align="left" valign="top">2.- ¿Diga a qué se dedicaba en su país de origen?</td><td><textarea  name="q2" cols="50" rows="4" ><%= session.getAttribute("elf_q2") %></textarea></td></tr>
<tr><td align="left" valign="top">3.- ¿Diga quienes componen su núcleo familiar?</td><td><textarea  name="q3" cols="50" rows="4" ><%= session.getAttribute("elf_q3") %></textarea></td></tr>
<tr><td align="left" valign="top">4.- ¿Diga si tiene familiares en Panamá?</td><td><textarea  name="q4" cols="50" rows="4" ><%= session.getAttribute("elf_q4") %></textarea></td></tr>
<tr><td align="left" valign="top">5.- ¿Que miembros de su núcleo familiar todavía permanecen en su país de origen y esperan reunirse con usted?</td><td><textarea  name="q5" cols="50" rows="4" ><%= session.getAttribute("elf_q5") %></textarea></td></tr>
<tr><td align="left" valign="top">6.- ¿Que miembros de su familia, y de los que permanecen en su país de origen, dependen de usted económicamente?</td><td><textarea  name="q6" cols="50" rows="4" ><%= session.getAttribute("elf_q6") %></textarea></td></tr>
<tr><td align="left" valign="top">7.- ¿Con que frecuencia se comunica usted con sus familiares?</td><td><textarea  name="q7" cols="50" rows="4" ><%= session.getAttribute("elf_q7") %></textarea></td></tr>
<tr><td align="left" valign="top">8.- ¿Qué vía utilizó para llegar hasta Panamá?</td><td><textarea  name="q8" cols="50" rows="4" ><%= session.getAttribute("elf_q8") %></textarea></td></tr>
<tr><td align="left" valign="top">9.- ¿Al ingresar al país se anunció como solicitante de refugio ante alguna autoridad?</td><td><textarea  name="q9" cols="50" rows="4" ><%= session.getAttribute("elf_q9") %></textarea></td></tr>
<tr><td align="left" valign="top">10.- ¿Qué tipo de documentos de identidad personal posee?</td><td><textarea  name="q10" cols="50" rows="4" ><%= session.getAttribute("elf_q10") %></textarea></td></tr>
<tr><td align="left" valign="top">11.- ¿Ha hecho usted algún trámite para regularizar su estatus en Panamá?</td><td><textarea  name="q11" cols="50" rows="4" ><%= session.getAttribute("elf_q11") %></textarea></td></tr>
<tr><td align="left" valign="top">12.- ¿Diga usted si genera algún tipo de ingresos en Panamá?</td><td><textarea  name="q12" cols="50" rows="4" ><%= session.getAttribute("elf_q12") %></textarea></td></tr>
<tr><td align="left" valign="top">13.- ¿Diga cómo sufraga sus gastos aquí en Panamá?</td><td><textarea  name="q13" cols="50" rows="4" ><%= session.getAttribute("elf_q13") %></textarea></td></tr>
<tr><td align="left" valign="top">14.- ¿Alguna vez ha sido deportado (a)?</td><td><textarea  name="q14" cols="50" rows="4" ><%= session.getAttribute("elf_q14") %></textarea></td></tr>
<tr><td align="left" valign="top">15.- ¿Usted u otro miembro de su familia han sido detenidos?</td><td><textarea  name="q15" cols="50" rows="4" ><%= session.getAttribute("elf_q15") %></textarea></td></tr>
<tr><td align="left" valign="top">16.- ¿Recibió en los primeros días de su llegada a Panamá alguna ayuda de emergencia?</td><td><textarea  name="q16" cols="50" rows="4" ><%= session.getAttribute("elf_q16") %></textarea></td></tr>
<tr><td align="left" valign="top">17.- ¿Que institución, ONGs, u otras le han brindado ayuda y orientación?</td><td><textarea  name="q17" cols="50" rows="4" ><%= session.getAttribute("elf_q17") %></textarea></td></tr>
<tr><td align="left" valign="top">18.- ¿Con quién viajó hacia Panamá?</td><td><textarea  name="q18" cols="50" rows="4" ><%= session.getAttribute("elf_q18") %></textarea></td></tr>
<tr><td align="left" valign="top">19.- ¿Quién la trajo a Panamá?</td><td><textarea  name="q19" cols="50" rows="4" ><%= session.getAttribute("elf_q19") %></textarea></td></tr>
<tr><td align="left" valign="top">20.- ¿Qué lo/la motivo venir a Panamá?</td><td><textarea  name="q20" cols="50" rows="4" ><%= session.getAttribute("elf_q20") %></textarea></td></tr>
<tr><td align="left" valign="top">21.- ¿Diga, cuales son las causas o motivos por la cual sale de su país de origen?</td><td><textarea  name="q21" cols="50" rows="20" ><%= session.getAttribute("elf_q21") %></textarea></td></tr>
<tr><td align="left" valign="top">22.- ¿Qué tipo de amenazas recibía?</td><td><textarea  name="q22" cols="50" rows="4" ><%= session.getAttribute("elf_q22") %></textarea></td></tr>
<tr><td align="left" valign="top">23.- ¿Diga si otros miembros de su familia han sido víctima de amenazas?</td><td><textarea  name="q23" cols="50" rows="4" ><%= session.getAttribute("elf_q23") %></textarea></td></tr>
<tr><td align="left" valign="top">24.- ¿Diga si usted o sus familiares han interpuesto alguna denuncia?</td><td><textarea  name="q24" cols="50" rows="4" ><%= session.getAttribute("elf_q24") %></textarea></td></tr>
<tr><td align="left" valign="top">25.- ¿Diga si logró reubicarse al interno de su país?</td><td><textarea  name="q25" cols="50" rows="4" ><%= session.getAttribute("elf_q25") %></textarea></td></tr>
<tr><td align="left" valign="top">26.- ¿Usted tiene alguna idea de quién o quienes lo amenazan?</td><td><textarea  name="q26" cols="50" rows="4" ><%= session.getAttribute("elf_q26") %></textarea></td></tr>
<tr><td align="left" valign="top">27.- ¿Piensa usted regresar algún día a su país de origen?</td><td><textarea  name="q27" cols="50" rows="4" ><%= session.getAttribute("elf_q27") %></textarea></td></tr>
<tr><td align="left" valign="top">28.- ¿Qué desea usted de Panamá?</td><td><textarea  name="q28" cols="50" rows="4" ><%= session.getAttribute("elf_q28") %></textarea></td></tr>
<tr><td align="left" valign="top">29.- ¿Ha visitado otros países además de Panamá?</td><td><textarea  name="q29" cols="50" rows="4" ><%= session.getAttribute("elf_q29") %></textarea></td></tr>
<tr><td align="left" valign="top">30.- ¿Por qué decidió viajar a Panamá?</td><td><textarea  name="q30" cols="50" rows="4" ><%= session.getAttribute("elf_q30") %></textarea></td></tr>
<tr><td align="left" valign="top">31.- ¿Desea agregar algo más a esta entrevista?</td><td><textarea  name="q31" cols="50" rows="4" ><%= session.getAttribute("elf_q31") %></textarea></td></tr>

<tr><td colspan="2"  align="left" valign="top">PREGUNTAS ADICIONALES:</td></tr>
<tr><td colspan="2" align="left" valign="top"><textarea name="legal_otra_pregunta" rows="5" cols="100"><%= session.getAttribute("elf_otra_pregunta") %></textarea></tr>		


<!--- Submit/cancel. --->
<tr>
	<td>&nbsp;</td>
	<td valign="middle">

	<!--- Save button --->
	<input  type="submit" class="butnTxt" value="Guardar" name="save">

	<!--- Cancel button --->
	<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</div>
<div id="legal_form_mediana">


<table id="legal_form_mediana_table" border="0" cellspacing="0" cellpadding="4" width="600">
<br>
<br>
<tr>
	<td align="left" valign="bottom" colspan="2" nowrap><span class="subHdrBlackTxt"><strong>Preguntas/Repuestas</strong></span></td>
</tr>

<br>


<tr><td align="left" valign="top">1.- ¿Dónde nació usted? Y enuncie por favor zona de residencia en su país de origen: Zona Rural o Zona Urbana.</td><td><textarea  name="q1" cols="50" rows="4" ><%= session.getAttribute("elf_q1") %></textarea></td></tr>
<tr><td align="left" valign="top">2.- ¿Alguna vez ha sido deportado (a)?</td><td><textarea  name="q14" cols="50" rows="4" ><%= session.getAttribute("elf_q14") %></textarea></td></tr>
<tr><td align="left" valign="top">3.- ¿Usted u otro miembro de su familia han sido detenidos?</td><td><textarea  name="q15" cols="50" rows="4" ><%= session.getAttribute("elf_q15") %></textarea></td></tr>
<tr><td align="left" valign="top">4.- ¿Diga, cuales son las causas o motivos por la cual sale de su país de origen?</td><td><textarea  name="q21" cols="50" rows="20" ><%= session.getAttribute("elf_q21") %></textarea></td></tr>
<tr><td align="left" valign="top">5.- ¿Diga si usted o sus familiares han interpuesto alguna denuncia?</td><td><textarea  name="q24" cols="50" rows="4" ><%= session.getAttribute("elf_q24") %></textarea></td></tr>
<tr><td align="left" valign="top">6.- ¿Diga si logró reubicarse al interno de su país?</td><td><textarea  name="q25" cols="50" rows="4" ><%= session.getAttribute("elf_q25") %></textarea></td></tr>
<tr><td align="left" valign="top">7.- ¿Usted tiene alguna idea de quién o quienes lo amenazan?</td><td><textarea  name="q26" cols="50" rows="4" ><%= session.getAttribute("elf_q26") %></textarea></td></tr>
<tr><td align="left" valign="top">8.- ¿Piensa usted regresar algún día a su país de origen?</td><td><textarea  name="q27" cols="50" rows="4" ><%= session.getAttribute("elf_q27") %></textarea></td></tr>
<tr><td align="left" valign="top">9.- ¿Qué desea usted de Panamá?</td><td><textarea  name="q28" cols="50" rows="4" ><%= session.getAttribute("elf_q28") %></textarea></td></tr>
<tr><td align="left" valign="top">10.- ¿Ha visitado otros países además de Panamá?</td><td><textarea  name="q29" cols="50" rows="4" ><%= session.getAttribute("elf_q29") %></textarea></td></tr>
<tr><td align="left" valign="top">11.- ¿Por qué decidió viajar a Panamá?</td><td><textarea  name="q30" cols="50" rows="4" ><%= session.getAttribute("elf_q30") %></textarea></td></tr>
<tr><td align="left" valign="top">12.- ¿Desea agregar algo más a esta entrevista?</td><td><textarea  name="q31" cols="50" rows="4" ><%= session.getAttribute("elf_q31") %></textarea></td></tr>

<tr><td  colspan="2" align="left" valign="top">PREGUNTAS ADICIONALES:</td></tr>
<tr><td  colspan="2" align="left" valign="top"><textarea name="legal_otra_pregunta" rows="5" cols="100"><%= session.getAttribute("elf_otra_pregunta") %></textarea></tr>		


<!--- Submit/cancel. --->
<tr>
	<td>&nbsp;</td>
	<td valign="middle">

	<!--- Save button --->
	<input  type="submit" class="butnTxt" value="Guardar" name="save">

	<!--- Cancel button --->
	<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</div>
<div id="legal_form_corta">

<table id="legal_form_corta_table" border="0" cellspacing="0" cellpadding="4" width="600">
<br>
<br>
<tr>
	<td align="left" valign="bottom" colspan="2" nowrap><span class="subHdrBlackTxt"><strong>Preguntas/Repuestas</strong></span></td>
</tr>

<br>


<tr><td align="left" valign="top">1.- ¿Diga, cuales son las causas o motivos por la cual sale de su país de origen?</td><td><textarea  name="q21" cols="50" rows="20" ><%= session.getAttribute("elf_q21") %></textarea></td></tr>
<tr><td align="left" valign="top">2.- ¿Por qué decidió viajar a Panamá?</td><td><textarea  name="q30" cols="50" rows="4" ><%= session.getAttribute("elf_q30") %></textarea></td></tr>


<tr><td colspan="2"  align="left" valign="top">PREGUNTAS ADICIONALES:</td></tr>
<tr><td colspan="2"  align="left" valign="top"><textarea name="legal_otra_pregunta" rows="5" cols="100"><%= session.getAttribute("elf_otra_pregunta") %></textarea></tr>		


<!--- Submit/cancel. --->
<tr>
	<td>&nbsp;</td>
	<td valign="middle">

	<!--- Save button --->
	<input  type="submit" class="butnTxt" value="Guardar" name="save">

	<!--- Cancel button --->
	<input  type="reset" class="butnTxt" value="Reiniciar" name="reset">
	</td>
</tr>
</table>

</div>

<br>
<br>
<br>
</details>
</form>
</fieldset>