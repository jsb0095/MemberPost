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
}
