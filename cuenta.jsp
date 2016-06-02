<html>
<body>
<strong>Editar Cuenta</strong> <a href="/onpar/cuentatopdf.jsp" target="_blank">Printer Friendly</a><br>

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