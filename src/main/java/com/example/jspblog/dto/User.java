package com.example.jspblog.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class User {
    private long id;
    private String email;
    private String password;
    private String name;
    private LocalDateTime created;
    private LocalDateTime updated;
    private LocalDateTime deleted;
}
