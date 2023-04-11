package com.induk.cinema.dto;

import com.induk.cinema.domain.Movie;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.*;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Data
public class MovieForm {

    private Long id;
    private String poster;
    private String joinFormat;

    @NotEmpty(message = "제목을 입력해 주세요.")
    private String title;

    @NotEmpty(message = "소개를 입력해 주세요.")
    private String summary;

    @NotNull(message = "감독을 선택해 주세요.")
    private Long directorId;

    @NotNull(message = "장르를 선택해 주세요.")
    private Long genreId;

    @NotEmpty(message = "언어를 입력해 주세요.")
    private String language;

    @NotEmpty(message = "개봉일을 선택해 주세요.")
    private String releaseDate;

    @NotNull(message = "상영시간을 입력해 주세요.")
    @Positive(message = "0보다 큰 값을 입력해 주세요.")
    private Integer showTimes;

    @NotEmpty(message = "상영등급을 선택해 주세요.")
    private String rating;

    @NotNull(message = "상영 포멧을 1개 이상 선택해 주세요.")
    private List<String> screeningFormats;

    public MovieForm() {
    }

    public MovieForm(Movie movie) {
        this.id = movie.getId();
        this.poster = movie.getPoster();
        this.title = movie.getTitle();
        this.summary = movie.getSummary();
        this.directorId = movie.getDirector().getId();
        this.genreId = movie.getGenre().getId();
        this.language = movie.getLanguage();
        this.releaseDate = movie.getReleaseDate();
        this.showTimes = movie.getShowTimes();
        this.rating = movie.getRating();
        this.screeningFormats = Arrays.asList(movie.getScreeningFormat().split(","));
    }
}
