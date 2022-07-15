<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주차장 공공데이터</title>
</head>
<body>
<%--  ${data} --%>
<%-- ${data.body.items} --%>
<table border=1>
		<thead>
			<tr>
				<th>번호</th>
				<th>주차장명</th>
				<th>주소</th>
				<th>요금</th>
				<th>위도</th>
				<th>경도</th>
			</tr>
		</thead>
		<tbody>
    		<c:forEach items = "${data.body.items.item}" var = "item">
				<tr>
					<td>${item.prkplceNo}</td>
					<td>${item.prkplceNm}</td>
					<td>${item.rdnmadr}${item.lnmadr}</td>
					<td>${item.parkingchrgeInfo}</td>
					<td>${item.latitude}</td>
					<td>${item.longitude}</td>
				</tr>
			</c:forEach>    
		</tbody>
	</table>  
</body>
</html>