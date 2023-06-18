package com.example.jspblog.controller;

import com.example.jspblog.dto.Member;
import com.example.jspblog.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/members")
@RequiredArgsConstructor
@Slf4j
public class MemberController {

    private final MemberService memberService;


    @GetMapping("/register")
    public String goRegisterView() {
        //TODO 로그인 체크
        return "member/register";
    }

    @PostMapping("")
    public ResponseEntity<Member> register(@RequestBody Member member) {
        log.info("=== MemberController : register() member: {}", member);

        Member savedMember = memberService.register(member);

        return ResponseEntity.ok().body(savedMember);
    }

    @GetMapping("/{id}")
    public String goMemberView(@PathVariable long id, Model model) {
        log.info("=== MemberController : goMemberView() id: {}", id);

        //TODO 로그인 세션에서 가져오기
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);

        return "member/view";
    }

    @GetMapping("/{id}/modify")
    public String goMemberModifyView(@PathVariable long id, Model model) {
        log.info("=== MemberController : goMemberModifyView() id: {}", id);

        Member member = memberService.getMember(id);
        model.addAttribute("member", member);

        return "member/modify";
    }

    @PutMapping("/{id}")
    @ResponseBody
    public ResponseEntity<Member> modify(@PathVariable long id, @RequestBody Member member) {
        log.info("=== MemberController : modify() id: {}, member: {}", id, member);

        //TODO 로그인 세션에서 가져와서 벨리데이션 체크
        long sessionMemberId = 5;
        if (false)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED) .build();

        Member modifiedMember = memberService.modify(id, member);

        return ResponseEntity.ok().body(modifiedMember);
    }


    @DeleteMapping("/{id}")
    @ResponseBody
    public ResponseEntity<Map> delete(@PathVariable long id) {
        log.info("=== MemberController : delete() id: {}", id);

        //TODO 로그인 세션에서 가져와서 벨리데이션 체크
        long sessionMemberId = 5;
        if (false)
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED) .build();

        memberService.delete(id);
        Map<String, String> result = new HashMap<>();
        result.put("result", "success");

        return ResponseEntity.ok().body(result);
    }


}
