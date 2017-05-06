package com.lotto.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.lotto.domain.Team;

public class MyConnection {
	public static Connection getConntion(){
		//声明Connection对象
        Connection con = null;
        //驱动程序名
        String driver = "com.mysql.jdbc.Driver";
        //URL指向要访问的数据库名mydata
        String url = "jdbc:mysql://localhost:3306/lotto?useUnicode=true&characterEncoding=utf-8";
        //MySQL配置时的用户名
        String user = "root";
        //MySQL配置时的密码
        String password = "123456";
        //遍历查询结果集
        try {
            //加载驱动程序
            Class.forName(driver);
            //1.getConnection()方法，连接MySQL数据库！！
            con = DriverManager.getConnection(url,user,password);
            
        } catch(ClassNotFoundException e) {   
            //数据库驱动类异常处理
            System.out.println("Sorry,can`t find the Driver!");   
            e.printStackTrace();   
            } catch(SQLException e) {
            //数据库连接失败异常处理
            e.printStackTrace();  
            }catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            System.out.println("数据库数据成功获取！！");
            
        }
        return con;
	}
	
	public static boolean doSave(String sql){
		boolean result = false;
		try{
			Connection con = getConntion();
		Statement statement = con.createStatement();
        //要执行的SQL语句
        
        //3.ResultSet类，用来存放获取的结果集！！
		result = statement.execute(sql);
        
        con.close();
        
		}catch(Exception e) {   
            //数据库驱动类异常处理
            System.out.println("Sorry,can`t find the Driver!");   
            
            e.printStackTrace();
        }finally{
            System.out.println("数据库数据成功获取！！");
        }
		return result;
	}

	public static List<Team> doQuery(){
		boolean result = false;
		ResultSet rs = null;
		Team team = null ;
		List<Team> teams = new ArrayList<Team>();
		try{
			Connection con = getConntion();
		Statement statement = con.createStatement();
        //要执行的SQL语句
        
        //3.ResultSet类，用来存放获取的结果集！！
		rs = statement.executeQuery("SELECT t.create_name,t.id,t.team_name,(select count(1) from t_team_teamers tt where tt.team_id = t.id and tt.teamers_id = 1) isAdd FROM lotto.t_team t");
		while(rs.next()){
			team = new Team();
			team.setId(rs.getLong("id"));
			team.setTeamName(rs.getString("team_name"));
			team.setCreateName(rs.getString("create_name"));
			team.setIsAdd(rs.getString("isAdd"));
			teams.add(team);
		}
		
        con.close();
        
		}catch(Exception e) {   
            //数据库驱动类异常处理
            System.out.println("Sorry,can`t find the Driver!");   
            
            e.printStackTrace();
        }finally{
            System.out.println("数据库数据成功获取！！");
        }
		return teams;
	}
	
}
