package platform.dao;

import java.sql.SQLException;

import platform.util.JdbcCURD;

public class NoticeDao {
	JdbcCURD curd = new JdbcCURD();
	
	public static void main(String[] args) throws ClassNotFoundException,
	SQLException {

	JdbcCURD curd = new JdbcCURD();
		String username = ("SELECT username FROM lotto.t_notice WHERE id='1';");
		System.out.println(username);
	}

}
