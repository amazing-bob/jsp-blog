package com.example.jspblog.service;

import com.example.jspblog.dto.Post;
import com.example.jspblog.mapper.PostMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

@WebMvcTest
@Import(PostService.class)
class PostServiceTest {

    @Autowired
    private PostService postService;


    @MockBean
    private PostMapper postMapper;

    @Test
    void getPostList() {
        //FIXME: @MockBean postMapper mock 바인딩하는 부분 수정 필요
        List<Post> postList = postService.getPostList();
        System.out.println("postList = " + postList);
        assertEquals(3, postList.size());
    }
}