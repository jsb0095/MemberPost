package com.member.post.service;

import com.member.post.dto.CommentDTO;
import com.member.post.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired private CommentRepository commentRepository;
    public void save(CommentDTO commentDTO) {
        commentRepository.save(commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
        List<CommentDTO> commentDTOList=commentRepository.findAll(boardId);
        return commentDTOList;
    }
}
