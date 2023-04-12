package com.induk.cinema.controller;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.Review;
import com.induk.cinema.service.CommentService;
import com.induk.cinema.service.MemberService;
import com.induk.cinema.service.ReviewService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/csmovie/admin/comments")
public class AdminCommentController {

    private final CommentService commentService;
    private final ReviewService reviewService;
    private final MemberService memberService;

    @GetMapping
    public String comments(Model model) {
        model.addAttribute("comments", commentService.commentList());
        return "admin/comment/listForm";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("comment", commentService.findComment(id));
        return "admin/comment/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("reviews", reviewService.reviewList());
        model.addAttribute("members", memberService.memberList());
        model.addAttribute("comment", new Comment());
        return "admin/comment/addForm";
    }

    @PostMapping("/add")
    public String addComment(@Valid Comment comment,
                           BindingResult bindingResult,
                            Model model) throws IOException {

        //형식 검사
        if(bindingResult.hasErrors()) {
            model.addAttribute("members", memberService.memberList());
            model.addAttribute("reviews", reviewService.reviewList());
            return "admin/comment/addForm";
        }

        Long id = commentService.saveComment(comment);


        return "redirect:/csmovie/admin/comments/";
    }
    @DeleteMapping("/{id}/del")
    public String delComment(@PathVariable Long id){
        commentService.deleteComment(id);
        return "redirect:/csmovie/admin/comments/";
    }
    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model){
        model.addAttribute("comment", commentService.findComment(id));
        model.addAttribute("reviews", reviewService.reviewList());
        model.addAttribute("members", memberService.memberList());
        return "/admin/comment/updateForm";
    }
    @PostMapping("/{id}/edit")
    public String updateForm(@Valid Comment comment,  BindingResult bindingResult,
                             @PathVariable Long id,
                             Model model) throws IOException {
        Comment beforComment = commentService.findComment(id);

        //형식 검사
        if(bindingResult.hasErrors()) {
            model.addAttribute("reviews", reviewService.reviewList());
            model.addAttribute("members", memberService.memberList());
            return "admin/comment/updateForm";
        }

        commentService.updateComment(comment);
        return "redirect:/csmovie/admin/comments/" + id;
    }
}