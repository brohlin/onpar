<%
	if (session.getAttribute("temp_solicitante_pre_religion_lkup") == null) {
		session.setAttribute("temp_solicitante_pre_religion_lkup","");
	}
%>

<option value="Ateismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Ateismo")) { out.println("selected"); } %>>Ateismo</option>
<option value="Budismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Budismo")) { out.println("selected"); } %>>Budismo</option>
<option value="Confucianismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Confucianismo")) { out.println("selected"); } %>>Confucianismo</option>
<option value="Cristianismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Cristianismo")) { out.println("selected"); } %>>Cristianismo</option>
<option value="Fe Bahai"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Fe Bahai")) { out.println("selected"); } %>>Fe Bahai</option>
<option value="Hinduismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Hinduismo")) { out.println("selected"); } %>>Hinduismo</option>
<option value="Islam"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Islam")) { out.println("selected"); } %>>Islam</option>
<option value="Judaismo"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Judaismo")) { out.println("selected"); } %>>Judaismo</option>
<option value="Ortodoxa"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Ortodoxa")) { out.println("selected"); } %>>Ortodoxa</option>
<option value="Protestante"<% if (session.getAttribute("temp_solicitante_pre_religion_lkup").equals("Protestante")) { out.println("selected"); } %>>Protestante</option>