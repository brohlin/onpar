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

public class Report extends HttpServlet
{

	public Report()
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
			if (baosPDF != null)
			{
				baosPDF.reset();
			}
		}

	}

	protected ByteArrayOutputStream generatePDFDocumentBytes(
		final HttpServletRequest req,
		final ServletContext ctx)
		throws BadElementException, DocumentException

	{
		Document doc = new Document();

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
		} catch (BadElementException bad) {
			// TODO Auto-generated catch block
			System.out.println("BadElementException");
			bad.printStackTrace();
		}

		Table tab = null;

		try
		{
			tab = new Table(2 /* columns */);
		} catch (BadElementException ex)
		{
			throw ex;
		}

		// tab.setBorderWidth(1.0f);
		// tab.setPadding(5);
		// tab.setSpacing(5);
		tab.setBorder(0);

		// tab.setWidth(100);
		tab.setTableFitsPage(true);

		Cell mLeftCell = new Cell();

		try {
			mLeftCell.addElement(new Chunk(myImgMinGob, 0, 0));
		}
		catch (BadElementException ex)
		{
			throw ex;
		}

		mLeftCell.setBorder(0);
		tab.addCell(mLeftCell);

		Cell mRightCell = new Cell();

		try {
			mRightCell.addElement(new Chunk(myImgMinGob2, 0, 0));
		}
		catch (BadElementException ex)
		{
			throw ex;
		}

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
			doc.addTitle("Estadisticas de ONPAR");
			doc.addKeywords("pdf, itext, Java, open source, http");

			doc.setPageSize(PageSize.LEDGER);
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

			doc.add(new Paragraph(" "));


			try {
				Table tab2 = getStats(req, this.getServletContext());
				doc.add(tab2);
			} catch (Exception ex) {
				System.out.println("Exception at line 199 or Report");
				ex.printStackTrace();
			}

			doc.add(new Paragraph(" "));

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

	private Table getStats(final HttpServletRequest req2, final ServletContext ctx2)
			throws Exception

		{
			String mReport_type = req2.getParameter("report_type");
			String mQuery = "select l.value, " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 0 and 5 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 0 and 5 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 6 and 11 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 6 and 11 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 12 and 17 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 12 and 17 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 18 and 25 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 18 and 25 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 26 and 36 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 26 and 36 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 37 and 46 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 37 and 46 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 47 and 60 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 47 and 60 and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) > 60 and pre_genero_lkup='Feminino',1,0)), " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) > 60 and pre_genero_lkup='Masculino',1,0)), " +
				    "sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) is null and pre_genero_lkup='Feminino',1,0)),  " +
					"sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) is null and pre_genero_lkup='Masculino',1,0)), " +
					"sum(if(pre_primer_nombre is not null and length(trim(pre_primer_nombre)) > 0,1,0)), " +
					"ifnull(f_get_dependents_count(pre_pais_de_origen_lkup,?),0) " +
					"from lkup l  " +
	 				"left join solicitante on pre_pais_de_origen_lkup = l.value " +
					"where l.field_name='pre_pais_lkup' ";

			if (mReport_type.equals("Admitidos a Tramite")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Admitido' ";
			} else if (mReport_type.equals("Negados por la Comisión")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,8)='No admit' ";
			} else if (mReport_type.equals("No Admitidos a Tramite")) {
				mQuery = mQuery +  " and substr(ifnull(adm_estatus_lkup,''),1,8)!='Admitido' ";
			} else if (mReport_type.equals("Numero de Refugiados Reconocidos")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,8)='Admitido' ";
			} else if (mReport_type.equals("Pendientes por la Comisión")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,10)='En proceso' ";
			} else if (mReport_type.equals("Renuncias al Tramite")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Renuncia' ";
			} else if (mReport_type.equals("Repatriaciones")) {
				mQuery = mQuery + " and ifnull(adm_estatus_lkup,'')='-99' ";
			} else if (mReport_type.equals("Solicitantes de Admisión al Tramite")) {
				mQuery = mQuery + "";
			}

			mQuery = mQuery + "group by l.value ";

			mQuery = mQuery + "union all " +
					" select 'Total', " +
					"       ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 0 and 5 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 0 and 5 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 6 and 11 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 6 and 11 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 12 and 17 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 12 and 17 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 18 and 25 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 18 and 25 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 26 and 36 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 26 and 36 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 37 and 46 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 37 and 46 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 47 and 60 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) between 47 and 60 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) > 60 and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) > 60 and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) is null and pre_genero_lkup='Feminino',1,0)),0), " +
					"		ifnull(sum(if(floor(datediff(pre_fecha_solicitud_onpar,pre_fecha_de_nacimiento)/365.25) is null and pre_genero_lkup='Masculino',1,0)),0), " +
					"		ifnull(sum(if(pre_primer_nombre is not null and length(trim(pre_primer_nombre)) > 0,1,0)),0), " +
					"       f_get_dependents_total(?) " +
					"		from lkup l " +
					"	left join solicitante on pre_pais_de_origen_lkup = l.value " +
					"	where l.field_name='pre_pais_lkup' ";

			if (mReport_type.equals("Admitidos a Tramite")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Admitido' ";
			} else if (mReport_type.equals("Negados por la Comisión")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,8)='No admit' ";
			} else if (mReport_type.equals("No Admitidos a Tramite")) {
				mQuery = mQuery +  " and substr(ifnull(adm_estatus_lkup,''),1,8)!='Admitido' ";
			} else if (mReport_type.equals("Numero de Refugiados Reconocidos")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,8)='Admitido' ";
			} else if (mReport_type.equals("Pendientes por la Comisión")) {
				mQuery = mQuery +  " and substr(ifnull(ref_estatus_lkup,''),1,10)='En proceso' ";
			} else if (mReport_type.equals("Renuncias al Tramite")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Renuncia' ";
			} else if (mReport_type.equals("Repatriaciones")) {
				mQuery = mQuery + " and ifnull(adm_estatus_lkup,'')='-99' ";
			} else if (mReport_type.equals("Solicitantes de Admisión al Tramite")) {
				mQuery = mQuery + "";
			}

			Table tab3 = null;

			try
			{
				tab3 = new Table(21 /* columns */);
			}
			catch (BadElementException ex)
			{
				throw ex;
			}

			// tab.setBorderWidth(0);
			tab3.setBorderWidth(1.0f);
			tab3.setPadding(2);
			tab3.setSpacing(2);
			tab3.setCellsFitPage(true);


			Cell mCell0 = new Cell(mReport_type);
			mCell0.setColspan(21);
			tab3.addCell(mCell0);

			Cell mCell1 = new Cell("");
			// mCell1.setWidth(200);
			tab3.addCell(mCell1);

			Cell mCell = new Cell("Rango de Edades");
			mCell.setColspan(18);
			tab3.addCell(mCell);
			tab3.addCell(new Cell(""));
			tab3.addCell(new Cell(""));

			tab3.addCell(new Cell(""));

			Cell mCell2 = new Cell("0-5");
			mCell2.setColspan(2);
			tab3.addCell(mCell2);

			Cell mCell3 = new Cell("6-11");
			mCell3.setColspan(2);
			tab3.addCell(mCell3);

			Cell mCell4 = new Cell("12-17");
			mCell4.setColspan(2);
			tab3.addCell(mCell4);


			Cell mCell5 = new Cell("18-25");
			mCell5.setColspan(2);
			tab3.addCell(mCell5);

			Cell mCell6 = new Cell("26-36");
			mCell6.setColspan(2);
			tab3.addCell(mCell6);

			Cell mCell7 = new Cell("37-46");
			mCell7.setColspan(2);
			tab3.addCell(mCell7);

			Cell mCell8 = new Cell("47-60");
			mCell8.setColspan(2);
			tab3.addCell(mCell8);

			Cell mCell9 = new Cell("61+");
			mCell9.setColspan(2);
			tab3.addCell(mCell9);

			Cell mCell10 = new Cell("Desconocido");
			mCell10.setColspan(2);
			tab3.addCell(mCell10);

			tab3.addCell(new Cell(""));
			tab3.addCell(new Cell(""));

			tab3.addCell(new Cell("País"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("F"));
			tab3.addCell(new Cell("M"));
			tab3.addCell(new Cell("Total"));
			tab3.addCell(new Cell("Dep"));

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
					prest.setString(1,mReport_type);
					prest.setString(2,mReport_type);
					rs=prest.executeQuery();


					while(rs.next())
					{
						tab3.addCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(9), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(10), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(11), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(12), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(13), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(14), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(15), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(16), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(17), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(18), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(19), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(20), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));
						tab3.addCell(new Phrase(rs.getString(21), FontFactory.getFont(FontFactory.HELVETICA, 12, Font.NORMAL, new java.awt.Color(0, 0, 255))));

					}


					return tab3;
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