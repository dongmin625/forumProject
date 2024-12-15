<!-- loginProcess.jsp -->
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
  
  
  	//클라이언트로 부터 이메일과 비밀번호를 가져오기
  	String email = request.getParameter("email");
  	String password = request.getParameter("password");
  
  	//로그인 시도
  	if(email==null||password==null|| email.isEmpty() || password.isEmpty()){
  		 out.println("<script>alert('이메일과 비밀번호를 입력하세요');</script>");
  		 return;
  	}
  	
 	// 로그인 처리
    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                	// 로그인 성공 - 세션 생성
                    HttpSession session2 = request.getSession();
                    session.setAttribute("email", email);  // 사용자 이메일을 세션에 저장
                    session.setAttribute("nickname", resultSet.getString("nickname"));  // 사용자 이름 저장
                
                    // 로그인 성공
                    out.println("<script>alert('로그인 성공!'); window.location='../main_page/main.jsp';</script>");
                    out.println("<p>환영합니다, " + resultSet.getString("nickname") + "님!</p>");
                } else {
                    // 로그인 실패 -> alert 메시지 출력 후 로그인 페이지로 이동
                    out.println("<script>");
                    out.println("alert('로그인 실패! 이메일 또는 비밀번호가 잘못되었습니다.');");
                    out.println("window.location='../login/loginpage.jsp';"); // 로그인 페이지로 리디렉션
                    out.println("</script>");
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h1>데이터베이스 연결 실패: " + e.getMessage() + "</h1>");
    }
  
  
%>