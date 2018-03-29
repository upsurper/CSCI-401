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
 <div id="services"><h1></h1>


 </div>
 </td>

 <td width="1200" valign="top">

 <%
%>
<table><%
 String num=request.getParameter("accountno");
 int accountno=Integer.parseInt(num);
 String username=request.getParameter("username");
 String password=request.getParameter("password");
 boolean status=VerifyLogin.checkLogin(accountno,username,password);
 //if(status==true){
 // out.print("Welcome " + username);
 try {
 if(status==true){
 out.print("Welcome " + username);

 Connection con=GetCon.getCon();
 PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
 ps.setInt(1,accountno);
 ResultSet rs=ps.executeQuery();

 out.print("<table align='left' cellspacing='5' cellpadding='5'>");
 out.print("<tr><th>ACCOUNTNO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
 while(rs.next()){
 int accountno1=rs.getInt(1);
 //session.setAttribute("accountno",accountno1);

 //System.out.print(accountno);

 out.print("<tr>");
 out.print("<td>" + rs.getInt(1) + "</td>");
 out.print("<td>" + rs.getString(2) + "</td>");
 out.print("<td>" + rs.getInt(5) + "</td>");
 out.print("<td>" + rs.getString(6) + "</td>");
 out.print("<td>" + rs.getInt(7) + "</td>");
 out.print("</tr>");

 }
 out.print("</table>");

 }
 else{
 out.print("Please check your username and Password");
 request.setAttribute("balance","Please check your username and Password");
 %> 
 <jsp:forward page="balance_req.jsp"></jsp:forward>
 <%
 }
 }catch (SQLException e) {
 e.printStackTrace();
 }

 //}

 //}
 %></table><%
%>


 </table>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="pack_bank.*" %> 
