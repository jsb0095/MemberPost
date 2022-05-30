package com.member.post.repository;

import com.member.post.dto.BoardDTO;
import com.member.post.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;



    public void save(BoardDTO boardDTO) {
        System.out.println("boardDTO = " + boardDTO);
        sql.insert("board.save",boardDTO);
    }

    public List<BoardDTO> findAll() {
     List<BoardDTO> boardDTOList=   sql.selectList("board.findAll");
     return boardDTOList;
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("board.pagingList",pagingParam);
    }

    public int boardCount() {return sql.selectOne("board.count");

    }

    public BoardDTO detail(Long id) {
     sql.update("board.hitsAdd",id);
     BoardDTO boardDTO =sql.selectOne("board.detail",id);
     return boardDTO;
    }

    public BoardDTO updateForm(Long id) {
      BoardDTO boardDTO = sql.selectOne("board.findById",id);
      return boardDTO;

    }

    public void update(BoardDTO boardDTO) {
        sql.update("board.update",boardDTO);
    }

    public void delete(Long id) {
        sql.delete("board.delete",id);
    }


    public List<BoardDTO> search(Map<String, String> searchParam) {
       return sql.selectList("board.search",searchParam);

    }
}
