<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>

<%
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("PAIS_DE_ORIGEN");
	DbResults db = Database.callProcResults("p_get_familia_pais", params);
	
	params.remove(1);
	params.add("PANAMA");
	DbResults db2 = Database.callProcResults("p_get_familia_pais", params);
	
	int size = 0;
	String altrow = "datatablerowaltv2";
%>

<fieldset>
<form action="sql_upd_solicitante_soc_v2.jsp" method="post" name="solicitante_upd_soc_v2">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_v2_id") %>">
	
	<details>
		<summary>Entrevista Social - <a href="/onpar/EntrevistaSocial_v2?time=<%= System.currentTimeMillis()%>" target="_blank">Imprimir la entrevista social para la firma</a><br><br>

			Por favor, introduzca la fecha de la entrevista social para indicar que se tuvo lugar: <input type="text" class="datepicker" id="fecha_entrevista_social" name="fecha_entrevista_social" value="<%= session.getAttribute("temp_solicitante_v2_fecha_entrevista_social") %>" required="required">
			
			<br>
			Trabajador/a Social: <select name="social_user_id" size="1" required="required"><jsp:include page="/sql_get_users_social.jsp" /></select>
			<br>
			<input  type="submit" class="butnTxt" value="Guardar" name="save2">
		</summary>
		<br>
		
		<br>
		<table border="0" cellspacing="2" cellpadding="4" width="600">
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>A. DATOS GENERALES</strong></td></tr>
			<tr><td colspan="2">N�mero de caso:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_id") %> </td></tr>	
			<tr><td colspan="2">Nombre:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_materno") %> </td></tr>
			<tr><td colspan="2">GRUPO �TNICO O TRIBU</td><td colspan="2"><input type="text"  name="pre_etnico_o_tribu" value="<%= session.getAttribute("temp_solicitante_v2_pre_etnico_o_tribu") %>" size="20" maxlength="20"></td></tr>
			<tr><td colspan="2">RELIGI�N</td><td colspan="2"><select name="pre_religion_lkup"  size="1"><option value=""></option><jsp:include page="religion_lkup_v2.jsp" /></select></td></tr>
			

			<tr><td colspan="2">Nacionalidad:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_nacionalidad_lkup") %> </td></tr>		
			<tr><td colspan="2">Identificaci�n:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_pasaporte") %></td></tr>
			<tr><td colspan="2">Otro documento de identidad:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_otros_documentos") %></td></tr>
			<tr><td colspan="2">Estado civil:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup") %></td></tr>
			<tr><td colspan="2">N�mero de tel�fono:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_telefono1") %></td></tr>		
			<tr><td colspan="2">Direcci�n en Panam�:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_direccion_actual") %></td></tr>
			<tr><td colspan="2" align="left">Fecha de llegada a Panam�:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama") %></td></tr>
			<tr><td colspan="2">Fecha de llegada a ONPAR:</td><td colspan="2"><%= session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar") %></td></tr>	
			



	<tr><td colspan="5" align="left">OCUPACI�N (m�s reciente en el pa�s de origen)</td></tr>
	<tr class="datatablerowv2">
		<td>Nombre del empleador</td>
	    <td>Ciudad/Pa�s</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Nombre del puesto</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_ocu_empleador" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_empleador") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_ocu_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker"  name="pre_ocu_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_desde") %>"></td>
	    <td><input type="text" class="datepicker"  name="pre_ocu_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_hasta") %>"></td>
	    <td><input type="text"  name="pre_ocu_puesto" value="<%= session.getAttribute("temp_solicitante_v2_pre_ocu_puesto") %>" size="25" maxlength="40"></td>	    
	</tr>




			<br>
			<br>
			<tr><td colspan="4">NIVEL DE ESTUDIO: </td></tr>

	<tr class="datatablerowv2">
		<td>Nombre de la instituci�n</td>
	    <td>Ciudad/Pa�s</td>
		<td>Desde</td>
	    <td>Hasta</td>
	    <td>Titulo obtenido</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_edu_nombre" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_nombre") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_edu_lugar" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_lugar") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker2"  name="pre_edu_desde" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_desde") %>"></td>
	    <td><input type="text" class="datepicker2"  name="pre_edu_hasta" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_hasta") %>"></td>
	    <td><input type="text"  name="pre_edu_titulo" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_titulo") %>" size="25" maxlength="40"></td>	    
	</tr>
	<tr class="datatablerowaltv2">
		<td><input type="text"  name="pre_edu_nombre2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_nombre2") %>" size="25" maxlength="40"></td>
	    <td><input type="text"  name="pre_edu_lugar2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_lugar2") %>" size="25" maxlength="40"></td>
	    <td><input type="text" class="datepicker2"  name="pre_edu_desde2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_desde2") %>"></td>
	    <td><input type="text" class="datepicker2"  name="pre_edu_hasta2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_hasta2") %>"></td>
	    <td><input type="text"  name="pre_edu_titulo2" value="<%= session.getAttribute("temp_solicitante_v2_pre_edu_titulo2") %>" size="25" maxlength="40"></td>	    
	</tr>			


			<!-- end of declaracion_jurada fields -->
			<tr><td align="left" valign="bottom" colspan="4" class="subHdrBlackTxt" nowrap><strong>Datos de la Entrevista Social</strong></td></tr>
			<tr><td colspan="2">PROFESION:</td><td colspan="2"><input type="text" name="profesion" value="<%= session.getAttribute("temp_solicitante_v2_profesion") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">HABILIDADES:</td><td colspan="2"><textarea name="habilidades" rows="5" cols="45"><%= session.getAttribute("temp_solicitante_v2_habilidades") %></textarea></tr>		
			<tr><td colspan="2">COMO ESTA SUBSISTIENDO EN PANAMA:</td><td colspan="2"><textarea name="subsistiendo_en_pa" rows="5" cols="50"><%= session.getAttribute("temp_solicitante_v2_subsistiendo_en_pa") %></textarea></tr>
			
			<!-- END OF PAGE 1 -->
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>B. NUCLEO FAMILIAR BASICO</strong></td></tr>
			
			<tr><td colspan="5">			
				<jsp:include page="social_familia.jsp" flush="true" />
			</td></tr>
<br>
			
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>C. SITUACI�N ECONOMICA</strong></td></tr>
			<tr><td colspan="2">INGRESO QUE PERCIBE EN PANAMA:</td><td colspan="2"><input type="text" name="ingreso_en_pa" value="<%= session.getAttribute("temp_solicitante_v2_ingreso_en_pa") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">INGRESO QUE PERCIBIA EN SU PAIS DE ORIGEN:</td><td colspan="2"><input type="text" name="ingreso_en_pais_de_origen" value="<%= session.getAttribute("temp_solicitante_v2_ingreso_en_pais_de_origen") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">CONDCI�N DE LA VIVIENDA ACTUAL:</td><td colspan="2"><textarea name="condicion_de_vivienda_actual" rows="5" cols="45"><%= session.getAttribute("temp_solicitante_v2_condicion_de_vivienda_actual") %></textarea></td></tr>		

			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>D. CONDICIONES DE SALUD</strong></td></tr>
			<tr>
				<td colspan="2">EMBARAZO:</td>
				<td colspan="2">
					<select name="embarazo" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_embarazo").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_embarazo").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>	

			<tr>
				<td colspan="2">DISCAPACIDAD:</td>
				<td colspan="2">
					<select name="discapacidad" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_discapacidad").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_discapacidad").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="discapacidad_cual" value="<%= session.getAttribute("temp_solicitante_v2_discapacidad_cual") %>" size="40" maxlength="40"></td></tr>		

			<tr>
				<td colspan="2">PADECE DE ALGUNA ENFERMEDAD:</td>
				<td colspan="2">
					<select name="enfermedad" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_enfermedad").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_enfermedad").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="enfermedad_cual" value="<%= session.getAttribute("temp_solicitante_v2_enfermedad_cual") %>" size="40" maxlength="40"></td></tr>		

			<tr>
				<td colspan="2">DEPENDE DE ALGUN MEDICAMENTO:</td>
				<td colspan="2">
					<select name="medicamento" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_medicamento").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_medicamento").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="medicamento_cual" value="<%= session.getAttribute("temp_solicitante_v2_medicamento_cual") %>" size="40" maxlength="40"></td></tr>		

			<tr>
				<td colspan="2">ES ALERGICO(A) A ALGUN MEDICAMENTO:</td>
				<td colspan="2">
					<select name="alergica_a_medicamento" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_alergica_a_medicamento").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_alergica_a_medicamento").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="alergica_a_medicamento_cual" value="<%= session.getAttribute("temp_solicitante_v2_alergica_a_medicamento_cual") %>" size="40" maxlength="40"></td></tr>		

			<tr>
				<td colspan="2">HA SIDO OPERADO(A):</td>
				<td colspan="2">
					<select name="ha_sido_operado" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="S�" <% if (session.getAttribute("temp_solicitante_v2_ha_sido_operado").equals("S�")) { %> selected <% } %>>S�</option>
						<option value="No" <% if (session.getAttribute("temp_solicitante_v2_ha_sido_operado").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">DE QUE:</td><td colspan="2"><input type="text" name="operado_de_que" value="<%= session.getAttribute("temp_solicitante_v2_operado_de_que") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="4">EN SU CUADRO FAMILIAR TIENE ALGUN MIEMBRO CON DISCAPACIDAD O ALGUNA ENFERMEDAD:</td></tr>
			<tr><td colspan="4"><textarea name="miembro_de_fam_con_discapacidad_o_enfermedad" rows="5" cols="100"><%= session.getAttribute("temp_solicitante_v2_miembro_de_fam_con_discapacidad_o_enfermedad") %></textarea></td></tr>		
			<tr><td colspan="2">CAUSA QUE LE MOTIVARON BUSCAR PROTECCION INTERNACIONAL:</td>
				<td colspan="2">
					<select name="motivo" size="1">
						<option disabled >Seleccione una opci�n</option>
						<option value=""></option>
						<option value="RAZA" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("RAZA")) { %> selected <% } %>>RAZA</option>
						<option value="GENERO" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("GENERO")) { %> selected <% } %>>GENERO</option>
						<option value="RELIGION" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("RELIGION")) { %> selected <% } %>>RELIGION</option>
						<option value="NACIONALIDAD" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("NACIONALIDAD")) { %> selected <% } %>>NACIONALIDAD</option>
						<option value="PERTENENCIA A DETERMINADO GRUPO SOCIAL" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("PERTENENCIA A DETERMINADO GRUPO SOCIAL")) { %> selected <% } %>>PERTENENCIA A DETERMINADO GRUPO SOCIAL</option>
						<option value="OPINION POLITICA" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("OPINION POLITICA")) { %> selected <% } %>>OPINION POLITICA</option>
						<option value="OTROS" <% if (session.getAttribute("temp_solicitante_v2_motivo").equals("OTROS")) { %> selected <% } %>>OTROS</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="motivo_otro_cual" value="<%= session.getAttribute("temp_solicitante_v2_motivo_otro_cual") %>" size="40" maxlength="40"></td></tr>	
			<tr><td colspan="2">PORQUE?</td><td colspan="2"><textarea name="motivo_porque" rows="5" cols="45"><%= session.getAttribute("temp_solicitante_v2_motivo_porque") %></textarea></td></tr>		

			<tr><td colspan="4">PREGUNTAS ADICIONALES:</td></tr>
			<tr><td colspan="4"><textarea name="social_otra_pregunta" rows="5" cols="100"><%= session.getAttribute("temp_solicitante_v2_social_otra_pregunta") %></textarea></tr>		

			<tr><td colspan="4">QUISIERA AGREGAR OTRA INFORMACION:</td></tr>
			<tr><td colspan="4"><textarea name="otra_informacion" rows="5" cols="100"><%= session.getAttribute("temp_solicitante_v2_otra_informacion") %></textarea></tr>		

			<tr><td colspan="4">RECOMENDACIONES:</td></tr>
			<tr><td colspan="4"><textarea name="recomendaciones" rows="5" cols="100"><%= session.getAttribute("temp_solicitante_v2_recomendaciones") %></textarea></td></tr>		

			<tr><td colspan="4"><input type="submit" class="butnTxt" value="Guardar" name="save"><input  type="reset" class="butnTxt" value="Reiniciar" name="reset"></td></tr>
		</table>

		<br>
	</details>
</form>
</fieldset>