<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>

<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 
<%
	DynStringArray parameters2 = new DynStringArray();
	DbResults db2;
	String inviewby = "";

	if (session.getAttribute("temp_solicitante_id") == null) {
		parameters2.add("-1");
	} else {
		parameters2.add(session.getAttribute("temp_solicitante_id").toString());
	}
	
	try {
		db2 = Database.callProcResults("p_get_solicitante_user_views", parameters2);
		if (db2.hasRows()) {
			inviewby = db2.generateHtmlTableCss();
		}
		
	} catch (SQLException s) {
	    System.out.println(s.getMessage());
	}	
%>
<fieldset>
<div style="background-color:yellow;">
<%= inviewby %>
</div>
</fieldset>
<br>
<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Solicitante: <%= session.getAttribute("temp_solicitante_pre_primer_nombre") %>&nbsp;<%= session.getAttribute("temp_solicitante_pre_segundo_nombre") %>&nbsp;<%= session.getAttribute("temp_solicitante_pre_apellido_paterno") %>&nbsp;<%= session.getAttribute("temp_solicitante_pre_apellido_materno") %>
	</td>
</tr>
</table>
<br>
<%@include file="declaracion_jurada.jsp" %>
<br>	
<br>
<%@include file="miembros_de_familia.jsp"%>
<%
	if ((session.getAttribute("role_id").equals("2")) || (session.getAttribute("role_id").equals("4"))) {
%>
	<br>
	<br>
	<%@include file="entrevista_legal.jsp"%>
<%
	}

	if ((session.getAttribute("role_id").equals("3")) || (session.getAttribute("role_id").equals("4"))) {
%>	
	<br>
	<br>
	<%@include file="entrevista_social.jsp"%>
<%
	}
%>
<br>
<br>
<%@include file="direccion.jsp"%>
<br>
<br>
<%@include file="comision.jsp"%>
<br>
<br>
<details>
<summary>Carga de Archivos</summary>
<br>
        <table border="0" cellspacing="0" cellpadding="4" width="600">

        <form method="POST" action="sql_upd_solicitante_file_pasaporte.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_copia_identificacion1") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=pasaporte" target="_blank">Ver Pasaporte</a></td>
<%
		} else {
%>        

        	<td width="200">Subir Pasaporte</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
           
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_cedula.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_copia_identificacion2") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=cedula" target="_blank">Ver Cédula</a></td>
<%
		} else {
%>        

        	<td width="200">Subir Cédula</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_carnet_de_conducir.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_copia_identificacion3") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=carnet_de_conducir" target="_blank">Ver Carnet de Conducir</a></td>
<%
		} else {
%>        

        	<td width="200">Subir Carnet de Conducir</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_pasado_judicial.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_copia_identificacion4") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=pasado_judicial" target="_blank">Ver Pasado Judicial</a></td>
<%
		} else {
%> 
       
        	<td width="200">Subir Pasado Judicial</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_otro.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_copia_identificacion5") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=otro" target="_blank">Ver Otro Documento</a></td>
<%
		} else {
%>
        
        	<td width="200">Subir Otro Documento</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>
  
        </form>

        <form method="POST" action="sql_upd_solicitante_file_declaracion_jurada.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_declaracion_jurada") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=pre_declaracion_jurada" target="_blank">Ver Declaración Jurada</a></td>
<%
		} else {
%> 
      
        	<td width="200"><span class="smRedTxt">*</span> Subir Declaración Jurada</td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
            
        </tr>
  
        </form>

<%
	if ((session.getAttribute("role_id").equals("2")) || (session.getAttribute("role_id").equals("4"))) {
%>
	<%@include file="entrevista_legal_file_upload.jsp"%>
<%
	}
	
	if ((session.getAttribute("role_id").equals("3")) || (session.getAttribute("role_id").equals("4"))) {
%>
	<%@include file="entrevista_social_file_upload.jsp"%>
<%
	}
%>
        <form method="POST" action="sql_upd_solicitante_file_foto_jefe_de_familia.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">        
        	
<%
		if (session.getAttribute("temp_solicitante_pre_soc_foto_jefe_de_familia") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=pre_soc_foto_jefe_de_familia" target="_blank">Ver Foto de Jefe de Familia</a></td>
<%
		} else {
%>
       
        	<td width="200">Subir Foto de Jefe de Familia </td>
<%
		}
%> 
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
        </tr>  
        </form>        

         <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_recon.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_adm_peticion_para_la_recon") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=adm_peticion_para_la_recon" target="_blank">Ver Petición de reconsideración a la Dirección</a></td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de pedir reconsideración: <input name="adm_fecha_de_pedir_recon" value="<%= session.getAttribute("temp_solicitante_adm_fecha_de_pedir_recon") %>"  tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">

<%
		} else {
%>
    
        	<td width="200"><span class="smRedTxt">*</span> Subir Petición de reconsideración a la Dirección</td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de pedir reconsideración: <input name="adm_fecha_de_pedir_recon" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">

<%
		}
%> 
            
        </tr>  
        </form>          

        <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_recon_com.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr>        
        	
<%
		if (session.getAttribute("temp_solicitante_ref_peticion_para_la_recon") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=ref_peticion_para_la_recon" target="_blank">Ver Petición de reconsideración a la Comisión</a></td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de pedir reconsideración: <input name="ref_fecha_de_pedir_recon" value="<%= session.getAttribute("temp_solicitante_ref_fecha_de_pedir_recon") %>"  tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">

<%
		} else {
%>
    
        	<td width="200"><span class="smRedTxt">*</span> Subir Petición de reconsideración a la Comisión</td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de pedir reconsideración: <input name="ref_fecha_de_pedir_recon" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">

<%
		}
%> 
            
        </tr>  
        </form>          

         <form method="POST" action="sql_upd_solicitante_file_peticion_para_la_apel_com.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">       
        	
<%
		if (session.getAttribute("temp_solicitante_ref_peticion_para_la_apel") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=ref_peticion_para_la_apel" target="_blank">Ver Petición de apelación a la Comisión</a></td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de apelación: <input name="ref_fecha_de_pedir_apel" value="<%= session.getAttribute("temp_solicitante_ref_fecha_de_pedir_apel") %>" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
        	
<%
		} else {
%>      
        	<td width="200"><span class="smRedTxt">*</span> Subir Petición de apelación a la Comisión</td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de apelación: <input name="ref_fecha_de_pedir_apel" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">        	
<%
		}
%> 
        </tr>  
        </form>

         <form method="POST" action="sql_upd_solicitante_file_renuncia.jsp" enctype="multipart/form-data">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">
        	<input type="hidden" value="/temp/" name="destination"/>
		<tr class="uploadedFile">       
        	
<%
		if (session.getAttribute("temp_solicitante_renuncia") != null) {	
%>

        	<td width="200"><a href="/onpar/ViewPDF?file=renuncia" target="_blank">Ver Renuncia</a></td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de renuncia: <input name="fecha_de_renuncia" value="<%= session.getAttribute("temp_solicitante_fecha_de_renuncia") %>" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
        	
<%
		} else {
%>      
 
        	<td width="200"><span class="smRedTxt">*</span> Subir Renuncia</td>
        	<td width="200"><input tabindex="<%= mCounter++ %>" type="file" name="file" accept="application/pdf" required="required">
            <td width="100">Fecha de renuncia: <input name="fecha_de_renuncia" tabindex="<%= mCounter++ %>" type="date" required="required"></td>
            <td width="100"><input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">
        	
<%
		}
%> 
        </tr>  
        </form>


<br>
<br> 
</table>
</details>
<br>
<br>

<%@include file="pruebas.jsp"%>
<br>