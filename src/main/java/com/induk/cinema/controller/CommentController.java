package com.induk.cinema.controller;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.Review;
import com.induk.cinema.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/csmovie/comments")
public class CommentController {
    private final CommentService commentService;

    @PostMapping("/addAjax")
    @ResponseBody
    public Long addAjax(@RequestBody Comment comment){
        return commentService.saveComment(comment);
    }

    @PostMapping("/listAjax")
    @ResponseBody
    public List<Comment> listAjax(@RequestBody Comment params) throws ParseException {
        List<Comment> comments = commentService.findCommentByReviewIdPaging(params);

        if(comments.isEmpty())  //데이터가 없을 시 초기화
            comments = new ArrayList<>();

        Comment c = new Comment();
        c.setReviewId(params.getReviewId());
        c.setCurrentPageNo(params.getCurrentPageNo());
        c.setPaginationInfo(params.getPaginationInfo());
        c.setCountByReviewId(commentService.getCommentCountByReviewId(c));
        comments.add(0, c);

        return comments;
    }
    @PostMapping("/delAjax")
    @ResponseBody
    public Integer delAjax(@RequestBody Comment comment){
        return commentService.deleteComment(comment.getId());
    }

    @PostMapping("/editAjax")
    @ResponseBody
    public Integer updateForm(@RequestBody Comment comment){
        return commentService.updateComment(comment);
    }
}
