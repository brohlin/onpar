        <form method="POST" action="sql_upd_solicitante_file_entrevista_social.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_entrevista_social") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=pre_entrevista_social" target="_blank">Ver Entrevista Social</a></td>
<%
		} else {
%> 
      
        	<td width="200"><span class="smRedTxt">*</span> Subir Entrevista Social </td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
          
        </tr>  
        </form>        

