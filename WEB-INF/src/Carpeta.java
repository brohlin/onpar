import javax.servlet.*;
import javax.servlet.http.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

import com.lowagie.text.*;
import com.lowagie.text.pdf.BaseFont;  
import com.lowagie.text.pdf.PdfContentByte;  
import com.lowagie.text.pdf.PdfImportedPage;  
import com.lowagie.text.pdf.PdfReader;  
import com.lowagie.text.pdf.PdfWriter; 

public class Carpeta extends HttpServlet
{
	
	public Carpeta()
	{
		super();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		
		ByteArrayOutputStream baosPDF = null;
		
		try
		{
			baosPDF = generatePDFDocumentBytes(req, resp, this.getServletContext());
			
			
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

			resp.setContentLength(baosPDF.size());

			ServletOutputStream sos;

			sos = resp.getOutputStream();
			
			baosPDF.writeTo(sos);
			
			sos.flush();
		} catch (DocumentException dex){
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
		} finally
		{
			if (baosPDF != null)
			{
				baosPDF.reset();
			}
		}
		 
	}

	protected ByteArrayOutputStream generatePDFDocumentBytes(
			final HttpServletRequest req,
			final HttpServletResponse resp,
			final ServletContext ctx)
			throws DocumentException
		{	
			Document doc = new Document();
			HttpSession session = req.getSession(true);
			ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
			PdfWriter docWriter = null;	
			boolean paginate = true;		
			
			int totalPagesDJ = 0;
			int totalPagesEL = 0;
			int totalPagesES = 0;
			int totalPagesFoto = 0;
			int totalPagesPasaporte = 0;
			int totalPagesOtroDocumento = 0;
			int totalPagesAdmRecon = 0;
			int totalPagesAdmApel = 0;
			int totalPagesRefRecon = 0;
			int totalPagesRefApel = 0;
			int totalPagesRenuncia = 0;		
			
			boolean DJ = false;
			boolean EL = false;
			boolean ES = false;
			boolean Foto = false;
			boolean Pasaporte = false;
			boolean OtroDocumento = false;
			boolean AdmRecon = false;
			boolean AdmApel = false;
			boolean RefRecon = false;
			boolean RefApel = false;
			boolean Renuncia = false;
			
			PdfReader pdfReaderDJ = null;
			PdfReader pdfReaderEL = null;
			PdfReader pdfReaderES = null;
			PdfReader pdfReaderFoto = null;
			PdfReader pdfReaderPasaporte = null;
			PdfReader pdfReaderOtroDocumento = null;
			PdfReader pdfReaderAdmRecon = null;
			PdfReader pdfReaderAdmApel = null;
			PdfReader pdfReaderRefRecon = null;
			PdfReader pdfReaderRefApel= null;
			PdfReader pdfReaderRenuncia = null;
			
			if (session.getAttribute("temp_solicitante_v2_pre_declaracion_jurada") != null) {
				try {
					
					java.sql.Blob blobDJ = (Blob) session.getAttribute("temp_solicitante_v2_pre_declaracion_jurada");
					InputStream isDJ = blobDJ.getBinaryStream();
					pdfReaderDJ = new PdfReader(isDJ);
					totalPagesDJ = pdfReaderDJ.getNumberOfPages();
					DJ = true;
				} catch(Exception e) {
					// do nothing
				}
			}	

			if (session.getAttribute("temp_solicitante_v2_pre_entrevista_legal") != null) {
				try {
					
					java.sql.Blob blobEL = (Blob) session.getAttribute("temp_solicitante_v2_pre_entrevista_legal");
					InputStream isEL = blobEL.getBinaryStream();
					pdfReaderEL = new PdfReader(isEL);
					totalPagesEL = pdfReaderEL.getNumberOfPages();
					EL = true;
				} catch(Exception e) {
					// do nothing
				}
			}

			if (session.getAttribute("temp_solicitante_v2_pre_entrevista_social") != null) {
				try {
					
					java.sql.Blob blobES = (Blob) session.getAttribute("temp_solicitante_v2_pre_entrevista_social");
					InputStream isES = blobES.getBinaryStream();
					pdfReaderES = new PdfReader(isES);
					totalPagesES = pdfReaderES.getNumberOfPages();
					ES = true;
				} catch(Exception e) {
					// do nothing
				}
			}			

			
			if (session.getAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia") != null) {
				try {
					
					java.sql.Blob blobFoto = (Blob) session.getAttribute("temp_solicitante_v2_pre_soc_foto_jefe_de_familia");
					InputStream isFoto = blobFoto.getBinaryStream();
					pdfReaderFoto = new PdfReader(isFoto);
					totalPagesFoto = pdfReaderFoto.getNumberOfPages();
					Foto = true;
				} catch(Exception e) {
					// do nothing
				}
			}	
			
			if (session.getAttribute("temp_solicitante_v2_pre_copia_pasaporte") != null) {
				try {
					
					java.sql.Blob blobPasaporte = (Blob) session.getAttribute("temp_solicitante_v2_pre_copia_pasaporte");
					InputStream isPasaporte = blobPasaporte.getBinaryStream();
					pdfReaderPasaporte  = new PdfReader(isPasaporte);
					totalPagesPasaporte  = pdfReaderPasaporte.getNumberOfPages();
					Pasaporte  = true;
				} catch(Exception e) {
					// do nothing
				}
			}			

			if (session.getAttribute("temp_solicitante_v2_pre_copia_otro_documento") != null) {
				try {
					
					java.sql.Blob blobOtroDocumento = (Blob) session.getAttribute("temp_solicitante_v2_pre_copia_otro_documento");
					InputStream isOtroDocumento = blobOtroDocumento.getBinaryStream();
					pdfReaderOtroDocumento  = new PdfReader(isOtroDocumento);
					totalPagesOtroDocumento  = pdfReaderOtroDocumento.getNumberOfPages();
					OtroDocumento  = true;
				} catch(Exception e) {
					// do nothing
				}
			}	

			if (session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_recon") != null) {
				try {
					
					java.sql.Blob blobAdmRecon = (Blob) session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_recon");
					InputStream isAdmRecon = blobAdmRecon.getBinaryStream();
					pdfReaderAdmRecon  = new PdfReader(isAdmRecon);
					totalPagesAdmRecon  = pdfReaderAdmRecon.getNumberOfPages();
					AdmRecon  = true;
				} catch(Exception e) {
					// do nothing
				}
			}			

			if (session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_apel") != null) {
				try {
					
					java.sql.Blob blobAdmApel = (Blob) session.getAttribute("temp_solicitante_v2_adm_peticion_para_la_apel");
					InputStream isAdmApel = blobAdmApel.getBinaryStream();
					pdfReaderAdmApel  = new PdfReader(isAdmApel);
					totalPagesAdmApel  = pdfReaderAdmApel.getNumberOfPages();
					AdmApel  = true;
				} catch(Exception e) {
					// do nothing
				}
			}			
			
			if (session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_recon") != null) {
				try {
					
					java.sql.Blob blobRefRecon = (Blob) session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_recon");
					InputStream isRefRecon = blobRefRecon.getBinaryStream();
					pdfReaderRefRecon  = new PdfReader(isRefRecon);
					totalPagesRefRecon  = pdfReaderRefRecon.getNumberOfPages();
					RefRecon  = true;
				} catch(Exception e) {
					// do nothing
				}
			}			

			if (session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_apel") != null) {
				try {
					
					java.sql.Blob blobRefApel = (Blob) session.getAttribute("temp_solicitante_v2_ref_peticion_para_la_apel");
					InputStream isRefApel = blobRefApel.getBinaryStream();
					pdfReaderRefApel  = new PdfReader(isRefApel);
					totalPagesRefApel  = pdfReaderRefApel.getNumberOfPages();
					RefApel  = true;
				} catch(Exception e) {
					// do nothing
				}
			}			

			if (session.getAttribute("temp_solicitante_v2_renuncia") != null) {
				try {
					
					java.sql.Blob blobRenuncia = (Blob) session.getAttribute("temp_solicitante_v2_renuncia");
					InputStream isRenuncia = blobRenuncia.getBinaryStream();
					pdfReaderRenuncia = new PdfReader(isRenuncia);
					totalPagesRenuncia  = pdfReaderRenuncia.getNumberOfPages();
					Renuncia = true;
				} catch(Exception e) {
					// do nothing
				}
			}				
			try
			{
				BaseFont bf = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
				docWriter = PdfWriter.getInstance(doc, baosPDF);
				doc.setPageSize(PageSize.LEGAL);
				doc.open();
				PdfContentByte cb = docWriter.getDirectContent(); // Holds the PDF data  
	            PdfImportedPage page;  
	            int currentPageNumber = 0;  
	            int pageOfCurrentReaderPDF = 0; 			

	            // Declaracion Jurada  
                if (DJ) {
		            while (pageOfCurrentReaderPDF < totalPagesDJ) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderDJ, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesDJ, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }
                }
                pageOfCurrentReaderPDF = 0;  
            
	            // Entrevista Legal  
                if (EL) {
	                while (pageOfCurrentReaderPDF < totalPagesEL) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderEL, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesEL, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }
                }
                pageOfCurrentReaderPDF = 0;
                
	            // Entrevista Social  
                if(ES) {
	                while (pageOfCurrentReaderPDF < totalPagesES) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderES, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesES, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0; 
                
	            // Foto 
                if(Foto) {
	                while (pageOfCurrentReaderPDF < totalPagesFoto) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderFoto, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesFoto, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;
                
	            // Pasaporte 
                if(Pasaporte) {
	                while (pageOfCurrentReaderPDF < totalPagesPasaporte) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderPasaporte, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesPasaporte, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0; 
                
	            // OtroDocumento 
                if(OtroDocumento) {
	                while (pageOfCurrentReaderPDF < totalPagesOtroDocumento) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderOtroDocumento, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesOtroDocumento, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;   
                
	            // AdmRecon
                if(AdmRecon) {
	                while (pageOfCurrentReaderPDF < totalPagesAdmRecon) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderAdmRecon, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesAdmRecon, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;         
                
	            // AdmApel
                if(AdmApel) {
	                while (pageOfCurrentReaderPDF < totalPagesAdmApel) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderAdmApel, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesAdmApel, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;         
                
	            // RefRecon
                if(RefRecon) {
	                while (pageOfCurrentReaderPDF < totalPagesRefRecon) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderRefRecon, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesRefRecon, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;       
                
	            // RefApel
                if(RefApel) {
	                while (pageOfCurrentReaderPDF < totalPagesRefApel) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderRefApel, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesRefApel, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                
                pageOfCurrentReaderPDF = 0;  
                
	            // Renuncia
                if(Renuncia) {
	                while (pageOfCurrentReaderPDF < totalPagesRenuncia) {  
	                    doc.newPage();  
	                    pageOfCurrentReaderPDF++;  
	                    currentPageNumber++;  
	                    page = docWriter.getImportedPage(pdfReaderRenuncia, pageOfCurrentReaderPDF);  
	                    cb.addTemplate(page, 0, 0);  
	   
	                    // Code for pagination.  
	                    if (paginate) {  
	                        cb.beginText();  
	                        cb.setFontAndSize(bf, 9);  
	                        cb.showTextAligned(PdfContentByte.ALIGN_CENTER, ""  
	                                + currentPageNumber + " of " + totalPagesRenuncia, 520,  
	                                5, 0);  
	                        cb.endText();  
	                    }  
	                }  
                }
                pageOfCurrentReaderPDF = 0;                  
			}
			catch (DocumentException dex)
			{
				baosPDF.reset();
				throw dex; 
			} 
			catch (IOException iox) {
				// do nothing
			}
			finally
			{
				if (doc != null)
				{
					doc.close();
				}
				if (docWriter != null)
				{
					docWriter.close();
				}
			}

			if (baosPDF.size() < 1)
			{
				throw new DocumentException(
					"document has "
					+ baosPDF.size()
					+ " bytes");		
			}
			return baosPDF;
		}	
	 	
}