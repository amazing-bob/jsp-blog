package com.example.jspblog.mapper;

import com.example.jspblog.dto.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment> selectListByePostId(long postId);
}
