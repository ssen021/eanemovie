package com.induk.cinema.controller;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.service.CinemaService;
import com.induk.cinema.service.CityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/csmovie/admin/cinemas")
@RequiredArgsConstructor
public class AdminCinemaController {

    private final CinemaService cinemaService;
    private final CityService cityService;

    @GetMapping
    public String cinemas(Model model) {
        model.addAttribute("cinemas", cinemaService.cinemaList());
        return "admin/cinema/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        //비어있는 객체를 넘겨야 오류가 발생하지 않음
        model.addAttribute("citys", cityService.cityList());
        model.addAttribute("cinema", new Cinema());
        return "admin/cinema/addForm";
    }

    @PostMapping("/add")
    public String addCinema(@Valid Cinema cinema,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("citys", cityService.cityList());
            return "admin/cinema/addForm";
        }

        Long id = cinemaService.saveCinema(cinema);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/cinemas/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("cinema", cinemaService.findCinema(id));
        return "admin/cinema/detailForm";
    }

    @DeleteMapping("/del/{id}")
    public String deleteCinema(@PathVariable Long id) {
        cinemaService.deleteCinema(id);
        return "redirect:/csmovie/admin/cinemas";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("citys", cityService.cityList());
        model.addAttribute("cinema", cinemaService.findCinema(id));
        return "admin/cinema/updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateCinema(@Valid Cinema cinema,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model,
                               @PathVariable("id") Long id) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("citys", cityService.cityList());
            return "admin/cinema/updateForm";
        }

        cinemaService.updateCinema(cinema);

        return "redirect:/csmovie/admin/cinemas/{id}";
    }

}
