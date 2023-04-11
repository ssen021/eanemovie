package com.induk.cinema.controller;

import com.induk.cinema.domain.Cinema;
import com.induk.cinema.domain.Movie;
import com.induk.cinema.dto.CinemasSale;
import com.induk.cinema.dto.MoviesSale;
import com.induk.cinema.dto.Sales;
import com.induk.cinema.service.CinemaService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.service.ReservationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.lang.reflect.Array;
import java.util.*;
import java.util.stream.Collectors;

@Slf4j
@Controller
@RequestMapping("/csmovie/admin/chart")
@RequiredArgsConstructor
public class AdminChartController {

    private final ReservationService reservationService;
    private final MovieService movieService;
    private final CinemaService cinemaService;

    @GetMapping("/movie")
    public String movie(Model model) {
        List<Movie> movies = movieService.movieList();
        model.addAttribute("movies", movies);
        return "admin/chart/movieChart";
    }

    @GetMapping("/movies")
    public String movies() {
        return "admin/chart/moviesChart";
    }

    @ResponseBody
    @PostMapping("/movie")
    public Map<String, Object> movieChart(@RequestParam(value = "movieId") Long movieId,
                           @RequestParam(value = "year") String year) {
        Map<String, Integer> dateMap = getDateMap(year);
        HashMap<String, Object> map = new HashMap<>();
        List<Integer> array = new ArrayList<>();
        int adult = 0;
        int youth = 0;

        List<Sales> sales = reservationService.movieSales(movieId, year);
        for (Sales sale : sales) {
            dateMap.replace(sale.getDate(), sale.getPrice());
            adult += sale.getAdult();
            youth += sale.getYouth();
        }

        array.add(adult);
        array.add(youth);

        map.put("data", dateMap.values().stream().collect(Collectors.toList()));
        map.put("people", array);

        return map;
    }

    private Map<String, Integer> getDateMap(String year) {
        Map<String, Integer> map = new LinkedHashMap<>();
        for(int i = 1; i <= 12; i++) {
            String date;
            if (i < 10) date = year + "-0" + i;
            else date = year + "-" + i;
            map.put(date, 0);
        }
        return map;
    }

    @ResponseBody
    @PostMapping("/movies")
    public HashMap<String, Object> moviesChart(@RequestParam(value = "date1") String date1,
                                               @RequestParam(value = "date2") String date2) {
        List<MoviesSale> moviesSales = reservationService.movieListSale(date1, date2);

        List<String> titles = new ArrayList<>();
        List<Integer> prices = new ArrayList<>();
        for (MoviesSale moviesSale : moviesSales) {
            titles.add(moviesSale.getTitle());
            prices.add(moviesSale.getPrice());
        }

        HashMap<String, Object> map = new HashMap<>();
        map.put("titles", titles);
        map.put("prices", prices);

        return map;
    }

    @GetMapping("/cinema")
    public String cinema(Model model) {
        List<Cinema> cinemas = cinemaService.cinemaList();
        model.addAttribute("cinemas", cinemas);
        return "admin/chart/cinemaChart";
    }

    @ResponseBody
    @PostMapping("/cinema")
    public List<Integer> cinemaChart(@RequestParam(value = "cinemaId") Long cinemaId,
                                     @RequestParam(value = "year") String year) {
        Map<String, Integer> dateMap = getDateMap(year);
        List<Sales> sales = reservationService.cinemaSales(cinemaId, year);

        for (Sales sale : sales) {
            dateMap.replace(sale.getDate(), sale.getPrice());
        }

        return dateMap.values().stream().collect(Collectors.toList());
    }

    @GetMapping("/cinemas")
    public String cinemas() {
        return "admin/chart/cinemasChart";
    }

    @ResponseBody
    @PostMapping("/cinemas")
    public HashMap<String, Object> cinemaChart(@RequestParam(value = "date1") String date1,
                                               @RequestParam(value = "date2") String date2) {
        List<CinemasSale> cinemasSales = reservationService.cinemaListSale(date1, date2);

        List<String> names = new ArrayList<>();
        List<Integer> prices = new ArrayList<>();
        for (CinemasSale cinemasSale : cinemasSales) {
            names.add(cinemasSale.getName());
            prices.add(cinemasSale.getPrice());
        }

        HashMap<String, Object> map = new HashMap<>();
        map.put("names", names);
        map.put("prices", prices);

        return map;
    }
}
