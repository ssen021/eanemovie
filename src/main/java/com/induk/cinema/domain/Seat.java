package com.induk.cinema.domain;

import com.induk.cinema.dto.SeatTheater;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Seat {

    private Long id;

    @NotBlank(message = "좌석번호는 필수 입력입니다.")
    private String number;

    @NotNull(message = "스케줄은 필수 입력입니다.")
    private Long scheduleId;

//    @NotBlank(message = "좌석 상태는 0, 1만 입력가능합니다.")
//    @Pattern(regexp = "^[0-1]$", message = "좌석 상태는 0, 1만 입력가능합니다.(0:빈좌석, 1:예약석)")
//    private String status;

    private Long reservationId;

    private SeatTheater seatTheater;

}
