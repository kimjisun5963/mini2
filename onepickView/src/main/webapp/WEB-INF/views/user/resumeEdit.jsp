<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1PICK!</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet">
<link href="/css/resumeForm.css" rel="stylesheet">
<script src="/js/resume_EditForm.js"></script>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container" id="box">
<h3>이력서 작성</h3>
<hr>
<form name="frm">
	  	
  	<label class="checkbox-container">공개 여부
    <input type="checkbox" id="disclo_check" name="disclo" value="public">
    <span class="checkmark"></span>
	</label><br><br>
  	
	이력서 제목<input type="text" name="title" id="title" placeholder="이력서 제목을 입력해주세요" class="textbox"><br>
	자기소개서 제목<input type="text" name="selfInfoTitle" id="selfInfoTitle" placeholder="자기소개서 제목을 입력해주세요" class="textbox"><br>
	자기소개서 내용<br>
	<textarea name="selfInfoContent" class="longtext" id="selfInfoContent" placeholder="자기소개서 내용을 입력해주세요" ></textarea>
	<span style="color:#aaa;" id="counter">글자 수 (0 / 500)</span><br>
	
	<div>
	<label for="select1">희망근무지역1</label>
	<select name="region1" id="select1" class="selectbox"> 
		<option value="">시 선택</option>
	</select>	
	<select name="region1_1" id="select2" class="selectbox">
		<option value="">구 선택</option>
	</select>
	</div>
	
	<br>
	
	<div>
	<label for="select3">희망근무지역2</label>
	<select name="region2" id="select3" class="selectbox">
		<option value="">시 선택</option>
	</select>	
	<select name="region2_1" id="select4" class="selectbox">
		<option value="">구 선택</option>
	</select>
	</div>
	
	<br>
	
	<div>
	<label for="select_sector">관심업종</label>
	<select name="sector" id="select_sector" class="selectbox">
		<option value="">관심업종 선택</option>
	</select>
	
	<label for="select_job">관심직무</label>
	<select name="job" id="select_job" class="selectbox">
		<option value="">관심직무 선택</option>
	</select>
	</div>
	
	<br>
	포트폴리오 URL<input type="text" name="portfolioUrl" id="portfolioUrl" placeholder="내용을 입력하세요" class="textbox"><br><br>
	
	<div>
		<span class="subtitle">사회활동</span><br>
		<hr>
		시작일<input type="date" name="startDay" id="startDay" class="datebox">
		종료일<input type="date" name="endDay" id="endDay" class="datebox"><br>
		참여기관<input type="text" name="ex_org" id="ex_org" placeholder="내용을 입력하세요" class="textbox"><br>
		활동내역<input type="text" name="ex_content" id="ex_content" placeholder="내용을 입력해주세요" class="textbox"><br><br>
	</div>
	
	<div>
		<span class="subtitle">자격증</span><br>
		<hr>
		자격증명<input type="text" name="lname" id="lname" placeholder="내용을 입력하세요" class="textbox"><br>
		발급기관<input type="text" name="org" id="org" placeholder="내용을 입력하세요" class="textbox"><br>
		취득일<input type="date" name="getDate" id="getDate" class="datebox"><br><br>
	</div>
	
	<div>
		<span class="subtitle">학력사항</span><br>
		<hr>
		입학일자<input type="date" name="accDate" id="accDate" class="datebox">
		졸업일자<input type="date" name="gradDate" id="gradDate" class="datebox"><br>
		학교명<input type="text" name="eduName" id="eduName" placeholder="내용을 입력하세요" class="textbox">
		전공학과<input type="text" name="major" id="major" placeholder="내용을 입력하세요" class="textbox"><br>
		학점<input type="text" name="score" id="score" placeholder="내용을 입력하세요" class="textbox">
		
		<label for="select_degree">상태</label>
		<select name="s_status" id="select_degree" class="selectbox">
			<option value="졸업">졸업</option>
			<option value="중퇴">중퇴</option>
			<option value="휴학">휴학</option>
			<option value="기타">기타</option>
		</select><br><br>
	</div>
	
	<div>

		<span class="subtitle">경력사항</span><br>
		<hr>
		입사일자<input type="date" name="startDate" id="startDate" class="datebox">
		퇴사일자<input type="date" name="endDate" id="endDate" class="datebox"><br>
		회사명<input type="text" name="companyName" id="companyName" placeholder="내용을 입력하세요" class="textbox">
		직급<input type="text" name="rank" id="rank" placeholder="내용을 입력하세요" class="textbox"><br>
		
		
		
		<label for="select_sector2">업종</label>
		<select name="c_type" id="select_sector2" class="selectbox">
			<option value="">업종 선택</option>
		</select>
		
		<label for="select_job2">직무</label>
		<select name="position" id="select_job2" class="selectbox">
			<option value="">업종을 먼저 선택해주세요</option>
		</select><br>
		
		<label for="select_career">상태</label>
		<select name="career_status" id="select_career" class="selectbox">
			<option value="재직">재직중</option>
			<option value="퇴사">퇴사</option>
			<option value="기타">기타</option>
		</select><br>
		
		업무 내용<input type="text" name="work" id="work" placeholder="내용을 입력하세요" class="textbox"><br><br>

	</div>
	
	<div>
		<span class="subtitle">보유능력</span><br>
		<hr>
		<label for="select_skill">타입</label>
		<select name="skillName" id="select_skill" class="selectbox">
			<option value="">스킬 선택</option>
			<option value="java">java</option>
			<option value="python">python</option>
			<option value="javascript">javascript</option>
			<option value="c++">c++</option>
			<option value="Ruby">Ruby</option>
			<option value="SQL">SQL</option>
			<option value="R">R</option>
			<option value="C">C</option>
			<option value="ERP">ERP</option>
			<option value="HTML/CSS">HTML/CSS</option>
			<option value="React">React</option>
			<option value="Angular">Angular</option>
			<option value="Vue.js">Vue.js</option>
			<option value="Django">Django</option>
			<option value="네트워크 보안">네트워크 보안</option>
			<option value="Swift(IOS)">Swift(IOS)</option>
			<option value="Kotlin">Kotlin</option>
				<option value="Flutter">Flutter</option>
			<option value="Excel">Excel</option>
			<option value="외국어능통">외국어능통</option>
		</select><br>
		
		내용<input type="text" name="oa_content" id="oa_content" placeholder="내용을 입력하세요" class="textbox">
	</div>
	
	<input type="button" value="등록하기" onclick="postData(event)" class="btn2">
</form>
</div>

<script>
$(document).ready(function() {
	$('.longtext').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 500)");    //글자수 실시간 카운팅

	    if (content.length > 500){
	        alert("최대 500자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 500));
	        $('#counter').html("(500 / 500)");
	    }
	});
	
	
	var rno = <%= request.getParameter("rno") %>;
    // AJAX 요청 보내기
    $.ajax({
    	url: 'http://localhost:9001/api/v1/resume/' + rno,
	    type: 'GET',
	    dataType: 'json',
        success: function(data) {
        	console.log(data);
            var resume = data.resume;
            // 각 input 요소에 값 설정
            $('#disclo_check').prop('checked', resume.disclo === 'public');
            $('#title').val(resume.title);
            $('#selfInfoTitle').val(resume.selfInfoTitle);
            $('#selfInfoContent').val(resume.selfInfoContent);
            $('#portfolioUrl').val(resume.portfolioUrl);
            $('#select1').val(resume.region1);
            $('#select2').val(resume.region1_1);
            $('#select3').val(resume.region2);
            $('#select4').val(resume.region2_1);
            $('#select_sector').val(resume.sector);
            $('#select_job').val(resume.job);
            
            var experiences = data.experiences[0]; // 예시로 첫 번째 경험을 사용
            $('#startDay').val(experiences.startDay);
            $('#endDay').val(experiences.endDay);
            $('#ex_org').val(experiences.ex_org);
            $('#ex_content').val(experiences.ex_content);

            var licenses = data.licenses[0]; // 예시로 첫 번째 자격증을 사용
            $('#lname').val(licenses.lname);
            $('#org').val(licenses.org);
            $('#getDate').val(licenses.getDate);

            var school = data.schools[0]; // 예시로 첫 번째 학력을 사용
            $('#accDate').val(school.accDate);
            $('#gradDate').val(school.gradDate);
            $('#eduName').val(school.eduName);
            $('#major').val(school.major);
            $('#score').val(school.score);
            $('#select_degree').val(school.s_status);

            var career = data.careers[0]; // 예시로 첫 번째 경력을 사용
            $('#startDate').val(career.startDate);
            $('#endDate').val(career.endDate);
            $('#companyName').val(career.companyName);
            $('#rank').val(career.rank);
            $('#select_sector2').val(career.c_type);
            $('#select_job2').val(career.position);
            $('#select_career').val(career.career_status);
            $('#work').val(career.work);

            var skill = data.oaList[0]; // 예시로 첫 번째 스킬을 사용
            $('#select_skill').val(skill.skillName);
            $('#oa_content').val(skill.oa_content);
            
            
            
            
            
            
            
        },
        error: function(xhr, status, error) {
            console.error('AJAX 요청 실패:', status, error);
        }
    });
});



</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>