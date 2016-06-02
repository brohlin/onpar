<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 

<form action="sql_ins_prueba.jsp" method="post" enctype="multipart/form-data">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_solicitante_id").toString() %>">
	<input type="hidden" value="/temp/" name="destination"/>

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Prueba
	</td>
</tr>

<tr>
	<td colspan="2">			
	Utilice este forumulario para añadir una prueba de un solicitante.
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
    <td align="right"><span class="smRedTxt">*</span> Subir Prueba</td>        
	<td><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
<tr>  
	<td align="right"><span class="smRedTxt">*</span> Descripción</td>   
    <td><input name="dsc" value=""  tabindex="<%= mCounter++ %>" type="text" required="required" size="45" maxlength="100"></td>          

<tr>
    <td>&nbsp;</td>
    <td><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
</tr>
</table>
</form>