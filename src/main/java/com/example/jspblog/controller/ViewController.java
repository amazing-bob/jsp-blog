package com.example.jspblog.controller;

import com.example.jspblog.dto.Post;
import com.example.jspblog.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ViewController {

    private final PostService postService;

    @GetMapping("/")
    public String home(Model model) {
        log.info("== PageController.home() ");

        model.addAttribute("blogTitle", "Hello, World! BLOG");
        model.addAttribute("posts", postService.getPostList());

        return "index";
    }
}
