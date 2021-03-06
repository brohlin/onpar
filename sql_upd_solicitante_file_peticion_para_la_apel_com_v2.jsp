<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
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
	DynStringArray params = new DynStringArray();
	params.add(session.getAttribute("temp_solicitante_v2_id").toString());
	params.add("Subió petición de apelación a la comisión.");
	params.add(session.getAttribute("id").toString());
	params.add(session.getAttribute("temp_solicitante_v2_adm_estatus_lkup").toString());	
	rec = Database.callProc("p_ins_history", params);
	
%>

<%
	String fieldName;
	String mQuery = "update declaracion_jurada set " +
					"ref_estatus_lkup = if(ref_estatus_lkup='No admitido/a a trámite - reconsideración - Comisión','En proceso - apelación - Comisión',ref_estatus_lkup), " +	
					"ref_fecha_de_pedir_apel = ? , " +
					"ref_peticion_para_la_apel = ? , " + 			
					"last_user_id = ? , " + 
					"last_mod_tmstmp = now()  " + 
					  "where id = ?";

					
	String mSolicitante_id = null;
	String mRef_fecha_de_pedir_apel = null;
	String mLast_user_id = session.getAttribute("id").toString();
	Connection con = null;
	PreparedStatement prest = null;
	DataSource OnparDB;

   File file = null;
   int maxFileSize = 102400000;
   int maxMemSize = 5000 * 1024;
   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File(filePath));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            	// Get the uploaded file parameters
            	fieldName = fi.getFieldName();
            	String fileName = fi.getName();
            	boolean isInMemory = fi.isInMemory();
            	long sizeInBytes = fi.getSize();
            	// Write the file
            	if( fileName.lastIndexOf("\\") >= 0 ){
            		file = new File( filePath + 
            		fileName.substring( fileName.lastIndexOf("\\"))) ;
            	}else{
            		file = new File( filePath + 
            	fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            	}
            	
            	fi.write( file );
            } else {
          
				fieldName = fi.getFieldName();
	
				if(fieldName.equals("id")) {
				 	mSolicitante_id = fi.getString();
				} else if (fieldName.equals("ref_fecha_de_pedir_apel")) {
				 	mRef_fecha_de_pedir_apel = fi.getString();
				}  
            }
         }

      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
		// nada
   }
%>

<%

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
			prest.setString(1,mRef_fecha_de_pedir_apel);

			FileInputStream fs = new FileInputStream(file);
			prest.setBinaryStream(2,fs,fs.available());	
			prest.setInt(3,Integer.parseInt(mLast_user_id));
			prest.setInt(4,Integer.parseInt(mSolicitante_id));
			
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