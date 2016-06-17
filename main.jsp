<!--- Load HTML header --->
<%@include file="/incHeader.jsp"%>
 	
 <%
 	String mSearch = "Record Found";
 
 	try {
		mSearch = request.getParameter("search");
		if (mSearch.equals("norecfound")) {
			mSearch = "No se encontró registro. Por favor, inténtelo de nuevo.";
		} else if (mSearch == null) {
			mSearch = "";
		}
	} catch (Exception ex) {
		// dont do anything here
	}
 
  	String mLast_name = "";
  	String mCaso = "";
 
 	try {
		mLast_name = request.getParameter("last_name");
		mCaso = request.getParameter("id"); 
		if (mLast_name == null) {
			mLast_name = "";
		} else {
			mLast_name = mLast_name.toLowerCase();
		}
		if (mCaso == null) {
			mCaso = "";
		}	
	} catch (Exception ex) {
		// dont do anything here
	}
 
 %>
 	
<!--- Start body --->
<div id="page">
<body bgcolor="FFFFFF" onload="return checkBrowser()">
	<table border="0" cellpadding="0" cellspacing="0" width="800">
		<tr>
			<td valign="top" height="100%">
				<!--- Start main table --->
				<table border="0" cellpadding="0" cellspacing="0" width="800">
					<tr>
	 					<td align="left"><!-- img src="/onpar/img/mingob_onpar_header.png" height="74" -->&nbsp;</td>					
	 					<td align="center" bgcolor="FFFFFF" height="74" class="hdrBlackTxt20">Oficina Nacional Para la Atención de Refugiados</td>
	 					<td align="right"><img src="/onpar/img/mingob_header.png" height="74"></td>
					</tr>
					<br>
					<tr>
						<td valign="top" colspan="3" height="27" bgcolor="C0C0C0" width="800"></td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="800">
					<tr>
						<!--- Load navigation --->
						<td valign="top" width="170" background="/onpar/img/nav_bg2.gif" width="800">
						
					
							<%@include file="/control_nav.jsp" %>

						</td>
						<!--- Load page contents from target parameter/variable --->
						<td valign="top" width="615" align="left">
							<a name="content"></a>
							<img src="/onpar/img/spacer.gif" width="625" height="10" border="0" alt="Blank Spacer Image">

							<noscript>
								<span class="boldRedTxt">
									<p>Esta página está intentando ejecutar JavaScript y su navegador no soporta JavaScript o es posible que tenga vuelta-apagado JavaScript. Si tiene desactivado JavaScript en su equipo, por favor, active JavaScript.
									</p>
								</span>
							</noscript>


							<!--- Call the target page --->
							<%
								if (mTarget != null) {
									if (mTarget.equals("acceder")) { 
							%>
										<%@include file="/acceder.jsp" %>
							<%
									} else if (mTarget.equals("registrar")) {
							%>
										<%@include file="/registrar.jsp" %>
							<%	
									} else if (mTarget.equals("cuenta")) {
							%>
										<%@include file="/cuenta_de_usuario.jsp" %>									
							<%
									} else if (mTarget.equals("cuenta_adm")) {
							%>
										<%@include file="/cuenta_de_usuario_adm.jsp" %>
							<%										
									} else if (mTarget.equals("inicio")) {
							%>
										<%@include file="/inicio.jsp" %>
							<% 
									} else if (mTarget.equals("reportes")) {
							%>
										<jsp:include page="/reportes_menu.jsp" />
							<%
									}  else if (mTarget.equals("reporte_edad_por_pais")) {
							%>
										<jsp:include page="/reporte_edad_por_pais.jsp" />
							<%
									}  else if (mTarget.equals("reporte_pais_sexo_edad_ano")) {
							%>
										<jsp:include page="/reporte_pais_sexo_edad_ano.jsp" />
							<%
									}  else if (mTarget.equals("reporte_pais_sexo_edad_ano_trimestre")) {
							%>
										<jsp:include page="/reporte_pais_sexo_edad_ano_trimestre.jsp" />
							<%
									}  else if (mTarget.equals("reporte_estatus_casos")) {
							%>
										<jsp:include page="/reporte_estatus_casos.jsp" />
							<%
									}  else if (mTarget.equals("reporte_estatus_casos_2015")) {
							%>
										<jsp:include page="/reporte_estatus_casos_2015.jsp" />
							<%
									}   else if (mTarget.equals("reporte_estatus_casos_2016")) {
							%>
										<jsp:include page="/reporte_estatus_casos_2016.jsp" />
							<%
									}   else if (mTarget.equals("usuarios")) {
							%>
										<%@include file="/usuarios.jsp" %>
							<%
									} else if (mTarget.equals("solicitantes")) {
							%>
										<%@include file="/solicitantes.jsp" %>										
							<%
									} else if (mTarget.equals("solicitante")) {
							%>
										<jsp:include page="/solicitante.jsp" />	
							<%
									} else if (mTarget.equals("solicitante_v2")) {
							%>
										<jsp:include page="/solicitante_v2.jsp" />	
							<%
									} else if (mTarget.equals("solicitante_upd")) {
							%>
										<%@include file="/solicitante_upd.jsp" %>																												
							<%							
								    } else if (mTarget.equals("solicitante_upd_v2")) {
							%>
										<jsp:include page="/solicitante_upd_v2.jsp" />																												
							<%							
								    } else if (mTarget.equals("miembro_de_familia")) {
							%>
										<%@include file="/miembro_de_familia.jsp" %>																												
							<%							
								    } else if (mTarget.equals("miembro_de_familia_upd")) {
							%>
										<%@include file="/miembro_de_familia_upd.jsp" %>
							<%							
								    } else if (mTarget.equals("prueba_upd")) {
							%>
										<%@include file="/prueba_upd.jsp" %>																												
							<%																	
								    } else if (mTarget.equals("prueba_upd_v2")) {
							%>
										<jsp:include page="/prueba_upd_v2.jsp" />																											
							<%																	
								    } else if (mTarget.equals("prueba")) {
							%>
										<%@include file="/prueba.jsp" %>																												
							<%															
								    } else if (mTarget.equals("prueba_v2")) {
							%>
										<jsp:include page="/prueba_v2.jsp" />																												
							<%															
								    } else if (mTarget.equals("resolucion_v2")) {
							%>
										<jsp:include page="/resolucion_v2.jsp" />	
																																					
							<%															
								    } else if (mTarget.equals("resolucion_upd_v2")) {
							%>
										<jsp:include page="/resolucion_upd_v2.jsp" />																											
							<%																	
								    }  else if (mTarget.equals("solicitante_8campos_v2")) {
							%>
										<jsp:include page="/solicitante_8campos_v2.jsp" />																												
							<%															
								    } else if (mTarget.equals("export_to_excel")) {
							%>
										<jsp:include page="/export_to_excel.jsp" />																												
							<%															
								    }  else {
							%>							
									<jsp:include page="/under_construction.jsp" />	
							<%
									}
								}
							%>						
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	
</body>
</div>

<%@include file="/incFooter.jsp"%>
</html>