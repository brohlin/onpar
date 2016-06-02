import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.awt.Color;
import java.net.MalformedURLException;
import java.net.URL;

// import the iText packages
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

/** 
 * 
 *  a servlet that will generate a PDF document
 *  and send the document to the client via the 
 *  ServletOutputStream
 * 
 *  @author Bob Rohlin
 * 
 */
public class EntrevistaLegal extends HttpServlet
{
	/** 
	* 
	* 
	*/
	public EntrevistaLegal()
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
		DocumentException ex = null;
		
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
		int page = 0;
		ByteArrayOutputStream baosPDF = new ByteArrayOutputStream();
		PdfWriter docWriter = null;	
		
		URL img = null;
		URL img2 = null;
		try {
			img = new URL(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + "/onpar/img/mingob_onpar.png");
			img2 = new URL(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + "/onpar/img/mingob.png");
		} catch (MalformedURLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		com.lowagie.text.Image myImgMinGob = null;
		com.lowagie.text.Image myImgMinGob2 = null; 
		try {
			myImgMinGob = com.lowagie.text.Image.getInstance(img);
			myImgMinGob.scalePercent(50);
			myImgMinGob2 = com.lowagie.text.Image.getInstance(img2);
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
			
		Table tab = null;

		try
		{
			tab = new Table(2 /* columns */);
		}
		catch (BadElementException ex)
		{
			throw new RuntimeException(ex);
		}
		
		// tab.setBorderWidth(1.0f);
		// tab.setPadding(5);
		// tab.setSpacing(5);
		tab.setBorder(0);
		
		tab.setWidth(100);
		
		Cell mLeftCell = new Cell();
		mLeftCell.addElement(new Chunk(myImgMinGob, 0, 0));
		mLeftCell.setBorder(0);
		tab.addCell(mLeftCell);
		
		Cell mRightCell = new Cell();
		mRightCell.addElement(new Chunk(myImgMinGob2, 0, 0));
		mRightCell.setHorizontalAlignment("right");
		mRightCell.setVerticalAlignment("bottom");
		mRightCell.setBorder(0);
		tab.addCell(mRightCell);
		
		// Cell mRightCell = new Cell("right");
		// mRightCell.setHorizontalAlignment("right");
		// tab.addCell(mRightCell);
		
		tab.endHeaders();
		Element mTableHeader = (Element) tab;
		
		try
		{
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			
			doc.addAuthor(this.getClass().getName());
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(this.getClass().getName());
			doc.addTitle("Entrevista Legal del Solicitante.");
			
			doc.setPageSize(PageSize.LEGAL);
			HeaderFooter footer = new HeaderFooter(new Phrase("Page ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 0))), true);
			
			footer.setAlignment(1);
			doc.setFooter(footer);
		
			doc.open();
			doc.add(mTableHeader);
			// doc.add(myImgMinGob);
			
			Paragraph mParagraph1 = new Paragraph("REP�BLICA DE PANAM�", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0)));
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
			doc.add(new Phrase("Nombre: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_pre_segundo_nombre") + " " +  session.getAttribute("temp_solicitante_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_pre_apellido_materno"), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Documento de identidad: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_identificacion2").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
				
			doc.add(new Phrase("Pasaporte: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_identificacion1").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Nacionalidad: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_nacionalidad_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Edad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_edad").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
				
			doc.add(new Phrase("Fecha de nacimiento: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_de_nacimiento").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Direcci�n actual: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_direccion_actual").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Tel�fonos: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_telefono1") + " / " + session.getAttribute("temp_solicitante_pre_telefono2").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de entrada a Panam�: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_llegada_panama").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de llegada a ONPAR: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_solicitud_onpar").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("NOTA: Al solicitante se le explica el procedimiento a seguir, el valor de la declaraci�n " +
								  "jurada y consecuencias en el caso de que falsee, exagere, omita o distorsione los hechos " +
								  "en que sustenta su alegato de persecuci�n. Se le explicaron los recursos a que tiene derecho " +
								  "en caso de que sea admitido a tr�mite y no reconocido por la Comisi�n Nacional de Protecci�n " +
								  "para Refugiados, as� como los derechos y deberes de los solicitantes. El entrevistado afirma " +
								  "haber comprendido todo lo explicado."));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Preguntas/Respuestas"));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("1. �Donde naci� usted? Y enuncie por favor zona de residencia en su pa�s de origen: Zona Rurar o Zona Urbana."));			
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q1").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("2. �Diga la entrevistada (a) a qu� se dedicaba en su pa�s de origen? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q2").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("3. �Diga la entrevistada (a) quienes componen su n�cleo familiar?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q3").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("4. �Diga la entrevistada (a) si tiene familiares en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q4").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("5. �Que miembros de su n�cleo familiar tadav�a permanecen en su pa�s de origen y esperan reunirse con usted?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q5").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("6. �Que miembros de su familia, y de los que permanecen en su pa�s de origen, dependen de usted econ�micamente?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q6").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("7. �Con que frecuencia se comunica usted con sus familiares?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q7").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("8. �Qu� v�a utiliz� para llegar hasta Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q8").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("9. �Cual fue el recorrido o ruta de viaje que utiliz� hasta llegar a Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q9").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("10. �Al ingresar al pa�s se anunci� como solicitante de refugio ante alguna autoridad?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q10").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("11. �Qu� tipo de documentos de identidad personal posee?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q11").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("12. �Ha hecho usted alg�n tr�mite para regularizar su estatus en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q12").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("13. �Diga usted si genera alg�n tipo de ingresos en Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q13").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("14. �Alguna vez ha sido deportado (a)?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q14").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("15. �Usted u otro miembro de su familia han sido detenidos?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q15").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("16. �Recibi� en los primeros d�as de su llegada a Panam� alguna ayuda de emergencia?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q16").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("17. �Que instituci�n, ONGs, u otras le han brindado ayuda y orientaci�n?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q17").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("18. �Con qui�n viaj� hacia Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q18").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("19. �Qui�n la trajo a Panam�?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q19").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("20. �Diga la entrevistada, cuales son las causas o motivos por la cual sale de su pa�s de origen? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q20").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("21. �Tiene usted conocimiento de quien o quienes la persiguen?"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q21").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("22. �Piensa usted regresar alg�n d�a a su pa�s? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q22").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("23. �Qu� desea usted de Panam�? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q23").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("24. �Ha visitado otros pa�ses adem�s de Panam�? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q24").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("25. �Por qu� eligi� Panam� para solicitar refugio? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q25").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("26. �Desea agregar algo m�s a esta entrevista? "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_leg_q26").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("Se lee y revisa esta Entrevista de Elegibilidad por ambas partes, con la finalidad que lo manifestado, " +
								  "conste en el expediente y as� concluir con este requisito dentro de esta Etapa de Admisibilidad.", 
								  FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			doc.add(new Paragraph("FUNDAMENTO LEGAL. Decreto Ejecutivo No. 23 de 10 de febrero de 1998, capitula VI, articulo 35, " +
								  "numeral 3.", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			
			
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new java.awt.Color(0, 0, 0))));
			doc.add(new Paragraph("Solicitante"));

			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new java.awt.Color(0, 0, 0))));
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