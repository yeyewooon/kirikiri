<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>ERORR</title>
<style>
* {
	box-sizing: border-box;
	font-family: 'ONE-Mobile-POP';
	background-color: #284172;
}

@font-face {
	font-family: 'ONE-Mobile-POP';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
body{
	overflow-y : hidden;
}
.main {
	background-color: #284172;
	position: relative;
}

#bgImg {
	width: 100%;
	height: auto;
}

.btn {
	position: absolute;
	top: 44%;
	right: 18%;
	width: 40%;
}
</style>
</head>
<body>
	<div class="main d-flex">
		<img src="/resources/images/errorPage.png" id="bgImg">
		<div class="btn">
			<button onclick="location.href='/'" class="btn btn-outline-dark" id="homeBtn">HOME</button>
		</div>
	</div>
</body>
</html>