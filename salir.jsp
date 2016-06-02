<%

session.setAttribute("id",null);
session.setAttribute("user_status_cd",null);
session.setAttribute("role_id",null);
session.setAttribute("email",null);
session.setAttribute("pwd",null);
session.setAttribute("first_nm",null);
session.setAttribute("last_nm",null);
session.setAttribute("position_title",null);
session.setAttribute("organization",null);
session.setAttribute("tel_nbr",null);
session.setAttribute("skype_handle",null);
session.setAttribute("alternate",null);
session.setAttribute("last_mod_tmstmp",null);

session.setAttribute("temp_id", null);
session.setAttribute("temp_user_status_cd",null);
session.setAttribute("temp_role_id",null);
session.setAttribute("temp_email",null);
session.setAttribute("temp_pwd",null);
session.setAttribute("temp_first_nm",null);
session.setAttribute("temp_last_nm",null);
session.setAttribute("temp_position_title",null);
session.setAttribute("temp_organization",null);
session.setAttribute("temp_tel_nbr",null);
session.setAttribute("temp_skype_handle",null);
session.setAttribute("temp_alternate",null);
session.setAttribute("temp_last_mod_tmstmp",null);

session.setAttribute("temp_familia_id",null);
session.setAttribute("temp_familia_solicitante_id",null);
session.setAttribute("temp_familia_nombre", null);
session.setAttribute("temp_familia_edad", null);				
session.setAttribute("temp_familia_parentesco_lkup", null);
session.setAttribute("temp_familia_ubicacion", null);
session.setAttribute("temp_familia_pais_lkup", null);
session.setAttribute("temp_familia_ocupacion", null);

session.setAttribute("temp_prueba_id",null);
session.setAttribute("temp_prueba_solicitante_id",null);
session.setAttribute("temp_prueba_dsc",null);
session.setAttribute("temp_prueba_file",null);
%>

<jsp:include page="reset_solicitante.jsp" />

<%

response.sendRedirect("/onpar/main.jsp?target=acceder");

%>