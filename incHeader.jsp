<%@ page language="java" import="java.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>
<%@ page import="org.onpar.log.*" %>
<%
	String mTarget = request.getParameter("target");
	String mAcceder = "off";
	String mRegistrar = "off";
	String mSalir = "off";
	String mInicio = "off";
	String mCuenta = "off";
	String mSolicitudes = "off";
	String mUsuarios = "off";
	String mReportes = "off";
	
	try {
		if (mTarget != null) {
			if (mTarget.equals("acceder")) {
				mAcceder = "on";
			} else if (mTarget.equals("registrar")) {
				mRegistrar = "on";
			} else if (mTarget.equals("salir")) {
				mSalir = "on";
			} else if (mTarget.equals("inicio")) {
				mInicio = "on";
			} else if (mTarget.equals("cuenta")) {
				mCuenta = "on";
			} else if (mTarget.equals("solicitantes")) {
				mSolicitudes = "on";
			} else if (mTarget.equals("usuarios")) {
				mUsuarios = "on";
			} else if (mTarget.equals("reportes")) {
				mReportes = "on";
			} 
			
			session.setAttribute("target",mTarget);
			
			if (!mTarget.equals("solicitante_upd") && !mTarget.equals("solicitante_upd_v2") 
				&& !mTarget.equals("prueba_upd_v2") 
				&& !mTarget.equals("prueba_v2")
				&& !mTarget.equals("prueba")
				&& !mTarget.equals("prueba_upd")) {
%>			
				<jsp:include page="reset_solicitante.jsp" />
<%
			}
		}
		
		if ((session.getAttribute("email") == null) && (mTarget == null)){
			mAcceder = "on";
		}
	}
	catch (Exception e) {
		throw e;
	}

%>

<%
	DynStringArray parameters = new DynStringArray();
	DbResults db;
	int a;
	parameters.add(session.getId());
	if (session.getAttribute("id") == null) {
		parameters.add("0");
	} else {
		parameters.add(session.getAttribute("id").toString());
	}
	
	if ((session.getAttribute("temp_solicitante_id") == null) && (session.getAttribute("temp_solicitante_v2_id") == null)) {
		parameters.add("0");
	} else if ((session.getAttribute("temp_solicitante_id") != null) && (session.getAttribute("temp_solicitante_v2_id") == null)) {
		parameters.add(session.getAttribute("temp_solicitante_id").toString());
	} else if ((session.getAttribute("temp_solicitante_id") == null) && (session.getAttribute("temp_solicitante_v2_id")  != null)) {
		parameters.add(session.getAttribute("temp_solicitante_v2_id").toString());
	} else {
		parameters.add("0");
	}
	parameters.add(mTarget);
	
	try {
		db = Database.callProcResults("p_ins_user_current_page", parameters);
	} catch (SQLException s) {
	    System.out.println(s.getMessage());
	    a = Database.callProc("p_upd_user_current_page", parameters);
	}	
%>

<!--- Start HTML header --->
<html>
<head>

	<!-- link rel="stylesheet" href="/onpar/assets/css/bootstrap.min.css" media="all">
	<link rel="stylesheet" href="/onpar/assets/css/custom.css" media="all">

	<link href='http://fonts.googleapis.com/css?family=Lato:400,700%7cJosefin+Sans:400,700%7cRoboto+Condensed:300,400' rel='stylesheet' type='text/css' media="all" -->
	
	<!-- Glyphicons -->
	<link rel="stylesheet" href="/onpar/assets/css/font-awesome.min.css" media="all">


	<link rel="shortcut icon" href="/onpar/favicon.ico" type="image/x-icon" />

	<!--- Load styles --->
	<jsp:include page="/incControlStyle.jsp" />

	<!--- Meta tags/ title --->
	<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
	<meta content="Oficina Nacional Para la Atención de Refugiados" name=keywords>
	<title>ONPAR - Oficina Nacional Para la Atención de Refugiados</title>
	
	<!--- Javascript --->
	<script language="JavaScript">
		function checkBrowser() {
		    var isChrome = !!window.chrome;
						
		    if (!isChrome) {
		        alert("Se necesita Chrome para usar esta aplicación.");
		        return false;
		    } else {
		    	return true;
		    }  
		}	
	</script>	

	<script type='text/javascript'>
		function checkFilesize(p_fileinput) {
		    var input, file;
			var maxFileSize = 102400000;
			
		    // (Can't use `typeof FileReader === "function"` because apparently
		    // it comes back as "object" on some browsers. So just see if it's there
		    // at all.)
		    if (!window.FileReader) {
		        alert("El API para archivos no está soportado en este navigador.");
		        return false;
		    }
		
		    input = document.getElementById(p_fileinput);
		    if (!input) {
		        alert("No podía encontrar el elemento de " + p_fileinput + ".");
		        return false;
		    }
		    else if (!input.files) {
		        alert("Parece que este navegador no soporte propriedades de archivos o insumos de archivos.");
		        return false;
		    }
		    else if (!input.files[0]) {
		        alert("Por favor, seleccione un archivo antes de hacer clic.");
		        return false;
		    }
		    else {
		        file = input.files[0];
		        // alert("El archivo de " + file.name + " es " + file.size + " bytes.");
		        if (file.size > maxFileSize ) {
		        	alert("El archivo de " + file.name + " es " + (file.size/1024000) + " MB. No se puede subir un archivo más que " + (maxFileSize/1024000) + "MB.");
		        	return false;
		        } else if (file.size < maxFileSize) {
		        	// alert("El archivo de " + file.name + " es " + (file.size/1024000) + " MB y es menos de " + (maxFileSize/1024000) + "MB.");
		        	return true;
		        } else {
		        	return false;
		        }
		    }
		}
	</script>   

</head>

<noscript>Javascript not enabled.</noscript>