package pack_bank;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.Naming;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//This is the controller class for user inputs and redirecting to different pieces of codes for processing
public class CreateServlet extends HttpServlet {

	/**
	*
	*/
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int status;
		int ano;
		int err = 0;
		double amount = 0;
		double phone = 0;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("repassword");

		String amoun = request.getParameter("amount");
		if (amoun != null) {
			amount = Double.parseDouble(amoun);
		}

		String adderess = request.getParameter("adderess");

		String ph = request.getParameter("phone");
		if (ph != null) {
			phone = Double.parseDouble(ph);
		}

		String catg = request.getParameter("cat");

		String acno = request.getParameter("acno");

		// account number is checked to see if it already exists (if user account
		// already created) or not
		if (acno != null) {
			ano = Integer.parseInt(acno);
		} else {
			ano = 0;
		}

		String reqtype = request.getParameter("Req_Type");
		// here it is checked to see if an account has at least $5 balance so that
		// cheque book can be issued
		if (ano > 0) {
			boolean stat = VerifyLogin.checkLogin(ano, username, password);
			if (stat == true) {
				Connection con = GetCon.getCon();
				PreparedStatement ps;
				try {
					ps = con.prepareStatement("Select * from NEWACCOUNT where accountno='" + ano + "'");
					ResultSet rs;
					rs = ps.executeQuery();
					if (rs.next()) {
						if (rs.getInt(5) > 5) {

							status = RegisterUser.regchq(ano, reqtype);
							// }
							// if(RegisterUser.regchq(ano, reqtype)>0){
							// out.print("Your chequebook request has been accepted.");
							RequestDispatcher rd = request.getRequestDispatcher("cheque_res.jsp");
							rd.include(request, response);
						} else {
							// if balance less than $5 then cheque book can not be issues
							err = 2;
							request.setAttribute("err", err);
							RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
							rd.include(request, response);
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else
			// Incorrect User Name, Password or Account No
			{
				err = 1;
				request.setAttribute("err", err);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.include(request, response);
			}
		} else {
			status = RegisterUser.register(username, password, repassword, amount, adderess, phone, catg);
			if (status > 0) {
				// out.print("WELCOME! YOUR ACCOUNT HAS OPENED");
				RequestDispatcher rd = request.getRequestDispatcher("create_res.jsp");
				rd.include(request, response);
			} else {
				// Registration failed
				err = 3;
				request.setAttribute("err", err);
				RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
				rd.include(request, response);
			}
		}
	}

}
