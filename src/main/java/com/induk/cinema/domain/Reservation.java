package com.induk.cinema.domain;

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
public class Reservation {

    private Long id;

    @NotNull(message = "회원은 필수 입력사항입니다.")
    private Long member_id;

    @NotNull(message = "스케줄은 필수 입력사항입니다.")
    private Long schedule_id;

    @NotNull(message = "결제수단은 필수 입력사항입니다.")
    private Long payment_id;

    @NotNull(message = "인원은 필수 입력사항입니다.")
    private Long adult;

    @NotNull(message = "인원은 필수 입력사항입니다.")
    private Long youth;

    @NotBlank(message = "날짜는 필수 입력사항입니다.")
    private String date;

    @NotBlank(message = "상태는 숫자만 입력가능합니다.")
    @Pattern(regexp = "^[0-1]$", message = "상태는 숫자만 입력가능합니다.")
    private String status;

}
