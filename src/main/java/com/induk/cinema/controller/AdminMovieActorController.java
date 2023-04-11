package com.induk.cinema.controller;

import com.induk.cinema.domain.MovieActor;
import com.induk.cinema.dto.MovieActorForm;
import com.induk.cinema.service.ActorService;
import com.induk.cinema.service.MovieActorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/movie_actors")
@RequiredArgsConstructor
public class AdminMovieActorController {

    private final MovieActorService movieActorService;
    private final ActorService actorService;

    @GetMapping
    public String movieActorList(@RequestParam Long movieId, Model model) {
        model.addAttribute("movieActors", movieActorService.movieActorList(movieId));
        return "admin/movie_actor/listForm";
    }

    @GetMapping("/{id}")
    public String movieActor(@PathVariable Long id, Model model) {
        model.addAttribute("movieActor", movieActorService.findMovieActor(id));
        return "admin/movie_actor/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("movieActorForm", new MovieActorForm());
        model.addAttribute("actors", actorService.actorList());
        return "admin/movie_actor/addForm";
    }

    @PostMapping("/add")
    public String addMovieActor(@RequestParam Long movieId,
                                @Valid MovieActorForm movieActorForm,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("actors", actorService.actorList());
            return "admin/movie_actor/addForm";
        }

        movieActorForm.setMovieId(movieId);
        Long id = movieActorService.saveMovieActor(movieActorForm);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/movie_actors/{id}";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id,
                             @RequestParam Long movieId,
                             @RequestParam String title,
                             Model model) {
        MovieActorForm movieActorForm = new MovieActorForm(movieActorService.findMovieActor(id));
        model.addAttribute("movieId", movieId);
        model.addAttribute("title", title);
        model.addAttribute("movieActorForm", movieActorForm);
        model.addAttribute("actors", actorService.actorList());

        return "admin/movie_actor/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateMovieActor(@PathVariable Long id,
                                   @RequestParam String title,
                                   @Valid MovieActorForm movieActorForm,
                                   BindingResult bindingResult,
                                   Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("title", title);
            model.addAttribute("actors", actorService.actorList());
            return "admin/movie_actor/updateForm";
        }

        movieActorService.updateMovieActor(movieActorForm);

        return "redirect:/csmovie/admin/movie_actors/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteMovieActor(@PathVariable Long id,
                                   @RequestParam Long movieId,
                                   @RequestParam String title,
                                   RedirectAttributes redirectAttributes) {
        movieActorService.deleteMovieActor(id);

        redirectAttributes.addAttribute("movieId", movieId);
        redirectAttributes.addAttribute("title", title);
        return "redirect:/csmovie/admin/movie_actors";
    }
}
