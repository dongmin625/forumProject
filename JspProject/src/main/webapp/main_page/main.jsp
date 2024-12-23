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
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .navbar {
            width: 90%; /* 화면 가로 전체 채우기 */
            height: 60px; /* 원하는 높이 설정 */
            background-color: #FFFFFF; /* 흰색 배경 */
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1); /* 살짝 그림자 효과 (선택 사항) */
            margin-top: 20px;
            margin-left: 50px; /* 좌측 여백 자동 */
    		margin-right: 50px; /* 우측 여백 자동 */
            border-radius : 10px;
            display: flex;
            justify-content: center; /* 상단바 내용 중앙 정렬 */
            align-items: center; /* 세로 가운데 정렬 */
            font-size: 20px;
            font-weight: 800;
            padding: 20px;
        }
        
        .navbar span {
   			 padding-right: 20px; /* 텍스트와 버튼 사이의 간격 */
		}

		.navbar button {
   			 padding: 5px 10px;/* 버튼 안쪽 여백 */
   			 background-color: #000000;
   			 color: #FFFFFF;
   			 border-radius : 5px; 
		}
		/* 이미지 버튼 스타일 */
        .image-button {
            display: block; /*수직 배치*/
            margin-top: 25px;
            margin-left: 50px;
            cursor: pointer;
        }

        .image-button img {
            width: 200px; /* 이미지 크기 설정 */
            height: auto;
            border-radius: 10px; /* 둥근 모서리 */
        }
		
    </style>
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
	<div class="navbar">
        <span><%= userName %>님 환영합니다! 오늘도 정진하세요!</span>
        <button onclick="location.href='../profile/userprofile.jsp'">내 프로필로 이동</button>
    </div>
    
    <!-- 이미지 버튼 -->
    <div class="image-button">
        <a href="https://www.myprotein.co.kr" target="_blank">
            <img src="../images/myprotein.png" alt="MyProtein"/>
        </a>
    </div>
    
    <!-- 이미지 버튼 -->
    <div class="image-button">
        <a href="https://bsn.co.kr" target="_blank">
            <img src="../images/BSNsinta.png" alt="SINTA6"/>
        </a>
    </div>
    
    <!-- 이미지 버튼 -->
    <div class="image-button">
        <a href="https://www.calobye.com" target="_blank">
            <img src="../images/CALOBYE.png" alt="CALOBYE"/>
        </a>
    </div>
</body>
</html>