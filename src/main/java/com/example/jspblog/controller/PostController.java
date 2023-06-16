package com.example.jspblog.controller;

import com.example.jspblog.dto.Post;
import com.example.jspblog.service.PostService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/write")
    public String goWriting() {
        log.info("== PostController.write() ");

        //TODO: 로그인 체크
        boolean isValid = true;
        if (!isValid)
            return "redirect:/login";

        return "post/writing";
    }


    @PostMapping(value = "", produces = "application/json")
    @ResponseBody
    public ResponseEntity<Post> writePost(@RequestBody Post post) {
        log.info("== PostController.writePost()  post : {}" + post);
        Post writedPost = postService.writePost(post);

        return ResponseEntity.ok().body(writedPost);
    }

    @PutMapping(value = "", produces = "application/json")
    @ResponseBody
    public ResponseEntity<Post> modifyPost(@RequestBody Post post) {
        log.info("== PostController.modifyPost()  post : {}" + post);
        Post writedPost = postService.modifyPost(post);

        return ResponseEntity.ok().body(writedPost);
    }

    @GetMapping("/{id}")
    public String view(@PathVariable long id, Model model) {
        log.info("== PostController.view()  id : {}" + id);

        model.addAttribute("post", postService.getPost(id));

        return "post/view";
    }


    @GetMapping("/{postId}/modify")
    public String modify(@PathVariable long postId, Model model) {
        log.info("== PostController.modify()  postId : {}" + postId);

        model.addAttribute("post", postService.getPost(postId));

        return "post/writing";
    }
}
