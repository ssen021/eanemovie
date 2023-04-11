package com.induk.cinema.dto;

import com.induk.cinema.domain.Movie;
import com.induk.cinema.util.PageMaker;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class MoviePage {
    PageMaker pageMaker;
    List<Movie> movieList;
}
