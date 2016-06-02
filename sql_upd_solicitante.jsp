<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "update solicitante set " + 
					"pre_primer_nombre = ? , " + 
					"pre_segundo_nombre = ? , " + 
					"pre_apellido_paterno = ? , " + 
					"pre_apellido_materno = ? , " + 
					"pre_direccion_actual = ? , " + 
					"pre_telefono1 = ? , " + 
					"pre_telefono2 = ? , " + 
					"pre_pais_de_origen_lkup = ? , " + 
					"pre_pais_de_nacimiento_lkup = ? , " + 
					"pre_ciudad_de_nacimiento = ? , " + 
					"pre_fecha_de_nacimiento = ? , " + 
					"pre_nacionalidad_lkup = ? , " + 
					"pre_otra_nacionalidad_lkup = ? , " + 
					"pre_etnico_o_tribu = ? , " + 
					"pre_identificacion1 = ? , " + 
					"pre_typo_identificacion1_lkup = ? , " + 
					"pre_identificacion2 = ? , " + 
					"pre_typo_identificacion2_lkup = ? , " + 
					"pre_identificacion3 = ? , " + 
					"pre_typo_identificacion3_lkup = ? , " + 
					"pre_identificacion4 = ? , " + 
					"pre_typo_identificacion4_lkup = ? , " + 
					"pre_identificacion5 = ? , " + 
					"pre_typo_identificacion5_lkup = ? , " + 
					"pre_educ_nivel_primario = ? , " + 
					"pre_educ_primario_nombre = ? , " + 
					"pre_educ_nivel_secundario = ? , " + 
					"pre_educ_secundario_nombre = ? , " + 
					"pre_educ_universitario = ? , " + 
					"pre_educ_universidad_nombre = ? , " + 
					"pre_educ_otros = ? , " + 
					"pre_idioma_lkup = ? , " + 
					"pre_religion_lkup = ? , " + 
					"pre_profesion = ? , " + 
					"pre_ocup_pais_de_origen = ? , " + 
					"pre_ingreso_mensual_pais_de_origen = ? , " + 
					"pre_estatus_civil_lkup = ? , " + 
					"pre_nombre_conyuge = ? , " + 
					"pre_edad_conyuge = ? , " + 
					"pre_ubic_actual_conyuge = ? , " + 
					"pre_ayuda_de_ong = ? , " + 
					"pre_fam_en_riesgo = ? , " + 
					"pre_situ_econ_lkup = ? , " + 
					"pre_situ_salud = ? , " + 
					"pre_radicado_en_pan = ? , " + 
					"pre_fecha_de_salida_origen = ? , " + 
					"pre_ruta_de_llegada = ? , " + 
					"pre_proteccion_pedido_otro_pais = ? , " + 
					"pre_transporte_util_lkup = ? , " + 
					"pre_nombre_de_nave_y_bandera = ? , " + 
					"pre_mencione_alguna_haya_ayudado_lkup = ? , " + 
					"pre_mencione_alguna_haya_ayudado = ? , " + 
					"pre_fecha_llegada_panama = ? , " + 
					"pre_familiares_en_pan = ? , " + 
					"pre_ha_estado_en_pan_antes = ? , " + 
					"pre_motivo_de_persecucion_lkup = ? , " + 
					"pre_ident_agent_persecucion_lkup = ? , " + 
					"pre_ident_agent_persecucion_expl = ? , " + 
					"pre_org_pertenecidos = ? , " + 
					"pre_org_pertenecidos_desc = ? , " + 
					"pre_arrestado_condenado_lkup = ? , " + 
					"pre_arrestado_condenado_desc = ? , " + 
					"pre_fecha_solicitud_onpar = ? , " + 
					"pre_violencia_fisica_armado_lkup = ? , " + 
					"pre_violencia_fisica_armado_desc = ? , " + 
					"pre_justifica_legal = ? , " + 
					"pre_permitido_regresar_al_pais_lkup = ? , " + 
					"pre_forma_afectado_al_regresar_lkup = ? , " + 
					"pre_forma_afectado_al_regresar_desc = ? , " + 
					"pre_hechos_para_regresar = ? , " + 
					"pre_fundado_temor = ? , " + 
					"pre_genero_lkup = ? , " + 
					"pre_nombre_padre = ? , " + 
					"pre_nombre_madre = ? , " + 
					"pre_necesidad_interprete_lkup = ? , " + 
					"pre_lugar_de_trabajo = ? , " + 
					"pre_fecha_entrevista_legal = ? , " + 
					"pre_fecha_entrevista_social = ? , " + 
					"last_mod_tmstmp = now()  " + 
					  "where id = ?";
	
	Connection con = null;
	PreparedStatement prest = null;
	

	DataSource OnparDB;
	javax.naming.Context initCtx = new javax.naming.InitialContext();
	javax.naming.Context envCtx = (javax.naming.Context) initCtx.lookup("java:comp/env");
	OnparDB = (DataSource) envCtx.lookup("jdbc/OnparDB");

	try{
		if(OnparDB == null) {
			javax.naming.Context initCtx1 = new javax.naming.InitialContext();
			javax.naming.Context envCtx1 = (javax.naming.Context) initCtx1.lookup("java:comp/env");
			OnparDB = (DataSource) envCtx1.lookup("jdbc/OnparDB");
		}
	} catch(Exception e){
		System.out.println("inside the context exception");
		e.printStackTrace();
	}


	con = OnparDB.getConnection();	
	
	try{
		if (session.getAttribute("email") != null) {


			prest=con.prepareStatement(mQuery);
			prest.setString(1,request.getParameter("pre_primer_nombre"));
			prest.setString(2,request.getParameter("pre_segundo_nombre"));
			prest.setString(3,request.getParameter("pre_apellido_paterno"));
			prest.setString(4,request.getParameter("pre_apellido_materno"));
			prest.setString(5,request.getParameter("pre_direccion_actual"));
			prest.setString(6,request.getParameter("pre_telefono1"));
			prest.setString(7,request.getParameter("pre_telefono2"));
			prest.setString(8,request.getParameter("pre_pais_de_origen_lkup"));			
			prest.setString(9,request.getParameter("pre_pais_de_nacimiento_lkup"));
			prest.setString(10,request.getParameter("pre_ciudad_de_nacimiento"));
			prest.setString(11,request.getParameter("pre_fecha_de_nacimiento"));
			prest.setString(12,request.getParameter("pre_nacionalidad_lkup"));
			prest.setString(13,request.getParameter("pre_otra_nacionalidad_lkup"));
			prest.setString(14,request.getParameter("pre_etnico_o_tribu"));
			prest.setString(15,request.getParameter("pre_identificacion1"));
			prest.setString(16,request.getParameter("pre_typo_identificacion1_lkup"));
			prest.setString(17,request.getParameter("pre_identificacion2"));
			prest.setString(18,request.getParameter("pre_typo_identificacion2_lkup"));
			prest.setString(19,request.getParameter("pre_identificacion3"));
			prest.setString(20,request.getParameter("pre_typo_identificacion3_lkup"));
			prest.setString(21,request.getParameter("pre_identificacion4"));
			prest.setString(22,request.getParameter("pre_typo_identificacion4_lkup"));
			prest.setString(23,request.getParameter("pre_identificacion5"));
			prest.setString(24,request.getParameter("pre_typo_identificacion5_lkup"));
			prest.setString(25,request.getParameter("pre_educ_nivel_primario"));
			prest.setString(26,request.getParameter("pre_educ_primario_nombre"));
			prest.setString(27,request.getParameter("pre_educ_nivel_secundario"));
			prest.setString(28,request.getParameter("pre_educ_secundario_nombre"));
			prest.setString(29,request.getParameter("pre_educ_universitario"));
			prest.setString(30,request.getParameter("pre_educ_universidad_nombre"));
			prest.setString(31,request.getParameter("pre_educ_otros"));
			prest.setString(32,request.getParameter("pre_idioma_lkup"));
			prest.setString(33,request.getParameter("pre_religion_lkup"));
			prest.setString(34,request.getParameter("pre_profesion"));
			prest.setString(35,request.getParameter("pre_ocup_pais_de_origen"));
			prest.setString(36,request.getParameter("pre_ingreso_mensual_pais_de_origen"));
			prest.setString(37,request.getParameter("pre_estatus_civil_lkup"));
			prest.setString(38,request.getParameter("pre_nombre_conyuge"));
			prest.setString(39,request.getParameter("pre_edad_conyuge"));
			prest.setString(40,request.getParameter("pre_ubic_actual_conyuge"));
			prest.setString(41,request.getParameter("pre_ayuda_de_ong"));
			prest.setString(42,request.getParameter("pre_fam_en_riesgo"));
			prest.setString(43,request.getParameter("pre_situ_econ_lkup"));
			prest.setString(44,request.getParameter("pre_situ_salud"));
			prest.setString(45,request.getParameter("pre_radicado_en_pan"));
			prest.setString(46,request.getParameter("pre_fecha_de_salida_origen"));
			prest.setString(47,request.getParameter("pre_ruta_de_llegada"));
			prest.setString(48,request.getParameter("pre_proteccion_pedido_otro_pais"));
			prest.setString(49,request.getParameter("pre_transporte_util_lkup"));
			prest.setString(50,request.getParameter("pre_nombre_de_nave_y_bandera"));
			prest.setString(51,request.getParameter("pre_mencione_alguna_haya_ayudado_lkup"));
			prest.setString(52,request.getParameter("pre_mencione_alguna_haya_ayudado"));
			prest.setString(53,request.getParameter("pre_fecha_llegada_panama"));
			prest.setString(54,request.getParameter("pre_familiares_en_pan"));
			prest.setString(55,request.getParameter("pre_ha_estado_en_pan_antes"));
			prest.setString(56,request.getParameter("pre_motivo_de_persecucion_lkup"));
			prest.setString(57,request.getParameter("pre_ident_agent_persecucion_lkup"));
			prest.setString(58,request.getParameter("pre_ident_agent_persecucion_expl"));
			prest.setString(59,request.getParameter("pre_org_pertenecidos"));
			prest.setString(60,request.getParameter("pre_org_pertenecidos_desc"));
			prest.setString(61,request.getParameter("pre_arrestado_condenado_lkup"));
			prest.setString(62,request.getParameter("pre_arrestado_condenado_desc"));
			prest.setString(63,request.getParameter("pre_fecha_solicitud_onpar"));
			prest.setString(64,request.getParameter("pre_violencia_fisica_armado_lkup"));
			prest.setString(65,request.getParameter("pre_violencia_fisica_armado_desc"));
			prest.setString(66,request.getParameter("pre_justifica_legal"));
			prest.setString(67,request.getParameter("pre_permitido_regresar_al_pais_lkup"));
			prest.setString(68,request.getParameter("pre_forma_afectado_al_regresar_lkup"));
			prest.setString(69,request.getParameter("pre_forma_afectado_al_regresar_desc"));
			prest.setString(70,request.getParameter("pre_hechos_para_regresar"));
			prest.setString(71,request.getParameter("pre_fundado_temor"));
			prest.setString(72,request.getParameter("pre_genero_lkup"));
			prest.setString(73,request.getParameter("pre_nombre_padre"));
			prest.setString(74,request.getParameter("pre_nombre_madre"));
			prest.setString(75,request.getParameter("pre_necesidad_interprete_lkup"));
			prest.setString(76,request.getParameter("pre_lugar_de_trabajo"));
			prest.setString(77,request.getParameter("pre_fecha_entrevista_legal"));
			prest.setString(78,request.getParameter("pre_fecha_entrevista_social"));
			prest.setString(79,request.getParameter("id"));
			
			int mCount = prest.executeUpdate();
	
			response.sendRedirect("/onpar/main.jsp?target=solicitantes");			
		} 
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>