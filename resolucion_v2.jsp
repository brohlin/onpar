<table>
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Solicitante: 
	<%= session.getAttribute("temp_solicitante_v2_id").toString() %>&nbsp;-&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_primer_nombre") %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_materno") %>
	</td>
</tr>
</table>
<br>
<br>
<form action="sql_ins_resolucion_v2.jsp" method="post" enctype="multipart/form-data">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_solicitante_v2_id").toString() %>">
	<input type="hidden" value="/temp/" name="destination"/>

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Resoluci�n
	</td>
</tr>

<tr>
	<td colspan="2">			
	Utilice este forumulario para a�adir una resoluci�n de un solicitante.
	</td>
</tr>
<tr>
	<td align="left" valign="top" class="subHdrBlackTxt" nowrap>
	<br>
	</td>
	<td valign="bottom" width="350" align="center">
	<br><span class="smRedTxt">* Obligatorio</span>
	</td>
</tr>
<tr>
    <td align="right"><span class="smRedTxt">*</span> Subir Resoluci�n</td>        
	<td><input  type="file" name="file" accept="application/pdf" required="required"></td>
</tr>
<tr>  
	<td align="right"><span class="smRedTxt">*</span> Fecha</td>   
    <td><input name="fecha" value="" type="date" required="required"></td>          
</tr>
<tr>  
	<td align="right"><span class="smRedTxt">*</span> Descripci�n</td>   
    <td><input name="dsc" value=""   type="text" required="required" size="45" maxlength="100"></td>
</tr>          
<tr>
    <td>&nbsp;</td>
    <td><input  type="submit" class="butnTxt" value="Guardar" name="save">
</tr>
</table>
</form>