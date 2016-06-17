<script src="/onpar/assets/js/jquery-2.1.0.min.js"></script>	
<script defer src="/onpar/assets/js/bootstrap.min.js"></script>
	
<!-- 	INICIALIZAR EL TOOLTIP Y EL POPOVER -->
<script type="text/javascript">
	
	$( document ).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
  		$('[data-toggle="popover"]').popover();
  		
  		$('#legal_form_larga').show();
        $('#legal_form_mediana').hide();
        $('#legal_form_corta').hide();
        $("#legal_form_larga_table :input").attr("disabled", false);
        $("#legal_form_mediana_table :input").attr("disabled", "disabled"); 
        $("#legal_form_corta_table :input").attr("disabled", "disabled"); 
  		
  		$('#family').hide();
  		
  		
        // var i=1;
        var i=$('#num_fam_members').val();
        
        $("#add_row_0").click(function(){
        	i++; 
			$('#register_family_members_0 tr:last').after("<tr id=\"row" + i + "\"><td><select id=\"miembro_" + i + "\" name=\"miembro_" + i + "\"  size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Madre\">Madre</option><option value=\"Padre\">Padre</option><option value=\"Hijo/a\">Hijo/a</option><option value=\"Hermano/a\">Hermano/a</option><option value=\"Esposo/a\">Esposo/a</option><option value=\"Otro\">Otro</option></select></td><td><input type=\"text\"  name=\"miembro_nombre_" + i + "\" value=\"\" size=\"25\" maxlength=\"40\" required></td><td><input type=\"date\"  name=\"miembro_fecha_de_nacimiento_"  + i + "\" value=\"\" size=\"25\" maxlength=\"40\" required></td><td><select name=\"miembro_sexo_" + i + "\" size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Masculino\">Masculino</option><option value=\"Feminino\">Feminino</option></select>			</td><td><select name=\"miembro_nacionalidad_" + i + "\" size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Afganist�n\">Afganist�n</option><option value=\"Albania\">Albania</option><option value=\"Alemania\">Alemania</option><option value=\"Andorra\">Andorra</option><option value=\"Anguila\">Anguila</option><option value=\"Antigua y Barbuda\">Antigua y Barbuda</option><option value=\"Antillas Holandesas\">Antillas Holandesas</option><option value=\"Arabia Saudita\">Arabia Saudita</option><option value=\"Argelia\">Argelia</option><option value=\"Argentina\">Argentina</option><option value=\"Aruba\">Aruba</option><option value=\"Australia\">Australia</option><option value=\"Austria\">Austria</option><option value=\"Bahamas\">Bahamas</option><option value=\"Banglad�s/Bangladesh\">Banglad�s/Bangladesh</option><option value=\"Barbados\">Barbados</option><option value=\"Barbuda\">Barbuda</option><option value=\"B�lgica\">B�lgica</option><option value=\"Belice\">Belice</option><option value=\"Ben�n\">Ben�n</option><option value=\"Birmania\">Birmania</option><option value=\"Bolivia\">Bolivia</option><option value=\"Bonaire\">Bonaire</option><option value=\"Botswana\">Botswana</option><option value=\"Brasil\">Brasil</option><option value=\"Bulgaria\">Bulgaria</option><option value=\"Burkina Faso\">Burkina Faso</option><option value=\"Camboya\">Camboya</option><option value=\"Camer�n\">Camer�n</option><option value=\"Canad�\">Canad�</option><option value=\"Ceil�n\">Ceil�n</option><option value=\"Chad\">Chad</option><option value=\"Chile\">Chile</option><option value=\"China\">China</option><option value=\"Chipre\">Chipre</option><option value=\"Colombia\">Colombia</option><option value=\"Congo\">Congo</option><option value=\"Corea del Norte\">Corea del Norte</option><option value=\"Corea del Sur\">Corea del Sur</option><option value=\"Costa de Marfil\">Costa de Marfil</option><option value=\"Costa Rica\">Costa Rica</option><option value=\"Croacia\">Croacia</option><option value=\"Cuba\">Cuba</option><option value=\"Curazao\">Curazao</option><option value=\"Dinamarca\">Dinamarca</option><option value=\"Dominica\">Dominica</option><option value=\"Dubai\">Dubai</option><option value=\"Ecuador\">Ecuador</option><option value=\"Egipto\">Egipto</option><option value=\"El Salvador\">El Salvador</option><option value=\"Eritrea\">Eritrea</option><option value=\"Escocia\">Escocia</option><option value=\"Eslovaquia\">Eslovaquia</option><option value=\"Espa�a\">Espa�a</option><option value=\"Estados Unidos\">Estados Unidos</option><option value=\"Etiop�a\">Etiop�a</option><option value=\"Filipinas\">Filipinas</option><option value=\"Finlandia\">Finlandia</option><option value=\"Francia\">Francia</option><option value=\"Gab�n\">Gab�n</option><option value=\"Gales\">Gales</option><option value=\"Gambia\">Gambia</option><option value=\"Ghana\">Ghana</option><option value=\"Gran Breta�a\">Gran Breta�a</option><option value=\"Granada\">Granada</option><option value=\"Grecia\">Grecia</option><option value=\"Guadalupe\">Guadalupe</option><option value=\"Guam\">Guam</option><option value=\"Guatemala\">Guatemala</option><option value=\"Guinea\">Guinea</option><option value=\"Guinea Ecuatorial\">Guinea Ecuatorial</option><option value=\"Guinea-Bissau\">Guinea-Bissau</option><option value=\"Guyana\">Guyana</option><option value=\"Hait�\">Hait�</option><option value=\"Hawaii\">Hawaii</option><option value=\"Holanda\">Holanda</option><option value=\"Honduras\">Honduras</option><option value=\"India\">India</option><option value=\"Indonesia\">Indonesia</option><option value=\"Inglaterra\">Inglaterra</option><option value=\"Irak, Iraq\">Irak, Iraq</option><option value=\"Ir�n\">Ir�n</option><option value=\"Irlanda\">Irlanda</option><option value=\"Islandia\">Islandia</option><option value=\"Islas Caim�n\">Islas Caim�n</option><option value=\"Islas Turcas y Caicos\">Islas Turcas y Caicos</option><option value=\"Islas V�rgenes Brit�nicas\">Islas V�rgenes Brit�nicas</option><option value=\"Islas V�rgenes de Estados Unidos\">Islas V�rgenes de Estados Unidos</option><option value=\"Israel\">Israel</option><option value=\"Italia\">Italia</option><option value=\"Jamaica\">Jamaica</option><option value=\"Jap�n\">Jap�n</option><option value=\"Jordania\">Jordania</option><option value=\"Kenya\">Kenya</option><option value=\"Kuwait\">Kuwait</option><option value=\"Laos\">Laos</option><option value=\"las Islas Cook\">las Islas Cook</option><option value=\"L�bano\">L�bano</option><option value=\"Liberia\">Liberia</option><option value=\"Libia\">Libia</option><option value=\"Lituania\">Lituania</option><option value=\"Luxemburgo\">Luxemburgo</option><option value=\"Malasia\">Malasia</option><option value=\"Mali\">Mali</option><option value=\"Malta\">Malta</option><option value=\"Marruecos\">Marruecos</option><option value=\"Martinique\">Martinique</option><option value=\"Mauricio\">Mauricio</option><option value=\"Mauritania\">Mauritania</option><option value=\"M�xico, M�jico\">M�xico, M�jico</option><option value=\"M�naco\">M�naco</option><option value=\"Montserrat\">Montserrat</option><option value=\"Nepal\">Nepal</option><option value=\"Namibia\">Namibia</option><option value=\"Nicaragua\">Nicaragua</option><option value=\"Niger\">Niger</option><option value=\"Nigeria\">Nigeria</option><option value=\"Noruega\">Noruega</option><option value=\"Nueva Zelanda\">Nueva Zelanda</option><option value=\"Pa�ses Bajos\">Pa�ses Bajos</option><option value=\"Palestina\">Palestina</option><option value=\"Panam�\">Panam�</option><option value=\"Paquist�n\">Paquist�n</option><option value=\"Paraguay\">Paraguay</option><option value=\"Persia\">Persia</option><option value=\"Per�\">Per�</option><option value=\"Polonia\">Polonia</option><option value=\"Portugal\">Portugal</option><option value=\"Puerto Rico\">Puerto Rico</option><option value=\"Rep�blica Checa\">Rep�blica Checa</option><option value=\"Rep�blica Dominicana\">Rep�blica Dominicana</option><option value=\"Ruanda\">Ruanda</option><option value=\"Ruman�a\">Ruman�a</option><option value=\"Rusia\">Rusia</option><option value=\"Saba\">Saba</option><option value=\"Samoa\">Samoa</option><option value=\"San Bartolom�\">San Bartolom�</option><option value=\"San Crist�bal y Nieves\">San Crist�bal y Nieves</option><option value=\"San Eustaquio\">San Eustaquio</option><option value=\"San Mart�n\">San Mart�n</option><option value=\"San Vicente\">San Vicente</option><option value=\"Santa Luc�a\">Santa Luc�a</option><option value=\"Santo Tom�s\">Santo Tom�s</option><option value=\"Senegal\">Senegal</option><option value=\"Sierra Leona\">Sierra Leona</option><option value=\"Siria\">Siria</option><option value=\"Somalia\">Somalia</option><option value=\"Sri Lanka\">Sri Lanka</option><option value=\"Sud�frica\">Sud�frica</option><option value=\"Sud�n\">Sud�n</option><option value=\"Suecia\">Suecia</option><option value=\"Suiza\">Suiza</option><option value=\"Surinam\">Surinam</option><option value=\"Tailandia\">Tailandia</option><option value=\"Taiw�n\">Taiw�n</option><option value=\"Tanzania\">Tanzania</option><option value=\"Togo\">Togo</option><option value=\"Trinidad y Tobago\">Trinidad y Tobago</option><option value=\"T�nez\">T�nez</option><option value=\"Turqu�a\">Turqu�a</option><option value=\"Ucrania\">Ucrania</option><option value=\"Uganda\">Uganda</option><option value=\"Uruguay\">Uruguay</option><option value=\"Venezuela\">Venezuela</option><option value=\"Vietnam\">Vietnam</option><option value=\"Yemen\">Yemen</option><option value=\"Yugoslavia\">Yugoslavia</option><option value=\"Zaire\">Zaire</option><option value=\"Zambia\">Zambia</option><option value=\"Zimbabwe\">Zimbabwe</option></select></td><td><input type=\"text\"  name=\"miembro_ocupacion_" + i + "\" value=\"\" size=\"25\" maxlength=\"40\"></td></tr>");		
			$('#num_fam_members').val(i);
			
			
			// alert("i = " +  i);
			
			
	        if (i>1) {
	        	
				$('.btn').removeClass('disabled');
	        	$('.btn').addClass('active');
	        } 
     	});
        
        
        $("#add_row").click(function(){
        	i++; 
			$('#register_family_members tr:last').after("<tr id=\"row" + i + "\"><td><select id=\"miembro_" + i + "\" name=\"miembro_" + i + "\"  size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Madre\">Madre</option><option value=\"Padre\">Padre</option><option value=\"Hijo/a\">Hijo/a</option><option value=\"Hermano/a\">Hermano/a</option><option value=\"Esposo/a\">Esposo/a</option><option value=\"Otro\">Otro</option></select></td><td><input type=\"text\"  name=\"miembro_nombre_" + i + "\" value=\"\" size=\"25\" maxlength=\"40\" required></td><td><input type=\"date\"  name=\"miembro_fecha_de_nacimiento_"  + i + "\" value=\"\" size=\"25\" maxlength=\"40\" required></td><td><select name=\"miembro_sexo_" + i + "\" size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Masculino\">Masculino</option><option value=\"Feminino\">Feminino</option></select>			</td><td><select name=\"miembro_nacionalidad_" + i + "\" size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Afganist�n\">Afganist�n</option><option value=\"Albania\">Albania</option><option value=\"Alemania\">Alemania</option><option value=\"Andorra\">Andorra</option><option value=\"Anguila\">Anguila</option><option value=\"Antigua y Barbuda\">Antigua y Barbuda</option><option value=\"Antillas Holandesas\">Antillas Holandesas</option><option value=\"Arabia Saudita\">Arabia Saudita</option><option value=\"Argelia\">Argelia</option><option value=\"Argentina\">Argentina</option><option value=\"Aruba\">Aruba</option><option value=\"Australia\">Australia</option><option value=\"Austria\">Austria</option><option value=\"Bahamas\">Bahamas</option><option value=\"Banglad�s/Bangladesh\">Banglad�s/Bangladesh</option><option value=\"Barbados\">Barbados</option><option value=\"Barbuda\">Barbuda</option><option value=\"B�lgica\">B�lgica</option><option value=\"Belice\">Belice</option><option value=\"Ben�n\">Ben�n</option><option value=\"Birmania\">Birmania</option><option value=\"Bolivia\">Bolivia</option><option value=\"Bonaire\">Bonaire</option><option value=\"Botswana\">Botswana</option><option value=\"Brasil\">Brasil</option><option value=\"Bulgaria\">Bulgaria</option><option value=\"Burkina Faso\">Burkina Faso</option><option value=\"Camboya\">Camboya</option><option value=\"Camer�n\">Camer�n</option><option value=\"Canad�\">Canad�</option><option value=\"Ceil�n\">Ceil�n</option><option value=\"Chad\">Chad</option><option value=\"Chile\">Chile</option><option value=\"China\">China</option><option value=\"Chipre\">Chipre</option><option value=\"Colombia\">Colombia</option><option value=\"Congo\">Congo</option><option value=\"Corea del Norte\">Corea del Norte</option><option value=\"Corea del Sur\">Corea del Sur</option><option value=\"Costa de Marfil\">Costa de Marfil</option><option value=\"Costa Rica\">Costa Rica</option><option value=\"Croacia\">Croacia</option><option value=\"Cuba\">Cuba</option><option value=\"Curazao\">Curazao</option><option value=\"Dinamarca\">Dinamarca</option><option value=\"Dominica\">Dominica</option><option value=\"Dubai\">Dubai</option><option value=\"Ecuador\">Ecuador</option><option value=\"Egipto\">Egipto</option><option value=\"El Salvador\">El Salvador</option><option value=\"Eritrea\">Eritrea</option><option value=\"Escocia\">Escocia</option><option value=\"Eslovaquia\">Eslovaquia</option><option value=\"Espa�a\">Espa�a</option><option value=\"Estados Unidos\">Estados Unidos</option><option value=\"Etiop�a\">Etiop�a</option><option value=\"Filipinas\">Filipinas</option><option value=\"Finlandia\">Finlandia</option><option value=\"Francia\">Francia</option><option value=\"Gab�n\">Gab�n</option><option value=\"Gales\">Gales</option><option value=\"Gambia\">Gambia</option><option value=\"Ghana\">Ghana</option><option value=\"Gran Breta�a\">Gran Breta�a</option><option value=\"Granada\">Granada</option><option value=\"Grecia\">Grecia</option><option value=\"Guadalupe\">Guadalupe</option><option value=\"Guam\">Guam</option><option value=\"Guatemala\">Guatemala</option><option value=\"Guinea\">Guinea</option><option value=\"Guinea Ecuatorial\">Guinea Ecuatorial</option><option value=\"Guinea-Bissau\">Guinea-Bissau</option><option value=\"Guyana\">Guyana</option><option value=\"Hait�\">Hait�</option><option value=\"Hawaii\">Hawaii</option><option value=\"Holanda\">Holanda</option><option value=\"Honduras\">Honduras</option><option value=\"India\">India</option><option value=\"Indonesia\">Indonesia</option><option value=\"Inglaterra\">Inglaterra</option><option value=\"Irak, Iraq\">Irak, Iraq</option><option value=\"Ir�n\">Ir�n</option><option value=\"Irlanda\">Irlanda</option><option value=\"Islandia\">Islandia</option><option value=\"Islas Caim�n\">Islas Caim�n</option><option value=\"Islas Turcas y Caicos\">Islas Turcas y Caicos</option><option value=\"Islas V�rgenes Brit�nicas\">Islas V�rgenes Brit�nicas</option><option value=\"Islas V�rgenes de Estados Unidos\">Islas V�rgenes de Estados Unidos</option><option value=\"Israel\">Israel</option><option value=\"Italia\">Italia</option><option value=\"Jamaica\">Jamaica</option><option value=\"Jap�n\">Jap�n</option><option value=\"Jordania\">Jordania</option><option value=\"Kenya\">Kenya</option><option value=\"Kuwait\">Kuwait</option><option value=\"Laos\">Laos</option><option value=\"las Islas Cook\">las Islas Cook</option><option value=\"L�bano\">L�bano</option><option value=\"Liberia\">Liberia</option><option value=\"Libia\">Libia</option><option value=\"Lituania\">Lituania</option><option value=\"Luxemburgo\">Luxemburgo</option><option value=\"Malasia\">Malasia</option><option value=\"Mali\">Mali</option><option value=\"Malta\">Malta</option><option value=\"Marruecos\">Marruecos</option><option value=\"Martinique\">Martinique</option><option value=\"Mauricio\">Mauricio</option><option value=\"Mauritania\">Mauritania</option><option value=\"M�xico, M�jico\">M�xico, M�jico</option><option value=\"M�naco\">M�naco</option><option value=\"Montserrat\">Montserrat</option><option value=\"Nepal\">Nepal</option><option value=\"Namibia\">Namibia</option><option value=\"Nicaragua\">Nicaragua</option><option value=\"Niger\">Niger</option><option value=\"Nigeria\">Nigeria</option><option value=\"Noruega\">Noruega</option><option value=\"Nueva Zelanda\">Nueva Zelanda</option><option value=\"Pa�ses Bajos\">Pa�ses Bajos</option><option value=\"Palestina\">Palestina</option><option value=\"Panam�\">Panam�</option><option value=\"Paquist�n\">Paquist�n</option><option value=\"Paraguay\">Paraguay</option><option value=\"Persia\">Persia</option><option value=\"Per�\">Per�</option><option value=\"Polonia\">Polonia</option><option value=\"Portugal\">Portugal</option><option value=\"Puerto Rico\">Puerto Rico</option><option value=\"Rep�blica Checa\">Rep�blica Checa</option><option value=\"Rep�blica Dominicana\">Rep�blica Dominicana</option><option value=\"Ruanda\">Ruanda</option><option value=\"Ruman�a\">Ruman�a</option><option value=\"Rusia\">Rusia</option><option value=\"Saba\">Saba</option><option value=\"Samoa\">Samoa</option><option value=\"San Bartolom�\">San Bartolom�</option><option value=\"San Crist�bal y Nieves\">San Crist�bal y Nieves</option><option value=\"San Eustaquio\">San Eustaquio</option><option value=\"San Mart�n\">San Mart�n</option><option value=\"San Vicente\">San Vicente</option><option value=\"Santa Luc�a\">Santa Luc�a</option><option value=\"Santo Tom�s\">Santo Tom�s</option><option value=\"Senegal\">Senegal</option><option value=\"Sierra Leona\">Sierra Leona</option><option value=\"Siria\">Siria</option><option value=\"Somalia\">Somalia</option><option value=\"Sri Lanka\">Sri Lanka</option><option value=\"Sud�frica\">Sud�frica</option><option value=\"Sud�n\">Sud�n</option><option value=\"Suecia\">Suecia</option><option value=\"Suiza\">Suiza</option><option value=\"Surinam\">Surinam</option><option value=\"Tailandia\">Tailandia</option><option value=\"Taiw�n\">Taiw�n</option><option value=\"Tanzania\">Tanzania</option><option value=\"Togo\">Togo</option><option value=\"Trinidad y Tobago\">Trinidad y Tobago</option><option value=\"T�nez\">T�nez</option><option value=\"Turqu�a\">Turqu�a</option><option value=\"Ucrania\">Ucrania</option><option value=\"Uganda\">Uganda</option><option value=\"Uruguay\">Uruguay</option><option value=\"Venezuela\">Venezuela</option><option value=\"Vietnam\">Vietnam</option><option value=\"Yemen\">Yemen</option><option value=\"Yugoslavia\">Yugoslavia</option><option value=\"Zaire\">Zaire</option><option value=\"Zambia\">Zambia</option><option value=\"Zimbabwe\">Zimbabwe</option></select></td><td><input type=\"text\"  name=\"miembro_ocupacion_" + i + "\" value=\"\" size=\"25\" maxlength=\"40\"></td><td><select id=\"miembrr\" name=\"miembro_lugar_" + i + "\"  size=\"1\" required=\"required\"><option value=\"\"></option><option value=\"Afganist�n\">Afganist�n</option><option value=\"Albania\">Albania</option><option value=\"Alemania\">Alemania</option><option value=\"Andorra\">Andorra</option><option value=\"Anguila\">Anguila</option><option value=\"Antigua y Barbuda\">Antigua y Barbuda</option><option value=\"Antillas Holandesas\">Antillas Holandesas</option><option value=\"Arabia Saudita\">Arabia Saudita</option><option value=\"Argelia\">Argelia</option><option value=\"Argentina\">Argentina</option><option value=\"Aruba\">Aruba</option><option value=\"Australia\">Australia</option><option value=\"Austria\">Austria</option><option value=\"Bahamas\">Bahamas</option><option value=\"Banglad�s/Bangladesh\">Banglad�s/Bangladesh</option><option value=\"Barbados\">Barbados</option><option value=\"Barbuda\">Barbuda</option><option value=\"B�lgica\">B�lgica</option><option value=\"Belice\">Belice</option><option value=\"Ben�n\">Ben�n</option><option value=\"Birmania\">Birmania</option><option value=\"Bolivia\">Bolivia</option><option value=\"Bonaire\">Bonaire</option><option value=\"Botswana\">Botswana</option><option value=\"Brasil\">Brasil</option><option value=\"Bulgaria\">Bulgaria</option><option value=\"Burkina Faso\">Burkina Faso</option><option value=\"Camboya\">Camboya</option><option value=\"Camer�n\">Camer�n</option><option value=\"Canad�\">Canad�</option><option value=\"Ceil�n\">Ceil�n</option><option value=\"Chad\">Chad</option><option value=\"Chile\">Chile</option><option value=\"China\">China</option><option value=\"Chipre\">Chipre</option><option value=\"Colombia\">Colombia</option><option value=\"Congo\">Congo</option><option value=\"Corea del Norte\">Corea del Norte</option><option value=\"Corea del Sur\">Corea del Sur</option><option value=\"Costa de Marfil\">Costa de Marfil</option><option value=\"Costa Rica\">Costa Rica</option><option value=\"Croacia\">Croacia</option><option value=\"Cuba\">Cuba</option><option value=\"Curazao\">Curazao</option><option value=\"Dinamarca\">Dinamarca</option><option value=\"Dominica\">Dominica</option><option value=\"Dubai\">Dubai</option><option value=\"Ecuador\">Ecuador</option><option value=\"Egipto\">Egipto</option><option value=\"El Salvador\">El Salvador</option><option value=\"Eritrea\">Eritrea</option><option value=\"Escocia\">Escocia</option><option value=\"Eslovaquia\">Eslovaquia</option><option value=\"Espa�a\">Espa�a</option><option value=\"Estados Unidos\">Estados Unidos</option><option value=\"Etiop�a\">Etiop�a</option><option value=\"Filipinas\">Filipinas</option><option value=\"Finlandia\">Finlandia</option><option value=\"Francia\">Francia</option><option value=\"Gab�n\">Gab�n</option><option value=\"Gales\">Gales</option><option value=\"Gambia\">Gambia</option><option value=\"Ghana\">Ghana</option><option value=\"Gran Breta�a\">Gran Breta�a</option><option value=\"Granada\">Granada</option><option value=\"Grecia\">Grecia</option><option value=\"Guadalupe\">Guadalupe</option><option value=\"Guam\">Guam</option><option value=\"Guatemala\">Guatemala</option><option value=\"Guinea\">Guinea</option><option value=\"Guinea Ecuatorial\">Guinea Ecuatorial</option><option value=\"Guinea-Bissau\">Guinea-Bissau</option><option value=\"Guyana\">Guyana</option><option value=\"Hait�\">Hait�</option><option value=\"Hawaii\">Hawaii</option><option value=\"Holanda\">Holanda</option><option value=\"Honduras\">Honduras</option><option value=\"India\">India</option><option value=\"Indonesia\">Indonesia</option><option value=\"Inglaterra\">Inglaterra</option><option value=\"Irak, Iraq\">Irak, Iraq</option><option value=\"Ir�n\">Ir�n</option><option value=\"Irlanda\">Irlanda</option><option value=\"Islandia\">Islandia</option><option value=\"Islas Caim�n\">Islas Caim�n</option><option value=\"Islas Turcas y Caicos\">Islas Turcas y Caicos</option><option value=\"Islas V�rgenes Brit�nicas\">Islas V�rgenes Brit�nicas</option><option value=\"Islas V�rgenes de Estados Unidos\">Islas V�rgenes de Estados Unidos</option><option value=\"Israel\">Israel</option><option value=\"Italia\">Italia</option><option value=\"Jamaica\">Jamaica</option><option value=\"Jap�n\">Jap�n</option><option value=\"Jordania\">Jordania</option><option value=\"Kenya\">Kenya</option><option value=\"Kuwait\">Kuwait</option><option value=\"Laos\">Laos</option><option value=\"las Islas Cook\">las Islas Cook</option><option value=\"L�bano\">L�bano</option><option value=\"Liberia\">Liberia</option><option value=\"Libia\">Libia</option><option value=\"Lituania\">Lituania</option><option value=\"Luxemburgo\">Luxemburgo</option><option value=\"Malasia\">Malasia</option><option value=\"Mali\">Mali</option><option value=\"Malta\">Malta</option><option value=\"Marruecos\">Marruecos</option><option value=\"Martinique\">Martinique</option><option value=\"Mauricio\">Mauricio</option><option value=\"Mauritania\">Mauritania</option><option value=\"M�xico, M�jico\">M�xico, M�jico</option><option value=\"M�naco\">M�naco</option><option value=\"Montserrat\">Montserrat</option><option value=\"Nepal\">Nepal</option><option value=\"Namibia\">Namibia</option><option value=\"Nicaragua\">Nicaragua</option><option value=\"Niger\">Niger</option><option value=\"Nigeria\">Nigeria</option><option value=\"Noruega\">Noruega</option><option value=\"Nueva Zelanda\">Nueva Zelanda</option><option value=\"Pa�ses Bajos\">Pa�ses Bajos</option><option value=\"Palestina\">Palestina</option><option value=\"Panam�\">Panam�</option><option value=\"Paquist�n\">Paquist�n</option><option value=\"Paraguay\">Paraguay</option><option value=\"Persia\">Persia</option><option value=\"Per�\">Per�</option><option value=\"Polonia\">Polonia</option><option value=\"Portugal\">Portugal</option><option value=\"Puerto Rico\">Puerto Rico</option><option value=\"Rep�blica Checa\">Rep�blica Checa</option><option value=\"Rep�blica Dominicana\">Rep�blica Dominicana</option><option value=\"Ruanda\">Ruanda</option><option value=\"Ruman�a\">Ruman�a</option><option value=\"Rusia\">Rusia</option><option value=\"Saba\">Saba</option><option value=\"Samoa\">Samoa</option><option value=\"San Bartolom�\">San Bartolom�</option><option value=\"San Crist�bal y Nieves\">San Crist�bal y Nieves</option><option value=\"San Eustaquio\">San Eustaquio</option><option value=\"San Mart�n\">San Mart�n</option><option value=\"San Vicente\">San Vicente</option><option value=\"Santa Luc�a\">Santa Luc�a</option><option value=\"Santo Tom�s\">Santo Tom�s</option><option value=\"Senegal\">Senegal</option><option value=\"Sierra Leona\">Sierra Leona</option><option value=\"Siria\">Siria</option><option value=\"Somalia\">Somalia</option><option value=\"Sri Lanka\">Sri Lanka</option><option value=\"Sud�frica\">Sud�frica</option><option value=\"Sud�n\">Sud�n</option><option value=\"Suecia\">Suecia</option><option value=\"Suiza\">Suiza</option><option value=\"Surinam\">Surinam</option><option value=\"Tailandia\">Tailandia</option><option value=\"Taiw�n\">Taiw�n</option><option value=\"Tanzania\">Tanzania</option><option value=\"Togo\">Togo</option><option value=\"Trinidad y Tobago\">Trinidad y Tobago</option><option value=\"T�nez\">T�nez</option><option value=\"Turqu�a\">Turqu�a</option><option value=\"Ucrania\">Ucrania</option><option value=\"Uganda\">Uganda</option><option value=\"Uruguay\">Uruguay</option><option value=\"Venezuela\">Venezuela</option><option value=\"Vietnam\">Vietnam</option><option value=\"Yemen\">Yemen</option><option value=\"Yugoslavia\">Yugoslavia</option><option value=\"Zaire\">Zaire</option><option value=\"Zambia\">Zambia</option><option value=\"Zimbabwe\">Zimbabwe</option></select></td></tr>");		
			$('#num_fam_members').val(i);
			
			
			// alert("i = " +  i);
			
			
	        if (i>1) {
	        	
				$('.btn').removeClass('disabled');
	        	$('.btn').addClass('active');
	        } 
     	});
        
        $("#delete_row").click(function(){
            if(i>1){
				
            	$("#row"+(i)).remove();
            	i--;
				$('#num_fam_members').val(i);
				
				// alert("i = " +  $('#num_fam_members').val() );
									
				if (i<2) {
					$("#delete_row").removeClass('active');
					$("#delete_row").addClass('disabled');
				}
				
            }
            return(false);
        });  				
		
	});
	
	$(document).on("change", "#pre_tiene_familiares", function () {
		
		if ($("input[name=pre_tiene_familiares]:checked").val() == "yes") {
					        
	        $('#family').show();
	        $("#register_family_members_0 :input").attr("disabled", false); 
	        $("#register_family_members :input").attr("disabled", false); 

			
		} else if ($("input[name=pre_tiene_familiares]:checked").val() == "no") {
			
			
			
			$('#family').hide();
			
			$("#register_family_members_0 :input").attr("disabled", "disabled"); 
			$("#register_family_members :input").attr("disabled", "disabled"); 
		} 

	});
	
	$(document).on("change", "#legal_version", function () {
		
		if ($("input[name=legal_version]:checked").val() == "larga") {
					        
	        $('#legal_form_larga').show();
	        $('#legal_form_mediana').hide();
	        $('#legal_form_corta').hide();
	        $("#legal_form_larga_table :input").attr("disabled", false);
	        $("#legal_form_mediana_table :input").attr("disabled", "disabled"); 
	        $("#legal_form_corta_table :input").attr("disabled", "disabled"); 
	        
	        
		} else if ($("input[name=legal_version]:checked").val() == "mediana") {
					        
			 $('#legal_form_larga').hide();
		        $('#legal_form_mediana').show();
		        $('#legal_form_corta').hide();
		        $("#legal_form_larga_table :input").attr("disabled", "disabled");
		        $("#legal_form_mediana_table :input").attr("disabled", false); 
		        $("#legal_form_corta_table :input").attr("disabled", "disabled"); 
	        
		} else if ($("input[name=legal_version]:checked").val() == "corta") {
					        
			 $('#legal_form_larga').hide();
		        $('#legal_form_mediana').hide();
		        $('#legal_form_corta').show();
		        $("#legal_form_larga_table :input").attr("disabled", "disabled");
		        $("#legal_form_mediana_table :input").attr("disabled", "disabled"); 
		        $("#legal_form_corta_table :input").attr("disabled", false); 
	        	
		} 

	});
	
</script>