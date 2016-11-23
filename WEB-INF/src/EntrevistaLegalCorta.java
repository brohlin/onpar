import javax.servlet.*;
import javax.servlet.http.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

import com.itextpdf.text.*;
import com.itextpdf.text.Font.*;
import com.itextpdf.text.pdf.*;
import org.onpar.utils.*;

/** 
 * 
 *  a servlet that will generate a PDF document
 *  and send the document to the client via the 
 *  ServletOutputStream
 * 
 *  @author Bob Rohlin
 * 
 */
public class EntrevistaLegalCorta extends HttpServlet
{
	/** 
	* 
	* 
	*/
	
	Font fBold=new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	Font fNormalBlack =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
	Font fNormal =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);
	Font fUnderline =new Font(FontFamily.HELVETICA, 12, Font.UNDERLINE, BaseColor.BLACK);
	
	public EntrevistaLegalCorta()
	{
		super();
	}

	/**
	 *  
	 * 
	 * we implement doGet so that this servlet will process all 
	 * HTTP GET requests
	 * 
	 * @param req HTTP request object 
	 * @param resp HTTP response object
	 * 
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
				
		ByteArrayOutputStream baosPDF = null;
		
		try
		{
			baosPDF = generatePDFDocumentBytes(req, this.getServletContext());
			
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append("filename_");
			sbFilename.append(System.currentTimeMillis());
			sbFilename.append(".pdf");

			////////////////////////////////////////////////////////
			// Note: 
			//
			// It is important to set the HTTP response headers 
			// before writing data to the servlet's OutputStream 
			//
			////////////////////////////////////////////////////////
			//
			//
			// Read the HTTP 1.1 specification for full details
			// about the Cache-Control header
			//
			// resp.setHeader("Cache-Control", "max-age=30");
			resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
			resp.setHeader("Pragma", "no-cache"); // HTTP 1.0
			resp.setDateHeader("Expires", 0); // Proxies.
			
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
		}
		catch (DocumentException dex)
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
			if (baosPDF != null)
			{
				baosPDF.reset();
			}
		}
		 
	}

	/**
	 *  
	 * @param req must be non-null
	 * 
	 * @return a non-null output stream. The output stream contains
	 *         the bytes for the PDF document
	 * 
	 * @throws DocumentException
	 * 
	 */
	protected ByteArrayOutputStream generatePDFDocumentBytes(
		final HttpServletRequest req,
		final ServletContext ctx)
		throws DocumentException
		
	{	
		Document doc = new Document();
		HttpSession session = req.getSession(true);
		
		
		
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfWriter docWriter = null;	
		
		URL img2 = null;
		try {
			img2 = new URL(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + "/onpar/img/mingob.png");
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// com.lowagie.text.Image myImgMinGob2 = null; 
		com.itextpdf.text.Image myImgMinGob2 = null;
		try {
			// myImgMinGob2 = com.lowagie.text.Image.getInstance(img2);
			myImgMinGob2 = com.itextpdf.text.Image.getInstance(img2);
			myImgMinGob2.scalePercent(50);
			
			

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			System.out.println("MalformedURLException");
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("IO");
			e.printStackTrace();
		}		
			
		 PdfPTable tab = null;
		try
		{
			tab = new  PdfPTable(2 /* columns */);
		}
		catch (Exception ex)
		{
			throw new RuntimeException(ex);
		}

		// tab.setBorder(0);
		
		
		tab.setWidthPercentage(100);
		
		Paragraph _p = new Paragraph("", fNormalBlack);
		_p.add(new Phrase("ONPAR", fBold));;
		_p.add(Chunk.NEWLINE);
		_p.add(new Phrase("Oficina Nacional Para la Atención Refugiados", fNormalBlack));
		
		// PdfPCell mLeftCell = new PdfPCell(new Paragraph("ONPAR", fBold));	
		PdfPCell mLeftCell = new PdfPCell(_p);
		
		mLeftCell.setVerticalAlignment(Element.ALIGN_BOTTOM);
		mLeftCell.setHorizontalAlignment(Element.ALIGN_LEFT);
		mLeftCell.setBorder(0);
		tab.addCell(mLeftCell);
		
		PdfPCell mRightCell = new PdfPCell(myImgMinGob2);
		mRightCell.setVerticalAlignment(Element.ALIGN_BOTTOM);
		mRightCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		mRightCell.setBorder(0);
		tab.addCell(mRightCell);
		
		// tab.endHeaders();
		// Element mTableHeader = (Element) tab;				
		
		try
		{
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			Rectangle rect = new Rectangle(30, 30, 550, 740);
	        docWriter.setBoxSize("art", rect);
	        HeaderFooterPageEventLegal event = new HeaderFooterPageEventLegal();
	        docWriter.setPageEvent(event);
	        
			doc.addAuthor(this.getClass().getName());
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(this.getClass().getName());
			doc.addTitle("Entrevista Legal del Solicitante.");
			
			doc.setPageSize(PageSize.LEGAL);
		
			doc.open();
			doc.add(tab);
			// doc.add(myImgMinGob);
			
			doc.add(new Paragraph(""));		
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			Paragraph mParagraph1 = new Paragraph("REPÚBLICA DE PANAMÁ", fBold);
			mParagraph1.setAlignment(1);
			doc.add(mParagraph1);
		
			Paragraph mParagraph2 = new Paragraph("MINISTERIO DE GOBIERNO");
			mParagraph2.setAlignment(1);
			doc.add(mParagraph2);
			
			Paragraph mParagraph3 = new Paragraph("OFICINA NACIONAL PARA LA ATENCIÓN DE REFUGIADOS");
			mParagraph3.setAlignment(1);
			doc.add(mParagraph3);
			
			Paragraph mParagraph4 = new Paragraph("ENTREVISTA DE ELEGIBILIDAD ASESORÍA LEGAL");
			mParagraph4.setAlignment(1);
			doc.add(mParagraph4);
					
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Phrase("Número de caso: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_id").toString(), fNormal));
			doc.add(Chunk.NEWLINE);			
			
			doc.add(new Phrase("Nombre: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_v2_pre_apellido_materno"), fNormal));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Documento de identidad: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otros_documentos").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
				
			doc.add(new Phrase("Pasaporte: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pasaporte").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Nacionalidad: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_nacionalidad_lkup").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
				
			doc.add(new Phrase("Fecha de nacimiento: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Dirección: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_direccion_actual").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Teléfono: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_telefono1").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de ingreso a Panamá: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de llegada a ONPAR: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de la entrevista: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_fecha_entrevista_legal").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("NOTA: Al solicitante se le explica el procedimiento a seguir, el valor de la declaración " +
								  "jurada y consecuencias en el caso de que falsee, exagere, omita o distorsione los hechos " +
								  "en que sustenta su alegato de persecución. Se le explicaron los recursos a que tiene derecho " +
								  "en caso de que sea admitido a trámite y no reconocido por la Comisión Nacional de Protección " +
								  "para Refugiados, así como los derechos y deberes de los solicitantes. El/la entrevistado/a afirma " +
								  "haber comprendido todo lo explicado."));

			doc.add(new Paragraph(" "));	
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Preguntas/Respuestas"));
			

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("1.- ¿Diga, cuales son las causas o motivos por la cual sale de su país de origen?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q21").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("2.- ¿Por qué decidió viajar a Panamá?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q30").toString(), fNormal));
			doc.add(new Paragraph(" "));

			doc.add(new Paragraph("PREGUNTAS ADICIONALES:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_legal_otra_pregunta").toString(), fNormal));
			
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Se lee y revisa esta Entrevista de Elegibilidad por ambas partes, con la finalidad que lo manifestado, " +
								  "conste en el expediente y así concluir con este requisito dentro de esta Etapa de Admisibilidad.", 
								  fBold));
			doc.add(new Paragraph("FUNDAMENTO LEGAL. Decreto Ejecutivo No. 23 de 10 de febrero de 1998, capitula VI, articulo 35, " +
								  "numeral 3.", fBold));
			
			
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", fUnderline));
			doc.add(new Paragraph("Solicitante"));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", fUnderline));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_legal_username").toString(), fNormal));
			doc.add(new Paragraph("Abogada, ONPAR"));

		}
		catch (DocumentException dex)
		{
			baosPDF.reset();
			throw dex; 
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