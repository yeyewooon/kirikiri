<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page session="false" %>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<title>Home</title>
</head>
<body>
	<button type = "button" id = "groupMember">멤버관리</button>
	<button type = "button" id = "groupApply">모임가입</button>
	<button type = "button" id = "groupDelete">모임해산</button>
	<img src = "/resources/images/group_ban.png">
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
</script>
</html>
