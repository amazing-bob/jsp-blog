package com.example.jspblog.service;

import com.example.jspblog.dto.Comment;
import com.example.jspblog.mapper.CommentMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;

@WebMvcTest(CommentService.class)
class CommentServiceTest {

    @Autowired
    private CommentService commentService;

    @MockBean
    private CommentMapper commentMapper;

    @Test
    void getComments() throws CloneNotSupportedException {
        long postId = 1;

        List<Comment> mockComments = new ArrayList<>();
        for (int i = 1; i <= 10; i++) {
            mockComments.add(Comment.builder()
                    .id(i)
                    .parentId(i)
                    .postId(1)
                    .memberId(i % 4 + 1)
                    .content("댓글" + i)
                    .created(LocalDateTime.now())
                    .build());
        }
        mockComments.add(Comment.builder().id(11).parentId(1).postId(2).memberId(2).content("댓글1-2").created(LocalDateTime.now()).build());
        mockComments.add(Comment.builder().id(13).parentId(1).postId(1).memberId(2).content("댓글1-2").created(LocalDateTime.now()).build());
        mockComments.add(Comment.builder().id(14).parentId(1).postId(1).memberId(2).content("댓글1-2").created(LocalDateTime.now()).build());
        mockComments.add(Comment.builder().id(15).parentId(3).postId(2).memberId(2).content("댓글1-2").created(LocalDateTime.now()).build());
        mockComments.add(Comment.builder().id(16).parentId(3).postId(1).memberId(2).content("댓글1-2").created(LocalDateTime.now()).build());

        given(commentMapper.selectListByePostId(postId)).willReturn(mockComments);

        mockComments.forEach(System.out::println);
        System.out.println("----------------");
        List<Comment> comments = commentService.getComments(postId);
//        comments.forEach(System.out::println);

        assertEquals(comments.size(), mockComments.size());


        List<Comment> copyComments = new ArrayList<>(comments);
        int originSize = comments.size();

        assertEquals(comments.get(0), copyComments.get(0));
        System.out.println(comments.get(0) == copyComments.get(0));

        for(Comment comment : copyComments ) {
            if ( isReplyComment(comment) ) {
                // 대댓글을 부모댓글에 List만들어 추가하고 원래 List에서 삭제
                rearrangeReplyToParent(comments, comment);
            }
        }
        

        comments.forEach(System.out::println);

    }


    @Test
    void deleteComment() {
    }


    /**
     * 대댓글을 부모댓글에 List만들어 추가하고 원래 List에서 삭제
     * @param comments
     * @param replyComment
     */
    private static void rearrangeReplyToParent(List<Comment> comments, Comment replyComment) {
        Comment parentComment = comments.stream()
                .filter(targetComment -> targetComment.getId() == replyComment.getParentId())
                .findFirst()
                .get();

        parentComment.setReplyComments(makeReplyComments(parentComment, replyComment));
        comments.remove(replyComment);
    }

    /**
     * 대댓글을 부모댓글에 List만들어 추가
     * @param parentComment
     * @param replyComment
     * @return
     */
    private static List<Comment> makeReplyComments(Comment parentComment, Comment replyComment) {
        List<Comment> replyComments = parentComment.getReplyComments();
        if (replyComments == null)
            replyComments = new ArrayList<>();

        replyComments.add(replyComment);

        return replyComments;
    }


    private static boolean isReplyComment(Comment cloneComment) {
        return cloneComment.getId() != cloneComment.getParentId();
    }
}