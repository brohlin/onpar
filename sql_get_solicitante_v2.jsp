<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select " +
					"replace(format(id,''),',','')," +
					"ifnull(pre_primer_nombre,''), " +
					"ifnull(pre_apellido_paterno,''), " +
					"ifnull(pre_apellido_materno,''), " +
					"ifnull(pre_otros_nombres,''), " +
					"ifnull(pre_fecha_de_nacimiento,''), " +
					"ifnull(pre_ciudad_de_nacimiento,''), " +
					"ifnull(pre_pais_de_nacimiento_lkup,''), " +
					"ifnull(pre_genero_lkup,''), " +
					"ifnull(pre_nacionalidad_lkup,''), " +
					"ifnull(pre_otro_estatus_migratoria,''), " +
					"ifnull(pre_otro_estatus_migratoria_paises,''), " +
					"ifnull(pre_etnico_o_tribu,''), " +
					"ifnull(pre_religion_lkup,''), " +
					"ifnull(pre_idioma_lkup,''), " +
					"ifnull(pre_otros_idiomas,''), " +
					"ifnull(pre_direccion_actual,''), " +
					"ifnull(pre_telefono1,''), " +
					"ifnull(pre_pasaporte,''), " +
	"if(pre_copia_pasaporte is not null,'yes',null), " +
					"ifnull(pre_otros_documentos,''), " +
	"if(pre_copia_otro_documento is not null,'yes',null), " +
					"ifnull(pre_edu_nombre,''), " +
					"ifnull(pre_edu_lugar,''), " +
					"ifnull(pre_edu_desde,''), " +
					"ifnull(pre_edu_hasta,''), " +
					"ifnull(pre_edu_titulo,''), " +
					"ifnull(pre_edu_nombre2,''), " +
					"ifnull(pre_edu_lugar2,''), " +
					"ifnull(pre_edu_desde2,''), " +
					"ifnull(pre_edu_hasta2,''), " +
					"ifnull(pre_edu_titulo2,''), " +
					"ifnull(pre_ocu_empleador,''), " +
					"ifnull(pre_ocu_lugar,''), " +
					"ifnull(pre_ocu_desde,''), " +
					"ifnull(pre_ocu_hasta,''), " +
					"ifnull(pre_ocu_puesto,''), " +					
					"ifnull(pre_fecha_de_salida_origen,''), " +
					"ifnull(pre_fundado_temor,''), " +
					"ifnull(pre_fundado_temor_partb,''), " +
					"ifnull(pre_pref,''), " +
					"ifnull(pre_pref_sexo,''), " +
					"ifnull(pre_pref_idioma,''), " +
					"ifnull(pre_fecha_solicitud_onpar,''), " +
					"ifnull(pre_solicitud_preparado_por,''), " +
					"ifnull(pre_ui_nombre_recibio,''), " +
					"ifnull(pre_ui_fecha_recibido,''), " +
					"ifnull(fecha_entrevista_legal,''), " +
					"ifnull(pre_fecha_entrevista_social,''), " +
	"if(pre_declaracion_jurada is not null,'yes',null), " +
					"ifnull(pre_estatus_lkup,''), " +
					"ifnull(pre_soc_qiii,''), " +
					"ifnull(pre_soc_qiv1,''), " +
					"ifnull(pre_soc_qiv2,''), " +
					"ifnull(pre_soc_qv11,''), " +
					"ifnull(pre_soc_qv12,''), " +
					"ifnull(pre_soc_qv13,''), " +
					"ifnull(pre_soc_qv14,''), " +
					"ifnull(pre_soc_qv21,''), " +
					"ifnull(pre_soc_qv22,''), " +
					"ifnull(pre_soc_qv23,''), " +
					"ifnull(pre_soc_qv31,''), " +
					"ifnull(pre_soc_qv32,''), " +
					"ifnull(pre_soc_qv33,''), " +
					"ifnull(pre_soc_qv41,''), " +
					"ifnull(pre_soc_qv42,''), " +
					"ifnull(pre_soc_qv43,''), " +
					"ifnull(pre_soc_qvi1,''), " +
					"ifnull(pre_soc_qvi2,''), " +
					"ifnull(pre_soc_qvi3,''), " +
					"ifnull(pre_soc_qvi4,''), " +
					"ifnull(pre_soc_qvi5,''), " +
					"ifnull(pre_soc_qvii,''), " +
					"ifnull(pre_soc_qviii,''), " +
	"if(pre_entrevista_social is not null,'yes',null), " +
	"if(pre_soc_foto_jefe_de_familia is not null,'yes',null), " +
					"ifnull(q1,''), " +
					"ifnull(q2,''), " +
					"ifnull(q3,''), " +
					"ifnull(q4,''), " +
					"ifnull(q5,''), " +
					"ifnull(q6,''), " +
					"ifnull(q7,''), " +
					"ifnull(q8,''), " +
					"ifnull(q9,''), " +
					"ifnull(q10,''), " +
					"ifnull(q11,''), " +
					"ifnull(q12,''), " +
					"ifnull(q13,''), " +
					"ifnull(q14,''), " +
					"ifnull(q15,''), " +
					"ifnull(q16,''), " +
					"ifnull(q17,''), " +
					"ifnull(q18,''), " +
					"ifnull(q19,''), " +
					"ifnull(q20,''), " +
					"ifnull(q21,''), " +
					"ifnull(q22,''), " +
					"ifnull(q23,''), " +
					"ifnull(q24,''), " +
					"ifnull(q25,''), " +
					"ifnull(q26,''), " +
	"if(pre_entrevista_legal is not null,'yes',null), " +
					"ifnull(adm_fecha_resol,''), " +
					"ifnull(adm_dec_resol_lkup,''), " +
					"ifnull(adm_dec_resol_memo,''), " +
					"ifnull(adm_fecha_noti_resol,''), " +
					"ifnull(adm_fecha_de_pedir_recon,''), " +
	"if(adm_peticion_para_la_recon is not null,'yes',null), " +
					"ifnull(adm_fecha_resol_recon,''), " +
					"ifnull(adm_dec_resol_recon_lkup,''), " +
					"ifnull(adm_dec_resol_recon_memo,''), " +
					"ifnull(adm_fecha_noti_resol_recon,''), " +
					"ifnull(adm_fecha_de_pedir_apel,''), " +
	"if(adm_peticion_para_la_apel is not null,'yes',null), " +
					"ifnull(adm_fecha_resol_apel,''), " +
					"ifnull(adm_dec_resol_apel_lkup,''), " +
					"ifnull(adm_dec_resol_apel_memo,''), " +
					"ifnull(adm_fecha_noti_resol_apel,''), " +
					"ifnull(adm_numero_de_caso,''), " +
					"ifnull(adm_fecha_expedicion_carnet,''), " +
					"ifnull(adm_estatus_lkup,''), " +
					"ifnull(ref_fecha_resol,''), " +
					"ifnull(ref_dec_resol_lkup,''), " +
					"ifnull(ref_dec_resol_memo,''), " +
					"ifnull(ref_fecha_noti_resol,''), " +
					"ifnull(ref_fecha_de_pedir_recon,''), " +
	"if(ref_peticion_para_la_recon is not null,'yes',null), " +
					"ifnull(ref_fecha_resol_recon,''), " +
					"ifnull(ref_dec_resol_recon_lkup,''), " +
					"ifnull(ref_dec_resol_recon_memo,''), " +
					"ifnull(ref_fecha_noti_resol_recon,''), " +
					"ifnull(ref_fecha_de_pedir_apel,''), " +
	"if(ref_peticion_para_la_apel is not null,'yes',null), " +
					"ifnull(ref_fecha_resol_apel,''), " +
					"ifnull(ref_dec_resol_apel_lkup,''), " +
					"ifnull(ref_dec_resol_apel_memo,''), " +
					"ifnull(ref_fecha_noti_resol_apel,''), " +
					"ifnull(ref_permiso_especial_no_de_carnet,''), " +
					"ifnull(ref_fecha_exped_permiso_de_trabajar,''), " +
					"ifnull(ref_solicito_reunificacion_familiar,''), " +
					"ifnull(ref_solicito_permiso_de_salida,''), " +
					"ifnull(ref_estatus_lkup,''), " +
					"ifnull(ref_ley25_lkup,''), " +
					"ifnull(last_mod_tmstmp,''), " +
					"ifnull(last_user_id,''), " +
					"ifnull(legal_user_id,''), " +
					"ifnull(social_user_id,''), " +
					"ifnull(fecha_de_renuncia,''), " +
					"if(renuncia is not null,'yes',null), " +
					"ifnull(format(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25),''),''), " +
					"ifnull(pre_fecha_llegada_panama,''), " +
					"ifnull(pre_estatus_civil_lkup,''), " +
					"ifnull(pre_direccion_pais_de_origen,''), " +
					"ifnull(pre_ocup_pais_de_origen,''), " +
					"ifnull(pre_lugar_de_trabajo,''), " +

					"ifnull(razon_de_quitar_refug_recon,''), " +
					"ifnull(fecha_de_quitar_refug_recon,''), " +
					"if(quitar_refug_recon is not null,'yes',null), " +
					"ifnull(entrevista_programada,''), " +
					"ifnull(fecha_de_resolucion,''), " +
					"if(resolucion is not null,'yes',null), " +
					"ifnull(fecha_entrevista_social,''), " +
					"ifnull(profesion,''), " +
					"ifnull(habilidades,''), " +
					"ifnull(subsistiendo_en_pa,''), " +
					"ifnull(ingreso_en_pa,''), " +
					"ifnull(ingreso_en_pais_de_origen,''), " +
					"ifnull(condicion_de_vivienda_actual,''), " +
					"ifnull(embarazo,''), " +
					"ifnull(discapacidad,''), " +
					"ifnull(discapacidad_cual,''), " +
					"ifnull(enfermedad,''), " +
					"ifnull(enfermedad_cual,''), " +
					"ifnull(medicamento,''), " +
					"ifnull(medicamento_cual,''), " +
					"ifnull(alergica_a_medicamento,''), " +
					"ifnull(alergica_a_medicamento_cual,''), " +
					"ifnull(ha_sido_operado,''), " +
					"ifnull(operado_de_que,''), " +
					"ifnull(miembro_de_fam_con_discapacidad_o_enfermedad,''), " +
					"ifnull(motivo,''), " +
					"ifnull(motivo_otro_cual,''), " +
					"ifnull(motivo_porque,''), " +
					"ifnull(otra_informacion,''), " +
					"ifnull(recomendaciones,''), " +
					"ifnull(social_user_id2,''), " +
					"ifnull(q27,''), " +
					"ifnull(q28,''), " +
					"ifnull(q29,''), " +
					"ifnull(q30,''), " +
					"ifnull(q31,''), " +
					"ifnull(social_otra_pregunta,''), " +
					"ifnull(legal_otra_pregunta,''), " +
					"ifnull(legal_username,''), " +
					"ifnull(social_username,'') " +
					"from vw_solicitante " +
					"where id = ? " + 
					"and id > 3000 ";
	
	String mId = request.getParameter("id");

	session.setAttribute("temp_solicitante_v2_id", null);
	session.setAttribute("temp_solicitante_v2_pre_primer_nombre", null);
	session.setAttribute("temp_solicitante_v2_pre_apellido_paterno", null);
	session.setAttribute("temp_solicitante_v2_pre_apellido_materno", null);
	session.setAttribute("temp_solicitante_v2_pre_otros_nombres", null);
	session.setAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento", null);
	session.setAttribute("temp_solicitante_v2_pre_ciudad_de_nacimiento", null);
	session.setAttribute("temp_solicitante_v2_pre_pais_de_nacimiento_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_genero_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_nacionalidad_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria", null);
	session.setAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria_paises", null);
	session.setAttribute("temp_solicitante_v2_pre_etnico_o_tribu", null);
	session.setAttribute("temp_solicitante_v2_pre_religion_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_idioma_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_otros_idiomas", null);
	session.setAttribute("temp_solicitante_v2_pre_direccion_actual", null);
	session.setAttribute("temp_solicitante_v2_pre_telefono1", null);
	session.setAttribute("temp_solicitante_v2_pre_pasaporte", null);
	session.setAttribute("temp_solicitante_v2_pre_copia_pasaporte", null);
	session.setAttribute("temp_solicitante_v2_pre_otros_documentos", null);
	session.setAttribute("temp_solicitante_v2_pre_copia_otro_documento", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_nombre", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_lugar", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_desde", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_hasta", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_titulo", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_nombre2", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_lugar2", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_desde2", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_hasta2", null);
	session.setAttribute("temp_solicitante_v2_pre_edu_titulo2", null);
	session.setAttribute("temp_solicitante_v2_pre_ocu_empleador", null);
	session.setAttribute("temp_solicitante_v2_pre_ocu_lugar", null);
	session.setAttribute("temp_solicitante_v2_pre_ocu_desde", null);
	session.setAttribute("temp_solicitante_v2_pre_ocu_hasta", null);
	session.setAttribute("temp_solicitante_v2_pre_ocu_puesto", null);
	
	session.setAttribute("temp_solicitante_v2_pre_fecha_de_salida_origen", null);
	
	session.setAttribute("temp_solicitante_v2_pre_fundado_temor", null);
	session.setAttribute("temp_solicitante_v2_pre_fundado_temor_partb", null);
	session.setAttribute("temp_solicitante_v2_pre_pref", null);
	session.setAttribute("temp_solicitante_v2_pre_pref_sexo", null);
	session.setAttribute("temp_solicitante_v2_pre_pref_idioma", null);
	session.setAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar", null);
	session.setAttribute("temp_solicitante_v2_pre_solicitud_preparado_por", null);
	session.setAttribute("temp_solicitante_v2_pre_ui_nombre_recibio", null);
	session.setAttribute("temp_solicitante_v2_pre_ui_fecha_recibido", null);
	session.setAttribute("temp_solicitante_v2_fecha_entrevista_legal", null);
	session.setAttribute("temp_solicitante_v2_pre_fecha_entrevista_social", null);
	session.setAttribute("temp_solicitante_v2_pre_declaracion_jurada", null);
	session.setAttribute("temp_solicitante_v2_pre_estatus_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qiii", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qiv1", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qiv2", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv11", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv12", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv13", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv14", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv21", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv22", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv23", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv31", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv32", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv33", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv41", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv42", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qv43", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvi1", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvi2", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvi3", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvi4", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvi5", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qvii", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_qviii", null);
	session.setAttribute("temp_solicitante_v2_pre_entrevista_social", null);
	session.setAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia", null);
	session.setAttribute("temp_solicitante_v2_q1", null);
	session.setAttribute("temp_solicitante_v2_q2", null);
	session.setAttribute("temp_solicitante_v2_q3", null);
	session.setAttribute("temp_solicitante_v2_q4", null);
	session.setAttribute("temp_solicitante_v2_q5", null);
	session.setAttribute("temp_solicitante_v2_q6", null);
	session.setAttribute("temp_solicitante_v2_q7", null);
	session.setAttribute("temp_solicitante_v2_q8", null);
	session.setAttribute("temp_solicitante_v2_q9", null);
	session.setAttribute("temp_solicitante_v2_q10", null);
	session.setAttribute("temp_solicitante_v2_q11", null);
	session.setAttribute("temp_solicitante_v2_q12", null);
	session.setAttribute("temp_solicitante_v2_q13", null);
	session.setAttribute("temp_solicitante_v2_q14", null);
	session.setAttribute("temp_solicitante_v2_q15", null);
	session.setAttribute("temp_solicitante_v2_q16", null);
	session.setAttribute("temp_solicitante_v2_q17", null);
	session.setAttribute("temp_solicitante_v2_q18", null);
	session.setAttribute("temp_solicitante_v2_q19", null);
	session.setAttribute("temp_solicitante_v2_q20", null);
	session.setAttribute("temp_solicitante_v2_q21", null);
	session.setAttribute("temp_solicitante_v2_q22", null);
	session.setAttribute("temp_solicitante_v2_q23", null);
	session.setAttribute("temp_solicitante_v2_q24", null);
	session.setAttribute("temp_solicitante_v2_q25", null);
	session.setAttribute("temp_solicitante_v2_q26", null);
	session.setAttribute("temp_solicitante_v2_pre_entrevista_legal", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_resol", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_lkup", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_memo", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_de_pedir_recon", null);
	session.setAttribute("temp_solicitante_v2_adm_peticion_para_la_recon", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_resol_recon", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_recon_lkup", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_recon_memo", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol_recon", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_de_pedir_apel", null);
	session.setAttribute("temp_solicitante_v2_adm_peticion_para_la_apel", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_resol_apel", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_apel_lkup", null);
	session.setAttribute("temp_solicitante_v2_adm_dec_resol_apel_memo", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol_apel", null);
	session.setAttribute("temp_solicitante_v2_adm_numero_de_caso", null);
	session.setAttribute("temp_solicitante_v2_adm_fecha_expedicion_carnet", null);
	session.setAttribute("temp_solicitante_v2_adm_estatus_lkup", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_resol", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_lkup", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_memo", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_de_pedir_recon", null);
	session.setAttribute("temp_solicitante_v2_ref_peticion_para_la_recon", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_resol_recon", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_recon_lkup", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_recon_memo", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol_recon", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_de_pedir_apel", null);
	session.setAttribute("temp_solicitante_v2_ref_peticion_para_la_apel", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_resol_apel", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_apel_lkup", null);
	session.setAttribute("temp_solicitante_v2_ref_dec_resol_apel_memo", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol_apel", null);
	session.setAttribute("temp_solicitante_v2_ref_permiso_especial_no_de_carnet", null);
	session.setAttribute("temp_solicitante_v2_ref_fecha_exped_permiso_de_trabajar", null);
	session.setAttribute("temp_solicitante_v2_ref_solicito_reunificacion_familiar", null);
	session.setAttribute("temp_solicitante_v2_ref_solicito_permiso_de_salida", null);
	session.setAttribute("temp_solicitante_v2_ref_estatus_lkup", null);
	session.setAttribute("temp_solicitante_v2_ref_ley25_lkup", null);
	session.setAttribute("temp_solicitante_v2_last_mod_tmstmp", null);
	session.setAttribute("temp_solicitante_v2_last_user_id", null);
	session.setAttribute("temp_solicitante_v2_legal_user_id", null);
	session.setAttribute("temp_solicitante_v2_social_user_id", null);
	session.setAttribute("temp_solicitante_v2_fecha_de_renuncia", null);
	session.setAttribute("temp_solicitante_v2_renuncia", null);
	session.setAttribute("temp_solicitante_v2_pre_edad", null);
	session.setAttribute("temp_solicitante_v2_pre_fecha_llegada_panama", null);
	session.setAttribute("temp_solicitante_v2_pre_estatus_civil_lkup", null);
	session.setAttribute("temp_solicitante_v2_pre_direccion_pais_de_origen", null);
	session.setAttribute("temp_solicitante_v2_pre_ocup_pais_de_origen", null);
	session.setAttribute("temp_solicitante_v2_pre_lugar_de_trabajo", null);
	session.setAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon", null);
	session.setAttribute("temp_solicitante_v2_fecha_de_quitar_refug_recon", null);
	session.setAttribute("temp_solicitante_v2_quitar_refug_recon", null);
	session.setAttribute("temp_solicitante_v2_entrevista_programada", null);
	session.setAttribute("temp_solicitante_v2_fecha_de_resolucion", null);
	session.setAttribute("temp_solicitante_v2_resolucion", null);
	
	session.setAttribute("temp_solicitante_v2_fecha_entrevista_social", null);
	session.setAttribute("temp_solicitante_v2_profesion", null);
	session.setAttribute("temp_solicitante_v2_habilidades", null);
	session.setAttribute("temp_solicitante_v2_subsistiendo_en_pa", null);
	session.setAttribute("temp_solicitante_v2_ingreso_en_pa", null);
	session.setAttribute("temp_solicitante_v2_ingreso_en_pais_de_origen", null);
	session.setAttribute("temp_solicitante_v2_condicion_de_vivienda_actual", null);
	session.setAttribute("temp_solicitante_v2_embarazo", null);
	session.setAttribute("temp_solicitante_v2_discapacidad", null);
	session.setAttribute("temp_solicitante_v2_discapacidad_cual", null);
	session.setAttribute("temp_solicitante_v2_enfermedad", null);
	session.setAttribute("temp_solicitante_v2_enfermedad_cual", null);
	session.setAttribute("temp_solicitante_v2_medicamento", null);
	session.setAttribute("temp_solicitante_v2_medicamento_cual", null);
	session.setAttribute("temp_solicitante_v2_alergica_a_medicamento", null);
	session.setAttribute("temp_solicitante_v2_alergica_a_medicamento_cual", null);
	session.setAttribute("temp_solicitante_v2_ha_sido_operado", null);
	session.setAttribute("temp_solicitante_v2_operado_de_que", null);
	session.setAttribute("temp_solicitante_v2_miembro_de_fam_con_discapacidad_o_enfermedad", null);
	session.setAttribute("temp_solicitante_v2_motivo", null);
	session.setAttribute("temp_solicitante_v2_motivo_otro_cual", null);
	session.setAttribute("temp_solicitante_v2_motivo_porque", null);
	session.setAttribute("temp_solicitante_v2_otra_informacion", null);
	session.setAttribute("temp_solicitante_v2_recomendaciones", null);
	session.setAttribute("temp_solicitante_v2_social_user_id2", null);	
	session.setAttribute("temp_solicitante_v2_q27", null);
	session.setAttribute("temp_solicitante_v2_q28", null);
	session.setAttribute("temp_solicitante_v2_q29", null);
	session.setAttribute("temp_solicitante_v2_q30", null);
	session.setAttribute("temp_solicitante_v2_q31", null);
	session.setAttribute("temp_solicitante_v2_social_otra_pregunta", null);
	session.setAttribute("temp_solicitante_v2_legal_otra_pregunta", null);	
	session.setAttribute("temp_solicitante_v2_legal_username", null);
	session.setAttribute("temp_solicitante_v2_social_username", null);	
	
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
	System.out.println("before try");
	
	
	
	try{
		System.out.println("in the try");
		if (session.getAttribute("email") != null) {

			System.out.println("email not null");

			prest=con.prepareStatement(mQuery);
			System.out.println("after PS");
			prest.setString(1,mId);
			
			System.out.println("after set string");
			rs=prest.executeQuery();

			System.out.println("after execute query");
					
			int size = 0;
			
System.out.println("before while loop");

			while(rs.next())
			{
System.out.println("in while loop");			
				size++;
				session.setAttribute("temp_solicitante_v2_id", rs.getString(1));
				session.setAttribute("temp_solicitante_v2_pre_primer_nombre", rs.getString(2));
				session.setAttribute("temp_solicitante_v2_pre_apellido_paterno", rs.getString(3));
				session.setAttribute("temp_solicitante_v2_pre_apellido_materno", rs.getString(4));
				session.setAttribute("temp_solicitante_v2_pre_otros_nombres", rs.getString(5));
				session.setAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento", rs.getString(6));
				session.setAttribute("temp_solicitante_v2_pre_ciudad_de_nacimiento", rs.getString(7));
				session.setAttribute("temp_solicitante_v2_pre_pais_de_nacimiento_lkup", rs.getString(8));
				session.setAttribute("temp_solicitante_v2_pre_genero_lkup", rs.getString(9));
				session.setAttribute("temp_solicitante_v2_pre_nacionalidad_lkup", rs.getString(10));
				session.setAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria", rs.getString(11));
				session.setAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria_paises", rs.getString(12));
				session.setAttribute("temp_solicitante_v2_pre_etnico_o_tribu", rs.getString(13));
				session.setAttribute("temp_solicitante_v2_pre_religion_lkup", rs.getString(14));
				session.setAttribute("temp_solicitante_v2_pre_idioma_lkup", rs.getString(15));
				session.setAttribute("temp_solicitante_v2_pre_otros_idiomas", rs.getString(16));
				session.setAttribute("temp_solicitante_v2_pre_direccion_actual", rs.getString(17));
				session.setAttribute("temp_solicitante_v2_pre_telefono1", rs.getString(18));
				session.setAttribute("temp_solicitante_v2_pre_pasaporte", rs.getString(19));
				session.setAttribute("temp_solicitante_v2_pre_copia_pasaporte", rs.getBlob(20));
				session.setAttribute("temp_solicitante_v2_pre_otros_documentos", rs.getString(21));
				session.setAttribute("temp_solicitante_v2_pre_copia_otro_documento", rs.getBlob(22));	
				session.setAttribute("temp_solicitante_v2_pre_edu_nombre", rs.getString(23));
				session.setAttribute("temp_solicitante_v2_pre_edu_lugar", rs.getString(24));
				session.setAttribute("temp_solicitante_v2_pre_edu_desde", rs.getString(25));
				session.setAttribute("temp_solicitante_v2_pre_edu_hasta", rs.getString(26));
				session.setAttribute("temp_solicitante_v2_pre_edu_titulo", rs.getString(27));
				session.setAttribute("temp_solicitante_v2_pre_edu_nombre2", rs.getString(28));
				session.setAttribute("temp_solicitante_v2_pre_edu_lugar2", rs.getString(29));
				session.setAttribute("temp_solicitante_v2_pre_edu_desde2", rs.getString(30));
				session.setAttribute("temp_solicitante_v2_pre_edu_hasta2", rs.getString(31));
				session.setAttribute("temp_solicitante_v2_pre_edu_titulo2", rs.getString(32));
				session.setAttribute("temp_solicitante_v2_pre_ocu_empleador", rs.getString(33));
				session.setAttribute("temp_solicitante_v2_pre_ocu_lugar", rs.getString(34));
				session.setAttribute("temp_solicitante_v2_pre_ocu_desde", rs.getString(35));
				session.setAttribute("temp_solicitante_v2_pre_ocu_hasta", rs.getString(36));
				session.setAttribute("temp_solicitante_v2_pre_ocu_puesto", rs.getString(37));
				session.setAttribute("temp_solicitante_v2_pre_fecha_de_salida_origen", rs.getString(38));
				session.setAttribute("temp_solicitante_v2_pre_fundado_temor", rs.getString(39));
				session.setAttribute("temp_solicitante_v2_pre_fundado_temor_partb", rs.getString(40));
				session.setAttribute("temp_solicitante_v2_pre_pref", rs.getString(41));
				session.setAttribute("temp_solicitante_v2_pre_pref_sexo", rs.getString(42));
				session.setAttribute("temp_solicitante_v2_pre_pref_idioma", rs.getString(43));
				session.setAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar", rs.getString(44));
				session.setAttribute("temp_solicitante_v2_pre_solicitud_preparado_por", rs.getString(45));
				session.setAttribute("temp_solicitante_v2_pre_ui_nombre_recibio", rs.getString(46));
				session.setAttribute("temp_solicitante_v2_pre_ui_fecha_recibido", rs.getString(47));
				session.setAttribute("temp_solicitante_v2_fecha_entrevista_legal", rs.getString(48));
				session.setAttribute("temp_solicitante_v2_pre_fecha_entrevista_social", rs.getString(49));
				session.setAttribute("temp_solicitante_v2_pre_declaracion_jurada", rs.getBlob(50));
				session.setAttribute("temp_solicitante_v2_pre_estatus_lkup", rs.getString(51));
				session.setAttribute("temp_solicitante_v2_pre_soc_qiii", rs.getString(52));
				session.setAttribute("temp_solicitante_v2_pre_soc_qiv1", rs.getString(53));
				session.setAttribute("temp_solicitante_v2_pre_soc_qiv2", rs.getString(54));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv11", rs.getString(55));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv12", rs.getString(56));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv13", rs.getString(57));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv14", rs.getString(58));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv21", rs.getString(59));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv22", rs.getString(60));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv23", rs.getString(61));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv31", rs.getString(62));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv32", rs.getString(63));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv33", rs.getString(64));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv41", rs.getString(65));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv42", rs.getString(66));
				session.setAttribute("temp_solicitante_v2_pre_soc_qv43", rs.getString(67));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvi1", rs.getString(68));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvi2", rs.getString(69));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvi3", rs.getString(70));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvi4", rs.getString(71));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvi5", rs.getString(72));
				session.setAttribute("temp_solicitante_v2_pre_soc_qvii", rs.getString(73));
				session.setAttribute("temp_solicitante_v2_pre_soc_qviii", rs.getString(74));
				session.setAttribute("temp_solicitante_v2_pre_entrevista_social", rs.getBlob(75));
				session.setAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia", rs.getBlob(76));
				session.setAttribute("temp_solicitante_v2_q1", rs.getString(77));
				session.setAttribute("temp_solicitante_v2_q2", rs.getString(78));
				session.setAttribute("temp_solicitante_v2_q3", rs.getString(79));
				session.setAttribute("temp_solicitante_v2_q4", rs.getString(80));
				session.setAttribute("temp_solicitante_v2_q5", rs.getString(81));
				session.setAttribute("temp_solicitante_v2_q6", rs.getString(82));
				session.setAttribute("temp_solicitante_v2_q7", rs.getString(83));
				session.setAttribute("temp_solicitante_v2_q8", rs.getString(84));
				session.setAttribute("temp_solicitante_v2_q9", rs.getString(85));
				session.setAttribute("temp_solicitante_v2_q10", rs.getString(86));
				session.setAttribute("temp_solicitante_v2_q11", rs.getString(87));
				session.setAttribute("temp_solicitante_v2_q12", rs.getString(88));
				session.setAttribute("temp_solicitante_v2_q13", rs.getString(89));
				session.setAttribute("temp_solicitante_v2_q14", rs.getString(90));
				session.setAttribute("temp_solicitante_v2_q15", rs.getString(91));
				session.setAttribute("temp_solicitante_v2_q16", rs.getString(92));
				session.setAttribute("temp_solicitante_v2_q17", rs.getString(93));
				session.setAttribute("temp_solicitante_v2_q18", rs.getString(94));
				session.setAttribute("temp_solicitante_v2_q19", rs.getString(95));
				session.setAttribute("temp_solicitante_v2_q20", rs.getString(96));
				session.setAttribute("temp_solicitante_v2_q21", rs.getString(97));
				session.setAttribute("temp_solicitante_v2_q22", rs.getString(98));
				session.setAttribute("temp_solicitante_v2_q23", rs.getString(99));
				session.setAttribute("temp_solicitante_v2_q24", rs.getString(100));
				session.setAttribute("temp_solicitante_v2_q25", rs.getString(101));
				session.setAttribute("temp_solicitante_v2_q26", rs.getString(102));
				session.setAttribute("temp_solicitante_v2_pre_entrevista_legal", rs.getBlob(103));
				session.setAttribute("temp_solicitante_v2_adm_fecha_resol", rs.getString(104));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_lkup", rs.getString(105));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_memo", rs.getString(106));
				session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol", rs.getString(107));
				session.setAttribute("temp_solicitante_v2_adm_fecha_de_pedir_recon", rs.getString(108));
				session.setAttribute("temp_solicitante_v2_adm_peticion_para_la_recon", rs.getBlob(109));
				session.setAttribute("temp_solicitante_v2_adm_fecha_resol_recon", rs.getString(110));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_recon_lkup", rs.getString(111));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_recon_memo", rs.getString(112));
				session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol_recon", rs.getString(113));
				session.setAttribute("temp_solicitante_v2_adm_fecha_de_pedir_apel", rs.getString(114));
				session.setAttribute("temp_solicitante_v2_adm_peticion_para_la_apel", rs.getBlob(115));
				session.setAttribute("temp_solicitante_v2_adm_fecha_resol_apel", rs.getString(116));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_apel_lkup", rs.getString(117));
				session.setAttribute("temp_solicitante_v2_adm_dec_resol_apel_memo", rs.getString(118));
				session.setAttribute("temp_solicitante_v2_adm_fecha_noti_resol_apel", rs.getString(119));
				session.setAttribute("temp_solicitante_v2_adm_numero_de_caso", rs.getString(120));
				session.setAttribute("temp_solicitante_v2_adm_fecha_expedicion_carnet", rs.getString(121));
				session.setAttribute("temp_solicitante_v2_adm_estatus_lkup", rs.getString(122));
				session.setAttribute("temp_solicitante_v2_ref_fecha_resol", rs.getString(123));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_lkup", rs.getString(124));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_memo", rs.getString(125));
				session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol", rs.getString(126));
				session.setAttribute("temp_solicitante_v2_ref_fecha_de_pedir_recon", rs.getString(127));
				session.setAttribute("temp_solicitante_v2_ref_peticion_para_la_recon", rs.getBlob(128));
				session.setAttribute("temp_solicitante_v2_ref_fecha_resol_recon", rs.getString(129));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_recon_lkup", rs.getString(130));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_recon_memo", rs.getString(131));
				session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol_recon", rs.getString(132));
				session.setAttribute("temp_solicitante_v2_ref_fecha_de_pedir_apel", rs.getString(133));
				session.setAttribute("temp_solicitante_v2_ref_peticion_para_la_apel", rs.getBlob(134));
				session.setAttribute("temp_solicitante_v2_ref_fecha_resol_apel", rs.getString(135));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_apel_lkup", rs.getString(136));
				session.setAttribute("temp_solicitante_v2_ref_dec_resol_apel_memo", rs.getString(137));
				session.setAttribute("temp_solicitante_v2_ref_fecha_noti_resol_apel", rs.getString(138));
				session.setAttribute("temp_solicitante_v2_ref_permiso_especial_no_de_carnet", rs.getString(139));
				session.setAttribute("temp_solicitante_v2_ref_fecha_exped_permiso_de_trabajar", rs.getString(140));
				session.setAttribute("temp_solicitante_v2_ref_solicito_reunificacion_familiar", rs.getString(141));
				session.setAttribute("temp_solicitante_v2_ref_solicito_permiso_de_salida", rs.getString(142));
				session.setAttribute("temp_solicitante_v2_ref_estatus_lkup", rs.getString(143));
				session.setAttribute("temp_solicitante_v2_ref_ley25_lkup", rs.getString(144));
				session.setAttribute("temp_solicitante_v2_last_mod_tmstmp", rs.getString(145));
				session.setAttribute("temp_solicitante_v2_last_user_id", rs.getString(146));
				session.setAttribute("temp_solicitante_v2_legal_user_id", rs.getString(147));
				session.setAttribute("temp_solicitante_v2_social_user_id", rs.getString(148));
				session.setAttribute("temp_solicitante_v2_fecha_de_renuncia", rs.getString(149));
				session.setAttribute("temp_solicitante_v2_renuncia", rs.getBlob(150));
				session.setAttribute("temp_solicitante_v2_pre_edad", rs.getString(151));
				session.setAttribute("temp_solicitante_v2_pre_fecha_llegada_panama", rs.getString(152));
				session.setAttribute("temp_solicitante_v2_pre_estatus_civil_lkup", rs.getString(153));
				session.setAttribute("temp_solicitante_v2_pre_direccion_pais_de_origen", rs.getString(154));
				session.setAttribute("temp_solicitante_v2_pre_ocup_pais_de_origen", rs.getString(155));
				session.setAttribute("temp_solicitante_v2_pre_lugar_de_trabajo", rs.getString(156));

				session.setAttribute("temp_solicitante_v2_razon_de_quitar_refug_recon", rs.getString(157));
				session.setAttribute("temp_solicitante_v2_fecha_de_quitar_refug_recon", rs.getString(158));
				session.setAttribute("temp_solicitante_v2_quitar_refug_recon", rs.getBlob(159));
				session.setAttribute("temp_solicitante_v2_entrevista_programada", rs.getString(160));
				session.setAttribute("temp_solicitante_v2_fecha_de_resolucion", rs.getString(161));
				session.setAttribute("temp_solicitante_v2_resolucion", rs.getBlob(162));
				
				session.setAttribute("temp_solicitante_v2_fecha_entrevista_social", rs.getString(163));
				session.setAttribute("temp_solicitante_v2_profesion", rs.getString(164));
				session.setAttribute("temp_solicitante_v2_habilidades", rs.getString(165));
				session.setAttribute("temp_solicitante_v2_subsistiendo_en_pa", rs.getString(166));
				session.setAttribute("temp_solicitante_v2_ingreso_en_pa", rs.getString(167));
				session.setAttribute("temp_solicitante_v2_ingreso_en_pais_de_origen", rs.getString(168));
				session.setAttribute("temp_solicitante_v2_condicion_de_vivienda_actual", rs.getString(169));
				session.setAttribute("temp_solicitante_v2_embarazo", rs.getString(170));
				session.setAttribute("temp_solicitante_v2_discapacidad", rs.getString(171));
				session.setAttribute("temp_solicitante_v2_discapacidad_cual", rs.getString(172));
				session.setAttribute("temp_solicitante_v2_enfermedad", rs.getString(173));
				session.setAttribute("temp_solicitante_v2_enfermedad_cual", rs.getString(174));
				session.setAttribute("temp_solicitante_v2_medicamento", rs.getString(175));
				session.setAttribute("temp_solicitante_v2_medicamento_cual", rs.getString(176));
				session.setAttribute("temp_solicitante_v2_alergica_a_medicamento", rs.getString(177));
				session.setAttribute("temp_solicitante_v2_alergica_a_medicamento_cual", rs.getString(178));
				session.setAttribute("temp_solicitante_v2_ha_sido_operado", rs.getString(179));
				session.setAttribute("temp_solicitante_v2_operado_de_que", rs.getString(180));
				session.setAttribute("temp_solicitante_v2_miembro_de_fam_con_discapacidad_o_enfermedad", rs.getString(181));
				session.setAttribute("temp_solicitante_v2_motivo", rs.getString(182));
				session.setAttribute("temp_solicitante_v2_motivo_otro_cual", rs.getString(183));
				session.setAttribute("temp_solicitante_v2_motivo_porque", rs.getString(184));
				session.setAttribute("temp_solicitante_v2_otra_informacion", rs.getString(185));
				session.setAttribute("temp_solicitante_v2_recomendaciones", rs.getString(186));
				session.setAttribute("temp_solicitante_v2_social_user_id2", rs.getString(187));	
				session.setAttribute("temp_solicitante_v2_q27", rs.getString(188));
				session.setAttribute("temp_solicitante_v2_q28", rs.getString(189));
				session.setAttribute("temp_solicitante_v2_q29", rs.getString(190));
				session.setAttribute("temp_solicitante_v2_q30", rs.getString(191));
				session.setAttribute("temp_solicitante_v2_q31", rs.getString(192));	
				session.setAttribute("temp_solicitante_v2_social_otra_pregunta", rs.getString(193));
				session.setAttribute("temp_solicitante_v2_legal_otra_pregunta", rs.getString(194));
				session.setAttribute("temp_solicitante_v2_legal_username", rs.getString(195));
				session.setAttribute("temp_solicitante_v2_social_username", rs.getString(196));
			}

			System.out.println("after the while loop");
			if (size == 0) {
				response.sendRedirect("main.jsp?target=solicitantes&search=norecfound");
			} else {
				response.sendRedirect("main.jsp?target=solicitante_upd_v2");	
			}	
			
		} else {
			response.sendRedirect("/onpar/salir.jsp");
		}
	}
	catch(Exception e){
		// throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>