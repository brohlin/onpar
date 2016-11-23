package org.onpar.utils;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfTemplate;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPCell;

import java.io.IOException;
import java.net.MalformedURLException;


public class HeaderFooterPageEvent extends PdfPageEventHelper {
	
	PdfTemplate total;
	
    
	public void onOpenDocument(PdfWriter writer,Document document) {
		total = writer.getDirectContent().createTemplate(30, 16);
    }
	
	public void onCloseDocument(PdfWriter writer,Document document) {
        ColumnText.showTextAligned(total,Element.ALIGN_LEFT, new Phrase(String.valueOf(writer.getPageNumber() - 1)), 2, 2, 0);

    }
	
	
    public void onStartPage(PdfWriter writer,Document document) {
    	Rectangle rect = writer.getBoxSize("art");
    	
    	
    	
        // ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_LEFT, new Phrase("Top Left"), rect.getLeft(), rect.getTop(), 0);
        // ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_LEFT, new Phrase(String.format("Página %d", writer.getPageNumber())), rect.getLeft(), rect.getTop(), 0);
        // ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase("Top Right"), rect.getRight(), rect.getTop(), 0);
    }
    public void onEndPage(PdfWriter writer,Document document) {
    	
    	
        PdfContentByte canvas = writer.getDirectContentUnder();
		Image _image;
		try {
			// _image = Image.getInstance("/apache-tomcat-7.0.63/webapps/onpar/img/mingob_wm.jpg");
			// _image = Image.getInstance("/home/brohlin/jvm/apache-tomcat-7.0.33/domains/ruandunduma120.org/onpar/img/mingob_wm.jpg");
			_image = Image.getInstance("/opt/tomcat/webapps/onpar/img/mingob_wm.jpg");
			
			_image.setAbsolutePosition(150, 310);
			
			try {
				canvas.addImage(_image);
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (BadElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
      
        
    	Rectangle rect = writer.getBoxSize("art");
    	
    	PdfPTable table = new PdfPTable(2);
    	
    	try {
    		table.setWidths(new int[]{30,10});
    		table.setTotalWidth(100);
    		table.setLockedWidth(true);
    		table.getDefaultCell().setFixedHeight(20);
    		table.getDefaultCell().setBorder(0);
    		table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
    		
    		// table.addCell("header");
    		
    		table.addCell(String.format("Página %d de ", writer.getPageNumber()));
    		
    		PdfPCell cell = new PdfPCell(Image.getInstance(total));
    		cell.setBorder(0);
    		cell.setHorizontalAlignment(Element.ALIGN_LEFT);
    		table.addCell(cell);
    		table.writeSelectedRows(0, -1, 30, 770, writer.getDirectContent());
    		System.out.println(table.toString());
    	} catch (Exception ex) {
    		// LogManager.writeLog("Writing PDF Table", ex.getMessage());
    		System.out.println(ex.getMessage());
    		ex.printStackTrace();
    	}
    	
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_LEFT, new Phrase("Central telefónica: 512-2000"), rect.getLeft(), rect.getBottom(), 0);
        ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_RIGHT, new Phrase("www.mingob.gob.pa"), rect.getRight(), rect.getBottom(), 0);
    }
}