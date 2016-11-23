import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.*;

import com.itextpdf.text.*;
import com.itextpdf.text.Font.*;
import com.itextpdf.text.pdf.*;
import org.onpar.utils.*;

public class EntrevistaSocial_v2 extends HttpServlet
{
	
	Font fBold=new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
	Font fNormalBlack =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
	Font fNormal =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);
	Font fUnderline =new Font(FontFamily.HELVETICA, 12, Font.UNDERLINE, BaseColor.BLACK);
	
	public EntrevistaSocial_v2()
	{
		super();
		
	}

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		
	
		// Set standard HTTP/1.1 no-cache headers.
		resp.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");

		// Set standard HTTP/1.0 no-cache header.
		resp.setHeader("Pragma", "no-cache");
		
		ByteArrayOutputStream baosPDF = null;
		
		try
		{
			baosPDF = generatePDFDocumentBytes(req, this.getServletContext());
			
			StringBuffer sbFilename = new StringBuffer();
			sbFilename.append("filename_");
			sbFilename.append(System.currentTimeMillis());
			sbFilename.append(".pdf");

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
			doc.addTitle("Entrevista General/Social del Solicitante.");
			doc.addKeywords("pdf, itext, Java, open source, http");
			
			doc.setPageSize(PageSize.LEGAL);

		
			doc.open();
			doc.add(tab);
			
			// Paragraph mParagraph1 = new Paragraph("Oficina Nacional Para La Atención de Refugiados (ONPAR)", fBold);
			// mParagraph1.setAlignment(1);
			// doc.add(mParagraph1);
			
			doc.add(new Paragraph(""));		
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
		
			Paragraph mParagraph2 = new Paragraph("DEPARTAMENTO DE SEVICIO SOCIAL", fBold);
			mParagraph2.setAlignment(1);
			doc.add(mParagraph2);
			
			Paragraph mParagraph3 = new Paragraph("ENTREVISTA SOCIAL", fBold);
			mParagraph3.setAlignment(1);
			doc.add(mParagraph3);
			
			
			doc.add(new Paragraph(" "));	
			
			doc.add(new Paragraph(" "));
			doc.add(new Phrase("FECHA DE LA ENTREVISTA:  ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_fecha_entrevista_social").toString(), fNormal));
			doc.add(Chunk.NEWLINE);	

			doc.add(new Paragraph(" "));	

			
			doc.add(new Paragraph("A. DATOS GENERALES",fBold));
			doc.add(new Phrase("NÚMERO DE CASO:  ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_id").toString(), fNormal));
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("NOMBRE:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_v2_pre_apellido_materno"), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("FECHA DE NACIMIENTO:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);		
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("RELIGIÓN:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_religion_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("NACIONALIDAD:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_nacionalidad_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("PASAPORTE:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_pasaporte").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("DOCUMENTO DE IDENTIDAD:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_otros_documentos").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);		
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("ESTADO CIVIL:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("TELEFONO DE PANAMÁ:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_telefono1").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			
			doc.add(new Phrase("DIRECCIÓN EN PANAMÁ:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_direccion_actual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("FECHA DE LLEGADA A PANAMÁ:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("FECHA DE LLEGADA A ONPAR:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("OCUPACION EN SU PAIS DE ORIGEN:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ocu_puesto").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	



			doc.add(new Phrase("NIVEL DE ESTUDIO:  "));
			doc.add(Chunk.NEWLINE);	

			
			try {
				PdfPTable tab1 = getEduc(req, this.getServletContext());
				doc.add(tab1);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	
			

			doc.add(new Phrase("PROFESIÓN:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ocup_pais_de_origen").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("HABILIDADES:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_habilidades").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	

			doc.add(new Phrase("COMO ESTA SUBSISTIENDO EN PANAMÁ:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_ocup_pais_de_origen").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);	


					
						
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("B. NUCLEO FAMILIAR BASICO:  ", fBold));
			doc.add(new Paragraph("GRUPO FAMILIAR EN SU PAIS DE ORIGEN"));
			doc.add(Chunk.NEWLINE);

			
			try {
				PdfPTable tab2 = getFamilyMembersPaisDeOrigen(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println("Exception at line 422 or EntrevistaSocial");
			}			
			
						
			doc.add(new Paragraph(" "));
			
			doc.add(new Paragraph("FAMILIARES QUE LE ACOMPAÑAN EN PANAMÁ"));
			doc.add(Chunk.NEWLINE);

			
			try {
				PdfPTable tab3 = getFamilyMembersPanama(req, this.getServletContext());
				doc.add(tab3);
			} catch (Exception ex) {
				System.out.println("Exception at line 422 or EntrevistaSocial");
			}	

			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("C. SITUACIÓN ECONOMICA:  ", fBold));
			doc.add(new Phrase("INGRESA QUE PERCIBE EN PANAMÁ:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_ingreso_en_pa").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("INGRESA QUE PERCIBIA EN PAIS DE ORIGEN:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_ingreso_en_pais_de_origen").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);				
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("CONDICIÓN DE LA VIVENDA ACTUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_condicion_de_vivienda_actual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);		
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("D. CONDICIONES DE SALUD:  ", fBold));
			doc.add(new Phrase("EMBARAZO:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_embarazo").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("DISCAPACIDAD:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_discapacidad").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("CUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_discapacidad_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("PADECE DE ALGUNA ENFERMEDAD:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_enfermedad").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("CUAL"));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_enfermedad_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("DEPENDE DE ALGUN MEDICAMENTO:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_medicamento").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph("CUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_medicamento_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("ES ALERGICO(A) A ALGUN MEDICAMENTO:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_alergica_a_medicamento").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("CUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_alergica_a_medicamento_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Phrase("HA SIDO OPERADO:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_ha_sido_operado").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("DE QUE:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_operado_de_que").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph("EN SU CUADRO FAMILIAR TIENE ALGUN MIEMBRO CON DISCAPACIDAD O ALGUNA ENFERMEDAD:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_miembro_de_fam_con_discapacidad_o_enfermedad").toString(), fNormal));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			
			doc.add(new Phrase("CAUSA QUE LE MOTIVARON BUSCAR PROTECCION INTERNACIONAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_motivo").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);

			doc.add(new Paragraph("CUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_motivo_otro_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Phrase("PORQUE:  "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_motivo_porque").toString(), fNormal));
			doc.add(Chunk.NEWLINE);			
			doc.add(Chunk.NEWLINE);			
			
			doc.add(new Phrase("CUAL:  "));			
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_motivo_otro_cual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);

			doc.add(new Paragraph("PREGUNTAS ADICIONALES:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_social_otra_pregunta").toString(), fNormal));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));			
			
			doc.add(new Paragraph("QUISIERA AGREGAR OTRA INFORMACION:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_otra_informacion").toString(), fNormal));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph(" "));
			
			
			doc.add(new Paragraph("RECOMENDACIONES POR EL DEPARTAMENTO DE TRABAJO SOCIAL:  "));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_recomendaciones").toString(), fNormal));			
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph(" "));			
			doc.add(new Paragraph("                                                                ", fUnderline));
			doc.add(new Paragraph("Solicitante"));
			doc.add(new Paragraph(" "));
			doc.add(new Paragraph("                                                                ", fUnderline));
			doc.add(new Paragraph(session.getAttribute("temp_solicitante_v2_social_username").toString(), fNormal));
			doc.add(new Paragraph("Entrevistador de ONPAR"));
			
			
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
	 
	private PdfPTable getFamilyMembersPaisDeOrigen( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
	{	
	 	HttpSession session2 = req2.getSession(true);
		String mQuery = "SELECT ifnull(nombre,''), " +
	    "   ifnull(fecha_de_nacimiento,''), " +
	    "   ifnull(parentesco_lkup,''), " +
	    "   ifnull(ocupacion,''), " +
	    "   ifnull(sexo,''), " +
	    "   ifnull(nacionalidad,''), " +
	    "   ifnull(pais_lkup,'') " +
	    " FROM familia " +
	    " where solicitante_id=? " +
		" and pais_lkup!='Panamá' ";			
		
		
		PdfPTable tab = null;

		
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

				int rows=1;
				while(rs.next())
				{
					rows++;
				}
				
				int cells=rows*7;
				
				System.out.println("Rows = " + rows);
				System.out.println("Cells = " + cells);
				
				try
				{
					tab = new PdfPTable(7 /* columns */);
					
				}
				catch (Exception ex)
				{
					throw new RuntimeException(ex);
				}
				
				tab.setWidthPercentage(100);
				tab.getDefaultCell().setBorder(0);
				tab.getDefaultCell().setBorderWidth(1.0f);
				tab.getDefaultCell().setPadding(2);

	
				
				tab.addCell(new Phrase("Nombre",fNormalBlack));
				tab.addCell(new Phrase("Fecha de nacimiento",fNormalBlack));
				tab.addCell(new Phrase("Parentesco",fNormalBlack));
				tab.addCell(new Phrase("Ocupación",fNormalBlack));											
				tab.addCell(new Phrase("Sexo",fNormalBlack));											
				tab.addCell(new Phrase("Nacionalidad",fNormalBlack));											
				tab.addCell(new Phrase("País",fNormalBlack));											
				
				rs.beforeFirst();
				
				while(rs.next())
				{
					
					tab.addCell(new Phrase(rs.getString(1), fNormal)); 
					tab.addCell(new Phrase(rs.getString(2), fNormal)); 
					tab.addCell(new Phrase(rs.getString(3), fNormal)); 
					tab.addCell(new Phrase(rs.getString(4), fNormal));
					tab.addCell(new Phrase(rs.getString(5), fNormal));
					tab.addCell(new Phrase(rs.getString(6), fNormal));
					tab.addCell(new Phrase(rs.getString(7), fNormal));

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
	
	private PdfPTable getEduc( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "select " +
					        "ifnull(pre_edu_nombre,''), ifnull(pre_edu_lugar,''), ifnull(pre_edu_desde,''), ifnull(pre_edu_hasta,''), ifnull(pre_edu_titulo,''), " +
		 	                "ifnull(pre_edu_nombre2,''), ifnull(pre_edu_lugar2,''), ifnull(pre_edu_desde2,''), ifnull(pre_edu_hasta2,''), ifnull(pre_edu_titulo2,'') " +
					        "from vw_solicitante where id=?";

			PdfPTable tab = null;
			
			try
			{
				tab = new PdfPTable(5 /* columns */);
			}
			catch (Exception ex)
			{
				throw new RuntimeException(ex);
			}
			
			// tab.setBorderWidth(1.0f);
			// tab.setPadding(2);
			// tab.setSpacing(2);
			
			
			tab.setWidthPercentage(100);
			tab.getDefaultCell().setBorder(0);
			tab.getDefaultCell().setBorderWidth(1.0f);
			tab.getDefaultCell().setPadding(2);
	
			tab.addCell(new Phrase("Nombre", fNormalBlack));
			tab.addCell(new Phrase("Lugar", fNormalBlack));
			tab.addCell(new Phrase("Desde", fNormalBlack));
			tab.addCell(new Phrase("Hasta", fNormalBlack));
			tab.addCell(new Phrase("Título", fNormalBlack));
		
			
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
						tab.addCell(new Phrase(rs.getString(1), fNormal)); 
						tab.addCell(new Phrase(rs.getString(2), fNormal)); 
						tab.addCell(new Phrase(rs.getString(3), fNormal)); 
						tab.addCell(new Phrase(rs.getString(4), fNormal)); 
						tab.addCell(new Phrase(rs.getString(5), fNormal)); 
						tab.addCell(new Phrase(rs.getString(6), fNormal)); 
						tab.addCell(new Phrase(rs.getString(7), fNormal)); 
						tab.addCell(new Phrase(rs.getString(8), fNormal)); 
						tab.addCell(new Phrase(rs.getString(9), fNormal)); 
						tab.addCell(new Phrase(rs.getString(10), fNormal)); 
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

	private PdfPTable getFamilyMembersPanama( final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception
			
		{	
		 	HttpSession session2 = req2.getSession(true);
			String mQuery = "SELECT ifnull(nombre,''), " +
				    "   ifnull(fecha_de_nacimiento,''), " +
				    "   ifnull(parentesco_lkup,''), " +
				    "   ifnull(ocupacion,''), " +
				    "   ifnull(sexo,''), " +
				    "   ifnull(nacionalidad,''), " +
				    "   ifnull(pais_lkup,'') " +
		    " FROM familia " +
		    " where solicitante_id=? " +
			" and pais_lkup='Panamá' ";			
			
			
			PdfPTable tab = null;
	
			
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

					int rows=1;
					while(rs.next())
					{
						rows++;
					}
					
					int cells=rows*7;
					
					System.out.println("Rows = " + rows);
					System.out.println("Cells = " + cells);
					
					try
					{
						tab = new PdfPTable(7 /* columns */);
						
					}
					catch (Exception ex)
					{
						throw new RuntimeException(ex);
					}
					
					tab.setWidthPercentage(100);
					tab.getDefaultCell().setBorder(0);
					tab.getDefaultCell().setBorderWidth(1.0f);
					tab.getDefaultCell().setPadding(2);
			
					tab.addCell(new Phrase("Nombre", fNormalBlack));
					tab.addCell(new Phrase("Fecha de nacimiento", fNormalBlack));
					tab.addCell(new Phrase("Parentesco", fNormalBlack));
					tab.addCell(new Phrase("Ocupación", fNormalBlack));
					tab.addCell(new Phrase("Sexo", fNormalBlack));	
					tab.addCell(new Phrase("Nacionalidad", fNormalBlack));	
					tab.addCell(new Phrase("País", fNormalBlack));	
					
					rs.beforeFirst();
					
					while(rs.next())
					{	
						tab.addCell(new Phrase(rs.getString(1), fNormal)); 
						tab.addCell(new Phrase(rs.getString(2), fNormal)); 
						tab.addCell(new Phrase(rs.getString(3), fNormal)); 
						tab.addCell(new Phrase(rs.getString(4), fNormal));
						tab.addCell(new Phrase(rs.getString(5), fNormal));
						tab.addCell(new Phrase(rs.getString(6), fNormal));
						tab.addCell(new Phrase(rs.getString(7), fNormal));
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