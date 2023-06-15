package com.example.jspblog.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Comment implements Cloneable{
    private long id;
    private long parentId;
    private long postId;
    private long memberId;
    private Member writer;
    private String content;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
    private List<Comment> replyComments;

    public Comment clone() throws CloneNotSupportedException {
        return (Comment) super.clone();
    }
}
