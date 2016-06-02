<%@ taglib uri="http://pd4ml.com/tlds/pd4ml/2.6" prefix="pd4ml" %>
<%@page contentType="text/html; charset=ISO8859_1"%>
<pd4ml:transform
	screenWidth="400"
	pageFormat="A5"
	pageOrientation="landscape"
	pageInsets="100,100,100,100,points"
	enableImageSplit="false">
<html>
<body>
Editar Cuenta<br>

id: <%= session.getAttribute("id") %><br>
user_status_cd: <%= session.getAttribute("user_status_cd") %><br>
role_id: <%= session.getAttribute("role_id") %><br>
email: <%= session.getAttribute("email") %><br>
pwd: <%= session.getAttribute("pwd") %><br>
first_nm: <%= session.getAttribute("first_nm") %><br>
last_nm: <%= session.getAttribute("last_nm") %><br>
position_title: <%= session.getAttribute("position_title") %><br>
organization: <%= session.getAttribute("organization") %><br>
tel_nbr: <%= session.getAttribute("tel_nbr") %><br>
skype hande: <%= session.getAttribute("skype_handle") %><br>
alternate: <%= session.getAttribute("alternate") %><br>
last_mod_tmstmp: <%= session.getAttribute("last_mod_tmstmp") %><br>

</body>
</html>
</pd4ml:transform>