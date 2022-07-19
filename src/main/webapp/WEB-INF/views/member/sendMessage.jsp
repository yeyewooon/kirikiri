<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myWrite</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
   crossorigin="anonymous" />
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
   crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/f9358a6ceb.js"
   crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <style>
    
#msgIcon {
	cursor: pointer;
}

.msgReceive, .msgSend {
	cursor: pointer;
	border: 1px solid black;
	border-radius: 5px;
	padding: 4px;
}

@font-face {
	font-family: "OTWelcomeRA";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2")
		format("woff2");
	font-weight: normal;
	font-style: normal;
}
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="font-size: 16px;">
              <span style="font-size: 16px;"><i class="fa-solid fa-envelope-open"></i></span><span class="ms-2">쪽지함보기</span>
            </div>
          </div>
          <div class="row mt-2">
            <div class="col-md-12 d-flex">
                <div class="msgReceive d-flex justify-content-center"><span class="d-none"><i class="fa-solid fa-check"></i></span><span class="ms-1">받은 쪽지함</span></div>
                <div class="msgSend d-flex justify-content-center" style="margin-left: 10px;"><span class=""><i class="fa-solid fa-check"></i></span><span class="ms-1">보낸 쪽지함</span></div>
            </div>
          </div>
    <table class="table">
        <thead>
          <tr>
            <th scope="col">삭제</th>
            <th scope="col">보낸사람</th>
            <th scope="col">내용</th>
            <th scope="col">날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row"><input type = "checkbox" value = "1" name = "seq_message"></th>
            <td>차범근</td>
            <td>내 아들은 차두리~</td>
            <td>2022-07-19</td>
          </tr>
          <tr>
            <th scope="row"><input type = "checkbox" value = "2" name = "seq_message"></th>
            <td>차범근</td>
            <td>내 아들은 차두리~</td>
            <td>2022-07-19</td>
          </tr>
          <tr>
            <th scope="row"><input type = "checkbox" value = "3" name = "seq_message"></th>
            <td>차범근</td>
            <td>내 아들은 차두리~</td>
            <td>2022-07-19</td>
          </tr>
        </tbody>
      </table>
      <div class = "row">
        <div class = "col-12 d-flex justify-content-end">
            <button type = "button" class = "btn btn-danger ms-2" id = "deleteBtn">삭제</button>
            <button type = "button" class = "btn btn-primary ms-2" id = "closeBtn">닫기</button>
        </div>
      </div>
      </div>
</body>
<script>
    $(".msgReceive").on("click", function(){
        location.href="/user/receiveMsg"
    })

    $("#deleteBtn").on("click", function(){
        let checkBoxArr = [];
      $("input[name=seq_message]:checked").each(function(){         
         checkBoxArr.push($(this).val());
      })
      console.log(checkBoxArr);
    })

    $("#closeBtn").on("click", function(){
        window.close();
    })
</script>
</html>