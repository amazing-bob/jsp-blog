package com.example.jspblog.mapper;

import com.example.jspblog.dto.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<Post> selectAll();

    Post selectById(long id);

    void insert(Post post);

    void update(Post post);
}
