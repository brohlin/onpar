import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;
import java.util.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.awt.Color;
import java.sql.*;
import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class EntrevistaSocial extends HttpServlet
{
	
	public EntrevistaSocial()
	{
		super();
	}

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
			doc.addTitle("Entrevista General/Social del Solicitante.");
			doc.addKeywords("pdf, itext, Java, open source, http");
			
			doc.setPageSize(PageSize.LEGAL);
			HeaderFooter footer = new HeaderFooter(new Phrase("Page ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))), true);
			
			footer.setAlignment(1);
			doc.setFooter(footer);
		
			doc.open();
			doc.add(mTableHeader);
			
			Paragraph mParagraph1 = new Paragraph("MINSTERIO DE GOBIERNO Y JUSTICIA", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0)));
			mParagraph1.setAlignment(1);
			doc.add(mParagraph1);
		
			Paragraph mParagraph2 = new Paragraph("Oficina Nacional Para La Atención de Refugiados");
			mParagraph2.setAlignment(1);
			doc.add(mParagraph2);
			
			Paragraph mParagraph3 = new Paragraph("Programa de Atención de Casos");
			mParagraph3.setAlignment(1);
			doc.add(mParagraph3);
			
			Paragraph mParagraph4 = new Paragraph("Departamento Psicosocial");
			mParagraph4.setAlignment(1);
			doc.add(mParagraph4);
			
			Paragraph mParagraph5 = new Paragraph("ENTREVISTA GENERAL");
			mParagraph5.setAlignment(1);
			doc.add(mParagraph5);
			
			doc.add(new Paragraph(" "));	
			
			doc.add(new Paragraph("I. DATOS GENERALES:"));
			
			doc.add(new Phrase("Nombre: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_pre_segundo_nombre") + " " +  session.getAttribute("temp_solicitante_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_pre_apellido_materno"), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);			

			doc.add(new Phrase("Fecha de Entrevista: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_entrevista_social").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);				

			doc.add(new Phrase("Edad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_edad").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Estado Civil: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_estatus_civil_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);				

			doc.add(new Phrase("Pasaporte: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_identificacion1").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Documento de identidad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_identificacion2").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Nacionalidad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_nacionalidad_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Fecha de nacimiento: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_de_nacimiento").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Escolaridad: "));
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("    Nivel Primario: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_educ_nivel_primario").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("    Nivel Secundario: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_educ_nivel_secundario").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("    Nivel Universitario: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_educ_universitario").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("    Otros: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_educ_otros").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));						
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Religión: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_religion_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Dirección en su país de origen: "));
			//doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_direccion_en_pais_de_origen").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Profesión (a que se dedicaba) en su país de origen: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_ocup_pais_de_origen").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("Lugar de trabajo: "));
			//doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_lugar_de_trabajo").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("Fecha de salida de su país de origen: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_de_salida_origen").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("Ruta utilizada para llegar a Panamá: "));
			doc.add(Chunk.NEWLINE);
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_ruta_de_llegada").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Fecha de entrada a Panamá: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_llegada_panama").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
						
					
			doc.add(new Phrase("Fecha de llegada a ONPAR: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_fecha_solicitud_onpar").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Teléfonos: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_telefono1") + " / " + session.getAttribute("temp_solicitante_pre_telefono2"), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Dirección actual: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_pre_direccion_actual").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
					
			
			doc.add(new Phrase("Estatus: "));
			doc.add(new Chunk("Solicitante de admisión a trámite", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
						
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("II. MOTIVO DE LA ATENCIÓN:"));
			doc.add(new Paragraph("Solicitud de admisión a trámite como solicitante de refugio"));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("III. ANTECEDENTES:"));
			doc.add(new Paragraph("Relato de la situación que motivó la salida de su país de origen"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qiii").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));
						
			doc.add(new Paragraph("IV. COMPOSICIÓN FAMILIAR:"));
			doc.add(new Paragraph("1. Grupo familiar en su país de origen:"));

			try {
				Table tab2 = getFamilyMembersPaisDeOrigen(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println("Exception at line 422 or EntrevistaSocial");
			}			
			
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("2. Grupo familiar que le acompaña o que reside en Panamá:"));

			try {
				Table tab2 = getFamilyMembersPanama(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println("Exception at line 422 or EntrevistaSocial");
			} 			
			
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("V. ANTECEDENTES SOCIALES:"));
			doc.add(new Paragraph("1. Económicos:"));
			doc.add(new Paragraph("1.1 Cómo era su situación económica en su país de origen:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv11").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("1.2 Ingreso laboral en su país de origen:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv12").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("1.3 Ingreso labora en Panamá y a que se dedica actualmente:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv13").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("1.4 Aspectos económicos relevantes del caso:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv14").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("2. Habitaciones:"));
			doc.add(new Paragraph("2.1 Condiciones de la vivienda fmiliar en su país de origen:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv21").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("2.2 Condiciones habitacionales actuales:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv22").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("2.3 Aspectos habitacionales relevantes en el caso:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv23").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("3. Educativos:"));
			doc.add(new Paragraph("3.1 Condición educativa de los miembros menores en su país de origen:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv31").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("3.2 Condición educativa de los miembros menores en Panamá:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv32").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("3.3 Aspectos educativos relevantes en el caso:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv33").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("4. Salud"));
			doc.add(new Paragraph("4.1 Algún miembro de su familia presenta discapacidad:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv41").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("4.2 Antecedentes de salud de los solicitantes:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv42").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("4.3 Condición de salud actual:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qv43").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("VI. PROTECCIÓN:"));
			doc.add(new Paragraph("1. Causas que lo mmotivaron a buscar refugio:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvi1").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("2. Acciones de busqueda de protección realizadas en su país de origen:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvi2").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("3. Reubicación en su país de origen o de residencia (desplazamientos):"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvi3").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("4. Tiene usted planes de permanecer en Panamá o viajar a otro país:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvi4").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("5. Documentos que presenta:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvi5").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("VII. ANALISIS DE TRABAJADOR SOCIAL:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qvii").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));
			
			
			doc.add(new Paragraph("VIII. RECOMENDACIONES DEL DEPARTAMENTO:"));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_pre_soc_qviii").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 0))));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE, new java.awt.Color(0, 0, 0))));
			doc.add(new Paragraph("Departamento Psicosocial"));
			doc.add(new Paragraph("ONPAR"));
			
			
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
	 
	private Table getFamilyMembersPanama(final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select format(id,'0'), format(solicitante_id,'0'), ifnull(nombre,''), ifnull(format(edad,'0'),''), ifnull(parentesco_lkup,''), ifnull(ubicacion,''), ifnull(pais_lkup,''), ifnull(ocupacion,'') from familia where solicitante_id = ? and pais_lkup='Panamá'";

			Table tab = null;
			
			try
			{
				tab = new Table(6 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			// tab.setBorderWidth(0);
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre"));
			tab.addCell(new Cell("Edad"));
			tab.addCell(new Cell("Parentesco"));
			tab.addCell(new Cell("Ubicación"));
			tab.addCell(new Cell("País"));
			tab.addCell(new Cell("Ocupación"));			
			

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
		
					prest=con.prepareStatement(mQuery);
					prest.setString(1,session2.getAttribute("temp_solicitante_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 

					}
					
					return tab;
			}
			catch(Exception e){
				throw e;
			} finally {
				if(prest != null) { prest.close(); }
				if(rs != null) { rs.close(); }
				if(con != null) { con.close(); }
			}
		
		}

	private Table getFamilyMembersPaisDeOrigen( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select format(id,'0'), format(solicitante_id,'0'), ifnull(nombre,''), ifnull(format(edad,'0'),''), ifnull(parentesco_lkup,''), ifnull(ubicacion,''), ifnull(pais_lkup,''), ifnull(ocupacion,'') from familia where solicitante_id = ? and pais_lkup != 'Panamá'";

			Table tab = null;
			
			try
			{
				tab = new Table(6 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre"));
			tab.addCell(new Cell("Edad"));
			tab.addCell(new Cell("Parentesco"));
			tab.addCell(new Cell("Ubicación"));
			tab.addCell(new Cell("País"));
			tab.addCell(new Cell("Ocupación"));			
			
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
		
					prest=con.prepareStatement(mQuery);
					prest.setString(1,session2.getAttribute("temp_solicitante_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
					}
					
					return tab;
			}
			catch(Exception e){
				throw e;
			} finally {
				if(prest != null) { prest.close(); }
				if(rs != null) { rs.close(); }
				if(con != null) { con.close(); }
			}
		
		}
}