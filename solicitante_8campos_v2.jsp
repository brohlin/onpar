<jsp:include page="set_solicitante_v2.jsp" flush="true" />
<!--- Javascript --->
<script language="JavaScript">
	function confirmInputFields() {
		if(document.ins_solicitante_8campos_v2.pre_fecha_llegada_panama.value == "") 
		{
			if (document.ins_solicitante_8campos_v2.pre_estatus_lkup.value == "Solicitud incompleta") {
				alert("Tiene que entrar la fecha de llegada a Panamá");
				return false;
			} else {
			    var answer = confirm("¿Está seguro que no hay fecha de llegada a Panamá?");
			    if (answer) {
					// alert("answer value " + document.ins_solicitante_8campos_v2.pre_fecha_llegada_panama.value);
			    	// document.ins_solicitante_8campos_v2.pre_fecha_llegada_panama.value = "No hay info";
			    } else {
			    	return false;
			    }
			}
		} 
		
		if(document.ins_solicitante_8campos_v2.pre_fecha_solicitud_onpar.value == "") 
		{
			if (document.ins_solicitante_8campos_v2.pre_estatus_lkup.value == "Solicitud incompleta") {
				alert("Tiene que entrar la fecha de solicitud a ONPAR");
				return false;
			} else {		
			    var answer2 = confirm("¿Está seguro que no hay fecha de solicitud a ONPAR?");
				if (answer2) {
			
			    } else {
					return false;
				}
			}
		}	
		
		
	}
</script>

<!-- form action="sql_ins_solicitante_8campos_v2.jsp" method="post" name="ins_solicitante_8campos_v2" onsubmit="return confirmInputFields()" -->
<form action="sql_ins_solicitante_8campos_v2.jsp" method="post" name="ins_solicitante_8campos_v2">

<input type="hidden" id="num_fam_members" name="num_fam_members" value="1">

<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr> 
		<td colspan="4" valign="top" width="600" class="hdrBlackTxt">
			Registrar Solicitante
		</td>
		
	</tr>	

	<tr class="datatablerowv2">
		<td colspan="2" class="boldRedTxt">
			<input type="radio" name="pre_estatus_lkup" value="Digitalizar Caso Cerrado">Digitalizar Caso Cerrado
		</td>
		<td colspan="2" class="boldRedTxt">
			<input type="radio" name="pre_estatus_lkup" value="Solicitud incompleta" checked="checked">Añadir Nuevo/a Solicitante
		</td>
	</tr>	
<table>
</fieldset>
<br>
<fieldset>
<table id="register" border="0" cellspacing="2" cellpadding="4" width="600">
	
	<tr class="datatablerowaltv2">
		<td colspan="2" class="boldRedTxt">Nombre<br><input type="text"  name="pre_primer_nombre" value="" required="required" size="20" maxlength="20"></td>
	    <td class="boldRedTxt">Apellido paterno<br><input type="text"  name="pre_apellido_paterno" value="" required="required" size="20" maxlength="20"></td>
	    <td>Apellido materno<br><input type="text"  name="pre_apellido_materno" value="" size="20" maxlength="20"></td>
	</tr>

	<tr class="datatablerowv2">
	    <td colspan="4"  class="boldRedTxt">Fecha de nacimiento: <input type="text" class="datepicker"  name="pre_fecha_de_nacimiento" value="" required="required" ></td>
	</tr>
	
	<tr class="datatablerowaltv2">
		<td colspan="4">Lugar de nacimiento (ciudad, país)</td>
	</tr>
	<tr class="datatablerowv2">
		<td colspan="4">
			<input type="text"  name="pre_ciudad_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_v2_pre_ciudad_de_nacimiento") %>" size="20" maxlength="20">
			<select name="pre_pais_de_nacimiento_lkup"  size="1">
			<jsp:include page="pais_lkup_v2.jsp" />			
			</select>		
		</td>
	</tr>	
	
	<tr class="datatablerowaltv2">
		<td colspan="2"  class="boldRedTxt">Sexo: 
			<select name="pre_genero_lkup" size="1" required="required">
				<option value=""></option>
				<option value="Masculino">Masculino</option>
				<option value="Feminino">Feminino</option>
			</select>			
		</td>
	    <td colspan="2"  class="boldRedTxt">Nacionalidad
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


<tr  class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Estado Civil  
		<select name="pre_estatus_civil_lkup" size="1" required="required">
		<option value=""></option>
		<option value="Casado/a">Casado/a</option>
		<option value="Divorciado/a">Divorciado/a</option>
		<option value="En Unión Libre">En Unión Libre</option>
		<option value="Separado/a">Separado/a</option>
		<option value="Soltero/a">Soltero/a</option>
		<option value="Viudo/a">Viudo/a</option>
		<option value="No Hay Información">No Hay Información</option>
		</select>
	</td>
</tr>

<tr class="datatablerowaltv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="text" class="datepicker" name="pre_fecha_llegada_panama" value="" required="required"></td>
</tr>	

<tr class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrega de la solicitud: <input type="text" class="datepicker" name="pre_fecha_solicitud_onpar" value="" required="required">		
	</td>
</tr>

<tr class="datatablerowaltv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrevista: <input type="text" class="datepicker" name="entrevista_programada" value="" required="required">		
	</td>
</tr>

	<tr class="datatablerowv2">
		<td colspan="2" class="boldRedTxt">Dirección actual</td>
	    <td colspan="2" class="boldRedTxt">Número de teléfono</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td colspan="2"><input type="text"  name="pre_direccion_actual" value="<%= session.getAttribute("temp_solicitante_v2_pre_direccion_actual") %>" size="40" maxlength="40" required></td>
	    <td colspan="2"><input type="text"  name="pre_telefono1" value="<%= session.getAttribute("temp_solicitante_v2_pre_telefono1") %>" size="20" maxlength="20"  required></td>
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
	<td colspan="4" class="boldRedTxt">¿Tiene familiares o dependientes?&nbsp;&nbsp;
	
		<input type="radio" id="pre_tiene_familiares" name="pre_tiene_familiares" value="yes" required="required">Sí
		<input type="radio" id="pre_tiene_familiares" name="pre_tiene_familiares" value="no" required="required">No
	</td>
</tr>	

<tr class="datatablerowaltv2">
	<td colspan="4">&nbsp;</td>
</tr>
</table>


<div id="family">
	<table id="register_family_members_0" border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatablerowv2">
		<td colspan="4">
			<label>Ingrese la información de todos sus familiares y dependientes en Panamá.</label>
		</td>
	</tr>	
	<tr class="datatablerowaltv2">
		<td class="boldRedTxt">Relación</td>
		<td class="boldRedTxt">Nombre</td>
		<td class="boldRedTxt">Fecha de nacimiento</td>
		<td class="boldRedTxt">Sexo</td>
		<td class="boldRedTxt">Nacionalidad</td>
		<td>Ocupación</td>
	</tr>

	<tr id="row1">
		<td>
			<select id="miembro_1" name="miembro_1"  size="1" required="required">
				<option value=""></option>
				<option value="Madre">Madre</option>
				<option value="Padre">Padre</option>
				<option value="Hijo/a">Hijo/a</option>
				<option value="Hermano/a">Hermano/a</option>
				<option value="Esposo/a">Esposo/a</option>
				<option value="Otro">Otro</option>
			</select>
		</td>
		<td>
			<input type="text"  name="miembro_nombre_1" value="" size="25" maxlength="40" required>
		</td>
		<td>
			<input type="text" class="datepicker"  name="miembro_fecha_de_nacimiento_1" value="" size="25" maxlength="40" required>
		</td>
		<td>
			<select name="miembro_sexo_1" size="1" required="required">
				<option value=""></option>
				<option value="Masculino">Masculino</option>
				<option value="Feminino">Feminino</option>
			</select>			
		</td>
		<td>
			<select name="miembro_nacionalidad_1"  size="1" required="required">
				<option value=""></option>
				<option value="Afganistán">Afganistán</option>
				<option value="Albania">Albania</option>
				<option value="Alemania">Alemania</option><option value="Andorra">Andorra</option><option value="Anguila">Anguila</option><option value="Angola">Angola</option><option value="Antigua y Barbuda">Antigua y Barbuda</option><option value="Antillas Holandesas">Antillas Holandesas</option><option value="Arabia Saudita">Arabia Saudita</option><option value="Argelia">Argelia</option><option value="Argentina">Argentina</option><option value="Aruba">Aruba</option><option value="Australia">Australia</option><option value="Austria">Austria</option><option value="Bahamas">Bahamas</option><option value="Bangladés/Bangladesh">Bangladés/Bangladesh</option><option value="Barbados">Barbados</option><option value="Barbuda">Barbuda</option><option value="Bélgica">Bélgica</option><option value="Belice">Belice</option><option value="Benín">Benín</option><option value="Birmania">Birmania</option><option value="Bolivia">Bolivia</option><option value="Bonaire">Bonaire</option><option value="Botswana">Botswana</option><option value="Brasil">Brasil</option><option value="Bulgaria">Bulgaria</option><option value="Burkina Faso">Burkina Faso</option><option value="Camboya">Camboya</option><option value="Camerún">Camerún</option><option value="Canadá">Canadá</option><option value="Ceilán">Ceilán</option><option value="Chad">Chad</option><option value="Chile">Chile</option><option value="China">China</option><option value="Chipre">Chipre</option><option value="Colombia">Colombia</option><option value="Congo">Congo</option><option value="Corea del Norte">Corea del Norte</option><option value="Corea del Sur">Corea del Sur</option><option value="Costa de Marfil">Costa de Marfil</option><option value="Costa Rica">Costa Rica</option><option value="Croacia">Croacia</option><option value="Cuba">Cuba</option><option value="Curazao">Curazao</option><option value="Dinamarca">Dinamarca</option><option value="Dominica">Dominica</option><option value="Dubai">Dubai</option><option value="Ecuador">Ecuador</option><option value="Egipto">Egipto</option><option value="El Salvador">El Salvador</option><option value="Eritrea">Eritrea</option><option value="Escocia">Escocia</option><option value="Eslovaquia">Eslovaquia</option><option value="España">España</option><option value="Estados Unidos">Estados Unidos</option><option value="Etiopía">Etiopía</option><option value="Filipinas">Filipinas</option><option value="Finlandia">Finlandia</option><option value="Francia">Francia</option><option value="Gabón">Gabón</option><option value="Gales">Gales</option><option value="Gambia">Gambia</option><option value="Ghana">Ghana</option><option value="Gran Bretaña">Gran Bretaña</option><option value="Granada">Granada</option><option value="Grecia">Grecia</option><option value="Guadalupe">Guadalupe</option><option value="Guam">Guam</option><option value="Guatemala">Guatemala</option><option value="Guinea">Guinea</option><option value="Guinea Ecuatorial">Guinea Ecuatorial</option><option value="Guinea-Bissau">Guinea-Bissau</option><option value="Guyana">Guyana</option><option value="Haití">Haití</option><option value="Hawaii">Hawaii</option><option value="Holanda">Holanda</option><option value="Honduras">Honduras</option><option value="India">India</option><option value="Indonesia">Indonesia</option><option value="Inglaterra">Inglaterra</option><option value="Irak, Iraq">Irak, Iraq</option><option value="Irán">Irán</option><option value="Irlanda">Irlanda</option><option value="Islandia">Islandia</option><option value="Islas Caimán">Islas Caimán</option><option value="Islas Turcas y Caicos">Islas Turcas y Caicos</option><option value="Islas Vírgenes Británicas">Islas Vírgenes Británicas</option><option value="Islas Vírgenes de Estados Unidos">Islas Vírgenes de Estados Unidos</option><option value="Israel">Israel</option><option value="Italia">Italia</option><option value="Jamaica">Jamaica</option><option value="Japón">Japón</option><option value="Jordania">Jordania</option><option value="Kenya">Kenya</option><option value="Kuwait">Kuwait</option><option value="Laos">Laos</option><option value="las Islas Cook">las Islas Cook</option><option value="Líbano">Líbano</option><option value="Liberia">Liberia</option><option value="Libia">Libia</option><option value="Lituania">Lituania</option><option value="Luxemburgo">Luxemburgo</option><option value="Malasia">Malasia</option><option value="Mali">Mali</option><option value="Malta">Malta</option><option value="Marruecos">Marruecos</option><option value="Martinique">Martinique</option><option value="Mauricio">Mauricio</option><option value="Mauritania">Mauritania</option><option value="México, Méjico">México, Méjico</option><option value="Mónaco">Mónaco</option><option value="Montserrat">Montserrat</option><option value="Nepal">Nepal</option><option value="Namibia">Namibia</option><option value="Nicaragua">Nicaragua</option><option value="Niger">Niger</option><option value="Nigeria">Nigeria</option><option value="Noruega">Noruega</option><option value="Nueva Zelanda">Nueva Zelanda</option><option value="Países Bajos">Países Bajos</option><option value="Palestina">Palestina</option><option value="Panamá">Panamá</option><option value="Paquistán">Paquistán</option><option value="Paraguay">Paraguay</option><option value="Persia">Persia</option><option value="Perú">Perú</option><option value="Polonia">Polonia</option><option value="Portugal">Portugal</option><option value="Puerto Rico">Puerto Rico</option><option value="República Checa">República Checa</option><option value="República Dominicana">República Dominicana</option><option value="Ruanda">Ruanda</option><option value="Rumanía">Rumanía</option><option value="Rusia">Rusia</option><option value="Saba">Saba</option><option value="Samoa">Samoa</option><option value="San Bartolomé">San Bartolomé</option><option value="San Cristóbal y Nieves">San Cristóbal y Nieves</option><option value="San Eustaquio">San Eustaquio</option><option value="San Martín">San Martín</option><option value="San Vicente">San Vicente</option><option value="Santa Lucía">Santa Lucía</option><option value="Santo Tomás">Santo Tomás</option><option value="Senegal">Senegal</option><option value="Sierra Leona">Sierra Leona</option><option value="Siria">Siria</option><option value="Somalia">Somalia</option><option value="Sri Lanka">Sri Lanka</option><option value="Sudáfrica">Sudáfrica</option><option value="Sudán">Sudán</option><option value="Suecia">Suecia</option><option value="Suiza">Suiza</option><option value="Surinam">Surinam</option><option value="Tailandia">Tailandia</option><option value="Taiwán">Taiwán</option><option value="Tanzania">Tanzania</option><option value="Togo">Togo</option><option value="Trinidad y Tobago">Trinidad y Tobago</option><option value="Túnez">Túnez</option><option value="Turquía">Turquía</option><option value="Ucrania">Ucrania</option><option value="Uganda">Uganda</option><option value="Uruguay">Uruguay</option><option value="Venezuela">Venezuela</option><option value="Vietnam">Vietnam</option><option value="Yemen">Yemen</option><option value="Yugoslavia">Yugoslavia</option><option value="Zaire">Zaire</option><option value="Zambia">Zambia</option><option value="Zimbabwe">Zimbabwe</option>
			</select>
		</td>
		<td>
			<input type="text"  name="miembro_ocupacion_1" value="" size="25" maxlength="40">
		</td>		

	</tr>
		
	</table>


	<table>
	
	<tr class="datatablerowv2">
		<td colspan="2">
			<button id="add_row_0" >Añadir</button>
		</td>
		<td  colspan="2">
			<button id="delete_row">Eliminar</button>
		</td>
	</tr> 	
	
	<tr class="datatablerowv2">
		<td colspan="4">&nbsp;</td>
	</tr>
	
	</table>
</div>

<table>		
<tr class="datatablerowv2">
	<td colspan="2">
		<!-- input type="submit" value="Guardar" name="save" onclick="return confirm('¿Está seguro que quiere guardar este formulario?');" -->
		<input type="submit" value="Guardar" name="save">
	</td>
	<td colspan="2">
		<input type="reset" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</fieldset>
<br>
</form>