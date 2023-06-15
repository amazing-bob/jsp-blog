package com.example.jspblog.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class ViewController {

    @GetMapping("/")
    public String home() {
        log.info("== PageController.home() ");

        return "redirect:/posts";
    }
}
