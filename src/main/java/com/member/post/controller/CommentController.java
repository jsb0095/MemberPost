package com.member.post.controller;

import com.member.post.dto.CommentDTO;
import com.member.post.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/comment")
@Controller
public class CommentController {
    @Autowired private CommentService commentService;

    @PostMapping("/save")
    public @ResponseBody List<CommentDTO> save(@ModelAttribute CommentDTO commentDTO){
        commentService.save(commentDTO);
        List<CommentDTO> returnResult =commentService.findAll(commentDTO.getBoardId());
        System.out.println("commentDTO = " + commentDTO);
        return returnResult;
    }
}
