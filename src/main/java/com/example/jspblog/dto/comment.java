package com.example.jspblog.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class comment {
    private long id;
    private long parentId;
    private long postId;
    private long memberId;
    private String content;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
}
