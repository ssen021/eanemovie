package com.induk.cinema.controller;

import com.induk.cinema.domain.Comment;
import com.induk.cinema.domain.Member;
import com.induk.cinema.domain.Review;
import com.induk.cinema.dto.SortType;
import com.induk.cinema.service.CommentService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.service.ReviewService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/csmovie/reviews")
public class ReviewController {
    private final ReviewService reviewService;
    private final MovieService movieService;
    private final CommentService commentService;
    private final FileStore fileStore;

    @GetMapping
    public String reviews(Model model, @ModelAttribute("params") Review params) {
        model.addAttribute("reviewCountsByMovie", reviewService.reviewCountByMovie());
        model.addAttribute("popularReviews", reviewService.reviewBySortType(SortType.Popularity));
        model.addAttribute("reviews", reviewService.reviewListByKeyword(params));
        return "/cinema/review/listForm";
    }
    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model,
                             @ModelAttribute("commentParams") Comment commentParams) throws ParseException {
        reviewService.viewCounting(id);
        commentParams.setReviewId(id);
        model.addAttribute("reviewCountsByMovie", reviewService.reviewCountByMovie());
        model.addAttribute("comments", commentService.findCommentByReviewIdPaging(commentParams));
        model.addAttribute("popularReviews", reviewService.reviewBySortType(SortType.Popularity));
        model.addAttribute("review", reviewService.findReview(id));
        return "/cinema/review/detailForm";
    }
    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("review", new Review());
        return "/cinema/review/addForm";
    }
    @PostMapping("/add")
    public String addForm(@Valid Review review,
                            BindingResult bindingResult,
                            HttpSession session,
                            Model model) throws IOException {

        if(bindingResult.hasFieldErrors("title") || bindingResult.hasFieldErrors("movie_id") ||
                bindingResult.hasFieldErrors("content") || review.getImageForm().isEmpty()) {
            model.addAttribute("movies", movieService.movieList());
            return "/cinema/review/addForm";
        }

        Member m = (Member)session.getAttribute("member");
        review.setMemberId(m.getId());
        reviewService.saveReview(review);

        return "redirect:/csmovie/reviews/";
    }
    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model){
        Review review = reviewService.findReview(id);

        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("review", reviewService.findReview(id));
        return "/cinema/review/updateForm";
    }
    @PostMapping("/{id}/edit")
    public String updateForm(@Valid Review review,  BindingResult bindingResult,
                             @PathVariable Long id,
                             Model model) throws IOException {

        Review beforReview = reviewService.findReview(id);
        review.setImage(beforReview.getImage());

        //형식 검사
        if(bindingResult.hasFieldErrors("title") || bindingResult.hasFieldErrors("movie_id") ||
                bindingResult.hasFieldErrors("content")) {
            model.addAttribute("movies", movieService.movieList());
            return "cinema/review/updateForm";
        }
        review.setMemberId(beforReview.getMemberId());

        reviewService.updateReview(review);
        return "redirect:/csmovie/reviews/" + id;
    }

    @DeleteMapping("/{id}/del")
    public String delReview(@PathVariable Long id){
        reviewService.deleteReview(id);
        return "redirect:/csmovie/reviews/";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("review", filename));
    }

    @PostMapping("/listAjax")
    @ResponseBody
    public List<Review> listFormAjax(@RequestBody Review params){
        List<Review> reviews =reviewService.reviewListByKeyword(params);
        if(reviews.isEmpty())  //데이터가 없을 시 초기화
            reviews = new ArrayList<>();

        //reviews[0]은 페이지내이션에 필요한 정보를 담음
        Review r = new Review();
        r.setSearchMovieId(params.getSearchMovieId());
        r.setSearchText(params.getSearchText());
        r.setSortType(params.getSortType());
        r.setCurrentPageNo(params.getCurrentPageNo());
        r.setPaginationInfo(params.getPaginationInfo());
        reviews.add(0, r);

        return reviews;
    }
}
