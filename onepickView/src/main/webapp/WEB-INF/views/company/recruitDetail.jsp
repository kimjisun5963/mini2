<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/recruitDetail.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100 min-h-100">
<jsp:include page="../layout/header.jsp"></jsp:include>
	<div class="container">
	<div class="dDay-container">
    공고 마감일까지 <span id="dDay"></span>
	</div>
	<div class="container_job">
		<div class="recruit_detail">
		   <div class='company-header'>
	            <div class='com_file'>
	                <img alt="기업 대표이미지">
	            </div>
	            <div class='company-info'>
	                <h1 class='com_name'></h1>
	                <div class='company-rating'>
	                    ⭐ <span id="companyScore"></span>
	                </div>
	                <div class='company-details'>
	                    <span class='com_sector'></span> · <span class='com_size'></span> <br>
	                    <span class='com_addr'></span> <br>
	                    <a href="" class='com_url' target="_blank"></a>
	                </div>
	            </div>
	        </div>
        <div class='title'></div>
        <div class='section'>
            <div class='section-title'>기업 상세정보</div>
            <div><span class='title_s'>대표명 </span><span class='com_ceo'></span></div>
            <div><span class='title_s'>연매출 </span><span class='com_yrSales'></span> <span class='title_s'>원 </span></div>
            <div><span class='title_s'>사원 수 </span><span class='com_employeesNum'></span> <span class='title_s'>명</span></div>
        </div>
	        <div class='section'>
	            <div class='section-title'>요약</div>
	            <div><span class='title_s'>📅 마감 </span><span class='receiptCloseDt'></span></div>
	            <div><span class='title_s'>📈 모집인원 </span><span class='collectPsncnt'></span></div>
	            <div><span class='title_s'>💼 직무 </span><span class='position'></span></div>
	            <div><span class='title_s'>📶 경력 </span><span class='experience'></span></div>
	            <div><span class='title_s'>✔️ 고용형태 </span><span class='empTpNm'></span></div>
	            <div><span class='title_s'>📍 근무지역 </span><span class='region'></span></div>
	            <div class='skillContainer'><span class='title_s'>🪪 스킬 </span></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>주요 업무</div>
	            <div class='jobCont'></div>
	            <div class='file'><img alt="공고이미지 첨부파일"></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>복지 및 혜택</div>
	            <div class='etcWelfare'></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>추가 정보</div>
	            <div><span class='title_s'>근무시간</span> <span class='wkdWkhCnt'></span></div>
	            <div><span class='title_s'>퇴직금</span> <span class='retirepay'></span></div>
	            <div><span class='title_s'>임금 조건</span> <span class='salTpNm'></span></div>
	            <div><span class='title_s'>병역특례채용희망</span> <span class='mltsvcExcHope'></span></div>
	        </div>
	        <div class='section'>
	            <div class='section-title'>담당자정보</div>
	            <div><span class='title_s'>담당자 이름</span> <span class='empName'></span></div>
	            <div><span class='title_s'>담당자 이메일</span> <span class='empEmail'></span></div>
	            <div><span class='title_s'>담당자 연락처</span> <span class='empTel'></span></div>
	        </div>
		</div>
			<div class="btnContainer">
		<div id="icon_wrap">
			<a id="btnTwitter" href="javascript:shareTwitter();">
				<img src="/icon/icon-twitter.png" class="link-icon twitter"></a>
			<a id="btnFacebook" href="javascript:shareFacebook();"> <img src="/icon/icon-facebook.png" class="link-icon facebook"></a>
			<a id="btnKakao" href="javascript:shareKakao();">
				<img src="/icon/icon-kakao.png" class="link-icon kakao"></a>
		</div>
		<div id="btn_wrap">
			<div id="copyBtn" onclick="copyToClipboard()">
				<img style="width:25px; height:25px;" src="/icon/copy.png" alt="copyBtn">
			</div>
			<div id="scrapBtn" onclick="handleScrapButton()">
				<img style="width:25px; height:25px;" src="/icon/save.png">
			</div>
			<div id="likeBtn" onclick="handleInterestButton()">
				<img style="width:25px; height:25px;" src="/icon/heart.png">
			</div>
		</div>
		<button class="btn btn-onepick apply-btn" onclick="apply()">지원하기</button>
		</div>
		</div>
	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>

<script>

const jno = "${jno}";


const xhttp = new XMLHttpRequest();
xhttp.onload = function() {
	console.log(JSON.parse(this.responseText));
	let data = JSON.parse(this.responseText);
	let jobad = data.jobad;
	let company = jobad.company;
	let skills = data.skill;
	let displayMlService = jobad.mltsvcExcHope == 'y' ? '🅾️' : '✖️';
	let displayEtcWelfare = jobad.etcWelfare ? jobad.etcWelfare : '해당사항 없음';
	let displayRetirepay = jobad.retirepay ? jobad.retirepay : '해당사항 없음';
	const employeesNum = Number(company.employeesNum).toLocaleString('en-US');
	const yrSales = Number(company.yrSales).toLocaleString('en-US');
	let displayYrSales = company.yrSales ? yrSales : '정보 없음';
	//기업 정보 띄워주기
    document.querySelector(".com_name").innerHTML = company.name;
    document.querySelector(".com_ceo").innerHTML = company.ceo;
    document.querySelector(".com_sector").innerHTML = company.sector;
    document.querySelector(".com_size").innerHTML = company.size;
    document.querySelector(".com_yrSales").innerHTML = displayYrSales;
    document.querySelector(".com_addr").innerHTML = company.addr;
    document.querySelector(".com_employeesNum").innerHTML = employeesNum;
    document.querySelector(".com_url").innerHTML = '기업 홈페이지';
    document.querySelector(".com_url").href = "https://" + company.url;
    //기업 기본 사진
    if(company.fileName != null){
    	document.querySelector(".com_file img").src = "/images/" + company.fileName;
    }else{
    	document.querySelector(".com_file img").src = "/img/no_img.jpg";
    }
   
    //공고 정보 넣어주기
	document.querySelector(".title").innerHTML = jobad.wantedTitle;
	document.querySelector(".receiptCloseDt").innerHTML = jobad.receiptCloseDt;
	document.querySelector(".collectPsncnt").innerHTML = jobad.collectPsncnt;
	document.querySelector(".position").innerHTML = jobad.position1 + "   ,  "+ jobad.position2;
	document.querySelector(".experience").innerHTML = jobad.experience;
	document.querySelector(".empTpNm").innerHTML = jobad.empTpNm;
	document.querySelector(".region").innerHTML = jobad.region1 + "   ,  " + jobad.region2;
	document.querySelector(".jobCont").innerHTML = jobad.jobCont;
	document.querySelector(".etcWelfare").innerHTML = displayEtcWelfare;
	document.querySelector(".wkdWkhCnt").innerHTML = jobad.wkdWkhCnt ;
	document.querySelector(".retirepay").innerHTML = displayRetirepay;
	document.querySelector(".salTpNm").innerHTML = jobad.salTpNm;
	document.querySelector(".mltsvcExcHope").innerHTML = displayMlService;
	document.querySelector(".empName").innerHTML = jobad.empName;
	document.querySelector(".empEmail").innerHTML = jobad.empEmail;
	document.querySelector(".empTel").innerHTML = jobad.empTel;
	//공고 이미지 
	 if(jobad.fileName != null){
			document.querySelector(".file img").src = "/images/" + jobad.fileName;
	    }else{
	    	document.querySelector(".file img").style.display = "none";
	    }
	//디데이 계산
	 const dday = calcDday(jobad.receiptCloseDt);
	 dDay.innerHTML = "D- " + dday + " 일";
	 
	  
	//스킬 정보 넣어주기
	const skillContainer = document.querySelector(".skillContainer");
	 skills.forEach(skill=>{
		let skillItems = document.createElement("span");
		skillItems.classList = "skill_items"
		skillItems.style.margin="5px";
		skillItems.innerHTML= "📌 " + skill.skillName + "   ";
		skillContainer.appendChild(skillItems);
	  })
		  
	//평균평점불러오기
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	  	console.log(this.responseText);
	  	console.log(Number(this.responseText));
	  	console.log(Number(this.responseText).toFixed(1));
	  if(this.responseText != null || this.responseText !=""){
	  	document.querySelector("#companyScore").innerHTML = Number(this.responseText).toFixed(1);
	  }else{
	  	document.querySelector("#companyScore").innerHTML="0.0"
	  }
	    }
	  xhttp.open("GET", "http://localhost:9001/api/v1/company/avg-rating", true);
	  xhttp.setRequestHeader("jwtToken", localStorage.getItem("jwtToken"));
	  xhttp.setRequestHeader("username", localStorage.getItem("username"));
	  xhttp.setRequestHeader("role", localStorage.getItem("role"));
	  xhttp.setRequestHeader("Access-Control-Expose-Headers", "jwtToken, username, role")
	  xhttp.send();
 }
xhttp.open("GET", "http://localhost:9001/api/v1/recruit/"+jno, true);
xhttp.send();


//소셜미디어 공유버튼
function shareTwitter() {
	const sendText = [[${ jobad.wantedTitle }]]; // 전달할 텍스트
	const sendUrl = window.location.href; // 전달할 URL
	window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
function shareFacebook() {
	var sendUrl = window.location.href; // 전달할 URL
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
function shareKakao() {
	// 사용할 앱의 JavaScript 키 설정
	Kakao.init('a65924b5ad21649d69b934fcd8c1eeea');
	// 카카오링크 버튼 생성
	Kakao.Link.createDefaultButton({
		container: '#btnKakao', // 카카오공유버튼ID
		objectType: 'feed',
		content: {
			title: "원픽 채용공고", // 보여질 제목
			description: "onepick", // 보여질 설명
			imageUrl: window.location.href, // 콘텐츠 URL
			link: {
				mobileWebUrl: window.location.href,
				webUrl: window.location.href
			}
		}
	});
}

//주소복사버튼
function copyToClipboard() {
	var t = document.createElement("textarea");
	document.body.appendChild(t);
	t.value = window.location.href;
	t.select();
	document.execCommand('copy');
	document.body.removeChild(t);
};
document.querySelector("#copyBtn").addEventListener("click", function () {
	copyToClipboard(window.location.href);
	alert('주소를 복사하였습니다');
})
//디데이 계산 
function calcDday(targetDate) {
	// 주어진 날짜와 현재 날짜 간의 차이 계산
	const oneDay = 24 * 60 * 60 * 1000; // 하루를 밀리초 단위로 표현
	const today = new Date(); // 현재 날짜
	const target = new Date(targetDate); // 주어진 날짜

	// 주어진 날짜와 현재 날짜 간의 차이를 일 단위로 계산
	const diffDays = Math.round((target - today) / oneDay);

	return diffDays;
}




//스크랩 이미 되어있으면 스크랩 색깔 채워진거로 하는 코드
/* document.addEventListener("DOMContentLoaded", function() {
    checkScrapStatus();
});

function checkScrapStatus() {
    const xhttp = new XMLHttpRequest();
    const scrapBtn = document.querySelector("#scrapBtn img");
    xhttp.onload = function () {
        if (this.status === 200 && this.responseText !== "") {
            // 스크랩이 되어있는 경우
            scno = this.responseText;
            scrapBtn.src = "/icon/save_full.png";
        } else {
            // 스크랩이 안 되어있는 경우
            scrapBtn.src = "/icon/save.png";
        }
    };
    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };
    xhttp.open("GET", "http://localhost:9001/api/v1/job-scrap-status/" + jno, true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
} */






let scno = null; 

//스크랩 연속실행 핸들러
function handleScrapButton() {
    const scrapBtn = document.querySelector("#scrapBtn img");

    if (scrapBtn.src.includes("save.png")) {
        // 스크랩 등록
        scrapJobad();
    } else if (scrapBtn.src.includes("save_full.png")) {
        // 스크랩 취소 확인
        if (confirm("정말 해당 공고를 스크랩 리스트에서 삭제하시겠습니까?")) {
            scrapJobadCancel();
        }
    }
}

// 공고 스크랩하기
function scrapJobad() {
    const xhttp = new XMLHttpRequest();
    const scrapBtn = document.querySelector("#scrapBtn img");
    xhttp.onload = function () {
        if (this.status === 200) {
            alert("스크랩 등록 성공!");
            // 버튼을 스크랩 완료 이미지로 변경
            scrapBtn.src = "/icon/save_full.png";
            // 응답으로 받은 scno 저장
            scno = this.responseText;  
            console.log("scno 출력: " + scno);
        } else {
            console.error("스크랩 등록 실패:", this.status, this.statusText);
        }
    };
    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };
    xhttp.open("POST", "http://localhost:9001/api/v1/job-scrap/" + jno, true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
}

// 공고 스크랩 취소
function scrapJobadCancel() {
    const xhttp = new XMLHttpRequest();
    const scrapBtn = document.querySelector("#scrapBtn img");
    xhttp.onload = function () {
        if (this.status === 200) {
            alert("스크랩을 취소하였습니다.");
            // 버튼을 비어있는 스크랩 이미지로 변경
            scrapBtn.src = "/icon/save.png";
        } else {
            console.error("스크랩 취소 실패:", this.status, this.statusText);
        }
    };
    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };
    xhttp.open("DELETE", "http://localhost:9001/api/v1/job-scrap/" + scno, true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
}




/* function scrapJobad() {
    const xhttp = new XMLHttpRequest();
    const scrapBtn = document.querySelector("#scrapBtn img");

    xhttp.onload = function () {
        if (this.status === 200) {
            alert("스크랩 등록 성공!");
            scrapBtn.src = "/icon/save_full.png";
            // 응답으로 받은 scno 저장
            scno = this.responseText;

            // 스크랩 상태를 로컬 스토리지에 저장
            localStorage.setItem('scrapStatus_' + jno, 'scrap');
        } else {
            console.error("스크랩 등록 실패:", this.status, this.statusText);
        }
    };

    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };

    xhttp.open("POST", "http://localhost:9001/api/v1/job-scrap/" + jno, true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
}

function scrapJobadCancel() {
    const xhttp = new XMLHttpRequest();
    const scrapBtn = document.querySelector("#scrapBtn img");

    xhttp.onload = function () {
        if (this.status === 200) {
            alert("스크랩을 취소하였습니다.");
            scrapBtn.src = "/icon/save.png";

            // 스크랩 상태를 로컬 스토리지에서 제거
            localStorage.removeItem('scrapStatus_' + jno);
        } else {
            console.error("스크랩 취소 실패:", this.status, this.statusText);
        }
    };

    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };

    // 삭제할 scno 값이 없다면 오류 방지를 위해 조건 처리
    if (scno) {
        xhttp.open("DELETE", "http://localhost:9001/api/v1/job-scrap/" + scno, true);
        xhttp.setRequestHeader("username", localStorage.getItem("username"));
        xhttp.send();
    } else {
        console.error("삭제할 스크랩 번호가 없습니다.");
    }
}

// 페이지 로드 시 스크랩 상태 복원
document.addEventListener("DOMContentLoaded", function () {
    const scrapStatus = localStorage.getItem('scrapStatus_' + jno);
    const scrapBtn = document.querySelector("#scrapBtn img");

    if (scrapStatus === 'scrap') {
        scrapBtn.src = "/icon/save_full.png";
    } else {
        scrapBtn.src = "/icon/save.png";
    }
});
 */






let interno = null; 

//관심기업 연속실행 핸들러
function handleInterestButton() {
    const likeBtn = document.querySelector("#likeBtn img");

    if (likeBtn.src.includes("heart.png")) {
        
    	interest();
    } else if (likeBtn.src.includes("heart_full.png")) {
        
        if (confirm("정말 관심기업 리스트에서 삭제하시겠습니까?")) {
        	interestCancel();
        }
    }
}

const cid = "${jobad.company.cid}";
// 관심기업 등록
function interest() {
    const xhttp = new XMLHttpRequest();
    const likeBtn = document.querySelector("#likeBtn img");
    xhttp.onload = function () {
        if (this.status === 200) {
            alert("관심기업 등록 성공!");

            likeBtn.src = "/icon/heart_full.png";
       
            interno = this.responseText;  
 
        } else {
            console.error("관심기업 등록 실패:", this.status, this.statusText);
        }
    };
    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };
    xhttp.open("POST", "http://localhost:9001/api/v1/interested-company/" + "com1", true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
}


// 관심기업 등록 취소
function interestCancel() {
    const xhttp = new XMLHttpRequest();
    const likeBtn = document.querySelector("#likeBtn img");
    xhttp.onload = function () {
        if (this.status === 200) {
            alert("해당 기업을 관심기업 리스트에서 삭제하였습니다.");

            likeBtn.src = "/icon/heart.png";
        } else {
            console.error("관심기업 등록 취소 실패:", this.status, this.statusText);
        }
    };
    xhttp.onerror = function () {
        console.error("AJAX 요청 실패:", this.status, this.statusText);
    };
    xhttp.open("DELETE", "http://localhost:9001/api/v1/interested-company/" + interno, true);
    xhttp.setRequestHeader("username", localStorage.getItem("username"));
    xhttp.send();
}





/*  //기업 구독하기
function likeTheCom() {
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function () {
		if (this.responseText == "관심기업 추가 성공!") {
			alert("성공적으로 해당기업을 구독 했습니다!")
			//버튼 색칠한거로 바꿔주기
			document.querySelector("#likeBtn img").src = "/icon/heart_full.png";
		} else {
			if (confirm("정말 해당 기업을 구독 리스트에서 삭제하시겠습니까?")) {
				//비어있는 버튼으로 바꿔주기
				document.querySelector("#likeBtn img").src = "/icon/heart.png";
			}
		}
	}
	xhttp.open("POST", "/api/v1/interested-company/" + [[${ jobad.company.cid }]], true);
	xhttp.setRequestHeader("username", localStorage.getItem("username"));
	xhttp.send();
} 
 */
 
 
 
function apply(){
	 if (confirm("해당 채용공고에 지원하시겠습니까?")) {
		 $.ajax({
			    url: 'http://localhost:9001/api/v1/apply?rno=' + 1 + '&jno=' + jno,
			    type: 'POST',
			    headers: {
			    	'username': username
			    }, 
			    success: function(data) {
			    	alert(data);
			    },
			    error: function(xhr, status, error) {
			        console.error('AJAX 요청 실패:', status, error);
			    }
			});
	 }
 } 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

</script>
</body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</html>