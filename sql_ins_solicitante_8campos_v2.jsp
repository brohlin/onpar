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
<%@ page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException" %>


<%
	int rec = 0;
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("Insertó nuevo solicitante.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
	
%>
<%	
	String p_pre_primer_nombre = request.getParameter("pre_primer_nombre");
	String p_pre_apellido_paterno = request.getParameter("pre_apellido_paterno");
	String p_pre_apellido_materno = request.getParameter("pre_apellido_materno");
	String p_pre_fecha_de_nacimiento = request.getParameter("pre_fecha_de_nacimiento");
	String p_pre_genero_lkup = request.getParameter("pre_genero_lkup");
	String p_pre_nacionalidad_lkup = request.getParameter("pre_nacionalidad_lkup");
	String p_pre_fecha_solicitud_onpar = request.getParameter("pre_fecha_solicitud_onpar");
	
	String p_pre_fecha_llegada_panama = request.getParameter("pre_fecha_llegada_panama");			
	String p_pre_estatus_civil_lkup = request.getParameter("pre_estatus_civil_lkup");			
	String p_pre_estatus_lkup = request.getParameter("pre_estatus_lkup");
	String p_entrevista_programada = request.getParameter("entrevista_programada");
	String p_pre_telefono1 = request.getParameter("pre_telefono1");
	String p_pre_direccion_actual = request.getParameter("pre_direccion_actual");
	
	String p_pre_ciudad_de_nacimiento = request.getParameter("pre_ciudad_de_nacimiento");
	String p_pre_pais_de_nacimiento_lkup = request.getParameter("pre_pais_de_nacimiento_lkup");
	String p_pre_otro_estatus_migratoria = request.getParameter("pre_otro_estatus_migratoria");
	String p_pre_otro_estatus_migratoria_paises = request.getParameter("pre_otro_estatus_migratoria_paises");
	String p_pre_pasaporte = request.getParameter("pre_pasaporte");
	String p_pre_otros_documentos = request.getParameter("pre_otros_documentos");


	DynStringArray parameters = new DynStringArray();
	
	parameters.add(p_pre_primer_nombre);
	parameters.add(p_pre_apellido_paterno);
	parameters.add(p_pre_fecha_de_nacimiento);
	parameters.add(p_pre_genero_lkup);
	parameters.add(p_pre_nacionalidad_lkup);
	DbResults db_applicant_exists_check = Database.callProcResults("p_get_solicitante_id", parameters);	
	
	parameters.clear();
	DbResults db = Database.callProcResults("p_get_numero_de_caso", parameters);	
	String mNumero_de_caso;
	int _num_fam_members = Integer.parseInt(request.getParameter("num_fam_members"));
	
	int recs = 0;
	db.moveFirst();
	mNumero_de_caso = db.getValue(0);
	parameters.add(mNumero_de_caso);
	
	
	
	if (db_applicant_exists_check.hasRows()) {
		String _solicitante_id = db_applicant_exists_check.getRow(0).get(0);
		
		System.out.println("/onpar/sql_get_solicitante_v2.jsp?id=" + _solicitante_id);
		response.sendRedirect("/onpar/sql_get_solicitante_v2.jsp?id=" + _solicitante_id);
		return;
	}
	
	parameters.add(session.getAttribute("id").toString());
	
	
	
	DynStringArray parameters2 = new DynStringArray();
	
	String _miembro_ = "";
	String _miembro_nombre_ = "";
	String _miembro_fecha_de_nacimiento_ = "";
	String _miembro_sexo_ = "";
	String _miembro_nacionalidad_ = "";
	String _miembro_ocupacion_ = "";
	
	
	
	for (int i=1; i<(_num_fam_members+1); i++) {
		parameters2.clear();
		parameters2.add(mNumero_de_caso);
		
		_miembro_ = request.getParameter("miembro_" + Integer.toString(i));
		_miembro_nombre_ = request.getParameter("miembro_nombre_" + Integer.toString(i)); 	
		_miembro_fecha_de_nacimiento_ =  request.getParameter("miembro_fecha_de_nacimiento_" + Integer.toString(i));
		_miembro_sexo_ =  request.getParameter("miembro_sexo_" + Integer.toString(i)); 
		_miembro_nacionalidad_ =  request.getParameter("miembro_nacionalidad_" + Integer.toString(i)); 
		_miembro_ocupacion_ = request.getParameter("miembro_ocupacion_" + Integer.toString(i));

		parameters2.add( _miembro_nombre_ );
		parameters2.add( _miembro_fecha_de_nacimiento_ );
		parameters2.add( _miembro_ );
		parameters2.add( "Panamá" );
		parameters2.add(session.getAttribute("id").toString());
		parameters2.add( _miembro_ocupacion_ );
		parameters2.add( _miembro_sexo_ );
		parameters2.add( _miembro_nacionalidad_ );
		
		
		System.out.println(_miembro_nombre_);
		
		if ( _miembro_nombre_ != null ) {
			recs = Database.callProc("p_ins_familia",parameters2);
		}

	}
	

	String mQuery = "insert into declaracion_jurada (" + 
					"pre_primer_nombre," + 
					"pre_apellido_paterno," + 
					"pre_apellido_materno," + 
					"pre_fecha_de_nacimiento," + 
					"pre_genero_lkup," + 
					"pre_nacionalidad_lkup," + 
					"pre_fecha_solicitud_onpar," + 					
					"last_user_id," +
					"id, " +					
					"pre_fecha_llegada_panama, " +
					"pre_estatus_civil_lkup, " +
					"last_mod_tmstmp, " +
					"pre_estatus_lkup, " +  
					"adm_estatus_lkup, " +
					"entrevista_programada, " +
					"pre_telefono1, " +
					"pre_direccion_actual, " +
					"pre_ciudad_de_nacimiento, " +
					"pre_pais_de_nacimiento_lkup, " +
					"pre_otro_estatus_migratoria, " +
					"pre_otro_estatus_migratoria_paises, " +
					"pre_pasaporte, " +
					"pre_otros_documentos) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?)";
						

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
		prest.setString(2,p_pre_apellido_paterno);
		prest.setString(3,p_pre_apellido_materno);
		prest.setString(4,p_pre_fecha_de_nacimiento);
		prest.setString(5,p_pre_genero_lkup);
		prest.setString(6,p_pre_nacionalidad_lkup);
		prest.setString(7,p_pre_fecha_solicitud_onpar);
		
		prest.setInt(8,p_last_user_id);
		prest.setString(9,mNumero_de_caso);
		
		prest.setString(10,p_pre_fecha_llegada_panama);
		prest.setString(11,p_pre_estatus_civil_lkup);
		prest.setString(12,p_pre_estatus_lkup);
		prest.setString(13,p_pre_estatus_lkup);
		prest.setString(14,p_entrevista_programada);
		prest.setString(15,p_pre_telefono1);
		prest.setString(16,p_pre_direccion_actual);
		
		prest.setString(17,p_pre_ciudad_de_nacimiento);
		prest.setString(18,p_pre_pais_de_nacimiento_lkup);
		prest.setString(19,p_pre_otro_estatus_migratoria);
		prest.setString(20,p_pre_otro_estatus_migratoria_paises);
		prest.setString(21,p_pre_pasaporte);
		prest.setString(22,p_pre_otros_documentos);
		
		int mCount = prest.executeUpdate();

		recs = Database.callProc("p_ins_social",parameters);
		
		recs = Database.callProc("p_ins_entrevista_social",parameters);
		
		recs = Database.callProc("p_ins_entrevista_legal",parameters);
			
		response.sendRedirect("main.jsp?target=solicitantes");			

	} catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>