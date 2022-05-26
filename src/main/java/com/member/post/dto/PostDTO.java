package com.member.post.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class PostDTO {
    Long id;
    String boardTitle;
    String boardWriter;
    String boardContents;
    int boardHits;
    String boardCreateDate;
    String memberProfileName;
}
