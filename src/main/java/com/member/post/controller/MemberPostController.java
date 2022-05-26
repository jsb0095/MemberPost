package com.member.post.controller;

import com.member.post.dto.MemberPostDTO;
import com.member.post.service.MemberPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberPostController {

    @Autowired
    private MemberPostService memberPostService;
    @GetMapping("/save")
    public String saveForm(){
        return "member/save";
    }
    @PostMapping("/save")
        public String save(@ModelAttribute MemberPostDTO memberPostDTO){
        memberPostService.save(memberPostDTO);
        return "/member/login";
    }
    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId")String memberId){
       String IdCheck= memberPostService.duplicateCheck(memberId);
        return IdCheck;
    }
    @GetMapping("/login")
    public String login(){
        return "/member/login";
    }
    @PostMapping("/login")
    public String loginForm(@ModelAttribute MemberPostDTO memberPostDTO){
       List<MemberPostDTO> memberPostDTOList =memberPostService.loginForm(memberPostDTO);
        if(memberPostDTOList!=null){
            return "member/findAll";
        }else{
            return "member/login";
        }

    }


}
