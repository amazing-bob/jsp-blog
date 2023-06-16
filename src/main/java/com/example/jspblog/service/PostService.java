package com.example.jspblog.service;

import com.example.jspblog.dto.Post;
import com.example.jspblog.mapper.CommentMapper;
import com.example.jspblog.mapper.PostMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PostService {

    private final CommentService commentService;
    private final PostMapper postMapper;
    private final CommentMapper commentMapper;

    public List<Post> getPostList() {

        return postMapper.selectAll();
    }

    public Post getPost(long id) {
        Post post = postMapper.selectById(id);
        if (post != null) {
            post.setComments(commentService.getComments(id));
        }

        return post;
    }

    /**
     * 포스팅하기
     * @param post
     * @return
     */
    public Post writePost(Post post) {
        postMapper.insert(post);
        return post;
    }

    /**
     * 게시글 수정
     * @param post
     * @return
     */
    public Post modifyPost(Post post) {
        postMapper.update(post);
        return post;
    }

    /**
     * 게시글 삭제
     * @param id
     */
    public boolean deletePost(long id) {
        commentMapper.deleteByPostId(id);
        postMapper.delete(id);
        return true;
    }
}
