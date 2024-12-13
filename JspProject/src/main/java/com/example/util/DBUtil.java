package com.example.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBUtil {

		// MYSQL 데이터 베이스에 연동
		public static Connection getConnection() throws SQLException, IOException{
			try {
				// JDBC 드라이버 로드 (MYSQL 사용)
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				//프로퍼티 파일에서 사용자명과 비밀번호 코드 불러오기
				Properties properties = new Properties();
				InputStream inputStream = DBUtil.class.getClassLoader().getResourceAsStream("config.properties");
				
				// DB 연결 URL , 사용자명 , 비밀번호
				String jdbcUrl =  properties.getProperty("db.url");
				String username = properties.getProperty("db.username");
				String password = properties.getProperty("db.password");
				
				return DriverManager.getConnection(jdbcUrl,username,password);
			}catch(ClassNotFoundException e) {
				// 드라이버 로드 실패시 예외 처리
				throw new SQLException("JDBC Driver를 찾을수 없습니다.");
			}
		}
		
}
