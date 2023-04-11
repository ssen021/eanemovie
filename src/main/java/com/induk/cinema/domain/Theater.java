package com.induk.cinema.domain;

import com.induk.cinema.dto.TheaterCinema;
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
public class Theater {

    private Long id;

    @NotNull(message = "영화관은 필수 입력입니다.")
    private Long cinema_id;

    @NotBlank(message = "상영관명은 필수 입력입니다.")
    private String name;

    @NotBlank(message = "좌석수는 숫자만 입력가능합니다.")
    @Pattern(regexp = "^[0-9]*$", message = "좌석수는 숫자만 입력가능합니다.")
    private String seat_count;

    private TheaterCinema theaterCinema;
}
