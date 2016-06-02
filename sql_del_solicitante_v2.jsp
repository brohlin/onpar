<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>

<%	
	DynStringArray parameters = new DynStringArray();
	parameters.add(session.getAttribute("temp_solicitante_v2_id").toString());

	int x = Database.callProc("p_del_solicitante", parameters);

	response.sendRedirect("/onpar/main.jsp?target=solicitantes");

%>