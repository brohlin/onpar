package org.onpar.utils;

import org.onpar.utils.arrays.DynObjectArray;
import org.onpar.utils.arrays.DynStringArray;
import org.onpar.utils.*;
import java.io.PrintStream;
import java.io.Serializable;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.*;

public class DbResults
    implements Serializable
{

    private DbResults(DynStringArray aCols, DynObjectArray aRows, HashMap aColIdx)
    {
        vCurRow = -1;
        vCurRow = -1;
        vCols = aCols;
        vRows = aRows;
        vColIdx = aColIdx;
    }


    public DbResults()
    {
        vCurRow = -1;
        vCurRow = 0;
        vCols = new DynStringArray();
        vRows = new DynObjectArray();
        vColIdx = new HashMap();
    }

    public final int getRowCount()
    {
        return vRows.size();
    }

    public final int getColCount()
    {
        return vCols.size();
    }

    public final DynStringArray getColNames()
    {
        return vCols;
    }

    public final DbResultsRow getRow(int aIdx)
    {
        return (DbResultsRow)vRows.get(aIdx);
    }

    public final int getPos()
    {
        return vCurRow;
    }

    public final void setPos(int aPos)
    {
        vCurRow = aPos;
    }

    public final void moveTop()
    {
        vCurRow = -1;
    }

    public final void moveBottom()
    {
        vCurRow = vRows.size();
    }

    public final void moveFirst()
    {
        vCurRow = 0;
    }

    public final void moveLast()
    {
        vCurRow = vRows.size() - 1;
    }

    public final void next()
    {
        moveNext();
    }

    public final boolean hasNext()
    {
        return !EOF();
    }

    public final void movePrev()
    {
        if(!BOF())
            vCurRow--;
    }

    public final void moveNext()
    {
        if(!EOF())
            vCurRow++;
    }

    public final boolean atTop()
    {
        return BOF();
    }

    public final boolean BOF()
    {
        return vCurRow == -1;
    }

    public final boolean atBottom()
    {
        return EOF();
    }

    public final boolean EOF()
    {
        return vCurRow == vRows.size();
    }

    public final boolean hasRows()
    {
        return vRows.size() > 0;
    }

    public final boolean hasCols()
    {
        return vCols.size() > 0;
    }

    public final String getCell(int aRow, int aCol)
    {
        return ((DbResultsRow)vRows.get(aRow)).get(aCol);
    }

    public final int getCellAsInt(int aRow, int aCol)
    {
        return Integer.parseInt(((DbResultsRow)vRows.get(aRow)).get(aCol));
    }

    public final double getCellAsDouble(int aRow, int aCol)
    {
        return Double.parseDouble(((DbResultsRow)vRows.get(aRow)).get(aCol));
    }

    public final java.util.Date getCellAsDate(int aRow, int aCol)
        throws ParseException
    {
        return DateFormat.getDateInstance().parse(((DbResultsRow)vRows.get(aRow)).get(aCol));
    }

    public final String getCell(int aRow, String aCol)
    {
        return ((DbResultsRow)vRows.get(aRow)).get(getColByName(aCol));
    }

    public final int getCellAsInt(int aRow, String aCol)
    {
        return Integer.parseInt(((DbResultsRow) vRows.get(aRow)).get(getColByName(aCol)));
    }

    public final double getCellAsDouble(int aRow, String aCol)
    {
        return Double.parseDouble(((DbResultsRow)vRows.get(aRow)).get(getColByName(aCol)));
    }

    public final java.util.Date getCellAsDate(int aRow, String aCol)
        throws ParseException
    {
        return DateFormat.getDateInstance().parse(((DbResultsRow)vRows.get(aRow)).get(getColByName(aCol)));
    }

    public final int getColByName(String aName)
    {
        String sName = aName.toLowerCase();
        if(vColIdx.containsKey(sName))
            return ((Integer)vColIdx.get(sName)).intValue();
        else
        	throw new IllegalArgumentException("DbResults: Unknown Column Name [" + aName + "]");
    }

    public final String getValue(int aCol)
    {
        return getCell(vCurRow, aCol);
    }

    public final int getValueAsInt(int aCol)
    {
        return getCellAsInt(vCurRow, aCol);
    }

    public final double getValueAsDouble(int aCol)
    {
        return getCellAsDouble(vCurRow, aCol);
    }

    public final java.util.Date getValueAsDate(int aCol)
        throws ParseException
    {
        return getCellAsDate(vCurRow, aCol);
    }

    public final String getValue(String aCol)
    {
        return getCell(vCurRow, aCol);
    }

    public final int getValueAsInt(String aCol)
    {
        return getCellAsInt(vCurRow, aCol);
    }

    public final double getValueAsDouble(String aCol)
    {
        return getCellAsDouble(vCurRow, aCol);
    }

    public final java.util.Date getValueAsDate(String aCol)
        throws ParseException
    {
        return getCellAsDate(vCurRow, aCol);
    }

    public final void build(ResultSet aSet)
        throws SQLException
    {
        vCurRow = -1;
        vCols.clear();
        vRows.clear();
        vColIdx.clear();
        ResultSetMetaData sData = aSet.getMetaData();
        int sColCount = sData.getColumnCount();
        for(int x = 0; x < sColCount; x++)
        {
            String sStr = sData.getColumnName(x + 1);
            vCols.add(sStr);
            vColIdx.put(sStr.toLowerCase(), new Integer(x));
        }

        DbResultsRow sRow;
        for(; aSet.next(); vRows.add(sRow))
        {
            sRow = new DbResultsRow(this);
            for(int x = 0; x < sColCount; x++)
                sRow.add(aSet.getString(x + 1));

        }

    }

    public final void build(ResultSet aSet, int aRows)
        throws SQLException
    {
        vCurRow = -1;
        vCols.clear();
        vRows.clear();
        vColIdx.clear();
        int vCounter = 0;
        ResultSetMetaData sData = aSet.getMetaData();
        int sColCount = sData.getColumnCount();
        for(int x = 0; x < sColCount; x++)
        {
            String sStr = sData.getColumnName(x + 1);
            vCols.add(sStr);
            vColIdx.put(sStr.toLowerCase(), new Integer(x));
        }

        DbResultsRow sRow;
        for(; aSet.next() && vCounter < aRows; vRows.add(sRow))
        {
            vCounter++;
            sRow = new DbResultsRow(this);
            for(int x = 0; x < sColCount; x++)
                sRow.add(aSet.getString(x + 1));

        }

    }

    private final void rebuildColIdx()
    {
        vColIdx.clear();
        for(int x = 0; x < vCols.size(); x++)
            vColIdx.put(vCols.get(x).toLowerCase(), new Integer(x));

    }

    public final String generateHtmlTable()
    {
        StringBuffer sOut = new StringBuffer(4096);
        String sValue = "";
        sOut.append("<table border=\"1\" cellpadding=\"0\" cellspacing=\"0\">").append("<tr>");
        for(int x = 0; x < vCols.size(); x++)
            sOut.append("<th>").append(vCols.get(x)).append("</th>");

        sOut.append("</tr>");
        if(hasRows())
        {
            moveFirst();
            do
            {
                sOut.append("<tr>");
                for(int x = 0; x < vCols.size(); x++) {
                	// sValue = getValue(x);
                    // sOut.append("<td").append(">").append(getValue(x)).append("</td>");
                    sOut.append("<td");

                    try {
	                	if (StrUtils.isNumeric(getValue(x))) {
	                		sOut.append(" align=\"right\"");
	                	} else {
	                		sOut.append(" align=\"left\"");
	                	}
                    } catch(NullPointerException npe) {
                    	// do nothing here
                    }
                    sOut.append(">");
                	sOut.append(getValue(x));
                	sOut.append("</td>");
                }
                sOut.append("</tr>");
                moveNext();
            } while(!EOF());
        }
        sOut.append("</table>");
        return sOut.toString();
    }



    public final DbResults sort(int aCrit[])
    {
        TreeMap sMap = new TreeMap(new DbResultsComparator(aCrit));
        for(int x = 0; x < vRows.size(); x++)
            sMap.put(vRows.get(x), null);

        DynObjectArray sRows = new DynObjectArray();
        for(Iterator sIter = sMap.keySet().iterator(); sIter.hasNext(); sRows.add(sIter.next()));
        return new DbResults(vCols, sRows, vColIdx);
    }

    public final void merge(DbResults aSet)
    {
        if(aSet.getColCount() != getColCount())
            throw new IllegalArgumentException("DbResults.merge(): Both DbResults objects need to have the same number of columns");
        for(int x = 0; x < aSet.vRows.size(); x++)
            vRows.add(aSet.vRows.get(x));

    }

    public final void insertColumn(int aPos, String aName, String aDefVal)
    {
        if(aName == null || aName.length() == 0)
            throw new IllegalArgumentException("DbResults.insertColumn: Empty column names are not allowed.");
        if(aDefVal == null)
            aDefVal = "";
        if(aPos == vCols.size())
        {
            vCols.add(aName);
            for(int x = 0; x < vRows.size(); x++)
                ((DbResultsRow)vRows.get(x)).add(aDefVal);

        } else
        {
            vCols.insert(aPos, aName);
            for(int x = 0; x < vRows.size(); x++)
                ((DbResultsRow)vRows.get(x)).insert(aPos, aDefVal);

        }
        rebuildColIdx();
    }

    public final Iterator iterator()
    {
        return new DbResultsIterator(this);
    }

    public final void addRow(DbResultsRow aRow)
    {
        if(aRow.size() != vCols.size())
        {
            throw new IllegalArgumentException("DbResults.addRow: The row to add must contain the same number of columns as this object.");
        } else
        {
            vRows.add(aRow);
            return;
        }
    }

    public final DbResultsRow removeRow(int aPos)
    {
        throw new IllegalArgumentException("DbResults.removeRow not yet implemented.");
    }

    public final void insertRow(DbResultsRow aRow)
    {
        throw new IllegalArgumentException("DbResults.insertRow() not yet implemented.");
    }

    public final void removeCol(int aPos)
    {
        throw new IllegalArgumentException("DbResults.removeCol() not yet implemented.");
    }

    public final String generateHtmlTableCss()
    {
        String vRowClass = "datatablerow";
        String sValue = "";
        StringBuffer sOut = new StringBuffer(4096);
        sOut.append("<table align=\"center\" border=\"0\" width=\"100%\">").append("<tr class=\"datatableheaderrow\">");
        for(int x = 0; x < vCols.size(); x++)
            sOut.append("<th class=\"datatableheader\">").append(vCols.get(x)).append("</th>");

        sOut.append("</tr>");
        if(hasRows())
        {
            moveFirst();
            do
            {
                sOut.append("<tr class=" + vRowClass + ">");
                for(int x = 0; x < vCols.size(); x++) {
	            	// sValue = getValue(x);
	                // sOut.append("<td class=\"datatablecellcalign\">").append(getValue(x)).append("</td>");
	                sOut.append("<td ");

	                try {
	                	if (StrUtils.isNumeric(getValue(x))) {
	                		sOut.append(" align=\"right\"");
	                	} else {
	                		sOut.append(" align=\"left\"");
	                	}
	                } catch (NullPointerException  npe) {
	                	// do nothing here
	                }

	                sOut.append(">");
	            	sOut.append(getValue(x));
	            	sOut.append("</td>");
                }

                sOut.append("</tr>");
                if(vRowClass.equals("datatablerowalt"))
                    vRowClass = "datatablerow";
                else
                if(vRowClass.equals("datatablerow"))
                    vRowClass = "datatablerowalt";
                moveNext();
            } while(!EOF());
        }
        sOut.append("</table>");
        return sOut.toString();
    }




    public final String generateHtmlTableCss(int aRows)
    {
        int vCounter = 0;
        String vRowClass = "datatablerow";
        String sValue = "";
        StringBuffer sOut = new StringBuffer(4096);
        sOut.append("<table align=\"center\" border=\"1\" width=\"100%\">").append("<tr class=\"datatableheaderrow\">");
        for(int x = 0; x < vCols.size(); x++)
            sOut.append("<th class=\"datatableheader\">").append(vCols.get(x)).append("</th>");

        sOut.append("</tr>");
        if(hasRows())
        {
            moveFirst();
            do
            {
                vCounter++;
                sOut.append("<tr class=" + vRowClass + ">");
                for(int x = 0; x < vCols.size(); x++) {
                    // sOut.append("<td class=\"datatablecellcalign\">").append(getValue(x)).append("</td>");
	            	// sValue = getValue(x);
	                sOut.append("<td");

	                try {
		            	if (StrUtils.isNumeric(getValue(x))) {
		            		sOut.append(" align=\"right\"");
		            	} else {
		            		sOut.append(" align=\"left\"");
		            	}
	                } catch (NullPointerException npe) {
	                	// do nothing here
	                }

	                sOut.append(">");
	            	sOut.append(getValue(x));
	            	sOut.append("</td>");
                }

                sOut.append("</tr>");
                if(vRowClass.equals("datatablerowalt"))
                    vRowClass = "datatablerow";
                else
                if(vRowClass.equals("datatablerow"))
                    vRowClass = "datatablerowalt";
                moveNext();
            } while(!EOF() && vCounter < aRows);
        }
        sOut.append("</table>");
        return sOut.toString();
    }

    public final void build(Object aObj[], DbResults aDbResults)
        throws Exception
    {
        DynStringArray vStrArray = null;
        vCurRow = -1;
        vCols.clear();
        vRows.clear();
        vColIdx.clear();
        int vCounter = 0;
        int sColCount = aDbResults.getRowCount();
        System.out.println(sColCount);
        int vIndex = 0;
        DbResultsRow sListItem;
        for(Iterator sPos = aDbResults.iterator(); sPos.hasNext(); vColIdx.put(sListItem.get(1), new Integer(vIndex++)))
        {
            sListItem = (DbResultsRow)sPos.next();
            vCols.add(sListItem.get(1));
        }

        for(int i = 0; i < aObj.length; i++)
        {
            vCounter++;
            DbResultsRow sRow = new DbResultsRow(this);
            vStrArray = (DynStringArray)aObj[i];
            for(int x = 0; x < vStrArray.size(); x++)
                sRow.add(vStrArray.get(x));

            vRows.add(sRow);
        }

    }


	public final String generateMap()
	{

	    StringBuffer sOut = new StringBuffer(4096);
	    int gpsCol = 0;
	    try {
	    	gpsCol = getColByName("gps");
	    } catch (Exception e) {
	    	return sOut.toString();
	    }

	    sOut.append("<style type=\"text/css\"> #map-canvas { height: 600; width: 960; } </style>");
	    sOut.append("<script type=\"text/javascript\" ");
	    sOut.append("src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyB4S_fiN2G8Qu3N6sAX_bZAfExKYOgKk2Q&sensor=false\"> ");
	    sOut.append("</script>");

	    sOut.append("<script type=\"text/javascript\"> ");
	    sOut.append("function initialize() {");
	    sOut.append("var mapOptions = {");
	    sOut.append("center: new google.maps.LatLng(18.525780, -72.291405),");
	    sOut.append("zoom: 15,");
	    sOut.append("panControl: true,");
	    sOut.append("mapTypeId: google.maps.MapTypeId.ROADMAP");
	    sOut.append("};");
	    sOut.append("var map = new google.maps.Map(document.getElementById(\"map-canvas\"), mapOptions);");

	    if(hasRows())
	    {
	        moveFirst();
        	sOut.append("var myLatlng = new google.maps.LatLng(").append(getValue(gpsCol)).append(");");
            sOut.append("var marker = new google.maps.Marker({position: myLatlng,icon: \"http://www.google.com/intl/en_us/mapfiles/ms/micons/green-dot.png\"});");
    	    sOut.append("marker.setMap(map);");
	        do
	        {
	        	sOut.append("myLatlng = new google.maps.LatLng(").append(getValue(gpsCol)).append(");");
	            sOut.append("marker = new google.maps.Marker({position: myLatlng,icon: \"http://www.google.com/intl/en_us/mapfiles/ms/micons/green-dot.png\"});");
	    	    sOut.append("marker.setMap(map);");

	            moveNext();
	        } while(!EOF());
	    }

		sOut.append("}");
		sOut.append("google.maps.event.addDomListener(window, 'load', initialize);");
		sOut.append("</script>");
		sOut.append("<div id=\"map-canvas\"/></div>");

	    return sOut.toString();
	}







	public final String generateMap(String aIcon)
	{

	    StringBuffer sOut = new StringBuffer(4096);
	    int gpsCol = 0;
	    try {
	    	gpsCol = getColByName("gps");
	    } catch (Exception e) {
	    	return sOut.toString();
	    }

	    sOut.append("<style type=\"text/css\"> #map-canvas { height: 600; width: 960; } </style>");
	    sOut.append("<script type=\"text/javascript\" ");
	    sOut.append("src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyB4S_fiN2G8Qu3N6sAX_bZAfExKYOgKk2Q&sensor=false\"> ");
	    sOut.append("</script>");

	    sOut.append("<script type=\"text/javascript\"> ");
	    sOut.append("function initialize() {");
	    sOut.append("var mapOptions = {");
	    sOut.append("center: new google.maps.LatLng(18.525780, -72.291405),");
	    sOut.append("zoom: 15,");
	    sOut.append("panControl: true,");
	    sOut.append("mapTypeId: google.maps.MapTypeId.ROADMAP");
	    sOut.append("};");
	    sOut.append("var map = new google.maps.Map(document.getElementById(\"map-canvas\"), mapOptions);");

	    if(hasRows())
	    {
	    	sOut.append("var myLatlng;");
	    	sOut.append("var marker;");

	        moveFirst();

	        if(getValue(gpsCol).length()>10) {
	        	sOut.append("myLatlng = new google.maps.LatLng(").append(getValue(gpsCol)).append(");");
	            sOut.append("marker = new google.maps.Marker({position: myLatlng,icon: \"");
	            sOut.append(aIcon);
	            sOut.append("\"});");
	    	    sOut.append("marker.setMap(map);");
	        }

	        do
	        {
	        	if(getValue(gpsCol).length()>10) {
	        		sOut.append("myLatlng = new google.maps.LatLng(").append(getValue(gpsCol)).append(");");
	        		sOut.append("marker = new google.maps.Marker({position: myLatlng,icon: \"");
	        		sOut.append(aIcon);
	        		sOut.append("\"});");
	        		sOut.append("marker.setMap(map);");
	        	}

	            moveNext();
	        } while(!EOF());
	    }


		sOut.append("}");
		sOut.append("google.maps.event.addDomListener(window, 'load', initialize);");
		sOut.append("</script>");
		sOut.append("<div id=\"map-canvas\"/></div>");

	    return sOut.toString();
	}

    public static final int cSortAsString = 0;
    public static final int cSortAsInt = 1;
    public static final int cSortAsDouble = 2;
    public static final int cSortAsDate = 3;
    public static final int cSortAsc = 1;
    public static final int cSortDec = 0;
    private int vCurRow;
    private DynStringArray vCols;
    private DynObjectArray vRows;
    private HashMap vColIdx;
}
