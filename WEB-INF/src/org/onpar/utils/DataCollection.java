package org.onpar.utils;

import org.onpar.utils.arrays.DynObjectArray;
import org.onpar.utils.arrays.DynStringArray;
import org.onpar.utils.DbResults;
import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.*;

public class DataCollection
{

    public DataCollection()
    {

    }


    public static final String generateFormOrganizationProfile(DbResults aDb,int aStartHideCol ,int aEndHideCol,int aStartCol,int aEndCol,int aTextStartCol,int aTextEndCol)
    {
        String vRowClass = "datatablerow";

        StringBuffer sOut = new StringBuffer(4096);

        if(aDb.hasRows())
        {
            sOut.append("<table align=\"center\" border=\"0\">").append("<tr class=\"datatableheaderrow\">");
            for(int x = 0; x < aDb.getColCount(); x++)

            	if (x >= aStartHideCol && x <= aEndHideCol) {
            		// do nothing
            	} else {
            		sOut.append("<th class=\"datatableheader\">").append(aDb.getColNames().get(x)).append("</th>");
            	}

            sOut.append("</tr>");

            aDb.moveFirst();
            do
            {
            	sOut.append("<form action=\"/onpar/main.jsp?target=profile\" method=\"post\" name=\"insdata\">");
            	sOut.append("<input type=\"hidden\" name=\"ins_metric_organization\" value=\"y\">");
            	sOut.append("<tr class=" + vRowClass + ">");
                for(int x = 0; x < aDb.getColCount(); x++) {

                    if (x >= aStartHideCol && x <= aEndHideCol) {
                    	// sOut.append(getValue(x));
                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOut.append(x);
                    	sOut.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("\">");
                    } else if (x >= aStartCol && x <= aEndCol) {
                    	sOut.append("<td align=\"right\">");
                    	sOut.append("<select tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(x);
                    	sOut.append("\" size=\"1\">");


                    	sOut.append("<option value=\"N\" ");
                		if (aDb.getValue(x).equals("N")) {
                			sOut.append(" selected");
                		}
                		sOut.append(">No</option>");

                    	sOut.append("<option value=\"Y\" ");
                		if (aDb.getValue(x).equals("Y")) {
                			sOut.append(" selected");
                		}
                		sOut.append(">Yes</option>");


                    	sOut.append("</td>");
                    } else if (x >= aTextStartCol && x <= aTextEndCol) {
                    	sOut.append("<td width=\"10%\">");
                    	sOut.append("<textarea tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(x);
                    	sOut.append("\" cols=\"40\" rows=\"5\" maxlength=\"200\">");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("</textarea>");
                    	sOut.append("</td>");
                    }  else {
                    	sOut.append("<td>");
                    	sOut.append(aDb.getValue(x));

                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOut.append(x);
                    	sOut.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("\">");
                    	sOut.append("</td>");
                    }

                	// sOut.append("</td>");
                }
                sOut.append("<td><input type=\"submit\" class=\"butnTxt\" value=\"Save\" name=\"save\"></td>");
                sOut.append("</tr>");
                sOut.append("</form>");
                if(vRowClass.equals("datatablerowalt"))
                    vRowClass = "datatablerow";
                else
                if(vRowClass.equals("datatablerow"))
                    vRowClass = "datatablerowalt";
                aDb.moveNext();
            } while(!aDb.EOF());
        } else {

        	sOut.append("<table><tr><td><p>There are no requests for information for this programme area.</p></td></tr>");
        }
        sOut.append("</table>");
        return sOut.toString();
    }


    public static final String generateFormSubmitDataQuarterly(DbResults aDb,int aStartHideCol ,int aEndHideCol,int aStartCol,int aEndCol,int aTextStartCol,int aTextEndCol,boolean aAddGpsSpreadsheetCols)
    {
        String vRowClass = "datatablerow";

        StringBuffer sOut = new StringBuffer(4096);
        StringBuffer sOutHidden = new StringBuffer(4096);
        StringBuffer sOutOthers = new StringBuffer(4096);
        int vSubmitDetailCol = 0;

        if(aDb.hasRows())
        {
            sOut.append("<table align=\"center\" border=\"0\">").append("<tr class=\"datatableheaderrow\">");
            for(int x = 0; x < (aDb.getColCount() -1); x++) {

            	if (x >= aStartHideCol && x <= aEndHideCol) {
            		// do nothing
            	} else {
            		sOut.append("<th nowrap class=\"datatableheader\">").append(aDb.getColNames().get(x)).append("</th>");
            	}
            }

            sOut.append("<th nowrap class=\"datatableheader\">").append("").append("</th>");

            if (aAddGpsSpreadsheetCols) {
            	sOut.append("<th nowrap class=\"datatableheader\" colspan=\"2\">").append("GPS Coodinates <br>for Requested Metrics</th>");
            	// sOut.append("<th nowrap class=\"datatableheader\">").append("&nbsp;</th>");
            }

            sOut.append("</tr>");

            aDb.moveFirst();
            do
            {
            	vSubmitDetailCol = aDb.getColByName("Submit Detail");

            	sOut.append("<form action=\"/onpar/main.jsp?target=data\" method=\"post\" name=\"insdata\">");
            	sOut.append("<input type=\"hidden\" name=\"ins_quarterly_metric_value\" value=\"y\">");

            	sOutHidden = new StringBuffer(4096);
            	sOutOthers = new StringBuffer(4096);

            	sOut.append("<tr class=" + vRowClass + ">");
                for(int x = 0; x < aDb.getColCount(); x++) {

                    if (x >= aStartHideCol && x <= aEndHideCol) {
                    	// sOut.append(getValue(x));
                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOutHidden.append("<input type=\"hidden\" name=\"");

                    	sOut.append(aDb.getColNames().get(x));
                    	sOutHidden.append(aDb.getColNames().get(x));

                    	sOut.append("\" value=\"");
                    	sOutHidden.append("\" value=\"");

                    	sOut.append(aDb.getValue(x));
                    	sOutHidden.append(aDb.getValue(x));

                    	sOut.append("\">");
                    	sOutHidden.append("\">");
                    } else if (x >= aStartCol && x <= aEndCol) {
                    	sOut.append("<td align=\"right\">");
                    	sOut.append("<div class=\"styleform\">");
                    	sOut.append("<input type=\"text\" pattern=\"[0-9]*\" tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOut.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("\" size=\"5\" maxlength=\"10\">");
                    	sOut.append("</div>");
                    	sOut.append("</td>");
                    } else if (x >= aTextStartCol && x<= aTextEndCol) {
                    	sOut.append("<td width=\"10%\">");
                    	sOut.append("<textarea tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOut.append("\" cols=\"40\" rows=\"5\" maxlength=\"200\">");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("</textarea>");
                    	sOut.append("</td>");
                    } else if (x < aStartCol || x == (aTextEndCol + 1)){
                    	if (x < aStartCol) {
                    		sOut.append("<td nowrap>");
                    	}else  {
                    		sOut.append("<td>");
                    	}
                    	sOut.append(aDb.getValue(x));

                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOutOthers.append("<input type=\"hidden\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOutOthers.append(aDb.getColNames().get(x));
                    	sOut.append("\" value=\"");
                    	sOutOthers.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOutOthers.append(aDb.getValue(x));
                    	sOut.append("\">");
                    	sOutOthers.append("\">");

                    	sOut.append("</td>");

                    }

                	// sOut.append("</td>");
                }
                sOut.append("<td><input type=\"submit\" class=\"butnTxt\" value=\"Save\" name=\"save\"></td>");

                sOut.append("</form>");

                if (aAddGpsSpreadsheetCols) {


                	// System.out.println(aDb.getValue(vSubmitDetailCol));
                	if (aDb.getValue(vSubmitDetailCol).toLowerCase().equals("no")) {
                		sOut.append("<td>&nbsp;</td><td>&nbsp;</td>");
                	} else {
	                	sOut.append("<td>");
	                	sOut.append("<form action=\"/onpar/Submit_QuarterlyGprsForm.jsp\" method=\"post\" name=\"get_gps_template\">");
	                	sOut.append(sOutHidden.toString());
	                	sOut.append(sOutOthers.toString());

	                	sOut.append("<select name=\"month\" size=\"1\">");
	                	sOut.append("<option value=\"March\">March</option>");
	                	sOut.append("<option value=\"June\">June</option>");
	                	sOut.append("<option value=\"September\">September</option>");
	                	sOut.append("<option value=\"December\">December</option>");
	                	sOut.append("</select>");

	                	sOut.append("<input type=\"submit\" class=\"butnTxt\" value=\"Download GPS Template\" name=\"download\">");
	                	sOut.append("</form>");
	                	sOut.append("</td>");

	                	sOut.append("<td>");
	                	sOut.append("<form action=\"/onpar/UploadQuarterlyGprs.jsp\" method=\"post\" name=\"impform\" enctype=\"multipart/form-data\">");
	                    sOut.append("<input name=\"filename\" type=\"file\" size=\"80\" maxlength=\"40\" required=\"required\">");
	                	sOut.append("<input type=\"submit\" class=\"butnTxt\" value=\"Upload GPS Coordinates\" name=\"upload\">");
	                	sOut.append("</form>");
	                	sOut.append("</td>");
                	}
                }
                sOut.append("</tr>");

                if(vRowClass.equals("datatablerowalt"))
                    vRowClass = "datatablerow";
                else
                if(vRowClass.equals("datatablerow"))
                    vRowClass = "datatablerowalt";
                aDb.moveNext();
            } while(!aDb.EOF());
        } else {
        	sOut.append("<table><tr><td><p>There are no requests for information.</p></td></tr>");
        }
        sOut.append("</table>");
        return sOut.toString();
    }

    public static final String generateFormSubmitDataOnetime(DbResults aDb,int aStartHideCol ,int aEndHideCol,int aStartCol,int aEndCol,int aTextStartCol,int aTextEndCol,boolean aAddGpsSpreadsheetCols)
    {
        String vRowClass = "datatablerow";
        StringBuffer sOut = new StringBuffer(4096);
        StringBuffer sOutHidden = new StringBuffer(4096);
        StringBuffer sOutOthers = new StringBuffer(4096);
        int vSubmitDetailCol = 0;

        if(aDb.hasRows())
        {
            sOut.append("<table align=\"center\" border=\"0\">").append("<tr class=\"datatableheaderrow\">");
            for(int x = 0; x < (aDb.getColCount() -1); x++)

            	if (x >= aStartHideCol && x <= aEndHideCol) {
            		// do nothing
            	} else {
            		sOut.append("<th nowrap class=\"datatableheader\">").append(aDb.getColNames().get(x)).append("</th>");
            	}

            sOut.append("<th nowrap class=\"datatableheader\">").append("").append("</th>");

            if (aAddGpsSpreadsheetCols) {
            	sOut.append("<th nowrap class=\"datatableheader\" colspan=\"2\">").append("GPS Coodinates <br> for Requested Metrics</th>");
            	// sOut.append("<th nowrap class=\"datatableheader\">").append("&nbsp;</th>");
            }

            sOut.append("</tr>");

            aDb.moveFirst();
            do
            {
            	vSubmitDetailCol = aDb.getColByName("Submit Detail");
            	sOutHidden = new StringBuffer(4096);
            	sOutOthers = new StringBuffer(4096);

            	sOut.append("<form action=\"/onpar/main.jsp?target=data\" method=\"post\" name=\"insdata\">");
            	sOut.append("<input type=\"hidden\" name=\"ins_onetime_metric_value\" value=\"y\">");
            	sOut.append("<tr class=" + vRowClass + ">");


            	for(int x = 0; x < (aDb.getColCount()-1); x++) {

                    if (x >= aStartHideCol && x <= aEndHideCol) {
                    	// sOut.append(getValue(x));
                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOutHidden.append("<input type=\"hidden\" name=\"");

                    	sOut.append(aDb.getColNames().get(x));
                    	sOutHidden.append(aDb.getColNames().get(x));

                    	sOut.append("\" value=\"");
                    	sOutHidden.append("\" value=\"");

                    	sOut.append(aDb.getValue(x));
                    	sOutHidden.append(aDb.getValue(x));

                    	sOut.append("\">");
                    	sOutHidden.append("\">");
                    } else if (x >= aStartCol && x <= aEndCol) {
                    	sOut.append("<td align=\"right\">");
                    	sOut.append("<div class=\"styleform\">");
                    	sOut.append("<input type=\"text\" pattern=\"[0-9]*\" tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOut.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("\" size=\"5\" maxlength=\"10\">");
                    	sOut.append("</div>");
                    	sOut.append("</td>");
                    } else if (x >= aTextStartCol && x<= aTextEndCol) {
                    	sOut.append("<td width=\"10%\">");
                    	sOut.append("<textarea tabindex=\"<%= mCounter++ %>\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOut.append("\" cols=\"40\" rows=\"5\" maxlength=\"200\">");
                    	sOut.append(aDb.getValue(x));
                    	sOut.append("</textarea>");
                    	sOut.append("</td>");
                    }  else {
                    	if (x < aStartCol) {
                    		sOut.append("<td nowrap>");
                    	}else {
                    		sOut.append("<td>");
                    	}
                    	sOut.append(aDb.getValue(x));


                    	sOut.append("<input type=\"hidden\" name=\"");
                    	sOutOthers.append("<input type=\"hidden\" name=\"");
                    	sOut.append(aDb.getColNames().get(x));
                    	sOutOthers.append(aDb.getColNames().get(x));
                    	sOut.append("\" value=\"");
                    	sOutOthers.append("\" value=\"");
                    	sOut.append(aDb.getValue(x));
                    	sOutOthers.append(aDb.getValue(x));
                    	sOut.append("\">");
                    	sOutOthers.append("\">");

                    }

                	// sOut.append("</td>");
                }
                sOut.append("<td><input type=\"submit\" class=\"butnTxt\" value=\"Save\" name=\"save\"></td>");
                sOut.append("</form>");


                if (aAddGpsSpreadsheetCols) {


                	// System.out.println(aDb.getValue(vSubmitDetailCol));
                	if (aDb.getValue(vSubmitDetailCol).toLowerCase().equals("no")) {
                		sOut.append("<td>&nbsp;</td><td>&nbsp;</td>");
                	} else {
	                	sOut.append("<td>");
	                	sOut.append("<form action=\"/onpar/Submit_OnetimeGprsForm.jsp\" method=\"post\" name=\"get_gps_template\">");
	                	sOut.append(sOutHidden.toString());
	                	sOut.append(sOutOthers.toString());

	                	sOut.append("<input type=\"submit\" class=\"butnTxt\" value=\"Download GPS Template\" name=\"download\">");
	                	sOut.append("</form>");
	                	sOut.append("</td>");

	                	sOut.append("<td>");
	                	sOut.append("<form action=\"/onpar/UploadOnetimeGprs.jsp\" method=\"post\" name=\"impform\" enctype=\"multipart/form-data\">");
	                    sOut.append("<input name=\"filename\" type=\"file\" size=\"80\" maxlength=\"40\" required=\"required\">");
	                	sOut.append("<input type=\"submit\" class=\"butnTxt\" value=\"Upload GPS Coordinates\" name=\"upload\">");
	                	sOut.append("</form>");
	                	sOut.append("</td>");
                	}
                }


                sOut.append("</tr>");
                if(vRowClass.equals("datatablerowalt"))
                    vRowClass = "datatablerow";
                else
                if(vRowClass.equals("datatablerow"))
                    vRowClass = "datatablerowalt";
                aDb.moveNext();
            } while(!aDb.EOF());
        } else {
        	sOut.append("<table><tr><td><p>There are no requests for information.</p></td></tr>");
        }
        sOut.append("</table>");
        return sOut.toString();
    }

    public static final String generateSelectOrganization(DbResults aDb, String aOrganization_id)
    {
        StringBuffer sOut = new StringBuffer(4096);

        if(aDb.hasRows())
        {
            sOut.append("<select name=\"organization_id\" size=\"1\" tabindex=\"<%= mCounter++ %>\">");

            aDb.moveFirst();
            do
            {
            	sOut.append("<option value=\"");
            	sOut.append(aDb.getValue(0));
            	sOut.append("\"");

            	if (aOrganization_id.equals(aDb.getValue(0))) {
            		sOut.append(" selected");
            	}

            	sOut.append(">");
            	sOut.append(aDb.getValue(1));
            	sOut.append("</option>");

                aDb.moveNext();
            } while(!aDb.EOF());
        } else {
        	sOut.append("</select>");
        }
        return sOut.toString();
    }

    public static final String generateSelectArea(DbResults aDb, String aArea_id)
    {
        StringBuffer sOut = new StringBuffer(4096);

        if(aDb.hasRows())
        {
            sOut.append("<select name=\"area_id\" size=\"1\" tabindex=\"<%= mCounter++ %>\">");

            aDb.moveFirst();
            do
            {
            	sOut.append("<option value=\"");
            	sOut.append(aDb.getValue(0));
            	sOut.append("\"");

            	if (aArea_id.equals(aDb.getValue(0))) {
            		sOut.append(" selected");
            	}

            	sOut.append(">");
            	sOut.append(aDb.getValue(1));
            	sOut.append("</option>");

                aDb.moveNext();
            } while(!aDb.EOF());
        } else {
        	sOut.append("</select>");
        }
        return sOut.toString();
    }

    public static final String generateSelectGeography(DbResults aDb, String aGeography_id)
    {
        StringBuffer sOut = new StringBuffer(4096);

        if(aDb.hasRows())
        {
            sOut.append("<select name=\"geography_id\" size=\"1\" tabindex=\"<%= mCounter++ %>\">");

            aDb.moveFirst();
            do
            {
            	sOut.append("<option value=\"");
            	sOut.append(aDb.getValue(0));
            	sOut.append("\"");

            	if (aGeography_id.equals(aDb.getValue(0))) {
            		sOut.append(" selected");
            	}

            	sOut.append(">");
            	sOut.append(aDb.getValue(1));
            	sOut.append("</option>");

                aDb.moveNext();
            } while(!aDb.EOF());
        } else {
        	sOut.append("</select>");
        }
        return sOut.toString();
    }


}
