<%
	if (session.getAttribute("temp_solicitante_pre_idioma_lkup") == null) {
		session.setAttribute("temp_solicitante_pre_idioma_lkup","");
	}
%>

<option value="Alem�n"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Alem�n")) { out.println("selected"); } %>>Alem�n</option>
<option value="�rabe"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("�rabe")) { out.println("selected"); } %>>�rabe</option>
<option value="Bengal�"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Bengal�")) { out.println("selected"); } %>>Bengal�</option>
<option value="Canton�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Canton�s")) { out.println("selected"); } %>>Canton�s</option>
<option value="Chino"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Chino")) { out.println("selected"); } %>>Chino</option>
<option value="Coreano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Coreano")) { out.println("selected"); } %>>Coreano</option>
<option value="Espa�ol"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Espa�ol")) { out.println("selected"); } %>>Espa�ol</option>
<option value="Franc�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Franc�s")) { out.println("selected"); } %>>Franc�s</option>
<option value="Hindi-Urdu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Hindi-Urdu")) { out.println("selected"); } %>>Hindi-Urdu</option>
<option value="Ingl�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Ingl�s")) { out.println("selected"); } %>>Ingl�s</option>
<option value="Italiano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Italiano")) { out.println("selected"); } %>>Italiano</option>
<option value="Japon�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Japon�s")) { out.println("selected"); } %>>Japon�s</option>
<option value="Javan�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Javan�s")) { out.println("selected"); } %>>Javan�s</option>
<option value="Marathi"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Marathi")) { out.println("selected"); } %>>Marathi</option>
<option value="Portugu�s"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Portugu�s")) { out.println("selected"); } %>>Portugu�s</option>
<option value="Ruso"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Ruso")) { out.println("selected"); } %>>Ruso</option>
<option value="Tamil"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Tamil")) { out.println("selected"); } %>>Tamil</option>
<option value="Telugu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Telugu")) { out.println("selected"); } %>>Telugu</option>
<option value="Ucraniano"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Ucraniano")) { out.println("selected"); } %>>Ucraniano</option>
<option value="Wu"<% if (session.getAttribute("temp_solicitante_pre_idioma_lkup").equals("Wu")) { out.println("selected"); } %>>Wu</option>