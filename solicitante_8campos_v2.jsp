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
	    <td colspan="4"  class="boldRedTxt">Fecha de nacimiento: <input type="date"  name="pre_fecha_de_nacimiento" value="" required="required" ></td>
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
	<td colspan="4" class="boldRedTxt">Fecha de entrada a Panamá: <input type="date" name="pre_fecha_llegada_panama" value="" required="required"></td>
</tr>	

<tr class="datatablerowv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrega de la solicitud: <input type="date" name="pre_fecha_solicitud_onpar" value="" required="required">		
	</td>
</tr>

<tr class="datatablerowaltv2">
	<td colspan="4" class="boldRedTxt">Fecha de entrevista: <input type="date" name="entrevista_programada" value="" required="required">		
	</td>
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
		<td class="boldRedTxt">Edad</td>
		<td>Ocupación</td>
	</tr>

	<tr id="row1">
		<td>
			<select id="miembro_1" name="miembro_1"  size="1" required="required">
				<option value=""></option>
				<option value="Madre">Madre</option>
				<option value="Padre">Padre</option>
				<option value="Hijo">Hijo/a</option>
				<option value="Hermano">Hermano/a)</option>
				<option value="Otro">Otro</option>
			</select>
		</td>
		<td>
			<input type="text"  name="miembro_nombre_1" value="" size="25" maxlength="40" required>
		</td>
		<td>
			<input type="text"  name="miembro_edad_1" value="" size="25" maxlength="40" required>
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