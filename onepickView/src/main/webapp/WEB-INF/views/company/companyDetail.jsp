<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container">
		<img alt="회사대표이미지">
		<img alt="로고이미지">
		<img style="width:30px; height: 30px;"src="/icon/save.png" alt="스크랩하기" onclick="toggleScrap(event)">
		
		
		<div class="company_info"></div>
		<button class="btn btn-onepick" onclick="subscribe(event)">구독하기버튼 </button>
		
	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script>



//기업정보불러오기
    const xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		console.log(this.responseText);
		let data = JSON.parse(this.responseText);
		document.querySelector(".company_info").innerHTML = 
			"<div>" + data.name +"</div><div> ⭐"+ "평점" +"</div><div>"+ data.sector +"</div><div>" 
			+ data.ceo + "</div><div>"  + data.employeesNum + "</div><div>"  + data.size + "</div><div>" + data.yrSales + "</div><div>"  + data.url + "</div>";
	  }
	xhttp.open("GET", "http://localhost:9001/api/v1/company/detail", true);
	xhttp.setRequestHeader("jwtToken", localStorage.getItem("jwtToken"));
	xhttp.setRequestHeader("username", localStorage.getItem("username"));
	xhttp.setRequestHeader("role", localStorage.getItem("role"));
	xhttp.setRequestHeader("Access-Control-Expose-Headers", "jwtToken, username, role")
	xhttp.send();
	


  

</script>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</html>