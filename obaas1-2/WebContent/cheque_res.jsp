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
  <li><a href="acmod_req.jsp">A/C MOD</a><li>
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
try {
 int accountno=0;
 int requestno=0;
 int amount =0;
 Connection con1=GetCon.getCon();
 //PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
 PreparedStatement ps1=con1.prepareStatement("Select max(requestno) from chequebook");

 ResultSet rs1=ps1.executeQuery();
 if(rs1.next()){
 requestno=rs1.getInt(1);
 }
 Connection con3=GetCon.getCon();
//PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
PreparedStatement ps3=con3.prepareStatement("Select accountno from chequebook where requestno='"+requestno+"'");

 ResultSet rs3=ps3.executeQuery();
 if(rs3.next()){
 accountno=rs3.getInt(1);}

 Connection con2=GetCon.getCon();
 //PreparedStatement ps1=con1.prepareStatement("Select max(accountno) from newaccount");
PreparedStatement ps2=con2.prepareStatement("Select amount from newaccount where accountno='"+accountno+"'");

 ResultSet rs2=ps2.executeQuery();
 if(rs2.next()){
 amount=rs2.getInt(1);}

out.print("Your request for new cheque book has been accepted. Your request no is "+requestno+ " . Your account	balance is "+amount);



 } catch (SQLException e) {
 e.printStackTrace();
 }

 %></table><%
%>


 </table>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="pack_bank.*" %> 