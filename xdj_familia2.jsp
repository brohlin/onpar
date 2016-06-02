<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan=4" align="left">VII. Ingrese la información de todos sus familiares y dependientes.</th>
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


