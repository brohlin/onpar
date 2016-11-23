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
public class EntrevistaLegalLarga extends HttpServlet
{
	/** 
	* 
	* 
	*/
	
	Font fBold=new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	Font fNormalBlack =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
	Font fNormal =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);
	Font fUnderline =new Font(FontFamily.HELVETICA, 12, Font.UNDERLINE, BaseColor.BLACK);
	
	public EntrevistaLegalLarga()
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
		_p.add(new Phrase("Oficina Nacional Para la Atenci�n Refugiados", fNormalBlack));
		
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
			
			Paragraph mParagraph1 = new Paragraph("REP�BLICA DE PANAM�", fBold);
			mParagraph1.setAlignment(1);
			doc.add(mParagraph1);
		
			Paragraph mParagraph2 = new Paragraph("MINISTERIO DE GOBIERNO");
			mParagraph2.setAlignment(1);
			doc.add(mParagraph2);
			
			Paragraph mParagraph3 = new Paragraph("OFICINA NACIONAL PARA LA ATENCI�N DE REFUGIADOS");
			mParagraph3.setAlignment(1);
			doc.add(mParagraph3);
			
			Paragraph mParagraph4 = new Paragraph("ENTREVISTA DE ELEGIBILIDAD ASESOR�A LEGAL");
			mParagraph4.setAlignment(1);
			doc.add(mParagraph4);
					
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Phrase("N�mero de caso: ")); 
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
			
			doc.add(new Phrase("Direcci�n: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_direccion_actual").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Tel�fono: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_telefono1").toString(), fNormal));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de ingreso a Panam�: ")); 
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
			doc.add(new Paragraph("NOTA: Al solicitante se le explica el procedimiento a seguir, el valor de la declaraci�n " +
								  "jurada y consecuencias en el caso de que falsee, exagere, omita o distorsione los hechos " +
								  "en que sustenta su alegato de persecuci�n. Se le explicaron los recursos a que tiene derecho " +
								  "en caso de que sea admitido a tr�mite y no reconocido por la Comisi�n Nacional de Protecci�n " +
								  "para Refugiados, as� como los derechos y deberes de los solicitantes. El/la entrevistado/a afirma " +
								  "haber comprendido todo lo explicado."));

			doc.add(new Paragraph(" "));	
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Preguntas/Respuestas"));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("1.- �D�nde naci� usted? Y enuncie por favor zona de residencia en su pa�s de origen: Zona Rural o Zona Urbana."));			
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q1").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("2.- �Diga a qu� se dedicaba en su pa�s de origen?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q2").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("3.- �Diga quienes componen su n�cleo familiar?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q3").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("4.- �Diga si tiene familiares en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q4").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("5.- �Que miembros de su n�cleo familiar todav�a permanecen en su pa�s de origen y esperan reunirse con usted?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q5").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("6.- �Que miembros de su familia, y de los que permanecen en su pa�s de origen, dependen de usted econ�micamente?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q6").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("7.- �Con que frecuencia se comunica usted con sus familiares?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q7").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("8.- �Qu� v�a utiliz� para llegar hasta Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q8").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("9.- �Al ingresar al pa�s se anunci� como solicitante de refugio ante alguna autoridad?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q9").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("10.- �Qu� tipo de documentos de identidad personal posee?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q10").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("11.- �Ha hecho usted alg�n tr�mite para regularizar su estatus en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q11").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("12.- �Diga usted si genera alg�n tipo de ingresos en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q12").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("13.- �Diga c�mo sufraga sus gastos aqu� en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q13").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("14.- �Alguna vez ha sido deportado(a)?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q14").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("15.- �Usted u otro miembro de su familia han sido detenidos?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q15").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("16.- �Recibi� en los primeros d�as de su llegada a Panam� alguna ayuda de emergencia?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q16").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("17.- �Que instituci�n, ONGs, u otras le han brindado ayuda y orientaci�n?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q17").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("18.- �Con qui�n viaj� hacia Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q18").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("19.- �Qui�n la trajo a Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q19").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("20.- �Qu� lo/la motivo venir a Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q20").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("21.- �Diga, cuales son las causas o motivos por la cual sale de su pa�s de origen?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q21").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("22.- �Qu� tipo de amenazas recib�a?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q22").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("23.- �Diga si otros miembros de su familia han sido v�ctima de amenazas?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q23").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("24.- �Diga si usted o sus familiares han interpuesto alguna denuncia?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q24").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("25.- �Diga si logr� reubicarse al interno de su pa�s?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q25").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("26.- �Usted tiene alguna idea de qui�n o quienes lo amenazan?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q26").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("27.- �Piensa usted regresar alg�n d�a a su pa�s de origen?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q27").toString(), fNormal));
					
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("28.- �Qu� desea usted de Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q28").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("29.- �Ha visitado otros pa�ses adem�s de Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q29").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("30.- �Por qu� decidi� viajar a Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q30").toString(), fNormal));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("31.- �Desea agregar algo m�s a esta entrevista?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_q31").toString(), fNormal));

			doc.add(new Paragraph(" "));

			doc.add(new Paragraph("PREGUNTAS ADICIONALES:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_legal_otra_pregunta").toString(), fNormal));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Se lee y revisa esta Entrevista de Elegibilidad por ambas partes, con la finalidad que lo manifestado, " +
								  "conste en el expediente y as� concluir con este requisito dentro de esta Etapa de Admisibilidad.", 
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