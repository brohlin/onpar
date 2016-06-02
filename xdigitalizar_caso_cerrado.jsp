<jsp:include page="set_solicitante_v2.jsp" flush="true" />
<!--- Javascript --->
<script language="JavaScript">
	function confirmInputFields() {
		if(document.solicitante_ins_caso_cerrado_v2.pre_fecha_llegada_panama.value == "") 
		{
		    var answer = confirm("¿Está seguro que no hay fecha de llegada a Panamá?");
		    if (answer) {
				// alert("answer value " + document.solicitante_ins_caso_cerrado_v2.pre_fecha_llegada_panama.value);
		    	// document.solicitante_ins_caso_cerrado_v2.pre_fecha_llegada_panama.value = "No hay info";
		    } else {
		    	return false;
		    }
		} else {
			return true;
		}
		
		if(document.solicitante_ins_caso_cerrado_v2.pre_fecha_solicitud_onpar.value == "") 
		{
		    var answer2 = confirm("¿Está seguro que no hay fecha de solicitud a ONPAR?");
		    if (answer2) {
		    
		    } else {
		    	return false;
		    }
		} else {
			return true;
		}		
	}
</script>

<form action="sql_ins_solicitante_caso_cerrado_v2.jsp" method="post" name="solicitante_ins_caso_cerrado_v2" onsubmit="return confirmInputFields()">

<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan="4" align="left">Datos obligatorios</th>
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
	    <td colspan="2"  class="boldRedTxt">Fecha de nacimiento</td>
	</tr>
	<tr class="datatablerowaltv2">
	    <td colspan="2"><input type="date"  name="pre_fecha_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento") %>" required="required" ></td>
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

<tr>
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
	<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="date" name="pre_fecha_llegada_panama" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama") %>"></td>
<tr>	

<tr class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrega de la solicitud: <input type="date" name="pre_fecha_solicitud_onpar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar") %>">		
	</td>
</tr>

</table>
</fieldset>
<br>
<details>
<summary>Familiares y dependientes</summary>
<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan=4" align="left">Ingrese la información de todos sus familiares y dependientes.</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Relación con el solicitante</td>
	    <td>Nombre completo</td>
		<td>Fecha de nacimiento</td>
	    <td>Donde se encuentra actualmente (ciudad, país)</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td>Madre</td>
	    <td><input type="text"  name="pre_fam_madre_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_madre_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_madre_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_madre_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_madre_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_madre_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Padre</td>
	    <td><input type="text"  name="pre_fam_padre_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_padre_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_padre_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_padre_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_padre_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_padre_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
		<tr class="datatablerowaltv2">
		<td>Esposo/a</td>
	    <td><input type="text"  name="pre_fam_spouse_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_spouse_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_spouse_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_spouse_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_spouse_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_spouse_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hijo/a</td>
	    <td><input type="text"  name="pre_fam_child1_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child1_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_child1_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child1_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_child1_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child1_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>

	<tr class="datatablerowaltv2">
		<td>Hijo/a</td>
	    <td><input type="text"  name="pre_fam_child2_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child2_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_child2_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child2_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_child2_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child2_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hijo/a</td>
	    <td><input type="text"  name="pre_fam_child3_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child3_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_child3_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child3_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_child3_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child3_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hijo/a</td>
	    <td><input type="text"  name="pre_fam_child4_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child4_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_child4_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child4_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_child4_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child4_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hijo/a</td>
	    <td><input type="text"  name="pre_fam_child5_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child5_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_child5_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child5_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_child5_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_child5_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>	

	<tr class="datatablerowaltv2">
		<td>Hermano/a</td>
	    <td><input type="text"  name="pre_fam_sibling1_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling1_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_sibling1_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling1_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_sibling1_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling1_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>

	<tr class="datatablerowaltv2">
		<td>Hermano/a</td>
	    <td><input type="text"  name="pre_fam_sibling2_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling2_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_sibling2_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling2_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_sibling2_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling2_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hermano/a</td>
	    <td><input type="text"  name="pre_fam_sibling3_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling3_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_sibling3_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling3_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_sibling3_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling3_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hermano/a</td>
	    <td><input type="text"  name="pre_fam_sibling4_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling4_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_sibling4_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling4_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_sibling4_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling4_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Hermano/a</td>
	    <td><input type="text"  name="pre_fam_sibling5_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling5_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_sibling5_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling5_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_sibling5_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_sibling5_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	
	<tr class="datatablerowaltv2">
		<td>Indica relación <input type="text"  name="pre_fam_otra1_relacion" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra1_relacion") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_fam_otra1_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra1_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_otra1_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra1_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_otra1_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra1_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>

	<tr class="datatablerowaltv2">
		<td>Indica relación <input type="text"  name="pre_fam_otra2_relacion" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra2_relacion") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_fam_otra2_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra2_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_otra2_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra2_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_otra2_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra2_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td>Indica relación <input type="text"  name="pre_fam_otra3_relacion" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra3_relacion") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_fam_otra3_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra3_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="date"  name="pre_fam_otra3_dob" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra3_dob") %>"></td>
	    <td><input type="text"  name="pre_fam_otra3_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_fam_otra3_lugar") %>" size="25" maxlength="40"></td>	    
	</tr>
	
</table>
</fieldset>
</details>
<br>
<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">		
	<tr class="datatablerowv2">
	<td>
		<!-- input type="submit" value="Guardar" name="save" onclick="return confirm('¿Está seguro que quiere guardar este formulario?');" -->
		<input type="submit" value="Guardar" name="save">
	</td>
	<td>
		<input type="reset" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</fieldset>
<br>
</form>