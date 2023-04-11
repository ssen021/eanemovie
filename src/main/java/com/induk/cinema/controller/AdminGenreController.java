package com.induk.cinema.controller;

import com.induk.cinema.domain.Genre;
import com.induk.cinema.service.GenreService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/genres")
@RequiredArgsConstructor
public class AdminGenreController {

    private final GenreService genreService;

    @GetMapping
    public String genres(Model model) {
        model.addAttribute("genres", genreService.genreList());
        return "admin/genre/listForm";
    }

    @GetMapping("/{id}")
    public String detailForm(@PathVariable Long id, Model model) {
        model.addAttribute("genre", genreService.findGenre(id));
        return "admin/genre/detailForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        model.addAttribute("genre", new Genre());
        return "admin/genre/addForm";
    }

    @PostMapping("/add")
    public String addGenre(@Valid Genre genre,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes) {
        if(bindingResult.hasErrors()) {
            return "admin/genre/addForm";
        }

        Long id = genreService.saveGenre(genre);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/genres/{id}";
    }

    @GetMapping("/{id}/edit")
    public String updateForm(@PathVariable Long id, Model model) {
        Genre genre = genreService.findGenre(id);
        model.addAttribute("genre", genre);

        return "admin/genre/updateForm";
    }

    @PostMapping("/{id}/edit")
    public String updateGenre(@PathVariable Long id,
                              @Valid Genre genre,
                              BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "admin/genre/updateForm";
        }

        genreService.updateGenre(genre);

        return "redirect:/csmovie/admin/genres/{id}";
    }

    @GetMapping("/{id}/delete")
    public String deleteGenre(@PathVariable Long id) {
        genreService.deleteGenre(id);

        return "redirect:/csmovie/admin/genres";
    }
}
