<!-- regiterProcess.jsp -->
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	//MySQL JDBC 드라이버 로드
	try {
    	Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL JDBC 드라이버를 명시적으로 로드
	} catch (ClassNotFoundException e) {
    	e.printStackTrace();
    	out.println("<h1>MySQL JDBC 드라이버 로드 실패: " + e.getMessage() + "</h1>");
    	return;  // 드라이버 로드 실패 시 코드 실행 종료
	}

	//프로퍼티 생성
	Properties properties = new Properties();
	
	//프로퍼티 가져옴
	InputStream inputStream = getClass().getClassLoader().getResourceAsStream("config.properties");
	
	if (inputStream != null) {
		properties.load(inputStream);
	} else {
		out.println("<h1>config.properties 파일을 찾을 수 없습니다.</h1>");
		return;
	}
	
	 // DB 연결 정보
    String jdbcUrl = properties.getProperty("db.url");
    String dbUser = properties.getProperty("db.username");
    String dbPassword = properties.getProperty("db.password");
    
    
	
    
    //사용자 입력 값 가져오기
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	
	System.out.println("입력된 값 확인:");
    System.out.println("이메일: " + email);
    System.out.println("비밀번호: " + password);
    System.out.println("닉네임: " + nickname);
	
	
 	// DB 연결 및 중복 이메일 체크
    String checkEmailQuery = "SELECT COUNT(*) FROM users WHERE email = ?";
    
    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
         PreparedStatement preparedStatement = connection.prepareStatement(checkEmailQuery)) {

        preparedStatement.setString(1, email);
        
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next() && resultSet.getInt(1) > 0) {
                // 이미 등록된 이메일이 있음
                out.println("<script>alert('이미 등록된 이메일입니다.'); window.location='signup.jsp';</script>");
            } else {
                // 이메일이 중복되지 않으면 회원가입 진행
                String insertUserQuery = "INSERT INTO users (email, password, nickname) VALUES (?, ?, ?)";
                try (PreparedStatement insertStatement = connection.prepareStatement(insertUserQuery)) {
                    insertStatement.setString(1, email);
                    insertStatement.setString(2, password);
                    insertStatement.setString(3, nickname);
                    
                    int rowsAffected = insertStatement.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<script>alert('회원가입 성공!'); window.location='../login/loginpage.jsp';</script>");
                    } else {
                        out.println("<script>alert('회원가입 실패!'); window.location='signup.jsp';</script>");
                    }
                }
            }
        }
    } catch (SQLException e) {
        out.println("<script>alert('DB 연결 오류: " + e.getMessage() + "'); window.location='signup.jsp';</script>");
        e.printStackTrace();
    }

%>