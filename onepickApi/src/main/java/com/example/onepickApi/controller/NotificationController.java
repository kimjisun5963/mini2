package com.example.onepickApi.controller;

import java.util.Enumeration;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.onepickApi.entity.Company;
import com.example.onepickApi.entity.User;
import com.example.onepickApi.repository.CompanyRepository;
import com.example.onepickApi.repository.UserRepository;
import com.example.onepickApi.service.NotificationService;

import jakarta.servlet.http.HttpServletRequest;

@CrossOrigin("*")
@RequestMapping("/api/v1/notification")
@RestController
public class NotificationController {

	@Autowired
	private NotificationService notificationService;
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private CompanyRepository companyRepo;
	
	@GetMapping("/")
	public ResponseEntity<String> gettoken(HttpServletRequest request) {
		Enumeration<String> headers = request.getHeaderNames();
		while(headers.hasMoreElements()) {
			System.out.println(headers.nextElement());
			if(headers.nextElement().equals("username")) {
				System.out.println(request.getHeader("username"));
			}
		}
//		if(!companyRepo.findById(request.getHeader("username")).isEmpty()) {
//			return new ResponseEntity<>(companyRepo.findById(request.getHeader("username")).get(), HttpStatus.OK);
//		}else {
//			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//		}
		
		return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
	
	
    @PostMapping("/register")
    public ResponseEntity<String> registerToken(@RequestBody Map<String, String> notiToken, HttpServletRequest request) {
    	System.out.println("실행");
    	System.out.println(notiToken);
    	System.out.println(notiToken.get("token"));
    	System.out.println(request.getHeader("username"));
    	System.out.println(request.getHeader("jwtToken"));
    	System.out.println(request.getHeader("role"));
    	
		
		String username = request.getHeader("username");
 		String token = notiToken.get("token");
 		
    	if(request.getHeader("role").equals("ROLE_USER")) {
    		User user = userRepo.findById(username).get();
    		user.setToken(token);
    		userRepo.save(user);
    		return new ResponseEntity<>("done",HttpStatus.OK);
    	}else if(request.getHeader("role").equals("ROLE_COMPANY")) {
    		Company company = companyRepo.findById(username).get();
    		company.setToken(token);
    		companyRepo.save(company);
    		return new ResponseEntity<>("done",HttpStatus.OK);
    	}
    	return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
    
	@PostMapping("/test")
	private  String test() {
		
			String token = "eTIKMWTX2BKnNjgSSAOQGJ:APA91bEhKCwoPOqrq0uFr5N46nwM1JrGM5PYU9N4A8a3PwGV8mJfNlWyqmLGoN0dIT0MyS97soly_sSvgUkwQJ9M1SaVDbmvh5oBCxheisclJMtZ2DVbB6yZbA171sT2wwh6lzet_Bra"; // 실제로는 DB에서 가져옴
			
				notificationService.sendNotification(token, "번겁슙니다", "알림성공추카드려욥!");
				
					
		
		
		
		return "알림이갔을깝쑝??????";
	}
	
	
	
}