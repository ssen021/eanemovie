package com.induk.cinema.dto;

import lombok.Data;

@Data
public class ReviewByMovie {
    private Long movieId;
    private String movieTitle;
    private Integer reviewCount;
}
