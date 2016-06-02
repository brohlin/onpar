<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="4" align="left">Datos personales</th>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="2" class="boldRedTxt">Nombre</td>
	    <td class="boldRedTxt">Apellido paterno</td>
		<td>Apellido materno</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_primer_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_primer_nombre") %>" required="required" size="20" maxlength="20"></td>
	    <td><input type="text"  name="pre_apellido_paterno" value="<%= session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") %>" required="required" size="20" maxlength="20"></td>
		<td><input type="text"  name="pre_apellido_materno" value="<%= session.getAttribute("temp_solicitante_v2_pre_apellido_materno") %>" size="20" maxlength="20"></td>
	</tr>

	<tr class="datatablerowv2">
		<td colspan="2">Otros nombres que Ud. ha utilizado</td>
	    <td colspan="2"  class="boldRedTxt">Fecha de nacimiento</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_otros_nombres" value="<%= session.getAttribute("temp_solicitante_v2_pre_otros_nombres") %>" size="20" maxlength="20"></td>
	    <td colspan="2"><input type="date"  name="pre_fecha_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento") %>" required="required" ></td>
	</tr>

	<tr class="datatablerowv2">
		<td colspan="4">Lugar de nacimiento (ciudad, país)</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="4">
			<input type="text"  name="pre_ciudad_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_v2_pre_ciudad_de_nacimiento") %>" size="20" maxlength="20">
			<select name="pre_pais_de_nacimiento_lkup"  size="1">
			<jsp:include page="pais_lkup_v2.jsp" />			
			</select>		
		</td>
	</tr>
	
	<tr class="datatablerowv2">
		<td colspan="2"  class="boldRedTxt">Sexo</td>
	    <td colspan="2"  class="boldRedTxt">Nacionalidad</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2">
			<select name="pre_genero_lkup" size="1" required="required">
			<option value=""></option>
			<option value="Masculino"<% if (session.getAttribute("temp_solicitante_v2_pre_genero_lkup").equals("Masculino")) {%> selected <% } %>>Masculino</option>
			<option value="Feminino" <% if (session.getAttribute("temp_solicitante_v2_pre_genero_lkup").equals("Feminino")) {%> selected <% } %>>Feminino</option>
			</select>		
		</td>
	    <td colspan="2">
	    	<select name="pre_nacionalidad_lkup"  size="1"  required="required">
				<jsp:include page="nacionalidad_lkup_v2.jsp" />
			</select>
	    </td>
	</tr>	


	<tr class="datatablerowv2">
		<td colspan="4">Ud. tiene nacionalidad, residencia, u otro estatus migratorio en otro país? 	
			<select name="pre_otro_estatus_migratoria" size="1">
			<option value=""></option>
			<option value="Si" <% if (session.getAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria").equals("Si")) {%> selected <% } %>>Si</option>
			<option value="No" <% if (session.getAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria").equals("No")) {%> selected <% } %>>No</option>
			</select>
			<br>Si Ud. respondió <em>si</em>, favor de indicar los países donde usted tiene tal estatus:		
		</td>
	<tr class="datatablerowaltv2">
		<td colspan="4"><input type="text"  name="pre_otro_estatus_migratoria_paises" value="<%= session.getAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria_paises") %>" size="40" maxlength="50">
		</td>
	</tr>
	
	
	<tr class="datatablerowv2">
		<td colspan="2">Grupo étnico o tribu</td>
	    <td colspan="2">Religión</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_etnico_o_tribu" value="<%= session.getAttribute("temp_solicitante_v2_pre_etnico_o_tribu") %>" size="20" maxlength="20"></td>
	    <td colspan="2">
			<select name="pre_religion_lkup"  size="1">
			<option value=""></option>
			<jsp:include page="religion_lkup_v2.jsp" />
			</select>	    
	    </td>
	</tr>				
	
	<tr class="datatablerowv2">
		<td colspan="2">Primer idioma</td>
	    <td colspan="2">Otros idiomas que Ud. habla</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2">
			<select name="pre_idioma_lkup"  size="1">
			<option value=""></option>
			<jsp:include page="idioma_lkup.jsp" />
			</select>		
		</td>
	    <td colspan="2"><input type="text"  name="pre_otros_idiomas" value="<%= session.getAttribute("temp_solicitante_v2_pre_otros_idiomas") %>" size="40" maxlength="50"></td>
	</tr>	


	<tr class="datatablerowv2">
		<td colspan="2">Dirección actual</td>
	    <td colspan="2">Número de teléfono</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_direccion_actual" value="<%= session.getAttribute("temp_solicitante_v2_pre_direccion_actual") %>" size="40" maxlength="40"></td>
	    <td colspan="2"><input type="text"  name="pre_telefono1" value="<%= session.getAttribute("temp_solicitante_v2_pre_telefono1") %>" size="20" maxlength="20"></td>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="2">País de pasaporte y número de pasaporte</td>
	    <td colspan="2">Otros documentos de identificación (tipo, pais, y número)</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_pasaporte" value="<%= session.getAttribute("temp_solicitante_v2_pre_pasaporte") %>" size="40" maxlength="40"></td>
	    <td colspan="2"><input type="text"  name="pre_otros_documentos" value="<%= session.getAttribute("temp_solicitante_v2_pre_otros_documentos") %>" size="40" maxlength="40"></td>
	</tr>

<tr class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Estado Civil  
		<select name="pre_estatus_civil_lkup" size="1" required="required">
		<option value=""></option>
		<option value="Casado/a" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("Casado/a")) {%> selected <% } %>>Casado/a</option>
		<option value="Divorciado/a" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("Divorciado/a")) {%> selected <% } %>>Divorciado/a</option>
		<option value="En Unión Libre" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("En Unión Libre")) {%> selected <% } %>>En Unión Libre</option>
		<option value="Separado/a" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("Separado/a")) {%> selected <% } %>>Separado/a</option>
		<option value="Soltero/a" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("Soltero/a")) {%> selected <% } %>>Soltero/a</option>
		<option value="Viudo/a" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("Viudo/a")) {%> selected <% } %>>Viudo/a</option>
		<option value="No Hay Información" <% if (session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").equals("No Hay Información")) {%> selected <% } %>>No Hay Información</option>
		</select>
	</td>
</tr>

<tr class="datatablerowaltv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="date" name="pre_fecha_llegada_panama" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama") %>" required="required"></td>
</tr>

<tr class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrega de la solicitud: <input type="date" name="pre_fecha_solicitud_onpar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar") %>" required="required" >	</td>
</tr>

</table>
</fieldset>
