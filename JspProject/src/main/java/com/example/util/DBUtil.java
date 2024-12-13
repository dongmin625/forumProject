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
				
				if (inputStream == null) {
				    throw new IOException("config.properties 파일을 찾을 수 없습니다.");
				}else {
				    System.out.println("config.properties 파일을 성공적으로 로드했습니다.");
				    try {
				        properties.load(inputStream); //load 하는 부분 없으면 null 값으로 들어가버럼(주의)
				        
				        // 파일에 있는 모든 키와 값을 출력해봄
				        properties.forEach((key, value) -> {
				            System.out.println(key + ": " + value);
				        });
				    } catch (IOException e) {
				        e.printStackTrace();
				    }
				}
				
				//Build Path Add Folder 하니 해결됨
				
				// DB 연결 URL , 사용자명 , 비밀번호
				String jdbcUrl =  properties.getProperty("db.url");
				String username = properties.getProperty("db.username");
				String password = properties.getProperty("db.password");
				
				//값이 잘 들어갔는지 확인 로직
				System.out.println("jdbcUrl: " + (jdbcUrl == null ? "null" : jdbcUrl));
				System.out.println("username: " + (username == null ? "null" : username));
				System.out.println("password: " + (password == null ? "null" : password));
				
				if (jdbcUrl == null || username == null || password == null) {
				    throw new SQLException("DB 연결 정보를 찾을 수 없습니다.");
				}

				System.out.println("DB URL: " + jdbcUrl); //url 확인
				
				return DriverManager.getConnection(jdbcUrl,username,password);
			}catch(ClassNotFoundException e) {
				// 드라이버 로드 실패시 예외 처리
				throw new SQLException("JDBC Driver를 찾을수 없습니다.");
			}
		}
		
}
