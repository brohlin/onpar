<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="org.onpar.database.*" %>
<%@ page import="org.onpar.log.*" %>
<%@ page import="org.onpar.utils.*" %>
<%@ page import="org.onpar.utils.arrays.*" %>


<%
	String _status_of_case = request.getParameter("status_of_case");
	
	DynStringArray parameters = new DynStringArray();
	parameters.add(session.getAttribute("temp_solicitante_v2_id").toString());
	parameters.add(_status_of_case);

	int x = Database.callProc("p_upd_solicitante_status", parameters);

	response.sendRedirect("/onpar/main.jsp?target=solicitantes");

%>