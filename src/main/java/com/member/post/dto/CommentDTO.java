package com.member.post.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    Long boardId;
    Long id;
    String commentWriter;
    Timestamp commentCreatedDate;
    String commentContents;
}
