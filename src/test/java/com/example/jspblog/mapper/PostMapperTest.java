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
}