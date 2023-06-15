package com.example.jspblog.mapper;

import com.example.jspblog.dto.Post;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import java.util.List;

@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class PostMapperTest {

    @Autowired
    private PostMapper postMapper;


    @Test
    void selectAll() {
        List<Post> postList = postMapper.selectAll();
        System.out.println("postList = " + postList);
    }

    @Test
    void selectById() {
        long id = 1;
        Post post = postMapper.selectById(id);
        System.out.println("post = " + post);
    }

    @Test
    void isnert() {

        Post post = postMapper.selectById(1);
        post.setId(0);

        postMapper.insert(post);
        System.out.println("post = " + post);
    }

}