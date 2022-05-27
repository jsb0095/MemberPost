package com.member.post.service;

import com.member.post.dto.MemberDTO;
import com.member.post.repository.MemberPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<MemberDTO> findAll() {
        List<MemberDTO> memberDTOList=memberPostRepository.findALl();
        return memberDTOList;
    }

    public boolean delete(Long id) {
       int dropId = memberPostRepository.delete(id);
       if(dropId<=0){
           return true;
       }else {
           return false;
       }
    }
}
