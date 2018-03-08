<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Bank Access System - OBAAAS</title>
<link href="style.css" rel="stylesheet" type="text/css">
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
<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
 <td width="300" valign="top" style="border-right:#666666 1px dotted;">

 </td>

 <td width="1200" valign="top">

 <%
%>
<table><%
 int err = (Integer) request.getAttribute("err");
 out.print("<table align='left' cellspacing='5' cellpadding='5'>");
if (err==1) {out.print("<tr><td>Incorrect User Name, Password or Account No! Please try again</td></tr>");} 
 if (err==2) {out.print("<tr><td>Chequebook request failed! Please try again.</td></tr>");}
 if (err==3) {out.print("<tr><td>Registration Failed! Please try again</td></tr>");}
 out.print("</table>");


 %></table><%
%>


 </table>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="pack_bank.*" %> 
