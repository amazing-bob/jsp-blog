package com.example.jspblog.jsptag;

import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public final class Dates {

    public static String formatLocalDateTime(LocalDateTime localDateTime, String pattern) {
        if (localDateTime == null) {
            return "";
        }
        if (pattern == null) {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }
        return localDateTime.format(DateTimeFormatter.ofPattern(pattern));
    }
}
