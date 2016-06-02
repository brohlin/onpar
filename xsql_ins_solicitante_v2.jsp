<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<%	
	DynStringArray parameters = new DynStringArray();
	DbResults db = Database.callProcResults("p_get_numero_de_caso", parameters);	
	String mNumero_de_caso;
	int recs = 0;
	db.moveFirst();
	mNumero_de_caso = db.getValue(0);
	parameters.add(mNumero_de_caso);
	parameters.add(session.getAttribute("id").toString());
%>

<%
	String mQuery = "insert into declaracion_jurada (" + 
					"pre_primer_nombre," + 
					"pre_apellido_paterno," + 
					"pre_apellido_materno," + 
					"pre_otros_nombres," + 
					"pre_fecha_de_nacimiento," + 
					"pre_ciudad_de_nacimiento," + 
					"pre_pais_de_nacimiento_lkup," + 
					"pre_genero_lkup," + 
					"pre_nacionalidad_lkup," + 
					"pre_otro_estatus_migratoria," + 
					"pre_otro_estatus_migratoria_paises," + 
					"pre_etnico_o_tribu," + 
					"pre_religion_lkup," + 
					"pre_idioma_lkup," + 
					"pre_otros_idiomas," + 
					"pre_direccion_actual," + 
					"pre_telefono1," + 
					"pre_pasaporte," + 
					"pre_otros_documentos," + 
					"pre_edu_nombre," + 
					"pre_edu_lugar," + 
					"pre_edu_desde," + 
					"pre_edu_hasta," + 
					"pre_edu_titulo," + 
					"pre_edu_nombre2," + 
					"pre_edu_lugar2," + 
					"pre_edu_desde2," + 
					"pre_edu_hasta2," + 
					"pre_edu_titulo2," + 
					"pre_ocu_empleador," + 
					"pre_ocu_lugar," + 
					"pre_ocu_desde," + 
					"pre_ocu_hasta," + 
					"pre_ocu_puesto," + 
					"pre_mil_nombre," + 
					"pre_mil_lugar," + 
					"pre_mil_desde," + 
					"pre_mil_hasta," + 
					"pre_mil_puesto," + 
					"pre_org_nombre," + 
					"pre_org_lugar," + 
					"pre_org_desde," + 
					"pre_org_hasta," + 
					"pre_org_rol," + 
					"pre_org_nombre2," + 
					"pre_org_lugar2," + 
					"pre_org_desde2," + 
					"pre_org_hasta2," + 
					"pre_org_rol2," + 
					"pre_arrest_confirm," +
					"pre_arrest_fecha," + 
					"pre_arrest_lugar," + 
					"pre_arrest_delito," + 
					"pre_arrest_sentencia," + 
					"pre_arrest_fecha2," + 
					"pre_arrest_lugar2," + 
					"pre_arrest_delito2," + 
					"pre_arrest_sentencia2," + 
					"pre_fam_madre_nombre," + 
					"pre_fam_madre_dob," + 
					"pre_fam_madre_lugar," + 
					"pre_fam_padre_nombre," + 
					"pre_fam_padre_dob," + 
					"pre_fam_padre_lugar," + 
					"pre_fam_spouse_nombre," + 
					"pre_fam_spouse_dob," + 
					"pre_fam_spouse_lugar," + 
					"pre_fam_child1_nombre," + 
					"pre_fam_child1_dob," + 
					"pre_fam_child1_lugar," + 
					"pre_fam_child2_nombre," + 
					"pre_fam_child2_dob," + 
					"pre_fam_child2_lugar," + 
					"pre_fam_child3_nombre," + 
					"pre_fam_child3_dob," + 
					"pre_fam_child3_lugar," + 
					"pre_fam_child4_nombre," + 
					"pre_fam_child4_dob," + 
					"pre_fam_child4_lugar," + 
					"pre_fam_child5_nombre," + 
					"pre_fam_child5_dob," + 
					"pre_fam_child5_lugar," + 
					"pre_fam_sibling1_nombre," + 
					"pre_fam_sibling1_dob," + 
					"pre_fam_sibling1_lugar," + 
					"pre_fam_sibling2_nombre," + 
					"pre_fam_sibling2_dob," + 
					"pre_fam_sibling2_lugar," + 
					"pre_fam_sibling3_nombre," + 
					"pre_fam_sibling3_dob," + 
					"pre_fam_sibling3_lugar," + 
					"pre_fam_sibling4_nombre," + 
					"pre_fam_sibling4_dob," + 
					"pre_fam_sibling4_lugar," + 
					"pre_fam_sibling5_nombre," + 
					"pre_fam_sibling5_dob," + 
					"pre_fam_sibling5_lugar," + 
					"pre_fam_otra1_relacion," + 
					"pre_fam_otra1_nombre," + 
					"pre_fam_otra1_dob," + 
					"pre_fam_otra1_lugar," + 
					"pre_fam_otra2_relacion," + 
					"pre_fam_otra2_nombre," + 
					"pre_fam_otra2_dob," + 
					"pre_fam_otra2_lugar," + 
					"pre_fam_otra3_relacion," + 
					"pre_fam_otra3_nombre," + 
					"pre_fam_otra3_dob," + 
					"pre_fam_otra3_lugar," + 
					"pre_fecha_de_salida_origen," +
					"pre_viaje1_pais," + 
					"pre_viaje1_desde," + 
					"pre_viaje1_hasta," + 
					"pre_viaje1_medio," + 
					"pre_viaje2_pais," + 
					"pre_viaje2_desde," + 
					"pre_viaje2_hasta," + 
					"pre_viaje2_medio," + 
					"pre_viaje3_pais," + 
					"pre_viaje3_desde," + 
					"pre_viaje3_hasta," + 
					"pre_viaje3_medio," + 
					"pre_viaje4_pais," + 
					"pre_viaje4_desde," + 
					"pre_viaje4_hasta," + 
					"pre_viaje4_medio," + 
					"pre_viaje5_pais," + 
					"pre_viaje5_desde," + 
					"pre_viaje5_hasta," + 
					"pre_viaje5_medio," + 
					"pre_viaje6_pais," + 
					"pre_viaje6_desde," + 
					"pre_viaje6_hasta," + 
					"pre_viaje6_medio," + 
					"pre_pref," + 
					"pre_pref_sexo," + 
					"pre_pref_idioma," + 
					"pre_fecha_solicitud_onpar," + 
					"pre_solicitud_preparado_por," + 
					"pre_ui_nombre_recibio," + 
					"pre_ui_fecha_recibido," +
					"last_user_id," +
					"id, " +
					"pre_fundado_temor, " +
					"pre_fundado_temor_partb, " +
					"pre_fecha_llegada_panama, " +
					"pre_estatus_civil_lkup, " +
					"last_mod_tmstmp, " +
					"pre_estatus_lkup, " +
					"adm_estatus_lkup ) " + 
					"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),'Solicitud incompleta','Solicitud incompleta')";
						
	String p_pre_primer_nombre = request.getParameter("pre_primer_nombre");
	String p_pre_apellido_paterno = request.getParameter("pre_apellido_paterno");
	String p_pre_apellido_materno = request.getParameter("pre_apellido_materno");
	String p_pre_otros_nombres = request.getParameter("pre_otros_nombres");
	String p_pre_fecha_de_nacimiento = request.getParameter("pre_fecha_de_nacimiento");
	String p_pre_ciudad_de_nacimiento = request.getParameter("pre_ciudad_de_nacimiento");
	String p_pre_pais_de_nacimiento_lkup = request.getParameter("pre_pais_de_nacimiento_lkup");
	String p_pre_genero_lkup = request.getParameter("pre_genero_lkup");
	String p_pre_nacionalidad_lkup = request.getParameter("pre_nacionalidad_lkup");
	String p_pre_otro_estatus_migratoria = request.getParameter("pre_otro_estatus_migratoria");
	String p_pre_otro_estatus_migratoria_paises = request.getParameter("pre_otro_estatus_migratoria_paises");
	String p_pre_etnico_o_tribu = request.getParameter("pre_etnico_o_tribu");
	String p_pre_religion_lkup = request.getParameter("pre_religion_lkup");
	String p_pre_idioma_lkup = request.getParameter("pre_idioma_lkup");
	String p_pre_otros_idiomas = request.getParameter("pre_otros_idiomas");
	String p_pre_direccion_actual = request.getParameter("pre_direccion_actual");
	String p_pre_telefono1 = request.getParameter("pre_telefono1");
	String p_pre_pasaporte = request.getParameter("pre_pasaporte");
	String p_pre_otros_documentos = request.getParameter("pre_otros_documentos");
	String p_pre_edu_nombre = request.getParameter("pre_edu_nombre");
	String p_pre_edu_lugar = request.getParameter("pre_edu_lugar");
	String p_pre_edu_desde = request.getParameter("pre_edu_desde");
	String p_pre_edu_hasta = request.getParameter("pre_edu_hasta");
	String p_pre_edu_titulo = request.getParameter("pre_edu_titulo");
	String p_pre_edu_nombre2 = request.getParameter("pre_edu_nombre2");
	String p_pre_edu_lugar2 = request.getParameter("pre_edu_lugar2");
	String p_pre_edu_desde2 = request.getParameter("pre_edu_desde2");
	String p_pre_edu_hasta2 = request.getParameter("pre_edu_hasta2");
	String p_pre_edu_titulo2 = request.getParameter("pre_edu_titulo2");
	String p_pre_ocu_empleador = request.getParameter("pre_ocu_empleador");
	String p_pre_ocu_lugar = request.getParameter("pre_ocu_lugar");
	String p_pre_ocu_desde = request.getParameter("pre_ocu_desde");
	String p_pre_ocu_hasta = request.getParameter("pre_ocu_hasta");
	String p_pre_ocu_puesto = request.getParameter("pre_ocu_puesto");
	String p_pre_mil_nombre = request.getParameter("pre_mil_nombre");
	String p_pre_mil_lugar = request.getParameter("pre_mil_lugar");
	String p_pre_mil_desde = request.getParameter("pre_mil_desde");
	String p_pre_mil_hasta = request.getParameter("pre_mil_hasta");
	String p_pre_mil_puesto = request.getParameter("pre_mil_puesto");
	String p_pre_org_nombre = request.getParameter("pre_org_nombre");
	String p_pre_org_lugar = request.getParameter("pre_org_lugar");
	String p_pre_org_desde = request.getParameter("pre_org_desde");
	String p_pre_org_hasta = request.getParameter("pre_org_hasta");
	String p_pre_org_rol = request.getParameter("pre_org_rol");
	String p_pre_org_nombre2 = request.getParameter("pre_org_nombre2");
	String p_pre_org_lugar2 = request.getParameter("pre_org_lugar2");
	String p_pre_org_desde2 = request.getParameter("pre_org_desde2");
	String p_pre_org_hasta2 = request.getParameter("pre_org_hasta2");
	String p_pre_org_rol2 = request.getParameter("pre_org_rol2");
	String p_pre_arrest_confirm = request.getParameter("pre_arrest_confirm");
	String p_pre_arrest_fecha = request.getParameter("pre_arrest_fecha");
	String p_pre_arrest_lugar = request.getParameter("pre_arrest_lugar");
	String p_pre_arrest_delito = request.getParameter("pre_arrest_delito");
	String p_pre_arrest_sentencia = request.getParameter("pre_arrest_sentencia");
	String p_pre_arrest_fecha2 = request.getParameter("pre_arrest_fecha2");
	String p_pre_arrest_lugar2 = request.getParameter("pre_arrest_lugar2");
	String p_pre_arrest_delito2 = request.getParameter("pre_arrest_delito2");
	String p_pre_arrest_sentencia2 = request.getParameter("pre_arrest_sentencia2");
	String p_pre_fam_madre_nombre = request.getParameter("pre_fam_madre_nombre");
	String p_pre_fam_madre_dob = request.getParameter("pre_fam_madre_dob");
	String p_pre_fam_madre_lugar = request.getParameter("pre_fam_madre_lugar");
	String p_pre_fam_padre_nombre = request.getParameter("pre_fam_padre_nombre");
	String p_pre_fam_padre_dob = request.getParameter("pre_fam_padre_dob");
	String p_pre_fam_padre_lugar = request.getParameter("pre_fam_padre_lugar");
	String p_pre_fam_spouse_nombre = request.getParameter("pre_fam_spouse_nombre");
	String p_pre_fam_spouse_dob = request.getParameter("pre_fam_spouse_dob");
	String p_pre_fam_spouse_lugar = request.getParameter("pre_fam_spouse_lugar");
	String p_pre_fam_child1_nombre = request.getParameter("pre_fam_child1_nombre");
	String p_pre_fam_child1_dob = request.getParameter("pre_fam_child1_dob");
	String p_pre_fam_child1_lugar = request.getParameter("pre_fam_child1_lugar");
	String p_pre_fam_child2_nombre = request.getParameter("pre_fam_child2_nombre");
	String p_pre_fam_child2_dob = request.getParameter("pre_fam_child2_dob");
	String p_pre_fam_child2_lugar = request.getParameter("pre_fam_child2_lugar");
	String p_pre_fam_child3_nombre = request.getParameter("pre_fam_child3_nombre");
	String p_pre_fam_child3_dob = request.getParameter("pre_fam_child3_dob");
	String p_pre_fam_child3_lugar = request.getParameter("pre_fam_child3_lugar");
	String p_pre_fam_child4_nombre = request.getParameter("pre_fam_child4_nombre");
	String p_pre_fam_child4_dob = request.getParameter("pre_fam_child4_dob");
	String p_pre_fam_child4_lugar = request.getParameter("pre_fam_child4_lugar");
	String p_pre_fam_child5_nombre = request.getParameter("pre_fam_child5_nombre");
	String p_pre_fam_child5_dob = request.getParameter("pre_fam_child5_dob");
	String p_pre_fam_child5_lugar = request.getParameter("pre_fam_child5_lugar");
	String p_pre_fam_sibling1_nombre = request.getParameter("pre_fam_sibling1_nombre");
	String p_pre_fam_sibling1_dob = request.getParameter("pre_fam_sibling1_dob");
	String p_pre_fam_sibling1_lugar = request.getParameter("pre_fam_sibling1_lugar");
	String p_pre_fam_sibling2_nombre = request.getParameter("pre_fam_sibling2_nombre");
	String p_pre_fam_sibling2_dob = request.getParameter("pre_fam_sibling2_dob");
	String p_pre_fam_sibling2_lugar = request.getParameter("pre_fam_sibling2_lugar");
	String p_pre_fam_sibling3_nombre = request.getParameter("pre_fam_sibling3_nombre");
	String p_pre_fam_sibling3_dob = request.getParameter("pre_fam_sibling3_dob");
	String p_pre_fam_sibling3_lugar = request.getParameter("pre_fam_sibling3_lugar");
	String p_pre_fam_sibling4_nombre = request.getParameter("pre_fam_sibling4_nombre");
	String p_pre_fam_sibling4_dob = request.getParameter("pre_fam_sibling4_dob");
	String p_pre_fam_sibling4_lugar = request.getParameter("pre_fam_sibling4_lugar");
	String p_pre_fam_sibling5_nombre = request.getParameter("pre_fam_sibling5_nombre");
	String p_pre_fam_sibling5_dob = request.getParameter("pre_fam_sibling5_dob");
	String p_pre_fam_sibling5_lugar = request.getParameter("pre_fam_sibling5_lugar");
	String p_pre_fam_otra1_relacion = request.getParameter("pre_fam_otra1_relacion");
	String p_pre_fam_otra1_nombre = request.getParameter("pre_fam_otra1_nombre");
	String p_pre_fam_otra1_dob = request.getParameter("pre_fam_otra1_dob");
	String p_pre_fam_otra1_lugar = request.getParameter("pre_fam_otra1_lugar");
	String p_pre_fam_otra2_relacion = request.getParameter("pre_fam_otra2_relacion");
	String p_pre_fam_otra2_nombre = request.getParameter("pre_fam_otra2_nombre");
	String p_pre_fam_otra2_dob = request.getParameter("pre_fam_otra2_dob");
	String p_pre_fam_otra2_lugar = request.getParameter("pre_fam_otra2_lugar");
	String p_pre_fam_otra3_relacion = request.getParameter("pre_fam_otra3_relacion");
	String p_pre_fam_otra3_nombre = request.getParameter("pre_fam_otra3_nombre");
	String p_pre_fam_otra3_dob = request.getParameter("pre_fam_otra3_dob");
	String p_pre_fam_otra3_lugar = request.getParameter("pre_fam_otra3_lugar");
	
	String p_pre_fecha_de_salida_origen = request.getParameter("pre_fecha_de_salida_origen");
	
	String p_pre_viaje1_pais = request.getParameter("pre_viaje1_pais");
	String p_pre_viaje1_desde = request.getParameter("pre_viaje1_desde");
	String p_pre_viaje1_hasta = request.getParameter("pre_viaje1_hasta");
	String p_pre_viaje1_medio = request.getParameter("pre_viaje1_medio");
	String p_pre_viaje2_pais = request.getParameter("pre_viaje2_pais");
	String p_pre_viaje2_desde = request.getParameter("pre_viaje2_desde");
	String p_pre_viaje2_hasta = request.getParameter("pre_viaje2_hasta");
	String p_pre_viaje2_medio = request.getParameter("pre_viaje2_medio");
	String p_pre_viaje3_pais = request.getParameter("pre_viaje3_pais");
	String p_pre_viaje3_desde = request.getParameter("pre_viaje3_desde");
	String p_pre_viaje3_hasta = request.getParameter("pre_viaje3_hasta");
	String p_pre_viaje3_medio = request.getParameter("pre_viaje3_medio");
	String p_pre_viaje4_pais = request.getParameter("pre_viaje4_pais");
	String p_pre_viaje4_desde = request.getParameter("pre_viaje4_desde");
	String p_pre_viaje4_hasta = request.getParameter("pre_viaje4_hasta");
	String p_pre_viaje4_medio = request.getParameter("pre_viaje4_medio");
	String p_pre_viaje5_pais = request.getParameter("pre_viaje5_pais");
	String p_pre_viaje5_desde = request.getParameter("pre_viaje5_desde");
	String p_pre_viaje5_hasta = request.getParameter("pre_viaje5_hasta");
	String p_pre_viaje5_medio = request.getParameter("pre_viaje5_medio");
	String p_pre_viaje6_pais = request.getParameter("pre_viaje6_pais");
	String p_pre_viaje6_desde = request.getParameter("pre_viaje6_desde");
	String p_pre_viaje6_hasta = request.getParameter("pre_viaje6_hasta");
	String p_pre_viaje6_medio = request.getParameter("pre_viaje6_medio");
	String p_pre_pref = request.getParameter("pre_pref");
	String p_pre_pref_sexo = request.getParameter("pre_pref_sexo");
	String p_pre_pref_idioma = request.getParameter("pre_pref_idioma");
	String p_pre_fecha_solicitud_onpar = request.getParameter("pre_fecha_solicitud_onpar");
	String p_pre_solicitud_preparado_por = request.getParameter("pre_solicitud_preparado_por");
	String p_pre_ui_nombre_recibio = request.getParameter("pre_ui_nombre_recibio");
	String p_pre_ui_fecha_recibido = request.getParameter("pre_ui_fecha_recibido");
	
	String p_pre_fundado_temor = request.getParameter("pre_fundado_temor");
	String p_pre_fundado_temor_partb = request.getParameter("pre_fundado_temor_partb");
	String p_pre_fecha_llegada_panama = request.getParameter("pre_fecha_llegada_panama");			
	String p_pre_estatus_civil_lkup = request.getParameter("pre_estatus_civil_lkup");			
	

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
		prest.setString(4,p_pre_otros_nombres);
		prest.setString(5,p_pre_fecha_de_nacimiento);
		prest.setString(6,p_pre_ciudad_de_nacimiento);
		prest.setString(7,p_pre_pais_de_nacimiento_lkup);
		prest.setString(8,p_pre_genero_lkup);
		prest.setString(9,p_pre_nacionalidad_lkup);
		prest.setString(10,p_pre_otro_estatus_migratoria);
		prest.setString(11,p_pre_otro_estatus_migratoria_paises);
		prest.setString(12,p_pre_etnico_o_tribu);
		prest.setString(13,p_pre_religion_lkup);
		prest.setString(14,p_pre_idioma_lkup);
		prest.setString(15,p_pre_otros_idiomas);
		prest.setString(16,p_pre_direccion_actual);
		prest.setString(17,p_pre_telefono1);
		prest.setString(18,p_pre_pasaporte);
		prest.setString(19,p_pre_otros_documentos);
		prest.setString(20,p_pre_edu_nombre);
		prest.setString(21,p_pre_edu_lugar);
		prest.setString(22,p_pre_edu_desde);
		prest.setString(23,p_pre_edu_hasta);
		prest.setString(24,p_pre_edu_titulo);
		prest.setString(25,p_pre_edu_nombre2);
		prest.setString(26,p_pre_edu_lugar2);
		prest.setString(27,p_pre_edu_desde2);
		prest.setString(28,p_pre_edu_hasta2);
		prest.setString(29,p_pre_edu_titulo2);
		prest.setString(30,p_pre_ocu_empleador);
		prest.setString(31,p_pre_ocu_lugar);
		prest.setString(32,p_pre_ocu_desde);
		prest.setString(33,p_pre_ocu_hasta);
		prest.setString(34,p_pre_ocu_puesto);
		prest.setString(35,p_pre_mil_nombre);
		prest.setString(36,p_pre_mil_lugar);
		prest.setString(37,p_pre_mil_desde);
		prest.setString(38,p_pre_mil_hasta);
		prest.setString(39,p_pre_mil_puesto);
		prest.setString(40,p_pre_org_nombre);
		prest.setString(41,p_pre_org_lugar);
		prest.setString(42,p_pre_org_desde);
		prest.setString(43,p_pre_org_hasta);
		prest.setString(44,p_pre_org_rol);
		prest.setString(45,p_pre_org_nombre2);
		prest.setString(46,p_pre_org_lugar2);
		prest.setString(47,p_pre_org_desde2);
		prest.setString(48,p_pre_org_hasta2);
		prest.setString(49,p_pre_org_rol2);
		prest.setString(50,p_pre_arrest_confirm);
		
		prest.setString(51,p_pre_arrest_fecha);
		prest.setString(52,p_pre_arrest_lugar);
		prest.setString(53,p_pre_arrest_delito);
		prest.setString(54,p_pre_arrest_sentencia);
		prest.setString(55,p_pre_arrest_fecha2);
		prest.setString(56,p_pre_arrest_lugar2);
		prest.setString(57,p_pre_arrest_delito2);
		prest.setString(58,p_pre_arrest_sentencia2);
		prest.setString(59,p_pre_fam_madre_nombre);
		prest.setString(60,p_pre_fam_madre_dob);
		prest.setString(61,p_pre_fam_madre_lugar);
		prest.setString(62,p_pre_fam_padre_nombre);
		prest.setString(63,p_pre_fam_padre_dob);
		prest.setString(64,p_pre_fam_padre_lugar);
		prest.setString(65,p_pre_fam_spouse_nombre);
		prest.setString(66,p_pre_fam_spouse_dob);
		prest.setString(67,p_pre_fam_spouse_lugar);
		prest.setString(68,p_pre_fam_child1_nombre);
		prest.setString(69,p_pre_fam_child1_dob);
		prest.setString(70,p_pre_fam_child1_lugar);
		prest.setString(71,p_pre_fam_child2_nombre);
		prest.setString(72,p_pre_fam_child2_dob);
		prest.setString(73,p_pre_fam_child2_lugar);
		prest.setString(74,p_pre_fam_child3_nombre);
		prest.setString(75,p_pre_fam_child3_dob);
		prest.setString(76,p_pre_fam_child3_lugar);
		prest.setString(77,p_pre_fam_child4_nombre);
		prest.setString(78,p_pre_fam_child4_dob);
		prest.setString(79,p_pre_fam_child4_lugar);
		prest.setString(80,p_pre_fam_child5_nombre);
		prest.setString(81,p_pre_fam_child5_dob);
		prest.setString(82,p_pre_fam_child5_lugar);
		prest.setString(83,p_pre_fam_sibling1_nombre);
		prest.setString(84,p_pre_fam_sibling1_dob);
		prest.setString(85,p_pre_fam_sibling1_lugar);
		prest.setString(86,p_pre_fam_sibling2_nombre);
		prest.setString(87,p_pre_fam_sibling2_dob);
		prest.setString(88,p_pre_fam_sibling2_lugar);
		prest.setString(89,p_pre_fam_sibling3_nombre);
		prest.setString(90,p_pre_fam_sibling3_dob);
		prest.setString(91,p_pre_fam_sibling3_lugar);
		prest.setString(92,p_pre_fam_sibling4_nombre);
		prest.setString(93,p_pre_fam_sibling4_dob);
		prest.setString(94,p_pre_fam_sibling4_lugar);
		prest.setString(95,p_pre_fam_sibling5_nombre);
		prest.setString(96,p_pre_fam_sibling5_dob);
		prest.setString(97,p_pre_fam_sibling5_lugar);
		prest.setString(98,p_pre_fam_otra1_relacion);
		prest.setString(99,p_pre_fam_otra1_nombre);
		prest.setString(100,p_pre_fam_otra1_dob);
		prest.setString(101,p_pre_fam_otra1_lugar);
		prest.setString(102,p_pre_fam_otra2_relacion);
		prest.setString(103,p_pre_fam_otra2_nombre);
		prest.setString(104,p_pre_fam_otra2_dob);
		prest.setString(105,p_pre_fam_otra2_lugar);
		prest.setString(106,p_pre_fam_otra3_relacion);
		prest.setString(107,p_pre_fam_otra3_nombre);
		prest.setString(108,p_pre_fam_otra3_dob);
		prest.setString(109,p_pre_fam_otra3_lugar);
		prest.setString(110,p_pre_fecha_de_salida_origen);
		prest.setString(111,p_pre_viaje1_pais);
		prest.setString(112,p_pre_viaje1_desde);
		prest.setString(113,p_pre_viaje1_hasta);
		prest.setString(114,p_pre_viaje1_medio);
		prest.setString(115,p_pre_viaje2_pais);
		prest.setString(116,p_pre_viaje2_desde);
		prest.setString(117,p_pre_viaje2_hasta);
		prest.setString(118,p_pre_viaje2_medio);
		prest.setString(119,p_pre_viaje3_pais);
		prest.setString(120,p_pre_viaje3_desde);
		prest.setString(121,p_pre_viaje3_hasta);
		prest.setString(122,p_pre_viaje3_medio);
		prest.setString(123,p_pre_viaje4_pais);
		prest.setString(124,p_pre_viaje4_desde);
		prest.setString(125,p_pre_viaje4_hasta);
		prest.setString(126,p_pre_viaje4_medio);
		prest.setString(127,p_pre_viaje5_pais);
		prest.setString(128,p_pre_viaje5_desde);
		prest.setString(129,p_pre_viaje5_hasta);
		prest.setString(130,p_pre_viaje5_medio);
		prest.setString(131,p_pre_viaje6_pais);
		prest.setString(132,p_pre_viaje6_desde);
		prest.setString(133,p_pre_viaje6_hasta);
		prest.setString(134,p_pre_viaje6_medio);
		prest.setString(135,p_pre_pref);
		prest.setString(136,p_pre_pref_sexo);
		prest.setString(137,p_pre_pref_idioma);
		prest.setString(138,p_pre_fecha_solicitud_onpar);
		prest.setString(139,p_pre_solicitud_preparado_por);
		prest.setString(140,p_pre_ui_nombre_recibio);
		prest.setString(141,p_pre_ui_fecha_recibido);
		prest.setInt(142,p_last_user_id);
		prest.setString(143,mNumero_de_caso);
		prest.setString(144,p_pre_fundado_temor);
		prest.setString(145,p_pre_fundado_temor_partb);
		prest.setString(146,p_pre_fecha_llegada_panama);
		prest.setString(147,p_pre_estatus_civil_lkup);

		int mCount = prest.executeUpdate();

		recs = Database.callProc("p_ins_entrevista_legal",parameters);
		recs = Database.callProc("p_ins_entrevista_social",parameters);
			
		response.sendRedirect("main.jsp?target=solicitantes");			

	}
	catch(Exception e){
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(con != null) { con.close(); }
	}
%>