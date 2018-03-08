package pack_bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//This class checks any request from user by validating the user from database records
public class VerifyLogin {
public static boolean checkLogin(int accountno,String username,String password){
 boolean status=false;
 Connection con=GetCon.getCon();
 try {
 PreparedStatement ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=? and\r\n" + 
 		"username = ? and password =?");
 ps.setInt(1,accountno);
 ps.setString(2,username);
 ps.setString(3,password);

 ResultSet rs=ps.executeQuery();
 status=rs.next();

 } catch (SQLException e) {
 e.printStackTrace();
 }
 return status;
}
}