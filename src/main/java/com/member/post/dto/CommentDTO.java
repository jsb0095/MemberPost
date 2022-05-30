package com.member.post.dto;

import lombok.Data;

@Data
public class CommentDTO {
    int boardId;
    Long id;
    String commentWriter;
    String commentCratedDate;
    String commentContents;
}
