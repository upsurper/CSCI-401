<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function validate(form)
{
 for(var i=0; i<form.elements.length; i++)
 {
 if(form.elements[i].value == "")
 {
 alert("Fill out all Fields")
 document.F1.accountno.focus()
 return false
 }
 }
 if(isNaN(document.F1.accountno.value))
 {
 alert("A/C No. must be number & can't be null")
 document.F1.accountno.value=""
 document.F1.accountno.focus()
 return false
 }
 if(!isNaN(document.F1.username.value))
 {
 alert("User Name must be char's & can't be null")
 document.F1.username.value=""
 document.F1.username.focus()
 return false
 } 
 if(!isNaN(document.F1.password.value))
 {
 alert("Password must be char's & can't be null")
 document.F1.password.value=""
 document.F1.password.focus()
 return false
 }

 if(isNaN(document.F1.taccountno.value))
 {
 alert("target account must be number & can't be null")
 document.F1.taccountno.value=""
 document.F1.taccountno.focus()
 return false
 }
 if(document.F1.accountno.value == document.F1.taccountno.value)
 {
 alert("Target account number can not be same as your own account number. Change target accountno");
 document.F1.taccountno.value=""
 document.F1.taccountno.focus()
 return false
 }
 if(isNaN(document.F1.amount.value))
 {
 alert("Amount must be number & can't be null")
 document.F1.amount.value=""
 document.F1.amount.focus()
 return false
 }
 return true
}
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Bank Access System - OBAAAS</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
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
 </ul>
</div> 
<table style="width:800px; background:#FFFFFF; margin:0 auto;">
<tr >
 <td width="100" valign="top" style="border-right:#666666 1px dotted;">

 </td>

 <td width="450" valign="top">
 <div id="welcome" style="border-right:#666666 1px dotted;"><h1>TRANSFER FORM</h1><br>
 <table align="center" bgcolor="white">
 <tr>

 </tr>
 <tr>
 <td><div><%if(request.getAttribute("balance")!=null)
 {
 out.print(request.getAttribute("balance"));
 }

 %></div>
 <form name=F1 onSubmit="return validate(this)" action="transfer_res.jsp" >
 <table cellspacing="5" cellpadding="3">
 <tr><td>ACCOUNT NO:</td><td> <input type="text" name="accountno"/></td></tr>
 <tr><td>USER NAME:</td><td> <input type="text" name="username"/></td></tr>
 <tr><td>PASSWORD:</td><td> <input type="password"
name="password"/></td></tr>
 <tr><td>TARGET ACCOUNT NO:</td><td><input type="text"
name="taccountno"/></td></tr>
 <tr><td>AMOUNT:</td><td> <input type="text" name="amount"/></td></tr>
 <!-- Gender:<br/><br/>
 Male<input type="radio" name="gender" value="male"> Female<input
type="radio" name="gender" value="female"/><br/><br/> -->

 <tr><td></td><td><input type="submit"
value="Submit"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
 </table>
 </form>
 </td>
 </tr>
 </table>
 </div>
 </td>

 <td width="250" valign="top">
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
