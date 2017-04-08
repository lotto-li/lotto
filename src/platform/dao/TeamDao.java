package platform.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import platform.util.JdbcCURD;

public class TeamDao {
	
	JdbcCURD curd = new JdbcCURD();
	
	public static void main(String[] args) throws ClassNotFoundException,
	SQLException {

	JdbcCURD curd = new JdbcCURD();
//	String queryString = "select username from t_team where id = '1'";
//	curd.Query(queryString);
//	String addString = "insert into t_team  (id,teamName) values (2,2,2,2,sysdate)";
//	curd.addElement(addString);
//	Map<Object, Object> map = new HashMap<>();
//	map.put("id", "3");
//	map.put("username", "admin");
//	map.put("userpwd", "e10adc3949ba59abbe56e057f20f883e");
//	map.put("email", "1134994815@qq.com");
//	
//	addUser(map);
	}
}
