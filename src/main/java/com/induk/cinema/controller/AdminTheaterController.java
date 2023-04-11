package com.induk.cinema.controller;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.domain.Theater;
import com.induk.cinema.service.TheaterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/csmovie/admin/theaters")
@RequiredArgsConstructor
public class AdminTheaterController {

    private final TheaterService theaterService;

    @GetMapping
    public String theaters(Model model) {
        model.addAttribute("theaters", theaterService.theaterList());
        return "admin/theater/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        //비어있는 객체를 넘겨야 오류가 발생하지 않음
        model.addAttribute("cinemas", theaterService.findCinema());
        model.addAttribute("theater", new Theater());
        return "admin/theater/addForm";
    }

    @PostMapping("/add")
    public String addTheater(@Valid Theater theater,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("cinemas", theaterService.findCinema());
            return "admin/theater/addForm";
        }

        Long id = theaterService.saveTheater(theater);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/theaters/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("theater", theaterService.findTheater(id));
        return "admin/theater/detailForm";
    }

    @DeleteMapping("/del/{id}")
    public String deleteTheater(@PathVariable Long id) {
        theaterService.deleteTheater(id);
        return "redirect:/csmovie/admin/theaters";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("cinemas", theaterService.findCinema());
        model.addAttribute("theater", theaterService.findTheater(id));
        return "admin/theater/updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateTheater(@Valid Theater theater,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model,
                               @PathVariable("id") Long id) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("cinemas", theaterService.findCinema());
            return "admin/theater/updateForm";
        }

        theaterService.updateTheater(theater);

        return "redirect:/csmovie/admin/theaters/{id}";
    }
}
