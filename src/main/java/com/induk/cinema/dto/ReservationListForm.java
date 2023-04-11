package com.induk.cinema.dto;

import com.induk.cinema.domain.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationListForm {
    private Long id;
    private Long memberId;
    private Long scheduleId;
    private Long paymentId;
    private Long adult;
    private Long youth;
    private String seatNumbers;
    private String date;
    private String status;
    private Member member;
    private Schedule schedule;
    private Payment payment;
    private Movie movie;
    private Theater theater;
    private Cinema cinema;
}
