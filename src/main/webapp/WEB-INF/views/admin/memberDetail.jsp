<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>끼리끼리-회원detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!--구글 폰트-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
        rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!-- AOS 라이브러리 불러오기-->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <!-- 아이콘 -->
    <script src="https://kit.fontawesome.com/f9358a6ceb.js" crossorigin="anonymous"></script>
    <!--알림창-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="sweetalert2.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'MICEGothic Bold';
        }

        /* 눈누 폰트 */
        @font-face {
            font-family: 'MICEGothic Bold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        .container {
            background-color: #d2e3ec;
            padding-left : 40px;
            padding-right : 40px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="row title d-flex text-center p-4">
            <h1 style="color: navy;">회원 상세 정보</h1>
        </div>
        <form id="memberForm">
            <div class="row id pt-4 p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>이름</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" name="user_name" class="form-control w-75" id="user_name" value="${memList.user_name}" readonly>  
                </div>
            </div>
            <div class="row id p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>생년월일</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" name="user_bd" class="form-control w-75" id="user_bd" value="${memList.user_bd}" readonly>  
                </div>
            </div>
            <div class="row email p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>이메일</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" name="user_email" class="form-control w-75" id="user_email" value="${memList.user_email}" readonly>  
                </div>
            </div>
            <div class="row phone p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>휴대폰번호</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <input type="text" name="user_phone" class="form-control w-75" id="user_phone" value="${memList.user_phone}" readonly>  
                </div>
            </div>
            <div class="row gender p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>성별</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <div class=""><input type="text"  id="gender" value="${memList.user_gender}"></div>
                    <label class="me-4"><input type="radio" class="me-2" name="user_gender" value="남">남</label>
                    <label class="me-4"><input type="radio" class="me-2" name="user_gender" value="여">여</label>
                </div>
            </div>
            <div class="row blacklist p-2 pb-5">
                <div class="col-3 d-flex ps-5 align-items-center justify-content-start">
                    <label>블랙리스트</label>
                </div>
                <div class="col-9 d-flex justify-content-center">
                    <div class=""><input type="text"  id="blacklist" value="${memList.user_bl}"></div>
                    <label class="me-4"><input type="radio" class="me-2" name="user_bl" value="Y">등록</label>
                    <label class="me-4"><input type="radio" class="me-2" name="user_bl" value="N">제거</label>
                </div>
            </div>
            <div class ="row btnBox p-2 pb-5 d-flex justify-content-center">
                <button type="button" id="submitBtn" class="btn btn-outline-primary w-50">수정 완료</button>
            </div>
        </form>
    </div>
</body>
<script>


</script>
</html>