package com.example.jspblog.service;

import com.example.jspblog.dto.Member;
import com.example.jspblog.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthService {
    private HttpSession session;

    private final MemberMapper memberMapper;

    public Member login(Member member) {
        Member authedMember = memberMapper.authorizeMember(member);
        if (authedMember != null && authedMember.getId() > 0) {
            session.setAttribute("authMember", authedMember);
            return authedMember;
        }
        return authedMember;
    }
}
