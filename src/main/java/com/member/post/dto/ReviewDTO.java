package com.member.post.dto;

import lombok.Data;

@Data
public class ReviewDTO {
    Long b_id;
    String memberId;
    Long c_id;
    int boardId;
    String commentWriter;
    String commentCratedDate;
    String commentContents;
}
