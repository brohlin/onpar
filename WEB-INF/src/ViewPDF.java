import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.InputStream;
import java.awt.Color;
import java.sql.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class ViewPDF extends HttpServlet
{
	/** 
	* 
	* 
	*/
	public ViewPDF()
	{
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		
		HttpSession session = req.getSession(true);
		String mFile = req.getParameter("file");
		
		ByteArrayOutputStream baosPDF2 = new ByteArrayOutputStream();		
		
		try
		{
			java.sql.Blob blob = null;
			if (mFile.equals("pre_declaracion_jurada")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_declaracion_jurada"); 		
			} else if (mFile.equals("pre_entrevista_social")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_entrevista_social"); 				
			} else if (mFile.equals("pre_entrevista_legal")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_entrevista_legal"); 				
			} else if (mFile.equals("pre_soc_foto_jefe_de_familia")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_soc_foto_jefe_de_familia"); 				
			} else if (mFile.equals("adm_peticion_para_la_recon")) {
				blob = (Blob) session.getAttribute("temp_solicitante_adm_peticion_para_la_recon"); 				
			} else if (mFile.equals("adm_peticion_para_la_apel")) {
				blob = (Blob) session.getAttribute("temp_solicitante_adm_peticion_para_la_apel"); 				
			} else if (mFile.equals("pasaporte")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_copia_identificacion1"); 				
			} else if (mFile.equals("cedula")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_copia_identificacion2"); 				
			} else if (mFile.equals("carnet_de_conducir")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_copia_identificacion3"); 				
			} else if (mFile.equals("pasado_judicial")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_copia_identificacion4"); 				
			} else if (mFile.equals("otro")) {
				blob = (Blob) session.getAttribute("temp_solicitante_pre_copia_identificacion5"); 				
			} else if (mFile.equals("prueba")) {
				blob = (Blob) session.getAttribute("temp_prueba_file"); 				
			} else if (mFile.equals("renuncia")) {
				blob = (Blob) session.getAttribute("temp_solicitante_renuncia"); 				
			} else if (mFile.equals("ref_peticion_para_la_recon")) {
				blob = (Blob) session.getAttribute("temp_solicitante_ref_peticion_para_la_recon"); 				
			} else if (mFile.equals("ref_peticion_para_la_apel")) {
				blob = (Blob) session.getAttribute("temp_solicitante_ref_peticion_para_la_apel"); 				
			} 
			
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