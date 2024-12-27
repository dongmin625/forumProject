<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession session3 = request.getSession(false); // 기존 세션 가져오기
    if (session == null || session.getAttribute("email") == null) {
        // 세션이 없거나 사용자 이메일이 없으면 로그인 페이지로 리디렉션
        response.sendRedirect("../login/loginpage.jsp");
        return;
    }

    String userName = (String) session.getAttribute("nickname"); // 세션에서 사용자 닉네임 가져오기
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로필 페이지</title>
    <style>
        /* 화면 전체 배경 이미지 설정 */
        html {
            background-image: url("../images/profile_background.png");
            background-repeat: no-repeat; /* 이미지 반복 여부 */
            background-size: cover;      /* 화면에 꽉 차게 */
            background-position: center; /* 이미지 중앙 정렬 */
            height: 100%;
            width: 100%;                /* 화면 전체 높이 */
        }

        /* 배경 및 레이아웃 스타일 */
        .container {
            width: 100%;
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex; /* 왼쪽과 오른쪽을 flex로 배치 */
            flex-direction: row; /* 가로로 나열 */
            align-items: flex-start; /* 세로 중앙 정렬 */
            height: auto;
        }

        /* 프로필 사진 스타일 */
        .profile-header {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-right: 20px;
        }

        .profile-header img {
            width: 150px;
            height: 150px;
            border: 2px solid black;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }

        .profile-header h1 {
            font-size: 1.6rem;
        }

        /* 사용자 정보 스타일 */
        .profile-info {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            margin-top: 20px;
        }

        .profile-info p {
            font-size: 1rem;
            color: #333;
            margin-bottom: 10px;
        }

        /* 자기소개 스타일 */
        .profile-description {
            margin-top: 20px;
        }

        .profile-description p {
            font-size: 1rem;
            color: #333;
            padding-top: 10px;
        }
        button {
        padding: 5px 10px;
        background-color: #000000;
        color: #FFFFFF;
        border-radius: 5px;
        border: none;
        cursor: pointer;
        margin: 10px;
    }
    </style>
</head>
<body>

<%  
    // DB 연결
    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버 로드
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<h1>MySQL JDBC 드라이버 로드 실패: " + e.getMessage() + "</h1>");
        return;
    }

    // DB 연결 정보 읽기
    Properties properties = new Properties();
    InputStream inputStream = getClass().getClassLoader().getResourceAsStream("config.properties");
    if (inputStream != null) {
        properties.load(inputStream);
    } else {
        out.println("<h1>config.properties 파일을 찾을 수 없습니다.</h1>");
        return;
    }

    String jdbcUrl = properties.getProperty("db.url");
    String dbUser = properties.getProperty("db.username");
    String dbPassword = properties.getProperty("db.password");

    // DB 연결
    try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
        String sql = "SELECT * FROM user_profile WHERE nickname = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, userName);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            String profilePic = rs.getString("photo"); // 프로필 사진 경로
            String intro = rs.getString("introduce");  // 자기소개
%>
<div class="container">
    <!-- 프로필 헤더 -->
    <div class="profile-header">
        <img src="<%= "../images/kham1.png" %>" alt="프로필 사진">
        <h1><%= userName %></h1>
    </div>

    <!-- 오른쪽 정보 영역 -->
    <div class="profile-info">
        <!-- 프로필 사진 변경 버튼 -->
        <form id="upload-form" action="uploadProfilePic.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="profilePic" accept="image/*" style="display:none;" id="file-input">
            <button type="button" onclick="document.getElementById('file-input').click();">프로필 사진 변경</button>
            <button type="submit">업로드</button>
        </form>

        <!-- 소개글 변경 버튼 -->
        <button>소개글 변경</button>

        <!-- 자기소개 -->
        <div class="profile-description">
            <p><strong>소개:</strong> <%= intro %></p>
        </div>
    </div>
</div>

<%  
        } else {
            out.println("<h2>프로필 정보가 없습니다.</h2>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h1>데이터베이스 오류: " + e.getMessage() + "</h1>");
    }
%>

</body>
</html>
