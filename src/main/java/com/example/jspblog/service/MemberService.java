package com.example.jspblog.service;

import com.example.jspblog.dto.Member;
import com.example.jspblog.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class MemberService {
    private final MemberMapper memberMapper;

    /**
     * 회원가입
     * @param member
     * @return
     */
    public Member register(Member member) {
        memberMapper.insert(member);
        //TODO 로그인 처리

        return member;
    }

    /**
     * 회원정보 조회
     * @param id
     * @return
     */
    public Member getMember(long id) {
        return memberMapper.select(id);
    }

    public Member modify(long id, Member member) {
        member.setId(id);
        memberMapper.update(member);
        return member;
    }

    /**
     * 회원탈퇴
     * @param id
     */
    public void delete(long id) {
        memberMapper.delete(id);
    }
}
