package com.member.post.service;

import com.member.post.dto.MemberPostDTO;
import com.member.post.repository.MemberPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberPostService {
    @Autowired
    private MemberPostRepository memberPostRepository;
    public void save(MemberPostDTO memberPostDTO) {
        memberPostRepository.save(memberPostDTO);

    }

    public String duplicateCheck(String memberId) {
       MemberPostDTO IdCheck= memberPostRepository.duplicateCheck(memberId);
        if(IdCheck==null){
            return "yes";
        }else{
            return "no";
        }
    }

    public List<MemberPostDTO> loginForm(MemberPostDTO memberPostDTO) {
       return memberPostRepository.loginForm(memberPostDTO);
    }
}
