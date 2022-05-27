package com.member.post.service;

import com.member.post.dto.MemberDTO;
import com.member.post.repository.MemberPostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class MemberPostService {
    @Autowired
    private MemberPostRepository memberPostRepository;
    public void save(MemberDTO memberDTO)throws IOException  {
            MultipartFile boardFile = memberDTO.getMemberProfile();
            String boardFileName = boardFile.getOriginalFilename();
            boardFileName = System.currentTimeMillis() + "-" + boardFileName;
            memberDTO.setMemberProfileName(boardFileName);
            String savePath = "C:\\Spring_img\\" + boardFileName;
            if (!boardFile.isEmpty()) {
                boardFile.transferTo(new File(savePath));
        memberPostRepository.save(memberDTO);

    }
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

    public MemberDTO findById(Long id) {
       MemberDTO memberDTO= memberPostRepository.findById(id);
        System.out.println(memberDTO);
       return memberDTO;
    }

    public boolean update(MemberDTO memberDTO)throws IOException {


        MultipartFile boardFile = memberDTO.getMemberProfile();
        String boardFileName = boardFile.getOriginalFilename();
        boardFileName = System.currentTimeMillis() + "-" + boardFileName;
        memberDTO.setMemberProfileName(boardFileName);
        String savePath = "C:\\Spring_img\\" + boardFileName;

        if (!boardFile.isEmpty()) {
            boardFile.transferTo(new File(savePath));
        }
        int result = memberPostRepository.update(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }


    }
}