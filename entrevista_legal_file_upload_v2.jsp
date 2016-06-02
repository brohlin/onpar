        <form method="POST" action="sql_upd_solicitante_file_entrevista_legal_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput4')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
			<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_v2_pre_entrevista_legal") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF_v2?file=pre_entrevista_legal" target="_blank">Ver Entrevista Legal Firmada</a></td>
<%
		} else {
%>   
    
        	<td width="200" class="boldRedTxt">Subir Entrevista Legal </td>
<%
		}
%> 
        	<td width="200"><input type="file" name="file" accept="application/pdf" required="required" id="fileinput4"></td>
            <td width="100"></td>
            <td width="100"><input type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>  
        </form>  