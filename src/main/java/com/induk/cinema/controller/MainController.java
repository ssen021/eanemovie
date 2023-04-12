package com.induk.cinema.controller;

import com.induk.cinema.domain.City;
import com.induk.cinema.domain.Movie;
import com.induk.cinema.dto.SortType;
import com.induk.cinema.service.CityService;
import com.induk.cinema.service.MovieService;
import com.induk.cinema.service.ReservationService;
import com.induk.cinema.service.ReviewService;
import com.induk.cinema.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/csmovie")
@RequiredArgsConstructor
public class MainController {

    private final MovieService movieService;
    private final FileStore fileStore;
    private final ReviewService reviewService;
    private final CityService cityService;
    private final ReservationService reservationService;

    @RequestMapping
    public String home(Model model) {
        // movie List
        List<Movie> movies = movieService.movieList();
        List<List<String>> formats = new ArrayList<>();
        for (Movie movie : movies) {
            formats.add(Arrays.asList(movie.getScreeningFormat().split(",")));
        }

        // movie top4
        List<Movie> top4 = movieService.movieListHighRank();
        int totalCount = reservationService.countAll();
        List<String> ratio = new ArrayList<>();
        for (Movie movie : top4) {
            ratio.add(String.format("%.1f", (movie.getCount() / (double) totalCount) * 100));
        }

        List<City> citys = cityService.cityList();
        model.addAttribute("citys", citys);

        model.addAttribute("movies", movies);
        model.addAttribute("formats", formats);

        model.addAttribute("top4", top4);
        model.addAttribute("ratio", ratio);

        model.addAttribute("popularReviews", reviewService.reviewBySortType(SortType.Popularity));
        model.addAttribute("recentReviews", reviewService.reviewBySortType(SortType.Recent));
        return "cinema/main/index";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("movie", filename));
    }
}
