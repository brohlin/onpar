package org.onpar.utils;

import java.io.*;
import java.util.HashMap;
// import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.poi.hssf.usermodel.*;
import org.onpar.database.*;
import org.onpar.log.*;
import org.onpar.utils.*;
import org.onpar.utils.arrays.*;


public class HSSFCreate extends HttpServlet {

	private DbResults db = new DbResults();
	private String myFileName;
	private String mySheetName;
	
	public void init(ServletConfig config) throws ServletException {
        super.init(config);  
    }

    public void destroy() {
    }

    /** Processes requests for both HTTP GET and POST methods.
     * @param request servlet request
     * @param response servlet response
     */

    
    @SuppressWarnings("deprecation")
	protected void processRequest(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        int vCounter = 0;
        int vCurRow = 0;
        DynObjectArray vRows;
        DynStringArray vCols = db.getColNames();
                
        response.setContentType("application/vnd.ms-excel");
		response.setHeader("Cache-Control", "max-age=30");

        HSSFWorkbook wb = new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet(mySheetName);
       
        
		StringBuffer sbFilename = new StringBuffer();
		sbFilename.append(myFileName);
		sbFilename.append(".xls");
			
		StringBuffer sbContentDispValue = new StringBuffer();
		sbContentDispValue.append("inline");
		sbContentDispValue.append("; filename=");
		sbContentDispValue.append(sbFilename);
				
		response.setHeader(
			"Content-disposition",
			sbContentDispValue.toString());        

        // Create a row and put some cells in it. Rows are 0 based.
        HSSFRow row = sheet.createRow(0);
            
        for(int x = 0; x < vCols.size(); x++) {
            row.createCell(x).setCellValue(vCols.get(x));
        }
        
        if(db.hasRows())
        {
            db.moveFirst();
            do
            {
            	
                vCounter++;
                row = sheet.createRow(vCounter);
                
                for(int x = 0; x < db.getColCount(); x++) {              	
	            	row.createCell(x).setCellValue(db.getValue(x));
                }
                
                db.moveNext();
            } while(!db.EOF());
        }
        
        
        // Write the output 
        OutputStream out = response.getOutputStream();
        wb.write(out);
        out.close();
    }

    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */

    protected void doGet(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {

    	myFileName = request.getParameter("myfilename");
    	mySheetName = request.getParameter("mysheetname");
        String myObjectId = request.getParameter("myObjectId");
        db = (DbResults)request.getSession().getAttribute(myObjectId);
        // request.getSession().removeAttribute(myObjectId);    	
    	processRequest(request, response);
    	// db.moveTop();
        
    }

    /** Handles the HTTP POST method.
     * @param request servlet request
     * @param response servlet response
     */

    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
    	
    	myFileName = request.getParameter("myfilename");
    	mySheetName = request.getParameter("mysheetname");    	
        String myObjectId = request.getParameter("myObjectId");
        db = (DbResults)request.getSession().getAttribute(myObjectId);
        // request.getSession().removeAttribute(myObjectId);        	
    	
        processRequest(request, response);
        // db.moveTop();
    }

    /** Returns a short description of the servlet.
     */

    public String getServletInfo() {
       return "Example to create a workbook in a servlet using HSSF";
    }
}
