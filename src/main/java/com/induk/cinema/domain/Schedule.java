package com.induk.cinema.domain;

import com.induk.cinema.dto.CinemaCity;
import com.induk.cinema.dto.ScheduleForm;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {

    private Long id;

    @NotNull(message = "영화명은 필수 입력입니다.")
    private Long movie_id;

    @NotNull(message = "상영관명은 필수 입력입니다.")
    private Long theater_id;

    @NotNull(message = "시작시간은 필수 입력입니다.")
    @Pattern(regexp = "^\\d{2}:\\d{1,2}$", message = "시간형식에 맞게 입력해주세요.")
    private String start_time;

    @NotNull(message = "종료시간은 필수 입력입니다.")
    @Pattern(regexp = "^\\d{2}:\\d{1,2}$", message = "시간형식에 맞게 입력해주세요.")
    private String end_time;

    @NotNull(message = "상영날짜는 필수 입력입니다.")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2}$", message = "날짜형식에 맞게 입력해주세요.")
    private String screening_date;

    @NotBlank(message = "상영종류는 필수 입력입니다.")
    private String screening_format;

    @NotBlank(message = "가격은 필수 입력입니다.")
    @Pattern(regexp = "^[0-9]*$", message = "가격은 숫자만 입력가능합니다.")
    private String price;

    private ScheduleForm scheduleForm;

}
