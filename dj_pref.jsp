<fieldset>
<table border="0" cellspacing="2" cellpadding="4" width="600">
	<tr class="datatableheaderv2">
		<th class="datatableheaderv2" align="left">Sexo del entrevistador / idioma en que se realizará la entrevista	
		</th>
	</tr>
	<tr class="datatablerowv2">
		<td>Indicar si tiene preferencia, en cuanto a ser entrevistado/a por un/a funcionario/a o intérprete?
			<select name="pre_pref" size="1">
			<option value=""></option>
			<option value="Si" <% if (session.getAttribute("temp_solicitante_v2_pre_pref").equals("Si")) {%> selected <% } %>>Si</option>
			<option value="No" <% if (session.getAttribute("temp_solicitante_v2_pre_pref").equals("No")) {%> selected <% } %>>No</option>
			</select>		
		</td>
	</tr>
	<tr class="datatablerowaltv2">
		<td>Si su respuesta es <strong>si</strong>, precisar el sexo de la persona funcionaria o intérprete de su preferencia: 
			<select name="pre_pref_sexo" size="1">
			<option value=""></option>
			<option value="Masculino"<% if (session.getAttribute("temp_solicitante_v2_pre_pref_sexo").equals("Masculino")) {%> selected <% } %>>Masculino</option>
			<option value="Feminino" <% if (session.getAttribute("temp_solicitante_v2_pre_pref_sexo").equals("Feminino")) {%> selected <% } %>>Feminino</option>
			</select>		
		</td>	    
	</tr>
	<tr class="datatablerowv2">
	    <td>¿Qué idioma prefiere para sus entrevistas en la ONPAR? <input type="text" name="pre_pref_idioma" value="<%= session.getAttribute("temp_solicitante_v2_pre_pref_idioma") %>" size="25" maxlength="40"></td>	    
	</tr>
</table>
</fieldset>