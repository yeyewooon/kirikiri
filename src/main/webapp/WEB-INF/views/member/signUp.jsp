<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    <!-- fontAwessome-->
    <script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet">
    <title>Document</title>
<style>
    /* 눈누 폰트 */
    @font-face {
        font-family: 'OTWelcomeRA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }
    @font-face {
        font-family: '양진체';
        src: url('https://cdn.jsdelivr.net/gh/supernovice-lab/font@0.9/yangjin.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }
    *{box-sizing: border-box;   font-family: 'OTWelcomeRA';}
    body{
        background-color: #d2e3ec;
    }
     /* header 반응형 */
     @media (max-width : 768px) {
    #navLogo {
        display: none;
    }

    #myPageIcon {
        display: none;
    }

    #cartIcon {
        display: none;
    }

    #menu {
        display: none;
    }

    }

    /* header */
    .border-bottom{
        background-color: white;
    }

    #navLogo {
        width: 150px;
        height: 100px;
    }

    #logoImgs {
        width: 100%;
        height: 100%;
    }

    @media (min-width : 768px) {
        #navibar {
            display: none;
        }
    }

    /* header 반응형 끝 */

    #logoImg {
        width: 50%;
    }

    /* 바디*/
    .signupBox{
        margin-top: 100px;
        width: 1000px;
        height: auto;
        border: 1px solid d2e3ec;
        text-align: center;
        margin: auto;
        background-color: #d2e3ec;
    }
    #userInfoBox{
        padding-top: 3px;
        margin-top: 100px;
        width: 93%;
        margin: auto;
        border: 1px solid d2e3ec;
        background-color: white;
    }
    #userInfoBox > .row:first-child > img{
        margin-top: 20px;
    }
    #userInfoBox > .row:last-child{
        padding-bottom: 40px;
    }
    
    #userInfoBox-profile{
        padding-top: 10px;
        width: 93%;
        margin: auto;
        border: 1px solid d2e3ec;
        background-color: white;
        display: none;
    }

    #introMessage{
        height: 100%;
        width: 100%;
        resize: none;
    }
    #p_img{
        width: 150px;
        height: 150px;
    }
    #profile_img{
        margin: auto;
        margin-bottom: 30px;
        width: 60%;
        border:1px solid black;
    }

    .profile_imgContainer{
        width: 150px;
        height: 150px;
        border: 1px solid lightblue;
        border-radius: 50%;
        text-align: center;
        overflow: hidden;
        margin: auto;
    }
    #introMessage{
        height: 100%;
        width: 100%;
        display: inline;
    }
    .col-3{
        display: inline;
    }
    .form-control{
        width: 98%;
    }
    .hobby{
        width: 7%;
        height: 40%;
    }
    label{
        margin: 5px;
    }
    button{
        margin: 30px;
        margin-bottom: 70px;
        width: 14%;
        height: 30%;
    }
    .row{
        margin-top: 10px;
    }
    span{
        color: white;
        font-size: 0.05rem;
    }
    .circleLine:only-child{
        display: inline-block;
    }
    .circle{
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: white;
    }

    .circleLine > div[class*=col]{
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .circleLine > div[class*=col] > span{
      color: black;
      font-size: 20px;
    }
    .circleLine-line{
      height: 10%;
      width: 100%;
      background-color: white;
    }
    .circleLine-text{
        margin: auto; 
        text-align: center;
        margin-bottom: 70px;
        margin-top: 10px;
    }
    .circleLine-text span{
        font-size: 17px;
    }
    input{
        margin:  5px;
    }

    /* 회원단계 1*/
    #signup-1{
        color: #030087;
        text-shadow: 1px 1px 2px darkblue;
    }
    .circelLine-text-left{
        color: #030087;
        text-shadow: 1px 2px 2px darkblue;
    }

    .circelLine-text-right{
        margin-left: 15px;
    }

    p{
        margin-top: 10px;
    }

    #nicknameCheck, #emailCheck, #idCheck{
        width: 80%;
        margin: 0px;
        padding: 0px;
        height: 90%;
    }
    .gender{
        margin-bottom: 30px;
    }
    #email-id,#email-domain{
        display: inline;
        width: 43%;
        padding-left: 0px;
    }
    #phone2,#phone3,#phone1{
        margin-left: 5px;
        display: inline;
        width: 30%;
    }
    #singupBackBtn, #completeBtn{
        display: none;
    }
    .hobbyBox .col:last-child{
        text-align: left;
    }
    .bthday{
        display: inline-block;
        text-align: left;
        width: 20%;
    }
    h1{
        margin-top: 30px;
    }

    /*풋터 영역*/
    .footerBox {
        height: 0px;
    }

    footer.footer {
        padding-top: 2rem;
        padding-bottom: 2rem;
        background-color: white;
    }

    .footer a {
        text-decoration: none;
        color: black;
        font-weight: 40px;
        font-weight: bold;
    }
    .footer-imgBox{
        overflow: hidden;
    }
    .footer-imgBox > img{
        width: 100%;
        height: 100%;
    }
</style>
</head>
<script>
    $(document).ready(function(){
        $("#singupBackBtn").click(function(){
            $("#signup-1").css("text-shadow","1px 2px 2px darkblue");
            $(".circelLine-text-left").css({"color":"#030087","text-shadow":"1px 2px 2px darkblue"});
            $("#signup-2").css("text-shadow","none");
            $("#circelLine-text-middle").css({"color":"white","text-shadow":"none"});
            $("#backPageBtn").show();
            $("#nextBtn").show();
            $("#userInfoBox").show();
            $("#userInfoBox-profile").hide();
            $("#singupBackBtn").hide();
            $("#completeBtn").hide();
        })
        
        $("#nextBtn").click(function(){
            $("#signup-1").css("text-shadow","none");
            $(".circelLine-text-left").css({"color":"white","text-shadow":"none"});
            $("#signup-2").css("text-shadow","1px 2px 2px darkblue");
            $("#circelLine-text-middle").css({"color":"#030087","text-shadow":"1px 2px 2px darkblue"});
            $("#backPageBtn").hide();
            $("#nextBtn").hide();
            $("#userInfoBox").hide();
            $("#userInfoBox-profile").show();
            $("#singupBackBtn").show();
            $("#completeBtn").show();
        })

    })
</script>
<body>
    <!--네비바-->
    <header class="mb-3 border-bottom">
        <div class="container">
            <!-- 접혔을 때 nav -->
            <nav id="navibar" class="navbar navbar-expand-md navbar-light" aria-label="Main navigation">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-10">
                            <a class="navbar-brand mb-2 mb-lg-0" href="#">
                                <div class="title-box">
                                    <img id="logoImg" src="/resources/images/kiri.jpg">
                                </div>
                            </a>
                        </div>
                        <!-- toggle button -->
                        <div class="col-2 d-flex align-items-center">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>
                        <!-- 메뉴 -->
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav mb-2 mb-lg-0">
                                <li class="nav-item"><a class="nav-link" href=" ">자유게시판</a></li>
                                <c:choose>
                                    <c:when test="${empty loginSession}">
                                        <li class="nav-item"><a class="nav-link" href=" ">로그인</a></li>
                                        <li class="nav-item"><a class="nav-link" href=" ">회원가입</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="nav-item"><a class="nav-link" href=" ">마이페이지</a></li>
                                        <li class="nav-item"><a class="nav-link" href=" ">로그아웃</a></li>
                                    </c:otherwise>
                                </c:choose>


                            </ul>

                        </div>
                    </div>

                </div>
            </nav>

            <!-- 펼쳐졌을 때 nav -->
            <nav id="menu" class="navbar navbar-expand-md w-100 navbar-light" aria-label="Main navigation">
                <div class="row w-100 align-items-center">
                    <div class="col-5 d-flex justify-content-center">
                        <ul class="navbar-nav mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link mx-2" href="">자유 게시판</a></li>
                        </ul>
                    </div>
                    <!-- logo -->
                    <div class="col-2">
                        <a href="/" id="navLogo" class="mb-2 mb-lg-0">
                            <img id="logoImgs" src="/resources/images/kiri.jpg">

                        </a>
                    </div>
                    <div class="col-5">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-auto">
                                <ul class="navbar-nav mb-2 mb-lg-0 me-2">
                                    <c:if test="${empty loginSession}">
                                        <li class="nav-item"><a class="nav-link" href="/toLogin.mem">로그인</a></li>
                                        <li class="nav-item"><a class="nav-link" href="/toSignUp.mem">회원가입</a></li>
                                    </c:if>
                                </ul>
                            </div>

                            <div class="col-auto user">
                                <c:if test="${not empty loginSession}">
                                    <div class="dropdown text-end">
                                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle"
                                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                            <img src="/resources/images/profile.jpg" alt="mdo" width="32" height="32"
                                                class="rounded-circle">
                                        </a>
                                        <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
                                            <li><a class="dropdown-item" href="/mem/myPage">마이페이지</a></li>
                                            <li><a class="dropdown-item" href="#">로그아웃</a></li>
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!--바디-->
    <div class="container signupBox">
        <div class="row">
            <div class="col"><h1>회원 가입</h1></div>
        </div>
        <div class="row circleLine justify-content-center">
            <div class="col-1 circle">
              <span id="signup-1">1</span>
            </div>
            <div class="col-3">
              <div class="circleLine-line"></div>   
            </div>
            <div class="col-1 circle" >
              <span id="signup-2">2</span>
            </div>
            <div class="col-3">
                <div class="circleLine-line"></div>   
            </div>
            <div class="col-1 circle" >
              <span>3</span>
            </div>
        </div>
        <div class="row circleLine-text justify-content-center">
            <div class="col-2">
                <span class="circelLine-text-left">회원 정보 입력</span>
            </div>
            <div class="col-5">
                <span id="circelLine-text-middle">회원 프로필 입력</span>
            </div>
            <div class="col-2">
                <span class="circelLine-text-right">회원가입 완료</span>
            </div>
        </div>
    <!-- info 영역-->
        <div id="userInfoBox">
            <div class="row">
                <div class="col">
                    <img src="kiri.png" alt="오류발생">
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <p>이름</p>
                </div>
                <div class="col-md-7">
                    <input type="text" id="name" name="name" class="form-control">
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <p>닉네임</p>
                </div>
                <div class="col-md-5">
                    <input type="text" id="nickname" name="nickname" class="form-control">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-secondary" id="nicknameCheck">중복확인</button>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>생년월일</p>
                </div>
                <div class="col-md-9 d-flex justify-content start align-items-center">
                    <input type="text" id="year" name="year" class="form-control bthday" maxlength="4"><label for="year">년</label>
                    <input type="text" id="month" name="month" class="form-control bthday" maxlength="2"><label for="month">월</label>
                    <input type="text" id="day" name="day" class="form-control bthday" maxlength="2"><label for="day">일</label>
                </div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>아이디</p>
                </div>
                <div class="col-md-5">
                    <input type="text" id="id" name="id" class="form-control">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-secondary" id="idCheck">중복확인</button>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>비밀번호</p>
                </div>
                <div class="col-md-7" style="text-align: left;">
                    <input type="text" id="password" name="password" class="form-control">
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>비밀번호 확인</p>
                </div>
                <div class="col-md-7" style="text-align: left;">
                    <input type="text" id="pwCheck" name="pwCheck" class="form-control">
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>이메일</p>
                </div>
                <div class="col-md-5">
                    <input type="text" id="email-id" name="email" class="form-control">
                    @
                    <input type="text" id="email-domain" name="email-domain" class="form-control">
                </div>
                <div class="col-md-2">
                    <button type="button" class="btn btn-secondary" id="emailCheck">중복확인</button>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row" >
                <div class="col-md-3">
                    <p>휴대전화</p>
                </div>
                <div class="col-md-7" style="text-align: left;">
                    <select name="phone1" id="phone1" class="form-control">
                        <option value="010" selected>010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                    </select>
                    <input type="text" id="phone2" name="phone2" class="form-control" maxlength="4">
                    <input type="text" id="phone3" name="phone3" class="form-control" maxlength="4">
                    <input type="hidden" id="phone" name="phone">
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row justify-content-center" >
                <div class="col-md-3">
                    <p>성별</p>
                </div>
                <div class="col-md-7">
                    <input class="gender" type="radio" id="men" name="gender">
                    <label for="men">남자</label>
                    <input class="gender" type="radio" id="women" name="gender">
                    <label for="women">여자</label>
                </div>
                <div class="col-2"></div>
            </div>
        </div>

        <div id="userInfoBox-profile">
            <div class="row" >
                <div class="col">
                    <div class="profile_imgContainer">
                        <img id="p_img" name="p_img" src="dafault_img.jpg" alt="오류가 발생했습니다.">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <p id="profileSetting">프로필 설정</p>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="file" class="form-control" id="profile_img" name="profile_img">
                </div>
            </div>
            <div class="row">
                <div class="col-3">
                    <p style="margin-top: 50px;">자기소개</p>
                </div>
                <div class="col-7" style="height: 120px;">
                    <textarea class="form-control" name="introMessage" id="introMessage"></textarea>
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
                <div class="col-3">
                    <p  style="margin-top: 10px;">직업</p>
                </div>
                <div class="col-8" style="text-align: left;">
                    <input type="radio" class="job" id="student" name="job"><label for="student">학생</label>
                    <input type="radio" class="job" id="employee" name="job"><label for="employee">회사원</label>
                    <input type="radio" class="job" id="unemployed" name="job"><label for="unemployed">무직</label>
                    <input type="radio" class="job" id="selectJob" name="job"><label for="selectJob">기타</label>
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row hobbyBox" >
                <div class="col-3">
                    <p style="margin-top: 30px;">좋아하는 취미<br>(3개 선택)</p>
                </div>
                <div class="col-9">
                        <div class="row" >
                            <div class="col">
                                <input type="checkbox"  id="travel" name="hobby" class="checkbox" value="travel"><label for="travel">아웃도어/여행</label>
                                <input type="checkbox"  id="sports" name="hobby" class="checkbox" value="sports"><label for="sports">운동/스포츠</label>
                                <input type="checkbox"  id="fgn-language" name="hobby" class="checkbox" value="fgn-language"><label for="sports">외국어/언어</label>
                                <input type="checkbox"  id="pets" name="hobby" class="checkbox" value="pets"><label for="pets">반려동물</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="checkbox"  id="music" name="hobby" class="checkbox" value="music"><label for="music">음악/악기</label>
                                <input type="checkbox"  id="making" name="hobby" class="checkbox" value="making"><label for="making">공예/만들기</label>
                                <input type="checkbox"  id="dance" name="hobby" class="checkbox" value="dance"><label for="dance">댄스/무용</label>
                                <input type="checkbox"  id="reading" name="hobby" class="checkbox" value="reading"><label for="reading">인문학/책/글</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="margin-bottom: 40px;">
                                <input type="checkbox"  id="photographic" name="hobby" class="checkbox" value="photographic"><label for="photographic">사진/영상</label>
                                <input type="checkbox"  id="game" name="hobby" class="checkbox" value="game"><label for="game">게임/오락</label>
                                <input type="checkbox"  id="cooking" name="hobby" class="checkbox" value="cooking"><label for="cooking">요리/제조</label>
                                <input type="checkbox"  id="culture" name="hobby" class="checkbox" value="culture"><label for="culture">문화/공연/축제</label>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <button type="button" id="backPageBtn" class="btn btn-secondary">취소</button>
                <button type="button" id="nextBtn" class="btn btn-primary">확인</button>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <button type="button" id="singupBackBtn" class="btn btn-secondary">취소</button>
                <button type="button" id="completeBtn" class="btn btn-primary">확인</button>
            </div>
        </div>
    </div>

    <!-- Footer-->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 footer-imgBox">
                    <img src="/resources/images/kiri.jpg" alt="오류가 발생했습니다.">
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item"><a href="#!">공지사항</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">회원가입</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">로그인</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!">책임의 한계 및 법적고지</a></li>
                        <li class="list-inline-item">⋅</li>
                        <li class="list-inline-item"><a href="#!"
                            style="color: red; font-weight: bold;">개인정보처리방침</a></li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">끼리끼리(주) 대표 : 이호준 |
                        개인정보관리책임자 : 김영완 | 사업자등록번호 : 22-02-22</p>
                    <p class="text-muted small mb-4 mb-lg-0">주소 : 서울특별시 영등포구 선유동2로
                        57 이레빌딩</p>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
                        2022. All Rights Reserved.</p>
                </div>
                <div class="col-lg-3 h-100 text-center text-lg-end my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item me-4"><a href="#!"><i
                                class="bi-facebook fs-3"></i></a></li>
                        <li class="list-inline-item me-4"><a href="#!"><i
                                class="bi-twitter fs-3"></i></a></li>
                        <li class="list-inline-item"><a href="#!"><i
                                class="bi-instagram fs-3"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</html>