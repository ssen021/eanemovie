package com.induk.cinema.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class ReservationForm {

    private Long id;
    private Long memberId;
    private Long scheduleId;
    private Long payment_id;
    private int adult;
    private int youth;
    private LocalDate date;
    private int status;
    private String cinemaName;
    private String theaterName;
    private String memberName;
    private String movieTitle;
}
