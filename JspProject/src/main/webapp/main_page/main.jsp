<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    HttpSession session2 = request.getSession(false);  // 기존 세션 가져오기, 세션이 없으면 null 반환
    if (session == null || session.getAttribute("email") == null) {
        // 세션이 없거나 사용자 이메일이 세션에 없으면 로그인 페이지로 리디렉션
        response.sendRedirect("../login/loginpage.jsp");
        return;
    }

    String userName = (String) session.getAttribute("nickname");  // 세션에서 사용자 이름 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬창 블로그</title>
<style>
	html {
            background-image: url("../images/webpage_background.png");
            background-repeat: no-repeat; /* 이미지 반복 여부 */
            background-size: cover;      /* 화면에 꽉 차게 */
            background-position: center; /* 이미지 중앙 정렬 */
            height: 100%;
            width: 100%                /* 화면 전체 높이 */
			}
</style>
</head>
<body>
</body>
</html>