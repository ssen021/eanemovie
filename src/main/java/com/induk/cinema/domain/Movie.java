package com.induk.cinema.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
public class Movie {

    private Long id;
    private String poster;
    private String title;
    private String summary;
    private String language;
    private Integer showTimes;
    private String releaseDate;
    private String rating;
    private String screeningFormat;
    private Director director;
    private Genre genre;

    private String trailer;
    private Integer count;
}
