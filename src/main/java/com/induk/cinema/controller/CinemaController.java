package com.induk.cinema.controller;

import com.induk.cinema.domain.*;
import com.induk.cinema.service.CinemaService;
import com.induk.cinema.service.CityService;
import com.induk.cinema.service.EventService;
import com.induk.cinema.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/csmovie/cinemas")
@RequiredArgsConstructor
public class CinemaController {

    private final CityService cityService;
    private final CinemaService cinemaService;
    private final ScheduleService scheduleService;
    private final EventService eventService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("cinemas", cinemaService.cinemaList());
        model.addAttribute("citys", cityService.cityList());

        return "cinema/cinema/listForm";
    }

    @GetMapping("/{searchText}")
    public String searchhome(@PathVariable String searchText, Model model) {


        List<Cinema> cinemas =cinemaService.findCinemaByText(searchText);
        model.addAttribute("cinemas", cinemas);
        model.addAttribute("citys", cityService.cityList());

        return "cinema/cinema/listForm";
    }


    @PostMapping("/listAjax")
    @ResponseBody
    public List<Cinema> listFormAjax(@RequestBody String searchText){
        if(searchText.equals(" "))
            searchText="";
        List<Cinema> cinemas =cinemaService.findCinemaByText(searchText);

        return cinemas;
    }

    @GetMapping("/detail/{id}")
    public String DetailForm(@PathVariable Long id, Model model) {

        //LocalDate date = LocalDate.now();
        String date = "2023-02-23";

        Cinema cinema = cinemaService.findCinema(id);
        model.addAttribute("cinema", cinema);

        List<String> list = Arrays.asList(cinema.getFacility().split(","));
        model.addAttribute("facilitys", list);

        List<Schedule> movies = cinemaService.findMovie(id, date);
        model.addAttribute("movies", movies);

        List<Schedule> theaters = cinemaService.findByTheater(id, date);
        model.addAttribute("theaters", theaters);

        List<Schedule> schedulestest = scheduleService.findScheduleForAjax("", date, id);
        model.addAttribute("schedulestests", schedulestest);

        List<Event> events = eventService.reportingDateEventList();
        model.addAttribute("events", events);

        return "cinema/cinema/detailForm";
    }



    @PostMapping("/scheduleAjax")
    @ResponseBody
    public List<Schedule> scheduleAjax(@RequestParam(value = "date") String date,
                                       @RequestParam(value = "cinemaId") Long cinemaId){

        List<Schedule> schedules = cinemaService.findScheduleForAjax(date, cinemaId);

        return schedules;
    }
}
