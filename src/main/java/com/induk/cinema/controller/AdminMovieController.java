package com.induk.cinema.controller;

import com.induk.cinema.domain.Director;
import com.induk.cinema.domain.Movie;
import com.induk.cinema.dto.Format;
import com.induk.cinema.dto.MovieForm;
import com.induk.cinema.dto.Rating;
import com.induk.cinema.service.DirectorService;
import com.induk.cinema.service.GenreService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.IOException;
import java.net.MalformedURLException;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/movies")
@RequiredArgsConstructor
public class AdminMovieController {

    private final MovieService movieService;
    private final DirectorService directorService;
    private final GenreService genreService;
    private final FileStore fileStore;

    @ModelAttribute("ratings")
    public Rating[] ratings() { return Rating.values(); }

    @ModelAttribute("formats")
    public Format[] formats() { return Format.values(); }

    @GetMapping
    public String movieList(Model model) {
        model.addAttribute("movies", movieService.movieList());
        return "admin/movie/listForm";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        model.addAttribute("movie", movieService.findMovie(id));
        return "admin/movie/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("movieForm", new MovieForm());
        model.addAttribute("directors", directorService.directorList());
        model.addAttribute("genres", genreService.genreList());
        return "admin/movie/addForm";
    }

    @PostMapping("/add")
    public String addMovie(@Valid MovieForm movieForm,
                           BindingResult bindingResult,
                           @RequestParam MultipartFile imageFile,
                           RedirectAttributes redirectAttributes,
                           Model model) throws IOException {
        if(bindingResult.hasErrors()) {
            model.addAttribute("directors", directorService.directorList());
            model.addAttribute("genres", genreService.genreList());
            return "admin/movie/addForm";
        }

        Long id = movieService.saveMovie(movieForm, imageFile);
        redirectAttributes.addAttribute("id", id);

        return "redirect:/csmovie/admin/movies/{id}";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("directors", directorService.directorList());
        model.addAttribute("genres", genreService.genreList());

        MovieForm movieForm = new MovieForm(movieService.findMovie(id));

        model.addAttribute("movieForm", movieForm);
        return "admin/movie/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateMovie(@PathVariable Long id,
                              @Valid MovieForm movieForm,
                              BindingResult bindingResult,
                              @RequestParam MultipartFile imageFile,
                              Model model) throws IOException {
        if(bindingResult.hasErrors()) {
            model.addAttribute("directors", directorService.directorList());
            model.addAttribute("genres", genreService.genreList());
            return "admin/movie/updateForm";
        }

        movieService.updateMovie(movieForm, imageFile);

        return "redirect:/csmovie/admin/movies/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteMovie(@PathVariable Long id) {
        movieService.deleteMovie(id);
        return "redirect:/csmovie/admin/movies";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("movie", filename));
    }
}
