<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헬창 블로그</title>
</head>
<body>
    <h1>회원가입</h1>
    
    <!-- 회원가입 폼 -->
    <form action="registerProcess.jsp" method="POST">
        <label for="email">이메일:</label>
        <input type="email" name="email" id="email" required><br>
        
        <label for="password">비밀번호:</label>
        <input type="password" name="password" id="password" required><br>
        
        <label for="nickname">닉네임:</label>
        <input type="text" name="nickname" id="nickname" required><br>
        
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
