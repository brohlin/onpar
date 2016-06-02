import javax.servlet.*;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.InputStream;
import java.sql.*;
import org.onpar.database.*;
import org.onpar.utils.*;
import org.onpar.utils.arrays.*;
import org.onpar.log.*;
import javax.sql.*;

public class ViewPDF_v2 extends HttpServlet
{

	public ViewPDF_v2()
	{
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		
		HttpSession session = req.getSession(true);
		String mFile = req.getParameter("file");
		
		ByteArrayOutputStream baosPDF2 = new ByteArrayOutputStream();		

		String mQuery = "select " + mFile + " " +
				"from vw_solicitante " +
				"where id = ? " + 
				"and id > 0 ";

		String mId = session.getAttribute("temp_solicitante_v2_id").toString();
		java.sql.Blob blob = null;
		
		Connection con = null;
		PreparedStatement prest = null;
		ResultSet rs = null;
		
		DataSource OnparDB = null;
		
		try {
			javax.naming.Context initCtx = new javax.naming.InitialContext();
			javax.naming.Context envCtx = (javax.naming.Context) initCtx.lookup("java:comp/env");
			OnparDB = (DataSource) envCtx.lookup("jdbc/OnparDB");
			con = OnparDB.getConnection();
		} catch(Exception e){
			System.out.println("inside the context exception");
			e.printStackTrace();
		}
		
		try{
			if(OnparDB == null) {
				javax.naming.Context initCtx1 = new javax.naming.InitialContext();
				javax.naming.Context envCtx1 = (javax.naming.Context) initCtx1.lookup("java:comp/env");
				OnparDB = (DataSource) envCtx1.lookup("jdbc/OnparDB");
				con = OnparDB.getConnection();
			}
		} catch(Exception e){
			System.out.println("inside the context exception");
			e.printStackTrace();
		}
		
		
		try{
			if (session.getAttribute("email") != null) {
			
				prest=con.prepareStatement(mQuery);
				prest.setString(1,mId);
				rs=prest.executeQuery();
		
				int size = 0;
				
		
				while(rs.next())
				{
					size++;
					blob=rs.getBlob(1);			
				}
				
			} else {
				resp.sendRedirect("/onpar/salir.jsp");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			throw new javax.servlet.ServletException(e.getMessage());

		} finally {
			try {
				if(prest != null) { prest.close(); }
				if(rs != null) { rs.close(); }
				if(con != null) { con.close(); }
			} catch(Exception e2) {
				throw new javax.servlet.ServletException(e2.getMessage());
			}
		}

		try
		{
			/*
			if (mFile.equals("pre_declaracion_jurada")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_declaracion_jurada"); 		
			} else if (mFile.equals("pre_entrevista_social")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_entrevista_social"); 				
			} else if (mFile.equals("pre_entrevista_legal")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_entrevista_legal"); 				
			} else if (mFile.equals("pre_soc_foto_jefe_de_familia")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia"); 				
			} else if (mFile.equals("adm_peticion_para_la_recon")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_recon"); 				
			} else if (mFile.equals("adm_peticion_para_la_apel")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_apel"); 				
			} else if (mFile.equals("pasaporte")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_copia_pasaporte"); 				
			} else if (mFile.equals("otro")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_pre_copia_otro_documento"); 				
			} else if (mFile.equals("prueba")) {
				blob = (Blob) session.getAttribute("temp_prueba_file"); 				
			} else if (mFile.equals("renuncia")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_renuncia"); 				
			} else if (mFile.equals("ref_peticion_para_la_recon")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_recon"); 				
			} else if (mFile.equals("ref_peticion_para_la_apel")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_apel"); 				
			} else if (mFile.equals("quitar_refug_recon")) {
				blob = (Blob) session.getAttribute("temp_solicitante_v2_quitar_refug_recon"); 				
			} 
			*/
			
        	InputStream is = blob.getBinaryStream();  
        	int b = 0;  
        	while ((b = is.read()) != -1)  
        	{  
        		baosPDF2.write(b);  
        	} 
	        		        			
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append("filename_");
			sbFilename.append(System.currentTimeMillis());
			sbFilename.append(".pdf");

			resp.setHeader("Cache-Control", "max-age=30");
			
			resp.setContentType("application/pdf");
			
			StringBuffer sbContentDispValue = new StringBuffer();
			sbContentDispValue.append("inline");
			sbContentDispValue.append("; filename=");
			sbContentDispValue.append(sbFilename);
							
			resp.setHeader(
				"Content-disposition",
				sbContentDispValue.toString());

			resp.setContentLength(baosPDF2.size());

			ServletOutputStream sos;

			sos = resp.getOutputStream();
			
			baosPDF2.writeTo(sos);
			
			sos.flush();
		} catch(NullPointerException nex) {
			resp.sendRedirect("/onpar/default_error_page.jsp");
		}
		catch (Exception dex)
		{
			resp.setContentType("text/html");
			PrintWriter writer = resp.getWriter();
			writer.println(
					this.getClass().getName() 
					+ " caught an exception: " 
					+ dex.getClass().getName()
					+ "<br>");
			writer.println("<pre>");
			dex.printStackTrace(writer);
			writer.println("</pre>");
		}
		finally
		{
			if (baosPDF2 != null)
			{
				baosPDF2.reset();
			}
		}

	}

}