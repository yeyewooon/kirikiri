<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>모임 수정</h1>
   <button type="button" value="1" class="btn">수정 1</button>
   <button type="button" value="2" class="btn">수정 2</button>
   <button type="button" value="3" class="btn">수정 3</button>
   <button type="button" value="4" class="btn">수정 4</button>
   <button type="button" value="5" class="btn">수정 5</button>
   <button type="button" value="6" class="btn">수정 6</button>
   <button type="button" value="7" class="btn">수정 7</button>
   <button type="button" value="8" class="btn">수정 8</button>
   <button type="button" value="9" class="btn">수정 9</button><br>
   
   <h1>모임 상세</h1>
   <button type="button" value="1" class="detailBtn">상세 1</button>
   <button type="button" value="2" class="detailBtn">상세 2</button>
   <button type="button" value="3" class="detailBtn">상세 3</button>
   <button type="button" value="4" class="detailBtn">상세 4</button>
   <button type="button" value="5" class="detailBtn">상세 5</button>
   <button type="button" value="6" class="detailBtn">상세 6</button>
   <button type="button" value="7" class="detailBtn">상세 7</button>
   <button type="button" value="8" class="detailBtn">상세 8</button>
   <button type="button" value="9" class="detailBtn">상세 9</button><br>
   
   <h1>모임 일정</h1>
   <button type="button" value="1" class="calBtn">모임 일정1</button>
   <button type="button" value="2" class="calBtn">모임 일정2</button>
   <button type="button" value="3" class="calBtn">모임 일정3</button>
   <button type="button" value="4" class="calBtn">모임 일정4</button>
   <button type="button" value="5" class="calBtn">모임 일정5</button>
   <button type="button" value="6" class="calBtn">모임 일정6</button>
   <button type="button" value="7" class="calBtn">모임 일정7</button>
   <button type="button" value="8" class="calBtn">모임 일정8</button>
   <button type="button" value="9" class="calBtn">모임 일정9</button><br>
   
   
   
   <button type = "button" id = "groupMember">멤버관리</button>
   <button type = "button" id = "groupApply">모임가입</button>
   <button type = "button" id = "groupDelete">모임해산</button>
   <button type = "button" id = "publicData">주차장정보</button>
   <!-- 그룹번호 숨겨서 받기 -->
   <div class="d-none">
      <input type="text" value=1 name="seq_group" id="seq_group">
   </div>
   
   <script>
      $(".btn").on("click",function(e) {
         location.href = "/group/toModifyGroup?seq_group="+e.target.value;
      })
      
      $(".detailBtn").on("click",function(e) {
         location.href = "/group/toGroupDetail?seq_group="+e.target.value;
      })
      
      $(".calBtn").on("click",function(e) {
         location.href = "/cal/toGroupCalendar?seq_group="+e.target.value;
      })
      
   // 멤버관리 이동
   $("#groupMember").on("click", function(){
      location.href = "/group/toGroupMember?seq_group="+$("#seq_group").val();
   })   
   // 모임가입 이동
   $("#groupApply").on("click", function(){
      console.log($("#seq_group").val());
      location.href = "/group/toGroupApply?seq_group="+$("#seq_group").val();
   })   
   // 모임해산 이동
   $("#groupDelete").on("click", function(){
      location.href = "/group/toGroupDelete?seq_group="+$("#seq_group").val();
   })
   
   // 주차장 정보
   $("#publicData").on("click", function(){
      location.href = "/public/publicData";
   })
      
      
      
   </script>
</body>
</html>