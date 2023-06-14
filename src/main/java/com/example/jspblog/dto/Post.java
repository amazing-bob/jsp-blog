package com.example.jspblog.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.xml.stream.events.Comment;
import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Post {
    private long id;
    private long memberId;
    private Member writer;
    private String title;
    private String content;
    private int likeCount;
    private int commentCount;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
}
