<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "select format(elf.id, '0'), " +
					"replace(format(elf.solicitante_id,''),',',''), " +
					"ifnull(elf.q1,''), " +
					"ifnull(elf.q2,''), " +
					"ifnull(elf.q3,''), " +
					"ifnull(elf.q4,''), " +
					"ifnull(elf.q5,''), " +
					"ifnull(elf.q6,''), " +
					"ifnull(elf.q7,''), " +
					"ifnull(elf.q8,''), " +
					"ifnull(elf.q9,''), " +
					"ifnull(elf.q10,''), " +
					"ifnull(elf.q11,''), " +
					"ifnull(elf.q12,''), " +
					"ifnull(elf.q13,''), " +
					"ifnull(elf.q14,''), " +
					"ifnull(elf.q15,''), " +
					"ifnull(elf.q16,''), " +
					"ifnull(elf.q17,''), " +
					"ifnull(elf.q18,''), " +
					"ifnull(elf.q19,''), " +
					"ifnull(elf.q20,''), " +
					"ifnull(elf.q21,''), " +
					"ifnull(elf.q22,''), " +
					"ifnull(elf.q23,''), " +
					"ifnull(elf.q24,''), " +
					"ifnull(elf.q25,''), " +
					"ifnull(elf.q26,''), " +
					"ifnull(elf.q27,''), " +
					"ifnull(elf.q28,''), " +
					"ifnull(elf.q29,''), " +
					"ifnull(elf.q30,''), " +
					"ifnull(elf.q31,''), " +
					"ifnull(elf.otra_pregunta,''), " +
					"ifnull(elf.fecha_entrevista_legal,''), " +
					"format(elf.legal_user_id,''), " +
					"ifnull(elf.last_mod_tmstmp,''), " +
					"ifnull(dj.pre_primer_nombre,''), " +
					"ifnull(dj.pre_apellido_paterno,''), " +
					"ifnull(dj.pre_apellido_materno,''), " +
					"ifnull(dj.pre_pasaporte,''), " +
					"ifnull(dj.pre_otros_documentos,''), " +
					"ifnull(dj.pre_nacionalidad_lkup,''), " +
					"ifnull(dj.pre_fecha_de_nacimiento,''), " +
					"ifnull(dj.pre_direccion_actual,''), " +
					"ifnull(dj.pre_telefono1,''), " +
					"ifnull(dj.pre_fecha_llegada_panama,''), " +
					"ifnull(dj.pre_fecha_solicitud_onpar,''), " +
					"ifnull(f.nombre,''), " +
					"ifnull(f.parentesco_lkup,'') " +
					"from entrevista_legal_familia elf, declaracion_jurada dj, familia f " +
					"where elf.solicitante_id=dj.id " +
					" and elf.id=f.id " +
					" and elf.id=?";
	
	String mId = request.getParameter("id");
	
	session.setAttribute("elf_id", null);
	session.setAttribute("elf_solicitante_id", null);
	session.setAttribute("elf_q1", null);
	session.setAttribute("elf_q2", null);
	session.setAttribute("elf_q3", null);
	session.setAttribute("elf_q4", null);
	session.setAttribute("elf_q5", null);
	session.setAttribute("elf_q6", null);
	session.setAttribute("elf_q7", null);
	session.setAttribute("elf_q8", null);
	session.setAttribute("elf_q9", null);
	session.setAttribute("elf_q10", null);
	session.setAttribute("elf_q11", null);
	session.setAttribute("elf_q12", null);
	session.setAttribute("elf_q13", null);
	session.setAttribute("elf_q14", null);
	session.setAttribute("elf_q15", null);
	session.setAttribute("elf_q16", null);
	session.setAttribute("elf_q17", null);
	session.setAttribute("elf_q18", null);
	session.setAttribute("elf_q19", null);
	session.setAttribute("elf_q20", null);
	session.setAttribute("elf_q21", null);
	session.setAttribute("elf_q22", null);
	session.setAttribute("elf_q23", null);
	session.setAttribute("elf_q24", null);
	session.setAttribute("elf_q25", null);
	session.setAttribute("elf_q26", null);
	session.setAttribute("elf_q27", null);
	session.setAttribute("elf_q28", null);
	session.setAttribute("elf_q29", null);
	session.setAttribute("elf_q30", null);
	session.setAttribute("elf_q31", null);
	session.setAttribute("elf_otra_pregunta", null);
	session.setAttribute("elf_fecha_entrevista_legal", null);
	session.setAttribute("elf_legal_user_id", null);
	session.setAttribute("elf_last_mod_tmstmp", null);
	
	session.setAttribute("elf_pre_primer_nombre", null);
	session.setAttribute("elf_pre_apellido_paterno", null);
	session.setAttribute("elf_pre_apellido_materno", null);
	session.setAttribute("elf_pre_pasaporte", null);
	session.setAttribute("elf_pre_otros_documentos", null);
	session.setAttribute("elf_pre_nacionalidad_lkup", null);
	session.setAttribute("elf_pre_fecha_de_nacimiento", null);
	session.setAttribute("elf_pre_direccion_actual", null);
	session.setAttribute("elf_pre_telefono1", null);
	session.setAttribute("elf_pre_fecha_llegada_panama", null);
	session.setAttribute("elf_pre_fecha_solicitud_onpar", null);
	session.setAttribute("elf_nombre", null);
	session.setAttribute("elf_parentesco_lkup", null);
	
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
				session.setAttribute("elf_id", rs.getString(1));
				session.setAttribute("elf_solicitante_id", rs.getString(2));
				session.setAttribute("elf_q1", rs.getString(3));
				session.setAttribute("elf_q2", rs.getString(4));
				session.setAttribute("elf_q3", rs.getString(5));
				session.setAttribute("elf_q4", rs.getString(6));
				session.setAttribute("elf_q5", rs.getString(7));
				session.setAttribute("elf_q6", rs.getString(8));
				session.setAttribute("elf_q7", rs.getString(9));
				session.setAttribute("elf_q8", rs.getString(10));
				session.setAttribute("elf_q9", rs.getString(11));
				session.setAttribute("elf_q10", rs.getString(12));
				session.setAttribute("elf_q11", rs.getString(13));
				session.setAttribute("elf_q12", rs.getString(14));
				session.setAttribute("elf_q13", rs.getString(15));
				session.setAttribute("elf_q14", rs.getString(16));
				session.setAttribute("elf_q15", rs.getString(17));
				session.setAttribute("elf_q16", rs.getString(18));
				session.setAttribute("elf_q17", rs.getString(19));
				session.setAttribute("elf_q18", rs.getString(20));
				session.setAttribute("elf_q19", rs.getString(21));
				session.setAttribute("elf_q20", rs.getString(22));
				session.setAttribute("elf_q21", rs.getString(23));
				session.setAttribute("elf_q22", rs.getString(24));
				session.setAttribute("elf_q23", rs.getString(25));
				session.setAttribute("elf_q24", rs.getString(26));
				session.setAttribute("elf_q25", rs.getString(27));
				session.setAttribute("elf_q26", rs.getString(28));
				session.setAttribute("elf_q27", rs.getString(29));
				session.setAttribute("elf_q28", rs.getString(30));
				session.setAttribute("elf_q29", rs.getString(31));
				session.setAttribute("elf_q30", rs.getString(32));
				session.setAttribute("elf_q31", rs.getString(33));
				session.setAttribute("elf_otra_pregunta", rs.getString(34));
				session.setAttribute("elf_fecha_entrevista_legal", rs.getString(35));
				session.setAttribute("elf_legal_user_id", rs.getString(36));
				session.setAttribute("elf_last_mod_tmstmp", rs.getString(37));
				session.setAttribute("elf_pre_primer_nombre", rs.getString(38));
				session.setAttribute("elf_pre_apellido_paterno", rs.getString(39));
				session.setAttribute("elf_pre_apellido_materno", rs.getString(40));
				session.setAttribute("elf_pre_pasaporte", rs.getString(41));
				session.setAttribute("elf_pre_otros_documentos", rs.getString(42));
				session.setAttribute("elf_pre_nacionalidad_lkup", rs.getString(43));
				session.setAttribute("elf_pre_fecha_de_nacimiento", rs.getString(44));
				session.setAttribute("elf_pre_direccion_actual", rs.getString(45));
				session.setAttribute("elf_pre_telefono1", rs.getString(46));
				session.setAttribute("elf_pre_fecha_llegada_panama", rs.getString(47));
				session.setAttribute("elf_pre_fecha_solicitud_onpar", rs.getString(48));
				session.setAttribute("elf_nombre", rs.getString(49));
				session.setAttribute("elf_parentesco_lkup", rs.getString(50));
			}

			if (size == 0) {
				response.sendRedirect("/onpar/salir.jsp");
			}
			
			response.sendRedirect("/onpar/main.jsp?target=entrevista_legal_familia");			
			
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