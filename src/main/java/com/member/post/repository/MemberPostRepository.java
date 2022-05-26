package com.member.post.repository;

import com.member.post.dto.MemberPostDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberPostRepository {
    @Autowired private SqlSessionTemplate sql;

    public void save(MemberPostDTO memberPostDTO) {
        sql.insert("member.save",memberPostDTO);

    }

    public MemberPostDTO duplicateCheck(String memberId) {
       return sql.selectOne("member.duplicateCheck",memberId);
    }

    public List<MemberPostDTO> loginForm(MemberPostDTO memberPostDTO) {


      return sql.selectList("member.loginForm",memberPostDTO);
    }
}
