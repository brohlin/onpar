<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%
	DynStringArray parameters2 = new DynStringArray();
	DbResults db2;
	String inviewby = "";

	if (session.getAttribute("temp_solicitante_v2_id") == null) {
		parameters2.add("-1");
	} else {
		parameters2.add(session.getAttribute("temp_solicitante_v2_id").toString());
	}
	
	try {
		db2 = Database.callProcResults("p_get_solicitante_user_views", parameters2);
		if (db2.hasRows()) {
			inviewby = db2.generateHtmlTableCss();
		}
		
	} catch (SQLException s) {
	    System.out.println(s.getMessage());
	}
	
	DynStringArray params_hist = new DynStringArray();
	params_hist.add(session.getAttribute("temp_solicitante_v2_id").toString());
	DbResults history = Database.callProcResults("p_get_solicitante_history", params_hist);
	
	int size = 0;
	String altrow = "datatablerowaltv2";
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
	Solicitante: 
	<%= session.getAttribute("temp_solicitante_v2_id").toString() %>&nbsp;-&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_primer_nombre") %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") %>&nbsp;<%= session.getAttribute("temp_solicitante_v2_pre_apellido_materno") %>
	</td>
	<td><a href="/onpar/Registro?time=<%= System.currentTimeMillis()%>" target="_blank">Imprimir el registro</a></td>
</tr>

<%
	if (session.getAttribute("temp_solicitante_v2_pre_estatus_lkup").toString().equals("Digitalizar Caso Cerrado") && session.getAttribute("temp_solicitante_v2_pre_copia_otro_documento") == null) {
%>
        <form method="POST" action="sql_upd_solicitante_file_otro_v2.jsp" enctype="multipart/form-data" onsubmit="return checkFilesize('fileinput22')">
        	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
        <br>
		<tr bgcolor="yellow">        
        	
        	<td>Subir Otro Documento para digitalizar el caso cerrado:</td>
        	<td><input  type="file" name="file" accept="application/pdf" required="required" id="fileinput22"></td>
            <td></td>
            <td><input  type="submit" class="butnTxt" value="Guardar" name="save">            
        </tr>
        <br>  
        </form>
<%
	}
%>

</table>

<%
	if (session.getAttribute("temp_solicitante_v2_pre_declaracion_jurada") == null || (session.getAttribute("role_id").equals("4"))) {
%>
<br>

<fieldset>
<details>
<summary>Registro <!-- <a href="/onpar/DeclaracionJurada_v2" target="_blank">Imprimir la declaraci�n jurada para la firma</a --></summary>
<form action="sql_upd_solicitante_v2.jsp" method="post" name="solicitante_upd_v2">

	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id").toString() %>">

<jsp:include page="dj_datos_personales.jsp" flush="true" />
<br>

<jsp:include page="dj_educacion.jsp" flush="true" />
<br>

<jsp:include page="dj_ocupacion.jsp" flush="true" />
<br>	

<!-- jsp:include page="dj_militar.jsp" flush="true" />
<br -->	

<!-- jsp:include page="dj_org.jsp" flush="true" />
<br -->

<!-- jsp:include page="dj_arrest.jsp" flush="true" />
<br -->

<jsp:include page="dj_familia.jsp" flush="true" />
<br>

<!-- jsp:include page="dj_viaje.jsp" flush="true" />
<br -->

<!-- jsp:include page="dj_escrita.jsp" flush="true" />
<br -->

<!-- jsp:include page="dj_pref.jsp" flush="true" />
<br -->

<!-- jsp:include page="dj_entrega.jsp" flush="true" />
<br -->

<!-- jsp:include page="dj_uso_interno.jsp" flush="true" />
<br -->


<table border="0" cellspacing="2" cellpadding="4" width="600">		
	<tr class="datatablerowv2">
	<td>
		<!-- input type="submit" value="Guardar" name="save" onclick="return confirm('�Est� seguro que quiere guardar este formulario?');" -->
		<input type="submit" value="Guardar" name="save">
	</td>
	<td>
		<input type="reset" value="Reiniciar" name="reset">
	</td>
</tr>
</table>

<br>
</form>
</details>
</fieldset>
<%
	} else {
%>
		<br>
		<fieldset>
		<details>
			<summary>Declaraci�n Jurada - No se puede hacer cambios a la Declaraci�n Jurada despu�s de subirla.</summary>
		</details>
		</fieldset>
<%
	}
%>
<%
	if ((session.getAttribute("role_id").equals("2")) || (session.getAttribute("role_id").equals("4"))) {
		if (session.getAttribute("temp_solicitante_v2_pre_entrevista_legal") == null || (session.getAttribute("role_id").equals("4"))) {
%>
	<br>
	<br>	
	<jsp:include page="legal_v2.jsp" flush="true" />
	
	<br>
	<br>
	<fieldset>
	<jsp:include page="entrevistas_legal_familia.jsp" flush="true" />
	</fieldset>
	
	<br>
	<br>
	<fieldset>
	<jsp:include page="ampliaciones_v2.jsp" flush="true" />
	</fieldset>
	<br>
	<br>

<%
		}  else {
%>
			<br>
			<fieldset>
			<details>
				<summary>Entrevista Legal - No se puede hacer cambios a la Entrevista Legal despu�s de subir el PDF.</summary>
			</details>
			</fieldset>

			
			
<%
		}
	}

	if ((session.getAttribute("role_id").equals("3")) || (session.getAttribute("role_id").equals("4"))) {
		if (session.getAttribute("temp_solicitante_v2_pre_entrevista_social") == null || (session.getAttribute("role_id").equals("4"))) {
%>	
	<br>
	<br>

	<jsp:include page="social_v2.jsp" flush="true" />
	
	<br>
	<br>
	<fieldset>
	<jsp:include page="entrevistas_social_familia.jsp" flush="true" />
	</fieldset>

<%
		} else {
%>
			<br>
			<fieldset>
			<details>
				<summary>Entrevista Social - No se puede hacer cambios a la Entrevista Social despu�s de subir el PDF.</summary>
			</details>
			</fieldset>
<%
		}
	}
%>

<br>
<br>
<fieldset>
<jsp:include page="direccion_v2.jsp" flush="true" />
</fieldset>
<br>
<br>
<fieldset>
<jsp:include page="comision_v2.jsp" flush="true" />
</fieldset>
<br>
<br>
<fieldset>
<jsp:include page="subir_archivos.jsp" flush="true" />
</fieldset>
<br>
<br>
<fieldset>
<jsp:include page="pruebas_v2.jsp" flush="true" />
</fieldset>
<br>
<br>
<fieldset>
<jsp:include page="resoluciones_v2.jsp" flush="true" />
</fieldset>

<%
	if (session.getAttribute("role_id").equals("4") || session.getAttribute("notificador").equals("S�")) {
%>
<br>
<br>
<fieldset>
<details>
<summary>Funciones administrativas</summary>
<table border="0" cellspacing="0" cellpadding="4" width="600">

	<tr>
		<td colspace="2">
			&nbsp;
		</td>
	</tr>
	
	<form name="set_status" action="sql_upd_solicitante_status_v2.jsp" method="post" 
		onsubmit="return confirm('�Est� seguro que quiere cambiar el estatus del solicitante?');">

	<tr>
		<td align="right">
			<span class="smRedTxt">*</span><label for="Status"> <label for="Status"> Estatus del caso</label>
		</td>
		<td>
			<select name="status_of_case" required="required">
				<option "Solicitud incompleta" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Solicitud incompleta") ) { %> selected <% } %>>Solicitud incompleta</option>
				<option "En proceso - original" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("En proceso - original") ) { %> selected <% } %>>En proceso - original</option>
				<option "En proceso - reconsideraci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("En proceso - reconsideraci�n") ) { %> selected <% } %>>En proceso - reconsideraci�n</option>
				<option "Admitido/a a tr�mite - original" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Admitido/a a tr�mite - original") ) { %> selected <% } %>>Admitido/a a tr�mite - original</option>
				<option "Admitido/a a tr�mite - reconsideraci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Admitido/a a tr�mite - reconsideraci�n") ) { %> selected <% } %>>Admitido/a a tr�mite - reconsideraci�n</option>
				<option "No admitido/a a tr�mite - original" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("SNo admitido/a a tr�mite - original") ) { %> selected <% } %>>No admitido/a a tr�mite - original</option>
				<option "No admitido/a a tr�mite - reconsideraci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("No admitido/a a tr�mite - reconsideraci�n") ) { %> selected <% } %>>No admitido/a a tr�mite - reconsideraci�n</option>
				<option "Renuncia de Solicitante" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Renuncia de Solicitante") ) { %> selected <% } %>>Renuncia de Solicitante</option>
				<option "Cesaci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Cesaci�n") ) { %> selected <% } %>>Cesaci�n</option>
				<option "Expulsi�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Expulsi�n") ) { %> selected <% } %>>Expulsi�n</option>
				<option "Fallecimiento" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Fallecimiento") ) { %> selected <% } %>>Fallecimiento</option>
				<option "Naturalizaci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Naturalizaci�n") ) { %> selected <% } %>>Naturalizaci�n</option>
				<option "Reasentamiento" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Reasentamiento") ) { %> selected <% } %>>Reasentamiento</option>
				<option "Repatriaci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Repatriaci�n") ) { %> selected <% } %>>Repatriaci�n</option>
				<option "Revocaci�n" <% if(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString().equals("Revocaci�n") ) { %> selected <% } %>>Revocaci�n</option>
			</select>
		</td>

		<td>
			<input  type="submit" class="butnTxt" value="Guardar" name="save">
		</td>
	</tr>
	</form>
	
	<form name="remove_solicitante_v2" action="sql_del_solicitante_v2.jsp" method="post" 
		onsubmit="return confirm('�Est� seguro que quiere eliminar el solicitante de la base de datos?');">

	<tr>
		<td colspace="2">
			<input type="submit" class="butnTxt" value="Eliminar Solicitante" name="eliminar">
		</td>
	</tr>
	</form>
</table>
<br>
<br>
<strong>Historia del caso</strong>
<table border="0">
	<tr class="<%= altrow %>">
		<th><strong>ID</strong></th>
		<th><strong>Acci�n tomada</strong></th>
		<th><strong>Usuario</strong></th>
		<th><strong>�ltimo estatus</strong></th>
		<th><strong>Fecha</strong></th>
	</tr>
<%		
	while(size<history.getRowCount())
	{			
		if (altrow.equals("datatablerowaltv2")) {
			altrow="datatablerowv2";
		} else {
			altrow="datatablerowaltv2";
		}

%>
	<tr class="<%= altrow %>">
		<td><%= history.getRow(size).get(0) %></td>
		<td><%= history.getRow(size).get(1) %></td>
		<td><%= history.getRow(size).get(2) %></td>
		<td><%= history.getRow(size).get(3) %></td>
		<td><%= history.getRow(size).get(4) %></td>
	</tr>
<%
		size++;
	}
%>	

</table>


</details>
</fieldset>
<br>
<br>
<br>
<br>
<%
	}
%>