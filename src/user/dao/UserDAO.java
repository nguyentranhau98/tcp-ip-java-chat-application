package user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.User;
import util.DBConnectionUtil;
import util.DefineUtil;

public class UserDAO {
	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public User checkDuplicate(String username, String password) {
		User objUser = null;
		conn = DBConnectionUtil.getConnection();
		String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			if(rs.next()) {
				objUser = new User(rs.getString("username"), rs.getString("password"), rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn, rs);
		}
		return objUser;
	}

	public int register(User newUser) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "INSERT INTO users(username, password, status) VALUES(?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, newUser.getUsername());
			pst.setString(2, newUser.getPassword());
			pst.setInt(3, newUser.getStatus());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
	}

	public int login(String username, String password) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE users SET status = ? WHERE username = ? AND password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, DefineUtil.LOGGED);
			pst.setString(2, username);
			pst.setString(3, password);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
		
	}
	
	public int logout(String username) {
		int result = 0;
		conn = DBConnectionUtil.getConnection();
		String sql = "UPDATE users SET status = ? WHERE username = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, DefineUtil.UNLOGGED);
			pst.setString(2, username);
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionUtil.close(pst, conn);
		}
		return result;
		
	}

}
