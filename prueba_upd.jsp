<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 

<form action="sql_del_prueba.jsp" method="post" name="del_prueba">

	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_prueba_solicitante_id").toString() %>">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_prueba_id").toString() %>">
	<input type="hidden" value="/temp/" name="destination"/>

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Prueba
	</td>
</tr>

<tr>
	<td colspan="2">			
	Utilice este forumulario para ver o eliminar una prueba de un solicitante.
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
	<td><a href="/onpar/ViewPDF?file=prueba" target="_blank"><%= session.getAttribute("temp_prueba_dsc").toString() %></a></td>
	<td><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Eliminar" name="delete">
</tr>         
    
    
</table>
</form>