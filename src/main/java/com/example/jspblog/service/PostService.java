package com.example.jspblog.service;

import com.example.jspblog.dto.Post;
import com.example.jspblog.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService {

    private final CommentService commentService;
    private final PostMapper postMapper;

    public List<Post> getPostList() {

        return postMapper.selectAll();
    }

    public Post getPost(long id) {
        Post post = postMapper.selectById(id);
        post.setComments(commentService.getComments(id));
        return post;
    }
}
