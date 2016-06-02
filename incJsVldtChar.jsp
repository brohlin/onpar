<!--- TEMPLATE : Function to check special characters --->
<script language="JavaScript">
function checkSplChrs()
{

	var msg = "";
	for (i = 0; i < document.forms[0].length; i++)
	{
		// check to see if the field is a password field
		if (document.forms[0].elements[i].type =="password" )
		{
			for(j=0; j<document.forms[0].elements[i].value.length; ++j)
			{
				if(document.forms[0].elements[i].value.charAt(j) ==  "##" )
				{
				msg = "You have an invalid character in the "
				msg = msg + document.forms[0].elements[i].id
				msg = msg + " field. You may not have the '##' character in this field."
				alert(msg);
				document.forms[0].elements[i].focus();
				return false;
				}
			}
		}
		// for non-password field
		else if (document.forms[0].elements[i].type =="text"  || document.forms[0].elements[i].type =="textarea" )
		{
			for(j=0; j<document.forms[0].elements[i].value.length; ++j)
			{
				if(document.forms[0].elements[i].value.charAt(j) ==  "~" || document.forms[0].elements[i].value.charAt(j) ==  "##" || document.forms[0].elements[i].value.charAt(j) ==  "|" )
				{
					msg = "You have an invalid character in the "
					msg = msg + document.forms[0].elements[i].id
					msg = msg + " field. You may not have the ##, ~, |, characters in this field."
					alert(msg);
					document.forms[0].elements[i].focus();
					return false;
				}
			}
		}
	}
return true;
}

</script>