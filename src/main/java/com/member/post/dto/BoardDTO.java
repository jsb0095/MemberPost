package com.member.post.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BoardDTO {
    Long memberId;
    Long b_id;
    String boardTitle;
    String boardWriter;
    String boardContents;
    int boardHits;
    String boardCreateDate;
    MultipartFile boardProfile;
    String boardProfileName;

}
