package com.induk.cinema.controller;

import com.induk.cinema.domain.Review;
import com.induk.cinema.service.CommentService;
import com.induk.cinema.service.MemberService;
import com.induk.cinema.service.MovieService;
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

@Controller
@RequiredArgsConstructor
@RequestMapping("/csmovie/admin/reviews")
public class AdminReviewController {

    private final ReviewService reviewService;
    private final MovieService movieService;
    private final MemberService memberService;
    private final CommentService commentService;
    private final FileStore fileStore;

    @GetMapping
    public String reviews(Model model) {
        model.addAttribute("reviews", reviewService.reviewList());
        return "admin/review/listForm";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("comments", commentService.findCommentByReviewId(id));
        model.addAttribute("review", reviewService.findReview(id));
        return "admin/review/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("members", memberService.memberList());
        model.addAttribute("review", new Review());
        return "admin/review/addForm";
    }

    @PostMapping("/add")
    public String addReview(@Valid Review review,
                           BindingResult bindingResult,
                            Model model) throws IOException {

        if(review.getImageForm().isEmpty() || bindingResult.hasErrors()) {
            if(review.getImageForm().isEmpty())
                bindingResult.addError(new FieldError("reviewForm", "imageForm", "이미지는 필수 등록입니다."));
            model.addAttribute("movies", movieService.movieList());
            model.addAttribute("members", memberService.memberList());
            return "admin/review/addForm";
        }

        reviewService.saveReview(review);

        return "redirect:/csmovie/admin/reviews/";
    }
    @DeleteMapping("/{id}/del")
    public String delReview(@PathVariable Long id){
        reviewService.deleteReview(id);
        return "redirect:/csmovie/admin/reviews/";
    }
    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model){
        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("review", reviewService.findReview(id));
        model.addAttribute("members", memberService.memberList());
        return "/admin/review/updateForm";
    }
    @PostMapping("/{id}/edit")
    public String updateForm(@Valid Review review,  BindingResult bindingResult,
                             @PathVariable Long id,
                             Model model) throws IOException {
        Review beforReview = reviewService.findReview(id);
        review.setImage(beforReview.getImage());
        //형식 검사
        if(bindingResult.hasErrors()) {
            model.addAttribute("movies", movieService.movieList());
            model.addAttribute("review", review);
            model.addAttribute("members", memberService.memberList());
            return "admin/review/updateForm";
        }

        reviewService.updateReview(review);
        return "redirect:/csmovie/admin/reviews/" + id;
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("review", filename));
    }
}