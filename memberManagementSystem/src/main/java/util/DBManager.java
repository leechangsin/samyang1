package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {
	
	public static Connection getConnection() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/samyang");
			return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return null;
		} // end try
	}// end getConnection()
	
	public static void closeConnection(Connection conn, PreparedStatement pstmt) {
		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getErrorCode());
		} // end try
	}// end closeConnection(Connection conn, PreparedStatement pstmt)
}