package com.example.jspblog.mapper;

import com.example.jspblog.dto.Comment;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@MybatisTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class CommentMapperTest {

    @Autowired
    private CommentMapper commentMapper;

    @Test
    void selectListByePostId() {
        List<Comment> comments = commentMapper.selectListByePostId(74);
        comments.forEach(System.out::println);
    }


    @Test
    void insert() {
        Comment comment = Comment.builder()
                .postId(74)
                .memberId(1)
                .content("댓글입니다.")
                .build();
        commentMapper.insert(comment);
        if (comment.getParentId() == 0) {
            comment.setParentId(comment.getId());
            commentMapper.updateParentIdById(comment);
        }
        System.out.println("writedComment = " + comment);
    }
}