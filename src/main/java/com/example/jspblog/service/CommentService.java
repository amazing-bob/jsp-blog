package com.example.jspblog.service;

import com.example.jspblog.dto.Comment;
import com.example.jspblog.mapper.CommentMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService {

    private final CommentMapper commentMapper;

    /**
     * 댓글 DB에서 가지고와서 대댓글 부모댓글에 replyList로 담아서 return
     * @param postId
     * @return
     */
    public List<Comment> getComments(long postId) {
        return rearrangeCommnets(commentMapper.selectListByePostId(postId));
    }

    /**
     * 대댓글 부모댓글에 replyList로 담아서 return
     * @param comments
     * @return
     */
    private List<Comment> rearrangeCommnets(List<Comment> comments) {
        List<Comment> copyComments = new ArrayList<>(comments);
        for(Comment comment : copyComments ) {
            if ( isReplyComment(comment) ) {
                // 대댓글을 부모댓글에 List만들어 추가하고 원래 List에서 삭제
                rearrangeReplyToParent(comments, comment);
            }
        }
        return comments;
    }

    /**
     * 대댓글을 부모댓글에 List만들어 추가하고 원래 List에서 삭제
     * @param comments
     * @param replyComment
     */
    private void rearrangeReplyToParent(List<Comment> comments, Comment replyComment) {
        // 부모댓글 찾기
        Comment parentComment = comments.stream()
                .filter(targetComment -> targetComment.getId() == replyComment.getParentId())
                .findAny()
                .get();

        // 대댓글을 부모댓글에 List만들어 추가
        parentComment.setReplyComments(makeReplyComments(parentComment, replyComment));
        comments.remove(replyComment);
    }

    /**
     * 대댓글을 부모댓글에 List만들어 추가
     * @param parentComment
     * @param replyComment
     * @return
     */
    private List<Comment> makeReplyComments(Comment parentComment, Comment replyComment) {
        List<Comment> replyComments = parentComment.getReplyComments();
        if (replyComments == null)
            replyComments = new ArrayList<>();

        replyComments.add(replyComment);

        return replyComments;
    }


    private boolean isReplyComment(Comment cloneComment) {
        return cloneComment.getId() != cloneComment.getParentId();
    }
}
