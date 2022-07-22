<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!--구글 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Open+Sans:ital,wght@1,300&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- AOS 라이브러리 불러오기-->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!-- 아이콘 -->
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
	crossorigin="anonymous"></script>
<!--알림창-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="sweetalert2.min.js"></script>
<style>
* {
	box-sizing: border-box;
	font-family: 'OTWelcomeRA';
}

/* 눈누 폰트 */
@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'OTWelcomeRA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

/*사이드바*/
.sidebar {
	float: left;
	width: 20%;
	height: 800px;
	background-color: #4e78f5;
}

.sidebar span {
	font-family: 'BMJUA';
}

.sidebar li {
	list-style: none;
	border-bottom: 3px solid rgba(255, 255, 255, 0.63);
	text-align: center;
}

.sidebar a:hover {
	color: white;
}

.logoHome {
	height: 100px;
}

.logoHome span {
	color: white;
	font-size: x-large;
	font-weight: 80px;
}

#logoImg {
	width: 80px;
}

i {
	margin-top: 15px;
	margin-bottom: 15px;
}

a {
	text-decoration: none;
	font-size: larger;
	color: rgba(255, 255, 255, 0.683);
}

/*네비바*/
.navbar {
	float: right;
	height: 104px;
	width: 80%;
	background-color: white;
	position: relative;
}

.user {
	border-radius: 50%;
	width: 50px;
	height: 50px;
	position: absolute;
	right: 20px;
	background-color: white;
	border: 1px solid gainsboro;
}

.userName {
	position: absolute;
	right: 80px;
}

#user_img {
	border-radius: 50%;
	width: 50px;
	height: 50px;
}

.logOut {
	position: absolute;
	right: 19px;
	top: 28px;
	border-radius: 50%;
	width: 50px;
	height: 50px;
	background-color: gray;
	display: none;
}

.logout {
	position: absolute;
	top: -7px;
	right: 8px;
	font-size: xx-large;
	color: white;
}

/*content*/
.contents {
	background-color: rgb(224, 230, 243);
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<div class="sidebar">
			<ul class="p-2">
				<li class="logoHome"><a href="/toAdmin"> <img
						src="/resources/images/adminLogo.png" id="logoImg"><br>
						<span>끼리끼리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toMember?curPage=1"> <i
						class="fa-solid fa-users-rectangle"></i><br> <span>회원
							관리</span>
				</a></li>
				<li class="sidemenu"><a href="#"> <i
						class="fa-solid fa-table"></i><br> <span>게시물 관리</span>
				</a></li>
				<li class="sidemenu"><a href="/admin/toGroupAdmin?curPage=1"> <i
						class="fa-solid fa-house-user"></i><br> <span>모임 관리</span>
				</a></li>
			</ul>
		</div>
		<div class="navbar">
			<div class="userName">| &nbsp&nbsp admin</div>
			<div class="user">
				<img src="/resources/images/해삐루피.png" id="user_img">
			</div>
			<div class="logOut">
				<i class="logout fa-solid fa-arrow-right-from-bracket"></i>
			</div>
		</div>
		<div class="contents">
			
		</div>
	</div>
	<script>
	

    	//로그아웃 부분
        $(".user").mouseenter(function () {
            $(".logOut").css({ "display": "block", "z-index": "99" });
        })
        $(".user").mouseleave(function () {
            $(".logOut").css("display", "none");
        })
        $(".logOut").click(function () {
            Swal.fire({
                title: '정말 로그아웃 하시겠습니까?',
                showConfirmButton: false,
                showDenyButton: true,
                showCancelButton: true,
                denyButtonText: `로그아웃`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isDenied) {
                    Swal.fire('로그아웃 성공', '', 'info')
                }
            })
        })
    </script>
</body>

</html>