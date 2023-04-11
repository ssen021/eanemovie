package com.induk.cinema.controller;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.domain.City;
import com.induk.cinema.domain.Schedule;
import com.induk.cinema.service.CinemaService;
import com.induk.cinema.service.CityService;
import com.induk.cinema.service.GenreService;
import com.induk.cinema.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/csmovie/schedules")
@RequiredArgsConstructor
public class ScheduleController {

    private final CityService cityService;
    private final CinemaService cinemaService;
    private final ScheduleService scheduleService;

    @RequestMapping
    public String home(@RequestParam(required=false) String title, @RequestParam(required=false) String cityId,
                       @RequestParam(required=false) String cinemaId, @RequestParam(required=false) String date, Model model) {

        List<City> citys = cityService.cityList();
        model.addAttribute("citys", citys);

        if(!cityId.equals("")) {
            Long id = Long.parseLong(cityId);
            List<Cinema> cinemas = cinemaService.findCinemaListByCityId(id);
            model.addAttribute("cinemas", cinemas);
        }

        if(!cinemaId.equals("")) {
            if(!title.equals("")){
                List<Schedule> schedules = scheduleService.findScheduleForAjax(title, date, Long.parseLong(cinemaId));
                model.addAttribute("schedules", schedules);

                List<Schedule> movies = cinemaService.findMovieToSchedule(title, Long.parseLong(cinemaId), date);
                model.addAttribute("movies", movies);

                List<Schedule> theaters = cinemaService.findByTheaterToSchedule(title, Long.parseLong(cinemaId), date);
                model.addAttribute("theaters", theaters);

            } else {
                List<Schedule> movies = cinemaService.findMovie(Long.parseLong(cinemaId), date);
                model.addAttribute("movies", movies);

                List<Schedule> theaters = cinemaService.findByTheater(Long.parseLong(cinemaId), date);
                model.addAttribute("theaters", theaters);

                List<Schedule> schedules = cinemaService.findScheduleForAjax(date, Long.parseLong(cinemaId));
                model.addAttribute("schedules", schedules);
            }
        }

        model.addAttribute("date", date);
        model.addAttribute("cityId", cityId);
        model.addAttribute("cinemaId", cinemaId);
        model.addAttribute("title", title);

        return "cinema/schedule/listForm";
    }

    @PostMapping("/cinemaAjax")
    @ResponseBody
    public List<Cinema> cinemaAjax(@RequestBody Long cityId){
        List<Cinema> cinemas =cinemaService.findCinemaListByCityId(cityId);

        return cinemas;
    }

    @PostMapping("/scheduleAjax")
    @ResponseBody
    public List<Schedule> scheduleAjax(@RequestParam(value = "movieTitle") String movieTitle,
                                       @RequestParam(value = "date") String date,
                                       @RequestParam(value = "cinemaId") Long cinemaId){

        List<Schedule> schedules = scheduleService.findScheduleForAjax(movieTitle, date, cinemaId);



        return schedules;
    }
}
