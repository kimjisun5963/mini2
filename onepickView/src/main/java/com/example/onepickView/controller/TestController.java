package com.example.onepickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/admintest")
	public String admintest() {
		System.out.println("admin test...");
		return "/admin/index";
	}
}
