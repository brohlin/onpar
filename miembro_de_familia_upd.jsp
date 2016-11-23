<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
%> 


<form action="sql_upd_miembro_de_familia.jsp" method="post" name="upd_familia">
	<input type="hidden" name="solicitante_id" value="<%= session.getAttribute("temp_solicitante_id").toString() %>">

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
<tr>
	<td valign="top" colspan="2" width="270" class="hdrBlackTxt">
	Miembro de Familia
	</td>
</tr>

<tr>
	<td colspan="2">			
	Utilice este forumulario para editar la infomaci�n de un miembro de la familia de un solicitante.
	</td>
</tr>
<tr>
	<td align="left" valign="top" class="subHdrBlackTxt" nowrap>
	<br>
	</td>
	<td valign="bottom" width="350" align="center">
	<br><span class="smRedTxt">* Obligatorio</span>
	</td>
</tr>


<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Nombre
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="nombre" value="<%= session.getAttribute("temp_familia_nombre").toString() %>" required="required" size="30" maxlength="45">
	</td>
</tr>


<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Edad
	</td>
	<td>
		<input type="number"  min="0" max="125" tabindex="<%= mCounter++ %>" name="edad" value="<%= session.getAttribute("temp_familia_edad").toString() %>" required="required" size="30" maxlength="45">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Parentesco
	</td>
	<td>
<%
	String mParentesco_lkup = "";
	try {
		mParentesco_lkup = session.getAttribute("temp_familia_parentesco_lkup").toString();
	} catch (Exception ex) {
		// catch the error and keep on going
	}		 
%>	
		<select name="parentesco_lkup" tabindex="<%= mCounter++ %>" required="required" size="1">
		<option value="Hijo(a)" <% if (mParentesco_lkup.equals("Hijo(a)")) {%> selected <% } %>>Hijo(a)</option>
		<option value="Esposo(a)" <% if (mParentesco_lkup.equals("Esposo(a)")) {%> selected <% } %>>Esposa(a)</option>
		<option value="Madre" <% if (mParentesco_lkup.equals("Madre")) {%> selected <% } %>>Madre</option>
		<option value="Padre" <% if (mParentesco_lkup.equals("Padre")) {%> selected <% } %>>Padre</option>
		<option value="Abuelo(a)" <% if (mParentesco_lkup.equals("Abuelo(a)")) {%> selected <% } %>>Abuelo(a)</option>
		<option value="Otro(a)" <% if (mParentesco_lkup.equals("Otro(a)")) {%> selected <% } %>>Otro(a)</option>
		</select>
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Ubicaci�n
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="ubicacion" value="<%= session.getAttribute("temp_familia_ubicacion").toString() %>" required="required" size="30" maxlength="45">
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Pa�s
	</td>
	<td>
<%
	String mPais = "";
	try {
		mPais = session.getAttribute("temp_familia_pais_lkup").toString();
	} catch (Exception ex) {
		// catch the error and keep on going
	}		 
%>
	<select name="pais_lkup" tabindex="<%= mCounter++ %>" required="required" size="1">
		<option value="Afganist�n"<% if (mPais.equals("Afganist�n")) {%> selected <% } %>>Afganist�n</option>
		<option value="Albania"<% if (mPais.equals("Albania")) {%> selected <% } %>>Albania</option>
		<option value="Alemania"<% if (mPais.equals("Alemania")) {%> selected <% } %>>Alemania</option>
		<option value="Andorra"<% if (mPais.equals("Andorra")) {%> selected <% } %>>Andorra</option>
		<option value="Anguila"<% if (mPais.equals("Anguila")) {%> selected <% } %>>Anguila</option>
		<option value="Angola"<% if (mPais.equals("Angola")) {%> selected <% } %>>Angola</option>
		<option value="Antigua y Barbuda"<% if (mPais.equals("Antigua y Barbuda")) {%> selected <% } %>>Antigua y Barbuda</option>
		<option value="Antillas Holandesas"<% if (mPais.equals("Antillas Holandesas")) {%> selected <% } %>>Antillas Holandesas</option>
		<option value="Arabia Saudita"<% if (mPais.equals("Arabia Saudita")) {%> selected <% } %>>Arabia Saudita</option>
		<option value="Argelia"<% if (mPais.equals("Argelia")) {%> selected <% } %>>Argelia</option>
		<option value="Argentina"<% if (mPais.equals("Argentina")) {%> selected <% } %>>Argentina</option>
		<option value="Aruba"<% if (mPais.equals("Aruba")) {%> selected <% } %>>Aruba</option>
		<option value="Australia"<% if (mPais.equals("Australia")) {%> selected <% } %>>Australia</option>
		<option value="Austria"<% if (mPais.equals("Austria")) {%> selected <% } %>>Austria</option>
		<option value="Bahamas"<% if (mPais.equals("Bahamas")) {%> selected <% } %>>Bahamas</option>
		<option value="Banglad�s/Bangladesh"<% if (mPais.equals("Banglad�s/Bangladesh")) {%> selected <% } %>>Banglad�s/Bangladesh</option>
		<option value="Barbados"<% if (mPais.equals("Barbados")) {%> selected <% } %>>Barbados</option>
		<option value="Barbuda"<% if (mPais.equals("Barbuda")) {%> selected <% } %>>Barbuda</option>
		<option value="B�lgica"<% if (mPais.equals("B�lgica")) {%> selected <% } %>>B�lgica</option>
		<option value="Belice"<% if (mPais.equals("Belice")) {%> selected <% } %>>Belice</option>
		<option value="Ben�n"<% if (mPais.equals("Ben�n")) {%> selected <% } %>>Ben�n</option>
		<option value="Birmania"<% if (mPais.equals("Birmania")) {%> selected <% } %>>Birmania</option>
		<option value="Bolivia"<% if (mPais.equals("Bolivia")) {%> selected <% } %>>Bolivia</option>
		<option value="Bonaire"<% if (mPais.equals("Bonaire")) {%> selected <% } %>>Bonaire</option>
		<option value="Botswana"<% if (mPais.equals("Botswana")) {%> selected <% } %>>Botswana</option>
		<option value="Brasil"<% if (mPais.equals("Brasil")) {%> selected <% } %>>Brasil</option>
		<option value="Bulgaria"<% if (mPais.equals("Bulgaria")) {%> selected <% } %>>Bulgaria</option>
		<option value="Burkina Faso"<% if (mPais.equals("Burkina Faso")) {%> selected <% } %>>Burkina Faso</option>
		<option value="Camboya"<% if (mPais.equals("Camboya")) {%> selected <% } %>>Camboya</option>
		<option value="Camer�n"<% if (mPais.equals("Camer�n")) {%> selected <% } %>>Camer�n</option>
		<option value="Canad�"<% if (mPais.equals("Canad�")) {%> selected <% } %>>Canad�</option>
		<option value="Ceil�n"<% if (mPais.equals("Ceil�n")) {%> selected <% } %>>Ceil�n</option>
		<option value="Chad"<% if (mPais.equals("Chad")) {%> selected <% } %>>Chad</option>
		<option value="Chile"<% if (mPais.equals("Chile")) {%> selected <% } %>>Chile</option>
		<option value="China"<% if (mPais.equals("China")) {%> selected <% } %>>China</option>
		<option value="Chipre"<% if (mPais.equals("Chipre")) {%> selected <% } %>>Chipre</option>
		<option value="Colombia"<% if (mPais.equals("Colombia")) {%> selected <% } %>>Colombia</option>
		<option value="Congo"<% if (mPais.equals("Congo")) {%> selected <% } %>>Congo</option>
		<option value="Corea del Norte"<% if (mPais.equals("Corea del Norte")) {%> selected <% } %>>Corea del Norte</option>
		<option value="Corea del Sur"<% if (mPais.equals("Corea del Sur")) {%> selected <% } %>>Corea del Sur</option>
		<option value="Costa de Marfil"<% if (mPais.equals("Costa de Marfil")) {%> selected <% } %>>Costa de Marfil</option>
		<option value="Costa Rica"<% if (mPais.equals("Costa Rica")) {%> selected <% } %>>Costa Rica</option>
		<option value="Croacia"<% if (mPais.equals("Croacia")) {%> selected <% } %>>Croacia</option>
		<option value="Cuba"<% if (mPais.equals("Cuba")) {%> selected <% } %>>Cuba</option>
		<option value="Curazao"<% if (mPais.equals("Curazao")) {%> selected <% } %>>Curazao</option>
		<option value="Dinamarca"<% if (mPais.equals("Dinamarca")) {%> selected <% } %>>Dinamarca</option>
		<option value="Dominica"<% if (mPais.equals("Dominica")) {%> selected <% } %>>Dominica</option>
		<option value="Dubai"<% if (mPais.equals("Dubai")) {%> selected <% } %>>Dubai</option>
		<option value="Ecuador"<% if (mPais.equals("Ecuador")) {%> selected <% } %>>Ecuador</option>
		<option value="Egipto"<% if (mPais.equals("Egipto")) {%> selected <% } %>>Egipto</option>
		<option value="El Salvador"<% if (mPais.equals("El Salvador")) {%> selected <% } %>>El Salvador</option>
		<option value="Escocia"<% if (mPais.equals("Escocia")) {%> selected <% } %>>Escocia</option>
		<option value="Eslovaquia"<% if (mPais.equals("Eslovaquia")) {%> selected <% } %>>Eslovaquia</option>
		<option value="Espa�a"<% if (mPais.equals("Espa�a")) {%> selected <% } %>>Espa�a</option>
		<option value="Estados Unidos"<% if (mPais.equals("Estados Unidos")) {%> selected <% } %>>Estados Unidos</option>
		<option value="Etiop�a"<% if (mPais.equals("Etiop�a")) {%> selected <% } %>>Etiop�a</option>
		<option value="Filipinas"<% if (mPais.equals("Filipinas")) {%> selected <% } %>>Filipinas</option>
		<option value="Finlandia"<% if (mPais.equals("Finlandia")) {%> selected <% } %>>Finlandia</option>
		<option value="Francia"<% if (mPais.equals("Francia")) {%> selected <% } %>>Francia</option>
		<option value="Gab�n"<% if (mPais.equals("Gab�n")) {%> selected <% } %>>Gab�n</option>
		<option value="Gales"<% if (mPais.equals("Gales")) {%> selected <% } %>>Gales</option>
		<option value="Gambia"<% if (mPais.equals("Gambia")) {%> selected <% } %>>Gambia</option>
		<option value="Ghana"<% if (mPais.equals("Ghana")) {%> selected <% } %>>Ghana</option>
		<option value="Gran Breta�a"<% if (mPais.equals("Gran Breta�a")) {%> selected <% } %>>Gran Breta�a</option>
		<option value="Granada"<% if (mPais.equals("Granada")) {%> selected <% } %>>Granada</option>
		<option value="Grecia"<% if (mPais.equals("Grecia")) {%> selected <% } %>>Grecia</option>
		<option value="Guadalupe"<% if (mPais.equals("Guadalupe")) {%> selected <% } %>>Guadalupe</option>
		<option value="Guam"<% if (mPais.equals("Guam")) {%> selected <% } %>>Guam</option>
		<option value="Guatemala"<% if (mPais.equals("Guatemala")) {%> selected <% } %>>Guatemala</option>
		<option value="Guinea"<% if (mPais.equals("Guinea")) {%> selected <% } %>>Guinea</option>
		<option value="Guinea Ecuatorial"<% if (mPais.equals("Guinea Ecuatorial")) {%> selected <% } %>>Guinea Ecuatorial</option>
		<option value="Guinea-Bissau"<% if (mPais.equals("Guinea-Bissau")) {%> selected <% } %>>Guinea-Bissau</option>
		<option value="Guyana"<% if (mPais.equals("Guyana")) {%> selected <% } %>>Guyana</option>
		<option value="Hait�"<% if (mPais.equals("Hait�")) {%> selected <% } %>>Hait�</option>
		<option value="Hawaii"<% if (mPais.equals("Hawaii")) {%> selected <% } %>>Hawaii</option>
		<option value="Holanda"<% if (mPais.equals("Holanda")) {%> selected <% } %>>Holanda</option>
		<option value="Honduras"<% if (mPais.equals("Honduras")) {%> selected <% } %>>Honduras</option>
		<option value="India"<% if (mPais.equals("India")) {%> selected <% } %>>India</option>
		<option value="Indonesia"<% if (mPais.equals("Indonesia")) {%> selected <% } %>>Indonesia</option>
		<option value="Inglaterra"<% if (mPais.equals("Inglaterra")) {%> selected <% } %>>Inglaterra</option>
		<option value="Irak, Iraq"<% if (mPais.equals("Irak, Iraq")) {%> selected <% } %>>Irak, Iraq</option>
		<option value="Ir�n"<% if (mPais.equals("Ir�n")) {%> selected <% } %>>Ir�n</option>
		<option value="Irlanda"<% if (mPais.equals("Irlanda")) {%> selected <% } %>>Irlanda</option>
		<option value="Islandia"<% if (mPais.equals("Islandia")) {%> selected <% } %>>Islandia</option>
		<option value="Islas Caim�n"<% if (mPais.equals("Islas Caim�n")) {%> selected <% } %>>Islas Caim�n</option>
		<option value="Islas Turcas y Caicos"<% if (mPais.equals("Islas Turcas y Caicos")) {%> selected <% } %>>Islas Turcas y Caicos</option>
		<option value="Islas V�rgenes Brit�nicas"<% if (mPais.equals("Islas V�rgenes Brit�nicas")) {%> selected <% } %>>Islas V�rgenes Brit�nicas</option>
		<option value="Islas V�rgenes de Estados Unidos"<% if (mPais.equals("Islas V�rgenes de Estados Unidos")) {%> selected <% } %>>Islas V�rgenes de Estados Unidos</option>
		<option value="Israel"<% if (mPais.equals("Israel")) {%> selected <% } %>>Israel</option>
		<option value="Italia"<% if (mPais.equals("Italia")) {%> selected <% } %>>Italia</option>
		<option value="Jamaica"<% if (mPais.equals("Jamaica")) {%> selected <% } %>>Jamaica</option>
		<option value="Jap�n"<% if (mPais.equals("Jap�n")) {%> selected <% } %>>Jap�n</option>
		<option value="Jordania"<% if (mPais.equals("Jordania")) {%> selected <% } %>>Jordania</option>
		<option value="Kenya"<% if (mPais.equals("Kenya")) {%> selected <% } %>>Kenya</option>
		<option value="Kuwait"<% if (mPais.equals("Kuwait")) {%> selected <% } %>>Kuwait</option>
		<option value="la Rep�blica Dominicana"<% if (mPais.equals("la Rep�blica Dominicana")) {%> selected <% } %>>la Rep�blica Dominicana</option>
		<option value="Laos"<% if (mPais.equals("Laos")) {%> selected <% } %>>Laos</option>
		<option value="las Islas Cook"<% if (mPais.equals("las Islas Cook")) {%> selected <% } %>>las Islas Cook</option>
		<option value="L�bano"<% if (mPais.equals("L�bano")) {%> selected <% } %>>L�bano</option>
		<option value="Liberia"<% if (mPais.equals("Liberia")) {%> selected <% } %>>Liberia</option>
		<option value="Libia"<% if (mPais.equals("Libia")) {%> selected <% } %>>Libia</option>
		<option value="Lituania"<% if (mPais.equals("Lituania")) {%> selected <% } %>>Lituania</option>
		<option value="Luxemburgo"<% if (mPais.equals("Luxemburgo")) {%> selected <% } %>>Luxemburgo</option>
		<option value="Malasia"<% if (mPais.equals("Malasia")) {%> selected <% } %>>Malasia</option>
		<option value="Mali"<% if (mPais.equals("Mali")) {%> selected <% } %>>Mali</option>
		<option value="Malta"<% if (mPais.equals("Malta")) {%> selected <% } %>>Malta</option>
		<option value="Marruecos"<% if (mPais.equals("Marruecos")) {%> selected <% } %>>Marruecos</option>
		<option value="Martinique"<% if (mPais.equals("Martinique")) {%> selected <% } %>>Martinique</option>
		<option value="Mauricio"<% if (mPais.equals("Mauricio")) {%> selected <% } %>>Mauricio</option>
		<option value="Mauritania"<% if (mPais.equals("Mauritania")) {%> selected <% } %>>Mauritania</option>
		<option value="M�xico, M�jico"<% if (mPais.equals("M�xico, M�jico")) {%> selected <% } %>>M�xico, M�jico</option>
		<option value="M�naco"<% if (mPais.equals("M�naco")) {%> selected <% } %>>M�naco</option>
		<option value="Montserrat"<% if (mPais.equals("Montserrat")) {%> selected <% } %>>Montserrat</option>
		<option value="Nepal"<% if (mPais.equals("Nepal")) {%> selected <% } %>>Nepal</option>
		<option value="Nicaragua"<% if (mPais.equals("Nicaragua")) {%> selected <% } %>>Nicaragua</option>
		<option value="Niger"<% if (mPais.equals("Niger")) {%> selected <% } %>>Niger</option>
		<option value="Nigeria"<% if (mPais.equals("Nigeria")) {%> selected <% } %>>Nigeria</option>
		<option value="Noruega"<% if (mPais.equals("Noruega")) {%> selected <% } %>>Noruega</option>
		<option value="Nueva Zelanda"<% if (mPais.equals("Nueva Zelanda")) {%> selected <% } %>>Nueva Zelanda</option>
		<option value="Pa�ses Bajos"<% if (mPais.equals("Pa�ses Bajos")) {%> selected <% } %>>Pa�ses Bajos</option>
		<option value="Palestina"<% if (mPais.equals("Palestina")) {%> selected <% } %>>Palestina</option>
		<option value="Panam�"<% if (mPais.equals("Panam�")) {%> selected <% } %>>Panam�</option>
		<option value="Paquist�n"<% if (mPais.equals("Paquist�n")) {%> selected <% } %>>Paquist�n</option>
		<option value="Paraguay"<% if (mPais.equals("Paraguay")) {%> selected <% } %>>Paraguay</option>
		<option value="Persia"<% if (mPais.equals("Persia")) {%> selected <% } %>>Persia</option>
		<option value="Per�"<% if (mPais.equals("Per�")) {%> selected <% } %>>Per�</option>
		<option value="Polonia"<% if (mPais.equals("Polonia")) {%> selected <% } %>>Polonia</option>
		<option value="Portugal"<% if (mPais.equals("Portugal")) {%> selected <% } %>>Portugal</option>
		<option value="Puerto Rico"<% if (mPais.equals("Puerto Rico")) {%> selected <% } %>>Puerto Rico</option>
		<option value="Rep�blica Checa"<% if (mPais.equals("Rep�blica Checa")) {%> selected <% } %>>Rep�blica Checa</option>
		<option value="Ruanda"<% if (mPais.equals("Ruanda")) {%> selected <% } %>>Ruanda</option>
		<option value="Ruman�a"<% if (mPais.equals("Ruman�a")) {%> selected <% } %>>Ruman�a</option>
		<option value="Rusia"<% if (mPais.equals("Rusia")) {%> selected <% } %>>Rusia</option>
		<option value="Saba"<% if (mPais.equals("Saba")) {%> selected <% } %>>Saba</option>
		<option value="Samoa"<% if (mPais.equals("Samoa")) {%> selected <% } %>>Samoa</option>
		<option value="San Bartolom�"<% if (mPais.equals("San Bartolom�")) {%> selected <% } %>>San Bartolom�</option>
		<option value="San Crist�bal y Nieves"<% if (mPais.equals("San Crist�bal y Nieves")) {%> selected <% } %>>San Crist�bal y Nieves</option>
		<option value="San Eustaquio"<% if (mPais.equals("San Eustaquio")) {%> selected <% } %>>San Eustaquio</option>
		<option value="San Mart�n"<% if (mPais.equals("San Mart�n")) {%> selected <% } %>>San Mart�n</option>
		<option value="San Vicente"<% if (mPais.equals("San Vicente")) {%> selected <% } %>>San Vicente</option>
		<option value="Santa Luc�a"<% if (mPais.equals("Santa Luc�a")) {%> selected <% } %>>Santa Luc�a</option>
		<option value="Santo Tom�s"<% if (mPais.equals("Santo Tom�s")) {%> selected <% } %>>Santo Tom�s</option>
		<option value="Senegal"<% if (mPais.equals("Senegal")) {%> selected <% } %>>Senegal</option>
		<option value="Sierra Leona"<% if (mPais.equals("Sierra Leona")) {%> selected <% } %>>Sierra Leona</option>
		<option value="Siria"<% if (mPais.equals("Siria")) {%> selected <% } %>>Siria</option>
		<option value="Somalia"<% if (mPais.equals("Somalia")) {%> selected <% } %>>Somalia</option>
		<option value="Sud�frica"<% if (mPais.equals("Sud�frica")) {%> selected <% } %>>Sud�frica</option>
		<option value="Sud�n"<% if (mPais.equals("Sud�n")) {%> selected <% } %>>Sud�n</option>
		<option value="Suecia"<% if (mPais.equals("Suecia")) {%> selected <% } %>>Suecia</option>
		<option value="Suiza"<% if (mPais.equals("Suiza")) {%> selected <% } %>>Suiza</option>
		<option value="Surinam"<% if (mPais.equals("Surinam")) {%> selected <% } %>>Surinam</option>
		<option value="Tailandia"<% if (mPais.equals("Tailandia")) {%> selected <% } %>>Tailandia</option>
		<option value="Taiw�n"<% if (mPais.equals("Taiw�n")) {%> selected <% } %>>Taiw�n</option>
		<option value="Tanzania"<% if (mPais.equals("Tanzania")) {%> selected <% } %>>Tanzania</option>
		<option value="Togo"<% if (mPais.equals("Togo")) {%> selected <% } %>>Togo</option>
		<option value="Trinidad y Tobago"<% if (mPais.equals("Trinidad y Tobago")) {%> selected <% } %>>Trinidad y Tobago</option>
		<option value="T�nez"<% if (mPais.equals("T�nez")) {%> selected <% } %>>T�nez</option>
		<option value="Turqu�a"<% if (mPais.equals("Turqu�a")) {%> selected <% } %>>Turqu�a</option>
		<option value="Ucrania"<% if (mPais.equals("Ucrania")) {%> selected <% } %>>Ucrania</option>
		<option value="Uganda"<% if (mPais.equals("Uganda")) {%> selected <% } %>>Uganda</option>
		<option value="Uruguay"<% if (mPais.equals("Uruguay")) {%> selected <% } %>>Uruguay</option>
		<option value="Venezuela"<% if (mPais.equals("Venezuela")) {%> selected <% } %>>Venezuela</option>
		<option value="Vietnam"<% if (mPais.equals("Vietnam")) {%> selected <% } %>>Vietnam</option>
		<option value="Yemen"<% if (mPais.equals("Yemen")) {%> selected <% } %>>Yemen</option>
		<option value="Yugoslavia"<% if (mPais.equals("Yugoslavia")) {%> selected <% } %>>Yugoslavia</option>
		<option value="Zaire"<% if (mPais.equals("Zaire")) {%> selected <% } %>>Zaire</option>
		<option value="Zambia"<% if (mPais.equals("Zambia")) {%> selected <% } %>>Zambia</option>
	</select>
	</td>
</tr>

<tr>
	<td align="right">
	<span class="smRedTxt">*</span> Ocupaci�n
	</td>
	<td>
		<input type="text" tabindex="<%= mCounter++ %>" name="ocupacion" value="<%= session.getAttribute("temp_familia_ocupacion").toString() %>" required="required" size="30" maxlength="45">
	</td>
</tr>
<!--- Submit/cancel. --->
<tr>
	<td>&nbsp;</td>
	<td valign="middle">

	<!--- Save button --->
	<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Guardar" name="save">

	<!--- Cancel button --->
	<input tabindex="<%= mCounter++ %>" type="reset" class="butnTxt" value="Reiniciar" name="reset">
	</td>
</tr>
</form>

<form action="sql_del_miembro_de_familia.jsp" method="post" name="del_familia">
	<input type="hidden" name="id" value="<%= session.getAttribute("temp_familia_id").toString() %>">

<tr>
	<td>&nbsp;</td>
	<td valign="middle">
	<!--- Delete button --->
	<input tabindex="<%= mCounter++ %>" type="submit" class="butnTxt" value="Eliminar" name="delete">
	</td>
</tr>

</form>
</table>