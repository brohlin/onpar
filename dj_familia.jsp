<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>

<%
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	DbResults db = Database.callProcResults("p_get_familia", params);
	int size = 0;
%>

<fieldset>
<table id="register_family_members" border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" colspan=7" align="left">Ingrese la informaci�n de todos sus familiares y dependientes.</th>
	</tr>
	<tr class="datatablerowv2">
		<td class="boldRedTxt">Relaci�n</td>
	    <td class="boldRedTxt">Nombre completo</td>
		<td class="boldRedTxt">Fecha de nacimiento</td>
		<td class="boldRedTxt">Sexo</td>
		<td class="boldRedTxt">Nacionalidad</td>
		<td>Ocupaci�n</td>
	    <td class="boldRedTxt">Donde se encuentra actualmente - Pa�s</td>
	</tr>
	
<%
	while(size<db.getRowCount())
	{
%>
	<tr>
	
		<td>
			<select id="miembro_<%= size+1 %>"  name="miembro_<%= size+1 %>"  size="1" required="required">
				<option value="Madre" <% if ( db.getRow(size).get(2).equals("Madre")) { %> selected <% } %>>Madre</option>
				<option value="Padre" <% if ( db.getRow(size).get(2).equals("Padre")) { %> selected <% } %>>Padre</option>
				<option value="Hijo/a" <% if ( db.getRow(size).get(2).equals("Hijo/a")) { %> selected <% } %>>Hijo/a</option>
				<option value="Hermano/a" <% if ( db.getRow(size).get(2).equals("Hermano/a")) { %> selected <% } %>>Hermano/a</option>
				<option value="Esposo/a" <% if ( db.getRow(size).get(2).equals("Esposo/a")) { %> selected <% } %>>Esposo/a</option>
				<option value="Otro" <% if ( db.getRow(size).get(2).equals("Otro")) { %> selected <% } %>>Otro</option>
			</select>		
		</td>
	    <td><input type="text"  name="miembro_nombre_<%= size+1 %>" value="<%= db.getRow(size).get(3) %>" size="25" maxlength="40" required="required"></td>
	    <td><input type="text" class="datepicker" name="miembro_fecha_de_nacimiento_<%= size+1 %>" value="<%= db.getRow(size).get(4) %>" required="required"></td>
	    <td><select name="miembro_sexo_<%= size+1 %>" size="1\" required="required">
	    		<option value=""></option>
	    		<option value="Masculino"<% if (db.getRow(size).get(7).equals("Masculino")) {%> selected <% } %>>Masculino</option>
	    		<option value="Feminino"<% if (db.getRow(size).get(7).equals("Feminino")) {%> selected <% } %>>Feminino</option>
	    	</select>
	    </td>
	    <td><select name="miembro_nacionalidad_<%= size+1 %>"  size="1" required="required" >				
				<option value=""></option>
				<option value="Afganist�n"<% if (db.getRow(size).get(8).equals("Afganist�n")) {%> selected <% } %>>Afganist�n</option>
				<option value="Albania"<% if (db.getRow(size).get(8).equals("Albania")) {%> selected <% } %>>Albania</option>
				<option value="Alemania"<% if (db.getRow(size).get(8).equals("Alemania")) {%> selected <% } %>>Alemania</option>
				<option value="Andorra"<% if (db.getRow(size).get(8).equals("Andorra")) {%> selected <% } %>>Andorra</option>
				<option value="Anguila"<% if (db.getRow(size).get(8).equals("Anguila")) {%> selected <% } %>>Anguila</option>
				<option value="Angola"<% if (db.getRow(size).get(8).equals("Angola")) {%> selected <% } %>>Angola</option>
				<option value="Antigua y Barbuda"<% if (db.getRow(size).get(8).equals("Antigua y Barbuda")) {%> selected <% } %>>Antigua y Barbuda</option>
				<option value="Antillas Holandesas"<% if (db.getRow(size).get(8).equals("Antillas Holandesas")) {%> selected <% } %>>Antillas Holandesas</option>
				<option value="Arabia Saudita"<% if (db.getRow(size).get(8).equals("Arabia Saudita")) {%> selected <% } %>>Arabia Saudita</option>
				<option value="Argelia"<% if (db.getRow(size).get(8).equals("Argelia")) {%> selected <% } %>>Argelia</option>
				<option value="Argentina"<% if (db.getRow(size).get(8).equals("Argentina")) {%> selected <% } %>>Argentina</option>
				<option value="Aruba"<% if (db.getRow(size).get(8).equals("Aruba")) {%> selected <% } %>>Aruba</option>
				<option value="Australia"<% if (db.getRow(size).get(8).equals("Australia")) {%> selected <% } %>>Australia</option>
				<option value="Austria"<% if (db.getRow(size).get(8).equals("Austria")) {%> selected <% } %>>Austria</option>
				<option value="Bahamas"<% if (db.getRow(size).get(8).equals("Bahamas")) {%> selected <% } %>>Bahamas</option>
				<option value="Banglad�s/Bangladesh"<% if (db.getRow(size).get(8).equals("Banglad�s/Bangladesh")) {%> selected <% } %>>Banglad�s/Bangladesh</option>
				<option value="Barbados"<% if (db.getRow(size).get(8).equals("Barbados")) {%> selected <% } %>>Barbados</option>
				<option value="Barbuda"<% if (db.getRow(size).get(8).equals("Barbuda")) {%> selected <% } %>>Barbuda</option>
				<option value="B�lgica"<% if (db.getRow(size).get(8).equals("B�lgica")) {%> selected <% } %>>B�lgica</option>
				<option value="Belice"<% if (db.getRow(size).get(8).equals("Belice")) {%> selected <% } %>>Belice</option>
				<option value="Ben�n"<% if (db.getRow(size).get(8).equals("Ben�n")) {%> selected <% } %>>Ben�n</option>
				<option value="Birmania"<% if (db.getRow(size).get(8).equals("Birmania")) {%> selected <% } %>>Birmania</option>
				<option value="Bolivia"<% if (db.getRow(size).get(8).equals("Bolivia")) {%> selected <% } %>>Bolivia</option>
				<option value="Bonaire"<% if (db.getRow(size).get(8).equals("Bonaire")) {%> selected <% } %>>Bonaire</option>
				<option value="Botswana"<% if (db.getRow(size).get(8).equals("Botswana")) {%> selected <% } %>>Botswana</option>
				<option value="Brasil"<% if (db.getRow(size).get(8).equals("Brasil")) {%> selected <% } %>>Brasil</option>
				<option value="Bulgaria"<% if (db.getRow(size).get(8).equals("Bulgaria")) {%> selected <% } %>>Bulgaria</option>
				<option value="Burkina Faso"<% if (db.getRow(size).get(8).equals("Burkina Faso")) {%> selected <% } %>>Burkina Faso</option>
				<option value="Camboya"<% if (db.getRow(size).get(8).equals("Camboya")) {%> selected <% } %>>Camboya</option>
				<option value="Camer�n"<% if (db.getRow(size).get(8).equals("Camer�n")) {%> selected <% } %>>Camer�n</option>
				<option value="Canad�"<% if (db.getRow(size).get(8).equals("Canad�")) {%> selected <% } %>>Canad�</option>
				<option value="Ceil�n"<% if (db.getRow(size).get(8).equals("Ceil�n")) {%> selected <% } %>>Ceil�n</option>
				<option value="Chad"<% if (db.getRow(size).get(8).equals("Chad")) {%> selected <% } %>>Chad</option>
				<option value="Chile"<% if (db.getRow(size).get(8).equals("Chile")) {%> selected <% } %>>Chile</option>
				<option value="China"<% if (db.getRow(size).get(8).equals("China")) {%> selected <% } %>>China</option>
				<option value="Chipre"<% if (db.getRow(size).get(8).equals("Chipre")) {%> selected <% } %>>Chipre</option>
				<option value="Colombia"<% if (db.getRow(size).get(8).equals("Colombia")) {%> selected <% } %>>Colombia</option>
				<option value="Congo"<% if (db.getRow(size).get(8).equals("Congo")) {%> selected <% } %>>Congo</option>
				<option value="Corea del Norte"<% if (db.getRow(size).get(8).equals("Corea del Norte")) {%> selected <% } %>>Corea del Norte</option>
				<option value="Corea del Sur"<% if (db.getRow(size).get(8).equals("Corea del Sur")) {%> selected <% } %>>Corea del Sur</option>
				<option value="Costa de Marfil"<% if (db.getRow(size).get(8).equals("Costa de Marfil")) {%> selected <% } %>>Costa de Marfil</option>
				<option value="Costa Rica"<% if (db.getRow(size).get(8).equals("Costa Rica")) {%> selected <% } %>>Costa Rica</option>
				<option value="Croacia"<% if (db.getRow(size).get(8).equals("Croacia")) {%> selected <% } %>>Croacia</option>
				<option value="Cuba"<% if (db.getRow(size).get(8).equals("Cuba")) {%> selected <% } %>>Cuba</option>
				<option value="Curazao"<% if (db.getRow(size).get(8).equals("Curazao")) {%> selected <% } %>>Curazao</option>
				<option value="Dinamarca"<% if (db.getRow(size).get(8).equals("Dinamarca")) {%> selected <% } %>>Dinamarca</option>
				<option value="Dominica"<% if (db.getRow(size).get(8).equals("Dominica")) {%> selected <% } %>>Dominica</option>
				<option value="Dubai"<% if (db.getRow(size).get(8).equals("Dubai")) {%> selected <% } %>>Dubai</option>
				<option value="Ecuador"<% if (db.getRow(size).get(8).equals("Ecuador")) {%> selected <% } %>>Ecuador</option>
				<option value="Egipto"<% if (db.getRow(size).get(8).equals("Egipto")) {%> selected <% } %>>Egipto</option>
				<option value="El Salvador"<% if (db.getRow(size).get(8).equals("El Salvador")) {%> selected <% } %>>El Salvador</option>
				<option value="Eritrea"<% if (db.getRow(size).get(8).equals("Eritrea")) {%> selected <% } %>>Eritrea</option>
				<option value="Escocia"<% if (db.getRow(size).get(8).equals("Escocia")) {%> selected <% } %>>Escocia</option>
				<option value="Eslovaquia"<% if (db.getRow(size).get(8).equals("Eslovaquia")) {%> selected <% } %>>Eslovaquia</option>
				<option value="Espa�a"<% if (db.getRow(size).get(8).equals("Espa�a")) {%> selected <% } %>>Espa�a</option>
				<option value="Estados Unidos"<% if (db.getRow(size).get(8).equals("Estados Unidos")) {%> selected <% } %>>Estados Unidos</option>
				<option value="Etiop�a"<% if (db.getRow(size).get(8).equals("Etiop�a")) {%> selected <% } %>>Etiop�a</option>
				<option value="Filipinas"<% if (db.getRow(size).get(8).equals("Filipinas")) {%> selected <% } %>>Filipinas</option>
				<option value="Finlandia"<% if (db.getRow(size).get(8).equals("Finlandia")) {%> selected <% } %>>Finlandia</option>
				<option value="Francia"<% if (db.getRow(size).get(8).equals("Francia")) {%> selected <% } %>>Francia</option>
				<option value="Gab�n"<% if (db.getRow(size).get(8).equals("Gab�n")) {%> selected <% } %>>Gab�n</option>
				<option value="Gales"<% if (db.getRow(size).get(8).equals("Gales")) {%> selected <% } %>>Gales</option>
				<option value="Gambia"<% if (db.getRow(size).get(8).equals("Gambia")) {%> selected <% } %>>Gambia</option>
				<option value="Ghana"<% if (db.getRow(size).get(8).equals("Ghana")) {%> selected <% } %>>Ghana</option>
				<option value="Gran Breta�a"<% if (db.getRow(size).get(8).equals("Gran Breta�a")) {%> selected <% } %>>Gran Breta�a</option>
				<option value="Granada"<% if (db.getRow(size).get(8).equals("Granada")) {%> selected <% } %>>Granada</option>
				<option value="Grecia"<% if (db.getRow(size).get(8).equals("Grecia")) {%> selected <% } %>>Grecia</option>
				<option value="Guadalupe"<% if (db.getRow(size).get(8).equals("Guadalupe")) {%> selected <% } %>>Guadalupe</option>
				<option value="Guam"<% if (db.getRow(size).get(8).equals("Guam")) {%> selected <% } %>>Guam</option>
				<option value="Guatemala"<% if (db.getRow(size).get(8).equals("Guatemala")) {%> selected <% } %>>Guatemala</option>
				<option value="Guinea"<% if (db.getRow(size).get(8).equals("Guinea")) {%> selected <% } %>>Guinea</option>
				<option value="Guinea Ecuatorial"<% if (db.getRow(size).get(8).equals("Guinea Ecuatorial")) {%> selected <% } %>>Guinea Ecuatorial</option>
				<option value="Guinea-Bissau"<% if (db.getRow(size).get(8).equals("Guinea-Bissau")) {%> selected <% } %>>Guinea-Bissau</option>
				<option value="Guyana"<% if (db.getRow(size).get(8).equals("Guyana")) {%> selected <% } %>>Guyana</option>
				<option value="Hait�"<% if (db.getRow(size).get(8).equals("Hait�")) {%> selected <% } %>>Hait�</option>
				<option value="Hawaii"<% if (db.getRow(size).get(8).equals("Hawaii")) {%> selected <% } %>>Hawaii</option>
				<option value="Holanda"<% if (db.getRow(size).get(8).equals("Holanda")) {%> selected <% } %>>Holanda</option>
				<option value="Honduras"<% if (db.getRow(size).get(8).equals("Honduras")) {%> selected <% } %>>Honduras</option>
				<option value="India"<% if (db.getRow(size).get(8).equals("India")) {%> selected <% } %>>India</option>
				<option value="Indonesia"<% if (db.getRow(size).get(8).equals("Indonesia")) {%> selected <% } %>>Indonesia</option>
				<option value="Inglaterra"<% if (db.getRow(size).get(8).equals("Inglaterra")) {%> selected <% } %>>Inglaterra</option>
				<option value="Irak, Iraq"<% if (db.getRow(size).get(8).equals("Irak, Iraq")) {%> selected <% } %>>Irak, Iraq</option>
				<option value="Ir�n"<% if (db.getRow(size).get(8).equals("Ir�n")) {%> selected <% } %>>Ir�n</option>
				<option value="Irlanda"<% if (db.getRow(size).get(8).equals("Irlanda")) {%> selected <% } %>>Irlanda</option>
				<option value="Islandia"<% if (db.getRow(size).get(8).equals("Islandia")) {%> selected <% } %>>Islandia</option>
				<option value="Islas Caim�n"<% if (db.getRow(size).get(8).equals("Islas Caim�n")) {%> selected <% } %>>Islas Caim�n</option>
				<option value="Islas Turcas y Caicos"<% if (db.getRow(size).get(8).equals("Islas Turcas y Caicos")) {%> selected <% } %>>Islas Turcas y Caicos</option>
				<option value="Islas V�rgenes Brit�nicas"<% if (db.getRow(size).get(8).equals("Islas V�rgenes Brit�nicas")) {%> selected <% } %>>Islas V�rgenes Brit�nicas</option>
				<option value="Islas V�rgenes de Estados Unidos"<% if (db.getRow(size).get(8).equals("Islas V�rgenes de Estados Unidos")) {%> selected <% } %>>Islas V�rgenes de Estados Unidos</option>
				<option value="Israel"<% if (db.getRow(size).get(8).equals("Israel")) {%> selected <% } %>>Israel</option>
				<option value="Italia"<% if (db.getRow(size).get(8).equals("Italia")) {%> selected <% } %>>Italia</option>
				<option value="Jamaica"<% if (db.getRow(size).get(8).equals("Jamaica")) {%> selected <% } %>>Jamaica</option>
				<option value="Jap�n"<% if (db.getRow(size).get(8).equals("Jap�n")) {%> selected <% } %>>Jap�n</option>
				<option value="Jordania"<% if (db.getRow(size).get(8).equals("Jordania")) {%> selected <% } %>>Jordania</option>
				<option value="Kenya"<% if (db.getRow(size).get(8).equals("Kenya")) {%> selected <% } %>>Kenya</option>
				<option value="Kuwait"<% if (db.getRow(size).get(8).equals("Kuwait")) {%> selected <% } %>>Kuwait</option>
				<option value="Laos"<% if (db.getRow(size).get(8).equals("Laos")) {%> selected <% } %>>Laos</option>
				<option value="las Islas Cook"<% if (db.getRow(size).get(8).equals("las Islas Cook")) {%> selected <% } %>>las Islas Cook</option>
				<option value="L�bano"<% if (db.getRow(size).get(8).equals("L�bano")) {%> selected <% } %>>L�bano</option>
				<option value="Liberia"<% if (db.getRow(size).get(8).equals("Liberia")) {%> selected <% } %>>Liberia</option>
				<option value="Libia"<% if (db.getRow(size).get(8).equals("Libia")) {%> selected <% } %>>Libia</option>
				<option value="Lituania"<% if (db.getRow(size).get(8).equals("Lituania")) {%> selected <% } %>>Lituania</option>
				<option value="Luxemburgo"<% if (db.getRow(size).get(8).equals("Luxemburgo")) {%> selected <% } %>>Luxemburgo</option>
				<option value="Malasia"<% if (db.getRow(size).get(8).equals("Malasia")) {%> selected <% } %>>Malasia</option>
				<option value="Mali"<% if (db.getRow(size).get(8).equals("Mali")) {%> selected <% } %>>Mali</option>
				<option value="Malta"<% if (db.getRow(size).get(8).equals("Malta")) {%> selected <% } %>>Malta</option>
				<option value="Marruecos"<% if (db.getRow(size).get(8).equals("Marruecos")) {%> selected <% } %>>Marruecos</option>
				<option value="Martinique"<% if (db.getRow(size).get(8).equals("Martinique")) {%> selected <% } %>>Martinique</option>
				<option value="Mauricio"<% if (db.getRow(size).get(8).equals("Mauricio")) {%> selected <% } %>>Mauricio</option>
				<option value="Mauritania"<% if (db.getRow(size).get(8).equals("Mauritania")) {%> selected <% } %>>Mauritania</option>
				<option value="M�xico, M�jico"<% if (db.getRow(size).get(8).equals("M�xico, M�jico")) {%> selected <% } %>>M�xico, M�jico</option>
				<option value="M�naco"<% if (db.getRow(size).get(8).equals("M�naco")) {%> selected <% } %>>M�naco</option>
				<option value="Montserrat"<% if (db.getRow(size).get(8).equals("Montserrat")) {%> selected <% } %>>Montserrat</option>
				<option value="Nepal"<% if (db.getRow(size).get(8).equals("Nepal")) {%> selected <% } %>>Nepal</option>
				<option value="Namibia"<% if (db.getRow(size).get(8).equals("Namibia")) {%> selected <% } %>>Namibia</option>
				<option value="Nicaragua"<% if (db.getRow(size).get(8).equals("Nicaragua")) {%> selected <% } %>>Nicaragua</option>
				<option value="Niger"<% if (db.getRow(size).get(8).equals("Niger")) {%> selected <% } %>>Niger</option>
				<option value="Nigeria"<% if (db.getRow(size).get(8).equals("Nigeria")) {%> selected <% } %>>Nigeria</option>
				<option value="Noruega"<% if (db.getRow(size).get(8).equals("Noruega")) {%> selected <% } %>>Noruega</option>
				<option value="Nueva Zelanda"<% if (db.getRow(size).get(8).equals("Nueva Zelanda")) {%> selected <% } %>>Nueva Zelanda</option>
				<option value="Pa�ses Bajos"<% if (db.getRow(size).get(8).equals("Pa�ses Bajos")) {%> selected <% } %>>Pa�ses Bajos</option>
				<option value="Palestina"<% if (db.getRow(size).get(8).equals("Palestina")) {%> selected <% } %>>Palestina</option>
				<option value="Panam�"<% if (db.getRow(size).get(8).equals("Panam�")) {%> selected <% } %>>Panam�</option>
				<option value="Paquist�n"<% if (db.getRow(size).get(8).equals("Paquist�n")) {%> selected <% } %>>Paquist�n</option>
				<option value="Paraguay"<% if (db.getRow(size).get(8).equals("Paraguay")) {%> selected <% } %>>Paraguay</option>
				<option value="Persia"<% if (db.getRow(size).get(8).equals("Persia")) {%> selected <% } %>>Persia</option>
				<option value="Per�"<% if (db.getRow(size).get(8).equals("Per�")) {%> selected <% } %>>Per�</option>
				<option value="Polonia"<% if (db.getRow(size).get(8).equals("Polonia")) {%> selected <% } %>>Polonia</option>
				<option value="Portugal"<% if (db.getRow(size).get(8).equals("Portugal")) {%> selected <% } %>>Portugal</option>
				<option value="Puerto Rico"<% if (db.getRow(size).get(8).equals("Puerto Rico")) {%> selected <% } %>>Puerto Rico</option>
				<option value="Rep�blica Checa"<% if (db.getRow(size).get(8).equals("Rep�blica Checa")) {%> selected <% } %>>Rep�blica Checa</option>
				<option value="Rep�blica Dominicana"<% if (db.getRow(size).get(8).equals("Rep�blica Dominicana")) {%> selected <% } %>>Rep�blica Dominicana</option>
				<option value="Ruanda"<% if (db.getRow(size).get(8).equals("Ruanda")) {%> selected <% } %>>Ruanda</option>
				<option value="Ruman�a"<% if (db.getRow(size).get(8).equals("Ruman�a")) {%> selected <% } %>>Ruman�a</option>
				<option value="Rusia"<% if (db.getRow(size).get(8).equals("Rusia")) {%> selected <% } %>>Rusia</option>
				<option value="Saba"<% if (db.getRow(size).get(8).equals("Saba")) {%> selected <% } %>>Saba</option>
				<option value="Samoa"<% if (db.getRow(size).get(8).equals("Samoa")) {%> selected <% } %>>Samoa</option>
				<option value="San Bartolom�"<% if (db.getRow(size).get(8).equals("San Bartolom�")) {%> selected <% } %>>San Bartolom�</option>
				<option value="San Crist�bal y Nieves"<% if (db.getRow(size).get(8).equals("San Crist�bal y Nieves")) {%> selected <% } %>>San Crist�bal y Nieves</option>
				<option value="San Eustaquio"<% if (db.getRow(size).get(8).equals("San Eustaquio")) {%> selected <% } %>>San Eustaquio</option>
				<option value="San Mart�n"<% if (db.getRow(size).get(8).equals("San Mart�n")) {%> selected <% } %>>San Mart�n</option>
				<option value="San Vicente"<% if (db.getRow(size).get(8).equals("San Vicente")) {%> selected <% } %>>San Vicente</option>
				<option value="Santa Luc�a"<% if (db.getRow(size).get(8).equals("Santa Luc�a")) {%> selected <% } %>>Santa Luc�a</option>
				<option value="Santo Tom�s"<% if (db.getRow(size).get(8).equals("Santo Tom�s")) {%> selected <% } %>>Santo Tom�s</option>
				<option value="Senegal"<% if (db.getRow(size).get(8).equals("Senegal")) {%> selected <% } %>>Senegal</option>
				<option value="Sierra Leona"<% if (db.getRow(size).get(8).equals("Sierra Leona")) {%> selected <% } %>>Sierra Leona</option>
				<option value="Siria"<% if (db.getRow(size).get(8).equals("Siria")) {%> selected <% } %>>Siria</option>
				<option value="Somalia"<% if (db.getRow(size).get(8).equals("Somalia")) {%> selected <% } %>>Somalia</option>
				<option value="Sri Lanka"<% if (db.getRow(size).get(8).equals("Sri Lanka")) {%> selected <% } %>>Sri Lanka</option>
				<option value="Sud�frica"<% if (db.getRow(size).get(8).equals("Sud�frica")) {%> selected <% } %>>Sud�frica</option>
				<option value="Sud�n"<% if (db.getRow(size).get(8).equals("Sud�n")) {%> selected <% } %>>Sud�n</option>
				<option value="Suecia"<% if (db.getRow(size).get(8).equals("Suecia")) {%> selected <% } %>>Suecia</option>
				<option value="Suiza"<% if (db.getRow(size).get(8).equals("Suiza")) {%> selected <% } %>>Suiza</option>
				<option value="Surinam"<% if (db.getRow(size).get(8).equals("Surinam")) {%> selected <% } %>>Surinam</option>
				<option value="Tailandia"<% if (db.getRow(size).get(8).equals("Tailandia")) {%> selected <% } %>>Tailandia</option>
				<option value="Taiw�n"<% if (db.getRow(size).get(8).equals("Taiw�n")) {%> selected <% } %>>Taiw�n</option>
				<option value="Tanzania"<% if (db.getRow(size).get(8).equals("Tanzania")) {%> selected <% } %>>Tanzania</option>
				<option value="Togo"<% if (db.getRow(size).get(8).equals("Togo")) {%> selected <% } %>>Togo</option>
				<option value="Trinidad y Tobago"<% if (db.getRow(size).get(8).equals("Trinidad y Tobago")) {%> selected <% } %>>Trinidad y Tobago</option>
				<option value="T�nez"<% if (db.getRow(size).get(8).equals("T�nez")) {%> selected <% } %>>T�nez</option>
				<option value="Turqu�a"<% if (db.getRow(size).get(8).equals("Turqu�a")) {%> selected <% } %>>Turqu�a</option>
				<option value="Ucrania"<% if (db.getRow(size).get(8).equals("Ucrania")) {%> selected <% } %>>Ucrania</option>
				<option value="Uganda"<% if (db.getRow(size).get(8).equals("Uganda")) {%> selected <% } %>>Uganda</option>
				<option value="Uruguay"<% if (db.getRow(size).get(8).equals("Uruguay")) {%> selected <% } %>>Uruguay</option>
				<option value="Venezuela"<% if (db.getRow(size).get(8).equals("Venezuela")) {%> selected <% } %>>Venezuela</option>
				<option value="Vietnam"<% if (db.getRow(size).get(8).equals("Vietnam")) {%> selected <% } %>>Vietnam</option>
				<option value="Yemen"<% if (db.getRow(size).get(8).equals("Yemen")) {%> selected <% } %>>Yemen</option>
				<option value="Yugoslavia"<% if (db.getRow(size).get(8).equals("Yugoslavia")) {%> selected <% } %>>Yugoslavia</option>
				<option value="Zaire"<% if (db.getRow(size).get(8).equals("Zaire")) {%> selected <% } %>>Zaire</option>
				<option value="Zambia"<% if (db.getRow(size).get(8).equals("Zambia")) {%> selected <% } %>>Zambia</option>
				<option value="Zimbabwe"<% if (db.getRow(size).get(8).equals("Zimbabwe")) {%> selected <% } %>>Zimbabwe</option>
			</select>	    
		</td>	    
	    <td><input type="text"  name="miembro_ocupacion_<%= size+1 %>" value="<%= db.getRow(size).get(5) %>" size="25" maxlength="40"></td>
	    <td><select name="miembro_lugar_<%= size+1 %>"  size="1" required="required" >				
				<option value=""></option>
				<option value="Afganist�n"<% if (db.getRow(size).get(6).equals("Afganist�n")) {%> selected <% } %>>Afganist�n</option>
				<option value="Albania"<% if (db.getRow(size).get(6).equals("Albania")) {%> selected <% } %>>Albania</option>
				<option value="Alemania"<% if (db.getRow(size).get(6).equals("Alemania")) {%> selected <% } %>>Alemania</option>
				<option value="Andorra"<% if (db.getRow(size).get(6).equals("Andorra")) {%> selected <% } %>>Andorra</option>
				<option value="Anguila"<% if (db.getRow(size).get(6).equals("Anguila")) {%> selected <% } %>>Anguila</option>
				<option value="Angola"<% if (db.getRow(size).get(6).equals("Angola")) {%> selected <% } %>>Angola</option>
				<option value="Antigua y Barbuda"<% if (db.getRow(size).get(6).equals("Antigua y Barbuda")) {%> selected <% } %>>Antigua y Barbuda</option>
				<option value="Antillas Holandesas"<% if (db.getRow(size).get(6).equals("Antillas Holandesas")) {%> selected <% } %>>Antillas Holandesas</option>
				<option value="Arabia Saudita"<% if (db.getRow(size).get(6).equals("Arabia Saudita")) {%> selected <% } %>>Arabia Saudita</option>
				<option value="Argelia"<% if (db.getRow(size).get(6).equals("Argelia")) {%> selected <% } %>>Argelia</option>
				<option value="Argentina"<% if (db.getRow(size).get(6).equals("Argentina")) {%> selected <% } %>>Argentina</option>
				<option value="Aruba"<% if (db.getRow(size).get(6).equals("Aruba")) {%> selected <% } %>>Aruba</option>
				<option value="Australia"<% if (db.getRow(size).get(6).equals("Australia")) {%> selected <% } %>>Australia</option>
				<option value="Austria"<% if (db.getRow(size).get(6).equals("Austria")) {%> selected <% } %>>Austria</option>
				<option value="Bahamas"<% if (db.getRow(size).get(6).equals("Bahamas")) {%> selected <% } %>>Bahamas</option>
				<option value="Banglad�s/Bangladesh"<% if (db.getRow(size).get(6).equals("Banglad�s/Bangladesh")) {%> selected <% } %>>Banglad�s/Bangladesh</option>
				<option value="Barbados"<% if (db.getRow(size).get(6).equals("Barbados")) {%> selected <% } %>>Barbados</option>
				<option value="Barbuda"<% if (db.getRow(size).get(6).equals("Barbuda")) {%> selected <% } %>>Barbuda</option>
				<option value="B�lgica"<% if (db.getRow(size).get(6).equals("B�lgica")) {%> selected <% } %>>B�lgica</option>
				<option value="Belice"<% if (db.getRow(size).get(6).equals("Belice")) {%> selected <% } %>>Belice</option>
				<option value="Ben�n"<% if (db.getRow(size).get(6).equals("Ben�n")) {%> selected <% } %>>Ben�n</option>
				<option value="Birmania"<% if (db.getRow(size).get(6).equals("Birmania")) {%> selected <% } %>>Birmania</option>
				<option value="Bolivia"<% if (db.getRow(size).get(6).equals("Bolivia")) {%> selected <% } %>>Bolivia</option>
				<option value="Bonaire"<% if (db.getRow(size).get(6).equals("Bonaire")) {%> selected <% } %>>Bonaire</option>
				<option value="Botswana"<% if (db.getRow(size).get(6).equals("Botswana")) {%> selected <% } %>>Botswana</option>
				<option value="Brasil"<% if (db.getRow(size).get(6).equals("Brasil")) {%> selected <% } %>>Brasil</option>
				<option value="Bulgaria"<% if (db.getRow(size).get(6).equals("Bulgaria")) {%> selected <% } %>>Bulgaria</option>
				<option value="Burkina Faso"<% if (db.getRow(size).get(6).equals("Burkina Faso")) {%> selected <% } %>>Burkina Faso</option>
				<option value="Camboya"<% if (db.getRow(size).get(6).equals("Camboya")) {%> selected <% } %>>Camboya</option>
				<option value="Camer�n"<% if (db.getRow(size).get(6).equals("Camer�n")) {%> selected <% } %>>Camer�n</option>
				<option value="Canad�"<% if (db.getRow(size).get(6).equals("Canad�")) {%> selected <% } %>>Canad�</option>
				<option value="Ceil�n"<% if (db.getRow(size).get(6).equals("Ceil�n")) {%> selected <% } %>>Ceil�n</option>
				<option value="Chad"<% if (db.getRow(size).get(6).equals("Chad")) {%> selected <% } %>>Chad</option>
				<option value="Chile"<% if (db.getRow(size).get(6).equals("Chile")) {%> selected <% } %>>Chile</option>
				<option value="China"<% if (db.getRow(size).get(6).equals("China")) {%> selected <% } %>>China</option>
				<option value="Chipre"<% if (db.getRow(size).get(6).equals("Chipre")) {%> selected <% } %>>Chipre</option>
				<option value="Colombia"<% if (db.getRow(size).get(6).equals("Colombia")) {%> selected <% } %>>Colombia</option>
				<option value="Congo"<% if (db.getRow(size).get(6).equals("Congo")) {%> selected <% } %>>Congo</option>
				<option value="Corea del Norte"<% if (db.getRow(size).get(6).equals("Corea del Norte")) {%> selected <% } %>>Corea del Norte</option>
				<option value="Corea del Sur"<% if (db.getRow(size).get(6).equals("Corea del Sur")) {%> selected <% } %>>Corea del Sur</option>
				<option value="Costa de Marfil"<% if (db.getRow(size).get(6).equals("Costa de Marfil")) {%> selected <% } %>>Costa de Marfil</option>
				<option value="Costa Rica"<% if (db.getRow(size).get(6).equals("Costa Rica")) {%> selected <% } %>>Costa Rica</option>
				<option value="Croacia"<% if (db.getRow(size).get(6).equals("Croacia")) {%> selected <% } %>>Croacia</option>
				<option value="Cuba"<% if (db.getRow(size).get(6).equals("Cuba")) {%> selected <% } %>>Cuba</option>
				<option value="Curazao"<% if (db.getRow(size).get(6).equals("Curazao")) {%> selected <% } %>>Curazao</option>
				<option value="Dinamarca"<% if (db.getRow(size).get(6).equals("Dinamarca")) {%> selected <% } %>>Dinamarca</option>
				<option value="Dominica"<% if (db.getRow(size).get(6).equals("Dominica")) {%> selected <% } %>>Dominica</option>
				<option value="Dubai"<% if (db.getRow(size).get(6).equals("Dubai")) {%> selected <% } %>>Dubai</option>
				<option value="Ecuador"<% if (db.getRow(size).get(6).equals("Ecuador")) {%> selected <% } %>>Ecuador</option>
				<option value="Egipto"<% if (db.getRow(size).get(6).equals("Egipto")) {%> selected <% } %>>Egipto</option>
				<option value="El Salvador"<% if (db.getRow(size).get(6).equals("El Salvador")) {%> selected <% } %>>El Salvador</option>
				<option value="Eritrea"<% if (db.getRow(size).get(6).equals("Eritrea")) {%> selected <% } %>>Eritrea</option>
				<option value="Escocia"<% if (db.getRow(size).get(6).equals("Escocia")) {%> selected <% } %>>Escocia</option>
				<option value="Eslovaquia"<% if (db.getRow(size).get(6).equals("Eslovaquia")) {%> selected <% } %>>Eslovaquia</option>
				<option value="Espa�a"<% if (db.getRow(size).get(6).equals("Espa�a")) {%> selected <% } %>>Espa�a</option>
				<option value="Estados Unidos"<% if (db.getRow(size).get(6).equals("Estados Unidos")) {%> selected <% } %>>Estados Unidos</option>
				<option value="Etiop�a"<% if (db.getRow(size).get(6).equals("Etiop�a")) {%> selected <% } %>>Etiop�a</option>
				<option value="Filipinas"<% if (db.getRow(size).get(6).equals("Filipinas")) {%> selected <% } %>>Filipinas</option>
				<option value="Finlandia"<% if (db.getRow(size).get(6).equals("Finlandia")) {%> selected <% } %>>Finlandia</option>
				<option value="Francia"<% if (db.getRow(size).get(6).equals("Francia")) {%> selected <% } %>>Francia</option>
				<option value="Gab�n"<% if (db.getRow(size).get(6).equals("Gab�n")) {%> selected <% } %>>Gab�n</option>
				<option value="Gales"<% if (db.getRow(size).get(6).equals("Gales")) {%> selected <% } %>>Gales</option>
				<option value="Gambia"<% if (db.getRow(size).get(6).equals("Gambia")) {%> selected <% } %>>Gambia</option>
				<option value="Ghana"<% if (db.getRow(size).get(6).equals("Ghana")) {%> selected <% } %>>Ghana</option>
				<option value="Gran Breta�a"<% if (db.getRow(size).get(6).equals("Gran Breta�a")) {%> selected <% } %>>Gran Breta�a</option>
				<option value="Granada"<% if (db.getRow(size).get(6).equals("Granada")) {%> selected <% } %>>Granada</option>
				<option value="Grecia"<% if (db.getRow(size).get(6).equals("Grecia")) {%> selected <% } %>>Grecia</option>
				<option value="Guadalupe"<% if (db.getRow(size).get(6).equals("Guadalupe")) {%> selected <% } %>>Guadalupe</option>
				<option value="Guam"<% if (db.getRow(size).get(6).equals("Guam")) {%> selected <% } %>>Guam</option>
				<option value="Guatemala"<% if (db.getRow(size).get(6).equals("Guatemala")) {%> selected <% } %>>Guatemala</option>
				<option value="Guinea"<% if (db.getRow(size).get(6).equals("Guinea")) {%> selected <% } %>>Guinea</option>
				<option value="Guinea Ecuatorial"<% if (db.getRow(size).get(6).equals("Guinea Ecuatorial")) {%> selected <% } %>>Guinea Ecuatorial</option>
				<option value="Guinea-Bissau"<% if (db.getRow(size).get(6).equals("Guinea-Bissau")) {%> selected <% } %>>Guinea-Bissau</option>
				<option value="Guyana"<% if (db.getRow(size).get(6).equals("Guyana")) {%> selected <% } %>>Guyana</option>
				<option value="Hait�"<% if (db.getRow(size).get(6).equals("Hait�")) {%> selected <% } %>>Hait�</option>
				<option value="Hawaii"<% if (db.getRow(size).get(6).equals("Hawaii")) {%> selected <% } %>>Hawaii</option>
				<option value="Holanda"<% if (db.getRow(size).get(6).equals("Holanda")) {%> selected <% } %>>Holanda</option>
				<option value="Honduras"<% if (db.getRow(size).get(6).equals("Honduras")) {%> selected <% } %>>Honduras</option>
				<option value="India"<% if (db.getRow(size).get(6).equals("India")) {%> selected <% } %>>India</option>
				<option value="Indonesia"<% if (db.getRow(size).get(6).equals("Indonesia")) {%> selected <% } %>>Indonesia</option>
				<option value="Inglaterra"<% if (db.getRow(size).get(6).equals("Inglaterra")) {%> selected <% } %>>Inglaterra</option>
				<option value="Irak, Iraq"<% if (db.getRow(size).get(6).equals("Irak, Iraq")) {%> selected <% } %>>Irak, Iraq</option>
				<option value="Ir�n"<% if (db.getRow(size).get(6).equals("Ir�n")) {%> selected <% } %>>Ir�n</option>
				<option value="Irlanda"<% if (db.getRow(size).get(6).equals("Irlanda")) {%> selected <% } %>>Irlanda</option>
				<option value="Islandia"<% if (db.getRow(size).get(6).equals("Islandia")) {%> selected <% } %>>Islandia</option>
				<option value="Islas Caim�n"<% if (db.getRow(size).get(6).equals("Islas Caim�n")) {%> selected <% } %>>Islas Caim�n</option>
				<option value="Islas Turcas y Caicos"<% if (db.getRow(size).get(6).equals("Islas Turcas y Caicos")) {%> selected <% } %>>Islas Turcas y Caicos</option>
				<option value="Islas V�rgenes Brit�nicas"<% if (db.getRow(size).get(6).equals("Islas V�rgenes Brit�nicas")) {%> selected <% } %>>Islas V�rgenes Brit�nicas</option>
				<option value="Islas V�rgenes de Estados Unidos"<% if (db.getRow(size).get(6).equals("Islas V�rgenes de Estados Unidos")) {%> selected <% } %>>Islas V�rgenes de Estados Unidos</option>
				<option value="Israel"<% if (db.getRow(size).get(6).equals("Israel")) {%> selected <% } %>>Israel</option>
				<option value="Italia"<% if (db.getRow(size).get(6).equals("Italia")) {%> selected <% } %>>Italia</option>
				<option value="Jamaica"<% if (db.getRow(size).get(6).equals("Jamaica")) {%> selected <% } %>>Jamaica</option>
				<option value="Jap�n"<% if (db.getRow(size).get(6).equals("Jap�n")) {%> selected <% } %>>Jap�n</option>
				<option value="Jordania"<% if (db.getRow(size).get(6).equals("Jordania")) {%> selected <% } %>>Jordania</option>
				<option value="Kenya"<% if (db.getRow(size).get(6).equals("Kenya")) {%> selected <% } %>>Kenya</option>
				<option value="Kuwait"<% if (db.getRow(size).get(6).equals("Kuwait")) {%> selected <% } %>>Kuwait</option>
				<option value="Laos"<% if (db.getRow(size).get(6).equals("Laos")) {%> selected <% } %>>Laos</option>
				<option value="las Islas Cook"<% if (db.getRow(size).get(6).equals("las Islas Cook")) {%> selected <% } %>>las Islas Cook</option>
				<option value="L�bano"<% if (db.getRow(size).get(6).equals("L�bano")) {%> selected <% } %>>L�bano</option>
				<option value="Liberia"<% if (db.getRow(size).get(6).equals("Liberia")) {%> selected <% } %>>Liberia</option>
				<option value="Libia"<% if (db.getRow(size).get(6).equals("Libia")) {%> selected <% } %>>Libia</option>
				<option value="Lituania"<% if (db.getRow(size).get(6).equals("Lituania")) {%> selected <% } %>>Lituania</option>
				<option value="Luxemburgo"<% if (db.getRow(size).get(6).equals("Luxemburgo")) {%> selected <% } %>>Luxemburgo</option>
				<option value="Malasia"<% if (db.getRow(size).get(6).equals("Malasia")) {%> selected <% } %>>Malasia</option>
				<option value="Mali"<% if (db.getRow(size).get(6).equals("Mali")) {%> selected <% } %>>Mali</option>
				<option value="Malta"<% if (db.getRow(size).get(6).equals("Malta")) {%> selected <% } %>>Malta</option>
				<option value="Marruecos"<% if (db.getRow(size).get(6).equals("Marruecos")) {%> selected <% } %>>Marruecos</option>
				<option value="Martinique"<% if (db.getRow(size).get(6).equals("Martinique")) {%> selected <% } %>>Martinique</option>
				<option value="Mauricio"<% if (db.getRow(size).get(6).equals("Mauricio")) {%> selected <% } %>>Mauricio</option>
				<option value="Mauritania"<% if (db.getRow(size).get(6).equals("Mauritania")) {%> selected <% } %>>Mauritania</option>
				<option value="M�xico, M�jico"<% if (db.getRow(size).get(6).equals("M�xico, M�jico")) {%> selected <% } %>>M�xico, M�jico</option>
				<option value="M�naco"<% if (db.getRow(size).get(6).equals("M�naco")) {%> selected <% } %>>M�naco</option>
				<option value="Montserrat"<% if (db.getRow(size).get(6).equals("Montserrat")) {%> selected <% } %>>Montserrat</option>
				<option value="Nepal"<% if (db.getRow(size).get(6).equals("Nepal")) {%> selected <% } %>>Nepal</option>
				<option value="Namibia"<% if (db.getRow(size).get(6).equals("Namibia")) {%> selected <% } %>>Namibia</option>
				<option value="Nicaragua"<% if (db.getRow(size).get(6).equals("Nicaragua")) {%> selected <% } %>>Nicaragua</option>
				<option value="Niger"<% if (db.getRow(size).get(6).equals("Niger")) {%> selected <% } %>>Niger</option>
				<option value="Nigeria"<% if (db.getRow(size).get(6).equals("Nigeria")) {%> selected <% } %>>Nigeria</option>
				<option value="Noruega"<% if (db.getRow(size).get(6).equals("Noruega")) {%> selected <% } %>>Noruega</option>
				<option value="Nueva Zelanda"<% if (db.getRow(size).get(6).equals("Nueva Zelanda")) {%> selected <% } %>>Nueva Zelanda</option>
				<option value="Pa�ses Bajos"<% if (db.getRow(size).get(6).equals("Pa�ses Bajos")) {%> selected <% } %>>Pa�ses Bajos</option>
				<option value="Palestina"<% if (db.getRow(size).get(6).equals("Palestina")) {%> selected <% } %>>Palestina</option>
				<option value="Panam�"<% if (db.getRow(size).get(6).equals("Panam�")) {%> selected <% } %>>Panam�</option>
				<option value="Paquist�n"<% if (db.getRow(size).get(6).equals("Paquist�n")) {%> selected <% } %>>Paquist�n</option>
				<option value="Paraguay"<% if (db.getRow(size).get(6).equals("Paraguay")) {%> selected <% } %>>Paraguay</option>
				<option value="Persia"<% if (db.getRow(size).get(6).equals("Persia")) {%> selected <% } %>>Persia</option>
				<option value="Per�"<% if (db.getRow(size).get(6).equals("Per�")) {%> selected <% } %>>Per�</option>
				<option value="Polonia"<% if (db.getRow(size).get(6).equals("Polonia")) {%> selected <% } %>>Polonia</option>
				<option value="Portugal"<% if (db.getRow(size).get(6).equals("Portugal")) {%> selected <% } %>>Portugal</option>
				<option value="Puerto Rico"<% if (db.getRow(size).get(6).equals("Puerto Rico")) {%> selected <% } %>>Puerto Rico</option>
				<option value="Rep�blica Checa"<% if (db.getRow(size).get(6).equals("Rep�blica Checa")) {%> selected <% } %>>Rep�blica Checa</option>
				<option value="Rep�blica Dominicana"<% if (db.getRow(size).get(6).equals("Rep�blica Dominicana")) {%> selected <% } %>>Rep�blica Dominicana</option>
				<option value="Ruanda"<% if (db.getRow(size).get(6).equals("Ruanda")) {%> selected <% } %>>Ruanda</option>
				<option value="Ruman�a"<% if (db.getRow(size).get(6).equals("Ruman�a")) {%> selected <% } %>>Ruman�a</option>
				<option value="Rusia"<% if (db.getRow(size).get(6).equals("Rusia")) {%> selected <% } %>>Rusia</option>
				<option value="Saba"<% if (db.getRow(size).get(6).equals("Saba")) {%> selected <% } %>>Saba</option>
				<option value="Samoa"<% if (db.getRow(size).get(6).equals("Samoa")) {%> selected <% } %>>Samoa</option>
				<option value="San Bartolom�"<% if (db.getRow(size).get(6).equals("San Bartolom�")) {%> selected <% } %>>San Bartolom�</option>
				<option value="San Crist�bal y Nieves"<% if (db.getRow(size).get(6).equals("San Crist�bal y Nieves")) {%> selected <% } %>>San Crist�bal y Nieves</option>
				<option value="San Eustaquio"<% if (db.getRow(size).get(6).equals("San Eustaquio")) {%> selected <% } %>>San Eustaquio</option>
				<option value="San Mart�n"<% if (db.getRow(size).get(6).equals("San Mart�n")) {%> selected <% } %>>San Mart�n</option>
				<option value="San Vicente"<% if (db.getRow(size).get(6).equals("San Vicente")) {%> selected <% } %>>San Vicente</option>
				<option value="Santa Luc�a"<% if (db.getRow(size).get(6).equals("Santa Luc�a")) {%> selected <% } %>>Santa Luc�a</option>
				<option value="Santo Tom�s"<% if (db.getRow(size).get(6).equals("Santo Tom�s")) {%> selected <% } %>>Santo Tom�s</option>
				<option value="Senegal"<% if (db.getRow(size).get(6).equals("Senegal")) {%> selected <% } %>>Senegal</option>
				<option value="Sierra Leona"<% if (db.getRow(size).get(6).equals("Sierra Leona")) {%> selected <% } %>>Sierra Leona</option>
				<option value="Siria"<% if (db.getRow(size).get(6).equals("Siria")) {%> selected <% } %>>Siria</option>
				<option value="Somalia"<% if (db.getRow(size).get(6).equals("Somalia")) {%> selected <% } %>>Somalia</option>
				<option value="Sri Lanka"<% if (db.getRow(size).get(6).equals("Sri Lanka")) {%> selected <% } %>>Sri Lanka</option>
				<option value="Sud�frica"<% if (db.getRow(size).get(6).equals("Sud�frica")) {%> selected <% } %>>Sud�frica</option>
				<option value="Sud�n"<% if (db.getRow(size).get(6).equals("Sud�n")) {%> selected <% } %>>Sud�n</option>
				<option value="Suecia"<% if (db.getRow(size).get(6).equals("Suecia")) {%> selected <% } %>>Suecia</option>
				<option value="Suiza"<% if (db.getRow(size).get(6).equals("Suiza")) {%> selected <% } %>>Suiza</option>
				<option value="Surinam"<% if (db.getRow(size).get(6).equals("Surinam")) {%> selected <% } %>>Surinam</option>
				<option value="Tailandia"<% if (db.getRow(size).get(6).equals("Tailandia")) {%> selected <% } %>>Tailandia</option>
				<option value="Taiw�n"<% if (db.getRow(size).get(6).equals("Taiw�n")) {%> selected <% } %>>Taiw�n</option>
				<option value="Tanzania"<% if (db.getRow(size).get(6).equals("Tanzania")) {%> selected <% } %>>Tanzania</option>
				<option value="Togo"<% if (db.getRow(size).get(6).equals("Togo")) {%> selected <% } %>>Togo</option>
				<option value="Trinidad y Tobago"<% if (db.getRow(size).get(6).equals("Trinidad y Tobago")) {%> selected <% } %>>Trinidad y Tobago</option>
				<option value="T�nez"<% if (db.getRow(size).get(6).equals("T�nez")) {%> selected <% } %>>T�nez</option>
				<option value="Turqu�a"<% if (db.getRow(size).get(6).equals("Turqu�a")) {%> selected <% } %>>Turqu�a</option>
				<option value="Ucrania"<% if (db.getRow(size).get(6).equals("Ucrania")) {%> selected <% } %>>Ucrania</option>
				<option value="Uganda"<% if (db.getRow(size).get(6).equals("Uganda")) {%> selected <% } %>>Uganda</option>
				<option value="Uruguay"<% if (db.getRow(size).get(6).equals("Uruguay")) {%> selected <% } %>>Uruguay</option>
				<option value="Venezuela"<% if (db.getRow(size).get(6).equals("Venezuela")) {%> selected <% } %>>Venezuela</option>
				<option value="Vietnam"<% if (db.getRow(size).get(6).equals("Vietnam")) {%> selected <% } %>>Vietnam</option>
				<option value="Yemen"<% if (db.getRow(size).get(6).equals("Yemen")) {%> selected <% } %>>Yemen</option>
				<option value="Yugoslavia"<% if (db.getRow(size).get(6).equals("Yugoslavia")) {%> selected <% } %>>Yugoslavia</option>
				<option value="Zaire"<% if (db.getRow(size).get(6).equals("Zaire")) {%> selected <% } %>>Zaire</option>
				<option value="Zambia"<% if (db.getRow(size).get(6).equals("Zambia")) {%> selected <% } %>>Zambia</option>
				<option value="Zimbabwe"<% if (db.getRow(size).get(6).equals("Zimbabwe")) {%> selected <% } %>>Zimbabwe</option>
			</select>	    
		</td>
	    <td><a href="/onpar/sql_del_miembro_de_familia_v2.jsp?id=<%= db.getRow(size).get(0) %>">Eliminar</a></td>	
	        
	</tr>
<%
		size++;
	}
%>
	<input id="num_fam_members" name="num_fam_members" type="hidden" value="<%= size %>">
</table>
<table>
		
	<tr>
		<td colspan="3">
			<button id="add_row" >A�adir</button>
		</td>
		<td  colspan="2">
			<button id="delete_row">Eliminar</button>
		</td>
	</tr>
</table>
</fieldset>


