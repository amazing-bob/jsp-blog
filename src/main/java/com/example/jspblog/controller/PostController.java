package com.example.jspblog.controller;

import com.example.jspblog.dto.Post;
import com.example.jspblog.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posts")
@RequiredArgsConstructor
@Slf4j
public class PostController {
    private final PostService postService;


    @GetMapping("")
    public String list(Model model) {
        log.info("== PageController.list() ");

        model.addAttribute("blogTitle", "Hello, World! BLOG");
        model.addAttribute("posts", postService.getPostList());

        return "post/list";
    }

    @GetMapping("/{id}")
    public String view(@PathVariable long id, Model model) {
        log.info("== PostController.view()  id : {}" + id);

        model.addAttribute("post", postService.getPost(id));

        return "post/view";
    }
}
