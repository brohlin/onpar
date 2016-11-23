<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(esf.id, '0'), " +
					"replace(format(esf.solicitante_id,''),',',''), " +
					"ifnull(esf.fecha_entrevista_social,''), " +
					"ifnull(esf.profesion,''), " +
					"ifnull(esf.habilidades,''), " +
					"ifnull(esf.subsistiendo_en_pa,''), " +
					"ifnull(esf.ingreso_en_pa,''), " +
					"ifnull(esf.ingreso_en_pais_de_origen,''), " +
					"ifnull(esf.condicion_de_vivienda_actual,''), " +
					"ifnull(esf.embarazo,''), " +
					"ifnull(esf.discapacidad,''), " +
					"ifnull(esf.discapacidad_cual,''), " +
					"ifnull(esf.enfermedad,''), " +
					"ifnull(esf.enfermedad_cual,''), " +
					"ifnull(esf.medicamento,''), " +
					"ifnull(esf.medicamento_cual,''), " +
					"ifnull(esf.alergica_a_medicamento,''), " +
					"ifnull(esf.alergica_a_medicamento_cual,''), " +
					"ifnull(esf.ha_sido_operado,''), " +
					"ifnull(esf.operado_de_que,''), " +
					"ifnull(esf.miembro_de_fam_con_discapacidad_o_enfermedad,''), " +
					"ifnull(esf.motivo,''), " +
					"ifnull(esf.motivo_otro_cual,''), " +
					"ifnull(esf.motivo_porque,''), " +
					"ifnull(esf.otra_informacion,''), " +
					"ifnull(esf.recomendaciones,''), " +
					"ifnull(esf.social_user_id,''), " +
					"ifnull(esf.last_mod_tmstmp,''), " +
					"ifnull(esf.otra_pregunta,''), " +
					"ifnull(f.nombre,''), " +
					"ifnull(f.parentesco_lkup,''), " +
					"ifnull(dj.pre_primer_nombre,''), " +
					"ifnull(dj.pre_apellido_paterno,''), " +
					"ifnull(dj.pre_apellido_materno,''), " +
					"ifnull(dj.pre_etnico_o_tribu,''), " +
					"ifnull(dj.pre_religion_lkup,''), " +
					"ifnull(dj.pre_nacionalidad_lkup,''), " +		
					"ifnull(dj.pre_pasaporte,''), " +
					"ifnull(dj.pre_otros_documentos,''), " +
					"ifnull(dj.pre_estatus_civil_lkup,''), " +
					"ifnull(dj.pre_telefono1,''), " +		
					"ifnull(dj.pre_direccion_actual,''), " +
					"ifnull(dj.pre_fecha_llegada_panama,''), " +
					"ifnull(dj.pre_fecha_solicitud_onpar,''), " +	
					"ifnull(dj.pre_ocu_empleador,''), " +
					"ifnull(dj.pre_ocu_lugar,''), " +
					"ifnull(dj.pre_ocu_desde,''), " +
					"ifnull(dj.pre_ocu_hasta,''), " +
					"ifnull(dj.pre_ocu_puesto,''), " +	    
					"ifnull(dj.pre_edu_nombre,''), " +
					"ifnull(dj.pre_edu_lugar,''), " +
					"ifnull(dj.pre_edu_desde,''), " +
					"ifnull(dj.pre_edu_hasta,''), " +
					"ifnull(dj.pre_edu_titulo,''), " +	    
					"ifnull(dj.pre_edu_nombre2,''), " +
					"ifnull(dj.pre_edu_lugar2,''), " +
					"ifnull(dj.pre_edu_desde2,''), " +
					"ifnull(dj.pre_edu_hasta2,''), " +
					"ifnull(dj.pre_edu_titulo2,'') " +	
					"from social_familia esf, declaracion_jurada dj, familia f " +
					"where esf.solicitante_id=dj.id " +
					" and esf.id=f.id " +
					" and esf.id=?";
	
	String mId = request.getParameter("id");
	
	session.setAttribute("esf_id", null);
	session.setAttribute("esf_solicitante_id", null);
	session.setAttribute("esf_fecha_entrevista_social", null);
	session.setAttribute("esf_profesion", null);
	session.setAttribute("esf_habilidades", null);
	session.setAttribute("esf_subsistiendo_en_pa", null);
	session.setAttribute("esf_ingreso_en_pa", null);
	session.setAttribute("esf_ingreso_en_pais_de_origen", null);
	session.setAttribute("esf_condicion_de_vivienda_actual", null);
	session.setAttribute("esf_embarazo", null);
	session.setAttribute("esf_discapacidad", null);
	session.setAttribute("esf_discapacidad_cual", null);
	session.setAttribute("esf_enfermedad", null);
	session.setAttribute("esf_enfermedad_cual", null);
	session.setAttribute("esf_medicamento", null);
	session.setAttribute("esf_medicamento_cual", null);
	session.setAttribute("esf_alergica_a_medicamento", null);
	session.setAttribute("esf_alergica_a_medicamento_cual", null);
	session.setAttribute("esf_ha_sido_operado", null);
	session.setAttribute("esf_operado_de_que", null);
	session.setAttribute("esf_miembro_de_fam_con_discapacidad_o_enfermedad", null);
	session.setAttribute("esf_motivo", null);
	session.setAttribute("esf_motivo_otro_cual", null);
	session.setAttribute("esf_motivo_porque", null);
	session.setAttribute("esf_otra_informacion", null);
	session.setAttribute("esf_recomendaciones", null);
	session.setAttribute("esf_social_user_id", null);
	session.setAttribute("esf_last_mod_tmstmp", null);
	session.setAttribute("esf_otra_pregunta", null);
	session.setAttribute("esf_nombre", null);
	session.setAttribute("esf_parentesco_lkup", null);
	session.setAttribute("esf_pre_primer_nombre", null);
	session.setAttribute("esf_pre_apellido_paterno", null);
	session.setAttribute("esf_pre_apellido_materno", null);
	session.setAttribute("esf_pre_etnico_o_tribu", null);
	session.setAttribute("esf_pre_religion_lkup", null);
	session.setAttribute("esf_pre_nacionalidad_lkup", null);		
	session.setAttribute("esf_pre_pasaporte", null);
	session.setAttribute("esf_pre_otros_documentos", null);
	session.setAttribute("esf_pre_estatus_civil_lkup", null);
	session.setAttribute("esf_pre_telefono1", null);
	session.setAttribute("esf_pre_direccion_actual", null);
	session.setAttribute("esf_pre_fecha_llegada_panama", null);
	session.setAttribute("esf_pre_fecha_solicitud_onpar", null);	
	session.setAttribute("esf_pre_ocu_empleador", null);
	session.setAttribute("esf_pre_ocu_lugar", null);
	session.setAttribute("esf_pre_ocu_desde", null);
	session.setAttribute("esf_pre_ocu_hasta", null);
	session.setAttribute("esf_pre_ocu_puesto", null);	    
	session.setAttribute("esf_pre_edu_nombre", null);
	session.setAttribute("esf_pre_edu_lugar", null);
	session.setAttribute("esf_pre_edu_desde", null);
	session.setAttribute("esf_pre_edu_hasta", null);
	session.setAttribute("esf_pre_edu_titulo", null);	    
	session.setAttribute("esf_pre_edu_nombre2", null);
	session.setAttribute("esf_pre_edu_lugar2", null);
	session.setAttribute("esf_pre_edu_desde2", null);
	session.setAttribute("esf_pre_edu_hasta2", null);
	session.setAttribute("esf_pre_edu_titulo2", null);
					
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
				session.setAttribute("esf_id", rs.getString(1));
				session.setAttribute("esf_solicitante_id", rs.getString(2));
				session.setAttribute("esf_fecha_entrevista_social", rs.getString(3));
				session.setAttribute("esf_profesion", rs.getString(4));
				session.setAttribute("esf_habilidades", rs.getString(5));
				session.setAttribute("esf_subsistiendo_en_pa", rs.getString(6));
				session.setAttribute("esf_ingreso_en_pa", rs.getString(7));
				session.setAttribute("esf_ingreso_en_pais_de_origen", rs.getString(8));
				session.setAttribute("esf_condicion_de_vivienda_actual", rs.getString(9));
				session.setAttribute("esf_embarazo", rs.getString(10));
				session.setAttribute("esf_discapacidad", rs.getString(11));
				session.setAttribute("esf_discapacidad_cual", rs.getString(12));
				session.setAttribute("esf_enfermedad", rs.getString(13));
				session.setAttribute("esf_enfermedad_cual", rs.getString(14));
				session.setAttribute("esf_medicamento", rs.getString(15));
				session.setAttribute("esf_medicamento_cual", rs.getString(16));
				session.setAttribute("esf_alergica_a_medicamento", rs.getString(17));
				session.setAttribute("esf_alergica_a_medicamento_cual", rs.getString(18));
				session.setAttribute("esf_ha_sido_operado", rs.getString(19));
				session.setAttribute("esf_operado_de_que", rs.getString(20));
				session.setAttribute("esf_miembro_de_fam_con_discapacidad_o_enfermedad", rs.getString(21));
				session.setAttribute("esf_motivo", rs.getString(22));
				session.setAttribute("esf_motivo_otro_cual", rs.getString(23));
				session.setAttribute("esf_motivo_porque", rs.getString(24));
				session.setAttribute("esf_otra_informacion", rs.getString(25));
				session.setAttribute("esf_recomendaciones", rs.getString(26));
				session.setAttribute("esf_social_user_id", rs.getString(27));
				session.setAttribute("esf_last_mod_tmstmp", rs.getString(28));
				session.setAttribute("esf_otra_pregunta", rs.getString(29));				
				session.setAttribute("esf_nombre", rs.getString(30));
				session.setAttribute("esf_parentesco_lkup", rs.getString(31));
				session.setAttribute("esf_pre_primer_nombre", rs.getString(32));
				session.setAttribute("esf_pre_apellido_paterno", rs.getString(33));
				session.setAttribute("esf_pre_apellido_materno", rs.getString(34));
				session.setAttribute("esf_pre_etnico_o_tribu", rs.getString(35));
				session.setAttribute("esf_pre_religion_lkup", rs.getString(36));
				session.setAttribute("esf_pre_nacionalidad_lkup", rs.getString(37));		
				session.setAttribute("esf_pre_pasaporte", rs.getString(38));
				session.setAttribute("esf_pre_otros_documentos", rs.getString(39));
				session.setAttribute("esf_pre_estatus_civil_lkup", rs.getString(40));
				session.setAttribute("esf_pre_telefono1", rs.getString(41));		
				session.setAttribute("esf_pre_direccion_actual", rs.getString(42));
				session.setAttribute("esf_pre_fecha_llegada_panama", rs.getString(43));
				session.setAttribute("esf_pre_fecha_solicitud_onpar", rs.getString(44));	
				session.setAttribute("esf_pre_ocu_empleador", rs.getString(45));
				session.setAttribute("esf_pre_ocu_lugar", rs.getString(46));
				session.setAttribute("esf_pre_ocu_desde", rs.getString(47));
				session.setAttribute("esf_pre_ocu_hasta", rs.getString(48));
				session.setAttribute("esf_pre_ocu_puesto", rs.getString(49));	    
				session.setAttribute("esf_pre_edu_nombre", rs.getString(50));
				session.setAttribute("esf_pre_edu_lugar", rs.getString(51));
				session.setAttribute("esf_pre_edu_desde", rs.getString(52));
				session.setAttribute("esf_pre_edu_hasta", rs.getString(53));
				session.setAttribute("esf_pre_edu_titulo", rs.getString(54));	    
				session.setAttribute("esf_pre_edu_nombre2", rs.getString(55));
				session.setAttribute("esf_pre_edu_lugar2", rs.getString(56));
				session.setAttribute("esf_pre_edu_desde2", rs.getString(57));
				session.setAttribute("esf_pre_edu_hasta2", rs.getString(58));
				session.setAttribute("esf_pre_edu_titulo2", rs.getString(59));
			}

			if (size == 0) {
				response.sendRedirect("/onpar/salir.jsp");
			}
			
			response.sendRedirect("/onpar/main.jsp?target=entrevista_social_familia");			
			
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