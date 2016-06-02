<%@ page language="java" import="java.sql.*" %>
<%@ page import="javax.sql.*" %>

<%
	String mQuery = "";
	String mMonthLong = "";
	if (mMonth.equals("01")) {
		mMonthLong = "Enero";
	} else if (mMonth.equals("02")) {
		mMonthLong = "Febrero";
	} else if (mMonth.equals("03")) {
		mMonthLong = "Marzo";
	} else if (mMonth.equals("04")) {
		mMonthLong = "Abril";
	} else if (mMonth.equals("05")) {
		mMonthLong = "Mayo";
	} else if (mMonth.equals("06")) {
		mMonthLong = "Junio";
	} else if (mMonth.equals("07")) {
		mMonthLong = "Julio";
	} else if (mMonth.equals("08")) {
		mMonthLong = "Agosto";
	} else if (mMonth.equals("09")) {
		mMonthLong = "Septiembre";
	} else if (mMonth.equals("10")) {
		mMonthLong = "Octubre";
	} else if (mMonth.equals("11")) {
		mMonthLong = "Noviembre";
	} else if (mMonth.equals("12")) {
		mMonthLong = "Diciembre";
	} else if (mMonth.equals("All")) {
		mMonthLong = "Todo el año de";
	}  
	
	if (session.getAttribute("role_id") != null) {
			mQuery = "select l.value, " +
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
					"ifnull(f_get_dependents_count_mes(pre_nacionalidad_lkup,?,?,?),0) " +
					"from lkup l  " +
     				"left join vw_solicitante on pre_nacionalidad_lkup = l.value " +
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
			} else if (mReport_type.equals("Cesación")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Cesación' ";
			} else if (mReport_type.equals("Expulsión")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Expulsió' ";
			} else if (mReport_type.equals("Fallecimiento")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Fallecim' ";
			} else if (mReport_type.equals("Naturalización")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Naturali' ";
			} else if (mReport_type.equals("Reasentamiento")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Reasenta' ";
			} else if (mReport_type.equals("Revocación")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Revocaci' ";
			} else if (mReport_type.equals("Repatriación")) {
				mQuery = mQuery + " and ifnull(adm_estatus_lkup,'')='-99' ";
			} else if (mReport_type.equals("Solicitantes de Admisión al Tramite")) {
				mQuery = mQuery + "";
			}

			if (mMonth.equals("All") || mMonth.equals(""))  {
				mQuery = mQuery + " and date_format(pre_fecha_solicitud_onpar, '%Y')=? ";			
			} else {
				mQuery = mQuery + " and date_format(pre_fecha_solicitud_onpar, '%m')=? and date_format(pre_fecha_solicitud_onpar, '%Y')=? ";
			}				
			// 
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
					"       ifnull(f_get_dependents_total_mes(?,?,?),0) " +
					"		from lkup l " +
					"	left join vw_solicitante on pre_nacionalidad_lkup = l.value " +
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
			} else if (mReport_type.equals("Cesación")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Cesación' ";
			} else if (mReport_type.equals("Expulsión")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Expulsió' ";
			} else if (mReport_type.equals("Fallecimiento")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Fallecim' ";
			} else if (mReport_type.equals("Naturalización")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Naturali' ";
			} else if (mReport_type.equals("Reasentamiento")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Reasenta' ";
			} else if (mReport_type.equals("Revocación")) {
				mQuery = mQuery + " and substr(ifnull(adm_estatus_lkup,''),1,8)='Revocaci' ";
			} else if (mReport_type.equals("Repatriación")) {
				mQuery = mQuery + " and ifnull(adm_estatus_lkup,'')='-99' ";
			} else if (mReport_type.equals("Solicitantes de Admisión al Tramite")) {
				mQuery = mQuery + "";
			}

			if (mMonth.equals("All") || mMonth.equals(""))  {
				mQuery = mQuery + " and date_format(pre_fecha_solicitud_onpar, '%Y')=? ";			
			} else {
				mQuery = mQuery + " and date_format(pre_fecha_solicitud_onpar, '%m')=? and date_format(pre_fecha_solicitud_onpar, '%Y')=? ";
			}	
	}
	
	String mPais_de_origen = "";
	String f0_5 = "";
	String m0_5 = "";
	String f6_11 = "";
	String m6_11 = "";
	String f12_17 = "";
	String m12_17 = "";
	String f18_25 = "";
	String m18_25 = "";
	String f26_36 = "";
	String m26_36 = "";
	String f37_46 = "";
	String m37_46 = "";
	String f47_60 = "";
	String m47_60 = "";
	String f61 = "";
	String m61 = "";
	String fUnknown = "";
	String mUnknown = "";
	String mTotal = "";
	String mDep = "";
	
	
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
			
			if (mMonth.equals("All") || mMonth.equals(""))  {
				prest.setString(1,mReport_type);
				prest.setString(2,mYear);
				prest.setString(3,mMonth);	
				prest.setString(4,mYear);
				prest.setString(5,mReport_type);
				prest.setString(6,mYear);
				prest.setString(7,mMonth);					
				prest.setString(8,mYear);						
			} else {
				prest.setString(1,mReport_type);
				prest.setString(2,mYear);
				prest.setString(3,mMonth);	
				prest.setString(4,mMonth);
				prest.setString(5,mYear);	
				prest.setString(6,mReport_type);
				prest.setString(7,mYear);
				prest.setString(8,mMonth);						
				prest.setString(9,mMonth);
				prest.setString(10,mYear);				
			}				

			
			rs=prest.executeQuery();

			int size = 0;
%>
			<!--- Display list of users. --->
			<table border="1" cellspacing="0" cellpadding="4">
			<tr>
				<td colspan="21">
					<%= mReport_type %>&nbsp;&nbsp;
					<%= mMonthLong %>&nbsp;<%= mYear %>&nbsp;&nbsp;
					&nbsp;&nbsp;
				</td>
				
			</tr>
			<tr>
				<td></td>
				<td colspan="18">Rango de Edades</td>
				<td></td>	
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2">0-5</td>
				<td colspan="2">6-11</td>
				<td colspan="2">12-17</td>
				<td colspan="2">18-25</td>
				<td colspan="2">26-36</td>
				<td colspan="2">37-46</td>
				<td colspan="2">47-60</td>
				<td colspan="2">61+</td>
				<td colspan="2">Desconocido</td>
				<td></td>
				<td></td>						
			</tr>			
			<tr>
				<td>País de Origen</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>F</td>
				<td>M</td>
				<td>Total</td>
				<td>Dep</td>
			</tr>							
<%
			while(rs.next())
			{
				size++;
				mPais_de_origen = rs.getString(1);
				f0_5 = rs.getString(2);
				m0_5 = rs.getString(3);
				f6_11 = rs.getString(4);
				m6_11 = rs.getString(5);
				f12_17 = rs.getString(6);
				m12_17 = rs.getString(7);
				f18_25 = rs.getString(8);
				m18_25 = rs.getString(9);
				f26_36 = rs.getString(10);
				m26_36 = rs.getString(11);
				f37_46 = rs.getString(12);
				m37_46 = rs.getString(13);
				f47_60 = rs.getString(14);
				m47_60 = rs.getString(15);
				f61 = rs.getString(16);
				m61 = rs.getString(17);
				fUnknown = rs.getString(18);
				mUnknown = rs.getString(19);				
				mTotal = rs.getString(20);
				mDep = rs.getString(21);
%>				
			<tr>
				<td><%= mPais_de_origen %></td>
				<td><%= f0_5 %></td>
				<td><%= m0_5 %></td>
				<td><%= f6_11 %></td>
				<td><%= m6_11 %></td>
				<td><%= f12_17 %></td>
				<td><%= m12_17 %></td>
				<td><%= f18_25 %></td>
				<td><%= m18_25 %></td>
				<td><%= f26_36 %></td>
				<td><%= m26_36 %></td>																
				<td><%= f37_46 %></td>
				<td><%= m37_46 %></td>
				<td><%= f47_60 %></td>
				<td><%= m47_60 %></td>
				<td><%= f61 %></td>
				<td><%= m61 %></td>
				<td><%= fUnknown %></td>
				<td><%= mUnknown %></td>
				<td><%= mTotal %></td>
				<td><%= mDep %></td>
			</tr>				
<%				
			}
			
			if (size == 0) {
%>
				<tr><td colspan="21">No hay solicitantes en este estado.</td></tr>
<%						
			}
%>
			</table>
<%
	}
	catch(Exception e){
		System.out.println(mQuery);
		throw e;
	} finally {
		if(prest != null) { prest.close(); }
		if(rs != null) { rs.close(); }
		if(con != null) { con.close(); }
	}
%>