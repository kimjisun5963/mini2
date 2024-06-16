<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="layout/header.jsp"></jsp:include>
<div class="container">
    <form name="frm">
        <div>카테고리</div>
        <select name="category">
            <option>서비스 이용 문의</option>
            <option>불량정보·오류 신고</option>
            <option>서비스 제안·칭찬</option>
        </select>
        <div>
            <p>제목</p><input type="text" name="title">
        </div>
        <div>
            <p>작성자</p>
            <span id="username_display"></name>
        </div>
        <div>
            <p>내용</p><input type="text" name="content">
        </div>
        <input type="submit" onclick="submitForm(event)" value="등록">
        <input type="hidden" name="username" id="username_input">
    </form>
  <a href="/admin/qnaList">
    <button>목록으로</button>
  </a>
</div>
<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
<script>
    const xhttp = new XMLHttpRequest();
    xhttp.onload = function() {
        console.log(xhttp.status);
    var headers = xhttp.getAllResponseHeaders();
    console.log("headers : " + headers);
    var token = xhttp.getResponseHeader("Authorization");
    console.log("JWT Token: " + token.split(" ")[1]);

    localStorage.setItem("jwtToken", token.split(" ")[1]);
    // 헤더 값 읽기
    let role = xhttp.getResponseHeader("Role");
    let username = xhttp.getResponseHeader("username");
    localStorage.setItem("role", role);
    localStorage.setItem("username", username);

    console.log("role : " + role);
    console.log("username : " + username);
    };
    
    let storedUsername = localStorage.getItem("username");
    if(storedUsername){
        $('#username_display').text(storedUsername);
        $('#username_input').val(storedUsername);
    }
		
		
    function submitForm(event){
    	event.preventDefault();
        alert("등록 완료되었습니다.");

        var form = document.forms['frm'];

        var formData = $(form).serialize();

        $.ajax({
            type: 'POST',
            url: 'http://localhost:9001/api/v1/qna',
            data: formData,
            success: function(response){
                console.log(response);
                window.location.href = "/admin/qnaList";
            },
            error: function(){
                console.log("에러 발생");
            }
        })
    }
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</html>