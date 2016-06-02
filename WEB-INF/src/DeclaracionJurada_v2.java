import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.*;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;

public class DeclaracionJurada_v2 extends HttpServlet
{
	
	public DeclaracionJurada_v2()
	{
		super();
	}

	
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
			List list = new List(false, 20);
			
			docWriter = PdfWriter.getInstance(doc, baosPDF);
			
			doc.addAuthor(this.getClass().getName());
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(this.getClass().getName());
			doc.addTitle("Declaración Jurada del Solicitante.");
			doc.addKeywords("pdf, itext, Java, open source, http");
			
			doc.setPageSize(PageSize.LEGAL);
			HeaderFooter footer = new HeaderFooter(new Phrase("Page ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))), true);
			
			footer.setAlignment(1);
			doc.setFooter(footer);
		
			doc.open();
			doc.add(mTableHeader);
			Paragraph mParagraph0 = new Paragraph("REPUBLICA DE PANAMÁ", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0)));
			mParagraph0.setAlignment(1);
			doc.add(mParagraph0);
			
			
			Paragraph mParagraph1 = new Paragraph("MINSTERIO DE GOBIERNO", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0)));
			mParagraph1.setAlignment(1);
			doc.add(mParagraph1);
		
			Paragraph mParagraph2 = new Paragraph("Oficina Nacional Para La Atención de Refugiados");
			mParagraph2.setAlignment(1);
			doc.add(mParagraph2);
			doc.add(new Paragraph(""));
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Paragraph(""));
			Paragraph mParagraph3 = new Paragraph("FORMULARIO DE SOLICITUD DE LA CONDICIÓN DE REFUGIADO", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0)));
			mParagraph3.setAlignment(1);			
			doc.add(mParagraph3);
			
			list.add(new ListItem("El objectivo de este documento es reunir la infromación necesaria para demostrar los hechos en los que Ud. sustenta su solicitud de la condición de refugiado."));
			list.add(new ListItem("Favor de llenar cada sección de la declaración jurada para solicitar la condición de refugiado en Panamá. No deje ninguana sección en blanco."));
			list.add(new ListItem("Cualquier información o documentación fraudulenta o falsa proporcionada por una persona solicitante durante su etapa ante la ONPAR, podrá resultar en la no admisión a trámite de su caso. Si no entiende una pregunta en la solicitud, favor de pedir la asistencia de un abogado de la ONPAR. Si no recuerda la respuesta a una pregunta, responda \"no me acuerdo.\" Si no conoce la respuesta, responda \"no sé.\" No intente responder a preguntas para las que no tiene respuesta (procure no dejar espacios en blanco)."));
			list.add(new ListItem("Ud. tiene el derecho de llevar este formulario a su casa o a la oficina de su abogado para prepararlo y entregarlo cuando esta completo."));
			doc.add(list);
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph("I. Datos personales", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			doc.add(new Phrase("Número de caso: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_id").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);	
			
			
			doc.add(new Phrase("Nombre: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_v2_pre_apellido_materno"), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);			

			doc.add(new Phrase("Otros nombres que Ud. ha utilizado: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otros_nombres").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Fecha de nacimiento: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("Lugar de nacimiento (ciudad, país): "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ciudad_de_nacimiento").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Sexo: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_genero_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Nacionalidad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_nacionalidad_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Ud. tiene nacionalidad, residencia, u otro estatus migratoria en otro país? "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Si Ud. respondió si, favor de indicar los países donde usted tiene tal estaus: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otro_estatus_migratoria_paises").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Grupo étnico o tribu: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_etnico_o_tribu").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Religión: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_religion_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Primer idioma: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_idioma_lkup").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);			
			
			doc.add(new Phrase("Otros idiomas que Ud. habla: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otros_idiomas").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Dirección actual: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_direccion_actual").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Número de teléfono: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_telefono1").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("País de pasaporte y número de pasaporte: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pasaporte").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);					
			
			doc.add(new Phrase("Otros documentos de identificación (tipo, país, y número): "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otros_documentos").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);	
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("II. Educación (nivel más alto alcanzado)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getEduc(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("III. Ocupación (más reciente en el país de origen)", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getOcup(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("IV. Indica cualquier tipo de servicio militar", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getMil(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("V. Indica su afiliación, o inscrito en, cualquier tipo de organización", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getOrg(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("VI. Ud. ha estado arrestado o detenido alguna vez", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getArrest(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("VII. Ingrese la información de todos sus familiares y dependientes", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			try {
				Table tab2 = getFamilyMembers(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("VIII. Detalles del viaje", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));

			
			try {
				Table tab2 = getDetallesViaje(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("IX. Declaración escrita", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			doc.add(Chunk.NEWLINE);		
			doc.add(new Phrase("Al responder a las siguientes preguntas, usted debe contamos todo sobre por qué cree usted que necesita protección como refugiado. Debe darnos todos los detalles posibles, incluyendo la fecha en que ocurrieron los acontecimientos pertinentes. Es importante que usted brinde respuestas verdaderas y completas a estas preguntas. Si necesita más espacio para describir todos los detalles relvantes, favor añada más páginas."));
			doc.add(Chunk.NEWLINE);		
			doc.add(Chunk.NEWLINE);	
			doc.add(new Paragraph("a. Porque salió de su país de origen, nacionalidad, o residencia habitual?"));
			doc.add(Chunk.NEWLINE);	
			doc.add(new Phrase(session.getAttribute("temp_solicitante_v2_pre_fundado_temor").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(Chunk.NEWLINE);		
			doc.add(Chunk.NEWLINE);	
			doc.add(new Paragraph("b. ¿Qué cree que le pasaría a usted, o a miembros de su familia, si volviera a su país de nacionalidad o de residencia habitual? Por favor, explique con el mayor detalle posible."));
			doc.add(Chunk.NEWLINE);	
			doc.add(new Phrase(session.getAttribute("temp_solicitante_v2_pre_fundado_temor_partb").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("X. Sexo del entrevistador / idioma en que se realizará le entrevista", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			doc.add(new Phrase("Indicar si tiene alguna preferencia, en cuanto a ser entrevistado/a por un/a funcionario/a o intérprete?"));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pref").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Si su respuesta es si, precisar el sexo de la persona funcionaria o intérprete de su preferencia: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pref_sexo").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("¿Qué idioma prefiere para sus entrevistas en la ONPAR? "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pref_idioma").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));			
			

			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("Delcaro que la información que he proporcionado en este formulario está completa y al día, e incluye todos los detalles."));
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("Entiendo que si he proporcionado información falsa o tendenciosa, mi solicitud de la condición de refugiado podrá ser rechazada o, si he sido reconocido/a como refugiado/a, ese reconocimiento podrá ser cancelado."));
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("Me comprometo a informar a la ONPAR de cualquier cambio significativo en mis circunstancias mientras se está considerando mi solicitud, incluyendo cualquier cambio en mi dirección y datos de contacto, la llegada o la salida de miembros de mi hogar, o cualquier otro cambio en la composición de mi hogar."));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Nombre del solicitante: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_v2_pre_apellido_materno"), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Firma del solicitante: ______________________________________________________"));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Fecha (día/mes/año): ______________________________________________________"));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Preparado por (solicitante o nombre de su representante legal u otro): "));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);			
			doc.add(new Chunk("_______________________________________________________________________________"));

			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			doc.add(new Paragraph("Para uso interno de la ONPAR", FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD, new java.awt.Color(0, 0, 0))));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Nombre del funcionario de la ONPAR que recibió la declaración jurada: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ui_nombre_recibio").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Sello de recibido de la ONPAR: ______________________________________________________"));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			doc.add(new Phrase("Número de caso: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_id").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);			
			doc.add(new Phrase("Fecha de recibido: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ui_fecha_recibido").toString(), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

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
	 
	private Table getFamilyMembers( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "SELECT 'Madre', " +
		    "   pre_fam_madre_nombre, " +
		    "   pre_fam_madre_lugar, " +
		    "   pre_fam_madre_nombre, " +
		    "   'Padre', " +
		    "   pre_fam_padre_dob, " +
		    "   pre_fam_padre_lugar, " +
			"   pre_fam_padre_nombre, " +
			"	'Esposo/a', " +
		    "   pre_fam_spouse_dob, " +
		    "   pre_fam_spouse_lugar, " +
			"	pre_fam_spouse_nombre, " +
			"	'Hijo/a', " +
			"	pre_fam_child1_dob, " +
			"	pre_fam_child1_lugar, " +
			"	pre_fam_child1_nombre, " +
			"	'Hijo/a', " +
			"	pre_fam_child2_dob, " +
			"	pre_fam_child2_lugar, " +
			"	pre_fam_child2_nombre, " +
			"	'Hijo/a', " +
			"	pre_fam_child3_dob, " +
			"	pre_fam_child3_lugar, " +
			"	pre_fam_child3_nombre, " +
			"	'Hijo/a', " +
			"	pre_fam_child4_dob, " +
			"	pre_fam_child4_lugar, " +
			"	pre_fam_child4_nombre, " +
			"	'Hijo/a', " +
			"	pre_fam_child5_dob, " +
			"	pre_fam_child5_lugar, " +
			"	pre_fam_child5_nombre, " +
			"	'Hermano/a', " +
			"	pre_fam_sibling1_dob, " +
			"	pre_fam_sibling1_lugar, " +
			"	pre_fam_sibling1_nombre, " +
			"	'Hermano/a', " +
			"	pre_fam_sibling2_dob, " +
			"	pre_fam_sibling2_lugar, " +
			"	pre_fam_sibling2_nombre, " +
			"	'Hermano/a', " +
			"	pre_fam_sibling3_dob, " +
			"	pre_fam_sibling3_lugar, " +
			"	pre_fam_sibling3_nombre, " +
			"	'Hermano/a', " +
			"	pre_fam_sibling4_dob, " +
			"	pre_fam_sibling4_lugar, " +
			"	pre_fam_sibling4_nombre, " +
			"	'Hermano/a', " +
			"	pre_fam_sibling5_dob, " +
			"	pre_fam_sibling5_lugar, " +
			"	pre_fam_sibling5_nombre, " +
			"	pre_fam_otra1_relacion, " +
			"	pre_fam_otra1_nombre, " +
			"	pre_fam_otra1_dob, " +
			"	pre_fam_otra1_lugar, " +
			"	pre_fam_otra2_relacion, " +
			"	pre_fam_otra2_nombre, " +
			"	pre_fam_otra2_dob, " +
			"	pre_fam_otra2_lugar, " +
			"	pre_fam_otra3_relacion, " +
			"	pre_fam_otra3_nombre, " +
			"	pre_fam_otra3_dob, " +
			"	pre_fam_otra3_lugar " +
		    " FROM vw_solicitante " +
		    " where id=?";			
			
			
			Table tab = null;
			
			try
			{
				tab = new Table(4 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Relación"));
			tab.addCell(new Cell("Nombre"));
			tab.addCell(new Cell("Fecha de nacimiento"));
			tab.addCell(new Cell("Donde se encuentra (ciudad, país)"));
	
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(9), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(10), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(11), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(12), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(13), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(14), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(15), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(16), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(17), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(18), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(19), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(20), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(21), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(22), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(23), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(24), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(25), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(26), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(27), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(28), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(29), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(30), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(31), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(32), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(33), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(34), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(35), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(36), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(37), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(38), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(39), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(40), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(41), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(42), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(43), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(44), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(45), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(46), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(47), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(48), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(49), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(50), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(51), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(52), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(53), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(54), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(55), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(56), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(57), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(58), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(59), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(60), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(61), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(62), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(63), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(64), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 

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
	
	private Table getDetallesViaje( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_viaje1_pais, pre_viaje1_desde, pre_viaje1_hasta, pre_viaje1_medio, " +
		 	                "pre_viaje2_pais, pre_viaje2_desde, pre_viaje2_hasta, pre_viaje2_medio, " +
		 	                "pre_viaje3_pais, pre_viaje3_desde, pre_viaje3_hasta, pre_viaje3_medio, " +
		 	                "pre_viaje4_pais, pre_viaje4_desde, pre_viaje4_hasta, pre_viaje4_medio, " +
		 	                "pre_viaje5_pais, pre_viaje5_desde, pre_viaje5_hasta, pre_viaje5_medio, " +
		 	                "pre_viaje6_pais, pre_viaje6_desde, pre_viaje6_hasta, pre_viaje6_medio " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(4 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("País"));
			tab.addCell(new Cell("Desde"));
			tab.addCell(new Cell("Hasta"));
			tab.addCell(new Cell("Medio"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(9), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(10), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(11), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(12), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(13), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(14), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(15), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(16), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab.addCell(new Phrase(rs.getString(17), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(18), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(19), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(20), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(21), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(22), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(23), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(24), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						

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

	
	private Table getEduc( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_edu_nombre,pre_edu_lugar,pre_edu_desde,pre_edu_hasta, pre_edu_titulo, " +
		 	                "pre_edu_nombre2,pre_edu_lugar2,pre_edu_desde2,pre_edu_hasta2, pre_edu_titulo2 " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(5 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre"));
			tab.addCell(new Cell("Lugar"));
			tab.addCell(new Cell("Desde"));
			tab.addCell(new Cell("Hasta"));
			tab.addCell(new Cell("Título"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(9), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(10), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
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

	private Table getOcup( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_ocu_empleador, pre_ocu_lugar, pre_ocu_desde, pre_ocu_hasta, pre_ocu_puesto " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(5 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre del empleador"));
			tab.addCell(new Cell("Ciudad/País"));
			tab.addCell(new Cell("Desde"));
			tab.addCell(new Cell("Hasta"));
			tab.addCell(new Cell("Nombre del puesto"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
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

	private Table getMil( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_mil_nombre, pre_mil_lugar, pre_mil_desde, pre_mil_hasta, pre_mil_puesto " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(5 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre de la institución"));
			tab.addCell(new Cell("Ciudad/País"));
			tab.addCell(new Cell("Desde"));
			tab.addCell(new Cell("Hasta"));
			tab.addCell(new Cell("Título obtenido"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
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

	private Table getOrg( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_org_nombre, pre_org_lugar, pre_org_desde, pre_org_hasta, pre_org_rol, " +
					        "pre_org_nombre2, pre_org_lugar2, pre_org_desde2, pre_org_hasta2, pre_org_rol2 " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(5 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Nombre de la institución"));
			tab.addCell(new Cell("Ciudad/País"));
			tab.addCell(new Cell("Desde"));
			tab.addCell(new Cell("Hasta"));
			tab.addCell(new Cell("Su rol en la organización"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(9), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(10), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 

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

	private Table getArrest( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "pre_arrest_fecha,pre_arrest_lugar,pre_arrest_delito,pre_arrest_sentencia,pre_arrest_fecha2,pre_arrest_lugar2,pre_arrest_delito2,pre_arrest_sentencia2 " +
					        "from vw_solicitante where id=?";

			Table tab = null;
			
			try
			{
				tab = new Table(4 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw new RuntimeException(ex);
			}
			
			tab.setBorderWidth(1.0f);
			tab.setPadding(2);
			tab.setSpacing(2);
	
			tab.addCell(new Cell("Fecha de arresto o detención"));
			tab.addCell(new Cell("Ciudad/País"));
			tab.addCell(new Cell("Ud. fue condenado por algún delito? Especificar el delito."));
			tab.addCell(new Cell("Indicar la sentencia condenatoria"));
		
			
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
					prest.setString(1,session2.getAttribute("temp_solicitante_v2_id").toString());			
					rs=prest.executeQuery();
					
					while(rs.next())
					{
						tab.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
						tab.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255)))); 
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