<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "insert into solicitante (" + 
					"pre_primer_nombre," +
					"pre_segundo_nombre," +
					"pre_apellido_paterno," +
					"pre_apellido_materno," +
					"pre_direccion_actual," +
					"pre_telefono1," +
					"pre_telefono2," +
					"pre_pais_de_origen_lkup," +
					"pre_pais_de_nacimiento_lkup," +
					"pre_ciudad_de_nacimiento," +
					"pre_fecha_de_nacimiento," +
					"pre_nacionalidad_lkup," +
					"pre_otra_nacionalidad_lkup," +
					"pre_etnico_o_tribu," +
					"pre_identificacion1," +
					"pre_typo_identificacion1_lkup," +
					"pre_identificacion2," +
					"pre_typo_identificacion2_lkup," +
					"pre_identificacion3," +
					"pre_typo_identificacion3_lkup," +
					"pre_identificacion4," +
					"pre_typo_identificacion4_lkup," +
					"pre_identificacion5," +
					"pre_typo_identificacion5_lkup," +
					"pre_educ_nivel_primario," +
					"pre_educ_primario_nombre," +
					"pre_educ_nivel_secundario," +
					"pre_educ_secundario_nombre," +
					"pre_educ_universitario," +
					"pre_educ_universidad_nombre," +
					"pre_educ_otros," +
					"pre_idioma_lkup," +
					"pre_religion_lkup," +
					"pre_profesion," +
					"pre_ocup_pais_de_origen," +
					"pre_ingreso_mensual_pais_de_origen," +
					"pre_estatus_civil_lkup," +
					"pre_nombre_conyuge," +
					"pre_edad_conyuge," +
					"pre_ubic_actual_conyuge," +
					"pre_ayuda_de_ong," +
					"pre_fam_en_riesgo," +
					"pre_situ_econ_lkup," +
					"pre_situ_salud," +
					"pre_radicado_en_pan," +
					"pre_fecha_de_salida_origen," +
					"pre_ruta_de_llegada," +
					"pre_proteccion_pedido_otro_pais," +
					"pre_transporte_util_lkup," +
					"pre_nombre_de_nave_y_bandera," +
					"pre_mencione_alguna_haya_ayudado_lkup," +
					"pre_mencione_alguna_haya_ayudado," +
					"pre_fecha_llegada_panama," +
					"pre_familiares_en_pan," +
					"pre_ha_estado_en_pan_antes," +
					"pre_motivo_de_persecucion_lkup," +
					"pre_ident_agent_persecucion_lkup," +
					"pre_ident_agent_persecucion_expl," +
					"pre_org_pertenecidos," +
					"pre_org_pertenecidos_desc," +
					"pre_arrestado_condenado_lkup," +
					"pre_arrestado_condenado_desc," +
					"pre_fecha_solicitud_onpar," +
					"pre_violencia_fisica_armado_lkup," +
					"pre_violencia_fisica_armado_desc," +
					"pre_justifica_legal," +
					"pre_permitido_regresar_al_pais_lkup," +
					"pre_forma_afectado_al_regresar_lkup," +
					"pre_forma_afectado_al_regresar_desc," +
					"pre_hechos_para_regresar," +
					"pre_fundado_temor," +
					"pre_genero_lkup," +
					"pre_nombre_padre," +
					"pre_nombre_madre," +
					"pre_necesidad_interprete_lkup," +
					"pre_lugar_de_trabajo," +
					"pre_fecha_entrevista_legal," +
					"pre_fecha_entrevista_social," +
					// "pre_declaracion_jurada," +
					"last_user_id," +
					"last_mod_tmstmp, " +
					"pre_estatus_lkup, " +
					"adm_estatus_lkup ) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),'Solicitud incompleta','Solicitud incompleta')";
						
	String p_pre_primer_nombre = request.getParameter("pre_primer_nombre");
	String p_pre_segundo_nombre = request.getParameter("pre_segundo_nombre");
	String p_pre_apellido_paterno = request.getParameter("pre_apellido_paterno");
	String p_pre_apellido_materno = request.getParameter("pre_apellido_materno");
	String p_pre_direccion_actual = request.getParameter("pre_direccion_actual");
	String p_pre_telefono1 = request.getParameter("pre_telefono1");
	String p_pre_telefono2 = request.getParameter("pre_telefono2");
	String p_pre_pais_de_origen_lkup = request.getParameter("pre_pais_de_origen_lkup");
	String p_pre_pais_de_nacimiento_lkup = request.getParameter("pre_pais_de_nacimiento_lkup");
	String p_pre_ciudad_de_nacimiento = request.getParameter("pre_ciudad_de_nacimiento");
	String p_pre_fecha_de_nacimiento = request.getParameter("pre_fecha_de_nacimiento");
	String p_pre_nacionalidad_lkup = request.getParameter("pre_nacionalidad_lkup");
	String p_pre_otra_nacionalidad_lkup = request.getParameter("pre_otra_nacionalidad_lkup");
	String p_pre_etnico_o_tribu = request.getParameter("pre_etnico_o_tribu");
	String p_pre_identificacion1 = request.getParameter("pre_identificacion1");
	String p_pre_typo_identificacion1_lkup = request.getParameter("pre_typo_identificacion1_lkup");
	String p_pre_identificacion2 = request.getParameter("pre_identificacion2");
	String p_pre_typo_identificacion2_lkup = request.getParameter("pre_typo_identificacion2_lkup");
	String p_pre_identificacion3 = request.getParameter("pre_identificacion3");
	String p_pre_typo_identificacion3_lkup = request.getParameter("pre_typo_identificacion3_lkup");
	String p_pre_identificacion4 = request.getParameter("pre_identificacion4");
	String p_pre_typo_identificacion4_lkup = request.getParameter("pre_typo_identificacion4_lkup");
	String p_pre_identificacion5 = request.getParameter("pre_identificacion5");
	String p_pre_typo_identificacion5_lkup = request.getParameter("pre_typo_identificacion5_lkup");
	String p_pre_educ_nivel_primario = request.getParameter("pre_educ_nivel_primario");
	String p_pre_educ_primario_nombre = request.getParameter("pre_educ_primario_nombre");
	String p_pre_educ_nivel_secundario = request.getParameter("pre_educ_nivel_secundario");
	String p_pre_educ_secundario_nombre = request.getParameter("pre_educ_secundario_nombre");
	String p_pre_educ_universitario = request.getParameter("pre_educ_universitario");
	String p_pre_educ_universidad_nombre = request.getParameter("pre_educ_universidad_nombre");
	String p_pre_educ_otros = request.getParameter("pre_educ_otros");
	String p_pre_idioma_lkup = request.getParameter("pre_idioma_lkup");
	String p_pre_religion_lkup = request.getParameter("pre_religion_lkup");
	String p_pre_profesion = request.getParameter("pre_profesion");
	String p_pre_ocup_pais_de_origen = request.getParameter("pre_ocup_pais_de_origen");
	String p_pre_ingreso_mensual_pais_de_origen = request.getParameter("pre_ingreso_mensual_pais_de_origen");
	String p_pre_estatus_civil_lkup = request.getParameter("pre_estatus_civil_lkup");
	String p_pre_nombre_conyuge = request.getParameter("pre_nombre_conyuge");
	String p_pre_edad_conyuge = request.getParameter("pre_edad_conyuge");
	String p_pre_ubic_actual_conyuge = request.getParameter("pre_ubic_actual_conyuge");
	String p_pre_ayuda_de_ong = request.getParameter("pre_ayuda_de_ong");
	String p_pre_fam_en_riesgo = request.getParameter("pre_fam_en_riesgo");
	String p_pre_situ_econ_lkup = request.getParameter("pre_situ_econ_lkup");
	String p_pre_situ_salud = request.getParameter("pre_situ_salud");
	String p_pre_radicado_en_pan = request.getParameter("pre_radicado_en_pan");
	String p_pre_fecha_de_salida_origen = request.getParameter("pre_fecha_de_salida_origen");
	String p_pre_ruta_de_llegada = request.getParameter("pre_ruta_de_llegada");
	String p_pre_proteccion_pedido_otro_pais = request.getParameter("pre_proteccion_pedido_otro_pais");
	String p_pre_transporte_util_lkup = request.getParameter("pre_transporte_util_lkup");
	String p_pre_nombre_de_nave_y_bandera = request.getParameter("pre_nombre_de_nave_y_bandera");
	String p_pre_mencione_alguna_haya_ayudado_lkup = request.getParameter("pre_mencione_alguna_haya_ayudado_lkup");
	String p_pre_mencione_alguna_haya_ayudado = request.getParameter("pre_mencione_alguna_haya_ayudado");
	String p_pre_fecha_llegada_panama = request.getParameter("pre_fecha_llegada_panama");
	String p_pre_familiares_en_pan = request.getParameter("pre_familiares_en_pan");
	String p_pre_ha_estado_en_pan_antes = request.getParameter("pre_ha_estado_en_pan_antes");
	String p_pre_motivo_de_persecucion_lkup = request.getParameter("pre_motivo_de_persecucion_lkup");
	String p_pre_ident_agent_persecucion_lkup = request.getParameter("pre_ident_agent_persecucion_lkup");
	String p_pre_ident_agent_persecucion_expl = request.getParameter("pre_ident_agent_persecucion_expl");
	String p_pre_org_pertenecidos = request.getParameter("pre_org_pertenecidos");
	String p_pre_org_pertenecidos_desc = request.getParameter("pre_org_pertenecidos_desc");
	String p_pre_arrestado_condenado_lkup = request.getParameter("pre_arrestado_condenado_lkup");
	String p_pre_arrestado_condenado_desc = request.getParameter("pre_arrestado_condenado_desc");
	String p_pre_fecha_solicitud_onpar = request.getParameter("pre_fecha_solicitud_onpar");
	String p_pre_violencia_fisica_armado_lkup = request.getParameter("pre_violencia_fisica_armado_lkup");
	String p_pre_violencia_fisica_armado_desc = request.getParameter("pre_violencia_fisica_armado_desc");
	String p_pre_justifica_legal = request.getParameter("pre_justifica_legal");
	String p_pre_permitido_regresar_al_pais_lkup = request.getParameter("pre_permitido_regresar_al_pais_lkup");
	String p_pre_forma_afectado_al_regresar_lkup = request.getParameter("pre_forma_afectado_al_regresar_lkup");
	String p_pre_forma_afectado_al_regresar_desc = request.getParameter("pre_forma_afectado_al_regresar_desc");
	String p_pre_hechos_para_regresar = request.getParameter("pre_hechos_para_regresar");
	String p_pre_fundado_temor = request.getParameter("pre_fundado_temor");
	String p_pre_genero_lkup = request.getParameter("pre_genero_lkup");
	String p_pre_nombre_padre = request.getParameter("pre_nombre_padre");
	String p_pre_nombre_madre = request.getParameter("pre_nombre_madre");
	String p_pre_necesidad_interprete_lkup = request.getParameter("pre_necesidad_interprete_lkup");
	String p_pre_lugar_de_trabajo = request.getParameter("pre_lugar_de_trabajo");
	String p_pre_fecha_entrevista_legal = request.getParameter("pre_fecha_entrevista_legal");
	String p_pre_fecha_entrevista_social = request.getParameter("pre_fecha_entrevista_social");
	// String p_pre_declaracion_jurada = request.getParameter("pre_declaracion_jurada");
	int p_last_user_id = Integer.parseInt(session.getAttribute("id").toString());
	
	
	
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
		
		prest=con.prepareStatement(mQuery);

		prest.setString(1,p_pre_primer_nombre);
		prest.setString(2,p_pre_segundo_nombre);
		prest.setString(3,p_pre_apellido_paterno);
		prest.setString(4,p_pre_apellido_materno);
		prest.setString(5,p_pre_direccion_actual);
		prest.setString(6,p_pre_telefono1);
		prest.setString(7,p_pre_telefono2);
		prest.setString(8,p_pre_pais_de_origen_lkup);
		prest.setString(9,p_pre_pais_de_nacimiento_lkup);
		prest.setString(10,p_pre_ciudad_de_nacimiento);
		prest.setString(11,p_pre_fecha_de_nacimiento);
		prest.setString(12,p_pre_nacionalidad_lkup);
		prest.setString(13,p_pre_otra_nacionalidad_lkup);
		prest.setString(14,p_pre_etnico_o_tribu);
		prest.setString(15,p_pre_identificacion1);
		prest.setString(16,p_pre_typo_identificacion1_lkup);
		prest.setString(17,p_pre_identificacion2);
		prest.setString(18,p_pre_typo_identificacion2_lkup);
		prest.setString(19,p_pre_identificacion3);
		prest.setString(20,p_pre_typo_identificacion3_lkup);
		prest.setString(21,p_pre_identificacion4);
		prest.setString(22,p_pre_typo_identificacion4_lkup);
		prest.setString(23,p_pre_identificacion5);
		prest.setString(24,p_pre_typo_identificacion5_lkup);
		prest.setString(25,p_pre_educ_nivel_primario);
		prest.setString(26,p_pre_educ_primario_nombre);
		prest.setString(27,p_pre_educ_nivel_secundario);
		prest.setString(28,p_pre_educ_secundario_nombre);
		prest.setString(29,p_pre_educ_universitario);
		prest.setString(30,p_pre_educ_universidad_nombre);
		prest.setString(31,p_pre_educ_otros);
		prest.setString(32,p_pre_idioma_lkup);
		prest.setString(33,p_pre_religion_lkup);
		prest.setString(34,p_pre_profesion);
		prest.setString(35,p_pre_ocup_pais_de_origen);
		prest.setString(36,p_pre_ingreso_mensual_pais_de_origen);
		prest.setString(37,p_pre_estatus_civil_lkup);
		prest.setString(38,p_pre_nombre_conyuge);
		prest.setString(39,p_pre_edad_conyuge);
		prest.setString(40,p_pre_ubic_actual_conyuge);
		prest.setString(41,p_pre_ayuda_de_ong);
		prest.setString(42,p_pre_fam_en_riesgo);
		prest.setString(43,p_pre_situ_econ_lkup);
		prest.setString(44,p_pre_situ_salud);
		prest.setString(45,p_pre_radicado_en_pan);
		prest.setString(46,p_pre_fecha_de_salida_origen);
		prest.setString(47,p_pre_ruta_de_llegada);
		prest.setString(48,p_pre_proteccion_pedido_otro_pais);
		prest.setString(49,p_pre_transporte_util_lkup);
		prest.setString(50,p_pre_nombre_de_nave_y_bandera);
		prest.setString(51,p_pre_mencione_alguna_haya_ayudado_lkup);
		prest.setString(52,p_pre_mencione_alguna_haya_ayudado);
		prest.setString(53,p_pre_fecha_llegada_panama);
		prest.setString(54,p_pre_familiares_en_pan);
		prest.setString(55,p_pre_ha_estado_en_pan_antes);
		prest.setString(56,p_pre_motivo_de_persecucion_lkup);
		prest.setString(57,p_pre_ident_agent_persecucion_lkup);
		prest.setString(58,p_pre_ident_agent_persecucion_expl);
		prest.setString(59,p_pre_org_pertenecidos);
		prest.setString(60,p_pre_org_pertenecidos_desc);
		prest.setString(61,p_pre_arrestado_condenado_lkup);
		prest.setString(62,p_pre_arrestado_condenado_desc);
		prest.setString(63,p_pre_fecha_solicitud_onpar);
		prest.setString(64,p_pre_violencia_fisica_armado_lkup);
		prest.setString(65,p_pre_violencia_fisica_armado_desc);
		prest.setString(66,p_pre_justifica_legal);
		prest.setString(67,p_pre_permitido_regresar_al_pais_lkup);
		prest.setString(68,p_pre_forma_afectado_al_regresar_lkup);
		prest.setString(69,p_pre_forma_afectado_al_regresar_desc);
		prest.setString(70,p_pre_hechos_para_regresar);
		prest.setString(71,p_pre_fundado_temor);
		prest.setString(72,p_pre_genero_lkup);
		prest.setString(73,p_pre_nombre_padre);
		prest.setString(74,p_pre_nombre_madre);
		prest.setString(75,p_pre_necesidad_interprete_lkup);
		prest.setString(76,p_pre_lugar_de_trabajo);
		prest.setString(77,p_pre_fecha_entrevista_legal);
		prest.setString(78,p_pre_fecha_entrevista_social);
		prest.setInt(79,p_last_user_id);
		
		int mCount = prest.executeUpdate();

		response.sendRedirect("main.jsp?target=solicitantes");			

	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>