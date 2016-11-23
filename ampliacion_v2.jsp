<table>
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Solicitante: 
	<%= session.getAttribute("temp_solicitante_v2_id").toString() %>&nbsp;-&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_primer_nombre").toString() %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_paterno").toString() %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_materno").toString() %>
	</td>
</tr>
</table>
<br>
<br>
<form action="sql_ins_ampliacion_v2.jsp" method="post">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_solicitante_v2_id").toString() %>">

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td class="hdrBlackTxt">Ampliación a la entrevista legal</td>
</tr>

<tr>
	<td colspan="2">Utilice este forumulario para añadir una ampliación a la entrevista legal de un solicitante.</td>
</tr>

<tr>  
	<td><span class="smRedTxt">*</span>Fecha de ampliación: <input name="fecha_ampliacion" class="datepicker" id="fecha_ampliacion" value="" type="text" required="required"></td>          
</tr>

<tr>  
	<td><span class="smRedTxt">*</span>Descripción: <input name="dsc" value="" type="text" required="required" size="45" maxlength="100"></td>          
</tr>
<br>
<tr>  
	<td>Texto:</td>          
</tr>
<tr>
	<td><textarea name="ftext" cols="80" rows="10" ></textarea></td>
</tr>

<tr>
    <td><input  type="submit" class="butnTxt" value="Guardar" name="save">
</tr>
</table>
</form>