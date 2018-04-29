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
						// all values passed from the previous page			
						 String num=request.getParameter("accountno");
						 int accountno=Integer.parseInt(num);
						 String username=request.getParameter("username");
						 String password=request.getParameter("password");
						 String address = request.getParameter("address");
						 String phone = request.getParameter("phone");
						
						 Connection con=GetCon.getCon();
						 PreparedStatement ps;
						
						try {
							// query that updates all changable values in the NEWACCOUNT table.
							ps = con.prepareStatement("update NEWACCOUNT set username = ?, password = ?, repassword = ?, address = ?, phone= ? where accountno='" + accountno + "'");
							ps.setString(1, username);
							ps.setString(2, password);
							ps.setString(3, password);
							ps.setString(4, address);
							ps.setDouble(5, Double.parseDouble(phone));

							ps.executeUpdate();
						
						 } catch (SQLException e) {
							 e.printStackTrace();
					     }
						
						 out.print("<table align='left' cellspacing='5' cellpadding='5'>");
						 out.print("<tr><th>ACCOUNTNO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
						 // query that returns all information for the modified account
						 PreparedStatement ps1=con.prepareStatement("Select * from NEWACCOUNT where accountno='"+accountno+"'");
						 ResultSet rs = ps1.executeQuery();
						 while(rs.next()){
						 // creates the visible table that reflects the changes made to the account.
						 session.setAttribute("accountno",accountno);
							
						 System.out.print(accountno);
						 out.print("<tr>");
						 out.print("<td>" + rs.getInt(1) + "</td>");
						 out.print("<td>" + rs.getString(2) + "</td>");
						 out.print("<td>" + rs.getString(3) + "</td>");
						 out.print("<td>" + rs.getInt(5) + "</td>");

						 out.print("<td>" + rs.getString(6) + "</td>");
						 out.print("<td>" + rs.getLong(7) + "</td>");

						 out.print("</tr>");

						 }
						 out.print("</table>");
 %>
					</table>
					<%
%>


		</table>
		<%@ page import="java.sql.*"%>
		<%@ page import="java.io.*"%>
		<%@ page import="javax.servlet.*"%>
		<%@ page import="pack_bank.*"%>

	</div>
</body>
</html>