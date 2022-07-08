<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>        
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- fontAwessome-->
<script src="https://kit.fontawesome.com/241134516c.js" crossorigin="anonymous"></script>
<title>모임멤버</title>
<style>
         i{
            margin: 5px;
        }
        .navbar-light{
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1;
            left: 0%;
        }

        body{margin-top: 100px;}
        
        /*네비바 속성*/
        .navbar-anchor a{
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
        #userIcon {
            text-align: right;
            font-size: 25px;
            padding: 5px;
        }
        #navbar-search{
            text-align: right;
        }
        #searchIcon{
            color: lightgrey;
        }
        
        /*이미지*/
        .container-body{width: 100%; height: 450px;}


        /*버튼 및 테이블*/
        .container-content{width: 100%; margin-bottom: 50px;}
        .rowBtn{border:3px solid #d0e2ff; width: 60%; margin:auto; margin-top:50px;}

        /*테이블*/
        .table{width:60%; margin:auto; margin-top:40px;}
        tr{text-align: center;}

        /* 네비바 드롭다운 */
        .dropdown-toggle:hover{color: #83bf7b; border-color: aliceblue;}
        .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
        font-weight: bold;
        }


         /*풋터 영역*/
         .footerBox{
            height: 200px;
        }
        footer.footer {
             padding-top: 4rem;
             padding-bottom: 4rem;
        }
        .footer a{
            text-decoration: none;
            color: black;
            font-weight: 40px;
            font-weight: bold;
        }
</style>
</head>
<body>
    <div class="header">
        <nav class="navbar navbar-light bg-light fixed">
            <div class="container navbar-head">
                <a class="navbar-brand" href="#!" id="logo">로고</a>
                <div class="col-md-1 navbar-anchor"><a href="/">COMPANY</a></div>
                
                <div class="dropdown ">
                    <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-weight: bold;">
                      CLOTHES
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                      <li><a class="dropdown-item" href="#">Top</a></li>
                      <li><a class="dropdown-item" href="#">Bottom</a></li>
                      <li><a class="dropdown-item" href="#">Accessory</a></li>
                    </ul>
                  </div>
    
                <div class="col-md-1 navbar-anchor"><a href="/">매장찾기</a></div>
                <div class="col-md-1 navbar-anchor"><a href="/">고객센터</a></div>
            <!-- 네비바 검색창 -->
                <div class="col-md-4 navbar-anchor" id="navbar-search">
                    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                        <div class="input-group">
                            <button class="btn btn-link" style="border: 1px solid lightgrey;" id="btnSearch" type="button"><i id="searchIcon" class="fas fa-search"></i></button>
                            <input class="form-control" type="text" aria-describedby="btnNavbarSearch" />
                        </div>
                    </form>
                </button></div>
                <div class="col-md-2 navbar-anchor" id="userIcon">
                    <a href=""><i class="fa-solid fa-cart-plus"></i></a>
                    <a href=""><i class="fa-solid fa-user"></i></a>
                </div>
            </div>
        </nav>
    </div>

    <div class="body">
        <!-- 사진 -->
        <div class="container-body">
            <div class="image">
                <img src = "/resources/images/group/header_image.png" style="height: 450px; width:100%;">
            </div>
        </div> 
        <div class="container-content">
            <!-- 버튼 그룹 -->  
            <div class="rowBtn">
                <div class="col-12 m-3 d-flex justify-content-center">
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupApply">가입 신청</button>
                    </div>
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupMember">멤버 관리</button>
                    </div>
                    <div class="btn">
                        <button type="button" class="btn btn-primary btn-lg m-3" id = "groupDelete">모임 해산</button>
                    </div>
                </div>
            </div>
            <!-- 테이블 -->
            <div class="row">
                <div class="col-12 d-flex justify-content-center">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="table-primary">
                                <th class="col-2">직책</th>
                                <th class="col-2">이름</th>
                                <th class="col-5">소개</th>
                                <th class="col-1">성별</th>
                                <th class="col-1">권한</th>
                                <th class="col-1">강퇴</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">모임장</th>
                                <td>햅삐</td>
                                <td>햅-삐</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버1</td>
                                <td>멤버1~</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버2</td>
                                <td>멤버2~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버3</td>
                                <td>멤버3~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버4</td>
                                <td>멤버4~</td>
                                <td>여</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                            <tr>
                                <th scope="row">일반멤버</th>
                                <td>멤버5</td>
                                <td>멤버5~</td>
                                <td>남</td>
                                <td><input class="form-check-input" type="checkbox"></td>
                                <td><input class="form-check-input" type="checkbox"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>
    <div class="row m-3">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
            </ul>
        </nav>
    </div>
    <div class="row">
        <div class="col d-flex justify-content-center">
            <button type="button" class="btn btn-success btn-lg m-3" id = "modifyBtn">권한수정</button>
            <button type="button" class="btn btn-danger btn-lg m-3" id = "deleteBtn">강퇴하기</button>
        </div>
    </div>
</div>    
    
    
    <div class="container-footer">
        <div class="row">
            <div class="col"
                style="text-align:center; font-size: 50px; font-weight: bold; border:1px solid black; height: 300px; margin-top: 50px;">
                푸터
            </div>
        </div>
    </div>
</body>
<script>
	// 멤버관리 이동
	$("#groupMember").on("click", function(){
		location.href = "/group/toGroupMember";
	})	
	// 모임가입 이동
	$("#groupApply").on("click", function(){
		location.href = "/group/toGroupApply";
	})	
	// 모임해산 이동
	$("#groupDelete").on("click", function(){
		location.href = "/group/toGroupDelete";
	})	
	
	// 권한수정하기
	ㅋ
</script>
</html>