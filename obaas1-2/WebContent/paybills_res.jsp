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

 String num=request.getParameter("accountno");
 int accountno=Integer.parseInt(num);

 String username=request.getParameter("username");
 String password=request.getParameter("password");

 String num1=request.getParameter("biller");
 int taccountno=Integer.parseInt(num1);

 String amoun=request.getParameter("amount");
 int accoun=Integer.parseInt(amoun);
 String updac = "N";
 //System.out.print (taccountno);
 //accountno=taccountno;
 boolean status=VerifyLogin.checkLogin(accountno,username,password);
 //System.out.print (status);
 //if(status==true){
 // out.print("Welcome " + username);
 try {
 if(status==true)
 { out.print("Welcome " + username + ". ");
 Connection con=GetCon.getCon();
 PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
 ResultSet rs=ps.executeQuery();
 int dataamount=0;
 if(rs.next())
 {
 if(accoun < rs.getInt(5))
 {
 updac = "Y";
 dataamount=rs.getInt(5)-accoun;
 }

 }
 if( updac == "Y")
 { 
 Connection con1=GetCon.getCon();
PreparedStatement ps1=con1.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
 ps1.setInt(1,dataamount);
 ps1.executeUpdate();
 ResultSet rs1=ps1.executeQuery();
 if(rs1.next()){}
 System.out.println("data amonut"+dataamount);
 request.setAttribute("target account A ",dataamount);
 Connection con2=GetCon.getCon();
PreparedStatement ps2=con2.prepareStatement("Select * from NEWACCOUNT where accountno=?");
 ps2.setInt(1,taccountno);
 ResultSet rs2=ps2.executeQuery();
 int dataamount1=0;
 if(rs2.next())
 { dataamount1=rs2.getInt(5)+accoun;
 System.out.println(dataamount1);
 }
 Connection con3=GetCon.getCon();
PreparedStatement ps3=con3.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+taccountno+"'");
 ps3.setInt(1,dataamount1);
 ps3.executeUpdate();
 ResultSet rs3=ps3.executeQuery();
 if(rs3.next())
 { request.setAttribute("target account A",dataamount1);
 request.setAttribute("account B",dataamount);
 {
 out.print("Your bill of $" + accoun + " has been successfully paid.Your new account balance is ");
 out.print(request.getAttribute("account B"));
 }
 }
 }

 else
 {
 out.print("Insufficient amount in your account. Billed amount can not be debited!!!");
request.setAttribute("balance","Insufficient amount in your account. Billed amount can not be debited!!!");

 %>
 <jsp:forward page="paybills_req.jsp"></jsp:forward>
 <%

 }}}catch (SQLException e) {
 e.printStackTrace();
 }

 %></table><%
%>


 </table>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="pack_bank.*" %> 
