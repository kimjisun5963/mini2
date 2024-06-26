
const sector1El = document.querySelector("select[name=sector1]");
const sector2El = document.querySelector("select[name=sector2]");
const position1El = document.querySelector("select[name=position1]");
const position2El = document.querySelector("select[name=position2]");
const region1El = document.querySelector("select[name=region1]");
const region2El = document.querySelector("select[name=region2]");
const salaryEl = document.querySelector("select[name=salTpNm]");
const workTypeEl = document.querySelector("select[name=empTpNm]");
const skillContainer = document.querySelector(".skillContainer");
const wantedTitle = document.querySelector("input[name=wantedTitle]");
const jobCont = document.querySelector("textarea[name=jobCont]");
const receiptCloseDt = document.querySelector("input[name=receiptCloseDt]");
const collectPsncnt = document.querySelector("input[name=collectPsncnt]");
const WkdWkhCnt = document.querySelector("input[name=WkdWkhCnt]");
const retirepay = document.querySelector("input[name=retirepay]");
const etcWelfare = document.querySelector("input[name=etcWelfare]");
const empName = document.querySelector("input[name=empName]");
const empEmail = document.querySelector("input[name=empEmail]");
const empTel = document.querySelector("input[name=empTel]");
const experience = document.querySelector("select[name=experience]");
const skillNameEl = document.querySelector("select[name=skillName]");
const showOptionbtn = document.querySelector(".showOptionbtn");
const addSkillBtn = document.querySelector(".add-skill-btn");
const empTpNm = document.querySelector("select[name=empTpNm]");
const salTpNm = document.querySelector("select[name=salTpNm]");
const mltsvcExcHope = document.querySelector("radio[name=mltsvcExcHope]");

let selectedSector1 = null;
let selectedSector2 = null;
let selectedPosition1 = null;
let selectedPosition2 = null;
let selectedRegion1 = null;
let selectedRegion2 = null;
let selectedSalary = null;
let selectedWorkType = null;
let skillExisted = false;
let arrItems = [];

const jno = "${jno}";

// 기존 데이터를 폼에 채워주는 함수
function getRecruitInfo() {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function () {
    let data = JSON.parse(this.responseText);
    let jobad = data.jobad;
    let skills = data.skill;

    // 스킬 값 넣어주기
    skills.forEach(skill => {
      let skillItems = document.createElement("span");
      skillItems.classList = "skill_items";
      skillItems.setAttribute("id", skill.skillName);
      skillItems.style.margin = "5px";
      skillItems.innerHTML = skill.skillName + "<span onclick='deleteSkill(event)'>❌</span>";
      skillContainer.appendChild(skillItems);
      // 스킬 수정 안 하더라도 값이 선택되어 들어갈 수 있도록 넣어주기
      arrItems.push(skill.skillName);
    });

    // 기존 데이터 폼에 채워주기
    wantedTitle.value = jobad.wantedTitle;
    jobCont.value = jobad.jobCont;
    receiptCloseDt.value = jobad.receiptCloseDt;
    collectPsncnt.value = jobad.collectPsncnt;
    WkdWkhCnt.value = jobad.WkdWkhCnt;
    retirepay.value = jobad.retirepay;
    etcWelfare.value = jobad.etcWelfare;
    empName.value = jobad.empName;
    empEmail.value = jobad.empEmail;
    empTel.value = jobad.empTel;

    // 지역 1,2 텍스트로 넣어주기
    selectedRegion1 = jobad.region1;
    selectedRegion2 = jobad.region2;
    document.querySelector(".region1").innerHTML = jobad.region1 + " ▪ ";
    document.querySelector(".region2").innerHTML = jobad.region2;

    // 업종 1,2 텍스트로 넣어주기
    selectedSector1 = jobad.sector1;
    selectedSector2 = jobad.sector2;
    document.querySelector(".sector1").innerHTML = jobad.sector1 + " ▪ ";
    document.querySelector(".sector2").innerHTML = jobad.sector2;

    // 직무 1,2 텍스트로 넣어주기
    selectedPosition1 = jobad.position1;
    selectedPosition2 = jobad.position2;
    document.querySelector(".position1").innerHTML = jobad.position1 + " ▪ ";
    document.querySelector(".position2").innerHTML = jobad.position2;

    // select에  option값을 미리 선택하기(변수값에 따라서)
    selectOption(empTpNm, jobad.empTpNm);
    selectOption(salTpNm, jobad.salTpNm);
    selectOption(experience, jobad.experience);

    function selectOption(selectElement, value) {
      const checkOptionsLoaded = setInterval(() => {
        if (selectElement.options.length > 0) {
          clearInterval(checkOptionsLoaded);
          for (let i = 0; i < selectElement.options.length; i++) {
            if (selectElement.options[i].value == value) {
              selectElement.options[i].selected = true;
              break;
            }
          }
        }
      }, 100);
    }

    function checkRadioButton(name, value) {
      const radios = document.getElementsByName(name);
      for (let i = 0; i < radios.length; i++) {
        if (radios[i].value === value) {
          radios[i].checked = true;
          break;
        }
      }
    }

    // 가져온 데이터에 맞는 옵션 미리 선택해주기
    checkRadioButton('mltsvcExcHope', jobad.mltsvcExcHope);
  };

  xhttp.open("GET", "http://localhost:9001/api/v1/recruit/" + jno, true);
  xhttp.send();
}

// 수정을 위해 select 열고, 선택된 값을 저장
function setupEditButtons() {
  let sectorOpen = false;
  let positionOpen = false;
  let regionOpen = false;

  document.querySelector("#sectorBtn").addEventListener("click", function (e) {
    e.preventDefault();
    if (sectorOpen == false) {
      sector1El.style.display = "block";
      document.querySelector(".sector1").style.display = "none";
      sector2El.style.display = "block";
      document.querySelector(".sector2").style.display = "none";
      sectorOpen = true;
    } else if (sectorOpen == true) {
      // 선택한 값 저장해주기
      if (sector1El.value === "") sector1El.value = selectedSector1;
      if (sector2El.value === "") sector2El.value = selectedSector2;
      sectorOpen = false;
    }
  });

  document.querySelector("#positionBtn").addEventListener("click", function (e) {
    e.preventDefault();
    if (positionOpen == false) {
      position1El.style.display = "block";
      document.querySelector(".position1").style.display = "none";
      position2El.style.display = "block";
      document.querySelector(".position2").style.display = "none";
      positionOpen = true;
    } else if (positionOpen == true) {
      if (position1El.value === "") position1El.value = selectedPosition1;
      if (position2El.value === "") position2El.value = selectedPosition2;
      positionOpen = false;
    }
  });

  document.querySelector("#regionBtn").addEventListener("click", function (e) {
    e.preventDefault();
    if (regionOpen == false) {
      region1El.style.display = "block";
      document.querySelector(".region1").style.display = "none";
      region2El.style.display = "block";
      document.querySelector(".region2").style.display = "none";
      regionOpen = true;
    } else if (regionOpen == true) {
      if (region1El.value === "") region1El.value = selectedRegion1;
      if (region2El.value === "") region2El.value = selectedRegion2;
      regionOpen = false;
    }
  });
}

// 스킬 추가, 삭제, 저장 기능
function showSkillOption() {
  showOptionbtn.style.display = "none";
  addSkillBtn.style.display = "block";
  skillNameEl.style.display = "block";
}

function addSkill() {
  if (skillNameEl.value != "") {
    if (!skillContainer.querySelector("#" + skillNameEl.value)) {
      let skillItems = document.createElement("span");
      skillItems.classList = "skill_items";
      skillItems.setAttribute("id", skillNameEl.value);
      skillItems.style.margin = "5px";
      skillItems.innerHTML = skillNameEl.value + "<span onclick='deleteSkill(event)'>❌</span>";
      skillContainer.appendChild(skillItems);
      document.querySelector("#saveBtn").style.display = "block";
    }
  }
}

function deleteSkill(e) {
  e.target.parentElement.remove();
  document.querySelector("#saveBtn").style.display = "block";
}

function saveSkills(e) {
  arrItems = [];
  e.target.style.display = "none";
  const childNodes = document.querySelectorAll(".skill_items");

  showOptionbtn.style.display = "block";
  addSkillBtn.style.display = "none";
  skillNameEl.style.display = "none";

  childNodes.forEach(skill => {
    arrItems.push(skill.getAttribute("id"));
  });
}

// 폼 제출 시 서버로 데이터 보내기
function editJobAd(event) {
  event.preventDefault();

  // 선택된 값이 없으면 기본값을 넣기
  if (!selectedSector1) selectedSector1 = sector1El.value;
  if (!selectedSector2) selectedSector2 = sector2El.value;
  if (!selectedPosition1) selectedPosition1 = position1El.value;
  if (!selectedPosition2) selectedPosition2 = position2El.value;
  if (!selectedRegion1) selectedRegion1 = region1El.value;
  if (!selectedRegion2) selectedRegion2 = region2El.value;

  // 기본값이 여전히 비어있으면 formData에 기존 텍스트를 추가
  const form = document.querySelector("form");
  const formData = new FormData(form);
  
  formData.set("sector1", selectedSector1 || document.querySelector(".sector1").innerText.trim());
  formData.set("sector2", selectedSector2 || document.querySelector(".sector2").innerText.trim());
  formData.set("position1", selectedPosition1 || document.querySelector(".position1").innerText.trim());
  formData.set("position2", selectedPosition2 || document.querySelector(".position2").innerText.trim());
  formData.set("region1", selectedRegion1 || document.querySelector(".region1").innerText.trim());
  formData.set("region2", selectedRegion2 || document.querySelector(".region2").innerText.trim());

  fetch("http://localhost:9001/api/v1/recruit/" + jno, {
    method: "PUT",
    headers: {
      'jwtToken': localStorage.getItem("jwtToken"),
      'username': localStorage.getItem("username"),
      'role': localStorage.getItem("role")
    },
    body: formData,
  }).then(response => {
    const contentType = response.headers.get("content-type");
    if (contentType && contentType.indexOf("application/json") !== -1) {
      return response.json();
    } else {
      return response.text();
    }
  }).then(result => {
    addSkills(result);
  }).catch(error => {
    console.log('Error:', error);
  });
}

// 스킬들을 테이블에 넣어주는 함수
function addSkills(jno) {
  fetch("http://localhost:9001/api/v1/recruit/skill/" + jno, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
      'jwtToken': localStorage.getItem("jwtToken"),
      'username': localStorage.getItem("username"),
      'role': localStorage.getItem("role")
    },
    body: JSON.stringify(arrItems),
  }).then(response => {
    const contentType = response.headers.get("content-type");
    if (contentType && contentType.indexOf("application/json") !== -1) {
      return response.json();
    } else {
      return response.text();
    }
  }).then(result => {
    location.href = "/company/recruitList";
  }).catch(error => {
    console.log('Error:', error);
  });
}

// 초기화
document.addEventListener('DOMContentLoaded', function () {
  getRecruitInfo();
  setupEditButtons();
  
  	//업종
	  fetch('/json/sector_category.json')
	      .then(response => response.json())
	      .then(data => {
	          let i = 0;
	          // 업종 상위 카테고리 뿌려주기
	          while (i < data.length) {
	              const sectorCateCode = data[i].코드;
	              const sectorCategory = data[i]["산업/업종명"];
	              if (sectorCategory != null) {
	              	let optionItems = document.createElement('option');
	              	optionItems.classList = "sectorCategories"; 
	              	optionItems.setAttribute("value", sectorCategory); 
	              	optionItems.setAttribute("id", "sectorCategory" + sectorCateCode); 
	              	optionItems.innerHTML =	sectorCategory;
	              	sector1El.appendChild(optionItems);
	              }
	              i++;
	          }
	  
	          //상위카테고리가 변할때마다 값 추적
	          sector1El.addEventListener('change', function() {
	          	sector2El.innerHTML="";
	              // 선택된 option의 value 가져오기
	              selectedSector1 = sector1El.value;
	              // 선택된 option의 id 가져오기
	              const selectedOption = sector1El.options[sector1El.selectedIndex];
	              selectedSector1El = selectedOption.id;
	              console.log(document.getElementById(selectedSector1El))
	              document.getElementById(selectedSector1El).selected = "selected";

	              // 사용자가 선택한 상위카테고리 클릭시 해당 카테고리 내 상세 직무 카테고리 뿌려주기
	              if(selectedSector1){
	                  fetch('/json/sector.json')
	                  .then(response => response.json())
	                  .then(data => {
//	                   	console.log(data);
	                      let j = 0;
	                      while (j < data.length) {
	                          const sectorCode = data[j]["코드"];
	                          const sectorTitle = data[j]["산업/업종명"];
	                          if (Number(selectedSector1El.slice(14)) == data[j]["상위코드"]) {
	                              let optionItems = document.createElement('option');
	                          	optionItems.setAttribute("value", sectorTitle); 
	                          	optionItems.setAttribute("id", "sectorTitle" + sectorCode); 
	                          	optionItems.innerHTML =	sectorTitle;
	                          	sector2El.appendChild(optionItems)
	                          }
	                          j++;
	                      }
	                  });
	                  sector2El.addEventListener('change', function() {
	                	  selectedSector2 = sector2El.value;
	                	  console.log(selectedSector1)
	                	  console.log(selectedSector2)
	                  })
	              }
	          })
	      })
	     
	//직무
	  fetch('/json/job_category.json')
	      .then(response => response.json())
	      .then(data => {
	          let i = 0;
	          // 직무 상위 카테고리 뿌려주기
	          while (i < data.length) {
	          	 const cateCode = data[i].코드;
	               const jobCategory = data[i].상위직무;
	              if (jobCategory != null) {
	              	let optionItems = document.createElement('option');
	              	optionItems.classList = "jobCategories"; 
	              	optionItems.setAttribute("value", jobCategory); 
	              	optionItems.setAttribute("id", "jobCategory" + cateCode); 
	              	optionItems.innerHTML =	jobCategory;
	              	position1El.appendChild(optionItems)
	              }
	              i++;
	          }
	  
	          //상위카테고리가 변할때마다 값 추적
	          position1El.addEventListener('change', function() {
	          	position2El.innerHTML="";
	              // 선택된 option의 value 가져오기
	              selectedPosition1 = position1El.value;
	              // 선택된 option의 id 가져오기
	              const selectedOption = position1El.options[position1El.selectedIndex];
	              selectedPosition1El = selectedOption.id;
	              // 사용자가 선택한 상위카테고리 클릭시 해당 카테고리 내 상세 직무 카테고리 뿌려주기
	              if(selectedPosition1){
	                  fetch('/json/job.json')
	                  .then(response => response.json())
	                  .then(data => {
//	                   	console.log(data)
	                      let j = 0;
	                      while (j < data.length) {
	                      	const jobCode = data[j]["직무 코드"];
	                          const positionTitle = data[j]["직무 키워드명"];
	                          if (Number(selectedPosition1El.slice(11)) === data[j]["직무 상위 코드"]) {
	                              let optionItems = document.createElement('option');
	                          	optionItems.setAttribute("value", positionTitle); 
	                          	optionItems.setAttribute("id", "positionTitle" + jobCode); 
	                          	optionItems.innerHTML =	positionTitle;
	                          	position2El.appendChild(optionItems)
	                          }
	                          j++;
	                      }
	                  });
	                  position2El.addEventListener('change', function() {
	                	  console.log("포지션2클릭")
	                	    selectedPosition2 = position2El.value;
	                	  
	                	  console.log(selectedPosition1)
	                	  console.log(selectedPosition2)
	                  })
	              }
	          })
	      })
		
	//지역
	  fetch('/json/korea-administrative-district.json')
	      .then(response => response.json())
	      .then(data => {
	          let i = 0;
	          // 지역 상위 카테고리 뿌려주기
	          while (i < data.length) {
	          	  const city = Object.keys(data[i]);
	              if (city != null) {
	              	let optionItems = document.createElement('option');
	              	optionItems.classList = "cities"; 
	              	optionItems.setAttribute("value", city); 
	              	optionItems.setAttribute("id", "city" + i); 
	              	optionItems.innerHTML =	city;
	              	region1El.appendChild(optionItems)
	              }
	              i++;
	          }
	  
	          //상위카테고리가 변할때마다 값 추적
	          region1El.addEventListener('change', function() {
	          	region2El.innerHTML="";
	              // 선택된 option의 value 가져오기
	              selectedRegion1 = region1El.value;
	              // 선택된 option의 id 가져오기
	              const selectedOption = region1El.options[region1El.selectedIndex];
	              selectedRegion1El = selectedOption.id;
	              // 사용자가 선택한 상위카테고리 클릭시 해당 카테고리 내 상세 지역 카테고리 뿌려주기
	              if(selectedRegion1){
	              	   const ccode = Number(selectedRegion1El.slice(4));
	                     const gu = Object.values(data[ccode])[0];
	                  	
	                      let j = 0;
	                      while (j < gu.length) {
	                          const guName = gu[j];
	                          let optionItems = document.createElement('option');
	                         	optionItems.setAttribute("value", guName); 
	                         	optionItems.setAttribute("id", "gu" + j); 
	                         	optionItems.innerHTML =	guName;
	                         	region2El.appendChild(optionItems)
	                          j++;
	                      }
	                      region2El.addEventListener('change', function() {
		                	    selectedRegion2 = region2El.value;
		                  })
	              }
	          })
	      })
	      
	//임금조건
	fetch('/json/salary.json')
	      .then(response => response.json())
	      .then(data => {
	          let i = 0;
	          // 임금 조건뿌려주기
	          while (i < data.length) {
	          	const salary = data[i].학력
	              if (salary != null) {
	              	let optionItems = document.createElement('option');
	              	optionItems.classList = "salaries"; 
	              	optionItems.setAttribute("value", salary); 
	              	optionItems.setAttribute("id", "salary" + i); 
	              	optionItems.innerHTML =	salary;
	              	salaryEl.appendChild(optionItems)
	              }
	              i++;
	          }
	          salaryEl.addEventListener('change', function() {
	              // 선택된 option의 value 가져오기
	              selectedSalary = salaryEl.value;
	          })
	      })
	//고용형태
	fetch('/json/workType.json')
	      .then(response => response.json())
	      .then(data => {
//	       	console.log(data)
	          let i = 0;
	          // 고용형태 조건뿌려주기
	          while (i < data.length) {
	          	const workType = data[i].근무형태
	              if (workType != null) {
	              	let optionItems = document.createElement('option');
	              	optionItems.classList = "workTypes"; 
	              	optionItems.setAttribute("value", workType); 
	              	optionItems.setAttribute("id", "workType" + i); 
	              	optionItems.innerHTML =	workType;
	              	workTypeEl.appendChild(optionItems)
	              }
	              i++;
	          }
	          workTypeEl.addEventListener('change', function() {
	              // 선택된 option의 value 가져오기
	              selectedWorkType = workTypeEl.value;
	              console.log(selectedWorkType)
	          })
	      })
  
});
