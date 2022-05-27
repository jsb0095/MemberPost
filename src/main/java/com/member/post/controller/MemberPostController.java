package com.member.post.controller;

import com.member.post.dto.MemberDTO;
import com.member.post.service.MemberPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberPostController {

    @Autowired
    private MemberPostService memberPostService;

    @GetMapping("/save")
    public String saveForm() {
        return "member/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) throws IOException {
        memberPostService.save(memberDTO);
        return "/member/login";
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        String IdCheck = memberPostService.duplicateCheck(memberId);
        return IdCheck;
    }

    @GetMapping("/login")
    public String login() {
        return "/member/login";
    }

    @PostMapping("/login")
    public String loginForm(@ModelAttribute MemberDTO memberPostDTO, HttpSession httpSession, Model model) {
        MemberDTO memberDTO = memberPostService.loginForm(memberPostDTO);
        if (memberDTO != null) {
            httpSession.setAttribute("loginMemberId", memberDTO.getId());
            httpSession.setAttribute("loginName", memberDTO.getMemberName());
            httpSession.setAttribute("loginProfile",memberDTO.getMemberProfileName());
            model.addAttribute("memberPostDTO", memberDTO);

            if (memberDTO.getMemberId().equals("admin")) {
                return "member/admin";
            }
            return "member/member";
        } else {
            return "member/login";
        }

    }

    @GetMapping("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberPostService.findAll();
        model.addAttribute("findUser", memberDTOList);
        return "member/findAll";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boolean dropId = memberPostService.delete(id);
        if (dropId) {
            return "member/admin";
        } else {
            return "redirect:/member/findAll";
        }

    }

    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @GetMapping("/detail")
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberPostService.findById(id);
        model.addAttribute("findById", memberDTO);
        System.out.println(memberDTO);
        return "member/detail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberPostService.findById(id);
        model.addAttribute("updateId",memberDTO);


        return "member/update";
    }


    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO)throws IOException {
         boolean result= memberPostService.update(memberDTO);
        System.out.println(memberDTO);
        System.out.println("MemberPostController.update");
         if (result){
             return "redirect:/member/detail?id="+memberDTO.getId();
         }else {
             return "fail";
         }

    }
}