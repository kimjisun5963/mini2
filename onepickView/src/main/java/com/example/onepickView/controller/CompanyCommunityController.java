package com.example.onepickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/company")
public class CompanyCommunityController {

	// 리스트
	@RequestMapping("/communityList")
	public String communityList() {
		return  "company/community/communityList";
	}
	
	// 디테일
	@RequestMapping("/communityDetail")
	public String communityDetail(@RequestParam("cbno") Long cbno, Model model) {
		
		model.addAttribute("cbno", cbno);
		return  "company/community/communityDetail";
	}
	
	// 작성폼
	@RequestMapping("/communityForm")
	public String communityForm() {
		return  "company/community/communityForm";
	}
	
	// 수정폼
	@RequestMapping("/communityEdit")
	public String communityRevision(@RequestParam("cbno") Long cbno, Model model) {
		
		model.addAttribute("cbno", cbno);
		return "company/community/communityEdit";
	}
	
	// 기업 마이페이지 - 내가 쓴 게시글 목록 조회
	@RequestMapping("/myBoardList")
	public String myBoard() {
		
		return "company/myBoardList";
	}
	
	//기업 마이페이지 - 내가 쓴 댓글 목록 조회
	@RequestMapping("/myCommentList")
	public String mycomment() {
		
		return "company/myCommentList";
	}
	
	
	
}
