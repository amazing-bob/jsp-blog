package com.example.jspblog.service;

import com.example.jspblog.dto.Post;
import com.example.jspblog.mapper.PostMapper;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.annotation.Import;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@WebMvcTest
@Import(PostService.class)
class PostServiceTest {

    @Autowired
    private PostService postService;


    @MockBean
    private PostMapper postMapper;

    @BeforeEach
    void setUp() {
        //FIXME: @MockBean postMapper mock 바인딩하는 부분 수정 필요
        postMapper = new PostMapper() {
            @Override
            public List<Post> selectAll() {
                List<Post> list = new ArrayList<>();
                list.add(new Post(1, 1, "title1", "content1", 2, LocalDateTime.now(), null, null));
                list.add(new Post(2, 1, "title2", "content2", 0, LocalDateTime.now(), null, null));
                list.add(new Post(3, 2, "title3", "content3", 0, LocalDateTime.now(), null, null));

                return list;
            }
        };
    }

    @Test
    void getPostList() {
        List<Post> postList = postService.getPostList();
        System.out.println("postList = " + postList);
        assertEquals(3, postList.size());
    }
}