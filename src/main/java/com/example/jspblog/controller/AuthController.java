package com.example.jspblog.controller;

import com.example.jspblog.dto.Member;
import com.example.jspblog.service.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
@Slf4j
public class AuthController {

    private final AuthService authService;


    @GetMapping("/loginForm")
    public String loginForm() {
        log.info("=== AuthController: loginForm() ===");

        return "auth/login";
    }


    @PostMapping(value="/login", produces = "application/json; charset=utf-8")
    public ResponseEntity<Member> login(@RequestBody Member member) {
        log.info("=== AuthController: login() ===");

        Member authedMember = authService.login(member);

        return ResponseEntity.ok().body(authedMember);
    }


}
