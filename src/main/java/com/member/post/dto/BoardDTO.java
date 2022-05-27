package com.member.post.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    Long memberId;
    Long b_id;
    String boardTitle;
    String boardWriter;
    String boardContents;
    int boardHits;
    Timestamp boardCreatedDate;
    MultipartFile boardProfile;
    String boardProfileName;

}
