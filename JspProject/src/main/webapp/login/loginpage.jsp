<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>헬창 블로그</title>
    <style>
        /* 화면 전체 배경 이미지 설정 */
        html {
            background-image: url("../images/webpage_background.png");
            background-repeat: no-repeat; /* 이미지 반복 여부 */
            background-size: cover;      /* 화면에 꽉 차게 */
            background-position: center; /* 이미지 중앙 정렬 */
            height: 100%;
            width: 100%                /* 화면 전체 높이 */
			}
       
       /* body 스타일: 폼만 중앙 정렬 */
       body {
        	background-repeat: no-repeat; /* 이미지 반복 여부 */
    		background-size: cover;      /* 화면에 꽉 차게 */
    		background-position: center; /* 이미지 중앙 정렬 */
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center;    /* 수직 가운데 정렬 */
            height: 100vh;          /* 화면 전체 높이 */
            margin: 0;
            padding : 0;              /* 기본 마진 제거 */
            background-color: transparent; /* 배경색 */
        } 

        /* 폼 스타일 */
        form {
        	 width:300px
             text-align: center;
             background-color: white;
             padding: 30px;
             border-radius: 15px;
             box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        label {
             display: flex; /* 라벨과 입력 필드를 줄바꿈 */
             margin-bottom: 10px;
             font-weight: bold;
        }

        input {
             width:100%; /* 입력 필드 너비를 조정 */
    		 padding: 10px;
    		 margin-top: 5px; /* 라벨과 입력 필드 간의 간격 */
    		 margin-bottom: 20px;
    		 border: 1px solid #ccc;
    		 border-radius: 5px;
    		 box-sizing: border-box;
        }

        .box {
            display: flex;
            justify-content: space-around; /* 버튼 간격 조정 */
        }

        .box input {
            width: 48%; /* 버튼 너비 동일하게 설정 */
   			padding: 10px; /* 버튼 내부 여백 */
    		cursor: pointer;
    		background-color: black;
    		color: white;
    		font-weight: bold;
    		border: none;
    		border-radius: 5px; /* 모서리 둥글게 */
    		box-sizing: border-box; /* 패딩 포함 너비 계산 *
        }

        .box input:hover {
            background-color: silver;
        }
    </style>
</head>
<body>
    <form action="registerProcess.jsp" method="POST">
        <h1>로그인</h1>
        
        <label for="email">이메일:</label>
        <input type="email" name="email" id="email" required>
        
        <label for="password">비밀번호:</label>
        <input type="password" name="password" id="password" required>
        
        <div class="box">
            <input type="submit" value="회원가입" onclick="location.href='../sign_up/signup.jsp'">
            <input type="button" value="로그인" >
        </div>
    </form>
</body>
</html>
