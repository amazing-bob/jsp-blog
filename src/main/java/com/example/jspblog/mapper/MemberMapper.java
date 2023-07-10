package com.example.jspblog.mapper;

import com.example.jspblog.dto.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    void insert(Member member);

    Member select(long id);

    void update(Member member);

    void delete(long id);

    Member authorizeMember(Member member);
}
