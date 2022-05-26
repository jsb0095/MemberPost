package com.member.post.dto;

import lombok.Data;

@Data
public class ReviewDTO {
    Long id;
    int boardId;
    String commentWriter;
    String commentCratedDate;
    String commentContents;
}
