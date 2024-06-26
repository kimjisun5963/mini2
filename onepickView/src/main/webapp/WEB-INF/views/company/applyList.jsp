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
<link href="/css/applyList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="/js/CloseBrowserClearlocalStorage.js"></script>
<script src="/js/companyInterceptor.js"></script>
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="sub_header border-bottom">
	<div class="container">
	
		<div class="d-flex py-2">
			<button class="btn" type="button" onclick="location.href='/company/myHome'">
			   MyHome
			</button>
			<button class="btn" type="button" onclick="location.href='/company/scrapList'">
			   스크랩관리
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    채용공고관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/recruitList'">채용공고 조회</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/recruitForm'">채용공고 등록</button></li>
			  </ul>
			</div>
			<button class="btn text-onepick" type="button" onclick="location.href='/company/applyList'">
			   지원내역관리
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    평점관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/reviewList'">평점 조회</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/reviewForm'">평점 등록</button></li>
			  </ul>
			</div>
			<button class="btn" type="button" onclick="location.href='/company/myQnaList'">
			   QnA관리
			</button>
			<div class="dropdown">
			  <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
			    커뮤니티관리
			  </button>
			  <ul class="dropdown-menu">
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/myBoardList'">내가 쓴 글 리스트</button></li>
			    <li><button class="dropdown-item" type="button" onclick="location.href='/company/myCommentList'">내가 쓴 댓글 목록</button></li>
			  </ul>
			</div>
		</div>
	</div>
</div>
	<div class="container">
		<div class="page_title">지원 내역 리스트</div>
		<div class="accordion"></div>
		
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">지원 상태 변경</h1>
        <button  type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<span id="status-applied"><input  type="radio" value="지원완료" name="status">지원완료</input></span>
        <span id="status-wait"><input type="radio" value="면접대기" name="status">면접대기</input></span>
        <span id="status-interviewed"><input type="radio" value="면접완료" name="status">면접완료</input></span>
        <span id="status-accepted"><input  type="radio" value="합격" name="status">합격</input></span>
        <span id="status-rejected" ><input type="radio" value="불합격" name="status">불합격</input></span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="changeBtn">변경</button>
      </div>
    </div>
  </div>
</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script>
const listContainer = document.querySelector('.accordion');
const radioTypes = document.querySelectorAll("input[type='radio']")
const status_wait = document.querySelector("#status-wait")
const status_interviewed = document.querySelector("#status-interviewed")
const status_accepted = document.querySelector("#status-accepted")
const status_rejected = document.querySelector("#status-rejected")
const status_applied = document.querySelector("#status-applied")
const resume_img =  document.querySelector("#resume_img")

    const xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		let datas = JSON.parse(this.responseText);
		if (datas && datas.length > 0) {
           datas.forEach(data => {
        	   console.log(data)
        	   const listItemId = "collapse" + data.ano;
               const listItem = document.createElement('div');
               listItem.className = 'apply_list_item';
               listItem.innerHTML =  "<div class='accordion-item w-100 px-0'> <h2 class='accordion-header w-100'><div class='accordion-button collapsed' type='button' data-bs-toggle='collapse' data-bs-target='#"+listItemId+"' aria-expanded='false' aria-controls='"+listItemId+"'>"
                  +"<span style='display:none;' class='jno'>"+data.jobAd.jno+"</span><span style='display:none;' class='rno'>"+data.resume.rno+"</span><button class='btn btn-onepick me-3' onclick='changeStatus(event)' data-bs-toggle='modal' data-bs-target='#exampleModal'>"   +   data.status+"</button>" +    "<div><div style='font-weight:bolder;'>[공고 제목] "+data.jobAd.wantedTitle+"  </div>  <div> [지원자 " +data.user.name +"]      "+data.resume.title+ "</div></div><div class='ms-auto'> 지원 날짜 : "+data.regdate.slice(0, 10)+
               "</div></div></h2><div id='"+listItemId+"' class='accordion-collapse collapse' data-bs-parent='.accordion'><div class='accordion-body p-0'><img class='w-100' src='"+
               data.save+"' alt='Resume Image'></div></div></div>";
              
               listContainer.appendChild(listItem);
           });
           const statusBtns = document.querySelectorAll(".apply_list_item button");
           statusBtns.forEach(btn=>{
        	   if(btn.innerText == "불합격"){
        		   btn.style.backgroundColor="red";
        		   btn.style.borderColor="red";
        		   btn.removeAttribute("data-bs-toggle");
        		   btn.removeAttribute("data-bs-target");
        	   }else if(btn.innerText == "면접대기"){
        		   btn.style.backgroundColor="grey";
        		   btn.style.borderColor="grey";
        	   }else if(btn.innerText == "지원완료"){
        		   btn.style.backgroundColor="blue";
        		   btn.style.borderColor="blue";
        	   }else if(btn.innerText == "면접완료"){
        		   btn.style.backgroundColor="darkgreen";
        		   btn.style.borderColor="darkgreen";
        	   }else if(btn.innerText == "합격"){
        		   btn.removeAttribute("data-bs-toggle");
        		   btn.removeAttribute("data-bs-target");
        	   }
           })
		}else{
			 // 지원한 지원자가 아직 없을경우
	        listContainer.innerHTML = '지원한 지원자가 아직 존재하지 않습니다.';
		}
	  }
	xhttp.open("GET", "http://localhost:9001/api/v1/apply/company", true);
	xhttp.setRequestHeader("jwtToken", localStorage.getItem("jwtToken"));
	xhttp.setRequestHeader("username", localStorage.getItem("username"));
	xhttp.setRequestHeader("role", localStorage.getItem("role"));
	xhttp.setRequestHeader("Access-Control-Expose-Headers", "jwtToken, username, role")
	xhttp.send();
	

	
	function changeStatus(e){
		const jno = e.target.parentElement.querySelector(".jno").innerText;
		const rno = e.target.parentElement.querySelector(".rno").innerText;
		const originalStatus = e.target.innerText;
	
		if(originalStatus == "지원완료"){
			status_accepted.style.display = "none";
			status_interviewed.style.display = "none";
		}else if(originalStatus == "면접대기"){
			status_applied.style.display = "none";
			status_accepted.style.display = "none";
		}else if(originalStatus == "면접완료"){
			status_applied.style.display = "none";
			status_wait.style.display = "none";
		}
		//변경 전 기존 값 미리 선택해주기
		radioTypes.forEach(radio=>{
			if(radio.value == originalStatus){
				radio.checked = true;
			}
		})
		
		document.querySelector("#changeBtn").addEventListener("click", function(){
			//뭐가 선택됐는지 체크
			const status = document.querySelector('input[name="status"]:checked').value;
			console.log(status)
			//버튼 누르면 ajax콜로 status업데이트 해주기
			 const xhttp = new XMLHttpRequest();
				xhttp.onload = function() {
					console.log(this.responseText)
					location.href="/company/applyList";
				  }
				xhttp.open("PUT", "http://localhost:9001/api/v1/apply/status?status="+status+"&&rno="+rno+"&&jno="+jno, true);
				xhttp.setRequestHeader("jwtToken", localStorage.getItem("jwtToken"));
				xhttp.setRequestHeader("username", localStorage.getItem("username"));
				xhttp.setRequestHeader("role", localStorage.getItem("role"));
				xhttp.setRequestHeader("Access-Control-Expose-Headers", "jwtToken, username, role")
				xhttp.send();
		})
	}
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>