package com.example.jspblog.controller;

import com.example.jspblog.dto.Comment;
import com.example.jspblog.service.CommentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;


@RestController
@RequestMapping("/posts/{postId}/comments")
@RequiredArgsConstructor
@Slf4j
public class CommentController {

    private final CommentService commentService;

    @PostMapping("")
    public ResponseEntity<Comment> writeComment(
            @PathVariable long postId,
            @RequestBody Comment comment) {
        log.info("=== CommentController : writeComment() postId: {}, comment: {}", postId, comment);

        Comment writedComment = commentService.writeComment(comment);

        return ResponseEntity.ok().body(writedComment);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity deleteComment(@PathVariable long id,
                                                @PathVariable long postId,
                                                @RequestBody Comment comment) {
        log.info("=== CommentController : deleteComment() id: {}, postId: {}, comment: {}", id, postId, comment);

        comment.setId(id);
        commentService.deleteComment(comment);

        Map<String, String> result = new HashMap<>();
        result.put("result", "success");

        return ResponseEntity.ok().body(result);
    }
}
