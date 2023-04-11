package com.induk.cinema.controller;

import com.induk.cinema.domain.MovieAd;
import com.induk.cinema.dto.MovieAdForm;
import com.induk.cinema.service.MovieAdService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.util.FileStore;
import com.sun.org.apache.xpath.internal.operations.Mult;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.net.MalformedURLException;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/movie_ad")
@RequiredArgsConstructor
public class AdminMovieAdController {

    private final MovieAdService movieAdService;
    private final MovieService movieService;
    private final FileStore fileStore;

    @GetMapping
    public String movieAdList(@RequestParam Long movieId, Model model) {
        model.addAttribute("movieAds", movieAdService.movieAdList(movieId));
        return "admin/movie_ad/listForm";
    }

    @GetMapping("/{id}")
    public String movieAd(@PathVariable Long id, Model model) {
        model.addAttribute("movieAd", movieAdService.findMovieAd(id));
        return "admin/movie_ad/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model, @RequestParam Long movieId) {
        model.addAttribute("movie", movieService.findMovie(movieId));
        model.addAttribute("movieAdForm", new MovieAdForm());
        return "admin/movie_ad/addForm";
    }

    @PostMapping("/add")
    public String addMovieAd(MovieAdForm movieAdForm,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             Model model) throws IOException {
        switch (movieAdForm.getKind()) {
            case "image":
                if(movieAdForm.getImageFiles().get(0).isEmpty()) {
                    model.addAttribute("movie", movieService.findMovie(movieAdForm.getMovieId()));
                    bindingResult.addError(new FieldError("movieAdForm", "imageFiles", "사진을 등록해 주세요"));
                    return "admin/movie_ad/addForm";
                }
                break;
            case "video":
                if(movieAdForm.getVideo().isEmpty()) {
                    model.addAttribute("movie", movieService.findMovie(movieAdForm.getMovieId()));
                    bindingResult.addError(new FieldError("movieAdForm", "video", "동영상 주소를 입력해 주세요"));
                    return "admin/movie_ad/addForm";
                }
                break;
        }

        movieAdService.addMovieAd(movieAdForm);

        redirectAttributes.addAttribute("movieId", movieAdForm.getMovieId());
        return "redirect:/csmovie/admin/movie_ad";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id,
                             @RequestParam Long movieId,
                             Model model) {
        MovieAd movieAd = movieAdService.findMovieAd(id);
        MovieAdForm movieAdForm = new MovieAdForm();
        movieAdForm.setId(movieAd.getId());
        movieAdForm.setUploadFilename(movieAd.getUploadFilename());
        movieAdForm.setStoreFilename(movieAd.getStoreFilename());
        movieAdForm.setPath(movieAd.getPath());
        movieAdForm.setKind(movieAd.getKind());
        movieAdForm.setMovieId(movieAd.getMovie().getId());

        model.addAttribute("movie", movieService.findMovie(movieId));
        model.addAttribute("movieAdForm", movieAdForm);
        return "admin/movie_ad/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateMovieAd(@PathVariable Long id,
                                MovieAdForm movieAdForm) throws IOException {
        movieAdService.updateMovieAd(movieAdForm);

        return "redirect:/csmovie/admin/movie_ad/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteMovieAd(@PathVariable Long id,
                                @RequestParam Long movieId,
                                RedirectAttributes redirectAttributes) {
        movieAdService.deleteMovieAd(id);

        redirectAttributes.addAttribute("movieId", movieId);
        return "redirect:/csmovie/admin/movie_ad";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("movie_ad", filename));
    }
}
