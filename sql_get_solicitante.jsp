<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mId = request.getParameter("id");
	int myid = Integer.parseInt(mId);
	

	String mQuery = "select " +
					"replace(format(id,''),',','')," +
					"ifnull(pre_primer_nombre,'')," +
					"ifnull(pre_segundo_nombre,'')," +
					"ifnull(pre_apellido_paterno,'')," +
					"ifnull(pre_apellido_materno,'')," +
					"ifnull(pre_direccion_actual,'')," +
					"ifnull(pre_telefono1,'')," +
					"ifnull(pre_telefono2,'')," +
					"ifnull(pre_pais_de_origen_lkup,'')," +
					"ifnull(pre_pais_de_nacimiento_lkup,'')," +
					"ifnull(pre_ciudad_de_nacimiento,'')," +
					"ifnull(pre_fecha_de_nacimiento,'')," +
					"ifnull(pre_nacionalidad_lkup,'')," +
					"ifnull(pre_otra_nacionalidad_lkup,'')," +
					"ifnull(pre_etnico_o_tribu,'')," +
					"ifnull(pre_identificacion1,'')," +
					"ifnull(pre_typo_identificacion1_lkup,'')," +
					"ifnull(pre_identificacion2,'')," +
					"ifnull(pre_typo_identificacion2_lkup,'')," +
					"ifnull(pre_identificacion3,'')," +
					"ifnull(pre_typo_identificacion3_lkup,'')," +
					"ifnull(pre_identificacion4,'')," +
					"ifnull(pre_typo_identificacion4_lkup,'')," +
					"ifnull(pre_identificacion5,'')," +
					"ifnull(pre_typo_identificacion5_lkup,'')," +
					"ifnull(pre_educ_nivel_primario,'')," +
					"ifnull(pre_educ_primario_nombre,'')," +
					"ifnull(pre_educ_nivel_secundario,'')," +
					"ifnull(pre_educ_secundario_nombre,'')," +
					"ifnull(pre_educ_universitario,'')," +
					"ifnull(pre_educ_universidad_nombre,'')," +
					"ifnull(pre_educ_otros,'')," +
					"ifnull(pre_idioma_lkup,'')," +
					"ifnull(pre_religion_lkup,'')," +
					"ifnull(pre_profesion,'')," +
					"ifnull(pre_ocup_pais_de_origen,'')," +
					"ifnull(pre_ingreso_mensual_pais_de_origen,'')," +
					"ifnull(pre_estatus_civil_lkup,'')," +
					"ifnull(pre_nombre_conyuge,'')," +
					"ifnull(pre_edad_conyuge,'')," +
					"ifnull(pre_ubic_actual_conyuge,'')," +
					"ifnull(pre_ayuda_de_ong ,'')," +
					"ifnull(pre_fam_en_riesgo ,'')," +
					"ifnull(pre_situ_econ_lkup,'')," +
					"ifnull(pre_situ_salud ,'')," +
					"ifnull(pre_radicado_en_pan ,'')," +
					"ifnull(pre_fecha_de_salida_origen,'')," +
					"ifnull(pre_ruta_de_llegada ,'')," +
					"ifnull(pre_proteccion_pedido_otro_pais ,'')," +
					"ifnull(pre_transporte_util_lkup,'')," +
					"ifnull(pre_nombre_de_nave_y_bandera,'')," +
					"ifnull(pre_mencione_alguna_haya_ayudado_lkup,'')," +
					"ifnull(pre_mencione_alguna_haya_ayudado,'')," +
					"ifnull(pre_fecha_llegada_panama,'')," +
					"ifnull(pre_familiares_en_pan ,'')," +
					"ifnull(pre_ha_estado_en_pan_antes ,'')," +
					"ifnull(pre_motivo_de_persecucion_lkup,'')," +
					"ifnull(pre_ident_agent_persecucion_lkup,'')," +
					"ifnull(pre_ident_agent_persecucion_expl,'')," +
					"ifnull(pre_org_pertenecidos ,'')," +
					"ifnull(pre_org_pertenecidos_desc ,'')," +
					"ifnull(pre_arrestado_condenado_lkup,'')," +
					"ifnull(pre_arrestado_condenado_desc ,'')," +
					"ifnull(pre_fecha_solicitud_onpar,'')," +
					"ifnull(pre_violencia_fisica_armado_lkup,'')," +
					"ifnull(pre_violencia_fisica_armado_desc,'')," +
					"ifnull(pre_justifica_legal ,'')," +
					"ifnull(pre_permitido_regresar_al_pais_lkup,'')," +
					"ifnull(pre_forma_afectado_al_regresar_lkup,'')," +
					"ifnull(pre_forma_afectado_al_regresar_desc ,'')," +
					"ifnull(pre_hechos_para_regresar ,'')," +
					"ifnull(pre_fundado_temor ,'')," +
					"ifnull(pre_genero_lkup,'')," +
					"ifnull(pre_nombre_padre,'')," +
					"ifnull(pre_nombre_madre,'')," +
					"ifnull(pre_necesidad_interprete_lkup,'')," +
					"ifnull(pre_lugar_de_trabajo,'')," +
					"ifnull(pre_fecha_entrevista_legal,'')," +
					"ifnull(pre_fecha_entrevista_social,''), " +
					"ifnull(pre_leg_q1 ,''), " +
					"ifnull(pre_leg_q2 ,''), " +
					"ifnull(pre_leg_q3 ,''), " +
					"ifnull(pre_leg_q4 ,''), " +
					"ifnull(pre_leg_q5 ,''), " +
					"ifnull(pre_leg_q6 ,''), " +
					"ifnull(pre_leg_q7 ,''), " +
					"ifnull(pre_leg_q8 ,''), " +
					"ifnull(pre_leg_q9 ,''), " +
					"ifnull(pre_leg_q10 ,''), " +
					"ifnull(pre_leg_q11 ,''), " +
					"ifnull(pre_leg_q12 ,''), " +
					"ifnull(pre_leg_q13 ,''), " +
					"ifnull(pre_leg_q14 ,''), " +
					"ifnull(pre_leg_q15 ,''), " +
					"ifnull(pre_leg_q16 ,''), " +
					"ifnull(pre_leg_q17 ,''), " +
					"ifnull(pre_leg_q18 ,''), " +
					"ifnull(pre_leg_q19 ,''), " +
					"ifnull(pre_leg_q20 ,''), " +
					"ifnull(pre_leg_q21 ,''), " +
					"ifnull(pre_leg_q22 ,''), " +
					"ifnull(pre_leg_q23 ,''), " +
					"ifnull(pre_leg_q24 ,''), " +
					"ifnull(pre_leg_q25 ,''), " +
					"ifnull(pre_leg_q26 ,''), " +
					"ifnull(pre_soc_qiii ,''), " +
					"ifnull(pre_soc_qiv1 ,''), " +
					"ifnull(pre_soc_qiv2 ,''), " +
					"ifnull(pre_soc_qv11 ,''), " +
					"ifnull(pre_soc_qv12 ,''), " +
					"ifnull(pre_soc_qv13 ,''), " +
					"ifnull(pre_soc_qv14 ,''), " +
					"ifnull(pre_soc_qv21 ,''), " +
					"ifnull(pre_soc_qv22 ,''), " +
					"ifnull(pre_soc_qv23 ,''), " +
					"ifnull(pre_soc_qv31 ,''), " +
					"ifnull(pre_soc_qv32 ,''), " +
					"ifnull(pre_soc_qv33 ,''), " +
					"ifnull(pre_soc_qv41 ,''), " +
					"ifnull(pre_soc_qv42 ,''), " +
					"ifnull(pre_soc_qv43 ,''), " +
					"ifnull(pre_soc_qvi1 ,''), " +
					"ifnull(pre_soc_qvi2 ,''), " +
					"ifnull(pre_soc_qvi3 ,''), " +
					"ifnull(pre_soc_qvi4 ,''), " +
					"ifnull(pre_soc_qvi5 ,''), " +
					"ifnull(pre_soc_qvii ,''), " +
					"ifnull(pre_soc_qviii ,''), " +	
					"ifnull(adm_fecha_resol,''), " +
					"ifnull(adm_dec_resol_lkup,''), " +
					"ifnull(adm_dec_resol_memo ,''), " +
					"ifnull(adm_fecha_noti_resol,''), " +
					"ifnull(adm_fecha_de_pedir_recon,''), " +
					"ifnull(adm_peticion_para_la_recon,''), " +
					"ifnull(adm_fecha_resol_recon,''), " +
					"ifnull(adm_dec_resol_recon_lkup,''), " +
					"ifnull(adm_dec_resol_recon_memo ,''), " +
					"ifnull(adm_fecha_noti_resol_recon,''), " +
					"ifnull(adm_fecha_de_pedir_apel,''), " +
					"ifnull(adm_peticion_para_la_apel,''), " +
					"ifnull(adm_fecha_resol_apel,''), " +
					"ifnull(adm_dec_resol_apel_lkup,''), " +
					"ifnull(adm_dec_resol_apel_memo ,''), " +
					"ifnull(adm_fecha_noti_resol_apel,''), " +
					"ifnull(adm_numero_de_caso,''), " +
					"ifnull(adm_fecha_expedicion_carnet,''), " +
					"ifnull(adm_estatus_lkup,''), " +
					"pre_declaracion_jurada, " +
					"pre_copia_identificacion1, " +	
					"pre_copia_identificacion2, " +	
					"pre_copia_identificacion3, " +	
					"pre_copia_identificacion4, " +	
					"pre_copia_identificacion5, " +	
					"pre_entrevista_social, " +	
					"pre_soc_foto_jefe_de_familia, " +	
					"pre_entrevista_legal, " +	
					"adm_peticion_para_la_recon, " +	
					"adm_peticion_para_la_apel, " +
					"ifnull(format(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25),''),''), " +
					"ifnull(fecha_de_renuncia,''), " +
					"renuncia, " +	
					"ifnull(ref_fecha_resol,''), " +
					"ifnull(ref_dec_resol_lkup,''), " +
					"ifnull(ref_dec_resol_memo ,''), " +
					"ifnull(ref_fecha_noti_resol,''), " +
					"ifnull(ref_fecha_de_pedir_recon,''), " +
					"ref_peticion_para_la_recon, " +
					"ifnull(ref_fecha_resol_recon,''), " +
					"ifnull(ref_dec_resol_recon_lkup,''), " +
					"ifnull(ref_dec_resol_recon_memo ,''), " +
					"ifnull(ref_fecha_noti_resol_recon,''), " +
					"ifnull(ref_fecha_de_pedir_apel,''), " +
					"ref_peticion_para_la_apel, " +
					"ifnull(ref_fecha_resol_apel,''), " +
					"ifnull(ref_dec_resol_apel_lkup,''), " +
					"ifnull(ref_dec_resol_apel_memo ,''), " +
					"ifnull(ref_fecha_noti_resol_apel,''), " +
					"ifnull(ref_estatus_lkup,'') " +					
					"from solicitante " +
					"where id = ? " + 
					"and id > 3000 ";


	session.setAttribute("temp_solicitante_id", null);
	session.setAttribute("temp_solicitante_pre_primer_nombre", null);
	session.setAttribute("temp_solicitante_pre_segundo_nombre", null);
	session.setAttribute("temp_solicitante_pre_apellido_paterno", null);
	session.setAttribute("temp_solicitante_pre_apellido_materno", null);
	session.setAttribute("temp_solicitante_pre_direccion_actual", null);
	session.setAttribute("temp_solicitante_pre_telefono1", null);
	session.setAttribute("temp_solicitante_pre_telefono2", null);
	session.setAttribute("temp_solicitante_pre_pais_de_origen_lkup", null);
	session.setAttribute("temp_solicitante_pre_pais_de_nacimiento_lkup", null);
	session.setAttribute("temp_solicitante_pre_ciudad_de_nacimiento", null);
	session.setAttribute("temp_solicitante_pre_fecha_de_nacimiento", null);
	session.setAttribute("temp_solicitante_pre_nacionalidad_lkup", null);
	session.setAttribute("temp_solicitante_pre_otra_nacionalidad_lkup", null);
	session.setAttribute("temp_solicitante_pre_etnico_o_tribu", null);
	session.setAttribute("temp_solicitante_pre_identificacion1", null);
	session.setAttribute("temp_solicitante_pre_typo_identificacion1_lkup", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion1", null);
	session.setAttribute("temp_solicitante_pre_identificacion2", null);
	session.setAttribute("temp_solicitante_pre_typo_identificacion2_lkup", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion2", null);
	session.setAttribute("temp_solicitante_pre_identificacion3", null);
	session.setAttribute("temp_solicitante_pre_typo_identificacion3_lkup", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion3", null);
	session.setAttribute("temp_solicitante_pre_identificacion4", null);
	session.setAttribute("temp_solicitante_pre_typo_identificacion4_lkup", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion4", null);
	session.setAttribute("temp_solicitante_pre_identificacion5", null);
	session.setAttribute("temp_solicitante_pre_typo_identificacion5_lkup", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion5", null);
	session.setAttribute("temp_solicitante_pre_educ_nivel_primario", null);
	session.setAttribute("temp_solicitante_pre_educ_primario_nombre", null);
	session.setAttribute("temp_solicitante_pre_educ_nivel_secundario", null);
	session.setAttribute("temp_solicitante_pre_educ_secundario_nombre", null);
	session.setAttribute("temp_solicitante_pre_educ_universitario", null);
	session.setAttribute("temp_solicitante_pre_educ_universidad_nombre", null);
	session.setAttribute("temp_solicitante_pre_educ_otros", null);
	session.setAttribute("temp_solicitante_pre_idioma_lkup", null);
	session.setAttribute("temp_solicitante_pre_religion_lkup", null);
	session.setAttribute("temp_solicitante_pre_profesion", null);
	session.setAttribute("temp_solicitante_pre_ocup_pais_de_origen", null);
	session.setAttribute("temp_solicitante_pre_ingreso_mensual_pais_de_origen", null);
	session.setAttribute("temp_solicitante_pre_estatus_civil_lkup", null);
	session.setAttribute("temp_solicitante_pre_nombre_conyuge", null);
	session.setAttribute("temp_solicitante_pre_edad_conyuge", null);
	session.setAttribute("temp_solicitante_pre_ubic_actual_conyuge", null);
	session.setAttribute("temp_solicitante_pre_ayuda_de_ong", null);
	session.setAttribute("temp_solicitante_pre_fam_en_riesgo", null);
	session.setAttribute("temp_solicitante_pre_situ_econ_lkup", null);
	session.setAttribute("temp_solicitante_pre_situ_salud", null);
	session.setAttribute("temp_solicitante_pre_radicado_en_pan", null);
	session.setAttribute("temp_solicitante_pre_fecha_de_salida_origen", null);
	session.setAttribute("temp_solicitante_pre_ruta_de_llegada", null);
	session.setAttribute("temp_solicitante_pre_proteccion_pedido_otro_pais", null);
	session.setAttribute("temp_solicitante_pre_transporte_util_lkup", null);
	session.setAttribute("temp_solicitante_pre_nombre_de_nave_y_bandera", null);
	session.setAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado_lkup", null);
	session.setAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado", null);
	session.setAttribute("temp_solicitante_pre_fecha_llegada_panama", null);
	session.setAttribute("temp_solicitante_pre_familiares_en_pan", null);
	session.setAttribute("temp_solicitante_pre_ha_estado_en_pan_antes", null);
	session.setAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup", null);
	session.setAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup", null);
	session.setAttribute("temp_solicitante_pre_ident_agent_persecucion_expl", null);
	session.setAttribute("temp_solicitante_pre_org_pertenecidos", null);
	session.setAttribute("temp_solicitante_pre_org_pertenecidos_desc", null);
	session.setAttribute("temp_solicitante_pre_arrestado_condenado_lkup", null);
	session.setAttribute("temp_solicitante_pre_arrestado_condenado_desc", null);
	session.setAttribute("temp_solicitante_pre_fecha_solicitud_onpar", null);
	session.setAttribute("temp_solicitante_pre_violencia_fisica_armado_lkup", null);
	session.setAttribute("temp_solicitante_pre_violencia_fisica_armado_desc", null);
	session.setAttribute("temp_solicitante_pre_justifica_legal", null);
	session.setAttribute("temp_solicitante_pre_permitido_regresar_al_pais_lkup", null);
	session.setAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup", null);
	session.setAttribute("temp_solicitante_pre_forma_afectado_al_regresar_desc", null);
	session.setAttribute("temp_solicitante_pre_hechos_para_regresar", null);
	session.setAttribute("temp_solicitante_pre_fundado_temor", null);
	session.setAttribute("temp_solicitante_pre_genero_lkup", null);
	session.setAttribute("temp_solicitante_pre_nombre_padre", null);
	session.setAttribute("temp_solicitante_pre_nombre_madre", null);
	session.setAttribute("temp_solicitante_pre_necesidad_interprete_lkup", null);
	session.setAttribute("temp_solicitante_pre_lugar_de_trabajo", null);
	session.setAttribute("temp_solicitante_pre_fecha_entrevista_legal", null);
	session.setAttribute("temp_solicitante_pre_fecha_entrevista_social", null);
	session.setAttribute("temp_solicitante_pre_declaracion_jurada", null);
	session.setAttribute("temp_solicitante_pre_estatus_lkup", null);
	session.setAttribute("temp_solicitante_pre_leg_q1", null);
	session.setAttribute("temp_solicitante_pre_leg_q2", null);
	session.setAttribute("temp_solicitante_pre_leg_q3", null);
	session.setAttribute("temp_solicitante_pre_leg_q4", null);
	session.setAttribute("temp_solicitante_pre_leg_q5", null);
	session.setAttribute("temp_solicitante_pre_leg_q6", null);
	session.setAttribute("temp_solicitante_pre_leg_q7", null);
	session.setAttribute("temp_solicitante_pre_leg_q8", null);
	session.setAttribute("temp_solicitante_pre_leg_q9", null);
	session.setAttribute("temp_solicitante_pre_leg_q10", null);
	session.setAttribute("temp_solicitante_pre_leg_q11", null);
	session.setAttribute("temp_solicitante_pre_leg_q12", null);
	session.setAttribute("temp_solicitante_pre_leg_q13", null);
	session.setAttribute("temp_solicitante_pre_leg_q14", null);
	session.setAttribute("temp_solicitante_pre_leg_q15", null);
	session.setAttribute("temp_solicitante_pre_leg_q16", null);
	session.setAttribute("temp_solicitante_pre_leg_q17", null);
	session.setAttribute("temp_solicitante_pre_leg_q18", null);
	session.setAttribute("temp_solicitante_pre_leg_q19", null);
	session.setAttribute("temp_solicitante_pre_leg_q20", null);
	session.setAttribute("temp_solicitante_pre_leg_q21", null);
	session.setAttribute("temp_solicitante_pre_leg_q22", null);
	session.setAttribute("temp_solicitante_pre_leg_q23", null);
	session.setAttribute("temp_solicitante_pre_leg_q24", null);
	session.setAttribute("temp_solicitante_pre_leg_q25", null);
	session.setAttribute("temp_solicitante_pre_leg_q26", null);
	session.setAttribute("temp_solicitante_pre_soc_qiii", null);
	session.setAttribute("temp_solicitante_pre_soc_qiv1", null);
	session.setAttribute("temp_solicitante_pre_soc_qiv2", null);
	session.setAttribute("temp_solicitante_pre_soc_qv11", null);
	session.setAttribute("temp_solicitante_pre_soc_qv12", null);
	session.setAttribute("temp_solicitante_pre_soc_qv13", null);
	session.setAttribute("temp_solicitante_pre_soc_qv14", null);
	session.setAttribute("temp_solicitante_pre_soc_qv21", null);
	session.setAttribute("temp_solicitante_pre_soc_qv22", null);
	session.setAttribute("temp_solicitante_pre_soc_qv23", null);
	session.setAttribute("temp_solicitante_pre_soc_qv31", null);
	session.setAttribute("temp_solicitante_pre_soc_qv32", null);
	session.setAttribute("temp_solicitante_pre_soc_qv33", null);
	session.setAttribute("temp_solicitante_pre_soc_qv41", null);
	session.setAttribute("temp_solicitante_pre_soc_qv42", null);
	session.setAttribute("temp_solicitante_pre_soc_qv43", null);
	session.setAttribute("temp_solicitante_pre_soc_qvi1", null);
	session.setAttribute("temp_solicitante_pre_soc_qvi2", null);
	session.setAttribute("temp_solicitante_pre_soc_qvi3", null);
	session.setAttribute("temp_solicitante_pre_soc_qvi4", null);
	session.setAttribute("temp_solicitante_pre_soc_qvi5", null);
	session.setAttribute("temp_solicitante_pre_soc_qvii", null);
	session.setAttribute("temp_solicitante_pre_soc_qviii", null);	
	
	session.setAttribute("temp_solicitante_adm_fecha_resol", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_lkup", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_memo", null);
	session.setAttribute("temp_solicitante_adm_fecha_noti_resol", null);
	session.setAttribute("temp_solicitante_adm_fecha_de_pedir_recon", null);
	session.setAttribute("temp_solicitante_adm_peticion_para_la_recon", null);
	session.setAttribute("temp_solicitante_adm_fecha_resol_recon", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_recon_lkup", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_recon_memo", null);
	session.setAttribute("temp_solicitante_adm_fecha_noti_resol_recon", null);
	session.setAttribute("temp_solicitante_adm_fecha_de_pedir_apel", null);
	session.setAttribute("temp_solicitante_adm_peticion_para_la_apel", null);
	session.setAttribute("temp_solicitante_adm_fecha_resol_apel", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_apel_lkup", null);
	session.setAttribute("temp_solicitante_adm_dec_resol_apel_memo", null);
	session.setAttribute("temp_solicitante_adm_fecha_noti_resol_apel", null);
	session.setAttribute("temp_solicitante_adm_numero_de_caso", null);
	session.setAttribute("temp_solicitante_adm_fecha_expedicion_carnet", null);
	session.setAttribute("temp_solicitante_adm_estatus_lkup", null);
	session.setAttribute("temp_solicitante_pre_declaracion_jurada", null);
		
	session.setAttribute("temp_solicitante_pre_copia_identificacion1", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion2", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion3", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion4", null);
	session.setAttribute("temp_solicitante_pre_copia_identificacion5", null);
	session.setAttribute("temp_solicitante_pre_entrevista_social", null);
	session.setAttribute("temp_solicitante_pre_soc_foto_jefe_de_familia", null);
	session.setAttribute("temp_solicitante_pre_entrevista_legal", null);
	session.setAttribute("temp_solicitante_adm_peticion_para_la_recon", null);
	session.setAttribute("temp_solicitante_adm_peticion_para_la_apel", null);
	session.setAttribute("temp_solicitante_pre_edad", null);

	session.setAttribute("temp_solicitante_fecha_de_renuncia", null);
	session.setAttribute("temp_solicitante_renuncia", null);	
			
	session.setAttribute("temp_solicitante_ref_fecha_resol", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_lkup", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_memo", null);
	session.setAttribute("temp_solicitante_ref_fecha_noti_resol", null);
	session.setAttribute("temp_solicitante_ref_fecha_de_pedir_recon", null);
	session.setAttribute("temp_solicitante_ref_peticion_para_la_recon", null);
	session.setAttribute("temp_solicitante_ref_fecha_resol_recon", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_recon_lkup", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_recon_memo", null);
	session.setAttribute("temp_solicitante_ref_fecha_noti_resol_recon", null);
	session.setAttribute("temp_solicitante_ref_fecha_de_pedir_apel", null);
	session.setAttribute("temp_solicitante_ref_peticion_para_la_apel", null);
	session.setAttribute("temp_solicitante_ref_fecha_resol_apel", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_apel_lkup", null);
	session.setAttribute("temp_solicitante_ref_dec_resol_apel_memo", null);
	session.setAttribute("temp_solicitante_ref_fecha_noti_resol_apel", null);
	session.setAttribute("temp_solicitante_ref_estatus_lkup", null);
			
	Connection con = null;
	PreparedStatement prest = null;
	ResultSet rs = null;
	
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
			prest.setString(1,mId);
			rs=prest.executeQuery();

			int size = 0;

			while(rs.next())
			{
				size++;
				session.setAttribute("temp_solicitante_id", rs.getString(1));
				session.setAttribute("temp_solicitante_pre_primer_nombre", rs.getString(2));
				session.setAttribute("temp_solicitante_pre_segundo_nombre", rs.getString(3));
				session.setAttribute("temp_solicitante_pre_apellido_paterno", rs.getString(4));
				session.setAttribute("temp_solicitante_pre_apellido_materno", rs.getString(5));
				session.setAttribute("temp_solicitante_pre_direccion_actual", rs.getString(6));
				session.setAttribute("temp_solicitante_pre_telefono1", rs.getString(7));
				session.setAttribute("temp_solicitante_pre_telefono2", rs.getString(8));
				session.setAttribute("temp_solicitante_pre_pais_de_origen_lkup", rs.getString(9));
				session.setAttribute("temp_solicitante_pre_pais_de_nacimiento_lkup", rs.getString(10));
				session.setAttribute("temp_solicitante_pre_ciudad_de_nacimiento", rs.getString(11));
				session.setAttribute("temp_solicitante_pre_fecha_de_nacimiento", rs.getString(12));
				session.setAttribute("temp_solicitante_pre_nacionalidad_lkup", rs.getString(13));
				session.setAttribute("temp_solicitante_pre_otra_nacionalidad_lkup", rs.getString(14));
				session.setAttribute("temp_solicitante_pre_etnico_o_tribu", rs.getString(15));
				session.setAttribute("temp_solicitante_pre_identificacion1", rs.getString(16));
				session.setAttribute("temp_solicitante_pre_typo_identificacion1_lkup", rs.getString(17));
				session.setAttribute("temp_solicitante_pre_identificacion2", rs.getString(18));
				session.setAttribute("temp_solicitante_pre_typo_identificacion2_lkup", rs.getString(19));
				session.setAttribute("temp_solicitante_pre_identificacion3", rs.getString(20));
				session.setAttribute("temp_solicitante_pre_typo_identificacion3_lkup", rs.getString(21));
				session.setAttribute("temp_solicitante_pre_identificacion4", rs.getString(22));
				session.setAttribute("temp_solicitante_pre_typo_identificacion4_lkup", rs.getString(23));
				session.setAttribute("temp_solicitante_pre_identificacion5", rs.getString(24));
				session.setAttribute("temp_solicitante_pre_typo_identificacion5_lkup", rs.getString(25));
				session.setAttribute("temp_solicitante_pre_educ_nivel_primario", rs.getString(26));
				session.setAttribute("temp_solicitante_pre_educ_primario_nombre", rs.getString(27));
				session.setAttribute("temp_solicitante_pre_educ_nivel_secundario", rs.getString(28));
				session.setAttribute("temp_solicitante_pre_educ_secundario_nombre", rs.getString(29));
				session.setAttribute("temp_solicitante_pre_educ_universitario", rs.getString(30));
				session.setAttribute("temp_solicitante_pre_educ_universidad_nombre", rs.getString(31));
				session.setAttribute("temp_solicitante_pre_educ_otros", rs.getString(32));
				session.setAttribute("temp_solicitante_pre_idioma_lkup", rs.getString(33));
				session.setAttribute("temp_solicitante_pre_religion_lkup", rs.getString(34));
				session.setAttribute("temp_solicitante_pre_profesion", rs.getString(35));
				session.setAttribute("temp_solicitante_pre_ocup_pais_de_origen", rs.getString(36));
				session.setAttribute("temp_solicitante_pre_ingreso_mensual_pais_de_origen", rs.getString(37));
				session.setAttribute("temp_solicitante_pre_estatus_civil_lkup", rs.getString(38));
				session.setAttribute("temp_solicitante_pre_nombre_conyuge", rs.getString(39));
				session.setAttribute("temp_solicitante_pre_edad_conyuge", rs.getString(40));
				session.setAttribute("temp_solicitante_pre_ubic_actual_conyuge", rs.getString(41));
				session.setAttribute("temp_solicitante_pre_ayuda_de_ong", rs.getString(42));
				session.setAttribute("temp_solicitante_pre_fam_en_riesgo", rs.getString(43));
				session.setAttribute("temp_solicitante_pre_situ_econ_lkup", rs.getString(44));
				session.setAttribute("temp_solicitante_pre_situ_salud", rs.getString(45));
				session.setAttribute("temp_solicitante_pre_radicado_en_pan", rs.getString(46));
				session.setAttribute("temp_solicitante_pre_fecha_de_salida_origen", rs.getString(47));
				session.setAttribute("temp_solicitante_pre_ruta_de_llegada", rs.getString(48));
				session.setAttribute("temp_solicitante_pre_proteccion_pedido_otro_pais", rs.getString(49));
				session.setAttribute("temp_solicitante_pre_transporte_util_lkup", rs.getString(50));
				session.setAttribute("temp_solicitante_pre_nombre_de_nave_y_bandera", rs.getString(51));
				session.setAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado_lkup", rs.getString(52));
				session.setAttribute("temp_solicitante_pre_mencione_alguna_haya_ayudado", rs.getString(53));
				session.setAttribute("temp_solicitante_pre_fecha_llegada_panama", rs.getString(54));
				session.setAttribute("temp_solicitante_pre_familiares_en_pan", rs.getString(55));
				session.setAttribute("temp_solicitante_pre_ha_estado_en_pan_antes", rs.getString(56));
				session.setAttribute("temp_solicitante_pre_motivo_de_persecucion_lkup", rs.getString(57));
				session.setAttribute("temp_solicitante_pre_ident_agent_persecucion_lkup", rs.getString(58));
				session.setAttribute("temp_solicitante_pre_ident_agent_persecucion_expl", rs.getString(59));
				session.setAttribute("temp_solicitante_pre_org_pertenecidos", rs.getString(60));
				session.setAttribute("temp_solicitante_pre_org_pertenecidos_desc", rs.getString(61));
				session.setAttribute("temp_solicitante_pre_arrestado_condenado_lkup", rs.getString(62));
				session.setAttribute("temp_solicitante_pre_arrestado_condenado_desc", rs.getString(63));
				session.setAttribute("temp_solicitante_pre_fecha_solicitud_onpar", rs.getString(64));
				session.setAttribute("temp_solicitante_pre_violencia_fisica_armado_lkup", rs.getString(65));
				session.setAttribute("temp_solicitante_pre_violencia_fisica_armado_desc", rs.getString(66));
				session.setAttribute("temp_solicitante_pre_justifica_legal", rs.getString(67));
				session.setAttribute("temp_solicitante_pre_permitido_regresar_al_pais_lkup", rs.getString(68));
				session.setAttribute("temp_solicitante_pre_forma_afectado_al_regresar_lkup", rs.getString(69));
				session.setAttribute("temp_solicitante_pre_forma_afectado_al_regresar_desc", rs.getString(70));
				session.setAttribute("temp_solicitante_pre_hechos_para_regresar", rs.getString(71));
				session.setAttribute("temp_solicitante_pre_fundado_temor", rs.getString(72));
				session.setAttribute("temp_solicitante_pre_genero_lkup", rs.getString(73));
				session.setAttribute("temp_solicitante_pre_nombre_padre", rs.getString(74));
				session.setAttribute("temp_solicitante_pre_nombre_madre", rs.getString(75));
				session.setAttribute("temp_solicitante_pre_necesidad_interprete_lkup", rs.getString(76));
				session.setAttribute("temp_solicitante_pre_lugar_de_trabajo", rs.getString(77));
				session.setAttribute("temp_solicitante_pre_fecha_entrevista_legal", rs.getString(78));
				session.setAttribute("temp_solicitante_pre_fecha_entrevista_social", rs.getString(79));	
				session.setAttribute("temp_solicitante_pre_leg_q1", rs.getString(80));
				session.setAttribute("temp_solicitante_pre_leg_q2", rs.getString(81));
				session.setAttribute("temp_solicitante_pre_leg_q3", rs.getString(82));
				session.setAttribute("temp_solicitante_pre_leg_q4", rs.getString(83));
				session.setAttribute("temp_solicitante_pre_leg_q5", rs.getString(84));
				session.setAttribute("temp_solicitante_pre_leg_q6", rs.getString(85));
				session.setAttribute("temp_solicitante_pre_leg_q7", rs.getString(86));
				session.setAttribute("temp_solicitante_pre_leg_q8", rs.getString(87));
				session.setAttribute("temp_solicitante_pre_leg_q9", rs.getString(88));
				session.setAttribute("temp_solicitante_pre_leg_q10", rs.getString(89));
				session.setAttribute("temp_solicitante_pre_leg_q11", rs.getString(90));
				session.setAttribute("temp_solicitante_pre_leg_q12", rs.getString(91));
				session.setAttribute("temp_solicitante_pre_leg_q13", rs.getString(92));
				session.setAttribute("temp_solicitante_pre_leg_q14", rs.getString(93));
				session.setAttribute("temp_solicitante_pre_leg_q15", rs.getString(94));
				session.setAttribute("temp_solicitante_pre_leg_q16", rs.getString(95));
				session.setAttribute("temp_solicitante_pre_leg_q17", rs.getString(96));
				session.setAttribute("temp_solicitante_pre_leg_q18", rs.getString(97));
				session.setAttribute("temp_solicitante_pre_leg_q19", rs.getString(98));
				session.setAttribute("temp_solicitante_pre_leg_q20", rs.getString(99));
				session.setAttribute("temp_solicitante_pre_leg_q21", rs.getString(100));
				session.setAttribute("temp_solicitante_pre_leg_q22", rs.getString(101));
				session.setAttribute("temp_solicitante_pre_leg_q23", rs.getString(102));
				session.setAttribute("temp_solicitante_pre_leg_q24", rs.getString(103));
				session.setAttribute("temp_solicitante_pre_leg_q25", rs.getString(104));
				session.setAttribute("temp_solicitante_pre_leg_q26", rs.getString(105));
				session.setAttribute("temp_solicitante_pre_soc_qiii", rs.getString(106));
				session.setAttribute("temp_solicitante_pre_soc_qiv1", rs.getString(107));
				session.setAttribute("temp_solicitante_pre_soc_qiv2", rs.getString(108));
				session.setAttribute("temp_solicitante_pre_soc_qv11", rs.getString(109));
				session.setAttribute("temp_solicitante_pre_soc_qv12", rs.getString(110));
				session.setAttribute("temp_solicitante_pre_soc_qv13", rs.getString(111));
				session.setAttribute("temp_solicitante_pre_soc_qv14", rs.getString(112));
				session.setAttribute("temp_solicitante_pre_soc_qv21", rs.getString(113));
				session.setAttribute("temp_solicitante_pre_soc_qv22", rs.getString(114));
				session.setAttribute("temp_solicitante_pre_soc_qv23", rs.getString(115));
				session.setAttribute("temp_solicitante_pre_soc_qv31", rs.getString(116));
				session.setAttribute("temp_solicitante_pre_soc_qv32", rs.getString(117));
				session.setAttribute("temp_solicitante_pre_soc_qv33", rs.getString(118));
				session.setAttribute("temp_solicitante_pre_soc_qv41", rs.getString(119));
				session.setAttribute("temp_solicitante_pre_soc_qv42", rs.getString(120));
				session.setAttribute("temp_solicitante_pre_soc_qv43", rs.getString(121));
				session.setAttribute("temp_solicitante_pre_soc_qvi1", rs.getString(122));
				session.setAttribute("temp_solicitante_pre_soc_qvi2", rs.getString(123));
				session.setAttribute("temp_solicitante_pre_soc_qvi3", rs.getString(124));
				session.setAttribute("temp_solicitante_pre_soc_qvi4", rs.getString(125));
				session.setAttribute("temp_solicitante_pre_soc_qvi5", rs.getString(126));
				session.setAttribute("temp_solicitante_pre_soc_qvii", rs.getString(127));
				session.setAttribute("temp_solicitante_pre_soc_qviii", rs.getString(128));			
				session.setAttribute("temp_solicitante_adm_fecha_resol", rs.getString(129));
				session.setAttribute("temp_solicitante_adm_dec_resol_lkup", rs.getString(130));
				session.setAttribute("temp_solicitante_adm_dec_resol_memo", rs.getString(131));
				session.setAttribute("temp_solicitante_adm_fecha_noti_resol", rs.getString(132));
				session.setAttribute("temp_solicitante_adm_fecha_de_pedir_recon", rs.getString(133));
				session.setAttribute("temp_solicitante_adm_peticion_para_la_recon", rs.getString(134));
				session.setAttribute("temp_solicitante_adm_fecha_resol_recon", rs.getString(135));
				session.setAttribute("temp_solicitante_adm_dec_resol_recon_lkup", rs.getString(136));
				session.setAttribute("temp_solicitante_adm_dec_resol_recon_memo", rs.getString(137));
				session.setAttribute("temp_solicitante_adm_fecha_noti_resol_recon", rs.getString(138));
				session.setAttribute("temp_solicitante_adm_fecha_de_pedir_apel", rs.getString(139));
				session.setAttribute("temp_solicitante_adm_peticion_para_la_apel", rs.getString(140));
				session.setAttribute("temp_solicitante_adm_fecha_resol_apel", rs.getString(141));
				session.setAttribute("temp_solicitante_adm_dec_resol_apel_lkup", rs.getString(142));
				session.setAttribute("temp_solicitante_adm_dec_resol_apel_memo", rs.getString(143));
				session.setAttribute("temp_solicitante_adm_fecha_noti_resol_apel", rs.getString(144));
				session.setAttribute("temp_solicitante_adm_numero_de_caso", rs.getString(145));
				session.setAttribute("temp_solicitante_adm_fecha_expedicion_carnet", rs.getString(146));
				session.setAttribute("temp_solicitante_adm_estatus_lkup", rs.getString(147));
				session.setAttribute("temp_solicitante_pre_declaracion_jurada", rs.getBlob(148));
				
				session.setAttribute("temp_solicitante_pre_copia_identificacion1", rs.getBlob(149));
				session.setAttribute("temp_solicitante_pre_copia_identificacion2", rs.getBlob(150));
				session.setAttribute("temp_solicitante_pre_copia_identificacion3", rs.getBlob(151));
				session.setAttribute("temp_solicitante_pre_copia_identificacion4", rs.getBlob(152));
				session.setAttribute("temp_solicitante_pre_copia_identificacion5", rs.getBlob(153));
				session.setAttribute("temp_solicitante_pre_entrevista_social", rs.getBlob(154));
				session.setAttribute("temp_solicitante_pre_soc_foto_jefe_de_familia", rs.getBlob(155));
				session.setAttribute("temp_solicitante_pre_entrevista_legal", rs.getBlob(156));
				session.setAttribute("temp_solicitante_adm_peticion_para_la_recon", rs.getBlob(157));
				session.setAttribute("temp_solicitante_adm_peticion_para_la_apel", rs.getBlob(158));
				session.setAttribute("temp_solicitante_pre_edad", rs.getString(159));
				session.setAttribute("temp_solicitante_fecha_de_renuncia", rs.getString(160));
				session.setAttribute("temp_solicitante_renuncia", rs.getBlob(161));

				session.setAttribute("temp_solicitante_ref_fecha_resol", rs.getString(162));
				session.setAttribute("temp_solicitante_ref_dec_resol_lkup", rs.getString(163));
				session.setAttribute("temp_solicitante_ref_dec_resol_memo", rs.getString(164));
				session.setAttribute("temp_solicitante_ref_fecha_noti_resol", rs.getString(165));
				session.setAttribute("temp_solicitante_ref_fecha_de_pedir_recon", rs.getString(166));
				session.setAttribute("temp_solicitante_ref_peticion_para_la_recon", rs.getBlob(167));
				session.setAttribute("temp_solicitante_ref_fecha_resol_recon", rs.getString(168));
				session.setAttribute("temp_solicitante_ref_dec_resol_recon_lkup", rs.getString(169));
				session.setAttribute("temp_solicitante_ref_dec_resol_recon_memo", rs.getString(170));
				session.setAttribute("temp_solicitante_ref_fecha_noti_resol_recon", rs.getString(171));
				session.setAttribute("temp_solicitante_ref_fecha_de_pedir_apel", rs.getString(172));
				session.setAttribute("temp_solicitante_ref_peticion_para_la_apel", rs.getBlob(173));
				session.setAttribute("temp_solicitante_ref_fecha_resol_apel", rs.getString(174));
				session.setAttribute("temp_solicitante_ref_dec_resol_apel_lkup", rs.getString(175));
				session.setAttribute("temp_solicitante_ref_dec_resol_apel_memo", rs.getString(176));
				session.setAttribute("temp_solicitante_ref_fecha_noti_resol_apel", rs.getString(177));
				session.setAttribute("temp_solicitante_ref_estatus_lkup", rs.getString(178));

				
			}

			if (size == 0) {
				response.sendRedirect("main.jsp?target=solicitantes&search=norecfound");
			} else {		
				response.sendRedirect("main.jsp?target=solicitante_upd");	
			}		
			
		} else {
			response.sendRedirect("/onpar/salir.jsp");
		}
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>