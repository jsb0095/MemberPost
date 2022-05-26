package com.member.post.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberPostDTO {
   private Long id;
    private String memberId;
    String memberPassword;
    String memberName;
    String memberEmail;
    String memberMobile;
    MultipartFile  memberProfile;
    String memberProfileName;
}
