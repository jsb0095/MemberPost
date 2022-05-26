package com.member.post.controller;

import com.member.post.dto.MemberDTO;
import com.member.post.service.MemberPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
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
        public String save(@ModelAttribute MemberDTO memberDTO){
        memberPostService.save(memberDTO);
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
    public String loginForm(@ModelAttribute MemberDTO memberPostDTO, HttpSession httpSession, Model model){
       MemberDTO memberDTO=memberPostService.loginForm(memberPostDTO);
            if(memberDTO!=null){
            httpSession.setAttribute("loginMemberId",memberDTO.getId());
            httpSession.setAttribute("loginName",memberDTO.getMemberName());

            model.addAttribute("memberPostDTO", memberDTO);
            if(memberDTO.getMemberId().equals("admin")){
                    httpSession.setAttribute("adminId",memberDTO.getId());
                    httpSession.setAttribute("adminName",memberDTO.getMemberName());
                    return "member/admin";
                }
            return "member/boardList";
        }else{
            return "member/login";
        }

    }


    @GetMapping("/findAll")
    public String findAll(Model model){
        List<MemberDTO> memberDTOList=memberPostService.findAll();
        model.addAttribute("findUser",memberDTOList);
        return "member/findAll";
    }



}
