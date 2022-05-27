package com.member.post.repository;

import com.member.post.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberPostRepository {
    @Autowired private SqlSessionTemplate sql;

    public void save(MemberDTO memberDTO) {
        sql.insert("member.save", memberDTO);

    }

    public MemberDTO duplicateCheck(String memberId) {
       return sql.selectOne("member.duplicateCheck",memberId);
    }

    public MemberDTO loginForm(MemberDTO memberDTO) {


      return sql.selectOne("member.loginForm", memberDTO);
    }

    public List<MemberDTO> findALl() {
       return sql.selectList("member.findAll");
    }

    public int delete(Long id) {
      return   sql.delete("member.delete",id);
    }

    public MemberDTO findById(Long id) {
      MemberDTO memberDTO=  sql.selectOne("member.findById",id);
        System.out.println(memberDTO);
      return  memberDTO;
    }

    public int update(MemberDTO memberDTO) {
       int result = sql.update("member.update",memberDTO);
        System.out.println(memberDTO);
       return result;
    }
}
