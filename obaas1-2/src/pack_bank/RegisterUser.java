package pack_bank;

import java.sql.*;
//This class is used for creating new account and new cheque book service request
import pack_bank.GetCon;

public class RegisterUser {
	static int status = 0;


	public static int register(String username, String password, String repassword, double amount, String adderess,
			double phone, String category) {
		Connection con = GetCon.getCon();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Insert into NEWACCOUNT values(?,?,?,?,?,?,?,?)");
			int nextvalue1 = GetCon.getPrimaryKey();
			ps.setInt(1, nextvalue1);
			ps.setString(2, username);
			ps.setString(3, password);
			ps.setString(4, repassword);
			ps.setDouble(5, amount);
			ps.setString(6, adderess);
			ps.setDouble(7, phone);
			ps.setString(8, category);
			status = ps.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return status;

	}

	public static int regchq(int acno, String reqtype) {
		Connection con = GetCon.getCon();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("Insert into chequebook values(?,?,?)");
			int nextvalue1 = GetCon.getPrimaryKey();
			double amt = 0;
			ps.setInt(1, acno);
			ps.setInt(2, nextvalue1);
			ps.setString(3, reqtype);
			status = ps.executeUpdate();
			String whr;
			whr = " where accountno = ";
			whr = whr + acno;
			ps = con.prepareStatement("select amount from newaccount" + whr);
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				String amount = rs1.getString(1);
				amt = Double.parseDouble(amount);
				amt = amt - 5;
			}
			ps = con.prepareStatement("update newaccount set amount = " + amt + whr);
			status = ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return status;
	}
}
