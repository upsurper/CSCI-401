
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<SCRIPT LANGUAGE="JavaScript">
// login validation script
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
</head>
<body>
	<div id="top_links">
		<div id="header">
			<h1>
				OBAAS system<span class="style1"></span>
			</h1>
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
				<li><a href="acmod_req.jsp">A/C MOD</a></li>
				<li></li>
			</ul>
		</div>
		<table style="width: 897px; background: #FFFFFF; margin: 0 auto;">
			<tr>
				<td width="300" valign="top"
					style="border-right: #666666 1px dotted;">
					<div id="services">
						<h1></h1>


					</div>
				</td>

				<td width="1200" valign="top">
					<%%>
					<table>
						<%
												
	
 //Parameters from the login field that can be changed
 String num=request.getParameter("accountno");
 int accountno=Integer.parseInt(num);
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 String address = "";
 Long phone = null;
 // verifies correct login
 boolean status=VerifyLogin.checkLogin(accountno,username,password);
 if(status == true){}
 else{
	 // sends you back to the previous page if the login credentials were not correct.
	 %>
	 <jsp:forward page="acmod_req.jsp"></jsp:forward>
	 <%
 }
	try {
		// connects to the database to get the changable values that weren't used to login with. AKA address and phone number
		Connection con=GetCon.getCon();
		PreparedStatement ps;
		 
		ps = con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
		address = rs.getString(6);
		phone = rs.getLong(7);
		}
	
	 } catch (SQLException e) {
		 e.printStackTrace();
     }
	
 
 %>
</table>
<% %>

<td width="1200" valign="top">
 <div id="welcome" style="border-right:#666666 1px dotted;"><h1>UPDATE ACCOUNT FORM</h1><br>
 <table align="center" bgcolor="white">
 <tr></tr><tr><td>
 <form name=F1 onSubmit="return validate(this)" action="acmod_res2.jsp" >
 <table cellspacing="5" cellpadding="3">
 <% // text boxes where your new values for the account may be entered they all default to the current values of the account. %>
 <tr><td> <input type="hidden" name="accountno" value = "<%=accountno%>"/></td></tr>
 <tr><td>USER NAME:</td><td> <input type="text" name="username" value = "<%=username%>" /></td></tr>
 <tr><td>PASSWORD:</td><td> <input type="password" name="password" value = "<%=password%>" /></td></tr>
 <tr><td>RE-PASSWORD:</td><td> <input type="password" name="repassword" value = "<%=password%>" /></td></tr>
 <tr><td>ADDRESS:</td><td> <input type="text" name="address" value = "<%=address%>" /></td></tr>
 <tr><td>PHONE:</td><td> <input type="text" name="phone" value = "<%=phone%>"/></td></tr>
 <tr><td></td><td><input type="submit" value="Submit"/></td></tr>
		</table>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="pack_bank.*"%>

	</div>
</body>
</html>