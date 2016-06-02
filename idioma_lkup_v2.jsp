<%
	if (session.getAttribute("temp_solicitante_pre_idioma_lkup") == null) {
		session.setAttribute("temp_solicitante_pre_idioma_lkup","");
	}
%>

<option value="Alemán"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Alemán")) { out.println("selected"); } %>>Alemán</option>
<option value="Árabe"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Árabe")) { out.println("selected"); } %>>Árabe</option>
<option value="Bengalí"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Bengalí")) { out.println("selected"); } %>>Bengalí</option>
<option value="Cantonés"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Cantonés")) { out.println("selected"); } %>>Cantonés</option>
<option value="Chino"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Chino")) { out.println("selected"); } %>>Chino</option>
<option value="Coreano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Coreano")) { out.println("selected"); } %>>Coreano</option>
<option value="Español"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Español")) { out.println("selected"); } %>>Español</option>
<option value="Francés"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Francés")) { out.println("selected"); } %>>Francés</option>
<option value="Hindi-Urdu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Hindi-Urdu")) { out.println("selected"); } %>>Hindi-Urdu</option>
<option value="Inglés"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Inglés")) { out.println("selected"); } %>>Inglés</option>
<option value="Italiano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Italiano")) { out.println("selected"); } %>>Italiano</option>
<option value="Japonés"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Japonés")) { out.println("selected"); } %>>Japonés</option>
<option value="Javanés"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Javanés")) { out.println("selected"); } %>>Javanés</option>
<option value="Marathi"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Marathi")) { out.println("selected"); } %>>Marathi</option>
<option value="Portugués"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Portugués")) { out.println("selected"); } %>>Portugués</option>
<option value="Ruso"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Ruso")) { out.println("selected"); } %>>Ruso</option>
<option value="Tamil"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Tamil")) { out.println("selected"); } %>>Tamil</option>
<option value="Telugu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Telugu")) { out.println("selected"); } %>>Telugu</option>
<option value="Ucraniano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Ucraniano")) { out.println("selected"); } %>>Ucraniano</option>
<option value="Wu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Wu")) { out.println("selected"); } %>>Wu</option>