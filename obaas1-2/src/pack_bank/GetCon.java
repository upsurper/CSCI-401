
package pack_bank;

import java.sql.*;
import java.io.*;

public class GetCon {
	private GetCon() {
	}

	public static Connection con;
	static {
		try {
			Class.forName(DBInitializer.DRIVER);
			con = DriverManager.getConnection(DBInitializer.CON_STRING, DBInitializer.USERNAME, DBInitializer.PASSWORD);
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			System.out.println("Exception in GetCon");
		}

	}

	public static Connection getCon() {
		return con;
	}

	public static int getPrimaryKey() {
		int nextvalue = 0;
		Connection con = GetCon.getCon();
		PreparedStatement ps2;
		try {

			ps2 = con.prepareStatement("select bank_seq.nextval from dual");

			ResultSet rs = ps2.executeQuery();
			rs.next();
			nextvalue = rs.getInt(1);
			System.out.println(nextvalue);

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return nextvalue;
	}
}
