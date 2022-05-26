package com.member.post.service;

import com.member.post.dto.MemberDTO;
import com.member.post.repository.MemberPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberPostService {
    @Autowired
    private MemberPostRepository memberPostRepository;
    public void save(MemberDTO memberDTO) {
        memberPostRepository.save(memberDTO);

    }

    public String duplicateCheck(String memberId) {
       MemberDTO IdCheck= memberPostRepository.duplicateCheck(memberId);
        if(IdCheck==null){
            return "yes";
        }else{
            return "no";
        }
    }

    public MemberDTO loginForm(MemberDTO memberDTO) {
       return memberPostRepository.loginForm(memberDTO);
    }
}
