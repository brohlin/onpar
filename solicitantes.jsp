<!--- Start tab index --->
<% 
	int mCounter = 0;  
	mCounter++; 
	
	if (mSearch == null) {
		mSearch = "";
	}
%>

<!--- Start display. --->
<table border="0" cellspacing="0" cellpadding="4" width="600">
	<tr> 
		<td valign="top" width="600" colspan="1" class="hdrBlackTxt">
			Administrar Solicitantes
		</td>
		<td>
			<a href="/onpar/guia.pdf" target="_blank">Guía para los usuarios</a>
		</td>		
	</tr>	
	<tr>
		<td colspan="2" width="600">
			Utilice esta interfaz para administrar solicitantes dentro de ONPAR. Para crear un/a solicitante en el ONPAR, pulse el botón "Añadir Nuevo/a Solicitante". Para editar o eliminar un/a solicitante, haga click en el enlace en la segunda columna y siga con las instrucciones en la página siguiente.
		</td>
	</tr>

	<tr>
		<form name="solicitantes_8campos_v2" action="main.jsp?target=solicitante_8campos_v2" method="post">
		<!--- Submit button --->	
			<td colspan="2" align="right">
				<input type="submit" value="Añadir Nuevo/a Solicitante" name="añadir" vspace="0">
			</td>
		</form>		
		<!-- form name="solicitantes_v2" action="main.jsp?target=solicitante_v2" method="post">
			<td align="right">
				<input type="submit" value="Añadir Nuevo/a Solicitante" name="añadir" vspace="0">
			</td>
		</form -->		
	</tr>

	
	
	<form name="solicitantes" action="/onpar/main.jsp?target=solicitantes" method="post">
		<!--- Submit button --->
		<tr>
			<td align="left">Número de Caso 
				<input type="text" value="" name="id" vspace="0" size="5"> o Apellido 
			    <input type="text" value="" name="last_name" vspace="0" size="15">
			    <input type="submit" value="Buscar" name="buscar2" vspace="0">
			    <%= mSearch %>
			</td>
		</tr>
	</form>	
</table>

<%@include file="sql_get_solicitantes.jsp"%>