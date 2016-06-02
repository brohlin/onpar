<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="javax.sql.*" %>

<%

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
					"recomendaciones = ? " +					
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
			prest.setString(1,request.getParameter("profesion"));
			prest.setString(2,session.getAttribute("id").toString());
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