package com.induk.cinema.dto;

import lombok.Data;

@Data
public class ScheduleForm {

    private String movie_title;
    private String movie_rating;
    private String movie_showtimes;
    private String theater_name;
    private String theater_seat;
    private Long cinema_id;
    private String cinema_name;
}
