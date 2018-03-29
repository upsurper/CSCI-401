<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
 for(var i=0; i<3; i++)
 {
 if(!isNaN(form.elements[i].value))
 {
 alert("This Field must be in Characters")
 form.elements[i].value=""
 form.elements[i].focus() 
 return false
 }
 }
 if(document.F1.password.value!=document.F1.repassword.value)
 {
 alert("retype password is not matching with password. Please re-enter repassword");
 document.F1.repassword.value=""
 document.F1.repassword.focus()
 return false
 }


 if(!isNaN(document.F1.phone.value))
 {
 if(document.F1.phone.value >9999999999 )
 {
 alert("Phone number must be 10 digits long. Please re-enter phone number")
 document.F1.phone.value=""
 document.F1.phone.focus()
 return false
 }
 }
 else
 {
 alert("This field must be number")
 document.F1.phone.value=""
 document.F1.phone.focus()
 return false
 }


 for(var i=0; i<form.elements.length; i++)
 {
 if(form.elements[i].value == "")
 {
 alert("Fill out all Fields")
 document.F1.username.focus()
 return false
 }
 }

 return true
 }
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Bank Access System - OBAAAS</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck1()
{
var sds = document.getElementById("form");
}
</script>
</head>
<body>
<div id="top_links">

<div id="header">
 <h1>OBAAS system<span class="style1"></span></h1>
 <h2>Welcome to the online bank access service</h2>
 </div> 
<div id="navigation">
 <ul>
 <li><a href="create_req.jsp">NEW ACCOUNT</a></li>
 <li><a href="balance_req.jsp">BALANCE</a></li>
 <li><a href="cheque_req.jsp">SERVICE REQUEST</a></li>
 <li><a href="paybills_req.jsp">PAY BILLS</a></li>
 <li><a href="transfer_req.jsp">TRANSFER</a></li>
 <li><a href="close_req.jsp">CLOSE A/C</a></li>
 <li><a href="acmod_req.jsp">A/C MOD</a><li>
 </ul>
</div>
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
 <td width="300" valign="top" style="border-right:#666666 1px dotted;">
 <div id="services"><h1></h1>


 </div>
 </td>

 <td width="1200" valign="top">
 <div id="welcome" style="border-right:#666666 1px dotted;"><h1>OPEN ACCOUNT FORM</h1><br>
 <table align="center" bgcolor="white">
 <tr>

 </tr>
 <tr>
 <td>
 <form name=F1 onSubmit="return validate(this)" action="CreateServlet" >
 <table cellspacing="5" cellpadding="3">

 <tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
 <tr><td>PASSWORD:</td><td> <input type="password"
name="password"/></td></tr>
 <tr><td>RE-PASSWORD:</td><td> <input type="password"
name="repassword"/></td></tr>
 <tr><td> <input type="hidden" name="amount" value="500"/></td></tr>

 <tr><td>ADDRESS:</td><td> <input type="text" name="adderess"/></td></tr>
 <tr><td>PHONE:</td><td> <input type="text" name="phone"/></td></tr>
 <tr><td>CATEGORY:</td><td> <input type="text" name="cat" value="U"
readonly/></td></tr>
 <tr><td> <input type="hidden" name="acno" value = "0"/></td></tr>
 <tr><td></td><td><input type="submit" value="Submit"/>

 <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
 </table>
 </form>
 </td>
 </tr>

 </table>
 </div>
 </td>

 <td width="299" valign="top">
 <div id="welcome" style="border-right:#666666 1px dotted;">
 <center></center>


 </div>
 </td>


</tr></table>

<div id="footer_top">
 <div id="footer_navigation">
 
 </div>

 <div id="footer_copyright" >

 <center></center><br>
 <p></p>

 Developed by Ashfaque Ahmed & Javed Akhtar</div>
</div>
<script type="text/javascript">
document.onload = ctck();
</script>
</div>
</body>
</html> 
