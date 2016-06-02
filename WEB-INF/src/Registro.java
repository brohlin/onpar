import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Locale;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.*;

import com.itextpdf.text.*;
import com.itextpdf.text.Font.*;
import com.itextpdf.text.pdf.*;
import com.lowagie.text.BadElementException;
import org.onpar.utils.*;


public class Registro extends HttpServlet
{
	
	public Registro()
	{
		super();
	}

	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws javax.servlet.ServletException, java.io.IOException
	{
		
		ByteArrayOutputStream baosPDF = null;
		
		try
		{
			baosPDF = generatePDFDocumentBytes(req, this.getServletContext(), 0, 0);
			
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
		} catch (BadElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		final ServletContext ctx, int ALIGN_BOTTOM, int ALIGN_RIGHT)
		throws DocumentException, BadElementException
		
	{	
		Document doc = new Document();
		HttpSession session = req.getSession(true);
		// Font f=new Font(FontFamily.TIMES_ROMAN,50.0f,Font.UNDERLINE,BaseColor.RED);
		Font fBold=new Font(FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.BLACK);
		Font fNormalBlack =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLACK);
		Font fNormal =new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.BLUE);


		
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
		_p.add(new Phrase("Oficina Nacional par la Atención Refugiados", fNormalBlack));
		
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
	        HeaderFooterPageEvent event = new HeaderFooterPageEvent();
	        docWriter.setPageEvent(event);
			
			doc.addAuthor(this.getClass().getName());
			doc.addCreationDate();
			doc.addProducer();
			doc.addCreator(this.getClass().getName());
			doc.addTitle("Registro de Solicitud ONPAR");
			doc.addKeywords("pdf, itext, Java, open source, http");
			
			doc.setPageSize(PageSize.LETTER);
		
			doc.open();
			doc.add(tab);
			
			
			doc.add(new Paragraph(""));		
			doc.add(Chunk.NEWLINE);
			doc.add(Chunk.NEWLINE);
			
			Paragraph mParagraph0 = new Paragraph("REPUBLICA DE PANAMÁ", fBold);
			mParagraph0.setAlignment(1);
			doc.add(mParagraph0);
			
			
			Paragraph mParagraph1 = new Paragraph("MINSTERIO DE GOBIERNO", fBold);
			mParagraph1.setAlignment(1);
			doc.add(mParagraph1);
		
			
			doc.add(new Paragraph(""));
			doc.add(Chunk.NEWLINE);	
			
						
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph("RECIBO DE REGISTRO", fBold));

			try {
				String _fecha_de_solicitud_onpar = session.getAttribute("temp_solicitante_v2_pre_fecha_solicitud_onpar").toString();
				SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dt1 = df1.parse(_fecha_de_solicitud_onpar);			
				SimpleDateFormat sf1 = new SimpleDateFormat("dd-MMM-yyyy", new Locale("es","ar"));
				
				doc.add(new Phrase("Fecha de solicitud ONPAR: ")); 
				doc.add(new Chunk(sf1.format(dt1), fNormal));
				doc.add(Chunk.NEWLINE);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			doc.add(new Phrase("Número de caso: ")); 
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_id").toString(), fNormal));
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("Nombre: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_primer_nombre") + " " + session.getAttribute("temp_solicitante_v2_pre_apellido_paterno") + " " +  session.getAttribute("temp_solicitante_v2_pre_apellido_materno"), fNormal));			
			doc.add(Chunk.NEWLINE);			

			doc.add(new Phrase("Dirección actual: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_direccion_actual").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	
			
			doc.add(new Phrase("Teléfono: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_telefono1").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);				
			
			try {
				String _pre_fecha_de_nacimiento = session.getAttribute("temp_solicitante_v2_pre_fecha_de_nacimiento").toString();
				SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dt2 = df2.parse(_pre_fecha_de_nacimiento);			
				SimpleDateFormat sf2 = new SimpleDateFormat("dd-MMM-yyyy", new Locale("es","ar"));
				
				doc.add(new Phrase("Fecha de nacimiento: "));
				doc.add(new Chunk(sf2.format(dt2), fNormal));
				doc.add(Chunk.NEWLINE);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			doc.add(new Phrase("Sexo: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_genero_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Nacionalidad: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_nacionalidad_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);		
			
			doc.add(new Phrase("Estatus Civil: "));
			doc.add(new Chunk(session.getAttribute("temp_solicitante_v2_pre_estatus_civil_lkup").toString(), fNormal));			
			doc.add(Chunk.NEWLINE);	

			try {
				String _pre_fecha_llegada_panama = session.getAttribute("temp_solicitante_v2_pre_fecha_llegada_panama").toString();
				SimpleDateFormat df3 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dt3 = df3.parse(_pre_fecha_llegada_panama);			
				SimpleDateFormat sf3 = new SimpleDateFormat("dd-MMM-yyyy", new Locale("es","ar"));
				
				doc.add(new Phrase("Fecha de llegar a Panamá: "));
				doc.add(new Chunk(sf3.format(dt3), fNormal));
				doc.add(Chunk.NEWLINE);	
			} catch (Exception e) {
				e.printStackTrace();
			}		

 					
			doc.add(Chunk.NEWLINE);	
			doc.add(Chunk.NEWLINE);
			
			doc.add(new Paragraph("ENTREVISTA PROGRAMADA", fBold));
			
			try {
				String _entrevista_programada = session.getAttribute("temp_solicitante_v2_entrevista_programada").toString();
				SimpleDateFormat df4 = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dt4 = df4.parse(_entrevista_programada);			
				SimpleDateFormat sf4 = new SimpleDateFormat("dd-MMM-yyyy", new Locale("es","ar"));
				
				doc.add(new Phrase("Fecha de la entrevista: "));
				doc.add(new Chunk(sf4.format(dt4), fNormal));
				doc.add(Chunk.NEWLINE);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			doc.add(new Phrase("Hora: "));
			doc.add(new Chunk("8:00 AM", fNormal));			
			doc.add(Chunk.NEWLINE);				

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
	 
}