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
	<button type="button" value="4" class="btn">수정 4</button><br>
	
	<h1>모임 상세</h1>
	<button type="button" value="1" class="detailBtn">상세 1</button>
	<button type="button" value="2" class="detailBtn">상세 2</button>
	<button type="button" value="3" class="detailBtn">상세 3</button>
	<button type="button" value="4" class="detailBtn">상세 4</button><br>
	
	<h1>모임 일정</h1>
	<button type="button" value="1" class="calBtn">모임 일정1</button>
	<button type="button" value="2" class="calBtn">모임 일정2</button>
	<button type="button" value="3" class="calBtn">모임 일정3</button>
	<button type="button" value="4" class="calBtn">모임 일정4</button><br>
	
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
		
		
		
	</script>
</body>
</html>