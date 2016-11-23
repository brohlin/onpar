<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%
	int rec2 = 0;
	DynStringArray params_history2 = new DynStringArray();
	params_history2.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params_history2.add("Actualizó entrevista social de solicitante.");
	params_history2.add(session.getAttribute("id").toString());
	params_history2.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec2 = Database.callProc("p_ins_history", params_history2);
	
%>

<%

	int _num_fam_members = Integer.parseInt(request.getParameter("num_fam_members_social"));
	int recs = 0;
	DynStringArray params = new DynStringArray();
	
	String _miembro_relacion_ = "";
	String _miembro_nombre_ = "";
	String _miembro_fecha_de_nacimiento_ = "";
	String _miembro_sexo_ = "";
	String _miembro_nacionalidad_ = "";
	String _miembro_ocupacion_ = "";
	String _miembre_lugar_ = "";
	String _numero_de_caso = session.getAttribute("temp_solicitante_v2_id").toString();
	
	
	
	for (int j=1; j<(_num_fam_members+1); j++) {
		params.clear();
		params.add(_numero_de_caso);
		
		if (j==1) {
			recs = Database.callProc("p_del_familia",params);
		}
		
		_miembro_relacion_ = request.getParameter("miembro_" + Integer.toString(j));
		_miembro_nombre_ = request.getParameter("miembro_nombre_" + Integer.toString(j)); 	
		_miembro_fecha_de_nacimiento_ =  request.getParameter("miembro_fecha_de_nacimiento_" + Integer.toString(j)); 
		
		_miembro_sexo_ =  request.getParameter("miembro_sexo_" + Integer.toString(j));
		_miembro_nacionalidad_ =  request.getParameter("miembro_nacionalidad_" + Integer.toString(j));
		
		_miembro_ocupacion_ = request.getParameter("miembro_ocupacion_" + Integer.toString(j));
		_miembre_lugar_ = request.getParameter("miembro_lugar_" + Integer.toString(j));
	
		params.add( _miembro_nombre_ );
		params.add( _miembro_fecha_de_nacimiento_ );
		params.add( _miembro_relacion_ );
		params.add( _miembre_lugar_ );
		params.add(session.getAttribute("id").toString());
		params.add( _miembro_ocupacion_ );
		params.add( _miembro_sexo_ );
		params.add( _miembro_nacionalidad_ );
		
		System.out.println(_miembro_nombre_);
		
		if ( _miembro_nombre_ != null ) {
			recs = Database.callProc("p_ins_familia",params);
		}
	
	}



	DynStringArray parameters = new DynStringArray();
	int i = 0;
	parameters.add(session.getAttribute("id").toString());
	parameters.add(request.getParameter("id").toString());


	String mQuery = "update social set " + 
					"profesion = ? , " +
					"social_user_id = ? , " +  
					"fecha_entrevista_social = ? , " +  
					"last_mod_tmstmp = now() ,  " + 
					"habilidades = ? , " +
					"subsistiendo_en_pa = ? , " +
					"ingreso_en_pa = ? , " +
					"ingreso_en_pais_de_origen = ? , " +
					"condicion_de_vivienda_actual = ? , " +
					"embarazo = ? , " +
					"discapacidad = ? , " +
					"discapacidad_cual = ? , " +
					"enfermedad = ? , " +
					"enfermedad_cual = ? , " +
					"medicamento = ? , " +
					"medicamento_cual = ? , " +
					"alergica_a_medicamento = ? , " +
					"alergica_a_medicamento_cual = ? , " +
					"ha_sido_operado = ? , " +
					"operado_de_que = ? , " +
					"miembro_de_fam_con_discapacidad_o_enfermedad = ? , " +
					"motivo = ? , " +
					"motivo_otro_cual = ? , " +
					"motivo_porque = ? , " +
					"otra_informacion = ? , " +
					"otra_pregunta = ? , " +
					"last_mod_tmstmp = now(), " + 
					"recomendaciones = ? " +					
					  "where id = ?";

	String mQuery2 = "update declaracion_jurada " +
					" set pre_edu_nombre = ? , " +
					" pre_edu_lugar  = ? , " +
					" pre_edu_desde  = ? , " +
					" pre_edu_hasta  = ? , " +
					" pre_edu_titulo = ? , " +	    
					" pre_edu_nombre2 = ? , " +
					" pre_edu_lugar2 = ? , " +
					" pre_edu_desde2 = ? , " +
					" pre_edu_hasta2 = ? , " +
					" pre_edu_titulo2 = ? , " +
					" last_mod_tmstmp = now(), " +
					" last_user_id = ?, " +
					" pre_etnico_o_tribu = ?, " +
					" pre_religion_lkup = ?, " +
					" pre_ocu_empleador = ?, " +
					" pre_ocu_lugar = ?, " +
					" pre_ocu_desde = ?, " +
					" pre_ocu_hasta = ?, " +
					" pre_ocu_puesto = ? " +
					" where id = ? ";
	
	
	Connection con = null;
	PreparedStatement prest = null;
	PreparedStatement prest2 = null;
	

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
			prest.setString(1,request.getParameter("profesion"));
			prest.setString(2,request.getParameter("social_user_id"));
			prest.setString(3,request.getParameter("fecha_entrevista_social"));
			prest.setString(4,request.getParameter("habilidades"));
			prest.setString(5,request.getParameter("subsistiendo_en_pa"));
			prest.setString(6,request.getParameter("ingreso_en_pa"));
			prest.setString(7,request.getParameter("ingreso_en_pais_de_origen"));
			prest.setString(8,request.getParameter("condicion_de_vivienda_actual"));
			prest.setString(9,request.getParameter("embarazo"));
			prest.setString(10,request.getParameter("discapacidad"));
			prest.setString(11,request.getParameter("discapacidad_cual"));
			prest.setString(12,request.getParameter("enfermedad"));
			prest.setString(13,request.getParameter("enfermedad_cual"));
			prest.setString(14,request.getParameter("medicamento"));
			prest.setString(15,request.getParameter("medicamento_cual"));
			prest.setString(16,request.getParameter("alergica_a_medicamento"));
			prest.setString(17,request.getParameter("alergica_a_medicamento_cual"));
			prest.setString(18,request.getParameter("ha_sido_operado"));
			prest.setString(19,request.getParameter("operado_de_que"));
			prest.setString(20,request.getParameter("miembro_de_fam_con_discapacidad_o_enfermedad"));
			prest.setString(21,request.getParameter("motivo"));
			prest.setString(22,request.getParameter("motivo_otro_cual"));
			prest.setString(23,request.getParameter("motivo_porque"));
			prest.setString(24,request.getParameter("otra_informacion"));
			prest.setString(25,request.getParameter("social_otra_pregunta"));
			prest.setString(26,request.getParameter("recomendaciones"));					
			prest.setString(27,request.getParameter("id").toString());
			
			i = Database.callProc("p_upd_dj_es_ok", parameters);
			
			int mCount = prest.executeUpdate();
			
			prest2=con.prepareStatement(mQuery2);
			prest2.setString(1,request.getParameter("pre_edu_nombre"));
			prest2.setString(2,request.getParameter("pre_edu_lugar"));
			prest2.setString(3,request.getParameter("pre_edu_desde"));
			prest2.setString(4,request.getParameter("pre_edu_hasta"));
			prest2.setString(5,request.getParameter("pre_edu_titulo"));
			prest2.setString(6,request.getParameter("pre_edu_nombre2"));
			prest2.setString(7,request.getParameter("pre_edu_lugar2"));
			prest2.setString(8,request.getParameter("pre_edu_desde2"));
			prest2.setString(9,request.getParameter("pre_edu_hasta2"));
			prest2.setString(10,request.getParameter("pre_edu_titulo2"));
			prest2.setString(11,session.getAttribute("id").toString());
			prest2.setString(12,request.getParameter("pre_etnico_o_tribu"));
			prest2.setString(13,request.getParameter("pre_religion_lkup"));
			prest2.setString(14,request.getParameter("pre_ocu_empleador"));
			prest2.setString(15,request.getParameter("pre_ocu_lugar"));
			prest2.setString(16,request.getParameter("pre_ocu_desde"));
			prest2.setString(17,request.getParameter("pre_ocu_hasta"));
			prest2.setString(18,request.getParameter("pre_ocu_puesto"));
			prest2.setString(19,request.getParameter("id").toString());
			
			int mCount2 = prest2.executeUpdate();
			
			response.sendRedirect("/onpar/main.jsp?target=solicitantes");			
		} 
	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(prest2 != null) { prest2.close(); }
		if(con != null) { con.close(); }
	}
%>