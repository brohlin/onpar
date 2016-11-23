<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%
	int rec = 0;
	DynStringArray params_history = new DynStringArray();
	params_history.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params_history.add("Actualizó registro/declaración jurada de solicitante.");
	params_history.add(session.getAttribute("id").toString());
	params_history.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params_history);
	
%>

<%
	int _num_fam_members = Integer.parseInt(request.getParameter("num_fam_members"));
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
	
	
	
	for (int i=1; i<(_num_fam_members+1); i++) {
		params.clear();
		params.add(_numero_de_caso);
		
		if (i==1) {
			recs = Database.callProc("p_del_familia",params);
		}
		
		_miembro_relacion_ = request.getParameter("miembro_" + Integer.toString(i));
		_miembro_nombre_ = request.getParameter("miembro_nombre_" + Integer.toString(i)); 	
		_miembro_fecha_de_nacimiento_ =  request.getParameter("miembro_fecha_de_nacimiento_" + Integer.toString(i)); 
		
		_miembro_sexo_ =  request.getParameter("miembro_sexo_" + Integer.toString(i));
		_miembro_nacionalidad_ =  request.getParameter("miembro_nacionalidad_" + Integer.toString(i));
		
		_miembro_ocupacion_ = request.getParameter("miembro_ocupacion_" + Integer.toString(i));
		_miembre_lugar_ = request.getParameter("miembro_lugar_" + Integer.toString(i));

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
	
	String mQuery = "update declaracion_jurada set " + 
					"pre_primer_nombre=?, " + 
					"pre_apellido_paterno=?, " + 
					"pre_apellido_materno=?, " + 
					"pre_otros_nombres=?, " + 
					"pre_fecha_de_nacimiento=?, " + 
					"pre_ciudad_de_nacimiento=?, " + 
					"pre_pais_de_nacimiento_lkup=?, " + 
					"pre_genero_lkup=?, " + 
					"pre_nacionalidad_lkup=?, " + 
					"pre_otro_estatus_migratoria=?, " + 
					"pre_otro_estatus_migratoria_paises=?, " + 
					"pre_etnico_o_tribu=?, " + 
					"pre_religion_lkup=?, " + 
					"pre_idioma_lkup=?, " + 
					"pre_otros_idiomas=?, " + 
					"pre_direccion_actual=?, " + 
					"pre_telefono1=?, " + 
					"pre_pasaporte=?, " + 
					"pre_otros_documentos=?, " + 
					"pre_edu_nombre=?, " + 
					"pre_edu_lugar=?, " + 
					"pre_edu_desde=?, " + 
					"pre_edu_hasta=?, " + 
					"pre_edu_titulo=?, " + 
					"pre_edu_nombre2=?, " + 
					"pre_edu_lugar2=?, " + 
					"pre_edu_desde2=?, " + 
					"pre_edu_hasta2=?, " + 
					"pre_edu_titulo2=?, " + 
					"pre_ocu_empleador=?, " + 
					"pre_ocu_lugar=?, " + 
					"pre_ocu_desde=?, " + 
					"pre_ocu_hasta=?, " + 
					"pre_ocu_puesto=?, " + 					
					"pre_fecha_de_salida_origen=?, " +					
					"pre_fundado_temor=?, " + 
					"pre_fundado_temor_partb=?, " + 
					"pre_pref=?, " + 
					"pre_pref_sexo=?, " + 
					"pre_pref_idioma=?, " + 
					"pre_fecha_solicitud_onpar=?, " + 
					"pre_solicitud_preparado_por=?, " + 
					"pre_ui_nombre_recibio=?, " + 
					"pre_ui_fecha_recibido=?, " + 
					"pre_fecha_llegada_panama=?, " +
					"pre_estatus_civil_lkup=?, " +
					"entrevista_programada=?, " +
					"last_mod_tmstmp = now(),  " +
					"last_user_id=? " + 
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
			prest.setString(2,request.getParameter("pre_apellido_paterno"));
			prest.setString(3,request.getParameter("pre_apellido_materno"));
			prest.setString(4,request.getParameter("pre_otros_nombres"));
			prest.setString(5,request.getParameter("pre_fecha_de_nacimiento"));
			prest.setString(6,request.getParameter("pre_ciudad_de_nacimiento"));
			prest.setString(7,request.getParameter("pre_pais_de_nacimiento_lkup"));
			prest.setString(8,request.getParameter("pre_genero_lkup"));
			prest.setString(9,request.getParameter("pre_nacionalidad_lkup"));
			prest.setString(10,request.getParameter("pre_otro_estatus_migratoria"));
			prest.setString(11,request.getParameter("pre_otro_estatus_migratoria_paises"));
			prest.setString(12,request.getParameter("pre_etnico_o_tribu"));
			prest.setString(13,request.getParameter("pre_religion_lkup"));
			prest.setString(14,request.getParameter("pre_idioma_lkup"));
			prest.setString(15,request.getParameter("pre_otros_idiomas"));
			prest.setString(16,request.getParameter("pre_direccion_actual"));
			prest.setString(17,request.getParameter("pre_telefono1"));
			prest.setString(18,request.getParameter("pre_pasaporte"));
			prest.setString(19,request.getParameter("pre_otros_documentos"));
			prest.setString(20,request.getParameter("pre_edu_nombre"));
			prest.setString(21,request.getParameter("pre_edu_lugar"));
			prest.setString(22,request.getParameter("pre_edu_desde"));
			prest.setString(23,request.getParameter("pre_edu_hasta"));
			prest.setString(24,request.getParameter("pre_edu_titulo"));
			prest.setString(25,request.getParameter("pre_edu_nombre2"));
			prest.setString(26,request.getParameter("pre_edu_lugar2"));
			prest.setString(27,request.getParameter("pre_edu_desde2"));
			prest.setString(28,request.getParameter("pre_edu_hasta2"));
			prest.setString(29,request.getParameter("pre_edu_titulo2"));
			prest.setString(30,request.getParameter("pre_ocu_empleador"));
			prest.setString(31,request.getParameter("pre_ocu_lugar"));
			prest.setString(32,request.getParameter("pre_ocu_desde"));
			prest.setString(33,request.getParameter("pre_ocu_hasta"));
			prest.setString(34,request.getParameter("pre_ocu_puesto"));
			prest.setString(35,request.getParameter("pre_fecha_de_salida_origen"));
			prest.setString(36,request.getParameter("pre_fundado_temor"));
			prest.setString(37,request.getParameter("pre_fundado_temor_partb"));
			prest.setString(38,request.getParameter("pre_pref"));
			prest.setString(39,request.getParameter("pre_pref_sexo"));
			prest.setString(40,request.getParameter("pre_pref_idioma"));
			prest.setString(41,request.getParameter("pre_fecha_solicitud_onpar"));
			prest.setString(42,request.getParameter("pre_solicitud_preparado_por"));
			prest.setString(43,request.getParameter("pre_ui_nombre_recibio"));
			prest.setString(44,request.getParameter("pre_ui_fecha_recibido"));
			prest.setString(45,request.getParameter("pre_fecha_llegada_panama"));
			prest.setString(46,request.getParameter("pre_estatus_civil_lkup"));
			prest.setString(47,request.getParameter("entrevista_programada"));
			
			prest.setString(48,session.getAttribute("id").toString());  //user id
			prest.setString(49,request.getParameter("id")); //solicitante id
			
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