<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>

<%
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("esf_solicitante_id").toString());
	params.add("PAIS_DE_ORIGEN");
	DbResults db = Database.callProcResults("p_get_familia_pais", params);
	
	params.remove(1);
	params.add("PANAMA");
	DbResults db2 = Database.callProcResults("p_get_familia_pais", params);
	
	int size = 0;
	String altrow = "datatablerowaltv2";
%>

<fieldset><div style="background-color:yellow;"></div></fieldset>
<br>

<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td class="hdrBlackTxt">
	Solicitante: 
	<%= session.getAttribute("esf_solicitante_id").toString() %>&nbsp;-&nbsp;<%= session.getAttribute("esf_pre_primer_nombre") %>&nbsp;<%= session.getAttribute("esf_pre_apellido_paterno") %>&nbsp;<%= session.getAttribute("esf_pre_apellido_materno") %>
	</td>
</tr>
</table>

<fieldset>
<form action="sql_upd_entrevista_social_familia.jsp" method="post" name="upd_entrevista_social_familia">

	<input type="hidden" name="id" value="<%= session.getAttribute("esf_id") %>">
	<details>
		<summary>Entrevista Social (Miembro de Familia)<br><br>
			<table border="0" cellspacing="0" cellpadding="4" width="600">
				<tr><td class="hdrBlackTxt">Miembro de Familia: <%= session.getAttribute("esf_nombre") %>&nbsp;-&nbsp;<%= session.getAttribute("esf_parentesco_lkup") %></td></tr>
			</table>
		</summary>

		<p>
		Por favor, introduzca la fecha de la entrevista social para indicar que se tuvo lugar: <input type="text" class="datepicker" id="fecha_entrevista_social" name="fecha_entrevista_social" value="<%= session.getAttribute("esf_fecha_entrevista_social") %>" required="required"><br>
		Trabajador/a Social: <select name="social_user_id" size="1" required="required"><jsp:include page="/sql_get_users_entrevista_social_familia.jsp" /></select>
		</p>
		<table border="0" cellspacing="2" cellpadding="4" width="600">
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>DATOS GENERALES DE SOLICITANTE</strong></td></tr>
			<tr><td colspan="2">Número de caso:</td><td colspan="2"><%= session.getAttribute("esf_solicitante_id") %> </td></tr>	
			<tr><td colspan="2">Nombre:</td><td colspan="2"><%= session.getAttribute("esf_pre_primer_nombre") + " " + session.getAttribute("esf_pre_apellido_paterno") + " " + session.getAttribute("esf_pre_apellido_materno") %> </td></tr>
			<tr><td colspan="2">GRUPO ÉTNICO O TRIBU</td><td colspan="2"><%= session.getAttribute("esf_pre_etnico_o_tribu") %></td></tr>
			<tr><td colspan="2">RELIGIÓN</td><td colspan="2"><%= session.getAttribute("esf_pre_religion_lkup") %></td></tr>
			

			<tr><td colspan="2">Nacionalidad:</td><td colspan="2"><%= session.getAttribute("esf_pre_nacionalidad_lkup") %> </td></tr>		
			<tr><td colspan="2">Identificación:</td><td colspan="2"><%= session.getAttribute("esf_pre_pasaporte") %></td></tr>
			<tr><td colspan="2">Otro documento de identidad:</td><td colspan="2"><%= session.getAttribute("esf_pre_otros_documentos") %></td></tr>
			<tr><td colspan="2">Estado civil:</td><td colspan="2"><%= session.getAttribute("esf_pre_estatus_civil_lkup") %></td></tr>
			<tr><td colspan="2">Número de teléfono:</td><td colspan="2"><%= session.getAttribute("esf_pre_telefono1") %></td></tr>		
			<tr><td colspan="2">Dirección en Panamá:</td><td colspan="2"><%= session.getAttribute("esf_pre_direccion_actual") %></td></tr>
			<tr><td colspan="2" align="left">Fecha de llegada a Panamá:</td><td colspan="2"><%= session.getAttribute("esf_pre_fecha_llegada_panama") %></td></tr>
			<tr><td colspan="2">Fecha de llegada a ONPAR:</td><td colspan="2"><%= session.getAttribute("esf_pre_fecha_solicitud_onpar") %></td></tr>	

			<tr><td colspan="5" align="left">OCUPACIÓN (más reciente en el país de origen)</td></tr>
			<tr class="datatablerowv2">
				<th>Nombre del empleador</th>
			    <th>Ciudad/País</th>
				<th>Desde</th>
			    <th>Hasta</th>
			    <th>Nombre del puesto</th>
			</tr>
			<tr class="datatablerowaltv2">
				<td><%= session.getAttribute("esf_pre_ocu_empleador") %></td>
			    <td><%= session.getAttribute("esf_pre_ocu_lugar") %></td>
			    <td><%= session.getAttribute("esf_pre_ocu_desde") %></td>
			    <td><%= session.getAttribute("esf_pre_ocu_hasta") %></td>
			    <td><%= session.getAttribute("esf_pre_ocu_puesto") %></td>	    
			</tr>
			<tr><td colspan="4">&nbsp;</td></tr>
			<tr><td colspan="4">NIVEL DE ESTUDIO: </td></tr>
			<tr class="datatablerowv2">
				<th>Nombre de la institución</th>
			    <th>Ciudad/País</th>
				<th>Desde</th>
			    <th>Hasta</th>
			    <th>Titulo obtenido</th>
			</tr>
			<tr class="datatablerowaltv2">
				<td><%= session.getAttribute("esf_pre_edu_nombre") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_lugar") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_desde") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_hasta") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_titulo") %></td>	    
			</tr>
			<tr class="datatablerowaltv2">
				<td><%= session.getAttribute("esf_pre_edu_nombre2") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_lugar2") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_desde2") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_hasta2") %></td>
			    <td><%= session.getAttribute("esf_pre_edu_titulo2") %></td>	    
			</tr>			
			<tr><td colspan="4">&nbsp;</td></tr>
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>NUCLEO FAMILIAR BASICO</strong></td></tr>			
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>GRUPO FAMILIAR EN SU PAIS DE ORIGEN</strong></td></tr>
			<tr>
				<td colspan="4">
					<table border="0">
						<tr class="<%= altrow %>">
							<th><strong>Nombre</strong></td>
							<th><strong>Parentesco</strong></td>
							<th><strong>Fecha de nacimiento</strong></th>
							<th><strong>Sexo</strong></th>
							<th><strong>Nacionalidad</strong></th>
			    			<th><strong>Ocupación</strong></td>
			    			<th><strong>País</strong></td>
						</tr>
<%		
	while(size<db.getRowCount())
	{			
		if (altrow.equals("datatablerowaltv2")) {
			altrow="datatablerowv2";
		} else {
			altrow="datatablerowaltv2";
		}

%>
						<tr class="<%= altrow %>">
							<td><%= db.getRow(size).get(3) %></td>
							<td><%= db.getRow(size).get(2) %></td>
							<td><%= db.getRow(size).get(4) %></td>
							<td><%= db.getRow(size).get(7) %></td>
							<td><%= db.getRow(size).get(8) %></td>
				    		<td><%= db.getRow(size).get(5) %></td>
				    		<td><%= db.getRow(size).get(6) %></td>
						</tr>
<%
		size++;
	}
%>	
					</table>
				</td>
			</tr>
			<tr><td colspan="4">&nbsp;</td></tr>
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>FAMILIARES QUE LE ACOMPAÑAN EN PANAMÁ</strong></td></tr>
			<tr>
				<td colspan="4">
					<table border="0">
						<tr class="<%= altrow %>">
							<th><strong>Nombre</strong></td>
							<th><strong>Parentesco</strong></td>
							<th><strong>Fecha de nacimiento</strong></th>
							<th><strong>Sexo</strong></th>
							<th><strong>Nacionalidad</strong></th>
			    			<th><strong>Ocupación</strong></td>
			    			<th><strong>País</strong></td>
						</tr>
<%		
	size=0;
	altrow="datatablerowaltv2";

	while(size<db2.getRowCount())
	{			
		if (altrow.equals("datatablerowaltv2")) {
			altrow="datatablerowv2";
		} else {
			altrow="datatablerowaltv2";
		}
%>
						<tr class="<%= altrow %>">
							<td><%= db2.getRow(size).get(3) %></td>
							<td><%= db2.getRow(size).get(2) %></td>
							<td><%= db2.getRow(size).get(4) %></td>
							<td><%= db2.getRow(size).get(7) %></td>
							<td><%= db2.getRow(size).get(8) %></td>
				    		<td><%= db2.getRow(size).get(5) %></td>
				    		<td><%= db2.getRow(size).get(6) %></td>
						</tr>
<%
		size++;
	}
%>	
					</table>
				</td>
			</tr>	
			<tr><td colspan="4">&nbsp;</td></tr>
			
			<!-- end of declaracion_jurada fields -->
			<tr><td align="left" valign="bottom" colspan="4" class="subHdrBlackTxt" nowrap><strong>DATOS DE LA ENTREVISTA SOCIAL</strong></td></tr>
			<tr><td colspan="2">PROFESION:</td><td colspan="2"><input type="text" name="profesion" value="<%= session.getAttribute("esf_profesion") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">HABILIDADES:</td><td colspan="2"><textarea name="habilidades" rows="5" cols="45"><%= session.getAttribute("esf_habilidades") %></textarea></tr>		
			<tr><td colspan="2">COMO ESTA SUBSISTIENDO EN PANAMA:</td><td colspan="2"><textarea name="subsistiendo_en_pa" rows="5" cols="50"><%= session.getAttribute("esf_subsistiendo_en_pa") %></textarea></tr>
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>SITUACIÓN ECONOMICA</strong></td></tr>
			<tr><td colspan="2">INGRESO QUE PERCIBE EN PANAMA:</td><td colspan="2"><input type="text" name="ingreso_en_pa" value="<%= session.getAttribute("esf_ingreso_en_pa") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">INGRESO QUE PERCIBIA EN SU PAIS DE ORIGEN:</td><td colspan="2"><input type="text" name="ingreso_en_pais_de_origen" value="<%= session.getAttribute("esf_ingreso_en_pais_de_origen") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="2">CONDCIÓN DE LA VIVIENDA ACTUAL:</td><td colspan="2"><textarea name="condicion_de_vivienda_actual" rows="5" cols="45"><%= session.getAttribute("esf_condicion_de_vivienda_actual") %></textarea></td></tr>		
			<tr><td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>CONDICIONES DE SALUD</strong></td></tr>
			<tr>
				<td colspan="2">EMBARAZO:</td>
				<td colspan="2">
					<select name="embarazo" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_embarazo").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_embarazo").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>	
			<tr>
				<td colspan="2">DISCAPACIDAD:</td>
				<td colspan="2">
					<select name="discapacidad" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_discapacidad").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_discapacidad").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="discapacidad_cual" value="<%= session.getAttribute("esf_discapacidad_cual") %>" size="40" maxlength="40"></td></tr>		
			<tr>
				<td colspan="2">PADECE DE ALGUNA ENFERMEDAD:</td>
				<td colspan="2">
					<select name="enfermedad" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_enfermedad").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_enfermedad").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="enfermedad_cual" value="<%= session.getAttribute("esf_enfermedad_cual") %>" size="40" maxlength="40"></td></tr>		
			<tr>
				<td colspan="2">DEPENDE DE ALGUN MEDICAMENTO:</td>
				<td colspan="2">
					<select name="medicamento" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_medicamento").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_medicamento").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="medicamento_cual" value="<%= session.getAttribute("esf_medicamento_cual") %>" size="40" maxlength="40"></td></tr>		
			<tr>
				<td colspan="2">ES ALERGICO(A) A ALGUN MEDICAMENTO:</td>
				<td colspan="2">
					<select name="alergica_a_medicamento" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_alergica_a_medicamento").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_alergica_a_medicamento").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="alergica_a_medicamento_cual" value="<%= session.getAttribute("esf_alergica_a_medicamento_cual") %>" size="40" maxlength="40"></td></tr>		
			<tr>
				<td colspan="2">HA SIDO OPERADO(A):</td>
				<td colspan="2">
					<select name="ha_sido_operado" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="Sí" <% if (session.getAttribute("esf_ha_sido_operado").equals("Sí")) { %> selected <% } %>>Sí</option>
						<option value="No" <% if (session.getAttribute("esf_ha_sido_operado").equals("No")) { %> selected <% } %>>No</option>					
					</select>
				</td>
			</tr>		
			<tr><td colspan="2">DE QUE:</td><td colspan="2"><input type="text" name="operado_de_que" value="<%= session.getAttribute("esf_operado_de_que") %>" size="40" maxlength="40"></td></tr>		
			<tr><td colspan="4">EN SU CUADRO FAMILIAR TIENE ALGUN MIEMBRO CON DISCAPACIDAD O ALGUNA ENFERMEDAD:</td></tr>
			<tr><td colspan="4"><textarea name="miembro_de_fam_con_discapacidad_o_enfermedad" rows="5" cols="100"><%= session.getAttribute("esf_miembro_de_fam_con_discapacidad_o_enfermedad") %></textarea></td></tr>		
			<tr><td colspan="2">CAUSA QUE LE MOTIVARON BUSCAR PROTECCION INTERNACIONAL:</td>
				<td colspan="2">
					<select name="motivo" size="1">
						<option disabled >Seleccione una opción</option>
						<option value=""></option>
						<option value="RAZA" <% if (session.getAttribute("esf_motivo").equals("RAZA")) { %> selected <% } %>>RAZA</option>
						<option value="GENERO" <% if (session.getAttribute("esf_motivo").equals("GENERO")) { %> selected <% } %>>GENERO</option>
						<option value="RELIGION" <% if (session.getAttribute("esf_motivo").equals("RELIGION")) { %> selected <% } %>>RELIGION</option>
						<option value="NACIONALIDAD" <% if (session.getAttribute("esf_motivo").equals("NACIONALIDAD")) { %> selected <% } %>>NACIONALIDAD</option>
						<option value="PERTENENCIA A DETERMINADO GRUPO SOCIAL" <% if (session.getAttribute("esf_motivo").equals("PERTENENCIA A DETERMINADO GRUPO SOCIAL")) { %> selected <% } %>>PERTENENCIA A DETERMINADO GRUPO SOCIAL</option>
						<option value="OPINION POLITICA" <% if (session.getAttribute("esf_motivo").equals("OPINION POLITICA")) { %> selected <% } %>>OPINION POLITICA</option>
						<option value="OTROS" <% if (session.getAttribute("esf_motivo").equals("OTROS")) { %> selected <% } %>>OTROS</option>
					</select>
				</td>
			</tr>
			<tr><td colspan="2">CUAL:</td><td colspan="2"><input type="text" name="motivo_otro_cual" value="<%= session.getAttribute("esf_motivo_otro_cual") %>" size="40" maxlength="40"></td></tr>	
			<tr><td colspan="2">PORQUE?</td><td colspan="2"><textarea name="motivo_porque" rows="5" cols="45"><%= session.getAttribute("esf_motivo_porque") %></textarea></td></tr>		
			<tr><td colspan="4">PREGUNTAS ADICIONALES:</td></tr>
			<tr><td colspan="4"><textarea name="social_otra_pregunta" rows="5" cols="100"><%= session.getAttribute("esf_otra_pregunta") %></textarea></tr>		
			<tr><td colspan="4">QUISIERA AGREGAR OTRA INFORMACION:</td></tr>
			<tr><td colspan="4"><textarea name="otra_informacion" rows="5" cols="100"><%= session.getAttribute("esf_otra_informacion") %></textarea></tr>		
			<tr><td colspan="4">RECOMENDACIONES:</td></tr>
			<tr><td colspan="4"><textarea name="recomendaciones" rows="5" cols="100"><%= session.getAttribute("esf_recomendaciones") %></textarea></td></tr>		
			<tr><td colspan="4"><input type="submit" class="butnTxt" value="Guardar" name="save"><input  type="reset" class="butnTxt" value="Reiniciar" name="reset"></td></tr>
		</table>
		<br>
	</details>
</form>
</fieldset>