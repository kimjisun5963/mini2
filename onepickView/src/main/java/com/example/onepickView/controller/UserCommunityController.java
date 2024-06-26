package com.example.onepickView.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserCommunityController {

	// 리스트
	@RequestMapping("/communityList")
	public String communityList() {
		return  "user/community/communityList";
	}
	
	// 디테일
	@RequestMapping("/communityDetail")
	public String communityDetail(@RequestParam("ubno") Long ubno, Model model) {
		
		model.addAttribute("ubno", ubno);
		return  "user/community/communityDetail";
	}
	
	// 작성폼
	@RequestMapping("/communityForm")
	public String communityForm() {
		return  "user/community/communityForm";
	}
	
	// 수정폼
	@RequestMapping("/communityEdit")
	public String communityRevision(@RequestParam("ubno") Long ubno, Model model) {
		
		model.addAttribute("ubno", ubno);
		return "user/community/communityEdit";
	}
	
	// 구직자 마이페이지 - 내가 쓴 게시글 목록 조회
	@RequestMapping("/myBoardList")
	public String myBoard() {
		
		return "user/myBoardList";
	}
	
	// 구직자 마이페이지 - 내가 쓴 댓글 목록 조회
	@RequestMapping("/myCommentList")
	public String mycomment() {
		
		return "user/myCommentList";
	}
	
	
}
