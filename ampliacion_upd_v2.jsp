<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%>
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

<form action="sql_upd_ampliacion_v2.jsp" method="post" name="upd_ampliacion_V2">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_ampliacion_solicitante_id").toString() %>">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_ampliacion_id").toString() %>">

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Ampliación a la entrevista legal
	</td>
</tr>

<tr>
	<td colspan="2">			
	Utilice este forumulario editar o eliminar una ampliación a la entrevista legal de un solicitante.
	</td>
</tr>
<tr>
	<td align="left" valign="top" class="subHdrBlackTxt" nowrap>
	<br>
	</td>
	<td valign="bottom" width="350" align="center">
	<br>
	</td>
</tr>

<tr>  
	<td><span class="smRedTxt">*</span>Fecha de ampliación: <input name="fecha_ampliacion" class="datepicker" id="fecha_ampliacion" value="<%= session.getAttribute("temp_ampliacion_fecha_ampliacion").toString() %>" type="text" required="required"></td>          
</tr>

<tr>       
	<td>Descripción: <input type="text" name="dsc" id="dsc" value="<%= session.getAttribute("temp_ampliacion_dsc").toString() %>" required></td>
</tr>
<tr>
	<td><textarea name="ftext" cols="80" rows="10" ><%= session.getAttribute("temp_ampliacion_ftext").toString() %></textarea></td>
</tr>
<tr>
	<td align="left"><input  type="submit" class="butnTxt" value="Actualizar" name="update">

</form>

<form action="sql_del_ampliacion_v2.jsp" method="post" name="del_ampliacion_V2">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_ampliacion_solicitante_id").toString() %>">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_ampliacion_id").toString() %>">


	<td align="right"><input  type="submit" class="butnTxt" value="Eliminar" name="delete">
</tr>         
    
    
</table>
</form>