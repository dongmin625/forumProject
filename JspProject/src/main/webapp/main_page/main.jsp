<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    HttpSession session2 = request.getSession(false); // 기존 세션 가져오기, 세션이 없으면 null 반환
    if (session == null || session.getAttribute("email") == null) {
        // 세션이 없거나 사용자 이메일이 세션에 없으면 로그인 페이지로 리디렉션
        response.sendRedirect("../login/loginpage.jsp");
        return;
    }

    String userName = (String) session.getAttribute("nickname"); // 세션에서 사용자 이름 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헬창 블로그</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-image: url("../images/webpage_background.png");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        height: 100%;
        width: 100%;
    }

    .navbar {
        width: 90%;
        height: 60px;
        background-color: #FFFFFF;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        margin: 20px auto;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
        font-weight: 800;
        padding: 20px;
    }

    .navbar span {
        padding-right: 20px;
    }

    .navbar button {
        padding: 5px 10px;
        background-color: #000000;
        color: #FFFFFF;
        border-radius: 5px;
        border: none;
        cursor: pointer;
    }

    .container {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        padding: 20px;
    }

    .left-column, .right-column {
        display: flex;
        flex-direction: column;
    }

    .left-column {
        margin-left: 50px;
    }

    .right-column {
        margin-right: 50px;
    }

    .image-button, .image-button2 {
        margin-bottom: 25px;
        cursor: pointer;
    }

    .image-button img, .image-button2 img {
        width: 200px;
        height: auto;
        border-radius: 10px;
    }
</style>
</head>
<body>
    <div class="navbar">
        <span><%= userName %>님 환영합니다! 오늘도 정진하세요!</span>
        <button onclick="location.href='../profile/userprofile.jsp'">내 프로필로 이동</button>
    </div>

    <div class="container">
        <!-- 왼쪽 열 -->
        <div class="left-column">
            <div class="image-button">
                <a href="https://www.myprotein.co.kr" target="_blank">
                    <img src="../images/myprotein.png" alt="MyProtein"/>
                </a>
            </div>
            <div class="image-button">
                <a href="https://bsn.co.kr" target="_blank">
                    <img src="../images/BSNsinta.png" alt="SINTA6"/>
                </a>
            </div>
            <div class="image-button">
                <a href="https://www.calobye.com" target="_blank">
                    <img src="../images/CALOBYE.png" alt="CALOBYE"/>
                </a>
            </div>
        </div>
		
        <!-- 오른쪽 열 -->
        <div class="right-column">
            <div class="image-button2">
                <a href="https://www.hdex.co.kr" target="_blank">
                    <img src="../images/HDEX.png" alt="HDEX"/>
                </a>
            </div>
            <div class="image-button2">
                <a href="https://www.jeleve.co.kr" target="_blank">
                    <img src="../images/JELEVE.png" alt="JELEVE"/>
                </a>
            </div>
            <div class="image-button2">
                <a href="https://www.underarmour.co.kr" target="_blank">
                    <img src="../images/UNDERARMOR.png" alt="UNDERARMOR"/>
                </a>
            </div>
        </div>
    </div>
</body>
</html>
