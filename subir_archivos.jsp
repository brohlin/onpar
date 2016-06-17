<details>
<summary>Carga de Archivos</summary>
<br>
<!-- %
	if (session.getAttribute("temp_solicitante_v2_pre_entrevista_legal") != null &&
		session.getAttribute("temp_solicitante_v2_pre_entrevista_social") != null &&
		session.getAttribute("temp_solicitante_v2_pre_entrevista_declaracion_jurada") != null) {
% -->
<%
		if (session.getAttribute("role_id").equals("4")) {
%>
			<a href="/onpar/Carpeta" target="_blank">Imprimir la Carpeta</a>
<%
		}
%>
<!-- %
	}
-->
<br>
        <table border="0" cellspacing="0" cellpadding="4" width="600">

        <form method="POST" action="sql_upd_solicitante_file_pasaporte_v2.jsp" enctype="multipart/form-data"  onsubmit="return checkFilesize('fileinput20')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">                	
<%
		if (session.getAttribute("temp_solicitante_v2_pre_copia_pasaporte") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=pre_copia_pasaporte" target="_blank">Ver Pasaporte</a></td>
<%
		} else {
%>        

        	<td width="200">Subir Pasaporte</td>
<%
		}
%> 
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput20"></td>
            <td width="100"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">           
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_otro_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput2')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_v2_pre_copia_otro_documento") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF_v2?file=pre_copia_otro_documento" target="_blank">Ver Otro Documento</a></td>
<%
		} else {
%>
        
        	<td width="200">Subir Otro Documento</td>
<%
		}
%> 
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput2"></td>
            <td width="100"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">            
        </tr>  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_declaracion_jurada_v2.jsp" enctype="multipart/form-data"  onsubmit="return checkFilesize('fileinput3')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">                	
<%
		if (session.getAttribute("temp_solicitante_v2_pre_declaracion_jurada") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=pre_declaracion_jurada" target="_blank">Ver Declaración Jurada Firmada</a></td>
<%
		} else {
%> 
      
        	<td width="200" class="boldRedTxt">Subir Declaración Jurada</td>
<%
		}
%> 
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput3"></td>
            <td width="100"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">            
        </tr>
  
        </form>

<%
		if ((session.getAttribute("role_id").equals("2")) || (session.getAttribute("role_id").equals("4"))) {
%>			
			<%@include file="entrevista_legal_file_upload_v2.jsp"%>
<%		
		}
%>
<%
		if ((session.getAttribute("role_id").equals("3")) || (session.getAttribute("role_id").equals("4"))) {
%>
		<%@include file="entrevista_social_file_upload_v2.jsp"%>
<%
		}
%>

        <form method="POST" action="sql_upd_solicitante_file_foto_jefe_de_familia_v2.jsp" enctype="multipart/form-data"  onsubmit="return checkFilesize('fileinput6')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>                	
<%
		if (session.getAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF_v2?file=pre_soc_foto_jefe_de_familia" target="_blank">Ver Foto de Jefe de Familia</a></td>
<%
		} else {
%>       
        	<td width="200">Subir Foto de Jefe de Familia </td>
<%
		}
%> 
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput6"></td>
            <td width="100"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">
        </tr>  
        </form>        

         <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_recon_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput7')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">                	
<%
		if (session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_recon") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=adm_peticion_para_la_recon" target="_blank">Ver Petición de reconsideración a la Dirección</a></td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput7"></td>
            <td width="100">Fecha de pedir reconsideración: <input name="adm_fecha_de_pedir_recon" value="<%= session.getAttribute("temp_solicitante_v2_adm_fecha_de_pedir_recon") %>"   type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">
<%
		} else {
%>    
        	<td width="200">Subir Petición de reconsideración a la Dirección</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput7"></td>
            <td width="100">Fecha de pedir reconsideración: <input name="adm_fecha_de_pedir_recon"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">
<%
		}
%>             
        </tr>  
        </form>          

        <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_recon_com_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput8')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>                	
<%
		if (session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_recon") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=ref_peticion_para_la_recon" target="_blank">Ver Petición de reconsideración a la Comisión</a></td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput8"></td>
            <td width="100">Fecha de pedir reconsideración: <input name="ref_fecha_de_pedir_recon" value="<%= session.getAttribute("temp_solicitante_v2_ref_fecha_de_pedir_recon") %>"   type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">
<%
		} else {
%>    
        	<td width="200">Subir Petición de reconsideración a la Comisión</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput8"></td>
            <td width="100">Fecha de pedir reconsideración: <input name="ref_fecha_de_pedir_recon"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">
<%
		}
%>             
        </tr>  
        </form>          

         <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_apel_com_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput9')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">               	
<%
		if (session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_apel") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=ref_peticion_para_la_apel" target="_blank">Ver Petición de apelación a la Comisión</a></td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput9"></td>
            <td width="100">Fecha de apelación: <input name="ref_fecha_de_pedir_apel" value="<%= session.getAttribute("temp_solicitante_v2_ref_fecha_de_pedir_apel") %>"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		} else {
%>      
        	<td width="200">Subir Petición de apelación a la Comisión</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput9"></td>
            <td width="100">Fecha de apelación: <input name="ref_fecha_de_pedir_apel"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		}
%> 
        </tr>  
        </form>

         <form method="POST" action="sql_upd_solicitante_file_renuncia_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput10')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>               	
<%
		if (session.getAttribute("temp_solicitante_v2_renuncia") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=renuncia" target="_blank">Ver Renuncia</a></td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput10"></td>
            <td width="100">Fecha de renuncia: <input name="fecha_de_renuncia" value="<%= session.getAttribute("temp_solicitante_v2_fecha_de_renuncia") %>"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		} else {
%>       
        	<td width="200">Subir Renuncia</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput10"></td>
            <td width="100">Fecha de renuncia: <input name="fecha_de_renuncia"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		}
%> 
        </tr>  
        </form>
<br>
<br> 

         <form method="POST" action="sql_upd_solicitante_file_quitar_refug_recon_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput11')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">               	
<%
		if (session.getAttribute("temp_solicitante_v2_quitar_refug_recon") != null) {	
%>
        	<td width="200"><a href="/onpar/ViewPDF_v2?file=quitar_refug_recon" target="_blank">Ver Quitar Refugiado Reconocido<%= session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").toString() %></a>
        	<br>
        		<select name="razon_de_quitar_refug_recon" size="1" required="required">
				<option value=""></option>
				<option value="Cesación"<% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Cesación")) {%> selected <% } %>>Cesación</option>
				<option value="Expulsión" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Expulsión")) {%> selected <% } %>>Expulsión</option>
				<option value="Fallecimiento" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Fallecimiento")) {%> selected <% } %>>Fallecimiento</option>
				<option value="Naturalización" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Naturalización")) {%> selected <% } %>>Naturalización</option>
				<option value="Reasentamiento" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Reasentamiento")) {%> selected <% } %>>Reasentamiento</option>
				<option value="Repatriación" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Repatriación")) {%> selected <% } %>>Repatriación</option>
				<option value="Revocación" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Revocación")) {%> selected <% } %>>Revocación</option>
				</select>	
        	</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput11"></td>
            <td width="100">Fecha de quitar refugiado reconocido: <input name="fecha_de_quitar_refug_recon" value="<%= session.getAttribute("temp_solicitante_v2_fecha_de_quitar_refug_recon") %>"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		} else {
%>       
        	<td width="200">Subir Razon de Quitar Refugiado Reconocido<br>
				<select name="razon_de_quitar_refug_recon" size="1" required="required">
				<option value=""></option>
				<option value="Cesación"<% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Cesación")) {%> selected <% } %>>Cesación</option>
				<option value="Expulsión" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Expulsión")) {%> selected <% } %>>Expulsión</option>
				<option value="Fallecimiento" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Fallecimiento")) {%> selected <% } %>>Fallecimiento</option>
				<option value="Naturalización" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Naturalización")) {%> selected <% } %>>Naturalización</option>
				<option value="Reasentamiento" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Reasentamiento")) {%> selected <% } %>>Reasentamiento</option>
				<option value="Repatriación" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Repatriación")) {%> selected <% } %>>Repatriación</option>
				<option value="Revocación" <% if (session.getAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon").equals("Revocación")) {%> selected <% } %>>Revocación</option>
				</select>	
        	</td>
        	<td width="200"><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput11"></td>
            <td width="100">Fecha de quitar refugiado reconocido: <input name="fecha_de_quitar_refug_recon"  type="date" required="required"></td>
            <td width="100"><input  type="submit" class="butnTxt" value="Guardar" name="save">	
<%
		}
%> 
        </tr>  
        </form>

</table>
</details>