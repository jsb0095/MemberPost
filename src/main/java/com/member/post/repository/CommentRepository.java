package com.member.post.repository;

import com.member.post.dto.CommentDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(CommentDTO commentDTO) {
        sql.insert("comment.save",commentDTO);
    }

    public List<CommentDTO> findAll(Long boardId) {
      List<CommentDTO> commentDTOList=  sql.selectList("comment.findAll",boardId);
      return commentDTOList;

    }
}
