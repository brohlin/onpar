<details>
<summary>Declaraci�n Jurada</summary>
<form action="sql_upd_solicitante.jsp" method="post" name="solicitante_upd">

	<input type="hidden" name="pre_lugar_de_trabajo" value="">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_solicitante_id") %>">

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">

<tr>
	<td align="left" valign="bottom" class="subHdrBlackTxt" nowrap><strong>I.  Datos Personales del Entrevistado</strong>
	<br>
	</td>
	<td valign="bottom" width="350" align="center">
	<br><span class="smRedTxt">* Obligatorio</span>
	</td>
</tr>


<tr>
	<td align="right"><span class="smRedTxt">*</span> Primer Nombre</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_primer_nombre" value="<%= session.getAttribute("temp_solicitante_pre_primer_nombre") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	 Segundo Nombre
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_segundo_nombre" value="<%= session.getAttribute("temp_solicitante_pre_segundo_nombre") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Apellido Paterno
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_apellido_paterno" value="<%= session.getAttribute("temp_solicitante_pre_apellido_paterno") %>" required="required" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	 Apellido Materno
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_apellido_materno" value="<%= session.getAttribute("temp_solicitante_pre_apellido_materno") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	 Direcci�n Actual
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_direccion_actual" value="<%= session.getAttribute("temp_solicitante_pre_direccion_actual") %>" size="50" maxlength="80">
	</td>
</tr>

<tr>
	<td align="right">
	 Tel�fono 1
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_telefono1" value="<%= session.getAttribute("temp_solicitante_pre_telefono1") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	 Tel�fono 2
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_telefono2" value="<%= session.getAttribute("temp_solicitante_pre_telefono2") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right"><span class="smRedTxt">*</span> G�nero
	</td>
	<td>
		<select name="pre_genero_lkup" size="1">
		<option value=""></option>
		<option value="Masculino"<% if (session.getAttribute("temp_solicitante_pre_genero_lkup").equals("Masculino")) {%> selected <% } %>>Masculino</option>
		<option value="Feminino" <% if (session.getAttribute("temp_solicitante_pre_genero_lkup").equals("Feminino")) {%> selected <% } %>>Feminino</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	 Nombre de Padre
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_nombre_padre" value="<%= session.getAttribute("temp_solicitante_pre_nombre_padre") %>" size="60" maxlength="80">
	</td>
</tr>

<tr>
	<td align="right">
	 Nombre de Madre
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_nombre_madre" value="<%= session.getAttribute("temp_solicitante_pre_nombre_madre") %>" size="60" maxlength="80">
	</td>
</tr>

<tr>
	<td align="right">Necesita Interprete
	</td>
	<td>
		<select name="pre_necesidad_interprete_lkup" size="1">
		<option value=""></option>
		<option value="S�"<% if (session.getAttribute("temp_solicitante_pre_necesidad_interprete_lkup").equals("S�")) {%> selected <% } %>>S�</option>
		<option value="No"<% if (session.getAttribute("temp_solicitante_pre_necesidad_interprete_lkup").equals("No")) {%> selected <% } %>>No</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Pa�s de Origen
	</td>
	<td><select name="pre_pais_de_origen_lkup" tabindex="<%= mCounter++ %>" required="required" size="1">
		<jsp:include page="pais_de_origen_lkup.jsp" />
		</select>
	</td>
</tr>


<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>II.  Datos de Nacimiento</strong>
	<br>
	</td>
</tr>
<tr>
	<td align="right">Pa�s
	</td>
	<td><select name="pre_pais_de_nacimiento_lkup" tabindex="<%= mCounter++ %>" size="1">
			<jsp:include page="pais_lkup.jsp" />
		</select>
	</td>
</tr>
<tr>
	<td align="right">
	 Ciudad
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_ciudad_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_pre_ciudad_de_nacimiento") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha de Nacimiento
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_de_nacimiento" value="<%= session.getAttribute("temp_solicitante_pre_fecha_de_nacimiento") %>" required="required" >
	</td>
</tr>

<tr>
	<td align="right">Nacionalidad
	</td>
	<td><select name="pre_nacionalidad_lkup" tabindex="<%= mCounter++ %>" size="1">
			<jsp:include page="nacionalidad_lkup.jsp" />
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	Otra Nacionalidad
	</td>
	<td><select name="pre_otra_nacionalidad_lkup" tabindex="<%= mCounter++ %>" size="1">
			<jsp:include page="otra_nacionalidad_lkup.jsp" />
		</select>
	</td>
</tr>


<tr>
	<td align="right">
	 Grupo �tnico o Tribu
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_etnico_o_tribu" value="<%= session.getAttribute("temp_solicitante_pre_etnico_o_tribu") %>" size="30" maxlength="40">
	</td>
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>III.  Se�ale la identificaci�n y n�mero que porta</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right">
	 Pasaporte No.
	</td>
	<td>
		<input type="hidden" name="pre_typo_identificacion1_lkup" value="Pasaporte">
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_identificacion1" value="<%= session.getAttribute("temp_solicitante_pre_identificacion1") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="right">
	 Documento de identficaci�n de su pa�s (c�dula)
	</td>
	<td>
		<input type="hidden" name="pre_typo_identificacion2_lkup" value="C�dula">
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_identificacion2" value="<%= session.getAttribute("temp_solicitante_pre_identificacion2") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="right">
	 Carnet de Conducir
	</td>
	<td>
		<input type="hidden" name="pre_typo_identificacion3_lkup" value="Carnet de Conducir">
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_identificacion3" value="<%= session.getAttribute("temp_solicitante_pre_identificacion3") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="right">
	 Pasado Judicial
	</td>
	<td>
		<input type="hidden" name="pre_typo_identificacion4_lkup" value="Pasado Judicial">
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_identificacion4" value="<%= session.getAttribute("temp_solicitante_pre_identificacion4") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="right">
	 Otro
	</td>
	<td>
		<input type="hidden" name="pre_typo_identificacion5_lkup" value="Otro">
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_identificacion5" value="<%= session.getAttribute("temp_solicitante_pre_identificacion5") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>IV.  Datos de Educaci�n y Formaci�n Acad�micos</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right" nowrap>
	 Nivel Primario
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_nivel_primario" value="<%= session.getAttribute("temp_solicitante_pre_educ_nivel_primario") %>" size="15" maxlength="40">
	</td>
	<td nowrap>
		Colegio
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_primario_nombre" value="<%= session.getAttribute("temp_solicitante_pre_educ_primario_nombre") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 Nivel Secundario
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_nivel_secundario" value="<%= session.getAttribute("temp_solicitante_pre_educ_nivel_secundario") %>" size="15" maxlength="40">
	</td>
	<td nowrap>
		Colegio
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_secundario_nombre" value="<%= session.getAttribute("temp_solicitante_pre_educ_secundario_nombre") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 Universitario
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_universitario" value="<%= session.getAttribute("temp_solicitante_pre_educ_universitario") %>" size="15" maxlength="40">
	</td>
	<td nowrap>
		Universidad
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_universidad_nombre" value="<%= session.getAttribute("temp_solicitante_pre_educ_universidad_nombre") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right"  nowrap>
	 Otros
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_educ_otros" value="<%= session.getAttribute("temp_solicitante_pre_educ_otros") %>" size="30" maxlength="40">
	</td>	
</tr>

<tr>
	<td align="right">
	 Idioma que habla o comprende
	</td>
	<td>
		<select name="pre_idioma_lkup" tabindex="<%= mCounter++ %>" size="1">
		<option value=""></option>
		<jsp:include page="idioma_lkup.jsp" />
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	 Religi�n que practica
	</td>
	<td>
		<select name="pre_religion_lkup" tabindex="<%= mCounter++ %>" size="1">
		<option value=""></option>
		<jsp:include page="religion_lkup.jsp" />
		</select>
	</td>
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>V.  Datos Laborales y Profesionales</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right" nowrap>
	 �Cual es su Profesi�n?
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_profesion" value="<%= session.getAttribute("temp_solicitante_pre_profesion") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 �Cual era su ocupaci�n en su pa�s de origen?
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_ocup_pais_de_origen" value="<%= session.getAttribute("temp_solicitante_pre_ocup_pais_de_origen") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 �Cual era su ingreso mensual?
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_ingreso_mensual_pais_de_origen" value="<%= session.getAttribute("temp_solicitante_pre_ingreso_mensual_pais_de_origen") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt" nowrap><strong>VI.  Se�ale con una X los Datos referente a su Estado Civil y Grupo familiar</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right">Estado Civil
	</td>
	<td>
		<select name="pre_estatus_civil_lkup" size="1">
		<option value=""></option>
		<option value="Casado"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("Casado")) {%> selected <% } %>>Casado(a)</option>
		<option value="Divorciado"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("Divorciado")) {%> selected <% } %>>Divorciado(a)</option>
		<option value="En Uni�n Libre"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("En Uni�n Libre")) {%> selected <% } %>>En Uni�n Libre</option>
		<option value="Separado"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("Separado")) {%> selected <% } %>>Separado(a)</option>
		<option value="Soltero"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("Soltero")) {%> selected <% } %>>Soltero(a)</option>
		<option value="Viudo"<% if (session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").equals("Viudo")) {%> selected <% } %>>Viudo(a)</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right" nowrap>
	 Nombre de su c�nyuge o compa�ero
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_nombre_conyuge" value="<%= session.getAttribute("temp_solicitante_pre_nombre_conyuge") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 Edad de su c�nyuge o compa�ero
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_edad_conyuge" value="<%= session.getAttribute("temp_solicitante_pre_edad_conyuge") %>" size="30" maxlength="40">		
	</td>	
</tr>

<tr>
	<td align="right" nowrap>
	 Ubicaci�n Actual
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_ubic_actual_conyuge" value="<%= session.getAttribute("temp_solicitante_pre_ubic_actual_conyuge") %>" size="60" maxlength="80">		
	</td>	
</tr>
<br>
<tr>
	<td align="left">�Ha recibido usted ayuda o protecci�n de alguna Organizaci�n Non-Gubernamental (ONG)? Detalle el nombre, la ayuda y la fecha de dicha ayuda. 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_ayuda_de_ong" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_ayuda_de_ong") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>VII.  Grupo familiar b�sico, Esposa e hijos, padres ancianos que convivan o dependan de usted (es importante que usted incluya a todos sus dependientes para efecto del derecho a la reunificaci�n familiar).</strong>
	<br>	
	</td>
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2">
	<br>
	Ingresan los miembros de la familia en la pr�xima secci�n debajo de "Miembros de la familia".
	<br>
	<br>	
	</td>
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>VIII.  �Qu� familiares permanecen en su pa�s de origen?</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="left">Se encuentran sus familiares en situaci�n de riesgo explique 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_fam_en_riesgo" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_fam_en_riesgo") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>IX.  Situaci�n Econ�mica, Social y de Salud</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right">
	 Situaci�n Econ�mica
	</td>
	<td>
		<select name="pre_situ_econ_lkup" size="1">
		<option value=""></option>
		<option value="Buena"<% if (session.getAttribute("temp_solicitante_pre_situ_econ_lkup").equals("Buena")) {%> selected <% } %>>Buena</option>
		<option value="Regular"<% if (session.getAttribute("temp_solicitante_pre_situ_econ_lkup").equals("Regular")) {%> selected <% } %>>Regular</option>
		<option value="P�sima"<% if (session.getAttribute("temp_solicitante_pre_situ_econ_lkup").equals("P�sima")) {%> selected <% } %>>P�sima</option>
		</select>
	</td>
</tr>

<tr>
	<td align="left">Detalle si existe alguna situaci�n especial de salud respecto a usted o su familieares 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_situ_salud" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_situ_salud") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">Explique donde se encuentra usted, radicado actualmente en Panam� 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_radicado_en_pan" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_radicado_en_pan") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>X.  Ruta de llegada, y otros datos de importancia.</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="left">�Cual fue la ruta exacta o el recorrido realizado por usted desde que sali� de su pa�s de origen o residencia? 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_ruta_de_llegada" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_ruta_de_llegada") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">�Explique si en su recorrido usted solicit� Protecci�n Internacional en algunos de los pa�ses que visit�, explique el pa�s donde solicit� esta ayuda y la desici�n tomada? 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_proteccion_pedido_otro_pais" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_proteccion_pedido_otro_pais") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="right">
	 Medio de transported utilizado:
	</td>
	<td>
		<select name="pre_transporte_util_lkup" size="1">
		<option value=""></option>
		<option value="Avi�n"<% if (session.getAttribute("temp_solicitante_pre_transporte_util_lkup").equals("Avi�n")) {%> selected <% } %>>Avi�n</option>
		<option value="Transporte terrestre"<% if (session.getAttribute("temp_solicitante_pre_transporte_util_lkup").equals("Transporte terrestre")) {%> selected <% } %>>Transporte terrestre</option>
		<option value="Transporte mar�timo"<% if (session.getAttribute("temp_solicitante_pre_transporte_util_lkup").equals("Transporte mar�timo")) {%> selected <% } %>>Transporte mar�timo</option>
		</select>
	</td>
</tr>



<tr>
	<td align="right" nowrap>
	 Nombre de las nave y bandera
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_nombre_de_nave_y_bandera" value="<%= session.getAttribute("temp_solicitante_pre_nombre_de_nave_y_bandera") %>" size="60" maxlength="80">		
	</td>	
</tr>

<tr>
	<td align="right">
	 Mencione alguna persona o entidad que lo haya ayudado a salir de su Pa�s
	</td>
	<td>
		<select name="pre_mencione_alguna_haya_ayudado_lkup" size="1">
		<option value=""></option>
		<option value="S�"<% if (session.getAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado_lkup").equals("S�")) {%> selected <% } %>>S�</option>
		<option value="No"<% if (session.getAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado_lkup").equals("No")) {%> selected <% } %>>No</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right" nowrap>
	 Detalle
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_mencione_alguna_haya_ayudado" value="<%= session.getAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado") %>" size="60" maxlength="80">		
	</td>	
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha en que sali� de su pa�s de origen
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_de_salida_origen" value="<%= session.getAttribute("temp_solicitante_pre_fecha_de_salida_origen") %>" required="required">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha en que ingres� a la Rep�blica de Panam�
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_llegada_panama" value="<%= session.getAttribute("temp_solicitante_pre_fecha_llegada_panama") %>" required="required">
	</td>
</tr>

<tr>
	<td align="left">Tiene usted familiares en Panam�, detalle nombre y datos de estos. 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_familiares_en_pan" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_familiares_en_pan") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">Hab�a usted ingresado anteriormente a territorio paname�o fecha y motivo 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_ha_estado_en_pan_antes" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_ha_estado_en_pan_antes") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>XI.  Motivo(s) de persecuci�n.</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right">
	 Motivo(s) de persecuci�n
	</td>
	<td>
		<select name="pre_motivo_de_persecucion_lkup" size="1">
		<option value=""></option>
		<option value="Religi�n"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("Religi�n")) {%> selected <% } %>>Religi�n</option>
		<option value="Raza"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("Raza")) {%> selected <% } %>>Raza</option>
		<option value="G�nero"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("G�nero")) {%> selected <% } %>>G�nero</option>
		<option value="Petenencia a un determinado grupo social"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("Petenencia a un determinado grupo social")) {%> selected <% } %>>Petenencia a un determinado grupo social</option>
		<option value="Opiniones Pol�ticas"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("Opiniones Pol�ticas")) {%> selected <% } %>>Opiniones Pol�ticas</option>
		<option value="Orientaci�n Sexual"<% if (session.getAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup").equals("Orientaci�n Sexual")) {%> selected <% } %>>Orientaci�n Sexual</option>
		</select>
	</td>
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>XII.  Identificaci�n del agente de Persecuci�n.</strong>
	<br>
	</td>
</tr>

<tr>
	<td align="right">
	 Identificaci�n del agente de Persecuci�n
	</td>
	<td>
		<select name="pre_ident_agent_persecucion_lkup" size="1">
		<option value=""></option>
		<option value="Persona"<% if (session.getAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup").equals("Persona")) {%> selected <% } %>>Persona</option>
		<option value="Grupo"<% if (session.getAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup").equals("Grupo")) {%> selected <% } %>>Grupo</option>
		<option value="Autoridad Gubernamental"<% if (session.getAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup").equals("Autoridad Gubernamental")) {%> selected <% } %>>Autoridad Gubernamental</option>
		<option value="Delincuencia com�n"<% if (session.getAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup").equals("Delincuencia com�n")) {%> selected <% } %>>Delincuencia com�n</option>		
		</select>
	</td>
</tr>

<tr>
	<td align="right" nowrap>
	 Explique
	</td>
	<td nowrap>
		<input type="text" tabindex="<%= mCounter++ %>" name="pre_ident_agent_persecucion_expl" value="<%= session.getAttribute("temp_solicitante_pre_ident_agent_persecucion_expl") %>" size="60" maxlength="80">		
	</td>	
</tr>

<tr>
	<td align="left">Indique cualquier organizaci�n pol�itica, militar, religiosa, �tnica, social, Derechos Humanos o d g�nero, a la que pertenezca usted o alg�n miembro de su familia, o a la que hayan pertenecido o colaborado en el pasado, y en su pa�s de origen. 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_org_pertenecidos" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_org_pertenecidos") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">Describir brevemente en detalles, sus responsabilidades o actividades en las organizaci�n a la que perteneci�
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_org_pertenecidos_desc" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_org_pertenecidos_desc") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="right">
	�Ha sido usted detenido, arrestado o condenado alguna vez?
	</td>
	<td>
		<select name="pre_arrestado_condenado_lkup" size="1">
		<option value=""></option>
		<option value="S�"<% if (session.getAttribute("temp_solicitante_pre_arrestado_condenado_lkup").equals("S�")) {%> selected <% } %>>S�</option>
		<option value="No"<% if (session.getAttribute("temp_solicitante_pre_arrestado_condenado_lkup").equals("No")) {%> selected <% } %>>No</option>
		</select>
	</td>
</tr>

<tr>
	<td align="left">Indicar los motivos, fechas, tiempos de encarcelamiento y lugares 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_arrestado_condenado_desc" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_arrestado_condenado_desc") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="right">
	 Participo usted directa o indirectamente en hechos de violencias f�sica o armado
	</td>
	<td>
		<select name="pre_violencia_fisica_armado_lkup" size="1">
		<option value=""></option>
		<option value="S�"<% if (session.getAttribute("temp_solicitante_pre_violencia_fisica_armado_lkup").equals("S�")) {%> selected <% } %>>S�</option>
		<option value="No"<% if (session.getAttribute("temp_solicitante_pre_violencia_fisica_armado_lkup").equals("No")) {%> selected <% } %>>No</option>
		</select>
	</td>
</tr>

<tr>
	<td align="left">Detalle lugares y fechas: 
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_violencia_fisica_armado_desc" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_violencia_fisica_armado_desc") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">�C�mo justifica usted, que sali� legalmente de su pa�s si usted afirma ser perseguido por las autoridades?
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_justifica_legal" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_justifica_legal") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="right">
	 �Le permitir�an las autoridades de su pa�s regresar? Si el problema no es con las autoridades.
	</td>
	<td>
		<select name="pre_permitido_regresar_al_pais_lkup" size="1">
		<option value=""></option>
		<option value="S�"<% if (session.getAttribute("temp_solicitante_pre_permitido_regresar_al_pais_lkup").equals("S�")) {%> selected <% } %>>S�</option>
		<option value="No"<% if (session.getAttribute("temp_solicitante_pre_permitido_regresar_al_pais_lkup").equals("No")) {%> selected <% } %>>No</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	 De que forma usted, piensa que podr�a ser afectado(a) si regresa a su pa�s de origen
	</td>
	<td>
		<select name="pre_forma_afectado_al_regresar_lkup" size="1">
		<option value=""></option>
		<option value="Peligra mi libertad"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Peligra mi libertad")) {%> selected <% } %>>Peligra mi libertad</option>
		<option value="Peligra mi seguridad personal e integridad f�sica"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Peligra mi seguridad personal e integridad f�sica")) {%> selected <% } %>>Peligra mi seguridad personal e integridad f�sica</option>
		<option value="Peligra mi vida"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Peligra mi vida")) {%> selected <% } %>>Peligra mi vida</option>
		<option value="Coloco en situaci�n de riesgo a mi familia"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Coloco en situaci�n de riesgo a mi familia")) {%> selected <% } %>>Coloco en situaci�n de riesgo a mi familia</option>
		<option value="Tendr�a que afrontar un juicio"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Tendr�a que afrontar un juicio")) {%> selected <% } %>>Tendr�a que afrontar un juicio</option>
		<option value="Tendr�a que cumplir una condena"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Tendr�a que cumplir una condena")) {%> selected <% } %>>Tendr�a que cumplir una condena</option>
		<option value="Otra"<% if (session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup").equals("Otra")) {%> selected <% } %>>Otra</option>
		</select>
	</td>
</tr>

<tr>
	<td align="left">Otra (detallar)
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_forma_afectado_al_regresar_desc" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_forma_afectado_al_regresar_desc") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left">Detallar que situaciones o hechos deben de ocurrir para que usted, pueda regresar a su pa�s
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_hechos_para_regresar" cols="50" rows="4" maxlength="200"><%= session.getAttribute("temp_solicitante_pre_hechos_para_regresar") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="left" valign="bottom" colspan="2" class="subHdrBlackTxt"><strong>FUNDADO TEMOR</strong>
	<br>
	</td>
</tr>
<tr>
	<td align="left" valign="top"><span class="smRedTxt">*</span> Los hechos que justifican su temor y que lo forzaron a salir de su pa�s, explique en detalle con fechas y nombres, desde el momento en que se iniciaron las causas de persecuci�n.
	</td>
	<td>
		<textarea tabindex="<%= mCounter++ %>" name="pre_fundado_temor" cols="50" rows="20" maxlength="2000" required="required"><%= session.getAttribute("temp_solicitante_pre_fundado_temor") %></textarea>		
	</td>	
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha de presentaci�n a ONPAR
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_solicitud_onpar" value="<%= session.getAttribute("temp_solicitante_pre_fecha_solicitud_onpar") %>" required="required">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha de entrevista legal
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_entrevista_legal" value="<%= session.getAttribute("temp_solicitante_pre_fecha_entrevista_legal") %>" required="required">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Fecha de entrevista social
	</td>
	<td>
		<input type="date" tabindex="<%= mCounter++ %>" name="pre_fecha_entrevista_social"  value="<%= session.getAttribute("temp_solicitante_pre_fecha_entrevista_social") %>" required="required">
	</td>
</tr>

<!--- Submit/cancel. --->
<tr>
	<td>&nbsp;</td>
	<td valign="middle">

	<!--- Save button --->
	<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save" onclick="return confirm('�Est� seguro que quiere guardar este formulario?');">

	<!--- Cancel button --->
	<input tabindex="<%= mCounter++ %>" type="reset" class="butnTxt" value="Reiniciar" name="reset">
	</td>
</tr>
</table>
</form>
</details>
