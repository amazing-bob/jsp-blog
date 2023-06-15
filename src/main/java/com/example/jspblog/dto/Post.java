package com.example.jspblog.dto;

import jdk.nashorn.internal.runtime.Debug;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Post {
    private long id;
    private long memberId;
    private Member writer;
    private String title;
    private String content;
    private int likeCount;
    private int commentCount;
    private List<Comment> comments;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;

}
