package com.member.post.dto;

import lombok.Data;

@Data
public class BoardDTO {
    Long id;
    String boardTitle;
    String boardWriter;
    String boardContents;
    int boardHits;
    String boardCreateDate;
    String memberProfileName;
}
