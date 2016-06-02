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

<%	
	DynStringArray parameters = new DynStringArray();
	DbResults db = Database.callProcResults("p_get_numero_de_caso", parameters);	
	String mNumero_de_caso;
	int _num_fam_members = Integer.parseInt(request.getParameter("num_fam_members"));
	
	int recs = 0;
	db.moveFirst();
	mNumero_de_caso = db.getValue(0);
	parameters.add(mNumero_de_caso);
	parameters.add(session.getAttribute("id").toString());
	
	
	
	DynStringArray parameters2 = new DynStringArray();
	
	String _miembro_ = "";
	String _miembro_nombre_ = "";
	String _miembro_edad_ = "";
	String _miembro_ocupacion_ = "";
	
	for (int i=1; i<(_num_fam_members+1); i++) {
		parameters2.clear();
		parameters2.add(mNumero_de_caso);
		
		_miembro_ = request.getParameter("miembro_" + Integer.toString(i));
		_miembro_nombre_ = request.getParameter("miembro_nombre_" + Integer.toString(i)); 	
		_miembro_edad_ =  request.getParameter("miembro_edad_" + Integer.toString(i)); 
		_miembro_ocupacion_ = request.getParameter("miembro_ocupacion_" + Integer.toString(i));

		parameters2.add( _miembro_nombre_ );
		parameters2.add( _miembro_edad_ );
		parameters2.add( _miembro_ );
		parameters2.add( "Panam�" );
		parameters2.add(session.getAttribute("id").toString());
		parameters2.add( _miembro_ocupacion_ );
		
		System.out.println(_miembro_nombre_);
		
		if ( _miembro_nombre_ != null ) {
			recs = Database.callProc("p_ins_familia",parameters2);
		}

	}
	
%>

<%
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
					"entrevista_programada) " +
					"values (?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?)";
						
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
		

		int mCount = prest.executeUpdate();

		recs = Database.callProc("p_ins_social",parameters);
		
		recs = Database.callProc("p_ins_entrevista_social",parameters);
		
		recs = Database.callProc("p_ins_entrevista_legal",parameters);
			
		response.sendRedirect("main.jsp?target=solicitantes");			

	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>