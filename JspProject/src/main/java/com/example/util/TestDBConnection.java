package com.example.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            // DB 연결을 위한 getConnection 호출
            Connection connection = DBUtil.getConnection();
            
            if (connection != null) {
                System.out.println("데이터베이스 연결 성공!");
            }
        } catch (SQLException | IOException e) {
            // 예외 발생 시 오류 메시지 출력
            System.out.println("데이터베이스 연결 실패: " + e.getMessage());
        }
    }
}
