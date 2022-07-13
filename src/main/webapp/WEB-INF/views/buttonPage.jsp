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
	<button type="button" value="1" class="btn">1</button>
	<button type="button" value="2" class="btn">2</button>
	<button type="button" value="3" class="btn">3</button>
	<button type="button" value="4" class="btn">4</button>
	
	
	<script>
		$(".btn").on("click",function(e) {
			location.href = "/group/toMoifyGroup?seq_group="+e.target.value;
		})
		
		
	</script>
</body>
</html>