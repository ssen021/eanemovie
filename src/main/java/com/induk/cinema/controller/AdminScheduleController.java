package com.induk.cinema.controller;

import com.induk.cinema.domain.City;
import com.induk.cinema.domain.Schedule;
import com.induk.cinema.service.GenreService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.service.ScheduleService;
import com.induk.cinema.service.TheaterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/csmovie/admin/schedules")
@RequiredArgsConstructor
public class AdminScheduleController {

    private final ScheduleService scheduleService;
    private final MovieService movieService;
    private final TheaterService theaterService;
    private final GenreService genreService;

    @GetMapping
    public String schedules(Model model) {
        model.addAttribute("schedules", scheduleService.scheduleList());
        return "admin/schedule/listForm";
    }

    @GetMapping("/add")
    public String addForm(Model model) {
        //비어있는 객체를 넘겨야 오류가 발생하지 않음
        model.addAttribute("schedule", new Schedule());
        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("theaters", theaterService.theaterList());
        return "admin/schedule/addForm";
    }

    @PostMapping("/add")
    public String addCity(@Valid Schedule schedule,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("movies", movieService.movieList());
            model.addAttribute("theaters", theaterService.theaterList());
            return "admin/schedule/addForm";
        }

        Long id = scheduleService.saveSchedule(schedule);

        redirectAttributes.addAttribute("id", id);
        return "redirect:/csmovie/admin/schedules/{id}";
    }

    @GetMapping("/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {
        model.addAttribute("schedule", scheduleService.findSchedule(id));
        return "admin/schedule/detailForm";
    }

    @DeleteMapping("/del/{id}")
    public String deleteSchedule(@PathVariable Long id) {
        scheduleService.deleteschedule(id);
        return "redirect:/csmovie/admin/schedules";
    }

    @GetMapping("/update/{id}")
    public String updateForm(@PathVariable Long id, Model model) {
        model.addAttribute("movies", movieService.movieList());
        model.addAttribute("theaters", theaterService.theaterList());
        model.addAttribute("schedule", scheduleService.findSchedule(id));
        return "admin/schedule/updateForm";
    }

    @PostMapping("/update/{id}")
    public String updateCity(@Valid Schedule schedule,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             @PathVariable("id") Long id,
                             Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("movies", movieService.movieList());
            model.addAttribute("theaters", theaterService.theaterList());
            return "admin/schedule/updateForm";
        }

        scheduleService.updateSchedule(schedule);

        model.addAttribute("schedule", scheduleService.findSchedule(id));
        return "admin/schedule/detailForm";
    }
}
